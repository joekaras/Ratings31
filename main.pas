unit main;

interface

uses
   SysUtils, Classes, Contnrs,

   {$I dbisamvr.inc}

   SyncObjs,
   SvcMgr, Windows, Messages, Forms, Graphics, Controls,
   Dialogs, StdCtrls, Menus, ExtCtrls, ComCtrls, ImgList,
   dbisamtb, dbisamlb, dbisamut;

const

   DS_INITIALIZE = (WM_USER+1);
   DS_TRAYICON = (DS_INITIALIZE+1);

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

   TSessionItem = class(TObject)
      private
         FConnected: Boolean;
         FEncrypted: Boolean;
         FUserName: ShortString;
         FAddress: ShortString;
         FCreatedOn: TDateTime;
         FListItem: TListItem;
      public
         property Connected: Boolean read FConnected write FConnected;
         property Encrypted: Boolean read FEncrypted write FEncrypted;
         property UserName: ShortString read FUserName write FUserName;
         property Address: ShortString read FAddress write FAddress;
         property CreatedOn: TDateTime read FCreatedOn write FCreatedOn;
         property ListItem: TListItem read FListItem write FListItem;
      end;

   TDisplayActionType = (atConnect,atDisconnect,atReconnect,atLogin,atLogout);

   TSessionDisplayItem = class(TObject)
      private
         FActionType: TDisplayActionType;
         FNewEncrypted: Boolean;
         FNewUserName: ShortString;
         FNewAddress: ShortString;
         FNewCreatedOn: TDateTime;
         FSessionItem: TSessionItem;
      public
         property ActionType: TDisplayActionType read FActionType write FActionType;
         property NewEncrypted: Boolean read FNewEncrypted write FNewEncrypted;
         property NewUserName: ShortString read FNewUserName write FNewUserName;
         property NewAddress: ShortString read FNewAddress write FNewAddress;
         property NewCreatedOn: TDateTime read FNewCreatedOn write FNewCreatedOn;
         property SessionItem: TSessionItem read FSessionItem write FSessionItem;
      end;

   TDatabaseService = class(TService)
      protected
         procedure Start(Sender: TService; var Started: Boolean);
         procedure Stop(Sender: TService; var Stopped: Boolean);
      public
         function GetServiceController: TServiceController; override;
         constructor CreateNew(AOwner: TComponent; Dummy: Integer=0); override;
      end;

   TIconState = (isNoChange,isStarted,isStopped);

  TMainForm = class(TForm)
    Pages: TPageControl;
    CloseButton: TButton;
    ServerSessionsSheet: TTabSheet;
    TrayMenu: TPopupMenu;
    OpenItem: TMenuItem;
    N2: TMenuItem;
    SessionsGroupBox: TGroupBox;
    ServerOnIcon: TImage;
    ServerOffIcon: TImage;
    StopItem: TMenuItem;
    AboutButton: TButton;
    Label1: TLabel;
    TotalSessionsEdit: TEdit;
    Label2: TLabel;
    TotalConnectedSessionsEdit: TEdit;
    StartItem: TMenuItem;
    N1: TMenuItem;
    ExitItem: TMenuItem;
    HelpPopup: TPopupMenu;
    WhatsThisItem: TMenuItem;
    ServerEngine: TDBISAMEngine;
    ServerStatusSheet: TTabSheet;
    ServerGroupBox: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    UpTimeEdit: TEdit;
    EngineVersionEdit: TEdit;
    StopButton: TButton;
    StartButton: TButton;
    MainPortEdit: TEdit;
    AdminPortEdit: TEdit;
    MainAddressEdit: TEdit;
    AdminAddressEdit: TEdit;
    SessionsListView: TListView;
    UserImageList: TImageList;
    IconTimer: TTimer;
    SystemTimer: TTimer;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure SystemTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OpenItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: integer; var Resize: Boolean);
    procedure AboutButtonClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure WhatsThisItemClick(Sender: TObject);
    procedure IconTimerTimer(Sender: TObject);
    procedure ServerEngineServerConnect(Sender: TObject;
      IsEncrypted: Boolean; const ConnectAddress: String;
      var UserData: TObject);
    procedure ServerEngineServerDisconnect(Sender, UserData: TObject;
      const LastConnectAddress: String);
    procedure ServerEngineServerReconnect(Sender: TObject;
      IsEncrypted: Boolean; const ConnectAddress: String;
      UserData: TObject);
    procedure ServerEngineServerLogin(Sender: TObject;
      const UserName: String; UserData: TObject);
    procedure ServerEngineServerLogout(Sender: TObject;
      var UserData: TObject);
    procedure ServerEngineServerStart(Sender: TObject);
    procedure ServerEngineServerStop(Sender: TObject);
    procedure ServerEngineServerLogEvent(Sender: TObject;
      LogRecord: TLogRecord);
    procedure ServerEngineServerLogCount(Sender: TObject;
      var LogCount: Integer);
    procedure ServerEngineServerLogRecord(Sender: TObject; Number: Integer;
      var LogRecord: TLogRecord);
    procedure SessionsListViewData(Sender: TObject; Item: TListItem);
    procedure ApplicationIdle(Sender: TObject; var Done: Boolean);
   private
    SessionsList: TObjectList;
    TotalSessions: Integer;
    TotalConnectedSessions: Integer;
    DisplayQueue: TObjectList;
    DisplayQueueSection: TCriticalSection;
    FromService: Boolean;
    NoUI: Boolean;
    AppendToLog: Boolean;
    IconSection: TCriticalSection;
    IconHint: string;
    IconVisible: Boolean;
    LogFileHandle: Integer;
    procedure UpdateFormPosition;
    procedure UpdateTrayIcon;
    procedure RemoveTrayIcon;
    function GetStartedHint: string;
    function GetStoppedHint: string;
    procedure UpdateFixedSystemInfo;
    procedure UpdateVariableSystemInfo;
    procedure UpdateSessionInfo;
    procedure ProcessDisplayQueue;
    procedure AddToDisplayQueue(Value: TSessionDisplayItem);
    procedure UpdateListItem(SessionItem: TSessionItem);
   protected
    procedure DSInitialize(var Msg: TMessage); message DS_INITIALIZE;
    procedure DSTrayIcon(var Msg: TMessage); message DS_TRAYICON;
   public
    AppDirectory: string;
    AppVersionInformation: TVersionInfo;
    procedure Initialize(Service: TService);
   end;

var
   MainForm: TMainForm;
   DatabaseService: TDatabaseService;
   ServerName: ShortString;
   ServerDescription: ShortString;

implementation

uses
   ShellAPI,
   IniFiles, about, dbisamcn;

{$R *.dfm}


procedure ServiceController(CtrlCode: DWORD); stdcall;
begin
   DatabaseService.Controller(CtrlCode);
end;

function TDatabaseService.GetServiceController: TServiceController;
begin
   Result:=ServiceController;
end;

constructor TDatabaseService.CreateNew(AOwner: TComponent; Dummy: integer);
begin
   inherited CreateNew(AOwner,Dummy);
   AllowStop:=True;
   AllowPause:=False;
   Interactive:=Boolean(Dummy);
   DisplayName:=ServerDescription;
   Name:=ServerName;
   OnStart:=Start;
   OnStop:=Stop;
end;

procedure TDatabaseService.Start(Sender: TService; var Started: Boolean);
begin
   PostMessage(MainForm.Handle,DS_INITIALIZE,1,Integer(Self));
   Started:=True;
end;

procedure TDatabaseService.Stop(Sender: TService; var Stopped: Boolean);
begin
   PostMessage(MainForm.Handle,WM_QUIT,0,0);
   Stopped:=True;
end;

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
   SessionsList:=TObjectList.Create;
   DisplayQueueSection:=TCriticalSection.Create;
   DisplayQueue:=TObjectList.Create;
   ReadVersionInformation(AppVersionInformation);
   with AppVersionInformation do
      begin
      with Application do
         begin
         OnIdle:=ApplicationIdle;
         AppDirectory:=AddBS(ExtractFilePath(ExeName));
         Caption:=ProductName;
         Title:=ProductName;
         HelpFile:=AppDirectory+StripFilePathAndExtension(ExeName,'.exe')+'.hlp';
         end;
      end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
   if (not InstallingService) then
      begin
      if (not NoUI) then
         IconTimer.Enabled:=False;
      try
         ServerEngine.Active:=False;
      except
      end;
      FileClose(LogFileHandle);
      LogFileHandle:=0;
      if (not NoUI) then
         begin
         RemoveTrayIcon;
         IconSection.Free;
         end;
      end;
   DisplayQueue.Free;
   DisplayQueueSection.Free;
   SessionsList.Free;
end;

procedure TMainForm.Initialize(Service: TService);
var
   I: Integer;
   TempParams: TStrings;
   TempParam: string;
   TempIniFile: TIniFile;
begin
   { Force the current working directory to the same as the .exe }
   ChDir(AppDirectory);
   FromService:=(Service <> nil);
   NoUI:=False;
   AppendToLog:=False;
   ServerEngine.ServerName:=ServerName;
   ServerEngine.ServerDescription:=ServerDescription;
   { Check for an INI file with parameters }
   if FileExists(AppDirectory+StripFilePathAndExtension(Application.ExeName,'.exe')+'.ini') then
      begin
      TempIniFile:=TIniFile.Create(AppDirectory+StripFilePathAndExtension(Application.ExeName,'.exe')+'.ini');
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
            NoUI:=ReadBool(PARAMS_SECTION,'No User Interface',False);
            AppendToLog:=ReadBool(PARAMS_SECTION,'Append To Log',False);
            ServerEngine.LargeFileSupport:=ReadBool(PARAMS_SECTION,'Large File Support',False);
            end;
      finally
         TempIniFile.Free;
      end;
      end;
   TempParams:=TStringList.Create;
   try
      if FromService then
         begin
         AboutButton.Visible:=False;
         N1.Visible:=False;
         ExitItem.Visible:=False;
         with Service do
            begin
            for I:=0 to ParamCount-1 do
               TempParams.Add(Param[I]);
            end;
         end
      else
         begin
         AboutButton.Visible:=True;
         for I:=1 to ParamCount do
            TempParams.Add(ParamStr(I));
         end;
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
         else if GetParam(TempParams[I],NOUI_PARAM,TempParam) then
            NoUI:=True
         else if GetParam(TempParams[I],APPENDLOG_PARAM,TempParam) then
            AppendToLog:=True
         else if GetParam(TempParams[I],LARGEFILE_PARAM,TempParam) then
            ServerEngine.LargeFileSupport:=True;
         end;
      Caption:=ServerEngine.ServerDescription;
   finally
      TempParams.Free;
   end;
   { Override NOUI setting for services based upon registry setting
     for service's interact with desktop flag }
   if FromService then
      NoUI:=(not Service.Interactive);
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
   if (not NoUI) then
      begin
      UpdateFixedSystemInfo;
      IconSection:=TCriticalSection.Create;
      IconTimer.Enabled:=True;
      end;
   try
      ServerEngine.Active:=True;
   except
   end;
   if (not NoUI) then
      begin
      end;
end;

procedure TMainForm.DSInitialize(var Msg: TMessage);
begin
   Initialize(TService(Msg.LParam));
end;

procedure TMainForm.DSTrayIcon(var Msg: TMessage);
var
   Point: TPoint;
begin
   with Msg do
      begin
      case LParam of
         WM_RBUTTONDOWN:
            begin
            GetCursorPos(Point);
            SetForegroundWindow(Handle);
            TrayMenu.Popup(Point.X,Point.Y);
            end;
         WM_LBUTTONDBLCLK:
            TrayMenu.Items[0].Click;
         end;
      end;
end;

procedure TMainForm.UpdateTrayIcon;
var
   IconData: TNotifyIconData;
begin
   if NoUI then Exit;
   IconSection.Enter;
   try
      IconData.cbSize:=SizeOf(IconData);
      IconData.Wnd:=Handle;
      IconData.uID:=Tag;
      IconData.uFlags:=(NIF_ICON or NIF_TIP or NIF_MESSAGE);
      IconData.uCallbackMessage:=DS_TRAYICON;
      StrPCopy(IconData.szTip,IconHint);
      if ServerEngine.Active and (ServerEngine.GetServerUpTime >= 0) then
         IconData.hIcon:=ServerOnIcon.Picture.Icon.Handle
      else
         IconData.hIcon:=ServerOffIcon.Picture.Icon.Handle;
      if IconVisible then
         begin
         if (not Shell_NotifyIcon(NIM_MODIFY,@IconData)) then
            Shell_NotifyIcon(NIM_ADD,@IconData);
         end
      else
         begin
         if Shell_NotifyIcon(NIM_ADD,@IconData) then
            IconVisible:=True;
         end;
   finally
      IconSection.Leave;
   end;
end;

procedure TMainForm.RemoveTrayIcon;
var
   IconData: TNotifyIconData;
begin
   IconSection.Enter;
   try
      IconData.cbSize:=SizeOf(IconData);
      IconData.Wnd:=Handle;
      IconData.uID:=Tag;
      IconData.uFlags:=(NIF_ICON or NIF_TIP or NIF_MESSAGE);
      IconData.uCallbackMessage:=DS_TRAYICON;
      if Shell_NotifyIcon(NIM_DELETE,@IconData) then
         IconVisible:=False;
   finally
      IconSection.Leave;
   end;
end;


procedure TMainForm.SystemTimerTimer(Sender: TObject);
begin
   UpdateVariableSystemInfo;
end;

procedure TMainForm.UpdateFixedSystemInfo;
begin
   EngineVersionEdit.Text:='DBISAM Version '+ServerEngine.EngineVersion;
   if (ServerEngine.ServerMainAddress <> '') then
      MainAddressEdit.Text:=ServerEngine.ServerMainAddress
   else
      MainAddressEdit.Text:='All Addresses';
   MainPortEdit.Text:=IntToStr(ServerEngine.ServerMainPort);
   if (ServerEngine.ServerAdminAddress <> '') then
      AdminAddressEdit.Text:=ServerEngine.ServerAdminAddress
   else
      AdminAddressEdit.Text:='All Addresses';
   AdminPortEdit.Text:=IntToStr(ServerEngine.ServerAdminPort);
end;

procedure TMainForm.UpdateVariableSystemInfo;
begin
   if (ServerEngine.GetServerUpTime >= 0) then
      UpTimeEdit.Text:=TextTimeInterval(ServerEngine.GetServerUpTime)
   else
      UpTimeEdit.Text:='Stopped';
end;

procedure TMainForm.UpdateSessionInfo;
begin
   TotalSessionsEdit.Text:=IntToStr(TotalSessions);
   TotalConnectedSessionsEdit.Text:=IntToStr(TotalConnectedSessions);
end;

procedure TMainForm.OpenItemClick(Sender: TObject);
begin
   Show;
end;

procedure TMainForm.UpdateFormPosition;
var
   Rect: TRect;
begin
   SystemParametersInfo(SPI_GETWORKAREA,0,@Rect,0);
   Left:=(Rect.Right-Width-10);
   Top:=(Rect.Bottom-Height-10);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
   SessionsListView.Items.Count:=TotalSessions;
   SessionsListView.Repaint;
   UpdateVariableSystemInfo;
   UpdateSessionInfo;
   SystemTimer.Enabled:=True;
   UpdateFormPosition;
   ActiveControl:=CloseButton;
end;

procedure TMainForm.CloseButtonClick(Sender: TObject);
begin
   Hide;
end;

procedure TMainForm.FormHide(Sender: TObject);
begin
   SessionsListView.Items.Count:=0;
   SystemTimer.Enabled:=False;
end;

procedure TMainForm.FormCanResize(Sender: TObject; var NewWidth,
   NewHeight: integer; var Resize: Boolean);
begin
   Resize:=False;
end;

procedure TMainForm.AboutButtonClick(Sender: TObject);
begin
   AboutBox.ShowModal;
end;

procedure TMainForm.ExitItemClick(Sender: TObject);
begin
   StopButtonClick(nil);
   Close;
end;

function TMainForm.GetStartedHint: string;
begin
   if (ServerEngine.ServerMainAddress <> '') then
      Result:='Running on address '+
              ServerEngine.ServerMainAddress+' and port '+
              IntToStr(ServerEngine.ServerMainPort)
   else
      Result:='Running on all addresses '+
              'and port '+IntToStr(ServerEngine.ServerMainPort);
end;

function TMainForm.GetStoppedHint: string;
begin
   if (ServerEngine.ServerMainAddress <> '') then
      Result:='Stopped on address '+
              ServerEngine.ServerMainAddress+' and port '+
              IntToStr(ServerEngine.ServerMainPort)
   else
      Result:='Stopped on all addresses '+
              'and port '+IntToStr(ServerEngine.ServerMainPort);
end;

procedure TMainForm.StartButtonClick(Sender: TObject);
begin
   try
      StartButton.Enabled:=False;
      StartItem.Enabled:=False;
      IconHint:='Starting';
      UpdateTrayIcon;
      ServerEngine.StartMainServer;
   except
      StartButton.Enabled:=True;
      StartItem.Enabled:=True;
      StopButton.Enabled:=False;
      StopItem.Enabled:=False;
      IconHint:=GetStoppedHint;
      UpdateTrayIcon;
      raise;
   end;
end;

procedure TMainForm.StopButtonClick(Sender: TObject);
var
   ContinueStopping: Boolean;
begin
   ContinueStopping:=True;
   if (ServerEngine.GetServerConnectedSessionCount > 0) then
      begin
      if (MessageDlg('There are active sessions currently connected and stopping '+
                     'the server will disconnect these active sessions, are you '+
                     'sure you want to stop the server ?',mtConfirmation,[mbYes,mbNo],0)=mrNo) then
         ContinueStopping:=False;
      end;
   if ContinueStopping then
      begin
      try
         IconHint:='Stopping';
         UpdateTrayIcon;
         StopButton.Enabled:=False;
         StopItem.Enabled:=False;
         ServerEngine.StopMainServer;
      except
         StartButton.Enabled:=False;
         StartItem.Enabled:=False;
         StopButton.Enabled:=True;
         StopItem.Enabled:=True;
         IconHint:=GetStartedHint;
         UpdateTrayIcon;
         raise;
      end;
      end
   else
      Abort;
end;

procedure TMainForm.WhatsThisItemClick(Sender: TObject);
begin
   if (HelpPopup.PopupComponent is TControl) then
      Application.HelpCommand(HELP_CONTEXTPOPUP,
                  TControl(HelpPopup.PopupComponent).Tag);
end;

procedure TMainForm.IconTimerTimer(Sender: TObject);
begin
   UpdateTrayIcon;
end;

procedure TMainForm.ApplicationIdle(Sender: TObject; var Done: Boolean);
begin
   ProcessDisplayQueue;
   Done:=True;
end;

procedure TMainForm.ProcessDisplayQueue;
var
   ItemPos: Integer;
begin
   DisplayQueueSection.Enter;
   try
      while (DisplayQueue.Count > 0) do
         begin
         with TSessionDisplayItem(DisplayQueue[0]) do
            begin
            case ActionType of
               atConnect:
                  begin
                  SessionItem.Connected:=True;
                  SessionItem.Encrypted:=NewEncrypted;
                  SessionItem.UserName:='';
                  SessionItem.Address:=NewAddress;
                  SessionItem.CreatedOn:=NewCreatedOn;
                  SessionsList.Add(SessionItem);
                  Inc(TotalSessions);
                  Inc(TotalConnectedSessions);
                  if Visible then
                     begin
                     SessionsListView.Items.Count:=TotalSessions;
                     SessionsListView.UpdateItems(TotalSessions-1,TotalSessions-1);
                     UpdateSessionInfo;
                     end;
                  end;
               atDisconnect:
                  begin
                  SessionItem.Connected:=False;
                  SessionItem.Address:=NewAddress;
                  Dec(TotalConnectedSessions);
                  if Visible then
                     begin
                     ItemPos:=SessionsList.IndexOf(SessionItem);
                     if (ItemPos <> -1) then
                        SessionsListView.UpdateItems(ItemPos,ItemPos);
                     UpdateSessionInfo;
                     end;
                  end;
               atReconnect:
                  begin
                  SessionItem.Connected:=True;
                  SessionItem.Encrypted:=NewEncrypted;
                  SessionItem.Address:=NewAddress;
                  Inc(TotalConnectedSessions);
                  if Visible then
                     begin
                     ItemPos:=SessionsList.IndexOf(SessionItem);
                     if (ItemPos <> -1) then
                        SessionsListView.UpdateItems(ItemPos,ItemPos);
                     UpdateSessionInfo;
                     end;
                  end;
               atLogin:
                  begin
                  SessionItem.UserName:=NewUserName;
                  if Visible then
                     begin
                     ItemPos:=SessionsList.IndexOf(SessionItem);
                     if (ItemPos <> -1) then
                        SessionsListView.UpdateItems(ItemPos,ItemPos);
                     end;
                  end;
               atLogout:
                  begin
                  ItemPos:=SessionsList.IndexOf(SessionItem);
                  if (ItemPos <> -1) then
                     begin
                     Dec(TotalSessions);
                     if SessionItem.Connected then
                        Dec(TotalConnectedSessions);
                     SessionsList.Delete(ItemPos);
                     if Visible then
                        begin
                        SessionsListView.UpdateItems(ItemPos,TotalSessions);
                        UpdateSessionInfo;
                        end;
                     end;
                  end;
               end;
            end;
         DisplayQueue.Delete(0);
         end;
   finally
      DisplayQueueSection.Leave;
   end;
end;

procedure TMainForm.AddToDisplayQueue(Value: TSessionDisplayItem);
begin
   DisplayQueueSection.Enter;
   try
      DisplayQueue.Add(Value);
   finally
      DisplayQueueSection.Leave;
      Application.ProcessMessages;
   end;
end;

procedure TMainForm.ServerEngineServerConnect(Sender: TObject;
  IsEncrypted: Boolean; const ConnectAddress: String;
  var UserData: TObject);
var
   DisplayItem: TSessionDisplayItem;
begin
   UserData:=nil;
   if NoUI then Exit;
   UserData:=TSessionItem.Create;
   DisplayItem:=TSessionDisplayItem.Create;
   with DisplayItem do
      begin
      ActionType:=atConnect;
      NewEncrypted:=IsEncrypted;
      NewUserName:='';
      NewAddress:=ConnectAddress;
      NewCreatedOn:=Now;
      SessionItem:=TSessionItem(UserData);
      end;
   AddToDisplayQueue(DisplayItem);
end;

procedure TMainForm.ServerEngineServerDisconnect(Sender, UserData: TObject;
  const LastConnectAddress: String);
var
   DisplayItem: TSessionDisplayItem;
begin
   if NoUI then Exit;
   if (UserData <> nil) then
      begin
      DisplayItem:=TSessionDisplayItem.Create;
      with DisplayItem do
         begin
         ActionType:=atDisconnect;
         NewAddress:=LastConnectAddress;
         SessionItem:=TSessionItem(UserData);
         end;
      AddToDisplayQueue(DisplayItem);
      end;
end;

procedure TMainForm.ServerEngineServerReconnect(Sender: TObject;
  IsEncrypted: Boolean; const ConnectAddress: String; UserData: TObject);
var
   DisplayItem: TSessionDisplayItem;
begin
   if NoUI then Exit;
   if (UserData <> nil) then
      begin
      DisplayItem:=TSessionDisplayItem.Create;
      with DisplayItem do
         begin
         ActionType:=atReconnect;
         NewEncrypted:=IsEncrypted;
         NewAddress:=ConnectAddress;
         SessionItem:=TSessionItem(UserData);
         end;
      AddToDisplayQueue(DisplayItem);
      end;
end;

procedure TMainForm.ServerEngineServerLogin(Sender: TObject;
  const UserName: String; UserData: TObject);
var
   DisplayItem: TSessionDisplayItem;
begin
   if NoUI then Exit;
   if (UserData <> nil) then
      begin
      DisplayItem:=TSessionDisplayItem.Create;
      with DisplayItem do
         begin
         ActionType:=atLogin;
         NewUserName:=UserName;
         SessionItem:=TSessionItem(UserData);
         end;
      AddToDisplayQueue(DisplayItem);
      end;
end;

procedure TMainForm.ServerEngineServerLogout(Sender: TObject;
  var UserData: TObject);
var
   DisplayItem: TSessionDisplayItem;
begin
   if NoUI then Exit;
   if (UserData <> nil) then
      begin
      DisplayItem:=TSessionDisplayItem.Create;
      with DisplayItem do
         begin
         ActionType:=atLogout;
         SessionItem:=TSessionItem(UserData);
         end;
      AddToDisplayQueue(DisplayItem);
      end;
end;

procedure TMainForm.ServerEngineServerStart(Sender: TObject);
begin
   StartButton.Enabled:=False;
   StartItem.Enabled:=False;
   StopButton.Enabled:=True;
   StopItem.Enabled:=True;
   IconHint:=GetStartedHint;
   UpdateTrayIcon;
   UpdateVariableSystemInfo;
end;

procedure TMainForm.ServerEngineServerStop(Sender: TObject);
begin
   StartButton.Enabled:=True;
   StartItem.Enabled:=True;
   StopButton.Enabled:=False;
   StopItem.Enabled:=False;
   IconHint:=GetStoppedHint;
   UpdateTrayIcon;
   UpdateVariableSystemInfo;
end;

procedure TMainForm.ServerEngineServerLogEvent(Sender: TObject;
  LogRecord: TLogRecord);
begin
   FileSeek(LogFileHandle,0,2);
   FileWrite(LogFileHandle,LogRecord,SizeOf(TLogRecord));
end;

procedure TMainForm.ServerEngineServerLogCount(Sender: TObject;
  var LogCount: Integer);
var
   TotalLogSize: Integer;
begin
   TotalLogSize:=FileSeek(LogFileHandle,0,2);
   LogCount:=(TotalLogSize div SizeOf(TLogRecord));
end;

procedure TMainForm.ServerEngineServerLogRecord(Sender: TObject;
  Number: Integer; var LogRecord: TLogRecord);
begin
   FileSeek(LogFileHandle,((Number-1)*SizeOf(TLogRecord)),0);
   FileRead(LogFileHandle,LogRecord,SizeOf(TLogRecord));
end;

procedure TMainForm.UpdateListItem(SessionItem: TSessionItem);
begin
   with SessionItem do
      begin
      if (UserName <> '') then
         ListItem.Caption:=UserName
      else
         ListItem.Caption:='N/A';
      if Connected then
         begin
         if Encrypted then
            ListItem.ImageIndex:=1
         else
            ListItem.ImageIndex:=0;
         ListItem.SubItems.Add(Address);
         end
      else
         begin
         ListItem.ImageIndex:=2;
         ListItem.SubItems.Add('Disconnected ('+Address+')');
         end;
      ListItem.SubItems.Add(DateTimeToStr(CreatedOn));
      end;
end;

procedure TMainForm.SessionsListViewData(Sender: TObject; Item: TListItem);
begin
   if (Item.Index >= TotalSessions) then
      Exit;
   TSessionItem(SessionsList[Item.Index]).ListItem:=Item;
   UpdateListItem(TSessionItem(SessionsList[Item.Index]));
end;

end.

