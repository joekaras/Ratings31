program dbcmd;

{$APPTYPE CONSOLE}

uses

  {$I dbisamvr.inc}

  dbisammm,

  SysUtils,

  Classes,
  IniFiles,
  dbisamcn,
  dbisamlb,
  dbisamtb;

const

   LOG_EXT = '.log';
   LOG_BACKUP_EXT = '.lgb';

   PARAMS_SECTION = 'Server Parameters';

   SERVER_NAME_PARAM = 'SN';
   SERVER_DESC_PARAM = 'SD';
   SERVER_ADDRESS_PARAM = 'SA';
   SERVER_PORT_PARAM = 'SP';
   SERVER_THREAD_PARAM = 'ST';
   ADMIN_ADDRESS_PARAM = 'AA';
   ADMIN_PORT_PARAM = 'AP';
   ADMIN_THREAD_PARAM = 'AT';
   CONFIG_FILE_PARAM = 'CF';
   CONFIG_PASSWORD_PARAM = 'CP';
   ENCRYPTED_PARAM = 'EN';
   ENCRYPT_PASSWORD_PARAM = 'EP';
   NOUI_PARAM = 'NI';
   APPENDLOG_PARAM = 'AL';
   LARGEFILE_PARAM = 'LF';

type

   TFormPlaceHolder = class(TObject)
      public
         procedure ServerEngineServerLogEvent(Sender: TObject;
           LogRecord: TLogRecord);
         procedure ServerEngineServerLogCount(Sender: TObject;
           var LogCount: Integer);
         procedure ServerEngineServerLogRecord(Sender: TObject;
           Number: Integer; var LogRecord: TLogRecord);
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

var
   LogFileHandle: Integer;

procedure TFormPlaceHolder.ServerEngineServerLogEvent(Sender: TObject;
  LogRecord: TLogRecord);
begin
   FileSeek(LogFileHandle,0,2);
   FileWrite(LogFileHandle,LogRecord,SizeOf(TLogRecord));
end;

procedure TFormPlaceHolder.ServerEngineServerLogCount(Sender: TObject;
  var LogCount: Integer);
var
   TotalLogSize: Integer;
begin
   TotalLogSize:=FileSeek(LogFileHandle,0,2);
   LogCount:=(TotalLogSize div SizeOf(TLogRecord));
end;

procedure TFormPlaceHolder.ServerEngineServerLogRecord(Sender: TObject;
  Number: Integer; var LogRecord: TLogRecord);
begin
   FileSeek(LogFileHandle,((Number-1)*SizeOf(TLogRecord)),0);
   FileRead(LogFileHandle,LogRecord,SizeOf(TLogRecord));
end;

var
   AppendToLog: Boolean;
   AppDirectory: string;
   ServerName: ShortString;
   ServerDescription: ShortString;
   FormPlaceHolder: TFormPlaceHolder;
   ServerEngine: TDBISAMEngine;
   I: Integer;
   TempParams: TStrings;
   TempParam: string;
   TempIniFile: TIniFile;
   InputText: string;
begin
   ServerName:=AnsiUpperCase(StripFilePathAndExtension(ParamStr(0),''));
   ServerDescription:=DEFAULT_SERVER_DESC+' - '+ServerName+' (Command-Line)';
   AppDirectory:=AddBS(ExtractFilePath(ParamStr(0)));
   { Force the current working directory to the same as the .exe }
   ChDir(AppDirectory);
   AppendToLog:=False;
   FormPlaceHolder:=TFormPlaceHolder.Create;
   ServerEngine:=TDBISAMEngine.Create(nil);
   try
      with ServerEngine do
         begin
         EngineType:=etServer;
         OnServerLogEvent:=FormPlaceHolder.ServerEngineServerLogEvent;
         OnServerLogCount:=FormPlaceHolder.ServerEngineServerLogCount;
         OnServerLogRecord:=FormPlaceHolder.ServerEngineServerLogRecord;
         end;
      ServerEngine.ServerName:=ServerName;
      ServerEngine.ServerDescription:=ServerDescription;
      { Check for an INI file with parameters }
      if FileExists(AppDirectory+StripFilePathAndExtension(ParamStr(0),'.exe')+'.ini') then
         begin
         TempIniFile:=TIniFile.Create(AppDirectory+StripFilePathAndExtension(ParamStr(0),'.exe')+'.ini');
         try
            with TempIniFile do
               begin
               ServerEngine.ServerName:=ReadString(PARAMS_SECTION,'Server Name',
                              ServerEngine.ServerName);
               ServerEngine.ServerDescription:=ReadString(PARAMS_SECTION,'Server Description',
                              ServerEngine.ServerDescription);
               ServerEngine.ServerMainAddress:=ReadString(PARAMS_SECTION,'Server Address',
                              ServerEngine.ServerMainAddress);
               ServerEngine.ServerMainPort:=ReadInteger(PARAMS_SECTION,'Server Port',
                              ServerEngine.ServerMainPort);
               ServerEngine.ServerMainThreadCacheSize:=ReadInteger(PARAMS_SECTION,'Server Thread Cache Size',
                              ServerEngine.ServerMainThreadCacheSize);
               ServerEngine.ServerAdminAddress:=ReadString(PARAMS_SECTION,'Administration Address',
                              ServerEngine.ServerAdminAddress);
               ServerEngine.ServerAdminPort:=ReadInteger(PARAMS_SECTION,'Administration Port',
                              ServerEngine.ServerAdminPort);
               ServerEngine.ServerAdminThreadCacheSize:=ReadInteger(PARAMS_SECTION,'Administration Thread Cache Size',
                              ServerEngine.ServerAdminThreadCacheSize);
               ServerEngine.ServerConfigFileName:=ReadString(PARAMS_SECTION,'Configuration File',
                              ServerEngine.ServerConfigFileName);
               ServerEngine.ServerConfigPassword:=ReadString(PARAMS_SECTION,'Configuration Password',
                              ServerEngine.ServerConfigPassword);
               ServerEngine.ServerEncryptedOnly:=ReadBool(PARAMS_SECTION,'Encrypted Only',
                              ServerEngine.ServerEncryptedOnly);
               ServerEngine.ServerEncryptionPassword:=ReadString(PARAMS_SECTION,'Encryption Password',
                              ServerEngine.ServerEncryptionPassword);
               AppendToLog:=ReadBool(PARAMS_SECTION,'Append To Log',False);
               ServerEngine.LargeFileSupport:=ReadBool(PARAMS_SECTION,'Large File Support',False);
               end;
         finally
            TempIniFile.Free;
         end;
         end;
      TempParams:=TStringList.Create;
      try
         for I:=1 to ParamCount do
            TempParams.Add(ParamStr(I));
         for I:=0 to TempParams.Count-1 do
            begin
            if GetParam(TempParams[I],SERVER_NAME_PARAM,TempParam) then
               ServerEngine.ServerName:=TempParam
            else if GetParam(TempParams[I],SERVER_DESC_PARAM,TempParam) then
               ServerEngine.ServerDescription:=TempParam
            else if GetParam(TempParams[I],SERVER_ADDRESS_PARAM,TempParam) then
               ServerEngine.ServerMainAddress:=TempParam
            else if GetParam(TempParams[I],SERVER_PORT_PARAM,TempParam) then
               begin
               try
                  ServerEngine.ServerMainPort:=StrToInt(TempParam);
               except
               end;
               end
            else if GetParam(TempParams[I],SERVER_THREAD_PARAM,TempParam) then
               begin
               try
                  ServerEngine.ServerMainThreadCacheSize:=StrToInt(TempParam);
               except
               end;
               end
            else if GetParam(TempParams[I],ADMIN_ADDRESS_PARAM,TempParam) then
               ServerEngine.ServerAdminAddress:=TempParam
            else if GetParam(TempParams[I],ADMIN_PORT_PARAM,TempParam) then
               begin
               try
                  ServerEngine.ServerAdminPort:=StrToInt(TempParam);
               except
               end;
               end
            else if GetParam(TempParams[I],ADMIN_THREAD_PARAM,TempParam) then
               begin
               try
                  ServerEngine.ServerAdminThreadCacheSize:=StrToInt(TempParam);
               except
               end;
               end
            else if GetParam(TempParams[I],CONFIG_FILE_PARAM,TempParam) then
               ServerEngine.ServerConfigFileName:=TempParam
            else if GetParam(TempParams[I],CONFIG_PASSWORD_PARAM,TempParam) then
               ServerEngine.ServerConfigPassword:=TempParam
            else if GetParam(TempParams[I],ENCRYPTED_PARAM,TempParam) then
               ServerEngine.ServerEncryptedOnly:=True
            else if GetParam(TempParams[I],ENCRYPT_PASSWORD_PARAM,TempParam) then
               ServerEngine.ServerEncryptionPassword:=TempParam
            else if GetParam(TempParams[I],APPENDLOG_PARAM,TempParam) then
               AppendToLog:=True
            else if GetParam(TempParams[I],LARGEFILE_PARAM,TempParam) then
               ServerEngine.LargeFileSupport:=True;
            end;
      finally
         TempParams.Free;
      end;
      if FileExists(AppDirectory+LowerCase(ServerEngine.ServerName)+LOG_EXT) and AppendToLog then
         LogFileHandle:=FileOpen(AppDirectory+LowerCase(ServerEngine.ServerName)+LOG_EXT,(fmOpenReadWrite or fmShareExclusive))
      else
         begin
         if (not AppendToLog) then
            CopyDiskFile(AppDirectory+LowerCase(ServerEngine.ServerName)+LOG_EXT,
                         AppDirectory+LowerCase(ServerEngine.ServerName)+LOG_BACKUP_EXT);
         LogFileHandle:=FileCreate(AppDirectory+LowerCase(ServerEngine.ServerName)+LOG_EXT);
         end;
      if (LogFileHandle < 0) then
         raise Exception.Create('Cannot open or create log file '+AppDirectory+ServerEngine.ServerName+LOG_EXT+
                                ' for database server');
      try
         try
            ServerEngine.Active:=True;
         except
         end;
         InputText:='';
         WriteLn('=======================================================');
         WriteLn('DBISAM Database Server - Version '+ServerEngine.EngineVersion);
         WriteLn('');
         WriteLn('Server Name: '+ServerEngine.ServerName);
         if (ServerEngine.ServerMainAddress='') then
            WriteLn('Listening On: *All IP Addresses* Port '+IntToStr(ServerEngine.ServerMainPort))
         else
            WriteLn('Listening On: '+ServerEngine.ServerMainAddress+' Port '+IntToStr(ServerEngine.ServerMainPort));
         WriteLn('');
         WriteLn('Started On: '+DateTimeToStr(Now));
         WriteLn('');
         WriteLn('=======================================================');
         WriteLn('');
         WriteLn('Type QUIT and <Enter> to shutdown server');
         WriteLn('');
         Write('> ');
         while (UpperCase(InputText) <> 'QUIT') do
            ReadLn(InputText);
         try
            ServerEngine.Active:=False;
         except
         end;
      finally
         FileClose(LogFileHandle);
      end;
   finally
      ServerEngine.Free;
      FormPlaceHolder.Free;
   end;
end.
