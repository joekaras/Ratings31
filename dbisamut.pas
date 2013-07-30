{*************************************************************************
*
*      Common functionality used in DBISAM servers and utilities
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

unit dbisamut;

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

Windows, Forms, Menus, StdCtrls, ExtCtrls,
Graphics, ShlObj,
IniFiles, DB, dbisamtb, dbisamen, dbisamlb, dbisamcn, dbisamst;

const

   REMOTE_DRIVE = '\\Remote';

   TAB = #9;
   SPACETAB = '   ';
   QUOTE = #39;
   DBLQUOTE = #34;
   CR = #13;
   LF = #10;
   CRLF = CR+LF;
   BREAK_MARKER = #7;
   QUOTE_MARKER = #8;

   ENGINE_SECTION = 'Engine Info';
   SESSION_SECTION = 'Session Info';
   TRANSFER_SECTION = 'Transfer Info';
   SUPPORT_SECTION = 'Support Info';
   ADMIN_SECTION = 'Admin Info';

   MRU_TABLE_SECTION = 'MRU Tables';
   MRU_TABLENAME_KEY = 'Table';
   MRU_TABLEOPEN_MODE_KEY = 'OpenMode';
   MAX_MRU_TABLES = 6;

   MRU_DATABASE_DIRECTORY_SECTION = 'MRU Database Directories';
   MRU_PRIVATE_DIRECTORY_SECTION = 'MRU Private Directories';
   MRU_DIRECTORY_KEY = 'Directory';
   MAX_MRU_DIRECTORIES = 16;

   MRU_OPEN_SHRD_NORM = 0;
   MRU_OPEN_SHRD_READ = 1;
   MRU_OPEN_EXCL_NORM = 2;
   MRU_OPEN_EXCL_READ = 3;

   {$IFNDEF DELPHI7ORHIGHER}
   BIF_NEWDIALOGSTYLE = $0040;
   {$ENDIF}

type

   TVersionInfo = record
      FileDescription: string;
      FileVersion: string;
      OriginalFilename: string;
      FileNameRoot: string;
      CompanyName: string;
      ProductName: string;
      ProductVersion: string;
      InternalName: string;
      LegalCopyright: string;
      end;

   TEngineSettings = record
      CreateTempInDB: Boolean;
      LargeFiles: Boolean;
      LockFile: string[255];
      MaxReadLockCount: Integer;
      MaxDataBufferCount: Integer;
      MaxDataBufferSize: Integer;
      MaxIndexBufferCount: Integer;
      MaxIndexBufferSize: Integer;
      MaxBlobBufferCount: Integer;
      MaxBlobBufferSize: Integer;
      DataExtension: string[10];
      IndexExtension: string[10];
      BlobExtension: string[10];
      DataBackupExtension: string[10];
      IndexBackupExtension: string[10];
      BlobBackupExtension: string[10];
      DataUpgradeExtension: string[10];
      IndexUpgradeExtension: string[10];
      BlobUpgradeExtension: string[10];
      DataTempExtension: string[10];
      IndexTempExtension: string[10];
      BlobTempExtension: string[10];
      end;

   TSessionSettings = record
      DatabaseDirectory: string[255];
      PrivateDirectory: string[255];
      FileDirectory: string[255];
      LockProtocolType: Byte;
      LockRetries: Byte;
      LockWait: Word;
      ForceOSFlush: Boolean;
      StrictDetection: Boolean;
      ShowDescriptions: Boolean;
      NumProgressSteps: Word;
      LocalRemote: Byte;
      Host: string[255];
      Address: string[255];
      Port: Word;
      Service: string[255];
      Compression: Byte;
      Tracing: Boolean;
      Pinging: Boolean;
      PingInterval: Word;
      Timeout: Word;
      end;

   TTransferSettings = record
      SourceAlias: string[255];
      SourceDirectory: string[255];
      DestDatabase: string[255];
      DestDirectory: string[255];
      UserMinorVersion: Word;
      UserMajorVersion: Word;
      LocaleID: Integer;
      TransliterateFlag: Boolean;
      Host: string[255];
      Address: string[255];
      Port: Word;
      Service: string[255];
      Compression: Byte;
      Tracing: Boolean;
      Pinging: Boolean;
      PingInterval: Word;
      Timeout: Word;
      end;

   TAdminSettings = record
      Host: string[255];
      Address: string[255];
      Port: Word;
      Service: string[255];
      Compression: Byte;
      Tracing: Boolean;
      Pinging: Boolean;
      PingInterval: Word;
      Timeout: Word;
      end;

function PadLeft(const Value: string; Padding: Integer; PadChar: Char): string;
function PadRight(const Value: string; Padding: Integer; PadChar: Char): string;
function GetLeft(const Value: string; Count: Integer): string;
function GetRight(const Value: string; Count: Integer): string;
function Substr(const Value: string; Index: Integer; Count: Integer): string;
function At(const SearchFor: string; const Value: string): Integer;
function Rat(const SearchFor: string; const Value: string): Integer;
function Replicate(const Value: string; NumOfCopies: Word): string;
function StrTransform(const Value: string; const SearchChars: string;
                      const ReplaceChars: string): string;
function BreakString(const Value: string; const QuoteChar: Char; BreakAt: Integer;
                     const BreakSuffix: string): string;
function BooleanToStr(Value: Boolean): string;
function StrToBoolean(const Value: string): Boolean;
function BCBBoolToStr(Value: Boolean): string;
function BCBStrToBool(const Value: string): Boolean;
function StringToDataType(Value: string): TFieldType;
function DataTypeToString(Value: TFieldType): string;
function DataTypeToSQLString(Value: TFieldType; Size: Integer): string;
function CharCaseToSQLString(Value: TFieldCharCase): string;
function DisplayStringToDataType(const DataTypeName: string): TFieldType;
function DataTypeToDisplayString(DataType: TFieldType): string;
function StatementTypeToString(StatementType: TSQLStatementType): string;
function IsPartOfPrimaryIndex(PrimaryIndexDef: TDBISAMIndexDef;
                              FieldName: string): Boolean;
function IsPrimaryDescending(PrimaryIndexDef: TDBISAMIndexDef;
                             FieldName: string): Boolean;
function CompressionToString(Compression: TIndexCompression): string;
function CompressionToSQLString(Compression: TIndexCompression): string;
function StringToCompression(CompressionName: string): TIndexCompression;
function CharCaseToString(CharCase: TFieldCharCase): string;
function StringToCharCase(CharCaseName: string): TFieldCharCase;
function GetCharString(const Chars: string; QuoteChar: Char;
                       BreakAt: Integer; const BreakSuffix: string;
                       CPlusPlus: Boolean): string;
function GetExeFileName: string;
procedure ReadVersionInformation(var VersionInfo: TVersionInfo);
procedure ReadWindowSettings(Window: TForm;
                             const CurPath: string;
                             const AppName: string;
                             const WindowName: string);
procedure SaveWindowSettings(Window: TForm;
                             const CurPath: string;
                             const AppName: string;
                             const WindowName: string);
procedure ReadTableSettings(Table: TDBISAMTable;
                             const CurPath: string;
                             const AppName: string);
procedure SaveTableSettings(Table: TDBISAMTable;
                            const CurPath: string;
                            const AppName: string);
procedure ReadQuerySettings(Query: TDBISAMQuery;
                             const CurPath: string;
                             const AppName: string);
procedure SaveQuerySettings(Query: TDBISAMQuery;
                            const CurPath: string;
                            const AppName: string);
procedure ReadEngineSettings(const CurPath: string;
                             const AppName: string;
                             var EngineSettings: TEngineSettings);
procedure SaveEngineSettings(const CurPath: string;
                             const AppName: string;
                             var EngineSettings: TEngineSettings);
procedure SetEngineSettings(const EngineSettings: TEngineSettings);
procedure ReadSessionSettings(const CurPath: string;
                              const AppName: string;
                              var SessionSettings: TSessionSettings);
procedure SaveSessionSettings(const CurPath: string;
                              const AppName: string;
                              const SessionSettings: TSessionSettings);
procedure SetSessionSettings(LocalSessionToSet: TDBISAMSession;
                             RemoteSessionToSet: TDBISAMSession;
                             ChangeRemoteSpecific: Boolean;
                             const SessionSettings: TSessionSettings);
procedure ReadTransferSettings(const CurPath: string;
                               const AppName: string;
                               var TransferSettings: TTransferSettings);
procedure SaveTransferSettings(const CurPath: string;
                               const AppName: string;
                               const TransferSettings: TTransferSettings);
procedure SetTransferSettings(RemoteSessionToSet: TDBISAMSession;
                              ChangeRemoteSpecific: Boolean;
                              const TransferSettings: TTransferSettings);
procedure ReadAdminSettings(const CurPath: string;
                            const AppName: string;
                            var AdminSettings: TAdminSettings);
procedure SaveAdminSettings(const CurPath: string;
                            const AppName: string;
                            const AdminSettings: TAdminSettings);
procedure SetAdminSettings(RemoteSessionToSet: TDBISAMSession;
                           ChangeRemoteSpecific: Boolean;
                           const AdminSettings: TAdminSettings);
procedure ReadMRUTables(const CurPath: string;
                        const AppName: string;
                        MRUTables: TStrings);
procedure SaveMRUTables(const CurPath: string;
                        const AppName: string;
                        MRUTables: TStrings);
procedure SetMRUTables(Menu: TMenuItem; TotalMenuItems: Integer;
                       MenuEventHandler: TNotifyEvent;
                       MRUTables: TStrings);
procedure InsertMRUTable(const MenuCaption: string; MenuTag: Integer;
                         Menu: TMenuItem; MRUMenuitem: TMenuItem;
                         MRUTables: TStrings;
                          MenuEventHandler: TNotifyEvent);
procedure ReadMRUDirectories(const CurPath: string;
                             const AppName: string;
                             MRUDatabaseDirectories: TStrings;
                             MRUPrivateDirectories: TStrings);
procedure SaveMRUDirectories(const CurPath: string;
                             const AppName: string;
                             MRUDatabaseDirectories: TStrings;
                             MRUPrivateDirectories: TStrings);
function BrowseCallback(Wnd: HWND; uMsg: UINT; lParam,lpData: LPARAM): Integer stdcall;
function GetDirectory(var DirectoryStr: string): Boolean;
function StripReturns(const Value: string): string;
function StripTabs(const Value: string): string;
function VerifyValidityExpression(const Expression: string;
                                  FieldType: TFieldType): Boolean;
function MakeDialogFilter: string;
function BeginOfMonth(Value: TDateTime): TDateTime;
function EndOfMonth(Value: TDateTime): TDateTime;
function InstallingService: Boolean;
function InteractiveService: Boolean;
function GetParam(const ParamString: string; const ParamName: string;
                  var ParamValue: string): Boolean;
procedure SplitTextOnSpace(const ValueToSplit: string;
                           var FirstHalf: string;
                           var SecondHalf: string);
procedure SetupCharacterValues(ListBox: TListBox; const Value: string);
function SelectedCharacterValues(ListBox: TListBox): string;
procedure PopulateAsciiValues(ListBox: TListBox);
function CreateSpacedAsciiString(Value: string): string;
procedure CreateAsciiList(Value: string; List: TStrings);
procedure DisableChildControls(Owner: TComponent);
procedure EnableChildControls(Owner: TComponent);
function TranslateLogRecord(const LogRecord: TLogRecord): string;

var
   DataTypesList: TStrings;

implementation

uses

Dialogs, Controls, dbisamdb;

function PadLeft(const Value: string; Padding: Integer; PadChar: Char): string;
var
   NumToPad: Integer;
   I: Integer;
begin
   Result:=Value;
   if Length(Result) >= Padding then Exit;
   NumToPad:=Padding-Length(Result);
   for I:=1 to NumToPad do
      begin
      Result:=PadChar+Result;
      end;
end;

function PadRight(const Value: string; Padding: Integer; PadChar: Char): string;
var
   NumToPad: Integer;
   I: Integer;
begin
   Result:=Value;
   if Length(Result) >= Padding then Exit;
   NumToPad:=Padding-Length(Result);
   for I:=1 to NumToPad do
      Result:=Result+PadChar;
end;

function GetLeft(const Value: string; Count: Integer): string;
begin
   Result:=Copy(Value,1,Count);
end;

function GetRight(const Value: string; Count: Integer): string;
begin
   Result:=Copy(Value,Length(Value)-Count+1,Count);
end;

function Substr(const Value: string; Index: Integer; Count: Integer): string;
begin
   Result:=Copy(Value,Index,Count);
end;

function At(const SearchFor: string; const Value: string): Integer;
begin
   Result:=AnsiPos(SearchFor,Value);
end;

function Rat(const SearchFor: string; const Value: string): Integer;
var
   I: Integer;
begin
   Result:=0;
   for I:=Length(Value) downto 1 do
      begin
      if (Substr(Value,i,Length(SearchFor))=SearchFor) then
         begin
         Result:=i;
         Exit;
         end;
      end;
end;

function Replicate(const Value: string; NumOfCopies: Word): string;
var
   I: Integer;
begin
   Result:='';
   for I:=1 to NumOfCopies do
      Result:=Result+Value;
end;

function StrTransform(const Value: string; const SearchChars: string;
                      const ReplaceChars: string): string;
begin
   Result:=StringReplace(Value,SearchChars,ReplaceChars,[rfReplaceAll]);
end;

function BreakString(const Value: string; const QuoteChar: Char; BreakAt: Integer;
                     const BreakSuffix: string): string;
var
   I: Integer;
begin
   if (BreakAt < Length(Value)) then
      begin
      Result:='';
      I:=1;
      while (I <= Length(Value)) do
         begin
         Result:=Result+SubStr(Value,I,BreakAt)+QuoteChar+'+'+BREAK_MARKER+BreakSuffix+QuoteChar;
         Inc(I,BreakAt);
         end;
      end
   else
      Result:=Value;
end;

function BooleanToStr(Value: Boolean): string;
begin
   if Value then
      Result:='Yes'
   else
      Result:='No';
end;

function StrToBoolean(const Value: string): Boolean;
begin
   if (UpperCase(Value)='YES') or (UpperCase(Value)='TRUE') then
      Result:=True
   else if (UpperCase(Value)='NO') or (UpperCase(Value)='FALSE') then
      Result:=False
   else
      raise EConvertError.Create('Invalid boolean string value');
end;

function BCBBoolToStr(Value: Boolean): string;
begin
   Result:='false';
   if Value then
      Result:='true';
end;

function BCBStrToBool(const Value: string): Boolean;
begin
   if (UpperCase(Value)='TRUE') then
      Result:=True
   else if (UpperCase(Value)='FALSE') then
      Result:=False
   else
      raise EConvertError.Create(QUOTE+Value+QUOTE+' is not a valid boolean value');
end;

function StringToDataType(Value: string): TFieldType;
begin
   Result:=ftUnknown;
   if (Value='ftString') then
      Result:=ftString
   else if (Value='ftFixedChar') then
      Result:=ftFixedChar
   else if (Value='ftWideString') then
      Result:=ftWideString
   else if (Value='ftGuid') then
      Result:=ftGuid
   else if (Value='ftBlob') then
      Result:=ftBlob
   else if (Value='ftGraphic') then
      Result:=ftGraphic
   else if (Value='ftMemo') then
      Result:=ftMemo
   else if (Value='ftDate') then
      Result:=ftDate
   else if (Value='ftTime') then
      Result:=ftTime
   else if (Value='ftDateTime') then
      Result:=ftDateTime
   else if (Value='ftBoolean') then
      Result:=ftBoolean
   else if (Value='ftSmallint') then
      Result:=ftSmallInt
   else if (Value='ftWord') then
      Result:=ftWord
   else if (Value='ftInteger') then
      Result:=ftInteger
   else if (Value='ftAutoInc') then
      Result:=ftAutoInc
   else if (Value='ftLargeInt') then
      Result:=ftLargeInt
   else if (Value='ftFloat') then
      Result:=ftFloat
   else if (Value='ftCurrency') then
      Result:=ftCurrency
   else if (Value='ftBCD') then
      Result:=ftBCD
   else if (Value='ftBytes') then
      Result:=ftBytes
   else if (Value='ftVarBytes') then
      Result:=ftVarBytes;
end;

function DataTypeToString(Value: TFieldType): string;
begin
   Result:='';
   if (Value=ftString) then
      Result:='ftString'
   else if (Value=ftFixedChar) then
      Result:='ftFixedChar'
   else if (Value=ftWideString) then
      Result:='ftWideString'
   else if (Value=ftGuid) then
      Result:='ftGuid'
   else if (Value=ftBlob) then
      Result:='ftBlob'
   else if (Value=ftGraphic) then
      Result:='ftGraphic'
   else if (Value=ftMemo) then
      Result:='ftMemo'
   else if (Value=ftDate) then
      Result:='ftDate'
   else if (Value=ftTime) then
      Result:='ftTime'
   else if (Value=ftDateTime) then
      Result:='ftDateTime'
   else if (Value=ftBoolean) then
      Result:='ftBoolean'
   else if (Value=ftSmallInt) then
      Result:='ftSmallint'
   else if (Value=ftWord) then
      Result:='ftWord'
   else if (Value=ftInteger) then
      Result:='ftInteger'
   else if (Value=ftAutoInc) then
      Result:='ftAutoInc'
   else if (Value=ftLargeInt) then
      Result:='ftLargeInt'
   else if (Value=ftFloat) then
      Result:='ftFloat'
   else if (Value=ftCurrency) then
      Result:='ftCurrency'
   else if (Value=ftBCD) then
      Result:='ftBCD'
   else if (Value=ftBytes) then
      Result:='ftBytes'
   else if (Value=ftVarBytes) then
      Result:='ftVarBytes';
end;

function DataTypeToSQLString(Value: TFieldType; Size: Integer): string;
begin
   Result:='';
   if (Value=ftString) then
      Result:='VARCHAR('+IntToStr(Size)+')'
   else if (Value=ftFixedChar) then
      Result:='CHAR('+IntToStr(Size)+')'
   else if (Value=ftWideString) then
      Result:='WIDECHAR('+IntToStr(Size)+')'
   else if (Value=ftGuid) then
      Result:='GUID'
   else if (Value=ftMemo) then
      Result:='MEMO'
   else if (Value=ftBlob) then
      Result:='BLOB'
   else if (Value=ftGraphic) then
      Result:='GRAPHIC'
   else if (Value=ftDate) then
      Result:='DATE'
   else if (Value=ftTime) then
      Result:='TIME'
   else if (Value=ftDateTime) then
      Result:='TIMESTAMP'
   else if (Value=ftBoolean) then
      Result:='BOOLEAN'
   else if (Value=ftSmallInt) then
      Result:='SMALLINT'
   else if (Value=ftWord) then
      Result:='WORD'
   else if (Value=ftInteger) then
      Result:='INTEGER'
   else if (Value=ftAutoInc) then
      Result:='AUTOINC'
   else if (Value=ftLargeInt) then
      Result:='LARGEINT'
   else if (Value=ftFloat) then
      Result:='FLOAT'
   else if (Value=ftCurrency) then
      Result:='MONEY'
   else if (Value=ftBCD) then
      Result:='DECIMAL(0,'+IntToStr(Size)+')'
   else if (Value=ftBytes) then
      Result:='BYTES('+IntToStr(Size)+')'
   else if (Value=ftVarBytes) then
      Result:='VARBYTES('+IntToStr(Size)+')';
end;

function CharCaseToSQLString(Value: TFieldCharCase): string;
begin
   Result:='NOCHANGE';
   case Value of
      fcNoChange:
         Result:='NOCHANGE';
      fcLowerCase:
         Result:='LOWER';
      fcUpperCase:
         Result:='UPPER';
      end;
end;

function DisplayStringToDataType(const DataTypeName: string): TFieldType;
var
   DataTypePos: Integer;
begin
   Result:=ftUnknown;
   with DataTypesList do
      begin
      DataTypePos:=IndexOf(DataTypeName);
      if (DataTypePos <> -1) then
         Result:=TFieldType(Objects[DataTypePos]);
      end;
end;

function DataTypeToDisplayString(DataType: TFieldType): string;
var
   DataTypePos: Integer;
begin
   Result:='Unknown';
   with DataTypesList do
      begin
      DataTypePos:=IndexOfObject(TObject(DataType));
      if (DataTypePos <> -1) then
         Result:=DataTypesList[DataTypePos];
      end;
end;

function StatementTypeToString(StatementType: TSQLStatementType): string;
begin
   Result:='';
   case StatementType of
      stUnknown:
         Result:='NONE';
      stSelect:
         Result:='SELECT';
      stInsert:
         Result:='INSERT';
      stUpdate:
         Result:='UPDATE';
      stDelete:
         Result:='DELETE';
      stCreateTable:
         Result:='CREATE TABLE';
      stCreateIndex:
         Result:='CREATE INDEX';
      stAlterTable:
         Result:='ALTER TABLE';
      stEmptyTable:
         Result:='EMPTY TABLE';
      stOptimizeTable:
         Result:='OPTIMIZE TABLE';
      stExportTable:
         Result:='EXPORT TABLE';
      stImportTable:
         Result:='IMPORT TABLE';
      stVerifyTable:
         Result:='VERIFY TABLE';
      stRepairTable:
         Result:='REPAIR TABLE';
      stUpgradeTable:
         Result:='UPGRADE TABLE';
      stDropIndex:
         Result:='DROP INDEX';
      stDropTable:
         Result:='DROP TABLE';
      stRenameTable:
         Result:='RENAME TABLE';
      stStartTransaction:
         Result:='START TRANSACTION';
      stRollbackTransaction:
         Result:='ROLLBACK';
      stCommitTransaction:
         Result:='COMMIT';
      end;
end;

function IsPartOfPrimaryIndex(PrimaryIndexDef: TDBISAMIndexDef;
                              FieldName: string): Boolean;
var
   I: Integer;
begin
   Result:=False;
   if (PrimaryIndexDef=nil) or (not (ixPrimary in PrimaryIndexDef.Options)) then
      Exit;
   with PrimaryIndexDef do
      begin
      I:=1;
      while I <= Length(Fields) do
         begin
         if (AnsiCompareText(ExtractFieldName(Fields,I),FieldName)=0) then
            begin
            Result:=True;
            Exit;
            end;
         end;
      end;
end;

function IsPrimaryDescending(PrimaryIndexDef: TDBISAMIndexDef;
                             FieldName: string): Boolean;
var
   I: Integer;
begin
   Result:=False;
   if (PrimaryIndexDef=nil) or (not (ixPrimary in PrimaryIndexDef.Options)) then
      Exit;
   with PrimaryIndexDef do
      begin
      I:=1;
      while I <= Length(DescFields) do
         begin
         if (AnsiCompareText(ExtractFieldName(DescFields,I),FieldName)=0) then
            begin
            Result:=True;
            Exit;
            end;
         end;
      end;
end;

function CompressionToString(Compression: TIndexCompression): string;
begin
   Result:='None';
   case Compression of
      icDuplicateByte:
         Result:='Duplicate Byte';
      icTrailingByte:
         Result:='Trailing Byte';
      icFull:
         Result:='Full';
      end;
end;

function CompressionToSQLString(Compression: TIndexCompression): string;
begin
   Result:='NONE';
   case Compression of
      icDuplicateByte:
         Result:='DUPBYTE';
      icTrailingByte:
         Result:='TRAILBYTE';
      icFull:
         Result:='FULL';
      end;
end;

function StringToCompression(CompressionName: string): TIndexCompression;
begin
   Result:=icNone;
   if (AnsiCompareText(CompressionName,'Duplicate Byte')=0) then
      Result:=icDuplicateByte
   else if (AnsiCompareText(CompressionName,'Trailing Byte')=0) then
      Result:=icTrailingByte
   else if (AnsiCompareText(CompressionName,'Full')=0) then
      Result:=icFull;
end;

function CharCaseToString(CharCase: TFieldCharCase): string;
begin
   Result:='';
   case CharCase of
      fcNoChange:
         Result:='fcNoChange';
      fcLowerCase:
         Result:='fcLowerCase';
      fcUpperCase:
         Result:='fcUpperCase';
      end;
end;

function StringToCharCase(CharCaseName: string): TFieldCharCase;
begin
   Result:=fcNoChange;
   if (AnsiCompareText(CharCaseName,'fcNoChange')=0) then
      Result:=fcNoChange
   else if (AnsiCompareText(CharCaseName,'fcLowerCase')=0) then
      Result:=fcLowerCase
   else if (AnsiCompareText(CharCaseName,'fcUpperCase')=0) then
      Result:=fcUpperCase;
end;

function GetCharString(const Chars: string; QuoteChar: Char;
                       BreakAt: Integer; const BreakSuffix: string;
                       CPlusPlus: Boolean): string;
var
   I: Integer;
   WasNonPrintable: Boolean;
   LastBreak: Integer;
begin
   Result:='';
   WasNonPrintable:=True;
   LastBreak:=0;
   if (Chars='') then
      Result:=QuoteChar+QuoteChar
   else
      begin
      if (not CPlusPlus) then
         begin
         for I:=1 to Length(Chars) do
            begin
            if (Ord(Chars[I]) <= 32) then
               begin
               if (Result='') then
                  Result:='#'+IntToStr(Ord(Chars[I]))
               else
                  begin
                  if WasNonPrintable then
                     Result:=Result+'+#'+IntToStr(Ord(Chars[I]))
                  else
                     Result:=Result+QuoteChar+'+#'+IntToStr(Ord(Chars[I]));
                  end;
               WasNonPrintable:=True;
               end
            else
               begin
               if (Result='') then
                  Result:=QuoteChar+ExpandQuotes(QuoteChar,Chars[I])
               else
                  begin
                  if WasNonPrintable then
                     Result:=Result+'+'+QuoteChar+ExpandQuotes(QuoteChar,Chars[I])
                  else
                     Result:=Result+ExpandQuotes(QuoteChar,Chars[I]);
                  end;
               WasNonPrintable:=False;
               end;
            if ((Length(Result)-LastBreak) >= BreakAt) then
               begin
               if WasNonPrintable then
                  Result:=Result+BreakSuffix
               else
                  Result:=Result+QuoteChar+'+'+BreakSuffix+QuoteChar;
               LastBreak:=Length(Result);
               end;
            end;
         if (not WasNonPrintable) then
            Result:=Result+QuoteChar;
         end
      else
         begin
         for I:=1 to Length(Chars) do
            begin
            if (Ord(Chars[I]) <= 32) or (Chars[I]=QuoteChar) then
               begin
               if (Result='') then
                  Result:=QuoteChar+'\'+IntToStr(Ord(Chars[I]))
               else
                  Result:=Result+'\'+IntToStr(Ord(Chars[I]));
               end
            else
               begin
               if (Result='') then
                  Result:=QuoteChar+Chars[I]
               else
                  Result:=Result+Chars[I];
               end;
            if ((Length(Result)-LastBreak) >= BreakAt) then
               begin
               Result:=Result+QuoteChar+BreakSuffix+QuoteChar;
               LastBreak:=Length(Result);
               end;
            end;
         Result:=Result+QuoteChar;
         end;
      end;
end;

function GetExeFileName: string;
var
   TempBuffer: array [0..MAX_PATH] of Char;
begin
   FillChar(TempBuffer,SizeOf(TempBuffer),#0);
   GetModuleFileName(hInstance,@TempBuffer,SizeOf(TempBuffer));
   Result:=StrPas(@TempBuffer);
end;

procedure ReadVersionInformation(var VersionInfo: TVersionInfo);
var
   VersionInfoBuffer: PChar;
   VersionInfoSize: DWORD;
   VersionInfoHandle: DWORD;
   VersionInfoPtr: Pointer;
   VersionInfoLanguage: string;
   VersionEntryBuffer: PChar;
   VersionEntrySize: DWORD;
   VersionEntryPrefix: string;
   TempResult: Boolean;
begin
   with VersionInfo do
      begin
      VersionInfoSize:=GetFileVersionInfoSize(PChar(AnsiString(GetExeFileName)),VersionInfoHandle);
      if (VersionInfoSize <> 0) then
         begin
         VersionInfoBuffer:=AllocMem(VersionInfoSize);
         try
            TempResult:=GetFileVersionInfo(PChar(AnsiString(GetExeFileName)),VersionInfoHandle,
                                           VersionInfoSize,VersionInfoBuffer);
            if TempResult then
               begin
               if VerQueryValue(VersionInfoBuffer,'\VarFileInfo\Translation',
                                VersionInfoPtr, VersionEntrySize ) then
                  begin
                  VersionInfoLanguage:=IntToHex(pInteger(VersionInfoPtr)^,8);
                  VersionEntryPrefix:='\StringFileInfo\'+
                                      Copy(VersionInfoLanguage,5,4)+
                                      Copy(VersionInfoLanguage,1,4);
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\FileDescription'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(FileDescription,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\FileVersion'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(FileVersion,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\OriginalFileName'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(OriginalFileName,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  FileNameRoot:=ExtractFileRoot(OriginalFileName,'');
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\CompanyName'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(CompanyName,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\ProductName'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(ProductName,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\ProductVersion'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(ProductVersion,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\InternalName'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(InternalName,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  VerQueryValue(VersionInfoBuffer,PChar(VersionEntryPrefix+'\LegalCopyright'),
                            Pointer(VersionEntryBuffer), VersionEntrySize );
                  SetString(LegalCopyright,VersionEntryBuffer,StrLen(VersionEntryBuffer));
                  end;
               end;
         finally
            DeAllocMem(Pointer(VersionInfoBuffer));
         end;
         end;
      end;
end;


procedure ReadWindowSettings(Window: TForm;
                             const CurPath: string;
                             const AppName: string;
                             const WindowName: string);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,Window do
         begin
         WindowState:=TWindowState(ReadInteger(WindowName,'WindowState',Ord(wsNormal)));
         if (WindowState <> wsMaximized) then
            begin
            Top:=ReadInteger(WindowName,'Top',Top);
            Left:=ReadInteger(WindowName,'Left',Left);
            Height:=ReadInteger(WindowName,'Height',Height);
            Width:=ReadInteger(WindowName,'Width',Width);
            end;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveWindowSettings(Window: TForm;
                             const CurPath: string;
                             const AppName: string;
                             const WindowName: string);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,Window do
         begin
         WriteInteger(WindowName,'WindowState',Ord(WindowState));                   
         WriteInteger(WindowName,'Top',Top);
         WriteInteger(WindowName,'Left',Left);
         WriteInteger(WindowName,'Height',Height);
         WriteInteger(WindowName,'Width',Width);
         UpdateFile;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure ReadTableSettings(Table: TDBISAMTable;
                            const CurPath: string;
                            const AppName: string);
var
   TempIniFile: TIniFile;
   I: Integer;
   SepPos: Integer;
   StructureFields: string;
   VisibleFields: string;
   CurField: string;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,Table do
         begin
         VisibleFields:='';
         for I:=0 to FieldCount-1 do
            begin
            if Fields[I].Visible then
               begin
               if (VisibleFields='') then
                  VisibleFields:=Fields[I].FieldName
               else
                  VisibleFields:=VisibleFields+';'+Fields[I].FieldName;
               end;
            Fields[I].Visible:=False;
            end;
         StructureFields:='';
         for I:=0 to FieldCount-1 do
            begin
            if (StructureFields='') then
               StructureFields:=FieldDefs[I].Name
            else
               StructureFields:=StructureFields+';'+FieldDefs[I].Name;
            end;
         if (AnsiCompareText(ReadString(ExtractFileRoot(TableName,DataEngine.DataExtension),
                                        'Structure Fields',''),StructureFields)=0) then
            VisibleFields:=ReadString(ExtractFileRoot(TableName,DataEngine.DataExtension),
                                      'Visible Fields',VisibleFields);
         CurField:='';
         I:=0;
         SepPos:=AnsiPos(';',VisibleFields);
         while (SepPos <> 0) do
            begin
            CurField:=Copy(VisibleFields,1,SepPos-1);
            VisibleFields:=Copy(VisibleFields,SepPos+1,Length(VisibleFields));
            try
               with FieldByName(CurField) do
                  begin
                  Visible:=True;
                  Index:=I;
                  end;
            except
            end;
            SepPos:=AnsiPos(';',VisibleFields);
            Inc(I);
            end;
         if (VisibleFields <> '') then
            begin
            CurField:=VisibleFields;
            try
               with FieldByName(CurField) do
                  begin
                  Visible:=True;
                  Index:=I;
                  end;
            except
            end;
            end;
         CopyOnAppend:=ReadBool(ExtractFileRoot(TableName,DataEngine.DataExtension),
                                'Copy On Append',False);
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveTableSettings(Table: TDBISAMTable;
                            const CurPath: string;
                            const AppName: string);
var
   TempIniFile: TIniFile;
   I: Integer;
   VisibleFields: string;
   StructureFields: string;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,Table do
         begin
         VisibleFields:='';
         for I:=0 to FieldCount-1 do
            begin
            if Fields[I].Visible then
               begin
               if (VisibleFields='') then
                  VisibleFields:=Fields[I].FieldName
               else
                  VisibleFields:=VisibleFields+';'+Fields[I].FieldName;
               end;
            end;
         StructureFields:='';
         for I:=0 to FieldCount-1 do
            begin
            if (StructureFields='') then
               StructureFields:=FieldDefs[I].Name
            else
               StructureFields:=StructureFields+';'+FieldDefs[I].Name;
            end;
         WriteString(ExtractFileRoot(TableName,DataEngine.DataExtension),
                     'Structure Fields',StructureFields);
         WriteString(ExtractFileRoot(TableName,DataEngine.DataExtension),
                     'Visible Fields',VisibleFields);
         WriteBool(ExtractFileRoot(TableName,DataEngine.DataExtension),
                   'Copy On Append',CopyOnAppend);
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure ReadQuerySettings(Query: TDBISAMQuery;
                            const CurPath: string;
                            const AppName: string);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,Query do
         begin
         CopyOnAppend:=ReadBool('Query','Copy On Append',False);
         RequestLive:=ReadBool('Query','Want Live Result',False);
         MaxRowCount:=ReadInteger('Query','Max Row Count',-1);
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveQuerySettings(Query: TDBISAMQuery;
                            const CurPath: string;
                            const AppName: string);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,Query do
         begin
         WriteBool('Query','Copy On Append',CopyOnAppend);
         WriteBool('Query','Want Live Result',RequestLive);
         WriteInteger('Query','Max Row Count',MaxRowCount);
         end;
   finally
      TempIniFile.Free;
   end;
end;


procedure ReadEngineSettings(const CurPath: string;
                             const AppName: string;
                             var EngineSettings: TEngineSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,EngineSettings do
         begin
         CreateTempInDB:=ReadBool(ENGINE_SECTION,'Create Temp Tables In Database',False);
         LargeFiles:=ReadBool(ENGINE_SECTION,'Large File Support',False);
         LockFile:=ReadString(ENGINE_SECTION,'Lock File Name',DEFAULT_LOCK_FILE_NAME);
         MaxReadLockCount:=ReadInteger(ENGINE_SECTION,'Max Read Lock Count',MAX_READ_LOCK_COUNT);
         MaxDataBufferCount:=ReadInteger(ENGINE_SECTION,'Max Table Data Buffer Count',
                                         DEFAULT_RECORD_BUFFER_COUNT);
         MaxDataBufferSize:=ReadInteger(ENGINE_SECTION,'Max Table Data Buffer Size',
                                         DEFAULT_RECORD_BUFFER_SIZE);
         MaxIndexBufferCount:=ReadInteger(ENGINE_SECTION,'Max Table Index Buffer Count',
                                         DEFAULT_PAGE_BUFFER_COUNT);
         MaxIndexBufferSize:=ReadInteger(ENGINE_SECTION,'Max Table Index Buffer Size',
                                         DEFAULT_PAGE_BUFFER_SIZE);
         MaxBlobBufferCount:=ReadInteger(ENGINE_SECTION,'Max Table Blob Buffer Count',
                                         DEFAULT_BLOCK_BUFFER_COUNT);
         MaxBlobBufferSize:=ReadInteger(ENGINE_SECTION,'Max Table Blob Buffer Size',
                                         DEFAULT_BLOCK_BUFFER_SIZE);
         DataExtension:=ReadString(ENGINE_SECTION,'Table Data Extension',DATA_FILE_EXT);
         IndexExtension:=ReadString(ENGINE_SECTION,'Table Index Extension',INDEX_FILE_EXT);
         BlobExtension:=ReadString(ENGINE_SECTION,'Table Blob Extension',BLOB_FILE_EXT);
         DataBackupExtension:=ReadString(ENGINE_SECTION,'Backup Table Data Extension',DATA_BACKUP_FILE_EXT);
         IndexBackupExtension:=ReadString(ENGINE_SECTION,'Backup Table Index Extension',INDEX_BACKUP_FILE_EXT);
         BlobBackupExtension:=ReadString(ENGINE_SECTION,'Backup Table Blob Extension',BLOB_BACKUP_FILE_EXT);
         DataUpgradeExtension:=ReadString(ENGINE_SECTION,'Upgrade Table Data Extension',DATA_UPGRADE_FILE_EXT);
         IndexUpgradeExtension:=ReadString(ENGINE_SECTION,'Upgrade Table Index Extension',INDEX_UPGRADE_FILE_EXT);
         BlobUpgradeExtension:=ReadString(ENGINE_SECTION,'Upgrade Table Blob Extension',BLOB_UPGRADE_FILE_EXT);
         DataTempExtension:=ReadString(ENGINE_SECTION,'Temp Table Data Extension',DATA_TEMP_FILE_EXT);
         IndexTempExtension:=ReadString(ENGINE_SECTION,'Temp Table Index Extension',INDEX_TEMP_FILE_EXT);
         BlobTempExtension:=ReadString(ENGINE_SECTION,'Temp Table Blob Extension',BLOB_TEMP_FILE_EXT);
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveEngineSettings(const CurPath: string;
                             const AppName: string;
                             var EngineSettings: TEngineSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,EngineSettings do
         begin
         WriteBool(ENGINE_SECTION,'Create Temp Tables In Database',CreateTempInDB);
         WriteBool(ENGINE_SECTION,'Large File Support',LargeFiles);
         WriteString(ENGINE_SECTION,'Lock File Name',LockFile);
         WriteInteger(ENGINE_SECTION,'Max Read Lock Count',MaxReadLockCount);
         WriteInteger(ENGINE_SECTION,'Max Table Data Buffer Count',MaxDataBufferCount);
         WriteInteger(ENGINE_SECTION,'Max Table Data Buffer Size',MaxDataBufferSize);
         WriteInteger(ENGINE_SECTION,'Max Table Index Buffer Count',MaxIndexBufferCount);
         WriteInteger(ENGINE_SECTION,'Max Table Index Buffer Size',MaxIndexBufferSize);
         WriteInteger(ENGINE_SECTION,'Max Table Blob Buffer Count',MaxBlobBufferCount);
         WriteInteger(ENGINE_SECTION,'Max Table Blob Buffer Size',MaxBlobBufferSize);
         WriteString(ENGINE_SECTION,'Table Data Extension',DataExtension);
         WriteString(ENGINE_SECTION,'Table Index Extension',IndexExtension);
         WriteString(ENGINE_SECTION,'Table Blob Extension',BlobExtension);
         WriteString(ENGINE_SECTION,'Backup Table Data Extension',DataBackupExtension);
         WriteString(ENGINE_SECTION,'Backup Table Index Extension',IndexBackupExtension);
         WriteString(ENGINE_SECTION,'Backup Table Blob Extension',BlobBackupExtension);
         WriteString(ENGINE_SECTION,'Upgrade Table Data Extension',DataUpgradeExtension);
         WriteString(ENGINE_SECTION,'Upgrade Table Index Extension',IndexUpgradeExtension);
         WriteString(ENGINE_SECTION,'Upgrade Table Blob Extension',BlobUpgradeExtension);
         WriteString(ENGINE_SECTION,'Temp Table Data Extension',DataTempExtension);
         WriteString(ENGINE_SECTION,'Temp Table Index Extension',IndexTempExtension);
         WriteString(ENGINE_SECTION,'Temp Table Blob Extension',BlobTempExtension);
         UpdateFile;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure ReadSessionSettings(const CurPath: string;
                              const AppName: string;
                              var SessionSettings: TSessionSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,SessionSettings do
         begin
         DatabaseDirectory:=ReadString(SESSION_SECTION,'Database Directory',AddBS(CurPath));
         PrivateDirectory:=ReadString(SESSION_SECTION,'Private Directory',AddBS(CurPath));
         FileDirectory:=ReadString(SESSION_SECTION,'File Directory',AddBS(CurPath));
         LockProtocolType:=ReadInteger(SESSION_SECTION,'Lock Protocol',
                                    LOCK_PESSIMISTIC);
         LockRetries:=ReadInteger(SESSION_SECTION,'Lock Retry Count',
                                  DEFAULT_RECORD_LOCK_RETRIES);
         LockWait:=ReadInteger(SESSION_SECTION,'Lock Wait Time',
                               DEFAULT_RECORD_LOCK_WAIT);
         ForceOSFlush:=ReadBool(SESSION_SECTION,'Force OS Flush',False);
         StrictDetection:=ReadBool(SESSION_SECTION,'Strict Change Detection',False);
         ShowDescriptions:=ReadBool(SESSION_SECTION,'Show Field Descriptions',True);
         NumProgressSteps:=ReadInteger(SESSION_SECTION,'Number of Progress Steps',
                               DEFAULT_PROGRESS_STEPS);
         LocalRemote:=ReadInteger(SESSION_SECTION,'Session Type',0);
         Host:=ReadString(SESSION_SECTION,'Remote Host','');
         Address:=ReadString(SESSION_SECTION,'Remote Address',DEFAULT_ADDRESS);
         Port:=ReadInteger(SESSION_SECTION,'Remote Port',DEFAULT_PORT);
         Service:=ReadString(SESSION_SECTION,'Remote Service','');
         Compression:=ReadInteger(SESSION_SECTION,'Remote Compression',NO_COMPRESSION);
         Tracing:=ReadBool(SESSION_SECTION,'Remote Tracing',False);
         Pinging:=ReadBool(SESSION_SECTION,'Remote Pinging',False);
         PingInterval:=ReadInteger(SESSION_SECTION,'Remote Ping Interval',DEFAULT_PING);
         Timeout:=ReadInteger(SESSION_SECTION,'Remote Timeout',DEFAULT_TIMEOUT);
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveSessionSettings(const CurPath: string;
                              const AppName: string;
                              const SessionSettings: TSessionSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,SessionSettings do
         begin
         WriteString(SESSION_SECTION,'Database Directory',DatabaseDirectory);
         WriteString(SESSION_SECTION,'Private Directory',PrivateDirectory);
         WriteString(SESSION_SECTION,'File Directory',FileDirectory);
         WriteInteger(SESSION_SECTION,'Lock Protocol',LockProtocolType);
         WriteInteger(SESSION_SECTION,'Lock Retry Count',LockRetries);
         WriteInteger(SESSION_SECTION,'Lock Wait Time',LockWait);
         WriteBool(SESSION_SECTION,'Force OS Flush',ForceOSFlush);
         WriteBool(SESSION_SECTION,'Strict Change Detection',StrictDetection);
         WriteBool(SESSION_SECTION,'Show Field Descriptions',ShowDescriptions);
         WriteInteger(SESSION_SECTION,'Number of Progress Steps',NumProgressSteps);
         WriteInteger(SESSION_SECTION,'Session Type',LocalRemote);
         WriteString(SESSION_SECTION,'Remote Host',Host);
         WriteString(SESSION_SECTION,'Remote Address',Address);
         WriteInteger(SESSION_SECTION,'Remote Port',Port);
         WriteString(SESSION_SECTION,'Remote Service',Service);
         WriteInteger(SESSION_SECTION,'Remote Compression',Compression);
         WriteBool(SESSION_SECTION,'Remote Tracing',Tracing);
         WriteBool(SESSION_SECTION,'Remote Pinging',Pinging);
         WriteInteger(SESSION_SECTION,'Remote Ping Interval',PingInterval);
         WriteInteger(SESSION_SECTION,'Remote Timeout',Timeout);
         UpdateFile;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SetEngineSettings(const EngineSettings: TEngineSettings);
begin
   with Engine,EngineSettings do
      begin
      CreateTempTablesInDatabase:=CreateTempInDB;
      LargeFileSupport:=LargeFiles;
      LockFileName:=LockFile;
      TableMaxReadLockCount:=MaxReadLockCount;
      MaxTableDataBufferCount:=MaxDataBufferCount;
      MaxTableDataBufferSize:=MaxDataBufferSize;
      MaxTableIndexBufferCount:=MaxIndexBufferCount;
      MaxTableIndexBufferSize:=MaxIndexBufferSize;
      MaxTableBlobBufferCount:=MaxBlobBufferCount;
      MaxTableBlobBufferSize:=MaxBlobBufferSize;
      TableDataExtension:=DataExtension;
      TableIndexExtension:=IndexExtension;
      TableBlobExtension:=BlobExtension;
      TableDataBackupExtension:=DataBackupExtension;
      TableIndexBackupExtension:=IndexBackupExtension;
      TableBlobBackupExtension:=BlobBackupExtension;
      TableDataUpgradeExtension:=DataUpgradeExtension;
      TableIndexUpgradeExtension:=IndexUpgradeExtension;
      TableBlobUpgradeExtension:=BlobUpgradeExtension;
      TableDataTempExtension:=DataTempExtension;
      TableIndexTempExtension:=IndexTempExtension;
      TableBlobTempExtension:=BlobTempExtension;
      end;
end;

procedure SetSessionSettings(LocalSessionToSet: TDBISAMSession;
                             RemoteSessionToSet: TDBISAMSession;
                             ChangeRemoteSpecific: Boolean;
                             const SessionSettings: TSessionSettings);
begin
   with LocalSessionToSet,SessionSettings do
      begin
      PrivateDir:=PrivateDirectory;
      ForceBufferFlush:=ForceOSFlush;
      StrictChangeDetection:=StrictDetection;
      if (LockProtocolType=LOCK_PESSIMISTIC) then
         LockProtocol:=lpPessimistic
      else
         LockProtocol:=lpOptimistic;
      LockRetryCount:=LockRetries;
      LockWaitTime:=LockWait;
      ProgressSteps:=NumProgressSteps;
      end;
   with RemoteSessionToSet,SessionSettings do
      begin
      PrivateDir:=PrivateDirectory;
      ForceBufferFlush:=ForceOSFlush;
      StrictChangeDetection:=StrictDetection;
      if (LockProtocolType=LOCK_PESSIMISTIC) then
         LockProtocol:=lpPessimistic
      else
         LockProtocol:=lpOptimistic;
      LockRetryCount:=LockRetries;
      LockWaitTime:=LockWait;
      ProgressSteps:=NumProgressSteps;
      if ChangeRemoteSpecific then
         begin
         RemoteHost:=Host;
         RemoteAddress:=Address;
         RemotePort:=Port;
         RemoteService:=Service;
         end;
      RemoteCompression:=Compression;
      RemoteTrace:=Tracing;
      RemotePing:=Pinging;
      RemotePingInterval:=PingInterval;
      RemoteTimeout:=Timeout;
      end;
end;

procedure ReadTransferSettings(const CurPath: string;
                               const AppName: string;
                               var TransferSettings: TTransferSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,TransferSettings do
         begin
         SourceAlias:=ReadString(TRANSFER_SECTION,'Source Alias','');
         SourceDirectory:=ReadString(TRANSFER_SECTION,'Source Directory',AddBS(CurPath));
         DestDatabase:=ReadString(TRANSFER_SECTION,'Destination Database','');
         DestDirectory:=ReadString(TRANSFER_SECTION,'Destination Directory',AddBS(CurPath));
         UserMajorVersion:=ReadInteger(TRANSFER_SECTION,'User Major Version',0);
         UserMinorVersion:=ReadInteger(TRANSFER_SECTION,'User Minor Version',0);
         LocaleID:=ReadInteger(TRANSFER_SECTION,'Locale ID',LOCALE_ANSI_STD);
         TransliterateFlag:=ReadBool(TRANSFER_SECTION,'Transliterate',False);
         Host:=ReadString(TRANSFER_SECTION,'Remote Host','');
         Address:=ReadString(TRANSFER_SECTION,'Remote Address',DEFAULT_ADDRESS);
         Port:=ReadInteger(TRANSFER_SECTION,'Remote Port',DEFAULT_PORT);
         Service:=ReadString(TRANSFER_SECTION,'Remote Service','');
         Compression:=ReadInteger(TRANSFER_SECTION,'Remote Compression',NO_COMPRESSION);
         Tracing:=ReadBool(TRANSFER_SECTION,'Remote Tracing',False);
         Pinging:=ReadBool(TRANSFER_SECTION,'Remote Pinging',False);
         PingInterval:=ReadInteger(TRANSFER_SECTION,'Remote Ping Interval',DEFAULT_PING);
         Timeout:=ReadInteger(TRANSFER_SECTION,'Remote Timeout',DEFAULT_TIMEOUT);
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveTransferSettings(const CurPath: string;
                               const AppName: string;
                               const TransferSettings: TTransferSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,TransferSettings do
         begin
         WriteString(TRANSFER_SECTION,'Source Alias',SourceAlias);
         WriteString(TRANSFER_SECTION,'Source Directory',SourceDirectory);
         WriteString(TRANSFER_SECTION,'Destination Database',DestDatabase);
         WriteString(TRANSFER_SECTION,'Destination Directory',DestDirectory);
         WriteInteger(TRANSFER_SECTION,'User Major Version',UserMajorVersion);
         WriteInteger(TRANSFER_SECTION,'User Minor Version',UserMinorVersion);
         WriteInteger(TRANSFER_SECTION,'Locale ID',LocaleID);
         WriteBool(TRANSFER_SECTION,'Transliterate',TransliterateFlag);
         WriteString(TRANSFER_SECTION,'Remote Host',Host);
         WriteString(TRANSFER_SECTION,'Remote Address',Address);
         WriteInteger(TRANSFER_SECTION,'Remote Port',Port);
         WriteString(TRANSFER_SECTION,'Remote Service',Service);
         WriteInteger(SESSION_SECTION,'Remote Compression',Compression);
         WriteBool(TRANSFER_SECTION,'Remote Tracing',Tracing);
         WriteBool(TRANSFER_SECTION,'Remote Pinging',Pinging);
         WriteInteger(TRANSFER_SECTION,'Remote Ping Interval',PingInterval);
         WriteInteger(TRANSFER_SECTION,'Remote Timeout',Timeout);
         UpdateFile;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SetTransferSettings(RemoteSessionToSet: TDBISAMSession;
                              ChangeRemoteSpecific: Boolean;
                              const TransferSettings: TTransferSettings);
begin
   with RemoteSessionToSet,TransferSettings do
      begin
      if ChangeRemoteSpecific then
         begin
         RemoteHost:=Host;
         RemoteAddress:=Address;
         RemotePort:=Port;
         RemoteService:=Service;
         end;
      RemoteCompression:=Compression;
      RemoteTrace:=Tracing;
      RemotePing:=Pinging;
      RemotePingInterval:=PingInterval;
      RemoteTimeout:=Timeout;
      end;
end;

procedure ReadAdminSettings(const CurPath: string;
                            const AppName: string;
                            var AdminSettings: TAdminSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,AdminSettings do
         begin
         Host:=ReadString(ADMIN_SECTION,'Remote Host','');
         Address:=ReadString(ADMIN_SECTION,'Remote Address',DEFAULT_ADDRESS);
         Port:=ReadInteger(ADMIN_SECTION,'Remote Port',DEFAULT_ADMIN_PORT);
         Service:=ReadString(ADMIN_SECTION,'Remote Service','');
         Compression:=ReadInteger(ADMIN_SECTION,'Remote Compression',NO_COMPRESSION);
         Tracing:=ReadBool(ADMIN_SECTION,'Remote Tracing',False);
         Pinging:=ReadBool(ADMIN_SECTION,'Remote Pinging',False);
         PingInterval:=ReadInteger(ADMIN_SECTION,'Remote Ping Interval',DEFAULT_PING);
         Timeout:=ReadInteger(ADMIN_SECTION,'Remote Timeout',DEFAULT_TIMEOUT);
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveAdminSettings(const CurPath: string;
                            const AppName: string;
                            const AdminSettings: TAdminSettings);
var
   TempIniFile: TIniFile;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,AdminSettings do
         begin
         WriteString(ADMIN_SECTION,'Remote Host',Host);
         WriteString(ADMIN_SECTION,'Remote Address',Address);
         WriteInteger(ADMIN_SECTION,'Remote Port',Port);
         WriteString(ADMIN_SECTION,'Remote Service',Service);
         WriteInteger(SESSION_SECTION,'Remote Compression',Compression);
         WriteBool(ADMIN_SECTION,'Remote Tracing',Tracing);
         WriteBool(ADMIN_SECTION,'Remote Pinging',Pinging);
         WriteInteger(ADMIN_SECTION,'Remote Ping Interval',PingInterval);
         WriteInteger(ADMIN_SECTION,'Remote Timeout',Timeout);
         UpdateFile;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SetAdminSettings(RemoteSessionToSet: TDBISAMSession;
                           ChangeRemoteSpecific: Boolean;
                           const AdminSettings: TAdminSettings);
begin
   with RemoteSessionToSet,AdminSettings do
      begin
      if ChangeRemoteSpecific then
         begin
         RemoteHost:=Host;
         RemoteAddress:=Address;
         RemotePort:=Port;
         RemoteService:=Service;
         end;
      RemoteCompression:=Compression;
      RemoteTrace:=Tracing;
      RemotePing:=Pinging;
      RemotePingInterval:=PingInterval;
      RemoteTimeout:=Timeout;
      end;
end;

procedure ReadMRUTables(const CurPath: string;
                        const AppName: string;
                        MRUTables: TStrings);
var
   TempIniFile: TIniFile;
   I: Integer;
   TempItem: string;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,MRUTables do
         begin
         Clear;
         for I:=0 to MAX_MRU_TABLES-1 do
            begin
            TempItem:=ReadString(MRU_TABLE_SECTION,MRU_TABLENAME_KEY+IntToStr(I),'');
            if (TempItem='') then
               Break;
            AddObject(TempItem,TObject(ReadInteger(MRU_TABLE_SECTION,MRU_TABLEOPEN_MODE_KEY+
                      IntToStr(I),MRU_OPEN_SHRD_NORM)));
            end;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveMRUTables(const CurPath: string;
                        const AppName: string;
                        MRUTables: TStrings);
var
   TempIniFile: TIniFile;
   I: Integer;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,MRUTables do
         begin
         for I:=0 to Count-1 do
            begin
            WriteString(MRU_TABLE_SECTION,MRU_TABLENAME_KEY+IntToStr(I),Strings[I]);
            WriteInteger(MRU_TABLE_SECTION,MRU_TABLEOPEN_MODE_KEY+IntToStr(I),
                         Integer(Objects[I]));
            end;
         UpdateFile;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SetMRUTables(Menu: TMenuItem; TotalMenuItems: Integer;
                       MenuEventHandler: TNotifyEvent;
                       MRUTables: TStrings);
var
   I: Integer;
   TempMenuItem: TMenuItem;
begin
   with Menu do
      begin
      for I:=Menu.Count-1 downto TotalMenuItems do
         begin
         Items[I].Free;
         Delete(I);
         end;
      if (MRUTables.Count > 0) then
         begin
         TempMenuItem:=TMenuItem.Create(Menu);
         Add(TempMenuItem);
         with TempMenuItem do
            begin
            Name:='n'+IntToStr(Count);
            Caption:='-';
            end;
         end;
      for I:=0 to MRUTables.Count-1 do
         begin
         TempMenuItem:=TMenuItem.Create(Menu);
         Add(TempMenuItem);
         with TempMenuItem do
            begin
            Caption:=MRUTables[I];
            Tag:=Integer(MRUTables.Objects[I]);
            OnClick:=MenuEventHandler;
            end;
         end;
      end;
end;

procedure InsertMRUTable(const MenuCaption: string; MenuTag: Integer;
                         Menu: TMenuItem; MRUMenuitem: TMenuItem;
                         MRUTables: TStrings;
                          MenuEventHandler: TNotifyEvent);
var
   MRUPos: Integer;
   TempMenuItem: TMenuItem;
begin
   MRUPos:=MRUTables.IndexOf(MenuCaption);
   if (MRUPos <> -1) then
      MRUMenuItem:=Menu.Items[(Menu.Count-(MRUTables.Count-MRUPos))];
   if (MRUMenuItem <> nil) then
      begin
      MRUTables.Move(MRUPos,0);
      MRUTables.Objects[0]:=TObject(MenuTag);
      MRUMenuItem.Tag:=MenuTag;
      with Menu do
         begin
         Menu.Remove(MRUMenuItem);
         Menu.Insert(((Menu.Count-MRUTables.Count)+1),MRUMenuItem);
         end;
      Exit;
      end
   else
      begin
      if (MRUTables.Count=0) then
         begin
         TempMenuItem:=TMenuItem.Create(Menu);
         Menu.Add(TempMenuItem);
         with TempMenuItem do
            begin
            Name:='n'+IntToStr(Count);
            Caption:='-';
            end;
         end;
      end;
   if (MRUTables.Count=MAX_MRU_TABLES) then
      begin
      Menu.Delete(Menu.Count-1);
      MRUTables.Delete(MRUTables.Count-1);
      end;
   TempMenuItem:=TMenuItem.Create(Menu);
   Menu.Insert((Menu.Count-MRUTables.Count),TempMenuItem);
   with TempMenuItem do
      begin
      Caption:=MenuCaption;
      Tag:=MenuTag;
      OnClick:=MenuEventHandler;
      end;
   MRUTables.InsertObject(0,MenuCaption,TObject(MenuTag));
end;

procedure ReadMRUDirectories(const CurPath: string;
                             const AppName: string;
                             MRUDatabaseDirectories: TStrings;
                             MRUPrivateDirectories: TStrings);
var
   TempIniFile: TIniFile;
   I: Integer;
   TempItem: string;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,MRUDatabaseDirectories do
         begin
         Clear;
         for I:=0 to MAX_MRU_DIRECTORIES-1 do
            begin
            TempItem:=ReadString(MRU_DATABASE_DIRECTORY_SECTION,
                                 MRU_DIRECTORY_KEY+IntToStr(I),'');
            if (TempItem='') then
               Break;
            Add(TempItem);
            end;
         end;
      with TempIniFile,MRUPrivateDirectories do
         begin
         Clear;
         for I:=0 to MAX_MRU_DIRECTORIES-1 do
            begin
            TempItem:=ReadString(MRU_PRIVATE_DIRECTORY_SECTION,
                                 MRU_DIRECTORY_KEY+IntToStr(I),'');
            if (TempItem='') then
               Break;
            Add(TempItem);
            end;
         end;
   finally
      TempIniFile.Free;
   end;
end;

procedure SaveMRUDirectories(const CurPath: string;
                             const AppName: string;
                             MRUDatabaseDirectories: TStrings;
                             MRUPrivateDirectories: TStrings);
var
   TempIniFile: TIniFile;
   I: Integer;
begin
   TempIniFile:=TIniFile.Create(AddBS(CurPath)+Trim(AppName)+'.ini');
   try
      with TempIniFile,MRUDatabaseDirectories do
         begin
         for I:=0 to Count-1 do
            WriteString(MRU_DATABASE_DIRECTORY_SECTION,
                        MRU_DIRECTORY_KEY+IntToStr(I),Strings[I]);
         UpdateFile;
         end;
      with TempIniFile,MRUPrivateDirectories do
         begin
         for I:=0 to Count-1 do
            WriteString(MRU_PRIVATE_DIRECTORY_SECTION,
                        MRU_DIRECTORY_KEY+IntToStr(I),Strings[I]);
         UpdateFile;
         end;
   finally
      TempIniFile.Free;
   end;
end;

function BrowseCallback(Wnd: HWND; uMsg: UINT; lParam,lpData: LPARAM): Integer; stdcall;
begin
   Result:=0;
   if (uMsg=BFFM_INITIALIZED) then
      begin
      if (StrLen(PChar(lpData)) > 0) then
         SendMessage(Wnd,BFFM_SETSELECTION,1,lpData);
      end;
end;

function GetDirectory(var DirectoryStr: string): Boolean;
var
   WindowList: Pointer;
   Buffer: array[0..MAX_PATH] of Char;
   ItemIdList: PItemIDList;
   BrowseInfo: TBrowseInfo;
begin
   Result:=False;
   with BrowseInfo do
      begin
      hwndOwner:=Screen.ActiveForm.Handle;
      pidlRoot:=nil;
      pszDisplayName:=Buffer;
      lpszTitle:='Select the directory';
      ulFlags:=(BIF_RETURNONLYFSDIRS+BIF_EDITBOX+BIF_NEWDIALOGSTYLE);
      lpfn:=BrowseCallback;
      lParam:=Integer(PChar(DirectoryStr));
      end;
   WindowList:=DisableTaskWindows(0);
   try
      ItemIdList:=ShBrowseForFolder(BrowseInfo);
   finally
      EnableTaskWindows(WindowList);
   end;
   if (ItemIDList=nil) then
      Exit;
   if SHGetPathFromIDList(ItemIDList,@Buffer) then
      begin
      Result:=True;
      DirectoryStr:=StrPas(@Buffer);
      end;
end;

function StripReturns(const Value: string): string;
var
   I: Integer;
begin
   Result:='';
   I:=1;
   while (I <= Length(Value)) do
      begin
      if (not (Value[I] in [#13,#10])) then
         Result:=Result+Value[I];
      Inc(I);
      end;
end;

function StripTabs(const Value: string): string;
var
   I: Integer;
begin
   Result:='';
   I:=1;
   while (I <= Length(Value)) do
      begin
      if (Value[I] <> #9) then
         Result:=Result+Value[I];
      Inc(I);
      end;
end;

function VerifyValidityExpression(const Expression: string;
                                  FieldType: TFieldType): Boolean;
begin
   Result:=True;
   if (FieldType <> ftString) and (FieldType <> ftFixedChar) and
      (FieldType <> ftWideString) and (FieldType <> ftBytes) and
      (FieldType <> ftVarBytes) and (Expression <> '') then
      begin
      if (FieldType=ftBoolean) then
         Result:=IsABoolean(Expression)
      else if (FieldType=ftWord) then
         Result:=IsAWord(Expression)
      else if (FieldType=ftSmallInt) then
         Result:=IsASmallInt(Expression)
      else if (FieldType=ftInteger) then
         Result:=IsAnInteger(Expression)
      else if (FieldType=ftFloat) then
         Result:=IsAFloat(Expression)
      else if (FieldType=ftBCD) then
         Result:=IsABCD(Expression)
      else if (FieldType=ftDateTime) then
         begin
         if ((AnsiCompareText(Expression,PARSE_CURDATETIME) <> 0) and
             (AnsiCompareText(Expression,PARSE_CURDATE) <> 0) and
             (AnsiCompareText(Expression,PARSE_CURTIME) <> 0)) and
            ((not IsADate(Expression)) and
             (not IsADateTime(Expression)) and
             (not IsATime(Expression))) then
            Result:=False;
         end
      else if (FieldType=ftTime) then
         begin
         if (AnsiCompareText(Expression,PARSE_CURTIME) <> 0) and
            (not IsATime(Expression)) then
            Result:=False;
         end
      else if (FieldType=ftDate) then
         begin
         if (AnsiCompareText(Expression,PARSE_CURDATE) <> 0) and
            (not IsADate(Expression)) then
            Result:=False;
         end;
      end;
end;

function MakeDialogFilter: string;
begin
   Result:='DBISAM Tables (*'+DataEngine.DataExtension+')|*'+DataEngine.DataExtension;
end;

function BeginOfMonth(Value: TDateTime): TDateTime;
var
   Year: Word;
   Month: Word;
   Day: Word;
begin
   DecodeDate(Value,Year,Month,Day);
   Result:=EncodeDate(Year,Month,1);
end;

function EndOfMonth(Value: TDateTime): TDateTime;
var
   Year: Word;
   Month: Word;
   Day: Word;
begin
   DecodeDate(Value,Year,Month,Day);
   if (Month=12) then
      begin
      Inc(Year);
      Month:=1;
      end
   else
      Inc(Month);
   Result:=EncodeDate(Year,Month,1)-1;
end;

function InstallingService: Boolean;
begin
   Result:=FindCmdLineSwitch('INSTALL',['-','\','/'],True) or
           FindCmdLineSwitch('UNINSTALL',['-','\','/'],True);
end;

function InteractiveService: Boolean;
begin
   Result:=(not FindCmdLineSwitch('NOINTERACT',['-','\','/'],True));
end;

function GetParam(const ParamString: string; const ParamName: string;
                  var ParamValue: string): Boolean;
begin
   Result:=False;
   ParamValue:='';
   if (ParamString[1] in ['-','/','\']) then
      begin
      if (AnsiCompareText(Copy(ParamString,2,Length(ParamName)),ParamName)=0) then
         begin
         ParamValue:=Copy(ParamString,(2+Length(ParamName)),Length(ParamString));
         Result:=True;
         end;
      end;
end;

procedure SplitTextOnSpace(const ValueToSplit: string;
                           var FirstHalf: string;
                           var SecondHalf: string);
var
   HalfPoint: Integer;
   I: Integer;
begin
   HalfPoint:=(Length(ValueToSplit) div 2);
   FirstHalf:=Copy(ValueToSplit,1,HalfPoint);
   SecondHalf:=Copy(ValueToSplit,(HalfPoint+1),Length(ValueToSplit));
   if (ValueToSplit[HalfPoint] <> ' ') then
      begin
      I:=(HalfPoint+1);
      while (ValueToSplit[I] <> ' ') and
            (I <= Length(ValueToSplit)) do
         begin
         FirstHalf:=FirstHalf+ValueToSplit[I];
         Inc(I);
         end;
      if (I <= Length(ValueToSplit)) then
         FirstHalf:=FirstHalf+ValueToSplit[I];
      SecondHalf:=Copy(ValueToSplit,(I+1),Length(ValueToSplit));
      end;
end;

procedure SetupCharacterValues(ListBox: TListBox; const Value: string);
var
   I: Byte;
begin
   with ListBox do
      begin
      Items.BeginUpdate;
      try
         for I:=0 to Items.Count-1 do
            Selected[I]:=False;
         for I:=1 to Length(Value) do
            Selected[Ord(Value[I])-1]:=True
      finally
         Items.EndUpdate;
      end;
      end;
end;

function SelectedCharacterValues(ListBox: TListBox): string;
var
   I: Byte;
begin
   Result:='';
   with ListBox do
      begin
      for I:=1 to High(Byte) do
         begin
         if Selected[I-1] then
            Result:=Result+Chr(I);
         end;
      end;
end;

procedure PopulateAsciiValues(ListBox: TListBox);
var
   I: Byte;
begin
   with ListBox.Items do
      begin
      BeginUpdate;
      try
         Clear;
         for I:=1 to High(Byte) do
            Add('  '+PadRight(IntToStr(I),3,' ')+'  '+Chr(Byte(I))+'  '+IntToHex(I,2));
      finally
         EndUpdate;
      end;
      end;
end;

function CreateSpacedAsciiString(Value: string): string;
var
   I: Integer;
begin
   Result:='';
   for I:=1 to Length(Value)-1 do
      begin
      if (Ord(Value[I]) <= 32) then
         Result:=Result+'#'+IntToStr(Ord(Value[I]))+' '
      else
         Result:=Result+Value[I]+' ';
      end;
   Result:=Result+Value[Length(Value)];
end;

procedure CreateAsciiList(Value: string; List: TStrings);
var
   I: Integer;
begin
   List.BeginUpdate;
   try
      List.Clear;
      for I:=1 to Length(Value) do
         List.Add('  '+PadRight(IntToStr(Ord(Value[I])),3,' ')+'  '+
                  Value[I]+'  '+IntToHex(Ord(Value[I]),2));
   finally
      List.EndUpdate;
   end;
end;

procedure DisableChildControls(Owner: TComponent);
var
   I: Integer;
begin
   with Owner do
      begin
      for I:=0 to ComponentCount-1 do
         begin
         if (Components[I] is TControl) then
            begin
            with TControl(Components[I]) do
               Enabled:=False;
            end;
         end;
      end;
end;

procedure EnableChildControls(Owner: TComponent);
var
   I: Integer;
begin
   with Owner do
      begin
      for I:=0 to ComponentCount-1 do
         begin
         if (Components[I] is TControl) then
            begin
            with TControl(Components[I]) do
               Enabled:=True;
            end;
         end;
      end;
end;

function TranslateLogRecord(const LogRecord: TLogRecord): string;
begin
   with LogRecord do
      begin
      Result:=PadRight(DateTimeToStr(DateTime),16,' ');
      case Category of
         lcWarning:
            Result:=Result+' [WARNING]';
         lcError:
            Result:=Result+' [ERROR]';
         end;
      case EventType of
         leNone:
            Result:=Result+' '+Text+
                                   ' [Client Version: '+FormatCurr('0.00',ClientVersion)+
                                   ' User Name: '+ClientUser+
                                   ' Address: '+ClientAddress+
                                   ' Encrypted: '+BooleanToStr(ClientEncrypted)+
                                   ' Request: '+ClientRequestName+
                                   ' Thread: '+IntToStr(ClientThread)+
                                   ' Session: '+IntToStr(ClientSession)+']';
         leConnect,leReconnect,leDisconnect,leLogin,leLogout,
          leNoSession,leAddressBlock,leMaxConnect,leInvalidLogin,leLoginDenied:
            Result:=Result+' '+Text+
                                   ' [Client Version: '+FormatCurr('0.00',ClientVersion)+
                                   ' User Name: '+ClientUser+
                                   ' Address: '+ClientAddress+
                                   ' Encrypted: '+BooleanToStr(ClientEncrypted)+
                                   ' Thread: '+IntToStr(ClientThread)+
                                   ' Session: '+IntToStr(ClientSession)+']';
         leDeadSession:
            Result:=Result+' '+Text+
                                   ' [Client Last User Name: '+ClientUser+
                                   ' Last Address: '+ClientAddress+
                                   ' Thread: '+IntToStr(ClientThread)+
                                   ' Session: '+IntToStr(ClientSession)+']';
         else
            Result:=Result+' '+Text+' [Server Version: '+FormatCurr('0.00',ServerVersion)+']';
         end;
      end;
end;

initialization
   DataTypesList:=TStringList.Create;
   with DataTypesList do
      begin
      AddObject(DBISAM_TYPESTR_ZSTRING,TObject(ftString));
      AddObject(DBISAM_TYPESTR_ZSTRING_FIXED,TObject(ftFixedChar));
//      AddObject(DBISAM_TYPESTR_ZSTRING_UNICODE,TObject(ftWideString));
      AddObject(DBISAM_TYPESTR_ZSTRING_GUID,TObject(ftGuid));
      AddObject(DBISAM_TYPESTR_BYTES,TObject(ftBytes));
      AddObject(DBISAM_TYPESTR_VARBYTES,TObject(ftVarBytes));
      AddObject(DBISAM_TYPESTR_BLOB,TObject(ftBlob));
      AddObject(DBISAM_TYPESTR_BLOB_GRAPHIC,TObject(ftGraphic));
      AddObject(DBISAM_TYPESTR_BLOB_MEMO,TObject(ftMemo));
      AddObject(DBISAM_TYPESTR_DATE,TObject(ftDate));
      AddObject(DBISAM_TYPESTR_TIME,TObject(ftTime));
      AddObject(DBISAM_TYPESTR_TIMESTAMP,TObject(ftDateTime));
      AddObject(DBISAM_TYPESTR_BOOL,TObject(ftBoolean));
      AddObject(DBISAM_TYPESTR_INT16,TObject(ftSmallInt));
      AddObject(DBISAM_TYPESTR_UINT16,TObject(ftWord));
      AddObject(DBISAM_TYPESTR_INT32,TObject(ftInteger));
      AddObject(DBISAM_TYPESTR_INT32_AUTOINC,TObject(ftAutoInc));
      AddObject(DBISAM_TYPESTR_INT64,TObject(ftLargeInt));
      AddObject(DBISAM_TYPESTR_FLOAT,TObject(ftFloat));
      AddObject(DBISAM_TYPESTR_FLOAT_MONEY,TObject(ftCurrency));
      AddObject(DBISAM_TYPESTR_BCD,TObject(ftBCD));
      end;
finalization
   DataTypesList.Free;
end.

