{************************************************************************
*
*      DBISAM server functionality and objects source
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

{$I dbisamcp.inc}

unit dbisamsv;

interface

uses SysUtils,Classes,

{$I dbisamvr.inc}

Windows, Messages, WinSock,
ScktComp,

dbisamtb, dbisamen, dbisamsq, dbisamlb, dbisamcr, dbisamcn;

type

   { Hack to allow binding of server to specific IP address }

   TBindServerSocket = class(TServerSocket)
      private
      public
         property Address;
      end;

   { Allows waits for data without using TWinSocketStream and
     works around a bug in Kylix sockets.pas WaitForData where it
     can return False on disconnects }

   TDataClientSocket = class(TServerClientWinSocket)
      public
         function WaitForData(Timeout: Integer): Boolean;
      end;

   TDataServer = class;
   TConfiguration = class;
   TConfigUser = class;
   TConfigDatabase = class;
   TConfigDatabaseUser = class;
   TConfigProcedure = class;
   TConfigProcedureUser = class;

   TConfigEvent = class(TObject)
      private
         FConfiguration: TConfiguration;
         FDescription: string;
         FRunType: Byte;
         FStartDate: TDateTime;
         FEndDate: TDateTime;
         FStartTime: TDateTime;
         FEndTime: TDateTime;
         FInterval: Word;
         FDays: TConfigDays;
         FDayOfWeek: Byte;
         FDayOfMonth: Byte;
         FMonths: TConfigMonths;
         FLastRun: TDateTime;
         FInProgress: Boolean;
         FStartRun: TDateTime;
      public
         constructor Create(Owner: TConfiguration);
         destructor Destroy; override;
         property Description: string read FDescription write FDescription;
         property RunType: Byte read FRunType write FRunType;
         property StartDate: TDateTime read FStartDate write FStartDate;
         property EndDate: TDateTime read FEndDate write FEndDate;
         property StartTime: TDateTime read FStartTime write FStartTime;
         property EndTime: TDateTime read FEndTime write FEndTime;
         property Interval: Word read FInterval write FInterval;
         property DayOfWeek: Byte read FDayOfWeek write FDayOfWeek;
         property DayOfMonth: Byte read FDayOfMonth write FDayOfMonth;
         property InProgress: Boolean read FInProgress write FInProgress;
         property StartRun: TDateTime read FStartRun write FStartRun;
         property LastRun: TDateTime read FLastRun write FLastRun;
         procedure ReadFromBuffer(Version: Currency);
         procedure WriteToBuffer(Version: Currency);
      end;

   TConfigDatabaseUser = class(TObject)
      private
         FDatabase: TConfigDatabase;
         FRights: Integer;
      public
         constructor Create(Owner: TConfigDatabase);
         destructor Destroy; override;
         property Database: TConfigDatabase read FDatabase;
         property Rights: Integer read FRights write FRights;
         procedure ReadFromFile;
         procedure ReadFromBuffer(Version: Currency);
         procedure WriteToBuffer(Version: Currency);
      end;

   TConfigDatabase = class(TObject)
      private
         FConfiguration: TConfiguration;
         FPath: string;
         FDescription: string;
         FAuthorizedUsers: TStringList;
         procedure FreeAuthorizedUsers;
      public
         constructor Create(Owner: TConfiguration);
         destructor Destroy; override;
         property Configuration: TConfiguration read FConfiguration;
         property Path: string read FPath write FPath;
         property Description: string read FDescription write FDescription;
         property AuthorizedUsers: TStringList read FAuthorizedUsers;
         procedure ReadFromFile;
         procedure ReadFromBuffer(Version: Currency);
         procedure WriteToBuffer(Version: Currency);
         function Authorize(const UserName: string): Integer;
         function AddUser(const AuthorizedUser: string;
                          RightsToAssign: Integer): Boolean;
         function ModifyUser(const AuthorizedUser: string;
                             RightsToAssign: Integer): Boolean;
         function DeleteUser(const AuthorizedUser: string): Boolean;
         function GetUser(const AuthorizedUser: string;
                          var UserRights: Integer): Boolean;
      end;

   TConfigProcedureUser = class(TObject)
      private
         FProcedure: TConfigProcedure;
         FRights: Integer;
      public
         constructor Create(Owner: TConfigProcedure);
         destructor Destroy; override;
         property AProcedure: TConfigProcedure read FProcedure;
         property Rights: Integer read FRights write FRights;
         procedure ReadFromBuffer(Version: Currency);
         procedure WriteToBuffer(Version: Currency);
      end;

   TConfigProcedure = class(TObject)
      private
         FConfiguration: TConfiguration;
         FPath: string;
         FDescription: string;
         FAuthorizedUsers: TStringList;
         procedure FreeAuthorizedUsers;
      public
         constructor Create(Owner: TConfiguration);
         destructor Destroy; override;
         property Configuration: TConfiguration read FConfiguration;
         property Path: string read FPath write FPath;
         property Description: string read FDescription write FDescription;
         property AuthorizedUsers: TStringList read FAuthorizedUsers;
         procedure ReadFromBuffer(Version: Currency);
         procedure WriteToBuffer(Version: Currency);
         function Authorize(const UserName: string): Integer;
         function AddUser(const AuthorizedUser: string;
                          RightsToAssign: Integer): Boolean;
         function ModifyUser(const AuthorizedUser: string;
                             RightsToAssign: Integer): Boolean;
         function DeleteUser(const AuthorizedUser: string): Boolean;
         function GetUser(const AuthorizedUser: string;
                          var UserRights: Integer): Boolean;
      end;

   TConfigUser = class(TObject)
      private
         FConfiguration: TConfiguration;
         FFullName: string;
         FPassword: string;
         FDescription: string;
         FAdministrator: Boolean;
         FMaxConnections: Word;
         FCurConnections: Word;
      public
         constructor Create(Owner: TConfiguration);
         destructor Destroy; override;
         property Configuration: TConfiguration read FConfiguration;
         property FullName: string read FFullName write FFullName;
         property Password: string read FPassword write FPassword;
         property Description: string read FDescription write FDescription;
         property Administrator: Boolean read FAdministrator write FAdministrator;
         property MaxConnections: Word read FMaxConnections write FMaxConnections;
         property CurConnections: Word read FCurConnections write FCurConnections;
         procedure ReadFromFile;
         procedure ReadFromBuffer(Version: Currency);
         procedure WriteToBuffer(Version: Currency);
      end;

   TConfiguration = class(TObject)
      private
         FDataServer: TDataServer;
         FSection: Pointer;
         FPassword: string;
         FDigest: TMD5Digest;
         FData: Pointer;
         FDataSize: Integer;
         FConfigFile: TEngineFile;
         FConfigBuffer: PChar;
         FConfigBufferPos: Integer;
         FConfigBufferSize: Integer;
         FEngineVersion: Currency;
         FAuthorizedAddresses: TStrings;
         FBlockedAddresses: TStrings;
         FDenyLogins: Boolean;
         FMaxConnections: Word;
         FTimeout: Word;
         FDeadSessionInterval: Word;
         FDeadSessionExpires: Word;
         FMaxDeadSessions: Word;
         FTemporaryDirectory: string;
         FUsers: TStringList;
         FDatabases: TStringList;
         FProcedures: TStringList;
         FEvents: TStringList;
         FIsDirty: Boolean;
         procedure FreeDatabases;
         procedure FreeProcedures;
         procedure FreeUsers;
         procedure FreeEvents;
         procedure FreeData;
         procedure SetPassword(const Value: string);
      public
         constructor Create(Owner: TDataServer);
         destructor Destroy; override;
         property ConfigFile: TEngineFile read FConfigFile;
         property Password: string read FPassword write SetPassword;
         property EngineVersion: Currency read FEngineVersion;
         property DenyLogins: Boolean read FDenyLogins;
         property MaxConnections: Word read FMaxConnections;
         property Timeout: Word read FTimeout;
         property DeadSessionInterval: Word read FDeadSessionInterval;
         property DeadSessionExpires: Word read FDeadSessionExpires;
         property MaxDeadSessions: Word read FMaxDeadSessions;
         property TemporaryDirectory: string read FTemporaryDirectory;
         property IsDirty: Boolean read FIsDirty;
         function CheckIPAddress(const RemoteIPAddress: string): Boolean;
         function CheckForAdministrator(const UserName: string): Boolean;
         function GetAdminRights: Integer;
         function LoginUser(const UserToLogin: string;
                            const PasswordToUse: string): Boolean;
         function CheckUserMaxConnections(const UserName: string): Boolean;
         procedure DisconnectUser(const UserName: string);
         procedure GetUserList(List: TStrings);
         procedure GetDatabaseList(const UserName: string; CheckForAdmin: Boolean;
                                   List: TStrings);
         procedure GetAllDatabaseList(List: TStrings);
         function GetDatabaseUserList(const DatabaseName: string; List: TStrings): Boolean;
         procedure GetProcedureList(const UserName: string; CheckForAdmin: Boolean;
                                    List: TStrings);
         procedure GetAllProcedureList(List: TStrings);
         function GetProcedureUserList(const ProcedureName: string; List: TStrings): Boolean;
         procedure GetEventList(List: TStrings);
         function CheckForDatabase(const UserName: string;
                                   const DatabaseName: string;
                                   var DataPath: string): Boolean;
         function GetDatabaseRights(const UserName: string;
                                    const DatabaseName: string): Integer;
         function CheckForProcedure(const UserName: string;
                                    const ProcedureName: string): Boolean;
         function AddUser(const UserName: string;
                          const UserPassword: string;
                          const UserDescription: string;
                          IsAdministrator: Boolean;
                          MaxConnect: Word): Boolean;
         function ModifyUser(const UserName: string;
                             const UserPassword: string;
                             const UserDescription: string;
                             IsAdministrator: Boolean;
                             MaxConnect: Word): Boolean;
         function ModifyUserPassword(const UserName: string;
                                     const UserPassword: string): Boolean;
         function DeleteUser(const UserName: string): Boolean;
         function GetUser(const UserName: string;
                          var UserPassword: string;
                          var UserDescription: string;
                          var IsAdministrator: Boolean;
                          var MaxConnect: Word): Boolean;
         function AddDatabase(const DatabaseName: string;
                              const DatabaseDescription: string;
                              const DataPath: string;
                              var DirectoryError: Boolean): Boolean;
         function ModifyDatabase(const DatabaseName: string;
                                 const DatabaseDescription: string;
                                 const DataPath: string;
                                 var DirectoryError: Boolean): Boolean;
         function DeleteDatabase(const DatabaseName: string): Boolean;
         function GetDatabase(const DatabaseName: string;
                              var DatabaseDescription: string;
                              var DataPath: string): Boolean;
         function AddDatabaseUser(const DatabaseName: string;
                                  const AuthorizedUser: string;
                                  RightsToAssign: Integer): Boolean;
         function ModifyDatabaseUser(const DatabaseName: string;
                                     const AuthorizedUser: string;
                                     RightsToAssign: Integer): Boolean;
         function DeleteDatabaseUser(const DatabaseName: string;
                                     const AuthorizedUser: string): Boolean;
         function GetDatabaseUser(const DatabaseName: string;
                                  const AuthorizedUser: string;
                                  var UserRights: Integer): Boolean;
         function AddProcedure(const ProcedureName: string;
                               const ProcedureDescription: string): Boolean;
         function ModifyProcedure(const ProcedureName: string;
                                  const ProcedureDescription: string): Boolean;
         function DeleteProcedure(const ProcedureName: string): Boolean;
         function GetProcedure(const ProcedureName: string;
                               var ProcedureDescription: string): Boolean;
         function AddProcedureUser(const ProcedureName: string;
                                   const AuthorizedUser: string;
                                   RightsToAssign: Integer): Boolean;
         function ModifyProcedureUser(const ProcedureName: string;
                                      const AuthorizedUser: string;
                                      RightsToAssign: Integer): Boolean;
         function DeleteProcedureUser(const ProcedureName: string;
                                      const AuthorizedUser: string): Boolean;
         function GetProcedureUser(const ProcedureName: string;
                                   const AuthorizedUser: string;
                                   var UserRights: Integer): Boolean;
         function AddEvent(const EventName: string;
                           const EventDescription: string;
                           EventRunType: Byte;
                           EventStartDate: TDateTime;
                           EventEndDate: TDateTime;
                           EventStartTime: TDateTime;
                           EventEndTime: TDateTime;
                           EventInterval: Word;
                           EventDays: TConfigDays;
                           EventDayOfMonth: Byte;
                           EventDayOfWeek: Byte;
                           EventMonths: TConfigMonths): Boolean;
         function ModifyEvent(const EventName: string;
                              const EventDescription: string;
                              EventRunType: Byte;
                              EventStartDate: TDateTime;
                              EventEndDate: TDateTime;
                              EventStartTime: TDateTime;
                              EventEndTime: TDateTime;
                              EventInterval: Word;
                              EventDays: TConfigDays;
                              EventDayOfMonth: Byte;
                              EventDayOfWeek: Byte;
                              EventMonths: TConfigMonths): Boolean;
         function DeleteEvent(const EventName: string): Boolean;
         function GetEvent(const EventName: string;
                           var EventDescription: string;
                           var EventRunType: Byte;
                           var EventStartDate: TDateTime;
                           var EventEndDate: TDateTime;
                           var EventStartTime: TDateTime;
                           var EventEndTime: TDateTime;
                           var EventInterval: Word;
                           var EventDays: TConfigDays;
                           var EventDayOfMonth: Byte;
                           var EventDayOfWeek: Byte;
                           var EventMonths: TConfigMonths;
                           var EventLastRun: TDateTime;
                           var EventInProgress: Boolean): Boolean;
         function ModifyEventInProgress(const EventName: string;
                                        EventInProgress: Boolean): Boolean;
         function ModifyEventLastRun(const EventName: string): Boolean;
         procedure GetServer(var DenyNewLogins: Boolean; var MaxConnect: Word;
                             var ConnectTimeout: Word; var DeadInterval: Word;
                             var DeadExpires: Word; var MaxDead: Word;
                             var TempDirectory: string;
                             AuthAddresses: TStrings; BlockAddresses: TStrings);
         procedure ModifyServer(DenyNewLogins: Boolean; MaxConnect: Word;
                                ConnectTimeout: Word; DeadInterval: Word;
                                DeadExpires: Word; MaxDead: Word;
                                const TempDirectory: string;
                                AuthAddresses: TStrings; BlockAddresses: TStrings);
         procedure SetDefault;
         function Read(var Buffer; NumBytes: Integer): Integer;
         function Write(const Buffer; NumBytes: Integer): Integer;
         procedure ReadFromFile;
         procedure CheckTemporaryDirectory;
         procedure WriteToFile;
      end;

   TBaseThread = class;

   TBaseSession = class(TSafeObject)
      private
         FDataServer: TDataServer;
         FCreated: TDateTime;
         FLastConnected: TDateTime;
         FThread: TBaseThread;
         FUserName: string;
         FUserAddress: string;
         FLastAddress: string;
         FUserProcess: string;
         FUserThread: Integer;
         FIsEncrypted: Boolean;
         function GetConnected: Boolean;
      public
         constructor Create(Owner: TDataServer); reintroduce; overload; virtual;
         destructor Destroy; override;
         property Connected: Boolean read GetConnected;
         property Created: TDateTime read FCreated;
         property LastConnected: TDateTime read FLastConnected;
         property IsEncrypted: Boolean read FIsEncrypted write FIsEncrypted;
         property UserName: string read FUserName write FUserName;
         property UserAddress: string read FUserAddress write FUserAddress;
         property LastAddress: string read FLastAddress write FLastAddress;
         property UserProcess: string read FUserProcess write FUserProcess;
         property UserThread: Integer read FUserThread write FUserThread;
         property Thread: TBaseThread read FThread;
         procedure Connect(ConnectThread: TBaseThread);
         procedure Disconnect;
         procedure DisplayConnect; virtual;
         procedure DisplayReconnect; virtual;
         procedure DisplayLogin; virtual;
         procedure DisplayLogout; virtual;
         procedure DisplayDisconnect; virtual;
      end;

   TBaseThread = class(TServerClientThread)
      private
         FDataServer: TDataServer;
         FSession: TBaseSession;
         FInitializingConnection: Boolean;
         FCloseAfterSend: Boolean;
         FClientVersion: Currency;
         FClientEncrypted: Boolean;
         FClientEncryptionData: Pointer;
         FClientEncryptionDataSize: Integer;
         FClientCompression: Byte;
         FClientAddress: string;
         FClientProcess: string;
         FClientThread: Integer;
         FRequestHeader: TRequestHeader;
         FReceiveBuffer: PChar;
         FReceiveBufferSize: Integer;
         FReplyHeader: TReplyHeader;
         FSendBuffer: PChar;
         FSendBufferSize: Integer;
         FSaveReplyHeader: TReplyHeader;
         FSaveSendBuffer: PChar;
         FSaveSendBufferSize: Integer;
         FPackPos: Integer;
         FSavePackPos: Integer;
         FUnpackPos: Integer;
         procedure BeginUnpack;
         function Unpack(var Buffer): Integer;
         procedure BeginPack;
         procedure Pack(const Buffer; BufferSize: Integer);
         procedure EndPack;
         procedure PackException(E: Exception);
         procedure LogException(E: Exception);
         procedure ProcessException(E: Exception);
         procedure ResizeReceiveBuffer(Value: Integer; ShrinkBuffer: Boolean=False);
         procedure ResizeSendBuffer(Value: Integer; ShrinkBuffer: Boolean=False);
         procedure ResizeSaveSendBuffer(Value: Integer);
         procedure SaveReply;
         procedure RestoreReply;
         procedure DoInvalidRequest;
         function CheckSession: Boolean;
         function CheckSessionUser: Boolean;
         function WaitForData(TimeOut: Integer): Boolean;
         function ReceiveBuffer(var Buffer; Count: Integer): Integer;
         function SendBuffer(var Buffer; Count: Integer): Integer;
         function GetSessionUserName: string;
      protected
         procedure ClientExecute; override;
      public
         constructor Create(Owner: TDataServer; Socket: TServerClientWinSocket); virtual;
         destructor Destroy; override;
         property Session: TBaseSession read FSession write FSession;
         property SessionUserName: string read GetSessionUserName;
         property ClientVersion: Currency read FClientVersion;
         property ClientEncrypted: Boolean read FClientEncrypted;
         property ClientCompression: Byte read FClientCompression;
         property ClientAddress: string read FClientAddress;
         property ClientProcess: string read FClientProcess;
         property ClientThread: Integer read FClientThread;
         procedure Initialize; virtual;
         procedure Reset; virtual;
         procedure CloseConnection;
         function Receive: Byte;
         procedure ProcessReceive;
         procedure HandleReceive(RequestCode: Word); virtual;
         function ReceiveCallback: Byte;
         function Send: Boolean;
      end;

   TServerSession = class(TBaseSession)
      private
         FDataSession: TDataSession;
         FUserData: TObject;
      public
         constructor Create(Owner: TDataServer); override;
         destructor Destroy; override;
         property DataSession: TDataSession read FDataSession;
         procedure DisplayConnect; override;
         procedure DisplayReconnect; override;
         procedure DisplayLogin; override;
         procedure DisplayLogout; override;
         procedure DisplayDisconnect; override;
      end;

   TServerThread = class(TBaseThread)
      private
         procedure CheckRead(const UserName: string;
                             DataDirectory: TDataDirectory);
         procedure CheckInsert(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckUpdate(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckDelete(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckCreate(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckAlter(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckDrop(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckRename(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckBackup(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckRestore(const UserName: string;
                               DataDirectory: TDataDirectory);
         procedure CheckMaintain(const UserName: string;
                                 DataDirectory: TDataDirectory);
         function DoConnectionParams: Boolean;
         function DoReconnect: Boolean;
         procedure DoLogin;
         procedure DoLogout;
         procedure DoSessionParams;
         { Version 5 }
         procedure DeleteMemoryTables(const DirMask: string;
                                      FilesList: TStrings);
         procedure DoRemoveAllMemoryTables;
         { Version 5 }
         procedure DoModifyUserPassword;
         procedure DoOpenDataDirectory;
         procedure DoGetTableNames;
         procedure DoCloseDataDirectory;
         procedure DoBackup;
         procedure DoBackupInfo;
         procedure DoRestore;
         procedure DoAddPassword;
         procedure DoDeletePassword;
         procedure DoDeleteAllPasswords;
         procedure DoGetDatabaseNames;
         procedure DoGetProcedureNames;
         procedure DoGetDatabaseUser;
         procedure DoStartTransaction;
         procedure DoCommitTransaction;
         procedure DoRollbackTransaction;
         procedure DoCreateCursor;
         function ProcedureProgressCallback(const Status: string;
                                            PercentDone: Word;
                                            var Abort: Boolean): Boolean;
         function PasswordCallback: Boolean;
         function GetPathCallback(const DataDirectoryName: string;
                                  var Path: string): Boolean;
         function GetRightsCallback(const DataDirectoryName: string;
                                    var Rights: Integer): Boolean;
         function CheckRightsCallback(DataDirectory: TObject;
                                      RightToCheck: Byte): Boolean;
         function SteppedProgressCallback(const RepairStep: string;
                                          PercentDone: Word): Boolean;
         function LogCallback(const LogMessage: string): Boolean;
         function DataLostCallback(Cause: Byte;
                                   const ContextInfo: string;
                                   var Continue: Boolean;
                                   var StopAsking: Boolean): Boolean;
         function ProgressCallback(PercentDone: Word): Boolean;
         procedure DoOpenCursor;
         procedure DoTextIndexParams;
         procedure PackTableInfo(Cursor: TDataCursor);
         procedure PackCursorInfo(Cursor: TDataCursor);
         procedure PackResultSetInfo(Cursor: TDataCursor);
         procedure PackResultSetFields(Cursor: TDataCursor);
         procedure DoCloseCursor;
         procedure DoFreeCursor;
         procedure DoSetIndexName;
         procedure DoSetToBegin;
         procedure DoSetToEnd;
         procedure DoSetToRecordNumber;
         procedure DoSetToDataCursor;
         procedure DoGetCurrentRecord;
         function PackBlobBuffers(DataCursor: TDataCursor): Boolean;
         procedure DoCloneCurrentRecord;
         procedure DoGetNextRecord;
         procedure DoGetPriorRecord;
         procedure DoReadFirstRecordBlock;
         procedure DoReadNextRecordBlock;
         procedure DoReadPriorRecordBlock;
         procedure DoReadLastRecordBlock;
         procedure DoReadAbsoluteRecordBlock;
         procedure DoReadBookmarkRecordBlock;
         procedure DoRefreshRecordBlock;
         procedure DoAddRecordBlock;
         procedure DoUpdateRecordBlock;
         procedure DoDeleteRecordBlock;
         procedure UnpackBlobBuffers(RecordBuffer: PChar);
         procedure DoAppendRecord;
         procedure DoModifyRecord;
         procedure DoCancelRecord;
         procedure DoDeleteRecord;
         procedure DoFlushBuffers;
         procedure DoFlushOSBuffers;
         procedure DoRefresh;
         procedure DoSetToBookmark;
         procedure DoFind;
         procedure DoLocate;
         procedure DoSetRange;
         procedure DoResetRange;
         procedure DoLockTable;
         procedure DoUnlockTable;
         procedure DoUnlockRecord;
         procedure DoLockSemaphore;
         procedure DoUnlockSemaphore;
         procedure DoGetDataHeader;
         procedure DoTableExists;
         procedure DoTableSize;
         procedure PackTextIndexParams(DataCursor: TDataCursor);
         procedure UnpackTextIndexParams(StopWords: TStrings;
                                         var StopWordsNil: Boolean;
                                         var SpaceChars: TCharSet;
                                         var IncludeChars: TCharSet);
         procedure DoCreateTable;
         procedure DoAlterTable;
         procedure DoRepairTable;
         procedure DoUpgradeTable;
         procedure DoEmptyTable;
         procedure DoDeleteTable;
         procedure DoRenameTable;
         procedure DoOptimizeTable;
         procedure DoCopyTable;
         procedure DoImportTable;
         procedure DoExportTable;
         procedure DoAddPrimaryIndex;
         procedure DoAddSecondaryIndex;
         procedure DoDeleteIndex;
         procedure DoDeleteAllIndexes;
         procedure DoOpenBlob;
         procedure DoFreeBlob;
         procedure DoFreeAllBlobs;
         procedure DoGetBlob;
         procedure DoPutBlob;
         procedure DoTruncateBlob;
         procedure DoGetBlobSize;
         procedure DoAddExprFilter;
         procedure DoAddCallbackFilter;
         function FilterCallback(RecordSize: Integer; RecordBuffer: Pointer;
                                 RecordNum: Integer): Boolean;
         procedure DoDropFilter;
         procedure DoActivateFilter;
         procedure DoDeactivateFilter;
         procedure DoCreateStatement;
         procedure DoPrepareStatement;
         function AbortProgressCallback(PercentDone: Word;
                                        var Abort: Boolean): Boolean;
         procedure PackParameters(ParamCount: Word;
                                  const ParamDefinitions: array of pFieldDefinition;
                                  RecordBuffer: PChar);
         procedure UnpackParameters(out OutParamCount: Word;
                                    out OutParamDefinitions: array of pFieldDefinition;
                                    out OutRecordBuffer: PChar;
                                    out OutBlobCount: Word;
                                    out OutBlobBuffers: array of PChar);
         procedure DoExecuteStatement;
         procedure DoFreeStatement;
         procedure DoSaveResultToTable;
         procedure DoLoadFromStream;
         function CacheErrorCallback(RecordNumber: Integer;
                                     RecordSize: Word;
                                     RecordBuffer: PChar;
                                     OldRecordBuffer: PChar;
                                     E: Exception;
                                     OperationType: Byte;
                                     Retrying: Boolean;
                                     var Response: Byte): Boolean;
         procedure DoSaveToStream;
         procedure DoGetDateTime;
         procedure DoGetUTCDateTime;
         procedure DoGetServerName;
         procedure DoGetServerDescription;
         procedure DoServerProcedure;
      public
         procedure Reset; override;
         procedure HandleReceive(RequestCode: Word); override;
      end;

   TAdminSession = class(TBaseSession);

   TAdminThread = class(TBaseThread)
      private
         function DoConnectionParams: Boolean;
         function DoReconnect: Boolean;
         procedure DoLogin;
         procedure DoLogout;
         procedure DoSessionParams;
         procedure DoGetDatabaseNames;
         procedure DoGetProcedureNames;
         procedure DoAddUser;
         procedure DoModifyUser;
         procedure DoDeleteUser;
         procedure DoGetUser;
         procedure DoGetUserNames;
         procedure DoAddDatabase;
         procedure DoModifyDatabase;
         procedure DoDeleteDatabase;
         procedure DoGetDatabase;
         procedure DoAddDatabaseUser;
         procedure DoModifyDatabaseUser;
         procedure DoDeleteDatabaseUser;
         procedure DoGetDatabaseUser;
         procedure DoGetDatabaseUserNames;
         procedure DoAddProcedure;
         procedure DoModifyProcedure;
         procedure DoDeleteProcedure;
         procedure DoGetProcedure;
         procedure DoAddProcedureUser;
         procedure DoModifyProcedureUser;
         procedure DoDeleteProcedureUser;
         procedure DoGetProcedureUser;
         procedure DoGetProcedureUserNames;
         procedure DoAddEvent;
         procedure DoModifyEvent;
         procedure DoDeleteEvent;
         procedure DoGetEvent;
         procedure DoGetEventNames;
         procedure DoModifyServer;
         procedure DoGetServer;
         procedure DoGetLogCount;
         procedure DoGetLogRecord;
         procedure DoStartServer;
         procedure DoStopServer;
         procedure DoGetDateTime;
         procedure DoGetUTCDateTime;
         procedure DoGetUpTime;
         procedure DoGetMemoryUsage;
         procedure DoGetServerName;
         procedure DoGetServerDescription;
         procedure DoGetMainAddress;
         procedure DoGetMainPort;
         procedure DoGetAdminAddress;
         procedure DoGetAdminPort;
         procedure DoGetSessionCount;
         procedure DoGetConnectedSessionCount;
         procedure DoGetSessionInfo;
         procedure DoDisconnectSession;
         procedure DoRemoveSession;
      public
         procedure Reset; override;
         procedure HandleReceive(RequestCode: Word); override;
      end;

   TScheduledEventThread = class(TThread)
      private
         FDataServer: TDataServer;
         FEventName: string;
      protected
         procedure Execute; override;
      public
         property DataServer: TDataServer read FDataServer write FDataServer;
         property EventName: string read FEventName write FEventName;
      end;

   TDataServer = class(TObject)
      private
         FName: string;
         FDescription: string;
         FConfigFileName: string;
         FConfigPassword: string;
         FConfiguration: TConfiguration;
         FLicensedConnections: Word;
         FMainAddress: string;
         FMainPort: Integer;
         FMainThreadCacheSize: Integer;
         FAdminAddress: string;
         FAdminPort: Integer;
         FAdminThreadCacheSize: Integer;
         FMainServer: TBindServerSocket;
         FAdminServer: TBindServerSocket;
         FEncryptedOnly: Boolean;
         FEncryptionPassword: string;
         FEncryptionDigest: TMD5Digest;
         FEncryptionData: Pointer;
         FEncryptionDataSize: Integer;
         FDeadSessionTimer: TThreadTimer;
         FScheduledEventTimer: TThreadTimer;
         FStartTime: TDateTime;
         FStopped: Boolean;
         FServerSessions: TList;
         FServerSessionSection: Pointer;
         FTotalSessions: Integer;
         FTotalConnectedSessions: Integer;
         FAdminSessions: TList;
         FAdminSessionSection: Pointer;
         FLogSection: Pointer;
         procedure DeadSessionTimerTimer(Sender: TObject);
         procedure ScheduledEventTimerTimer(Sender: TObject);
         procedure MainServerGetThread(Sender: TObject;
                                       ClientSocket: TServerClientWinSocket;
                                       var SocketThread: TServerClientThread);
         procedure AdminServerGetThread(Sender: TObject;
                                        ClientSocket: TServerClientWinSocket;
                                        var SocketThread: TServerClientThread);
         procedure MainServerGetSocket(Sender: TObject; Socket: TSocket;
                                       var ClientSocket: TServerClientWinSocket);
         procedure AdminServerGetSocket(Sender: TObject; Socket: TSocket;
                                        var ClientSocket: TServerClientWinSocket);
         procedure FreeAllServerSessions;
         procedure FreeAllAdminSessions;
         procedure CheckForDeadServerSessions;
         procedure CheckForScheduledEvents;
         procedure LaunchScheduledEvent(const NameOfEvent: string);
      public
         constructor Create(const ServerName: string;
                            const ServerDescription: string;
                            const ServerMainAddress: string;
                            ServerMainPort: Integer;
                            ServerMainThreadCacheSize: Integer;
                            const ServerAdminAddress: string;
                            ServerAdminPort: Integer;
                            ServerAdminThreadCacheSize: Integer;
                            ServerEncryptedOnly: Boolean;
                            const ServerEncryptionPassword: string;
                            const ServerConfigFileName: string;
                            const ServerConfigPassword: string;
                            ServerLicensedConnections: Word);
         destructor Destroy; override;
         property Name: string read FName;
         property Description: string read FDescription;
         property MainServer: TBindServerSocket read FMainServer;
         property MainAddress: string read FMainAddress;
         property MainPort: Integer read FMainPort;
         property MainThreadCacheSize: Integer read FMainThreadCacheSize;
         property AdminServer: TBindServerSocket read FAdminServer;
         property AdminAddress: string read FAdminAddress;
         property AdminPort: Integer read FAdminPort;
         property AdminThreadCacheSize: Integer read FAdminThreadCacheSize;
         property EncryptedOnly: Boolean read FEncryptedOnly;
         property EncryptionPassword: string read FEncryptionPassword;
         property EncryptionDigest: TMD5Digest read FEncryptionDigest;
         property EncryptionData: Pointer read FEncryptionData;
         property EncryptionDataSize: Integer read FEncryptionDataSize;
         property ConfigFileName: string read FConfigFileName;
         property ConfigPassword: string read FConfigPassword;
         property Configuration: TConfiguration read FConfiguration;
         property DeadSessionTimer: TThreadTimer read FDeadSessionTimer;
         property ScheduledEventTimer: TThreadTimer read FScheduledEventTimer;
         property LicensedConnections: Word read FLicensedConnections;
         function DisplayConnect(IsEncrypted: Boolean; const ConnectAddress: string): TObject;
         procedure DisplayReconnect(IsEncrypted: Boolean; const ConnectAddress: string;
                                     UserData: TObject);
         procedure DisplayLogin(const UserName: string; UserData: TObject);
         procedure DisplayLogout(var UserData: TObject);
         procedure DisplayDisconnect(UserData: TObject;
                                     const LastConnectAddress: string);
         function GetUTCDateTime: TDateTime;
         function GetUpTime: Int64;
         function GetMemoryUsage: double;
         procedure LogEvent(LogTime: TDateTime;
                            LogCategory: Byte;
                            LogEventType: Byte;
                            LogText: string;
                            SrvVersion: Currency;
                            CliVersion: Currency;
                            CliAddress: string;
                            CliEncrypted: Boolean;
                            CliUser: string;
                            CliRequest: Word;
                            CliThread: Integer;
                            CliSession: Integer);
         function GetLogCount: Integer;
         function GetLogRecord(Number: Integer): TDataLogRecord;
         function CheckMaxConnections: Boolean;
         function GetServerSessionCount: Integer;
         function GetServerConnectedSessionCount: Integer;
         procedure LockServerSessions;
         procedure UnlockServerSessions;
         procedure ConnectServerSession(SessionThread: TServerThread);
         procedure LoginServerSession(SessionToLogin: TServerSession;
                                      const User: string);
         function ReconnectServerSession(SessionThread: TServerThread;
                                         SessionToReconnect: TServerSession;
                                         var WaitForDisconnect: Boolean): Boolean;
         function DisconnectServerSession(SessionToDisconnect: TServerSession): Boolean;
         function RemoveServerSession(SessionToRemove: TServerSession): Boolean;
         function GetServerSessionInfo(SessionNum: Integer;
                                     var SessionID: Integer;
                                     var CreatedOn: TDateTime;
                                     var LastConnectedOn: TDateTime;
                                     var SessionUserName: string;
                                     var SessionUserAddress: string;
                                     var IsEncryptedSession: Boolean;
                                     var LastUserAddress: string): Boolean;
         procedure LockAdminSessions;
         procedure UnlockAdminSessions;
         procedure ConnectAdminSession(SessionThread: TAdminThread);
         procedure LoginAdminSession(SessionToLogin: TAdminSession;
                                     const User: string);
         function ReconnectAdminSession(SessionThread: TAdminThread;
                                        SessionToReconnect: TAdminSession;
                                        var WaitForDisconnect: Boolean): Boolean;
         function DisconnectAdminSession(SessionToDisconnect: TAdminSession): Boolean;
         function RemoveAdminSession(SessionToRemove: TAdminSession): Boolean;
         procedure StartAdminServer;
         procedure StopAdminServer;
         procedure StartMainServer;
         procedure StopMainServer;
      end;

procedure BaseSocketError(ErrorCode: Integer);

implementation

procedure BaseSocketError(ErrorCode: Integer);
begin
end;

{ TDataClientSocket }

function TDataClientSocket.WaitForData(Timeout: Integer): Boolean;
var
   FDSet: TFDSet;
   TimeVal: TTimeVal;
begin
   TimeVal.tv_sec:=(Timeout div 1000);
   TimeVal.tv_usec:=((Timeout mod 1000)*1000);
   FD_ZERO(FDSet);
   FD_SET(SocketHandle,FDSet);
   Result:=(select(0,@FDSet,nil,nil,@TimeVal) > 0);
end;

{ TBaseSession }

constructor TBaseSession.Create(Owner: TDataServer);
begin
   inherited Create;
   FDataServer:=Owner;
   FCreated:=Now;
   FLastConnected:=Now;
   FThread:=nil;
   FUserName:='';
   FUserAddress:='';
   FUserProcess:='';
   FUserThread:=0;
end;

destructor TBaseSession.Destroy;
begin
   inherited;
end;

function TBaseSession.GetConnected: Boolean;
begin
   Result:=(FThread <> nil);
end;

procedure TBaseSession.Connect(ConnectThread: TBaseThread);
begin
   ConnectThread.Session:=Self;
   FThread:=ConnectThread;
   FUserAddress:=ConnectThread.ClientAddress;
   FLastAddress:=FUserAddress;
   FUserProcess:=ConnectThread.ClientProcess;
   FUserThread:=ConnectThread.ClientThread;
   FIsEncrypted:=ConnectThread.ClientEncrypted;
   FLastConnected:=Now;
end;

procedure TBaseSession.Disconnect;
begin
   if (FUserName='') then
      begin
      if (FThread <> nil) then
         begin
         DisplayLogout;
         FThread.CloseConnection;
         FLastConnected:=Now;
         FThread.Session:=nil;
         FUserAddress:='';
         FIsEncrypted:=False;
         FThread:=nil;
         end
      else
         DisplayLogout;
      end
   else
      begin
      if (FThread <> nil) then
         begin
         DisplayDisconnect;
         FThread.CloseConnection;
         FLastConnected:=Now;
         FThread.Session:=nil;
         FUserAddress:='';
         FIsEncrypted:=False;
         FThread:=nil;
         end;
      end;
end;

procedure TBaseSession.DisplayConnect;
begin
end;

procedure TBaseSession.DisplayReconnect;
begin
end;

procedure TBaseSession.DisplayLogin;
begin
end;

procedure TBaseSession.DisplayLogout;
begin
end;

procedure TBaseSession.DisplayDisconnect;
begin
end;

{ TBaseThread }

constructor TBaseThread.Create(Owner: TDataServer; Socket: TServerClientWinSocket);
begin
   inherited Create(True,Socket);
   FDataServer:=Owner;
end;

destructor TBaseThread.Destroy;
begin
   ResizeReceiveBuffer(0);
   ResizeSendBuffer(0);
   ResizeSaveSendBuffer(0);
   inherited Destroy;
end;


procedure TBaseThread.Initialize;
begin
   FInitializingConnection:=True;
   FSession:=nil;
   FCloseAfterSend:=False;
   FClientAddress:=ClientSocket.RemoteAddress;
   FClientProcess:='';
   FClientThread:=0;
   FClientEncrypted:=False;
   FClientEncryptionDataSize:=FDataServer.EncryptionDataSize;
   FClientEncryptionData:=AllocMem(FClientEncryptionDataSize);
   Move(FDataServer.EncryptionData^,FClientEncryptionData^,FClientEncryptionDataSize);
   FClientCompression:=NO_COMPRESSION;
end;

procedure TBaseThread.Reset;
begin
   if (FClientEncryptionDataSize > 0) then
      begin
      DeAllocMem(FClientEncryptionData);
      FClientEncryptionDataSize:=0;
      end;
   ResizeReceiveBuffer(0);
   ResizeSendBuffer(0);
   ResizeSaveSendBuffer(0);
   FInitializingConnection:=False;
   FCloseAfterSend:=False;
end;

procedure TBaseThread.CloseConnection;
begin
   if (ClientSocket <> nil) and ClientSocket.Connected then
      begin
      try
         ClientSocket.Close;
      except
      end;
      end;
end;

function TBaseThread.GetSessionUserName: string;
begin
   if (FSession <> nil) then
      Result:=FSession.UserName
   else
      Result:='';
end;

procedure TBaseThread.ResizeReceiveBuffer(Value: Integer; ShrinkBuffer: Boolean=False);
begin
   ResizeBuffer(Value,FReceiveBuffer,FReceiveBufferSize,ShrinkBuffer);
end;

procedure TBaseThread.ResizeSendBuffer(Value: Integer; ShrinkBuffer: Boolean=False);
begin
   ResizeBuffer(Value,FSendBuffer,FSendBufferSize,ShrinkBuffer);
end;

procedure TBaseThread.ResizeSaveSendBuffer(Value: Integer);
begin
   ResizeBuffer(Value,FSaveSendBuffer,FSaveSendBufferSize,True);
end;

procedure TBaseThread.SaveReply;
begin
   FSavePackPos:=FPackPos;
   Move(FReplyHeader,FSaveReplyHeader,SizeOf(TReplyHeader));
   ResizeSaveSendBuffer(FSendBufferSize);
   Move(FSendBuffer^,FSaveSendBuffer^,FSendBufferSize);
end;

procedure TBaseThread.RestoreReply;
begin
   ResizeSendBuffer(FSaveSendBufferSize);
   Move(FSaveSendBuffer^,FSendBuffer^,FSaveSendBufferSize);
   Move(FSaveReplyHeader,FReplyHeader,SizeOf(TReplyHeader));
   FPackPos:=FSavePackPos;
   ResizeSaveSendBuffer(0);
end;

function TBaseThread.WaitForData(TimeOut: Integer): Boolean;
begin
   Result:=TDataClientSocket(ClientSocket).WaitForData(TimeOut);
end;

function TBaseThread.ReceiveBuffer(var Buffer; Count: Integer): Integer;
begin
   Result:=ClientSocket.ReceiveBuf(Buffer,Count);
end;

function TBaseThread.SendBuffer(var Buffer; Count: Integer): Integer;
begin
   Result:=ClientSocket.SendBuf(Buffer,Count);
end;

function TBaseThread.Receive: Byte;
var
   TempSignature: TMD5Digest;
   TotalBytesReceived: Integer;
   BytesToRead: Integer;
   BytesRead: Integer;
   ReceiveSize: Integer;
begin
   Result:=RECEIVE_NONE;
   try
      if WaitForData((FDataServer.Configuration.Timeout*1000)) then
         begin
         TotalBytesReceived:=0;
         BytesRead:=ReceiveBuffer(TempSignature,SizeOf(TMD5Digest));
         if (BytesRead <> SizeOf(TMD5Digest)) or
            ((not MD5DigestCompare(TempSignature,DataEngine.SignatureDigest)) and
             (not MD5DigestCompare(TempSignature,MD5String(DBISAM_SIGNATURE)))) then
            Result:=RECEIVE_ERROR
         else
            begin
            Inc(TotalBytesReceived,BytesRead);
            ResizeReceiveBuffer(TotalBytesReceived);
            Move(TempSignature,FReceiveBuffer^,BytesRead);
            if WaitForData((FDataServer.Configuration.Timeout*1000)) then
               begin
               ReceiveSize:=0;
               BytesRead:=ReceiveBuffer(ReceiveSize,SizeOf(Integer));
               if (BytesRead <> SizeOf(Integer)) then
                  Result:=RECEIVE_ERROR
               else
                  begin
                  ResizeReceiveBuffer(ReceiveSize);
                  Move(ReceiveSize,(FReceiveBuffer+TotalBytesReceived)^,BytesRead);
                  Inc(TotalBytesReceived,BytesRead);
                  while (not Terminated) and ClientSocket.Connected and
                        (TotalBytesReceived < ReceiveSize) do
                     begin
                     if WaitForData((FDataServer.Configuration.Timeout*1000)) then
                        begin
                        BytesToRead:=MinimumInteger((ReceiveSize-TotalBytesReceived),MAX_RECV_SIZE);
                        BytesRead:=ReceiveBuffer((FReceiveBuffer+TotalBytesReceived)^,BytesToRead);
                        Inc(TotalBytesReceived,BytesRead);
                        end;
                     end;
                  if (TotalBytesReceived=ReceiveSize) then
                     Result:=RECEIVE_PRESENT
                  else
                     Result:=RECEIVE_ERROR;
                  end;
               end;
            end;
         end;
   except
      Result:=RECEIVE_ERROR;
   end;
end;

function TBaseThread.Send: Boolean;
var
   TotalBytesSent: Integer;
   BytesToSend: Integer;
   BytesSent: Integer;
begin
   try
      TotalBytesSent:=0;
      while (not Terminated) and ClientSocket.Connected and
            (TotalBytesSent < FReplyHeader.TotalReplySize) do
         begin
         BytesToSend:=MinimumInteger((FReplyHeader.TotalReplySize-TotalBytesSent),
                                      MAX_SEND_SIZE);
         BytesSent:=SendBuffer((FSendBuffer+TotalBytesSent)^,BytesToSend);
         Inc(TotalBytesSent,BytesSent);
         end;
      Result:=(TotalBytesSent=FReplyHeader.TotalReplySize);
   except
      Result:=False;
   end;
end;

procedure TBaseThread.BeginUnpack;
var
   TempDecompressedBuffer: PChar;
   TempDecompressedBytes: Integer;
   TempCompression: Byte;
begin
   FUnpackPos:=0;
   if (not FInitializingConnection) and FClientEncrypted then
      DataEngine.Decrypt(FClientEncryptionData,(FReceiveBuffer+SizeOf(TMD5Digest)+SizeOf(Integer)),
                         (pRequestHeader(FReceiveBuffer)^.TotalRequestSize-(SizeOf(TMD5Digest)+SizeOf(Integer))));
   Move(FReceiveBuffer^,FRequestHeader,SizeOf(TRequestHeader));
   Inc(FUnpackPos,SizeOf(TRequestHeader));
   { Check for temporary compression settings }
   if (FRequestHeader.RequestCompression > BEST_COMPRESSION) then
      TempCompression:=(FRequestHeader.RequestCompression mod TEMP_COMPRESSION_OFFSET)
   else
      TempCompression:=FRequestHeader.RequestCompression;
   { If compressed request then need to uncompress data }
   if (TempCompression <> NO_COMPRESSION) then
      begin
      TempDecompressedBuffer:=nil;
      TempDecompressedBytes:=0;
      DataEngine.Decompress(Pointer(FReceiveBuffer+SizeOf(TRequestHeader)),FRequestHeader.RequestParamSize,
                            Pointer(TempDecompressedBuffer),TempDecompressedBytes);
      try
         with FRequestHeader do
            begin
            TotalRequestSize:=(SizeOf(TRequestHeader)+TempDecompressedBytes);
            RequestParamSize:=TempDecompressedBytes;
            end;
         ResizeReceiveBuffer(SizeOf(TRequestHeader)+TempDecompressedBytes);
         Move(FRequestHeader,FReceiveBuffer^,SizeOf(TRequestHeader));
         Move(TempDecompressedBuffer^,(FReceiveBuffer+SizeOf(TRequestHeader))^,
              TempDecompressedBytes);
      finally
         DeAllocMem(TempDecompressedBuffer);
      end;
      end
   else
      begin
      { Otherwise just adjust the total request size to account for slack
        space introduced by the crypto blocking }
      with FRequestHeader do
         TotalRequestSize:=(SizeOf(TRequestHeader)+RequestParamSize);
      Move(FRequestHeader,FReceiveBuffer^,SizeOf(TRequestHeader));
      end;
   if (FRequestHeader.RequestCompression > BEST_COMPRESSION) then
      FClientCompression:=(FRequestHeader.RequestCompression div TEMP_COMPRESSION_OFFSET)
   else
      FClientCompression:=FRequestHeader.RequestCompression;
end;

function TBaseThread.Unpack(var Buffer): Integer;
begin
   if ((FUnpackPos+SizeOf(Integer)) > FRequestHeader.TotalRequestSize) then
      DataEngine.RaiseError(DBISAM_UNCOMPRESS);
   Move((FReceiveBuffer+FUnpackPos)^,Result,SizeOf(Integer));
   Inc(FUnpackPos,SizeOf(Integer));
   if ((FUnpackPos+Result) > FRequestHeader.TotalRequestSize) then
      DataEngine.RaiseError(DBISAM_UNCOMPRESS);
   Move((FReceiveBuffer+FUnpackPos)^,Buffer,Result);
   Inc(FUnpackPos,Result);
end;

procedure TBaseThread.BeginPack;
begin
   FPackPos:=SizeOf(TReplyHeader);
   ResizeSendBuffer(FPackPos);
   FReplyHeader.ResultSize:=0;
end;

procedure TBaseThread.Pack(const Buffer; BufferSize: Integer);
begin
   ResizeSendBuffer(FPackPos+SizeOf(Integer)+BufferSize);
   Move(BufferSize,(FSendBuffer+FPackPos)^,SizeOf(Integer));
   Inc(FPackPos,SizeOf(Integer));
   Inc(FReplyHeader.ResultSize,SizeOf(Integer));
   Move(Buffer,(FSendBuffer+FPackPos)^,BufferSize);
   Inc(FPackPos,BufferSize);
   Inc(FReplyHeader.ResultSize,BufferSize);
end;

procedure TBaseThread.EndPack;
var
   TempCompressedBuffer: PChar;
   TempCompressedBytes: Integer;
   TempCompression: Byte;
begin
   { Massage the compression for size optimizations }
   if (FClientVersion >= 4.11) and
      (FClientCompression <> NO_COMPRESSION) then
      begin
      if (FReplyHeader.ResultSize <= MIN_COMPRESS_SIZE) then
         TempCompression:=NO_COMPRESSION
      else if (FReplyHeader.ResultSize <= FAST_COMPRESS_SIZE) then
         TempCompression:=BEST_SPEED_COMPRESSION
      else
         TempCompression:=FClientCompression;
      end
   else
      TempCompression:=FClientCompression;
   { If no compression is set then just send as is }
   if (TempCompression=NO_COMPRESSION) then
      begin
      with FReplyHeader do
         begin
         ReplySignature:=DataEngine.SignatureDigest;
         if (TempCompression <> FClientCompression) then
            ReplyCompression:=((FClientCompression*TEMP_COMPRESSION_OFFSET)+TempCompression)
         else
            ReplyCompression:=TempCompression;
         TotalReplySize:=BlockOffset(SizeOf(TReplyHeader)+ResultSize,CRYPTO_BLOCK_SIZE);
         end;
      Move(FReplyHeader,FSendBuffer^,SizeOf(TReplyHeader));
      end
   else
      begin
      TempCompressedBuffer:=nil;
      TempCompressedBytes:=0;
      DataEngine.Compress(Pointer(FSendBuffer+SizeOf(TReplyHeader)),FReplyHeader.ResultSize,
                          FClientCompression,Pointer(TempCompressedBuffer),TempCompressedBytes);
      try
         with FReplyHeader do
            begin
            ReplySignature:=DataEngine.SignatureDigest;
            if (TempCompression <> FClientCompression) then
               ReplyCompression:=((FClientCompression*TEMP_COMPRESSION_OFFSET)+TempCompression)
            else
               ReplyCompression:=TempCompression;
            ResultSize:=TempCompressedBytes;
            TotalReplySize:=BlockOffset(SizeOf(TReplyHeader)+ResultSize,CRYPTO_BLOCK_SIZE);
            end;
         ResizeSendBuffer(FReplyHeader.TotalReplySize);
         Move(FReplyHeader,FSendBuffer^,SizeOf(TReplyHeader));
         Move(TempCompressedBuffer^,(FSendBuffer+SizeOf(TReplyHeader))^,
              TempCompressedBytes);
      finally
         DeAllocMem(TempCompressedBuffer);
      end;
      end;
   if (not FInitializingConnection) and FClientEncrypted then
      DataEngine.Encrypt(FClientEncryptionData,(FSendBuffer+SizeOf(TMD5Digest)+SizeOf(Integer)),
                         (FReplyHeader.TotalReplySize-(SizeOf(TMD5Digest)+SizeOf(Integer))));
end;

procedure TBaseThread.PackException(E: Exception);
var
   TempString: string;
   TempInteger: Integer;
begin
   if (E is EDBISAMEngineError) then
      begin
      with EDBISAMEngineError(E) do
         begin
         TempString:=ErrorUserName;
         Pack(TempString[1],Length(TempString));
         TempString:=ErrorDatabaseName;
         Pack(TempString[1],Length(TempString));
         TempString:=StripFilePathAndExtension(ErrorTableName,DataEngine.DataExtension);
         Pack(TempString[1],Length(TempString));
         TempString:=ErrorFieldName;
         Pack(TempString[1],Length(TempString));
         TempString:=ErrorIndexName;
         Pack(TempString[1],Length(TempString));
         TempString:=ErrorMessage;
         Pack(TempString[1],Length(TempString));
         TempString:=ErrorProcedureName;
         Pack(TempString[1],Length(TempString));
         TempString:=ErrorEventName;
         Pack(TempString[1],Length(TempString));
         if (FClientVersion >= 4.09) then
            begin
            TempInteger:=ErrorLine;
            Pack(TempInteger,SizeOf(Integer));
            TempInteger:=ErrorColumn;
            Pack(TempInteger,SizeOf(Integer));
            end;
         end;
      end
   else
      begin
      TempString:='';
      Pack(TempString[1],Length(TempString));
      TempString:='';
      Pack(TempString[1],Length(TempString));
      TempString:='';
      Pack(TempString[1],Length(TempString));
      TempString:='';
      Pack(TempString[1],Length(TempString));
      TempString:='';
      Pack(TempString[1],Length(TempString));
      TempString:=E.Message;
      Pack(TempString[1],Length(TempString));
      TempString:='';
      Pack(TempString[1],Length(TempString));
      TempString:='';
      Pack(TempString[1],Length(TempString));
      if (FClientVersion >= 4.09) then
         begin
         TempInteger:=0;
         Pack(TempInteger,SizeOf(Integer));
         Pack(TempInteger,SizeOf(Integer));
         end;
      end;
end;

procedure TBaseThread.LogException(E: Exception);
begin
   if (E is EDBISAMEngineError) then
      begin
      with EDBISAMEngineError(E) do
         begin
         if (ErrorCode <> DBISAM_KEYVIOL) and
            (ErrorCode <> DBISAM_KEYORRECDELETED) and
            (ErrorCode <> DBISAM_RECNOTFOUND) and
            (ErrorCode <> DBISAM_NOCURRREC) then
            FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_NONE,
                                 'Engine error '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                                 ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                 SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(FSession));
         end;
      end
   else
      FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_NONE,
                           'Engine error '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                           ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                           SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(FSession));
end;

procedure TBaseThread.ProcessException(E: Exception);
begin
   LogException(E);
   if (E is EDBISAMEngineError) then
      begin
      with EDBISAMEngineError(E) do
         begin
         FReplyHeader.ResultCode:=ErrorCode;
         BeginPack;
         PackException(E);
         EndPack;
         end;
      end
   else
      begin
      FReplyHeader.ResultCode:=DBISAM_REMOTEUNKNOWN;
      BeginPack;
      PackException(E);
      EndPack;
      end;
end;

procedure TBaseThread.ProcessReceive;
begin
   try
      BeginUnpack;
      HandleReceive(FRequestHeader.RequestCode);
      if Terminated or (not ClientSocket.Connected) then
         Exit;
      if (FRequestHeader.RequestCode <> REQUEST_PING) then
         begin
         if (not Send) or FCloseAfterSend then
            CloseConnection;
         if FInitializingConnection then
            FInitializingConnection:=False;
         end;
   finally
      ResizeReceiveBuffer(DEFAULT_RECV_BUFFER_SIZE,True);
      ResizeSendBuffer(DEFAULT_SEND_BUFFER_SIZE,True);
   end;
end;

procedure TBaseThread.HandleReceive(RequestCode: Word);
begin
   DoInvalidRequest;
end;

function TBaseThread.CheckSession: Boolean;
begin
   Result:=True;
   if (not FSession.IsObject) then
      begin
      DoInvalidRequest;
      Result:=False;
      end;
end;

function TBaseThread.CheckSessionUser: Boolean;
begin
   Result:=True;
   if (FSession.UserName='') then
      begin
      DoInvalidRequest;
      Result:=False;
      end;
end;

procedure TBaseThread.DoInvalidRequest;
var
   TempString: string;
   TempInteger: Integer;
begin
   FReplyHeader.ResultCode:=DBISAM_REMOTEINVREQUEST;
   BeginPack;
   TempString:='';
   Pack(TempString[1],Length(TempString));
   TempString:='';
   Pack(TempString[1],Length(TempString));
   TempString:='';
   Pack(TempString[1],Length(TempString));
   TempString:='';
   Pack(TempString[1],Length(TempString));
   TempString:='';
   Pack(TempString[1],Length(TempString));
   TempString:='';
   Pack(TempString[1],Length(TempString));
   TempString:='';
   Pack(TempString[1],Length(TempString));
   TempString:='';
   Pack(TempString[1],Length(TempString));
   if (FClientVersion >= 4.09) then
      begin
      TempInteger:=0;
      Pack(TempInteger,SizeOf(Integer));
      Pack(TempInteger,SizeOf(Integer));
      end;
   EndPack;
end;

function TBaseThread.ReceiveCallback: Byte;
begin
   Result:=RECEIVE_NONE;
   while (not Terminated) and ClientSocket.Connected do
      begin
      Result:=Receive;
      case Result of
         RECEIVE_PRESENT:
            begin
            BeginUnpack;
            if (FRequestHeader.RequestCode=REQUEST_CALLBACKRESPONSE) then
               Break
            else
               begin
               HandleReceive(FRequestHeader.RequestCode);
               if (not Send) then
                  CloseConnection;
               end;
            end;
         RECEIVE_ERROR,RECEIVE_NONE:
            Break;
         end;
      end;
end;

procedure TBaseThread.ClientExecute;
var
   OldErrorProc: TSocketErrorProc;
begin
   OldErrorProc:=SetErrorProc(BaseSocketError);
   try
      if (not Terminated) and ClientSocket.Connected then
         begin
         try
            Initialize;
            try
               while (not Terminated) and ClientSocket.Connected do
                  begin
                  try
                     case Receive of
                        RECEIVE_PRESENT:
                           begin
                           try
                              ProcessReceive;
                           except
                              on E: Exception do
                                 begin
                                 FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_NONE,
                                                      'Internal error processing request '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                                                      ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                                      SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(FSession));
                                 CloseConnection;
                                 end;
                           end;
                           end;
                        RECEIVE_ERROR,RECEIVE_NONE:
                           CloseConnection;
                        end;
                  except
                     on E: Exception do
                        begin
                        FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_NONE,
                                             'Internal error receiving request '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                                             ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                             SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(FSession));
                        CloseConnection;
                        end;
                  end;
                  end;
            finally
               Reset;
            end;
         except
            on E: Exception do
               FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_NONE,
                                    'Internal error '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                                    ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                    SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(FSession));
         end;
         end;
   finally
      SetErrorProc(OldErrorProc);
   end;
end;

{ TServerSession }

constructor TServerSession.Create(Owner: TDataServer);
begin
   inherited Create(Owner);
   DataEngine.StartDataSession(FDataSession);
   with FDataSession do
      PrivateDirectory:=ExpandFileName(FDataServer.Configuration.TemporaryDirectory);
   FUserData:=nil;
end;

destructor TServerSession.Destroy;
begin
   if (FDataSession <> nil) then
      begin
      DataEngine.CloseDataSession(FDataSession);
      FDataSession:=nil;
      end;
   inherited;
end;

procedure TServerSession.DisplayConnect;
begin
   FUserData:=FDataServer.DisplayConnect(FIsEncrypted,FUserAddress);
end;

procedure TServerSession.DisplayReconnect;
begin
   FDataServer.DisplayReconnect(FIsEncrypted,FUserAddress,FUserData);
end;

procedure TServerSession.DisplayLogin;
begin
   FDataServer.DisplayLogin(FUserName,FUserData);
end;

procedure TServerSession.DisplayLogout;
begin
   FDataServer.DisplayLogout(FUserData);
end;

procedure TServerSession.DisplayDisconnect;
begin
   FDataServer.DisplayDisconnect(FUserData,FLastAddress);
end;

{ TServerThread }

procedure TServerThread.Reset;
begin
   inherited Reset;
   FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_DISCONNECT,
                        'Connection closed',
                        ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                        SessionUserName,0,ThreadID,Integer(Session));
   if (Session <> nil) then
      FDataServer.Configuration.DisconnectUser(Session.UserName);
   FDataServer.DisconnectServerSession(TServerSession(Session));
end;

procedure TServerThread.CheckRead(const UserName: string;
                                  DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,READ_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckInsert(const UserName: string;
                                     DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,INSERT_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckUpdate(const UserName: string;
                                  DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,UPDATE_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckDelete(const UserName: string;
                                     DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,DELETE_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckCreate(const UserName: string;
                                     DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,CREATE_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckAlter(const UserName: string;
                                   DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,ALTER_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckDrop(const UserName: string;
                                  DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,DROP_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckRename(const UserName: string;
                                    DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,RENAME_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckMaintain(const UserName: string;
                                      DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,MAINTAIN_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckBackup(const UserName: string;
                                    DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,BACKUP_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

procedure TServerThread.CheckRestore(const UserName: string;
                                      DataDirectory: TDataDirectory);
begin
   if (not IsRightSet(DataDirectory.ServerRights,RESTORE_RIGHT)) then
      DataEngine.RaiseError(DBISAM_REMOTENOTAUTH,'',UserName,DataDirectory.Name);
end;

function TServerThread.DoConnectionParams: Boolean;
var
   TempEngineVersion: Currency;
   { Version 5 }
   TempEngineBuildNumber: Integer;
   { Version 5 }
   TempEngineType: string;
begin
   Result:=False;
   try
      Unpack(FClientVersion);
      Unpack(FClientEncrypted);
      FClientProcess[0]:=Char(Byte(Unpack(FClientProcess[1])));
      Unpack(FClientThread);
      if (Trunc(FClientVersion)=Trunc(ENGINE_VERSION_NUM)) then
         begin
         if (FDataServer.EncryptedOnly and FClientEncrypted) or
            (not FDataServer.EncryptedOnly) then
            begin
            if FDataServer.CheckMaxConnections then
               begin
               if FDataServer.Configuration.CheckIPAddress(FClientAddress) then
                  begin
                  FDataServer.ConnectServerSession(Self);
                  FReplyHeader.ResultCode:=DBISAM_NONE;
                  FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_CONNECT,
                                       'Connection accepted',
                                       ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                       SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
                  end
               else
                  begin
                  FReplyHeader.ResultCode:=DBISAM_REMOTEADDRESSBLOCK;
                  FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_ADDRESSBLOCK,
                                       'Connection rejected, address is blocked',
                                       ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                       SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
                  end;
               end
            else
               begin
               FReplyHeader.ResultCode:=DBISAM_REMOTEMAXCONNECT;
               FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                    'Connection rejected, max connections reached',
                                    ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                    SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
               end;
            end
         else
            begin
            FReplyHeader.ResultCode:=DBISAM_REMOTEENCRYPTREQ;
            FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                 'Connection rejected, encrypted connection required',
                                 ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                 SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
            end;
         end
      else
         begin
         FReplyHeader.ResultCode:=DBISAM_REMOTEVERSION;
         FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                              'Connection rejected, incorrect client version',
                              ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                              SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
         end;
      Result:=(FReplyHeader.ResultCode=DBISAM_NONE);
      BeginPack;
      if Result then
         begin
         Pack(Integer(Session),SizeOf(Integer));
         TempEngineVersion:=ENGINE_VERSION_NUM;
         Pack(TempEngineVersion,SizeOf(Currency));
         { Version 5 }
         if (FClientVersion >= 4.23) then
            begin
            TempEngineBuildNumber:=ENGINE_BUILD_NUM;
            Pack(TempEngineBuildNumber,SizeOf(Integer));
            end;
         { Version 5 }
         TempEngineType:=ENGINE_TYPE;
         Pack(TempEngineType[1],Length(TempEngineType));
         end;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.DoReconnect: Boolean;
var
   TempServerSession: TServerSession;
   TempResult: Boolean;
   WaitForDisconnect: Boolean;
begin
   Result:=False;
   try
      Unpack(FClientVersion);
      Unpack(TempServerSession);
      Unpack(FClientEncrypted);
      FClientProcess[0]:=Char(Byte(Unpack(FClientProcess[1])));
      Unpack(FClientThread);
      if (FDataServer.EncryptedOnly and FClientEncrypted) or
         (not FDataServer.EncryptedOnly) then
         begin
         if FDataServer.CheckMaxConnections then
            begin
            if FDataServer.Configuration.CheckIPAddress(FClientAddress) then
               begin
               WaitForDisconnect:=False;
               while True do
                  begin
                  TempResult:=FDataServer.ReconnectServerSession(Self,TempServerSession,
                                                                 WaitForDisconnect);
                  if TempResult then
                     begin
                     if FDataServer.Configuration.CheckUserMaxConnections(SessionUserName) then
                        begin
                        FReplyHeader.ResultCode:=DBISAM_NONE;
                        FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_RECONNECT,
                                             'Re-connection accepted',
                                             ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                             SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));

                        end
                     else
                        begin
                        FReplyHeader.ResultCode:=DBISAM_REMOTEMAXCONNECT;
                        FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                             'Connection rejected, max user connections reached',
                                             ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                             SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
                        end;
                     Break;
                     end
                  else
                     begin
                     if WaitForDisconnect then
                        Sleep(DEFAULT_RECONNECT_SLEEP)
                     else
                        begin
                        FReplyHeader.ResultCode:=DBISAM_REMOTECONNECT;
                        FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_NOSESSION,
                                             'Re-connection rejected, session not found',
                                             ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                             SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(TempServerSession));
                        Break;
                        end;
                     end;
                   end;
               end
            else
               begin
               FReplyHeader.ResultCode:=DBISAM_REMOTEADDRESSBLOCK;
               FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_ADDRESSBLOCK,
                                    'Re-connection rejected, address is blocked',
                                    ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                    SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(TempServerSession));
               end;
            end
         else
            begin
            FReplyHeader.ResultCode:=DBISAM_REMOTEMAXCONNECT;
            FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                 'Re-connection rejected, max connections reached',
                                 ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                 SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(TempServerSession));
            end;
         end
      else
         begin
         FReplyHeader.ResultCode:=DBISAM_REMOTEENCRYPTREQ;
         FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                              'Re-connection rejected, encrypted connection required',
                              ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                              SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(TempServerSession));
         end;
      Result:=(FReplyHeader.ResultCode=DBISAM_NONE);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoLogin;
var
   TempUserName: string;
   TempPassword: string;
   TempLoginSize: Integer;
   TempLoginBuffer: PChar;
   TempLoginPos: Integer;
begin
   try
      Unpack(TempLoginSize);
      TempLoginBuffer:=AllocMem(TempLoginSize);
      try
         Unpack(TempLoginBuffer^);
         DataEngine.Decrypt(FClientEncryptionData,TempLoginBuffer,TempLoginSize);
         TempLoginPos:=0;
         Move((TempLoginBuffer+TempLoginPos)^,TempUserName[0],SizeOf(Byte));
         Inc(TempLoginPos,SizeOf(Byte));
         Move((TempLoginBuffer+TempLoginPos)^,TempUserName[1],Length(TempUserName));
         Inc(TempLoginPos,Length(TempUserName));
         Move((TempLoginBuffer+TempLoginPos)^,TempPassword[0],SizeOf(Byte));
         Inc(TempLoginPos,SizeOf(Byte));
         Move((TempLoginBuffer+TempLoginPos)^,TempPassword[1],Length(TempPassword));
      finally
         DeAllocMem(TempLoginBuffer);
      end;
      if (not FDataServer.Configuration.DenyLogins) then
         begin
         if FDataServer.Configuration.LoginUser(TempUserName,TempPassword) then
            begin
            if FDataServer.Configuration.CheckUserMaxConnections(TempUserName) then
               begin
               FDataServer.LoginServerSession(TServerSession(Session),TempUserName);
               FReplyHeader.ResultCode:=DBISAM_NONE;
               FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_LOGIN,
                                    'Login',ENGINE_VERSION_NUM,FClientVersion,
                                    FClientAddress,FClientEncrypted,SessionUserName,
                                    FRequestHeader.RequestCode,ThreadID,Integer(Session));
               end
            else
               begin
               FReplyHeader.ResultCode:=DBISAM_REMOTEMAXCONNECT;
               FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                    'Connection rejected, max user connections reached',
                                    ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                    TempUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));

               end;
            end
         else
            begin
            FReplyHeader.ResultCode:=DBISAM_REMOTEINVLOGIN;
            FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_INVLOGIN,
                                 'Invalid login',
                                 ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                 TempUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
            end;
         end
      else
         begin
         FReplyHeader.ResultCode:=DBISAM_REMOTENOLOGIN;
         FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_LOGINDENIED,
                              'Login denied',
                              ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                              TempUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
         end;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoLogout;
begin
   FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_LOGOUT,
                        'Logout',ENGINE_VERSION_NUM,FClientVersion,
                        FClientAddress,FClientEncrypted,SessionUserName,
                        FRequestHeader.RequestCode,ThreadID,Integer(Session));
   FDataServer.Configuration.DisconnectUser(SessionUserName);
   FDataServer.RemoveServerSession(TServerSession(Session));
end;

procedure TServerThread.DoSessionParams;
var
   TempForceBufferFlush: Boolean;
   TempStrictChangeDetection: Boolean;
   TempLockRetries: Byte;
   TempLockWait: Word;
   TempLockProtocol: Byte;
   TempProgress: Word;
begin
   try
      Unpack(TempForceBufferFlush);
      Unpack(TempStrictChangeDetection);
      Unpack(TempLockRetries);
      Unpack(TempLockWait);
      Unpack(TempLockProtocol);
      Unpack(TempProgress);
      with TServerSession(Session).DataSession do
         begin
         ForceBufferFlush:=TempForceBufferFlush;
         StrictChangeDetection:=TempStrictChangeDetection;
         LockRetries:=TempLockRetries;
         LockWait:=TempLockWait;
         LockProtocol:=TempLockProtocol;
         Progress:=TempProgress;
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

{ Version 5 }

procedure TServerThread.DeleteMemoryTables(const DirMask: string;
                                           FilesList: TStrings);
var
   I: Integer;
begin
   DataEngine.GetFileNames(True,DirMask,True,FilesList);
   for I:=0 to FilesList.Count-1 do
      begin
      try
         DataEngine.DeleteFile(FilesList[I],True);
      except
         { Kill all exceptions }
      end;
      end;
end;

procedure TServerThread.DoRemoveAllMemoryTables;
var
   TempComputerName: string;
   TempFileNamesList: TStrings;
begin
   try
      TempComputerName[0]:=Char(Byte(Unpack(TempComputerName[1])));
      TempFileNamesList:=TStringList.Create;
      try
         { Data }
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.DataExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.DataTempExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.DataUpgradeExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.DataBackupExtension,
                            TempFileNamesList);
         { Indexes }
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.IndexExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.IndexTempExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.IndexUpgradeExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.IndexBackupExtension,
                            TempFileNamesList);
         { BLOBs }
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.BlobExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.BlobTempExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.BlobUpgradeExtension,
                            TempFileNamesList);
         DeleteMemoryTables(AddBS(TempComputerName+'*')+'*'+DataEngine.BlobBackupExtension,
                            TempFileNamesList);
      finally
         TempFileNamesList.Free;
      end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;
{ Version 5 }

procedure TServerThread.DoModifyUserPassword;
var
   TempUserName: string;
   TempPassword: string;
begin
   try
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      TempPassword[0]:=Char(Byte(Unpack(TempPassword[1])));
      if (AnsiCompareText(Session.UserName,TempUserName)=0) then
         begin
         if FDataServer.Configuration.ModifyUserPassword(TempUserName,TempPassword) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENOUSER,'',TempUserName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENOUSER,'',TempUserName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetTableNames;
var
   TempDataDirectory: TDataDirectory;
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         Unpack(TempDataDirectory);
         if (not TempDataDirectory.IsObject) then
            DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
         TempDataDirectory.ListTableNames(TempList);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoOpenDataDirectory;
var
   TempName: string;
   TempKeepTablesOpen: Boolean;
   TempPath: string;
   TempDataDirectory: TDataDirectory;
begin
   try
      TempName[0]:=Char(Byte(Unpack(TempName[1])));
      if (FClientVersion >= 4.17) then
         Unpack(TempKeepTablesOpen)
      else
         TempKeepTablesOpen:=False;
      TempPath:='';
      TempDataDirectory:=nil;
      if (AnsiCompareText(TempName,INMEMORY_DATABASE_NAME)=0) then
         begin
         FReplyHeader.ResultCode:=DBISAM_NONE;
         TempPath:=Session.UserProcess;
         TempDataDirectory:=TServerSession(Session).DataSession.OpenDataDirectory(TempName,TempPath,
                                                                                  TempKeepTablesOpen,False);
         TempDataDirectory.ServerRights:=FDataServer.Configuration.GetAdminRights;
         end
      else
         begin
         if FDataServer.Configuration.CheckForDatabase(Session.UserName,TempName,TempPath) then
            begin
            FReplyHeader.ResultCode:=DBISAM_NONE;
            TempDataDirectory:=TServerSession(Session).DataSession.OpenDataDirectory(TempName,TempPath,
                                                                                     TempKeepTablesOpen,
                                                                                     False,True);
            TempDataDirectory.ServerRights:=
               FDataServer.Configuration.GetDatabaseRights(Session.UserName,TempName);
            end
         else
            DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempName);
         end;
      BeginPack;
      Pack(TempDataDirectory,SizeOf(Integer));
      Pack(TempDataDirectory.ReadOnly,SizeOf(Boolean));
      EndPack;
   except
      on E: Exception do
         begin
         if (TempDataDirectory <> nil) then
            TServerSession(Session).DataSession.CloseDataDirectory(TempDataDirectory,False);
         ProcessException(E);
         end;
   end;
end;

procedure TServerThread.DoCloseDataDirectory;
var
   TempDataDirectory: TDataDirectory;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TServerSession(Session).DataSession.CloseDataDirectory(TempDataDirectory,False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoBackup;
var
   TempDataDirectory: TDataDirectory;
   TempName: string;
   TempDescription: string;
   TempCompression: Byte;
   TempFileCount: Integer;
   I: Integer;
   TempBackupTables: TStrings;
   TempFileName: string;
   TempSendProgress: Boolean;
   TempSendLog: Boolean;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckBackup(Session.UserName,TempDataDirectory);
      TempName[0]:=Char(Byte(Unpack(TempName[1])));
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      Unpack(TempCompression);
      TempBackupTables:=TStringList.Create;
      try
         Unpack(TempFileCount);
         for I:=1 to TempFileCount do
            begin
            TempFileName[0]:=Char(Byte(Unpack(TempFileName[1])));
            TempBackupTables.Add(TempFileName);
            end;
         Unpack(TempSendProgress);
         Unpack(TempSendLog);
         with TempDataDirectory do
            begin
            if TempSendProgress then
               SetSteppedProgressCallback(Integer(Self),
                                         @TServerThread.SteppedProgressCallback);
            if TempSendLog then
               SetLogCallback(Integer(Self),@TServerThread.LogCallback);
            TempResult:=Backup(TempName,TempDescription,TempCompression,
                               TempBackupTables,False,False);
            end;
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempResult,SizeOf(Boolean));
         EndPack;
      finally
         TempBackupTables.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoBackupInfo;
var
   TempDataDirectory: TDataDirectory;
   TempName: string;
   TempDescription: string;
   TempDateTime: TDateTime;
   TempFileCount: Integer;
   I: Integer;
   TempBackupTables: TStrings;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckRestore(Session.UserName,TempDataDirectory);
      TempName[0]:=Char(Byte(Unpack(TempName[1])));
      TempBackupTables:=TStringList.Create;
      try
         TempDescription:='';
         TempDateTime:=0;
         with TempDataDirectory do
            TempResult:=BackupInfo(TempName,TempDescription,TempDateTime,
                                   TempBackupTables);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempResult,SizeOf(Boolean));
         Pack(TempDescription[1],Length(TempDescription));
         Pack(TempDateTime,SizeOf(TDateTime));
         TempFileCount:=TempBackupTables.Count;
         Pack(TempFileCount,SizeOf(Integer));
         for I:=0 to TempFileCount-1 do
            Pack(TempBackupTables[I][1],Length(TempBackupTables[I]));
         EndPack;
      finally
         TempBackupTables.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoRestore;
var
   TempDataDirectory: TDataDirectory;
   TempName: string;
   TempFileCount: Integer;
   I: Integer;
   TempBackupTables: TStrings;
   TempFileName: string;
   TempSendProgress: Boolean;
   TempSendLog: Boolean;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckRestore(Session.UserName,TempDataDirectory);
      TempName[0]:=Char(Byte(Unpack(TempName[1])));
      TempBackupTables:=TStringList.Create;
      try
         Unpack(TempFileCount);
         for I:=1 to TempFileCount do
            begin
            TempFileName[0]:=Char(Byte(Unpack(TempFileName[1])));
            TempBackupTables.Add(TempFileName);
            end;
         Unpack(TempSendProgress);
         Unpack(TempSendLog);
         with TempDataDirectory do
            begin
            if TempSendProgress then
               SetSteppedProgressCallback(Integer(Self),
                                         @TServerThread.SteppedProgressCallback);
            if TempSendLog then
               SetLogCallback(Integer(Self),@TServerThread.LogCallback);
            TempResult:=Restore(TempName,TempBackupTables,False,False);
            end;
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempResult,SizeOf(Boolean));
         EndPack;
      finally
         TempBackupTables.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoAddPassword;
var
   TempPassword: string;
begin
   try
      TempPassword[0]:=Char(Byte(Unpack(TempPassword[1])));
      TServerSession(Session).DataSession.AddPassword(TempPassword);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeletePassword;
var
   TempPassword: string;
begin
   try
      TempPassword[0]:=Char(Byte(Unpack(TempPassword[1])));
      TServerSession(Session).DataSession.DeletePassword(TempPassword);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeleteAllPasswords;
begin
   try
      TServerSession(Session).DataSession.DeleteAllPasswords;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetDatabaseNames;
var
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         FDataServer.Configuration.GetDatabaseList(Session.UserName,True,TempList);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetProcedureNames;
var
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         FDataServer.Configuration.GetProcedureList(Session.UserName,True,TempList);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetDatabaseUser;
var
   TempDatabaseName: string;
   TempUserName: string;
   TempRights: Integer;
   TempDescription: string;
   TempPath: string;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if (AnsiCompareText(TempUserName,Session.UserName)=0) then
         begin
         if FDataServer.Configuration.GetDatabase(TempDatabaseName,TempDescription,
                                                    TempPath) then
            begin
            if FDataServer.Configuration.GetDatabaseUser(TempDatabaseName,TempUserName,TempRights) then
               FReplyHeader.ResultCode:=DBISAM_NONE
            else
               DataEngine.RaiseError(DBISAM_REMOTENODBUSER,'',TempUserName,TempDatabaseName);
            end
         else
            DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENODBUSER,'',TempUserName,TempDatabaseName);
      BeginPack;
      Pack(TempRights,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoStartTransaction;
var
   TempDataDirectory: TDataDirectory;
   TempTableCount: Integer;
   TempTablesList: TStrings;
   I: Integer;
   TempTableName: string;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      if (ClientVersion >= 4.06) then
         begin
         Unpack(TempTableCount);
         if (TempTableCount <> 0) then
            begin
            TempTablesList:=TStringList.Create;
            try
               for I:=1 to TempTableCount do
                  begin
                  TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
                  TempTablesList.Add(TempTableName);
                  end;
               TempDataDirectory.StartTransaction(False,TempTablesList);
            finally
               TempTablesList.Free;
            end;
            end
         else
            TempDataDirectory.StartTransaction(False,nil);
         end
      else
         TempDataDirectory.StartTransaction(False,nil);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoCommitTransaction;
var
   TempDataDirectory: TDataDirectory;
   TempReleaseLocks: Boolean;
   TempForceFlush: Boolean;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempReleaseLocks);
      Unpack(TempForceFlush);
      TempDataDirectory.CommitTransaction(TempForceFlush,True,False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoRollbackTransaction;
var
   TempDataDirectory: TDataDirectory;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataDirectory.RollbackTransaction(False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoCreateCursor;
var
   TempDataCursor: TDataCursor;
   TempDataDirectory: TDataDirectory;
begin
   try
      TempDataCursor:=nil;
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor:=TDataCursor.Create(TempDataDirectory,False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDataCursor,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         begin
         if (TempDataCursor <> nil) then
            TempDataCursor.Free;
         ProcessException(E);
         end;
   end;
end;

function TServerThread.ProcedureProgressCallback(const Status: string;
                                                 PercentDone: Word;
                                                 var Abort: Boolean): Boolean;
var
   TempCallbackType: Word;
begin
   Result:=False;
   if Terminated then
      Abort:=True
   else
      begin
      SaveReply;
      try
         Result:=False;
         FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
         BeginPack;
         TempCallbackType:=CALLBACK_PROCEDUREPROGRESS;
         Pack(TempCallbackType,SizeOf(Word));
         Pack(Status[1],Length(Status));
         Pack(PercentDone,SizeOf(Word));
         Pack(Abort,SizeOf(Boolean));
         EndPack;
         if (not Send) then
            CloseConnection;
         case ReceiveCallback of
            RECEIVE_PRESENT:
               Unpack(Abort);
            RECEIVE_ERROR,RECEIVE_NONE:
               Result:=False;
            end;
      finally
         RestoreReply;
      end;
      end;
end;

function TServerThread.PasswordCallback: Boolean;
var
   TempCallbackType: Word;
begin
   SaveReply;
   try
      Result:=False;
      FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
      BeginPack;
      TempCallbackType:=CALLBACK_PASSWORD;
      Pack(TempCallbackType,SizeOf(Word));
      EndPack;
      if (not Send) then
         CloseConnection;
      case ReceiveCallback of
         RECEIVE_PRESENT:
            Unpack(Result);
         RECEIVE_ERROR,RECEIVE_NONE:
            Result:=False;
         end;
   finally
      RestoreReply;
   end;
end;

function TServerThread.GetPathCallback(const DataDirectoryName: string;
                                       var Path: string): Boolean;
begin
   Result:=True;
   if (AnsiCompareText(DataDirectoryName,INMEMORY_DATABASE_NAME)=0) then
      Path:=Session.UserProcess
   else
      begin
      if (not FDataServer.Configuration.CheckForDatabase(Session.UserName,
                                                         DataDirectoryName,Path)) then
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',DataDirectoryName);
      end;
end;

function TServerThread.GetRightsCallback(const DataDirectoryName: string;
                                         var Rights: Integer): Boolean;
begin
   Result:=True;
   if (AnsiCompareText(DataDirectoryName,INMEMORY_DATABASE_NAME)=0) then
      Rights:=FDataServer.Configuration.GetAdminRights
   else
      Rights:=FDataServer.Configuration.GetDatabaseRights(Session.UserName,DataDirectoryName);
end;

function TServerThread.CheckRightsCallback(DataDirectory: TObject;
                                           RightToCheck: Byte): Boolean;
begin
   Result:=True;
   case RightToCheck of
      READ_RIGHT:
         CheckRead(Session.UserName,TDataDirectory(DataDirectory));
      INSERT_RIGHT:
         CheckInsert(Session.UserName,TDataDirectory(DataDirectory));
      UPDATE_RIGHT:
         CheckUpdate(Session.UserName,TDataDirectory(DataDirectory));
      DELETE_RIGHT:
         CheckDelete(Session.UserName,TDataDirectory(DataDirectory));
      CREATE_RIGHT:
         CheckCreate(Session.UserName,TDataDirectory(DataDirectory));
      ALTER_RIGHT:
         CheckAlter(Session.UserName,TDataDirectory(DataDirectory));
      DROP_RIGHT:
         CheckDrop(Session.UserName,TDataDirectory(DataDirectory));
      RENAME_RIGHT:
         CheckRename(Session.UserName,TDataDirectory(DataDirectory));
      MAINTAIN_RIGHT:
         CheckMaintain(Session.UserName,TDataDirectory(DataDirectory));
      BACKUP_RIGHT:
         CheckBackup(Session.UserName,TDataDirectory(DataDirectory));
      RESTORE_RIGHT:
         CheckRestore(Session.UserName,TDataDirectory(DataDirectory));
      end;
end;

procedure TServerThread.DoOpenCursor;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempExclusive: Boolean;
   TempReadOnly: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckRead(Session.UserName,TempDataCursor.DataDirectory);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      Unpack(TempExclusive);
      Unpack(TempReadOnly);
      with TempDataCursor do
         begin
         TableName:=TempTableName;
         Exclusive:=TempExclusive;
         ReadOnly:=TempReadOnly;
         OpenCursor(False);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      if (TempDataCursor.DataTable.ClientUseCount=1) then
         PackTableInfo(TempDataCursor);
      PackCursorInfo(TempDataCursor);
      Pack(TempDataCursor.IndexPos,SizeOf(Byte));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoTextIndexParams;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackTextIndexParams(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.PackTableInfo(Cursor: TDataCursor);
var
   I: Word;
   TempDataHeader: TDataHeader;
   TempIndexHeader: TIndexHeader;
   TempBlobHeader: TBlobHeader;
   TempMarkedReadOnly: Boolean;
   TempReadOnly: Boolean;
   TempPassword: string;
begin
   with Cursor do
      begin
      if (not (IsRightSet(DataDirectory.ServerRights,INSERT_RIGHT) or
               IsRightSet(DataDirectory.ServerRights,UPDATE_RIGHT) or
               IsRightSet(DataDirectory.ServerRights,DELETE_RIGHT))) then
         TempReadOnly:=True
      else
         TempReadOnly:=DataTable.ReadOnly;
      TempMarkedReadOnly:=DataTable.MarkedReadOnly;
      Pack(TempReadOnly,SizeOf(Boolean));
      Pack(TempMarkedReadOnly,SizeOf(Boolean));
      GetDataHeader(TempDataHeader,TempPassword);
      Pack(TempDataHeader,SizeOf(TDataHeader));
      if (FClientVersion >= 4.16) then
         Pack(TempPassword[1],Length(TempPassword));
      for I:=1 to TempDataHeader.FieldCount do
         Pack(GetPhysicalFieldDefinitionByPos(I)^,SizeOf(TFieldDefinition));
      GetIndexHeader(TempIndexHeader);
      Pack(TempIndexHeader,SizeOf(TIndexHeader));
      for I:=0 to TempIndexHeader.IndexCount do
         Pack(GetIndexDefinition(I)^,SizeOf(TIndexDefinition));
      Pack(GetIndexDefinition(TEXT_INDEX_POS)^,SizeOf(TIndexDefinition));
      GetBlobHeader(TempBlobHeader);
      Pack(TempBlobHeader,SizeOf(TBlobHeader));
      end;
end;

procedure TServerThread.PackCursorInfo(Cursor: TDataCursor);
var
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempRecordNumber: Integer;
   TempRecordCount: Integer;
   TempPhysicalRecordsUsed: Integer;
   TempLastAutoIncID: Integer;
   TempLastUpdated: TDateTime;
   TempBOF: Boolean;
   TempEOF: Boolean;
begin
   with Cursor do
      begin
      TempRecordNumber:=RecordNumber;
      Pack(TempRecordNumber,SizeOf(Integer));
      TempRecordNumber:=PhysicalRecordNumber;
      Pack(TempRecordNumber,SizeOf(Integer));
      TempRecordCount:=RecordCount;
      Pack(TempRecordCount,SizeOf(Integer));
      TempPhysicalRecordsUsed:=PhysicalRecordsUsed;
      Pack(TempPhysicalRecordsUsed,SizeOf(Integer));
      TempLastAutoIncID:=LastAutoIncID;
      Pack(TempLastAutoIncID,SizeOf(Integer));
      TempLastUpdated:=LastUpdated;
      Pack(TempLastUpdated,SizeOf(TDateTime));
      TempRecordCount:=TotalRecordCount;
      Pack(TempRecordCount,SizeOf(Integer));
      GetBookmark(@TempBookmark);
      Pack(TempBookmark,BookmarkSize);
      TempBOF:=IsBOF;
      Pack(TempBOF,SizeOf(Boolean));
      TempEOF:=IsEOF;
      Pack(TempEOF,SizeOf(Boolean));
      end;
end;

procedure TServerThread.PackResultSetInfo(Cursor: TDataCursor);
begin
   with Cursor do
      begin
      Pack(Cursor,SizeOf(Integer));
      Pack(TableName[1],Length(TableName));
      Pack(Exclusive,SizeOf(Boolean));
      Pack(Temporary,SizeOf(Boolean));
      Pack(ResultSet,SizeOf(Boolean));
      Pack(SourceTable,SizeOf(Boolean));
      end;
end;

procedure TServerThread.PackResultSetFields(Cursor: TDataCursor);
var
   I: Word;
   TempExpTokenSize: Integer;
   TempExpTokenBuffer: PChar;
begin
   with Cursor do
      begin
      Pack(FieldCount,SizeOf(Word));
      for I:=1 to FieldCount do
         begin
         Pack(GetFieldDefinitionByPos(I)^,SizeOf(TFieldDefinition));
         if GetFieldDefinitionByPos(I)^.ExpressionField then
            begin
            if (FClientVersion <= 4.05) then
               TranslateExpressionTokens(TExpToken(GetFieldDefinitionByPos(I)^.ExpressionTokens));
            TempExpTokenSize:=PackExpressionTokens(TExpToken(GetFieldDefinitionByPos(I)^.ExpressionTokens),
                                                   TempExpTokenBuffer);
            try
               Pack(TempExpTokenSize,SizeOf(Integer));
               Pack(TempExpTokenBuffer^,TempExpTokenSize);
            finally
               DeAllocMem(TempExpTokenBuffer);
            end;
            end;
         end;
      end;
end;

procedure TServerThread.DoCloseCursor;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.CloseCursor(True);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoFreeCursor;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.Free;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSetIndexName;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempIndexName: string;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempIndexName[0]:=Char(Byte(Unpack(TempIndexName[1])));
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.IndexName:=TempIndexName;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSetToBegin;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.SetToBegin;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSetToEnd;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.SetToEnd;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSetToRecordNumber;
var
   TempDataCursor: TDataCursor;
   TempRecordNumber: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempRecordNumber);
      TempDataCursor.SetToRecordNumber(TempRecordNumber);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSetToDataCursor;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempSourceDataCursor: TDataCursor;
   TempSourceBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempSourceBOF: Boolean;
   TempSourceEOF: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempSourceDataCursor);
      Unpack(TempSourceBookmark);
      Unpack(TempSourceBOF);
      Unpack(TempSourceEOF);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempSourceDataCursor.VerifyBookmarkPosition(@TempSourceBookmark,
                                                  TempSourceBOF,TempSourceEOF);
      TempDataCursor.SetToDataCursor(TempSourceDataCursor);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetCurrentRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempLockIt: Boolean;
   TempRecordBuffer: PChar;
   TempResult: Word;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempLockIt);
         TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         TempResult:=TempDataCursor.GetCurrentRecord(TempRecordBuffer,TempLockIt);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempResult,SizeOf(Word));
         PackCursorInfo(TempDataCursor);
         Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.PackBlobBuffers(DataCursor: TDataCursor): Boolean;
var
   I: Integer;
begin
   Result:=False;
   { Write out all opened and blob buffers }
   for I:=0 to DataCursor.BlobBuffers.Count-1 do
      begin
      with TBlobBuffer(DataCursor.BlobBuffers[I]) do
         begin
         Pack(Size,SizeOf(Integer));
         if (Size > 0) then
            Pack(Buffer^,Size);
         end;
      end;
end;

procedure TServerThread.DoCloneCurrentRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempRecordBuffer: PChar;
   TempResult: Word;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         TempResult:=TempDataCursor.CloneCurrentRecord(TempRecordBuffer);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempResult,SizeOf(Word));
         PackCursorInfo(TempDataCursor);
         Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
         PackBlobBuffers(TempDataCursor);
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetNextRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempRecordsToGet: Integer;
   TempRecordBuffer: PChar;
   TempResult: Word;
   I: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempRecordsToGet);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      if (TempRecordsToGet > 1) then
         TempDataCursor.ServerSynched:=False;
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         for I:=1 to TempRecordsToGet do
            begin
            TempResult:=TempDataCursor.GetNextRecord(TempRecordBuffer);
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
            if (TempResult <> DBISAM_NONE) then
               Break;
            end;
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetPriorRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempRecordsToGet: Integer;
   TempRecordBuffer: PChar;
   TempResult: Word;
   I: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempRecordsToGet);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      if (TempRecordsToGet > 1) then
         TempDataCursor.ServerSynched:=False;
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         for I:=1 to TempRecordsToGet do
            begin
            TempResult:=TempDataCursor.GetPriorRecord(TempRecordBuffer);
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
            if (TempResult <> DBISAM_NONE) then
               Break;
            end;
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoReadFirstRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToGet: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
   TempResult: Word;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempRecordsToGet);
      TempRecordsBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.BookmarkSize));
         try
            TempResult:=TempDataCursor.ReadFirstRecordBlock(TempRecordsToGet,
                                                            TempRecordsBuffer,
                                                            TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsToGet,SizeOf(Integer));
            Pack(TempRecordsBuffer^,(TempRecordsToGet*TempDataCursor.RecordSize));
            Pack(TempBookmarksBuffer^,(TempRecordsToGet*TempDataCursor.BookmarkSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoReadNextRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToGet: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
   TempResult: Word;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempRecordsToGet);
      TempRecordsBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.BookmarkSize));
         try
            TempResult:=TempDataCursor.ReadNextRecordBlock(TempRecordsToGet,
                                                           TempRecordsBuffer,
                                                           TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsToGet,SizeOf(Integer));
            Pack(TempRecordsBuffer^,(TempRecordsToGet*TempDataCursor.RecordSize));
            Pack(TempBookmarksBuffer^,(TempRecordsToGet*TempDataCursor.BookmarkSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoReadPriorRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToGet: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
   TempResult: Word;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempRecordsToGet);
      TempRecordsBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.BookmarkSize));
         try
            TempResult:=TempDataCursor.ReadPriorRecordBlock(TempRecordsToGet,
                                                            TempRecordsBuffer,
                                                            TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsToGet,SizeOf(Integer));
            Pack(TempRecordsBuffer^,(TempRecordsToGet*TempDataCursor.RecordSize));
            Pack(TempBookmarksBuffer^,(TempRecordsToGet*TempDataCursor.BookmarkSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoReadLastRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToGet: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
   TempResult: Word;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempRecordsToGet);
      TempRecordsBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.BookmarkSize));
         try
            TempResult:=TempDataCursor.ReadLastRecordBlock(TempRecordsToGet,
                                                           TempRecordsBuffer,
                                                           TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsToGet,SizeOf(Integer));
            Pack(TempRecordsBuffer^,(TempRecordsToGet*TempDataCursor.RecordSize));
            Pack(TempBookmarksBuffer^,(TempRecordsToGet*TempDataCursor.BookmarkSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoReadAbsoluteRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToGet: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
   TempReadOffset: Integer;
   TempResult: Word;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempReadOffset);
      Unpack(TempRecordsToGet);
      TempRecordsBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.BookmarkSize));
         try
            TempResult:=TempDataCursor.ReadAbsoluteRecordBlock(TempReadOffset,
                                                               TempRecordsToGet,
                                                                 TempRecordsBuffer,
                                                                 TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsToGet,SizeOf(Integer));
            Pack(TempRecordsBuffer^,(TempRecordsToGet*TempDataCursor.RecordSize));
            Pack(TempBookmarksBuffer^,(TempRecordsToGet*TempDataCursor.BookmarkSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoReadBookmarkRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToGet: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
   TempResult: Word;
   TempRecordBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempReadOffset: Integer;
   TempResetPosition: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempReadOffset);
      Unpack(TempRecordBookmark);
      Unpack(TempResetPosition);
      Unpack(TempRecordsToGet);
      TempRecordsBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToGet*TempDataCursor.BookmarkSize));
         try
            TempResult:=TempDataCursor.ReadBookmarkRecordBlock(TempReadOffset,
                                                               TempRecordBookmark,
                                                               TempResetPosition,
                                                               TempRecordsToGet,
                                                               TempRecordsBuffer,
                                                               TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Word));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsToGet,SizeOf(Integer));
            Pack(TempRecordsBuffer^,(TempRecordsToGet*TempDataCursor.RecordSize));
            Pack(TempBookmarksBuffer^,(TempRecordsToGet*TempDataCursor.BookmarkSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoRefreshRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToRefresh: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempRecordsToRefresh);
      TempRecordsBuffer:=AllocMem((TempRecordsToRefresh*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToRefresh*TempDataCursor.BookmarkSize));
         try
            Unpack(TempRecordsBuffer^);
            Unpack(TempBookmarksBuffer^);
            TempDataCursor.RefreshRecordBlock(TempRecordsToRefresh,
                                              TempRecordsBuffer,TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsBuffer^,(TempRecordsToRefresh*TempDataCursor.RecordSize));
            Pack(TempBookmarksBuffer^,(TempRecordsToRefresh*TempDataCursor.BookmarkSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoAddRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsAdded: Integer;
   TempParamRecordBuffer: PChar;
   TempBookmarkBuffer: PChar;
   TempRecordBuffer: PChar;
   TempRecordBufferSize: Integer;
   TempOffset: Word;
   TempBlobCount: Integer;
   TempBlobSize: Integer;
   TempBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
   I: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         TempBookmarkBuffer:=AllocMem(TempDataCursor.BookmarkSize);
         try
            Unpack(TempRecordBuffer^);
            Unpack(TempBookmarkBuffer^);
            TempRecordBufferSize:=0;
            for I:=1 to TempDataCursor.FieldCount do
               begin
               with TempDataCursor.GetFieldDefinition(I)^ do
                  begin
                  if (DataType <> TYPE_BLOB) then
                     Inc(TempRecordBufferSize,(FLDCHG_DATA+DataSize))
                  else
                     Inc(TempRecordBufferSize,(FLDCHG_DATA+SizeOf(TBlobParam)));
                  end;
               end;
            if (TempRecordBufferSize > 0) then
               TempParamRecordBuffer:=AllocMem(TempRecordBufferSize)
            else
               TempParamRecordBuffer:=nil;
            try
               TempOffset:=0;
               TempBlobCount:=0;
               for I:=1 to TempDataCursor.FieldCount do
                  begin
                  with TempDataCursor.GetFieldDefinition(I)^ do
                     begin
                     Unpack((TempParamRecordBuffer+TempOffset)^);
                     if (DataType=TYPE_BLOB) then
                        begin
                        Inc(TempBlobCount);
                        TempBlobSize:=pBlobParam((TempParamRecordBuffer+FLDCHG_DATA+TempOffset))^.BlobLength;
                        TempBlobBuffers[TempBlobCount]:=AllocMem(TempBlobSize);
                        Unpack(TempBlobBuffers[TempBlobCount]^);
                        pBlobParam((TempParamRecordBuffer+FLDCHG_DATA+TempOffset))^.BlobBuffer:=
                                                         TempBlobBuffers[TempBlobCount];
                        Inc(TempOffset,(FLDCHG_DATA+SizeOf(TBlobParam)));
                        end
                     else
                        Inc(TempOffset,(FLDCHG_DATA+DataSize));
                     end;
                  end;
               try
                  TempDataCursor.AddRecordBlock(TempRecordsAdded,TempParamRecordBuffer,


                                                TempRecordBuffer,TempBookmarkBuffer);
                  FReplyHeader.ResultCode:=DBISAM_NONE;
                  BeginPack;
                  PackCursorInfo(TempDataCursor);
                  Pack(TempRecordsAdded,SizeOf(Integer));
                  Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
                  Pack(TempBookmarkBuffer^,TempDataCursor.BookmarkSize);
                  EndPack;
               finally
                  for I:=1 to TempBlobCount do
                     DeAllocMem(TempBlobBuffers[I]);
               end;
            finally
               DeAllocMem(TempParamRecordBuffer);
            end;
         finally
            DeAllocMem(TempBookmarkBuffer);
         end;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoUpdateRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsUpdated: Integer;
   TempParamRecordBuffer: PChar;
   TempBookmarkBuffer: PChar;
   TempRecordBuffer: PChar;
   TempRecordBufferSize: Integer;
   TempOffset: Word;
   TempBlobCount: Integer;
   TempBlobSize: Integer;
   TempBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
   I: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         TempBookmarkBuffer:=AllocMem(TempDataCursor.BookmarkSize);
         try
            Unpack(TempRecordBuffer^);
            Unpack(TempBookmarkBuffer^);
            TempRecordBufferSize:=0;
            for I:=1 to TempDataCursor.FieldCount do
               begin
               with TempDataCursor.GetFieldDefinition(I)^ do
                  begin
                  if (DataType <> TYPE_BLOB) then
                     Inc(TempRecordBufferSize,(FLDCHG_DATA+DataSize))
                  else
                     Inc(TempRecordBufferSize,(FLDCHG_DATA+SizeOf(TBlobParam)));
                  end;
               end;
            if (TempRecordBufferSize > 0) then
               TempParamRecordBuffer:=AllocMem(TempRecordBufferSize)
            else
               TempParamRecordBuffer:=nil;
            try
               TempOffset:=0;
               TempBlobCount:=0;
               for I:=1 to TempDataCursor.FieldCount do
                  begin
                  with TempDataCursor.GetFieldDefinition(I)^ do
                     begin
                     Unpack((TempParamRecordBuffer+TempOffset)^);
                     if (DataType=TYPE_BLOB) then
                        begin
                        Inc(TempBlobCount);
                        TempBlobSize:=pBlobParam((TempParamRecordBuffer+FLDCHG_DATA+TempOffset))^.BlobLength;
                        TempBlobBuffers[TempBlobCount]:=AllocMem(TempBlobSize);
                        Unpack(TempBlobBuffers[TempBlobCount]^);
                        pBlobParam((TempParamRecordBuffer+FLDCHG_DATA+TempOffset))^.BlobBuffer:=
                                                         TempBlobBuffers[TempBlobCount];
                        Inc(TempOffset,(FLDCHG_DATA+SizeOf(TBlobParam)));
                        end
                     else
                        Inc(TempOffset,(FLDCHG_DATA+DataSize));
                     end;
                  end;
               try
                  TempDataCursor.UpdateRecordBlock(TempRecordsUpdated,TempParamRecordBuffer,
                                                   TempRecordBuffer,TempBookmarkBuffer);
                  FReplyHeader.ResultCode:=DBISAM_NONE;
                  BeginPack;
                  PackCursorInfo(TempDataCursor);
                  Pack(TempRecordsUpdated,SizeOf(Integer));
                  Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
                  Pack(TempBookmarkBuffer^,TempDataCursor.BookmarkSize);
                  EndPack;
               finally
                  for I:=1 to TempBlobCount do
                     DeAllocMem(TempBlobBuffers[I]);
               end;
            finally
               DeAllocMem(TempParamRecordBuffer);
            end;
         finally
            DeAllocMem(TempBookmarkBuffer);
         end;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeleteRecordBlock;
var
   TempDataCursor: TDataCursor;
   TempRecordsToDelete: Integer;
   TempRecordsDeleted: Integer;
   TempRecordsBuffer: PChar;
   TempBookmarksBuffer: PChar;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempRecordsToDelete);
      TempRecordsBuffer:=AllocMem((TempRecordsToDelete*TempDataCursor.RecordSize));
      try
         TempBookmarksBuffer:=AllocMem((TempRecordsToDelete*TempDataCursor.BookmarkSize));
         try
            Unpack(TempRecordsBuffer^);
            Unpack(TempBookmarksBuffer^);
            TempRecordsDeleted:=0;
            TempDataCursor.DeleteRecordBlock(TempRecordsToDelete,TempRecordsDeleted,
                                             TempRecordsBuffer,TempBookmarksBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordsDeleted,SizeOf(Integer));
            Pack(TempRecordsBuffer^,(TempRecordsToDelete*TempDataCursor.RecordSize));
            EndPack;
         finally
            DeAllocMem(TempBookmarksBuffer);
         end;
      finally
         DeAllocMem(TempRecordsBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.UnpackBlobBuffers(RecordBuffer: PChar);
var
   TempBlobCount: Integer;
   TempBlobBuffer: TBlobBuffer;
   TempEngineAllocated: Boolean;
   TempBlobSize: Integer;
   TempBlobHandle: Integer;
   I: Integer;
begin
   Unpack(TempBlobCount);
   if (TempBlobCount > 0) then
      begin
      for I:=1 to TempBlobCount do
         begin
         Unpack(TempBlobBuffer);
         if (not TempBlobBuffer.IsObject) then
            DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
         with TempBlobBuffer do
            begin
            Unpack(TempEngineAllocated);
            EngineAllocated:=TempEngineAllocated;
            Unpack(TempBlobSize);
            Size:=0;
            Size:=TempBlobSize;
            if (TempBlobSize > 0) then
               Unpack(Buffer^);
            TempBlobHandle:=Integer(TempBlobBuffer);
            TempBlobHandle:=FlipIntegerSign(TempBlobHandle);
            DataCursor.PutField(FieldDefinition^.FieldNum,RecordBuffer,
                                @TempBlobHandle,True,(TempBlobBuffer.Size=0));
            IsDirty:=True;
            end;
         end;
      end;
end;

procedure TServerThread.DoAppendRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempRecordBuffer: PChar;
   TempRefreshFilter: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckInsert(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempRefreshFilter);
         TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         UnpackBlobBuffers(TempRecordBuffer);
         TempDataCursor.AppendRecord(TempRecordBuffer,TempRefreshFilter);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         PackCursorInfo(TempDataCursor);
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoModifyRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempRecordBuffer: PChar;
   TempUnlockIt: Boolean;
   TempRefreshFilter: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckUpdate(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempUnlockIt);
         Unpack(TempRefreshFilter);
         TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         UnpackBlobBuffers(TempRecordBuffer);
         TempDataCursor.ModifyRecord(TempRecordBuffer,TempUnlockIt,TempRefreshFilter);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         PackCursorInfo(TempDataCursor);
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoCancelRecord;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.CancelRecord;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeleteRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempRecordBuffer: PChar;
   TempRefreshFilter: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckDelete(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempRefreshFilter);
         TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         TempDataCursor.DeleteRecord(TempRecordBuffer,TempRefreshFilter);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         PackCursorInfo(TempDataCursor);
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoFlushBuffers;
var
   TempDataCursor: TDataCursor;
   TempForceFlush: Boolean;
   TempAdjustBuffers: Boolean;
   TempForceDataHeader: Boolean;
   TempForceIndexHeader: Boolean;
   TempForceBlobHeader: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempForceFlush);
      Unpack(TempAdjustBuffers);
      Unpack(TempForceDataHeader);
      Unpack(TempForceIndexHeader);
      Unpack(TempForceBlobHeader);
      TempDataCursor.FlushBuffers(TempForceFlush,TempAdjustBuffers,TempForceDataHeader,
                                  TempForceIndexHeader,TempForceBlobHeader);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoFlushOSBuffers;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.FlushOSBuffers;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoRefresh;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.Refresh;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSetToBookmark;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempNearSet: Boolean;
   TempSuppressChangeDetection: Boolean;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempNearSet);
      Unpack(TempSuppressChangeDetection);
      TempResult:=TempDataCursor.SetToBookmark(@TempBookmark,TempNearSet,
                                               TempSuppressChangeDetection);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoFind;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempKeyBuffer: array [0..MAX_KEYLEN-1] of Char;
   TempSearchFieldCount: Integer;
   TempIsSoftSeek: Boolean;
   TempPartialLength: Word;
   TempSendBuffer: Boolean;
   TempResult: Boolean;
   TempRecordBuffer: PChar;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempKeyBuffer);
      Unpack(TempSearchFieldCount);
      Unpack(TempIsSoftSeek);
      Unpack(TempPartialLength);
      Unpack(TempSendBuffer);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      if TempSendBuffer then
         begin
         TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
         try
            TempResult:=TempDataCursor.Find(True,@TempKeyBuffer,TempSearchFieldCount,
                                            TempIsSoftSeek,TempPartialLength,
                                            TempRecordBuffer);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Boolean));
            PackCursorInfo(TempDataCursor);
            Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
            EndPack;
         finally
            DeAllocMem(TempRecordBuffer);
         end;
         end
      else
         begin
         TempResult:=TempDataCursor.Find(True,@TempKeyBuffer,TempSearchFieldCount,
                                         TempIsSoftSeek,TempPartialLength,nil);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempResult,SizeOf(Boolean));
         PackCursorInfo(TempDataCursor);
         EndPack;
         end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoLocate;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempNumberOfFields: Word;
   TempKeyFields: TKeyFields;
   TempIsCaseInsensitive: Boolean;
   TempPartialLength: Word;
   TempSendBuffer: Boolean;
   TempResult: Boolean;
   TempRecordBuffer: PChar;
   TempNewRecordBuffer: PChar;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempNumberOfFields);
      Unpack(TempKeyFields);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempIsCaseInsensitive);
         Unpack(TempPartialLength);
         Unpack(TempSendBuffer);
         TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         if TempSendBuffer then
            begin
            TempNewRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
            try
               TempResult:=TempDataCursor.Locate(TempNumberOfFields,TempKeyFields,
                                                 TempRecordBuffer,TempIsCaseInsensitive,
                                                 TempPartialLength,TempNewRecordBuffer);
               FReplyHeader.ResultCode:=DBISAM_NONE;
               BeginPack;
               Pack(TempResult,SizeOf(Boolean));
               PackCursorInfo(TempDataCursor);
               Pack(TempNewRecordBuffer^,TempDataCursor.RecordSize);
               EndPack;
            finally
               DeAllocMem(TempNewRecordBuffer);
            end;
            end
         else
            begin
            TempResult:=TempDataCursor.Locate(TempNumberOfFields,TempKeyFields,
                                              TempRecordBuffer,TempIsCaseInsensitive,
                                              TempPartialLength,nil);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempResult,SizeOf(Boolean));
            PackCursorInfo(TempDataCursor);
            EndPack;
            end;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSetRange;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempBeginKeyBuffer: array [0..MAX_KEYLEN-1] of Char;
   TempBeginFieldCount: Integer;
   TempEndKeyBuffer: array [0..MAX_KEYLEN-1] of Char;
   TempEndFieldCount: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempBeginKeyBuffer);
      Unpack(TempBeginFieldCount);
      Unpack(TempEndKeyBuffer);
      Unpack(TempEndFieldCount);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.SetRange(True,@TempBeginKeyBuffer,TempBeginFieldCount,
                              @TempEndKeyBuffer,TempEndFieldCount);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoResetRange;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.ResetRange;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoLockTable;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.LockTable;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoUnlockTable;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempDataCursor.UnlockTable;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoUnlockRecord;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempRecordNumber: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempRecordNumber);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.UnlockRecord(TempRecordNumber,False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoLockSemaphore;
var
   TempDataCursor: TDataCursor;
   TempSemaphore: Integer;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempSemaphore);
      TempResult:=TempDataCursor.LockSemaphore(TempSemaphore);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoUnlockSemaphore;
var
   TempDataCursor: TDataCursor;
   TempSemaphore: Integer;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempSemaphore);
      TempResult:=TempDataCursor.UnlockSemaphore(TempSemaphore);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetDataHeader;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempDataHeader: TDataHeader;
   TempPassword: string;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      with TempDataCursor do
         begin
         TableName:=TempTableName;
         GetDataHeader(TempDataHeader,TempPassword);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDataHeader,SizeOf(TDataHeader));
      Pack(TempPassword[1],Length(TempPassword));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoTableExists;
var
   TempDataDirectory: TDataDirectory;
   TempTableName: string;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      TempResult:=TempDataDirectory.DataTableExists(TempTableName,False,False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoTableSize;
var
   TempDataCursor: TDataCursor;
   TempResult: Int64;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempResult:=TempDataCursor.TableSize;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Int64));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.PackTextIndexParams(DataCursor: TDataCursor);
var
   I: Integer;
   TempString: string;
begin
   with DataCursor do
      begin
      GetTextIndexParams;
      I:=TextStopWords.Count;
      Pack(I,SizeOf(Integer));
      for I:=0 to TextStopWords.Count-1 do
         Pack(TextStopWords[I][1],Length(TextStopWords[I]));
      TempString:=CharSetToString(TextSpaceChars);
      Pack(TempString[1],Length(TempString));
      TempString:=CharSetToString(TextIncludeChars);
      Pack(TempString[1],Length(TempString));
      end;
end;

procedure TServerThread.UnpackTextIndexParams(StopWords: TStrings;
                                              var StopWordsNil: Boolean;
                                              var SpaceChars: TCharSet;
                                              var IncludeChars: TCharSet);
var
   I: Integer;
   TempCount: Integer;
   TempString: string;
begin
   StopWords.Clear;
   Unpack(TempCount);
   if (TempCount <> -1) then
      begin
      StopWordsNil:=False;
      for I:=0 to TempCount-1 do
         begin
         TempString[0]:=Char(Byte(Unpack(TempString[1])));
         StopWords.Add(TempString);
         end;
      end
   else
      StopWordsNil:=True;
   TempString[0]:=Char(Byte(Unpack(TempString[1])));
   SpaceChars:=StringToCharSet(TempString);
   TempString[0]:=Char(Byte(Unpack(TempString[1])));
   IncludeChars:=StringToCharSet(TempString);
end;

procedure TServerThread.DoCreateTable;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempTemporary: Boolean;
   TempLocaleID: Integer;
   TempUserMajorVersion: Word;
   TempUserMinorVersion: Word;
   TempEncrypted: Boolean;
   TempPassword: string;
   TempDescription: string;
   TempIndexPageSize: Integer;
   TempBlobBlockSize: Integer;
   TempLastAutoIncID: Integer;
   TempStopWords: TStrings;
   TempStopWordsNil: Boolean;
   TempSpaceChars: TCharSet;
   TempIncludeChars: TCharSet;
   TempOverwriteExisting: Boolean;
   TempNumberOfFields: Word;
   TempFieldDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempNumberOfIndexes: Byte;
   TempIndexDefinitions: array[0..MAX_NUM_INDEXES] of pIndexDefinition;
   I: Integer;
begin
   TempNumberOfFields:=0;
   TempNumberOfIndexes:=0;
   FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
   FillChar(TempIndexDefinitions,SizeOf(TempIndexDefinitions),#0);
   try
      TempStopWords:=TStringList.Create;
      try
         Unpack(TempDataCursor);
         if (not TempDataCursor.IsObject) then
            DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
         CheckCreate(Session.UserName,TempDataCursor.DataDirectory);
         TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
         Unpack(TempTemporary);
         Unpack(TempLocaleID);
         Unpack(TempUserMajorVersion);
         Unpack(TempUserMinorVersion);
         Unpack(TempEncrypted);
         TempPassword[0]:=Char(Byte(Unpack(TempPassword[1])));
         TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
         Unpack(TempIndexPageSize);
         Unpack(TempBlobBlockSize);
         Unpack(TempLastAutoIncID);
         TempSpaceChars:=[];
         TempIncludeChars:=[];
         UnpackTextIndexParams(TempStopWords,TempStopWordsNil,
                               TempSpaceChars,TempIncludeChars);
         Unpack(TempOverwriteExisting);
         Unpack(TempNumberOfFields);
         try
            for I:=1 to TempNumberOfFields do
               begin
               TempFieldDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
               Unpack(TempFieldDefinitions[I]^);
               end;
            Unpack(TempNumberOfIndexes);
            for I:=0 to TempNumberOfIndexes do
               begin
               TempIndexDefinitions[I]:=AllocMem(SizeOf(TIndexDefinition));
               Unpack(TempIndexDefinitions[I]^);
               end;
            TempIndexDefinitions[TEXT_INDEX_POS]:=AllocMem(SizeOf(TIndexDefinition));
            Unpack(TempIndexDefinitions[TEXT_INDEX_POS]^);
            with TempDataCursor do
               begin
               TableName:=TempTableName;
               Exclusive:=True;
               ReadOnly:=False;
               Temporary:=TempTemporary;
               if TempStopWordsNil then
                  CreateTable(TempLocaleID,TempUserMajorVersion,
                              TempUserMinorVersion,TempEncrypted,TempPassword,
                              TempDescription,
                              TempIndexPageSize,TempBlobBlockSize,
                              TempLastAutoIncID,
                              nil,TempSpaceChars,TempIncludeChars,
                              TempOverwriteExisting,TempNumberOfFields,
                              TempFieldDefinitions,TempNumberOfIndexes,
                              TempIndexDefinitions)
               else
                  CreateTable(TempLocaleID,TempUserMajorVersion,
                              TempUserMinorVersion,TempEncrypted,TempPassword,
                              TempDescription,
                              TempIndexPageSize,TempBlobBlockSize,
                              TempLastAutoIncID,
                              TempStopWords,TempSpaceChars,TempIncludeChars,
                              TempOverwriteExisting,TempNumberOfFields,
                              TempFieldDefinitions,TempNumberOfIndexes,
                              TempIndexDefinitions);
               end;
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            EndPack;
         finally
            for I:=1 to TempNumberOfFields do
               DeAllocMem(TempFieldDefinitions[I]);
            for I:=0 to TempNumberOfIndexes-1 do
               DeAllocMem(TempIndexDefinitions[I]);
         end;
      finally
         TempStopWords.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.DataLostCallback(Cause: Byte;
                                        const ContextInfo: string;
                                        var Continue: Boolean;
                                        var StopAsking: Boolean): Boolean;
var
   TempCallbackType: Word;
begin
   Result:=False;
   if Terminated then
      Continue:=False
   else
      begin
      SaveReply;
      try
         Result:=False;
         FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
         BeginPack;
         TempCallbackType:=CALLBACK_DATALOST;
         Pack(TempCallbackType,SizeOf(Word));
         Pack(Cause,SizeOf(Byte));
         Pack(ContextInfo[1],Length(ContextInfo));
         Pack(Continue,SizeOf(Boolean));
         Pack(StopAsking,SizeOf(Boolean));
         EndPack;
         if (not Send) then
            CloseConnection;
         case ReceiveCallback of
            RECEIVE_PRESENT:
               begin
               Unpack(Continue);
               Unpack(StopAsking);
               end;
            RECEIVE_ERROR,RECEIVE_NONE:
               Continue:=False;
            end;
      finally
         RestoreReply;
      end;
      end;
end;

procedure TServerThread.DoAlterTable;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempLocaleID: Integer;
   TempUserMajorVersion: Word;
   TempUserMinorVersion: Word;
   TempEncrypted: Boolean;
   TempPassword: string;
   TempDescription: string;
   TempIndexPageSize: Integer;
   TempBlobBlockSize: Integer;
   TempLastAutoIncID: Integer;
   TempStopWords: TStrings;
   TempStopWordsNil: Boolean;
   TempSpaceChars: TCharSet;
   TempIncludeChars: TCharSet;
   TempSuppressBackups: Boolean;
   TempSendProgress: Boolean;
   TempSendDataLost: Boolean;
   TempNumberOfFields: Word;
   TempFieldDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempNumberOfIndexes: Byte;
   TempIndexDefinitions: array[0..MAX_NUM_INDEXES] of pIndexDefinition;
   I: Integer;
begin
   TempNumberOfFields:=0;
   TempNumberOfIndexes:=0;
   FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
   FillChar(TempIndexDefinitions,SizeOf(TempIndexDefinitions),#0);
   try
      TempStopWords:=TStringList.Create;
      try
         Unpack(TempDataCursor);
         if (not TempDataCursor.IsObject) then
            DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
         CheckAlter(Session.UserName,TempDataCursor.DataDirectory);
         TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
         Unpack(TempLocaleID);
         Unpack(TempUserMajorVersion);
         Unpack(TempUserMinorVersion);
         Unpack(TempEncrypted);
         TempPassword[0]:=Char(Byte(Unpack(TempPassword[1])));
         TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
         Unpack(TempIndexPageSize);
         Unpack(TempBlobBlockSize);
         Unpack(TempLastAutoIncID);
         TempSpaceChars:=[];
         TempIncludeChars:=[];
         UnpackTextIndexParams(TempStopWords,TempStopWordsNil,
                               TempSpaceChars,TempIncludeChars);
         Unpack(TempSuppressBackups);
         Unpack(TempSendProgress);
         Unpack(TempSendDataLost);
         Unpack(TempNumberOfFields);
         try
            for I:=1 to TempNumberOfFields do
               begin
               TempFieldDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
               Unpack(TempFieldDefinitions[I]^);
               end;
            Unpack(TempNumberOfIndexes);
            for I:=0 to TempNumberOfIndexes do
               begin
               TempIndexDefinitions[I]:=AllocMem(SizeOf(TIndexDefinition));
               Unpack(TempIndexDefinitions[I]^);
               end;
            TempIndexDefinitions[TEXT_INDEX_POS]:=AllocMem(SizeOf(TIndexDefinition));
            Unpack(TempIndexDefinitions[TEXT_INDEX_POS]^);
            with TempDataCursor do
               begin
               TableName:=TempTableName;
               Exclusive:=True;
               ReadOnly:=False;
               if TempSendProgress then
                  SetProgressCallback(Integer(Self),
                                           @TServerThread.ProgressCallback);
               if TempSendDataLost then
                  SetDataLostCallback(Integer(Self),@TServerThread.DataLostCallback);
               if TempStopWordsNil then
                  AlterTable(TempLocaleID,TempUserMajorVersion,
                             TempUserMinorVersion,TempEncrypted,TempPassword,
                             TempDescription,
                             TempIndexPageSize,TempBlobBlockSize,
                             TempLastAutoIncID,nil,TempSpaceChars,
                             TempIncludeChars,TempSuppressBackups,False,False,
                             TempNumberOfFields,TempFieldDefinitions,
                             TempNumberOfIndexes,TempIndexDefinitions)
               else
                  AlterTable(TempLocaleID,TempUserMajorVersion,
                             TempUserMinorVersion,TempEncrypted,TempPassword,
                             TempDescription,
                             TempIndexPageSize,TempBlobBlockSize,
                             TempLastAutoIncID,TempStopWords,TempSpaceChars,
                             TempIncludeChars,TempSuppressBackups,False,False,
                             TempNumberOfFields,TempFieldDefinitions,
                             TempNumberOfIndexes,TempIndexDefinitions);
               end;
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            EndPack;
         finally
            for I:=1 to TempNumberOfFields do
               DeAllocMem(TempFieldDefinitions[I]);
            for I:=0 to TempNumberOfIndexes-1 do
               DeAllocMem(TempIndexDefinitions[I]);
         end;
      finally
         TempStopWords.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.SteppedProgressCallback(const RepairStep: string;
                                               PercentDone: Word): Boolean;
var
   TempCallbackType: Word;
begin
   SaveReply;
   try
      Result:=False;
      FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
      BeginPack;
      TempCallbackType:=CALLBACK_STEPPEDPROGRESS;
      Pack(TempCallbackType,SizeOf(Word));
      Pack(RepairStep[1],Length(RepairStep));
      Pack(PercentDone,SizeOf(Word));
      EndPack;
      Send;
   finally
      RestoreReply;
   end;
end;

function TServerThread.LogCallback(const LogMessage: string): Boolean;
var
   TempCallbackType: Word;
begin
   SaveReply;
   try
      Result:=False;
      FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
      BeginPack;
      TempCallbackType:=CALLBACK_LOG;
      Pack(TempCallbackType,SizeOf(Word));
      Pack(LogMessage[1],Length(LogMessage));
      EndPack;
      Send;
   finally
      RestoreReply;
   end;
end;

procedure TServerThread.DoRepairTable;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempVerifyOnly: Boolean;
   TempFixBlobSignatures: Boolean;
   TempSendProgress: Boolean;
   TempSendLog: Boolean;
   TempForceIndexRebuild: Boolean;
   TempResult: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckMaintain(Session.UserName,TempDataCursor.DataDirectory);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      Unpack(TempVerifyOnly);
      Unpack(TempFixBlobSignatures);
      Unpack(TempSendProgress);
      Unpack(TempSendLog);
      Unpack(TempForceIndexRebuild);
      with TempDataCursor do
         begin
         TableName:=TempTableName;
         Exclusive:=True;
         ReadOnly:=False;
         if TempSendProgress then
            SetSteppedProgressCallback(Integer(Self),@TServerThread.SteppedProgressCallback);
         if TempSendLog then
            SetLogCallback(Integer(Self),@TServerThread.LogCallback);
         TempResult:=RepairTable(TempVerifyOnly,TempFixBlobSignatures,False,False,
                                 TempForceIndexRebuild);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoUpgradeTable;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempSendProgress: Boolean;
   TempSendLog: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckMaintain(Session.UserName,TempDataCursor.DataDirectory);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      Unpack(TempSendProgress);
      Unpack(TempSendLog);
      with TempDataCursor do
         begin
         TableName:=TempTableName;
         Exclusive:=True;
         ReadOnly:=False;
         if TempSendProgress then
            SetSteppedProgressCallback(Integer(Self),@TServerThread.SteppedProgressCallback);
         if TempSendLog then
            SetLogCallback(Integer(Self),@TServerThread.LogCallback);
         UpgradeTable(False,False);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoEmptyTable;
var
   TempDataCursor: TDataCursor;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckDelete(Session.UserName,TempDataCursor.DataDirectory);
      TempDataCursor.EmptyTable;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeleteTable;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckDrop(Session.UserName,TempDataCursor.DataDirectory);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      with TempDataCursor do
         begin
         TableName:=TempTableName;
         Exclusive:=True;
         ReadOnly:=False;
         DeleteTable;
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoRenameTable;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempNewTableName: string;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckRename(Session.UserName,TempDataCursor.DataDirectory);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      TempNewTableName[0]:=Char(Byte(Unpack(TempNewTableName[1])));
      with TempDataCursor do
         begin
         TableName:=TempTableName;
         Exclusive:=True;
         ReadOnly:=False;
         RenameTable(TempNewTableName);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoOptimizeTable;
var
   TempDataCursor: TDataCursor;
   TempTableName: string;
   TempOptimizeIndexName: string;
   TempSuppressBackups: Boolean;
   TempSendProgress: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckMaintain(Session.UserName,TempDataCursor.DataDirectory);
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      TempOptimizeIndexName[0]:=Char(Byte(Unpack(TempOptimizeIndexName[1])));
      Unpack(TempSuppressBackups);
      Unpack(TempSendProgress);
      with TempDataCursor do
         begin
         TableName:=TempTableName;
         Exclusive:=True;
         ReadOnly:=False;
         if TempSendProgress then
            SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback);
         OptimizeTable(TempOptimizeIndexName,TempSuppressBackups,False);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoImportTable;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempImportFile: string;
   TempDelimiter: Char;
   TempNumberOfFields: Word;
   TempFieldDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempDateFormat: string;
   TempTimeFormat: string;
   TempDecSeparator: Char;
   TempReadHeaders: Boolean;
   TempSendProgress: Boolean;
   I: Integer;
begin
   FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckInsert(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempImportFile[0]:=Char(Byte(Unpack(TempImportFile[1])));
      Unpack(TempDelimiter);
      Unpack(TempNumberOfFields);
      try
         for I:=1 to TempNumberOfFields do
            begin
            TempFieldDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
            Unpack(TempFieldDefinitions[I]^);
            end;
         TempDateFormat[0]:=Char(Byte(Unpack(TempDateFormat[1])));
         TempTimeFormat[0]:=Char(Byte(Unpack(TempTimeFormat[1])));
         Unpack(TempDecSeparator);
         Unpack(TempReadHeaders);
         Unpack(TempSendProgress);
         with TempDataCursor do
            begin
            VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
            if TempSendProgress then
               SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback);
            ImportTable(TempImportFile,TempDelimiter,TempNumberOfFields,
                        TempFieldDefinitions,TempDateFormat,TempTimeFormat,
                        TempDecSeparator,TempReadHeaders,False);
            end;
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         PackCursorInfo(TempDataCursor);
         EndPack;
      finally
         for I:=1 to TempNumberOfFields do
            DeAllocMem(TempFieldDefinitions[I]);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoExportTable;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempExportFile: string;
   TempDelimiter: Char;
   TempNumberOfFields: Word;
   TempFieldDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempDateFormat: string;
   TempTimeFormat: string;
   TempDecSeparator: Char;
   TempWriteHeaders: Boolean;
   TempSendProgress: Boolean;
   I: Integer;
begin
   FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempExportFile[0]:=Char(Byte(Unpack(TempExportFile[1])));
      Unpack(TempDelimiter);
      Unpack(TempNumberOfFields);
      try
         for I:=1 to TempNumberOfFields do
            begin
            TempFieldDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
            Unpack(TempFieldDefinitions[I]^);
            end;
         TempDateFormat[0]:=Char(Byte(Unpack(TempDateFormat[1])));
         TempTimeFormat[0]:=Char(Byte(Unpack(TempTimeFormat[1])));
         Unpack(TempDecSeparator);
         Unpack(TempWriteHeaders);
         Unpack(TempSendProgress);
         with TempDataCursor do
            begin
            VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
            if TempSendProgress then
               SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback);
            ExportTable(TempExportFile,TempDelimiter,TempNumberOfFields,
                        TempFieldDefinitions,TempDateFormat,TempTimeFormat,
                        TempDecSeparator,TempWriteHeaders,False);
            end;
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         PackCursorInfo(TempDataCursor);
         EndPack;
      finally
         for I:=1 to TempNumberOfFields do
            DeAllocMem(TempFieldDefinitions[I]);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoCopyTable;
var
   TempDataCursor: TDataCursor;
   TempDataDirectoryName: string;
   TempTableName: string;
   TempCopyIndexes: Boolean;
   TempSendProgress: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckCreate(Session.UserName,TempDataCursor.DataDirectory);
      TempDataDirectoryName[0]:=Char(Byte(Unpack(TempDataDirectoryName[1])));
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      Unpack(TempCopyIndexes);
      Unpack(TempSendProgress);
      with TempDataCursor do
         begin
         if TempSendProgress then
            SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback)
         else
            SetProgressCallback(0,nil);
         CopyTable(TempDataDirectoryName,TempTableName,TempCopyIndexes,False);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.ProgressCallback(PercentDone: Word): Boolean;
var
   TempCallbackType: Word;
begin
   SaveReply;
   try
      Result:=False;
      FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
      BeginPack;
      TempCallbackType:=CALLBACK_PROGRESS;
      Pack(TempCallbackType,SizeOf(Word));
      Pack(PercentDone,SizeOf(Word));
      EndPack;
      Send;
   finally
      RestoreReply;
   end;
end;

procedure TServerThread.DoAddPrimaryIndex;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempIndexDefinition: TIndexDefinition;
   TempSendProgress: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckCreate(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempIndexDefinition);
      Unpack(TempSendProgress);
      with TempDataCursor do
         begin
         VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         if TempSendProgress then
            SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback)
         else
            SetProgressCallback(0,nil);
         AddPrimaryIndex(@TempIndexDefinition,False,False);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoAddSecondaryIndex;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempIndexDefinition: TIndexDefinition;
   TempSendProgress: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckCreate(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempIndexDefinition);
      Unpack(TempSendProgress);
      with TempDataCursor do
         begin
         VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         if TempSendProgress then
            SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback)
         else
            SetProgressCallback(0,nil);
         AddSecondaryIndex(@TempIndexDefinition,False,False);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeleteIndex;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempDeleteIndexName: string;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckDrop(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempDeleteIndexName[0]:=Char(Byte(Unpack(TempDeleteIndexName[1])));
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.DeleteIndex(TempDeleteIndexName);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeleteAllIndexes;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckDrop(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.DeleteAllIndexes;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoOpenBlob;
var
   TempDataCursor: TDataCursor;
   TempFieldNum: Word;
   TempRecordBuffer: PChar;
   TempMode: Byte;
   TempUsePhysicalFields: Boolean;
   TempSize: Integer;
   TempHandle: Integer;
   IsBlank: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempFieldNum);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempMode);
         Unpack(TempUsePhysicalFields);
         TempSize:=0;
         TempDataCursor.OpenBlob(TempFieldNum,TempRecordBuffer,
                                 TempMode,TempUsePhysicalFields,
                                 False,TempSize,False);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
         Pack(TempSize,SizeOf(Integer));
         if TempUsePhysicalFields then
            TempDataCursor.GetPhysicalField(TempFieldNum,TempRecordBuffer,@TempHandle,IsBlank)
         else
            TempDataCursor.GetField(TempFieldNum,TempRecordBuffer,@TempHandle,IsBlank);
         TempHandle:=FlipIntegerSign(TempHandle);
         with TBlobBuffer(TempHandle) do
            Pack(Buffer^,TempSize);
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoFreeBlob;
var
   TempDataCursor: TDataCursor;
   TempFieldNum: Word;
   TempRecordBuffer: PChar;
   TempUsePhysicalFields: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempFieldNum);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempUsePhysicalFields);
         TempDataCursor.FreeBlob(TempFieldNum,TempRecordBuffer,
                                 TempUsePhysicalFields,False);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoFreeAllBlobs;
var
   TempDataCursor: TDataCursor;
   TempForceFree: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempForceFree);
      TempDataCursor.FreeAllBlobs(TempForceFree,False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetBlob;
var
   TempDataCursor: TDataCursor;
   TempFieldNum: Word;
   TempRecordBuffer: PChar;
   TempOffset: Integer;
   TempBuffer: PChar;
   TempReadBytes: Integer;
   TempUsePhysicalFields: Boolean;
   TempActualBytes: Integer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempFieldNum);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempOffset);
         Unpack(TempReadBytes);
         Unpack(TempUsePhysicalFields);
         TempBuffer:=AllocMem(TempReadBytes);
         try
            TempDataCursor.GetBlob(TempFieldNum,TempRecordBuffer,
                                   TempOffset,TempBuffer,TempReadBytes,
                                   TempActualBytes,TempUsePhysicalFields);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempActualBytes,SizeOf(Integer));
            Pack(TempBuffer^,TempActualBytes);
            EndPack;
         finally
            DeAllocMem(TempBuffer);
         end;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoPutBlob;
var
   TempDataCursor: TDataCursor;
   TempFieldNum: Word;
   TempRecordBuffer: PChar;
   TempOffset: Integer;
   TempBuffer: PChar;
   TempWriteBytes: Integer;
   TempUsePhysicalFields: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempFieldNum);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempOffset);
         Unpack(TempWriteBytes);
         TempBuffer:=AllocMem(TempWriteBytes);
         try
            Unpack(TempBuffer^);
            Unpack(TempUsePhysicalFields);
            TempDataCursor.PutBlob(TempFieldNum,TempRecordBuffer,
                                   TempOffset,TempBuffer,TempWriteBytes,
                                   TempUsePhysicalFields);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
            EndPack;
         finally
            DeAllocMem(TempBuffer);
         end;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoTruncateBlob;
var
   TempDataCursor: TDataCursor;
   TempFieldNum: Word;
   TempRecordBuffer: PChar;
   TempNewBytes: Integer;
   TempUsePhysicalFields: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempFieldNum);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempNewBytes);
         Unpack(TempUsePhysicalFields);
         TempDataCursor.TruncateBlob(TempFieldNum,TempRecordBuffer,
                                     TempNewBytes,TempUsePhysicalFields);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempRecordBuffer^,TempDataCursor.RecordSize);
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetBlobSize;
var
   TempDataCursor: TDataCursor;
   TempFieldNum: Word;
   TempRecordBuffer: PChar;
   TempSize: Integer;
   TempUsePhysicalFields: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempFieldNum);
      TempRecordBuffer:=AllocMem(TempDataCursor.RecordSize);
      try
         Unpack(TempRecordBuffer^);
         Unpack(TempUsePhysicalFields);
         TempSize:=0;
         TempDataCursor.GetBlobSize(TempFieldNum,TempRecordBuffer,
                                    TempSize,TempUsePhysicalFields);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempSize,SizeOf(Integer));
         EndPack;
      finally
         DeAllocMem(TempRecordBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoAddExprFilter;
var
   TempDataCursor: TDataCursor;
   TempExpTokenSize: Integer;
   TempExpTokenBuffer: PChar;
   TempExpToken: TExpToken;
   TempFreeTokens: Boolean;
   TempUseExistingBitmaps: Boolean;
   TempGetCounts: Boolean;
   TempPerformIOCheck: Boolean;
   TempFilterHandle: Pointer;
   TempOptimizeLevel: TOptimizeLevel;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempExpTokenSize);
      TempExpTokenBuffer:=AllocMem(TempExpTokenSize);
      try
         Unpack(TempExpTokenBuffer^);
         UnpackExpressionTokens(TempExpTokenBuffer,TempExpToken);
         if (FClientVersion <= 4.05) then
            UntranslateExpressionTokens(TempExpToken);
         Unpack(TempFreeTokens);
         Unpack(TempUseExistingBitmaps);
         if (FClientVersion < 4.11) then
            Unpack(TempPerformIOCheck);
         Unpack(TempGetCounts);
         TempDataCursor.AddFilter(0,nil,TempExpToken,TempFreeTokens,nil,
                                  TempUseExistingBitmaps,TempGetCounts,
                                  False,False,TempFilterHandle);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         Pack(TempFilterHandle,SizeOf(Integer));
         if (TempFilterHandle <> nil) then
            TempOptimizeLevel:=TFilter(TempFilterHandle).OptimizeLevel;
         Pack(TempOptimizeLevel,SizeOf(TOptimizeLevel));
         EndPack;
      finally
         DeAllocMem(TempExpTokenBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.FilterCallback(RecordSize: Integer; RecordBuffer: Pointer;
                                      RecordNum: Integer): Boolean;
var
   TempCallbackType: Word;
begin
   SaveReply;
   try
      Result:=True;
      FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
      BeginPack;
      TempCallbackType:=CALLBACK_FILTER;
      Pack(TempCallbackType,SizeOf(Word));
      Pack(RecordBuffer^,RecordSize);
      Pack(RecordNum,SizeOf(Integer));
      EndPack;
      if (not Send) then
         CloseConnection;
      case ReceiveCallback of
         RECEIVE_PRESENT:
            Unpack(Result);
         RECEIVE_ERROR,RECEIVE_NONE:
            Result:=False;
         end;
   finally
      RestoreReply;
   end;
end;

procedure TServerThread.DoAddCallbackFilter;
var
   TempDataCursor: TDataCursor;
   TempUseExistingBitmaps: Boolean;
   TempGetCounts: Boolean;
   TempPerformIOCheck: Boolean;
   TempFilterHandle: Pointer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempUseExistingBitmaps);
      if (FClientVersion < 4.11) then
         Unpack(TempPerformIOCheck);
      Unpack(TempGetCounts);
      TempDataCursor.AddFilter(Integer(Self),nil,nil,False,
                               pFilterFunction(@TServerThread.FilterCallback),
                               TempUseExistingBitmaps,TempGetCounts,
                               False,False,TempFilterHandle);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempFilterHandle,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDropFilter;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempFilterHandle: Pointer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempFilterHandle);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.DropFilter(TempFilterHandle,False);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoActivateFilter;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempFilterHandle: Pointer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempFilterHandle);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.ActivateFilter(TempFilterHandle);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      if (ClientVersion >= 4.06) then
         Pack(TempDataCursor.FilterExecutionTime,SizeOf(double));
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoDeactivateFilter;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempFilterHandle: Pointer;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempFilterHandle);
      TempDataCursor.VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
      TempDataCursor.DeactivateFilter(TempFilterHandle);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      PackCursorInfo(TempDataCursor);
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoCreateStatement;
var
   TempQueryStatement: TQueryStatement;
   TempDataDirectory: TDataDirectory;
begin
   try
      TempQueryStatement:=nil;
      Unpack(TempDataDirectory);
      if (not TempDataDirectory.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempQueryStatement:=TQueryStatement.Create(TempDataDirectory);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempQueryStatement,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         begin
         if (TempQueryStatement <> nil) then
            TempQueryStatement.Free;
         ProcessException(E);
         end;
   end;
end;

procedure TServerThread.DoPrepareStatement;
var
   TempQueryStatement: TQueryStatement;
   TempSQLTextSize: Integer;
   TempSQLText: PChar;
   TempWantLiveResult: Boolean;
   TempMaxNumOfRows: Integer;
   TempLineOffset: Integer;
   TempColumnOffset: Integer;
begin
   try
      Unpack(TempQueryStatement);
      if (not TempQueryStatement.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempSQLTextSize);
      TempSQLText:=AllocMem(TempSQLTextSize+1);
      try
         Unpack(TempSQLText^);
         Unpack(TempWantLiveResult);
         Unpack(TempMaxNumOfRows);
         if (FClientVersion >= 4.09) then
            begin
            Unpack(TempLineOffset);
            Unpack(TempColumnOffset);
            end
         else
            begin
            TempLineOffset:=1;
            TempColumnOffset:=1;
            end;
         with TempQueryStatement do
            begin
            WantLiveResult:=TempWantLiveResult;
            MaxNumOfRows:=TempMaxNumOfRows;
            PrepareStatement(TempSQLText,TempLineOffset,TempColumnOffset);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(StatementType,SizeOf(Byte));
            Pack(IsLiveResult,SizeOf(Boolean));
            Pack(InplaceResult,SizeOf(Boolean));
            Pack(SelectAllColumns,SizeOf(Boolean));
            if (ClientVersion > 4.03) then
               Pack(ParametersCount,SizeOf(Integer));
            if (StatementType=SELECT_STATEMENT) then
               begin
               { Version 5 }
               if (not IsLiveResult) then
                  ResultTable.DataDirectory.ServerRights:=FDataServer.Configuration.GetAdminRights
               else
                  begin
                  if (AnsiCompareText(ResultTable.DataDirectory.Name,INMEMORY_DATABASE_NAME)=0) then
                     ResultTable.DataDirectory.ServerRights:=FDataServer.Configuration.GetAdminRights
                  else
                     ResultTable.DataDirectory.ServerRights:=FDataServer.Configuration.GetDatabaseRights(Session.UserName,
                                                                                                         ResultTable.DataDirectory.Name);
                  end;
               { Version 5 }
               if IsLiveResult then
                  begin
                  Pack(ResultTable.DataDirectory.Name[1],Length(ResultTable.DataDirectory.Name));
                  { Version 5 }
                  if (ClientVersion >= 4.24) then
                     Pack(ResultTable.DataDirectory,SizeOf(Integer));
                  { Version 5 }
                  PackResultSetInfo(ResultTable);
                  if (ResultTable.DataTable.ClientUseCount=1) then
                     PackTableInfo(ResultTable);
                  PackCursorInfo(ResultTable);
                  Pack(ResultTable.IndexPos,SizeOf(Byte));
                  if (not SelectAllColumns) then
                     PackResultSetFields(ResultTable);
                  end
               else
                  begin
                  PackResultSetInfo(ResultTable);
                  PackTableInfo(ResultTable);
                  PackCursorInfo(ResultTable);
                  Pack(ResultTable.IndexPos,SizeOf(Byte));
                  end;
               end
            else
               Pack(TableName[1],Length(TableName));
            EndPack;
            end;
      finally
         DeAllocMem(TempSQLText);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.AbortProgressCallback(PercentDone: Word;
                                             var Abort: Boolean): Boolean;
var
   TempCallbackType: Word;
begin
   Result:=False;
   if Terminated then
      Abort:=True
   else
      begin
      SaveReply;
      try
         Result:=False;
         FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
         BeginPack;
         TempCallbackType:=CALLBACK_ABORTPROGRESS;
         Pack(TempCallbackType,SizeOf(Word));
         Pack(PercentDone,SizeOf(Word));
         Pack(Abort,SizeOf(Boolean));
         EndPack;
         if (not Send) then
            CloseConnection;
         case ReceiveCallback of
            RECEIVE_PRESENT:
               Unpack(Abort);
            RECEIVE_ERROR,RECEIVE_NONE:
               Result:=False;
            end;
      finally
         RestoreReply;
      end;
      end;
end;

procedure TServerThread.PackParameters(ParamCount: Word;
                                       const ParamDefinitions: array of pFieldDefinition;
                                       RecordBuffer: PChar);
var
   I: Integer;
begin
   if (RecordBuffer <> nil) then
      begin
      Pack(ParamCount,SizeOf(Word));
      for I:=0 to (ParamCount-1) do
         Pack(ParamDefinitions[I]^,SizeOf(TFieldDefinition));
      for I:=0 to (ParamCount-1) do
         begin
         with ParamDefinitions[I]^ do
            begin
            if (DataType <> TYPE_BLOB) then
               Pack((RecordBuffer+Offset)^,(FLDCHG_DATA+DataSize))
            else
               begin
               Pack((RecordBuffer+Offset)^,(FLDCHG_DATA+DataSize));
               Pack(pBlobParam((RecordBuffer+FLDCHG_DATA+Offset))^.BlobBuffer^,
                    pBlobParam((RecordBuffer+FLDCHG_DATA+Offset))^.BlobLength);
               end;
            end;
         end;
      end
   else
      begin
      ParamCount:=0;
      Pack(ParamCount,SizeOf(Word));
      end;
end;

procedure TServerThread.UnpackParameters(out OutParamCount: Word;
                                         out OutParamDefinitions: array of pFieldDefinition;
                                         out OutRecordBuffer: PChar;
                                         out OutBlobCount: Word;
                                         out OutBlobBuffers: array of PChar);
var
   I: Integer;
   TempRecordBufferSize: Integer;
   TempBlobSize: Integer;
begin
   Unpack(OutParamCount);
   for I:=0 to (OutParamCount-1) do
      begin
      OutParamDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
      Unpack(OutParamDefinitions[I]^);
      end;
   TempRecordBufferSize:=0;
   for I:=0 to (OutParamCount-1) do
      begin
      with OutParamDefinitions[I]^ do
         Inc(TempRecordBufferSize,(FLDCHG_DATA+DataSize));
      end;
   OutBlobCount:=0;
   if (TempRecordBufferSize > 0) then
      OutRecordBuffer:=AllocMem(TempRecordBufferSize)
   else
      OutRecordBuffer:=nil;
   for I:=0 to (OutParamCount-1) do
      begin
      with OutParamDefinitions[I]^ do
         begin
         Unpack((OutRecordBuffer+Offset)^);
         if (DataType=TYPE_BLOB) then
            begin
            TempBlobSize:=pBlobParam((OutRecordBuffer+FLDCHG_DATA+Offset))^.BlobLength;
            OutBlobBuffers[OutBlobCount]:=AllocMem(TempBlobSize);
            Unpack(OutBlobBuffers[OutBlobCount]^);
            pBlobParam((OutRecordBuffer+FLDCHG_DATA+Offset))^.BlobBuffer:=
                                             OutBlobBuffers[OutBlobCount];
            Inc(OutBlobCount);
            end;
         end;
      end;
end;

procedure TServerThread.DoExecuteStatement;
var
   TempQueryStatement: TQueryStatement;
   TempDataCursor: TDataCursor;
   I: Integer;
   TempParamCount: Word;
   TempParamDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempRecordBuffer: PChar;
   TempBlobCount: Word;
   TempBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
   TempGenPlan: Boolean;
   TempPlanSize: Integer;
   TempPlanText: AnsiString;
   TempSendProgress: Boolean;
   TempSendDataLost: Boolean;
   TempSendLog: Boolean;
   TempTableCount: Integer;
   TempTableName: string;
begin
   try
      Unpack(TempQueryStatement);
      if (not TempQueryStatement.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      UnpackParameters(TempParamCount,TempParamDefinitions,TempRecordBuffer,
                       TempBlobCount,TempBlobBuffers);
      try
         if (FClientVersion >= 4.11) then
            Unpack(TempGenPlan)
         else
            TempGenPlan:=False;
         Unpack(TempSendProgress);
         Unpack(TempSendDataLost);
         Unpack(TempSendLog);
         with TempQueryStatement do
            begin
            case StatementType of
               SELECT_STATEMENT,INSERT_STATEMENT,UPDATE_STATEMENT,
               DELETE_STATEMENT:
                  begin
                  if TempSendProgress then
                     SetAbortProgressCallback(Integer(Self),@TServerThread.AbortProgressCallback)
                  else
                     SetAbortProgressCallback(0,nil);
                  end;
               ALTER_TABLE_STATEMENT:
                  begin
                  if TempSendProgress then
                     SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback)
                  else
                     SetProgressCallback(0,nil);
                  if TempSendDataLost then
                     SetDataLostCallback(Integer(Self),@TServerThread.DataLostCallback)
                  else
                     SetDataLostCallback(0,nil);
                  end;
               OPTIMIZE_TABLE_STATEMENT,CREATE_INDEX_STATEMENT,
               EXPORT_TABLE_STATEMENT,IMPORT_TABLE_STATEMENT:
                  begin
                  if TempSendProgress then
                     SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback)
                  else
                     SetProgressCallback(0,nil);
                  end;
               VERIFY_TABLE_STATEMENT,REPAIR_TABLE_STATEMENT,
               UPGRADE_TABLE_STATEMENT:
                  begin
                  if TempSendProgress then
                     SetSteppedProgressCallback(Integer(Self),@TServerThread.SteppedProgressCallback)
                  else
                     SetSteppedProgressCallback(0,nil);
                  if TempSendLog then
                     SetLogCallback(Integer(Self),@TServerThread.LogCallback)
                  else
                     SetLogCallback(0,nil);
                  end;
               end;
            ExecuteStatement(TempDataCursor,TempParamCount,TempParamDefinitions,
                             TempRecordBuffer,TempGenPlan,TempPlanText,False,False,False);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(ExecutionTime,SizeOf(Double));
            Pack(RowsAffected,SizeOf(Integer));
            if (FClientVersion >= 4.11) and TempGenPlan then
               begin
               TempPlanSize:=Length(TempPlanText);
               Pack(TempPlanSize,SizeOf(Integer));
               Pack(TempPlanText[1],TempPlanSize);
               end;
            if (StatementType=SELECT_STATEMENT) then
               begin
               { Version 5 }
               if (not IsLiveResult) then
                  ResultTable.DataDirectory.ServerRights:=FDataServer.Configuration.GetAdminRights
               else
                  begin
                  if (AnsiCompareText(ResultTable.DataDirectory.Name,INMEMORY_DATABASE_NAME)=0) then
                     ResultTable.DataDirectory.ServerRights:=FDataServer.Configuration.GetAdminRights
                  else
                     ResultTable.DataDirectory.ServerRights:=FDataServer.Configuration.GetDatabaseRights(Session.UserName,
                                                                                                         ResultTable.DataDirectory.Name);
                  end;
               { Version 5 }
               PackCursorInfo(ResultTable);
               end
            else if (StatementType=START_TRANSACTION_STATEMENT) then
               begin
               if (FClientVersion >= 4.06) then
                  begin
                  if (DataQuery.TransactionTables <> nil) then
                     begin
                     TempTableCount:=DataQuery.TransactionTables.Count;
                     Pack(TempTableCount,SizeOf(Integer));
                     for I:=0 to TempTableCount-1 do
                        begin
                        TempTableName:=DataQuery.TransactionTables[I];
                        Pack(TempTableName[1],Length(TempTableName));
                        end;
                     end
                  else
                     begin
                     TempTableCount:=0;
                     Pack(TempTableCount,SizeOf(Integer));
                     end;
                  end;
               end;
            EndPack;
            end;
      finally
         DeAllocMem(TempRecordBuffer);
         for I:=1 to TempBlobCount do
            DeAllocMem(TempBlobBuffers[I]);
         for I:=1 to TempParamCount do
            DeAllocMem(TempParamDefinitions[I]);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoFreeStatement;
var
   TempQueryStatement: TQueryStatement;
begin
   try
      Unpack(TempQueryStatement);
      if (not TempQueryStatement.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      TempQueryStatement.Free;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSaveResultToTable;
var
   TempQueryStatement: TQueryStatement;
   TempDataDirectoryName: string;
   TempTableName: string;
   TempSendProgress: Boolean;
begin
   try
      Unpack(TempQueryStatement);
      if (not TempQueryStatement.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckCreate(Session.UserName,TempQueryStatement.DataDirectory);
      TempDataDirectoryName[0]:=Char(Byte(Unpack(TempDataDirectoryName[1])));
      TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
      Unpack(TempSendProgress);
      with TempQueryStatement do
         begin
         if TempSendProgress then
            SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback)
         else
            SetProgressCallback(0,nil);
         SaveResultToTable(TempDataDirectoryName,TempTableName,False);
         end;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TServerThread.CacheErrorCallback(RecordNumber: Integer;
                                          RecordSize: Word;
                                          RecordBuffer: PChar;
                                          OldRecordBuffer: PChar;
                                          E: Exception;
                                          OperationType: Byte;
                                          Retrying: Boolean;
                                          var Response: Byte): Boolean;
var
   TempCallbackType: Word;
begin
   Result:=False;
   if Terminated then
      Response:=ERROR_RESPONSE_FAIL
   else
      begin
      SaveReply;
      try
         FReplyHeader.ResultCode:=DBISAM_REMOTECALLBACK;
         BeginPack;
         TempCallbackType:=CALLBACK_CACHEERROR;
         Pack(TempCallbackType,SizeOf(Word));
         Pack(RecordBuffer,RecordSize);
         Pack(OldRecordBuffer,RecordSize);
         Pack(RecordNumber,SizeOf(Integer));
         Pack(OperationType,SizeOf(Byte));
         if (FClientVersion >= 4.19) then
            Pack(Retrying,SizeOf(Boolean));
         PackException(E);
         EndPack;
         if (not Send) then
            CloseConnection;
         case ReceiveCallback of
            RECEIVE_PRESENT:
               begin
               Unpack(Response);
               Result:=True;
               end;
            RECEIVE_ERROR,RECEIVE_NONE:
               Response:=ERROR_RESPONSE_FAIL;
            end;
      finally
         RestoreReply;
      end;
      end;
end;

procedure TServerThread.DoLoadFromStream;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempSourceBufferSize: Integer;
   TempSourceBuffer: PChar;
   TempMode: Byte;
   TempSendProgress: Boolean;
   TempSendErrors: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      CheckInsert(Session.UserName,TempDataCursor.DataDirectory);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      Unpack(TempSourceBufferSize);
      TempSourceBuffer:=AllocMem(TempSourceBufferSize);
      try
         Unpack(TempSourceBuffer^);
         if (FClientVersion >= 4.17) then
            Unpack(TempMode)
         else
            TempMode:=STREAM_NORMAL;
         Unpack(TempSendProgress);
         if (FClientVersion >= 4.17) then
            Unpack(TempSendErrors)
         else
            TempSendErrors:=False;
         with TempDataCursor do
            begin
            VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
            if TempSendProgress then
               SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback);
            if (TempMode=STREAM_FROM_CACHE) and TempSendErrors then
               SetCacheErrorCallback(Integer(Self),@TServerThread.CacheErrorCallback);
            LoadFromStream(TempSourceBuffer,TempSourceBufferSize,
                           TempMode,False,False);
            end;
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         PackCursorInfo(TempDataCursor);
         EndPack;
      finally
         DeAllocMem(TempSourceBuffer);
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoSaveToStream;
var
   TempDataCursor: TDataCursor;
   TempBookmark: array [0..MAX_KEYLEN-1] of Char;
   TempBOF: Boolean;
   TempEOF: Boolean;
   TempDestBuffer: PChar;
   TempDestBufferSize: Integer;
   TempMode: Byte;
   TempSendProgress: Boolean;
begin
   try
      Unpack(TempDataCursor);
      if (not TempDataCursor.IsObject) then
         DataEngine.RaiseError(DBISAM_REMOTEINVREQUEST);
      Unpack(TempBookmark);
      Unpack(TempBOF);
      Unpack(TempEOF);
      if (FClientVersion >= 4.17) then
         Unpack(TempMode)
      else
         TempMode:=STREAM_NORMAL;
      Unpack(TempSendProgress);
      with TempDataCursor do
         begin
         VerifyBookmarkPosition(@TempBookmark,TempBOF,TempEOF);
         if TempSendProgress then
            SetProgressCallback(Integer(Self),@TServerThread.ProgressCallback);
         TempDestBuffer:=nil;
         TempDestBufferSize:=0;
         SaveToStream(TempDestBuffer,TempDestBufferSize,TempMode,False);
         try
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempDestBufferSize,SizeOf(Integer));
            Pack(TempDestBuffer^,TempDestBufferSize);
            PackCursorInfo(TempDataCursor);
            EndPack;
         finally
            DeAllocMem(TempDestBuffer);
         end;
         end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetDateTime;
var
   TempDateTime: TDateTime;
begin
   try
      TempDateTime:=Now;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDateTime,SizeOf(TDateTime));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetUTCDateTime;
var
   TempDateTime: TDateTime;
begin
   try
      TempDateTime:=FDataServer.GetUTCDateTime;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDateTime,SizeOf(TDateTime));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetServerName;
var
   TempName: string;
begin
   try
      TempName:=FDataServer.Name;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempName[1],Length(TempName));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoGetServerDescription;
var
   TempDescription: string;
begin
   try
      TempDescription:=FDataServer.Description;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDescription[1],Length(TempDescription));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.DoServerProcedure;
var
   I: Integer;
   TempProcedureName: string;
   TempInParamCount: Word;
   TempInParamDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempInRecordBuffer: PChar;
   TempInBlobCount: Word;
   TempInBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
   TempOutParamCount: Word;
   TempOutParamDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempOutRecordBuffer: PChar;
   TempOutBlobCount: Word;
   TempOutBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      if FDataServer.Configuration.CheckForProcedure(Session.UserName,TempProcedureName) then
         begin
         TempInParamCount:=0;
         TempInRecordBuffer:=nil;
         TempInBlobCount:=0;
         UnpackParameters(TempInParamCount,TempInParamDefinitions,TempInRecordBuffer,
                          TempInBlobCount,TempInBlobBuffers);
         try
            TempOutParamCount:=0;
            TempOutRecordBuffer:=nil;
            TServerSession(Session).DataSession.ServerProcedure(TempProcedureName,
                                                                TempInParamCount,TempInParamDefinitions,
                                                                TempInRecordBuffer,
                                                                TempOutParamCount,TempOutParamDefinitions,
                                                                TempOutRecordBuffer,
                                                                TempOutBlobCount,TempOutBlobBuffers);
            try
               FReplyHeader.ResultCode:=DBISAM_NONE;
               BeginPack;
               PackParameters(TempOutParamCount,TempOutParamDefinitions,TempOutRecordBuffer);
               EndPack;
            finally
               DeAllocMem(TempOutRecordBuffer);
               for I:=1 to TempOutParamCount do
                  DeAllocMem(TempOutParamDefinitions[I]);
               for I:=1 to TempOutBlobCount do
                  DeAllocMem(TempOutBlobBuffers[I]);
            end;
         finally
            DeAllocMem(TempInRecordBuffer);
            for I:=1 to TempInBlobCount do
               DeAllocMem(TempInBlobBuffers[I]);
            for I:=1 to TempInParamCount do
               DeAllocMem(TempInParamDefinitions[I]);
         end;
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TServerThread.HandleReceive(RequestCode: Word);
begin
   if (RequestCode=REQUEST_PING) then
      { Do nothing }
   else if (RequestCode=REQUEST_RECONNECT) then
      begin
      if (not DoReconnect) then
         FCloseAfterSend:=True;
      end
   else
      begin
      if (RequestCode=REQUEST_CONNECTPARAMS) then
         begin
         if (not DoConnectionParams) then
            FCloseAfterSend:=True;
         end
      else
         begin
         if CheckSession then
            begin
            if (RequestCode=REQUEST_LOGIN) then
               DoLogin
            else
               begin
               if CheckSessionUser then
                  begin
                  case RequestCode of
                     REQUEST_LOGOUT:
                        DoLogout;
                     REQUEST_SESSIONPARAMS:
                        DoSessionParams;
                     REQUEST_DELALLMEMTABLES:
                        DoRemoveAllMemoryTables;
                     REQUEST_MODIFYUSERPASSWORD:
                        DoModifyUserPassword;
                     REQUEST_GETTABLENAMES:
                        DoGetTableNames;
                     REQUEST_OPENDATADIR:
                        DoOpenDataDirectory;
                     REQUEST_CLOSEDATADIR:
                        DoCloseDataDirectory;
                     REQUEST_BACKUP:
                        DoBackup;
                     REQUEST_BACKUPINFO:
                        DoBackupInfo;
                     REQUEST_RESTORE:
                        DoRestore;
                     REQUEST_ADDPASSWORD:
                        DoAddPassword;
                     REQUEST_DELPASSWORD:
                        DoDeletePassword;
                     REQUEST_DELALLPASSWORDS:
                        DoDeleteAllPasswords;
                     REQUEST_GETDBNAMES:
                        DoGetDatabaseNames;
                     REQUEST_GETPROCNAMES:
                        DoGetProcedureNames;
                     REQUEST_GETDBUSER:
                        DoGetDatabaseUser;
                     REQUEST_STARTTRANS:
                        DoStartTransaction;
                     REQUEST_COMMITTRANS:
                        DoCommitTransaction;
                     REQUEST_ROLLBACKTRANS:
                        DoRollbackTransaction;
                     REQUEST_CREATECURSOR:
                        DoCreateCursor;
                     REQUEST_OPENCURSOR:
                        DoOpenCursor;
                     REQUEST_CLOSECURSOR:
                        DoCloseCursor;
                     REQUEST_FREECURSOR:
                        DoFreeCursor;
                     REQUEST_SETINDEXNAME:
                        DoSetIndexName;
                     REQUEST_SETTOBEGIN:
                        DoSetToBegin;
                     REQUEST_SETTOEND:
                        DoSetToEnd;
                     REQUEST_SETTORECNO:
                        DoSetToRecordNumber;
                     REQUEST_SETTOCURSOR:
                        DoSetToDataCursor;
                     REQUEST_GETCURRECORD:
                        DoGetCurrentRecord;
                     REQUEST_CLONECURRECORD:
                        DoCloneCurrentRecord;
                     REQUEST_GETNEXTRECORD:
                        DoGetNextRecord;
                     REQUEST_GETPRIORRECORD:
                        DoGetPriorRecord;
                     REQUEST_READNEXTRECORDBLOCK:
                        DoReadNextRecordBlock;
                     REQUEST_READPRIORRECORDBLOCK:
                        DoReadPriorRecordBlock;
                     REQUEST_READFIRSTRECORDBLOCK:
                        DoReadFirstRecordBlock;
                     REQUEST_READLASTRECORDBLOCK:
                        DoReadLastRecordBlock;
                     REQUEST_READABSOLUTERECORDBLOCK:
                        DoReadAbsoluteRecordBlock;
                     REQUEST_READBOOKMARKRECORDBLOCK:
                        DoReadBookmarkRecordBlock;
                     REQUEST_REFRESHRECORDBLOCK:
                        DoRefreshRecordBlock;
                     REQUEST_ADDRECORDBLOCK:
                        DoAddRecordBlock;
                     REQUEST_UPDATERECORDBLOCK:
                        DoUpdateRecordBlock;
                     REQUEST_DELETERECORDBLOCK:
                        DoDeleteRecordBlock;
                     REQUEST_APPENDRECORD:
                        DoAppendRecord;
                     REQUEST_MODIFYRECORD:
                        DoModifyRecord;
                     REQUEST_CANCELRECORD:
                        DoCancelRecord;
                     REQUEST_DELETERECORD:
                        DoDeleteRecord;
                     REQUEST_FLUSHBUFFERS:
                        DoFlushBuffers;
                     REQUEST_FLUSHOSBUFFERS:
                        DoFlushOSBuffers;
                     REQUEST_REFRESH:
                        DoRefresh;
                     REQUEST_SETTOBOOKMARK:
                        DoSetToBookmark;
                     REQUEST_FIND:
                        DoFind;
                     REQUEST_LOCATE:
                        DoLocate;
                     REQUEST_SETRANGE:
                        DoSetRange;
                     REQUEST_RESETRANGE:
                        DoResetRange;
                     REQUEST_LOCKTABLE:
                        DoLockTable;
                     REQUEST_UNLOCKTABLE:
                        DoUnlockTable;
                     REQUEST_UNLOCKRECORD:
                        DoUnlockRecord;
                     REQUEST_LOCKSEMAPHORE:
                        DoLockSemaphore;
                     REQUEST_UNLOCKSEMAPHORE:
                        DoUnlockSemaphore;
                     REQUEST_GETDATAHEADER:
                        DoGetDataHeader;
                     REQUEST_TABLEEXISTS:
                        DoTableExists;
                     REQUEST_TABLESIZE:
                        DoTableSize;
                     REQUEST_CREATETABLE:
                        DoCreateTable;
                     REQUEST_ALTERTABLE:
                        DoAlterTable;
                     REQUEST_REPAIRTABLE:
                        DoRepairTable;
                     REQUEST_UPGRADETABLE:
                        DoUpgradeTable;
                     REQUEST_EMPTYTABLE:
                        DoEmptyTable;
                     REQUEST_DELETETABLE:
                        DoDeleteTable;
                     REQUEST_RENAMETABLE:
                        DoRenameTable;
                     REQUEST_OPTIMIZETABLE:
                        DoOptimizeTable;
                     REQUEST_COPYTABLE:
                        DoCopyTable;
                     REQUEST_ADDPRIMARYINDEX:
                        DoAddPrimaryIndex;
                     REQUEST_ADDSECONDARYINDEX:
                        DoAddSecondaryIndex;
                     REQUEST_DELETEINDEX:
                        DoDeleteIndex;
                     REQUEST_DELETEALLINDEXES:
                        DoDeleteAllIndexes;
                     REQUEST_OPENBLOB:
                        DoOpenBlob;
                     REQUEST_FREEBLOB:
                        DoFreeBlob;
                     REQUEST_FREEALLBLOBS:
                        DoFreeAllBlobs;
                     REQUEST_GETBLOB:
                        DoGetBlob;
                     REQUEST_PUTBLOB:
                        DoPutBlob;
                     REQUEST_TRUNCATEBLOB:
                        DoTruncateBlob;
                     REQUEST_GETBLOBSIZE:
                        DoGetBlobSize;
                     REQUEST_ADDEXPRFILTER:
                        DoAddExprFilter;
                     REQUEST_ADDCALLBACKFILTER:
                        DoAddCallbackFilter;
                     REQUEST_DROPFILTER:
                        DoDropFilter;
                     REQUEST_ACTIVATEFILTER:
                        DoActivateFilter;
                     REQUEST_DEACTIVATEFILTER:
                        DoDeactivateFilter;
                     REQUEST_CREATESTMT:
                        DoCreateStatement;
                     REQUEST_PREPARESTMT:
                        DoPrepareStatement;
                     REQUEST_EXECUTESTMT:
                        DoExecuteStatement;
                     REQUEST_FREESTMT:
                        DoFreeStatement;
                     REQUEST_SAVERESULT:
                        DoSaveResultToTable;
                     REQUEST_LOADFROMSTREAM:
                        DoLoadFromStream;
                     REQUEST_SAVETOSTREAM:
                        DoSaveToStream;
                     REQUEST_IMPORTTABLE:
                        DoImportTable;
                     REQUEST_EXPORTTABLE:
                        DoExportTable;
                     REQUEST_GETDATETIME:
                        DoGetDateTime;
                     REQUEST_GETUTCDATETIME:
                        DoGetUTCDateTime;
                     REQUEST_TEXTINDEXPARAMS:
                        DoTextIndexParams;
                     REQUEST_GETSERVERNAME:
                        DoGetServerName;
                     REQUEST_GETSERVERDESC:
                        DoGetServerDescription;
                     REQUEST_PROCEDURE:
                        DoServerProcedure;
                     else
                        DoInvalidRequest
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

{ TAdminThread }

procedure TAdminThread.Reset;
begin
   inherited Reset;
   FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_DISCONNECT,
                        'Admin connection closed',
                        ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                        SessionUserName,0,ThreadID,Integer(Session));
   if (Session <> nil) then
      FDataServer.Configuration.DisconnectUser(SessionUserName);
   FDataServer.DisconnectAdminSession(TAdminSession(Session));
end;

function TAdminThread.DoConnectionParams: Boolean;
var
   TempEngineVersion: Currency;
   { Version 5 }
   TempEngineBuildNumber: Integer;
   { Version 5 }
   TempEngineType: string;
begin
   Result:=False;
   try
      Unpack(FClientVersion);
      Unpack(FClientEncrypted);
      FClientProcess[0]:=Char(Byte(Unpack(FClientProcess[1])));
      Unpack(FClientThread);
      if (Trunc(FClientVersion)=Trunc(ENGINE_VERSION_NUM)) then
         begin
         if FClientEncrypted then
            begin
            if FDataServer.Configuration.CheckIPAddress(FClientAddress) then
               begin
               FDataServer.ConnectAdminSession(Self);
               FReplyHeader.ResultCode:=DBISAM_NONE;
               FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_CONNECT,
                                    'Admin connection accepted',
                                    ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                    SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
               end
            else
               begin
               FReplyHeader.ResultCode:=DBISAM_REMOTEADDRESSBLOCK;
               FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_ADDRESSBLOCK,
                                    'Admin connection rejected, address is blocked',
                                    ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                    SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
               end;
            end
         else
            begin
            FReplyHeader.ResultCode:=DBISAM_REMOTEENCRYPTREQ;
            FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                 'Admin connection rejected, encrypted connection required',
                                 ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                 SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
            end;
         end
      else
         begin
         FReplyHeader.ResultCode:=DBISAM_REMOTEVERSION;
         FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                              'Connection rejected, incorrect client version',
                              ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                              SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
         end;
      Result:=(FReplyHeader.ResultCode=DBISAM_NONE);
      BeginPack;
      if Result then
         begin
         Pack(Integer(Session),SizeOf(Integer));
         TempEngineVersion:=ENGINE_VERSION_NUM;
         Pack(TempEngineVersion,SizeOf(Currency));
         { Version 5 }
         if (FClientVersion >= 4.23) then
            begin
            TempEngineBuildNumber:=ENGINE_BUILD_NUM;
            Pack(TempEngineBuildNumber,SizeOf(Integer));
            end;
         { Version 5 }
         TempEngineType:=ENGINE_TYPE;
         Pack(TempEngineType[1],Length(TempEngineType));
         end;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

function TAdminThread.DoReconnect: Boolean;
var
   TempAdminSession: TAdminSession;
   TempResult: Boolean;
   WaitForDisconnect: Boolean;
begin
   Result:=False;
   try
      Unpack(FClientVersion);
      Unpack(TempAdminSession);
      Unpack(FClientEncrypted);
      FClientProcess[0]:=Char(Byte(Unpack(FClientProcess[1])));
      Unpack(FClientThread);
      if FClientEncrypted then
         begin
         if FDataServer.Configuration.CheckIPAddress(FClientAddress) then
            begin
            WaitForDisconnect:=False;
            while True do
               begin
               TempResult:=FDataServer.ReconnectAdminSession(Self,TempAdminSession,
                                                             WaitForDisconnect);
               if TempResult then
                  begin
                  if FDataServer.Configuration.CheckUserMaxConnections(TempAdminSession.UserName) then
                     begin
                     FReplyHeader.ResultCode:=DBISAM_NONE;
                     FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_RECONNECT,
                                          'Admin re-connection accepted',
                                          ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                          SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
                     end
                  else
                     begin
                     FReplyHeader.ResultCode:=DBISAM_REMOTEMAXCONNECT;
                     FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                          'Connection rejected, max user connections reached',
                                          ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                          SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
                     end;
                  Break;
                  end
               else
                  begin
                  if WaitForDisconnect then
                     Sleep(DEFAULT_RECONNECT_SLEEP)
                  else
                     begin
                     FReplyHeader.ResultCode:=DBISAM_REMOTECONNECT;
                     FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_NOSESSION,
                                          'Admin re-connection rejected, session not found',
                                          ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                          SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(TempAdminSession));
                     Break;
                     end;
                  end;
               end;
            end
         else
            begin
            FReplyHeader.ResultCode:=DBISAM_REMOTEADDRESSBLOCK;
            FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_ADDRESSBLOCK,
                                 'Admin re-connection rejected, address is blocked',
                                 ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                 SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(TempAdminSession));
            end;
         end
      else
         begin
         FReplyHeader.ResultCode:=DBISAM_REMOTEENCRYPTREQ;
         FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                              'Admin re-connection rejected, encrypted connection required',
                              ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                              SessionUserName,FRequestHeader.RequestCode,ThreadID,Integer(TempAdminSession));
         end;
      Result:=(FReplyHeader.ResultCode=DBISAM_NONE);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoLogin;
var
   TempUserName: string;
   TempPassword: string;
   TempLoginSize: Integer;
   TempLoginBuffer: PChar;
   TempLoginPos: Integer;
begin
   try
      Unpack(TempLoginSize);
      TempLoginBuffer:=AllocMem(TempLoginSize);
      try
         Unpack(TempLoginBuffer^);
         DataEngine.Decrypt(FClientEncryptionData,TempLoginBuffer,TempLoginSize);
         TempLoginPos:=0;
         Move((TempLoginBuffer+TempLoginPos)^,TempUserName[0],SizeOf(Byte));
         Inc(TempLoginPos,SizeOf(Byte));
         Move((TempLoginBuffer+TempLoginPos)^,TempUserName[1],Length(TempUserName));
         Inc(TempLoginPos,Length(TempUserName));
         Move((TempLoginBuffer+TempLoginPos)^,TempPassword[0],SizeOf(Byte));
         Inc(TempLoginPos,SizeOf(Byte));
         Move((TempLoginBuffer+TempLoginPos)^,TempPassword[1],Length(TempPassword));
      finally
         DeAllocMem(TempLoginBuffer);
      end;
      if FDataServer.Configuration.LoginUser(TempUserName,TempPassword) then
         begin
         if FDataServer.Configuration.CheckForAdministrator(TempUserName) then
            begin
            if FDataServer.Configuration.CheckUserMaxConnections(TempUserName) then
               begin
               FDataServer.LoginAdminSession(TAdminSession(Session),TempUserName);
               FReplyHeader.ResultCode:=DBISAM_NONE;
               FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_LOGIN,
                                    'Admin login',ENGINE_VERSION_NUM,FClientVersion,
                                    FClientAddress,FClientEncrypted,SessionUserName,
                                    FRequestHeader.RequestCode,ThreadID,Integer(Session));
               end
            else
               begin
               FReplyHeader.ResultCode:=DBISAM_REMOTEMAXCONNECT;
               FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_MAXCONNECT,
                                    'Connection rejected, max user connections reached',
                                    ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                    TempUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));

               end;
            end
         else
            begin
            FReplyHeader.ResultCode:=DBISAM_REMOTENOTADMIN;
            FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_INVLOGIN,
                                 'Invalid admin login',
                                 ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                                 TempUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
            end;
         end
      else
         begin
         FReplyHeader.ResultCode:=DBISAM_REMOTEINVLOGIN;
         FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_INVLOGIN,
                              'Invalid admin login',
                              ENGINE_VERSION_NUM,FClientVersion,FClientAddress,FClientEncrypted,
                              TempUserName,FRequestHeader.RequestCode,ThreadID,Integer(Session));
         end;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoLogout;
begin
   FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_LOGOUT,
                        'Logout',ENGINE_VERSION_NUM,FClientVersion,
                        FClientAddress,FClientEncrypted,SessionUserName,
                        FRequestHeader.RequestCode,ThreadID,Integer(Session));
   FDataServer.Configuration.DisconnectUser(SessionUserName);
   FDataServer.RemoveAdminSession(TAdminSession(Session));
end;

procedure TAdminThread.DoSessionParams;
begin
   { Stubbed out to prevent errors }
   try
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetDatabaseNames;
var
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         FDataServer.Configuration.GetDatabaseList(Session.UserName,False,TempList);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetProcedureNames;
var
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         FDataServer.Configuration.GetProcedureList(Session.UserName,True,TempList);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoAddUser;
var
   TempUserName: string;
   TempPassword: string;
   TempDescription: string;
   TempAdministrator: Boolean;
   TempMaxConnections: Word;
begin
   try
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if (TempUserName='') then
         DataEngine.RaiseError(DBISAM_REMOTEINVUSER,'',TempUserName);
      TempPassword[0]:=Char(Byte(Unpack(TempPassword[1])));
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      Unpack(TempAdministrator);
      if (FClientVersion >= 4.09) then
         Unpack(TempMaxConnections)
      else
         TempMaxConnections:=DEFAULT_MAX_USER_CONNECTIONS;
      if FDataServer.Configuration.AddUser(TempUserName,TempPassword,
                                           TempDescription,TempAdministrator,
                                           TempMaxConnections) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTEDUPUSER,'',TempUserName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoModifyUser;
var
   TempUserName: string;
   TempPassword: string;
   TempDescription: string;
   TempAdministrator: Boolean;
   TempMaxConnections: Word;
begin
   try
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      TempPassword[0]:=Char(Byte(Unpack(TempPassword[1])));
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      Unpack(TempAdministrator);
      if (FClientVersion >= 4.09) then
         Unpack(TempMaxConnections)
      else
         TempMaxConnections:=DEFAULT_MAX_USER_CONNECTIONS;
      if FDataServer.Configuration.ModifyUser(TempUserName,TempPassword,
                                              TempDescription,TempAdministrator,
                                              TempMaxConnections) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOUSER,'',TempUserName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoDeleteUser;
var
   TempUserName: string;
begin
   try
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if FDataServer.Configuration.DeleteUser(TempUserName) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOUSER,'',TempUserName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetUser;
var
   TempUserName: string;
   TempPassword: string;
   TempDescription: string;
   TempAdministrator: Boolean;
   TempMaxConnections: Word;
begin
   try
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if FDataServer.Configuration.GetUser(TempUserName,TempPassword,
                                           TempDescription,TempAdministrator,
                                           TempMaxConnections) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOUSER,'',TempUserName);
      BeginPack;
      Pack(TempPassword[1],Length(TempPassword));
      Pack(TempDescription[1],Length(TempDescription));
      Pack(TempAdministrator,SizeOf(Boolean));
      if (FClientVersion >= 4.09) then
         Pack(TempMaxConnections,SizeOf(Word));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetUserNames;
var
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         FDataServer.Configuration.GetUserList(TempList);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoAddDatabase;
var
   TempDatabaseName: string;
   TempDescription: string;
   TempDataPath: string;
   TempError: Boolean;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      if (TempDatabaseName='') or (AnsiCompareText(TempDatabaseName,INMEMORY_DATABASE_NAME)=0) or
         (AnsiCompareText(TempDatabaseName,REMOTE_RESULTSET_NAME)=0) then
         DataEngine.RaiseError(DBISAM_REMOTEINVDB,'','',TempDatabaseName);
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      TempDataPath[0]:=Char(Byte(Unpack(TempDataPath[1])));
      if FDataServer.Configuration.AddDatabase(TempDatabaseName,TempDescription,
                                                 TempDataPath,TempError) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else if TempError then
         DataEngine.RaiseError(DBISAM_REMOTEINVDB,'','',TempDatabaseName)
      else
         DataEngine.RaiseError(DBISAM_REMOTEDUPDB,'','',TempDatabaseName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoModifyDatabase;
var
   TempDatabaseName: string;
   TempDescription: string;
   TempDataPath: string;
   TempError: Boolean;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      TempDataPath[0]:=Char(Byte(Unpack(TempDataPath[1])));
      if FDataServer.Configuration.ModifyDatabase(TempDatabaseName,TempDescription,
                                               TempDataPath,TempError) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else if TempError then
         DataEngine.RaiseError(DBISAM_REMOTEINVDB,'','',TempDatabaseName)
      else
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoDeleteDatabase;
var
   TempDatabaseName: string;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      if FDataServer.Configuration.DeleteDatabase(TempDatabaseName) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetDatabase;
var
   TempDatabaseName: string;
   TempDescription: string;
   TempPath: string;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      if FDataServer.Configuration.GetDatabase(TempDatabaseName,TempDescription,
                                            TempPath) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
      BeginPack;
      Pack(TempDescription[1],Length(TempDescription));
      Pack(TempPath[1],Length(TempPath));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoAddDatabaseUser;
var
   TempDatabaseName: string;
   TempUserName: string;
   TempRights: Integer;
   TempDescription: string;
   TempPath: string;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if (TempUserName='') then
         DataEngine.RaiseError(DBISAM_REMOTEINVDBUSER,'',TempUserName,TempDatabaseName);
      Unpack(TempRights);
      if FDataServer.Configuration.GetDatabase(TempDatabaseName,TempDescription,
                                            TempPath) then
         begin
         if FDataServer.Configuration.AddDatabaseUser(TempDatabaseName,TempUserName,TempRights) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTEDUPDBUSER,'',TempUserName,TempDatabaseName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoModifyDatabaseUser;
var
   TempDatabaseName: string;
   TempUserName: string;
   TempRights: Integer;
   TempDescription: string;
   TempPath: string;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      Unpack(TempRights);
      if FDataServer.Configuration.GetDatabase(TempDatabaseName,TempDescription,
                                            TempPath) then
         begin
         if FDataServer.Configuration.ModifyDatabaseUser(TempDatabaseName,TempUserName,TempRights) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENODBUSER,'',TempUserName,TempDatabaseName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoDeleteDatabaseUser;
var
   TempDatabaseName: string;
   TempUserName: string;
   TempDescription: string;
   TempPath: string;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if FDataServer.Configuration.GetDatabase(TempDatabaseName,TempDescription,
                                            TempPath) then
         begin
         if FDataServer.Configuration.DeleteDatabaseUser(TempDatabaseName,TempUserName) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENODBUSER,'',TempUserName,TempDatabaseName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetDatabaseUser;
var
   TempDatabaseName: string;
   TempUserName: string;
   TempRights: Integer;
   TempDescription: string;
   TempPath: string;
begin
   try
      TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if FDataServer.Configuration.GetDatabase(TempDatabaseName,TempDescription,
                                            TempPath) then
         begin
         if FDataServer.Configuration.GetDatabaseUser(TempDatabaseName,TempUserName,TempRights) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENODBUSER,'',TempUserName,TempDatabaseName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
      BeginPack;
      Pack(TempRights,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetDatabaseUserNames;
var
   TempDatabaseName: string;
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         TempDatabaseName[0]:=Char(Byte(Unpack(TempDatabaseName[1])));
         if FDataServer.Configuration.GetDatabaseUserList(TempDatabaseName,TempList) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENODB,'','',TempDatabaseName);
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoAddProcedure;
var
   TempProcedureName: string;
   TempDescription: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      if (TempProcedureName='') then
         DataEngine.RaiseError(DBISAM_REMOTEINVPROC,'','','','','','','',TempProcedureName);
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      if FDataServer.Configuration.AddProcedure(TempProcedureName,TempDescription) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTEDUPPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoModifyProcedure;
var
   TempProcedureName: string;
   TempDescription: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      if FDataServer.Configuration.ModifyProcedure(TempProcedureName,TempDescription) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoDeleteProcedure;
var
   TempProcedureName: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      if FDataServer.Configuration.DeleteProcedure(TempProcedureName) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetProcedure;
var
   TempProcedureName: string;
   TempDescription: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      if FDataServer.Configuration.GetProcedure(TempProcedureName,TempDescription) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      Pack(TempDescription[1],Length(TempDescription));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoAddProcedureUser;
var
   TempProcedureName: string;
   TempUserName: string;
   TempRights: Integer;
   TempDescription: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if (TempUserName='') then
         DataEngine.RaiseError(DBISAM_REMOTEINVPROCUSER,'',TempUserName,'','','','','',TempProcedureName);
      Unpack(TempRights);
      if FDataServer.Configuration.GetProcedure(TempProcedureName,TempDescription) then
         begin
         if FDataServer.Configuration.AddProcedureUser(TempProcedureName,TempUserName,TempRights) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTEDUPPROCUSER,'',TempUserName,'','','','','',TempProcedureName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoModifyProcedureUser;
var
   TempProcedureName: string;
   TempUserName: string;
   TempRights: Integer;
   TempDescription: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      Unpack(TempRights);
      if FDataServer.Configuration.GetProcedure(TempProcedureName,TempDescription) then
         begin
         if FDataServer.Configuration.ModifyProcedureUser(TempProcedureName,TempUserName,TempRights) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENOPROCUSER,'',TempUserName,'','','','','',TempProcedureName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoDeleteProcedureUser;
var
   TempProcedureName: string;
   TempUserName: string;
   TempDescription: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if FDataServer.Configuration.GetProcedure(TempProcedureName,TempDescription) then
         begin
         if FDataServer.Configuration.DeleteProcedureUser(TempProcedureName,TempUserName) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENOPROCUSER,'',TempUserName,'','','','','',TempProcedureName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetProcedureUser;
var
   TempProcedureName: string;
   TempUserName: string;
   TempRights: Integer;
   TempDescription: string;
begin
   try
      TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
      TempUserName[0]:=Char(Byte(Unpack(TempUserName[1])));
      if FDataServer.Configuration.GetProcedure(TempProcedureName,TempDescription) then
         begin
         if FDataServer.Configuration.GetProcedureUser(TempProcedureName,TempUserName,TempRights) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENOPROCUSER,'',TempUserName,'','','','','',TempProcedureName);
         end
      else
         DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
      BeginPack;
      Pack(TempRights,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetProcedureUserNames;
var
   TempProcedureName: string;
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         TempProcedureName[0]:=Char(Byte(Unpack(TempProcedureName[1])));
         if FDataServer.Configuration.GetProcedureUserList(TempProcedureName,TempList) then
            FReplyHeader.ResultCode:=DBISAM_NONE
         else
            DataEngine.RaiseError(DBISAM_REMOTENOPROC,'','','','','','','',TempProcedureName);
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoAddEvent;
var
   TempEventName: string;
   TempDescription: string;
   TempRunType: Byte;
   TempStartDate: TDateTime;
   TempEndDate: TDateTime;
   TempStartTime: TDateTime;
   TempEndTime: TDateTime;
   TempInterval: Word;
   TempDays: TConfigDays;
   TempDayOfMonth: Byte;
   TempDayOfWeek: Byte;
   TempMonths: TConfigMonths;
begin
   try
      TempEventName[0]:=Char(Byte(Unpack(TempEventName[1])));
      if (TempEventName='') then
         DataEngine.RaiseError(DBISAM_REMOTEINVEVENT,'','','','','','','',TempEventName);
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      Unpack(TempRunType);
      Unpack(TempStartDate);
      Unpack(TempEndDate);
      Unpack(TempStartTime);
      Unpack(TempEndTime);
      Unpack(TempInterval);
      Unpack(TempDays);
      Unpack(TempDayOfMonth);
      Unpack(TempDayOfWeek);
      Unpack(TempMonths);
      if FDataServer.Configuration.AddEvent(TempEventName,TempDescription,
                                            TempRunType,
                                            TempStartDate,TempEndDate,
                                            TempStartTime,TempEndTime,
                                            TempInterval,
                                            TempDays,
                                            TempDayOfMonth,
                                            TempDayOfWeek,
                                            TempMonths) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTEDUPEVENT,'','','','','','','',TempEventName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoModifyEvent;
var
   TempEventName: string;
   TempDescription: string;
   TempRunType: Byte;
   TempStartDate: TDateTime;
   TempEndDate: TDateTime;
   TempStartTime: TDateTime;
   TempEndTime: TDateTime;
   TempInterval: Word;
   TempDays: TConfigDays;
   TempDayOfMonth: Byte;
   TempDayOfWeek: Byte;
   TempMonths: TConfigMonths;
begin
   try
      TempEventName[0]:=Char(Byte(Unpack(TempEventName[1])));
      TempDescription[0]:=Char(Byte(Unpack(TempDescription[1])));
      Unpack(TempRunType);
      Unpack(TempStartDate);
      Unpack(TempEndDate);
      Unpack(TempStartTime);
      Unpack(TempEndTime);
      Unpack(TempInterval);
      Unpack(TempDays);
      Unpack(TempDayOfMonth);
      Unpack(TempDayOfWeek);
      Unpack(TempMonths);
      if FDataServer.Configuration.ModifyEvent(TempEventName,TempDescription,
                                               TempRunType,
                                               TempStartDate,TempEndDate,
                                               TempStartTime,TempEndTime,
                                               TempInterval,
                                               TempDays,
                                               TempDayOfMonth,
                                               TempDayOfWeek,
                                               TempMonths) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOEVENT,'','','','','','','',TempEventName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoDeleteEvent;
var
   TempEventName: string;
begin
   try
      TempEventName[0]:=Char(Byte(Unpack(TempEventName[1])));
      if FDataServer.Configuration.DeleteEvent(TempEventName) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOEVENT,'','','','','','','',TempEventName);
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetEvent;
var
   TempEventName: string;
   TempDescription: string;
   TempRunType: Byte;
   TempStartDate: TDateTime;
   TempEndDate: TDateTime;
   TempStartTime: TDateTime;
   TempEndTime: TDateTime;
   TempInterval: Word;
   TempDays: TConfigDays;
   TempDayOfWeek: Byte;
   TempDayOfMonth: Byte;
   TempMonths: TConfigMonths;
   TempLastRun: TDateTime;
   TempInProgress: Boolean;
begin
   try
      TempEventName[0]:=Char(Byte(Unpack(TempEventName[1])));
      if FDataServer.Configuration.GetEvent(TempEventName,TempDescription,
                                            TempRunType,
                                            TempStartDate,TempEndDate,
                                            TempStartTime,TempEndTime,
                                            TempInterval,
                                            TempDays,
                                            TempDayOfMonth,
                                            TempDayOfWeek,
                                            TempMonths,
                                            TempLastRun,TempInProgress) then
         FReplyHeader.ResultCode:=DBISAM_NONE
      else
         DataEngine.RaiseError(DBISAM_REMOTENOEVENT,'','','','','','','',TempEventName);
      BeginPack;
      Pack(TempDescription[1],Length(TempDescription));
      Pack(TempRunType,SizeOf(Byte));
      Pack(TempStartDate,SizeOf(TDateTime));
      Pack(TempEndDate,SizeOf(TDateTime));
      Pack(TempStartTime,SizeOf(TDateTime));
      Pack(TempEndTime,SizeOf(TDateTime));
      Pack(TempInterval,SizeOf(Word));
      Pack(TempDays,SizeOf(TConfigDays));
      Pack(TempDayOfMonth,SizeOf(Byte));
      Pack(TempDayOfWeek,SizeOf(Byte));
      Pack(TempMonths,SizeOf(TConfigMonths));
      Pack(TempLastRun,SizeOf(TDateTime));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetEventNames;
var
   TempList: TStrings;
   TempString: string;
   I: Integer;
begin
   try
      TempList:=TStringList.Create;
      try
         FDataServer.Configuration.GetEventList(TempList);
         FReplyHeader.ResultCode:=DBISAM_NONE;
         BeginPack;
         I:=TempList.Count;
         Pack(I,SizeOf(Integer));
         for I:=0 to TempList.Count-1 do
            begin
            TempString:=TempList[I];
            Pack(TempString[1],Length(TempString));
            end;
         EndPack;
      finally
         TempList.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoModifyServer;
var
   TempDenyLogins: Boolean;
   TempMaxConnect: Word;
   TempConnectTimeout: Word;
   TempDeadInterval: Word;
   TempDeadExpires: Word;
   TempMaxDead: Word;
   TempTempDirectory: string;
   I: Integer;
   TempNumAddresses: Integer;
   TempAddress: string;
   TempAuthAddresses: TStrings;
   TempBlockAddresses: TStrings;
begin
   try
      TempAuthAddresses:=TStringList.Create;
      try
         TempBlockAddresses:=TStringList.Create;
         try
            Unpack(TempDenyLogins);
            Unpack(TempMaxConnect);
            Unpack(TempConnectTimeout);
            Unpack(TempDeadInterval);
            Unpack(TempDeadExpires);
            Unpack(TempMaxDead);
            TempTempDirectory[0]:=Char(Byte(Unpack(TempTempDirectory[1])));
            Unpack(TempNumAddresses);
            for I:=1 to TempNumAddresses do
               begin
               TempAddress[0]:=Char(Byte(Unpack(TempAddress[1])));
               TempAuthAddresses.Add(TempAddress);
               end;
            Unpack(TempNumAddresses);
            for I:=1 to TempNumAddresses do
               begin
               TempAddress[0]:=Char(Byte(Unpack(TempAddress[1])));
               TempBlockAddresses.Add(TempAddress);
               end;
            TempMaxConnect:=MinimumWord(TempMaxConnect,FDataServer.LicensedConnections);
            if (TempConnectTimeout < MIN_TIMEOUT) then
               TempConnectTimeout:=MIN_TIMEOUT;
            FDataServer.Configuration.ModifyServer(TempDenyLogins,TempMaxConnect,
                                                TempConnectTimeout,TempDeadInterval,
                                                TempDeadExpires,TempMaxDead,
                                                TempTempDirectory,
                                                TempAuthAddresses,TempBlockAddresses);
            FDataServer.DeadSessionTimer.Interval:=(TempDeadInterval*1000);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            EndPack;
         finally
            TempBlockAddresses.Free;
         end;
      finally
         TempAuthAddresses.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetServer;
var
   TempDenyLogins: Boolean;
   TempMaxConnect: Word;
   TempConnectTimeout: Word;
   TempDeadInterval: Word;
   TempDeadExpires: Word;
   TempMaxDead: Word;
   TempTempDirectory: string;
   I: Integer;
   TempNumAddresses: Integer;
   TempAddress: string;
   TempAuthAddresses: TStrings;
   TempBlockAddresses: TStrings;
begin
   try
      TempAuthAddresses:=TStringList.Create;
      try
         TempBlockAddresses:=TStringList.Create;
         try
            FDataServer.Configuration.GetServer(TempDenyLogins,TempMaxConnect,
                                             TempConnectTimeout,TempDeadInterval,
                                             TempDeadExpires,TempMaxDead,
                                             TempTempDirectory,
                                             TempAuthAddresses,TempBlockAddresses);
            FReplyHeader.ResultCode:=DBISAM_NONE;
            BeginPack;
            Pack(TempDenyLogins,SizeOf(Boolean));
            Pack(TempMaxConnect,SizeOf(Word));
            Pack(TempConnectTimeout,SizeOf(Word));
            Pack(TempDeadInterval,SizeOf(Word));
            Pack(TempDeadExpires,SizeOf(Word));
            Pack(TempMaxDead,SizeOf(Word));
            Pack(TempTempDirectory[1],Length(TempTempDirectory));
            TempNumAddresses:=TempAuthAddresses.Count;
            Pack(TempNumAddresses,SizeOf(Integer));
            for I:=0 to TempNumAddresses-1 do
               begin
               TempAddress:=TempAuthAddresses[I];
               Pack(TempAddress[1],Length(TempAddress));
               end;
            TempNumAddresses:=TempBlockAddresses.Count;
            Pack(TempNumAddresses,SizeOf(Integer));
            for I:=0 to TempNumAddresses-1 do
               begin
               TempAddress:=TempBlockAddresses[I];
               Pack(TempAddress[1],Length(TempAddress));
               end;
            EndPack;
         finally
            TempBlockAddresses.Free;
         end;
      finally
         TempAuthAddresses.Free;
      end;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetLogCount;
var
   TempLogCount: Integer;
begin
   try
      TempLogCount:=FDataServer.GetLogCount;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempLogCount,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetLogRecord;
var
   TempNumber: Integer;
   TempLogRecord: TDataLogRecord;
begin
   try
      Unpack(TempNumber);
      TempLogRecord:=FDataServer.GetLogRecord(TempNumber);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempLogRecord,SizeOf(TDataLogRecord));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoStartServer;
begin
   try
      FDataServer.StartMainServer;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoStopServer;
begin
   try
      FDataServer.StopMainServer;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetDateTime;
var
   TempDateTime: TDateTime;
begin
   try
      TempDateTime:=Now;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDateTime,SizeOf(TDateTime));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetUTCDateTime;
var
   TempDateTime: TDateTime;
begin
   try
      TempDateTime:=FDataServer.GetUTCDateTime;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDateTime,SizeOf(TDateTime));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetUpTime;
var
   TempUpTime: Int64;
begin
   try
      TempUpTime:=FDataServer.GetUpTime;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempUpTime,SizeOf(Int64));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetMemoryUsage;
var
   TempMemoryUsage: double;
begin
   try
      TempMemoryUsage:=FDataServer.GetMemoryUsage;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempMemoryUsage,SizeOf(double));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetServerName;
begin
   try
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(FDataServer.Description[1],Length(FDataServer.Description));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetServerDescription;
var
   TempDescription: string;
begin
   try
      TempDescription:=FDataServer.Description;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempDescription[1],Length(TempDescription));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetMainAddress;
var
   TempAddress: string;
begin
   try
      TempAddress:=FDataServer.MainAddress;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempAddress[1],Length(TempAddress));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetMainPort;
var
   TempPort: Integer;
begin
   try
      TempPort:=FDataServer.MainPort;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempPort,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetAdminAddress;
var
   TempAddress: string;
begin
   try
      TempAddress:=FDataServer.AdminAddress;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempAddress[1],Length(TempAddress));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetAdminPort;
var
   TempPort: Integer;
begin
   try
      TempPort:=FDataServer.AdminPort;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempPort,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetSessionCount;
var
   TempCount: Integer;
begin
   try
      TempCount:=FDataServer.GetServerSessionCount;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempCount,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetConnectedSessionCount;
var
   TempCount: Integer;
begin
   try
      TempCount:=FDataServer.GetServerConnectedSessionCount;
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempCount,SizeOf(Integer));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoGetSessionInfo;
var
   TempSessionNum: Integer;
   TempSessionID: Integer;
   TempCreatedOn: TDateTime;
   TempLastConnectedOn: TDateTime;
   TempUserName: string;
   TempUserAddress: string;
   TempLastAddress: string;
   TempIsEncrypted: Boolean;
   TempResult: Boolean;
begin
   try
      Unpack(TempSessionNum);
      TempResult:=FDataServer.GetServerSessionInfo(TempSessionNum,TempSessionID,
                                                   TempCreatedOn,TempLastConnectedOn,
                                                   TempUserName,TempUserAddress,
                                                   TempIsEncrypted,TempLastAddress);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      if TempResult then
         begin
         Pack(TempSessionID,SizeOf(Integer));
         Pack(TempCreatedOn,SizeOf(TDateTime));
         Pack(TempLastConnectedOn,SizeOf(TDateTime));
         Pack(TempUserName[1],Length(TempUserName));
         Pack(TempUserAddress[1],Length(TempUserAddress));
         Pack(TempIsEncrypted,SizeOf(Boolean));
         Pack(TempLastAddress[1],Length(TempLastAddress));
         end;
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoDisconnectSession;
var
   TempSession: TServerSession;
   TempResult: Boolean;
begin
   try
      Unpack(TempSession);
      TempResult:=FDataServer.DisconnectServerSession(TempSession);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.DoRemoveSession;
var
   TempSession: TServerSession;
   TempResult: Boolean;
begin
   try
      Unpack(TempSession);
      TempResult:=FDataServer.RemoveServerSession(TempSession);
      FReplyHeader.ResultCode:=DBISAM_NONE;
      BeginPack;
      Pack(TempResult,SizeOf(Boolean));
      EndPack;
   except
      on E: Exception do
         ProcessException(E);
   end;
end;

procedure TAdminThread.HandleReceive(RequestCode: Word);
begin
   if (RequestCode=REQUEST_PING) then
      { Do nothing }
   else if (RequestCode=REQUEST_RECONNECT) then
      begin
      if (not DoReconnect) then
         FCloseAfterSend:=True;
      end
   else
      begin
      if (RequestCode=REQUEST_CONNECTPARAMS) then
         begin
         if (not DoConnectionParams) then
            FCloseAfterSend:=True;
         end
      else
         begin
         if CheckSession then
            begin
            if (RequestCode=REQUEST_LOGIN) then
               DoLogin
            else
               begin
               if CheckSessionUser then
                  begin
                  case RequestCode of
                     REQUEST_LOGOUT:
                        DoLogout;
                     REQUEST_SESSIONPARAMS:
                        DoSessionParams;
                     REQUEST_GETDBNAMES:
                        DoGetDatabaseNames;
                     REQUEST_GETPROCNAMES:
                        DoGetProcedureNames;
                     REQUEST_ADDUSER:
                        DoAddUser;
                     REQUEST_MODIFYUSER:
                        DoModifyUser;
                     REQUEST_DELETEUSER:
                        DoDeleteUser;
                     REQUEST_GETUSER:
                        DoGetUser;
                     REQUEST_GETUSERNAMES:
                        DoGetUserNames;
                     REQUEST_ADDDB:
                        DoAddDatabase;
                     REQUEST_MODIFYDB:
                        DoModifyDatabase;
                     REQUEST_DELETEDB:
                        DoDeleteDatabase;
                     REQUEST_GETDB:
                        DoGetDatabase;
                     REQUEST_ADDDBUSER:
                        DoAddDatabaseUser;
                     REQUEST_MODIFYDBUSER:
                        DoModifyDatabaseUser;
                     REQUEST_DELETEDBUSER:
                        DoDeleteDatabaseUser;
                     REQUEST_GETDBUSER:
                        DoGetDatabaseUser;
                     REQUEST_GETDBUSERNAMES:
                        DoGetDatabaseUserNames;
                     REQUEST_ADDPROC:
                        DoAddProcedure;
                     REQUEST_MODIFYPROC:
                        DoModifyProcedure;
                     REQUEST_DELETEPROC:
                        DoDeleteProcedure;
                     REQUEST_GETPROC:
                        DoGetProcedure;
                     REQUEST_ADDPROCUSER:
                        DoAddProcedureUser;
                     REQUEST_MODIFYPROCUSER:
                        DoModifyProcedureUser;
                     REQUEST_DELETEPROCUSER:
                        DoDeleteProcedureUser;
                     REQUEST_GETPROCUSER:
                        DoGetProcedureUser;
                     REQUEST_GETPROCUSERNAMES:
                        DoGetProcedureUserNames;
                     REQUEST_ADDEVENT:
                        DoAddEvent;
                     REQUEST_MODIFYEVENT:
                        DoModifyEvent;
                     REQUEST_DELETEEVENT:
                        DoDeleteEvent;
                     REQUEST_GETEVENT:
                        DoGetEvent;
                     REQUEST_GETEVENTNAMES:
                        DoGetEventNames;
                     REQUEST_MODIFYCONFIG:
                        DoModifyServer;
                     REQUEST_GETCONFIG:
                        DoGetServer;
                     REQUEST_GETLOGCOUNT:
                        DoGetLogCount;
                     REQUEST_GETLOGRECORD:
                        DoGetLogRecord;
                     REQUEST_STARTSERVER:
                        DoStartServer;
                     REQUEST_STOPSERVER:
                        DoStopServer;
                     REQUEST_GETDATETIME:
                        DoGetDateTime;
                     REQUEST_GETUTCDATETIME:
                        DoGetUTCDateTime;
                     REQUEST_GETUPTIME:
                        DoGetUpTime;
                     REQUEST_GETMEMORYUSAGE:
                        DoGetMemoryUsage;
                     REQUEST_GETSERVERNAME:
                        DoGetServerName;
                     REQUEST_GETSERVERDESC:
                        DoGetServerDescription;
                     REQUEST_GETMAINADDRESS:
                        DoGetMainAddress;
                     REQUEST_GETMAINPORT:
                        DoGetMainPort;
                     REQUEST_GETADMINADDRESS:
                        DoGetAdminAddress;
                     REQUEST_GETADMINPORT:
                        DoGetAdminPort;
                     REQUEST_GETSESSIONS:
                        DoGetSessionCount;
                     REQUEST_GETCONNECTEDSESSIONS:
                        DoGetConnectedSessionCount;
                     REQUEST_GETSESSIONINFO:
                        DoGetSessionInfo;
                     REQUEST_DISCONNECTSESSION:
                        DoDisconnectSession;
                     REQUEST_REMOVESESSION:
                        DoRemoveSession;
                     else
                        DoInvalidRequest;
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

{ TScheduledEventThread }

procedure TScheduledEventThread.Execute;
var
   TempCompleted: Boolean;
begin
   FDataServer.Configuration.ModifyEventInProgress(FEventName,True);
   try
      FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SCHEDULEDEVENT,
                           'Scheduled event '+FEventName+' started',
                           ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
      TempCompleted:=False;
      try
         DataEngine.ServerScheduledEvent(FEventName,
                                         TempCompleted);
         if TempCompleted then
            begin
            FDataServer.Configuration.ModifyEventLastRun(FEventName);
            FDataServer.LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SCHEDULEDEVENT,
                                 'Scheduled event '+FEventName+' completed',
                                 ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
            end
         else
            FDataServer.LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_SCHEDULEDEVENT,
                                 'Scheduled event '+FEventName+' did not complete',
                                 ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
      except
         on E: Exception do
            FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_SCHEDULEDEVENT,
                                 'Scheduled event '+FEventName+' error '+
                                 PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                                 ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
      end;
   finally
      FDataServer.Configuration.ModifyEventInProgress(FEventName,False);
   end;
end;

{ TDataServer }

constructor TDataServer.Create(const ServerName: string;
                               const ServerDescription: string;
                               const ServerMainAddress: string;
                               ServerMainPort: Integer;
                               ServerMainThreadCacheSize: Integer;
                               const ServerAdminAddress: string;
                               ServerAdminPort: Integer;
                               ServerAdminThreadCacheSize: Integer;
                               ServerEncryptedOnly: Boolean;
                               const ServerEncryptionPassword: string;
                               const ServerConfigFileName: string;
                               const ServerConfigPassword: string;
                               ServerLicensedConnections: Word);
begin
   FName:=ServerName;
   FDescription:=ServerDescription;
   FMainServer:=TBindServerSocket.Create(nil);
   FAdminServer:=TBindServerSocket.Create(nil);
   FMainAddress:=ServerMainAddress;
   FMainPort:=ServerMainPort;
   FMainThreadCacheSize:=ServerMainThreadCacheSize;
   FAdminAddress:=ServerAdminAddress;
   FAdminPort:=ServerAdminPort;
   FAdminThreadCacheSize:=ServerAdminThreadCacheSize;
   FEncryptedOnly:=ServerEncryptedOnly;
   FEncryptionPassword:=ServerEncryptionPassword;
   FEncryptionDigest:=MD5String(FEncryptionPassword);
   DataEngine.CryptoInit(Pointer(@FEncryptionDigest),SizeOf(TMD5Digest),
                         FEncryptionData,FEncryptionDataSize);   
   FDeadSessionTimer:=TThreadTimer.Create;
   FScheduledEventTimer:=TThreadTimer.Create;
   FStopped:=True;
   FServerSessionSection:=OSAllocCriticalSection;
   OSInitializeCriticalSection(FServerSessionSection);
   FServerSessions:=TList.Create;
   FTotalSessions:=0;
   FTotalConnectedSessions:=0;
   FAdminSessionSection:=OSAllocCriticalSection;
   OSInitializeCriticalSection(FAdminSessionSection);
   FAdminSessions:=TList.Create;
   FLogSection:=OSAllocCriticalSection;
   OSInitializeCriticalSection(FLogSection);
   FConfiguration:=TConfiguration.Create(Self);
   if (ServerConfigFileName <> '') then
      FConfigFileName:=EnsureFileExt(ServerConfigFileName,CONFIG_EXT,CONFIG_EXT)
   else
      FConfigFileName:=EnsureFileExt(DEFAULT_CONFIG_NAME,CONFIG_EXT,CONFIG_EXT);
   if (ServerConfigPassword <> '') then
      FConfigPassword:=ServerConfigPassword
   else
      FConfigPassword:=DEFAULT_CONFIG_PASSWORD;
   FLicensedConnections:=ServerLicensedConnections;
   with FConfiguration do
      begin
      ConfigFile.FileName:=FConfigFileName;
      Password:=FConfigPassword;
      ReadFromFile;
      CheckTemporaryDirectory;
      end;
   with FDeadSessionTimer do
      begin
      OnTimer:=DeadSessionTimerTimer;
      Interval:=(FConfiguration.DeadSessionInterval*1000);
      Enabled:=True;
      end;
   with FScheduledEventTimer do
      begin
      OnTimer:=ScheduledEventTimerTimer;
      Interval:=60000;  { Always check every 1 minute }
      Enabled:=True;
      end;
end;

destructor TDataServer.Destroy;
begin
   FScheduledEventTimer.Free;
   FDeadSessionTimer.Free;
   StopMainServer;
   StopAdminServer;
   with FConfiguration do
      begin
      WriteToFile;
      Free;
      end;
   FreeAllServerSessions;
   FServerSessions.Free;
   OSDeleteCriticalSection(FServerSessionSection);
   OSDeAllocCriticalSection(FServerSessionSection);
   FreeAllAdminSessions;
   FAdminSessions.Free;
   OSDeleteCriticalSection(FAdminSessionSection);
   OSDeAllocCriticalSection(FAdminSessionSection);
   OSDeleteCriticalSection(FLogSection);
   OSDeAllocCriticalSection(FLogSection);
   if (FEncryptionDataSize > 0) then
      begin
      DeAllocMem(FEncryptionData);
      FEncryptionDataSize:=0;
      end;
   FMainServer.Free;
   FAdminServer.Free;
   inherited;
end;


procedure TDataServer.LogEvent(LogTime: TDateTime;
                               LogCategory: Byte;
                               LogEventType: Byte;
                               LogText: string;
                               SrvVersion: Currency;
                               CliVersion: Currency;
                               CliAddress: string;
                               CliEncrypted: Boolean;
                               CliUser: string;
                               CliRequest: Word;
                               CliThread: Integer;
                               CliSession: Integer);
var
   TempDataLogRecord: TDataLogRecord;
begin
   OSEnterCriticalSection(FLogSection);
   try
      with TempDataLogRecord do
         begin
         DateTime:=LogTime;
         Category:=LogCategory;
         EventType:=LogEventType;
         Text:=LogText;
         ServerVersion:=SrvVersion;
         ClientVersion:=CliVersion;
         ClientAddress:=CliAddress;
         ClientEncrypted:=CliEncrypted;
         ClientUser:=CliUser;
         ClientRequest:=CliRequest;
         ClientRequestName:=DataEngine.TranslateRequestConstant(CliRequest);
         ClientThread:=CliThread;
         ClientSession:=CliSession;
         end;
      DataEngine.LogServerEvent(TempDataLogRecord);
   finally
      OSLeaveCriticalSection(FLogSection);
   end;
end;

function TDataServer.GetLogCount: Integer;
begin
   OSEnterCriticalSection(FLogSection);
   try
      Result:=DataEngine.GetServerLogCount;
   finally
      OSLeaveCriticalSection(FLogSection);
   end;
end;

function TDataServer.GetLogRecord(Number: Integer): TDataLogRecord;
begin
   OSEnterCriticalSection(FLogSection);
   try
      Result:=DataEngine.GetServerLogRecord(Number);
   finally
      OSLeaveCriticalSection(FLogSection);
   end;
end;

procedure TDataServer.StartAdminServer;
begin
   if (FAdminAddress <> '') then
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTART,
               'Starting admin server on address '+FAdminAddress+' and port '+
               IntToStr(FAdminPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0)
   else
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTART,
              'Starting admin server on all addresses and port '+
              IntToStr(FAdminPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
   try
      with FAdminServer do
         begin
         Address:=FAdminAddress;
         ServerType:=stThreadBlocking;
         Port:=FAdminPort;
         ThreadCacheSize:=FAdminThreadCacheSize;
         OnGetThread:=AdminServerGetThread;
         OnGetSocket:=AdminServerGetSocket;
         Active:=True;
         end;
   except
      on E: Exception do
         begin
         LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_SERVERSTART,
                  'Internal error starting admin server '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                  ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
         raise;
         end;
   end;
end;

procedure TDataServer.StopAdminServer;
begin
   if (FAdminAddress <> '') then
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTOP,
               'Stopping admin server on address '+FAdminAddress+' and port '+
                IntToStr(FAdminPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0)
   else
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTOP,
               'Stopping admin server on all addresses and port '+
               IntToStr(FAdminPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
   try
      FAdminServer.Active:=False;
   except
      on E: Exception do
         begin
         LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_SERVERSTOP,
                  'Internal error stopping admin server '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                  ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
         raise;
         end;
   end;
end;

procedure TDataServer.StartMainServer;
begin
   if (not FStopped) then Exit;
   if (FMainAddress <> '') then
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTART,
               'Starting server on address '+FMainAddress+' and port '+
               IntToStr(FMainPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0)
   else
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTART,
               'Starting server on all addresses and port '+
               IntToStr(FMainPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
   try
      with FMainServer do
         begin
         Address:=FMainAddress;
         ServerType:=stThreadBlocking;
         Port:=FMainPort;
         ThreadCacheSize:=FMainThreadCacheSize;
         OnGetThread:=MainServerGetThread;
         OnGetSocket:=MainServerGetSocket;
         Active:=True;
         end;
      FStartTime:=Now;
      FStopped:=False;
      DataEngine.ServerStart;
   except
      on E: Exception do
         begin
         LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_SERVERSTART,
                  'Internal error starting server '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                  ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
         raise;
         end;
   end;
end;

procedure TDataServer.StopMainServer;
begin
   if FStopped then Exit;
   if (FMainAddress <> '') then
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTOP,
               'Stopping server on address '+FMainAddress+' and port '+
               IntToStr(FMainPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0)
   else
      LogEvent(Now,LOG_CATEGORY_INFO,LOG_TYPE_SERVERSTOP,
               'Stopping server on all addresses and port '+
               IntToStr(FMainPort),ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
   FStopped:=True;
   try
      FMainServer.Active:=False;
      DataEngine.ServerStop;
   except
      on E: Exception do
         begin
         LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_SERVERSTOP,
                  'Internal error stopping server '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                  ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
         raise;
         end;
   end;
end;

procedure TDataServer.DeadSessionTimerTimer(Sender: TObject);
begin
   CheckForDeadServerSessions;
end;

procedure TDataServer.ScheduledEventTimerTimer(Sender: TObject);
begin
   CheckForScheduledEvents;
end;

function TDataServer.GetUTCDateTime: TDateTime;
begin
   Result:=OSUTCDateTime;
end;

function TDataServer.GetUpTime: Int64;
begin
   if (not FStopped) then
      Result:=GetSecondsBetween(FStartTime,Now)
   else
      Result:=-1;
end;

function TDataServer.GetMemoryUsage: double;
begin
   Result:=0;
end;

procedure TDataServer.LockServerSessions;
begin
   OSEnterCriticalSection(FServerSessionSection);
end;

procedure TDataServer.UnlockServerSessions;
begin
   OSLeaveCriticalSection(FServerSessionSection);
end;

procedure TDataServer.LockAdminSessions;
begin
   OSEnterCriticalSection(FAdminSessionSection);
end;

procedure TDataServer.UnlockAdminSessions;
begin
   OSLeaveCriticalSection(FAdminSessionSection);
end;

function TDataServer.GetServerSessionCount: Integer;
begin
   LockServerSessions;
   try
      Result:=FTotalSessions;
   finally
      UnlockServerSessions;
   end;
end;

function TDataServer.GetServerConnectedSessionCount: Integer;
begin
   if FMainServer.Active then
      begin
      LockServerSessions;
      try
         Result:=FTotalConnectedSessions;
      finally
         UnlockServerSessions;
      end;
      end
   else
      Result:=0;
end;

procedure TDataServer.ConnectServerSession(SessionThread: TServerThread);
var
   TempServerSession: TServerSession;
begin
   LockServerSessions;
   try
      TempServerSession:=TServerSession.Create(Self);
      FServerSessions.Add(TempServerSession);
      Inc(FTotalSessions);
      with TempServerSession do
         begin
         UserName:='';
         DataSession.SetPasswordCallback(Integer(SessionThread),@TServerThread.PasswordCallback);
         DataSession.SetGetPathCallback(Integer(SessionThread),@TServerThread.GetPathCallback);
         DataSession.SetGetRightsCallback(Integer(SessionThread),@TServerThread.GetRightsCallback);
         DataSession.SetCheckRightsCallback(Integer(SessionThread),@TServerThread.CheckRightsCallback);
         DataSession.SetProcedureProgressCallback(Integer(SessionThread),@TServerThread.ProcedureProgressCallback);
         Connect(SessionThread);
         Inc(FTotalConnectedSessions);
         DisplayConnect;
         end;
   finally
      UnlockServerSessions;
   end;
end;

procedure TDataServer.LoginServerSession(SessionToLogin: TServerSession;
                                         const User: string);
begin
   LockServerSessions;
   try
      with SessionToLogin do
         begin
         UserName:=User;
         DataSession.Name:=UserName+'_'+IntToStr(Integer(SessionToLogin));
         DataSession.UserName:=UserName;
         DisplayLogin;
         end;
   finally
      UnlockServerSessions;
   end;
end;

function TDataServer.ReconnectServerSession(SessionThread: TServerThread;
                                            SessionToReconnect: TServerSession;
                                            var WaitForDisconnect: Boolean): Boolean;
begin
   LockServerSessions;
   try
      WaitForDisconnect:=False;
      Result:=False;
      if (FServerSessions.IndexOf(SessionToReconnect) <> -1) then
         begin
         if (AnsiCompareText(SessionThread.ClientProcess,
                             SessionToReconnect.UserProcess)=0) and
            (SessionThread.ClientThread=SessionToReconnect.UserThread) then
            begin
            with SessionToReconnect do
               begin
               if Connected and (Thread <> SessionThread) then
                  begin
                  Thread.CloseConnection;
                  WaitForDisconnect:=True;
                  end
               else
                  begin
                  DataSession.CheckCallbacks(Integer(SessionThread));
                  Connect(SessionThread);
                  Inc(FTotalConnectedSessions);
                  DisplayReconnect;
                  Result:=True;
                  end;
               end;
            end;
         end;
   finally
      UnlockServerSessions;
   end;
end;

function TDataServer.DisconnectServerSession(SessionToDisconnect: TServerSession): Boolean;
var
   I: Integer;
   TempThread: Integer;
   TempSession: TServerSession;
   TempUserName: string;
   TempLastAddress: string;
begin
   Result:=False;
   LockServerSessions;
   try
      I:=FServerSessions.IndexOf(SessionToDisconnect);
      if (I <> -1) then
         begin
         TempSession:=SessionToDisconnect;
         with SessionToDisconnect do
            begin
            if Connected then
               TempThread:=Thread.ThreadID
            else
               TempThread:=0;
            { If the user never logged into this session, then go ahead
              and remove the session }
            if (UserName='') then
               begin
               Dec(FTotalConnectedSessions);
               Dec(FTotalSessions);
               Disconnect;
               try
                  TempUserName:=UserName;
                  TempLastAddress:=LastAddress;
                  Free;
               except
                  on E: Exception do
                     LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_DISCONNECT,
                              'Internal error removing session '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                              ENGINE_VERSION_NUM,0.00,TempLastAddress,False,TempUserName,0,
                              TempThread,Integer(TempSession));
               end;
               FServerSessions.Delete(I);
               end
            else
               begin
               Dec(FTotalConnectedSessions);
               Disconnect;
               end;
            end;
         Result:=True;
         end;
   finally
      UnlockServerSessions;
   end;
end;

function TDataServer.RemoveServerSession(SessionToRemove: TServerSession): Boolean;
var
   I: Integer;
   TempThread: Integer;
   TempSession: TServerSession;
   TempUserName: string;
   TempLastAddress: string;
begin
   Result:=False;
   LockServerSessions;
   try
      I:=FServerSessions.IndexOf(SessionToRemove);
      if (I <> -1) then
         begin
         TempSession:=SessionToRemove;
         with SessionToRemove do
            begin
            if Connected then
               TempThread:=Thread.ThreadID
            else
               TempThread:=0;
            TempUserName:=UserName;
            TempLastAddress:=LastAddress;
            UserName:='';
            if Connected then
               Dec(FTotalConnectedSessions);
            Dec(FTotalSessions);
            Disconnect;
            try
               Free;
            except
               on E: Exception do
                  LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_DISCONNECT,
                           'Internal error removing session '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                           ENGINE_VERSION_NUM,0.00,TempLastAddress,False,TempUserName,0,
                           TempThread,Integer(TempSession));
            end;
            FServerSessions.Delete(I);
            end;
         Result:=True;
         end;
   finally
      UnlockServerSessions;
   end;
end;

procedure TDataServer.FreeAllServerSessions;
var
   I: Integer;
begin
   LockServerSessions;
   try
      for I:=FServerSessions.Count-1 downto 0 do
         begin
         try
            TServerSession(FServerSessions[I]).Free;
         except
         end;
         FServerSessions.Delete(I);
         end;
   finally
      UnlockServerSessions;
   end;
end;

function TDataServer.GetServerSessionInfo(SessionNum: Integer;
                                          var SessionID: Integer;
                                          var CreatedOn: TDateTime;
                                          var LastConnectedOn: TDateTime;
                                          var SessionUserName: string;
                                          var SessionUserAddress: string;
                                          var IsEncryptedSession: Boolean;
                                          var LastUserAddress: string): Boolean;
begin
   LockServerSessions;
   try
      Result:=False;
      if (SessionNum > 0) and (SessionNum <= FServerSessions.Count) then
         begin
         SessionID:=Integer(FServerSessions[SessionNum-1]);
         with TServerSession(FServerSessions[SessionNum-1]) do
            begin
            CreatedOn:=Created;
            LastConnectedOn:=LastConnected;
            SessionUserName:=UserName;
            SessionUserAddress:=UserAddress;
            IsEncryptedSession:=IsEncrypted;
            LastUserAddress:=LastAddress;
            end;
         Result:=True;
         end;
   finally
      UnlockServerSessions;
   end;
end;

procedure TDataServer.CheckForDeadServerSessions;
var
   I: Integer;
   TotalDeadSessions: Integer;
   StopChecking: Boolean;
   TempSession: TServerSession;
   TempUserName: string;
   TempLastAddress: string;
begin
   LockServerSessions;
   try
      StopChecking:=False;
      while (not StopChecking) do
         begin
         StopChecking:=True;
         TotalDeadSessions:=0;
         for I:=0 to FServerSessions.Count-1 do
            begin
            TempSession:=TServerSession(FServerSessions[I]);
            with TServerSession(FServerSessions[I]) do
               begin
               if (not Connected) then
                  begin
                  Inc(TotalDeadSessions);
                  if (TotalDeadSessions > FConfiguration.MaxDeadSessions) or
                     ((FConfiguration.DeadSessionExpires > 0) and
                      (GetSecondsBetween(LastConnected,Now) > FConfiguration.DeadSessionExpires)) then
                     begin
                     Dec(FTotalSessions);
                     DisplayLogout;
                     try
                        TempUserName:=UserName;
                        TempLastAddress:=LastAddress;
                        Free;
                        LogEvent(Now,LOG_CATEGORY_WARNING,LOG_TYPE_DEADSESSION,
                                 'Dead session removed',
                                 ENGINE_VERSION_NUM,0.00,TempLastAddress,False,TempUserName,0,
                                 0,Integer(TempSession));
                     except
                        on E: Exception do
                           LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_DEADSESSION,
                                    'Internal error removing dead session '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                                    ENGINE_VERSION_NUM,0.00,TempLastAddress,False,TempUserName,0,
                                    0,Integer(TempSession));
                     end;
                     FServerSessions.Delete(I);
                     StopChecking:=False;
                     Break;
                     end;
                  end;
               end;
            end;
         end;
   finally
      UnlockServerSessions;
   end;
end;

procedure TDataServer.ConnectAdminSession(SessionThread: TAdminThread);
var
   TempAdminSession: TAdminSession;
begin
   LockAdminSessions;
   try
      TempAdminSession:=TAdminSession.Create(Self);
      FAdminSessions.Add(TempAdminSession);
      with TempAdminSession do
         begin
         UserName:='';
         Connect(SessionThread);
         end;
   finally
      UnlockAdminSessions;
   end;
end;

procedure TDataServer.LoginAdminSession(SessionToLogin: TAdminSession;
                                        const User: string);
begin
   LockAdminSessions;
   try
      with SessionToLogin do
         UserName:=User;
   finally
      UnlockAdminSessions;
   end;
end;

function TDataServer.ReconnectAdminSession(SessionThread: TAdminThread;
                                           SessionToReconnect: TAdminSession;
                                           var WaitForDisconnect: Boolean): Boolean;
begin
   LockAdminSessions;
   try
      WaitForDisconnect:=False;
      Result:=False;
      if (FAdminSessions.IndexOf(SessionToReconnect) <> -1) then
         begin
         if (AnsiCompareText(SessionThread.ClientProcess,
                             SessionToReconnect.UserProcess)=0) and
            (SessionThread.ClientThread=SessionToReconnect.UserThread) then
            begin
            with SessionToReconnect do
               begin
               if Connected and (Thread <> SessionThread) then
                  begin
                  Thread.CloseConnection;
                  WaitForDisconnect:=True;
                  end
               else
                  begin
                  Connect(SessionThread);
                  Result:=True;
                  end;
               end;
            end;
         end;
   finally
      UnlockAdminSessions;
   end;
end;

function TDataServer.DisconnectAdminSession(SessionToDisconnect: TAdminSession): Boolean;
var
   I: Integer;
   TempThread: Integer;
   TempSession: TAdminSession;
   TempUserName: string;
   TempLastAddress: string;
begin
   Result:=False;
   LockAdminSessions;
   try
      I:=FAdminSessions.IndexOf(SessionToDisconnect);
      if (I <> -1) then
         begin
         TempSession:=SessionToDisconnect;
         with SessionToDisconnect do
            begin
            if Connected then
               TempThread:=Thread.ThreadID
            else
               TempThread:=0;
            Disconnect;
            if (UserName='') then
               begin
               try
                  TempUserName:=UserName;
                  TempLastAddress:=LastAddress;
                  Free;
               except
                  on E: Exception do
                     LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_DISCONNECT,
                              'Internal error removing admin session '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                              ENGINE_VERSION_NUM,0.00,TempLastAddress,False,TempUserName,0,
                              TempThread,Integer(TempSession));
               end;
               FAdminSessions.Delete(I);
               end;
            end;
         Result:=True;
         end;
   finally
      UnlockAdminSessions;
   end;
end;

function TDataServer.RemoveAdminSession(SessionToRemove: TAdminSession): Boolean;
var
   I: Integer;
   TempThread: Integer;
   TempSession: TAdminSession;
   TempUserName: string;
   TempLastAddress: string;
begin
   Result:=False;
   LockAdminSessions;
   try
      I:=FAdminSessions.IndexOf(SessionToRemove);
      if (I <> -1) then
         begin
         TempSession:=SessionToRemove;
         with SessionToRemove do
            begin
            if Connected then
               TempThread:=Thread.ThreadID
            else
               TempThread:=0;
            TempUserName:=UserName;
            TempLastAddress:=LastAddress;
            UserName:='';
            Disconnect;
            try
               Free;
            except
               on E: Exception do
                  LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_DISCONNECT,
                           'Internal error removing admin session '+PARSE_LEFTBRACKET+E.Message+PARSE_RIGHTBRACKET,
                           ENGINE_VERSION_NUM,0.00,TempLastAddress,False,TempUserName,0,
                           TempThread,Integer(TempSession));
            end;
            FAdminSessions.Delete(I);
            end;
         Result:=True;
         end;
   finally
      UnlockAdminSessions;
   end;
end;

procedure TDataServer.FreeAllAdminSessions;
var
   I: Integer;
begin
   LockAdminSessions;
   try
      for I:=FAdminSessions.Count-1 downto 0 do
         begin
         try
            TAdminSession(FAdminSessions[I]).Free;
         except
         end;
         FAdminSessions.Delete(I);
         end;
   finally
      UnlockAdminSessions;
   end;
end;

procedure TDataServer.MainServerGetThread(Sender: TObject;
                                          ClientSocket: TServerClientWinSocket;
                                          var SocketThread: TServerClientThread);
begin
   SocketThread:=TServerThread.Create(Self,ClientSocket);
   with SocketThread do
      begin
      Priority:=tpLower;
      Resume;
      end;
end;

procedure TDataServer.AdminServerGetThread(Sender: TObject;
                                            ClientSocket: TServerClientWinSocket;
                                            var SocketThread: TServerClientThread);
begin
   SocketThread:=TAdminThread.Create(Self,ClientSocket);
   with SocketThread do
      begin
      Priority:=tpLower;
      Resume;
      end;
end;

procedure TDataServer.MainServerGetSocket(Sender: TObject; Socket: TSocket;
                                          var ClientSocket: TServerClientWinSocket);
begin
   ClientSocket:=TDataClientSocket.Create(Socket,MainServer.Socket);
end;

procedure TDataServer.AdminServerGetSocket(Sender: TObject; Socket: TSocket;
                                           var ClientSocket: TServerClientWinSocket);
begin
   ClientSocket:=TDataClientSocket.Create(Socket,AdminServer.Socket);
end;

function TDataServer.CheckMaxConnections: Boolean;
begin
   Result:=True;
   if (GetServerConnectedSessionCount >= FConfiguration.MaxConnections) then
      Result:=False;
end;

function TDataServer.DisplayConnect(IsEncrypted: Boolean;
                                     const ConnectAddress: string): TObject;
begin
   Result:=DataEngine.ServerConnect(IsEncrypted,ConnectAddress);
end;

procedure TDataServer.DisplayReconnect(IsEncrypted: Boolean; const ConnectAddress: string;
                                       UserData: TObject);
begin
   DataEngine.ServerReconnect(IsEncrypted,ConnectAddress,UserData);
end;

procedure TDataServer.DisplayLogin(const UserName: string; UserData: TObject);
begin
   DataEngine.ServerLogin(UserName,UserData);
end;

procedure TDataServer.DisplayLogout(var UserData: TObject);
begin
   DataEngine.ServerLogout(UserData);
end;

procedure TDataServer.DisplayDisconnect(UserData: TObject;
                                        const LastConnectAddress: string);
begin
   DataEngine.ServerDisconnect(UserData,LastConnectAddress);
end;

procedure TDataServer.CheckForScheduledEvents;
var
   I: Integer;
   TempEventsList: TStrings;
   TempEventName: string;
   TempDescription: string;
   TempRunType: Byte;
   TempStartDate: TDateTime;
   TempEndDate: TDateTime;
   TempStartTime: TDateTime;
   TempEndTime: TDateTime;
   TempInterval: Word;
   TempDays: TConfigDays;
   TempDayOfMonth: Byte;
   TempDayOfWeek: Byte;
   TempMonths: TConfigMonths;
   TempLastRun: TDateTime;
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
   TempInProgress: Boolean;
   TempDateTime: TDateTime;
begin
   TempEventsList:=TStringList.Create;
   try
      FConfiguration.GetEventList(TempEventsList);
      for I:=0 to TempEventsList.Count-1 do
         begin
         TempEventName:=TempEventsList[I];
         TempDescription:='';
         TempRunType:=0;
         TempStartDate:=0;
         TempEndDate:=0;
         TempStartTime:=0;
         TempEndTime:=0;
         TempInterval:=0;
         FillChar(TempDays,SizeOf(TConfigDays),#0);
         TempDayOfMonth:=0;
         TempDayOfWeek:=0;
         FillChar(TempMonths,SizeOf(TConfigMonths),#0);
         TempLastRun:=0;
         if FConfiguration.GetEvent(TempEventName,TempDescription,
                                    TempRunType,
                                    TempStartDate,TempEndDate,
                                    TempStartTime,TempEndTime,
                                    TempInterval,
                                    TempDays,
                                    TempDayOfMonth,
                                    TempDayOfWeek,
                                    TempMonths,
                                    TempLastRun,TempInProgress) then
            begin
            if (not TempInProgress) then
               begin
               TempDateTime:=Now;
               case TempRunType of
                  RUN_ONCE:
                     begin
                     if (TempLastRun=0) and
                        (DateTimeToTimeStamp(TempDateTime).Time >=
                         DateTimeToTimeStamp(TempStartTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Time <=
                         DateTimeToTimeStamp(TempEndTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Date >=
                         DateTimeToTimeStamp(TempStartDate).Date) and
                        (DateTimeToTimeStamp(TempDateTime).Date <=
                         DateTimeToTimeStamp(TempEndDate).Date) then
                        LaunchScheduledEvent(TempEventName);
                     end;
                  RUN_HOURLY:
                     begin
                     if (GetHoursBetween(TempLastRun,TempDateTime) >= TempInterval) and
                        (DateTimeToTimeStamp(TempDateTime).Time >=
                         DateTimeToTimeStamp(TempStartTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Time <=
                         DateTimeToTimeStamp(TempEndTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Date >=
                         DateTimeToTimeStamp(TempStartDate).Date) and
                        (DateTimeToTimeStamp(TempDateTime).Date <=
                         DateTimeToTimeStamp(TempEndDate).Date) then
                        LaunchScheduledEvent(TempEventName);
                     end;
                  RUN_DAILY:
                     begin
                     if (GetDaysBetween(TempLastRun,TempDateTime) >= TempInterval) and
                        (DateTimeToTimeStamp(TempDateTime).Time >=
                         DateTimeToTimeStamp(TempStartTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Time <=
                         DateTimeToTimeStamp(TempEndTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Date >=
                         DateTimeToTimeStamp(TempStartDate).Date) and
                        (DateTimeToTimeStamp(TempDateTime).Date <=
                         DateTimeToTimeStamp(TempEndDate).Date) then
                        LaunchScheduledEvent(TempEventName);
                     end;
                  RUN_WEEKLY:
                     begin
                     if (GetWeeksBetween(TempLastRun,TempDateTime) >= TempInterval) and
                        TempDays[DayOfWeek(TempDateTime)] and
                        (DateTimeToTimeStamp(TempDateTime).Time >=
                         DateTimeToTimeStamp(TempStartTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Time <=
                         DateTimeToTimeStamp(TempEndTime).Time) and
                        (DateTimeToTimeStamp(TempDateTime).Date >=
                         DateTimeToTimeStamp(TempStartDate).Date) and
                        (DateTimeToTimeStamp(TempDateTime).Date <=
                         DateTimeToTimeStamp(TempEndDate).Date) then
                        LaunchScheduledEvent(TempEventName);
                     end;
                  RUN_MONTHLY:
                     begin
                     if (DateTimeToTimeStamp(TempDateTime).Date >=
                         DateTimeToTimeStamp(TempStartDate).Date) and
                        (DateTimeToTimeStamp(TempDateTime).Date <=
                         DateTimeToTimeStamp(TempEndDate).Date) then
                        begin
                        DecodeDate(Date,TempYear,TempMonth,TempDay);
                        if TempMonths[TempMonth] then
                           begin
                           case TempDayOfMonth of
                              1..31:
                                 begin
                                 if (TempDay=TempDayOfMonth) and
                                    (DateTimeToTimeStamp(TempDateTime).Time >=
                                     DateTimeToTimeStamp(TempStartTime).Time) and
                                    (DateTimeToTimeStamp(TempDateTime).Time <=
                                     DateTimeToTimeStamp(TempEndTime).Time) then
                                    LaunchScheduledEvent(TempEventName);
                                 end;
                              else
                                 begin
                                 if IsDayOfMonth(TempDateTime,TempDayOfMonth,TempDayOfWeek) and
                                    (DateTimeToTimeStamp(TempDateTime).Time >=
                                     DateTimeToTimeStamp(TempStartTime).Time) and
                                    (DateTimeToTimeStamp(TempDateTime).Time <=
                                     DateTimeToTimeStamp(TempEndTime).Time) then
                                    LaunchScheduledEvent(TempEventName);
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
   finally
      TempEventsList.Free;
   end;
end;

procedure TDataServer.LaunchScheduledEvent(const NameOfEvent: string);
begin
   with TScheduledEventThread.Create(True) do
      begin
      DataServer:=Self;
      EventName:=NameOfEvent;
      FreeOnTerminate:=True;
      Priority:=tpLower;
      Resume;
      end;
end;

{ TConfigEvent }

constructor TConfigEvent.Create(Owner: TConfiguration);
begin
   FConfiguration:=Owner;
end;

destructor TConfigEvent.Destroy;
begin
   inherited;
end;

procedure TConfigEvent.ReadFromBuffer(Version: Currency);
var
   BytesToRead: Integer;
begin
   with FConfiguration do
      begin
      Read(BytesToRead,SizeOf(Integer));
      Self.FDescription[0]:=Char(Byte(Read(Self.FDescription[1],BytesToRead)));
      Read(Self.FRunType,SizeOf(Byte));
      Read(Self.FStartDate,SizeOf(TDateTime));
      Read(Self.FEndDate,SizeOf(TDateTime));
      Read(Self.FStartTime,SizeOf(TDateTime));
      Read(Self.FEndTime,SizeOf(TDateTime));
      Read(Self.FInterval,SizeOf(Integer));
      Read(Self.FDays,SizeOf(TConfigDays));
      Read(Self.FDayOfMonth,SizeOf(Byte));
      Read(Self.FDayOfWeek,SizeOf(Byte));
      Read(Self.FMonths,SizeOf(TConfigMonths));
      Read(Self.FLastRun,SizeOf(TDateTime));
      end;
end;

procedure TConfigEvent.WriteToBuffer(Version: Currency);
var
   BytesToWrite: Integer;
begin
   with FConfiguration do
      begin
      BytesToWrite:=Length(Self.FDescription);
      Write(BytesToWrite,SizeOf(Integer));
      Self.FDescription[0]:=Char(Byte(Write(Self.FDescription[1],BytesToWrite)));
      Write(Self.FRunType,SizeOf(Byte));
      Write(Self.FStartDate,SizeOf(TDateTime));
      Write(Self.FEndDate,SizeOf(TDateTime));
      Write(Self.FStartTime,SizeOf(TDateTime));
      Write(Self.FEndTime,SizeOf(TDateTime));
      Write(Self.FInterval,SizeOf(Integer));
      Write(Self.FDays,SizeOf(TConfigDays));
      Write(Self.FDayOfMonth,SizeOf(Byte));
      Write(Self.FDayOfWeek,SizeOf(Byte));
      Write(Self.FMonths,SizeOf(TConfigMonths));
      Write(Self.FLastRun,SizeOf(TDateTime));
      end;
end;

{ TConfigDatabaseUser }

constructor TConfigDatabaseUser.Create(Owner: TConfigDatabase);
begin
   FDatabase:=Owner;
   FRights:=0;
   SetRight(FRights,READ_RIGHT,True);
end;

destructor TConfigDatabaseUser.Destroy;
begin
   inherited;
end;

procedure TConfigDatabaseUser.ReadFromFile;
var
   TempRights: Byte;
begin
   with FDatabase.Configuration.ConfigFile do
      Read(TempRights,SizeOf(Byte),False);
   FRights:=TempRights;
end;

procedure TConfigDatabaseUser.ReadFromBuffer(Version: Currency);
begin
   with FDatabase.Configuration do
      Read(Self.FRights,SizeOf(Integer));
end;

procedure TConfigDatabaseUser.WriteToBuffer(Version: Currency);
begin
   with FDatabase.Configuration do
      Write(Self.FRights,SizeOf(Integer));
end;

{ TConfigDatabase }

constructor TConfigDatabase.Create(Owner: TConfiguration);
begin
   FConfiguration:=Owner;
   FPath:='';
   FAuthorizedUsers:=TStringList.Create;
   with FAuthorizedUsers do
      begin
      Sorted:=True;
      Duplicates:=dupIgnore;
      end;
end;

destructor TConfigDatabase.Destroy;
begin
   FreeAuthorizedUsers;
   FAuthorizedUsers.Free;
   inherited;
end;

procedure TConfigDatabase.FreeAuthorizedUsers;
var
   I: Integer;
begin
   for I:=0 to FAuthorizedUsers.Count-1 do
      TConfigDatabaseUser(FAuthorizedUsers.Objects[I]).Free;
end;

procedure TConfigDatabase.ReadFromFile;
var
   BytesToRead: Integer;
   I: Integer;
   TempCount: Integer;
   TempUserName: string;
   TempDatabaseUser: TConfigDatabaseUser;
begin
   with FConfiguration.ConfigFile do
      begin
      Read(BytesToRead,SizeOf(Integer),False);
      FPath[0]:=Char(Byte(Read(FPath[1],BytesToRead,False)));
      V123DecryptBuffer(FPath[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
      Read(TempCount,SizeOf(Integer),False);
      for I:=1 to TempCount do
         begin
         Read(BytesToRead,SizeOf(Integer),False);
         TempUserName[0]:=Char(Byte(Read(TempUserName[1],BytesToRead,False)));
         V123DecryptBuffer(TempUserName[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
         TempDatabaseUser:=TConfigDatabaseUser.Create(Self);
         TempDatabaseUser.ReadFromFile;
         FAuthorizedUsers.AddObject(TempUserName,TObject(TempDatabaseUser));
         end;
      end;
end;

procedure TConfigDatabase.ReadFromBuffer(Version: Currency);
var
   BytesToRead: Integer;
   I: Integer;
   TempCount: Integer;
   TempUserName: string;
   TempDatabaseUser: TConfigDatabaseUser;
begin
   with FConfiguration do
      begin
      { Version 5 }
      if (Version >= 4.22) then
         begin
         Read(BytesToRead,SizeOf(Integer));
         Self.FDescription[0]:=Char(Byte(Read(Self.FDescription[1],BytesToRead)));
         end;
      { Version 5 }
      Read(BytesToRead,SizeOf(Integer));
      Self.FPath[0]:=Char(Byte(Read(Self.FPath[1],BytesToRead)));
      Read(TempCount,SizeOf(Integer));
      for I:=1 to TempCount do
         begin
         Read(BytesToRead,SizeOf(Integer));
         TempUserName[0]:=Char(Byte(Read(TempUserName[1],BytesToRead)));
         TempDatabaseUser:=TConfigDatabaseUser.Create(Self);
         TempDatabaseUser.ReadFromBuffer(Version);
         FAuthorizedUsers.AddObject(TempUserName,TObject(TempDatabaseUser));
         end;
      end;
end;

procedure TConfigDatabase.WriteToBuffer(Version: Currency);
var
   BytesToWrite: Integer;
   I: Integer;
   { Version 5 }
   TempDescription: string;
   { Version 5 }
   TempPath: string;
   TempCount: Integer;
   TempUserName: string;
   TempDatabaseUser: TConfigDatabaseUser;
begin
   with FConfiguration do
      begin
      { Version 5 }
      TempDescription:=Self.FDescription;
      BytesToWrite:=Length(TempDescription);
      Write(BytesToWrite,SizeOf(Integer));
      Write(TempDescription[1],BytesToWrite);
      { Version 5 }
      TempPath:=Self.FPath;
      BytesToWrite:=Length(TempPath);
      Write(BytesToWrite,SizeOf(Integer));
      Write(TempPath[1],BytesToWrite);
      TempCount:=FAuthorizedUsers.Count;
      Write(TempCount,SizeOf(Integer));
      for I:=0 to TempCount-1 do
         begin
         TempUserName:=FAuthorizedUsers[I];
         BytesToWrite:=Length(TempUserName);
         Write(BytesToWrite,SizeOf(Integer));
         Write(TempUserName[1],BytesToWrite);
         TempDatabaseUser:=TConfigDatabaseUser(FAuthorizedUsers.Objects[I]);
         TempDatabaseUser.WriteToBuffer(Version);
         end;
      end;
end;

function TConfigDatabase.Authorize(const UserName: string): Integer;
var
   I: Integer;
begin
   Result:=0;
   for I:=0 to FAuthorizedUsers.Count-1 do
      begin
      if MatchString(UserName,FAuthorizedUsers[I],False,'',False) then
         begin
         Result:=TConfigDatabaseUser(FAuthorizedUsers.Objects[I]).Rights;
         Break;
         end;
      end;
end;

function TConfigDatabase.AddUser(const AuthorizedUser: string;
                                 RightsToAssign: Integer): Boolean;
var
   UserPos: Integer;
   TempDatabaseUser: TConfigDatabaseUser;
begin
   Result:=False;
   if (not FAuthorizedUsers.Find(AuthorizedUser,UserPos)) then
      begin
      TempDatabaseUser:=TConfigDatabaseUser.Create(Self);
      TempDatabaseUser.Rights:=RightsToAssign;
      FAuthorizedUsers.AddObject(AuthorizedUser,TempDatabaseUser);
      Result:=True;
      end;
end;

function TConfigDatabase.ModifyUser(const AuthorizedUser: string;
                                    RightsToAssign: Integer): Boolean;
var
   UserPos: Integer;
begin
   Result:=False;
   if FAuthorizedUsers.Find(AuthorizedUser,UserPos) then
      begin
      with TConfigDatabaseUser(FAuthorizedUsers.Objects[UserPos]) do
         begin
         Rights:=RightsToAssign;
         Result:=True;
         end;
      end;
end;

function TConfigDatabase.DeleteUser(const AuthorizedUser: string): Boolean;
var
   UserPos: Integer;
begin
   Result:=False;
   if FAuthorizedUsers.Find(AuthorizedUser,UserPos) then
      begin
      TConfigDatabaseUser(FAuthorizedUsers.Objects[UserPos]).Free;
      FAuthorizedUsers.Delete(UserPos);
      Result:=True;
      end;
end;

function TConfigDatabase.GetUser(const AuthorizedUser: string;
                                 var UserRights: Integer): Boolean;
var
   UserPos: Integer;
begin
   Result:=False;
   if FAuthorizedUsers.Find(AuthorizedUser,UserPos) then
      begin
      with TConfigDatabaseUser(FAuthorizedUsers.Objects[UserPos]) do
         begin
         UserRights:=Rights;
         Result:=True;
         end;
      end;
end;

{ TConfigProcedureUser }

constructor TConfigProcedureUser.Create(Owner: TConfigProcedure);
begin
   FProcedure:=Owner;
   FRights:=0;
   SetRight(FRights,EXECUTE_RIGHT,True);
end;

destructor TConfigProcedureUser.Destroy;
begin
   inherited;
end;

procedure TConfigProcedureUser.ReadFromBuffer(Version: Currency);
begin
   with FProcedure.Configuration do
      Read(Self.FRights,SizeOf(Integer));
end;

procedure TConfigProcedureUser.WriteToBuffer(Version: Currency);
begin
   with FProcedure.Configuration do
      Write(Self.FRights,SizeOf(Integer));
end;

{ TConfigProcedure }

constructor TConfigProcedure.Create(Owner: TConfiguration);
begin
   FConfiguration:=Owner;
   FAuthorizedUsers:=TStringList.Create;
   with FAuthorizedUsers do
      begin
      Sorted:=True;
      Duplicates:=dupIgnore;
      end;
end;

destructor TConfigProcedure.Destroy;
begin
   FreeAuthorizedUsers;
   FAuthorizedUsers.Free;
   inherited;
end;

procedure TConfigProcedure.FreeAuthorizedUsers;
var
   I: Integer;
begin
   for I:=0 to FAuthorizedUsers.Count-1 do
      TConfigProcedureUser(FAuthorizedUsers.Objects[I]).Free;
end;

procedure TConfigProcedure.ReadFromBuffer(Version: Currency);
var
   BytesToRead: Integer;
   I: Integer;
   TempCount: Integer;
   TempUserName: string;
   TempProcedureUser: TConfigProcedureUser;
begin
   with FConfiguration do
      begin
      { Version 5 }
      if (Version >= 4.23) then
         begin
         Read(BytesToRead,SizeOf(Integer));
         Self.FDescription[0]:=Char(Byte(Read(Self.FDescription[1],BytesToRead)));
         end;
      { Version 5 }
      Read(TempCount,SizeOf(Integer));
      for I:=1 to TempCount do
         begin
         Read(BytesToRead,SizeOf(Integer));
         TempUserName[0]:=Char(Byte(Read(TempUserName[1],BytesToRead)));
         TempProcedureUser:=TConfigProcedureUser.Create(Self);
         TempProcedureUser.ReadFromBuffer(Version);
         FAuthorizedUsers.AddObject(TempUserName,TObject(TempProcedureUser));
         end;
      end;
end;

procedure TConfigProcedure.WriteToBuffer(Version: Currency);
var
   BytesToWrite: Integer;
   I: Integer;
   { Version 5 }
   TempDescription: string;
   { Version 5 }
   TempCount: Integer;
   TempUserName: string;
   TempProcedureUser: TConfigProcedureUser;
begin
   with FConfiguration do
      begin
      { Version 5 }
      TempDescription:=Self.FDescription;
      BytesToWrite:=Length(TempDescription);
      Write(BytesToWrite,SizeOf(Integer));
      Write(TempDescription[1],BytesToWrite);
      { Version 5 }
      TempCount:=FAuthorizedUsers.Count;
      Write(TempCount,SizeOf(Integer));
      for I:=0 to TempCount-1 do
         begin
         TempUserName:=FAuthorizedUsers[I];
         BytesToWrite:=Length(TempUserName);
         Write(BytesToWrite,SizeOf(Integer));
         Write(TempUserName[1],BytesToWrite);
         TempProcedureUser:=TConfigProcedureUser(FAuthorizedUsers.Objects[I]);
         TempProcedureUser.WriteToBuffer(Version);
         end;
      end;
end;

function TConfigProcedure.Authorize(const UserName: string): Integer;
var
   I: Integer;
begin
   Result:=0;
   for I:=0 to FAuthorizedUsers.Count-1 do
      begin
      if MatchString(UserName,FAuthorizedUsers[I],False,'',False) then
         begin
         Result:=TConfigProcedureUser(FAuthorizedUsers.Objects[I]).Rights;
         Break;
         end;
      end;
end;

function TConfigProcedure.AddUser(const AuthorizedUser: string;
                                 RightsToAssign: Integer): Boolean;
var
   UserPos: Integer;
   TempProcedureUser: TConfigProcedureUser;
begin
   Result:=False;
   if (not FAuthorizedUsers.Find(AuthorizedUser,UserPos)) then
      begin
      TempProcedureUser:=TConfigProcedureUser.Create(Self);
      TempProcedureUser.Rights:=RightsToAssign;
      FAuthorizedUsers.AddObject(AuthorizedUser,TempProcedureUser);
      Result:=True;
      end;
end;

function TConfigProcedure.ModifyUser(const AuthorizedUser: string;
                                    RightsToAssign: Integer): Boolean;
var
   UserPos: Integer;
begin
   Result:=False;
   if FAuthorizedUsers.Find(AuthorizedUser,UserPos) then
      begin
      with TConfigProcedureUser(FAuthorizedUsers.Objects[UserPos]) do
         begin
         Rights:=RightsToAssign;
         Result:=True;
         end;
      end;
end;

function TConfigProcedure.DeleteUser(const AuthorizedUser: string): Boolean;
var
   UserPos: Integer;
begin
   Result:=False;
   if FAuthorizedUsers.Find(AuthorizedUser,UserPos) then
      begin
      TConfigProcedureUser(FAuthorizedUsers.Objects[UserPos]).Free;
      FAuthorizedUsers.Delete(UserPos);
      Result:=True;
      end;
end;

function TConfigProcedure.GetUser(const AuthorizedUser: string;
                                 var UserRights: Integer): Boolean;
var
   UserPos: Integer;
begin
   Result:=False;
   if FAuthorizedUsers.Find(AuthorizedUser,UserPos) then
      begin
      with TConfigProcedureUser(FAuthorizedUsers.Objects[UserPos]) do
         begin
         UserRights:=Rights;
         Result:=True;
         end;
      end;
end;

{ TConfigUser }

constructor TConfigUser.Create(Owner: TConfiguration);
begin
   FConfiguration:=Owner;
   FFullName:='';
   FPassword:='';
   FDescription:='';
   FAdministrator:=False;
   FMaxConnections:=DEFAULT_MAX_USER_CONNECTIONS;
end;

destructor TConfigUser.Destroy;
begin
   inherited;
end;

procedure TConfigUser.ReadFromFile;
var
   BytesToRead: Integer;
begin
   with FConfiguration.ConfigFile do
      begin
      Read(BytesToRead,SizeOf(Integer),False);
      FFullName[0]:=Char(Byte(Read(FFullName[1],BytesToRead,False)));
      V123DecryptBuffer(FFullName[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
      Read(BytesToRead,SizeOf(Integer),False);
      FPassword[0]:=Char(Byte(Read(FPassword[1],BytesToRead,False)));
      V123DecryptBuffer(FPassword[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
      Read(BytesToRead,SizeOf(Integer),False);
      FDescription[0]:=Char(Byte(Read(FDescription[1],BytesToRead,False)));
      V123DecryptBuffer(FDescription[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
      Read(FAdministrator,SizeOf(Boolean),False);
      end;
end;

procedure TConfigUser.ReadFromBuffer(Version: Currency);
var
   BytesToRead: Integer;
begin
   with FConfiguration do
      begin
      Read(BytesToRead,SizeOf(Integer));
      Self.FFullName[0]:=Char(Byte(Read(Self.FFullName[1],BytesToRead)));
      Read(BytesToRead,SizeOf(Integer));
      Self.FPassword[0]:=Char(Byte(Read(Self.FPassword[1],BytesToRead)));
      Read(BytesToRead,SizeOf(Integer));
      Self.FDescription[0]:=Char(Byte(Read(Self.FDescription[1],BytesToRead)));
      Read(Self.FAdministrator,SizeOf(Boolean));
      if (Version >= 4.09) then
         Read(Self.FMaxConnections,SizeOf(Word));
      end;
end;

procedure TConfigUser.WriteToBuffer(Version: Currency);
var
   BytesToWrite: Integer;
   TempFullName: string;
   TempPassword: string;
   TempDescription: string;
begin
   with FConfiguration do
      begin
      TempFullName:=Self.FFullName;
      BytesToWrite:=Length(TempFullName);
      Write(BytesToWrite,SizeOf(Integer));
      Write(TempFullName[1],BytesToWrite);
      TempPassword:=Self.FPassword;
      BytesToWrite:=Length(TempPassword);
      Write(BytesToWrite,SizeOf(Integer));
      Write(TempPassword[1],BytesToWrite);
      TempDescription:=Self.FDescription;
      BytesToWrite:=Length(TempDescription);
      Write(BytesToWrite,SizeOf(Integer));
      Write(TempDescription[1],BytesToWrite);
      Write(Self.FAdministrator,SizeOf(Boolean));
      if (Version >= 4.09) then
         Write(Self.FMaxConnections,SizeOf(Word));
      end;
end;

{ TConfiguration }

constructor TConfiguration.Create(Owner: TDataServer);
begin
   FDataServer:=Owner;
   FSection:=OSAllocCriticalSection;
   OSInitializeCriticalSection(FSection);
   FConfigFile:=TEngineFile.Create(Self);
   FConfigFile.Exclusive:=True;
   FPassword:=DEFAULT_CONFIG_PASSWORD;
   FDigest:=MD5String(FPassword);
   DataEngine.CryptoInit(Pointer(@FDigest),SizeOf(TMD5Digest),
                         FData,FDataSize);
   FUsers:=TStringList.Create;
   FDatabases:=TStringList.Create;
   with FDatabases do
      begin
      Sorted:=True;
      Duplicates:=dupIgnore;
      end;
   FProcedures:=TStringList.Create;
   with FProcedures do
      begin
      Sorted:=True;
      Duplicates:=dupIgnore;
      end;
   with FUsers do
      begin
      Sorted:=True;
      Duplicates:=dupIgnore;
      end;
   FEvents:=TStringList.Create;
   with FEvents do
      begin
      Sorted:=True;
      Duplicates:=dupIgnore;
      end;
   FEngineVersion:=ENGINE_VERSION_NUM;
   FAuthorizedAddresses:=TStringList.Create;
   FBlockedAddresses:=TStringList.Create;
   FDenyLogins:=False;
   FMaxConnections:=DEFAULT_MAX_CONNECTIONS;
   FMaxConnections:=MinimumWord(FMaxConnections,FDataServer.LicensedConnections);
   FTimeout:=DEFAULT_TIMEOUT;
   FDeadSessionInterval:=DEFAULT_DEADSESSION_INTERVAL;
   FDeadSessionExpires:=DEFAULT_DEADSESSION_EXPIRES;
   FMaxDeadSessions:=DEFAULT_MAX_DEADSESSIONS;
   FTemporaryDirectory:=OSGetTempDirectory;
   FIsDirty:=False;
end;

destructor TConfiguration.Destroy;
begin
   OSEnterCriticalSection(FSection);
   try
      FreeEvents;
      FreeUsers;
      FreeProcedures;
      FreeDatabases;
      FEvents.Free;
      FUsers.Free;
      FProcedures.Free;
      FDatabases.Free;
      FAuthorizedAddresses.Free;
      FBlockedAddresses.Free;
      FConfigFile.Free;
      FreeData;
   finally
      OSLeaveCriticalSection(FSection);
   end;
   OSDeleteCriticalSection(FSection);
   OSDeAllocCriticalSection(FSection);
   inherited;
end;

procedure TConfiguration.FreeData;
begin
   if (FDataSize > 0) then
      begin
      DeAllocMem(FData);
      FDataSize:=0;
      end;
end;

procedure TConfiguration.FreeUsers;
var
   I: Integer;
begin
   for I:=0 to FUsers.Count-1 do
      TConfigUser(FUsers.Objects[I]).Free;
end;

procedure TConfiguration.FreeDatabases;
var
   I: Integer;
begin
   for I:=0 to FDatabases.Count-1 do
      TConfigDatabase(FDatabases.Objects[I]).Free;
end;

procedure TConfiguration.FreeProcedures;
var
   I: Integer;
begin
   for I:=0 to FProcedures.Count-1 do
      TConfigProcedure(FProcedures.Objects[I]).Free;
end;

procedure TConfiguration.FreeEvents;
var
   I: Integer;
begin
   for I:=0 to FEvents.Count-1 do
      TConfigEvent(FEvents.Objects[I]).Free;
end;

procedure TConfiguration.SetPassword(const Value: string);
begin
   if (AnsiCompareText(FPassword,Value) <> 0) then
      begin
      FPassword:=Value;
      FDigest:=MD5String(FPassword);
      FreeData;
      DataEngine.CryptoInit(Pointer(@FDigest),SizeOf(TMD5Digest),
                            FData,FDataSize);
      end;
end;

function TConfiguration.Read(var Buffer; NumBytes: Integer): Integer;
begin
   if ((FConfigBufferPos+NumBytes) > FConfigBufferSize) then
      Result:=FConfigBufferSize-FConfigBufferPos
   else
      Result:=NumBytes;
   Move((FConfigBuffer+FConfigBufferPos)^,Buffer,Result);
   Inc(FConfigBufferPos,Result);
end;

function TConfiguration.Write(const Buffer; NumBytes: Integer): Integer;
begin
   if ((FConfigBufferPos+NumBytes) > FConfigBufferSize) then
      ResizeBuffer((FConfigBufferPos+NumBytes),FConfigBuffer,FConfigBufferSize);
   Move(Buffer,(FConfigBuffer+FConfigBufferPos)^,NumBytes);
   Inc(FConfigBufferPos,NumBytes);
   Result:=NumBytes;
end;

procedure TConfiguration.ReadFromFile;
var
   I: Integer;
   BytesToRead: Integer;
   TempCount: Integer;
   TempAddress: string;
   TempUser: TConfigUser;
   TempDatabase: TConfigDatabase;
   TempProcedure: TConfigProcedure;
   TempEvent: TConfigEvent;
   TempUserName: string;
   TempDatabaseName: string;
   TempProcedureName: string;
   TempEventName: string;
   TempEngineVersion: Currency;
   TempDecompressedBuffer: PChar;
   TempDecompressedBytes: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      if FConfigFile.Exists then
         begin
         try
            FConfigFile.OpenFile;
            try
               FConfigFile.Read(TempEngineVersion,SizeOf(Currency),False);
               if (TempEngineVersion < 4) then
                  begin
                  with FConfigFile do
                     begin
                     Read(TempCount,SizeOf(Integer),False);
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer),False);
                        TempAddress[0]:=Char(Byte(Read(TempAddress[1],BytesToRead,False)));
                        V123DecryptBuffer(TempAddress[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
                        FAuthorizedAddresses.Add(TempAddress);
                        end;
                     Read(TempCount,SizeOf(Integer),False);
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer),False);
                        TempAddress[0]:=Char(Byte(Read(TempAddress[1],BytesToRead,False)));
                        V123DecryptBuffer(TempAddress[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
                        FBlockedAddresses.Add(TempAddress);
                        end;
                     Read(FDenyLogins,SizeOf(Boolean),False);
                     Read(FMaxConnections,SizeOf(Word),False);
                     FMaxConnections:=MinimumWord(FMaxConnections,FDataServer.LicensedConnections);
                     Read(FTimeout,SizeOf(Word),False);
                     Read(FDeadSessionInterval,SizeOf(Word),False);
                     Read(FDeadSessionExpires,SizeOf(Word),False);
                     Read(FMaxDeadSessions,SizeOf(Word),False);
                     Read(BytesToRead,SizeOf(Integer),False);
                     FTemporaryDirectory[0]:=Char(Byte(Read(FTemporaryDirectory[1],BytesToRead,False)));
                     V123DecryptBuffer(FTemporaryDirectory[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
                     Read(TempCount,SizeOf(Integer),False);
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer),False);
                        TempUserName[0]:=Char(Byte(Read(TempUserName[1],BytesToRead,False)));
                        V123DecryptBuffer(TempUserName[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
                        TempUser:=TConfigUser.Create(Self);
                        TempUser.ReadFromFile;
                        FUsers.AddObject(TempUserName,TempUser);
                        end;
                     Read(TempCount,SizeOf(Integer),False);
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer),False);
                        TempDatabaseName[0]:=Char(Byte(Read(TempDatabaseName[1],BytesToRead,False)));
                        V123DecryptBuffer(TempDatabaseName[1],BytesToRead,CONFIG_LOCK1,CONFIG_LOCK2);
                        TempDatabase:=TConfigDatabase.Create(Self);
                        TempDatabase.ReadFromFile;
                        FDatabases.AddObject(TempDatabaseName,TempDatabase);
                        end;
                     end;
                  end
               else if (TempEngineVersion >= 4) and (TempEngineVersion <= 4.04) then
                  begin
                  ResizeBuffer((FConfigFile.GetSize-SizeOf(Currency)),
                               FConfigBuffer,FConfigBufferSize);
                  try
                     FConfigFile.Read(FConfigBuffer^,FConfigBufferSize,False);
                     DataEngine.Decrypt(FData,FConfigBuffer,FConfigBufferSize);
                     TempDecompressedBuffer:=nil;
                     TempDecompressedBytes:=0;
                     DataEngine.Decompress(Pointer(FConfigBuffer),FConfigBufferSize,
                                           Pointer(TempDecompressedBuffer),TempDecompressedBytes);
                     try
                        ResizeBuffer(TempDecompressedBytes,FConfigBuffer,FConfigBufferSize);
                        Move(TempDecompressedBuffer^,FConfigBuffer^,TempDecompressedBytes);
                        FConfigBufferPos:=0;
                     finally
                        DeAllocMem(TempDecompressedBuffer);
                     end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempAddress[0]:=Char(Byte(Read(TempAddress[1],BytesToRead)));
                        FAuthorizedAddresses.Add(TempAddress);
                        end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempAddress[0]:=Char(Byte(Read(TempAddress[1],BytesToRead)));
                        FBlockedAddresses.Add(TempAddress);
                        end;
                     Read(FDenyLogins,SizeOf(Boolean));
                     Read(FMaxConnections,SizeOf(Word));
                     FMaxConnections:=MinimumWord(FMaxConnections,FDataServer.LicensedConnections);
                     Read(FTimeout,SizeOf(Word));
                     Read(FDeadSessionInterval,SizeOf(Word));
                     Read(FDeadSessionExpires,SizeOf(Word));
                     Read(FMaxDeadSessions,SizeOf(Word));
                     Read(BytesToRead,SizeOf(Integer));
                     FTemporaryDirectory[0]:=Char(Byte(Read(FTemporaryDirectory[1],BytesToRead)));
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempUserName[0]:=Char(Byte(Read(TempUserName[1],BytesToRead)));
                        TempUser:=TConfigUser.Create(Self);
                        TempUser.ReadFromBuffer(TempEngineVersion);
                        FUsers.AddObject(TempUserName,TempUser);
                        end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempDatabaseName[0]:=Char(Byte(Read(TempDatabaseName[1],BytesToRead)));
                        TempDatabase:=TConfigDatabase.Create(Self);
                        TempDatabase.ReadFromBuffer(TempEngineVersion);
                        FDatabases.AddObject(TempDatabaseName,TempDatabase);
                        end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempEventName[0]:=Char(Byte(Read(TempEventName[1],BytesToRead)));
                        TempEvent:=TConfigEvent.Create(Self);
                        TempEvent.ReadFromBuffer(TempEngineVersion);
                        FEvents.AddObject(TempEventName,TempEvent);
                        end;
                  finally
                     ResizeBuffer(0,FConfigBuffer,FConfigBufferSize);
                  end;
                  end
               else
                  begin
                  ResizeBuffer((FConfigFile.GetSize-SizeOf(Currency)),
                               FConfigBuffer,FConfigBufferSize);
                  try
                     FConfigFile.Read(FConfigBuffer^,FConfigBufferSize,False);
                     DataEngine.Decrypt(FData,FConfigBuffer,FConfigBufferSize);
                     TempDecompressedBuffer:=nil;
                     TempDecompressedBytes:=0;
                     DataEngine.Decompress(Pointer(FConfigBuffer),FConfigBufferSize,
                                           Pointer(TempDecompressedBuffer),TempDecompressedBytes);
                     try
                        ResizeBuffer(TempDecompressedBytes,FConfigBuffer,FConfigBufferSize);
                        Move(TempDecompressedBuffer^,FConfigBuffer^,TempDecompressedBytes);
                        FConfigBufferPos:=0;
                     finally
                        DeAllocMem(TempDecompressedBuffer);
                     end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempAddress[0]:=Char(Byte(Read(TempAddress[1],BytesToRead)));
                        FAuthorizedAddresses.Add(TempAddress);
                        end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempAddress[0]:=Char(Byte(Read(TempAddress[1],BytesToRead)));
                        FBlockedAddresses.Add(TempAddress);
                        end;
                     Read(FDenyLogins,SizeOf(Boolean));
                     Read(FMaxConnections,SizeOf(Word));
                     FMaxConnections:=MinimumWord(FMaxConnections,FDataServer.LicensedConnections);
                     Read(FTimeout,SizeOf(Word));
                     Read(FDeadSessionInterval,SizeOf(Word));
                     Read(FDeadSessionExpires,SizeOf(Word));
                     Read(FMaxDeadSessions,SizeOf(Word));
                     Read(BytesToRead,SizeOf(Integer));
                     FTemporaryDirectory[0]:=Char(Byte(Read(FTemporaryDirectory[1],BytesToRead)));
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempUserName[0]:=Char(Byte(Read(TempUserName[1],BytesToRead)));
                        TempUser:=TConfigUser.Create(Self);
                        TempUser.ReadFromBuffer(TempEngineVersion);
                        FUsers.AddObject(TempUserName,TempUser);
                        end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempDatabaseName[0]:=Char(Byte(Read(TempDatabaseName[1],BytesToRead)));
                        TempDatabase:=TConfigDatabase.Create(Self);
                        TempDatabase.ReadFromBuffer(TempEngineVersion);
                        FDatabases.AddObject(TempDatabaseName,TempDatabase);
                        end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempProcedureName[0]:=Char(Byte(Read(TempProcedureName[1],BytesToRead)));
                        TempProcedure:=TConfigProcedure.Create(Self);
                        TempProcedure.ReadFromBuffer(TempEngineVersion);
                        FProcedures.AddObject(TempProcedureName,TempProcedure);
                        end;
                     Read(TempCount,SizeOf(Integer));
                     for I:=1 to TempCount do
                        begin
                        Read(BytesToRead,SizeOf(Integer));
                        TempEventName[0]:=Char(Byte(Read(TempEventName[1],BytesToRead)));
                        TempEvent:=TConfigEvent.Create(Self);
                        TempEvent.ReadFromBuffer(TempEngineVersion);
                        FEvents.AddObject(TempEventName,TempEvent);
                        end;
                  finally
                     ResizeBuffer(0,FConfigBuffer,FConfigBufferSize);
                  end;
                  end;
            finally
               FConfigFile.CloseFile;
            end;
         except
            FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_CONFIG,
                                 'Configuration file corrupted or invalid, '+
                                 'server starting using default settings',
                                 ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
            SetDefault;
         end;
         end
      else
         SetDefault;
      FIsDirty:=False;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.SetDefault;
var
   TempUser: TConfigUser;
begin
   FAuthorizedAddresses.Add(PARSE_ASTERISK);
   FDenyLogins:=False;
   FMaxConnections:=DEFAULT_MAX_CONNECTIONS;
   FMaxConnections:=MinimumWord(FMaxConnections,FDataServer.LicensedConnections);
   FTimeout:=DEFAULT_TIMEOUT;
   FDeadSessionInterval:=DEFAULT_DEADSESSION_INTERVAL;
   FDeadSessionExpires:=DEFAULT_DEADSESSION_EXPIRES;
   FMaxDeadSessions:=DEFAULT_MAX_DEADSESSIONS;
   FTemporaryDirectory:=OSGetTempDirectory;
   TempUser:=TConfigUser.Create(Self);
   with TempUser do
      begin
      FullName:='Server Administrator';
      Password:='DBAdmin';
      Description:='Default Administrator - For security reasons '+
                   'please remove after establishing existing '+
                   'users and administrators';
      Administrator:=True;
      MaxConnections:=DEFAULT_MAX_USER_CONNECTIONS;
      end;
   FUsers.AddObject('Admin',TempUser);
end;

procedure TConfiguration.CheckTemporaryDirectory;
begin
   if (not DirectoryExists(FTemporaryDirectory)) then
      begin
      try
         ForceDirectories(FTemporaryDirectory);
      except
         FTemporaryDirectory:=OSGetTempDirectory;
      end;
      end;
end;

procedure TConfiguration.WriteToFile;
var
   I: Integer;
   BytesToWrite: Integer;
   TempCount: Integer;
   TempAddress: string;
   TempUser: TConfigUser;
   TempDatabase: TConfigDatabase;
   TempProcedure: TConfigProcedure;
   TempEvent: TConfigEvent;
   TempUserName: string;
   TempDatabaseName: string;
   TempProcedureName: string;
   TempEventName: string;
   TempEngineVersion: Currency;
   TempDirectory: string;
   TempCompressedBuffer: PChar;
   TempCompressedBytes: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      if (not FIsDirty) then
         Exit;
      try
         with FConfigFile do
            begin
            if Exists then
               begin
               OpenFile;
               try
                  CopyToFile(AddBS(ExtractFilePath(FileName))+
                             EnsureFileExt(ExtractFileName(FileName),CONFIG_EXT,CONFIG_BACKUP_EXT),
                             0,0,nil,0);
               finally
                  CloseFile;
               end;
               end;
            CreateFile;
            end;
         try
            TempEngineVersion:=ENGINE_VERSION_NUM;
            FConfigBufferPos:=0;
            try
               TempCount:=FAuthorizedAddresses.Count;
               Write(TempCount,SizeOf(Integer));
               for I:=0 to TempCount-1 do
                  begin
                  TempAddress:=FAuthorizedAddresses[I];
                  BytesToWrite:=Length(TempAddress);
                  Write(BytesToWrite,SizeOf(Integer));
                  Write(TempAddress[1],BytesToWrite);
                  end;
               TempCount:=FBlockedAddresses.Count;
               Write(TempCount,SizeOf(Integer));
               for I:=0 to TempCount-1 do
                  begin
                  TempAddress:=FBlockedAddresses[I];
                  BytesToWrite:=Length(TempAddress);
                  Write(BytesToWrite,SizeOf(Integer));
                  Write(TempAddress[1],BytesToWrite);
                  end;
               Write(FDenyLogins,SizeOf(Boolean));
               Write(FMaxConnections,SizeOf(Word));
               Write(FTimeout,SizeOf(Word));
               Write(FDeadSessionInterval,SizeOf(Word));
               Write(FDeadSessionExpires,SizeOf(Word));
               Write(FMaxDeadSessions,SizeOf(Word));
               TempDirectory:=FTemporaryDirectory;
               BytesToWrite:=Length(TempDirectory);
               Write(BytesToWrite,SizeOf(Integer));
               Write(TempDirectory[1],BytesToWrite);
               TempCount:=FUsers.Count;
               Write(TempCount,SizeOf(Integer));
               for I:=0 to TempCount-1 do
                  begin
                  TempUserName:=FUsers[I];
                  BytesToWrite:=Length(TempUserName);
                  Write(BytesToWrite,SizeOf(Integer));
                  Write(TempUserName[1],BytesToWrite);
                  TempUser:=TConfigUser(FUsers.Objects[I]);
                  TempUser.WriteToBuffer(TempEngineVersion);
                  end;
               TempCount:=FDatabases.Count;
               Write(TempCount,SizeOf(Integer));
               for I:=0 to TempCount-1 do
                  begin
                  TempDatabaseName:=FDatabases[I];
                  BytesToWrite:=Length(TempDatabaseName);
                  Write(BytesToWrite,SizeOf(Integer));
                  Write(TempDatabaseName[1],BytesToWrite);
                  TempDatabase:=TConfigDatabase(FDatabases.Objects[I]);
                  TempDatabase.WriteToBuffer(TempEngineVersion);
                  end;
               TempCount:=FProcedures.Count;
               Write(TempCount,SizeOf(Integer));
               for I:=0 to TempCount-1 do
                  begin
                  TempProcedureName:=FProcedures[I];
                  BytesToWrite:=Length(TempProcedureName);
                  Write(BytesToWrite,SizeOf(Integer));
                  Write(TempProcedureName[1],BytesToWrite);
                  TempProcedure:=TConfigProcedure(FProcedures.Objects[I]);
                  TempProcedure.WriteToBuffer(TempEngineVersion);
                  end;
               TempCount:=FEvents.Count;
               Write(TempCount,SizeOf(Integer));
               for I:=0 to TempCount-1 do
                  begin
                  TempEventName:=FEvents[I];
                  BytesToWrite:=Length(TempEventName);
                  Write(BytesToWrite,SizeOf(Integer));
                  Write(TempEventName[1],BytesToWrite);
                  TempEvent:=TConfigEvent(FEvents.Objects[I]);
                  TempEvent.WriteToBuffer(TempEngineVersion);
                  end;
               TempCompressedBuffer:=nil;
               TempCompressedBytes:=0;
               DataEngine.Compress(Pointer(FConfigBuffer),FConfigBufferSize,
                                   BEST_COMPRESSION,Pointer(TempCompressedBuffer),TempCompressedBytes);
               try
                  FConfigFile.Seek(0,FROM_BOF);
                  FConfigFile.Write(TempEngineVersion,SizeOf(Currency));
                  DataEngine.Encrypt(FData,TempCompressedBuffer,TempCompressedBytes);
                  FConfigFile.Write(TempCompressedBuffer^,TempCompressedBytes);
               finally
                  DeAllocMem(TempCompressedBuffer);
               end;
            finally
               ResizeBuffer(0,FConfigBuffer,FConfigBufferSize);
            end;
         finally
            FConfigFile.CloseFile;
         end;
      except
         on E: Exception do
            FDataServer.LogEvent(Now,LOG_CATEGORY_ERROR,LOG_TYPE_CONFIG,
                                 'Server could not save configuration file to disk - '+E.Message,
                                 ENGINE_VERSION_NUM,0.00,'',False,'',0,0,0);
      end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.CheckIPAddress(const RemoteIPAddress: string): Boolean;
var
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      for I:=0 to FAuthorizedAddresses.Count-1 do
         begin
         if MatchString(RemoteIPAddress,FAuthorizedAddresses[I],False,'',False) then
            begin
            Result:=True;
            Break;
            end;
         end;
      if Result then
         begin
         for I:=0 to FBlockedAddresses.Count-1 do
            begin
            if MatchString(RemoteIPAddress,FBlockedAddresses[I],False,'',False) then
               begin
               Result:=False;
               Break;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.LoginUser(const UserToLogin: string;
                                  const PasswordToUse: string): Boolean;
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FUsers.Find(UserToLogin,UserPos) then
         begin
         if (TConfigUser(FUsers.Objects[UserPos]).Password=PasswordToUse) then
            Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.CheckUserMaxConnections(const UserName: string): Boolean;
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FUsers.Find(UserName,UserPos) then
         begin
         with TConfigUser(FUsers.Objects[UserPos]) do
            begin
            if ((CurConnections+1) <= MaxConnections) then
               begin
               CurConnections:=CurConnections+1;
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.DisconnectUser(const UserName: string);
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      if FUsers.Find(UserName,UserPos) then
         begin
         with TConfigUser(FUsers.Objects[UserPos]) do
            begin
            if (CurConnections > 0) then
               CurConnections:=CurConnections-1;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.GetUserList(List: TStrings);
var
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      for I:=0 to FUsers.Count-1 do
         List.Add(FUsers[I]);
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.GetDatabaseList(const UserName: string;
                                         CheckForAdmin: Boolean;
                                         List: TStrings);
var
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      for I:=0 to FDatabases.Count-1 do
         begin
         with TConfigDatabase(FDatabases.Objects[I]) do
            begin
            if (not CheckForAdmin) or
               (CheckForAdmin and CheckForAdministrator(UserName)) or
               IsRightSet(Authorize(UserName),READ_RIGHT) then
               List.Add(FDatabases[I]);
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.GetAllDatabaseList(List: TStrings);
var
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      for I:=0 to FDatabases.Count-1 do
         List.Add(FDatabases[I]);
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetDatabaseUserList(const DatabaseName: string;
                                         List: TStrings): Boolean;
var
   DatabasePos: Integer;
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
            begin
            for I:=0 to AuthorizedUsers.Count-1 do
               List.Add(AuthorizedUsers[I]);
            end;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.GetProcedureList(const UserName: string;
                                          CheckForAdmin: Boolean;
                                          List: TStrings);
var
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      for I:=0 to FProcedures.Count-1 do
         begin
         with TConfigProcedure(FProcedures.Objects[I]) do
            begin
            if (not CheckForAdmin) or
               (CheckForAdmin and CheckForAdministrator(UserName)) or
               IsRightSet(Authorize(UserName),EXECUTE_RIGHT) then
               List.Add(FProcedures[I]);
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.GetAllProcedureList(List: TStrings);
var
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      for I:=0 to FProcedures.Count-1 do
         List.Add(FProcedures[I]);
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetProcedureUserList(const ProcedureName: string;
                                             List: TStrings): Boolean;
var
   ProcedurePos: Integer;
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            begin
            for I:=0 to AuthorizedUsers.Count-1 do
               List.Add(AuthorizedUsers[I]);
            end;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.GetEventList(List: TStrings);
var
   I: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      for I:=0 to FEvents.Count-1 do
         List.Add(FEvents[I]);
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.CheckForDatabase(const UserName: string;
                                         const DatabaseName: string;
                                         var DataPath: string): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
            begin
            if CheckForAdministrator(UserName) or
               IsRightSet(Authorize(UserName),READ_RIGHT) then
               begin
               DataPath:=ExpandFileName(Path);
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetDatabaseRights(const UserName: string;
                                            const DatabaseName: string): Integer;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      if CheckForAdministrator(UserName) then
         Result:=GetAdminRights
      else
         begin
         Result:=0;
         if FDatabases.Find(DatabaseName,DatabasePos) then
            begin
            with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
               Result:=Authorize(UserName);
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.CheckForProcedure(const UserName: string;
                                            const ProcedureName: string): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            begin
            if CheckForAdministrator(UserName) or
               IsRightSet(Authorize(UserName),EXECUTE_RIGHT) then
               Result:=True;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.AddUser(const UserName: string;
                                const UserPassword: string;
                                const UserDescription: string;
                                IsAdministrator: Boolean;
                                MaxConnect: Word): Boolean;
var
   TempUser: TConfigUser;
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if (not FUsers.Find(UserName,UserPos)) then
         begin
         TempUser:=TConfigUser.Create(Self);
         with TempUser do
            begin
            Password:=UserPassword;
            Description:=UserDescription;
            Administrator:=IsAdministrator;
            MaxConnections:=MaxConnect;
            end;
         FUsers.AddObject(UserName,TempUser);
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyUser(const UserName: string;
                                   const UserPassword: string;
                                   const UserDescription: string;
                                   IsAdministrator: Boolean;
                                   MaxConnect: Word): Boolean;
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FUsers.Find(UserName,UserPos) then
         begin
         with TConfigUser(FUsers.Objects[UserPos]) do
            begin
            Password:=UserPassword;
            Description:=UserDescription;
            Administrator:=IsAdministrator;
            MaxConnections:=MaxConnect;
            end;
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyUserPassword(const UserName: string;
                                           const UserPassword: string): Boolean;
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FUsers.Find(UserName,UserPos) then
         begin
         with TConfigUser(FUsers.Objects[UserPos]) do
            Password:=UserPassword;
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.DeleteUser(const UserName: string): Boolean;
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FUsers.Find(UserName,UserPos) then
         begin
         TConfigUser(FUsers.Objects[UserPos]).Free;
         FUsers.Delete(UserPos);
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetUser(const UserName: string;
                                var UserPassword: string;
                                var UserDescription: string;
                                var IsAdministrator: Boolean;
                                var MaxConnect: Word): Boolean;
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FUsers.Find(UserName,UserPos) then
         begin
         with TConfigUser(FUsers.Objects[UserPos]) do
            begin
            UserPassword:=Password;
            UserDescription:=Description;
            IsAdministrator:=Administrator;
            MaxConnect:=MaxConnections;
            end;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.AddDatabase(const DatabaseName: string;
                                    const DatabaseDescription: string;
                                    const DataPath: string;
                                    var DirectoryError: Boolean): Boolean;
var
   TempDatabase: TConfigDatabase;
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      DirectoryError:=False;
      if (not FDatabases.Find(DatabaseName,DatabasePos)) then
         begin
         if (DataPath <> '') and (not DirectoryExists(ExpandFileName(DataPath))) then
            Result:=ForceDirectories(ExpandFileName(DataPath))
         else
            Result:=True;
         DirectoryError:=(not Result);
         if Result then
            begin
            TempDatabase:=TConfigDatabase.Create(Self);
            with TempDatabase do
               begin
               Description:=DatabaseDescription;
               Path:=ConvertSlashes(DataPath);
               end;
            FDatabases.AddObject(DatabaseName,TempDatabase);
            FIsDirty:=True;
            WriteToFile;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyDatabase(const DatabaseName: string;
                                       const DatabaseDescription: string;
                                        const DataPath: string;
                                       var DirectoryError: Boolean): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      DirectoryError:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         if (DataPath <> '') and (not DirectoryExists(ExpandFileName(DataPath))) then
            Result:=ForceDirectories(ExpandFileName(DataPath))
         else
            Result:=True;
         DirectoryError:=(not Result);
         if Result then
            begin
            with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
               begin
               Description:=DatabaseDescription;
               Path:=ConvertSlashes(DataPath);
               end;
            FIsDirty:=True;
            WriteToFile;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.DeleteDatabase(const DatabaseName: string): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         TConfigDatabase(FDatabases.Objects[DatabasePos]).Free;
         FDatabases.Delete(DatabasePos);
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetDatabase(const DatabaseName: string;
                                    var DatabaseDescription: string;
                                    var DataPath: string): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
            begin
            DatabaseDescription:=Description;
            DataPath:=Path;
            end;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.AddDatabaseUser(const DatabaseName: string;
                                        const AuthorizedUser: string;
                                        RightsToAssign: Integer): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
            begin
            if AddUser(AuthorizedUser,RightsToAssign) then
               begin
               FIsDirty:=True;
               WriteToFile;
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyDatabaseUser(const DatabaseName: string;
                                           const AuthorizedUser: string;
                                           RightsToAssign: Integer): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
            begin
            if ModifyUser(AuthorizedUser,RightsToAssign) then
               begin
               FIsDirty:=True;
               WriteToFile;
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.DeleteDatabaseUser(const DatabaseName: string;
                                           const AuthorizedUser: string): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
            begin
            if DeleteUser(AuthorizedUser) then
               begin
               FIsDirty:=True;
               WriteToFile;
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetDatabaseUser(const DatabaseName: string;
                                        const AuthorizedUser: string;
                                        var UserRights: Integer): Boolean;
var
   DatabasePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FDatabases.Find(DatabaseName,DatabasePos) then
         begin
         with TConfigDatabase(FDatabases.Objects[DatabasePos]) do
            begin
            if GetUser(AuthorizedUser,UserRights) then
               Result:=True;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.AddProcedure(const ProcedureName: string;
                                     const ProcedureDescription: string): Boolean;
var
   TempProcedure: TConfigProcedure;
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if (not FProcedures.Find(ProcedureName,ProcedurePos)) then
         begin
         TempProcedure:=TConfigProcedure.Create(Self);
         with TempProcedure do
            Description:=ProcedureDescription;
         FProcedures.AddObject(ProcedureName,TempProcedure);
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyProcedure(const ProcedureName: string;
                                        const ProcedureDescription: string): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            Description:=ProcedureDescription;
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.DeleteProcedure(const ProcedureName: string): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         TConfigProcedure(FProcedures.Objects[ProcedurePos]).Free;
         FProcedures.Delete(ProcedurePos);
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetProcedure(const ProcedureName: string;
                                     var ProcedureDescription: string): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            ProcedureDescription:=Description;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.AddProcedureUser(const ProcedureName: string;
                                         const AuthorizedUser: string;
                                         RightsToAssign: Integer): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            begin
            if AddUser(AuthorizedUser,RightsToAssign) then
               begin
               FIsDirty:=True;
               WriteToFile;
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyProcedureUser(const ProcedureName: string;
                                            const AuthorizedUser: string;
                                            RightsToAssign: Integer): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            begin
            if ModifyUser(AuthorizedUser,RightsToAssign) then
               begin
               FIsDirty:=True;
               WriteToFile;
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.DeleteProcedureUser(const ProcedureName: string;
                                            const AuthorizedUser: string): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            begin
            if DeleteUser(AuthorizedUser) then
               begin
               FIsDirty:=True;
               WriteToFile;
               Result:=True;
               end;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetProcedureUser(const ProcedureName: string;
                                         const AuthorizedUser: string;
                                         var UserRights: Integer): Boolean;
var
   ProcedurePos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FProcedures.Find(ProcedureName,ProcedurePos) then
         begin
         with TConfigProcedure(FProcedures.Objects[ProcedurePos]) do
            begin
            if GetUser(AuthorizedUser,UserRights) then
               Result:=True;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.AddEvent(const EventName: string;
                                 const EventDescription: string;
                                 EventRunType: Byte;
                                 EventStartDate: TDateTime;
                                 EventEndDate: TDateTime;
                                 EventStartTime: TDateTime;
                                 EventEndTime: TDateTime;
                                 EventInterval: Word;
                                 EventDays: TConfigDays;
                                 EventDayOfMonth: Byte;
                                 EventDayOfWeek: Byte;
                                 EventMonths: TConfigMonths): Boolean;
var
   TempEvent: TConfigEvent;
   EventPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if (not FEvents.Find(EventName,EventPos)) then
         begin
         TempEvent:=TConfigEvent.Create(Self);
         with TempEvent do
            begin
            Description:=EventDescription;
            RunType:=EventRunType;
            StartDate:=EventStartDate;
            EndDate:=EventEndDate;
            StartTime:=EventStartTime;
            EndTime:=EventEndTime;
            Interval:=EventInterval;
            FDays:=EventDays;
            DayOfMonth:=EventDayOfMonth;
            DayOfWeek:=EventDayOfWeek;
            FMonths:=EventMonths;
            end;
         FEvents.AddObject(EventName,TempEvent);
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyEvent(const EventName: string;
                                    const EventDescription: string;
                                    EventRunType: Byte;
                                    EventStartDate: TDateTime;
                                    EventEndDate: TDateTime;
                                    EventStartTime: TDateTime;
                                    EventEndTime: TDateTime;
                                    EventInterval: Word;
                                    EventDays: TConfigDays;
                                    EventDayOfMonth: Byte;
                                    EventDayOfWeek: Byte;
                                    EventMonths: TConfigMonths): Boolean;
var
   EventPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FEvents.Find(EventName,EventPos) then
         begin
         with TConfigEvent(FEvents.Objects[EventPos]) do
            begin
            Description:=EventDescription;
            RunType:=EventRunType;
            StartDate:=EventStartDate;
            EndDate:=EventEndDate;
            StartTime:=EventStartTime;
            EndTime:=EventEndTime;
            Interval:=EventInterval;
            FDays:=EventDays;
            DayOfMonth:=EventDayOfMonth;
            DayOfWeek:=EventDayOfWeek;
            FMonths:=EventMonths;
            end;
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.DeleteEvent(const EventName: string): Boolean;
var
   EventPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FEvents.Find(EventName,EventPos) then
         begin
         TConfigEvent(FEvents.Objects[EventPos]).Free;
         FEvents.Delete(EventPos);
         FIsDirty:=True;
         WriteToFile;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetEvent(const EventName: string;
                                 var EventDescription: string;
                                 var EventRunType: Byte;
                                 var EventStartDate: TDateTime;
                                 var EventEndDate: TDateTime;
                                 var EventStartTime: TDateTime;
                                 var EventEndTime: TDateTime;
                                 var EventInterval: Word;
                                 var EventDays: TConfigDays;
                                 var EventDayOfMonth: Byte;
                                 var EventDayOfWeek: Byte;
                                 var EventMonths: TConfigMonths;
                                 var EventLastRun: TDateTime;
                                 var EventInProgress: Boolean): Boolean;
var
   EventPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FEvents.Find(EventName,EventPos) then
         begin
         with TConfigEvent(FEvents.Objects[EventPos]) do
            begin
            EventDescription:=Description;
            EventRunType:=RunType;
            EventStartDate:=StartDate;
            EventEndDate:=EndDate;
            EventStartTime:=StartTime;
            EventEndTime:=EndTime;
            EventInterval:=Interval;
            EventDays:=FDays;
            EventDayOfMonth:=DayOfMonth;
            EventDayOfWeek:=DayOfWeek;
            EventMonths:=FMonths;
            EventLastRun:=LastRun;
            EventInProgress:=InProgress;
            end;
         Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyEventInProgress(const EventName: string;
                                              EventInProgress: Boolean): Boolean;
var
   EventPos: Integer;
   TempDateTime: TDateTime;
   TempTimeStamp: TTimeStamp;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FEvents.Find(EventName,EventPos) then
         begin
         with TConfigEvent(FEvents.Objects[EventPos]) do
            begin
            InProgress:=EventInProgress;
            if InProgress then
               begin
               { Calculate starting date/time, and be sure to handle wrap-around for
                 the time }
               TempDateTime:=Now;
               if (RunType=RUN_HOURLY) then
                  TempTimeStamp:=DateTimeToTimeStamp(TempDateTime)
               else
                  begin
                  if (DateTimeToTimeStamp(TempDateTime).Time < DateTimeToTimeStamp(StartTime).Time) then
                     TempTimeStamp.Date:=(DateTimeToTimeStamp(TempDateTime).Date-1)
                  else
                     TempTimeStamp.Date:=DateTimeToTimeStamp(TempDateTime).Date;
                  TempTimeStamp.Time:=DateTimeToTimeStamp(StartTime).Time;
                  end;
               StartRun:=TimeStampToDateTime(TempTimeStamp);
               end;
            Result:=True;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.ModifyEventLastRun(const EventName: string): Boolean;
var
   EventPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FEvents.Find(EventName,EventPos) then
         begin
         with TConfigEvent(FEvents.Objects[EventPos]) do
            begin
            LastRun:=StartRun;
            FIsDirty:=True;
            WriteToFile;
            Result:=True;
            end;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

procedure TConfiguration.GetServer(var DenyNewLogins: Boolean; var MaxConnect: Word;
                                   var ConnectTimeout: Word; var DeadInterval: Word;
                                   var DeadExpires: Word; var MaxDead: Word;
                                   var TempDirectory: string;
                                   AuthAddresses: TStrings; BlockAddresses: TStrings);
begin
   DenyNewLogins:=FDenyLogins;

   MaxConnect:=FMaxConnections;
   ConnectTimeout:=FTimeout;
   DeadInterval:=FDeadSessionInterval;
   DeadExpires:=FDeadSessionExpires;
   MaxDead:=FMaxDeadSessions;
   TempDirectory:=FTemporaryDirectory;
   AuthAddresses.Assign(FAuthorizedAddresses);
   BlockAddresses.Assign(FBlockedAddresses);
end;

procedure TConfiguration.ModifyServer(DenyNewLogins: Boolean; MaxConnect: Word;
                                      ConnectTimeout: Word; DeadInterval: Word;
                                      DeadExpires: Word; MaxDead: Word;
                                      const TempDirectory: string;
                                      AuthAddresses: TStrings; BlockAddresses: TStrings);
begin
   FDenyLogins:=DenyNewLogins;
   FMaxConnections:=MaxConnect;
   FMaxConnections:=MinimumWord(FMaxConnections,FDataServer.LicensedConnections);
   FTimeout:=ConnectTimeout;
   FDeadSessionInterval:=DeadInterval;
   FDeadSessionExpires:=DeadExpires;
   FMaxDeadSessions:=MaxDead;
   FTemporaryDirectory:=TempDirectory;
   FAuthorizedAddresses.Assign(AuthAddresses);
   FBlockedAddresses.Assign(BlockAddresses);
   FIsDirty:=True;
   WriteToFile;
end;

function TConfiguration.CheckForAdministrator(const UserName: string): Boolean;
var
   UserPos: Integer;
begin
   OSEnterCriticalSection(FSection);
   try
      Result:=False;
      if FUsers.Find(UserName,UserPos) then
         begin
         if TConfigUser(FUsers.Objects[UserPos]).Administrator then
            Result:=True;
         end;
   finally
      OSLeaveCriticalSection(FSection);
   end;
end;

function TConfiguration.GetAdminRights: Integer;
begin
   Result:=0;
   SetRight(Result,READ_RIGHT,True);
   SetRight(Result,INSERT_RIGHT,True);
   SetRight(Result,UPDATE_RIGHT,True);
   SetRight(Result,DELETE_RIGHT,True);
   SetRight(Result,CREATE_RIGHT,True);
   SetRight(Result,ALTER_RIGHT,True);
   SetRight(Result,DROP_RIGHT,True);
   SetRight(Result,RENAME_RIGHT,True);
   SetRight(Result,MAINTAIN_RIGHT,True);
   SetRight(Result,BACKUP_RIGHT,True);
   SetRight(Result,RESTORE_RIGHT,True);
end;

end.
