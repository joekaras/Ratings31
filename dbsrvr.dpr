program dbsrvr;

uses

  {$I dbisamvr.inc}

  dbisammm,

  SysUtils,

  WinSvc,
  SvcMgr,
  Windows,
  Forms,
  dbisamcn,
  dbisamlb,
  dbisamut,
  main in 'main.pas' {MainForm},
  about in 'about.pas' {AboutBox};

{$R *.res}

function StartingService(var Interactive: Boolean): Boolean;
var
   Manager: Integer;
   Service: Integer;
   ServiceStatus: TServiceStatus;
   ConfigBytes: DWORD;
   ServiceConfig: pQueryServiceConfig;
begin
   Result:=False;
   Interactive:=False;
   Manager:=OpenSCManager(nil,nil,SC_MANAGER_ALL_ACCESS);
   if (Manager <> 0) then
      begin
      try
         Service:=OpenService(Manager,PChar(String(ServerName)),SERVICE_ALL_ACCESS);
         Result:=(Service <> 0);
         if Result then
            begin
            try
               if QueryServiceStatus(Service,ServiceStatus) then
                  begin
                  if (ServiceStatus.dwCurrentState=SERVICE_START_PENDING) then
                     begin
                     Result:=True;
                     QueryServiceConfig(Service,nil,0,ConfigBytes);
                     ServiceConfig:=AllocMem(ConfigBytes);
                     try
                        if QueryServiceConfig(Service,ServiceConfig,ConfigBytes,
                                              ConfigBytes) then
                           Interactive:=((ServiceConfig^.dwServiceType and
                                          SERVICE_INTERACTIVE_PROCESS)=SERVICE_INTERACTIVE_PROCESS);
                     finally
                        DeAllocMem(ServiceConfig);
                     end;
                     end
                  else
                     Result:=False;
                  end
               else
                  Result:=False;
            finally
               CloseServiceHandle(Service);
            end;
            end;
      finally
         CloseServiceHandle(Manager);
      end;
      end;
end;

var
   Mutex: THandle;
   MutexName: array [0..MAX_PATH] of Char;
   IsInteractive: Boolean;
begin
   StrPCopy(@MutexName,LowerCase(StringReplace(ParamStr(0),OSBackSlash,
                                                 OSForwardSlash,[rfReplaceAll])));
   Mutex:=CreateMutex(nil,True,@MutexName);
   if (Mutex <> 0) and (GetLastError=0) then
      begin
      ServerName:=AnsiUpperCase(StripFilePathAndExtension(ParamStr(0),'.exe'));
      IsInteractive:=False;
      if (InstallingService or StartingService(IsInteractive)) then
         begin
         ServerDescription:=DEFAULT_SERVER_DESC+' - '+ServerName+' (Service)';
         SvcMgr.Application.Initialize;
         if InstallingService then
            DatabaseService:=TDatabaseService.CreateNew(SvcMgr.Application,
                                                        Integer(InteractiveService))
         else
            DatabaseService:=TDatabaseService.CreateNew(SvcMgr.Application,
                                                        Integer(IsInteractive));
         SvcMgr.Application.CreateForm(TMainForm, MainForm);
         SvcMgr.Application.Run;
         end
      else
         begin
         ServerDescription:=DEFAULT_SERVER_DESC+' - '+ServerName+' (Application)';
         Forms.Application.ShowMainForm:=False;
         Forms.Application.UpdateFormatSettings:=False;
         Forms.Application.Initialize;
         Forms.Application.CreateForm(TMainForm,MainForm);
         Forms.Application.Icon:=MainForm.Icon;
         MainForm.Initialize(nil);
         Forms.Application.CreateForm(TAboutBox,AboutBox);
         Forms.Application.Run;
         end;
      CloseHandle(Mutex);
      end;
end.
