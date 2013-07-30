{************************************************************************
*
*      DBISAM replacement memory manager source
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*
*      This is production version of the DBISAM replacement
*      memory manager for Delphi (Windows only).  Our tests
*      have found that this memory manager has good performance
*      with multiple threads and processors.  The performance
*      improves as you add processors due to the multiple memory
*      pools used for various threads.
*
*      NOTE:  The global AllocMemSize and AllocMemCount variables
*      in the Delphi system unit are invalid and not updated with
*      this memory manager.
*
*      If you have any suggestions at all regarding the memory
*      manager, please contact us at support@elevatesoft.com
*
*************************************************************************}

unit dbisammm;

interface

uses Windows;

const

   PROCESS_ID_SIZE = 20;

   VIRTUAL_BLOCK_BUFFER_SIZE = 65536;

   MAX_BLOCK_SIZE = 65536;

   MAX_NUM_BLOCKS = 16;

   VIRTUAL_BLOCK_SIZE = (MAX_BLOCK_SIZE*MAX_NUM_BLOCKS);

   ALIGN_SIZE = 8;

   LARGE_ALIGN_SIZE = 65536;

   REALLOC_MULTIPLIER = 4;

type

   pCardinal = ^Cardinal;


   pSmallBlock = ^TSmallBlock;
   pAllocBlock = ^TAllocBlock;
   pSuperBlock = ^TSuperBlock;
   pVirtualBlock = ^TVirtualBlock;
   pVirtualBlockBuffer = ^TVirtualBlockBuffer;
   pVirtualBlockList = ^TVirtualBlockList;
   pVirtualBlockListArray = ^TVirtualBlockListArray;
   pPoolArray = ^TPoolArray;


   TAllocBlock = packed record
      OwnerVirtualBlock: pVirtualBlock;
      AllocSize: Cardinal;
      end;

   TSmallBlock = packed record
      NextFreeSmallBlock: pSmallBlock;
      end;

   TSuperBlock = packed record
      Free: Cardinal;
      NextAvailableSuperBlock: Cardinal;
      FirstFreeSmallBlock: pSmallBlock;
      EmptySpace: Cardinal;
      end;

   TSuperBlocksArray = array [1..MAX_NUM_BLOCKS] of TSuperBlock;

   TVirtualBlock = packed record
      OwnerList: pVirtualBlockList;
      VirtualAddr: Pointer;
      TotalFree: Cardinal;
      PriorAvailableVirtualBlock: pVirtualBlock;
      NextAvailableVirtualBlock: pVirtualBlock;
      FirstAvailableSuperBlock: Cardinal;
      SuperBlocks: TSuperBlocksArray;
      EmptySpace: array [1..8] of Byte;
      end;

   TVirtualBlockBuffer = packed record
      NextVirtualBlockBuffer: pVirtualBlockBuffer;
      BufferSpace: array [1..(VIRTUAL_BLOCK_BUFFER_SIZE-SizeOf(pVirtualBlockBuffer))] of Char;
      end;

   TVirtualBlockList = packed record
      BlockSize: Cardinal;
      MaxNumBlocks: Cardinal;
      FirstAvailableVirtualBlock: pVirtualBlock;
      NextFreeVirtualBlockFromBuffer: pVirtualBlock;
      VirtualBlockBuffers: pVirtualBlockBuffer;
      TotalAllocated: Cardinal;
      TotalFree: Cardinal;
      Lock: TRTLCriticalSection;
      EmptySpace: array [1..12] of Byte;
      end;

   TVirtualBlockListArray = array [1..High(Word)] of pVirtualBlockList;

   TPoolArray = array [0..(High(Word)-1)] of pVirtualBlockListArray; 

implementation

var

   OldMemoryManager: TMemoryManager;
   NewMemoryManager: TMemoryManager;

   NumPools: Cardinal;
   PoolArray: pPoolArray;
   PoolMemory: Pointer;
   PoolMemorySize: Cardinal;

procedure CardinalToPChar(Value: Cardinal; Buffer: PChar; BufferSize: Cardinal);
var
   I: Cardinal;
begin
   I:=(BufferSize-1);
   while True do
      begin
      (Buffer+I)^:=Char((Value mod 10)+Ord('0'));
      Value:=(Value div 10);
      if (Value=0) then
         Break;
      Dec(I);
      end;
   Move((Buffer+I)^,Buffer^,(BufferSize-I));
   FillChar((Buffer+(BufferSize-I))^,(BufferSize-(BufferSize-I)),#0);
end;

function IntLog2(Value: Cardinal): Cardinal;
asm
   BSR   EAX,EAX
end;

function BlockOffset(Value: Cardinal; BlockSize: Cardinal): Cardinal;
asm
   PUSH  EBX
   MOV   EBX,EAX
   BSR   ECX,EDX
   SHR   EAX,CL
   SHL   EAX,CL
   SUB   EBX,EAX
   JZ    @@1
   ADD   EAX,EDX
@@1:
   POP   EBX
end;

function GetNewVirtualBlock(VirtualBlockList: pVirtualBlockList): pVirtualBlock;
var
   I: Cardinal;
   TotalBlocks: Cardinal;
   CurBlockBuffer: pVirtualBlockBuffer;
   NewBlockBuffer: pVirtualBlockBuffer;
   BlockBufferPtr: PChar;
   CurVirtualBlock: pVirtualBlock;
begin
   with VirtualBlockList^ do
      begin
      if (NextFreeVirtualBlockFromBuffer=nil) then
         begin
         CurBlockBuffer:=VirtualBlockBuffers;
         NewBlockBuffer:=pVirtualBlockBuffer(VirtualAlloc(nil,SizeOf(TVirtualBlockBuffer),
                                             (MEM_RESERVE or MEM_COMMIT),PAGE_READWRITE));
         if (NewBlockBuffer <> nil) then
            begin
            VirtualBlockBuffers:=NewBlockBuffer;
            VirtualBlockBuffers^.NextVirtualBlockBuffer:=CurBlockBuffer;
            BlockBufferPtr:=PChar(@VirtualBlockBuffers^.BufferSpace);
            TotalBlocks:=(SizeOf(VirtualBlockBuffers^.BufferSpace) div SizeOf(TVirtualBlock));
            for I:=1 to TotalBlocks-1 do
               begin
               CurVirtualBlock:=NextFreeVirtualBlockFromBuffer;
               NextFreeVirtualBlockFromBuffer:=pVirtualBlock(BlockBufferPtr);
               NextFreeVirtualBlockFromBuffer^.NextAvailableVirtualBlock:=CurVirtualBlock;
               Inc(BlockBufferPtr,SizeOf(TVirtualBlock));
               end;
            Result:=pVirtualBlock(BlockBufferPtr);
            end
         else
            Result:=nil;
         end
      else
         begin
         Result:=NextFreeVirtualBlockFromBuffer;
         NextFreeVirtualBlockFromBuffer:=Result^.NextAvailableVirtualBlock;
         end;
      end;
end;

procedure PutVirtualBlock(VirtualBlockList: pVirtualBlockList;
                          ExistingVirtualBlock: pVirtualBlock);
var
   CurVirtualBlock: pVirtualBlock;
begin
   with VirtualBlockList^ do
      begin
      CurVirtualBlock:=NextFreeVirtualBlockFromBuffer;
      NextFreeVirtualBlockFromBuffer:=ExistingVirtualBlock;
      NextFreeVirtualBlockFromBuffer^.NextAvailableVirtualBlock:=CurVirtualBlock;
      end;
end;

function DBGetMem(Size: Cardinal): Pointer;
var
   TempPool: Cardinal;
   TempSize: Cardinal;
   TempPos: Cardinal;
   VirtualBlockList: pVirtualBlockList;
   LastSuperBlock: Cardinal;
   LastSmallBlock: pSmallBlock;
   I: Integer;
begin
   TempPool:=(GetCurrentThreadID mod NumPools);
   TempSize:=BlockOffset((Size+SizeOf(TAllocBlock)),ALIGN_SIZE);
   if (TempSize <= MAX_BLOCK_SIZE) then
      begin
      TempPos:=IntLog2(TempSize);
      VirtualBlockList:=PoolArray^[TempPool]^[TempPos];
      if (VirtualBlockList^.BlockSize < TempSize) then
         VirtualBlockList:=PoolArray^[TempPool]^[(TempPos+1)];
      with VirtualBlockList^ do
         begin
         { Do check to see if we're using multiple threads and IsMultiThread
           hasn't been set yet }
         if (not IsMultiThread) and (GetCurrentThreadID <> MainThreadID) then
            IsMultiThread:=True;
         if IsMultiThread then
            EnterCriticalSection(Lock);
         try
            { If there are no virtual blocks available, then allocate one }
            if (FirstAvailableVirtualBlock=nil) then
               begin
               FirstAvailableVirtualBlock:=GetNewVirtualBlock(VirtualBlockList);
               if (FirstAvailableVirtualBlock=nil) then
                  begin
                  Result:=nil;
                  Exit;
                  end;
               with FirstAvailableVirtualBlock^ do
                  begin
                  VirtualAddr:=VirtualAlloc(nil,VIRTUAL_BLOCK_SIZE,MEM_RESERVE,PAGE_READWRITE);
                  if (VirtualAddr=nil) then
                     begin
                     PutVirtualBlock(VirtualBlockList,FirstAvailableVirtualBlock);
                     FirstAvailableVirtualBlock:=nil;
                     Result:=nil;
                     Exit;
                     end;
                  with FirstAvailableVirtualBlock^ do
                     begin
                     OwnerList:=VirtualBlockList;
                     TotalFree:=VIRTUAL_BLOCK_SIZE;
                     Inc(VirtualBlockList^.TotalFree,VIRTUAL_BLOCK_SIZE);
                     PriorAvailableVirtualBlock:=nil;
                     NextAvailableVirtualBlock:=nil;
                     FillChar(SuperBlocks,SizeOf(TSuperBlocksArray),#0);
                     LastSuperBlock:=0;
                     for I:=MAX_NUM_BLOCKS downto 1 do
                        begin
                        { Initialize the super block structure }
                        FirstAvailableSuperBlock:=I;
                        with SuperBlocks[I] do
                           begin
                           Free:=MAX_BLOCK_SIZE;
                           NextAvailableSuperBlock:=LastSuperBlock;
                           end;
                        LastSuperBlock:=I;
                        end;
                     end;
                  end;
               end;
            with FirstAvailableVirtualBlock^ do
               begin
               with SuperBlocks[FirstAvailableSuperBlock] do
                  begin
                  { Do we need to commit this block ? }
                  if (Free=MAX_BLOCK_SIZE) then
                     begin
                     FirstFreeSmallBlock:=pSmallBlock(PChar(VirtualAddr)+((FirstAvailableSuperBlock-1)*MAX_BLOCK_SIZE));
                     if (VirtualAlloc(Pointer(FirstFreeSmallBlock),MAX_BLOCK_SIZE,MEM_COMMIT,PAGE_READWRITE) <> Pointer(FirstFreeSmallBlock)) then
                        begin
                        Result:=nil;
                        Exit;
                        end;
                     Inc(PChar(FirstFreeSmallBlock),MAX_BLOCK_SIZE);
                     Dec(PChar(FirstFreeSmallBlock),BlockSize);
                     LastSmallBlock:=nil;
                     for I:=MaxNumBlocks downto 1 do
                        begin
                        FirstFreeSmallBlock^.NextFreeSmallBlock:=LastSmallBlock;
                        LastSmallBlock:=FirstFreeSmallBlock;
                        Dec(PChar(FirstFreeSmallBlock),BlockSize);
                        end;
                     FirstFreeSmallBlock:=LastSmallBlock;
                     end;
                  { Set the result and flip the first free block pointer }
                  Result:=PChar(FirstFreeSmallBlock);
                  FirstFreeSmallBlock:=FirstFreeSmallBlock^.NextFreeSmallBlock;
                  { Update the tag bytes }
                  with pAllocBlock(Result)^ do
                     begin
                     OwnerVirtualBlock:=FirstAvailableVirtualBlock;
                     AllocSize:=BlockSize;
                     end;
                  Inc(PChar(Result),SizeOf(TAllocBlock));
                  { Update stats }
                  Dec(Free,BlockSize);
                  Dec(TotalFree,BlockSize);
                  Inc(VirtualBlockList^.TotalAllocated,BlockSize);
                  Dec(VirtualBlockList^.TotalFree,BlockSize);
                  end;
               { Are we out of available blocks for this super block ? }
               if (SuperBlocks[FirstAvailableSuperBlock].FirstFreeSmallBlock=nil) then
                  FirstAvailableSuperBlock:=SuperBlocks[FirstAvailableSuperBlock].NextAvailableSuperBlock;
               end;
            { Are we out of available super blocks ? }
            if (FirstAvailableVirtualBlock^.FirstAvailableSuperBlock=0) then
               begin
               FirstAvailableVirtualBlock:=FirstAvailableVirtualBlock^.NextAvailableVirtualBlock;
               if (FirstAvailableVirtualBlock <> nil) then
                  FirstAvailableVirtualBlock^.PriorAvailableVirtualBlock:=nil;
               end;
         finally
            if IsMultiThread then
               LeaveCriticalSection(Lock);
         end;
         end;
      end
   else
      begin
      TempSize:=BlockOffset((Size+SizeOf(TAllocBlock)),LARGE_ALIGN_SIZE);
      Result:=Pointer(VirtualAlloc(nil,TempSize,(MEM_RESERVE or MEM_COMMIT),PAGE_READWRITE));
      if (Result <> nil) then
         begin
         with pAllocBlock(Result)^ do
            begin
            OwnerVirtualBlock:=nil;
            AllocSize:=TempSize;
            end;
         Inc(PChar(Result),SizeOf(TAllocBlock));
         end;
      end;
end;

function DBFreeMem(P: Pointer): Cardinal;
var
   TempVirtualBlock: pVirtualBlock;
   TempSuperBlock: Cardinal;
   TempSmallBlock: pSmallBlock;
begin
   Result:=0;
   Dec(PChar(P),SizeOf(TAllocBlock));
   with pAllocBlock(P)^ do
      begin
      if (OwnerVirtualBlock <> nil) then
         begin
         TempVirtualBlock:=OwnerVirtualBlock;
         with TempVirtualBlock^.OwnerList^ do
            begin
            { Do check to see if we're using multiple threads and IsMultiThread
              hasn't been set yet }
            if (not IsMultiThread) and (GetCurrentThreadID <> MainThreadID) then
               IsMultiThread:=True;
            if IsMultiThread then
               EnterCriticalSection(Lock);
            try
               with TempVirtualBlock^ do
                  begin
                  TempSuperBlock:=((((Cardinal(P) and $FFFF0000)-Cardinal(VirtualAddr)) div MAX_BLOCK_SIZE)+1);
                  TempSmallBlock:=pSmallBlock(P);
                  with SuperBlocks[TempSuperBlock] do
                     begin
                     TempSmallBlock^.NextFreeSmallBlock:=FirstFreeSmallBlock;
                     FirstFreeSmallBlock:=TempSmallBlock;
                     { Update stats }
                     Inc(Free,BlockSize);
                     Inc(TotalFree,BlockSize);
                     Dec(OwnerList^.TotalAllocated,BlockSize);
                     Inc(OwnerList^.TotalFree,BlockSize);
                     { Check and see if we need to decommit the super block }
                     if (Free=MAX_BLOCK_SIZE) then
                        begin
                        VirtualFree(Pointer(PChar(VirtualAddr)+((TempSuperBlock-1)*MAX_BLOCK_SIZE)),
                                    MAX_BLOCK_SIZE,MEM_DECOMMIT);
                        { If the whole virtual block is free and it is the first
                          available virtual block, then just free it completely }
                        if (TotalFree=VIRTUAL_BLOCK_SIZE) then
                           begin
                           Dec(OwnerList^.TotalFree,VIRTUAL_BLOCK_SIZE);
                           { Update links }
                           if (PriorAvailableVirtualBlock <> nil) then
                              PriorAvailableVirtualBlock^.NextAvailableVirtualBlock:=NextAvailableVirtualBlock;
                           if (NextAvailableVirtualBlock <> nil) then
                              NextAvailableVirtualBlock^.PriorAvailableVirtualBlock:=PriorAvailableVirtualBlock;
                           if (TempVirtualBlock=FirstAvailableVirtualBlock) then
                              FirstAvailableVirtualBlock:=NextAvailableVirtualBlock;
                           VirtualFree(Pointer(VirtualAddr),0,MEM_RELEASE);
                           PutVirtualBlock(OwnerList,TempVirtualBlock);
                           end;
                        end
                     else if (Free=BlockSize) then
                        begin
                        { If we just made this super block available again, be
                          sure to adjust the available super block linked list }
                        NextAvailableSuperBlock:=FirstAvailableSuperBlock;
                        FirstAvailableSuperBlock:=TempSuperBlock;
                        { If we just made this virtual block available again, be
                          sure to adjust the available virtual block list }
                        if (TotalFree=BlockSize) then
                           begin
                           if (FirstAvailableVirtualBlock <> nil) then
                              FirstAvailableVirtualBlock^.PriorAvailableVirtualBlock:=TempVirtualBlock;
                           NextAvailableVirtualBlock:=FirstAvailableVirtualBlock;
                           FirstAvailableVirtualBlock:=TempVirtualBlock;
                           PriorAvailableVirtualBlock:=nil;
                           end;
                        end;
                     end;
                  end;
            finally
               if IsMultiThread then
                  LeaveCriticalSection(Lock);
            end;
            end;
         end
      else
         VirtualFree(P,0,MEM_RELEASE);
      end;
end;

function DBReallocMem(P: Pointer; Size: Cardinal): Pointer;
var
   TempSize: Cardinal;
   TempOldSize: Cardinal;
   TempMoveSize: Cardinal;
begin
   TempSize:=BlockOffset((Size+SizeOf(TAllocBlock)),ALIGN_SIZE);
   TempOldSize:=pAllocBlock(PChar(P)-SizeOf(TAllocBlock))^.AllocSize;
   TempMoveSize:=0;
   if (TempSize < (TempOldSize div 4)) then
      TempMoveSize:=(TempSize-SizeOf(TAllocBlock))
   else if (TempSize > TempOldSize) then
      begin
      TempMoveSize:=(TempOldSize-SizeOf(TAllocBlock));
      TempSize:=BlockOffset(TempSize+((TempSize-TempOldSize)*REALLOC_MULTIPLIER),ALIGN_SIZE);
      end;
   if (TempMoveSize <> 0) then
      begin
      Result:=DBGetMem(TempSize);
      if (Result <> nil) then
         begin
         Move(P^,Result^,TempMoveSize);
         DBFreeMem(P);
         end;
      end
   else
      Result:=P;
end;

procedure InitVirtualBlockList(var PoolMemoryPtr: PChar;
                               var VirtualBlockList: pVirtualBlockList;
                               Size: Cardinal);
begin
   VirtualBlockList:=pVirtualBlockList(PoolMemoryPtr);
   Inc(PoolMemoryPtr,SizeOf(TVirtualBlockList));
   with VirtualBlockList^ do
      begin
      BlockSize:=Size;
      MaxNumBlocks:=(MAX_BLOCK_SIZE div BlockSize);
      FirstAvailableVirtualBlock:=nil;
      NextFreeVirtualBlockFromBuffer:=nil;
      VirtualBlockBuffers:=nil;
      TotalAllocated:=0;
      TotalFree:=0;
      InitializeCriticalSection(Lock);
      end;
end;

procedure InitVirtualBlockLists(var PoolMemoryPtr: PChar;
                                var VirtualBlockListArray: pVirtualBlockListArray);
var
   I: Cardinal;
   CurBlockSize: Cardinal;
begin
   VirtualBlockListArray:=pVirtualBlockListArray(PoolMemoryPtr);
   Inc(PoolMemoryPtr,(IntLog2(MAX_BLOCK_SIZE)*SizeOf(pVirtualBlockList)));
   CurBlockSize:=2;
   for I:=1 to IntLog2(MAX_BLOCK_SIZE) do
      begin
      InitVirtualBlockList(PoolMemoryPtr,VirtualBlockListArray^[I],CurBlockSize);
      CurBlockSize:=(CurBlockSize shl 1);
      end;
end;

function GetNumProcessors: Cardinal;
var
   SystemInfo: TSystemInfo;
begin
   GetSystemInfo(SystemInfo);
   Result:=SystemInfo.dwNumberOfProcessors;
end;

procedure InitLists;
var
   I: Cardinal;
   PoolMemoryPtr: PChar;
begin
   NumPools:=GetNumProcessors;
   if (NumPools > 1) and ((NumPools mod 2)=0) then
      Inc(NumPools);
   PoolMemorySize:=(NumPools*SizeOf(pVirtualBlockListArray))+
                   (NumPools*((IntLog2(MAX_BLOCK_SIZE)*SizeOf(pVirtualBlockList))))+
                   (NumPools*((IntLog2(MAX_BLOCK_SIZE)*SizeOf(TVirtualBlockList))));
   PoolMemory:=Pointer(VirtualAlloc(nil,PoolMemorySize,(MEM_RESERVE or MEM_COMMIT),PAGE_READWRITE));
   PoolMemoryPtr:=PoolMemory;
   PoolArray:=pPoolArray(PoolMemoryPtr);
   Inc(PoolMemoryPtr,(NumPools*SizeOf(pVirtualBlockListArray)));
   for I:=0 to NumPools-1 do
      InitVirtualBlockLists(PoolMemoryPtr,PoolArray^[I]);
end;


procedure HookMemoryManager;
begin
   InitLists;
   with NewMemoryManager do
      begin
      GetMem:=@DBGetMem;
      FreeMem:=@DBFreeMem;
      ReallocMem:=@DBReallocMem;
      end;
   GetMemoryManager(OldMemoryManager);
   SetMemoryManager(NewMemoryManager);
end;

procedure FreeVirtualBlockList(var VirtualBlockList: pVirtualBlockList);
var
   CurVirtualBlockBuffer: pVirtualBlockBuffer;
   NextVirtualBlockBuffer: pVirtualBlockBuffer;
begin
   with VirtualBlockList^ do
      begin
      CurVirtualBlockBuffer:=VirtualBlockBuffers;
      while (CurVirtualBlockBuffer <> nil) do
         begin
         NextVirtualBlockBuffer:=CurVirtualBlockBuffer^.NextVirtualBlockBuffer;
         VirtualFree(Pointer(CurVirtualBlockBuffer),0,MEM_RELEASE);
         CurVirtualBlockBuffer:=NextVirtualBlockBuffer;
         end;
      DeleteCriticalSection(Lock);
      end;
   VirtualBlockList:=nil;
end;

procedure FreeVirtualBlockLists(var VirtualBlockListArray: pVirtualBlockListArray);
var
   I: Cardinal;
begin
   for I:=1 to IntLog2(MAX_BLOCK_SIZE) do
      FreeVirtualBlockList(VirtualBlockListArray^[I]);
   VirtualBlockListArray:=nil;
end;

procedure FreeLists;
var
   I: Cardinal;
begin
   for I:=0 to NumPools-1 do
      FreeVirtualBlockLists(PoolArray^[I]);
   PoolArray:=nil;
   VirtualFree(PoolMemory,0,MEM_RELEASE);
end;

procedure UnhookMemoryManager;
begin
   SetMemoryManager(OldMemoryManager);
   FreeLists;
end;

initialization
   HookMemoryManager;
finalization
   UnhookMemoryManager;
end.
