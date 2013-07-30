{************************************************************************
*
*      DBISAM Delphi TDataSet descendant source and interface
*      functionality for Delphi 3.x + and C++Builder 3.x +
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

{$R-,T-,H+,X+,Z1}

unit dbisamtb;

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

Variants, Windows, FMTBcd,

DB, DBCommon, dbisamcn, dbisamen, dbisamsq, dbisamlb;

const

   { TDBISAMDBDataSet flags }

   dbfOpened = 0;
   dbfPrepared = 1;
   dbfExecSQL = 2;
   dbfTable = 3;
   dbfFieldList = 4;
   dbfIndexList = 5;
   dbfProvider = 6;

   { FieldType Mappings }






   FldTypeMap: array[TFieldType] of Byte = (
      TYPE_UNKNOWN,TYPE_ZSTRING,TYPE_INT16,TYPE_INT32,TYPE_UINT16,TYPE_BOOL,
      TYPE_FLOAT,TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP,TYPE_BYTES,
      TYPE_VARBYTES,TYPE_INT32,TYPE_BLOB,TYPE_BLOB,TYPE_BLOB,TYPE_BLOB,TYPE_BLOB,
      TYPE_BLOB,TYPE_BLOB,TYPE_CURSOR,TYPE_ZSTRING,TYPE_ZSTRING,TYPE_INT64,TYPE_ADT,
      TYPE_ARRAY,TYPE_REF,TYPE_TABLE,TYPE_BLOB,TYPE_BLOB,TYPE_UNKNOWN,TYPE_UNKNOWN,
      TYPE_UNKNOWN,TYPE_ZSTRING,TYPE_UNKNOWN,TYPE_UNKNOWN);

   FldSubTypeMap: array[TFieldType] of Word = (
      0,0,0,0,0,0,0,SUBTYPE_MONEY,0,0,0,0,0,0,SUBTYPE_AUTOINC,
      0,SUBTYPE_MEMO,SUBTYPE_GRAPHIC,SUBTYPE_MEMO,0,
      0,0,0,SUBTYPE_FIXED,SUBTYPE_UNICODE,
      0,0,0,0,0,0,0,0,0,0,SUBTYPE_GUID,0,0);

   DataTypeMap: array[0..MAX_FIELD_TYPES-1] of TFieldType = (
      ftUnknown,ftString,ftDate,ftBlob,ftBoolean,ftSmallint,
      ftInteger,ftFloat,ftBCD,ftBytes,ftTime,ftDateTime,
      ftWord,ftInteger,ftUnknown,ftVarBytes,ftUnknown,ftUnknown,
      ftLargeInt,ftLargeInt,ftADT,ftArray,ftReference,ftDataSet);

   BlobTypeMap: array[SUBTYPE_MEMO..SUBTYPE_BFILE] of TFieldType = (
      ftMemo,ftBlob,ftMemo,ftBlob,ftGraphic,ftBlob,
      ftBlob,ftBlob,ftBlob,ftBlob,ftBlob,ftMemo,ftBlob,
      ftBlob,ftBlob);





type

   { Forward declarations }

   TDBISAMEngine = class;
   TDBISAMParams = class;
   TDBISAMFunctionParams = class;
   TDBISAMFunctions = class;
   TDBISAMSession = class;
   TDBISAMDatabase = class;
   TDBISAMFieldDefs = class;
   TDBISAMIndexDefs = class;
   TDBISAMBaseDataSet = class;
   TDBISAMRecordDataSet = class;
   TDBISAMRecord = class;
   TDBISAMDataSet = class;
   TDBISAMDBDataSet = class;
   TDBISAMTable = class;
   TDBISAMQuery = class;
   TDBISAMUpdateSQL = class;
   TDBISAMBlobStream = class;

   { Exception classes }

   EDBISAMEngineError = class(EDatabaseError)
   private
      FErrorCode: Word;
      FOSErrorCode: Integer;
      FSocketErrorCode: Integer;
      FErrorRemoteName: string;
      FErrorUserName: string;
      FErrorDatabaseName: string;
      FErrorTableName: string;
      FErrorFieldName: string;
      FErrorIndexName: string;
      FErrorMessage: string;
      FErrorProcedureName: string;
      FErrorEventName: string;
      FErrorLine: Integer;
      FErrorColumn: Integer;
   public
      constructor Create(ErrorCode: Word);
      destructor Destroy; override;
      property ErrorCode: Word read FErrorCode;
      property OSErrorCode: Integer read FOSErrorCode;
      property SocketErrorCode: Integer read FSocketErrorCode;
      property ErrorRemoteName: string read FErrorRemoteName;
      property ErrorUserName: string read FErrorUserName;
      property ErrorDatabaseName: string read FErrorDatabaseName;
      property ErrorTableName: string read FErrorTableName;
      property ErrorFieldName: string read FErrorFieldName;
      property ErrorIndexName: string read FErrorIndexName;
      property ErrorMessage: string read FErrorMessage;
      property ErrorProcedureName: string read FErrorProcedureName;
      property ErrorEventName: string read FErrorEventName;
      property ErrorLine: Integer read FErrorLine;
      property ErrorColumn: Integer read FErrorColumn;
   end;

   { TDBISAMParam }

   TDBISAMParam = class(TCollectionItem)
   private
      FParamRef: TDBISAMParam;
      FData: Variant;
      FNull: Boolean;
      FName: string;
      FDataType: TFieldType;
      FBound: Boolean;
      function ParamRef: TDBISAMParam;
      function IsParamStored: Boolean;
      function GetDataType: TFieldType;
      function GetNativeDataType: Byte;
      function GetNativeSubType: Byte;
      procedure SetNativeDataType(DataType: Byte; SubType: Byte);
      function GetNativeDataSize: Integer;
      procedure GetNativeData(Buffer: Pointer);
      procedure PutNativeData(Buffer: Pointer);
   protected
      procedure AssignDBISAMParam(Param: TDBISAMParam);
      procedure AssignParam(Param: TParam);
      procedure AssignTo(Dest: TPersistent); override;
      function GetAsBCD: Currency;
      function GetAsBoolean: Boolean;
      function GetAsDateTime: TDateTime;
      function GetAsCurrency: Currency;
      function GetAsFloat: Double;
      function GetAsInteger: Integer;
      function GetAsLargeInt: Int64;
      function GetAsMemo: string;
      function GetAsString: string;
      function GetAsVariant: Variant;
      function GetIsNull: Boolean;
      function IsEqual(Value: TDBISAMParam): Boolean;
      procedure SetAsBCD(const Value: Currency);
      procedure SetAsBlob(const Value: TBlobData);
      procedure SetAsBoolean(Value: Boolean);
      procedure SetAsCurrency(const Value: Currency);
      procedure SetAsDate(const Value: TDateTime);
      procedure SetAsDateTime(const Value: TDateTime);
      procedure SetAsFloat(const Value: Double);
      procedure SetAsInteger(Value: Integer);
      procedure SetAsLargeInt(Value: Int64);
      procedure SetAsMemo(const Value: string);
      procedure SetAsString(const Value: string);
      procedure SetAsSmallInt(Value: Integer);
      procedure SetAsTime(const Value: TDateTime);
      procedure SetAsVariant(const Value: Variant);
      procedure SetAsWord(Value: Integer);
      procedure SetDataType(Value: TFieldType);
      procedure SetText(const Value: string);
      function GetDisplayName: string; override;
   public
      constructor Create(Collection: TCollection); overload; override;
      constructor Create(AParams: TDBISAMParams); reintroduce; overload;
      procedure Assign(Source: TPersistent); override;
      procedure AssignField(Field: TField);
      procedure AssignFieldValue(Field: TField; const Value: Variant);
      procedure Clear;
      procedure GetData(Buffer: Pointer);
      function GetDataSize: Integer;
      procedure LoadFromFile(const FileName: string; BlobType: TBlobType);
      procedure LoadFromStream(Stream: TStream; BlobType: TBlobType);
      procedure SaveToFile(const FileName: string);
      procedure SaveToStream(Stream: TStream);
      procedure SetBlobData(Buffer: Pointer; Size: Integer);
      procedure SetData(Buffer: Pointer);
      property AsBCD: Currency read GetAsBCD write SetAsBCD;
      property AsBlob: TBlobData read GetAsString write SetAsBlob;
      property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
      property AsCurrency: Currency read GetAsCurrency write SetAsCurrency;
      property AsDate: TDateTime read GetAsDateTime write SetAsDate;
      property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
      property AsFloat: Double read GetAsFloat write SetAsFloat;
      property AsInteger: Integer read GetAsInteger write SetAsInteger;
      property AsSmallInt: Integer read GetAsInteger write SetAsSmallInt;
      property AsLargeInt: Int64 read GetAsLargeInt write SetAsLargeInt;
      property AsMemo: string read GetAsMemo write SetAsMemo;
      property AsString: string read GetAsString write SetAsString;
      property AsTime: TDateTime read GetAsDateTime write SetAsTime;
      property AsWord: Integer read GetAsInteger write SetAsWord;
      property Bound: Boolean read FBound write FBound;
      property IsNull: Boolean read GetIsNull;
      property Text: string read GetAsString write SetText;
   published
      property DataType: TFieldType read GetDataType write SetDataType;
      property Name: string read FName write FName;
      property Value: Variant read GetAsVariant write SetAsVariant stored IsParamStored;
   end;

   { TDBISAMParams }

   TDBISAMParams = class(TCollection)
   private
      FOwner: TComponent;
      function GetParamValue(const ParamName: string): Variant;
      procedure ReadBinaryData(Stream: TStream);
      procedure SetParamValue(const ParamName: string;
                              const Value: Variant);
      function GetItem(Index: Integer): TDBISAMParam;
      procedure SetItem(Index: Integer; Value: TDBISAMParam);
      function GetNativeBuffer(out ParamDefinitions: array of pFieldDefinition;
                               out RecordBuffer: PChar;
                               out BlobCount: Word;
                               out BlobBuffers: array of PChar): Word;
      procedure PutNativeBuffer(NumberOfParams: Word;
                                const ParamDefinitions: array of pFieldDefinition;
                                RecordBuffer: PChar);
      function ParseSQL(const SQLText: string; var SQLPos: Integer;
                        var SQLLine: Integer; var SQLColumn: Integer;
                        var LastSQLLine: Integer; var LastSQLColumn: Integer;
                        DoCreate: Boolean): string;
      procedure GetParamList(List: TList; const ParamNames: string);
   protected
      procedure AssignTo(Dest: TPersistent); override;
      procedure DefineProperties(Filer: TFiler); override;
      function GetOwner: TPersistent; override;
      procedure Update(Item: TCollectionItem); override;
   public
      constructor Create(Owner: TComponent); overload;
      procedure AssignValues(Value: TDBISAMParams); overload;
      procedure AssignValues(Value: TParams); overload;
      function CreateParam(FldType: TFieldType; const ParamName: string): TDBISAMParam;
      function IsEqual(Value: TDBISAMParams): Boolean;
      function ParamByName(const Value: string): TDBISAMParam;
      function FindParam(const Value: string): TDBISAMParam;
      property Items[Index: Integer]: TDBISAMParam read GetItem write SetItem; default;
      property ParamValues[const ParamName: string]: Variant read GetParamValue write SetParamValue;
   end;

   { TDBISAMFunctionParam }

   TDBISAMFunctionParam = class(TCollectionItem)
   private
      FDataType: TFieldType;
      function GetDataType: TFieldType;
      procedure SetDataType(Value: TFieldType);
      function GetNativeDataType: Byte;
      function GetNativeSubType: Byte;
   protected
      procedure AssignDBISAMFunctionParam(DBISAMFunctionParam: TDBISAMFunctionParam);
      function IsEqual(Value: TDBISAMFunctionParam): Boolean;
      function GetDisplayName: string; override;
   public
      constructor Create(Collection: TCollection); overload; override;
      constructor Create(AFunctionParams: TDBISAMFunctionParams); reintroduce; overload;
      procedure Assign(Source: TPersistent); override;
   published
      property DataType: TFieldType read GetDataType write SetDataType;
   end;

   { TDBISAMFunctionParams }

   TDBISAMFunctionParams = class(TCollection)
   private
      FOwner: TPersistent;
      function GetItem(Index: Integer): TDBISAMFunctionParam;
      procedure SetItem(Index: Integer; Value: TDBISAMFunctionParam);
   protected
      procedure AssignTo(Dest: TPersistent); override;
      function GetOwner: TPersistent; override;
      procedure Update(Item: TCollectionItem); override;
   public
      constructor Create(Owner: TPersistent); overload;
      function CreateFunctionParam(DataType: TFieldType): TDBISAMFunctionParam;
      function IsEqual(Value: TDBISAMFunctionParams): Boolean;
      procedure Assign(Source: TPersistent); override;
      property Items[Index: Integer]: TDBISAMFunctionParam read GetItem write SetItem; default;
   end;

   { TDBISAMFunction }

   TDBISAMFunction = class(TCollectionItem)
   private
      FFunctionRef: TDBISAMFunction;
      FName: string;
      FResultType: TFieldType;
      FFunctionParams: TDBISAMFunctionParams;
      function FunctionRef: TDBISAMFunction;
      function GetResultType: TFieldType;
      procedure SetResultType(Value: TFieldType);
      procedure SetName(const Value: string);
      function GetNativeResultType: Byte;
      function GetNativeResultSubType: Byte;
      procedure SetFunctionParamsList(Value: TDBISAMFunctionParams);
   protected
      procedure AssignDBISAMFunction(DBISAMFunction: TDBISAMFunction);
      function IsEqual(Value: TDBISAMFunction): Boolean;
      function GetDisplayName: string; override;
   public
      constructor Create(Collection: TCollection); overload; override;
      constructor Create(AFunctions: TDBISAMFunctions); reintroduce; overload;
      destructor Destroy; override;
      procedure Assign(Source: TPersistent); override;
   published
      property ResultType: TFieldType read GetResultType write SetResultType;
      property Name: string read FName write SetName;
      property Params: TDBISAMFunctionParams read FFunctionParams write SetFunctionParamsList;
   end;

   { TDBISAMFunctions }

   TDBISAMFunctions = class(TCollection)
   private
      FOwner: TComponent;
      function GetItem(Index: Integer): TDBISAMFunction;
      procedure SetItem(Index: Integer; Value: TDBISAMFunction);
      function GetNativeBuffer(out FunctionDefinitions: array of pFunctionDefinition): Word;
   protected
      procedure AssignTo(Dest: TPersistent); override;
      function GetOwner: TPersistent; override;
      procedure Update(Item: TCollectionItem); override;
   public
      constructor Create(Owner: TComponent); overload;
      procedure Assign(Source: TPersistent); override;
      function CreateFunction(ResultType: TFieldType;
                              const FunctionName: string): TDBISAMFunction;
      function IsEqual(Value: TDBISAMFunctions): Boolean;
      function FunctionByName(const Value: string): TDBISAMFunction;
      function FindFunction(const Value: string): TDBISAMFunction;
      property Items[Index: Integer]: TDBISAMFunction read GetItem write SetItem; default;
   end;

   { TDBISAMStringList }

   TDBISAMStringList = class(TLocaleStringList)
      public
         property LocaleID: Integer read GetLocaleID write SetLocaleID;
         function FindUsingPartials(const S: string; var Index: Integer): Boolean; override;
         function FindPartial(const S: string; var Index: Integer;
                              PartialLength: Word): Boolean; override;
      end;

   { TDBISAMLogRecord }

   TLogCategory = (lcInformation,lcWarning,lcError);

   TLogEventType = (leNone,leServerStart,leServerStop,leConnect,
                    leReconnect,leDisconnect,leLogin,leLogout,
                    leDeadSession,leNoSession,leAddressBlock,leMaxConnect,
                    leInvalidLogin,leLoginDenied,leConfiguration,
                    leScheduledEvent);

   TLogRecord = packed record
      DateTime: TDateTime;
      Category: TLogCategory;
      EventType: TLogEventType;
      Text: string[255];
      ServerVersion: Currency;
      ClientVersion: Currency;
      ClientAddress: string[60];
      ClientEncrypted: Boolean;
      ClientUser: string[30];
      ClientRequest: Word;
      ClientRequestName: string[30];
      ClientThread: Integer;
      ClientSession: Integer;
      end;

   { TDBISAMEngine }

   TEngineType = (etClient,etServer);

   TDatabaseRight = (drRead,drInsert,drUpdate,drDelete,drCreate,
                     drAlter,drDrop,drRename,drMaintain,
                     drBackup,drRestore);

   TDatabaseRights = set of TDatabaseRight;

   TProcedureRight = (prExecute);

   TProcedureRights = set of TProcedureRight;

   TCryptoInitEvent = procedure(Sender: TObject; Key: Pointer; KeyLen: Integer;
                                out OutData: Pointer; out OutDataBytes: Integer) of object;

   TEncryptBlockEvent = procedure(Sender: TObject; Data: Pointer;
                                  BlockBuffer: Pointer) of object;

   TDecryptBlockEvent = procedure(Sender: TObject; Data: Pointer;
                                  BlockBuffer: Pointer) of object;

   TCryptoResetEvent = procedure(Sender: TObject; Data: Pointer) of object;

   TCompressEvent = procedure(Sender: TObject;
                              const InBuffer: Pointer; InBytes: Integer; Level: Byte;
                              out OutBuffer: Pointer; out OutBytes: Integer) of object;

   TDecompressEvent = procedure(Sender: TObject;
                                const InBuffer: Pointer; InBytes: Integer;
                                out OutBuffer: Pointer; out OutBytes: Integer) of object;

   TTextIndexFilterEvent = procedure(Sender: TObject;
                                     const TableName: string;
                                     const FieldName: string;
                                     var TextToIndex: string) of object;

   TTextIndexTokenFilterEvent = procedure(Sender: TObject;
                                          const TableName: string;
                                          const FieldName: string;
                                          const TextIndexToken: string;
                                          var Include: Boolean) of object;

   TCustomFunctionEvent = procedure(Sender: TObject; const FunctionName: string;
                                    FunctionParams: TDBISAMParams;
                                    var Result: Variant) of object;

   TTriggerEvent = procedure(Sender: TObject; TriggerSession: TDBISAMSession;
                             TriggerDatabase: TDBISAMDatabase;
                             const TableName: string;
                             CurrentRecord: TDBISAMRecord) of object;

   TErrorEvent = procedure(Sender: TObject; ErrorSession: TDBISAMSession;
                           ErrorDatabase: TDBISAMDatabase;
                           const TableName: string;
                           CurrentRecord: TDBISAMRecord;
                           E: Exception; var Action: TDataAction) of object;

   TServerLogEvent = procedure(Sender: TObject; LogRecord: TLogRecord) of object;

   TServerLogCountEvent = procedure(Sender: TObject; var LogCount: Integer) of object;

   TServerLogRecordEvent = procedure(Sender: TObject; Number: Integer;
                                     var LogRecord: TLogRecord) of object;

   TServerConnectEvent = procedure(Sender: TObject; IsEncrypted: Boolean;
                                   const ConnectAddress: string;
                                   var UserData: TObject) of object;

   TServerReconnectEvent = procedure(Sender: TObject; IsEncrypted: Boolean;
                                     const ConnectAddress: string;
                                     UserData: TObject) of object;

   TServerLoginEvent = procedure(Sender: TObject; const UserName: string;
                                 UserData: TObject) of object;

   TServerLogoutEvent = procedure(Sender: TObject; var UserData: TObject) of object;

   TServerDisconnectEvent = procedure(Sender: TObject; UserData: TObject;
                                      const LastConnectAddress: string) of object;

   TEventRunType = (rtOnce,rtHourly,rtDaily,rtWeekly,rtMonthly);

   TEventDays = array [1..7] of Boolean;

   TEventDayOfMonth = (md1st,md2nd,md3rd,md4th,md5th,md6th,md7th,md8th,md9th,
                       md10th,md11th,md12th,md13th,md14th,md15th,md16th,md17th,
                       md18th,md19th,md20th,md21st,md22nd,md23rd,md24th,md25th,
                       md26th,md27th,md28th,md29th,md30th,md31st,
                       mdFirstDayOfWeek,mdSecondDayOfWeek,mdThirdDayOfWeek,
                       mdFourthDayOfWeek,mdLastDayOfWeek);

   TEventDayOfWeek = (wdSunday,wdMonday,wdTuesday,wdWednesday,
                      wdThursday,wdFriday,wdSaturday);

   TEventMonths = array [1..12] of Boolean;

   TServerScheduledEvent = procedure(Sender: TObject; const EventName: string;
                                     var Completed: Boolean) of object;

   TServerProcedureEvent = procedure(Sender: TObject; ServerSession: TDBISAMSession;
                                     const ProcedureName: string) of object;

   TDBISAMEngine = class(TComponent)
   private
      FHandle: TDataEngine;
      FStreamedActive: Boolean;
      FEngineType: TEngineType;
      FEngineSignature: string;
      FSessions: TThreadList;
      FSessionSection: Pointer;
      FSessionNumbers: TBits;
      FFunctions: TDBISAMFunctions;
      FLargeFileSupport: Boolean;
      FFilterRecordCounts: Boolean;
      FLockFileName: string;
      FMaxTableDataBufferSize: Integer;
      FMaxTableDataBufferCount: Integer;
      FMaxTableIndexBufferSize: Integer;
      FMaxTableIndexBufferCount: Integer;
      FMaxTableBlobBufferSize: Integer;
      FMaxTableBlobBufferCount: Integer;
      FTableDataExtension: string;
      FTableIndexExtension: string;
      FTableBlobExtension: string;
      FTableDataBackupExtension: string;
      FTableIndexBackupExtension: string;
      FTableBlobBackupExtension: string;
      FTableDataUpgradeExtension: string;
      FTableIndexUpgradeExtension: string;
      FTableBlobUpgradeExtension: string;
      FTableDataTempExtension: string;
      FTableIndexTempExtension: string;
      FTableBlobTempExtension: string;
      FCreateTempTablesInDatabase: Boolean;
      FTableFilterIndexThreshhold: Byte;
      FTableReadLockWaitTime: Word;
      FTableReadLockRetryCount: Word;
      FTableWriteLockWaitTime: Word;
      FTableWriteLockRetryCount: Word;
      FTableTransLockWaitTime: Word;
      FTableTransLockRetryCount: Word;
      FTableMaxReadLockCount: Word;
      FServerName: string;
      FServerDescription: string;
      FServerMainAddress: string;
      FServerMainPort: Integer;
      FServerMainThreadCacheSize: Integer;
      FServerAdminAddress: string;
      FServerAdminPort: Integer;
      FServerAdminThreadCacheSize: Integer;
      FServerEncryptedOnly: Boolean;
      FServerEncryptionPassword: string;
      FServerConfigFileName: string;
      FServerConfigPassword: string;
      FServerLicensedConnections: Word;
      FOnCryptoInit: TCryptoInitEvent;
      FOnEncryptBlock: TEncryptBlockEvent;
      FOnDecryptBlock: TDecryptBlockEvent;
      FOnCryptoReset: TCryptoResetEvent;
      FOnCompress: TCompressEvent;
      FOnDecompress: TDecompressEvent;
      FOnTextIndexFilter: TTextIndexFilterEvent;
      FOnTextIndexTokenFilter: TTextIndexTokenFilterEvent;
      FOnCustomFunction: TCustomFunctionEvent;
      FBeforeInsertTrigger: TTriggerEvent;
      FAfterInsertTrigger: TTriggerEvent;
      FOnInsertError: TErrorEvent;
      FBeforeUpdateTrigger: TTriggerEvent;
      FAfterUpdateTrigger: TTriggerEvent;
      FOnUpdateError: TErrorEvent;
      FBeforeDeleteTrigger: TTriggerEvent;
      FAfterDeleteTrigger: TTriggerEvent;
      FOnDeleteError: TErrorEvent;
      FOnServerStart: TNotifyEvent;
      FOnServerStop: TNotifyEvent;
      FOnServerLogEvent: TServerLogEvent;
      FOnServerLogCount: TServerLogCountEvent;
      FOnServerLogRecord: TServerLogRecordEvent;
      FOnServerConnect: TServerConnectEvent;
      FOnServerReconnect: TServerReconnectEvent;
      FOnServerLogin: TServerLoginEvent;
      FOnServerLogout: TServerLogoutEvent;
      FOnServerDisconnect: TServerDisconnectEvent;
      FOnServerScheduledEvent: TServerScheduledEvent;
      FOnServerProcedure: TServerProcedureEvent;
      FOnStartup: TNotifyEvent;
      FOnShutdown: TNotifyEvent;
      function GetEngineVersion: string;
      procedure SetEngineVersion(const Value: string);
      procedure SetEngineType(Value: TEngineType);
      procedure SetEngineSignature(const Value: string);
      procedure SetLargeFileSupport(Value: Boolean);
      procedure SetFunctionsList(Value: TDBISAMFunctions);
      procedure SetLockFileName(const Value: string);
      procedure SetMaxTableDataBufferSize(Value: Integer);
      procedure SetMaxTableDataBufferCount(Value: Integer);
      procedure SetMaxTableIndexBufferSize(Value: Integer);
      procedure SetMaxTableIndexBufferCount(Value: Integer);
      procedure SetMaxTableBlobBufferSize(Value: Integer);
      procedure SetMaxTableBlobBufferCount(Value: Integer);
      procedure SetTableDataExtension(const Value: string);
      procedure SetTableIndexExtension(const Value: string);
      procedure SetTableBlobExtension(const Value: string);
      procedure SetTableDataBackupExtension(const Value: string);
      procedure SetTableIndexBackupExtension(const Value: string);
      procedure SetTableBlobBackupExtension(const Value: string);
      procedure SetTableDataUpgradeExtension(const Value: string);
      procedure SetTableIndexUpgradeExtension(const Value: string);
      procedure SetTableBlobUpgradeExtension(const Value: string);
      procedure SetTableDataTempExtension(const Value: string);
      procedure SetTableIndexTempExtension(const Value: string);
      procedure SetTableBlobTempExtension(const Value: string);
      procedure SetCreateTempTablesInDatabase(Value: Boolean);
      procedure SetTableFilterIndexThreshhold(Value: Byte);
      procedure SetTableReadLockWaitTime(Value: Word);
      procedure SetTableReadLockRetryCount(Value: Word);
      procedure SetTableWriteLockWaitTime(Value: Word);
      procedure SetTableWriteLockRetryCount(Value: Word);
      procedure SetTableTransLockWaitTime(Value: Word);
      procedure SetTableTransLockRetryCount(Value: Word);
      procedure SetTableMaxReadLockCount(Value: Word);
      procedure SetServerName(const Value: string);
      procedure SetServerDescription(const Value: string);
      procedure SetServerMainAddress(const Value: string);
      procedure SetServerMainPort(Value: Integer);
      procedure SetServerMainThreadCacheSize(Value: Integer);
      procedure SetServerAdminAddress(const Value: string);
      procedure SetServerAdminPort(Value: Integer);
      procedure SetServerAdminThreadCacheSize(Value: Integer);
      procedure SetServerEncryptedOnly(Value: Boolean);
      procedure SetServerEncryptionPassword(const Value: string);
      procedure SetServerConfigFileName(const Value: string);
      procedure SetServerConfigPassword(const Value: string);
      procedure SetServerLicensedConnections(Value: Word);
      function CryptoInitCallback(Key: Pointer; KeyLen: Integer;
                                  out OutData: Pointer; out OutDataBytes: Integer): Boolean;
      function EncryptBlockCallback(Data: Pointer; BlockBuffer: Pointer): Boolean;
      function DecryptBlockCallback(Data: Pointer; BlockBuffer: Pointer): Boolean;
      function CryptoResetCallback(Data: Pointer): Boolean;
      function CompressCallback(const InBuffer: Pointer; InBytes: Integer; Level: Byte;
                                  out OutBuffer: Pointer; out OutBytes: Integer): Boolean;
      function DecompressCallback(const InBuffer: Pointer; InBytes: Integer;
                                   out OutBuffer: Pointer; out OutBytes: Integer): Boolean;
      function TextIndexFilterCallback(const TableName: ShortString;
                                       const FieldName: ShortString;
                                       var TextToIndex: string): Boolean;
      function TextIndexTokenFilterCallback(const TableName: ShortString;
                                            const FieldName: ShortString;
                                            const TextIndexToken: ShortString;
                                            var Include: Boolean): Boolean;
      function CustomFunctionCallback(const FunctionName: ShortString;
                                      InParamCount: Word;
                                      const InParamDefinitions: array of pFieldDefinition;
                                      InRecordBuffer: PChar;
                                      ResultDataType: Byte;
                                      out ResultSize: Integer;
                                      out ResultBuffer: PChar): Boolean;
      function GetCustomFunctionsCallback(out FunctionCount: Word;
                                          out FunctionDefinitions: array of pFunctionDefinition): Boolean;
      function TriggerCallback(TriggerType: Byte;
                               EngineSession: TObject;
                               EngineDirectory: TObject;
                               EngineCursor: TObject;
                               RecordNumber: Integer;
                               RecordBuffer: PChar;
                               OldRecordBuffer: PChar): Boolean;
      function ErrorCallback(ErrorType: Byte;
                             EngineSession: TObject;
                             EngineDirectory: TObject;
                             EngineCursor: TObject;
                             RecordNumber: Integer;
                             RecordBuffer: PChar;
                             E: Exception; var Response: Byte): Boolean;
      function ServerStartCallback: Boolean;
      function ServerStopCallback: Boolean;
      function ServerLogEventCallback(LogRecord: TLogRecord): Boolean;
      function ServerLogCountCallback(var LogCount: Integer): Boolean;
      function ServerLogRecordCallback(Number: Integer;
                                       var LogRecord: TLogRecord): Boolean;
      function ServerConnectCallback(IsEncrypted: Boolean;
                                     const ConnectAddress: ShortString;
                                     var UserData: TObject): Boolean;
      function ServerReconnectCallback(IsEncrypted: Boolean;
                                       const ConnectAddress: ShortString;
                                       UserData: TObject): Boolean;
      function ServerLoginCallback(const UserName: ShortString;
                                   UserData: TObject): Boolean;
      function ServerLogoutCallback(var UserData: TObject): Boolean;
      function ServerDisconnectCallback(UserData: TObject;
                                        const LastConnectAddress: ShortString): Boolean;
      function ServerScheduledEventCallback(const EventName: ShortString;
                                            var Completed: Boolean): Boolean;
      function ServerProcedureCallback(EngineSession: TObject;
                                       const ProcedureName: ShortString;
                                       InParamCount: Word;
                                       const InParamDefinitions: array of pFieldDefinition;
                                       InRecordBuffer: PChar;
                                       out OutParamCount: Word;
                                       out OutParamDefinitions: array of pFieldDefinition;
                                       out OutRecordBuffer: PChar;
                                       out OutBlobCount: Word;
                                       out OutBlobBuffers: array of PChar): Boolean;
      procedure SetOnCryptoInit(Value: TCryptoInitEvent);
      procedure SetOnEncryptBlock(Value: TEncryptBlockEvent);
      procedure SetOnDecryptBlock(Value: TDecryptBlockEvent);
      procedure SetOnCryptoReset(Value: TCryptoResetEvent);
      procedure SetOnCompress(Value: TCompressEvent);
      procedure SetOnDecompress(Value: TDecompressEvent);
      procedure SetOnTextIndexFilter(Value: TTextIndexFilterEvent);
      procedure SetOnTextIndexTokenFilter(Value: TTextIndexTokenFilterEvent);
      procedure SetOnCustomFunction(Value: TCustomFunctionEvent);
      procedure AddSession(ASession: TDBISAMSession);
      procedure FreeAllSessions;
      procedure CloseAllSessions;
      function GetSessionCount: Integer;
      function GetSession(Index: Integer): TDBISAMSession;
      function GetSessionByName(const SessionName: string): TDBISAMSession;
      procedure CheckActive;
      procedure CheckInactive;
      function GetActive: Boolean;
      procedure SetActive(Value: Boolean);
      function GetSessionNumber: Integer;
      procedure PutSessionNumber(Value: Integer);
   protected
      procedure Loaded; override;
   public
      class function NewInstance: TObject; override;
      procedure FreeInstance; override;
      function FindSession(const SessionName: string): TDBISAMSession;
      procedure GetSessionNames(List: TStrings);
      function OpenSession(const SessionName: string): TDBISAMSession;
      property Handle: TDataEngine read FHandle;
      property SessionCount: Integer read GetSessionCount;
      property Sessions[Index: Integer]: TDBISAMSession read GetSession; default;
      property SessionList[const SessionName: string]: TDBISAMSession read GetSessionByName;
      function QuotedSQLStr(const Value: string): string;
      function DateToAnsiStr(Value: TDateTime): string;
      function TimeToAnsiStr(Value: TDateTime; MilitaryTime: Boolean): string;
      function DateTimeToAnsiStr(Value: TDateTime; MilitaryTime: Boolean): string;
      function AnsiStrToDate(const Value: string): TDateTime;
      function AnsiStrToTime(const Value: string): TDateTime;
      function AnsiStrToDateTime(const Value: string): TDateTime;
      function BooleanToAnsiStr(Value: Boolean): string;
      function AnsiStrToBoolean(const Value: string): Boolean;
      function FloatToAnsiStr(Value: Extended): string;
      function AnsiStrToFloat(const Value: string): Extended;
      function CurrToAnsiStr(Value: Currency): string;
      function AnsiStrToCurr(const Value: string): Currency;
      procedure BuildWordList(const TableName: string; const FieldName: string;
                              WordBuffer: string; WordList: TDBISAMStringList;
                              const SpaceChars: string; const IncludeChars: string;
                              Occurrences: Boolean; PartialWords: Boolean);
      procedure GetDefaultTextIndexParams(StopWordsList: TStrings;
                                          var TextSpaceChars: string;
                                          var TextIncludeChars: string);
      procedure GetServerUserNames(List: TStrings);
      procedure GetServerUser(const UserName: string; var UserPassword: string;
                              var UserDescription: string;
                              var IsAdministrator: Boolean;
                              var MaxConnections: Word);
      procedure AddServerUser(const UserName: string; const UserPassword: string;
                              const UserDescription: string;
                              IsAdministrator: Boolean=False;
                              MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
      procedure ModifyServerUser(const UserName: string; const UserPassword: string;
                                 const UserDescription: string;
                                 IsAdministrator: Boolean=False;
                                 MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
      procedure ModifyServerUserPassword(const UserName: string;
                                         const UserPassword: string);
      procedure DeleteServerUser(const UserName: string);
      procedure GetServerDatabaseNames(List: TStrings);
      procedure GetServerDatabase(const DatabaseName: string;
                                  var DatabaseDescription: string;
                                  var ServerPath: string);
      procedure AddServerDatabase(const DatabaseName: string;
                                  const DatabaseDescription: string;
                                  const ServerPath: string);
      procedure ModifyServerDatabase(const DatabaseName: string;
                                     const DatabaseDescription: string;
                                     const ServerPath: string);
      procedure DeleteServerDatabase(const DatabaseName: string);
      procedure GetServerDatabaseUserNames(const DatabaseName: string;
                                           List: TStrings);
      procedure GetServerDatabaseUser(const DatabaseName: string;
                                      const AuthorizedUser: string;
                                       var UserRights: TDatabaseRights);
      procedure AddServerDatabaseUser(const DatabaseName: string;
                                      const AuthorizedUser: string;
                                         RightsToAssign: TDatabaseRights);
      procedure ModifyServerDatabaseUser(const DatabaseName: string;
                                         const AuthorizedUser: string;
                                          RightsToAssign: TDatabaseRights);
      procedure DeleteServerDatabaseUser(const DatabaseName: string;
                                         const AuthorizedUser: string);
      procedure GetServerProcedureNames(List: TStrings);
      procedure GetServerProcedure(const ProcedureName: string;
                                   var ProcedureDescription: string);
      procedure AddServerProcedure(const ProcedureName: string;
                                   const ProcedureDescription: string);
      procedure ModifyServerProcedure(const ProcedureName: string;
                                      const ProcedureDescription: string);
      procedure DeleteServerProcedure(const ProcedureName: string);
      procedure GetServerProcedureUserNames(const ProcedureName: string;
                                            List: TStrings);
      procedure GetServerProcedureUser(const ProcedureName: string;
                                       const AuthorizedUser: string;
                                        var UserRights: TProcedureRights);
      procedure AddServerProcedureUser(const ProcedureName: string;
                                       const AuthorizedUser: string;
                                          RightsToAssign: TProcedureRights);
      procedure ModifyServerProcedureUser(const ProcedureName: string;
                                          const AuthorizedUser: string;
                                           RightsToAssign: TProcedureRights);
      procedure DeleteServerProcedureUser(const ProcedureName: string;
                                          const AuthorizedUser: string);
      procedure GetServerEventNames(List: TStrings);
      procedure GetServerEvent(const EventName: string;
                               var EventDescription: string;
                               var EventRunType: TEventRunType;
                               var EventStartDate: TDateTime;
                               var EventEndDate: TDateTime;
                               var EventStartTime: TDateTime;
                               var EventEndTime: TDateTime;
                               var EventInterval: Word;
                               var EventDays: TEventDays;
                               var EventDayOfMonth: TEventDayOfMonth;
                               var EventDayOfWeek: TEventDayOfWeek;
                               var EventMonths: TEventMonths;
                               var EventLastRun: TDateTime);
      procedure AddServerEvent(const EventName: string;
                               const EventDescription: string;
                               EventRunType: TEventRunType;
                               EventStartDate: TDateTime;
                               EventEndDate: TDateTime;
                               EventStartTime: TDateTime;
                               EventEndTime: TDateTime;
                               EventInterval: Word;
                               EventDays: TEventDays;
                               EventDayOfMonth: TEventDayOfMonth;
                               EventDayOfWeek: TEventDayOfWeek;
                               EventMonths: TEventMonths);
      procedure ModifyServerEvent(const EventName: string;
                                  const EventDescription: string;
                                  EventRunType: TEventRunType;
                                  EventStartDate: TDateTime;
                                  EventEndDate: TDateTime;
                                  EventStartTime: TDateTime;
                                  EventEndTime: TDateTime;
                                  EventInterval: Word;
                                  EventDays: TEventDays;
                                  EventDayOfMonth: TEventDayOfMonth;
                                  EventDayOfWeek: TEventDayOfWeek;
                                  EventMonths: TEventMonths);
      procedure DeleteServerEvent(const EventName: string);
      procedure GetServerConfig(var DenyLogins: Boolean; var MaxConnections: Word;
                                var ConnectTimeout: Word; var DeadSessionInterval: Word;
                                var DeadSessionExpires: Word; var MaxDeadSessions: Word;
                                var TempDirectory: string;
                                AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
      procedure ModifyServerConfig(DenyLogins: Boolean; MaxConnections: Word;
                                   ConnectTimeout: Word; DeadSessionInterval: Word;
                                   DeadSessionExpires: Word; MaxDeadSessions: Word;
                                   const TempDirectory: string;
                                   AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
      function GetServerLogCount: Integer;
      function GetServerLogRecord(Number: Integer): TLogRecord;
      procedure StartAdminServer;
      procedure StopAdminServer;
      procedure StartMainServer;
      procedure StopMainServer;
      function GetServerUTCDateTime: TDateTime;
      function GetServerUpTime: Int64;
      function GetServerMemoryUsage: double;
      function GetServerSessionCount: Integer;
      function GetServerConnectedSessionCount: Integer;
      function GetServerSessionInfo(SessionNum: Integer;
                                    var SessionID: Integer;
                                    var CreatedOn: TDateTime;
                                    var LastConnectedOn: TDateTime;
                                    var UserName: string;
                                    var UserAddress: string;
                                    var Encrypted: Boolean;
                                    var LastUserAddress: string): Boolean;
      function DisconnectServerSession(SessionID: Integer): Boolean;
      function RemoveServerSession(SessionID: Integer): Boolean;
      function IsValidLocale(LocaleID: Integer): Boolean;
      function IsValidLocaleConstant(const LocaleConstant: string): Boolean;
      function ConvertLocaleConstantToID(const LocaleConstant: string): Integer;
      function ConvertIDToLocaleConstant(LocaleID: Integer): string;
      procedure GetLocaleNames(List: TStrings);
   published
      property Active: Boolean read GetActive write SetActive;
      property EngineVersion: string read GetEngineVersion write SetEngineVersion;
      property EngineType: TEngineType read FEngineType write SetEngineType;
      property EngineSignature: string read FEngineSignature
                                       write SetEngineSignature;
      property Functions: TDBISAMFunctions read FFunctions write SetFunctionsList;
      property LargeFileSupport: Boolean read FLargeFileSupport
                                         write SetLargeFileSupport;
      property FilterRecordCounts: Boolean read FFilterRecordCounts
                                           write FFilterRecordCounts;
      property LockFileName: string read FLockFileName write SetLockFileName;
      property MaxTableDataBufferSize: Integer read FMaxTableDataBufferSize
                                               write SetMaxTableDataBufferSize;
      property MaxTableDataBufferCount: Integer read FMaxTableDataBufferCount
                                               write SetMaxTableDataBufferCount;
      property MaxTableIndexBufferSize: Integer read FMaxTableIndexBufferSize
                                               write SetMaxTableIndexBufferSize;
      property MaxTableIndexBufferCount: Integer read FMaxTableIndexBufferCount
                                               write SetMaxTableIndexBufferCount;
      property MaxTableBlobBufferSize: Integer read FMaxTableBlobBufferSize
                                               write SetMaxTableBlobBufferSize;
      property MaxTableBlobBufferCount: Integer read FMaxTableBlobBufferCount
                                               write SetMaxTableBlobBufferCount;
      property TableDataExtension: string read FTableDataExtension
                                          write SetTableDataExtension;
      property TableIndexExtension: string read FTableIndexExtension
                                           write SetTableIndexExtension;
      property TableBlobExtension: string read FTableBlobExtension
                                          write SetTableBlobExtension;
      property TableDataBackupExtension: string read FTableDataBackupExtension
                                                write SetTableDataBackupExtension;
      property TableIndexBackupExtension: string read FTableIndexBackupExtension
                                                 write SetTableIndexBackupExtension;
      property TableBlobBackupExtension: string read FTableBlobBackupExtension
                                                write SetTableBlobBackupExtension;
      property TableDataUpgradeExtension: string read FTableDataUpgradeExtension
                                                  write SetTableDataUpgradeExtension;
      property TableIndexUpgradeExtension: string read FTableIndexUpgradeExtension
                                                    write SetTableIndexUpgradeExtension;
      property TableBlobUpgradeExtension: string read FTableBlobUpgradeExtension
                                                  write SetTableBlobUpgradeExtension;
      property TableDataTempExtension: string read FTableDataTempExtension
                                                  write SetTableDataTempExtension;
      property TableIndexTempExtension: string read FTableIndexTempExtension
                                                    write SetTableIndexTempExtension;
      property TableBlobTempExtension: string read FTableBlobTempExtension
                                                  write SetTableBlobTempExtension;
      property CreateTempTablesInDatabase: Boolean read FCreateTempTablesInDatabase
                                                   write SetCreateTempTablesInDatabase;
      property TableFilterIndexThreshhold: Byte read FTableFilterIndexThreshhold
                                                   write SetTableFilterIndexThreshhold;
      property TableReadLockWaitTime: Word read FTableReadLockWaitTime
                                            write SetTableReadLockWaitTime;
      property TableReadLockRetryCount: Word read FTableReadLockRetryCount
                                              write SetTableReadLockRetryCount;
      property TableWriteLockWaitTime: Word read FTableWriteLockWaitTime
                                            write SetTableWriteLockWaitTime;
      property TableWriteLockRetryCount: Word read FTableWriteLockRetryCount
                                              write SetTableWriteLockRetryCount;
      property TableTransLockWaitTime: Word read FTableTransLockWaitTime
                                             write SetTableTransLockWaitTime;
      property TableTransLockRetryCount: Word read FTableTransLockRetryCount
                                              write SetTableTransLockRetryCount;
      property TableMaxReadLockCount: Word read FTableMaxReadLockCount
                                           write SetTableMaxReadLockCount;
      property ServerName: string read FServerName write SetServerName;
      property ServerDescription: string read FServerDescription
                                         write SetServerDescription;
      property ServerMainAddress: string read FServerMainAddress
                                         write SetServerMainAddress;
      property ServerMainPort: Integer read FServerMainPort
                                       write SetServerMainPort;
      property ServerMainThreadCacheSize: Integer read FServerMainThreadCacheSize
                                                  write SetSErverMainThreadCacheSize;
      property ServerAdminAddress: string read FServerAdminAddress
                                          write SetServerAdminAddress;
      property ServerAdminPort: Integer read FServerAdminPort
                                        write SetServerAdminPort;
      property ServerAdminThreadCacheSize: Integer read FServerAdminThreadCacheSize
                                                   write SetServerAdminThreadCacheSize;
      property ServerEncryptedOnly: Boolean read FServerEncryptedOnly
                                            write SetServerEncryptedOnly;
      property ServerEncryptionPassword: string read FServerEncryptionPassword
                                                write SetServerEncryptionPassword;
      property ServerConfigFileName: string read FServerConfigFileName
                                            write SetServerConfigFileName;
      property ServerConfigPassword: string read FServerConfigPassword
                                            write SetServerConfigPassword;
      property ServerLicensedConnections: Word read FServerLicensedConnections
                                               write SetServerLicensedConnections;
      property OnCryptoInit: TCryptoInitEvent read FOnCryptoInit
                                              write SetOnCryptoInit;
      property OnEncryptBlock: TEncryptBlockEvent read FOnEncryptBlock write SetOnEncryptBlock;
      property OnDecryptBlock: TDecryptBlockEvent read FOnDecryptBlock write SetOnDecryptBlock;
      property OnCryptoReset: TCryptoResetEvent read FOnCryptoReset
                                                write SetOnCryptoReset;
      property OnCompress: TCompressEvent read FOnCompress write SetOnCompress;
      property OnDecompress: TDecompressEvent read FOnDecompress
                                              write SetOnDecompress;
      property OnTextIndexFilter: TTextIndexFilterEvent read FOnTextIndexFilter
                                                         write SetOnTextIndexFilter;
      property OnTextIndexTokenFilter: TTextIndexTokenFilterEvent read FOnTextIndexTokenFilter
                                                                   write SetOnTextIndexTokenFilter;
      property OnCustomFunction: TCustomFunctionEvent read FOnCustomFunction
                                                      write SetOnCustomFunction;
      property BeforeInsertTrigger: TTriggerEvent read FBeforeInsertTrigger
                                                  write FBeforeInsertTrigger;
      property AfterInsertTrigger: TTriggerEvent read FAfterInsertTrigger
                                                 write FAfterInsertTrigger;
      property OnInsertError: TErrorEvent read FOnInsertError
                                          write FOnInsertError; 
      property BeforeUpdateTrigger: TTriggerEvent read FBeforeUpdateTrigger
                                                  write FBeforeUpdateTrigger;
      property AfterUpdateTrigger: TTriggerEvent read FAfterUpdateTrigger
                                                 write FAfterUpdateTrigger;
      property OnUpdateError: TErrorEvent read FOnUpdateError
                                          write FOnUpdateError;
      property BeforeDeleteTrigger: TTriggerEvent read FBeforeDeleteTrigger
                                                       write FBeforeDeleteTrigger;
      property AfterDeleteTrigger: TTriggerEvent read FAfterDeleteTrigger
                                                 write FAfterDeleteTrigger;
      property OnDeleteError: TErrorEvent read FOnDeleteError
                                          write FOnDeleteError;
      property OnServerStart: TNotifyEvent read FOnServerStart
                                            write FOnServerStart;
      property OnServerStop: TNotifyEvent read FOnServerStop
                                           write FOnServerStop;
      property OnServerLogEvent: TServerLogEvent read FOnServerLogEvent
                                                  write FOnServerLogEvent;
      property OnServerLogCount: TServerLogCountEvent read FOnServerLogCount
                                                      write FOnServerLogCount;
      property OnServerLogRecord: TServerLogRecordEvent read FOnServerLogRecord
                                                        write FOnServerLogRecord;
      property OnServerConnect: TServerConnectEvent read FOnServerConnect
                                                    write FOnServerConnect;
      property OnServerReconnect: TServerReconnectEvent read FOnServerReconnect
                                                        write FOnServerReconnect;
      property OnServerLogin: TServerLoginEvent read FOnServerLogin
                                                write FOnServerLogin;
      property OnServerLogout: TServerLogoutEvent read FOnServerLogout
                                                  write FOnServerLogout;
      property OnServerDisconnect: TServerDisconnectEvent read FOnServerDisconnect
                                                          write FOnServerDisconnect;
      property OnServerScheduledEvent: TServerScheduledEvent read FOnServerScheduledEvent
                                                             write FOnServerScheduledEvent;
      property OnServerProcedure: TServerProcedureEvent read FOnServerProcedure
                                                        write FOnServerProcedure;
      property OnStartup: TNotifyEvent read FOnStartup write FOnStartup;
      property OnShutdown: TNotifyEvent read FOnShutdown write FOnShutdown;
   end;

   { TDBISAMSession }

   TPasswordEvent = procedure(Sender: TObject; var Continue: Boolean) of object;

   TSessionType = (stLocal,stRemote);

   TLoginEvent = procedure(Sender: TObject; var UserName: string;
                           var Password: string; var Continue: Boolean) of object;

   TTimeoutEvent = procedure(Sender: TObject; var StayConnected: Boolean) of object;

   TSendReceiveProgressEvent = procedure(Sender: TObject; NumBytes: Integer;
                                         PercentDone: Word) of object;

   TTraceEventType = (teConnect,teReconnect,teDisconnect,teRequest,teReply);

   TTraceRecord = packed record
      DateTime: TDateTime;
      EventType: TTraceEventType;
      ElapsedTime: LongWord;
      RemoteEncryption: Boolean;
      RemoteCompression: Byte;
      RemoteHost: ShortString;
      RemoteAddress: ShortString;
      RemotePort: Integer;
      RemoteService: ShortString;
      RemoteUser: ShortString;
      RemoteRequestID: Word;
      RemoteRequestName: ShortString;
      RemoteRequestSize: Integer;
      RemoteReplyResultID: Word;
      RemoteReplyResultName: ShortString;
      RemoteReplySize: Integer;
      end;

   TTraceEvent = procedure(Sender: TObject; TraceRecord: TTraceRecord) of object;

   TReconnectEvent = procedure(Sender: TObject;
                               var Continue: Boolean;
                               var StopAsking: Boolean) of object;

   TProcedureProgressEvent = procedure(Sender: TObject; const Status: string;
                                       PercentDone: Word; var Abort: Boolean) of object;

   TLockProtocol = (lpPessimistic,lpOptimistic);

   TDBISAMSession = class(TComponent,IDBSession)
   private
      FHandle: TDataSession;
      FAcquiredHandle: Boolean;
      FDatabases: TList;
      FStreamedActive: Boolean;
      FKeepConnections: Boolean;
      FDefault: Boolean;
      FAutoSessionName: Boolean;
      FUpdatingAutoSessionName: Boolean;
      FSessionName: string;
      FSessionNumber: Integer;
      FPrivateDir: string;
      FProgressSteps: Word;
      FOnStartup: TNotifyEvent;
      FOnShutdown: TNotifyEvent;
      FOnPassword: TPasswordEvent;
      FForceBufferFlush: Boolean;
      FStrictChangeDetection: Boolean;
      FLockRetryCount: Byte;
      FLockWaitTime: Word;
      FLockProtocol: TLockProtocol;
      FSessionType: TSessionType;
      FRemoteEncryption: Boolean;
      FRemoteEncryptionPassword: string;
      FRemoteCompression: Byte;
      FRemoteHost: string;
      FRemoteAddress: string;
      FRemotePort: Integer;
      FRemoteService: string;
      FRemoteTrace: Boolean;
      FRemoteUser: string;
      FRemotePassword: string;
      FRemoteTimeout: Word;
      FRemotePing: Boolean;
      FRemotePingInterval: Word;
      FRemoteParams: TDBISAMParams;
      FOnRemoteLogin: TLoginEvent;
      FOnRemoteTimeout: TTimeoutEvent;
      FOnRemoteSendProgress: TSendReceiveProgressEvent;
      FOnRemoteReceiveProgress: TSendReceiveProgressEvent;
      FOnRemoteTrace: TTraceEvent;
      FOnRemoteReconnect: TReconnectEvent;
      FOnRemoteProcedureProgress: TProcedureProgressEvent;
      procedure AddDatabase(Value: TDBISAMDatabase);
      procedure CheckActive;
      procedure CheckInactive;
      function InternalFindDatabase(const DatabaseName: string): TDBISAMDatabase;
      function GetActive: Boolean;
      function GetDatabase(Index: Integer): TDBISAMDatabase;
      function GetDatabaseCount: Integer;
      function GetHandle: TDataSession;
      procedure SetHandle(Value: TDataSession);
      function SessionNameStored: Boolean;
      procedure RemoveDatabase(Value: TDBISAMDatabase);
      procedure SetActive(Value: Boolean);
      procedure SetAutoSessionName(Value: Boolean);
      procedure SetPrivateDir(const Value: string);
      procedure SetProgressSteps(Value: Word);
      procedure SetSessionName(const Value: string);
      procedure SetSessionNames;
      procedure StartSession(Value: Boolean);
      procedure UpdateAutoSessionName;
      procedure ValidateAutoSession(AOwner: TComponent; AllSessions: Boolean);
      function GetEngineVersion: string;
      procedure SetEngineVersion(const Value: string);
      procedure SetStrictChangeDetection(Value: Boolean);
      procedure SetLockRetryCount(Value: Byte);
      procedure SetLockWaitTime(Value: Word);
      procedure SetLockProtocol(Value: TLockProtocol);
      procedure SetForceBufferFlush(Value: Boolean);
      procedure SetSessionType(Value: TSessionType);
      procedure SetRemoteEncryption(Value: Boolean);
      procedure SetRemoteEncryptionPassword(const Value: string);
      procedure SetRemoteCompression(Value: Byte);
      procedure SetRemoteHost(const Value: string);
      procedure SetRemoteAddress(const Value: string);
      procedure SetRemotePort(Value: Integer);
      procedure SetRemoteService(const Value: string);
      procedure SetRemoteTrace(Value: Boolean);
      procedure SetRemoteUser(const Value: string);
      procedure SetRemotePassword(const Value: string);
      procedure SetRemoteTimeout(Value: Word);
      procedure SetRemotePing(Value: Boolean);
      procedure SetRemotePingInterval(Value: Word);
      function RemoteLoginCallback(var UserName: ShortString;
                                   var Password: ShortString): Boolean;
      function RemoteTimeoutCallback(var StayConnected: Boolean): Boolean;
      function RemoteSendProgressCallback(NumBytes: Integer; PercentDone: Word): Boolean;
      function RemoteReceiveProgressCallback(NumBytes: Integer; PercentDone: Word): Boolean;
      function RemoteTraceCallback(TraceRecord: TDataTraceRecord): Boolean;
      function RemoteReconnectCallback(var Continue: Boolean;
                                       var StopAsking: Boolean): Boolean;
      function RemoteProcedureProgressCallback(const Status: ShortString;
                                               PercentDone: Word;
                                               var Abort: Boolean): Boolean;
      function GetPasswordCallback: Boolean;
      function GetCurrentRemoteUser: string;
      function GetCurrentRemoteID: Integer;
      function GetCurrentServerUser: string;
   protected
      procedure Loaded; override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      procedure SetName(const NewName: TComponentName); override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure AddPassword(const Password: string);
      function GetPassword: Boolean;
      procedure RemoveAllPasswords;
      procedure RemovePassword(const Password: string);
      procedure Close;
      procedure CloseDatabase(Database: TDBISAMDatabase);
      procedure DropConnections;
      function FindDatabase(const DatabaseName: string): TDBISAMDatabase;
      procedure GetDatabaseNames(List: TStrings);
      procedure GetTableNames(const DatabaseName: string; List: TStrings);
      procedure Open;
      function OpenDatabase(const DatabaseName: string): TDBISAMDatabase;
      property DatabaseCount: Integer read GetDatabaseCount;
      property Databases[Index: Integer]: TDBISAMDatabase read GetDatabase;
      property Handle: TDataSession read GetHandle;
      property CurrentRemoteUser: string read GetCurrentRemoteUser;
      property CurrentRemoteID: Integer read GetCurrentRemoteID;
      property RemoteParams: TDBISAMParams read FRemoteParams;
      function RemoteParamByName(const Value: string): TDBISAMParam;
      procedure GetRemoteUserNames(List: TStrings);
      procedure GetRemoteUser(const UserName: string; var UserPassword: string;
                              var UserDescription: string;
                              var IsAdministrator: Boolean;
                              var MaxConnections: Word);
      procedure AddRemoteUser(const UserName: string; const UserPassword: string;
                              const UserDescription: string;
                              IsAdministrator: Boolean=False;
                              MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
      procedure ModifyRemoteUser(const UserName: string; const UserPassword: string;
                                 const UserDescription: string;
                                 IsAdministrator: Boolean=False;
                                 MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
      procedure ModifyRemoteUserPassword(const UserName: string; const UserPassword: string);
      procedure DeleteRemoteUser(const UserName: string);
      procedure GetRemoteDatabaseNames(List: TStrings);
      procedure GetRemoteDatabase(const DatabaseName: string;
                                  var DatabaseDescription: string;
                                  var ServerPath: string);
      procedure AddRemoteDatabase(const DatabaseName: string;
                                  const DatabaseDescription: string;
                                  const ServerPath: string);
      procedure ModifyRemoteDatabase(const DatabaseName: string;
                                     const DatabaseDescription: string;
                                     const ServerPath: string);
      procedure DeleteRemoteDatabase(const DatabaseName: string);
      procedure GetRemoteDatabaseUserNames(const DatabaseName: string;
                                           List: TStrings);
      procedure GetRemoteDatabaseUser(const DatabaseName: string;
                                      const AuthorizedUser: string;
                                      var UserRights: TDatabaseRights);
      procedure AddRemoteDatabaseUser(const DatabaseName: string;
                                      const AuthorizedUser: string;
                                      RightsToAssign: TDatabaseRights);
      procedure ModifyRemoteDatabaseUser(const DatabaseName: string;
                                         const AuthorizedUser: string;
                                         RightsToAssign: TDatabaseRights);
      procedure DeleteRemoteDatabaseUser(const DatabaseName: string;
                                         const AuthorizedUser: string);
      procedure GetRemoteProcedureNames(List: TStrings);
      procedure GetRemoteProcedure(const ProcedureName: string;
                                   var ProcedureDescription: string);
      procedure AddRemoteProcedure(const ProcedureName: string;
                                   const ProcedureDescription: string);
      procedure ModifyRemoteProcedure(const ProcedureName: string;
                                      const ProcedureDescription: string);
      procedure DeleteRemoteProcedure(const ProcedureName: string);
      procedure GetRemoteProcedureUserNames(const ProcedureName: string;
                                            List: TStrings);
      procedure GetRemoteProcedureUser(const ProcedureName: string;
                                       const AuthorizedUser: string;
                                        var UserRights: TProcedureRights);
      procedure AddRemoteProcedureUser(const ProcedureName: string;
                                       const AuthorizedUser: string;
                                       RightsToAssign: TProcedureRights);
      procedure ModifyRemoteProcedureUser(const ProcedureName: string;
                                          const AuthorizedUser: string;
                                          RightsToAssign: TProcedureRights);
      procedure DeleteRemoteProcedureUser(const ProcedureName: string;
                                          const AuthorizedUser: string);
      procedure GetRemoteEventNames(List: TStrings);
      procedure GetRemoteEvent(const EventName: string;
                               var EventDescription: string;
                               var EventRunType: TEventRunType;
                               var EventStartDate: TDateTime;
                               var EventEndDate: TDateTime;
                               var EventStartTime: TDateTime;
                               var EventEndTime: TDateTime;
                               var EventInterval: Word;
                               var EventDays: TEventDays;
                               var EventDayOfMonth: TEventDayOfMonth;
                               var EventDayOfWeek: TEventDayOfWeek;
                               var EventMonths: TEventMonths;
                               var EventLastRun: TDateTime);
      procedure AddRemoteEvent(const EventName: string;
                               const EventDescription: string;
                               EventRunType: TEventRunType;
                               EventStartDate: TDateTime;
                               EventEndDate: TDateTime;
                               EventStartTime: TDateTime;
                               EventEndTime: TDateTime;
                               EventInterval: Word;
                               EventDays: TEventDays;
                               EventDayOfMonth: TEventDayOfMonth;
                               EventDayOfWeek: TEventDayOfWeek;
                               EventMonths: TEventMonths);
      procedure ModifyRemoteEvent(const EventName: string;
                                  const EventDescription: string;
                                  EventRunType: TEventRunType;
                                  EventStartDate: TDateTime;
                                  EventEndDate: TDateTime;
                                  EventStartTime: TDateTime;
                                  EventEndTime: TDateTime;
                                  EventInterval: Word;
                                  EventDays: TEventDays;
                                  EventDayOfMonth: TEventDayOfMonth;
                                  EventDayOfWeek: TEventDayOfWeek;
                                   EventMonths: TEventMonths);
      procedure DeleteRemoteEvent(const EventName: string);
      procedure GetRemoteConfig(var DenyLogins: Boolean; var MaxConnections: Word;
                                var ConnectTimeout: Word; var DeadSessionInterval: Word;
                                var DeadSessionExpires: Word; var MaxDeadSessions: Word;
                                var TempDirectory: string;
                                AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
      procedure ModifyRemoteConfig(DenyLogins: Boolean; MaxConnections: Word;
                                   ConnectTimeout: Word; DeadSessionInterval: Word;
                                   DeadSessionExpires: Word; MaxDeadSessions: Word;
                                   const TempDirectory: string;
                                   AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
      function GetRemoteLogCount: Integer;
      function GetRemoteLogRecord(Number: Integer): TLogRecord;
      procedure StartRemoteServer;
      procedure StopRemoteServer;
      function GetRemoteEngineVersion: string;
      function GetRemoteDateTime: TDateTime;
      function GetRemoteUTCDateTime: TDateTime;
      function GetRemoteUpTime: Int64;
      function GetRemoteMemoryUsage: double;
      function GetRemoteServerName: string;
      function GetRemoteServerDescription: string;
      function GetRemoteMainAddress: string;
      function GetRemoteMainPort: Integer;
      function GetRemoteMainThreadCacheSize: Integer; 
      function GetRemoteAdminAddress: string;
      function GetRemoteAdminPort: Integer;
      function GetRemoteAdminThreadCacheSize: Integer;
      function GetRemoteSessionCount: Integer;
      function GetRemoteConnectedSessionCount: Integer;
      function GetRemoteSessionInfo(SessionNum: Integer;
                                    var SessionID: Integer;
                                    var CreatedOn: TDateTime;
                                    var LastConnectedOn: TDateTime;
                                    var UserName: string;
                                    var UserAddress: string;
                                    var Encrypted: Boolean;
                                    var LastUserAddress: string): Boolean;
      function DisconnectRemoteSession(SessionID: Integer): Boolean;
      function RemoveRemoteSession(SessionID: Integer): Boolean;
      procedure CallRemoteProcedure(const ProcedureName: string);
      procedure SendProcedureProgress(const Status: string;
                                      PercentDone: Word;
                                      var Abort: Boolean);
      { Version 5 }
      procedure RemoveAllRemoteMemoryTables;
      { Version 5 }
      property CurrentServerUser: string read GetCurrentServerUser;
   published
      property EngineVersion: string read GetEngineVersion write SetEngineVersion;
      property Active: Boolean read GetActive write SetActive default False;
      property AutoSessionName: Boolean read FAutoSessionName
                                        write SetAutoSessionName default False;
      property ForceBufferFlush: Boolean read FForceBufferFlush
                                         write SetForceBufferFlush default False;
      property KeepConnections: Boolean read FKeepConnections
                                        write FKeepConnections default True;
      property LockRetryCount: Byte read FLockRetryCount write SetLockRetryCount;
      property LockWaitTime: Word read FLockWaitTime write SetLockWaitTime;
      property LockProtocol: TLockProtocol read FLockProtocol write SetLockProtocol;
      property PrivateDir: string read FPrivateDir write SetPrivateDir;
      property ProgressSteps: Word read FProgressSteps write SetProgressSteps;
      property SessionName: string read FSessionName
                                   write SetSessionName stored SessionNameStored;
      property StrictChangeDetection: Boolean read FStrictChangeDetection
                                              write SetStrictChangeDetection default False;
      property OnPassword: TPasswordEvent read FOnPassword write FOnPassword;
      property OnStartup: TNotifyEvent read FOnStartup write FOnStartup;
      property OnShutdown: TNotifyEvent read FOnShutdown write FOnShutdown;
      property SessionType: TSessionType read FSessionType write SetSessionType;
      property RemoteEncryption: Boolean read FRemoteEncryption write SetRemoteEncryption;
      property RemoteEncryptionPassword: string read FRemoteEncryptionPassword
                                                write SetRemoteEncryptionPassword;
      property RemoteCompression: Byte read FRemoteCompression write SetRemoteCompression;
      property RemoteHost: string read FRemoteHost write SetRemoteHost;
      property RemoteAddress: string read FRemoteAddress write SetRemoteAddress;
      property RemotePort: Integer read FRemotePort write SetRemotePort;
      property RemoteService: string read FRemoteService write SetRemoteService;
      property RemoteTrace: Boolean read FRemoteTrace write SetRemoteTrace;
      property RemoteUser: string read FRemoteUser write SetRemoteUser;
      property RemotePassword: string read FRemotePassword write SetRemotePassword;
      property RemoteTimeout: Word read FRemoteTimeout write SetRemoteTimeout;
      property RemotePing: Boolean read FRemotePing write SetRemotePing;
      property RemotePingInterval: Word read FRemotePingInterval write SetRemotePingInterval;
      property OnRemoteLogin: TLoginEvent read FOnRemoteLogin write FOnRemoteLogin;
      property OnRemoteTimeout: TTimeoutEvent read FOnRemoteTimeout write FOnRemoteTimeout;
      property OnRemoteSendProgress: TSendReceiveProgressEvent
                        read FOnRemoteSendProgress write FOnRemoteSendProgress;
      property OnRemoteReceiveProgress: TSendReceiveProgressEvent
                        read FOnRemoteReceiveProgress write FOnRemoteReceiveProgress;
      property OnRemoteTrace: TTraceEvent read FOnRemoteTrace write FOnRemoteTrace;
      property OnRemoteReconnect: TReconnectEvent read FOnRemoteReconnect write FOnRemoteReconnect;
      property OnRemoteProcedureProgress: TProcedureProgressEvent
                        read FOnRemoteProcedureProgress write FOnRemoteProcedureProgress;
   end;

   { TDBISAMDatabase }

   TSteppedProgressEvent = procedure(Sender: TObject; const Step: string;
                                     PercentDone: Word) of object;

   TLogEvent = procedure(Sender: TObject; const LogMessage: string) of object;

   TDBISAMDatabase = class(TCustomConnection)
   private
      FKeepConnection: Boolean;
      FKeepTablesOpen: Boolean;
      FTemporary: Boolean;
      FRefCount: Integer;
      FAcquiredHandle: Boolean;
      FHandle: TDataDirectory;
      FSession: TDBISAMSession;
      FSessionName: string;
      FDatabaseName: string;
      FDirectory: string;
      FRemoteDatabase: string;
      FBeforeConnect: TNotifyEvent;
      FOnBackupProgress: TSteppedProgressEvent;
      FOnBackupLog: TLogEvent;
      FOnRestoreProgress: TSteppedProgressEvent;
      FOnRestoreLog: TLogEvent;
      procedure CheckActive;
      procedure CheckInactive;
      procedure CheckDatabaseName;
      procedure CheckSessionName(Required: Boolean);
      procedure EndTransaction(CommitIt: Boolean; FlushIt: Boolean);
      function GetInTransaction: Boolean;
      procedure SetDatabaseName(const Value: string);
      procedure SetDirectory(const Value: string);
      procedure SetRemoteDatabase(const Value: string);
      procedure SetHandle(Value: TDataDirectory);
      procedure SetKeepConnection(Value: Boolean);
      procedure SetKeepTablesOpen(Value: Boolean);
      procedure SetSessionName(const Value: string);
      function GetEngineVersion: string;
      procedure SetEngineVersion(const Value: string);
      function BackupProgress(const BackupStep: ShortString;
                              PercentDone: Word): Boolean;
      function BackupLog(const LogMessage: ShortString): Boolean;
      function RestoreProgress(const RestoreStep: ShortString;
                               PercentDone: Word): Boolean;
      function RestoreLog(const LogMessage: ShortString): Boolean;
   protected
      procedure DoConnect; override;
      procedure DoDisconnect; override;
      function GetConnected: Boolean; override;
      function GetDataSet(Index: Integer): TDBISAMDBDataSet; reintroduce;
      procedure Loaded; override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure CloseDataSets;
      procedure Commit(ForceFlush: Boolean=True); virtual;
      procedure Rollback; virtual;
      procedure StartTransaction(Tables: TStrings=nil); virtual;
      function Backup(const BackupName: string;
                      const BackupDescription: string;
                      Compression: Byte;
                      BackupTables: TStrings): Boolean;
      function BackupInfo(const BackupName: string;
                          var BackupDescription: string;
                          var BackupDateTime: TDateTime;
                          BackupTables: TStrings): Boolean;
      function Restore(const BackupName: string;
                       BackupTables: TStrings): Boolean;
      procedure ValidateName(const Name: string);
      function Execute(const SQL: string; Params: TDBISAMParams=nil;
                       Query: TDBISAMQuery=nil): Integer;
      property DataSets[Index: Integer]: TDBISAMDBDataSet read GetDataSet;
      property Handle: TDataDirectory read FHandle;
      property InTransaction: Boolean read GetInTransaction;
      property Session: TDBISAMSession read FSession;
      property Temporary: Boolean read FTemporary write FTemporary;
   published
      property EngineVersion: string read GetEngineVersion write SetEngineVersion;
      property Connected;
      property DatabaseName: string read FDatabaseName write SetDatabaseName;
      property Directory: string read FDirectory write SetDirectory;
      property RemoteDatabase: string read FRemoteDatabase write SetRemoteDatabase;
      property KeepConnection: Boolean read FKeepConnection write SetKeepConnection default True;
      property KeepTablesOpen: Boolean read FKeepTablesOpen write SetKeepTablesOpen;
      property SessionName: string read FSessionName write SetSessionName;
      property AfterConnect;
      property AfterDisconnect;
      property BeforeConnect;
      property BeforeDisconnect;
      property OnBackupProgress: TSteppedProgressEvent read FOnBackupProgress
                                                       write FOnBackupProgress;
      property OnBackupLog: TLogEvent read FOnBackupLog write FOnBackupLog;
      property OnRestoreProgress: TSteppedProgressEvent read FOnRestoreProgress
                                                        write FOnRestoreProgress;
      property OnRestoreLog: TLogEvent read FOnRestoreLog write FOnRestoreLog;
   end;

   { TDBISAMFieldDef }

   TFieldCharCase = (fcNoChange,fcLowerCase,fcUpperCase);

   TDBISAMFieldDef = class(TNamedItem)
   private
      FFieldNo: Integer;
      FSize: Integer;
      FDataType: TFieldType;
      FAttributes: TFieldAttributes;
      FDefaultValue: string;
      FMinValue: string;
      FMaxValue: string;
      FDescription: string;
      FCharCase: TFieldCharCase;
      FCompression: Byte;
      function GetFieldClass: TFieldClass;
      function GetRequired: Boolean;
      procedure ReadRequired(Reader: TReader);
      procedure SetAttributes(Value: TFieldAttributes);
      procedure SetDataType(Value: TFieldType);
      procedure SetRequired(Value: Boolean);
      procedure SetSize(Value: Integer);
      function CreateFieldComponent(Owner: TComponent;
                                    ParentField: TObjectField=nil;
                                    FieldName: string=''): TField;
   protected
      procedure DefineProperties(Filer: TFiler); override;
   public
      constructor Create(Owner: TDBISAMFieldDefs; const Name: string;
                         DataType: TFieldType; Size: Integer;
                         Required: Boolean; const DefaultValue: string;
                         const MinValue: string; const MaxValue: string;
                         const Description: string; CharCase: TFieldCharCase;
                         Compression: Byte; FieldNo: Integer); reintroduce; overload;
      procedure Assign(Source: TPersistent); override;
      procedure AssignTo(Dest: TPersistent); override;
      property FieldClass: TFieldClass read GetFieldClass;
      property FieldNo: Integer read FFieldNo write FFieldNo stored False;
      property Required: Boolean read GetRequired write SetRequired;
      function CreateField(Owner: TComponent; ParentField: TObjectField=nil;
                           const FieldName: string=''; CreateChildren: Boolean=True): TField;
   published
      property Attributes: TFieldAttributes read FAttributes write SetAttributes default [];
      property DataType: TFieldType read FDataType write SetDataType default ftUnknown;
      property Size: Integer read FSize write SetSize default 0;
      property DefaultValue: string read FDefaultValue write FDefaultValue;
      property MinValue: string read FMinValue write FMinValue;
      property MaxValue: string read FMaxValue write FMaxValue;
      property Description: string read FDescription write FDescription;
      property CharCase: TFieldCharCase read FCharCase write FCharCase;
      property Compression: Byte read FCompression write FCompression;
   end;

   { TDBISAMFieldDefs }

   TDBISAMFieldDefs = class(TDefCollection)
   private
      function GetFieldDef(Index: Integer): TDBISAMFieldDef;
      procedure SetFieldDef(Index: Integer; Value: TDBISAMFieldDef);
      procedure InternalAdd(FieldNo: Integer; const Name: string; DataType: TFieldType;
                            Size: Integer; Required: Boolean; const DefaultValue: string='';
                            const MinValue: string=''; const MaxValue: string='';
                            const Description: string=''; CharCase: TFieldCharCase=fcNoChange;
                            Compression: Byte=NO_COMPRESSION);
      procedure InternalInsert(InsertPos: Integer; FieldNo: Integer;
                               const Name: string; DataType: TFieldType;
                               Size: Integer; Required: Boolean; const DefaultValue: string='';
                               const MinValue: string=''; const MaxValue: string='';
                               const Description: string=''; CharCase: TFieldCharCase=fcNoChange;
                               Compression: Byte=NO_COMPRESSION);
   protected
      procedure SetItemName(AItem: TCollectionItem); override;
  public
      constructor Create(AOwner: TPersistent);
      function AddFieldDef: TDBISAMFieldDef;
      function InsertFieldDef(InsertPos: Integer): TDBISAMFieldDef;
      function Find(const Name: string): TDBISAMFieldDef;
      procedure Update; reintroduce;
      procedure Add(const Name: string; DataType: TFieldType;
                    Size: Integer=0; Required: Boolean=False; const DefaultValue: string='';
                    const MinValue: string=''; const MaxValue: string='';
                    const Description: string=''; CharCase: TFieldCharCase=fcNoChange;
                    Compression: Byte=NO_COMPRESSION); overload;
      procedure Add(FieldNo: Integer; const Name: string; DataType: TFieldType;
                    Size: Integer=0; Required: Boolean=False; const DefaultValue: string='';
                    const MinValue: string=''; const MaxValue: string='';
                    const Description: string=''; CharCase: TFieldCharCase=fcNoChange;
                    Compression: Byte=NO_COMPRESSION); overload;
      procedure Insert(InsertPos: Integer; const Name: string; DataType: TFieldType;
                       Size: Integer=0; Required: Boolean=False; const DefaultValue: string='';
                       const MinValue: string=''; const MaxValue: string='';
                       const Description: string=''; CharCase: TFieldCharCase=fcNoChange;
                       Compression: Byte=NO_COMPRESSION); overload;
      procedure Insert(InsertPos: Integer; FieldNo: Integer;
                       const Name: string; DataType: TFieldType;
                       Size: Integer=0; Required: Boolean=False; const DefaultValue: string='';
                       const MinValue: string=''; const MaxValue: string='';
                       const Description: string=''; CharCase: TFieldCharCase=fcNoChange;
                       Compression: Byte=NO_COMPRESSION); overload;
      property Items[Index: Integer]: TDBISAMFieldDef read GetFieldDef write SetFieldDef; default;
   end;

   { TDBISAMIndexDef }

   TIndexCompression = (icNone,icDuplicateByte,icTrailingByte,icFull);

   TDBISAMIndexDef = class(TNamedItem)
   private
      FFieldExpression: string;
      FDescFields: string;
      FOptions: TIndexOptions;
      FCompression: TIndexCompression;
      function GetFields: string;
      procedure SetDescFields(const Value: string);
      procedure SetFields(const Value: string);
      procedure SetOptions(Value: TIndexOptions);
   protected
      function GetDisplayName: string; override;
   public
      constructor Create(Owner: TDBISAMIndexDefs; const Name: string;
                         const Fields: string; Options: TIndexOptions=[];
                         const DescFields: string='';
                         Compression: TIndexCompression=icNone); reintroduce; overload;
      procedure Assign(Source: TPersistent); override;
      procedure AssignTo(Dest: TPersistent); override;
      property FieldExpression: string read FFieldExpression;
   published
      property DescFields: string read FDescFields write SetDescFields;
      property Fields: string read GetFields write SetFields;
      property Options: TIndexOptions read FOptions write SetOptions default [];
      property Compression: TIndexCompression read FCompression write FCompression;
   end;

   { TDBISAMIndexDefs }

   TDBISAMIndexDefs = class(TDefCollection)
   private
      function GetIndexDef(Index: Integer): TDBISAMIndexDef;
      procedure SetIndexDef(Index: Integer; Value: TDBISAMIndexDef);
   public
      constructor Create(AOwner: TPersistent);
      function AddIndexDef: TDBISAMIndexDef;
      function Find(const Name: string): TDBISAMIndexDef;
      procedure Update; reintroduce;
      function FindIndexForFields(const Fields: string): TDBISAMIndexDef;
      function GetIndexForFields(const Fields: string; CaseInsensitive: Boolean): TDBISAMIndexDef;
      procedure Add(const Name: string; const Fields: string;
                    Options: TIndexOptions=[]; const DescFields: string='';
                    Compression: TIndexCompression=icNone);
      property Items[Index: Integer]: TDBISAMIndexDef read GetIndexDef write SetIndexDef; default;
   end;

   { TDBISAMBaseDataSet }

   TDBISAMBaseDataSet = class(TDataSet)
   private
      FHandle: TDataCursor;
   protected
      property Handle: TDataCursor read FHandle;
      function GetActiveRecBuf(var RecBuf: PChar): Boolean; virtual; abstract;
      procedure DataConvert(Field: TField; Source, Dest: Pointer; ToNative: Boolean); override;
      procedure AddFieldDefinition(var FieldNo: Integer;
                                   var Name: string; var DataType: TFieldType;
                                   var Size: Word; var Required: Boolean;
                                   var DefaultValue: string;
                                   var MinValue: string; var MaxValue: string;
                                   var Description: string;
                                   var CharCase: TFieldCharCase;
                                   var Compression: Byte); virtual;
   end;

   { TDBISAMRecordDataSet }

   TDBISAMRecordDataSet = class(TDBISAMBaseDataSet)
   private
      FPhysicalFields: Boolean;
      FPosition: Integer;
      FIndexFieldMap: TKeyFields;
      FCaseInsIndex: Boolean;
      FKeySize: Word;
      FRecordNumber: Integer;
      FRecordBuffer: PChar;
      FOldRecordBuffer: PChar;
      FIndexFieldCount: Integer;
      function GetRecordID: Integer;
      function GetRecordHash: string;
      procedure SetHandle(Value: TDataCursor; UsePhysicalFields: Boolean);
      procedure SetRecordNumber(Value: Integer);
      procedure SetRecordBuffer(RecordBuffer: PChar);
      procedure SetOldRecordBuffer(RecordBuffer: PChar);
   protected
      function GetActiveRecBuf(var RecBuf: PChar): Boolean; override;
      function AllocRecordBuffer: PChar; override;
      procedure CloseBlob(Field: TField); override;
      procedure FreeRecordBuffer(var Buffer: PChar); override;
      function GetCanModify: Boolean; override;
      function GetIndexField(Index: Integer): TField;
      function GetIndexFieldCount: Integer;
      function GetIsIndexField(Field: TField): Boolean; override;
      function GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override;
      function GetRecordCount: Integer; override;
      function GetRecNo: Integer; override;
      function GetRecordSize: Word; override;
      function GetStateFieldValue(State: TDataSetState; Field: TField): Variant; override;
      procedure InternalClose; override;
      procedure InternalHandleException; override;
      procedure InternalClearFieldDefs; virtual;
      procedure InternalInitFieldDefs; override;
      procedure InternalOpen; override;
      function IsCursorOpen: Boolean; override;
      procedure SetFieldData(Field: TField; Buffer: Pointer); override;
      procedure SetIndexField(Index: Integer; Value: TField);
      procedure SetStateFieldValue(State: TDataSetState; Field: TField; const Value: Variant); override;
      { Dummy abstract overrides }
      procedure GetBookmarkData(Buffer: PChar; Data: Pointer); override;
      function GetBookmarkFlag(Buffer: PChar): TBookmarkFlag; override;
      procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
      procedure InternalDelete; override;
      procedure InternalFirst; override;
      procedure InternalGotoBookmark(Bookmark: Pointer); override;
      procedure InternalInitRecord(Buffer: PChar); override;
      procedure InternalLast; override;
      procedure InternalPost; override;
      procedure InternalSetToRecord(Buffer: PChar); override;
      procedure SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag); override;
      procedure SetBookmarkData(Buffer: PChar; Data: Pointer); override;
   public
      function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;
      function GetBlobFieldData(FieldNo: Integer; var Buffer: TBlobByteData): Integer; override;
      function GetFieldData(Field: TField; Buffer: Pointer): Boolean; overload; override;
      function GetFieldData(FieldNo: Integer; Buffer: Pointer): Boolean; overload; override;
      function GetFieldClass(FieldType: TFieldType): TFieldClass; override;
      procedure GetIndexInfo;
      property RecordID: Integer read GetRecordID;
      property RecordHash: string read GetRecordHash;
   end;

   { TDBISAMRecord }

   TDBISAMRecord = class(TObject)
   private
      FRecordDataSet: TDBISAMRecordDataSet;
      function GetFieldCount: Integer;
      function GetFields: TFields;
      function GetFieldValue(const FieldName: string): Variant;
      procedure SetFieldValue(const FieldName: string; const Value: Variant);
      function GetModified: Boolean;
      function GetRecNo: Integer;
      function GetRecordID: Integer;
      function GetRecordHash: string;
      function GetRecordSize: Word;
      procedure Initialize(CursorHandle: TDataCursor;
                           RecordNumber: Integer;
                           RecordBuffer: PChar;
                           OldRecordBuffer: PChar;
                           UsePhysicalFields: Boolean);
      procedure StartUpdateableTrigger;
      procedure EndUpdateableTrigger;
      function Updating: Boolean;
   public
      constructor Create;
      destructor Destroy; override;
      property FieldCount: Integer read GetFieldCount;
      property Fields: TFields read GetFields;
      property FieldValues[const FieldName: string]: Variant read GetFieldValue write SetFieldValue; default;
      property Modified: Boolean read GetModified;
      property RecNo: Integer read GetRecNo;
      property RecordID: Integer read GetRecordID;
      property RecordHash: string read GetRecordHash;
      property RecordSize: Word read GetRecordSize;
      function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
      function FieldByName(const FieldName: string): TField;
      function FindField(const FieldName: string): TField;
      function GetBlobFieldData(FieldNo: Integer; var Buffer: TBlobByteData): Integer;
      procedure GetFieldNames(List: TStrings);
   end;

   { TDBISAMDataSet }

   TProgressEvent = procedure(Sender: TObject; PercentDone: Word) of object;

   TAbortProgressEvent = procedure(Sender: TObject; PercentDone: Word;
                                   var Abort: Boolean) of object;

   TAbortAction = (aaContinue,aaRetry,aaAbort);

   TAbortErrorEvent = procedure(Sender: TObject; E: Exception;
                                var Action: TAbortAction) of object;

   TUpdateType = (utInsert,utUpdate,utDelete);

   TCachedUpdateErrorEvent = procedure(Sender: TObject;
                                       CurrentRecord: TDBISAMRecord;
                                       E: Exception;
                                       UpdateType: TUpdateType;
                                       var Action: TUpdateAction) of object;

   TDataLossCause = (dlUnknown,dlKeyViolation,dlValidityCheckFail,
                     dlFieldDeletion,dlFieldConversion);

   TDataLostEvent = procedure(Sender: TObject; Cause: TDataLossCause;
                              const ContextInfo: string;
                              var Continue: Boolean;
                              var StopAsking: Boolean) of object;

   TFilterOptimizeLevel = (foNone,foPartial,foFull);

   TKeyIndex = (kiLookup,kiRangeStart,kiRangeEnd,kiCurRangeStart,
                kiCurRangeEnd,kiSave);

   PRecInfo = ^TRecInfo;
   TRecInfo = record
      RecordNumber: Integer;
      BookmarkFlag: TBookmarkFlag;
   end;

   PKeyBuffer = ^TKeyBuffer;
   TKeyBuffer = record
      Modified: Boolean;
      FieldCount: Integer;
      Data: record
      end;
   end;

   TDBISAMDataSetUpdateObject = class(TComponent)
      protected
         function GetDataSet: TDBISAMDataSet; virtual; abstract;
         procedure SetDataSet(ADataSet: TDBISAMDataSet); virtual; abstract;
         procedure Apply(UpdateKind: TUpdateKind); virtual; abstract;
         property DataSet: TDBISAMDataSet read GetDataSet write SetDataSet;
      end;

   TDBISAMSQLUpdateObject = class(TDBISAMDataSetUpdateObject)
      protected
         function GetSQL(UpdateKind: TUpdateKind): TStrings; virtual; abstract;
      end;

   TDBISAMDataSet = class(TDBISAMBaseDataSet)
   private
      FInternalFiltered: Boolean;
      FExprFilter: Pointer;
      FFuncFilter: Pointer;
      FFilterBuffer: PChar;
      FFilterExecutionTime: double;
      FSaveFiltered: Boolean;
      FSaveInternalFiltered: Boolean;
      FSaveFilterText: string;
      FSaveFilterOptions: TFilterOptions;
      FSaveExprFilter: Pointer;
      FSaveFuncFilter: Pointer;
      FSaveFilterExecutionTime: double;
      FIndexFieldMap: TKeyFields;
      FCaseInsIndex: Boolean;
      FCanModify: Boolean;
      FKeySize: Word;
      FOldRecordBuffer: PChar;
      FKeyBuffers: array[TKeyIndex] of PKeyBuffer;
      FSaveKeyBuffers: array[TKeyIndex] of PKeyBuffer;
      FKeyBuffer: PKeyBuffer;
      FIndexFieldCount: Integer;
      FRecordSize: Word;
      FBookmarkOfs: Word;
      FRecInfoOfs: Word;
      FRecBufSize: Word;
      FAutoDisplayLabels: Boolean;
      FCopyOnAppend: Boolean;
      FOnVerifyProgress: TSteppedProgressEvent;
      FOnVerifyLog: TLogEvent;
      FOnRepairProgress: TSteppedProgressEvent;
      FOnRepairLog: TLogEvent;
      FOnUpgradeProgress: TSteppedProgressEvent;
      FOnUpgradeLog: TLogEvent;
      FOnIndexProgress: TProgressEvent;
      FOnCopyProgress: TProgressEvent;
      FOnOptimizeProgress: TProgressEvent;
      FOnAlterProgress: TProgressEvent;
      FOnDataLost: TDataLostEvent;
      FOnImportProgress: TProgressEvent;
      FOnExportProgress: TProgressEvent;
      FOnLoadFromStreamProgress: TProgressEvent;
      FOnSaveToStreamProgress: TProgressEvent;
      FRemoteReadSize: Integer;
      FCachingUpdates: Boolean;
      FCachedHandle: TDataCursor;
      FUpdateObject: TDBISAMDataSetUpdateObject;
      FOnUpdateRecord: TUpdateRecordEvent;
      FOnCachedUpdateError: TCachedUpdateErrorEvent;
      procedure InitBufferPointers(GetProps: Boolean);
      procedure AllocKeyBuffers;
      procedure SaveKeyBuffers;
      procedure RestoreKeyBuffers;
      procedure AllocOldRecordBuffer;
      procedure FreeOldRecordBuffer;
      procedure FreeKeyBuffers;
      procedure InternalSetFiltered(Value: Boolean);
      function RecordFilter(RecSize: Integer; RecBuf: Pointer;
                            RecNo: Integer): Boolean;
      function GetFilterOptimizeLevel: TFilterOptimizeLevel;
      procedure SetAutoDisplayLabels(Value: Boolean);
      procedure SetCopyOnAppend(Value: Boolean);
      function IndexProgress(PercentDone: Word): Boolean;
      function VerifyProgress(const Step: ShortString;
                              PercentDone: Word): Boolean;
      function VerifyLog(const LogMessage: ShortString): Boolean;
      function RepairProgress(const Step: ShortString;
                              PercentDone: Word): Boolean;
      function RepairLog(const LogMessage: ShortString): Boolean;
      function UpgradeProgress(const Step: ShortString;
                               PercentDone: Word): Boolean;
      function UpgradeLog(const LogMessage: ShortString): Boolean;
      function CopyProgress(PercentDone: Word): Boolean;
      function OptimizeProgress(PercentDone: Word): Boolean;
      function AlterProgress(PercentDone: Word): Boolean;
      function DataLost(Cause: Byte;
                        const ContextInfo: ShortString;
                        var Continue: Boolean;
                        var StopAsking: Boolean): Boolean;
      function ImportProgress(PercentDone: Word): Boolean;
      function ExportProgress(PercentDone: Word): Boolean;
      function LoadFromStreamProgress(PercentDone: Word): Boolean;
      function SaveToStreamProgress(PercentDone: Word): Boolean;
      procedure SetRemoteReadSize(Value: Integer);
      function GetRecordID: Integer;
      function GetRecordHash: string;
      procedure ImportData(CursorToUse: TDataCursor;
                           const FileToImport: string; Delimiter: Char;
                           ReadHeaders: Boolean=False;
                           FieldsToImport: TStrings=nil;
                           const DateFormat: string=ANSI_DATE_FORMAT;
                           const TimeFormat: string=ANSI_TIME_FORMAT;
                           DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
      procedure ExportData(CursorToUse: TDataCursor;
                           const ExportToFile: string; Delimiter: Char;
                             WriteHeaders: Boolean=False;
                           FieldsToExport: TStrings=nil;
                           const DateFormat: string=ANSI_DATE_FORMAT;
                           const TimeFormat: string=ANSI_TIME_FORMAT;
                           DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
      procedure LoadDataFromStream(CursorToUse: TDataCursor;
                                    SourceStream: TStream);
      procedure SaveDataToStream(CursorToUse: TDataCursor;
                                 DestStream: TStream);
      procedure SetUpdateObject(Value: TDBISAMDataSetUpdateObject);
      procedure EndCachedUpdates;
      function UpdateActionToByte(Value: TUpdateAction): Byte;
      function CacheErrorCallback(RecordNumber: Integer;
                                  RecordSize: Word;
                                  RecordBuffer: PChar;
                                  OldRecordBuffer: PChar;
                                  E: Exception;
                                  OperationType: Byte;
                                  Retrying: Boolean;
                                  var Response: Byte): Boolean;
   protected
      procedure SaveRangeAndFilterData; virtual;
      procedure ClearRangeAndFilterData; virtual;
      procedure RestoreRangeAndFilterData; virtual;
      procedure ActivateFilters;
      function GetActiveRecBuf(var RecBuf: PChar): Boolean; override;
      function AllocRecordBuffer: PChar; override;
      procedure CheckSetKeyMode;
      procedure ClearCalcFields(Buffer: PChar); override;
      procedure DoBeforeClose; override;
      procedure CloseCursor; override;
      procedure CloseBlob(Field: TField); override;
      function CreateHandle: TDataCursor; virtual;
      function CreateExprFilter(const Expr: string;
         Options: TFilterOptions): Pointer;
      function CreateFuncFilter(FilterFunc: Pointer): Pointer;
      procedure DeactivateFilters;
      procedure DestroyHandle; virtual;
      procedure DoOnNewRecord; override;
      function FindRecord(Restart,GoForward: Boolean): Boolean; override;
      procedure FreeRecordBuffer(var Buffer: PChar); override;
      procedure GetBookmarkData(Buffer: PChar; Data: Pointer); override;
      function GetBookmarkFlag(Buffer: PChar): TBookmarkFlag; override;
      function GetCanModify: Boolean; override;
      function GetIndexField(Index: Integer): TField;
      function GetIndexFieldCount: Integer;
      function GetIsIndexField(Field: TField): Boolean; override;
      function GetKeyBuffer(KeyIndex: TKeyIndex): PKeyBuffer;
      function GetKeyFieldCount: Integer;
      function GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean): TGetResult; override;
      function GetRecordCount: Integer; override;
      function GetFilterRecordCount: Integer; virtual;
      function GetRecNo: Integer; override;
      function GetRecordSize: Word; override;
      function GetStateFieldValue(State: TDataSetState; Field: TField): Variant; override;
      function InitKeyBuffer(Buffer: PKeyBuffer): PKeyBuffer;
      procedure InitRecord(Buffer: PChar); override;
      procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
      procedure InternalCancel; override;
      procedure InternalClose; override;
      procedure InternalDelete; override;
      procedure InternalEdit; override;
      procedure InternalFirst; override;
      procedure InternalGotoBookmark(Bookmark: TBookmark); override;
      procedure InternalHandleException; override;
      procedure InternalClearFieldDefs; virtual;
      procedure InternalInitFieldDefs; override;
      procedure InternalInitRecord(Buffer: PChar); override;
      procedure InternalLast; override;
      procedure InternalOpen; override;
      procedure InternalPost; override;
      procedure InternalRefresh; override;
      procedure InternalSetToRecord(Buffer: PChar); override;
      function IsCursorOpen: Boolean; override;
      function LocateRecord(const KeyFields: string; const KeyValues: Variant;
                            Options: TLocateOptions): Boolean;
      procedure OpenCursor(InfoQuery: Boolean); override;
      procedure PostKeyBuffer(Commit: Boolean);
      procedure PrepareCursor; virtual;
      function ResetCursorRange: Boolean;
      procedure SetBookmarkData(Buffer: PChar; Data: Pointer); override;
      procedure SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag); override;
      function SetCursorRange: Boolean;
      procedure SetBlockReadSize(Value: Integer); override;
      procedure SetFieldData(Field: TField; Buffer: Pointer); override;
      procedure SetFilterData(const Text: string; Options: TFilterOptions);
      procedure SetFilterHandle(var Filter: Pointer; Value: Pointer);
      procedure SetFiltered(Value: Boolean); override;
      procedure SetFilterOptions(Value: TFilterOptions); override;
      procedure SetFilterText(const Value: string); override;
      procedure SetIndexField(Index: Integer; Value: TField);
      procedure SetKeyBuffer(KeyIndex: TKeyIndex; Clear: Boolean);
      procedure SetKeyFieldCount(Value: Integer);
      procedure SetKeyFields(KeyIndex: TKeyIndex; const Values: array of const);
      procedure SetLinkRanges(MasterFields: TList);
      procedure SetStateFieldValue(State: TDataSetState; Field: TField; const Value: Variant); override;
      procedure SetOnFilterRecord(const Value: TFilterRecordEvent); override;
      procedure SetRecNo(Value: Integer); override;
      procedure SwitchToIndex(const IndexName: string);
      procedure SetFieldDisplayLabels; virtual;
      procedure SetFieldOrigins; virtual;
      property OnImportProgress: TProgressEvent
         read FOnImportProgress write FOnImportProgress;
      property OnExportProgress: TProgressEvent
         read FOnExportProgress write FOnExportProgress;
      property OnLoadFromStreamProgress: TProgressEvent
         read FOnLoadFromStreamProgress write FOnLoadFromStreamProgress;
      property OnSaveToStreamProgress: TProgressEvent
         read FOnSaveToStreamProgress write FOnSaveToStreamProgress;
      property OnVerifyProgress: TSteppedProgressEvent
         read FOnVerifyProgress write FOnVerifyProgress;
      property OnVerifyLog: TLogEvent read FOnVerifyLog write FOnVerifyLog;
      property OnRepairProgress: TSteppedProgressEvent
         read FOnRepairProgress write FOnRepairProgress;
      property OnRepairLog: TLogEvent read FOnRepairLog write FOnRepairLog;
      property OnUpgradeProgress: TSteppedProgressEvent
         read FOnUpgradeProgress write FOnUpgradeProgress;
      property OnUpgradeLog: TLogEvent read FOnUpgradeLog write FOnUpgradeLog;
      property OnIndexProgress: TProgressEvent
         read FOnIndexProgress write FOnIndexProgress;
      property OnCopyProgress: TProgressEvent
         read FOnCopyProgress write FOnCopyProgress;
      property OnOptimizeProgress: TProgressEvent
         read FOnOptimizeProgress write FOnOptimizeProgress;
      property OnAlterProgress: TProgressEvent
         read FOnAlterProgress write FOnAlterProgress;
      property OnDataLost: TDataLostEvent read FOnDataLost write FOnDataLost;
      { IProvider Support }
      function PSGetUpdateException(E: Exception; Prev: EUpdateError): EUpdateError; override;
      function PSIsSQLSupported: Boolean; override;
      procedure PSReset; override;
      function PSUpdateRecord(UpdateKind: TUpdateKind; Delta: TDataSet): Boolean; override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function BookmarkValid(Bookmark: TBookmark): Boolean; override;
      procedure Cancel; override;
      function CompareBookmarks(Bookmark1,Bookmark2: TBookmark): Integer; override;
      function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;
      procedure FlushBuffers;
      function GetCurrentRecord(Buffer: PChar): Boolean; override;
      function GetNextRecords: Integer; override;
      function GetPriorRecords: Integer; override;
      function GetBlobFieldData(FieldNo: Integer; var Buffer: TBlobByteData): Integer; override;
      function GetFieldData(Field: TField; Buffer: Pointer): Boolean; overload; override;
      function GetFieldData(FieldNo: Integer; Buffer: Pointer): Boolean; overload; override;
      function GetFieldClass(FieldType: TFieldType): TFieldClass; override;
      procedure GetIndexInfo;
      procedure ImportTable(const FileToImport: string; Delimiter: Char;
                            ReadHeaders: Boolean=False;
                            FieldsToImport: TStrings=nil;
                            const DateFormat: string=ANSI_DATE_FORMAT;
                            const TimeFormat: string=ANSI_TIME_FORMAT;
                            DecSeparator: Char=ANSI_DECIMAL_SEPARATOR); virtual; abstract;
      procedure ExportTable(const ExportToFile: string; Delimiter: Char;
                            WriteHeaders: Boolean=False;
                            FieldsToExport: TStrings=nil;
                            const DateFormat: string=ANSI_DATE_FORMAT;
                            const TimeFormat: string=ANSI_TIME_FORMAT;
                            DecSeparator: Char=ANSI_DECIMAL_SEPARATOR); virtual; abstract;
      procedure LoadFromStream(SourceStream: TStream); virtual; abstract;
      procedure SaveToStream(DestStream: TStream); virtual; abstract;
      function Locate(const KeyFields: string; const KeyValues: Variant;
                      Options: TLocateOptions): Boolean; override;
      function Lookup(const KeyFields: string; const KeyValues: Variant;
                      const ResultFields: string): Variant; override;
      function IsSequenced: Boolean; override;
      procedure Post; override;
      procedure BeginCachedUpdates;
      procedure ApplyCachedUpdates;
      procedure CancelCachedUpdates;
      property CachingUpdates: Boolean read FCachingUpdates;
      property FilterOptimizeLevel: TFilterOptimizeLevel read GetFilterOptimizeLevel;
      property FilterRecordCount: Integer read GetFilterRecordCount;
      property FilterExecutionTime: double read FFilterExecutionTime;
      property Handle;
      property KeySize: Word read FKeySize;
      property RemoteReadSize: Integer read FRemoteReadSize write SetRemoteReadSize;
      property RecordID: Integer read GetRecordID;
      property RecordHash: string read GetRecordHash;
      property UpdateObject: TDBISAMDataSetUpdateObject read FUpdateObject
                                                        write SetUpdateObject;
   published
      property Active;
      property AutoCalcFields;
      property AutoDisplayLabels: Boolean read FAutoDisplayLabels
                                          write SetAutoDisplayLabels;
      property CopyOnAppend: Boolean read FCopyOnAppend
                                     write SetCopyOnAppend;
      property Filter;
      property Filtered;
      property FilterOptions;
      property BeforeOpen;
      property AfterOpen;
      property BeforeClose;
      property AfterClose;
      property BeforeInsert;
      property AfterInsert;
      property BeforeEdit;
      property AfterEdit;
      property BeforePost;
      property AfterPost;
      property BeforeCancel;
      property AfterCancel;
      property BeforeDelete;
      property AfterDelete;
      property BeforeScroll;
      property AfterScroll;
      property BeforeRefresh;
      property AfterRefresh;
      property OnCalcFields;
      property OnDeleteError;
      property OnEditError;
      property OnFilterRecord;
      property OnNewRecord;
      property OnPostError;
      property OnUpdateRecord: TUpdateRecordEvent read FOnUpdateRecord
                                                  write FOnUpdateRecord;
      property OnCachedUpdateError: TCachedUpdateErrorEvent read FOnCachedUpdateError
                                                            write FOnCachedUpdateError;
   end;

   { TDBISAMDBDataSet }

   TDBFlags = set of 0..15;

   TDBISAMDBDataSet = class(TDBISAMDataSet)
   private
      FDBFlags: TDBFlags;
      FDatabase: TDBISAMDatabase;
      FDatabaseName: string;
      FSessionName: string;
      procedure CheckDBSessionName;
      function GetDBHandle: TDataDirectory;
      function GetDBSession: TDBISAMSession;
      procedure SetDatabaseName(const Value: string);
      procedure SetSessionName(const Value: string);
   protected
      procedure CloseCursor; override;
      procedure Disconnect; virtual;
      procedure OpenCursor(InfoQuery: Boolean); override;
      function SetDBFlag(Flag: Integer; Value: Boolean): Boolean; virtual;
      property DBFlags: TDBFlags read FDBFlags;
      { IProvider Support }
      procedure PSEndTransaction(Commit: Boolean); override;
      function PSExecuteStatement(const ASQL: string; AParams: TParams;
                                  ResultSet: Pointer=nil): Integer; override;
      procedure PSGetAttributes(List: TList); override;
      function PSGetQuoteChar: string; override;
      function PSInTransaction: Boolean; override;
      function PSIsSQLBased: Boolean; override;
      procedure PSStartTransaction; override;
      function PSUpdateRecord(UpdateKind: TUpdateKind; Delta: TDataSet): Boolean; override;
   public
      procedure CloseDatabase(Database: TDBISAMDatabase);
      function OpenDatabase: TDBISAMDatabase;
      property Database: TDBISAMDatabase read FDatabase;
      property DBHandle: TDataDirectory read GetDBHandle;
      property DBSession: TDBISAMSession read GetDBSession;
   published
      property DatabaseName: string read FDatabaseName write SetDatabaseName;
      property SessionName: string read FSessionName write SetSessionName;
   end;

   { TDBISAMTable }

   TDBISAMTable = class(TDBISAMDBDataSet)
   private
      FStoreDefs: Boolean;
      FAddingTableDef: Boolean;
      FClearingTableDef: Boolean;
      FFieldDefs: TDBISAMFieldDefs;
      FIndexDefs: TDBISAMIndexDefs;
      FMasterLink: TMasterDataLink;
      FExclusive: Boolean;
      FReadOnly: Boolean;
      FFieldsIndex: Boolean;
      FTableName: string;
      FIndexName: string;
      FTempStopWords: TStrings;
      FSaveMasterSource: TDataSource;
      FSaveMasterFields: string;
      procedure CheckMasterRange;
      procedure SetFieldDefs(Value: TDBISAMFieldDefs);
      procedure SetIndexDefs(Value: TDBISAMIndexDefs);
      function FieldDefsStored: Boolean;
      function GetExists: Boolean;
      function GetIndexFieldNames: string;
      function GetIndexName: string;
      procedure GetIndexParams(const IndexName: string; FieldsIndex: Boolean;
         var IndexedName: string);
      function GetMasterFields: string;
      function IndexDefsStored: Boolean;
      procedure MasterChanged(Sender: TObject);
      procedure MasterDisabled(Sender: TObject);
      function GetRanged: Boolean;
      procedure SetDataSource(Value: TDataSource);
      procedure SetExclusive(Value: Boolean);
      procedure SetIndex(const Value: string; FieldsIndex: Boolean);
      procedure SetIndexFieldNames(const Value: string);
      procedure SetIndexName(const Value: string);
      procedure SetMasterFields(const Value: string);
      procedure SetReadOnly(Value: Boolean);
      procedure SetTableLock(Lock: Boolean);
      procedure SetTableName(const Value: string);
      procedure UpdateRange;
      function GetVersionNum: string;
      function GetUserMajorVersion: Word;
      function GetUserMinorVersion: Word;
      function GetLocaleID: Integer;
      function GetEncrypted: Boolean;
      function GetPassword: string;
      function GetDescription: string;
      function GetLastUpdated: TDateTime;
      function GetEngineVersion: string;
      procedure SetEngineVersion(const Value: string);
      function GetPhysicalRecordCount: Integer;
      function GetIndexPageSize: Integer;
      function GetBlobBlockSize: Integer;
      function GetLastAutoIncValue: Integer;
      function GetTextIndexFields: string;
      function GetTextIndexStopWords: TStrings;
      function GetTextIndexSpaceChars: string;
      function GetTextIndexIncludeChars: string;
      function GetTempCursor(PerformOpen: Boolean; OpenExclusive: Boolean;
                             OpenReadOnly: Boolean): TDataCursor;
      procedure FreeTempCursor(var TempCursor: TDataCursor);
      function GetFullTableName: string;
      function GetTableSize: Int64;
      procedure CheckForMemoryTable(CreateIt: Boolean);
      procedure CheckForEmptyFieldDefs;
   protected
      function CreateHandle: TDataCursor; override;
      procedure SaveRangeAndFilterData; override;
      procedure RestoreRangeAndFilterData; override;
      procedure DataEvent(Event: TDataEvent; Info: Integer); override;
      procedure DefChanged(Sender: TObject); override;
      procedure DestroyHandle; override;
      procedure DoOnNewRecord; override;
      procedure AddFieldDefinition(var FieldNo: Integer;
                                   var Name: string; var DataType: TFieldType;
                                    var Size: Word; var Required: Boolean;
                                   var DefaultValue: string;
                                   var MinValue: string; var MaxValue: string;
                                   var Description: string;
                                   var CharCase: TFieldCharCase;
                                   var Compression: Byte); override;
      procedure EncodeFieldDefinition(var FieldDefinition: TFieldDefinition;
                                      const Name: string; DataType: TFieldType;
                                      Size: Word; Required: Boolean;
                                       const DefaultValue: string;
                                      const MinValue: string; const MaxValue: string;
                                      const Description: string;
                                      CharCase: TFieldCharCase;
                                      Compression: Byte; FieldNo: Integer);
      procedure EncodeIndexDefinition(var IndexDefinition: TIndexDefinition;
                                      const Name: string; const Fields: string;
                                      Options: TIndexOptions;
                                      const DescFields: string;
                                      Compression: TIndexCompression;
                                      NoKeyStats: Boolean);
      procedure DecodeIndexDefinition(IndexDefinition: pIndexDefinition;
                                      KeyPos: Byte; var Name: string;
                                      var Fields: string; var Options: TIndexOptions;
                                      var DescFields: string;
                                      var Compression: TIndexCompression);
      procedure AddIndexDefinition(const Name: string; const Fields: string;
                                   Options: TIndexOptions;
                                   const DescFields: string;
                                   Compression: TIndexCompression);
      function GetCanModify: Boolean; override;
      function GetDataSource: TDataSource; override;
      function GetHandle: TDataCursor;
      procedure InternalClearFieldDefs; override;
      procedure InitFieldDefs; override;
      procedure PrepareCursor; override;
      procedure UpdateIndexDefs; override;
      property MasterLink: TMasterDataLink read FMasterLink;
      { IProvider Support }
      function PSGetDefaultOrder: TIndexDef; override;
      function PSGetKeyFields: string; override;
      function PSGetTableName: string; override;
      function PSGetIndexDefs(IndexTypes: TIndexOptions): TIndexDefs; override;
      procedure PSSetCommandText(const CommandText: string); override;
      procedure PSSetParams(AParams: TParams); override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure AddIndex(const Name,Fields: string; Options: TIndexOptions=[];
                         const DescFields: string='';
                         Compression: TIndexCompression=icNone);
      procedure ApplyRange;
      procedure CancelRange;
      procedure CreateTable(NewLocaleID: Integer=0;
                            NewUserMajorVersion: Word=1;
                            NewUserMinorVersion: Word=0;
                            NewEncrypted: Boolean=False;
                            const NewPassword: string='';
                            const NewDescription: string='';
                            NewIndexPageSize: Integer=DEFAULT_PAGE_SIZE;
                            NewBlobBlockSize: Integer=DEFAULT_BLOCK_SIZE;
                            NewLastAutoIncValue: Integer=-1;
                            const NewTextIndexFields: string='';
                            NewTextIndexStopWords: TStrings=nil;
                            const NewTextIndexSpaceChars: string='';
                            const NewTextIndexIncludeChars: string='');
      procedure DeleteIndex(const Name: string);
      procedure DeleteAllIndexes;
      procedure DeleteTable;
      procedure EditKey;
      procedure EditRangeEnd;
      procedure EditRangeStart;
      procedure EmptyTable;
      function FindKey(const KeyValues: array of const): Boolean;
      procedure FindNearest(const KeyValues: array of const);
      procedure GetDetailLinkFields(MasterFields, DetailFields: TList); override;
      procedure GetIndexNames(List: TStrings);
      procedure GotoCurrent(Table: TDBISAMTable);
      function GotoKey: Boolean;
      procedure GotoNearest;
      procedure ImportTable(const FileToImport: string; Delimiter: Char;
                            ReadHeaders: Boolean=False;
                            FieldsToImport: TStrings=nil;
                            const DateFormat: string=ANSI_DATE_FORMAT;
                            const TimeFormat: string=ANSI_TIME_FORMAT;
                            DecSeparator: Char=ANSI_DECIMAL_SEPARATOR); override;
      procedure ExportTable(const ExportToFile: string; Delimiter: Char;
                            WriteHeaders: Boolean=False;
                            FieldsToExport: TStrings=nil;
                            const DateFormat: string=ANSI_DATE_FORMAT;
                            const TimeFormat: string=ANSI_TIME_FORMAT;
                            DecSeparator: Char=ANSI_DECIMAL_SEPARATOR); override;
      procedure LoadFromStream(SourceStream: TStream); override;
      procedure SaveToStream(DestStream: TStream); override;
      procedure LockTable;
      procedure RenameTable(const NewTableName: string);
      procedure CopyTable(const NewDatabaseName: string;
                          const NewTableName: string);
      procedure OptimizeTable(const OptimizeIndexName: string='';
                              SuppressBackups: Boolean=False);
      function VerifyTable: Boolean;
      function RepairTable(ForceIndexRebuild: Boolean=False): Boolean;
      procedure UpgradeTable;
      procedure AlterTable(NewLocaleID: Integer=LOCALE_ANSI_STD;
                           NewUserMajorVersion: Word=1;
                           NewUserMinorVersion: Word=0;
                           NewEncrypted: Boolean=False;
                           const NewPassword: string='';
                           const NewDescription: string='';
                           NewIndexPageSize: Integer=DEFAULT_PAGE_SIZE;
                           NewBlobBlockSize: Integer=DEFAULT_BLOCK_SIZE;
                           NewLastAutoIncValue: Integer=-1;
                           const NewTextIndexFields: string='';
                           NewTextIndexStopWords: TStrings=nil;
                           const NewTextIndexSpaceChars: string='';
                           const NewTextIndexIncludeChars: string='';
                           SuppressBackups: Boolean=False);
      procedure SetKey;
      procedure SetRange(const StartValues,EndValues: array of const);
      procedure SetRangeEnd;
      procedure SetRangeStart;
      procedure UnlockTable;
      property Exists: Boolean read GetExists;
      property FullTableName: string read GetFullTableName;
      property TableSize: Int64 read GetTableSize;
      property IndexFieldCount: Integer read GetIndexFieldCount;
      property IndexFields[Index: Integer]: TField read GetIndexField write SetIndexField;
      property KeyFieldCount: Integer read GetKeyFieldCount write SetKeyFieldCount;
      property VersionNum: string read GetVersionNum;
      property UserMajorVersion: Word read GetUserMajorVersion;
      property UserMinorVersion: Word read GetUserMinorVersion;
      property LocaleID: Integer read GetLocaleID;
      property Encrypted: Boolean read GetEncrypted;
      property Password: string read GetPassword;
      property Ranged: Boolean read GetRanged;
      property Description: string read GetDescription;
      property LastUpdated: TDateTime read GetLastUpdated;
      property PhysicalRecordCount: Integer read GetPhysicalRecordCount;
      property IndexPageSize: Integer read GetIndexPageSize;
      property BlobBlockSize: Integer read GetBlobBlockSize;
      property LastAutoIncValue: Integer read GetLastAutoIncValue;
      property TextIndexFields: string read GetTextIndexFields;
      property TextIndexStopWords: TStrings read GetTextIndexStopWords;
      property TextIndexSpaceChars: string read GetTextIndexSpaceChars;
      property TextIndexIncludeChars: string read GetTextIndexIncludeChars;
      function RecordIsLocked: Boolean;
      function TableIsLocked: Boolean;
      function LockSemaphore(Value: Integer): Boolean;
      function UnlockSemaphore(Value: Integer): Boolean;
   published
      property EngineVersion: string read GetEngineVersion write SetEngineVersion;
      property Exclusive: Boolean read FExclusive write SetExclusive default False;
      property FieldDefs: TDBISAMFieldDefs
         read FFieldDefs write SetFieldDefs stored FieldDefsStored;
      property IndexDefs: TDBISAMIndexDefs
         read FIndexDefs write SetIndexDefs stored IndexDefsStored;
      property IndexFieldNames: string read GetIndexFieldNames write SetIndexFieldNames;
      property IndexName: string read GetIndexName write SetIndexName;
      property MasterFields: string read GetMasterFields write SetMasterFields;
      property MasterSource: TDataSource read GetDataSource write SetDataSource;
      property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
      property TableName: string read FTableName write SetTableName;
      property StoreDefs: Boolean read FStoreDefs write FStoreDefs default False;
      property OnImportProgress;
      property OnExportProgress;
      property OnLoadFromStreamProgress;
      property OnSaveToStreamProgress;
      property OnVerifyProgress;
      property OnVerifyLog;
      property OnRepairProgress;
      property OnRepairLog;
      property OnUpgradeProgress;
      property OnUpgradeLog;
      property OnIndexProgress;
      property OnCopyProgress;
      property OnOptimizeProgress;
      property OnAlterProgress;
      property OnDataLost;
      property UpdateObject;
   end;

   { TDBISAMQuery }

   TSQLStatementType = (stUnknown,stSelect,stInsert,stUpdate,stDelete,
                        stCreateTable,stCreateIndex,stAlterTable,
                        stEmptyTable,stOptimizeTable,stExportTable,
                        stImportTable,stVerifyTable,stRepairTable,
                        stUpgradeTable,stDropIndex,stDropTable,
                        stRenameTable,stStartTransaction,
                        stRollbackTransaction,stCommitTransaction,
                        stBackup,stRestore);

   TDBISAMQuery = class(TDBISAMDBDataSet)
   private
      FStmtHandle: TQueryStatement;
      FPlan: TStrings;
      FSQL: TStrings;
      FGeneratePlan: Boolean;
      FPrepared: Boolean;
      FParams: TDBISAMParams;
      FPSParams: TParams;
      FText: string;
      FSQLTextPos: Integer;
      FSQLTextLine: Integer;
      FSQLTextColumn: Integer;
      FSQLLastTextLine: Integer;
      FSQLLastTextColumn: Integer;
      FSaveSQLTextPos: Integer;
      FSaveSQLTextLine: Integer;
      FSaveSQLTextColumn: Integer;
      FSaveSQLLastTextLine: Integer;
      FSaveSQLLastTextColumn: Integer;
      FDataLink: TDataLink;
      FRequestLive: Boolean;
      FMaxRowCount: Integer;
      FRowsAffected: Integer;
      FExecutionTime: double;
      FParamCheck: Boolean;
      FReadOnly: Boolean;
      FUseExistingHandle: Boolean;
      FOnQueryProgress: TAbortProgressEvent;
      FOnSaveProgress: TProgressEvent;
      FOnGetParams: TNotifyEvent;
      FBeforeExecute: TNotifyEvent;
      FAfterExecute: TNotifyEvent;
      FOnQueryError: TAbortErrorEvent;
      function GetResultIsLive: Boolean;
      function CreateCursor: TDataCursor;
      procedure FreeStatement;
      function GetQueryCursor: TDataCursor;
      procedure GetStatementHandle(SQLText: PChar);
      procedure PrepareSQL(Value: PChar);
      procedure QueryChanged(Sender: TObject);
      procedure ParseParams(CreateParams: Boolean);
      procedure ReadParamData(Reader: TReader);
      procedure RefreshParams;
      procedure SetDataSource(Value: TDataSource);
      procedure SetQuery(Value: TStrings);
      procedure SetParamsList(Value: TDBISAMParams);
      procedure SetParamsFromCursor;
      procedure SetPrepared(Value: Boolean);
      procedure SetPrepare(Value: Boolean);
      procedure SetReadOnly(Value: Boolean);
      procedure WriteParamData(Writer: TWriter);
      function GetEngineVersion: string;
      procedure SetEngineVersion(const Value: string);
      function GetStatementType: TSQLStatementType;
      function GetTableName: string;
      procedure SetMaxRowCount(Value: Integer);
      function QueryProgress(PercentDone: Word;
                             var AbortQuery: Boolean): Boolean;
      function SaveProgress(PercentDone: Word): Boolean;
      function InternalToStatementType(Internal: Byte): TSQLStatementType;
      procedure DoGetParams;
      procedure DoBeforeExecute;
      procedure DoAfterExecute;
      function DoQueryError(E: Exception; var Action: TAbortAction): Boolean;
   protected
      function CreateHandle: TDataCursor; override;
      procedure Disconnect; override;
      function GetDataSource: TDataSource; override;
      function GetCanModify: Boolean; override;
      function GetParamsCount: Word;
      function SetDBFlag(Flag: Integer; Value: Boolean): Boolean; override;
      { IProvider Support }
      procedure PSExecute; override;
      function PSGetDefaultOrder: TIndexDef; override;
      function PSGetParams: TParams; override;
      function PSGetTableName: string; override;
      procedure PSSetCommandText(const CommandText: string); override;
      procedure PSSetParams(AParams: TParams); override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure DefineProperties(Filer: TFiler); override;
      procedure ExecSQL;
      procedure GetDetailLinkFields(MasterFields, DetailFields: TList); override;
      function ParamByName(const Value: string): TDBISAMParam;
      procedure Prepare;
      procedure UnPrepare;
      property GeneratePlan: Boolean read FGeneratePlan write FGeneratePlan;
      property Plan: TStrings read FPlan;
      property Prepared: Boolean read FPrepared write SetPrepare;
      property ParamCount: Word read GetParamsCount;
      property ResultIsLive: Boolean read GetResultIsLive;
      property StmtHandle: TQueryStatement read FStmtHandle;
      property Text: string read FText;
      property SQLStatementType: TSQLStatementType read GetStatementType;
      property TableName: string read GetTableName;
      property RowsAffected: Integer read FRowsAffected;
      property ExecutionTime: Double read FExecutionTime;
      procedure SaveToTable(const NewDatabaseName: string;
                            const NewTableName: string);
      procedure ImportTable(const FileToImport: string; Delimiter: Char;
                            ReadHeaders: Boolean=False;
                            FieldsToImport: TStrings=nil;
                            const DateFormat: string=ANSI_DATE_FORMAT;
                            const TimeFormat: string=ANSI_TIME_FORMAT;
                            DecSeparator: Char=ANSI_DECIMAL_SEPARATOR); override;
      procedure ExportTable(const ExportToFile: string; Delimiter: Char;
                            WriteHeaders: Boolean=False;
                            FieldsToExport: TStrings=nil;
                            const DateFormat: string=ANSI_DATE_FORMAT;
                            const TimeFormat: string=ANSI_TIME_FORMAT;
                            DecSeparator: Char=ANSI_DECIMAL_SEPARATOR); override;
      procedure LoadFromStream(SourceStream: TStream); override;
      procedure SaveToStream(DestStream: TStream); override;
   published
      property EngineVersion: string read GetEngineVersion write SetEngineVersion;
      property DataSource: TDataSource read GetDataSource write SetDataSource;
      property ParamCheck: Boolean read FParamCheck write FParamCheck default True;
      property RequestLive: Boolean read FRequestLive write FRequestLive default False;
      property MaxRowCount: Integer read FMaxRowCount write SetMaxRowCount;
      property SQL: TStrings read FSQL write SetQuery;
      property Params: TDBISAMParams read FParams write SetParamsList;
      property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
      property OnQueryProgress: TAbortProgressEvent
         read FOnQueryProgress write FOnQueryProgress;
      property OnSaveProgress: TProgressEvent
         read FOnSaveProgress write FOnSaveProgress;
      property OnGetParams: TNotifyEvent
         read FOnGetParams write FOnGetParams;
      property BeforeExecute: TNotifyEvent
         read FBeforeExecute write FBeforeExecute;
      property AfterExecute: TNotifyEvent
         read FAfterExecute write FAfterExecute;
      property OnQueryError: TAbortErrorEvent
         read FOnQueryError write FOnQueryError;
      property OnImportProgress;
      property OnExportProgress;
      property OnLoadFromStreamProgress;
      property OnSaveToStreamProgress;
      property OnVerifyProgress;
      property OnVerifyLog;
      property OnRepairProgress;
      property OnRepairLog;
      property OnUpgradeProgress;
      property OnUpgradeLog;
      property OnIndexProgress;
      property OnCopyProgress;
      property OnOptimizeProgress;
      property OnAlterProgress;
      property OnDataLost;
      property UpdateObject;
   end;

   { TUpdateSQL }

   TDBISAMUpdateSQL = class(TDBISAMSQLUpdateObject)
      private
         FDataSet: TDBISAMDataSet;
         FQueries: array[TUpdateKind] of TDBISAMQuery;
         FSQLText: array[TUpdateKind] of TStrings;
         function GetQuery(UpdateKind: TUpdateKind): TDBISAMQuery;
         function GetSQLIndex(Index: Integer): TStrings;
         procedure SetSQL(UpdateKind: TUpdateKind; Value: TStrings);
         procedure SetSQLIndex(Index: Integer; Value: TStrings);
      protected
         function GetSQL(UpdateKind: TUpdateKind): TStrings; override;
         function GetDataSet: TDBISAMDataSet; override;
         procedure SetDataSet(ADataSet: TDBISAMDataSet); override;
         procedure SQLChanged(Sender: TObject);
      public
         constructor Create(AOwner: TComponent); override;
         destructor Destroy; override;
         procedure Apply(UpdateKind: TUpdateKind); override;
         procedure ExecSQL(UpdateKind: TUpdateKind);
         procedure SetParams(UpdateKind: TUpdateKind);
         property DataSet;
         property Query[UpdateKind: TUpdateKind]: TDBISAMQuery read GetQuery;
         property SQL[UpdateKind: TUpdateKind]: TStrings read GetSQL write SetSQL;
      published
         property ModifySQL: TStrings index 0 read GetSQLIndex write SetSQLIndex;
         property InsertSQL: TStrings index 1 read GetSQLIndex write SetSQLIndex;
         property DeleteSQL: TStrings index 2 read GetSQLIndex write SetSQLIndex;
      end;

   { TDBISAMBlobStream }

   TDBISAMBlobStream = class(TStream)
   private
      FField: TBlobField;
      FDataSet: TDBISAMBaseDataSet;
      FBuffer: PChar;
      FFieldNo: Integer;
      FOpened: Boolean;
      FModified: Boolean;
      FPosition: Integer;
      function GetBlobSize: Integer;
   protected
      procedure SetSize(NewSize: Longint); override;
   public
      constructor Create(Field: TBlobField; Mode: TBlobStreamMode);
      destructor Destroy; override;
      function Read(var Buffer; Count: Integer): Integer; override;
      function Write(const Buffer; Count: Integer): Integer; override;
      function Seek(Offset: Integer; Origin: Word): Integer; override;
      procedure Truncate;
   end;

procedure DBISAMError(ErrorCode: Integer);

function Engine: TDBISAMEngine;
function Session: TDBISAMSession;

implementation

uses DBConsts,


dbisamcr, dbisamst;

var
   FEngineUseCount: Integer=0;
   FSession: TDBISAMSession=nil;
   FEngine: TDBISAMEngine=nil;

{ TDBISAMQueryDataLink }

type
   TDBISAMQueryDataLink = class(TDetailDataLink)
   private
      FQuery: TDBISAMQuery;
   protected
      procedure ActiveChanged; override;
      procedure RecordChanged(Field: TField); override;
      function GetDetailDataSet: TDataSet; override;
      procedure CheckBrowseMode; override;
   public
      constructor Create(AQuery: TDBISAMQuery);
   end;

{ Utility routines }

function Engine: TDBISAMEngine;
begin
   Result:=FEngine;
end;

function Session: TDBISAMSession;
begin
   Result:=FSession;
end;

function DefaultDBISAMSession: TDBISAMSession;
begin
   Result:=FSession;
end;

procedure CheckTypeSize(DataType: TFieldType; Size: Word);
begin
   case DataType of
      ftString,ftFixedChar,ftWideString,ftGUID:
         begin
         if (Size >= 1) and (Size <= MAX_FIELD_SIZE) then
            Exit;
         end;
      ftBCD:
         begin
         if (Size <= 32) then
            Exit;
         end;
      ftBytes,ftVarBytes:
         begin
         if (Size > 0) and (Size <= MAX_FIELD_SIZE) then
            Exit;
         end;
      ftBlob,ftMemo,ftGraphic,ftFmtMemo,ftTypedBinary:
         begin
         if (Size=0) then
            Exit;
         end;
      else
         begin
         if (Size=0) then
            Exit;
         end;
      end;
   DatabaseError(SInvalidFieldSize);
end;

procedure DecodeFieldDefinition(FieldDefinition: pFieldDefinition;
                                var FieldNo: Integer;
                                var Name: string; var DataType: TFieldType;
                                var Size: Word; var Required: Boolean;
                                var DefaultValue: string;
                                var MinValue: string; var MaxValue: string;
                                var Description: string;
                                var CharCase: TFieldCharCase;
                                var Compression: Byte);
begin
   Name:=FieldDefinition^.FieldName;
   if (FieldDefinition^.DataType < MAX_FIELD_TYPES) then
      DataType:=DataTypeMap[FieldDefinition^.DataType]
   else
      DataType:=ftUnknown;
   Size:=0;
   case FieldDefinition^.DataType of
      TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES:
         begin
         Size:=FieldDefinition^.Length;
         case FieldDefinition^.SubType of
            SUBTYPE_FIXED:
               DataType:=ftFixedChar;
            SUBTYPE_UNICODE:
               DataType:=ftWideString;
            SUBTYPE_GUID:
               DataType:=ftGUID;
            end;
         end;
      TYPE_INT32:
         begin
         if (FieldDefinition^.SubType=SUBTYPE_AUTOINC) then
            DataType:=ftAutoInc;
         end;
      TYPE_FLOAT:
         begin
         if (FieldDefinition^.SubType=SUBTYPE_MONEY) then
            DataType:=ftCurrency;
         end;
      TYPE_BCD:
         Size:=FieldDefinition^.Decimals;
      TYPE_BLOB:
         begin
         Size:=0;
         if (FieldDefinition^.SubType >= SUBTYPE_MEMO) and
            (FieldDefinition^.SubType <= SUBTYPE_BFILE) then
            DataType:=BlobTypeMap[FieldDefinition^.SubType];
         end;
      end;
   Required:=FieldDefinition^.Required;
   DefaultValue:=FieldDefinition^.Default;
   MinValue:=FieldDefinition^.Minimum;
   MaxValue:=FieldDefinition^.Maximum;
   Description:=FieldDefinition^.Description;
   CharCase:=TFieldCharCase(FieldDefinition^.CharCase);
   Compression:=FieldDefinition^.Compression;
   FieldNo:=FieldDefinition^.FieldNum;
end;

function InternalToDatabaseRightsType(Rights: Integer): TDatabaseRights;
begin
   Result:=[];
   if IsRightSet(Rights,READ_RIGHT) then
      Include(Result,drRead);
   if IsRightSet(Rights,INSERT_RIGHT) then
      Include(Result,drInsert);
   if IsRightSet(Rights,UPDATE_RIGHT) then
      Include(Result,drUpdate);
   if IsRightSet(Rights,DELETE_RIGHT) then
      Include(Result,drDelete);
   if IsRightSet(Rights,CREATE_RIGHT) then
      Include(Result,drCreate);
   if IsRightSet(Rights,ALTER_RIGHT) then
      Include(Result,drAlter);
   if IsRightSet(Rights,DROP_RIGHT) then
      Include(Result,drDrop);
   if IsRightSet(Rights,RENAME_RIGHT) then
      Include(Result,drRename);
   if IsRightSet(Rights,MAINTAIN_RIGHT) then
      Include(Result,drMaintain);
   if IsRightSet(Rights,BACKUP_RIGHT) then
      Include(Result,drBackup);
   if IsRightSet(Rights,RESTORE_RIGHT) then
      Include(Result,drRestore);
end;

function DatabaseRightsTypeToInternal(Rights: TDatabaseRights): Integer;
begin
   Result:=0;
   if (drRead in Rights) then
      SetRight(Result,READ_RIGHT,True);
   if (drInsert in Rights) then
      SetRight(Result,INSERT_RIGHT,True);
   if (drUpdate in Rights) then
      SetRight(Result,UPDATE_RIGHT,True);
   if (drDelete in Rights) then
      SetRight(Result,DELETE_RIGHT,True);
   if (drCreate in Rights) then
      SetRight(Result,CREATE_RIGHT,True);
   if (drAlter in Rights) then
      SetRight(Result,ALTER_RIGHT,True);
   if (drDrop in Rights) then
      SetRight(Result,DROP_RIGHT,True);
   if (drRename in Rights) then
      SetRight(Result,RENAME_RIGHT,True);
   if (drMaintain in Rights) then
      SetRight(Result,MAINTAIN_RIGHT,True);
   if (drBackup in Rights) then
      SetRight(Result,BACKUP_RIGHT,True);
   if (drRestore in Rights) then
      SetRight(Result,RESTORE_RIGHT,True);
end;

function InternalToProcedureRightsType(Rights: Integer): TProcedureRights;
begin
   Result:=[];
   if IsRightSet(Rights,EXECUTE_RIGHT) then
      Include(Result,prExecute);
end;

function ProcedureRightsTypeToInternal(Rights: TProcedureRights): Integer;
begin
   Result:=0;
   if (prExecute in Rights) then 
      SetRight(Result,EXECUTE_RIGHT,True);
end;

procedure DBISAMError(ErrorCode: Integer);
begin
   raise EDBISAMEngineError.Create(ErrorCode);
end;

{ EDBISAMEngineError }

constructor EDBISAMEngineError.Create(ErrorCode: Word);
var
   Msg: array [0..MAX_ERRORMSGLEN] of Char;
begin
   inherited Create('');
   FErrorCode:=ErrorCode;
   Engine.Handle.GetErrorString(ErrorCode,@Msg);
   FErrorRemoteName:=Engine.Handle.LastErrorRemoteName;
   FErrorUserName:=Engine.Handle.LastErrorUserName;
   FErrorDatabaseName:=Engine.Handle.LastErrorDatabaseName;
   FErrorTableName:=Engine.Handle.LastErrorTableName;
   FErrorFieldName:=Engine.Handle.LastErrorFieldName;
   FErrorIndexName:=Engine.Handle.LastErrorIndexName;
   FErrorMessage:=Engine.Handle.LastErrorMessage;
   FErrorProcedureName:=Engine.Handle.LastErrorProcedureName;
   FErrorEventName:=Engine.Handle.LastErrorEventName;
   FErrorLine:=Engine.Handle.LastErrorLine;
   FErrorColumn:=Engine.Handle.LastErrorColumn;
   FOSErrorCode:=Engine.Handle.LastOSErrorNumber;
   FSocketErrorCode:=Engine.Handle.LastSocketErrorNumber;
   inherited Message:=Format(DBISAM_ERRSTR_HEADER,[FErrorCode,
                                                   String(PChar(@Msg))]);
end;

destructor EDBISAMEngineError.Destroy;
begin
   inherited Destroy;
end;

{ TDBISAMStringList }

function TDBISAMStringList.FindUsingPartials(const S: string;
                                             var Index: Integer): Boolean;
begin
   Result:=inherited FindUsingPartials(S,Index);
end;

function TDBISAMStringList.FindPartial(const S: string;
                                       var Index: Integer;
                                       PartialLength: Word): Boolean;
begin
   Result:=inherited FindPartial(S,Index,PartialLength);
end;

{ TDBISAMEngine }

procedure InitializeEngineInstance;
begin
   with Engine do
      begin
      FEngineType:=etClient;
      FEngineSignature:=DBISAM_SIGNATURE;
      FFunctions.Clear;
      FLargeFileSupport:=False;
      FFilterRecordCounts:=True;
      FLockFileName:=DEFAULT_LOCK_FILE_NAME;
      FTableDataExtension:=DATA_FILE_EXT;
      FTableIndexExtension:=INDEX_FILE_EXT;
      FTableBlobExtension:=BLOB_FILE_EXT;
      FTableDataBackupExtension:=DATA_BACKUP_FILE_EXT;
      FTableIndexBackupExtension:=INDEX_BACKUP_FILE_EXT;
      FTableBlobBackupExtension:=BLOB_BACKUP_FILE_EXT;
      FTableDataUpgradeExtension:=DATA_UPGRADE_FILE_EXT;
      FTableIndexUpgradeExtension:=INDEX_UPGRADE_FILE_EXT;
      FTableBlobUpgradeExtension:=BLOB_UPGRADE_FILE_EXT;
      FTableDataTempExtension:=DATA_TEMP_FILE_EXT;
      FTableIndexTempExtension:=INDEX_TEMP_FILE_EXT;
      FTableBlobTempExtension:=BLOB_TEMP_FILE_EXT;
      FTableFilterIndexThreshhold:=DEFAULT_FILTER_INDEX_THRESHHOLD;
      FTableReadLockWaitTime:=READ_LOCK_WAIT;
      FTableReadLockRetryCount:=READ_LOCK_RETRIES;
      FTableWriteLockWaitTime:=WRITE_LOCK_WAIT;
      FTableWriteLockRetryCount:=WRITE_LOCK_RETRIES;
      FTableTransLockWaitTime:=TRANS_LOCK_WAIT;
      FTableTransLockRetryCount:=TRANS_LOCK_RETRIES;
      FTableMaxReadLockCount:=MAX_READ_LOCK_COUNT;
      FMaxTableDataBufferSize:=DEFAULT_RECORD_BUFFER_SIZE;
      FMaxTableDataBufferCount:=DEFAULT_RECORD_BUFFER_COUNT;
      FMaxTableIndexBufferSize:=DEFAULT_PAGE_BUFFER_SIZE;
      FMaxTableIndexBufferCount:=DEFAULT_PAGE_BUFFER_COUNT;
      FMaxTableBlobBufferSize:=DEFAULT_BLOCK_BUFFER_SIZE;
      FMaxTableBlobBufferCount:=DEFAULT_BLOCK_BUFFER_COUNT;
      FServerName:=DEFAULT_SERVER_NAME;
      FServerDescription:=DEFAULT_SERVER_DESC;
      FServerMainAddress:='';
      FServerMainPort:=DEFAULT_PORT;
      FServerMainThreadCacheSize:=DEFAULT_THREAD_CACHE_SIZE;
      FServerAdminAddress:='';
      FServerAdminPort:=DEFAULT_ADMIN_PORT;
      FServerAdminThreadCacheSize:=DEFAULT_ADMIN_THREAD_CACHE_SIZE;
      FServerEncryptedOnly:=False;
      FServerEncryptionPassword:=DEFAULT_ENCRYPT_PASSWORD;
      FServerConfigFileName:=EnsureFileExt(DEFAULT_CONFIG_NAME,'',CONFIG_EXT);
      FServerConfigPassword:=DEFAULT_CONFIG_PASSWORD;
      FServerLicensedConnections:=DEFAULT_MAX_LICENSED_CONNECTIONS;
      FOnCryptoInit:=nil;
      FOnEncryptBlock:=nil;
      FOnDecryptBlock:=nil;
      FOnCryptoReset:=nil;
      FOnCompress:=nil;
      FOnDecompress:=nil;
      FOnTextIndexFilter:=nil;
      FOnTextIndexTokenFilter:=nil;
      FOnCustomFunction:=nil;
      FBeforeInsertTrigger:=nil;
      FAfterInsertTrigger:=nil;
      FOnInsertError:=nil;
      FBeforeUpdateTrigger:=nil;
      FAfterUpdateTrigger:=nil;
      FOnUpdateError:=nil;
      FBeforeDeleteTrigger:=nil;
      FAfterDeleteTrigger:=nil;
      FOnDeleteError:=nil;
      FOnServerStart:=nil;
      FOnServerStop:=nil;
      FOnServerLogEvent:=nil;
      FOnServerLogCount:=nil;
      FOnServerLogRecord:=nil;
      FOnServerConnect:=nil;
      FOnServerReconnect:=nil;
      FOnServerLogin:=nil;
      FOnServerLogout:=nil;
      FOnServerDisconnect:=nil;
      FOnServerScheduledEvent:=nil;
      FOnServerProcedure:=nil;
      end;
end;

class function TDBISAMEngine.NewInstance: TObject;
begin
   if (FEngine=nil) then
      begin
      FEngine:=TDBISAMEngine(inherited NewInstance);
      with FEngine do
         begin
         FHandle:=TDataEngine.Create;
         { Version 5 }
         { Separate step due to locale callback in Windows }
         FHandle.PopulateLocales;
         { Version 5 }
         FFunctions:=TDBISAMFunctions.Create(Engine);
         FSessions:=TThreadList.Create;
         FSessionNumbers:=TBits.Create;
         FSessionSection:=OSAllocCriticalSection;
         OSInitializeCriticalSection(FSessionSection);
         InitializeEngineInstance;
         with FHandle do
            begin
            SetGetCustomFunctionsCallback(Integer(Engine),@TDBISAMEngine.GetCustomFunctionsCallback);
            SetTriggerCallback(Integer(Engine),@TDBISAMEngine.TriggerCallback);
            SetErrorCallback(Integer(Engine),@TDBISAMEngine.ErrorCallback);
            SetServerStartCallback(Integer(Engine),@TDBISAMEngine.ServerStartCallback);
            SetServerStopCallback(Integer(Engine),@TDBISAMEngine.ServerStopCallback);
            SetServerLogEventCallback(Integer(Engine),@TDBISAMEngine.ServerLogEventCallback);
            SetServerLogCountCallback(Integer(Engine),@TDBISAMEngine.ServerLogCountCallback);
            SetServerLogRecordCallback(Integer(Engine),@TDBISAMEngine.ServerLogRecordCallback);
            SetServerConnectCallback(Integer(Engine),@TDBISAMEngine.ServerConnectCallback);
            SetServerReconnectCallback(Integer(Engine),@TDBISAMEngine.ServerReconnectCallback);
            SetServerLoginCallback(Integer(Engine),@TDBISAMEngine.ServerLoginCallback);
            SetServerLogoutCallback(Integer(Engine),@TDBISAMEngine.ServerLogoutCallback);
            SetServerDisconnectCallback(Integer(Engine),@TDBISAMEngine.ServerDisconnectCallback);
            SetServerScheduledEventCallback(Integer(Engine),@TDBISAMEngine.ServerScheduledEventCallback);
            SetServerProcedureCallback(Integer(Engine),@TDBISAMEngine.ServerProcedureCallback);
            end;
         end;
      end
   else if (FEngineUseCount=2) then
      DatabaseError(SEngineExists)
   else if (csDesigning in Engine.ComponentState) then
      begin
      Engine.SetActive(False);
      InitializeEngineInstance;
      end;
   Result:=Engine;
   Inc(FEngineUseCount);
end;

procedure TDBISAMEngine.FreeInstance;
begin
   Dec(FEngineUseCount);
   if (FEngineUseCount=0) then
      begin
      SetActive(False);
      FreeAllSessions;
      OSDeleteCriticalSection(FSessionSection);
      OSDeAllocCriticalSection(FSessionSection);
      FSessionNumbers.Free;
      FSessions.Free;
      FFunctions.Free;
      if (FHandle <> nil) then
         begin
         FHandle.Free;
         FHandle:=nil;
         end;
      FEngine:=nil;
      inherited FreeInstance;
      end;
end;

function TDBISAMEngine.GetEngineVersion: string;
begin
   Result:=ENGINE_VERSION+' Build '+ENGINE_BUILD;
end;

procedure TDBISAMEngine.SetEngineVersion(const Value: string);
begin
end;

function TDBISAMEngine.GetActive: Boolean;
begin
   Result:=FHandle.Initialized;
end;

procedure TDBISAMEngine.SetActive(Value: Boolean);
begin
   if (csReading in ComponentState) then
      FStreamedActive:=Value
   else
      begin
      if (Active <> Value) then
         begin
         if Value then
            begin
            if Assigned(FOnStartup) then
               FOnStartup(Self);
            Engine.Handle.Initialize(FLockFileName,FServerName,FServerDescription,
                                     FServerMainAddress,FServerMainPort,
                                     FServerMainThreadCacheSize,
                                     FServerAdminAddress,FServerAdminPort,
                                     FServerAdminThreadCacheSize,
                                     FServerEncryptedOnly,
                                     FServerEncryptionPassword,
                                     FServerConfigFileName,FServerConfigPassword,
                                     FServerLicensedConnections);
            FHandle.StartAdminServer;
            FHandle.StartMainServer;
            end
         else
            begin
            CloseAllSessions;
            FHandle.Reset;
            if Assigned(FOnShutdown) then
               FOnShutdown(Self);
            end;
         end;
      end;
end;

procedure TDBISAMEngine.CheckActive;
begin
   if (not FHandle.Initialized) then
      DatabaseError(SEngineNotActive);
end;

procedure TDBISAMEngine.CheckInactive;
begin
   if (not (csReading in ComponentState)) and (FHandle.Initialized) then
      DatabaseError(SEngineActive);
end;

procedure TDBISAMEngine.Loaded;
begin
   inherited Loaded;
   try
      if FStreamedActive then
         SetActive(True)
      else
         SetActive(False);
   except
      if (csDesigning in ComponentState) then
         ApplicationHandleException(Self)
      else
         raise;
   end;
end;

procedure TDBISAMEngine.SetEngineType(Value: TEngineType);
begin
   if (Value <> FEngineType) then
      begin
      CheckInactive;
      FEngineType:=Value;
      if (FEngineType=etServer) then
         FHandle.IsServer:=True
      else
         FHandle.IsServer:=False;
      end;
end;

procedure TDBISAMEngine.SetEngineSignature(const Value: string);
begin
   if (Value <> FEngineSignature) then
      begin
      CheckInactive;
      FEngineSignature:=Value;
      FHandle.Signature:=Value;
      end;
end;

procedure TDBISAMEngine.SetLargeFileSupport(Value: Boolean);
begin
   if (Value <> FLargeFileSupport) then
      begin
      CheckInactive;
      FLargeFileSupport:=Value;
      FHandle.LargeFileSupport:=Value;
      end;
end;

procedure TDBISAMEngine.SetFunctionsList(Value: TDBISAMFunctions);
begin
   FFunctions.Assign(Value);
end;

function TDBISAMEngine.QuotedSQLStr(const Value: string): string;
begin
   Result:=ConvertToLiteral(Value);
end;

function TDBISAMEngine.DateToAnsiStr(Value: TDateTime): string;
begin
   Result:=AnsiDateToStr(Value);
end;

function TDBISAMEngine.TimeToAnsiStr(Value: TDateTime; MilitaryTime: Boolean): string;
begin
   Result:=AnsiTimeToStr(Value,MilitaryTime);
end;

function TDBISAMEngine.DateTimeToAnsiStr(Value: TDateTime; MilitaryTime: Boolean): string;
begin
   Result:=AnsiDateTimeToStr(Value,MilitaryTime);
end;

function TDBISAMEngine.AnsiStrToDate(const Value: string): TDateTime;
begin
   Result:=StrToAnsiDate(Value);
end;

function TDBISAMEngine.AnsiStrToTime(const Value: string): TDateTime;
begin
   Result:=StrToAnsiTime(Value);
end;

function TDBISAMEngine.AnsiStrToDateTime(const Value: string): TDateTime;
begin
   Result:=StrToAnsiDateTime(Value);
end;

function TDBISAMEngine.BooleanToAnsiStr(Value: Boolean): string;
begin
   Result:=AnsiBooleanToStr(Value);
end;

function TDBISAMEngine.AnsiStrToBoolean(const Value: string): Boolean;
begin
   Result:=StrToAnsiBoolean(Value);
end;

function TDBISAMEngine.FloatToAnsiStr(Value: Extended): string;
begin
   Result:=AnsiFloatToStr(Value);
end;

function TDBISAMEngine.AnsiStrToFloat(const Value: string): Extended;
begin
   Result:=StrToAnsiFloat(Value);
end;

function TDBISAMEngine.CurrToAnsiStr(Value: Currency): string;
begin
   Result:=AnsiCurrToStr(Value);
end;

function TDBISAMEngine.AnsiStrToCurr(const Value: string): Currency;
begin
   Result:=StrToAnsiCurr(Value);
end;

procedure TDBISAMEngine.BuildWordList(const TableName: string; const FieldName: string;
                                      WordBuffer: string; WordList: TDBISAMStringList;
                                      const SpaceChars: string; const IncludeChars: string;
                                      Occurrences: Boolean; PartialWords: Boolean);
begin
   FHandle.BuildWordList(TableName,FieldName,PChar(WordBuffer),Length(WordBuffer),
                         WordList,
                         StringToCharSet(SpaceChars),StringToCharSet(IncludeChars),
                         Occurrences,PartialWords);
end;

procedure TDBISAMEngine.GetDefaultTextIndexParams(StopWordsList: TStrings;
                                                  var TextSpaceChars: string;
                                                  var TextIncludeChars: string);
var
   TempSpaceChars: TCharSet;
   TempIncludeChars: TCharSet;
begin
   TempSpaceChars:=StringToCharSet(TextSpaceChars);
   TempIncludeChars:=StringToCharSet(TextIncludeChars);
   FHandle.GetDefaultTextIndexParams(StopWordsList,TempSpaceChars,TempIncludeChars);
   TextSpaceChars:=CharSetToString(TempSpaceChars);
   TextIncludeChars:=CharSetToString(TempIncludeChars);
end;

procedure TDBISAMEngine.SetLockFileName(const Value: string);
begin
   if (Value <> FLockFileName) then
      begin
      CheckInactive;
      FLockFileName:=Value;
      end;
end;

procedure TDBISAMEngine.SetMaxTableDataBufferSize(Value: Integer);
begin
   if (Value <> FMaxTableDataBufferSize) then
      begin
      CheckInactive;
      if (Value < MIN_RECORD_BUFFER_SIZE) then
         Value:=MIN_RECORD_BUFFER_SIZE;
      FMaxTableDataBufferSize:=Value;
      FHandle.MaxDataBufferSize:=Value;
      end;
end;

procedure TDBISAMEngine.SetMaxTableDataBufferCount(Value: Integer);
begin
   if (Value <> FMaxTableDataBufferCount) then
      begin
      CheckInactive;
      if (Value < MIN_RECORD_BUFFER_COUNT) then
         Value:=MIN_RECORD_BUFFER_COUNT;
      FMaxTableDataBufferCount:=Value;
      FHandle.MaxDataBufferCount:=Value;
      end;
end;

procedure TDBISAMEngine.SetMaxTableIndexBufferSize(Value: Integer);
begin
   if (Value <> FMaxTableIndexBufferSize) then
      begin
      CheckInactive;
      if (Value < MIN_PAGE_BUFFER_SIZE) then
         Value:=MIN_PAGE_BUFFER_SIZE;
      FMaxTableIndexBufferSize:=Value;
      FHandle.MaxIndexBufferSize:=Value;
      end;
end;

procedure TDBISAMEngine.SetMaxTableIndexBufferCount(Value: Integer);
begin
   if (Value <> FMaxTableIndexBufferCount) then
      begin
      CheckInactive;
      if (Value < MIN_PAGE_BUFFER_COUNT) then
         Value:=MIN_PAGE_BUFFER_COUNT;
      FMaxTableIndexBufferCount:=Value;
      FHandle.MaxIndexBufferCount:=Value;
      end;
end;

procedure TDBISAMEngine.SetMaxTableBlobBufferSize(Value: Integer);
begin
   if (Value <> FMaxTableBlobBufferSize) then
      begin
      CheckInactive;
      if (Value < MIN_BLOCK_BUFFER_SIZE) then
         Value:=MIN_BLOCK_BUFFER_SIZE;
      FMaxTableBlobBufferSize:=Value;
      FHandle.MaxBlobBufferSize:=Value;
      end;
end;

procedure TDBISAMEngine.SetMaxTableBlobBufferCount(Value: Integer);
begin
   if (Value <> FMaxTableBlobBufferCount) then
      begin
      CheckInactive;
      if (Value < MIN_BLOCK_BUFFER_COUNT) then
         Value:=MIN_BLOCK_BUFFER_COUNT;
      FMaxTableBlobBufferCount:=Value;
      FHandle.MaxBlobBufferCount:=Value;
      end;
end;

procedure TDBISAMEngine.SetTableDataExtension(const Value: string);
begin
   if (Value <> FTableDataExtension) then
      begin
      CheckInactive;
      FTableDataExtension:=Value;
      if (FTableDataExtension[1] <> OSExtSeparator) then
         FTableDataExtension:=OSExtSeparator+FTableDataExtension;
      FHandle.DataExtension:=FTableDataExtension;
      end;
end;

procedure TDBISAMEngine.SetTableIndexExtension(const Value: string);
begin
   if (Value <> FTableIndexExtension) then
      begin
      CheckInactive;
      FTableIndexExtension:=Value;
      if (FTableIndexExtension[1] <> OSExtSeparator) then
         FTableIndexExtension:=OSExtSeparator+FTableIndexExtension;
      FHandle.IndexExtension:=FTableIndexExtension;
      end;
end;

procedure TDBISAMEngine.SetTableBlobExtension(const Value: string);
begin
   if (Value <> FTableBlobExtension) then
      begin
      CheckInactive;
      FTableBlobExtension:=Value;
      if (FTableBlobExtension[1] <> OSExtSeparator) then
         FTableBlobExtension:=OSExtSeparator+FTableBlobExtension;
      FHandle.BlobExtension:=FTableBlobExtension;
      end;
end;

procedure TDBISAMEngine.SetTableDataBackupExtension(const Value: string);
begin
   if (Value <> FTableDataBackupExtension) then
      begin
      CheckInactive;
      FTableDataBackupExtension:=Value;
      if (FTableDataBackupExtension[1] <> OSExtSeparator) then
         FTableDataBackupExtension:=OSExtSeparator+FTableDataBackupExtension;
      FHandle.DataBackupExtension:=FTableDataBackupExtension;
      end;
end;

procedure TDBISAMEngine.SetTableIndexBackupExtension(const Value: string);
begin
   if (Value <> FTableIndexBackupExtension) then
      begin
      CheckInactive;
      FTableIndexBackupExtension:=Value;
      if (FTableIndexBackupExtension[1] <> OSExtSeparator) then
         FTableIndexBackupExtension:=OSExtSeparator+FTableIndexBackupExtension;
      FHandle.IndexBackupExtension:=FTableIndexBackupExtension;
      end;
end;

procedure TDBISAMEngine.SetTableBlobBackupExtension(const Value: string);
begin
   if (Value <> FTableBlobBackupExtension) then
      begin
      CheckInactive;
      FTableBlobBackupExtension:=Value;
      if (FTableBlobBackupExtension[1] <> OSExtSeparator) then
         FTableBlobBackupExtension:=OSExtSeparator+FTableBlobBackupExtension;
      FHandle.BlobBackupExtension:=FTableBlobBackupExtension;
      end;
end;

procedure TDBISAMEngine.SetTableDataUpgradeExtension(const Value: string);
begin
   if (Value <> FTableDataUpgradeExtension) then
      begin
      CheckInactive;
      FTableDataUpgradeExtension:=Value;
      if (FTableDataUpgradeExtension[1] <> OSExtSeparator) then
         FTableDataUpgradeExtension:=OSExtSeparator+FTableDataUpgradeExtension;
      FHandle.DataUpgradeExtension:=FTableDataUpgradeExtension;
      end;
end;

procedure TDBISAMEngine.SetTableIndexUpgradeExtension(const Value: string);
begin
   if (Value <> FTableIndexUpgradeExtension) then
      begin
      CheckInactive;
      FTableIndexUpgradeExtension:=Value;
      if (FTableIndexUpgradeExtension[1] <> OSExtSeparator) then
         FTableIndexUpgradeExtension:=OSExtSeparator+FTableIndexUpgradeExtension;
      FHandle.IndexUpgradeExtension:=FTableIndexUpgradeExtension;
      end;
end;

procedure TDBISAMEngine.SetTableBlobUpgradeExtension(const Value: string);
begin
   if (Value <> FTableBlobUpgradeExtension) then
      begin
      CheckInactive;
      FTableBlobUpgradeExtension:=Value;
      if (FTableBlobUpgradeExtension[1] <> OSExtSeparator) then
         FTableBlobUpgradeExtension:=OSExtSeparator+FTableBlobUpgradeExtension;
      FHandle.BlobUpgradeExtension:=FTableBlobUpgradeExtension;
      end;
end;

procedure TDBISAMEngine.SetTableDataTempExtension(const Value: string);
begin
   if (Value <> FTableDataTempExtension) then
      begin
      CheckInactive;
      FTableDataTempExtension:=Value;
      if (FTableDataTempExtension[1] <> OSExtSeparator) then
         FTableDataTempExtension:=OSExtSeparator+FTableDataTempExtension;
      FHandle.DataTempExtension:=FTableDataTempExtension;
      end;
end;

procedure TDBISAMEngine.SetTableIndexTempExtension(const Value: string);
begin
   if (Value <> FTableIndexTempExtension) then
      begin
      CheckInactive;
      FTableIndexTempExtension:=Value;
      if (FTableIndexTempExtension[1] <> OSExtSeparator) then
         FTableIndexTempExtension:=OSExtSeparator+FTableIndexTempExtension;
      FHandle.IndexTempExtension:=FTableIndexTempExtension;
      end;
end;

procedure TDBISAMEngine.SetTableBlobTempExtension(const Value: string);
begin
   if (Value <> FTableBlobTempExtension) then
      begin
      CheckInactive;
      FTableBlobTempExtension:=Value;
      if (FTableBlobTempExtension[1] <> OSExtSeparator) then
         FTableBlobTempExtension:=OSExtSeparator+FTableBlobTempExtension;
      FHandle.BlobTempExtension:=FTableBlobTempExtension;
      end;
end;

procedure TDBISAMEngine.SetCreateTempTablesInDatabase(Value: Boolean);
begin
   if (Value <> FCreateTempTablesInDatabase) then
      begin
      CheckInactive;
      FCreateTempTablesInDatabase:=Value;
      FHandle.TempTablesInDataDirectory:=FCreateTempTablesInDatabase;
      end;
end;

procedure TDBISAMEngine.SetTableFilterIndexThreshhold(Value: Byte);
begin
   if (Value <> FTableFilterIndexThreshhold) then
      begin
      CheckInactive;
      if (Value <= 100) then
         FTableFilterIndexThreshhold:=Value;
      FHandle.FilterIndexThreshhold:=FTableFilterIndexThreshhold;
      end;
end;

procedure TDBISAMEngine.SetTableReadLockWaitTime(Value: Word);
begin
   if (Value <> FTableReadLockWaitTime) then
      begin
      CheckInactive;
      FTableReadLockWaitTime:=Value;
      FHandle.ReadLockWaitTime:=FTableReadLockWaitTime;
      end;
end;

procedure TDBISAMEngine.SetTableReadLockRetryCount(Value: Word);
begin
   if (Value <> FTableReadLockRetryCount) then
      begin
      CheckInactive;
      FTableReadLockRetryCount:=Value;
      FHandle.ReadLockRetries:=FTableReadLockRetryCount;
      end;
end;

procedure TDBISAMEngine.SetTableWriteLockWaitTime(Value: Word);
begin
   if (Value <> FTableWriteLockWaitTime) then
      begin
      CheckInactive;
      FTableWriteLockWaitTime:=Value;
      FHandle.WriteLockWaitTime:=FTableWriteLockWaitTime;
      end;
end;

procedure TDBISAMEngine.SetTableWriteLockRetryCount(Value: Word);
begin
   if (Value <> FTableWriteLockRetryCount) then
      begin
      CheckInactive;
      FTableWriteLockRetryCount:=Value;
      FHandle.WriteLockRetries:=FTableWriteLockRetryCount;
      end;
end;

procedure TDBISAMEngine.SetTableTransLockWaitTime(Value: Word);
begin
   if (Value <> FTableTransLockWaitTime) then
      begin
      CheckInactive;
      FTableTransLockWaitTime:=Value;
      FHandle.TransLockWaitTime:=FTableTransLockWaitTime;
      end;
end;

procedure TDBISAMEngine.SetTableTransLockRetryCount(Value: Word);
begin
   if (Value <> FTableTransLockRetryCount) then
      begin
      CheckInactive;
      FTableTransLockRetryCount:=Value;
      FHandle.TransLockRetries:=FTableTransLockRetryCount;
      end;
end;

procedure TDBISAMEngine.SetTableMaxReadLockCount(Value: Word);
begin
   if (Value <> FTableMaxReadLockCount) then
      begin
      CheckInactive;
      if (Value > 0) then
         begin
         FTableMaxReadLockCount:=Value;
         FHandle.MaxReadLockCount:=FTableMaxReadLockCount;
         end;
      end;
end;

procedure TDBISAMEngine.SetServerName(const Value: string);
begin
   if (Value <> FServerName) then
      begin
      CheckInactive;
      FServerName:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerDescription(const Value: string);
begin
   if (Value <> FServerDescription) then
      begin
      CheckInactive;
      FServerDescription:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerMainAddress(const Value: string);
begin
   if (Value <> FServerMainAddress) then
      begin
      CheckInactive;
      FServerMainAddress:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerMainPort(Value: Integer);
begin
   if (Value <> FServerMainPort) then
      begin
      CheckInactive;
      FServerMainPort:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerMainThreadCacheSize(Value: Integer);
begin
   if (Value <> FServerMainThreadCacheSize) then
      begin
      CheckInactive;
      FServerMainThreadCacheSize:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerAdminAddress(const Value: string);
begin
   if (Value <> FServerAdminAddress) then
      begin
      CheckInactive;
      FServerAdminAddress:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerAdminPort(Value: Integer);
begin
   if (Value <> FServerAdminPort) then
      begin
      CheckInactive;
      FServerAdminPort:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerAdminThreadCacheSize(Value: Integer);
begin
   if (Value <> FServerAdminThreadCacheSize) then
      begin
      CheckInactive;
      FServerAdminThreadCacheSize:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerEncryptedOnly(Value: Boolean);
begin
   if (Value <> FServerEncryptedOnly) then
      begin
      CheckInactive;
      FServerEncryptedOnly:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerEncryptionPassword(const Value: string);
begin
   if (Value <> FServerEncryptionPassword) then
      begin
      CheckInactive;
      FServerEncryptionPassword:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerConfigFileName(const Value: string);
begin
   if (Value <> FServerConfigFileName) then
      begin
      CheckInactive;
      FServerConfigFileName:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerConfigPassword(const Value: string);
begin
   if (Value <> FServerConfigPassword) then
      begin
      CheckInactive;
      FServerConfigPassword:=Value;
      end;
end;

procedure TDBISAMEngine.SetServerLicensedConnections(Value: Word);
begin
   if (Value <> FServerLicensedConnections) then
      begin
      CheckInactive;
      FServerLicensedConnections:=Value;
      end;
end;

procedure TDBISAMEngine.GetServerUserNames(List: TStrings);
begin
   CheckActive;
   FHandle.GetServerUserNames(List);
end;

procedure TDBISAMEngine.GetServerUser(const UserName: string; var UserPassword: string;
                                      var UserDescription: string;
                                      var IsAdministrator: Boolean;
                                      var MaxConnections: Word);
var
   TempPassword: ShortString;
   TempDescription: ShortString;
begin
   CheckActive;
   TempPassword:='';
   TempDescription:='';
   FHandle.GetServerUser(UserName,TempPassword,TempDescription,
                            IsAdministrator,MaxConnections);
   UserPassword:=TempPassword;
   UserDescription:=TempDescription;
end;

procedure TDBISAMEngine.AddServerUser(const UserName: string; const UserPassword: string;
                                      const UserDescription: string;
                                      IsAdministrator: Boolean=False;
                                      MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
begin
   CheckActive;
   FHandle.AddServerUser(UserName,UserPassword,UserDescription,
                         IsAdministrator,MaxConnections);
end;

procedure TDBISAMEngine.ModifyServerUser(const UserName: string; const UserPassword: string;
                                         const UserDescription: string;
                                         IsAdministrator: Boolean=False;
                                         MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
begin
   CheckActive;
   FHandle.ModifyServerUser(UserName,UserPassword,UserDescription,
                            IsAdministrator,MaxConnections);
end;

procedure TDBISAMEngine.ModifyServerUserPassword(const UserName: string;
                                                 const UserPassword: string);
begin
   CheckActive;
   FHandle.ModifyServerUserPassword(UserName,UserPassword);
end;

procedure TDBISAMEngine.DeleteServerUser(const UserName: string);
begin
   CheckActive;
   FHandle.DeleteServerUser(UserName);
end;

procedure TDBISAMEngine.GetServerDatabaseNames(List: TStrings);
begin
   CheckActive;
   FHandle.GetServerDatabaseNames(List);
end;

procedure TDBISAMEngine.GetServerDatabase(const DatabaseName: string;
                                           var DatabaseDescription: string;
                                            var ServerPath: string);
var
   TempDescription: ShortString;
   TempPath: ShortString;
begin
   CheckActive;
   TempDescription:='';
   TempPath:='';
   FHandle.GetServerDatabase(DatabaseName,TempDescription,TempPath);
   DatabaseDescription:=TempDescription;
   ServerPath:=TempPath;
end;

procedure TDBISAMEngine.AddServerDatabase(const DatabaseName: string;
                                          const DatabaseDescription: string;
                                          const ServerPath: string);
begin
   CheckActive;
   FHandle.AddServerDatabase(DatabaseName,DatabaseDescription,ServerPath);
end;

procedure TDBISAMEngine.ModifyServerDatabase(const DatabaseName: string;
                                             const DatabaseDescription: string;
                                              const ServerPath: string);
begin
   CheckActive;
   FHandle.ModifyServerDatabase(DatabaseName,DatabaseDescription,ServerPath);
end;

procedure TDBISAMEngine.DeleteServerDatabase(const DatabaseName: string);
begin
   CheckActive;
   FHandle.DeleteServerDatabase(DatabaseName);
end;

procedure TDBISAMEngine.GetServerDatabaseUserNames(const DatabaseName: string;
                                                   List: TStrings);
begin
   CheckActive;
   FHandle.GetServerDatabaseUserNames(DatabaseName,List);
end;

procedure TDBISAMEngine.GetServerDatabaseUser(const DatabaseName: string;
                                              const AuthorizedUser: string;
                                                var UserRights: TDatabaseRights);
var
   TempRights: Integer;
begin
   CheckActive;
   TempRights:=0;
   FHandle.GetServerDatabaseUser(DatabaseName,AuthorizedUser,TempRights);
   UserRights:=InternalToDatabaseRightsType(TempRights);
end;

procedure TDBISAMEngine.AddServerDatabaseUser(const DatabaseName: string;
                                                const AuthorizedUser: string;
                                                RightsToAssign: TDatabaseRights);
begin
   CheckActive;
   FHandle.AddServerDatabaseUser(DatabaseName,AuthorizedUser,
                                    DatabaseRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMEngine.ModifyServerDatabaseUser(const DatabaseName: string;
                                                 const AuthorizedUser: string;
                                                   RightsToAssign: TDatabaseRights);
begin
   CheckActive;
   FHandle.ModifyServerDatabaseUser(DatabaseName,AuthorizedUser,
                                    DatabaseRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMEngine.DeleteServerDatabaseUser(const DatabaseName: string;
                                                 const AuthorizedUser: string);
begin
   CheckActive;
   FHandle.DeleteServerDatabaseUser(DatabaseName,AuthorizedUser);
end;

procedure TDBISAMEngine.GetServerProcedureNames(List: TStrings);
begin
   CheckActive;
   FHandle.GetServerProcedureNames(List);
end;

procedure TDBISAMEngine.GetServerProcedure(const ProcedureName: string;
                                            var ProcedureDescription: string);
var
   TempDescription: ShortString;
begin
   CheckActive;
   TempDescription:='';
   FHandle.GetServerProcedure(ProcedureName,TempDescription);
   ProcedureDescription:=TempDescription;
end;

procedure TDBISAMEngine.AddServerProcedure(const ProcedureName: string;
                                           const ProcedureDescription: string);
begin
   CheckActive;
   FHandle.AddServerProcedure(ProcedureName,ProcedureDescription);
end;

procedure TDBISAMEngine.ModifyServerProcedure(const ProcedureName: string;
                                              const ProcedureDescription: string);
begin
   CheckActive;
   FHandle.ModifyServerProcedure(ProcedureName,ProcedureDescription);
end;

procedure TDBISAMEngine.DeleteServerProcedure(const ProcedureName: string);
begin
   CheckActive;
   FHandle.DeleteServerProcedure(ProcedureName);
end;

procedure TDBISAMEngine.GetServerProcedureUserNames(const ProcedureName: string;
                                                    List: TStrings);
begin
   CheckActive;
   FHandle.GetServerProcedureUserNames(ProcedureName,List);
end;

procedure TDBISAMEngine.GetServerProcedureUser(const ProcedureName: string;
                                               const AuthorizedUser: string;
                                               var UserRights: TProcedureRights);
var
   TempRights: Integer;
begin
   CheckActive;
   TempRights:=0;
   FHandle.GetServerProcedureUser(ProcedureName,AuthorizedUser,TempRights);
   UserRights:=InternalToProcedureRightsType(TempRights);
end;

procedure TDBISAMEngine.AddServerProcedureUser(const ProcedureName: string;
                                               const AuthorizedUser: string;
                                               RightsToAssign: TProcedureRights);
begin
   CheckActive;
   FHandle.AddServerProcedureUser(ProcedureName,AuthorizedUser,
                                  ProcedureRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMEngine.ModifyServerProcedureUser(const ProcedureName: string;
                                                  const AuthorizedUser: string;
                                                  RightsToAssign: TProcedureRights);
begin
   CheckActive;
   FHandle.ModifyServerProcedureUser(ProcedureName,AuthorizedUser,
                                     ProcedureRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMEngine.DeleteServerProcedureUser(const ProcedureName: string;
                                                  const AuthorizedUser: string);
begin
   CheckActive;
   FHandle.DeleteServerProcedureUser(ProcedureName,AuthorizedUser);
end;

procedure TDBISAMEngine.GetServerEventNames(List: TStrings);
begin
   CheckActive;
   FHandle.GetServerEventNames(List);
end;

procedure TDBISAMEngine.GetServerEvent(const EventName: string;
                                       var EventDescription: string;
                                       var EventRunType: TEventRunType;
                                       var EventStartDate: TDateTime;
                                       var EventEndDate: TDateTime;
                                       var EventStartTime: TDateTime;
                                       var EventEndTime: TDateTime;
                                       var EventInterval: Word;
                                       var EventDays: TEventDays;
                                       var EventDayOfMonth: TEventDayOfMonth;
                                       var EventDayOfWeek: TEventDayOfWeek;
                                       var EventMonths: TEventMonths;
                                       var EventLastRun: TDateTime);
var
   TempDescription: ShortString;
   TempDayOfWeek: Byte;
   TempDayOfMonth: Byte;
begin
   CheckActive;
   FHandle.GetServerEvent(EventName,TempDescription,
                          Byte(EventRunType),
                          EventStartDate,EventEndDate,
                          EventStartTime,EventEndTime,
                          EventInterval,
                          TConfigDays(EventDays),
                          TempDayOfMonth,
                          TempDayOfWeek,
                          TConfigMonths(EventMonths),
                          EventLastRun);
   EventDescription:=TempDescription;
   EventDayOfMonth:=TEventDayOfMonth(TempDayOfMonth-1);
   EventDayOfWeek:=TEventDayOfWeek(TempDayOfWeek-1);
end;

procedure TDBISAMEngine.AddServerEvent(const EventName: string;
                                       const EventDescription: string;
                                       EventRunType: TEventRunType;
                                       EventStartDate: TDateTime;
                                       EventEndDate: TDateTime;
                                       EventStartTime: TDateTime;
                                       EventEndTime: TDateTime;
                                       EventInterval: Word;
                                       EventDays: TEventDays;
                                       EventDayOfMonth: TEventDayOfMonth;
                                       EventDayOfWeek: TEventDayOfWeek;
                                       EventMonths: TEventMonths);
begin
   CheckActive;
   FHandle.AddServerEvent(EventName,EventDescription,
                          Byte(EventRunType),
                          EventStartDate,EventEndDate,
                          EventStartTime,EventEndTime,
                          EventInterval,
                          TConfigDays(EventDays),
                          (Byte(EventDayOfMonth)+1),
                          (Byte(EventDayOfWeek)+1),
                          TConfigMonths(EventMonths));
end;

procedure TDBISAMEngine.ModifyServerEvent(const EventName: string;
                                          const EventDescription: string;
                                          EventRunType: TEventRunType;
                                          EventStartDate: TDateTime;
                                          EventEndDate: TDateTime;
                                          EventStartTime: TDateTime;
                                          EventEndTime: TDateTime;
                                          EventInterval: Word;
                                          EventDays: TEventDays;
                                          EventDayOfMonth: TEventDayOfMonth;
                                          EventDayOfWeek: TEventDayOfWeek;
                                          EventMonths: TEventMonths);
begin
   CheckActive;
   FHandle.ModifyServerEvent(EventName,EventDescription,
                             Byte(EventRunType),
                             EventStartDate,EventEndDate,
                             EventStartTime,EventEndTime,
                             EventInterval,
                             TConfigDays(EventDays),
                             (Byte(EventDayOfMonth)+1),
                             (Byte(EventDayOfWeek)+1),
                             TConfigMonths(EventMonths));
end;

procedure TDBISAMEngine.DeleteServerEvent(const EventName: string);
begin
   CheckActive;
   FHandle.DeleteServerEvent(EventName);
end;

procedure TDBISAMEngine.GetServerConfig(var DenyLogins: Boolean; var MaxConnections: Word;
                                        var ConnectTimeout: Word; var DeadSessionInterval: Word;
                                        var DeadSessionExpires: Word; var MaxDeadSessions: Word;
                                        var TempDirectory: string;
                                        AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
var
   TempPath: ShortString;
begin
   CheckActive;
   TempPath:='';
   FHandle.GetServerConfig(DenyLogins,MaxConnections,ConnectTimeout,
                           DeadSessionInterval,DeadSessionExpires,MaxDeadSessions,
                           TempPath,AuthorizedAddresses,BlockedAddresses);
   TempDirectory:=TempPath;
end;

procedure TDBISAMEngine.ModifyServerConfig(DenyLogins: Boolean; MaxConnections: Word;
                                           ConnectTimeout: Word; DeadSessionInterval: Word;
                                           DeadSessionExpires: Word; MaxDeadSessions: Word;
                                           const TempDirectory: string;
                                           AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
begin
   CheckActive;
   FHandle.ModifyServerConfig(DenyLogins,MaxConnections,ConnectTimeout,
                              DeadSessionInterval,DeadSessionExpires,MaxDeadSessions,
                              TempDirectory,AuthorizedAddresses,BlockedAddresses);
end;

function TDBISAMEngine.GetServerLogCount: Integer;
begin
   CheckActive;
   Result:=FHandle.GetServerLogCount;
end;

function TDBISAMEngine.GetServerLogRecord(Number: Integer): TLogRecord;
var
   TempLogRecord: TDataLogRecord;
begin
   CheckActive;
   TempLogRecord:=FHandle.GetServerLogRecord(Number);
   Move(TempLogRecord,Result,SizeOf(TLogRecord));
end;

procedure TDBISAMEngine.StartAdminServer;
begin
   CheckActive;
   FHandle.StartAdminServer;
end;

procedure TDBISAMEngine.StopAdminServer;
begin
   CheckActive;
   FHandle.StopAdminServer;
end;

procedure TDBISAMEngine.StartMainServer;
begin
   CheckActive;
   FHandle.StartMainServer;
end;

procedure TDBISAMEngine.StopMainServer;
begin
   CheckActive;
   FHandle.StopMainServer;
end;

function TDBISAMEngine.GetServerUTCDateTime: TDateTime;
begin
   CheckActive;
   Result:=FHandle.GetServerUTCDateTime;
end;

function TDBISAMEngine.GetServerUpTime: Int64;
begin
   CheckActive;
   Result:=FHandle.GetServerUpTime;
end;

function TDBISAMEngine.GetServerMemoryUsage: double;
begin
   CheckActive;
   Result:=FHandle.GetServerMemoryUsage;
end;

function TDBISAMEngine.GetServerSessionCount: Integer;
begin
   CheckActive;
   Result:=FHandle.GetServerSessionCount;
end;

function TDBISAMEngine.GetServerConnectedSessionCount: Integer;
begin
   CheckActive;
   Result:=FHandle.GetServerConnectedSessionCount;
end;

function TDBISAMEngine.GetServerSessionInfo(SessionNum: Integer;
                                            var SessionID: Integer;
                                            var CreatedOn: TDateTime;
                                            var LastConnectedOn: TDateTime;
                                            var UserName: string;
                                            var UserAddress: string;
                                            var Encrypted: Boolean;
                                            var LastUserAddress: string): Boolean;
var
   TempUserName: ShortString;
   TempUserAddress: ShortString;
   TempLastAddress: ShortString;
begin
   CheckActive;
   TempUserName:='';
   TempUserAddress:='';
   TempLastAddress:='';
   Result:=FHandle.GetServerSessionInfo(SessionNum,SessionID,CreatedOn,
                                        LastConnectedOn,TempUserName,TempUserAddress,
                                        Encrypted,TempLastAddress);
   if Result then
      begin
      UserName:=TempUserName;
      UserAddress:=TempUserAddress;
      LastUserAddress:=TempLastAddress;
      end;
end;

function TDBISAMEngine.DisconnectServerSession(SessionID: Integer): Boolean;
begin
   CheckActive;
   Result:=FHandle.DisconnectServerSession(SessionID);
end;

function TDBISAMEngine.RemoveServerSession(SessionID: Integer): Boolean;
begin
   CheckActive;
   Result:=FHandle.RemoveServerSession(SessionID);
end;

function TDBISAMEngine.IsValidLocale(LocaleID: Integer): Boolean;
begin
   Result:=FHandle.IsValidLocale(LocaleID);
end;

function TDBISAMEngine.IsValidLocaleConstant(const LocaleConstant: string): Boolean;
begin
   Result:=FHandle.IsValidLocaleConstant(LocaleConstant);
end;

function TDBISAMEngine.ConvertLocaleConstantToID(const LocaleConstant: string): Integer;
begin
   Result:=FHandle.ConvertLocaleConstantToID(LocaleConstant);
end;

function TDBISAMEngine.ConvertIDToLocaleConstant(LocaleID: Integer): string;
begin
   Result:=FHandle.ConvertIDToLocaleConstant(LocaleID);
end;

procedure TDBISAMEngine.GetLocaleNames(List: TStrings);
begin
   FHandle.GetLocaleNames(List);
end;

function TDBISAMEngine.CryptoInitCallback(Key: Pointer; KeyLen: Integer;
                                          out OutData: Pointer; out OutDataBytes: Integer): Boolean;
begin
   Result:=True;
   if Assigned(FOnCryptoInit) then
      FOnCryptoInit(Self,Key,KeyLen,OutData,OutDataBytes);
end;

function TDBISAMEngine.EncryptBlockCallback(Data: Pointer; BlockBuffer: Pointer): Boolean;
begin
   Result:=True;
   if Assigned(FOnEncryptBlock) then
      FOnEncryptBlock(Self,Data,BlockBuffer);
end;

function TDBISAMEngine.DecryptBlockCallback(Data: Pointer; BlockBuffer: Pointer): Boolean;
begin
   Result:=True;
   if Assigned(FOnDecryptBlock) then
      FOnDecryptBlock(Self,Data,BlockBuffer);
end;

function TDBISAMEngine.CryptoResetCallback(Data: Pointer): Boolean;
begin
   Result:=True;
   if Assigned(FOnCryptoReset) then
      FOnCryptoReset(Self,Data);
end;

function TDBISAMEngine.CompressCallback(const InBuffer: Pointer; InBytes: Integer; Level: Byte;
                                        out OutBuffer: Pointer; out OutBytes: Integer): Boolean;
begin
   Result:=True;
   if Assigned(FOnCompress) then
      FOnCompress(Self,InBuffer,InBytes,Level,OutBuffer,OutBytes);
end;

function TDBISAMEngine.DecompressCallback(const InBuffer: Pointer; InBytes: Integer;
                                          out OutBuffer: Pointer; out OutBytes: Integer): Boolean;
begin
   Result:=True;
   if Assigned(FOnDecompress) then
      FOnDecompress(Self,InBuffer,InBytes,OutBuffer,OutBytes);
end;

function TDBISAMEngine.TextIndexFilterCallback(const TableName: ShortString;
                                               const FieldName: ShortString;
                                               var TextToIndex: string): Boolean;
begin
   Result:=True;
   if Assigned(FOnTextIndexFilter) then
      FOnTextIndexFilter(Self,TableName,FieldName,TextToIndex);
end;

function TDBISAMEngine.TextIndexTokenFilterCallback(const TableName: ShortString;
                                                    const FieldName: ShortString;
                                                    const TextIndexToken: ShortString;
                                                    var Include: Boolean): Boolean;
begin
   Result:=True;
   if Assigned(FOnTextIndexTokenFilter) then
      FOnTextIndexTokenFilter(Self,TableName,FieldName,TextIndexToken,Include);
end;

function TDBISAMEngine.CustomFunctionCallback(const FunctionName: ShortString;
                                              InParamCount: Word;
                                              const InParamDefinitions: array of pFieldDefinition;
                                              InRecordBuffer: PChar;
                                              ResultDataType: Byte;
                                              out ResultSize: Integer;
                                              out ResultBuffer: PChar): Boolean;
{ Version 5 }
var
   TempParams: TDBISAMParams;
   TempResult: Variant;
   TempResultDataType: Byte;
begin
   Result:=True;
   if Assigned(FOnCustomFunction) then
      begin
      TempParams:=TDBISAMParams.Create(Self);
      try
         TempParams.PutNativeBuffer(InParamCount,InParamDefinitions,
                                    InRecordBuffer);
         TempResult:=Null;
         FOnCustomFunction(Self,FunctionName,TempParams,TempResult);
         if (VarType(TempResult) in [varEmpty,varNull]) then
            begin
            ResultSize:=0;
            ResultBuffer:=nil;
            end
         else
            begin
            { Do this to avoid BLOB <-> string conversion }
            if (ResultDataType <> TYPE_BLOB) then
               begin
               ResultBuffer:=AllocMem((MAX_FIELD_SIZE+1));
               TempResultDataType:=TYPE_UNKNOWN;
               case VarType(TempResult) of
                  varSmallint,varByte:
                     begin
                     TempResultDataType:=TYPE_INT16;
                     ResultSize:=TYPE_INT16_SIZE;
                     pSmallInt(ResultBuffer)^:=TempResult;
                     end;
                  varInteger:
                     begin
                     TempResultDataType:=TYPE_INT32;
                     ResultSize:=TYPE_INT32_SIZE;
                     pInteger(ResultBuffer)^:=TempResult;
                     end;
                  varSingle,varDouble:
                     begin
                     TempResultDataType:=TYPE_FLOAT;
                     ResultSize:=TYPE_FLOAT_SIZE;
                     pDouble(ResultBuffer)^:=TempResult;
                     end;
                  varCurrency:
                     begin
                     TempResultDataType:=TYPE_BCD;
                     ResultSize:=TYPE_BCD_SIZE;
                     pBCD(ResultBuffer)^:=CurrToTBCD(TempResult,MAX_NUM_DECIMALS);
                     end;
                  varDate:
                     begin
                     TempResultDataType:=TYPE_TIMESTAMP;
                     ResultSize:=TYPE_TIMESTAMP_SIZE;
                     pDouble(ResultBuffer)^:=TimeStampToMSecs(DateTimeToTimeStamp(TempResult));
                     end;
                  varBoolean:
                     begin
                     TempResultDataType:=TYPE_BOOL;
                     ResultSize:=TYPE_BOOL_SIZE;
                     pWordBool(ResultBuffer)^:=VerifyWordBool(TempResult);
                     end;
                  varString:
                     begin
                     TempResultDataType:=TYPE_ZSTRING;
                     ResultSize:=(Length(String(TempResult))+1);
                     Move(PChar(String(TempResult))^,
                          ResultBuffer^,(ResultSize-1));
                     end;
                  else
                     ResultSize:=0;
                  end;
               if (TempResultDataType <> TYPE_UNKNOWN) and
                  (ResultSize <= (MAX_FIELD_SIZE+1)) then
                  begin
                  if (not ConvertExpression(TempResultDataType,ResultSize,MAX_NUM_DECIMALS,
                                            ResultDataType,GetDefaultDataSize(ResultDataType,SUBTYPE_UNKNOWN),
                                            MAX_NUM_DECIMALS,ResultBuffer)) then
                     begin
                     ResultSize:=0;
                     if (ResultBuffer <> nil) then
                        begin
                        DeAllocMem(ResultBuffer);
                        ResultBuffer:=nil;
                        end;
                     end;
                  end;
               end
            else
               begin
               if (VarType(TempResult)=varString) then
                  begin
                  ResultSize:=(Length(String(TempResult))+1);
                  ResultBuffer:=AllocMem(ResultSize);
                  Move(PChar(String(TempResult))^,
                       ResultBuffer^,(ResultSize-1));
                  end
               else
                  begin
                  ResultSize:=0;
                  ResultBuffer:=nil;
                  end;
               end;
            end;
      finally
         TempParams.Free;
      end;
      end;
end;
{ Version 5 }

function TDBISAMEngine.GetCustomFunctionsCallback(out FunctionCount: Word;
                                                  out FunctionDefinitions: array of pFunctionDefinition): Boolean;
begin
   Result:=True;
   FunctionCount:=FFunctions.GetNativeBuffer(FunctionDefinitions);
end;

function TDBISAMEngine.TriggerCallback(TriggerType: Byte;
                                       EngineSession: TObject;
                                       EngineDirectory: TObject;
                                       EngineCursor: TObject;
                                       RecordNumber: Integer;
                                       RecordBuffer: PChar;
                                       OldRecordBuffer: PChar): Boolean;
var
   TempSession: TDBISAMSession;
   TempDatabase: TDBISAMDatabase;
   TempRecord: TDBISAMRecord;
begin
   Result:=True;
   if Assigned(FBeforeInsertTrigger) or
      Assigned(FAfterInsertTrigger) or
      Assigned(FBeforeUpdateTrigger) or
      Assigned(FAfterUpdateTrigger) or
      Assigned(FBeforeDeleteTrigger) or
      Assigned(FAfterDeleteTrigger) then
      begin
      { Create the TDBISAMSession component, if necessary }
      TempSession:=TDBISAMSession(TDataSession(EngineSession).CallbackSessionObject);
      if (TempSession=nil) then
         begin
         TempSession:=TDBISAMSession.Create(nil);
         TempSession.SetHandle(TDataSession(EngineSession));
         TDataSession(EngineSession).CallbackSessionObject:=TempSession;
         end;
      { Create the TDBISAMDatabase component, if necessary }
      TempDatabase:=TDBISAMDatabase(TDataDirectory(EngineDirectory).CallbackDatabaseObject);
      if (TempDatabase=nil) then
         begin
         TempDatabase:=TDBISAMDatabase.Create(TempSession);
         TempDatabase.SetHandle(TDataDirectory(EngineDirectory));
         TDataDirectory(EngineDirectory).CallbackDatabaseObject:=TempDatabase;
         end;
      { Create the TDBISAMRecord object, if necessary }
      TempRecord:=TDBISAMRecord(TDataCursor(EngineCursor).CallbackRecordObject);
      if (TempRecord=nil) then
         begin
         TempRecord:=TDBISAMRecord.Create;
         TDataCursor(EngineCursor).CallbackRecordObject:=TempRecord;
         end;
      try
         case TriggerType of
            TRIGGER_BEFOREINSERT:
               begin
               if Assigned(FBeforeInsertTrigger) then
                  begin
                  if (not TempRecord.Updating) then
                     begin
                     TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                           OldRecordBuffer,True);
                     TempRecord.StartUpdateableTrigger;
                     end;
                  try
                     FBeforeInsertTrigger(Self,TempSession,TempDatabase,
                                          TDataCursor(EngineCursor).TableName,
                                          TempRecord);
                  except
                     if TempRecord.Updating then
                        TempRecord.EndUpdateableTrigger;
                     raise;
                  end;
                  end;
               end;
            TRIGGER_AFTERINSERT:
               begin
               if TempRecord.Updating then
                  TempRecord.EndUpdateableTrigger;
               if Assigned(FAfterInsertTrigger) then
                  begin
                  TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                        OldRecordBuffer,True);
                  FAfterInsertTrigger(Self,TempSession,TempDatabase,
                                      TDataCursor(EngineCursor).TableName,
                                      TempRecord);
                  end;
               end;
            TRIGGER_BEFOREUPDATE:
               begin
               if Assigned(FBeforeUpdateTrigger) or Assigned(FAfterUpdateTrigger) then
                  begin
                  if (TDataCursor(EngineCursor).BlobFieldCount > 0) then
                     TDataCursor(EngineCursor).CreateBlobCopies(OldRecordBuffer,True);
                  end;
               if Assigned(FBeforeUpdateTrigger) then
                  begin
                  if (not TempRecord.Updating) then
                     begin
                     TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                           OldRecordBuffer,True);
                     TempRecord.StartUpdateableTrigger;
                     end;
                  try
                     FBeforeUpdateTrigger(Self,TempSession,TempDatabase,
                                          TDataCursor(EngineCursor).TableName,
                                          TempRecord);
                  except
                     if TempRecord.Updating then
                        TempRecord.EndUpdateableTrigger;
                     raise;
                  end;
                  end;
               end;
            TRIGGER_AFTERUPDATE:
               begin
               if TempRecord.Updating then
                  TempRecord.EndUpdateableTrigger;
               if Assigned(FAfterUpdateTrigger) then
                  begin
                  TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                        OldRecordBuffer,True);
                  FAfterUpdateTrigger(Self,TempSession,TempDatabase,
                                      TDataCursor(EngineCursor).TableName,
                                      TempRecord);
                  end;
               end;
            TRIGGER_BEFOREDELETE:
               begin
               if Assigned(FBeforeDeleteTrigger) or Assigned(FAfterDeleteTrigger) then
                  begin
                  if (TDataCursor(EngineCursor).BlobFieldCount > 0) then
                     TDataCursor(EngineCursor).CreateBlobCopies(OldRecordBuffer,True);
                  end;
               if Assigned(FBeforeDeleteTrigger) then
                  begin
                  if (not TempRecord.Updating) then
                     begin
                     TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                           OldRecordBuffer,True);
                     TempRecord.StartUpdateableTrigger;
                     end;
                  try
                     FBeforeDeleteTrigger(Self,TempSession,TempDatabase,
                                          TDataCursor(EngineCursor).TableName,
                                          TempRecord);
                  except
                     if TempRecord.Updating then
                        TempRecord.EndUpdateableTrigger;
                     raise;
                  end;
                  end;
               end;
            TRIGGER_AFTERDELETE:
               begin
               if TempRecord.Updating then
                  TempRecord.EndUpdateableTrigger;
               if Assigned(FAfterDeleteTrigger) then
                  begin
                  TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                        OldRecordBuffer,True);
                  FAfterDeleteTrigger(Self,TempSession,TempDatabase,
                                      TDataCursor(EngineCursor).TableName,
                                      TempRecord);
                  end;
               end;
            end;
      except
         on E: Exception do
            begin
            { If the error is a DBISAM engine error already, then re-raise, otherwise
              make it a trigger error - DBISAM_TRIGGERERROR }
            if (E is EDBISAMEngineError) then
               raise
            else
               FHandle.RaiseError(DBISAM_TRIGGERERROR,'','','',TDataCursor(EngineCursor).ProperTableName,'','',
                                  E.Message,'','',0,0);
            end;
      end;
      end;
end;

function TDBISAMEngine.ErrorCallback(ErrorType: Byte;
                                     EngineSession: TObject;
                                     EngineDirectory: TObject;
                                     EngineCursor: TObject;
                                     RecordNumber: Integer;
                                     RecordBuffer: PChar;
                                     E: Exception; var Response: Byte): Boolean;
var
   TempSession: TDBISAMSession;
   TempDatabase: TDBISAMDatabase;
   TempRecord: TDBISAMRecord;
   TempAction: TDataAction;
begin
   Result:=True;
   TempAction:=daFail;
   if Assigned(FOnInsertError) or
      Assigned(FOnUpdateError) or
      Assigned(FOnDeleteError) then
      begin
      { Create the TDBISAMSession component, if necessary }
      TempSession:=TDBISAMSession(TDataSession(EngineSession).CallbackSessionObject);
      if (TempSession=nil) then
         begin
         TempSession:=TDBISAMSession.Create(nil);
         TempSession.SetHandle(TDataSession(EngineSession));
         TDataSession(EngineSession).CallbackSessionObject:=TempSession;
         end;
      { Create the TDBISAMDatabase component, if necessary }
      TempDatabase:=TDBISAMDatabase(TDataDirectory(EngineDirectory).CallbackDatabaseObject);
      if (TempDatabase=nil) then
         begin
         TempDatabase:=TDBISAMDatabase.Create(TempSession);
         TempDatabase.SetHandle(TDataDirectory(EngineDirectory));
         TDataDirectory(EngineDirectory).CallbackDatabaseObject:=TempDatabase;
         end;
      { Create the TDBISAMRecord object, if necessary }
      TempRecord:=TDBISAMRecord(TDataCursor(EngineCursor).CallbackRecordObject);
      if (TempRecord=nil) then
         begin
         TempRecord:=TDBISAMRecord.Create;
         TDataCursor(EngineCursor).CallbackRecordObject:=TempRecord;
         end;
      case ErrorType of
         ERROR_EVENT_INSERT:
            begin
            if Assigned(FOnInsertError) then
               begin
               if (not TempRecord.Updating) then
                  begin
                  TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                        RecordBuffer,True);
                  TempRecord.StartUpdateableTrigger;
                  end;
               FOnInsertError(Self,TempSession,TempDatabase,
                              TDataCursor(EngineCursor).TableName,
                              TempRecord,E,TempAction);
               end;
            end;
         ERROR_EVENT_UPDATE:
            begin
            if Assigned(FOnUpdateError) then
               begin
               if (not TempRecord.Updating) then
                  begin
                  TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                        RecordBuffer,True);
                  TempRecord.StartUpdateableTrigger;
                  end;
               FOnUpdateError(Self,TempSession,TempDatabase,
                              TDataCursor(EngineCursor).TableName,
                              TempRecord,E,TempAction);
               end;
            end;
         ERROR_EVENT_DELETE:
            begin
            if Assigned(FOnDeleteError) then
               begin
               if (not TempRecord.Updating) then
                  begin
                  TempRecord.Initialize(TDataCursor(EngineCursor),RecordNumber,RecordBuffer,
                                        RecordBuffer,True);
                  TempRecord.StartUpdateableTrigger;
                  end;
               FOnDeleteError(Self,TempSession,TempDatabase,
                              TDataCursor(EngineCursor).TableName,
                              TempRecord,E,TempAction);
               end;
            end;
         end;
      end
   else
      TempRecord:=TDBISAMRecord(TDataCursor(EngineCursor).CallbackRecordObject);
   Response:=Byte(TempAction);
   if (Response <> ERROR_RESPONSE_RETRY) then
      begin
      if (TempRecord <> nil) and TempRecord.Updating then
         TempRecord.EndUpdateableTrigger;
      end;
end;

procedure TDBISAMEngine.SetOnCryptoInit(Value: TCryptoInitEvent);
begin
   FOnCryptoInit:=Value;
   if Assigned(FOnCryptoInit) then
      FHandle.SetCryptoInitCallback(Integer(Self),@TDBISAMEngine.CryptoInitCallback)
   else
      FHandle.SetCryptoInitCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnEncryptBlock(Value: TEncryptBlockEvent);
begin
   FOnEncryptBlock:=Value;
   if Assigned(FOnEncryptBlock) then
      FHandle.SetEncryptBlockCallback(Integer(Self),@TDBISAMEngine.EncryptBlockCallback)
   else
      FHandle.SetEncryptBlockCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnDecryptBlock(Value: TDecryptBlockEvent);
begin
   FOnDecryptBlock:=Value;
   if Assigned(FOnDecryptBlock) then
      FHandle.SetDecryptBlockCallback(Integer(Self),@TDBISAMEngine.DecryptBlockCallback)
   else
      FHandle.SetDecryptBlockCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnCryptoReset(Value: TCryptoResetEvent);
begin
   FOnCryptoReset:=Value;
   if Assigned(FOnCryptoReset) then
      FHandle.SetCryptoResetCallback(Integer(Self),@TDBISAMEngine.CryptoResetCallback)
   else
      FHandle.SetCryptoResetCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnCompress(Value: TCompressEvent);
begin
   FOnCompress:=Value;
   if Assigned(FOnCompress) then
      FHandle.SetCompressCallback(Integer(Self),@TDBISAMEngine.CompressCallback)
   else
      FHandle.SetCompressCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnDecompress(Value: TDecompressEvent);
begin
   FOnDecompress:=Value;
   if Assigned(FOnDecompress) then
      FHandle.SetDecompressCallback(Integer(Self),@TDBISAMEngine.DecompressCallback)
   else
      FHandle.SetDecompressCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnTextIndexFilter(Value: TTextIndexFilterEvent);
begin
   FOnTextIndexFilter:=Value;
   if Assigned(FOnTextIndexFilter) then
      FHandle.SetTextIndexFilterCallback(Integer(Self),@TDBISAMEngine.TextIndexFilterCallback)
   else
      FHandle.SetTextIndexFilterCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnTextIndexTokenFilter(Value: TTextIndexTokenFilterEvent);
begin
   FOnTextIndexTokenFilter:=Value;
   if Assigned(FOnTextIndexTokenFilter) then
      FHandle.SetTextIndexTokenFilterCallback(Integer(Self),@TDBISAMEngine.TextIndexTokenFilterCallback)
   else
      FHandle.SetTextIndexTokenFilterCallback(0,nil);
end;

procedure TDBISAMEngine.SetOnCustomFunction(Value: TCustomFunctionEvent);
begin
   FOnCustomFunction:=Value;
   if Assigned(FOnCustomFunction) then
      FHandle.SetCustomFunctionCallback(Integer(Self),@TDBISAMEngine.CustomFunctionCallback)
   else
      FHandle.SetCustomFunctionCallback(0,nil);
end;

function TDBISAMEngine.ServerStartCallback: Boolean;
begin
   Result:=True;
   if Assigned(FOnServerStart) then
      FOnServerStart(Self);
end;

function TDBISAMEngine.ServerStopCallback: Boolean;
begin
   Result:=True;
   if Assigned(FOnServerStop) then
      FOnServerStop(Self);
end;

function TDBISAMEngine.ServerLogEventCallback(LogRecord: TLogRecord): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerLogEvent) then
      FOnServerLogEvent(Self,LogRecord);
end;

function TDBISAMEngine.ServerLogCountCallback(var LogCount: Integer): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerLogCount) then
      FOnServerLogCount(Self,LogCount);
end;

function TDBISAMEngine.ServerLogRecordCallback(Number: Integer;
                                               var LogRecord: TLogRecord): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerLogRecord) then
      FOnServerLogRecord(Self,Number,LogRecord);
end;

function TDBISAMEngine.ServerConnectCallback(IsEncrypted: Boolean;
                                             const ConnectAddress: ShortString;
                                             var UserData: TObject): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerConnect) then
      FOnServerConnect(Self,IsEncrypted,ConnectAddress,UserData);
end;

function TDBISAMEngine.ServerReconnectCallback(IsEncrypted: Boolean;
                                               const ConnectAddress: ShortString;
                                               UserData: TObject): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerReconnect) then
      FOnServerReconnect(Self,IsEncrypted,ConnectAddress,UserData);
end;

function TDBISAMEngine.ServerLoginCallback(const UserName: ShortString;
                                           UserData: TObject): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerLogin) then
      FOnServerLogin(Self,UserName,UserData);
end;

function TDBISAMEngine.ServerLogoutCallback(var UserData: TObject): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerLogout) then
      FOnServerLogout(Self,UserData);
end;

function TDBISAMEngine.ServerDisconnectCallback(UserData: TObject;
                                                const LastConnectAddress: ShortString): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerDisconnect) then
      FOnServerDisconnect(Self,UserData,LastConnectAddress);
end;

function TDBISAMEngine.ServerScheduledEventCallback(const EventName: ShortString;
                                                    var Completed: Boolean): Boolean;
begin
   Result:=True;
   if Assigned(FOnServerScheduledEvent) then
      FOnServerScheduledEvent(Self,EventName,Completed);
end;

function TDBISAMEngine.ServerProcedureCallback(EngineSession: TObject;
                                               const ProcedureName: ShortString;
                                               InParamCount: Word;
                                               const InParamDefinitions: array of pFieldDefinition;
                                               InRecordBuffer: PChar;
                                               out OutParamCount: Word;
                                               out OutParamDefinitions: array of pFieldDefinition;
                                               out OutRecordBuffer: PChar;
                                               out OutBlobCount: Word;
                                               out OutBlobBuffers: array of PChar): Boolean;
var
   TempSession: TDBISAMSession;
begin
   Result:=True;
   OutParamCount:=0;
   OutRecordBuffer:=nil;
   OutBlobCount:=0;
   if Assigned(FOnServerProcedure) then
      begin
      { Create the TDBISAMSession component, if necessary }
      TempSession:=TDBISAMSession(TDataSession(EngineSession).CallbackSessionObject);
      if (TempSession=nil) then
         begin
         TempSession:=TDBISAMSession.Create(nil);
         TempSession.SetHandle(TDataSession(EngineSession));
         TDataSession(EngineSession).CallbackSessionObject:=TempSession;
         end;
      with TempSession do
         RemoteParams.PutNativeBuffer(InParamCount,InParamDefinitions,
                                      InRecordBuffer);
      FOnServerProcedure(Self,TempSession,ProcedureName);
      with TempSession do
         OutParamCount:=RemoteParams.GetNativeBuffer(OutParamDefinitions,
                                                     OutRecordBuffer,
                                                     OutBlobCount,OutBlobBuffers);
      end;
end;

procedure TDBISAMEngine.AddSession(ASession: TDBISAMSession);
var
   List: TList;
begin
   List:=FSessions.LockList;
   try
      if (List.Count=0) then
         ASession.FDefault:=True;
      List.Add(ASession);
   finally
      FSessions.UnlockList;
   end;
end;

procedure TDBISAMEngine.CloseAllSessions;
var
   I: Integer;
   List: TList;
begin
   List:=FSessions.LockList;
   try
      for I:=List.Count-1 downto 0 do
         TDBISAMSession(List[I]).Active:=False;
   finally
      FSessions.UnlockList;
   end;
end;

procedure TDBISAMEngine.FreeAllSessions;
var
   I: Integer;
   List: TList;
begin
   List:=FSessions.LockList;
   try
      for I:=List.Count-1 downto 0 do
         TDBISAMSession(List[I]).Free;
   finally
      FSessions.UnlockList;
   end;
end;

function TDBISAMEngine.GetSessionCount: Integer;
var
   List: TList;
begin
   List:=FSessions.LockList;
   try
      Result:=List.Count;
   finally
      FSessions.UnlockList;
   end;
end;

function TDBISAMEngine.GetSession(Index: Integer): TDBISAMSession;
var
   List: TList;
begin
   List:=FSessions.LockList;
   try
      Result:=TDBISAMSession(List[Index]);
   finally
      FSessions.UnlockList;
   end;
end;

function TDBISAMEngine.GetSessionByName(const SessionName: string): TDBISAMSession;
begin
   if (SessionName='') then
      Result:=Session
   else
      Result:=FindSession(SessionName);
   if (Result=nil) then
      DatabaseErrorFmt(SInvalidSessionName,[SessionName]);
end;

function TDBISAMEngine.FindSession(const SessionName: string): TDBISAMSession;
var
   I: Integer;
   List: TList;
begin
   if (SessionName='') then
      Result:=Session
   else
      begin
      List:=FSessions.LockList;
      try
         for I:=0 to List.Count-1 do
            begin
            Result:=List[I];
            if AnsiCompareText(Result.SessionName,SessionName)=0 then
               Exit;
            end;
         Result:=nil;
      finally
         FSessions.UnlockList;
      end;
      end;
end;

procedure TDBISAMEngine.GetSessionNames(List: TStrings);
var
   I: Integer;
   SList: TList;
begin
   List.BeginUpdate;
   try
      List.Clear;
      SList:=FSessions.LockList;
      try
         for I:=0 to SList.Count-1 do
            begin
            with TDBISAMSession(SList[I]) do
               List.Add(SessionName);
            end;
      finally
         FSessions.UnlockList;
      end;
   finally
      List.EndUpdate;
   end;
end;

function TDBISAMEngine.GetSessionNumber: Integer;
begin
   OSEnterCriticalSection(FSessionSection);
   try
      Result:=FSessionNumbers.OpenBit;
      FSessionNumbers[Result]:=True;
   finally
      OSLeaveCriticalSection(FSessionSection);
   end;
end;

procedure TDBISAMEngine.PutSessionNumber(Value: Integer);
begin
   if (Value > -1) then
      begin
      OSEnterCriticalSection(FSessionSection);
      try
         FSessionNumbers[Value]:=False;
      finally
         OSLeaveCriticalSection(FSessionSection);
      end;
      end;
end;

function TDBISAMEngine.OpenSession(const SessionName: string): TDBISAMSession;
begin
   Result:=FindSession(SessionName);
   if (Result=nil) then
      begin
      Result:=TDBISAMSession.Create(nil);
      Result.SessionName:=SessionName;
      end;
   Result.SetActive(True);
end;

{ TDBISAMSession }

constructor TDBISAMSession.Create(AOwner: TComponent);
begin
   ValidateAutoSession(AOwner,False);
   inherited Create(AOwner);
   FSessionNumber:=-1;
   FDatabases:=TList.Create;
   Engine.AddSession(Self);
   FHandle:=nil;
   FKeepConnections:=True;
   FLockRetryCount:=DEFAULT_RECORD_LOCK_RETRIES;
   FLockWaitTime:=DEFAULT_RECORD_LOCK_WAIT;
   FLockProtocol:=lpPessimistic;
   FPrivateDir:='';
   FProgressSteps:=DEFAULT_PROGRESS_STEPS;
   FRemoteHost:='';
   FRemoteAddress:=DEFAULT_ADDRESS;
   FRemotePort:=DEFAULT_PORT;
   FRemoteService:='';
   FRemoteTrace:=False;
   FRemoteEncryptionPassword:=DEFAULT_ENCRYPT_PASSWORD;
   FRemoteTimeout:=DEFAULT_TIMEOUT;
   FRemotePing:=False;
   FRemotePingInterval:=DEFAULT_PING;
   FRemoteParams:=TDBISAMParams.Create(Self);
end;

destructor TDBISAMSession.Destroy;
begin
   SetActive(False);
   if FAutoSessionName then
      Engine.PutSessionNumber(FSessionNumber);
   Engine.FSessions.Remove(Self);
   FRemoteParams.Free;
   FDatabases.Free;
   inherited Destroy;
end;

function TDBISAMSession.GetEngineVersion: string;
begin
   Result:=ENGINE_VERSION+' Build '+ENGINE_BUILD;
end;

procedure TDBISAMSession.SetEngineVersion(const Value: string);
begin
end;

procedure TDBISAMSession.AddDatabase(Value: TDBISAMDatabase);
begin
   FDatabases.Add(Value);
end;

procedure TDBISAMSession.CheckActive;
begin
   if (not Active) then
      DatabaseError(SSessionNotActive);
end;

procedure TDBISAMSession.CheckInactive;
begin
   if Active then
      DatabaseError(SSessionActive);
end;

procedure TDBISAMSession.Close;
begin
   SetActive(False);
end;

procedure TDBISAMSession.CloseDatabase(Database: TDBISAMDatabase);
begin
   with Database do
      begin
      if (FRefCount <> 0) then
         Dec(FRefCount);
      if (FRefCount=0) and (not KeepConnection) then
         begin
         if (not Temporary) then
            Close
         else if (not (csDestroying in ComponentState)) then
            Free;
         end;
      end;
end;

procedure TDBISAMSession.DropConnections;
var
   I: Integer;
begin
   for I:=FDatabases.Count-1 downto 0 do
      begin
      with TDBISAMDatabase(FDatabases[I]) do
         begin
         if Temporary and (FRefCount=0) then
            Free;
         end;
      end;
end;

function TDBISAMSession.FindDatabase(const DatabaseName: string): TDBISAMDatabase;
var
   I: Integer;
begin
   for I:=0 to FDatabases.Count-1 do
      begin
      Result:=FDatabases[I];
      if ContainsDirectory(DatabaseName) and (not MemoryDirectory(DatabaseName)) then
         begin
         if ((Result.DatabaseName <> '') or Result.Temporary) and
            (OSCompareFileNames(Result.DatabaseName,DatabaseName)=0) then
            Exit;
         end
      else
         begin
         if ((Result.DatabaseName <> '') or Result.Temporary) and
            (AnsiCompareText(Result.DatabaseName,DatabaseName)=0) then
            Exit;
         end;
      end;
   Result:=nil;
end;

function TDBISAMSession.InternalFindDatabase(const DatabaseName: string): TDBISAMDatabase;
var
   I: Integer;
begin
   for I:=0 to FDatabases.Count-1 do
      begin
      Result:=FDatabases[I];
      if ContainsDirectory(DatabaseName) and (not MemoryDirectory(DatabaseName)) then
         begin
         if (OSCompareFileNames(Result.DatabaseName,DatabaseName)=0) then
            Exit;
         end
      else
         begin
         if (AnsiCompareText(Result.DatabaseName,DatabaseName)=0) then
            Exit;
         end;
      end;
   Result:=FindDatabase(DatabaseName);
end;

function TDBISAMSession.GetActive: Boolean;
begin
   Result:=(FHandle <> nil);
end;

function TDBISAMSession.GetDatabase(Index: Integer): TDBISAMDatabase;
begin
   Result:=FDatabases[Index];
end;

function TDBISAMSession.GetDatabaseCount: Integer;
begin
   Result:=FDatabases.Count;
end;

procedure TDBISAMSession.GetDatabaseNames(List: TStrings);
var
   I: Integer;
   Names: TStringList;
begin
   Names:=TStringList.Create;
   try
      Names.Sorted:=True;
      for I:=0 to FDatabases.Count-1 do
         begin
         with TDBISAMDatabase(FDatabases[I]) do
            begin
            if (not Temporary) then
               Names.Add(DatabaseName);
            end;
         end;
      List.Assign(Names);
   finally
      Names.Free;
   end;
end;

function TDBISAMSession.GetHandle: TDataSession;
begin
   if (FHandle=nil) then
      SetActive(True);
   Result:=FHandle;
end;

procedure TDBISAMSession.SetHandle(Value: TDataSession);
begin
   FHandle:=Value;
   FAcquiredHandle:=True;
   with FHandle do
      begin
      FSessionName:=Name;
      FPrivateDir:=PrivateDirectory;
      FStrictChangeDetection:=StrictChangeDetection;
      FForceBufferFlush:=ForceBufferFlush;
      FLockRetryCount:=LockRetries;
      FLockWaitTime:=LockWait;
      FLockProtocol:=TLockProtocol(LockProtocol);
      FProgressSteps:=Progress;
      SetPasswordCallback(Integer(Self),@TDBISAMSession.GetPasswordCallback);
      end;
end;

procedure TDBISAMSession.GetTableNames(const DatabaseName: string; List: TStrings);
var
   Database: TDBISAMDatabase;
begin
   List.BeginUpdate;
   try
      List.Clear;
      Database:=OpenDatabase(DatabaseName);
      try
         if (Database <> nil) and (Database.Handle <> nil) then
            Database.Handle.ListTableNames(List);
      finally
         CloseDatabase(Database);
      end;
   finally
      List.EndUpdate;
   end;
end;

procedure TDBISAMSession.Loaded;
begin
   inherited Loaded;
   try
      if AutoSessionName then
         SetSessionNames;
      if FStreamedActive then
         SetActive(True);
   except
      if (csDesigning in ComponentState) then
         ApplicationHandleException(Self)
      else
         raise;
   end;
end;

procedure TDBISAMSession.Notification(AComponent: TComponent; Operation: TOperation);
begin
   inherited Notification(AComponent,Operation);
   if AutoSessionName and (Operation=opInsert) then
      begin
      if (AComponent is TDBISAMDBDataSet) then
         TDBISAMDBDataSet(AComponent).FSessionName:=Self.SessionName
      else if (AComponent is TDBISAMDatabase) then
         TDBISAMDatabase(AComponent).FSession:=Self;
      end;
end;

procedure TDBISAMSession.Open;
begin
   SetActive(True);
end;

function TDBISAMSession.OpenDatabase(const DatabaseName: string): TDBISAMDatabase;
var
   TempDatabase: TDBISAMDatabase;
begin
   TempDatabase:=nil;
   SetActive(True);
   try
      Result:=InternalFindDatabase(DatabaseName);
      if (Result=nil) then
         begin
         TempDatabase:=TDBISAMDatabase.Create(Self);
         TempDatabase.Temporary:=True;
         TempDatabase.DatabaseName:=DatabaseName;
         if (FSessionType=stRemote) then
            TempDatabase.RemoteDatabase:=DatabaseName
         else if ContainsDirectory(DatabaseName) and
                 (not MemoryDirectory(DatabaseName)) then
            TempDatabase.Directory:=DatabaseName;
         TempDatabase.KeepConnection:=FKeepConnections;
         Result:=TempDatabase;
         end;
      Result.Open;
      Inc(Result.FRefCount);
   except
      TempDatabase.Free;
      raise;
   end;
end;

function TDBISAMSession.SessionNameStored: Boolean;
begin
   Result:=(not FAutoSessionName);
end;

procedure TDBISAMSession.RemoveDatabase(Value: TDBISAMDatabase);
begin
   FDatabases.Remove(Value);
end;

procedure TDBISAMSession.SetActive(Value: Boolean);
begin
   if (csReading in ComponentState) then
      FStreamedActive:=Value
   else
      begin
      if (Active <> Value) then
         StartSession(Value);
      end;
end;

procedure TDBISAMSession.SetAutoSessionName(Value: Boolean);
begin
   if (Value <> FAutoSessionName) then
      begin
      if Value then
         begin
         CheckInActive;
         ValidateAutoSession(Owner,True);
         FSessionNumber:=Engine.GetSessionNumber;
         UpdateAutoSessionName;
         end
      else
         Engine.PutSessionNumber(FSessionNumber);
      FAutoSessionName:=Value;
      end;
end;

procedure TDBISAMSession.SetName(const NewName: TComponentName);
begin
   inherited SetName(NewName);
   if FAutoSessionName then
      UpdateAutoSessionName;
end;

procedure TDBISAMSession.SetPrivateDir(const Value: string);
begin
   if Active then
      begin
      if (Value <> FPrivateDir) then
         begin
         FPrivateDir:=Value;
         if (FHandle <> nil) then
            FHandle.PrivateDirectory:=FPrivateDir;
         end;
      end
   else
      FPrivateDir:=Value;
end;

procedure TDBISAMSession.SetProgressSteps(Value: Word);
begin
   if (Value > MAX_PROGRESS_STEPS) then
      Exit;
   if Active then
      begin
      if (Value <> FProgressSteps) then
         begin
         FProgressSteps:=Value;
         if (FHandle <> nil) then
            FHandle.Progress:=FProgressSteps;
         end;
      end
   else
      FProgressSteps:=Value;
end;

procedure TDBISAMSession.SetSessionName(const Value: string);
var
   TempSession: TDBISAMSession;
begin
   if (Value <> FSessionName) then
      begin
      if FAutoSessionName and (not FUpdatingAutoSessionName) then
         DatabaseError(SAutoSessionActive);
      CheckInActive;
      if (Value <> '') then
         begin
         TempSession:=Engine.FindSession(Value);
         if (not ((TempSession=nil) or (TempSession=Self))) then
            DatabaseErrorFmt(SDuplicateSessionName,[Value]);
         end;
      FSessionName:=Value
      end;
end;

procedure TDBISAMSession.SetSessionNames;
var
   I: Integer;
   Component: TComponent;
begin
   if Owner <> nil then
      begin
      for I:=0 to Owner.ComponentCount-1 do
         begin
         Component:=Owner.Components[I];
         if (Component is TDBISAMDBDataSet) and
            (AnsiCompareText(TDBISAMDBDataSet(Component).SessionName,Self.SessionName) <> 0) then
            TDBISAMDBDataSet(Component).SessionName:=Self.SessionName
         else if (Component is TDBISAMDataBase) and
            (AnsiCompareText(TDBISAMDatabase(Component).SessionName,Self.SessionName) <> 0) then
            TDBISAMDataBase(Component).SessionName:=Self.SessionName;
         end;
      end;
end;

procedure TDBISAMSession.StartSession(Value: Boolean);
var
   I: Integer;
begin
   if Value then
      begin
      if (Engine.EngineType=etServer) and (FSessionType=stRemote) then
         DatabaseError(SServerEngineSession);
      Engine.Active:=True;
      if Assigned(FOnStartup) then
         FOnStartup(Self);
      if (FSessionName='') then
         DatabaseError(SSessionNameMissing);
      if (DefaultDBISAMSession <> Self) then
         DefaultDBISAMSession.Active:=True;
      Engine.Handle.StartDataSession(FHandle);
      try
         with FHandle do
            begin
            Name:=FSessionName+'_'+IntToStr(Integer(Self));
            PrivateDirectory:=FPrivateDir;
            StrictChangeDetection:=FStrictChangeDetection;
            ForceBufferFlush:=FForceBufferFlush;
            LockRetries:=FLockRetryCount;
            LockWait:=FLockWaitTime;
            LockProtocol:=Byte(FLockProtocol);
            Progress:=FProgressSteps;
            SetPasswordCallback(Integer(Self),@TDBISAMSession.GetPasswordCallback);
            InsideEngine:=True;
            if (FSessionType=stLocal) then
               IsRemote:=False
            else
               begin
               IsEncrypted:=FRemoteEncryption;
               EncryptPassword:=FRemoteEncryptionPassword;
               Compression:=FRemoteCompression;
               Host:=FRemoteHost;
               Address:=FRemoteAddress;
               Port:=FRemotePort;
               Service:=FRemoteService;
               Tracing:=FRemoteTrace;
               UserName:=FRemoteUser;
               Password:=FRemotePassword;
               Timeout:=FRemoteTimeout;
               Ping:=FRemotePing;
               PingInterval:=FRemotePingInterval;
               IsRemote:=True;
               Connect;
               SetSendCallback(Integer(Self),@TDBISAMSession.RemoteSendProgressCallback);
               SetReceiveCallback(Integer(Self),@TDBISAMSession.RemoteReceiveProgressCallback);
               SetTraceCallback(Integer(Self),@TDBISAMSession.RemoteTraceCallback);
               SetTimeoutCallback(Integer(Self),@TDBISAMSession.RemoteTimeoutCallback);
               SetReconnectCallback(Integer(Self),@TDBISAMSession.RemoteReconnectCallback);
               SetLoginCallback(Integer(Self),@TDBISAMSession.RemoteLoginCallback);
               SetProcedureProgressCallback(Integer(Self),@TDBISAMSession.RemoteProcedureProgressCallback);
               try
                  Login;
                  SetSessionParams;
               finally
                  SetLoginCallback(0,nil);
               end;
               end;
            end;
      except
         StartSession(False);
         raise;
      end;
      end
   else
      begin
      for I:=FDatabases.Count-1 downto 0 do
         begin
         with TDBISAMDatabase(FDatabases[I]) do
            begin
            if Temporary then
               Free
            else
               Close;
            end;
         end;
      if (not FAcquiredHandle) then
         begin
         if (FSessionType=stRemote) then
            begin
            if (FHandle <> nil) then
               begin
               with FHandle do
                  begin
                  Logout;
                  SetSendCallback(0,nil);
                  SetReceiveCallback(0,nil);
                  SetTraceCallback(0,nil);
                  SetTimeoutCallback(0,nil);
                  SetReconnectCallback(0,nil);
                  SetLoginCallback(0,nil);
                  SetProcedureProgressCallback(0,nil);
                  end;
               end;
            end;
         Engine.Handle.CloseDataSession(FHandle);
         end
      else
         FAcquiredHandle:=False;
      FHandle:=nil;
      if Assigned(FOnShutdown) then
         FOnShutdown(Self);
      end;
end;

procedure TDBISAMSession.UpdateAutoSessionName;
begin
   FUpdatingAutoSessionName:=True;
   try
      SessionName:=Format('%s_%d',[Name,FSessionNumber+1]);
   finally
      FUpdatingAutoSessionName:=False;
   end;
   SetSessionNames;
end;

procedure TDBISAMSession.ValidateAutoSession(AOwner: TComponent; AllSessions: Boolean);
var
   I: Integer;
   Component: TComponent;
begin
   if (AOwner <> nil) then
      begin
      for I:=0 to AOwner.ComponentCount-1 do
         begin
         Component:=AOwner.Components[I];
         if (Component <> Self) and (Component is TDBISAMSession) then
            begin
            if AllSessions then
               DatabaseError(SAutoSessionExclusive)
            else if TDBISAMSession(Component).AutoSessionName then
               DatabaseErrorFmt(SAutoSessionExists,[Component.Name]);
            end;
         end;
      end;
end;

procedure TDBISAMSession.AddPassword(const Password: string);
begin
   CheckActive;
   FHandle.AddPassword(Password);
end;

procedure TDBISAMSession.RemoveAllPasswords;
begin
   CheckActive;
   FHandle.DeleteAllPasswords;
end;

procedure TDBISAMSession.RemovePassword(const Password: string);
begin
   CheckActive;
   FHandle.DeletePassword(Password);
end;

function TDBISAMSession.GetPasswordCallback: Boolean;
begin
   Result:=GetPassword;
end;

function TDBISAMSession.GetPassword: Boolean;
begin
   if Assigned(FOnPassword) then
      begin
      Result:=False;
      FOnPassword(Self,Result);
      end
   else
      begin
      if (Engine.EngineType=etServer) then
         Result:=False
      else if Assigned(DB.PasswordDialog) then
         Result:=DB.PasswordDialog(Self as IDBSession)
      else
         Result:=False;
      end
end;

procedure TDBISAMSession.SetForceBufferFlush(Value: Boolean);
begin
   if Active then
      begin
      if (Value <> FForceBufferFlush) then
         begin
         FForceBufferFlush:=Value;
         if (FHandle <> nil) then
            FHandle.ForceBufferFlush:=FForceBufferFlush;
         end;
      end
   else
      FForceBufferFlush:=Value;
end;

procedure TDBISAMSession.SetLockRetryCount(Value: Byte);
begin
   if Active then
      begin
      if (Value <> FLockRetryCount) then
         begin
         FLockRetryCount:=Value;
         if (FHandle <> nil) then
            FHandle.LockRetries:=FLockRetryCount;
         end;
      end
   else
      FLockRetryCount:=Value;
end;

procedure TDBISAMSession.SetLockWaitTime(Value: Word);
begin
   if Active then
      begin
      if (Value <> FLockWaitTime) then
         begin
         FLockWaitTime:=Value;
         if (FHandle <> nil) then
            FHandle.LockWait:=FLockWaitTime;
         end;
      end
   else
      FLockWaitTime:=Value;
end;

procedure TDBISAMSession.SetLockProtocol(Value: TLockProtocol);
begin
   if Active then
      begin
      if (Value <> FLockProtocol) then
         begin
         FLockProtocol:=Value;
         if (FHandle <> nil) then
            FHandle.LockProtocol:=Byte(FLockProtocol);
         end;
      end
   else
      FLockProtocol:=Value;
end;

procedure TDBISAMSession.SetStrictChangeDetection(Value: Boolean);
begin
   if Active then
      begin
      if (Value <> FStrictChangeDetection) then
         begin
         FStrictChangeDetection:=Value;
         if (FHandle <> nil) then
            FHandle.StrictChangeDetection:=FStrictChangeDetection;
         end;
      end
   else
      FStrictChangeDetection:=Value;
end;

procedure TDBISAMSession.SetSessionType(Value: TSessionType);
begin
   if (Value <> FSessionType) then
      begin
      CheckInactive;
      FSessionType:=Value;
      end;
end;

procedure TDBISAMSession.SetRemoteEncryption(Value: Boolean);
begin
   if (Value <> FRemoteEncryption) then
      begin
      CheckInactive;
      FRemoteEncryption:=Value;
      end;
end;

procedure TDBISAMSession.SetRemoteEncryptionPassword(const Value: string);
begin
   if (Value <> FRemoteEncryptionPassword) then
      begin
      CheckInactive;
      FRemoteEncryptionPassword:=Value;
      end;
end;

procedure TDBISAMSession.SetRemoteCompression(Value: Byte);
begin
   if Active then
      begin
      if (Value <> FRemoteCompression) then
         begin
         FRemoteCompression:=Value;
         if (FHandle <> nil) then
            FHandle.Compression:=RemoteCompression;
         end;
      end
   else
      FRemoteCompression:=Value;
end;

procedure TDBISAMSession.SetRemoteHost(const Value: string);
begin
   if (Value <> FRemoteHost) then
      begin
      CheckInactive;
      FRemoteHost:=Value;
      end;
end;

procedure TDBISAMSession.SetRemoteAddress(const Value: string);
begin
   if (Value <> FRemoteAddress) then
      begin
      CheckInactive;
      FRemoteAddress:=Value;
      end;
end;

procedure TDBISAMSession.SetRemotePort(Value: Integer);
begin
   if (Value <> FRemotePort) then
      begin
      CheckInactive;
      FRemotePort:=Value;
      end;
end;

procedure TDBISAMSession.SetRemoteService(const Value: string);
begin
   if (Value <> FRemoteService) then
      begin
      CheckInactive;
      FRemoteService:=Value;
      end;
end;

procedure TDBISAMSession.SetRemoteTrace(Value: Boolean);
begin
   if Active then
      begin
      if (Value <> FRemoteTrace) then
         begin
         FRemoteTrace:=Value;
         if (FHandle <> nil) then
            FHandle.Tracing:=FRemoteTrace;
         end;
      end
   else
      FRemoteTrace:=Value;
end;

procedure TDBISAMSession.SetRemoteUser(const Value: string);
begin
   if (Value <> FRemoteUser) then
      begin
      CheckInactive;
      FRemoteUser:=Value;
      end;
end;

procedure TDBISAMSession.SetRemotePassword(const Value: string);
begin
   if (Value <> FRemotePassword) then
      begin
      CheckInactive;
      FRemotePassword:=Value;
      end;
end;

procedure TDBISAMSession.SetRemoteTimeout(Value: Word);
begin
   if (Value < MIN_TIMEOUT) then
      Value:=MIN_TIMEOUT;
   if Active then
      begin
      if (Value <> FRemoteTimeout) then
         begin
         FRemoteTimeout:=Value;
         if (FHandle <> nil) then
            FHandle.Timeout:=FRemoteTimeout;
         end;
      end
   else
      FRemoteTimeout:=Value;
end;

procedure TDBISAMSession.SetRemotePing(Value: Boolean);
begin
   if Active then
      begin
      if (Value <> FRemotePing) then
         begin
         FRemotePing:=Value;
         if (FHandle <> nil) then
            FHandle.Ping:=FRemotePing;
         end;
      end
   else
      FRemotePing:=Value;
end;

procedure TDBISAMSession.SetRemotePingInterval(Value: Word);
begin
   if (Value < MIN_PING) then
      Value:=MIN_PING;
   if Active then
      begin
      if (Value <> FRemotePingInterval) then
         begin
         FRemotePingInterval:=Value;
         if (FHandle <> nil) then
            FHandle.PingInterval:=FRemotePingInterval;
         end;
      end
   else
      FRemotePingInterval:=Value;
end;

function TDBISAMSession.RemoteLoginCallback(var UserName: ShortString;
                                            var Password: ShortString): Boolean;
var
   TempUser: string;
   TempPassword: string;
begin
   Result:=True;
   TempUser:=UserName;
   TempPassword:=Password;
   try
      if Assigned(FOnRemoteLogin) then
         FOnRemoteLogin(Self,TempUser,TempPassword,Result)
      else
         begin
         if Assigned(DB.RemoteLoginDialogProc) then
            Result:=DB.RemoteLoginDialogProc(TempUser,TempPassword)
         else
            Result:=False;
         end;
   finally
      UserName:=TempUser;
      Password:=TempPassword;
   end
end;

function TDBISAMSession.RemoteTimeoutCallback(var StayConnected: Boolean): Boolean;
begin
   Result:=True;
   if Assigned(FOnRemoteTimeout) then
      FOnRemoteTimeout(Self,StayConnected);
end;

function TDBISAMSession.RemoteSendProgressCallback(NumBytes: Integer; PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnRemoteSendProgress) then
      FOnRemoteSendProgress(Self,NumBytes,PercentDone);
end;

function TDBISAMSession.RemoteReceiveProgressCallback(NumBytes: Integer; PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnRemoteReceiveProgress) then
      FOnRemoteReceiveProgress(Self,NumBytes,PercentDone);
end;

function TDBISAMSession.RemoteTraceCallback(TraceRecord: TDataTraceRecord): Boolean;
var
   TempTraceRecord: TTraceRecord;
begin
   Result:=True;
   Move(TraceRecord,TempTraceRecord,SizeOf(TDataTraceRecord));
   if Assigned(FOnRemoteTrace) then
      FOnRemoteTrace(Self,TempTraceRecord);
end;

function TDBISAMSession.RemoteReconnectCallback(var Continue: Boolean;
                                                var StopAsking: Boolean): Boolean;
begin
   Result:=True;
   if Assigned(FOnRemoteReconnect) then
      FOnRemoteReconnect(Self,Continue,StopAsking);
end;

function TDBISAMSession.RemoteProcedureProgressCallback(const Status: ShortString;
                                                        PercentDone: Word;
                                                        var Abort: Boolean): Boolean;
begin
   Result:=True;
   if Assigned(FOnRemoteProcedureProgress) then
      FOnRemoteProcedureProgress(Self,Status,PercentDone,Abort);
end;

function TDBISAMSession.RemoteParamByName(const Value: string): TDBISAMParam;
begin
   Result:=FRemoteParams.ParamByName(Value);
end;

procedure TDBISAMSession.GetRemoteUserNames(List: TStrings);
begin
   CheckActive;
   List.Clear;
   FHandle.GetRemoteUserNames(List);
end;

procedure TDBISAMSession.GetRemoteUser(const UserName: string; var UserPassword: string;
                                       var UserDescription: string;
                                       var IsAdministrator: Boolean;
                                       var MaxConnections: Word);
var
   TempPassword: ShortString;
   TempDescription: ShortString;
begin
   CheckActive;
   FHandle.GetRemoteUser(UserName,TempPassword,TempDescription,
                         IsAdministrator,MaxConnections);
   UserPassword:=TempPassword;
   UserDescription:=TempDescription;
end;

procedure TDBISAMSession.AddRemoteUser(const UserName: string; const UserPassword: string;
                                       const UserDescription: string;
                                       IsAdministrator: Boolean=False;
                                       MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
begin
   CheckActive;
   FHandle.AddRemoteUser(UserName,UserPassword,UserDescription,
                         IsAdministrator,MaxConnections);
end;

procedure TDBISAMSession.ModifyRemoteUser(const UserName: string; const UserPassword: string;
                                          const UserDescription: string;
                                          IsAdministrator: Boolean=False;
                                          MaxConnections: Word=DEFAULT_MAX_USER_CONNECTIONS);
begin
   CheckActive;
   FHandle.ModifyRemoteUser(UserName,UserPassword,UserDescription,
                            IsAdministrator,MaxConnections);
end;

procedure TDBISAMSession.ModifyRemoteUserPassword(const UserName: string;
                                                  const UserPassword: string);
begin
   CheckActive;
   FHandle.ModifyRemoteUserPassword(UserName,UserPassword);
end;

procedure TDBISAMSession.DeleteRemoteUser(const UserName: string);
begin
   CheckActive;
   FHandle.DeleteRemoteUser(UserName);
end;

function TDBISAMSession.GetCurrentRemoteUser: string;
begin
   Result:='';
   if Active then
      Result:=FHandle.UserName;
end;

function TDBISAMSession.GetCurrentServerUser: string;
begin
   Result:='';
   if Active and FHandle.InsideEngine then
      Result:=FHandle.UserName;
end;

function TDBISAMSession.GetCurrentRemoteID: Integer;
begin
   Result:=0;
   if Active then
      Result:=FHandle.RemoteID;
end;

procedure TDBISAMSession.GetRemoteDatabaseNames(List: TStrings);
begin
   CheckActive;
   List.Clear;
   FHandle.GetRemoteDatabaseNames(List);
end;

procedure TDBISAMSession.GetRemoteDatabase(const DatabaseName: string;
                                           var DatabaseDescription: string;
                                           var ServerPath: string);
var
   TempDatabaseDescription: ShortString;
   TempServerPath: ShortString;
begin
   CheckActive;
   FHandle.GetRemoteDatabase(DatabaseName,TempDatabaseDescription,TempServerPath);
   DatabaseDescription:=TempDatabaseDescription;
   ServerPath:=TempServerPath;
end;

procedure TDBISAMSession.AddRemoteDatabase(const DatabaseName: string;
                                           const DatabaseDescription: string;
                                           const ServerPath: string);
begin
   CheckActive;
   FHandle.AddRemoteDatabase(DatabaseName,DatabaseDescription,ServerPath);
end;

procedure TDBISAMSession.ModifyRemoteDatabase(const DatabaseName: string;
                                              const DatabaseDescription: string;
                                              const ServerPath: string);
begin
   CheckActive;
   FHandle.ModifyRemoteDatabase(DatabaseName,DatabaseDescription,ServerPath);
end;

procedure TDBISAMSession.DeleteRemoteDatabase(const DatabaseName: string);
begin
   CheckActive;
   FHandle.DeleteRemoteDatabase(DatabaseName);
end;

procedure TDBISAMSession.GetRemoteDatabaseUserNames(const DatabaseName: string;
                                                    List: TStrings);
begin
   CheckActive;
   List.Clear;
   FHandle.GetRemoteDatabaseUserNames(DatabaseName,List);
end;

procedure TDBISAMSession.GetRemoteDatabaseUser(const DatabaseName: string;
                                               const AuthorizedUser: string;
                                                 var UserRights: TDatabaseRights);
var
   TempRights: Integer;
begin
   CheckActive;
   FHandle.GetRemoteDatabaseUser(DatabaseName,AuthorizedUser,TempRights);
   UserRights:=InternalToDatabaseRightsType(TempRights);
end;

procedure TDBISAMSession.AddRemoteDatabaseUser(const DatabaseName: string;
                                               const AuthorizedUser: string;
                                                 RightsToAssign: TDatabaseRights);
begin
   CheckActive;
   FHandle.AddRemoteDatabaseUser(DatabaseName,AuthorizedUser,
                                 DatabaseRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMSession.ModifyRemoteDatabaseUser(const DatabaseName: string;
                                                  const AuthorizedUser: string;
                                                   RightsToAssign: TDatabaseRights);
begin
   CheckActive;
   FHandle.ModifyRemoteDatabaseUser(DatabaseName,AuthorizedUser,
                                    DatabaseRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMSession.DeleteRemoteDatabaseUser(const DatabaseName: string;
                                                  const AuthorizedUser: string);
begin
   CheckActive;
   FHandle.DeleteRemoteDatabaseUser(DatabaseName,AuthorizedUser);
end;

procedure TDBISAMSession.GetRemoteProcedureNames(List: TStrings);
begin
   CheckActive;
   List.Clear;
   FHandle.GetRemoteProcedureNames(List);
end;

procedure TDBISAMSession.GetRemoteProcedure(const ProcedureName: string;
                                            var ProcedureDescription: string);
var
   TempProcedureDescription: ShortString;
begin
   CheckActive;
   FHandle.GetRemoteProcedure(ProcedureName,TempProcedureDescription);
   ProcedureDescription:=TempProcedureDescription;
end;

procedure TDBISAMSession.AddRemoteProcedure(const ProcedureName: string;
                                            const ProcedureDescription: string);
begin
   CheckActive;
   FHandle.AddRemoteProcedure(ProcedureName,ProcedureDescription);
end;

procedure TDBISAMSession.ModifyRemoteProcedure(const ProcedureName: string;
                                               const ProcedureDescription: string);
begin
   CheckActive;
   FHandle.ModifyRemoteProcedure(ProcedureName,ProcedureDescription);
end;

procedure TDBISAMSession.DeleteRemoteProcedure(const ProcedureName: string);
begin
   CheckActive;
   FHandle.DeleteRemoteProcedure(ProcedureName);
end;

procedure TDBISAMSession.GetRemoteProcedureUserNames(const ProcedureName: string;
                                                    List: TStrings);
begin
   CheckActive;
   List.Clear;
   FHandle.GetRemoteProcedureUserNames(ProcedureName,List);
end;

procedure TDBISAMSession.GetRemoteProcedureUser(const ProcedureName: string;
                                                const AuthorizedUser: string;
                                                  var UserRights: TProcedureRights);
var
   TempRights: Integer;
begin
   CheckActive;
   FHandle.GetRemoteProcedureUser(ProcedureName,AuthorizedUser,TempRights);
   UserRights:=InternalToProcedureRightsType(TempRights);
end;

procedure TDBISAMSession.AddRemoteProcedureUser(const ProcedureName: string;
                                                const AuthorizedUser: string;
                                                RightsToAssign: TProcedureRights);
begin
   CheckActive;
   FHandle.AddRemoteProcedureUser(ProcedureName,AuthorizedUser,
                                  ProcedureRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMSession.ModifyRemoteProcedureUser(const ProcedureName: string;
                                                   const AuthorizedUser: string;
                                                    RightsToAssign: TProcedureRights);
begin
   CheckActive;
   FHandle.ModifyRemoteProcedureUser(ProcedureName,AuthorizedUser,
                                     ProcedureRightsTypeToInternal(RightsToAssign));
end;

procedure TDBISAMSession.DeleteRemoteProcedureUser(const ProcedureName: string;
                                                   const AuthorizedUser: string);
begin
   CheckActive;
   FHandle.DeleteRemoteProcedureUser(ProcedureName,AuthorizedUser);
end;

procedure TDBISAMSession.GetRemoteEventNames(List: TStrings);
begin
   CheckActive;
   List.Clear;
   FHandle.GetRemoteEventNames(List);
end;

procedure TDBISAMSession.GetRemoteEvent(const EventName: string;
                                        var EventDescription: string;
                                         var EventRunType: TEventRunType;
                                        var EventStartDate: TDateTime;
                                        var EventEndDate: TDateTime;
                                        var EventStartTime: TDateTime;
                                        var EventEndTime: TDateTime;
                                        var EventInterval: Word;
                                        var EventDays: TEventDays;
                                        var EventDayOfMonth: TEventDayOfMonth;
                                        var EventDayOfWeek: TEventDayOfWeek;
                                        var EventMonths: TEventMonths;
                                        var EventLastRun: TDateTime);
var
   TempDescription: ShortString;
   TempDayOfWeek: Byte;
   TempDayOfMonth: Byte;
begin
   CheckActive;
   FHandle.GetRemoteEvent(EventName,TempDescription,
                          Byte(EventRunType),
                          EventStartDate,EventEndDate,
                          EventStartTime,EventEndTime,
                          EventInterval,
                          TConfigDays(EventDays),
                          TempDayOfMonth,
                          TempDayOfWeek,
                          TConfigMonths(EventMonths),
                          EventLastRun);
   EventDescription:=TempDescription;
   EventDayOfMonth:=TEventDayOfMonth(TempDayOfMonth-1);
   EventDayOfWeek:=TEventDayOfWeek(TempDayOfWeek-1);
end;


procedure TDBISAMSession.AddRemoteEvent(const EventName: string;
                                        const EventDescription: string;
                                         EventRunType: TEventRunType;
                                        EventStartDate: TDateTime;
                                        EventEndDate: TDateTime;
                                        EventStartTime: TDateTime;
                                        EventEndTime: TDateTime;
                                        EventInterval: Word;
                                        EventDays: TEventDays;
                                        EventDayOfMonth: TEventDayOfMonth;
                                        EventDayOfWeek: TEventDayOfWeek;
                                        EventMonths: TEventMonths);
begin
   CheckActive;
   FHandle.AddRemoteEvent(EventName,EventDescription,
                          Byte(EventRunType),
                          EventStartDate,EventEndDate,
                          EventStartTime,EventEndTime,
                          EventInterval,
                          TConfigDays(EventDays),
                          (Byte(EventDayOfMonth)+1),
                          (Byte(EventDayOfWeek)+1),
                          TConfigMonths(EventMonths));
end;

procedure TDBISAMSession.ModifyRemoteEvent(const EventName: string;
                                           const EventDescription: string;
                                           EventRunType: TEventRunType;
                                           EventStartDate: TDateTime;
                                           EventEndDate: TDateTime;
                                           EventStartTime: TDateTime;
                                           EventEndTime: TDateTime;
                                           EventInterval: Word;
                                           EventDays: TEventDays;
                                           EventDayOfMonth: TEventDayOfMonth;
                                           EventDayOfWeek: TEventDayOfWeek;
                                           EventMonths: TEventMonths);
begin
   CheckActive;
   FHandle.ModifyRemoteEvent(EventName,EventDescription,
                             Byte(EventRunType),
                             EventStartDate,EventEndDate,
                             EventStartTime,EventEndTime,
                             EventInterval,
                             TConfigDays(EventDays),
                             (Byte(EventDayOfMonth)+1),
                             (Byte(EventDayOfWeek)+1),
                             TConfigMonths(EventMonths));
end;

procedure TDBISAMSession.DeleteRemoteEvent(const EventName: string);
begin
   CheckActive;
   FHandle.DeleteRemoteEvent(EventName);
end;

procedure TDBISAMSession.GetRemoteConfig(var DenyLogins: Boolean; var MaxConnections: Word;
                                         var ConnectTimeout: Word; var DeadSessionInterval: Word;
                                         var DeadSessionExpires: Word; var MaxDeadSessions: Word;
                                         var TempDirectory: string;
                                         AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
var
   TempPath: ShortString;
begin
   CheckActive;
   AuthorizedAddresses.Clear;
   BlockedAddresses.Clear;
   FHandle.GetRemoteConfig(DenyLogins,MaxConnections,ConnectTimeout,
                           DeadSessionInterval,DeadSessionExpires,MaxDeadSessions,
                           TempPath,
                           AuthorizedAddresses,BlockedAddresses);
   TempDirectory:=TempPath;
end;

procedure TDBISAMSession.ModifyRemoteConfig(DenyLogins: Boolean; MaxConnections: Word;
                                            ConnectTimeout: Word; DeadSessionInterval: Word;
                                            DeadSessionExpires: Word; MaxDeadSessions: Word;
                                            const TempDirectory: string;
                                            AuthorizedAddresses: TStrings; BlockedAddresses: TStrings);
begin
   CheckActive;
   FHandle.ModifyRemoteConfig(DenyLogins,MaxConnections,ConnectTimeout,
                              DeadSessionInterval,DeadSessionExpires,MaxDeadSessions,
                              TempDirectory,
                              AuthorizedAddresses,BlockedAddresses);
end;

function TDBISAMSession.GetRemoteLogCount: Integer;
begin
   CheckActive;
   Result:=FHandle.GetRemoteLogCount;
end;

function TDBISAMSession.GetRemoteLogRecord(Number: Integer): TLogRecord;
var
   TempLogRecord: TDataLogRecord;
begin
   CheckActive;
   TempLogRecord:=FHandle.GetRemoteLogRecord(Number);
   Move(TempLogRecord,Result,SizeOf(TLogRecord));
end;

procedure TDBISAMSession.StartRemoteServer;
begin
   CheckActive;
   FHandle.StartRemoteServer;
end;

procedure TDBISAMSession.StopRemoteServer;
begin
   CheckActive;
   FHandle.StopRemoteServer;
end;

function TDBISAMSession.GetRemoteEngineVersion: string;
begin
   CheckActive;
   Result:=FHandle.GetRemoteEngineVersion;
end;

function TDBISAMSession.GetRemoteDateTime: TDateTime;
begin
   CheckActive;
   Result:=FHandle.GetRemoteDateTime;
end;

function TDBISAMSession.GetRemoteUTCDateTime: TDateTime;
begin
   CheckActive;
   Result:=FHandle.GetRemoteUTCDateTime;
end;

function TDBISAMSession.GetRemoteUpTime: Int64;
begin
   CheckActive;
   Result:=FHandle.GetRemoteUpTime;
end;

function TDBISAMSession.GetRemoteMemoryUsage: double;
begin
   CheckActive;
   Result:=FHandle.GetRemoteMemoryUsage;
end;

function TDBISAMSession.GetRemoteServerName: string;
begin
   CheckActive;
   Result:=FHandle.GetRemoteServerName;
end;

function TDBISAMSession.GetRemoteServerDescription: string;
begin
   CheckActive;
   Result:=FHandle.GetRemoteServerDescription;
end;

function TDBISAMSession.GetRemoteMainAddress: string;
begin
   CheckActive;
   Result:=FHandle.GetRemoteMainAddress;
end;

function TDBISAMSession.GetRemoteMainPort: Integer;
begin
   CheckActive;
   Result:=FHandle.GetRemoteMainPort;
end;

function TDBISAMSession.GetRemoteMainThreadCacheSize: Integer;
begin
   CheckActive;
   Result:=FHandle.GetRemoteMainThreadCacheSize;
end;

function TDBISAMSession.GetRemoteAdminAddress: string;
begin
   CheckActive;
   Result:=FHandle.GetRemoteAdminAddress;
end;

function TDBISAMSession.GetRemoteAdminPort: Integer;
begin
   CheckActive;
   Result:=FHandle.GetRemoteAdminPort;
end;

function TDBISAMSession.GetRemoteAdminThreadCacheSize: Integer;
begin
   CheckActive;
   Result:=FHandle.GetRemoteAdminThreadCacheSize;
end;

function TDBISAMSession.GetRemoteSessionCount: Integer;
begin
   CheckActive;
   Result:=FHandle.GetRemoteSessionCount;
end;

function TDBISAMSession.GetRemoteConnectedSessionCount: Integer;
begin
   CheckActive;
   Result:=FHandle.GetRemoteConnectedSessionCount;
end;

function TDBISAMSession.GetRemoteSessionInfo(SessionNum: Integer;
                                             var SessionID: Integer;
                                             var CreatedOn: TDateTime;
                                             var LastConnectedOn: TDateTime;
                                             var UserName: string;
                                             var UserAddress: string;
                                             var Encrypted: Boolean;
                                             var LastUserAddress: string): Boolean;
var
   TempUserName: ShortString;
   TempUserAddress: ShortString;
   TempLastAddress: ShortString;
begin
   CheckActive;
   TempUserName:='';
   TempUserAddress:='';
   TempLastAddress:='';
   Result:=FHandle.GetRemoteSessionInfo(SessionNum,SessionID,CreatedOn,
                                        LastConnectedOn,TempUserName,TempUserAddress,
                                        Encrypted,TempLastAddress);
   if Result then
      begin
      UserName:=TempUserName;
      UserAddress:=TempUserAddress;
      LastUserAddress:=TempLastAddress;
      end;
end;

function TDBISAMSession.DisconnectRemoteSession(SessionID: Integer): Boolean;
begin
   CheckActive;
   Result:=FHandle.DisconnectRemoteSession(SessionID);
end;

function TDBISAMSession.RemoveRemoteSession(SessionID: Integer): Boolean;
begin
   CheckActive;
   Result:=FHandle.RemoveRemoteSession(SessionID);
end;

procedure TDBISAMSession.CallRemoteProcedure(const ProcedureName: string);
var
   I: Integer;
   TempInCount: Word;
   TempInParamDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempInRecordBuffer: PChar;
   TempInBlobCount: Word;
   TempInBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
   TempOutCount: Word;
   TempOutParamDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempOutRecordBuffer: PChar;
   TempOutBlobCount: Word;
   TempOutBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
begin
   CheckActive;
   with FHandle do
      begin
      TempInCount:=FRemoteParams.GetNativeBuffer(TempInParamDefinitions,
                                                 TempInRecordBuffer,
                                                 TempInBlobCount,
                                                 TempInBlobBuffers);
      if (TempInCount > 0) then
         begin
         try
            CallRemoteProcedure(ProcedureName,TempInCount,TempInParamDefinitions,
                                TempInRecordBuffer,
                                TempOutCount,TempOutParamDefinitions,
                                TempOutRecordBuffer,
                                TempOutBlobCount,TempOutBlobBuffers);
            try
               FRemoteParams.PutNativeBuffer(TempOutCount,TempOutParamDefinitions,
                                             TempOutRecordBuffer);
            finally
               DeAllocMem(TempOutRecordBuffer);
               for I:=1 to TempOutBlobCount do
                  DeAllocMem(TempOutBlobBuffers[I]);
               for I:=1 to TempOutCount do
                  DeAllocMem(TempOutParamDefinitions[I]);
            end;
         finally
            DeAllocMem(TempInRecordBuffer);
            for I:=1 to TempInCount do
               DeAllocMem(TempInParamDefinitions[I]);
            for I:=1 to TempInBlobCount do
               DeAllocMem(TempInBlobBuffers[I]);
         end
         end
      else
         begin
         CallRemoteProcedure(ProcedureName,TempInCount,TempInParamDefinitions,
                             TempInRecordBuffer,
                             TempOutCount,TempOutParamDefinitions,
                             TempOutRecordBuffer,
                             TempOutBlobCount,TempOutBlobBuffers);
         try
            FRemoteParams.PutNativeBuffer(TempOutCount,TempOutParamDefinitions,
                                          TempOutRecordBuffer);
         finally
            DeAllocMem(TempOutRecordBuffer);
            for I:=1 to TempOutBlobCount do
               DeAllocMem(TempOutBlobBuffers[I]);
            for I:=1 to TempOutCount do
               DeAllocMem(TempOutParamDefinitions[I]);
         end;
         end;
      end;
end;

procedure TDBISAMSession.SendProcedureProgress(const Status: string;
                                               PercentDone: Word;
                                               var Abort: Boolean);
var
   TempStatus: ShortString;
begin
   if (Engine.EngineType=etServer) and FAcquiredHandle then
      begin
      TempStatus:=Status;
      FHandle.DoProcedureProgress(TempStatus,PercentDone,Abort);
      end;
end;

{ Version 5 }
procedure TDBISAMSession.RemoveAllRemoteMemoryTables;
begin
   CheckActive;
   FHandle.RemoveAllRemoteMemoryTables;
end;
{ Version 5 }

{ TDBISAMDatabase }

constructor TDBISAMDatabase.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   if (FSession=nil) then
      begin
      if (AOwner is TDBISAMSession) then
         FSession:=TDBISAMSession(AOwner)
      else
         FSession:=DefaultDBISAMSession;
      end;
   SessionName:=FSession.SessionName;
   FSession.AddDatabase(Self);
   FKeepConnection:=True;
end;

destructor TDBISAMDatabase.Destroy;
begin
   Destroying;
   Close;
   if (FSession <> nil) then
      FSession.RemoveDatabase(Self);
   inherited Destroy;
end;

function TDBISAMDatabase.GetEngineVersion: string;
begin
   Result:=ENGINE_VERSION+' Build '+ENGINE_BUILD;
end;

procedure TDBISAMDatabase.SetEngineVersion(const Value: string);
begin
end;

function TDBISAMDatabase.Execute(const SQL: string; Params: TDBISAMParams=nil;
                                 Query: TDBISAMQuery=nil): Integer;
var
   TempQuery: Boolean;
begin
   Open;
   TempQuery:=(not Assigned(Query));
   if TempQuery then
      Query:=TDBISAMQuery.Create(nil);
   try
      Query.Active:=False;
      Query.SessionName:=FSessionName;
      Query.DatabaseName:=FDatabaseName;
      Query.SQL.Text:=SQL;
      if (Params <> nil) then
         Query.Params.Assign(Params);
      Query.ExecSQL;
      Result:=Query.RowsAffected;
   finally
      if TempQuery then
         Query.Free;
   end;
end;

procedure TDBISAMDatabase.CheckActive;
begin
   if (FHandle=nil) then
      DatabaseError(SDatabaseClosed);
end;

procedure TDBISAMDatabase.CheckInactive;
begin
   if (FHandle <> nil) then
      DatabaseError(SDatabaseOpen);
end;

procedure TDBISAMDatabase.CheckDatabaseName;
begin
   if (FDatabaseName='') and (not Temporary) then
      DatabaseError(SDatabaseNameMissing);
end;

procedure TDBISAMDatabase.CheckSessionName(Required: Boolean);
var
   NewSession: TDBISAMSession;
begin
   if Required then
      NewSession:=Engine.SessionList[FSessionName]
   else
      NewSession:=Engine.FindSession(FSessionName);
   if (NewSession <> nil) and (NewSession <> FSession) then
      begin
      if (FSession <> nil) then
         FSession.RemoveDatabase(Self);
      FSession:=NewSession;
      FSession.FreeNotification(Self);
      FSession.AddDatabase(Self);
      end;
   try
      ValidateName(FDatabaseName);
   except
      FDatabaseName:='';
      raise;
   end;
   if Required then
      FSession.Active:=True;
end;

procedure TDBISAMDatabase.DoDisconnect;
begin
   if (FHandle <> nil) then
      begin
      CloseDataSets;
      if (not FAcquiredHandle) then
         begin
         if (FSession <> nil) and (FSession.FHandle <> nil) then
            FSession.FHandle.CloseDataDirectory(FHandle,False)
         end
      else
         FAcquiredHandle:=False;
      FHandle:=nil;
      FRefCount:=0;
      end;
end;

procedure TDBISAMDatabase.CloseDataSets;
begin
   while (DataSetCount <> 0) do
      TDBISAMDBDataSet(DataSets[DataSetCount-1]).Disconnect;
end;

procedure TDBISAMDatabase.Commit(ForceFlush: Boolean=True);
begin
   CheckActive;
   EndTransaction(True,ForceFlush);
end;

procedure TDBISAMDatabase.EndTransaction(CommitIt: Boolean; FlushIt: Boolean);
begin
   if (FHandle=nil) or (not FHandle.InTransaction) then
      DatabaseErrorFmt(SEndTransError,[FDatabaseName]);
   if (CommitIt) then
      FHandle.CommitTransaction(FlushIt,True,False)
   else
      FHandle.RollbackTransaction(False);
end;

function TDBISAMDatabase.GetConnected: Boolean;
begin
   Result:=(FHandle <> nil);
end;

function TDBISAMDatabase.GetDataSet(Index: Integer): TDBISAMDBDataSet;
begin
   Result:=inherited GetDataSet(Index) as TDBISAMDBDataSet;
end;

function TDBISAMDatabase.GetInTransaction: Boolean;
begin
   Result:=False;
   if (FHandle <> nil) then
      Result:=FHandle.InTransaction;
end;

procedure TDBISAMDatabase.Loaded;
begin
   inherited Loaded;
   if (not StreamedConnected) then
      CheckSessionName(False);
end;

procedure TDBISAMDatabase.Notification(AComponent: TComponent; Operation: TOperation);
begin
   inherited Notification(AComponent,Operation);
   if (Operation=opRemove) and (AComponent=FSession) and
      (FSession <> DefaultDBISAMSession) then
      begin
      Close;
      SessionName:='';
      end;
end;

procedure TDBISAMDatabase.DoConnect;
var
   TempDirectoryName: ShortString;
   TempDirectory: ShortString;
begin
   if (FHandle=nil) then
      begin
      if Assigned(FBeforeConnect) then
         FBeforeConnect(Self);
      CheckDatabaseName;
      CheckSessionName(True);
      FSession.SetActive(True);
      if (FSession.SessionType=stRemote) then
         FHandle:=FSession.FHandle.OpenDataDirectory(FRemoteDatabase,'',
                                                     FKeepTablesOpen,False)
      else
         begin
         if MemoryDirectory(FDatabaseName) then
            begin
            TempDirectoryName:=RemoveAllBS(FDatabaseName);
            TempDirectory:='';
            FSession.FHandle.DoGetPath(TempDirectoryName,TempDirectory);
            FHandle:=FSession.FHandle.OpenDataDirectory(TempDirectoryName,TempDirectory,
                                                        FKeepTablesOpen,False);
            end
         else
            begin
            TempDirectoryName:=RemoveAllBS(FDatabaseName);
            FHandle:=FSession.FHandle.OpenDataDirectory(TempDirectoryName,FDirectory,
                                                        FKeepTablesOpen,False);
            end;
         end;
      FAcquiredHandle:=False;
      end;
end;

procedure TDBISAMDatabase.Rollback;
begin
   CheckActive;
   EndTransaction(False,False);
end;

procedure TDBISAMDatabase.SetDatabaseName(const Value: string);
var
   TempString: string;
begin
   TempString:=ConvertSlashes(Value);
   if (csReading in ComponentState) then
      FDatabaseName:=TempString
   else
      begin
      if (FDatabaseName <> TempString) then
         begin
         CheckInactive;
         if (TempString <> '') and (not FTemporary) and
            ContainsDirectory(TempString) then
            DatabaseErrorFmt(sInvalidDatabaseName,[TempString]);
         ValidateName(TempString);
         FDatabaseName:=TempString;
         end;
      end;
end;

procedure TDBISAMDatabase.SetDirectory(const Value: string);
var
   TempString: string;
begin
   TempString:=ConvertSlashes(Value);
   if (csReading in ComponentState) then
      FDirectory:=TempString
   else
      begin
      if (FDirectory <> TempString) then
         begin
         CheckInactive;
         FDirectory:=RemoveAllTrailingBS(TempString);
         end;
      end;
end;

procedure TDBISAMDatabase.SetRemoteDatabase(const Value: string);
var
   TempString: string;
begin
   TempString:=RemoveAllBS(ConvertSlashes(Value));
   if (csReading in ComponentState) then
      FRemoteDatabase:=TempString
   else
      begin
      if (FRemoteDatabase <> TempString) then
         begin
         CheckInactive;
         FRemoteDatabase:=TempString;
         end;
      end;
end;

procedure TDBISAMDatabase.SetHandle(Value: TDataDirectory);
begin
   FHandle:=Value;
   FAcquiredHandle:=True;
   FDatabaseName:=FHandle.Name;
   FDirectory:=FHandle.Directory;
end;

procedure TDBISAMDatabase.SetKeepConnection(Value: Boolean);
begin
   if (FKeepConnection <> Value) then
      begin
      FKeepConnection:=Value;
      if (not Value) and (FRefCount=0) then
         Close;
      end;
end;

procedure TDBISAMDatabase.SetKeepTablesOpen(Value: Boolean);
begin
   CheckInactive;
   FKeepTablesOpen:=Value;
end;

procedure TDBISAMDatabase.SetSessionName(const Value: string);
begin
   if (csReading in ComponentState) then
      FSessionName:=Value
   else
      begin
      if (FSessionName <> Value) then
         begin
         CheckInactive;
         FSessionName:=Value;
         CheckSessionName(False);
         end;
      end;
end;

procedure TDBISAMDatabase.StartTransaction(Tables: TStrings=nil);
begin
   CheckActive;
   if FHandle.InTransaction then
      DatabaseErrorFmt(SBeginTransError,[FDatabaseName]);
   FHandle.StartTransaction(False,Tables);
end;

function TDBISAMDatabase.Backup(const BackupName: string;
                                const BackupDescription: string;
                                Compression: Byte;
                                BackupTables: TStrings): Boolean;
begin
   CheckActive;
   FHandle.SetSteppedProgressCallback(Integer(Self),@TDBISAMDatabase.BackupProgress);
   FHandle.SetLogCallback(Integer(Self),@TDBISAMDatabase.BackupLog);
   try
      Result:=FHandle.Backup(BackupName,BackupDescription,Compression,BackupTables,
                             Assigned(FOnBackupProgress),Assigned(FOnBackupLog));
   finally
      FHandle.SetSteppedProgressCallback(0,nil);
      FHandle.SetLogCallback(0,nil);
   end;
end;

function TDBISAMDatabase.BackupInfo(const BackupName: string;
                                     var BackupDescription: string;
                                     var BackupDateTime: TDateTime;
                                     BackupTables: TStrings): Boolean;
var
   TempDescription: ShortString;
begin
   CheckActive;
   TempDescription:='';
   Result:=FHandle.BackupInfo(BackupName,TempDescription,BackupDateTime,BackupTables);
   BackupDescription:=TempDescription;
end;

function TDBISAMDatabase.Restore(const BackupName: string;
                                 BackupTables: TStrings): Boolean;
begin
   CheckActive;
   FHandle.SetSteppedProgressCallback(Integer(Self),@TDBISAMDatabase.RestoreProgress);
   FHandle.SetLogCallback(Integer(Self),@TDBISAMDatabase.RestoreLog);
   try
      Result:=FHandle.Restore(BackupName,BackupTables,Assigned(FOnRestoreProgress),
                              Assigned(FOnRestoreLog));
   finally
      FHandle.SetSteppedProgressCallback(0,nil);
      FHandle.SetLogCallback(0,nil);
   end;
end;

procedure TDBISAMDatabase.ValidateName(const Name: string);
var
   Database: TDBISAMDatabase;
begin
   if (Name <> '') and (FSession <> nil) then
      begin
      Database:=FSession.FindDatabase(Name);
      if (Database <> nil) and (Database <> Self) then
         begin
         if (not Database.Temporary) or (Database.FRefCount <> 0) then
            DatabaseErrorFmt(SDuplicateDatabaseName,[Name]);
         Database.Free;
         end;
      end;
end;

function TDBISAMDatabase.BackupProgress(const BackupStep: ShortString;
                                        PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnBackupProgress) then
      FOnBackupProgress(Self,BackupStep,PercentDone);
end;

function TDBISAMDatabase.BackupLog(const LogMessage: ShortString): Boolean;
begin
   Result:=True;
   if Assigned(FOnBackupLog) then
      FOnBackupLog(Self,LogMessage);
end;

function TDBISAMDatabase.RestoreProgress(const RestoreStep: ShortString;
                                         PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnRestoreProgress) then
      FOnRestoreProgress(Self,RestoreStep,PercentDone);
end;

function TDBISAMDatabase.RestoreLog(const LogMessage: ShortString): Boolean;
begin
   Result:=True;
   if Assigned(FOnRestoreLog) then
      FOnRestoreLog(Self,LogMessage);
end;

{ TDBISAMFieldDef }

constructor TDBISAMFieldDef.Create(Owner: TDBISAMFieldDefs; const Name: string;
                                   DataType: TFieldType; Size: Integer;
                                   Required: Boolean; const DefaultValue: string;
                                   const MinValue: string; const MaxValue: string;
                                   const Description: string; CharCase: TFieldCharCase;
                                   Compression: Byte; FieldNo: Integer);
begin
   inherited Create(Owner);
   CheckTypeSize(DataType,Size);
   Self.Name:=Name;
   FDataType:=DataType;
   FSize:=Size;
   if Required then
      Include(FAttributes,faRequired);
   FDefaultValue:=DefaultValue;
   FMinValue:=MinValue;
   FMaxValue:=MaxValue;
   FDescription:=Description;
   FCharCase:=CharCase;
   FCompression:=Compression;
   FFieldNo:=FieldNo;
end;

procedure TDBISAMFieldDef.ReadRequired(Reader: TReader);
begin
   SetRequired(Reader.ReadBoolean);
end;

procedure TDBISAMFieldDef.DefineProperties(Filer: TFiler);
begin
   inherited DefineProperties(Filer);
   Filer.DefineProperty('Required',ReadRequired,nil,False);
end;

function TDBISAMFieldDef.GetFieldClass: TFieldClass;
begin
   if (Collection is TDBISAMFieldDefs) then
      Result:=TDBISAMDataSet(TDBISAMFieldDefs(Collection).DataSet).GetFieldClass(DataType)
   else
      Result:=nil;
end;

procedure TDBISAMFieldDef.SetAttributes(Value: TFieldAttributes);
begin
   FAttributes:=Value;
   Changed(False);
end;

procedure TDBISAMFieldDef.SetDataType(Value: TFieldType);
const




   TypeSizes: packed array[TFieldType] of Byte =
    (0 {ftUnknown}, 20 {ftString}, 0 {ftSmallint}, 0 {ftInteger}, 0 {ftWord},
     0 {ftBoolean}, 0 {ftFloat}, 0 {ftCurrency}, 4 {ftBCD}, 0 {ftDate},
     0 {ftTime}, 0 {ftDateTime}, 16 {ftBytes}, 16 {ftVarBytes}, 0 {ftAutoInc},
     0 {ftBlob}, 0 {ftMemo}, 0 {ftGraphic}, 0 {ftFmtMemo}, 0 {ftParadoxOle},
     0 {ftDBaseOle}, 0 {ftTypedBinary}, 0 {ftCursor}, 20 { ftFixedChar },
     20 {ftWideString}, 0 {ftLargeInt} , 0 {ftADT}, 10 {ftArray}, 0 {ftReference},
     0 {ftDataSet}, 0 {ftOraBlob}, 0 {ftOraClob}, 0 {ftVariant}, 0 {ftInterface},
     0 {ftIDispatch}, TYPE_GUID_LENGTH {ftGuid}, 0 {ftTimeStamp}, 0 {ftFMTBcd});




begin
   FDataType:=Value;
   FSize:=TypeSizes[Value];
   Changed(False);
end;

function TDBISAMFieldDef.GetRequired: Boolean;
begin
   Result:=(faRequired in Attributes);
end;

procedure TDBISAMFieldDef.SetRequired(Value: Boolean);
begin
   if Value then
      Attributes:=(Attributes+[faRequired])
   else
      Attributes:=(Attributes-[faRequired]);
end;

procedure TDBISAMFieldDef.SetSize(Value: Integer);
begin
   FSize:=Value;
   Changed(False);
   if (FDataType <> ftUnknown) and (FSize <> 0) then
      CheckTypeSize(FDataType,FSize);
end;

procedure TDBISAMFieldDef.Assign(Source: TPersistent);
var
   TempFieldDef: TFieldDef;
   TempDBISAMFieldDef: TDBISAMFieldDef;
begin
   if (Source is TFieldDef) then
      begin
      if (Collection <> nil) then
         Collection.BeginUpdate;
      try
         TempFieldDef:=TFieldDef(Source);
         FieldNo:=TempFieldDef.FieldNo;
         Name:=TempFieldDef.Name;
         DataType:=TempFieldDef.DataType;
         Size:=TempFieldDef.Size;
         Attributes:=TempFieldDef.Attributes;
      finally
         if (Collection <> nil) then
            Collection.EndUpdate;
      end;
      end
   else if (Source is TDBISAMFieldDef) then
      begin
      if (Collection <> nil) then
         Collection.BeginUpdate;
      try
         TempDBISAMFieldDef:=TDBISAMFieldDef(Source);
         FieldNo:=TempDBISAMFieldDef.FieldNo;
         Name:=TempDBISAMFieldDef.Name;
         DataType:=TempDBISAMFieldDef.DataType;
         Size:=TempDBISAMFieldDef.Size;
         Attributes:=TempDBISAMFieldDef.Attributes;
         DefaultValue:=TempDBISAMFieldDef.DefaultValue;
         MinValue:=TempDBISAMFieldDef.MinValue;
         MaxValue:=TempDBISAMFieldDef.MaxValue;
         Description:=TempDBISAMFieldDef.Description;
         CharCase:=TempDBISAMFieldDef.CharCase;
         Compression:=TempDBISAMFieldDef.Compression;
      finally
         if (Collection <> nil) then
            Collection.EndUpdate;
      end;
      end
   else
      inherited;
end;

procedure TDBISAMFieldDef.AssignTo(Dest: TPersistent);
var
   TempFieldDef: TFieldDef;
begin
   if (Dest is TFieldDef) then
      begin
      TempFieldDef:=TFieldDef(Dest);
      if (TempFieldDef.Collection <> nil) then
         TempFieldDef.Collection.BeginUpdate;
      try
         TempFieldDef.FieldNo:=FieldNo;
         TempFieldDef.Name:=Name;
         TempFieldDef.DataType:=DataType;
         TempFieldDef.Size:=Size;
         TempFieldDef.Precision:=0;
         TempFieldDef.Attributes:=Attributes;
         TempFieldDef.InternalCalcField:=False;
         if TempFieldDef.HasChildDefs then
            TempFieldDef.ChildDefs.Clear;
      finally
         if (TempFieldDef.Collection <> nil) then
            TempFieldDef.Collection.EndUpdate;
      end;
      end
   else
      inherited;
end;

function TDBISAMFieldDef.CreateFieldComponent(Owner: TComponent;
                                              ParentField: TObjectField=nil;
                                              FieldName: string=''): TField;
var
   FieldClassType: TFieldClass;
begin
   FieldClassType:=GetFieldClass;
   if (FieldClassType=nil) then
      DatabaseErrorFmt(SUnknownFieldType,[Name]);
   Result:=FieldClassType.Create(Owner);
   try
      Result.Size:=Size;
      if (FieldName <> '') then
         Result.FieldName:=FieldName
      else
         Result.FieldName:=Name;
      Result.Required:=(faRequired in Attributes);
      Result.ReadOnly:=(faReadonly in Attributes);
      Result.SetFieldType(DataType);
      Result.DataSet:=TFieldDefs(Collection).DataSet;
      if ((faFixed in Attributes) or (DataType=ftFixedChar)) and
         (Result is TStringField) then
         TStringField(Result).FixedChar:=True;
   except
      Result.Free;
      raise;
   end;
end;

function TDBISAMFieldDef.CreateField(Owner: TComponent; ParentField: TObjectField=nil;
                                     const FieldName: string='';
                                     CreateChildren: Boolean=True): TField;
begin
   Result:=CreateFieldComponent(Owner,ParentField,FieldName);
end;

{ TDBISAMFieldDefs }

constructor TDBISAMFieldDefs.Create(AOwner: TPersistent);
var
   TempTable: TDBISAMTable;
begin
   TempTable:=(AOwner as TDBISAMTable);
   inherited Create(TempTable,AOwner,TDBISAMFieldDef);
end;

procedure TDBISAMFieldDefs.SetItemName(AItem: TCollectionItem);
begin
   if (GetOwner=DataSet) then
      inherited SetItemName(AItem)
   else
      begin
      with TNamedItem(AItem) do
         begin
         if (Name='') then
            Name:=TFieldDef(Self.GetOwner).Name+Copy(ClassName,2,5)+IntToStr(ID+1);
         end;
      end;
end;

function TDBISAMFieldDefs.AddFieldDef: TDBISAMFieldDef;
begin
   Result:=TDBISAMFieldDef(inherited Add);
end;

function TDBISAMFieldDefs.InsertFieldDef(InsertPos: Integer): TDBISAMFieldDef;
begin
   Result:=TDBISAMFieldDef(inherited Insert(InsertPos));
end;

procedure TDBISAMFieldDefs.Add(const Name: string; DataType: TFieldType;
                               Size: Integer=0; Required: Boolean=False;
                               const DefaultValue: string='';
                               const MinValue: string=''; const MaxValue: string='';
                               const Description: string='';
                               CharCase: TFieldCharCase=fcNoChange;
                               Compression: Byte=NO_COMPRESSION);
begin
   InternalAdd(0,Name,DataType,Size,Required,DefaultValue,
               MinValue,MaxValue,Description,CharCase,Compression);
end;

procedure TDBISAMFieldDefs.Add(FieldNo: Integer;
                               const Name: string; DataType: TFieldType;
                               Size: Integer=0; Required: Boolean=False;
                               const DefaultValue: string='';
                               const MinValue: string=''; const MaxValue: string='';
                               const Description: string='';
                               CharCase: TFieldCharCase=fcNoChange;
                               Compression: Byte=NO_COMPRESSION);
begin
   InternalAdd(FieldNo,Name,DataType,Size,Required,DefaultValue,
               MinValue,MaxValue,Description,CharCase,Compression);
end;

procedure TDBISAMFieldDefs.InternalAdd(FieldNo: Integer;
                                       const Name: string; DataType: TFieldType;
                                       Size: Integer; Required: Boolean;
                                       const DefaultValue: string='';
                                       const MinValue: string=''; const MaxValue: string='';
                                       const Description: string='';
                                       CharCase: TFieldCharCase=fcNoChange;
                                       Compression: Byte=NO_COMPRESSION);
var
   FieldDef: TDBISAMFieldDef;
begin
   if (Name='') then
      DatabaseError(SFieldNameMissing,DataSet);
   BeginUpdate;
   try
      FieldDef:=AddFieldDef;
      try
         FieldDef.FieldNo:=FieldNo;
         FieldDef.Name:=Name;
         FieldDef.DataType:=DataType;
         FieldDef.Size:=Size;
         FieldDef.Required:=Required;
         FieldDef.DefaultValue:=DefaultValue;
         FieldDef.MinValue:=MinValue;
         FieldDef.MaxValue:=MaxValue;
         FieldDef.Description:=Description;
         FieldDef.CharCase:=CharCase;
         FieldDef.Compression:=Compression;
      except
         FieldDef.Free;
         raise;
      end;
   finally
      EndUpdate;
   end;
end;

procedure TDBISAMFieldDefs.Insert(InsertPos: Integer;
                                  const Name: string; DataType: TFieldType;
                                  Size: Integer=0; Required: Boolean=False;
                                  const DefaultValue: string='';
                                  const MinValue: string=''; const MaxValue: string='';
                                  const Description: string='';
                                  CharCase: TFieldCharCase=fcNoChange;
                                  Compression: Byte=NO_COMPRESSION);
begin
   InternalInsert(InsertPos,0,Name,DataType,Size,Required,
                  DefaultValue,MinValue,MaxValue,Description,
                  CharCase,Compression);
end;

procedure TDBISAMFieldDefs.Insert(InsertPos: Integer; FieldNo: Integer;
                                  const Name: string; DataType: TFieldType;
                                  Size: Integer=0; Required: Boolean=False;
                                  const DefaultValue: string='';
                                  const MinValue: string=''; const MaxValue: string='';
                                  const Description: string='';
                                  CharCase: TFieldCharCase=fcNoChange;
                                  Compression: Byte=NO_COMPRESSION);
begin
   InternalInsert(InsertPos,FieldNo,Name,DataType,Size,Required,
                  DefaultValue,MinValue,MaxValue,Description,
                  CharCase,Compression);
end;

procedure TDBISAMFieldDefs.InternalInsert(InsertPos: Integer; FieldNo: Integer;
                                          const Name: string; DataType: TFieldType;
                                          Size: Integer; Required: Boolean;
                                          const DefaultValue: string='';
                                          const MinValue: string=''; const MaxValue: string='';
                                          const Description: string='';
                                          CharCase: TFieldCharCase=fcNoChange;
                                          Compression: Byte=NO_COMPRESSION);
var
   FieldDef: TDBISAMFieldDef;
begin
   if (Name='') then
      DatabaseError(SFieldNameMissing,DataSet);
   BeginUpdate;
   try
      FieldDef:=InsertFieldDef(InsertPos);
      try
         FieldDef.FieldNo:=FieldNo;
         FieldDef.Name:=Name;
         FieldDef.DataType:=DataType;
         FieldDef.Size:=Size;
         FieldDef.Required:=Required;
         FieldDef.DefaultValue:=DefaultValue;
         FieldDef.MinValue:=MinValue;
         FieldDef.MaxValue:=MaxValue;
         FieldDef.Description:=Description;
         FieldDef.CharCase:=CharCase;
         FieldDef.Compression:=Compression;
      except
         FieldDef.Free;
         raise;
      end;
   finally
      EndUpdate;
   end;
end;

function TDBISAMFieldDefs.Find(const Name: string): TDBISAMFieldDef;
begin
   Result:=TDBISAMFieldDef(inherited Find(Name));
   if (Result=nil) then
      DatabaseErrorFmt(SFieldNotFound,[Name],DataSet);
end;

function TDBISAMFieldDefs.GetFieldDef(Index: Integer): TDBISAMFieldDef;
begin
   Result:=TDBISAMFieldDef(inherited Items[Index]);
end;

procedure TDBISAMFieldDefs.SetFieldDef(Index: Integer; Value: TDBISAMFieldDef);
begin
   inherited Items[Index]:=Value;
end;

procedure TDBISAMFieldDefs.Update;
begin
   DataSet.FieldDefs.Updated:=Self.Updated;
   DataSet.FieldDefs.Update;
end;

{ TDBISAMIndexDef }

constructor TDBISAMIndexDef.Create(Owner: TDBISAMIndexDefs; const Name: string;
                                   const Fields: string; Options: TIndexOptions=[];
                                   const DescFields: string='';
                                   Compression: TIndexCompression=icNone);
begin
   inherited Create(Owner);
   Self.Name:=Name;
   FFieldExpression:=Fields;
   FOptions:=Options;
   FDescFields:=DescFields;
   FCompression:=Compression;
end;

procedure TDBISAMIndexDef.Assign(Source: TPersistent);
var
   TempIndexDef: TIndexDef;
   TempDBISAMIndexDef: TDBISAMIndexDef;
begin
   if (Source is TIndexDef) then
      begin
      if (Collection <> nil) then
         Collection.BeginUpdate;
      try
         TempIndexDef:=TIndexDef(Source);
         Name:=TempIndexDef.Name;
         Fields:=TempIndexDef.Fields;
         DescFields:=TempIndexDef.DescFields;
         Options:=TempIndexDef.Options;
         Compression:=icNone;
      finally
         if (Collection <> nil) then
            Collection.EndUpdate;
      end;
      end
   else if (Source is TDBISAMIndexDef) then
      begin
      if (Collection <> nil) then
         Collection.BeginUpdate;
      try
         TempDBISAMIndexDef:=TDBISAMIndexDef(Source);
         Name:=TempDBISAMIndexDef.Name;
         Fields:=TempDBISAMIndexDef.Fields;
         DescFields:=TempDBISAMIndexDef.DescFields;
         Options:=TempDBISAMIndexDef.Options;
         Compression:=TempDBISAMIndexDef.Compression;
      finally
         if (Collection <> nil) then
            Collection.EndUpdate;
      end;
      end
   else
      inherited;
end;

procedure TDBISAMIndexDef.AssignTo(Dest: TPersistent);
var
   TempIndexDef: TIndexDef;
begin
   if (Dest is TIndexDef) then
      begin
      TempIndexDef:=TIndexDef(Dest);
      if (TempIndexDef.Collection <> nil) then
         TempIndexDef.Collection.BeginUpdate;
      try
         TempIndexDef.Name:=Name;
         TempIndexDef.Fields:=Fields;
         TempIndexDef.DescFields:=DescFields;
         TempIndexDef.Options:=Options;
      finally
         if (TempIndexDef.Collection <> nil) then
            TempIndexDef.Collection.EndUpdate;
      end;
      end
   else
      inherited;
end;

procedure TDBISAMIndexDef.SetOptions(Value: TIndexOptions);
begin
   if (Value <> FOptions) then
      begin
      FOptions:=Value;
      if (ixDescending in Value) then
         begin
         if (FDescFields='') then
            FDescFields:=Fields;
         end;
      Changed(False);
      end;
end;

function TDBISAMIndexDef.GetFields: string;
begin
   if (ixExpression in Options) then
      Result:=''
   else
      Result:=FFieldExpression;
end;

procedure TDBISAMIndexDef.SetFields(const Value: string);
begin
   if (Value <> FFieldExpression) or (ixExpression in Options) then
      begin
      Exclude(FOptions,ixExpression);
      FFieldExpression:=Value;
      Changed(False);
      end;
end;

procedure TDBISAMIndexDef.SetDescFields(const Value: string);
begin
   if (Value <> FDescFields) then
      begin
      if (Value <> '') then
         Include(FOptions,ixDescending);
      FDescFields:=Value;
      Changed(False);
      end;
end;

function TDBISAMIndexDef.GetDisplayName: string;
begin
   Result:=inherited GetDisplayName;
   if (Result='') and (ixPrimary in FOptions) then
      Result:='<Primary>'; { do not localize }
end;

{ TDBISAMIndexDefs }

constructor TDBISAMIndexDefs.Create(AOwner: TPersistent);
var
   TempTable: TDBISAMTable;
begin
   TempTable:=(AOwner as TDBISAMTable);
   inherited Create(TempTable,AOwner,TDBISAMIndexDef);
end;

function TDBISAMIndexDefs.AddIndexDef: TDBISAMIndexDef;
begin
   Result:=TDBISAMIndexDef(inherited Add);
end;

procedure TDBISAMIndexDefs.Add(const Name: string; const Fields: string;
                               Options: TIndexOptions=[]; const DescFields: string='';
                               Compression: TIndexCompression=icNone);
var
   IndexDef: TDBISAMIndexDef;
begin
   if (IndexOf(Name) >= 0) then
      DatabaseErrorFmt(SDuplicateIndexName,[Name],DataSet);
   IndexDef:=AddIndexDef;
   IndexDef.Name:=Name;
   IndexDef.Fields:=Fields;
   IndexDef.DescFields:=DescFields;
   if (ixDescending in IndexDef.Options) then
      Include(Options,ixDescending);
   IndexDef.Options:=Options;
   IndexDef.Compression:=Compression;
end;

function TDBISAMIndexDefs.FindIndexForFields(const Fields: string): TDBISAMIndexDef;
begin
   Result:=GetIndexForFields(Fields,False);
   if (Result=nil) then
      DatabaseErrorFmt(SNoIndexForFields,[Fields],DataSet);
end;

function TDBISAMIndexDefs.GetIndexForFields(const Fields: string;
                                            CaseInsensitive: Boolean): TDBISAMIndexDef;
var
   Exact: Boolean;
   I: Integer;
   L: Integer;
begin
   Update;
   L:=Length(Fields);
   Exact:=True;
   while True do
      begin
      for I:=0 to Count-1 do
         begin
         Result:=Items[I];
         if (Result.Options*[ixDescending,ixExpression]=[]) and
            (not CaseInsensitive or (ixCaseInsensitive in Result.Options)) then
            begin
            if Exact then
               begin
               if AnsiCompareText(Fields,Result.Fields)=0 then
                  Exit;
               end
            else
               begin
               if (AnsiCompareText(Fields,Copy(Result.Fields,1,L))=0) and
                  ((Length(Result.Fields)=L) or (Result.Fields[L+1]=';')) then
                  Exit;
               end;
            end;
         end;
      if (not Exact) then
         Break;
      Exact:=False;
      end;
   Result:=nil;
end;

function TDBISAMIndexDefs.Find(const Name: string): TDBISAMIndexDef;
begin
   Result:=TDBISAMIndexDef(inherited Find(Name));
   if (Result=nil) then
      DatabaseErrorFmt(SIndexNotFound,[Name],DataSet);
end;

function TDBISAMIndexDefs.GetIndexDef(Index: Integer): TDBISAMIndexDef;
begin
   Result:=TDBISAMIndexDef(inherited Items[Index]);
end;

procedure TDBISAMIndexDefs.SetIndexDef(Index: Integer; Value: TDBISAMIndexDef);
begin
   inherited Items[Index]:=Value;
end;

procedure TDBISAMIndexDefs.Update;
begin
   if Assigned(DataSet) then
      UpdateDefs(TDBISAMTable(DataSet).UpdateIndexDefs);
end;

{ TDBISAMBaseDataSet }

procedure TDBISAMBaseDataSet.AddFieldDefinition(var FieldNo: Integer;
                                                var Name: string; var DataType: TFieldType;
                                                var Size: Word; var Required: Boolean;
                                                var DefaultValue: string;
                                                var MinValue: string; var MaxValue: string;
                                                var Description: string;
                                                var CharCase: TFieldCharCase;
                                                var Compression: Byte);
var
   TempFieldDef: TFieldDef;
begin
   if (DataType <> ftUnknown) then
      begin
      with FieldDefs do
         begin
         TempFieldDef:=AddFieldDef;
         BeginUpdate;
         try
            TempFieldDef.Name:=Name;
            TempFieldDef.DataType:=DataType;
            TempFieldDef.Size:=Size;
            if (DataType=ftAutoInc) then
               TempFieldDef.Required:=False
            else
               TempFieldDef.Required:=Required;
            TempFieldDef.FieldNo:=FieldNo;
         finally
            EndUpdate;
         end;
         end;
      end;
end;

procedure TDBISAMBaseDataSet.DataConvert(Field: TField; Source, Dest: Pointer;
                                         ToNative: Boolean);
begin
   { Need to initialize the buffer for BCD fields }
   if ToNative and (Field.DataType=ftBCD) then
      FillChar(pBCD(Dest)^,SizeOf(TBCD),#0);
   inherited DataConvert(Field,Source,Dest,ToNative);
end;

{ TDBISAMRecordDataSet }

procedure TDBISAMRecordDataSet.SetHandle(Value: TDataCursor;
                                         UsePhysicalFields: Boolean);
begin
   FHandle:=Value;
   FPhysicalFields:=UsePhysicalFields;
end;

procedure TDBISAMRecordDataSet.SetRecordNumber(Value: Integer);
begin
   FRecordNumber:=Value;
end;

procedure TDBISAMRecordDataSet.SetRecordBuffer(RecordBuffer: PChar);
begin
   FRecordBuffer:=RecordBuffer;
end;

procedure TDBISAMRecordDataSet.SetOldRecordBuffer(RecordBuffer: PChar);
begin
   FOldRecordBuffer:=RecordBuffer;
end;

procedure TDBISAMRecordDataSet.InternalClearFieldDefs;
begin
   FieldDefs.Clear;
end;

procedure TDBISAMRecordDataSet.InternalInitFieldDefs;
var
   I: Integer;
   TempFieldDefinition: pFieldDefinition;
   TempName: string;
   TempDataType: TFieldType;
   TempSize: Word;
   TempRequired: Boolean;
   TempDefaultValue: string;
   TempMinValue: string;
   TempMaxValue: string;
   TempDescription: string;
   TempCharCase: TFieldCharCase;
   TempCompression: Byte;
   TempFieldNo: Integer;
begin
   InternalClearFieldDefs;
   if (FHandle <> nil) then
      begin
      if FPhysicalFields then
         begin
         for I:=1 to FHandle.PhysicalFieldCount do
            begin
            TempFieldDefinition:=FHandle.GetPhysicalFieldDefinition(I);
            if (not TempFieldDefinition^.Hidden) then
               begin
               DecodeFieldDefinition(TempFieldDefinition,TempFieldNo,
                                     TempName,TempDataType,TempSize,TempRequired,
                                     TempDefaultValue,TempMinValue,TempMaxValue,
                                     TempDescription,TempCharCase,TempCompression);
               AddFieldDefinition(TempFieldNo,TempName,TempDataType,TempSize,TempRequired,
                                  TempDefaultValue,TempMinValue,TempMaxValue,
                                  TempDescription,TempCharCase,TempCompression);
               end;
            end;
         end
      else
         begin
         for I:=1 to FHandle.FieldCount do
            begin
            TempFieldDefinition:=FHandle.GetFieldDefinition(I);
            if (not TempFieldDefinition^.Hidden) then
               begin
               DecodeFieldDefinition(TempFieldDefinition,TempFieldNo,
                                     TempName,TempDataType,TempSize,TempRequired,
                                     TempDefaultValue,TempMinValue,TempMaxValue,
                                     TempDescription,TempCharCase,TempCompression);
               AddFieldDefinition(TempFieldNo,TempName,TempDataType,TempSize,TempRequired,
                                  TempDefaultValue,TempMinValue,TempMaxValue,
                                  TempDescription,TempCharCase,TempCompression);
               end;
            end;
         end;
      end;
end;

procedure TDBISAMRecordDataSet.InternalOpen;
begin
   if (FHandle <> nil) then
      begin
      FieldDefs.Updated:=False;
      FieldDefs.Update;
      GetIndexInfo;
      if DefaultFields then
         CreateFields;
      BindFields(True);
      FPosition:=0;
      end;
end;

procedure TDBISAMRecordDataSet.InternalClose;
begin
   BindFields(False);
   if DefaultFields then
      DestroyFields;
   FIndexFieldCount:=0;
   FKeySize:=0;
   FCaseInsIndex:=False;
end;

function TDBISAMRecordDataSet.IsCursorOpen: Boolean;
begin
   Result:=(FHandle <> nil);
end;

procedure TDBISAMRecordDataSet.InternalHandleException;
begin
   ApplicationHandleException(Self)
end;

{ Record Functions }

function TDBISAMRecordDataSet.AllocRecordBuffer: PChar;
begin
   Result:=FRecordBuffer;
end;

procedure TDBISAMRecordDataSet.FreeRecordBuffer(var Buffer: PChar);
begin
   { Do nothing since we didn't really allocate anything }
end;

function TDBISAMRecordDataSet.GetRecord(Buffer: PChar; GetMode: TGetMode;
   DoCheck: Boolean): TGetResult;
begin
   if (FHandle <> nil) then
      begin
      case GetMode of
         gmNext:
            begin
            Inc(FPosition);
            if (FPosition > 1) then
               Result:=grEOF
            else
               Result:=grOk;
            end;
         gmPrior:
            begin
            Dec(FPosition);
            if (FPosition < 1) then
               Result:=grBOF
            else
               Result:=grOk;
            end;
         gmCurrent:
            begin
            if (FPosition=1) then
               Result:=grOK
            else
               begin
               if (FPosition < 1) then
                  Result:=grBOF
               else
                  Result:=grEOF;
               end;
            end
         else
            Result:=grError;
         end;
      end
   else
      Result:=grError;
end;

function TDBISAMRecordDataSet.GetRecordCount: Integer;
begin
   Result:=1;
end;

function TDBISAMRecordDataSet.GetRecNo: Integer;
begin
   Result:=FRecordNumber;
end;

function TDBISAMRecordDataSet.GetRecordSize: Word;
begin
   Result:=FHandle.RecordSize;
end;

function TDBISAMRecordDataSet.GetRecordID: Integer;
begin
   Result:=FHandle.GetRecordID(FRecordBuffer);
end;

function TDBISAMRecordDataSet.GetRecordHash: string;
begin
   Result:=MD5DigestToString(FHandle.GetRecordHash(FRecordBuffer));
end;

function TDBISAMRecordDataSet.GetActiveRecBuf(var RecBuf: PChar): Boolean;
begin
   if (State=dsOldValue) then
      RecBuf:=FOldRecordBuffer
   else
      RecBuf:=FRecordBuffer;
   Result:=True;
end;

{ Field Related }

function TDBISAMRecordDataSet.GetBlobFieldData(FieldNo: Integer;
                                               var Buffer: TBlobByteData): Integer;
var
   RecBuf: PChar;
begin
   Result:=0;
   if (not GetActiveRecBuf(RecBuf)) then
      Exit;
   FHandle.OpenBlob(FieldNo,RecBuf,BLOB_OPENREADONLY,FPhysicalFields,False,
                    Result,False);
   try
      if (Result > 0) then
         begin
         if (High(Buffer) < Result) then
            SetLength(Buffer,Result);
         FHandle.GetBlob(FieldNo,RecBuf,0,PChar(Buffer),Result,Result,FPhysicalFields)
         end;
   finally
      FHandle.FreeBlob(FieldNo,RecBuf,FPhysicalFields,False);
   end;
end;

function TDBISAMRecordDataSet.GetFieldData(FieldNo: Integer; Buffer: Pointer): Boolean;
var
   IsBlank: Boolean;
   RecBuf: PChar;
begin
   Result:=GetActiveRecBuf(RecBuf);
   if Result then
      begin
      if FPhysicalFields then
         FHandle.GetPhysicalField(FieldNo,RecBuf,Buffer,IsBlank)
      else
         FHandle.GetField(FieldNo,RecBuf,Buffer,IsBlank);
      Result:=(not IsBlank);
      end
end;

function TDBISAMRecordDataSet.GetFieldData(Field: TField; Buffer: Pointer): Boolean;
begin
   Result:=GetFieldData(Field.FieldNo,Buffer)
end;

procedure TDBISAMRecordDataSet.SetFieldData(Field: TField; Buffer: Pointer);
var
   RecBuf: PChar;
begin
   with Field do
      begin
      { Just exit, do not raise an exception }
      if (not (State in dsEditModes)) then
         Exit;
      GetActiveRecBuf(RecBuf);
      if (FieldNo > 0) then
         begin
         if (FHandle <> nil) then
            begin
            if FPhysicalFields then
               FHandle.PutPhysicalField(FieldNo,RecBuf,Buffer,False)
            else
               FHandle.PutField(FieldNo,RecBuf,Buffer,False,False);
            end;
         end;
      DataEvent(deFieldChange,Integer(Field));
      end;
end;

function TDBISAMRecordDataSet.GetFieldClass(FieldType: TFieldType): TFieldClass;
begin
   Result:=inherited GetFieldClass(FieldType);
end;

function TDBISAMRecordDataSet.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
begin
   Result:=TDBISAMBlobStream.Create(Field as TBlobField,Mode);
end;

procedure TDBISAMRecordDataSet.CloseBlob(Field: TField);
var
   RecBuf: PChar;
begin
   GetActiveRecBuf(RecBuf);
   if (FHandle <> nil) then
      FHandle.FreeBlob(Field.FieldNo,RecBuf,FPhysicalFields,False);
end;

function TDBISAMRecordDataSet.GetStateFieldValue(State: TDataSetState; Field: TField): Variant;
begin
   Result:=inherited GetStateFieldValue(State,Field);
end;

procedure TDBISAMRecordDataSet.SetStateFieldValue(State: TDataSetState; Field: TField; const Value: Variant);
begin
   if (State=dsOldValue) then
      Exit;
   inherited SetStateFieldValue(State,Field,Value);
end;

function TDBISAMRecordDataSet.GetCanModify: Boolean;
begin
   Result:=True;
end;

{ Index / Ranges }

procedure TDBISAMRecordDataSet.GetIndexInfo;
var
   TempIndexPos: Byte;
begin
   if (FHandle <> nil) then
      begin
      if (FHandle.IndexPos=PHYSICAL_INDEX_POS) then
         TempIndexPos:=0
      else
         TempIndexPos:=FHandle.IndexPos;
      with FHandle.GetIndexDefinition(TempIndexPos)^ do
         begin;
         FCaseInsIndex:=KeyCaseInsensitive;
         FIndexFieldCount:=KeyFieldCount;
         FIndexFieldMap:=KeyFields;
         FKeySize:=KeySize;
         end;
      end
   else
      begin
      FCaseInsIndex:=False;
      FIndexFieldCount:=0;
      FKeySize:=0;
      end;
end;

function TDBISAMRecordDataSet.GetIndexField(Index: Integer): TField;
var
   FieldNo: Integer;
begin
   if (Index < 0) or (Index >= FIndexFieldCount) then
      DatabaseError(SFieldIndexError);
   FieldNo:=FIndexFieldMap[Index+1];
   Result:=FieldByNumber(FieldNo);
   if (Result=nil) then
      begin
      if (FieldNo=RECORDID_FIELD_NUM) then
         DatabaseErrorFmt(SIndexFieldMissing,[RECORDID_FIELD_NAME])
      else if (FieldNo=RECORDHASH_FIELD_NUM) then
         DatabaseErrorFmt(SIndexFieldMissing,[RECORDHASH_FIELD_NAME])
      else
         DatabaseErrorFmt(SIndexFieldMissing,[FieldDefs[FieldNo-1].Name]);
      end;
end;

procedure TDBISAMRecordDataSet.SetIndexField(Index: Integer; Value: TField);
begin
   GetIndexField(Index).Assign(Value);
end;

function TDBISAMRecordDataSet.GetIndexFieldCount: Integer;
begin
   Result:=FIndexFieldCount;
end;

function TDBISAMRecordDataSet.GetIsIndexField(Field: TField): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with Field do
      begin
      if (FieldNo > 0) then
         begin
         for I:=0 to FIndexFieldCount-1 do
            begin
            if (FIndexFieldMap[I+1]=FieldNo) then
               begin
               Result:=True;
               Exit;
               end;
            end;
         end;
      end;
end;

{ Dummy abstract overrides }

procedure TDBISAMRecordDataSet.GetBookmarkData(Buffer: PChar; Data: Pointer);
begin
end;

function TDBISAMRecordDataSet.GetBookmarkFlag(Buffer: PChar): TBookmarkFlag;
begin
   Result:=bfCurrent;
end;

procedure TDBISAMRecordDataSet.InternalAddRecord(Buffer: Pointer; Append: Boolean);
begin
end;

procedure TDBISAMRecordDataSet.InternalDelete;
begin
end;

procedure TDBISAMRecordDataSet.InternalFirst;
begin
end;

procedure TDBISAMRecordDataSet.InternalGotoBookmark(Bookmark: Pointer);
begin
end;

procedure TDBISAMRecordDataSet.InternalInitRecord(Buffer: PChar);
begin
end;

procedure TDBISAMRecordDataSet.InternalLast;
begin
end;

procedure TDBISAMRecordDataSet.InternalPost;
begin
end;

procedure TDBISAMRecordDataSet.InternalSetToRecord(Buffer: PChar);
begin
end;

procedure TDBISAMRecordDataSet.SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag);
begin
end;

procedure TDBISAMRecordDataSet.SetBookmarkData(Buffer: PChar; Data: Pointer);
begin
end;

{ TDBISAMRecord }

constructor TDBISAMRecord.Create;
begin
   FRecordDataSet:=TDBISAMRecordDataSet.Create(nil);
end;

destructor TDBISAMRecord.Destroy;
begin
   FRecordDataSet.Free;
   inherited;
end;

procedure TDBISAMRecord.Initialize(CursorHandle: TDataCursor;
                                   RecordNumber: Integer;
                                   RecordBuffer: PChar;
                                   OldRecordBuffer: PChar;
                                   UsePhysicalFields: Boolean);
begin
   with FRecordDataSet do
      begin
      SetHandle(CursorHandle,UsePhysicalFields);
      SetRecordNumber(RecordNumber);
      SetRecordBuffer(RecordBuffer);
      SetOldRecordBuffer(OldRecordBuffer);
      if (not Active) then
         Open
      else
         Refresh;
      end;
end;

procedure TDBISAMRecord.StartUpdateableTrigger;
begin
   FRecordDataSet.Edit;
end;

procedure TDBISAMRecord.EndUpdateableTrigger;
begin
   with FRecordDataSet do
      begin
      if (State=dsEdit) then
         begin
         if Modified then
            Post
         else
            Cancel;
         end;
      end;
end;

function TDBISAMRecord.Updating: Boolean;
begin
   Result:=(FRecordDataSet.State=dsEdit);
end;

function TDBISAMRecord.GetFieldCount: Integer;
begin
   Result:=FRecordDataSet.FieldCount;
end;

function TDBISAMRecord.GetFields: TFields;
begin
   Result:=FRecordDataSet.Fields;
end;

function TDBISAMRecord.GetFieldValue(const FieldName: string): Variant;
begin
   Result:=FRecordDataSet.FieldValues[FieldName];
end;

procedure TDBISAMRecord.SetFieldValue(const FieldName: string; const Value: Variant);
begin
   FRecordDataSet.FieldValues[FieldName]:=Value;
end;

function TDBISAMRecord.GetModified: Boolean;
begin
   Result:=FRecordDataSet.Modified;
end;

function TDBISAMRecord.GetRecNo: Integer;
begin
   Result:=FRecordDataSet.RecNo;
end;

function TDBISAMRecord.GetRecordID: Integer;
begin
   Result:=FRecordDataSet.RecordID;
end;

function TDBISAMRecord.GetRecordHash: string;
begin
   Result:=FRecordDataSet.RecordHash;
end;

function TDBISAMRecord.GetRecordSize: Word;
begin
   Result:=FRecordDataSet.RecordSize;
end;

function TDBISAMRecord.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
begin
   Result:=FRecordDataSet.CreateBlobStream(Field,Mode);
end;

function TDBISAMRecord.FieldByName(const FieldName: string): TField;
begin
   Result:=FRecordDataSet.FieldByName(FieldName);
end;

function TDBISAMRecord.FindField(const FieldName: string): TField;
begin
   Result:=FRecordDataSet.FindField(FieldName);
end;

function TDBISAMRecord.GetBlobFieldData(FieldNo: Integer; var Buffer: TBlobByteData): Integer;
begin
   Result:=FRecordDataSet.GetBlobFieldData(FieldNo,Buffer);
end;

procedure TDBISAMRecord.GetFieldNames(List: TStrings);
begin
   FRecordDataSet.GetFieldNames(List);
end;

{ TDBISAMDataSet }

constructor TDBISAMDataSet.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FRemoteReadSize:=1;
end;

destructor TDBISAMDataSet.Destroy;
begin
   SetUpdateObject(nil);
   inherited Destroy;
end;

procedure TDBISAMDataSet.OpenCursor(InfoQuery: Boolean);
begin
   FHandle:=CreateHandle;
   if (FHandle=nil) then
      DatabaseError(SHandleError);
   inherited OpenCursor(InfoQuery);
end;

procedure TDBISAMDataSet.DoBeforeClose;
begin
   if (State in [dsInsert,dsEdit,dsSetKey]) then
      Cancel;
   inherited;
end;

procedure TDBISAMDataSet.CloseCursor;
begin
   EndCachedUpdates;
   inherited CloseCursor;
   if (FHandle <> nil) then
      begin
      DestroyHandle;
      FHandle:=nil;
      end;
end;

function TDBISAMDataSet.CreateHandle: TDataCursor;
begin
   Result:=nil;
end;

procedure TDBISAMDataSet.DestroyHandle;
begin
   if (FHandle <> nil) then
      begin
      with FHandle do
         begin
         if (not ResultSet) then
            begin
            CloseCursor(True);
            Free;
            end;
         end;
      end;
end;

procedure TDBISAMDataSet.InternalClearFieldDefs;
begin
   FieldDefs.Clear;
end;

procedure TDBISAMDataSet.InternalInitFieldDefs;
var
   I: Integer;
   TempFieldDefinition: pFieldDefinition;
   TempName: string;
   TempDataType: TFieldType;
   TempSize: Word;
   TempRequired: Boolean;
   TempDefaultValue: string;
   TempMinValue: string;
   TempMaxValue: string;
   TempDescription: string;
   TempCharCase: TFieldCharCase;
   TempCompression: Byte;
   TempFieldNo: Integer;
begin
   InternalClearFieldDefs;
   if (FHandle <> nil) then
      begin
      for I:=1 to FHandle.FieldCount do
         begin
         TempFieldDefinition:=FHandle.GetFieldDefinition(I);
         if (not TempFieldDefinition^.Hidden) then
            begin
            DecodeFieldDefinition(TempFieldDefinition,TempFieldNo,
                                  TempName,TempDataType,TempSize,TempRequired,
                                  TempDefaultValue,TempMinValue,TempMaxValue,
                                  TempDescription,TempCharCase,TempCompression);
            AddFieldDefinition(TempFieldNo,TempName,TempDataType,TempSize,TempRequired,
                               TempDefaultValue,TempMinValue,TempMaxValue,
                               TempDescription,TempCharCase,TempCompression);
            end;
         end;
      end;
end;

procedure TDBISAMDataSet.SetFieldDisplayLabels;
var
   I: Integer;
begin
   if (FHandle=nil) or (not FAutoDisplayLabels) then
      Exit;
   for I:=0 to FieldCount-1 do
      begin
      with Fields[I] do
         begin
         if (not (FieldKind in [fkCalculated,fkLookup])) then
            begin
            with FHandle.GetFieldDefinition(FieldNo)^ do
               begin
               if (Description <> '') then
                  DisplayLabel:=Description;
               end;
            end;
         end;
      end;
end;

procedure TDBISAMDataSet.SetFieldOrigins;
var
   I: Integer;
begin
   if (FHandle=nil) then
      Exit;
   for I:=0 to FieldCount-1 do
      begin
      with Fields[I] do
         begin
         if (not (FieldKind in [fkCalculated,fkLookup])) then
            begin
            with FHandle.GetFieldDefinition(FieldNo)^ do
               Origin:=FieldOrigin;
            end;
         end;
      end;
end;

procedure TDBISAMDataSet.InternalOpen;
begin
   if (FHandle <> nil) then
      begin
      FRecordSize:=FHandle.RecordSize;
      BookmarkSize:=FHandle.BookmarkSize;
      FCanModify:=(not FHandle.ReadOnly);
      FieldDefs.Updated:=False;
      FieldDefs.Update;
      GetIndexInfo;
      if DefaultFields then
         CreateFields;
      BindFields(True);
      SetFieldDisplayLabels;
      SetFieldOrigins;
      InitBufferPointers(False);
      AllocOldRecordBuffer;
      AllocKeyBuffers;
      FHandle.RecordsToRead:=FRemoteReadSize;
      PrepareCursor;
      if Filtered then
         ActivateFilters;
      FHandle.SetToBegin;
      end;
end;

procedure TDBISAMDataSet.InternalClose;
begin
   FFuncFilter:=nil;
   FExprFilter:=nil;
   FreeKeyBuffers;
   FreeOldRecordBuffer;
   BindFields(False);
   if DefaultFields then
      DestroyFields;
   FIndexFieldCount:=0;
   FKeySize:=0;
   FCanModify:=False;
   FCaseInsIndex:=False;
end;

procedure TDBISAMDataSet.PrepareCursor;
begin
end;

function TDBISAMDataSet.IsCursorOpen: Boolean;
begin
   Result:=(FHandle <> nil);
end;

procedure TDBISAMDataSet.InternalHandleException;
begin
   ApplicationHandleException(Self)
end;

{ Record Functions }

procedure TDBISAMDataSet.InitBufferPointers(GetProps: Boolean);
begin
   if (FHandle <> nil) then
      begin
      if GetProps then
         begin
         FRecordSize:=FHandle.RecordSize;
         BookmarkSize:=FHandle.BookmarkSize;
         end;
      FRecInfoOfs:=FRecordSize+CalcFieldsSize;
      FBookmarkOfs:=FRecInfoOfs+SizeOf(TRecInfo);
      FRecBufSize:=FBookmarkOfs+BookmarkSize;
      end;
end;

function TDBISAMDataSet.AllocRecordBuffer: PChar;
begin
   Result:=AllocMem(FRecBufSize);
end;

procedure TDBISAMDataSet.FreeRecordBuffer(var Buffer: PChar);
begin
   DeAllocMem(Buffer);
end;

procedure TDBISAMDataSet.InternalInitRecord(Buffer: PChar);
begin
   if (FHandle <> nil) then
      FHandle.InitRecord(Buffer);
end;

procedure TDBISAMDataSet.ClearCalcFields(Buffer: PChar);
begin
   FillChar(Buffer[RecordSize],CalcFieldsSize,0);
end;

procedure TDBISAMDataSet.InitRecord(Buffer: PChar);
begin
   inherited InitRecord(Buffer);
   with PRecInfo(Buffer+FRecInfoOfs)^ do
      begin
      BookMarkFlag:=bfInserted;
      { Version 5 }
      RecordNumber:=0;
      { Version 5 }
      end;
end;

function TDBISAMDataSet.GetRecord(Buffer: PChar; GetMode: TGetMode;
   DoCheck: Boolean): TGetResult;
var
   TempCode: Integer;
   TempMsg: string;
begin
   if (FHandle <> nil) then
      begin
      try
         case GetMode of
            gmCurrent:
               TempCode:=FHandle.GetCurrentRecord(Buffer,False);
            gmNext:
               TempCode:=FHandle.GetNextRecord(Buffer);
            gmPrior:
               TempCode:=FHandle.GetPriorRecord(Buffer);
            else
               TempCode:=DBISAM_NONE;
            end;
      except
         on E: Exception do
            begin
            TempCode:=Engine.Handle.ConvertExceptionToCode(E);
            TempMsg:=E.Message;
            end;
      end;
      case TempCode of
         DBISAM_NONE:
            begin
            with PRecInfo(Buffer+FRecInfoOfs)^ do
               begin
               BookmarkFlag:=bfCurrent;
               RecordNumber:=FHandle.RecordNumber;
               end;
            GetCalcFields(Buffer);
            FHandle.GetBookmark(Buffer+FBookmarkOfs);
            Result:=grOK;
            end;
         DBISAM_BOF:
            begin
            Result:=grBOF;
            { Version 5 }
            { Reset the record number }
            with PRecInfo(Buffer+FRecInfoOfs)^ do
               RecordNumber:=FHandle.RecordNumber;
            { Version 5 }
            end;
         DBISAM_EOF:
            begin
            Result:=grEOF;
            { Version 5 }
            { Reset the record number }
            with PRecInfo(Buffer+FRecInfoOfs)^ do
               RecordNumber:=FHandle.RecordNumber;
            { Version 5 }
            end;
         else
            begin
            Result:=grError;
            { Version 5 }
            { If there is no current record, then reset
              the record number }
            if (TempCode=DBISAM_NOCURRREC) then
               begin
               with PRecInfo(Buffer+FRecInfoOfs)^ do
                  RecordNumber:=FHandle.RecordNumber;
               end;
            { Version 5 }
            if DoCheck then
               FHandle.CheckError(TempCode,TempMsg);
            end;
         end;
      end
   else
      Result:=grError;
end;

function TDBISAMDataSet.GetCurrentRecord(Buffer: PChar): Boolean;
begin
   if (FHandle <> nil) then
      begin
      if (not IsEmpty) and (GetBookmarkFlag(ActiveBuffer)=bfCurrent) then
         begin
         UpdateCursorPos;
         Result:=(FHandle.GetCurrentRecord(Buffer,False)=DBISAM_NONE);
         end
      else
         Result:=False;
      end
   else
      Result:=False;
end;

function TDBISAMDataSet.GetNextRecords: Integer;
var
   OldRecordsToRead: Integer;
begin
   Result:=0;
   if (FHandle <> nil) then
      begin
      OldRecordsToRead:=FHandle.RecordsToRead;
      FHandle.RecordsToRead:=MaximumInteger(BufferCount,OldRecordsToRead);
      try
         Result:=inherited GetNextRecords;
      finally
         FHandle.RecordsToRead:=OldRecordsToRead;
      end;
      end;
end;

function TDBISAMDataSet.GetPriorRecords: Integer;
var
   OldRecordsToRead: Integer;
begin
   Result:=0;
   if (FHandle <> nil) then
      begin
      OldRecordsToRead:=FHandle.RecordsToRead;
      FHandle.RecordsToRead:=MaximumInteger(BufferCount,OldRecordsToRead);
      try
         Result:=inherited GetPriorRecords;
      finally
         FHandle.RecordsToRead:=OldRecordsToRead;
      end;
      end;
end;

procedure TDBISAMDataSet.FlushBuffers;
begin
   CheckActive;
   if (FHandle <> nil) then
      begin
      if FHandle.Exclusive and (not FHandle.InTransaction) then
         FHandle.FlushBuffers(True,False,False,False,False);
      FHandle.FlushOSBuffers;
      end;
end;

function TDBISAMDataSet.GetRecordCount: Integer;
begin
   CheckActive;
   if (FHandle <> nil) then
      begin
      if Engine.FilterRecordCounts then
         Result:=FHandle.RecordCount
      else
         begin
         if FHandle.FiltersInEffect or
            (FHandle.ResultSet and FHandle.SourceTable) then
            Result:=FHandle.TotalRecordCount
         else
            Result:=FHandle.RecordCount;
         end;
      end
   else
      Result:=0;
end;

function TDBISAMDataSet.GetFilterRecordCount: Integer;
begin
   CheckActive;
   if (FHandle <> nil) then
      Result:=FHandle.RecordCount
   else
      Result:=0;
end;

function TDBISAMDataSet.GetRecNo: Integer;
var
   BufPtr: PChar;
begin
   CheckActive;
   if (State=dsCalcFields) then
      BufPtr:=CalcBuffer
   else
      BufPtr:=ActiveBuffer;
   Result:=PRecInfo(BufPtr+FRecInfoOfs).RecordNumber;
end;

procedure TDBISAMDataSet.SetRecNo(Value: Integer);
begin
   CheckBrowseMode;
   if (Value <> RecNo) then
      begin
      DoBeforeScroll;
      if (FHandle <> nil) then
         FHandle.SetToRecordNumber(Value);
      Resync([rmCenter]);
      DoAfterScroll;
      end;
end;

function TDBISAMDataSet.GetRecordSize: Word;
begin
   Result:=FRecordSize;
end;

function TDBISAMDataSet.GetRecordID: Integer;
var
   BufPtr: PChar;
begin
   CheckActive;
   if (State=dsCalcFields) then
      BufPtr:=CalcBuffer
   else
      BufPtr:=ActiveBuffer;
   Result:=FHandle.GetRecordID(BufPtr);
end;

function TDBISAMDataSet.GetRecordHash: string;
var
   BufPtr: PChar;
begin
   CheckActive;
   if (State=dsCalcFields) then
      BufPtr:=CalcBuffer
   else
      BufPtr:=ActiveBuffer;
   Result:=MD5DigestToString(FHandle.GetRecordHash(BufPtr));
end;

function TDBISAMDataSet.GetActiveRecBuf(var RecBuf: PChar): Boolean;
begin
   case State of
      dsBrowse,dsBlockRead,dsInactive:
         begin
         if IsEmpty then
            RecBuf:=nil
         else
            RecBuf:=ActiveBuffer;
         end;
      dsEdit,dsInsert:
         RecBuf:=ActiveBuffer;
      dsSetKey:
         RecBuf:=PChar(FKeyBuffer)+SizeOf(TKeyBuffer);
      dsCalcFields:
         RecBuf:=CalcBuffer;
      dsFilter:
         RecBuf:=FFilterBuffer;
      dsNewValue:
         RecBuf:=ActiveBuffer;
      dsOldValue:
         RecBuf:=FOldRecordBuffer;
      else
         RecBuf:=nil;
      end;
   Result:=(RecBuf <> nil);
end;

{ Field Related }

function TDBISAMDataSet.GetBlobFieldData(FieldNo: Integer;
                                         var Buffer: TBlobByteData): Integer;
var
   RecBuf: PChar;
begin
   if (not GetActiveRecBuf(RecBuf)) then
      Exit;
   FHandle.OpenBlob(FieldNo,RecBuf,BLOB_OPENREADONLY,False,False,
                    Result,False);
   try
      if (Result > 0) then
         begin
         if (High(Buffer) < Result) then
            SetLength(Buffer,Result);
         FHandle.GetBlob(FieldNo,RecBuf,0,PChar(Buffer),Result,Result,False)
         end;
   finally
      FHandle.FreeBlob(FieldNo,RecBuf,False,False);
   end;
end;

function TDBISAMDataSet.GetFieldData(FieldNo: Integer; Buffer: Pointer): Boolean;
var
   IsBlank: Boolean;
   RecBuf: PChar;
begin
   Result:=GetActiveRecBuf(RecBuf);
   if Result then
      begin
      FHandle.GetField(FieldNo,RecBuf,Buffer,IsBlank);
      Result:=(not IsBlank);
      end
end;

function TDBISAMDataSet.GetFieldData(Field: TField; Buffer: Pointer): Boolean;
var
   RecBuf: PChar;
begin
   if (Field.FieldNo > 0) then
      Result:=GetFieldData(Field.FieldNo,Buffer)
   else
      begin
      Result:=GetActiveRecBuf(RecBuf);
      if Result and (State in [dsBrowse,dsBlockRead,dsEdit,dsInsert,dsCalcFields]) then
         begin
         Inc(RecBuf,(FRecordSize+Field.Offset));
         Result:=Boolean(RecBuf[0]);
         if Result and (Buffer <> nil) then
            Move(RecBuf[1],Buffer^,Field.DataSize);
         end;
      end;
end;

procedure TDBISAMDataSet.SetFieldData(Field: TField; Buffer: Pointer);
var
   RecBuf: PChar;
   I: Integer;
begin
   with Field do
      begin
      if (not (State in dsWriteModes)) then
         DatabaseError(SNotEditing);
      if (State=dsSetKey) and ((FieldNo < 0) or (FIndexFieldCount > 0) and
         (not IsIndexField)) then
         DatabaseErrorFmt(SNotIndexField,[DisplayName]);
      GetActiveRecBuf(RecBuf);
      if (FieldNo > 0) then
         begin
         if (State=dsCalcFields) then
            DatabaseError(SNotEditing);
         if ReadOnly and not (State in [dsSetKey,dsFilter]) then
            DatabaseErrorFmt(SFieldReadOnly,[DisplayName]);
         Validate(Buffer);
         if (FieldKind <> fkInternalCalc) then
            begin
            if (FHandle <> nil) then
               FHandle.PutField(FieldNo,RecBuf,Buffer,False,False);
            end;
         end
      else {fkCalculated,fkLookup}
         begin
         Inc(RecBuf,FRecordSize+Offset);
         Boolean(RecBuf[0]):=LongBool(Buffer);
         if Boolean(RecBuf[0]) then
            Move(Buffer^,RecBuf[1],DataSize);
         end;
      if not (State in [dsCalcFields,dsFilter,dsNewValue]) then
         begin
         DataEvent(deFieldChange,Integer(Field));
         { Be sure to also check for expression fields and refresh
           them also }
         { Version 5 }
         if (FieldKind=fkData) and FHandle.HasExpressionFields then
         { Version 5 }
            begin
            for I:=0 to FieldCount-1 do
               begin
               { Version 5 }
               if (not (Fields[I].FieldKind in [fkCalculated,fkLookup])) then
               { Version 5 }
                  begin
                  with FHandle.GetFieldDefinition(Fields[I].FieldNo)^ do
                     begin
                     if ExpressionField then
                        DataEvent(deFieldChange,Integer(Fields[I]));
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

function TDBISAMDataSet.GetFieldClass(FieldType: TFieldType): TFieldClass;
begin
   Result:=inherited GetFieldClass(FieldType);
end;

function TDBISAMDataSet.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
begin
   Result:=TDBISAMBlobStream.Create(Field as TBlobField,Mode);
end;

procedure TDBISAMDataSet.CloseBlob(Field: TField);
var
   RecBuf: PChar;
begin
   GetActiveRecBuf(RecBuf);
   if (FHandle <> nil) then
      FHandle.FreeBlob(Field.FieldNo,RecBuf,False,False);
end;

function TDBISAMDataSet.GetStateFieldValue(State: TDataSetState; Field: TField): Variant;
begin
   Result:=inherited GetStateFieldValue(State,Field);
end;

procedure TDBISAMDataSet.SetStateFieldValue(State: TDataSetState; Field: TField; const Value: Variant);
begin
   if (State=dsOldValue) then
      DatabaseErrorFmt(SFieldReadOnly,[Field.DisplayName]);
   inherited SetStateFieldValue(State,Field,Value);
end;

function TDBISAMDataSet.GetFilterOptimizeLevel: TFilterOptimizeLevel;
begin
   Result:=foNone;
   CheckActive;
   if (FHandle <> nil) then
      begin
      case FHandle.FilterOptimizeLevel of
         olNone:
            Result:=foNone;
         olPartial:
            Result:=foPartial;
         olFull:
            Result:=foFull;
         end;
      end;
end;

procedure TDBISAMDataSet.SetAutoDisplayLabels(Value: Boolean);
begin
   if (Value <> FAutoDisplayLabels) then
      begin
      FAutoDisplayLabels:=Value;
      SetFieldDisplayLabels;
      end;
end;

procedure TDBISAMDataSet.SetCopyOnAppend(Value: Boolean);
begin
   if (Value <> FCopyOnAppend) then
      FCopyOnAppend:=Value;
end;

{ Navigation / Editing }

procedure TDBISAMDataSet.InternalFirst;
begin
   if (FHandle <> nil) then
      FHandle.SetToBegin;
end;

procedure TDBISAMDataSet.InternalLast;
begin
   if (FHandle <> nil) then
      FHandle.SetToEnd;
end;

procedure TDBISAMDataSet.InternalEdit;
var
   TempCode: Word;
   TempMsg: string;
begin
   if (FHandle <> nil) then
      begin
      TempMsg:='';
      TempCode:=FHandle.GetCurrentRecord(ActiveBuffer,True);
      Move(ActiveBuffer^,FOldRecordBuffer^,FRecordSize);
      FHandle.CheckError(TempCode,TempMsg);
      end;
end;

procedure TDBISAMDataSet.InternalPost;
begin
   inherited;
   if (FHandle <> nil) then
      begin
      if (State=dsEdit) then
         FHandle.ModifyRecord(ActiveBuffer,True,True)
      else
         FHandle.AppendRecord(ActiveBuffer,True);
      end;
end;

procedure TDBISAMDataSet.InternalDelete;
begin
   if (FHandle <> nil) then
      begin
      { Be sure to cancel any Edits and free any field buffers first }
      InternalCancel;
      FreeFieldBuffers;
      FHandle.DeleteRecord(ActiveBuffer,True);
      end;
end;

function TDBISAMDataSet.IsSequenced: Boolean;
begin
   if Engine.FilterRecordCounts then
      Result:=(FHandle <> nil) and
              (not (FHandle.FiltersInEffect or
                    (FHandle.ResultSet and FHandle.SourceTable)))
   else
      Result:=(FHandle <> nil);
end;

function TDBISAMDataSet.GetCanModify: Boolean;
begin
   Result:=FCanModify;
end;

procedure TDBISAMDataSet.InternalRefresh;
begin
   if (FHandle <> nil) then
      begin
      if FCachingUpdates then
         begin
         FCachedHandle.Refresh;
         FCachedHandle.PopulateCachedUpdates;         
         CursorPosChanged;
         UpdateCursorPos;
         end
      else
         FHandle.Refresh;
      end;
end;

procedure TDBISAMDataSet.Post;
begin
   inherited Post;
   if (State=dsSetKey) then
      PostKeyBuffer(True);
end;

procedure TDBISAMDataSet.Cancel;
begin
   inherited Cancel;
   if (State=dsSetKey) then
      PostKeyBuffer(False);
end;

procedure TDBISAMDataSet.InternalCancel;
var
   RecBuf: PChar;
begin
   if (FHandle <> nil) then
      begin
      if (State=dsEdit) then
         FHandle.CancelRecord;
      GetActiveRecBuf(RecBuf);
      FHandle.CancelAllBlobs(RecBuf);
      end;
end;

procedure TDBISAMDataSet.InternalAddRecord(Buffer: Pointer; Append: Boolean);
begin
   if (FHandle <> nil) then
      FHandle.AppendRecord(Buffer,True);
end;

procedure TDBISAMDataSet.InternalGotoBookmark(Bookmark: TBookmark);
begin
   if (FHandle <> nil) then
      FHandle.SetToBookmark(Bookmark,False,False);
end;

procedure TDBISAMDataSet.InternalSetToRecord(Buffer: PChar);
begin
   InternalGotoBookmark(Buffer+FBookmarkOfs);
end;

function TDBISAMDataSet.GetBookmarkFlag(Buffer: PChar): TBookmarkFlag;
begin
   Result:=PRecInfo(Buffer+FRecInfoOfs).BookmarkFlag;
end;

procedure TDBISAMDataSet.SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag);
begin
   PRecInfo(Buffer+FRecInfoOfs).BookmarkFlag:=Value;
end;

procedure TDBISAMDataSet.GetBookmarkData(Buffer: PChar; Data: Pointer);
begin
   Move(Buffer[FBookmarkOfs],Data^,BookmarkSize);
end;

procedure TDBISAMDataSet.SetBookmarkData(Buffer: PChar; Data: Pointer);
begin
   Move(Data^,Buffer[FBookmarkOfs],BookmarkSize);
end;

function TDBISAMDataSet.CompareBookmarks(Bookmark1,Bookmark2: TBookmark): Integer;
const
   RetCodes: array[Boolean,Boolean] of ShortInt=((2,-1),(1,0));
begin
   { Check for uninitialized bookmarks }
   Result:=RetCodes[(Bookmark1=nil),(Bookmark2=nil)];
   if (Result=2) then
      begin
      if (FHandle <> nil) then
         Result:=FHandle.CompareBookmarks(Bookmark1,Bookmark2);
      if (Result=2) then
         Result:=0;
      end;
end;

function TDBISAMDataSet.BookmarkValid(Bookmark: TBookmark): Boolean;
begin
   Result:=(FHandle <> nil);
   if Result then
      begin
      CursorPosChanged;
      Result:=FHandle.SetToBookmark(Bookmark,False,False);
      end;
end;

procedure TDBISAMDataSet.SetRemoteReadSize(Value: Integer);
begin
   if (Value <> FRemoteReadSize) and (Value > 0) then
      begin
      if Active then
         begin
         if (FHandle <> nil) then
            begin
            FRemoteReadSize:=Value;
            FHandle.RecordsToRead:=Value;
            end;
         end
      else
         FRemoteReadSize:=Value;
      end;
end;

procedure TDBISAMDataSet.SetBlockReadSize(Value: Integer);
begin
   inherited;
   SetRemoteReadSize(Value);
end;

{ Index / Ranges }

procedure TDBISAMDataSet.GetIndexInfo;
begin
   if (FHandle <> nil) and (not FHandle.ResultSet) then
      begin
      with FHandle.GetIndexDefinition(FHandle.IndexPos)^ do
         begin;
         FCaseInsIndex:=KeyCaseInsensitive;
         FIndexFieldCount:=KeyFieldCount;
         FIndexFieldMap:=KeyFields;
         FKeySize:=KeySize;
         end;
      end
   else
      begin
      FCaseInsIndex:=False;
      FIndexFieldCount:=0;
      FKeySize:=0;
      end;
end;

procedure TDBISAMDataSet.SwitchToIndex(const IndexName: string);
begin
   ResetCursorRange;
   UpdateCursorPos;
   if (FHandle <> nil) then
      FHandle.IndexName:=IndexName;
   FKeySize:=0;
   FCaseInsIndex:=False;
   FIndexFieldCount:=0;
   SetBufListSize(0);
   InitBufferPointers(True);
   try
      SetBufListSize(BufferCount+1);
   except
      SetState(dsInactive);
      CloseCursor;
      raise;
   end;
   GetIndexInfo;
end;

function TDBISAMDataSet.GetIndexField(Index: Integer): TField;
var
   FieldNo: Integer;
begin
   if (Index < 0) or (Index >= FIndexFieldCount) then
      DatabaseError(SFieldIndexError);
   FieldNo:=FIndexFieldMap[Index+1];
   Result:=FieldByNumber(FieldNo);
   if (Result=nil) then
      begin
      if (FieldNo=RECORDID_FIELD_NUM) then
         DatabaseErrorFmt(SIndexFieldMissing,[RECORDID_FIELD_NAME])
      else if (FieldNo=RECORDHASH_FIELD_NUM) then
         DatabaseErrorFmt(SIndexFieldMissing,[RECORDHASH_FIELD_NAME])
      else
         DatabaseErrorFmt(SIndexFieldMissing,[FieldDefs[FieldNo-1].Name]);
      end;
end;

procedure TDBISAMDataSet.SetIndexField(Index: Integer; Value: TField);
begin
   GetIndexField(Index).Assign(Value);
end;

function TDBISAMDataSet.GetIndexFieldCount: Integer;
begin
   Result:=FIndexFieldCount;
end;

procedure TDBISAMDataSet.AllocKeyBuffers;
var
   KeyIndex: TKeyIndex;
begin
   try
      for KeyIndex:=Low(TKeyIndex) to High(TKeyIndex) do
         begin
         FKeyBuffers[KeyIndex]:=InitKeyBuffer(
            AllocMem(SizeOf(TKeyBuffer)+FRecordSize));
         FSaveKeyBuffers[KeyIndex]:=InitKeyBuffer(
            AllocMem(SizeOf(TKeyBuffer)+FRecordSize));
         end;
   except
      FreeKeyBuffers;
      raise;
   end;
end;

procedure TDBISAMDataSet.SaveKeyBuffers;
var
   KeyIndex: TKeyIndex;
begin
   for KeyIndex:=Low(TKeyIndex) to High(TKeyIndex) do
      begin
      Move(FKeyBuffers[KeyIndex]^,FSaveKeyBuffers[KeyIndex]^,
           SizeOf(TKeyBuffer)+FRecordSize);
      FillChar(FKeyBuffers[KeyIndex]^,SizeOf(TKeyBuffer)+FRecordSize,#0);
      end;
end;

procedure TDBISAMDataSet.RestoreKeyBuffers;
var
   KeyIndex: TKeyIndex;
begin
   for KeyIndex:=Low(TKeyIndex) to High(TKeyIndex) do
      Move(FSaveKeyBuffers[KeyIndex]^,FKeyBuffers[KeyIndex]^,
           SizeOf(TKeyBuffer)+FRecordSize);
   FillChar(FKeyBuffers[kiCurRangeStart]^,SizeOf(TKeyBuffer)+FRecordSize,#0);
   FillChar(FKeyBuffers[kiCurRangeEnd]^,SizeOf(TKeyBuffer)+FRecordSize,#0);
end;

procedure TDBISAMDataSet.AllocOldRecordBuffer;
begin
   FOldRecordBuffer:=AllocMem(FRecBufSize);
end;

procedure TDBISAMDataSet.FreeOldRecordBuffer;
begin
   DeAllocMem(FOldRecordBuffer);
end;

procedure TDBISAMDataSet.FreeKeyBuffers;
var
   KeyIndex: TKeyIndex;
begin
   for KeyIndex:=Low(TKeyIndex) to High(TKeyIndex) do
      begin
      DeAllocMem(FKeyBuffers[KeyIndex]);
      DeAllocMem(FSaveKeyBuffers[KeyIndex]);
      end;
end;

function TDBISAMDataSet.InitKeyBuffer(Buffer: PKeyBuffer): PKeyBuffer;
begin
   FillChar(Buffer^,SizeOf(TKeyBuffer)+FRecordSize,0);
   if (FHandle <> nil) then
      FHandle.ClearRecord(PChar(Buffer)+SizeOf(TKeyBuffer));
   Result:=Buffer;
end;

procedure TDBISAMDataSet.CheckSetKeyMode;
begin
   if (State <> dsSetKey) then
      DatabaseError(SNotEditing);
end;

function TDBISAMDataSet.SetCursorRange: Boolean;
var
   RangeStart,RangeEnd: PKeyBuffer;
   StartKey,EndKey: PChar;
   FirstKeyBuffer: array [0..MAX_KEYLEN-1] of Char;
   SecondKeyBuffer: array [0..MAX_KEYLEN-1] of Char;
   UseStartKey,UseEndKey,UseKey: Boolean;
begin
   Result:=False;
   if (FHandle <> nil) then
      begin
      if not (
         BuffersEqual(FKeyBuffers[kiRangeStart],FKeyBuffers[kiCurRangeStart],
         SizeOf(TKeyBuffer)+FRecordSize) and
         BuffersEqual(FKeyBuffers[kiRangeEnd],FKeyBuffers[kiCurRangeEnd],
         SizeOf(TKeyBuffer)+FRecordSize)) then
         begin
         UseStartKey:=True;
         UseEndKey:=True;
         RangeStart:=FKeyBuffers[kiRangeStart];
         if RangeStart^.Modified then
            begin
            StartKey:=PChar(RangeStart)+SizeOf(TKeyBuffer);
            FHandle.GetKeyValues(StartKey,@FirstKeyBuffer);
            end
         else
            StartKey:=nil;
         RangeEnd:=FKeyBuffers[kiRangeEnd];
         if RangeEnd^.Modified then
            begin
            EndKey:=PChar(RangeEnd)+SizeOf(TKeyBuffer);
            FHandle.GetKeyValues(EndKey,@SecondKeyBuffer);
            end
         else
            EndKey:=nil;
         UseKey:=UseStartKey and UseEndKey;
         if UseKey then
            begin
            if (StartKey <> nil) then
               StartKey:=@FirstKeyBuffer;
            if (EndKey <> nil) then
               EndKey:=@SecondKeyBuffer;
            end;
         FHandle.SetRange(UseKey,StartKey,RangeStart^.FieldCount,
                          EndKey,RangeEnd^.FieldCount);
         Move(FKeyBuffers[kiRangeStart]^,FKeyBuffers[kiCurRangeStart]^,
            SizeOf(TKeyBuffer)+FRecordSize);
         Move(FKeyBuffers[kiRangeEnd]^,FKeyBuffers[kiCurRangeEnd]^,
            SizeOf(TKeyBuffer)+FRecordSize);
         Result:=True;
         end;
      end;
end;

function TDBISAMDataSet.ResetCursorRange: Boolean;
begin
   Result:=False;
   if FHandle.RangeInEffect then
      begin
      FHandle.ResetRange;
      InitKeyBuffer(FKeyBuffers[kiCurRangeStart]);
      InitKeyBuffer(FKeyBuffers[kiCurRangeEnd]);
      Result:=True;
      end;
end;

procedure TDBISAMDataSet.SetLinkRanges(MasterFields: TList);
var
   I: Integer;
   SaveState: TDataSetState;
begin
   SaveState:=SetTempState(dsSetKey);
   try
      FKeyBuffer:=InitKeyBuffer(FKeyBuffers[kiRangeStart]);
      FKeyBuffer^.Modified:=True;
      for I:=0 to MasterFields.Count-1 do
         GetIndexField(I).Assign(TField(MasterFields[I]));
      FKeyBuffer^.FieldCount:=MasterFields.Count;
   finally
      RestoreState(SaveState);
   end;
   Move(FKeyBuffers[kiRangeStart]^,FKeyBuffers[kiRangeEnd]^,
      SizeOf(TKeyBuffer)+FRecordSize);
end;

function TDBISAMDataSet.GetKeyBuffer(KeyIndex: TKeyIndex): PKeyBuffer;
begin
   Result:=FKeyBuffers[KeyIndex];
end;

procedure TDBISAMDataSet.SetKeyBuffer(KeyIndex: TKeyIndex; Clear: Boolean);
begin
   CheckBrowseMode;
   FKeyBuffer:=FKeyBuffers[KeyIndex];
   Move(FKeyBuffer^,FKeyBuffers[kiSave]^,SizeOf(TKeyBuffer)+FRecordSize);
   if Clear then
      InitKeyBuffer(FKeyBuffer);
   SetState(dsSetKey);
   SetModified(FKeyBuffer.Modified);
   DataEvent(deDataSetChange,0);
end;

procedure TDBISAMDataSet.PostKeyBuffer(Commit: Boolean);
begin
   DataEvent(deCheckBrowseMode,0);
   if Commit then
      FKeyBuffer.Modified:=Modified
   else
      Move(FKeyBuffers[kiSave]^,FKeyBuffer^,SizeOf(TKeyBuffer)+FRecordSize);
   SetState(dsBrowse);
   DataEvent(deDataSetChange,0);
end;

function TDBISAMDataSet.GetKeyFieldCount: Integer;
begin
   CheckSetKeyMode;
   Result:=FKeyBuffer.FieldCount;
end;

procedure TDBISAMDataSet.SetKeyFieldCount(Value: Integer);
begin
   CheckSetKeyMode;
   FKeyBuffer.FieldCount:=Value;
end;

procedure TDBISAMDataSet.SetKeyFields(KeyIndex: TKeyIndex;
                                      const Values: array of const);
var
   I: Integer;
   SaveState: TDataSetState;
   TempField: TField;
begin
   if (FIndexFieldCount=0) then
      DatabaseError(SNoFieldIndexes);
   SaveState:=SetTempState(dsSetKey);
   try
      FKeyBuffer:=InitKeyBuffer(FKeyBuffers[KeyIndex]);
      for I:=0 to High(Values) do
         begin
         TempField:=GetIndexField(I);
         if (Values[I].VType=vtInt64) then
            begin
            if (TempField is TLargeIntField) then
               TLargeIntField(TempField).AsLargeInt:=Values[I].VInt64^
            else
               TempField.AssignValue(Values[I]);
            end
         else
            TempField.AssignValue(Values[I]);
         end;
      FKeyBuffer^.FieldCount:=High(Values)+1;
      FKeyBuffer^.Modified:=Modified;
   finally
      RestoreState(SaveState);
   end;
end;

function TDBISAMDataSet.GetIsIndexField(Field: TField): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with Field do
      begin
      if (FieldNo > 0) then
         begin
         for I:=0 to FIndexFieldCount-1 do
            begin
            if (FIndexFieldMap[I+1]=FieldNo) then
               begin
               Result:=True;
               Exit;
               end;
            end;
         end;
      end;
end;

{ Filters }

procedure TDBISAMDataset.ActivateFilters;
var
   CurFilter: Pointer;
begin
   FFilterExecutionTime:=0;
   if (FHandle <> nil) then
      begin
      if (Filter <> '') then
         CurFilter:=CreateExprFilter(Filter,FilterOptions)
      else
         CurFilter:=nil;
      SetFilterHandle(FExprFilter,CurFilter);
      FFilterExecutionTime:=FFilterExecutionTime+FHandle.FilterExecutionTime;
      if Assigned(OnFilterRecord) then
         CurFilter:=CreateFuncFilter(@TDBISAMDataset.RecordFilter)
      else
         CurFilter:=nil;
      SetFilterHandle(FFuncFilter,CurFilter);
      FFilterExecutionTime:=FFilterExecutionTime+FHandle.FilterExecutionTime;
      end;
end;

procedure TDBISAMDataset.DeactivateFilters;
begin
   if (FHandle <> nil) then
      begin
      if (FFuncFilter <> nil) then
         FHandle.DeactivateFilter(FFuncFilter);
      if (FExprFilter <> nil) then
         FHandle.DeactivateFilter(FExprFilter);
      end;
end;

function TDBISAMDataset.CreateExprFilter(const Expr: string;
   Options: TFilterOptions): Pointer;
begin
   if (FHandle <> nil) then
      FHandle.AddFilter(0,PChar(Expr),nil,True,nil,
                                False,True,
                                (foCaseInsensitive in Options),
                                (foNoPartialCompare in Options),Result);
end;

function TDBISAMDataset.CreateFuncFilter(FilterFunc: Pointer): Pointer;
begin
   if (FHandle <> nil) then
      FHandle.AddFilter(Integer(Self),nil,nil,False,pFilterFunction(FilterFunc),
                                True,True,False,False,Result);
end;

procedure TDBISAMDataset.SetFilterHandle(var Filter: Pointer; Value: Pointer);
begin
   if Filtered or FInternalFiltered then
      begin
      CursorPosChanged;
      if (FHandle <> nil) and (Filter <> nil) then
         FHandle.DropFilter(Filter,False);
      Filter:=Value;
      if (FHandle <> nil) and (Filter <> nil) then
         FHandle.ActivateFilter(Filter);
      end
   else
      begin
      if (FHandle <> nil) and (Filter <> nil) then
         FHandle.DropFilter(Filter,False);
      Filter:=Value;
      end;
end;

procedure TDBISAMDataset.SetFilterData(const Text: string; Options: TFilterOptions);
var
   CurFilter: Pointer;
begin
   if Active and Filtered then
      begin
      CheckBrowseMode;
      if (Filter <> Text) or (FilterOptions <> Options) then
         begin
         if (Text <> '') then
            CurFilter:=CreateExprFilter(Text,Options)
         else
            CurFilter:=nil;
         FFilterExecutionTime:=0;
         SetFilterHandle(FExprFilter,CurFilter);
         FFilterExecutionTime:=FHandle.FilterExecutionTime;
         end;
      end;
   inherited SetFilterText(Text);
   inherited SetFilterOptions(Options);
   if Active and Filtered then
      First;
end;

procedure TDBISAMDataset.SetFilterText(const Value: string);
begin
   SetFilterData(Value,FilterOptions);
end;

procedure TDBISAMDataSet.InternalSetFiltered(Value: Boolean);
begin
   if Active then
      begin
      CheckBrowseMode;
      if (FInternalFiltered <> Value) then
         begin
         FInternalFiltered:=Value;
         if Value then
            ActivateFilters
         else
            DeactivateFilters;
         end;
      end;
end;

procedure TDBISAMDataset.SetFiltered(Value: Boolean);
begin
   if Active then
      begin
      CheckBrowseMode;
      if (Filtered <> Value) then
         begin
         inherited SetFiltered(Value);
         if Value then
            ActivateFilters
         else
            DeactivateFilters;
         end;
      First;
      end
   else
      inherited SetFiltered(Value);
end;

procedure TDBISAMDataset.SetFilterOptions(Value: TFilterOptions);
begin
   SetFilterData(Filter,Value);
end;

procedure TDBISAMDataset.SetOnFilterRecord(const Value: TFilterRecordEvent);
var
   CurFilter: Pointer;
begin
   if Active and Filtered then
      begin
      CheckBrowseMode;
      inherited SetOnFilterRecord(Value);
      if Assigned(Value) then
         CurFilter:=CreateFuncFilter(@TDBISAMDataset.RecordFilter)
      else
         CurFilter:=nil;
      FFilterExecutionTime:=0;
      SetFilterHandle(FFuncFilter,CurFilter);
      FFilterExecutionTime:=FHandle.FilterExecutionTime;
      if Filtered then
         First;
      end
   else
      inherited SetOnFilterRecord(Value);
end;

function TDBISAMDataset.FindRecord(Restart,GoForward: Boolean): Boolean;
var
   Status: Integer;
   WasFiltered: Boolean;
begin
   Status:=DBISAM_NONE;
   CheckBrowseMode;
   DoBeforeScroll;
   SetFound(False);
   CursorPosChanged;
   UpdateCursorPos;
   WasFiltered:=Filtered;
   if (not WasFiltered) then
      InternalSetFiltered(True);
   try
      if (FHandle <> nil) then
         begin
         if GoForward then
            begin
            if Restart then
               FHandle.SetToBegin;
            Status:=FHandle.GetNextRecord(nil);
            end
         else
            begin
            if Restart then
               FHandle.SetToEnd;
            Status:=FHandle.GetPriorRecord(nil);
            end;
         end;
   finally
      if (not WasFiltered) then
         InternalSetFiltered(False);
   end;
   if (Status=DBISAM_NONE) then
      begin
      try
         Resync([rmExact,rmCenter]);
         SetFound(True);
      except
         on E: Exception do
            begin
            if (Engine.Handle.ConvertExceptionToCode(E)=DBISAM_NOCURRREC) then
               SetFound(False)
            else
               raise;
            end;
      end;
      end;
   Result:=Found;
   if Result then
      DoAfterScroll;
end;

function TDBISAMDataset.RecordFilter(RecSize: Integer; RecBuf: Pointer;
                                     RecNo: Integer): Boolean;
var
   Accept: Boolean;
   SaveState: TDataSetState;
begin
   SaveState:=SetTempState(dsFilter);
   FFilterBuffer:=RecBuf;
   try
      Accept:=True;
      OnFilterRecord(Self,Accept);
   except
      InternalHandleException;
   end;
   RestoreState(SaveState);
   Result:=Accept;
end;

function TDBISAMDataSet.LocateRecord(const KeyFields: string;
                                     const KeyValues: Variant;
                                     Options: TLocateOptions): Boolean;
var
   I: Integer;
   Buffer: PChar;
   Fields: TList;
   TempFieldDefinition: pFieldDefinition;
   TempKeyFields: TKeyFields;
   TempField: TField;
   TempPartialLength: Word;
begin
   Result:=False;
   CheckBrowseMode;
   CursorPosChanged;
   Fields:=TList.Create;
   try
      GetFieldList(Fields,KeyFields);
      if (Fields.Count > 0) and (Fields.Count <= MAX_NUM_FLDSINKEY) then
         begin
         Buffer:=TempBuffer;
         SetTempState(dsFilter);
         FFilterBuffer:=Buffer;
         try
            FHandle.ClearRecord(Buffer);
            if VarIsArray(KeyValues) then
               begin
               for I:=0 to Fields.Count-1 do
                  begin
                  TempField:=TField(Fields[I]);
                  if TempField.IsBlob then
                     DatabaseErrorFmt(SNoBlobLocate,[TempField.FieldName],Self)
                  else if VarIsNull(KeyValues[I]) then
                     TempField.Clear
                  else
                     begin
                     if (TempField is TLargeIntField) then
                        TLargeIntField(TempField).AsLargeInt:=KeyValues[I]
                     else
                        TempField.Value:=KeyValues[I];
                     end;
                  end;
               end
            else
               begin
               TempField:=TField(Fields.First);
               if TempField.IsBlob then
                  DatabaseErrorFmt(SNoBlobLocate,[TempField.FieldName],Self)
               else if VarIsNull(KeyValues) then
                  TempField.Clear
               else
                  begin
                  if (TempField is TLargeIntField) then
                     TLargeIntField(TempField).AsLargeInt:=KeyValues
                  else
                     TempField.Value:=KeyValues;
                  end;
               end;
            TempPartialLength:=0;
            if (loPartialKey in Options) and
               (TField(Fields.Last).DataType=ftString) then
               TempPartialLength:=Length(TField(Fields.Last).AsString);
            FillChar(TempKeyFields,SizeOf(TKeyFields),#0);
            for I:=0 to (Fields.Count-1) do
               begin
               TempField:=Fields[I];
               TempFieldDefinition:=FHandle.GetPhysicalFieldDefinitionForFieldName(TempField.FieldName);
               if (TempFieldDefinition=nil) then
                  DatabaseErrorFmt(SFieldNotFound,[TempField.FieldName],Self);
               TempKeyFields[I+1]:=TempFieldDefinition^.FieldNum;
               end;
            Result:=FHandle.Locate(Fields.Count,TempKeyFields,
                                   Buffer,(loCaseInsensitive in Options),
                                   TempPartialLength,Buffer);
         finally
            RestoreState(dsBrowse);
         end;
         end
      else if (Fields.Count > MAX_NUM_FLDSINKEY) then
         DatabaseError(STooManyLocateFields)
      else
         DatabaseError(SNoLocateFields);
   finally
      Fields.Free;
   end;
end;

function TDBISAMDataSet.Lookup(const KeyFields: string; const KeyValues: Variant;
   const ResultFields: string): Variant;
begin
   Result:=Null;
   if LocateRecord(KeyFields,KeyValues,[]) then
      begin
      SetTempState(dsCalcFields);
      try
         CalculateFields(TempBuffer);
         Result:=FieldValues[ResultFields];
      finally
         RestoreState(dsBrowse);
      end;
      end;
end;

function TDBISAMDataSet.Locate(const KeyFields: string;
                               const KeyValues: Variant;
                               Options: TLocateOptions): Boolean;
begin
   DoBeforeScroll;
   Result:=LocateRecord(KeyFields,KeyValues,Options);
   if Result then
      begin
      try
         Resync([rmExact,rmCenter]);
      except
         on E: Exception do
            begin
            if (Engine.Handle.ConvertExceptionToCode(E)=DBISAM_NOCURRREC) then
               Result:=False
            else
               raise;
            end;
      end;
      DoAfterScroll;
      end;
end;

procedure TDBISAMDataSet.DoOnNewRecord;
var
   RecBuf: PChar;
begin
   if FCopyOnAppend then
      begin
      UpdateCursorPos;
      if GetActiveRecBuf(RecBuf) then
         begin
         if (FHandle <> nil) then
            FHandle.CloneCurrentRecord(RecBuf);
         Move(RecBuf^,FOldRecordBuffer^,FRecordSize);
         end
      else
         begin
         if (FHandle <> nil) then
            FHandle.ClearRecord(FOldRecordBuffer);
         end;
      end
   else
      begin
      if (FHandle <> nil) then
         FHandle.ClearRecord(FOldRecordBuffer);
      end;
   inherited DoOnNewRecord;
end;

function TDBISAMDataSet.IndexProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnIndexProgress) then
      FOnIndexProgress(Self,PercentDone);
end;

function TDBISAMDataSet.VerifyProgress(const Step: ShortString;
                                       PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnVerifyProgress) then
      FOnVerifyProgress(Self,Step,PercentDone);
end;

function TDBISAMDataSet.VerifyLog(const LogMessage: ShortString): Boolean;
begin
   Result:=True;
   if Assigned(FOnVerifyLog) then
      FOnVerifyLog(Self,LogMessage);
end;

function TDBISAMDataSet.RepairProgress(const Step: ShortString;
                                       PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnRepairProgress) then
      FOnRepairProgress(Self,Step,PercentDone);
end;

function TDBISAMDataSet.RepairLog(const LogMessage: ShortString): Boolean;
begin
   Result:=True;
   if Assigned(FOnRepairLog) then
      FOnRepairLog(Self,LogMessage);
end;

function TDBISAMDataSet.UpgradeProgress(const Step: ShortString;
                                        PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnUpgradeProgress) then
      FOnUpgradeProgress(Self,Step,PercentDone);
end;

function TDBISAMDataSet.UpgradeLog(const LogMessage: ShortString): Boolean;
begin
   Result:=True;
   if Assigned(FOnUpgradeLog) then
      FOnUpgradeLog(Self,LogMessage);
end;

function TDBISAMDataSet.CopyProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnCopyProgress) then
      FOnCopyProgress(Self,PercentDone);
end;

function TDBISAMDataSet.OptimizeProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnOptimizeProgress) then
      FOnOptimizeProgress(Self,PercentDone);
end;

function TDBISAMDataSet.AlterProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnAlterProgress) then
      FOnAlterProgress(Self,PercentDone);
end;

function TDBISAMDataSet.DataLost(Cause: Byte;
                                 const ContextInfo: ShortString;
                                 var Continue: Boolean;
                                 var StopAsking: Boolean): Boolean;
begin
   Result:=True;
   if Assigned(FOnDataLost) then
      FOnDataLost(Self,TDataLossCause(Cause),ContextInfo,Continue,StopAsking);
end;

function TDBISAMDataSet.ImportProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnImportProgress) then
      FOnImportProgress(Self,PercentDone);
end;

function TDBISAMDataSet.ExportProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnExportProgress) then
      FOnExportProgress(Self,PercentDone);
end;

procedure TDBISAMDataSet.ImportData(CursorToUse: TDataCursor;
                                    const FileToImport: string; Delimiter: Char;
                                    ReadHeaders: Boolean=False;
                                    FieldsToImport: TStrings=nil;
                                    const DateFormat: string=ANSI_DATE_FORMAT;
                                    const TimeFormat: string=ANSI_TIME_FORMAT;
                                    DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
var
   I: Integer;
   TempFieldDefinitions: array[1..MAX_NUM_FIELDS] of pFieldDefinition;
   NoFieldsSpecified: Boolean;
   TempFieldCount: Integer;
begin
   if Active then
      CheckBrowseMode;
   try
      with CursorToUse do
         begin
         NoFieldsSpecified:=False;
         FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
         if (FieldsToImport=nil) and (not ReadHeaders) then
            begin
            NoFieldsSpecified:=True;
            FieldsToImport:=TStringList.Create;
            for I:=0 to FieldCount-1 do
               begin
               TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
               TempFieldDefinitions[I+1]^:=GetFieldDefinition(I+1)^;
               FieldsToImport.Add(TempFieldDefinitions[I+1]^.FieldName);
               end;
            end
         else if (not ReadHeaders) then
            begin
            for I:=0 to FieldsToImport.Count-1 do
               begin
               if FieldExists(FieldsToImport[I]) then
                  begin
                  TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
                  TempFieldDefinitions[I+1]^:=GetFieldDefinitionByName(FieldsToImport[I])^;
                  end;
               end;
            end;
         if ReadHeaders then
            TempFieldCount:=0
         else
            TempFieldCount:=FieldsToImport.Count;
         try
            SetProgressCallback(Integer(Self),@TDBISAMDataSet.ImportProgress);
            ImportTable(FileToImport,Delimiter,TempFieldCount,
                        TempFieldDefinitions,DateFormat,TimeFormat,
                        DecSeparator,ReadHeaders,Assigned(FOnImportProgress));
         finally
            if NoFieldsSpecified then
               FieldsToImport.Free;
            for I:=1 to FieldCount do
               DeAllocMem(TempFieldDefinitions[I]);
         end;
         end;
   finally
      if Active then
         begin
         CursorPosChanged;
         UpdateCursorPos;
         Resync([]);
         end;
   end;
end;

procedure TDBISAMDataSet.ExportData(CursorToUse: TDataCursor;
                                    const ExportToFile: string; Delimiter: Char;
                                    WriteHeaders: Boolean=False;
                                    FieldsToExport: TStrings=nil;
                                    const DateFormat: string=ANSI_DATE_FORMAT;
                                    const TimeFormat: string=ANSI_TIME_FORMAT;
                                    DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
var
   I: Integer;
   TempFieldDefinitions: array[1..MAX_NUM_FIELDS] of pFieldDefinition;
   NoFieldsSpecified: Boolean;
begin
   if Active then
      CheckBrowseMode;
   try
      with CursorToUse do
         begin
         NoFieldsSpecified:=False;
         FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
         if (FieldsToExport=nil) then
            begin
            NoFieldsSpecified:=True;
            FieldsToExport:=TStringList.Create;
            for I:=0 to FieldCount-1 do
               begin
               TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
               TempFieldDefinitions[I+1]^:=GetFieldDefinition(I+1)^;
               FieldsToExport.Add(TempFieldDefinitions[I+1]^.FieldName);
               end;
            end
         else
            begin
            for I:=0 to FieldsToExport.Count-1 do
               begin
               TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
               TempFieldDefinitions[I+1]^:=GetFieldDefinitionByName(FieldsToExport[I])^;
               end;
            end;
         try
            SetProgressCallback(Integer(Self),@TDBISAMDataSet.ExportProgress);
            ExportTable(ExportToFile,Delimiter,FieldsToExport.Count,
                        TempFieldDefinitions,DateFormat,TimeFormat,
                        DecSeparator,WriteHeaders,Assigned(FOnExportProgress));
         finally
            if NoFieldsSpecified then
               FieldsToExport.Free;
            for I:=1 to FieldCount do
               DeAllocMem(TempFieldDefinitions[I]);
         end;
         end;
   finally
      if Active then
         begin
         CursorPosChanged;
         UpdateCursorPos;
         end;
   end;
end;

function TDBISAMDataSet.LoadFromStreamProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnLoadFromStreamProgress) then
      FOnLoadFromStreamProgress(Self,PercentDone);
end;

function TDBISAMDataSet.SaveToStreamProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnSaveToStreamProgress) then
      FOnSaveToStreamProgress(Self,PercentDone);
end;

procedure TDBISAMDataSet.LoadDataFromStream(CursorToUse: TDataCursor;
                                            SourceStream: TStream);
var
   TotalLoadBytes: Integer;
   LoadBuffer: PChar;
begin
   if Active then
      CheckBrowseMode;
   try
      with CursorToUse do
         begin
         SetProgressCallback(Integer(Self),@TDBISAMDataSet.LoadFromStreamProgress);
         TotalLoadBytes:=SourceStream.Size;
         LoadBuffer:=AllocMem(TotalLoadBytes);
         try
            with SourceStream do
               begin
               Position:=0;
               ReadBuffer(LoadBuffer^,TotalLoadBytes);
               end;
            LoadFromStream(LoadBuffer,TotalLoadBytes,STREAM_NORMAL,
                           Assigned(FOnLoadFromStreamProgress),False);
         finally
            DeAllocMem(LoadBuffer);
         end;
         end;
   finally
      if Active then
         begin
         CursorPosChanged;
         UpdateCursorPos;
         Resync([]);
         end;
   end;
end;

procedure TDBISAMDataSet.SaveDataToStream(CursorToUse: TDataCursor;
                                          DestStream: TStream);
var
   DestBuffer: PChar;
   DestBufferSize: Integer;
begin
   if Active then
      CheckBrowseMode;
   try
      with CursorToUse do
         begin
         DestBuffer:=nil;
         DestBufferSize:=0;
         SetProgressCallback(Integer(Self),@TDBISAMDataSet.SaveToStreamProgress);
         SaveToStream(DestBuffer,DestBufferSize,STREAM_NORMAL,Assigned(FOnSaveToStreamProgress));
         try
            with DestStream do
               begin
               Size:=0;
               Position:=0;
               WriteBuffer(DestBuffer^,DestBufferSize);
               end;
         finally
            DeAllocMem(DestBuffer);
         end;
         end;
   finally
      if Active then
         begin
         CursorPosChanged;
         UpdateCursorPos;
         end;
   end;
end;

procedure TDBISAMDataSet.SetUpdateObject(Value: TDBISAMDataSetUpdateObject);
begin
   if (Value <> FUpdateObject) then
      begin
      if Assigned(FUpdateObject) and (FUpdateObject.DataSet=Self) then
         FUpdateObject.DataSet:=nil;
      FUpdateObject:=Value;
      if Assigned(FUpdateObject) then
         begin
         { If another dataset already references this updateobject, then
           remove the reference }
         if Assigned(FUpdateObject.DataSet) and
            (FUpdateObject.DataSet <> Self) then
            FUpdateObject.DataSet.UpdateObject:=nil;
         FUpdateObject.DataSet:=Self;
         end;
      end;
end;

{ Cached updates }

procedure TDBISAMDataSet.SaveRangeAndFilterData;
begin
   FSaveFiltered:=Filtered;
   FSaveInternalFiltered:=FInternalFiltered;
   FSaveFilterText:=Filter;
   FSaveFilterOptions:=FilterOptions;
   FSaveExprFilter:=FExprFilter;
   FSaveFuncFilter:=FFuncFilter;
   FSaveFilterExecutionTime:=FFilterExecutionTime;
   FExprFilter:=nil;
   FFuncFilter:=nil;
   FFilterExecutionTime:=0;
   FInternalFiltered:=False;
   inherited SetFiltered(False);
   inherited SetFilterText('');
   inherited SetFilterOptions([]);
   SaveKeyBuffers;
end;

procedure TDBISAMDataSet.ClearRangeAndFilterData;
begin
   SetFiltered(False);
   InternalSetFiltered(False);
   SetOnFilterRecord(nil);
   SetFilterText('');
   SetFilterOptions([]);
   ResetCursorRange;
end;

procedure TDBISAMDataSet.RestoreRangeAndFilterData;
begin
   FExprFilter:=FSaveExprFilter;
   FFuncFilter:=FSaveFuncFilter;
   FInternalFiltered:=FSaveInternalFiltered;
   FFilterExecutionTime:=FSaveFilterExecutionTime;
   inherited SetFilterText(FSaveFilterText);
   inherited SetFilterOptions(FSaveFilterOptions);
   inherited SetFiltered(FSaveFiltered);
   RestoreKeyBuffers;
   SetCursorRange;
end;

procedure TDBISAMDataSet.BeginCachedUpdates;
begin
   CheckActive;
   if FCachingUpdates then
      Exit;
   FCachedHandle:=FHandle;
   try
      FHandle:=FCachedHandle.GetCachedUpdatesCursor;
      FCachingUpdates:=True;
      { Save all filter and range data and cancel them }
      SaveRangeAndFilterData;
      CursorPosChanged;
      UpdateCursorPos;
      Resync([]);
   except
      FHandle:=FCachedHandle;
      raise;
   end;
end;

procedure TDBISAMDataSet.ApplyCachedUpdates;
var
   FSaveHandle: TDataCursor;
begin
   if FCachingUpdates then
      begin
      CheckBrowseMode;
      try
         FSaveHandle:=FHandle;
         FHandle:=FCachedHandle;
         if Assigned(FOnCachedUpdateError) then
            FHandle.SetCacheErrorCallback(Integer(Self),
                                          @TDBISAMDataSet.CacheErrorCallback);
         try
            FSaveHandle.ApplyCachedUpdatesToCursor(FHandle,False);
         finally
            FHandle.SetCacheErrorCallback(0,nil);
         end;
      finally
         CancelCachedUpdates;
      end;
      end;
end;

procedure TDBISAMDataSet.EndCachedUpdates;
begin
   if FCachingUpdates then
      begin
      try
         FHandle:=FCachedHandle;
      finally
         FCachingUpdates:=False;
      end;
      end;
end;

procedure TDBISAMDataSet.CancelCachedUpdates;
begin
   if FCachingUpdates then
      begin
      if (State in [dsInsert,dsEdit,dsSetKey]) then
         Cancel;
      ClearRangeAndFilterData;
      EndCachedUpdates;
      RestoreRangeAndFilterData;
      FHandle.Refresh;
      CursorPosChanged;
      UpdateCursorPos;
      Resync([]);
      end;
end;

function TDBISAMDataSet.UpdateActionToByte(Value: TUpdateAction): Byte;
begin
   case Value of
      uaFail:
         Result:=ERROR_RESPONSE_FAIL;
      uaAbort:
         Result:=ERROR_RESPONSE_ABORT;
      uaRetry:
         Result:=ERROR_RESPONSE_RETRY;
      uaApplied,uaSkip:
         Result:=ERROR_RESPONSE_SKIP;
      else
         Result:=ERROR_RESPONSE_FAIL;
      end;
end;

function TDBISAMDataSet.CacheErrorCallback(RecordNumber: Integer;
                                           RecordSize: Word;
                                           RecordBuffer: PChar;
                                           OldRecordBuffer: PChar;
                                           E: Exception;
                                           OperationType: Byte;
                                           Retrying: Boolean;
                                           var Response: Byte): Boolean;
var
   TempRecord: TDBISAMRecord;
   TempAction: TUpdateAction;
begin
   Result:=False;
   TempAction:=uaFail;
   if Assigned(FOnCachedUpdateError) then
      begin
      Result:=True;
      { Create the TDBISAMRecord object, if necessary }
      TempRecord:=TDBISAMRecord(FHandle.CacheCallbackRecordObject);
      if (TempRecord=nil) then
         begin
         TempRecord:=TDBISAMRecord.Create;
         FHandle.CacheCallbackRecordObject:=TempRecord;
         end;
      with TempRecord do
         begin
         if (not Retrying) then
            begin
            if Updating then
               TempRecord.EndUpdateableTrigger;
            if (FHandle.BlobFieldCount > 0) then
               FHandle.CreateBlobCopies(OldRecordBuffer,False);
            Initialize(FHandle,RecordNumber,RecordBuffer,OldRecordBuffer,False);
            StartUpdateableTrigger;
            end;
         end;
      FOnCachedUpdateError(Self,TempRecord,E,TUpdateType(OperationType),TempAction);
      end;
   Response:=UpdateActionToByte(TempAction);
end;

{ IProvider Support }

function TDBISAMDataSet.PSGetUpdateException(E: Exception; Prev: EUpdateError): EUpdateError;
var
   PrevErr: Integer;
begin
   if (E is EDBISAMEngineError) then
      begin
      if (Prev <> nil) then
         PrevErr:=Prev.ErrorCode
      else
         PrevErr:=0;
      with EDBISAMEngineError(E) do
         Result:=EUpdateError.Create(E.Message,'',ErrorCode,PrevErr,E);
      end
   else
      Result:=inherited PSGetUpdateException(E,Prev);
end;

function TDBISAMDataSet.PSIsSQLSupported: Boolean;
begin
   Result:=True;
end;

procedure TDBISAMDataSet.PSReset;
begin
   inherited PSReset;
   if (FHandle <> nil) then
      FHandle.Refresh;
end;

function TDBISAMDataSet.PSUpdateRecord(UpdateKind : TUpdateKind; Delta: TDataSet): Boolean;
var
   UpdateAction: TUpdateAction;
begin
   Result:=False;
   if Assigned(FOnUpdateRecord) then
      begin
      UpdateAction:=uaFail;
      if Assigned(FOnUpdateRecord) then
         begin
         FOnUpdateRecord(Delta,UpdateKind,UpdateAction);
         Result:=UpdateAction=uaApplied;
         end;
      end;
end;

{ TDBISAMDBDataSet }

procedure TDBISAMDBDataSet.OpenCursor(InfoQuery: Boolean);
begin
   SetDBFlag(dbfOpened,True);
   inherited OpenCursor(InfoQuery);
end;

procedure TDBISAMDBDataSet.CloseCursor;
begin
   inherited CloseCursor;
   SetDBFlag(dbfOpened,False);
end;

procedure TDBISAMDBDataSet.CheckDBSessionName;
var
   S: TDBISAMSession;
   Database: TDBISAMDatabase;
begin
   if (SessionName <> '') and (DatabaseName <> '') then
      begin
      S:=Engine.FindSession(SessionName);
      if Assigned(S) and (not Assigned(S.InternalFindDatabase(DatabaseName))) then
         begin
         Database:=DefaultDBISAMSession.InternalFindDatabase(DatabaseName);
         if Assigned(Database) then
            Database.CheckSessionName(True);
         end;
      end;
end;

procedure TDBISAMDBDataSet.Disconnect;
begin
   Close;
end;

function TDBISAMDBDataSet.GetDBHandle: TDataDirectory;
begin
   if (FDatabase <> nil) then
      Result:=FDatabase.Handle
   else
      Result:=nil;
end;

function TDBISAMDBDataSet.GetDBSession: TDBISAMSession;
begin
   if (FDatabase <> nil) then
      Result:=FDatabase.Session
   else
      Result:=Engine.FindSession(SessionName);
   if (Result=nil) then
      Result:=DefaultDBISAMSession;
end;

function TDBISAMDBDataSet.OpenDatabase: TDBISAMDatabase;
begin
   with Engine.SessionList[FSessionName] do
      Result:=OpenDatabase(FDatabasename);
end;

procedure TDBISAMDBDataSet.CloseDatabase(Database: TDBISAMDatabase);
begin
   if Assigned(Database) then
      Database.Session.CloseDatabase(Database);
end;

procedure TDBISAMDBDataSet.SetDatabaseName(const Value: string);
var
   TempString: string;
begin
   if (csReading in ComponentState) then
      FDatabaseName:=Value
   else
      begin
      TempString:=ConvertSlashes(Value);
      if (FDatabaseName <> TempString) then
         begin
         CheckInactive;
         if (Self is TDBISAMQuery) then
            TDBISAMQuery(Self).UnPrepare;
         if (FDatabase <> nil) then
            DatabaseError(SDatabaseOpen);
         FDatabaseName:=TempString;
         DataEvent(dePropertyChange,0);
         end;
      end;
end;

function TDBISAMDBDataSet.SetDBFlag(Flag: Integer; Value: Boolean): Boolean;
begin
   Result:=(Flag in FDBFlags);
   if Value then
      begin
      if (not (Flag in FDBFlags)) then
         begin
         if (FDBFlags=[]) then
            begin
            CheckDBSessionName;
            FDatabase:=OpenDatabase;
            FDatabase.RegisterClient(Self);
            end;
         Include(FDBFlags,Flag);
         end;
      end
   else
      begin
      if (Flag in FDBFlags) then
         begin
         Exclude(FDBFlags,Flag);
         if (FDBFlags=[]) then
            begin
            FDatabase.UnRegisterClient(Self);
            FDatabase.Session.CloseDatabase(FDatabase);
            FDatabase:=nil;
            end;
         end;
      end;
end;

procedure TDBISAMDBDataSet.SetSessionName(const Value: string);
begin
   if (Value <> FSessionName) then
      begin
      CheckInactive;
      if (Self is TDBISAMQuery) then
         TDBISAMQuery(Self).UnPrepare;
      FSessionName:=Value;
      DataEvent(dePropertyChange,0);
      end;
end;

{ IProvider Support }

procedure TDBISAMDBDataSet.PSGetAttributes(List: TList);
begin
   inherited PSGetAttributes(List);
end;

function TDBISAMDBDataSet.PSIsSQLBased: Boolean;
begin
   Result:=False;
end;

function TDBISAMDBDataSet.PSGetQuoteChar: string;
begin
   Result:=PARSE_DOUBLEQUOTE;
end;

function TDBISAMDBDataSet.PSInTransaction: Boolean;
var
   TempDatabase: TDBISAMDatabase;
begin
   Result:=False;
   if Assigned(Engine.SessionList[FSessionName]) then
      begin
      TempDatabase:=Engine.SessionList[FSessionName].FindDatabase(FDatabaseName);
      Result:=Assigned(TempDatabase) and TempDatabase.InTransaction;
      end;
end;

procedure TDBISAMDBDataSet.PSStartTransaction;
begin
   SetDBFlag(dbfProvider,True);
   try
      FDatabase.StartTransaction;
   except
      SetDBFlag(dbfProvider,False);
      raise;
   end;
end;

procedure TDBISAMDBDataSet.PSEndTransaction(Commit: Boolean);
begin
   try
      if (FDatabase <> nil) then
         FDatabase.EndTransaction(Commit,True);
   finally
      SetDBFlag(dbfProvider,False);
   end;
end;

function TDBISAMDBDataSet.PSExecuteStatement(const ASQL: string; AParams: TParams;
                                             ResultSet: Pointer=nil): Integer;
var
   InProvider: Boolean;
   TempParams: TDBISAMParams;
begin
   InProvider:=SetDBFlag(dbfProvider,True);
   try
      if (AParams.Count > 0) then
         begin
         TempParams:=TDBISAMParams.Create(nil);
         try
            TempParams.Assign(AParams);
            if Assigned(ResultSet) then
               begin
               TDataSet(ResultSet^):=TDBISAMQuery.Create(nil);
               Result:=FDatabase.Execute(ASQL,TempParams,TDBISAMQuery(ResultSet^));
               end
            else
               Result:=FDatabase.Execute(ASQL,TempParams);
         finally
            TempParams.Free;
         end;
         end
      else
         begin
         if Assigned(ResultSet) then
            begin
            TDataSet(ResultSet^):=TDBISAMQuery.Create(nil);
            Result:=FDatabase.Execute(ASQL,nil,TDBISAMQuery(ResultSet^));
            end
         else
            Result:=FDatabase.Execute(ASQL,nil);
         end;
   finally
      SetDBFlag(dbfProvider,InProvider);
   end;
end;

function TDBISAMDBDataSet.PSUpdateRecord(UpdateKind: TUpdateKind; Delta: TDataSet): Boolean;

   procedure AssignParams(DataSet: TDataSet; Params: TParams);
   var
      I: Integer;
      Old: Boolean;
      Param: TParam;
      PName: string;
      Field: TField;
      Value: Variant;
   begin
      for I:=0 to Params.Count-1 do
         begin
         Param:=Params[I];
         PName:=Param.Name;
         Old:=(CompareText(Copy(PName,1,4),'OLD_')=0);
         if Old then
            System.Delete(PName,1,4);
         Field:=DataSet.FindField(PName);
         if (not Assigned(Field)) then
            Continue;
         if Old then
            Param.AssignFieldValue(Field,Field.OldValue)
         else
            begin
            Value:=Field.NewValue;
            if VarIsEmpty(Value) then
               Value:=Field.OldValue;
            Param.AssignFieldValue(Field,Value);
            end;
         end;
   end;

var
   TempSQL: string;
   TempDBISAMParams: TDBISAMParams;
   TempParams: TParams;
   TempSQLTextPos: Integer;
   TempSQLTextLine: Integer;
   TempSQLTextColumn: Integer;
   TempSQLLastTextLine: Integer;
   TempSQLLastTextColumn: Integer;
begin
   Result:=inherited PSUpdateRecord(UpdateKind,Delta);
   if (not Result) and Assigned(FUpdateObject) and
      (FUpdateObject is TDBISAMSQLUpdateObject) then
      begin
      TempSQL:=TDBISAMSQLUpdateObject(FUpdateObject).GetSQL(UpdateKind).Text;
      if (TempSQL <> '') then
         begin
         TempDBISAMParams:=TDBISAMParams.Create(nil);
         TempParams:=TParams.Create(nil);
         try
            TempSQLTextPos:=1;
            TempSQLTextLine:=1;
            TempSQLTextColumn:=1;
            TempSQLLastTextLine:=1;
            TempSQLLastTextColumn:=1;
            TempDBISAMParams.ParseSQL(TempSQL,TempSQLTextPos,TempSQLTextLine,TempSQLTextColumn,
                                      TempSQLLastTextLine,TempSQLLastTextColumn,True);
            TempParams.Assign(TempDBISAMParams);
            AssignParams(Delta,TempParams);
            if (PSExecuteStatement(TempSQL,TempParams)=0) then
               DatabaseError(SRecordChanged);
            Result:=True;
         finally
            TempParams.Free;
            TempDBISAMParams.Free;
         end;
         end;
      end;
end;

{ TDBISAMTable }

constructor TDBISAMTable.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FFieldDefs:=TDBISAMFieldDefs.Create(Self);
   FIndexDefs:=TDBISAMIndexDefs.Create(Self);
   FMasterLink:=TMasterDataLink.Create(Self);
   FMasterLink.OnMasterChange:=MasterChanged;
   FMasterLink.OnMasterDisable:=MasterDisabled;
   FTempStopWords:=TStringList.Create;
end;

destructor TDBISAMTable.Destroy;
begin
   FTempStopWords.Free;
   FMasterLink.Free;
   FFieldDefs.Free;
   FIndexDefs.Free;
   inherited Destroy;
end;

function TDBISAMTable.FieldDefsStored: Boolean;
begin
   Result:=(FStoreDefs and (FFieldDefs.Count > 0));
end;

function TDBISAMTable.IndexDefsStored: Boolean;
begin
   Result:=(FStoreDefs and (FIndexDefs.Count > 0));
end;

procedure TDBISAMTable.SetFieldDefs(Value: TDBISAMFieldDefs);
begin
   FFieldDefs.Assign(Value);
end;

procedure TDBISAMTable.SetIndexDefs(Value: TDBISAMIndexDefs);
begin
   FIndexDefs.Assign(Value);
end;

function TDBISAMTable.GetEngineVersion: string;
begin
   Result:=ENGINE_VERSION+' Build '+ENGINE_BUILD;
end;

procedure TDBISAMTable.SetEngineVersion(const Value: string);
begin
end;

function TDBISAMTable.GetPhysicalRecordCount: Integer;
begin
   CheckActive;
   if (FHandle <> nil) then
      Result:=FHandle.TotalRecordCount
   else
      Result:=0;
end;

function TDBISAMTable.GetIndexPageSize: Integer;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.IndexPageSize;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetBlobBlockSize: Integer;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.BlobBlockSize;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetLastAutoIncValue: Integer;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.LastAutoIncID;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetTextIndexFields: string;
var
   TempCursor: TDataCursor;
   Name: string;
   Options: TIndexOptions;
   DescFields: string;
   Compression: TIndexCompression;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,True)
      else
         TempCursor:=FHandle;
      try
         DecodeIndexDefinition(TempCursor.GetIndexDefinition(TEXT_INDEX_POS),TEXT_INDEX_POS,
                               Name,Result,Options,DescFields,Compression);
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetTextIndexStopWords: TStrings;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,True)
      else
         TempCursor:=FHandle;
      try
         FTempStopWords.Assign(TempCursor.TextStopWords);
         Result:=FTempStopWords;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetTextIndexSpaceChars: string;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=CharSetToString(TempCursor.TextSpaceChars);
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetTextIndexIncludeChars: string;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=CharSetToString(TempCursor.TextIncludeChars);
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetHandle: TDataCursor;
begin
   Result:=TDataCursor.Create(Database.Handle,False);
   try
      with Result do
         begin
         TableName:=FTableName;
         Exclusive:=FExclusive;
         ReadOnly:=FReadOnly;
         OpenCursor(False);
         FReadOnly:=ReadOnly;
         end;
   except
      Result.Free;
      raise;
   end;
end;

procedure TDBISAMTable.CheckForMemoryTable(CreateIt: Boolean);
begin
   if (csDesigning in ComponentState) and Database.Handle.InMemory then
      begin
      if CreateIt then
         begin
         if (FFieldDefs.Count > 0) then
            begin
            if (not Exists) then
               begin
               try
                  CreateTable;
               except
                  { Suppress any error messages }
               end;
               end;
            end
         else
            raise Exception.Create('You must define at least one field before you can '+
                                   'open an in-memory table at design-time');
         end
      else
         begin
         if Exists then
            begin
            try
               DeleteTable;
            except
               { Suppress any error messages }
            end;
            end;
         end;
      end;
end;

function TDBISAMTable.CreateHandle: TDataCursor;
var
   IndexName: string;
begin
   if (FTableName='') then
      DatabaseError(SNoTableName);
   CheckForMemoryTable(True);
   FIndexDefs.Updated:=False;
   Result:=GetHandle;
   FHandle:=Result;
   GetIndexParams(FIndexName,FFieldsIndex,IndexName);
   if (IndexName <> '') then
      Result.IndexName:=IndexName;
end;

procedure TDBISAMTable.PrepareCursor;
var
   IndexName: string;
begin
   GetIndexParams(FIndexName,FFieldsIndex,IndexName);
   CheckMasterRange;
end;

procedure TDBISAMTable.SaveRangeAndFilterData;
begin
   inherited;
   FSaveMasterFields:=FMasterLink.FieldNames;
   FSaveMasterSource:=FMasterLink.DataSource;
   FMasterLink.FieldNames:='';;
   FMasterLink.DataSource:=nil;
end;

procedure TDBISAMTable.RestoreRangeAndFilterData;
begin
   inherited;
   FMasterLink.FieldNames:=FSaveMasterFields;
   FMasterLink.DataSource:=FSaveMasterSource;
end;

procedure TDBISAMTable.DefChanged(Sender: TObject);
begin
   if (not (FAddingTableDef or FClearingTableDef)) then
      StoreDefs:=True;
end;

procedure TDBISAMTable.InternalClearFieldDefs;
begin
   inherited;
   FClearingTableDef:=True;
   try
      FFieldDefs.Clear;
   finally
      FClearingTableDef:=False;
   end;
end;

procedure TDBISAMTable.InitFieldDefs;
var
   I: Integer;
   TempFieldDefinition: pFieldDefinition;
   TempCursor: TDataCursor;
   TempName: string;
   TempDataType: TFieldType;
   TempSize: Word;
   TempRequired: Boolean;
   TempDefaultValue: string;
   TempMinValue: string;
   TempMaxValue: string;
   TempDescription: string;
   TempCharCase: TFieldCharCase;
   TempCompression: Byte;
   TempFieldNo: Integer;
begin
   SetDBFlag(dbfFieldList,True);
   try
      if (FTableName='') then
         DatabaseError(SNoTableName);
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,True)
      else
         TempCursor:=FHandle;
      try
         with TempCursor do
            begin
            InternalClearFieldDefs;
            for I:=1 to FieldCount do
               begin
               TempFieldDefinition:=GetFieldDefinition(I);
               if (not TempFieldDefinition^.Hidden) then
                  begin
                  DecodeFieldDefinition(TempFieldDefinition,TempFieldNo,
                                        TempName,TempDataType,TempSize,TempRequired,
                                        TempDefaultValue,TempMinValue,TempMaxValue,
                                        TempDescription,TempCharCase,TempCompression);
                  AddFieldDefinition(TempFieldNo,TempName,TempDataType,
                                     TempSize,TempRequired,
                                     TempDefaultValue,TempMinValue,TempMaxValue,
                                     TempDescription,TempCharCase,TempCompression);
                  end;
               end;
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfFieldList,False);
   end;
end;

procedure TDBISAMTable.DestroyHandle;
begin
   inherited DestroyHandle;
   CheckForMemoryTable(False);
end;

{ Index / Ranges / Keys }

procedure TDBISAMTable.AddIndex(const Name,Fields: string;
                                Options: TIndexOptions=[]; const DescFields: string='';
                                Compression: TIndexCompression=icNone);
var
   TempIndexDefinition: TIndexDefinition;
   TempCursor: TDataCursor;
begin
   FieldDefs.Update;
   { Force descending fields if not specified }
   if (ixDescending in Options) and (DescFields='') then
      EncodeIndexDefinition(TempIndexDefinition,Name,Fields,Options,Fields,
                            Compression,False)
   else
      EncodeIndexDefinition(TempIndexDefinition,Name,Fields,Options,DescFields,
                            Compression,False);
   SetDBFlag(dbfIndexList,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,True,False)
      else
         begin
         CheckBrowseMode;
         CursorPosChanged;
         TempCursor:=FHandle;
         end;
      try
         with TempCursor do
            begin
            SetProgressCallback(Integer(Self),@TDBISAMTable.IndexProgress);
            SetDataLostCallback(Integer(Self),@TDBISAMTable.DataLost);
            if (ixPrimary in Options) then
               AddPrimaryIndex(@TempIndexDefinition,False,Assigned(FOnIndexProgress))
            else
               AddSecondaryIndex(@TempIndexDefinition,False,Assigned(FOnIndexProgress));
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
      FIndexDefs.Updated:=False;
   finally
      SetDBFlag(dbfIndexList,False);
   end;
end;

procedure TDBISAMTable.DeleteIndex(const Name: string);
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfIndexList,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,True,False)
      else
         begin
         CheckBrowseMode;
         TempCursor:=FHandle;
         end;
      try
         with TempCursor do
            begin
            DeleteIndex(Name);
            FIndexDefs.Updated:=False;
            if (TempCursor=FHandle) and
               (AnsiCompareText(FIndexName,Name)=0) then
               SetIndexName('');
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfIndexList,False);
   end;
end;

procedure TDBISAMTable.DeleteAllIndexes;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfIndexList,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,True,False)
      else
         begin
         CheckBrowseMode;
         TempCursor:=FHandle;
         end;
      try
         TempCursor.DeleteAllIndexes;
         FIndexDefs.Updated:=False;
         if (TempCursor=FHandle) then
            SetIndexName('');
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfIndexList,False);
   end;
end;

function TDBISAMTable.GetIndexFieldNames: string;
begin
   if FFieldsIndex then
      Result:=FIndexName
   else
      Result:='';
end;

function TDBISAMTable.GetIndexName: string;
begin
   if FFieldsIndex then
      Result:=''
   else
      Result:=FIndexName;
end;

procedure TDBISAMTable.GetIndexNames(List: TStrings);
begin
   FIndexDefs.Update;
   FIndexDefs.GetItemNames(List);
end;

procedure TDBISAMTable.GetIndexParams(const IndexName: string;
   FieldsIndex: Boolean; var IndexedName: string);
var
   IndexStr: string;
begin
   IndexStr:='';
   if (IndexName <> '') then
      begin
      FIndexDefs.Update;
      IndexStr:=IndexName;
      if FieldsIndex then
         IndexStr:=FIndexDefs.FindIndexForFields(IndexName).Name;
      end;
   IndexedName:=IndexStr;
end;

procedure TDBISAMTable.SetIndex(const Value: string; FieldsIndex: Boolean);
var
   IndexName: string;
begin
   if Active then
      CheckBrowseMode;
   if (FIndexName <> Value) or (FFieldsIndex <> FieldsIndex) then
      begin
      if Active then
         begin
         GetIndexParams(Value,FieldsIndex,IndexName);
         SwitchToIndex(IndexName);
         CheckMasterRange;
         end;
      FIndexName:=Value;
      FFieldsIndex:=FieldsIndex;
      if Active then
         Resync([]);
      end;
end;

procedure TDBISAMTable.SetIndexFieldNames(const Value: string);
begin
   SetIndex(Value,Value <> '');
end;

procedure TDBISAMTable.SetIndexName(const Value: string);
begin
   SetIndex(Value,False);
end;

procedure TDBISAMTable.UpdateIndexDefs;
var
   Name: string;
   Fields: string;
   DescFields: string;
   Options: TIndexOptions;
   Compression: TIndexCompression;
   TempCursor: TDataCursor;
   I: Integer;
begin
   if (not FIndexDefs.Updated) then
      begin
      SetDBFlag(dbfIndexList,True);
      try
         FieldDefs.Update;
         if (FHandle=nil) then
            TempCursor:=GetTempCursor(True,False,True)
         else
            TempCursor:=FHandle;
         try
            with TempCursor do
               begin
               FIndexDefs.Clear;
               for I:=0 to IndexCount do
                  begin
                  DecodeIndexDefinition(GetIndexDefinition(I),I,Name,Fields,
                                        Options,DescFields,Compression);
                  AddIndexDefinition(Name,Fields,Options,DescFields,Compression);
                  end;
               FIndexDefs.Updated:=True;
               end;
         finally
            FreeTempCursor(TempCursor);
         end;
      finally
         SetDBFlag(dbfIndexList,False);
      end;
      end;
end;

function TDBISAMTable.GetExists: Boolean;
begin
   Result:=Active;
   if Result or (TableName='') then
      Exit;
   SetDBFlag(dbfTable,True);
   try
      if (Database.Handle <> nil) then
         Result:=Database.Handle.DataTableExists(FTableName,False,False)
      else
         Result:=False;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.FindKey(const KeyValues: array of const): Boolean;
begin
   CheckBrowseMode;
   SetKeyFields(kiLookup,KeyValues);
   Result:=GotoKey;
end;

procedure TDBISAMTable.FindNearest(const KeyValues: array of const);
begin
   CheckBrowseMode;
   SetKeyFields(kiLookup,KeyValues);
   GotoNearest;
end;

function TDBISAMTable.GotoKey: Boolean;
var
   IndexBuffer: array [0..MAX_KEYLEN-1] of Char;
   KeyBuffer: PKeyBuffer;
   RecBuffer: PChar;
   UseKey: Boolean;
begin
   CheckBrowseMode;
   DoBeforeScroll;
   CursorPosChanged;
   KeyBuffer:=GetKeyBuffer(kiLookup);
   RecBuffer:=PChar(KeyBuffer)+SizeOf(TKeyBuffer);
   UseKey:=True;
   if (FHandle <> nil) then
      begin
      FHandle.GetKeyValues(RecBuffer,@IndexBuffer);
      if UseKey then
         RecBuffer:=@IndexBuffer;
      Result:=FHandle.Find(UseKey,RecBuffer,KeyBuffer^.FieldCount,False,0,nil);
      end
   else
      Result:=False;
   if Result then
      begin
      try
         Resync([rmExact,rmCenter]);
      except
         on E: Exception do
            begin
            if (Engine.Handle.ConvertExceptionToCode(E)=DBISAM_NOCURRREC) then
               Result:=False
            else
               raise;
            end;
      end;
      DoAfterScroll;
      end;
end;

procedure TDBISAMTable.GotoNearest;
var
   IndexBuffer: array [0..MAX_KEYLEN-1] of Char;
   KeyBuffer: PKeyBuffer;
   RecBuffer: PChar;
   UseKey: Boolean;
begin
   CheckBrowseMode;
   CursorPosChanged;
   KeyBuffer:=GetKeyBuffer(kiLookup);
   RecBuffer:=PChar(KeyBuffer)+SizeOf(TKeyBuffer);
   UseKey:=True;
   if (FHandle <> nil) then
      begin
      FHandle.GetKeyValues(RecBuffer,@IndexBuffer);
      if UseKey then
         RecBuffer:=@IndexBuffer;
      FHandle.Find(UseKey,RecBuffer,KeyBuffer^.FieldCount,True,0,nil);
      end;
   Resync([rmCenter]);
   DoAfterScroll;
end;

procedure TDBISAMTable.SetKey;
begin
   SetKeyBuffer(kiLookup,True);
end;

procedure TDBISAMTable.EditKey;
begin
   SetKeyBuffer(kiLookup,False);
end;

procedure TDBISAMTable.ApplyRange;
begin
   CheckBrowseMode;
   if SetCursorRange then
      First;
end;

procedure TDBISAMTable.CancelRange;
begin
   CheckBrowseMode;
   UpdateCursorPos;
   if ResetCursorRange then
      Resync([]);
end;

procedure TDBISAMTable.SetRange(const StartValues,EndValues: array of const);
begin
   CheckBrowseMode;
   SetKeyFields(kiRangeStart,StartValues);
   SetKeyFields(kiRangeEnd,EndValues);
   ApplyRange;
end;

procedure TDBISAMTable.SetRangeEnd;
begin
   SetKeyBuffer(kiRangeEnd,True);
end;

procedure TDBISAMTable.SetRangeStart;
begin
   SetKeyBuffer(kiRangeStart,True);
end;

procedure TDBISAMTable.EditRangeEnd;
begin
   SetKeyBuffer(kiRangeEnd,False);
end;

procedure TDBISAMTable.EditRangeStart;
begin
   SetKeyBuffer(kiRangeStart,False);
end;

procedure TDBISAMTable.UpdateRange;
begin
   SetLinkRanges(FMasterLink.Fields);
end;

procedure TDBISAMTable.GotoCurrent(Table: TDBISAMTable);
begin
   CheckActive;
   CheckBrowseMode;
   Table.CheckBrowseMode;
   if ContainsDirectory(DatabaseName) and (not MemoryDirectory(DatabaseName)) then
      begin
      if (OSCompareFileNames(DatabaseName,Table.DatabaseName) <> 0) or
         (OSCompareFileNames(EnsureFileExt(TableName,Engine.Handle.DataExtension,
                                           Engine.Handle.DataExtension),
                             EnsureFileExt(Table.TableName,Engine.Handle.DataExtension,
                                           Engine.Handle.DataExtension)) <> 0) then
         DatabaseError(STableMismatch);
      end
   else
      begin
      if (AnsiCompareText(DatabaseName,Table.DatabaseName) <> 0) or
         (OSCompareFileNames(EnsureFileExt(TableName,Engine.Handle.DataExtension,
                                           Engine.Handle.DataExtension),
                             EnsureFileExt(Table.TableName,Engine.Handle.DataExtension,
                                           Engine.Handle.DataExtension)) <> 0) then
         DatabaseError(STableMismatch);
      end;
   Table.UpdateCursorPos;
   if (FHandle <> nil) and (Table.Handle <> nil) then
      FHandle.SetToDataCursor(Table.Handle);
   DoBeforeScroll;
   Resync([rmExact,rmCenter]);
   DoAfterScroll;
end;

procedure TDBISAMTable.GetDetailLinkFields(MasterFields, DetailFields: TList);
var
   I: Integer;
   Index: TDBISAMIndexDef;
begin
   MasterFields.Clear;
   DetailFields.Clear;
   if (MasterSource <> nil) and (MasterSource.DataSet <> nil) and
      (Self.MasterFields <> '') then
      begin
      Index:=nil;
      MasterSource.DataSet.GetFieldList(MasterFields,Self.MasterFields);
      UpdateIndexDefs;
      if (IndexName <> '') then
         Index:=FIndexDefs.Find(IndexName)
      else if (IndexFieldNames <> '') then
         Index:=FIndexDefs.GetIndexForFields(IndexFieldNames,False)
      else
         begin
         for I:=0 to FIndexDefs.Count-1 do
            begin
            if (ixPrimary in FIndexDefs[I].Options) then
               begin
               Index:=FIndexDefs[I];
               Break;
               end;
            end;
         end;
      if (Index <> nil) then
         GetFieldList(DetailFields,Index.Fields);
      end;
end;

{ Master / Detail }

procedure TDBISAMTable.CheckMasterRange;
begin
   if FMasterLink.Active and (FMasterLink.Fields.Count > 0) then
      begin
      SetLinkRanges(FMasterLink.Fields);
      SetCursorRange;
      end;
end;

procedure TDBISAMTable.MasterChanged(Sender: TObject);
begin
   CheckBrowseMode;
   UpdateRange;
   ApplyRange;
end;

procedure TDBISAMTable.MasterDisabled(Sender: TObject);
begin
   CancelRange;
end;

function TDBISAMTable.GetRanged: Boolean;
begin
   Result:=FHandle.RangeInEffect;
end;

function TDBISAMTable.GetDataSource: TDataSource;
begin
   Result:=FMasterLink.DataSource;
end;

procedure TDBISAMTable.SetDataSource(Value: TDataSource);
begin
   if IsLinkedTo(Value) then
      DatabaseError(SCircularDataLink);
   FMasterLink.DataSource:=Value;
end;

function TDBISAMTable.GetMasterFields: string;
begin
   Result:=FMasterLink.FieldNames;
end;

procedure TDBISAMTable.SetMasterFields(const Value: string);
begin
   FMasterLink.FieldNames:=Value;
end;

procedure TDBISAMTable.DoOnNewRecord;
var
   I: Integer;
begin
   if FMasterLink.Active and (FMasterLink.Fields.Count > 0) then
      begin
      for I:=0 to FMasterLink.Fields.Count-1 do
         IndexFields[I]:=TField(FMasterLink.Fields[I]);
      end;
   inherited DoOnNewRecord;
end;

procedure TDBISAMTable.CheckForEmptyFieldDefs;
var
   I: Integer;
begin
   { First try to use the TFields }
   if (FFieldDefs.Count=0) then
      begin
      for I:=0 to FieldCount-1 do
         begin
         with Fields[I] do
            begin
            if (FieldKind=fkData) then
               FFieldDefs.Add(FieldNo,FieldName,DataType,Size,Required,
                                    '','','','',fcNoChange);
            end;
         end;
      end;
   { If there are no TFields defined, then use the TDataSet.FieldDefs }
   if (FFieldDefs.Count=0) then
      FFieldDefs.Assign(inherited FieldDefs);
end;

procedure TDBISAMTable.CreateTable(NewLocaleID: Integer=LOCALE_ANSI_STD;
                                   NewUserMajorVersion: Word=1;
                                   NewUserMinorVersion: Word=0;
                                   NewEncrypted: Boolean=False;
                                   const NewPassword: string='';
                                   const NewDescription: string='';
                                   NewIndexPageSize: Integer=DEFAULT_PAGE_SIZE;
                                   NewBlobBlockSize: Integer=DEFAULT_BLOCK_SIZE;
                                   NewLastAutoIncValue: Integer=-1;
                                   const NewTextIndexFields: string='';
                                   NewTextIndexStopWords: TStrings=nil;
                                   const NewTextIndexSpaceChars: string='';
                                   const NewTextIndexIncludeChars: string='');
var
   I: Integer;
   J: Integer;
   TempFieldDefinitions: array[1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempIndexDefinitions: array[0..MAX_NUM_INDEXES] of pIndexDefinition;
   TempCursor: TDataCursor;
   TempIndexDefs: TDBISAMIndexDefs;
begin
   CheckInactive;
   CheckForEmptyFieldDefs;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=TDataCursor.Create(Database.Handle,False);
      try
         with TempCursor do
            begin
            TableName:=FTableName;
            ReadOnly:=False;
            Exclusive:=True;
            FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
            FillChar(TempIndexDefinitions,SizeOf(TempIndexDefinitions),#0);
            for I:=0 to FFieldDefs.Count-1 do
               begin
               TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
               with FFieldDefs[I] do
                  begin
                  FieldNo:=(I+1);
                  EncodeFieldDefinition(TempFieldDefinitions[I+1]^,Name,
                                        DataType,Size,Required,
                                        DefaultValue,MinValue,MaxValue,
                                        Description,CharCase,Compression,FieldNo);
                  end;
               end;
            { Check the index defs first to make sure that the primary index is
              the first defined index (if a primary index is defined) }
            I:=0;
            while (I <= (FIndexDefs.Count-1)) do
               begin
               with FIndexDefs[I] do
                  begin
                  if (ixPrimary in Options) and (I <> 0) then
                     begin
                     if (ixPrimary in FIndexDefs[0].Options) then
                        DatabaseError(STooManyPrimaryIndexes);
                     TempIndexDefs:=TDBISAMIndexDefs.Create(Self);
                     try
                        TempIndexDefs.Add(Name,Fields,Options,DescFields,Compression);
                        for J:=0 to FIndexDefs.Count-1 do
                           begin
                           if (J <> I) then
                              begin
                              with FIndexDefs[J] do
                                 TempIndexDefs.Add(Name,Fields,Options,DescFields,
                                                   Compression);
                              end;
                           end;
                        FIndexDefs.Assign(TempIndexDefs);
                     finally
                        TempIndexDefs.Free;
                     end;
                     end;
                  end;
               Inc(I);
               end;
            { Encode the text indexing index definition }
            TempIndexDefinitions[TEXT_INDEX_POS]:=AllocMem(SizeOf(TIndexDefinition));
            EncodeIndexDefinition(TempIndexDefinitions[TEXT_INDEX_POS]^,
                                  TEXT_INDEX_NAME,NewTextIndexFields,[],'',icFull,True);
            { Handle the case where there's no primary index }
            if (FIndexDefs.Count=0) or
               (not (ixPrimary in FIndexDefs[0].Options)) then
               begin
               TempIndexDefinitions[0]:=AllocMem(SizeOf(TIndexDefinition));
               for I:=0 to FIndexDefs.Count-1 do
                  begin
                  TempIndexDefinitions[I+1]:=AllocMem(SizeOf(TIndexDefinition));
                  with FIndexDefs[I] do
                     EncodeIndexDefinition(TempIndexDefinitions[I+1]^,Name,Fields,
                                           Options,DescFields,Compression,False);
                  end;
               try
                  CreateTable(NewLocaleID,
                              NewUserMajorVersion,NewUserMinorVersion,
                              NewEncrypted,NewPassword,
                              NewDescription,
                              NewIndexPageSize,NewBlobBlockSize,
                              NewLastAutoIncValue,
                              NewTextIndexStopWords,
                              StringToCharSet(NewTextIndexSpaceChars),
                              StringToCharSet(NewTextIndexIncludeChars),False,
                              FFieldDefs.Count,
                              TempFieldDefinitions,
                              FIndexDefs.Count,TempIndexDefinitions);
               finally
                  for I:=1 to FFieldDefs.Count do
                     DeAllocMem(TempFieldDefinitions[I]);
                  for I:=0 to FIndexDefs.Count do
                     DeAllocMem(TempIndexDefinitions[I]);
                  DeAllocMem(TempIndexDefinitions[TEXT_INDEX_POS]);
               end;
               end
            else
               begin
               for I:=0 to FIndexDefs.Count-1 do
                  begin
                  TempIndexDefinitions[I]:=AllocMem(SizeOf(TIndexDefinition));
                  with FIndexDefs[I] do
                     EncodeIndexDefinition(TempIndexDefinitions[I]^,Name,Fields,
                                           Options,DescFields,Compression,False);
                  end;
               try
                  CreateTable(NewLocaleID,
                              NewUserMajorVersion,NewUserMinorVersion,
                              NewEncrypted,NewPassword,
                              NewDescription,
                              NewIndexPageSize,NewBlobBlockSize,
                              NewLastAutoIncValue,
                              NewTextIndexStopWords,
                              StringToCharSet(NewTextIndexSpaceChars),
                              StringToCharSet(NewTextIndexIncludeChars),False,
                              FFieldDefs.Count,TempFieldDefinitions,
                              FIndexDefs.Count-1,TempIndexDefinitions);
               finally
                  for I:=1 to FFieldDefs.Count do
                     DeAllocMem(TempFieldDefinitions[I]);
                  for I:=0 to FIndexDefs.Count-1 do
                     DeAllocMem(TempIndexDefinitions[I]);
                  DeAllocMem(TempIndexDefinitions[TEXT_INDEX_POS]);
               end;
               end;
            end;
      finally
         TempCursor.Free;
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.ImportTable(const FileToImport: string; Delimiter: Char;
                                   ReadHeaders: Boolean=False;
                                   FieldsToImport: TStrings=nil;
                                   const DateFormat: string=ANSI_DATE_FORMAT;
                                   const TimeFormat: string=ANSI_TIME_FORMAT;
                                   DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,False)
      else
         TempCursor:=FHandle;
      try
         ImportData(TempCursor,FileToImport,Delimiter,ReadHeaders,
                    FieldsToImport,DateFormat,TimeFormat,DecSeparator);
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.ExportTable(const ExportToFile: string; Delimiter: Char;
                                   WriteHeaders: Boolean=False;
                                   FieldsToExport: TStrings=nil;
                                   const DateFormat: string=ANSI_DATE_FORMAT;
                                   const TimeFormat: string=ANSI_TIME_FORMAT;
                                   DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,False)
      else
         TempCursor:=FHandle;
      try
         ExportData(TempCursor,ExportToFile,Delimiter,WriteHeaders,
                    FieldsToExport,DateFormat,TimeFormat,DecSeparator);
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.LoadFromStream(SourceStream: TStream);
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,False)
      else
         TempCursor:=FHandle;
      try
         LoadDataFromStream(TempCursor,SourceStream);
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.SaveToStream(DestStream: TStream);
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,False)
      else
         TempCursor:=FHandle;
      try
         SaveDataToStream(TempCursor,DestStream);
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.DeleteTable;
var
   TempCursor: TDataCursor;
begin
   CheckInactive;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=GetTempCursor(False,True,False);
      try
         TempCursor.DeleteTable;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.EmptyTable;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,True,False)
      else
         TempCursor:=FHandle;
      try
         if Active then
            begin
            CheckBrowseMode;
            TempCursor.EmptyTable;
            ClearBuffers;
            DataEvent(deDataSetChange,0);
            end
         else
            TempCursor.EmptyTable;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.LockTable;
begin
   SetTableLock(True);
end;

procedure TDBISAMTable.SetTableLock(Lock: Boolean);
begin
   CheckActive;
   if (FHandle <> nil) then
      begin
      if Lock then
         FHandle.LockTable
      else
         FHandle.UnlockTable;
      end;
end;

procedure TDBISAMTable.UnlockTable;
begin
   SetTableLock(False);
end;

procedure TDBISAMTable.RenameTable(const NewTableName: string);
var
   TempCursor: TDataCursor;
begin
   CheckInactive;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=GetTempCursor(False,True,False);
      try
         with TempCursor do
            begin
            RenameTable(NewTableName);
            FTableName:=TableName;
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.CopyTable(const NewDatabaseName: string;
                                 const NewTableName: string);
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(True,False,True)
      else
         TempCursor:=FHandle;
      try
         with TempCursor do
            begin
            SetProgressCallback(Integer(Self),@TDBISAMTable.CopyProgress);
            CopyTable(NewDatabaseName,NewTableName,True,Assigned(FOnCopyProgress));
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.OptimizeTable(const OptimizeIndexName: string='';
                                      SuppressBackups: Boolean=False);
var
   TempCursor: TDataCursor;
begin
   CheckInactive;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=GetTempCursor(False,True,False);
      try
         with TempCursor do
            begin
            SetProgressCallback(Integer(Self),@TDBISAMTable.OptimizeProgress);
            OptimizeTable(OptimizeIndexName,SuppressBackups,Assigned(FOnOptimizeProgress));
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.VerifyTable: Boolean;
var
   TempCursor: TDataCursor;
begin
   CheckInactive;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=GetTempCursor(False,True,False);
      try
         with TempCursor do
            begin
            SetSteppedProgressCallback(Integer(Self),@TDBISAMTable.VerifyProgress);
            SetLogCallback(Integer(Self),@TDBISAMTable.VerifyLog);
            Result:=RepairTable(True,False,Assigned(FOnVerifyProgress),Assigned(FOnVerifyLog),
                                False);
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.RepairTable(ForceIndexRebuild: Boolean=False): Boolean;
var
   TempCursor: TDataCursor;
begin
   CheckInactive;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=GetTempCursor(False,True,False);
      try
         with TempCursor do
            begin
            SetSteppedProgressCallback(Integer(Self),@TDBISAMTable.RepairProgress);
            SetLogCallback(Integer(Self),@TDBISAMTable.RepairLog);
            Result:=RepairTable(False,False,Assigned(FOnRepairProgress),Assigned(FOnRepairLog),
                                ForceIndexRebuild);
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.UpgradeTable;
var
   TempCursor: TDataCursor;
begin
   CheckInactive;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=GetTempCursor(False,True,False);
      try
         with TempCursor do
            begin
            SetSteppedProgressCallback(Integer(Self),@TDBISAMTable.UpgradeProgress);
            SetLogCallback(Integer(Self),@TDBISAMTable.UpgradeLog);
            UpgradeTable(Assigned(FOnUpgradeProgress),Assigned(FOnUpgradeLog));
            end;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

procedure TDBISAMTable.AddFieldDefinition(var FieldNo: Integer;
                                          var Name: string; var DataType: TFieldType;
                                          var Size: Word; var Required: Boolean;
                                          var DefaultValue: string;
                                          var MinValue: string; var MaxValue: string;
                                          var Description: string;
                                          var CharCase: TFieldCharCase;
                                          var Compression: Byte);
var
   TempFieldDef: TDBISAMFieldDef;
begin
   inherited;
   if (DataType <> ftUnknown) then
      begin
      FAddingTableDef:=True;
      try
         with FFieldDefs do
            begin
            TempFieldDef:=AddFieldDef;
            BeginUpdate;
            try
               TempFieldDef.FieldNo:=FieldNo;
               TempFieldDef.Name:=Name;
               TempFieldDef.DataType:=DataType;
               TempFieldDef.Size:=Size;
               TempFieldDef.Required:=Required;
               TempFieldDef.DefaultValue:=DefaultValue;
               TempFieldDef.MinValue:=MinValue;
               TempFieldDef.MaxValue:=MaxValue;
               TempFieldDef.Description:=Description;
               TempFieldDef.CharCase:=CharCase;
               TempFieldDef.Compression:=Compression;
            finally
               EndUpdate;
            end;
            end;
      finally
         FAddingTableDef:=False;
      end;
      end;
end;

procedure TDBISAMTable.EncodeFieldDefinition(var FieldDefinition: TFieldDefinition;
                                             const Name: string; DataType: TFieldType;
                                             Size: Word; Required: Boolean;
                                             const DefaultValue: string;
                                             const MinValue: string;
                                             const MaxValue: string;
                                             const Description: string;
                                             CharCase: TFieldCharCase;
                                             Compression: Byte; FieldNo: Integer);
begin
   FillChar(FieldDefinition,SizeOf(TFieldDefinition),#0);
   FieldDefinition.FieldName:=Name;
   FieldDefinition.FieldNum:=FieldNo;
   FieldDefinition.DataType:=FldTypeMap[DataType];
   FieldDefinition.SubType:=FldSubTypeMap[DataType];
   if (DataType in [ftString,ftFixedChar,ftWideString,ftBytes,ftVarBytes]) then
      FieldDefinition.Length:=Size
   else if (DataType=ftGUID) then
      FieldDefinition.Length:=TYPE_GUID_LENGTH
   else if (DataType=ftBCD) then
      FieldDefinition.Decimals:=Size;
   FieldDefinition.Required:=Required;
   FieldDefinition.Default:=DefaultValue;
   FieldDefinition.Minimum:=MinValue;
   FieldDefinition.Maximum:=MaxValue;
   FieldDefinition.Description:=Description;
   FieldDefinition.CharCase:=Byte(CharCase);
   FieldDefinition.Compression:=Compression;
end;

procedure TDBISAMTable.DecodeIndexDefinition(IndexDefinition: pIndexDefinition;
                                             KeyPos: Byte; var Name: string;
                                             var Fields: string;
                                             var Options: TIndexOptions;
                                             var DescFields: string;
                                             var Compression: TIndexCompression);
var
   IndexOptions: TIndexOptions;
   I: Integer;
begin
   with IndexDefinition^ do
      begin
      Name:=IndexName;
      IndexOptions:=[];
      if (KeyPos=0) then
         Include(IndexOptions,ixPrimary);
      if KeyDescending then
         Include(IndexOptions,ixDescending);
      if KeyCaseInsensitive then
         Include(IndexOptions,ixCaseInsensitive);
      if KeyUnique then
         Include(IndexOptions,ixUnique);
      Fields:='';
      for I:=1 to KeyFieldCount do
         begin
         if (KeyFields[I]=RECORDID_FIELD_NUM) then
            begin
            if (Fields <> '') then
               Fields:=Fields+';';
            Fields:=Fields+RECORDID_FIELD_NAME;
            end
         else if (KeyFields[I]=RECORDHASH_FIELD_NUM) then
            begin
            if (Fields <> '') then
               Fields:=Fields+';';
            Fields:=Fields+RECORDHASH_FIELD_NAME;
            end
         else if (KeyFields[I] <= FFieldDefs.Count) then
            begin
            if (Fields <> '') then
               Fields:=Fields+';';
            Fields:=Fields+FFieldDefs[KeyFields[I]-1].Name;
            end;
         end;
      DescFields:='';
      for I:=1 to KeyFieldCount do
         begin
         if (KeyFields[I]=RECORDID_FIELD_NUM) then
            begin
            if KeyDescendingFields[I] then
               begin
               if (DescFields <> '') then
                  DescFields:=DescFields+';';
               DescFields:=DescFields+RECORDID_FIELD_NAME;
               end;
            end
         else if (KeyFields[I]=RECORDHASH_FIELD_NUM) then
            begin
            if KeyDescendingFields[I] then
               begin
               if (DescFields <> '') then
                  DescFields:=DescFields+';';
               DescFields:=DescFields+RECORDHASH_FIELD_NAME;
               end;
            end
         else if (KeyFields[I] <= FFieldDefs.Count) then
            begin
            if KeyDescendingFields[I] then
               begin
               if (DescFields <> '') then
                  DescFields:=DescFields+';';
               DescFields:=DescFields+FFieldDefs[KeyFields[I]-1].Name;
               end;
            end;
         end;
      Options:=IndexOptions;
      Compression:=TIndexCompression(KeyCompressionType);
      end;
end;

procedure TDBISAMTable.AddIndexDefinition(const Name: string; const Fields: string;
                                          Options: TIndexOptions;
                                          const DescFields: string;
                                          Compression: TIndexCompression);
var
   TempIndexDef: TDBISAMIndexDef;
begin
   with FIndexDefs do
      begin
      TempIndexDef:=AddIndexDef;
      TempIndexDef.Name:=Name;
      TempIndexDef.Fields:=Fields;
      TempIndexDef.DescFields:=DescFields;
      TempIndexDef.Options:=Options;
      TempIndexDef.Compression:=Compression;
      end;
end;

procedure TDBISAMTable.EncodeIndexDefinition(var IndexDefinition: TIndexDefinition;
                                             const Name: string; const Fields: string;
                                             Options: TIndexOptions;
                                             const DescFields: string;
                                             Compression: TIndexCompression;
                                             NoKeyStats: Boolean);
var
   Pos: Integer;
   I: Integer;
   TempFieldNo: Integer;
   TempFieldName: string;
begin
   FillChar(IndexDefinition,SizeOf(TIndexDefinition),0);
   with IndexDefinition do
      begin
      IndexName:=Name;
      KeyDescending:=(ixDescending in Options);
      KeyCaseInsensitive:=(ixCaseInsensitive in Options);
      KeyUnique:=(ixUnique in Options);
      Pos:=1;
      while (Pos <= Length(Fields)) and (KeyFieldCount < MAX_NUM_FLDSINKEY) do
         begin
         Inc(KeyFieldCount);
         TempFieldName:=ExtractFieldName(Fields,Pos);
         if (AnsiCompareText(TempFieldName,RECORDID_FIELD_NAME)=0) then
            KeyFields[KeyFieldCount]:=RECORDID_FIELD_NUM
         else if (AnsiCompareText(TempFieldName,RECORDHASH_FIELD_NAME)=0) then
            KeyFields[KeyFieldCount]:=RECORDHASH_FIELD_NUM
         else
            KeyFields[KeyFieldCount]:=FFieldDefs.Find(TempFieldName).FieldNo;
         end;
      Pos:=1;
      while (Pos <= Length(DescFields)) do
         begin
         TempFieldName:=ExtractFieldName(DescFields,Pos);
         if (AnsiCompareText(TempFieldName,RECORDID_FIELD_NAME)=0) then
            TempFieldNo:=RECORDID_FIELD_NUM
         else if (AnsiCompareText(TempFieldName,RECORDHASH_FIELD_NAME)=0) then
            TempFieldNo:=RECORDHASH_FIELD_NUM
         else
            TempFieldNo:=FFieldDefs.Find(TempFieldName).FieldNo;
         for I:=1 to KeyFieldCount do
            begin
            if (KeyFields[I]=TempFieldNo) then
               KeyDescendingFields[I]:=True;
            end;
         end;
      KeyCompressionType:=Byte(Compression);
      NoKeyStatistics:=NoKeyStats;
      end;
end;

procedure TDBISAMTable.DataEvent(Event: TDataEvent; Info: Integer);
begin
   if (Event=dePropertyChange) then
      begin
      FFieldDefs.Updated:=False;
      FIndexDefs.Updated:=False;
      end;
   inherited DataEvent(Event,Info);
end;

{ Informational & Property }

function TDBISAMTable.GetCanModify: Boolean;
begin
   Result:=(inherited GetCanModify and (not ReadOnly));
end;

procedure TDBISAMTable.SetExclusive(Value: Boolean);
begin
   if (Value <> FExclusive) then
      begin
      CheckInactive;
      FExclusive:=Value;
      end;
end;

procedure TDBISAMTable.SetReadOnly(Value: Boolean);
begin
   if (Value <> FReadOnly) then
      begin
      CheckInactive;
      FReadOnly:=Value;
      end;
end;

procedure TDBISAMTable.SetTableName(const Value: string);
var
   TempString: string;
begin
   if (csReading in ComponentState) then
      FTableName:=Value
   else
      begin
      TempString:=ConvertSlashes(Value);
      if (TempString <> FTablename) then
         begin
         CheckInactive;
         if ContainsDirectory(TempString) then
            begin
            DatabaseName:=ExtractFilePath(TempString);
            FTableName:=ExtractFileName(TempString);
            end
         else
            FTableName:=TempString;
         DataEvent(dePropertyChange,0);
         end;
      end;
end;

procedure TDBISAMTable.AlterTable(NewLocaleID: Integer=LOCALE_ANSI_STD;
                                  NewUserMajorVersion: Word=1;
                                  NewUserMinorVersion: Word=0;
                                  NewEncrypted: Boolean=False;
                                  const NewPassword: string='';
                                  const NewDescription: string='';
                                  NewIndexPageSize: Integer=DEFAULT_PAGE_SIZE;
                                  NewBlobBlockSize: Integer=DEFAULT_BLOCK_SIZE;
                                  NewLastAutoIncValue: Integer=-1;
                                  const NewTextIndexFields: string='';
                                  NewTextIndexStopWords: TStrings=nil;
                                  const NewTextIndexSpaceChars: string='';
                                  const NewTextIndexIncludeChars: string='';
                                  SuppressBackups: Boolean=False);
var
   I: Integer;
   J: Integer;
   TempFieldDefinitions: array[1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempIndexDefinitions: array[0..MAX_NUM_INDEXES] of pIndexDefinition;
   TempCursor: TDataCursor;
   TempIndexDefs: TDBISAMIndexDefs;
   MaxFieldNo: Integer;
begin
   CheckInactive;
   CheckForEmptyFieldDefs;
   SetDBFlag(dbfTable,True);
   try
      TempCursor:=TDataCursor.Create(Database.Handle,False);
      try
         with TempCursor do
            begin
            TableName:=FTableName;
            Exclusive:=True;
            FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
            FillChar(TempIndexDefinitions,SizeOf(TempIndexDefinitions),#0);
            { Version 5 }
            MaxFieldNo:=0;
            for I:=0 to FFieldDefs.Count-1 do
               MaxFieldNo:=MaximumInteger(FFieldDefs[I].FieldNo,MaxFieldNo);
            { Version 5 }
            for I:=0 to FFieldDefs.Count-1 do
               begin
               TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
               with FFieldDefs[I] do
                  begin
                  if (FieldNo=0) then
                     begin
                     Inc(MaxFieldNo);
                     FieldNo:=MaxFieldNo;
                     end;
                  EncodeFieldDefinition(TempFieldDefinitions[I+1]^,Name,
                                        DataType,Size,Required,
                                        DefaultValue,MinValue,MaxValue,
                                        Description,CharCase,Compression,FieldNo);
                  end;
               end;
            { Check the index defs first to make sure that the
              primary index is the first defined index (if a primary index
              is defined) }
            I:=0;
            while (I <= (FIndexDefs.Count-1)) do
               begin
               with FIndexDefs[I] do
                  begin
                  if (ixPrimary in Options) and (I <> 0) then
                     begin
                     if (ixPrimary in FIndexDefs[0].Options) then
                        DatabaseError(STooManyPrimaryIndexes);
                     TempIndexDefs:=TDBISAMIndexDefs.Create(Self);
                     try
                        TempIndexDefs.Add(Name,Fields,Options,DescFields,Compression);
                        FIndexDefs.Delete(I);
                        for J:=0 to FIndexDefs.Count-1 do
                           begin
                           with FIndexDefs[J] do
                              TempIndexDefs.Add(Name,Fields,Options,DescFields,Compression);
                           end;
                        FIndexDefs.Assign(TempIndexDefs);
                     finally
                        TempIndexDefs.Free;
                     end;
                     end;
                  end;
               Inc(I);
               end;
            { Encode the text indexing index definition }
            TempIndexDefinitions[TEXT_INDEX_POS]:=AllocMem(SizeOf(TIndexDefinition));
            EncodeIndexDefinition(TempIndexDefinitions[TEXT_INDEX_POS]^,
                                  TEXT_INDEX_NAME,NewTextIndexFields,
                                  [],'',icFull,True);
            { Handle the case where there's no primary index }
            if (FIndexDefs.Count=0) or
               (not (ixPrimary in FIndexDefs[0].Options)) then
               begin
               TempIndexDefinitions[0]:=AllocMem(SizeOf(TIndexDefinition));
               for I:=0 to FIndexDefs.Count-1 do
                  begin
                  TempIndexDefinitions[I+1]:=AllocMem(SizeOf(TIndexDefinition));
                  with FIndexDefs[I] do
                     EncodeIndexDefinition(TempIndexDefinitions[I+1]^,Name,Fields,
                                           Options,DescFields,Compression,False);
                  end;
               try
                  SetProgressCallback(Integer(Self),@TDBISAMTable.AlterProgress);
                  SetDataLostCallback(Integer(Self),@TDBISAMTable.DataLost);
                  AlterTable(NewLocaleID,
                             NewUserMajorVersion,NewUserMinorVersion,
                             NewEncrypted,NewPassword,
                             NewDescription,
                             NewIndexPageSize,NewBlobBlockSize,
                             NewLastAutoIncValue,
                             NewTextIndexStopWords,
                             StringToCharSet(NewTextIndexSpaceChars),
                             StringToCharSet(NewTextIndexIncludeChars),
                             SuppressBackups,
                             Assigned(FOnAlterProgress),Assigned(FOnDataLost),
                             FFieldDefs.Count,
                             TempFieldDefinitions,
                             FIndexDefs.Count,TempIndexDefinitions);
               finally
                  for I:=1 to FFieldDefs.Count do
                     DeAllocMem(TempFieldDefinitions[I]);
                  for I:=0 to FIndexDefs.Count do
                     DeAllocMem(TempIndexDefinitions[I]);
                  DeAllocMem(TempIndexDefinitions[TEXT_INDEX_POS]);
               end;
               end
            else
               begin
               for I:=0 to FIndexDefs.Count-1 do
                  begin
                  TempIndexDefinitions[I]:=AllocMem(SizeOf(TIndexDefinition));
                  with FIndexDefs[I] do
                     EncodeIndexDefinition(TempIndexDefinitions[I]^,Name,Fields,
                                           Options,DescFields,Compression,False);
                  end;
               try
                  SetProgressCallback(Integer(Self),
                                                 @TDBISAMTable.AlterProgress);
                  SetDataLostCallback(Integer(Self),@TDBISAMTable.DataLost);
                  AlterTable(NewLocaleID,
                             NewUserMajorVersion,NewUserMinorVersion,
                             NewEncrypted,NewPassword,
                             NewDescription,
                             NewIndexPageSize,NewBlobBlockSize,
                             NewLastAutoIncValue,
                             NewTextIndexStopWords,
                             StringToCharSet(NewTextIndexSpaceChars),
                             StringToCharSet(NewTextIndexIncludeChars),
                             SuppressBackups,
                             Assigned(FOnAlterProgress),Assigned(FOnDataLost),
                             FFieldDefs.Count,
                             TempFieldDefinitions,
                             FIndexDefs.Count-1,TempIndexDefinitions);
               finally
                  for I:=1 to FFieldDefs.Count do
                     DeAllocMem(TempFieldDefinitions[I]);
                  for I:=0 to FIndexDefs.Count-1 do
                     DeAllocMem(TempIndexDefinitions[I]);
                  DeAllocMem(TempIndexDefinitions[TEXT_INDEX_POS]);
               end;
               end;
            end;
      finally
         TempCursor.Free;
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.RecordIsLocked: Boolean;
begin
   CheckActive;
   UpdateCursorPos;
   if (FHandle <> nil) then
      Result:=FHandle.RecordIsLocked
   else
      Result:=False;
end;

function TDBISAMTable.TableIsLocked: Boolean;
begin
   CheckActive;
   if (FHandle <> nil) then
      Result:=FHandle.TableIsLocked
   else
      Result:=False;
end;

function TDBISAMTable.LockSemaphore(Value: Integer): Boolean;
begin
   CheckActive;
   if (FHandle <> nil) then
      Result:=FHandle.LockSemaphore(Value)
   else
      Result:=False;
end;

function TDBISAMTable.UnlockSemaphore(Value: Integer): Boolean;
begin
   CheckActive;
   if (FHandle <> nil) then
      Result:=FHandle.UnlockSemaphore(Value)
   else
      Result:=False;
end;

function TDBISAMTable.GetVersionNum: string;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.VersionNum;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetUserMajorVersion: Word;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.UserMajorVersion;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetUserMinorVersion: Word;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.UserMinorVersion;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetLocaleID: Integer;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.LocaleID;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetEncrypted: Boolean;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.Encrypted;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetPassword: string;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.Password;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetDescription: string;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.Description;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetLastUpdated: TDateTime;
var
   TempCursor: TDataCursor;
begin
   SetDBFlag(dbfTable,True);
   try
      if (FHandle=nil) then
         TempCursor:=GetTempCursor(False,False,True)
      else
         TempCursor:=FHandle;
      try
         Result:=TempCursor.LastUpdated;
      finally
         FreeTempCursor(TempCursor);
      end;
   finally
      SetDBFlag(dbfTable,False);
   end;
end;

function TDBISAMTable.GetTempCursor(PerformOpen: Boolean; OpenExclusive: Boolean;
                                    OpenReadOnly: Boolean): TDataCursor;
begin
   Result:=TDataCursor.Create(Database.Handle,False);
   with Result do
      begin
      TableName:=FTableName;
      Exclusive:=OpenExclusive;
      ReadOnly:=FReadOnly;
      if PerformOpen then
         OpenCursor(False);
      end;
end;

procedure TDBISAMTable.FreeTempCursor(var TempCursor: TDataCursor);
begin
   if (TempCursor <> nil) and (TempCursor <> FHandle) then
      begin
      with TempCursor do
         begin
         CloseCursor(True);
         Free;
         end;
      TempCursor:=nil;
      end;
end;

function TDBISAMTable.GetFullTableName: string;
begin
   CheckActive;
   if (Database.Session.SessionType=stRemote) then
      Result:=AddBS(Database.RemoteDatabase)+FTableName
   else
      Result:=AddBS(Database.Directory)+FTableName;
end;

function TDBISAMTable.GetTableSize: Int64;
begin
   CheckActive;
   Result:=FHandle.TableSize;
end;

{ IProvider Support }

function TDBISAMTable.PSGetDefaultOrder: TIndexDef;

   function GetIndex(IndexType: TIndexOption): TDBISAMIndexDef;
   var
      I: Integer;
   begin
      Result:=nil;
      for I:=0 to FIndexDefs.Count-1 do
         begin
         if (IndexType in FIndexDefs[i].Options) then
            begin
            try
               Result:=FIndexDefs[I];
               GetFieldList(nil,Result.Fields);
               Break;
            except
               Result:=nil;
            end;
            end;
         end;
   end;

var
   DefaultIndex: TDBISAMIndexDef;
begin
   DefaultIndex:=nil;
   FIndexDefs.Update;
   try
      if (IndexName <> '') then
         DefaultIndex:=FIndexDefs.Find(IndexName)
      else if (IndexFieldNames <> '') then
         DefaultIndex:=FIndexDefs.FindIndexForFields(IndexFieldNames);
      if Assigned(DefaultIndex) then
         GetFieldList(nil,DefaultIndex.Fields);
   except
      DefaultIndex:=nil;
   end;
   if not Assigned(DefaultIndex) then
      DefaultIndex:=GetIndex(ixPrimary);
   if not Assigned(DefaultIndex) then
      DefaultIndex:=GetIndex(ixUnique);
   if Assigned(DefaultIndex) then
      begin
      Result:=TIndexDef.Create(nil);
      Result.Assign(DefaultIndex);
      end
   else
      Result:=nil;
end;

function TDBISAMTable.PSGetIndexDefs(IndexTypes: TIndexOptions): TIndexDefs;
var
   TempIndexDefs: TIndexDefs;
begin
   TempIndexDefs:=TIndexDefs.Create(Self);
   try
      FIndexDefs.Update;
      TempIndexDefs.Assign(FIndexDefs);
      Result:=GetIndexDefs(TempIndexDefs,IndexTypes);
   finally
      TempIndexDefs.Free;
   end;
end;

function TDBISAMTable.PSGetTableName: string;
begin
   Result:=FTableName;
end;

procedure TDBISAMTable.PSSetParams(AParams: TParams);

   procedure AssignFields;
   var
      I: Integer;
   begin
      for I:=0 to AParams.Count-1 do
         begin
         if (AParams[I].Name <> '') then
            FieldByName(AParams[I].Name).Value:=AParams[I].Value
         else
            IndexFields[I].Value:=AParams[I].Value;
         end;
   end;

begin
   if (AParams.Count > 0) then
      begin
      Open;
      SetRangeStart;
      AssignFields;
      SetRangeEnd;
      AssignFields;
      ApplyRange;
      end
   else
      begin
      if Active then
         CancelRange;
      end;
   PSReset;
end;

procedure TDBISAMTable.PSSetCommandText(const CommandText: string);
begin
   if (CommandText <> '') then
      TableName:=CommandText;
end;

function TDBISAMTable.PSGetKeyFields: string;
var
   I: Integer;
   Pos: Integer;
   IndexFound: Boolean;
begin
   Result:=inherited PSGetKeyFields;
   if (Result='') then
      begin
      if (not Exists) then
         Exit;
      IndexFound:=False;
      FIndexDefs.Update;
      for I:=0 to FIndexDefs.Count-1 do
         begin
         if (ixUnique in FIndexDefs[I].Options) then
            begin
            Result:=FIndexDefs[I].Fields;
            IndexFound:=(FieldCount=0);
            if (not IndexFound) then
               begin
               Pos:=1;
               while (Pos <= Length(Result)) do
                  begin
                  IndexFound:=(FindField(ExtractFieldName(Result,Pos)) <> nil);
                  if (not IndexFound) then
                     Break;
                  end;
               end;
            if IndexFound then
               Break;
            end;
         end;
      if (not IndexFound) then
         Result:='';
      end;
end;

{ TDBISAMQueryDataLink }

constructor TDBISAMQueryDataLink.Create(AQuery: TDBISAMQuery);
begin
   inherited Create;
   FQuery:=AQuery;
end;

procedure TDBISAMQueryDataLink.ActiveChanged;
begin
   if FQuery.Active then
      FQuery.RefreshParams;
end;

function TDBISAMQueryDataLink.GetDetailDataSet: TDataSet;
begin
   Result:=FQuery;
end;

procedure TDBISAMQueryDataLink.RecordChanged(Field: TField);
begin
   if (Field=nil) and FQuery.Active then
      FQuery.RefreshParams;
end;

procedure TDBISAMQueryDataLink.CheckBrowseMode;
begin
   if FQuery.Active then
      FQuery.CheckBrowseMode;
end;

{ TDBISAMQuery }

constructor TDBISAMQuery.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FPlan:=TStringList.Create;
   FSQL:=TStringList.Create;
   TStringList(FSQL).OnChange:=QueryChanged;
   FParams:=TDBISAMParams.Create(Self);
   FPSParams:=TParams.Create(Self);
   FDataLink:=TDBISAMQueryDataLink.Create(Self);
   FRequestLive:=False;
   FMaxRowCount:=-1;
   FParamCheck:=True;
end;

destructor TDBISAMQuery.Destroy;
begin
   Destroying;
   Disconnect;
   FSQL.Free;
   FPlan.Free;
   FPSParams.Free;
   FParams.Free;
   FDataLink.Free;
   inherited Destroy;
end;

function TDBISAMQuery.GetEngineVersion: string;
begin
   Result:=ENGINE_VERSION+' Build '+ENGINE_BUILD;
end;

procedure TDBISAMQuery.SetEngineVersion(const Value: string);
begin
end;

procedure TDBISAMQuery.Disconnect;
begin
   Close;
   UnPrepare;
end;

procedure TDBISAMQuery.SetPrepare(Value: Boolean);
begin
   if Value then
      Prepare
   else
      UnPrepare;
end;

procedure TDBISAMQuery.Prepare;
begin
   SetDBFlag(dbfPrepared,True);
   SetPrepared(True);
end;

procedure TDBISAMQuery.UnPrepare;
begin
   SetPrepared(False);
   SetDBFlag(dbfPrepared,False);
end;

procedure TDBISAMQuery.SetDataSource(Value: TDataSource);
begin
   if IsLinkedTo(Value) then
      DatabaseError(SCircularDataLink);
   FDataLink.DataSource:=Value;
end;

function TDBISAMQuery.GetDataSource: TDataSource;
begin
   Result:=FDataLink.DataSource;
end;

procedure TDBISAMQuery.SetQuery(Value: TStrings);
begin
   if (FSQL.Text <> Value.Text) then
      begin
      Disconnect;
      FSQL.BeginUpdate;
      try
         FSQL.Assign(Value);
      finally
         FSQL.EndUpdate;
      end;
      end;
end;

procedure TDBISAMQuery.QueryChanged(Sender: TObject);
begin
   FSQLTextPos:=1;
   FSQLTextLine:=1;
   FSQLTextColumn:=1;
   FSQLLastTextLine:=1;
   FSQLLastTextColumn:=1;
   if not (csReading in ComponentState) then
      begin
      Disconnect;
      if (FParamCheck or (csDesigning in ComponentState)) then
         ParseParams(True)
      else
         ParseParams(False);
      DataEvent(dePropertyChange,0);
      end
   else
      ParseParams(False);
end;

procedure TDBISAMQuery.ParseParams(CreateParams: Boolean);
var
   List: TDBISAMParams;
begin
   { Save positions for retry handler }
   FSaveSQLTextPos:=FSQLTextPos;
   FSaveSQLTextLine:=FSQLTextLine;
   FSaveSQLTextColumn:=FSQLTextColumn;
   FSaveSQLLastTextLine:=FSQLLastTextLine;
   FSaveSQLLastTextColumn:=FSQLLastTextColumn;
   if CreateParams then
      begin
      List:=TDBISAMParams.Create(Self);
      try
         FText:=List.ParseSQL(SQL.Text,FSQLTextPos,FSQLTextLine,FSQLTextColumn,
                              FSQLLastTextLine,FSQLLastTextColumn,True);
         List.AssignValues(FParams);
         FParams.Clear;
         FParams.Assign(List);
      finally
         List.Free;
      end;
      end
   else
      FText:=FParams.ParseSQL(SQL.Text,FSQLTextPos,FSQLTextLine,FSQLTextColumn,
                              FSQLLastTextLine,FSQLLastTextColumn,False);
end;

procedure TDBISAMQuery.SetParamsList(Value: TDBISAMParams);
begin
   FParams.AssignValues(Value);
end;

function TDBISAMQuery.GetParamsCount: Word;
begin
   Result:=FParams.Count;
end;

procedure TDBISAMQuery.DefineProperties(Filer: TFiler);

   function WriteData: Boolean;
   begin
      if (Filer.Ancestor <> nil) then
         Result:=(not FParams.IsEqual(TDBISAMQuery(Filer.Ancestor).FParams))
      else
         Result:=(FParams.Count > 0);
   end;

begin
   inherited DefineProperties(Filer);
   Filer.DefineProperty('ParamData',ReadParamData,WriteParamData,WriteData);
end;

procedure TDBISAMQuery.ReadParamData(Reader: TReader);
begin
   Reader.ReadValue;
   Reader.ReadCollection(FParams);
end;

procedure TDBISAMQuery.WriteParamData(Writer: TWriter);
begin
   Writer.WriteCollection(FParams);
end;

procedure TDBISAMQuery.SetPrepared(Value: Boolean);
begin
   CheckInactive;
   if (Value <> Prepared) then
      begin
      if Value then
         begin
         if (FText <> '') then
            PrepareSQL(PChar(FText))
         else
            DatabaseError(SEmptySQLStatement);
         end
      else
         FreeStatement;
      FPrepared:=Value;
      end;
end;

procedure TDBISAMQuery.FreeStatement;
begin
   if (FStmtHandle <> nil) then
      begin
      FStmtHandle.Free;
      FStmtHandle:=nil;
      end;
end;

procedure TDBISAMQuery.SetParamsFromCursor;
var
   I: Integer;
   DataSet: TDataSet;
begin
   if (FDataLink.DataSource <> nil) then
      begin
      DataSet:=FDataLink.DataSource.DataSet;
      if (DataSet <> nil) then
         begin
         DataSet.FieldDefs.Update;
         for I:=0 to FParams.Count-1 do
            begin
            with FParams[I] do
               begin
               if not Bound then
                  begin
                  AssignField(DataSet.FieldByName(Name));
                  Bound:=False;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDBISAMQuery.RefreshParams;
var
   DataSet: TDataSet;
begin
   DisableControls;
   try
      if (FDataLink.DataSource <> nil) then
         begin
         DataSet:=FDataLink.DataSource.DataSet;
         if (DataSet <> nil) then
            begin
            if DataSet.Active and (DataSet.State <> dsSetKey) then
               begin
               Close;
               Open;
               end;
            end;
         end;
   finally
      EnableControls;
   end;
end;

function TDBISAMQuery.ParamByName(const Value: string): TDBISAMParam;
begin
   Result:=FParams.ParamByName(Value);
end;

function TDBISAMQuery.CreateCursor: TDataCursor;
begin
   if (SQL.Count > 0) then
      Result:=GetQueryCursor
   else
      begin
      DatabaseError(SEmptySQLStatement);
      Result:=nil;
      end;
end;

function TDBISAMQuery.CreateHandle: TDataCursor;
begin
   if FUseExistingHandle then
      Result:=FHandle
   else
      Result:=CreateCursor;
end;

procedure TDBISAMQuery.ExecSQL;
var
   TempCursor: TDataCursor;
begin
   CheckInActive;
   SetDBFlag(dbfOpened,True);
   try
      TempCursor:=CreateCursor;
      if (FStmtHandle <> nil) and (FStmtHandle.StatementType=SELECT_STATEMENT) then
         begin
         FUseExistingHandle:=True;
         try
            FHandle:=TempCursor;
            Open;
         finally
            FUseExistingHandle:=False;
         end;
         end
      else
         SetDBFlag(dbfOpened,False);
   except
      SetDBFlag(dbfOpened,False);
      raise;
   end;
end;

function TDBISAMQuery.GetQueryCursor: TDataCursor;
var
   TempCount: Word;
   I: Integer;
   TempParamDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempRecordBuffer: PChar;
   TempBlobCount: Word;
   TempBlobBuffers: array [1..MAX_NUM_FIELDS] of PChar;
   TempAction: TAbortAction;
   TempPlanString: string;
   TempSendProgress: Boolean;
   TempSendDataLost: Boolean;
   TempSendLog: Boolean;
   TempLength: Integer;
   IsScript: Boolean;
   TransactionStarted: Boolean;
begin
   Result:=nil;
   FRowsAffected:=0;
   FExecutionTime:=0;
   TempAction:=aaContinue;
   TempLength:=Length(SQL.Text);
   IsScript:=False;
   TransactionStarted:=False;
   try
      while (TempAction <> aaAbort) do
         begin
         try
            try
               SetPrepared(True);
            finally
               if (not IsScript) and (FSQLTextPos < TempLength) then
                  IsScript:=True;
            end;
            with FStmtHandle do
               begin
               TempSendProgress:=False;
               TempSendDataLost:=False;
               TempSendLog:=False;
               case StatementType of
                  SELECT_STATEMENT,INSERT_STATEMENT,UPDATE_STATEMENT,
                  DELETE_STATEMENT:
                     begin
                     SetAbortProgressCallback(Integer(Self),@TDBISAMQuery.QueryProgress);
                     TempSendProgress:=Assigned(FOnQueryProgress);
                     DoGetParams;
                     if (FDataLink.DataSource <> nil) then
                        SetParamsFromCursor;
                     end;
                  ALTER_TABLE_STATEMENT:
                     begin
                     SetProgressCallback(Integer(Self),@TDBISAMQuery.AlterProgress);
                     TempSendProgress:=Assigned(FOnAlterProgress);
                     SetDataLostCallback(Integer(Self),@TDBISAMQuery.DataLost);
                     TempSendDataLost:=Assigned(FOnDataLost);
                     end;
                  OPTIMIZE_TABLE_STATEMENT:
                     begin
                     SetProgressCallback(Integer(Self),@TDBISAMQuery.OptimizeProgress);
                     TempSendProgress:=Assigned(FOnOptimizeProgress);
                     end;
                  EXPORT_TABLE_STATEMENT:
                     begin
                     SetProgressCallback(Integer(Self),@TDBISAMQuery.ExportProgress);
                     TempSendProgress:=Assigned(FOnExportProgress);
                     end;
                  IMPORT_TABLE_STATEMENT:
                     begin
                     SetProgressCallback(Integer(Self),@TDBISAMQuery.ImportProgress);
                     TempSendProgress:=Assigned(FOnImportProgress);
                     end;
                  VERIFY_TABLE_STATEMENT:
                     begin
                     SetSteppedProgressCallback(Integer(Self),@TDBISAMQuery.VerifyProgress);
                     TempSendProgress:=Assigned(FOnVerifyProgress);
                     SetLogCallback(Integer(Self),@TDBISAMQuery.VerifyLog);
                     TempSendLog:=Assigned(FOnVerifyLog);
                     end;
                  REPAIR_TABLE_STATEMENT:
                     begin
                     SetSteppedProgressCallback(Integer(Self),@TDBISAMQuery.RepairProgress);
                     TempSendProgress:=Assigned(FOnRepairProgress);
                     SetLogCallback(Integer(Self),@TDBISAMQuery.RepairLog);
                     TempSendLog:=Assigned(FOnRepairLog);
                     end;
                  UPGRADE_TABLE_STATEMENT:
                     begin
                     SetSteppedProgressCallback(Integer(Self),@TDBISAMQuery.UpgradeProgress);
                     TempSendProgress:=Assigned(FOnUpgradeProgress);
                     SetLogCallback(Integer(Self),@TDBISAMQuery.UpgradeLog);
                     TempSendLog:=Assigned(FOnUpgradeLog);
                     end;
                  CREATE_INDEX_STATEMENT:
                     begin
                     SetProgressCallback(Integer(Self),@TDBISAMQuery.IndexProgress);
                     TempSendProgress:=Assigned(FOnIndexProgress);
                     end;
                  START_TRANSACTION_STATEMENT:
                     TransactionStarted:=True;
                  COMMIT_TRANSACTION_STATEMENT,ROLLBACK_TRANSACTION_STATEMENT:
                     TransactionStarted:=False;
                  end;
               DoBeforeExecute;
               try
                  FPlan.Clear;
                  TempPlanString:='';
                  TempCount:=FParams.GetNativeBuffer(TempParamDefinitions,
                                                     TempRecordBuffer,
                                                     TempBlobCount,TempBlobBuffers);
                  if (TempCount > 0) then
                     begin
                     try
                        ExecuteStatement(Result,TempCount,TempParamDefinitions,
                                         TempRecordBuffer,
                                         FGeneratePlan,TempPlanString,
                                         TempSendProgress,TempSendDataLost,
                                         TempSendLog);
                     finally
                        DeAllocMem(TempRecordBuffer);
                        for I:=1 to TempCount do
                           DeAllocMem(TempParamDefinitions[I]);
                        for I:=1 to TempBlobCount do
                           DeAllocMem(TempBlobBuffers[I]);
                     end;
                     end
                  else
                     ExecuteStatement(Result,TempCount,TempParamDefinitions,
                                      TempRecordBuffer,
                                      FGeneratePlan,TempPlanString,
                                      TempSendProgress,TempSendDataLost,
                                      TempSendLog);
                  FRowsAffected:=(FRowsAffected+RowsAffected);
                  FExecutionTime:=(FExecutionTime+ExecutionTime);
                  FPlan.Text:=TempPlanString;
               finally
                  SetProgressCallback(0,nil);
                  SetSteppedProgressCallback(0,nil);
                  SetAbortProgressCallback(0,nil);
                  SetLogCallback(0,nil);
                  SetDataLostCallback(0,nil);
               end;
               end;
         except
            on E: Exception do
               begin
               Result:=nil;
               if (not DoQueryError(E,TempAction)) then
                  begin
                  if (Database <> nil) and Database.InTransaction and
                     TransactionStarted then
                     Database.Rollback;                     
                  raise;
                  end
               else if (TempAction=aaAbort) then
                  begin
                  if (Database <> nil) and Database.InTransaction and
                     TransactionStarted then
                     Database.Rollback;
                  Abort;
                  end
               else if (TempAction=aaRetry) then
                  begin
                  FSQLTextPos:=FSaveSQLTextPos;
                  FSQLTextLine:=FSaveSQLTextLine;
                  FSQLTextColumn:=FSaveSQLTextColumn;
                  FSQLLastTextLine:=FSaveSQLLastTextLine;
                  FSQLLastTextColumn:=FSaveSQLLastTextColumn;
                  end;
               end;
         end;
         DoAfterExecute;
         if (FSQLTextPos < TempLength) then
            begin
            if (FParamCheck or (csDesigning in ComponentState)) then
               ParseParams(True)
            else
               ParseParams(False);
            { If there's another valid SQL statement, then go ahead
              and unprepare the current statement }
            if (FText <> '') then
               SetPrepared(False)
            else
               Break;
            end
         else
            Break;
         end;
      { Be sure to set the read-only flag as needed on the result set }
      if (Result <> nil) then
         begin
         if Result.ReadOnly then
            FReadOnly:=Result.ReadOnly;
         end;
   finally
      { Reset the script position if executing a script }
      if IsScript then
         begin
         FSQLTextPos:=1;
         FSQLTextLine:=1;
         FSQLTextColumn:=1;
         FSQLLastTextLine:=1;
         FSQLLastTextColumn:=1;
         if (FParamCheck or (csDesigning in ComponentState)) then
            ParseParams(True)
         else
            ParseParams(False);
         end;
   end;
end;

function TDBISAMQuery.SetDBFlag(Flag: Integer; Value: Boolean): Boolean;
begin
   if Value then
      Result:=inherited SetDBFlag(Flag,Value)
   else
      begin
      if ((DBFlags-[Flag])=[]) then
         SetPrepared(False);
      Result:=inherited SetDBFlag(Flag,Value);
      end;
end;

procedure TDBISAMQuery.PrepareSQL(Value: PChar);
begin
   GetStatementHandle(Value);
end;

procedure TDBISAMQuery.GetStatementHandle(SQLText: PChar);
begin
   FStmtHandle:=TQueryStatement.Create(Database.Handle);
   try
      with FStmtHandle do
         begin
         WantLiveResult:=FRequestLive;
         MaxNumOfRows:=FMaxRowCount;
         PrepareStatement(SQLText,FSQLLastTextLine,FSQLLastTextColumn);
         end;
   except
      FStmtHandle.Free;
      FStmtHandle:=nil;
      raise;
   end;
end;

procedure TDBISAMQuery.GetDetailLinkFields(MasterFields, DetailFields: TList);

   function AddFieldToList(const FieldName: string; DataSet: TDataSet;
                           List: TList): Boolean;
   var
      Field: TField;
   begin
      Field:=DataSet.FindField(FieldName);
      if (Field <> nil) then
         List.Add(Field);
      Result:=(Field <> nil);
   end;

var
   I: Integer;
begin
   MasterFields.Clear;
   DetailFields.Clear;
   if (DataSource <> nil) and (DataSource.DataSet <> nil) then
      begin
      for I:=0 to Params.Count-1 do
         begin
         if AddFieldToList(Params[I].Name,DataSource.DataSet,MasterFields) then
            AddFieldToList(Params[I].Name,Self,DetailFields);
         end;
      end;
end;

function TDBISAMQuery.GetResultIsLive: Boolean;
begin
   if (FStmtHandle <> nil) then
      Result:=FStmtHandle.IsLiveResult
   else
      Result:=False;
end;

procedure TDBISAMQuery.SaveToTable(const NewDatabaseName: string;
                                   const NewTableName: string);
begin
   if (FStmtHandle <> nil) and (FHandle <> nil) then
      begin
      with FStmtHandle do
         begin
         SetProgressCallback(Integer(Self),@TDBISAMQuery.SaveProgress);
         SaveResultToTable(NewDatabaseName,NewTableName,Assigned(FOnSaveProgress));
         end;
      end;
end;

procedure TDBISAMQuery.ImportTable(const FileToImport: string; Delimiter: Char;
                                   ReadHeaders: Boolean=False;
                                   FieldsToImport: TStrings=nil;
                                   const DateFormat: string=ANSI_DATE_FORMAT;
                                   const TimeFormat: string=ANSI_TIME_FORMAT;
                                   DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
begin
   CheckActive;
   ImportData(FHandle,FileToImport,Delimiter,ReadHeaders,
              FieldsToImport,DateFormat,TimeFormat,DecSeparator);
end;

procedure TDBISAMQuery.ExportTable(const ExportToFile: string; Delimiter: Char;
                                   WriteHeaders: Boolean=False;
                                   FieldsToExport: TStrings=nil;
                                   const DateFormat: string=ANSI_DATE_FORMAT;
                                   const TimeFormat: string=ANSI_TIME_FORMAT;
                                   DecSeparator: Char=ANSI_DECIMAL_SEPARATOR);
begin
   CheckActive;
   ExportData(FHandle,ExportToFile,Delimiter,WriteHeaders,
              FieldsToExport,DateFormat,TimeFormat,DecSeparator);
end;

procedure TDBISAMQuery.LoadFromStream(SourceStream: TStream);
begin
   CheckActive;
   LoadDataFromStream(FHandle,SourceStream);
end;

procedure TDBISAMQuery.SaveToStream(DestStream: TStream);
begin
   CheckActive;
   SaveDataToStream(FHandle,DestStream);
end;

function TDBISAMQuery.QueryProgress(PercentDone: Word;
                                    var AbortQuery: Boolean): Boolean;
begin
   Result:=True;
   if Assigned(FOnQueryProgress) then
      FOnQueryProgress(Self,PercentDone,AbortQuery);
end;

function TDBISAMQuery.SaveProgress(PercentDone: Word): Boolean;
begin
   Result:=True;
   if Assigned(FOnSaveProgress) then
      FOnSaveProgress(Self,PercentDone);
end;

function TDBISAMQuery.GetStatementType: TSQLStatementType;
begin
   Result:=stUnknown;
   if (FStmtHandle <> nil) then
      Result:=InternalToStatementType(FStmtHandle.StatementType);
end;

function TDBISAMQuery.InternalToStatementType(Internal: Byte): TSQLStatementType;
begin
   Result:=stUnknown;
   case Internal of
      NO_STATEMENT:
         Result:=stUnknown;
      SELECT_STATEMENT:
         Result:=stSelect;
      INSERT_STATEMENT:
         Result:=stInsert;
      UPDATE_STATEMENT:
         Result:=stUpdate;
      DELETE_STATEMENT:
         Result:=stDelete;
      CREATE_TABLE_STATEMENT:
         Result:=stCreateTable;
      CREATE_INDEX_STATEMENT:
         Result:=stCreateIndex;
      ALTER_TABLE_STATEMENT:
         Result:=stAlterTable;
      EMPTY_TABLE_STATEMENT:
         Result:=stEmptyTable;
      OPTIMIZE_TABLE_STATEMENT:
         Result:=stOptimizeTable;
      EXPORT_TABLE_STATEMENT:
         Result:=stExportTable;
      IMPORT_TABLE_STATEMENT:
         Result:=stImportTable;
      VERIFY_TABLE_STATEMENT:
         Result:=stVerifyTable;
      REPAIR_TABLE_STATEMENT:
         Result:=stRepairTable;
      UPGRADE_TABLE_STATEMENT:
         Result:=stUpgradeTable;
      DROP_INDEX_STATEMENT:
         Result:=stDropIndex;
      DROP_TABLE_STATEMENT:
         Result:=stDropTable;
      RENAME_TABLE_STATEMENT:
         Result:=stRenameTable;
      START_TRANSACTION_STATEMENT:
         Result:=stStartTransaction;
      ROLLBACK_TRANSACTION_STATEMENT:
         Result:=stRollbackTransaction;
      COMMIT_TRANSACTION_STATEMENT:
         Result:=stCommitTransaction;
      BACKUP_STATEMENT:
         Result:=stBackup;
      RESTORE_STATEMENT:
         Result:=stRestore;
      end;
end;

function TDBISAMQuery.GetTableName: string;
begin
   Result:='';
   if (FStmtHandle <> nil) then
      Result:=FStmtHandle.TableName;
end;

procedure TDBISAMQuery.DoGetParams;
begin
   if (FParams.Count > 0) and Assigned(FOnGetParams) then
      FOnGetParams(Self);
end;

procedure TDBISAMQuery.DoBeforeExecute;
begin
   if Assigned(FBeforeExecute) then
      FBeforeExecute(Self);
end;

procedure TDBISAMQuery.DoAfterExecute;
begin
   if Assigned(FAfterExecute) then
      FAfterExecute(Self);
end;

function TDBISAMQuery.DoQueryError(E: Exception; var Action: TAbortAction): Boolean;
begin
   Result:=False;
   if (not (csDesigning in ComponentState)) and Assigned(FOnQueryError) then
      begin
      Result:=True;
      FOnQueryError(Self,E,Action);
      end;
end;

procedure TDBISAMQuery.SetMaxRowCount(Value: Integer);
begin
   if (Value <> FMaxRowCount) then
      begin
      FMaxRowCount:=Value;
      if (FStmtHandle <> nil) then
         FStmtHandle.MaxNumOfRows:=FMaxRowCount;
      end;
end;

function TDBISAMQuery.GetCanModify: Boolean;
begin
   Result:=(inherited GetCanModify and (not ReadOnly));
end;

procedure TDBISAMQuery.SetReadOnly(Value: Boolean);
begin
   if (Value <> FReadOnly) then
      begin
      CheckInactive;
      FReadOnly:=Value;
      end;
end;

{ IProvider Support }

function TDBISAMQuery.PSGetDefaultOrder: TIndexDef;
begin
   Result:=inherited PSGetDefaultOrder;
   if (not Assigned(Result)) then
      Result:=GetIndexForOrderBy(SQL.Text,Self);
end;

function TDBISAMQuery.PSGetParams: TParams;
begin
   FPSParams.Assign(FParams);
   Result:=FPSParams;
end;

procedure TDBISAMQuery.PSSetParams(AParams: TParams);
begin
   if (AParams.Count <> 0) then
      FParams.Assign(AParams);
   Close;
end;

function TDBISAMQuery.PSGetTableName: string;
begin
   Result:=GetTableNameFromSQL(SQL.Text);
end;

procedure TDBISAMQuery.PSExecute;
begin
   ExecSQL;
end;

procedure TDBISAMQuery.PSSetCommandText(const CommandText: string);
begin
   if (CommandText <> '') then
      SQL.Text:=CommandText;
end;

{ TDBISAMUpdateSQL }

constructor TDBISAMUpdateSQL.Create(AOwner: TComponent);
var
   UpdateKind: TUpdateKind;
begin
   inherited Create(AOwner);
   for UpdateKind:=Low(TUpdateKind) to High(TUpdateKind) do
      begin
      FSQLText[UpdateKind]:=TStringList.Create;
      TStringList(FSQLText[UpdateKind]).OnChange:=SQLChanged;
      end;
end;

destructor TDBISAMUpdateSQL.Destroy;
var
   UpdateKind: TUpdateKind;
begin
   if Assigned(FDataSet) and (FDataSet.UpdateObject=Self) then
      FDataSet.UpdateObject:=nil;
   for UpdateKind:=Low(TUpdateKind) to High(TUpdateKind) do
      FSQLText[UpdateKind].Free;
   inherited Destroy;
end;

procedure TDBISAMUpdateSQL.ExecSQL(UpdateKind: TUpdateKind);
begin
   with Query[UpdateKind] do
      begin
      Prepare;
      ExecSQL;
      if (RowsAffected <> 1) then
         DatabaseError(SUpdateFailed);
      end;
end;

function TDBISAMUpdateSQL.GetQuery(UpdateKind: TUpdateKind): TDBISAMQuery;
begin
   if not Assigned(FQueries[UpdateKind]) then
      begin
      FQueries[UpdateKind]:=TDBISAMQuery.Create(Self);
      FQueries[UpdateKind].SQL.Assign(FSQLText[UpdateKind]);
      if (FDataSet is TDBISAMDBDataSet) then
         begin
         FQueries[UpdateKind].SessionName:=TDBISAMDBDataSet(FDataSet).SessionName;
         FQueries[UpdateKind].DatabaseName:=TDBISAMDBDataSet(FDataSet).DatabaseName;
         end;
      end;
   Result:=FQueries[UpdateKind];
end;

function TDBISAMUpdateSQL.GetSQL(UpdateKind: TUpdateKind): TStrings;
begin
   Result:=FSQLText[UpdateKind];
end;

function TDBISAMUpdateSQL.GetSQLIndex(Index: Integer): TStrings;
begin
   Result:=FSQLText[TUpdateKind(Index)];
end;

function TDBISAMUpdateSQL.GetDataSet: TDBISAMDataSet;
begin
   Result:=FDataSet;
end;

procedure TDBISAMUpdateSQL.SetDataSet(ADataSet: TDBISAMDataSet);
begin
   FDataSet:=ADataSet;
end;

procedure TDBISAMUpdateSQL.SetSQL(UpdateKind: TUpdateKind; Value: TStrings);
begin
   FSQLText[UpdateKind].Assign(Value);
end;

procedure TDBISAMUpdateSQL.SetSQLIndex(Index: Integer; Value: TStrings);
begin
   SetSQL(TUpdateKind(Index), Value);
end;

procedure TDBISAMUpdateSQL.SQLChanged(Sender: TObject);
var
   UpdateKind: TUpdateKind;
begin
   for UpdateKind:=Low(TUpdateKind) to High(TUpdateKind) do
      begin
      if (Sender=FSQLText[UpdateKind]) then
         begin
         if Assigned(FQueries[UpdateKind]) then
            begin
            FQueries[UpdateKind].Params.Clear;
            FQueries[UpdateKind].SQL.Assign(FSQLText[UpdateKind]);
            end;
         Break;
         end;
      end;
end;

procedure TDBISAMUpdateSQL.SetParams(UpdateKind: TUpdateKind);
var
   I: Integer;
   Old: Boolean;
   Param: TDBISAMParam;
   PName: string;
   Field: TField;
   Value: Variant;
begin
   if not Assigned(FDataSet) then
      Exit;
   with Query[UpdateKind] do
      begin
      for I:=0 to Params.Count-1 do
         begin
         Param:=Params[I];
         PName:=Param.Name;
         Old:=(CompareText(Copy(PName,1,4),'OLD_')=0);
         if Old then
            System.Delete(PName,1,4);
         Field:=FDataSet.FindField(PName);
         if not Assigned(Field) then
            Continue;
         if Old then
            Param.AssignFieldValue(Field,Field.OldValue)
         else
            begin
            Value:=Field.NewValue;
            if VarIsEmpty(Value) then
               Value:=Field.OldValue;
            Param.AssignFieldValue(Field,Value);
            end;
         end;
      end;
end;

procedure TDBISAMUpdateSQL.Apply(UpdateKind: TUpdateKind);
begin
   SetParams(UpdateKind);
   ExecSQL(UpdateKind);
end;

{ TDBISAMParams }

constructor TDBISAMParams.Create(Owner: TComponent);
begin
   FOwner:=Owner;
   inherited Create(TDBISAMParam);
end;

procedure TDBISAMParams.Update(Item: TCollectionItem);
var
   I: Integer;
begin
   for I:=0 to Count-1 do
      Items[I].FParamRef:=nil;
   inherited Update(Item);
end;

function TDBISAMParams.GetItem(Index: Integer): TDBISAMParam;
begin
   Result:=TDBISAMParam(inherited Items[Index]);
   Result:=Result.ParamRef;
end;

procedure TDBISAMParams.SetItem(Index: Integer; Value: TDBISAMParam);
begin
   inherited SetItem(Index,TCollectionItem(Value));
end;

function TDBISAMParams.GetOwner: TPersistent;
begin
   Result:=FOwner;
end;

procedure TDBISAMParams.AssignTo(Dest: TPersistent);
begin
   if (Dest is TDBISAMParams) then
      TDBISAMParams(Dest).Assign(Self)
   else
      inherited AssignTo(Dest);
end;

procedure TDBISAMParams.AssignValues(Value: TDBISAMParams);
var
   I: Integer;
   P: TDBISAMParam;
begin
   for I:=0 to Value.Count-1 do
      begin
      P:=FindParam(Value[I].Name);
      if (P <> nil) then
         P.Assign(Value[I]);
      end;
end;

procedure TDBISAMParams.AssignValues(Value: TParams);
var
   I: Integer;
   P: TDBISAMParam;
begin
   for I:=0 to Value.Count-1 do
      begin
      P:=FindParam(Value[I].Name);
      if (P <> nil) then
         P.Assign(Value[I]);
      end;
end;

function TDBISAMParams.CreateParam(FldType: TFieldType;
                                   const ParamName: string): TDBISAMParam;
begin
   Result:=(Add as TDBISAMParam);
   Result.Name:=ParamName;
   Result.DataType:=FldType;
end;

function TDBISAMParams.IsEqual(Value: TDBISAMParams): Boolean;
var
   I: Integer;
begin
   Result:=(Count=Value.Count);
   if Result then
      begin
      for I:=0 to Count-1 do
         begin
         Result:=Items[I].IsEqual(Value.Items[I]);
         if (not Result) then
            Break;
         end;
      end;
end;

function TDBISAMParams.ParamByName(const Value: string): TDBISAMParam;
begin
   Result:=FindParam(Value);
   if (Result=nil) then
      DatabaseErrorFmt(SParameterNotFound,[Value],FOwner);
end;

function TDBISAMParams.FindParam(const Value: string): TDBISAMParam;
var
   I: Integer;
begin
   for I:=0 to Count-1 do
      begin
      Result:=TDBISAMParam(inherited Items[I]);
      if (AnsiCompareText(Result.Name,Value)=0) then
         Exit;
      end;
   Result:=nil;
end;

procedure TDBISAMParams.DefineProperties(Filer: TFiler);
begin
   inherited DefineProperties(Filer);
   Filer.DefineBinaryProperty('Data',ReadBinaryData,nil,False);
end;

procedure TDBISAMParams.ReadBinaryData(Stream: TStream);
var
   I: Integer;
   TempCount: Integer;
   TempBuffer: PChar;
   TempLength: Integer;
   TempString: string;
   NullFlag: Boolean;
begin
   Clear;
   with Stream do
      begin
      TempCount:=0;
      ReadBuffer(TempCount,SizeOf(Integer));
      for I:=0 to TempCount-1 do
         begin
         with TDBISAMParam(Add) do
            begin
            ReadBuffer(TempLength,SizeOf(Integer));
            SetLength(TempString,TempLength);
            ReadBuffer(PChar(TempString)^,TempLength);
            Name:=TempString;
            ReadBuffer(FDataType,SizeOf(TFieldType));
            if (DataType <> ftUnknown) then
               begin
               ReadBuffer(TempLength,SizeOf(Integer));
               TempBuffer:=AllocMem(TempLength);
               try
                  ReadBuffer(TempBuffer^,TempLength);
                  if (DataType in [ftBlob..ftTypedBinary]) then
                     SetBlobData(TempBuffer,TempLength)
                  else
                     SetData(TempBuffer);
               finally
                  DeAllocMem(TempBuffer);
               end;
               end;
            ReadBuffer(NullFlag,SizeOf(Boolean));
            if NullFlag then
               FData:=NULL;
            ReadBuffer(FBound,SizeOf(Boolean));
            end;
         end;
      end;
end;

function TDBISAMParams.GetParamValue(const ParamName: string): Variant;
var
   I: Integer;
   Params: TList;
begin
   if (Pos(';',ParamName) <> 0) then
      begin
      Params:=TList.Create;
      try
         GetParamList(Params,ParamName);
         Result:=VarArrayCreate([0,Params.Count-1],varVariant);
         for I:=0 to Params.Count-1 do
            Result[I]:=TDBISAMParam(Params[I]).Value;
      finally
         Params.Free;
      end;
      end
   else
      Result:=ParamByName(ParamName).Value
end;

procedure TDBISAMParams.SetParamValue(const ParamName: string;
                                        const Value: Variant);
var
   I: Integer;
   Params: TList;
begin
   if (Pos(';',ParamName) <> 0) then
      begin
      Params:=TList.Create;
      try
         GetParamList(Params,ParamName);
         for I:=0 to Params.Count-1 do
            TDBISAMParam(Params[I]).Value:=Value[I];
      finally
         Params.Free;
      end;
      end
   else
      ParamByName(ParamName).Value:=Value;
end;

procedure TDBISAMParams.GetParamList(List: TList; const ParamNames: string);
var
   Pos: Integer;
begin
   Pos:=1;
   while Pos <= Length(ParamNames) do
      List.Add(ParamByName(ExtractFieldName(ParamNames,Pos)));
end;

function TDBISAMParams.ParseSQL(const SQLText: string; var SQLPos: Integer;
                                var SQLLine: Integer; var SQLColumn: Integer;
                                var LastSQLLine: Integer; var LastSQLColumn: Integer;
                                DoCreate: Boolean): string;

var
   TempName: string;
   TempLength: Integer;
   TempStartPos: Integer;

   function CheckForLineTermAndIncrement: string;
   begin
      Result:='';      
      case SQLText[SQLPos] of
         PARSE_CR:
            begin
            Result:=Result+SQLText[SQLPos];
            Inc(SQLPos);
            if (SQLText[SQLPos]=PARSE_LF) then
               begin
               Result:=Result+SQLText[SQLPos];
               Inc(SQLPos);
               end;
            Inc(SQLLine);
            TempStartPos:=SQLPos;
            end;
         PARSE_LF:
            begin
            Result:=Result+SQLText[SQLPos];
            Inc(SQLPos);
            Inc(SQLLine);
            TempStartPos:=SQLPos;
            end;
         else
            begin
            Result:=Result+SQLText[SQLPos];
            Inc(SQLPos);
            end;
         end;
   end;

   function SkipBlanks: string;
   begin
      Result:='';
      while (SQLPos <= TempLength) and
            (not (SQLText[SQLPos] in [#33..#255])) do
         Result:=Result+CheckForLineTermAndIncrement;
   end;

   function SkipComments: string;
   begin
      Result:='';
      while True do
         begin
         Result:=Result+SkipBlanks;
         if (SQLPos <= TempLength) and
            (SQLText[SQLPos]=PARSE_MINUS) and
            ((SQLPos+1) <= TempLength) and
            (SQLText[SQLPos+1]=PARSE_MINUS) then
            begin
            Result:=Result+SQLText[SQLPos];
            Result:=Result+SQLText[SQLPos+1];
            Inc(SQLPos,2);
            while (SQLPos <= TempLength) and
                  (not (SQLText[SQLPos] in [PARSE_CR,PARSE_LF])) do
               begin
               Result:=Result+SQLText[SQLPos];
               Inc(SQLPos);
               end;
            end
         else if (SQLPos <= TempLength) and
                 (SQLText[SQLPos]=PARSE_SLASH) and
                 ((SQLPos+1) <= TempLength) and
                 (SQLText[SQLPos+1]=PARSE_ASTERISK) then
            begin
            Result:=Result+SQLText[SQLPos];
            Result:=Result+SQLText[SQLPos+1];
            Inc(SQLPos,2);
            while (SQLPos <= TempLength) and
                  ((SQLText[SQLPos] <> PARSE_ASTERISK) or
                   ((SQLText[SQLPos]=PARSE_ASTERISK) and
                   ((SQLPos+1) <= TempLength) and
                   (SQLText[SQLPos+1] <> PARSE_SLASH))) do
               CheckForLineTermAndIncrement;
            if (SQLPos <= TempLength) and
               (SQLText[SQLPos]=PARSE_ASTERISK) and
               ((SQLPos+1) <= TempLength) and
               (SQLText[SQLPos+1]=PARSE_SLASH) then
               begin
               Result:=Result+SQLText[SQLPos];
               Result:=Result+SQLText[SQLPos+1];
               Inc(SQLPos,2);
               end;
            end
         else
            Break;
         end;
   end;

   function ScanNextParam: string;
   var
      CurChar: Char;
   begin
      Result:='';
      while (SQLPos <= TempLength) do
         begin
         Result:=Result+SkipComments;
         CurChar:=SQLText[SQLPos];
         case CurChar of
            PARSE_SEMICOLON:
               begin
               Inc(SQLPos);
               Result:=Result+SkipComments;
               Break;
               end;
            PARSE_SINGLEQUOTE,PARSE_DOUBLEQUOTE:
               begin
               Result:=Result+SQLText[SQLPos];
               Inc(SQLPos);
               while (SQLPos <= TempLength) do
                  begin
                  Result:=Result+SQLText[SQLPos];
                  if (SQLText[SQLPos]=CurChar) then
                     begin
                     if (SQLPos < TempLength) then
                        begin
                        if (SQLText[SQLPos+1] <> CurChar) then
                           Break
                        else
                           begin
                           Inc(SQLPos);
                           Result:=Result+SQLText[SQLPos];
                           end;
                        end
                     else
                        Break;
                     end;
                  Inc(SQLPos);
                  end;
               end;
            PARSE_LEFTBRACKET:
               begin
               Result:=Result+SQLText[SQLPos];
               Inc(SQLPos);
               while (SQLPos <= TempLength) do
                  begin
                  Result:=Result+SQLText[SQLPos];
                  if (SQLText[SQLPos]=PARSE_RIGHTBRACKET) then
                     Break;
                  Inc(SQLPos);
                  end;
               end;
            PARSE_COLON:
               begin
               Inc(SQLPos);
               TempName:='';
               case SQLText[SQLPos] of
                  PARSE_DOUBLEQUOTE:
                     begin
                     Inc(SQLPos);
                     while (SQLPos <= TempLength) do
                        begin
                        if (SQLText[SQLPos]=PARSE_DOUBLEQUOTE) then
                           begin
                           if (SQLPos < TempLength) then
                              begin
                              if (SQLText[SQLPos+1] <> PARSE_DOUBLEQUOTE) then
                                 begin
                                 Inc(SQLPos);
                                 Break;
                                 end
                              else
                                 begin
                                 TempName:=TempName+SQLText[SQLPos];
                                 Inc(SQLPos);
                                 end;
                              end
                           else
                              begin
                              Inc(SQLPos);
                              Break;
                              end;
                           end
                        else
                           TempName:=TempName+SQLText[SQLPos];
                        Inc(SQLPos);
                        end;
                     end;
                  PARSE_LEFTBRACKET:
                     begin
                     Inc(SQLPos);
                     while (SQLPos <= TempLength) do
                        begin
                        if (SQLText[SQLPos]=PARSE_RIGHTBRACKET) then
                           begin
                           Inc(SQLPos);
                           Break;
                           end
                        else
                           TempName:=TempName+SQLText[SQLPos];
                        Inc(SQLPos);
                        end;
                     end;
                  else
                     begin
                     while (SQLPos <= TempLength) do
                        begin
                        if (IsAlphaNumeric(SQLText[SQLPos]) or
                            IsNonLeading(SQLText[SQLPos])) then
                           TempName:=TempName+SQLText[SQLPos]
                        else
                           Break;
                        Inc(SQLPos);
                        end;
                     end;
                  end;
               if DoCreate and (TempName <> '') then
                  TDBISAMParam(Add).Name:=TempName;
               Result:=Result+PARSE_PARAMETER;
               Continue;
               end;
            else
               Result:=Result+SQLText[SQLPos];
            end;
         Inc(SQLPos);
         end;
   end;

begin
   if DoCreate then
      Clear;
   TempLength:=Length(SQLText);
   TempStartPos:=SQLPos;
   LastSQLLine:=SQLLine;
   LastSQLColumn:=SQLColumn;
   Result:=ScanNextParam;
   SQLColumn:=((SQLPos-TempStartPos)+1);
end;

function TDBISAMParams.GetNativeBuffer(out ParamDefinitions: array of pFieldDefinition;
                                       out RecordBuffer: PChar;
                                       out BlobCount: Word;
                                       out BlobBuffers: array of PChar): Word;
var
   I: Integer;
   TempParam: TDBISAMParam;
   TempRecordSize: Word;
   TempOffset: Word;
begin
   Result:=Count;
   RecordBuffer:=nil;
   BlobCount:=0;
   if (Result > 0) then
      begin
      TempRecordSize:=0;
      for I:=0 to (Result-1) do
         Inc(TempRecordSize,(FLDCHG_DATA+TDBISAMParam(Items[I]).GetNativeDataSize));
      RecordBuffer:=AllocMem(TempRecordSize);
      TempOffset:=0;
      for I:=0 to (Result-1) do
         begin
         TempParam:=Items[I];
         ParamDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
         with ParamDefinitions[I]^ do
            begin
            FieldNum:=(I+1);
            FieldName:=TempParam.Name;
            DataType:=TempParam.GetNativeDataType;
            SubType:=TempParam.GetNativeSubType;
            if (DataType=TYPE_UNKNOWN) then
               DatabaseErrorFmt(SNoParameterType,[TempParam.Name]);
            DataSize:=TempParam.GetNativeDataSize;
            if (DataType=TYPE_BCD) then
               DataDecimals:=MAX_NUM_DECIMALS;
            Offset:=TempOffset;
            TempParam.GetNativeData((RecordBuffer+Offset+FLDCHG_DATA));
            if (DataType=TYPE_BLOB) then
               begin
               BlobBuffers[BlobCount]:=pBlobParam((RecordBuffer+FLDCHG_DATA+Offset))^.BlobBuffer;
               Inc(BlobCount);
               end;
            if (not TempParam.IsNull) then
               begin
               if (DataType=TYPE_ZSTRING) then
                  begin
                  if (SubType <> SUBTYPE_FIXED) then
                     RightTrimString((RecordBuffer+Offset+FLDCHG_DATA),#32);
                  if (StrLen(RecordBuffer+Offset+FLDCHG_DATA) > 0) then
                     Boolean((RecordBuffer+Offset)^):=True;
                  end
               else
                  Boolean((RecordBuffer+Offset)^):=True;
               end;
            Inc(TempOffset,(FLDCHG_DATA+DataSize));
            end;
         end;
      end;
end;

procedure TDBISAMParams.PutNativeBuffer(NumberOfParams: Word;
                                        const ParamDefinitions: array of pFieldDefinition;
                                        RecordBuffer: PChar);
var
   I: Integer;
   TempParam: TDBISAMParam;
begin
   Clear;
   if (NumberOfParams > 0) then
      begin
      for I:=0 to NumberOfParams-1 do
         begin
         with ParamDefinitions[I]^ do
            begin
            TempParam:=TDBISAMParam(Add);
            TempParam.Name:=FieldName;
            TempParam.SetNativeDataType(DataType,SubType);
            if (not Boolean((RecordBuffer+Offset)^)) then
               TempParam.Clear
            else
               TempParam.PutNativeData((RecordBuffer+Offset+FLDCHG_DATA));
            end;
         end;
      end;
end;

{ TDBISAMParam }

constructor TDBISAMParam.Create(Collection: TCollection);
begin
   inherited Create(Collection);
   DataType:=ftUnknown;
   FData:=Unassigned;
   FBound:=False;
   FNull:=True;
end;

constructor TDBISAMParam.Create(AParams: TDBISAMParams);
begin
   Create(AParams);
end;

function TDBISAMParam.IsEqual(Value: TDBISAMParam): Boolean;
begin
   Result:=(VarType(FData)=VarType(Value.FData)) and
           (VarIsEmpty(FData) or (FData=Value.FData)) and
           (Name=Value.Name) and (DataType=Value.DataType) and
           (IsNull=Value.IsNull) and(Bound=Value.Bound);
end;

function TDBISAMParam.IsParamStored: Boolean;
begin
   Result:=Bound;
end;

function TDBISAMParam.ParamRef: TDBISAMParam;
begin
   if (not Assigned(FParamRef)) then
      begin
      if Assigned(Collection) and (Name <> '') then
         FParamRef:=TDBISAMParams(Collection).ParamByName(Name)
      else
         FParamRef:=Self;
      end;
   Result:=FParamRef;
end;

function TDBISAMParam.GetIsNull: Boolean;
begin
   Result:=(FNull or VarIsNull(FData) or VarIsEmpty(FData));
end;

function TDBISAMParam.GetDataType: TFieldType;
begin
   Result:=ParamRef.FDataType;
end;

procedure TDBISAMParam.SetDataType(Value: TFieldType);
const
   VarTypeMap: array[TFieldType] of Integer=(varError,varOleStr,varSmallint,
            varInteger,varSmallint,varBoolean,varDouble,varCurrency,varCurrency,
            varDate,varDate,varDate,varOleStr,varOleStr,varInteger,varOleStr,
            varOleStr,varOleStr,varOleStr,varOleStr,varOleStr,varOleStr,varError,
            varOleStr,varOleStr,varError,varError,varError,varError,varError,
            varOleStr,varOleStr,varVariant,varUnknown,varDispatch,varOleStr,varOleStr,
            varOleStr);
var
   vType: Integer;
begin
   ParamRef.FDataType:=Value;
   if Assigned(TDBISAMParams(Collection).FOwner) and
      (csDesigning in TDBISAMParams(Collection).FOwner.ComponentState) and
      (not ParamRef.IsNull) then
      begin
      vType:=VarTypeMap[Value];
      if (vType <> varError) then
         begin
         try
            VarCast(ParamRef.FData,ParamRef.FData,vType);
         except
            ParamRef.Clear;
         end;
         end
      else
         ParamRef.Clear;
      end
   else
      ParamRef.Clear;
end;

function TDBISAMParam.GetDataSize: Integer;
begin
   Result:=0;
   case DataType of
      ftUnknown:
         DatabaseErrorFmt(SUnknownFieldType,[Name],TDBISAMParams(Collection).FOwner);
      ftString,ftFixedChar,ftWideString,ftGUID,ftMemo:
         Result:=(Length(VarToStr(FData))+1);
      ftBoolean:
         Result:=SizeOf(WordBool);
      ftBCD:
         Result:=SizeOf(TBCD);
      ftDateTime,ftCurrency,ftFloat:
         Result:=SizeOf(Double);
      ftTime,ftDate,ftAutoInc,ftInteger:
         Result:=SizeOf(Integer);
      ftLargeInt:
         Result:=SizeOf(Int64);
      ftSmallint:
         Result:=SizeOf(SmallInt);
      ftWord:
         Result:=SizeOf(Word);
      ftBytes,ftVarBytes:
         begin
         if VarIsArray(FData) then
            Result:=(VarArrayHighBound(FData,1)+1)
         else
            Result:=0;
         end;
      ftBlob,ftGraphic..ftTypedBinary:
         Result:=Length(VarToStr(FData));
      else
         DatabaseErrorFmt(SBadFieldType,[Name],TDBISAMParams(Collection).FOwner);
      end;
end;

procedure TDBISAMParam.GetData(Buffer: Pointer);
var
   P: Pointer;
begin
   case DataType of
      ftUnknown:
         DatabaseErrorFmt(SUnknownFieldType,[Name],TDBISAMParams(Collection).FOwner);
      ftString,ftFixedChar,ftWideString,ftGUID,ftMemo:
         StrMove(Buffer,PChar(GetAsString),Length(GetAsString)+1);
      ftSmallint:
         SmallInt(Buffer^):=GetAsInteger;
      ftWord:
         Word(Buffer^):=GetAsInteger;
      ftAutoInc,ftInteger:
         Integer(Buffer^):=GetAsInteger;
      ftLargeInt:
         Int64(Buffer^):=GetAsLargeInt;
      ftTime:
         Integer(Buffer^):=DateTimeToTimeStamp(AsDateTime).Time;
      ftDate:
         Integer(Buffer^):=DateTimeToTimeStamp(AsDateTime).Date;
      ftDateTime:
         Double(Buffer^):=TimeStampToMSecs(DateTimeToTimeStamp(AsDateTime));
      ftBCD:
         CurrToBCD(AsBCD,TBCD(Buffer^));
      ftCurrency,ftFloat:
         Double(Buffer^):=GetAsFloat;
      ftBoolean:
         WordBool(Buffer^):=VerifyWordBool(GetAsBoolean);
      ftBytes,ftVarBytes:
         begin
         if VarIsArray(FData) then
            begin
            P:=VarArrayLock(FData);
            try
               Move(P^,Buffer^,VarArrayHighBound(FData,1)+1);
            finally
               VarArrayUnlock(FData);
            end;
            end;
         end;
      ftBlob,ftGraphic..ftTypedBinary:
         Move(PChar(GetAsString)^,Buffer^,Length(GetAsString));
      else
         DatabaseErrorFmt(SBadFieldType,[Name],TDBISAMParams(Collection).FOwner);
      end;
end;

procedure TDBISAMParam.SetBlobData(Buffer: Pointer; Size: Integer);
var
   DataStr: string;
begin
   SetLength(DataStr,Size);
   Move(Buffer^,PChar(DataStr)^,Size);
   AsBlob:=DataStr;
end;

procedure TDBISAMParam.SetData(Buffer: Pointer);
var
   Value: Currency;
   TimeStamp: TTimeStamp;
begin
   case DataType of
      ftUnknown:
         DatabaseErrorFmt(SUnknownFieldType,[Name],TDBISAMParams(Collection).FOwner);
      ftString,ftFixedChar,ftWideString,ftGUID:
         AsString:=StrPas(Buffer);
      ftWord:
         AsWord:=Word(Buffer^);
      ftSmallint:
         AsSmallInt:=Smallint(Buffer^);
      ftInteger,ftAutoInc:
         AsInteger:=Integer(Buffer^);
      ftLargeInt:
         AsLargeInt:=Int64(Buffer^);
      ftTime:
         begin
         TimeStamp.Time:=Integer(Buffer^);
         TimeStamp.Date:=DateDelta;
         AsTime:=TimeStampToDateTime(TimeStamp);
         end;
      ftDate:
         begin
         TimeStamp.Time:=0;
         TimeStamp.Date:=Integer(Buffer^);
         AsDate:=TimeStampToDateTime(TimeStamp);
         end;
      ftDateTime:
         begin
         TimeStamp.Time:=0;
         TimeStamp.Date:=Integer(Buffer^);
         AsDateTime:=TimeStampToDateTime(MSecsToTimeStamp(Double(Buffer^)));
         end;
      ftBCD:
         begin
         if BCDToCurr(TBcd(Buffer^),Value) then
            AsBCD:=Value
         else
            AsBCD:=0;
         end;
      ftCurrency:
         AsCurrency:=Double(Buffer^);
      ftFloat:
         AsFloat:=Double(Buffer^);
      ftBoolean:
         AsBoolean:=WordBool(Buffer^);
      ftMemo:
         AsMemo:=StrPas(Buffer);
      else
         DatabaseErrorFmt(SBadFieldType,[Name],TDBISAMParams(Collection).FOwner);
      end;
end;

procedure TDBISAMParam.SetText(const Value: string);
begin
   Self.Value:=Value;
end;

procedure TDBISAMParam.Assign(Source: TPersistent);

   procedure LoadFromStreamPersist(const StreamPersist: IStreamPersist);
   var
      TempStream: TMemoryStream;
   begin
      TempStream:=TMemoryStream.Create;
      try
         StreamPersist.SaveToStream(TempStream);
         LoadFromStream(TempStream,ftGraphic);
      finally
         TempStream.Free;
      end;
   end;

   procedure LoadFromStrings(Source: TSTrings);
   begin
      AsMemo:=Source.Text;
   end;

   procedure LoadFromTable(Source: TDBISAMTable);
   var
      TempStream: TMemoryStream;
   begin
      TempStream:=TMemoryStream.Create;
      try
         Source.SaveToStream(TempStream);
         LoadFromStream(TempStream,ftBlob);
      finally
         TempStream.Free;
      end;
   end;

   procedure LoadFromQuery(Source: TDBISAMQuery);
   var
      TempStream: TMemoryStream;
   begin
      TempStream:=TMemoryStream.Create;
      try
         Source.SaveToStream(TempStream);
         LoadFromStream(TempStream,ftBlob);
      finally
         TempStream.Free;
      end;
   end;

var
   StreamPersist: IStreamPersist;
begin
   if (Source is TDBISAMParam) then
      AssignDBISAMParam(TDBISAMParam(Source))
   else if (Source is TParam) then
      AssignParam(TParam(Source))
   else if (Source is TField) then
      AssignField(TField(Source))
   else if (Source is TStrings) then
      LoadFromStrings(TStrings(Source))
   else if (Source is TDBISAMTable) then
      LoadFromTable(TDBISAMTable(Source))
   else if (Source is TDBISAMQuery) then
      LoadFromQuery(TDBISAMQuery(Source))
   else if Supports(Source,IStreamPersist,StreamPersist) then
      LoadFromStreamPersist(StreamPersist)
   else
      inherited Assign(Source);
end;

procedure TDBISAMParam.AssignTo(Dest: TPersistent);

   procedure SaveToTable(Dest: TDBISAMTable);
   var
      TempStream: TMemoryStream;
   begin
      TempStream:=TMemoryStream.Create;
      try
         SaveToStream(TempStream);
         Dest.LoadFromStream(TempStream);
      finally
         TempStream.Free;
      end;
   end;

   procedure SaveToQuery(Dest: TDBISAMQuery);
   var
      TempStream: TMemoryStream;
   begin
      TempStream:=TMemoryStream.Create;
      try
         SaveToStream(TempStream);
         Dest.LoadFromStream(TempStream);
      finally
         TempStream.Free;
      end;
   end;

var
   TempParam: TParam;
begin
   if (Dest is TField) then
      TField(Dest).Value:=FData
   else if (Dest is TParam) then
      begin
      TempParam:=TParam(Dest);
      if (TempParam.Collection <> nil) then
         TempParam.Collection.BeginUpdate;
      try
         TempParam.DataType:=DataType;
         if IsNull then
            TempParam.Clear
         else
            TempParam.Value:=Value;
         TempParam.Bound:=Bound;
         TempParam.Name:=Name;
      finally
         if (TempParam.Collection <> nil) then
            TempParam.Collection.EndUpdate;
      end;
      end
   else if (Dest is TDBISAMTable) then
      SaveToTable(TDBISAMTable(Dest))
   else if (Dest is TDBISAMQuery) then
      SaveToQuery(TDBISAMQuery(Dest))
   else
      inherited AssignTo(Dest);
end;

procedure TDBISAMParam.AssignDBISAMParam(Param: TDBISAMParam);
begin
   if (Param <> nil) then
      begin
      FDataType:=Param.DataType;
      if Param.IsNull then
         Clear
      else
         Value:=Param.FData;
      FBound:=Param.Bound;
      Name:=Param.Name;
      end;
end;

procedure TDBISAMParam.AssignParam(Param: TParam);
begin
   if (Param <> nil) then
      begin
      FDataType:=Param.DataType;
      if Param.IsNull then
         Clear
      else
         Value:=Param.Value;
      FBound:=Param.Bound;
      Name:=Param.Name;
      end;
end;

procedure TDBISAMParam.AssignFieldValue(Field: TField; const Value: Variant);
begin
   if (Field <> nil) then
      begin
      if (Field.DataType=ftString) and TStringField(Field).FixedChar then
         DataType:=ftFixedChar
      else if (Field.DataType=ftMemo) and (Field.Size > MAX_FIELD_SIZE) then
         DataType:=ftString
      else
         DataType:=Field.DataType;
      if VarIsNull(Value) then
         Clear
      else
         Self.Value:=Value;
      FBound:=True;
      end;
end;

procedure TDBISAMParam.AssignField(Field: TField);
begin
   if (Field <> nil) then
      begin
      AssignFieldValue(Field,Field.Value);
      Name:=Field.FieldName;
      end;
end;

procedure TDBISAMParam.Clear;
begin
   FNull:=True;
   FData:=Unassigned;
end;

function TDBISAMParam.GetDisplayName: string;
begin
   if (FName='') then
      Result:=inherited GetDisplayName
   else
      Result:=FName;
end;

procedure TDBISAMParam.SetAsBoolean(Value: Boolean);
begin
   FDataType:=ftBoolean;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsBoolean: Boolean;
begin
   if IsNull then
      Result:=False
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsFloat(const Value: Double);
begin
   FDataType:=ftFloat;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsFloat: Double;
begin
   if IsNull then
      Result:=0
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsCurrency(const Value: Currency);
begin
   FDataType:=ftCurrency;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsCurrency: Currency;
begin
   if IsNull then
      Result:=0
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsBCD(const Value: Currency);
begin
   FDataType:=ftBCD;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsBCD: Currency;
begin
   if IsNull then
      Result:=0
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsInteger(Value: Integer);
begin
   FDataType:=ftInteger;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsInteger: Integer;
begin
   if IsNull then
      Result:=0
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsLargeInt(Value: Int64);
begin
   FDataType:=ftLargeInt;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsLargeInt: Int64;
begin
   if IsNull then
      Result:=0
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsWord(Value: Integer);
begin
   FDataType:=ftWord;
   Self.Value:=Value;
end;

procedure TDBISAMParam.SetAsSmallInt(Value: Integer);
begin
   FDataType:=ftSmallint;
   Self.Value:=Value;
end;

procedure TDBISAMParam.SetAsString(const Value: string);
begin
   FDataType:=ftString;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsString: string;
begin
   if IsNull then
      Result:=''
   else if (DataType=ftBoolean) then
      begin
      if FData then
         Result:=STextTrue
      else
         Result:=STextFalse;
      end
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsDate(const Value: TDateTime);
begin
   FDataType:=ftDate;
   Self.Value:=Value;
end;

procedure TDBISAMParam.SetAsTime(const Value: TDateTime);
begin
   FDataType:=ftTime;
   Self.Value:=Value
end;

procedure TDBISAMParam.SetAsDateTime(const Value: TDateTime);
begin
   FDataType:=ftDateTime;
   Self.Value:=Value
end;

function TDBISAMParam.GetAsDateTime: TDateTime;
begin
   if IsNull then
      Result:=0
   else
      Result:=VarToDateTime(FData);
end;

procedure TDBISAMParam.SetAsVariant(const Value: Variant);
begin
   if (ParamRef=Self) then
      begin
      FBound:=(not VarIsEmpty(Value));
      FNull:=(VarIsEmpty(Value) or VarIsNull(Value));
      if (FDataType=ftUnknown) then
         begin
         case VarType(Value) of
            varSmallint,varByte:
               FDataType:=ftSmallInt;
            varInteger:
               FDataType:=ftInteger;
            varInt64:
               FDataType:=ftLargeInt;
            varWord:
               FDataType:=ftWord;
            varLongWord:
               FDataType:=ftInteger;
            varCurrency:
               FDataType:=ftBCD;
            varSingle,varDouble:
               FDataType:=ftFloat;
            varDate:
               FDataType:=ftDateTime;
            varBoolean:
               FDataType:=ftBoolean;
            varString,varOleStr:
               FDataType:=ftString;
            else
               FDataType:=ftUnknown;
            end;
         end;
      FData:=Value;
      end
   else
      ParamRef.SetAsVariant(Value);
end;

function TDBISAMParam.GetAsVariant: Variant;
begin
   Result:=ParamRef.FData;
end;

procedure TDBISAMParam.SetAsMemo(const Value: string);
begin
   FDataType:=ftMemo;
   Self.Value:=Value;
end;

function TDBISAMParam.GetAsMemo: string;
begin
   if IsNull then
      Result:=''
   else
      Result:=FData;
end;

procedure TDBISAMParam.SetAsBlob(const Value: TBlobData);
begin
   FDataType:=ftBlob;
   Self.Value:=Value;
end;

procedure TDBISAMParam.LoadFromFile(const FileName: string; BlobType: TBlobType);
var
   Stream: TStream;
begin
   Stream:=TFileStream.Create(FileName,fmOpenRead);
   try
      LoadFromStream(Stream,BlobType);
   finally
      Stream.Free;
   end;
end;

procedure TDBISAMParam.SaveToFile(const FileName: string);
var
   Stream: TStream;
begin
   Stream:=TFileStream.Create(FileName,fmCreate);
   try
      SaveToStream(Stream);
   finally
      Stream.Free;
   end;
end;

procedure TDBISAMParam.LoadFromStream(Stream: TStream; BlobType: TBlobType);
var
   DataStr: string;
   Len: Integer;
begin
   with Stream do
      begin
      FDataType:=BlobType;
      Position:=0;
      Len:=Size;
      SetLength(DataStr,Len);
      ReadBuffer(Pointer(DataStr)^,Len);
      Self.Value:=DataStr;
      end;
end;

procedure TDBISAMParam.SaveToStream(Stream: TStream);
var
   DataStr: string;
   Len: Integer;
begin
   with Stream do
      begin
      Position:=0;
      DataStr:=Self.GetAsString;
      Len:=Length(DataStr);
      WriteBuffer(Pointer(DataStr)^,Len);
      end;
end;

function TDBISAMParam.GetNativeDataType: Byte;
begin
   if ((DataType in [ftString,ftFixedChar,ftWideString]) and
       (Length(VarToStr(Value)) > MAX_FIELD_SIZE)) or
       (DataType in [ftBlob..ftTypedBinary]) then
      Result:=TYPE_BLOB
   else
      Result:=FldTypeMap[DataType];
end;

function TDBISAMParam.GetNativeSubType: Byte;
begin
   if ((DataType in [ftString,ftFixedChar,ftWideString]) and
       (Length(VarToStr(Value)) > MAX_FIELD_SIZE)) then
      Result:=SUBTYPE_MEMO
   else
      Result:=FldSubTypeMap[DataType];
end;

procedure TDBISAMParam.SetNativeDataType(DataType: Byte; SubType: Byte);
begin
   FDataType:=DataTypeMap[DataType];
   case DataType of
      TYPE_ZSTRING:
         begin
         case SubType of
            SUBTYPE_FIXED:
               FDataType:=ftFixedChar;
            SUBTYPE_UNICODE:
               FDataType:=ftWideString;
            SUBTYPE_GUID:
               FDataType:=ftGUID;
            end;
         end;
      TYPE_INT32:
         begin
         if (SubType=SUBTYPE_AUTOINC) then
            FDataType:=ftAutoInc;
         end;
      TYPE_FLOAT:
         begin
         if (SubType=SUBTYPE_MONEY) then
            FDataType:=ftCurrency;
         end;
      TYPE_BLOB:
         begin
         if (SubType >= SUBTYPE_MEMO) and
            (SubType <= SUBTYPE_BFILE) then
            FDataType:=BlobTypeMap[SubType];
         end;
      end;
end;

function TDBISAMParam.GetNativeDataSize: Integer;
begin
   if ((DataType in [ftString,ftFixedChar,ftWideString]) and
       (Length(VarToStr(Value)) > MAX_FIELD_SIZE)) or
       (DataType in [ftBlob..ftTypedBinary]) then
      Result:=SizeOf(TBlobParam)
   else
      Result:=GetDataSize;
end;

procedure TDBISAMParam.GetNativeData(Buffer: Pointer);
begin
   if (DataType in [ftBlob..ftTypedBinary]) or
      ((DataType in [ftString,ftFixedChar,ftWideString]) and
       (Length(VarToStr(Value)) > MAX_FIELD_SIZE)) then
      begin
      with TBlobParam(Buffer^) do
         begin
         BlobLength:=Length(VarToStr(Value));
         BlobBuffer:=AllocMem(BlobLength);
         Move(PChar(VarToStr(Value))^,BlobBuffer^,BlobLength);
         end;
      end
   else
      GetData(Buffer);
end;

procedure TDBISAMParam.PutNativeData(Buffer: Pointer);
begin
   if (DataType in [ftBlob..ftTypedBinary]) then
      begin
      with TBlobParam(Buffer^) do
         SetBlobData(BlobBuffer,BlobLength);
      end
   else
      SetData(Buffer);
end;

{ TDBISAMFunctions }

constructor TDBISAMFunctions.Create(Owner: TComponent);
begin
   FOwner:=Owner;
   inherited Create(TDBISAMFunction);
end;

procedure TDBISAMFunctions.Update(Item: TCollectionItem);
var
   I: Integer;
begin
   for I:=0 to Count-1 do
      Items[I].FFunctionRef:=nil;
   inherited Update(Item);
end;

function TDBISAMFunctions.GetItem(Index: Integer): TDBISAMFunction;
begin
   Result:=TDBISAMFunction(inherited Items[Index]);
   Result:=Result.FunctionRef;
end;

procedure TDBISAMFunctions.SetItem(Index: Integer; Value: TDBISAMFunction);
begin
   inherited SetItem(Index,TCollectionItem(Value));
end;

function TDBISAMFunctions.GetOwner: TPersistent;
begin
   Result:=FOwner;
end;

procedure TDBISAMFunctions.Assign(Source: TPersistent);
begin
   Engine.CheckInactive;
   inherited Assign(Source);
end;

procedure TDBISAMFunctions.AssignTo(Dest: TPersistent);
begin
   if (Dest is TDBISAMFunctions) then
      TDBISAMFunctions(Dest).Assign(Self)
   else
      inherited AssignTo(Dest);
end;

function TDBISAMFunctions.CreateFunction(ResultType: TFieldType;
                                         const FunctionName: string): TDBISAMFunction;
begin
   Engine.CheckInactive;
   Result:=(Add as TDBISAMFunction);
   Result.Name:=FunctionName;
   Result.ResultType:=ResultType;
end;

function TDBISAMFunctions.IsEqual(Value: TDBISAMFunctions): Boolean;
var
   I: Integer;
begin
   Result:=(Count=Value.Count);
   if Result then
      begin
      for I:=0 to Count-1 do
         begin
         Result:=Items[I].IsEqual(Value.Items[I]);
         if (not Result) then
            Break;
         end;
      end;
end;

function TDBISAMFunctions.FunctionByName(const Value: string): TDBISAMFunction;
begin
   Result:=FindFunction(Value);
   if (Result=nil) then
      DatabaseErrorFmt(SFunctionNotFound,[Value],FOwner);
end;

function TDBISAMFunctions.FindFunction(const Value: string): TDBISAMFunction;
var
   I: Integer;
begin
   for I:=0 to Count-1 do
      begin
      Result:=TDBISAMFunction(inherited Items[I]);
      if (AnsiCompareText(Result.Name,Value)=0) then
         Exit;
      end;
   Result:=nil;
end;

function TDBISAMFunctions.GetNativeBuffer(out FunctionDefinitions: array of pFunctionDefinition): Word;
var
   I: Integer;
   J: Integer;
   TempFunction: TDBISAMFunction;
   TempFunctionParam: TDBISAMFunctionParam;
begin
   Result:=Count;
   if (Result > 0) then
      begin
      for I:=0 to (Result-1) do
         begin
         TempFunction:=Items[I];
         FunctionDefinitions[I]:=AllocMem(SizeOf(TFunctionDefinition));
         with FunctionDefinitions[I]^ do
            begin
            FunctionName:=TempFunction.Name;
            ResultType:=TempFunction.GetNativeResultType;
            ResultSubType:=TempFunction.GetNativeResultSubType;
            if (ResultType=TYPE_UNKNOWN) then
               DatabaseErrorFmt(SNoFunctionResultType,[TempFunction.Name]);
            ParamCount:=TempFunction.Params.Count;
            FillChar(ParamDefinitions,SizeOf(ParamDefinitions),#0);
            for J:=1 to ParamCount do
               begin
               TempFunctionParam:=TempFunction.Params.Items[J-1];
               with ParamDefinitions[J] do
                  begin
                  DataType:=TempFunctionParam.GetNativeDataType;
                  SubType:=TempFunctionParam.GetNativeSubType;
                  if (DataType=TYPE_UNKNOWN) then
                     DatabaseErrorFmt(SNoFunctionParamDataType,[TempFunction.Name]);
                  end;
               end;
            end;
         end;
      end;
end;

{ TDBISAMFunction }

constructor TDBISAMFunction.Create(Collection: TCollection);
begin
   inherited Create(Collection);
   ResultType:=ftUnknown;
   FFunctionParams:=TDBISAMFunctionParams.Create(Self);
end;

constructor TDBISAMFunction.Create(AFunctions: TDBISAMFunctions);
begin
   Create(AFunctions);
end;

destructor TDBISAMFunction.Destroy;
begin
   FFunctionParams.Free;
   inherited;
end;

function TDBISAMFunction.IsEqual(Value: TDBISAMFunction): Boolean;
begin
   Result:=(Name=Value.Name) and (ResultType=Value.ResultType);
end;

function TDBISAMFunction.FunctionRef: TDBISAMFunction;
begin
   if (not Assigned(FFunctionRef)) then
      begin
      if Assigned(Collection) and (Name <> '') then
         FFunctionRef:=TDBISAMFunctions(Collection).FunctionByName(Name)
      else
         FFunctionRef:=Self;
      end;
   Result:=FFunctionRef;
end;

function TDBISAMFunction.GetResultType: TFieldType;
begin
   Result:=FunctionRef.FResultType;
end;

procedure TDBISAMFunction.SetResultType(Value: TFieldType);
begin
   if (Value <> FunctionRef.FResultType) then
      begin
      Engine.CheckInactive;
      FunctionRef.FResultType:=Value;
      end;
end;

procedure TDBISAMFunction.SetName(const Value: string);
begin
   if (Value <> FunctionRef.FName) then
      begin
      Engine.CheckInactive;
      FunctionRef.FName:=Value;
      end;
end;

procedure TDBISAMFunction.SetFunctionParamsList(Value: TDBISAMFunctionParams);
begin
   Engine.CheckInactive;
   FFunctionParams.Assign(Value);
end;

procedure TDBISAMFunction.Assign(Source: TPersistent);
begin
   Engine.CheckInactive;
   if (Source is TDBISAMFunction) then
      AssignDBISAMFunction(TDBISAMFunction(Source))
   else
      inherited Assign(Source);
end;

procedure TDBISAMFunction.AssignDBISAMFunction(DBISAMFunction: TDBISAMFunction);
begin
   if (DBISAMFunction <> nil) then
      begin
      FResultType:=DBISAMFunction.ResultType;
      Name:=DBISAMFunction.Name;
      FFunctionParams.Assign(DBISAMFunction.Params);
      end;
end;

function TDBISAMFunction.GetDisplayName: string;
begin
   if (FName='') then
      Result:=inherited GetDisplayName
   else
      Result:=FName;
end;

function TDBISAMFunction.GetNativeResultType: Byte;
begin
   if (ResultType in [ftBlob..ftTypedBinary]) then
      Result:=TYPE_BLOB
   else
      Result:=FldTypeMap[ResultType];
end;

function TDBISAMFunction.GetNativeResultSubType: Byte;
begin
   Result:=FldSubTypeMap[ResultType];
end;

{ TDBISAMFunctionParams }

constructor TDBISAMFunctionParams.Create(Owner: TPersistent);
begin
   FOwner:=Owner;
   inherited Create(TDBISAMFunctionParam);
end;

procedure TDBISAMFunctionParams.Update(Item: TCollectionItem);
begin
   inherited Update(Item);
end;

function TDBISAMFunctionParams.GetItem(Index: Integer): TDBISAMFunctionParam;
begin
   Result:=TDBISAMFunctionParam(inherited Items[Index]);
end;

procedure TDBISAMFunctionParams.SetItem(Index: Integer; Value: TDBISAMFunctionParam);
begin
   inherited SetItem(Index,TCollectionItem(Value));
end;

function TDBISAMFunctionParams.GetOwner: TPersistent;
begin
   Result:=FOwner;
end;

procedure TDBISAMFunctionParams.Assign(Source: TPersistent);
begin
   Engine.CheckInactive;
   inherited Assign(Source);
end;

procedure TDBISAMFunctionParams.AssignTo(Dest: TPersistent);
begin
   if (Dest is TDBISAMFunctionParams) then
      TDBISAMFunctionParams(Dest).Assign(Self)
   else
      inherited AssignTo(Dest);
end;

function TDBISAMFunctionParams.CreateFunctionParam(DataType: TFieldType): TDBISAMFunctionParam;
begin
   Engine.CheckInactive;
   Result:=(Add as TDBISAMFunctionParam);
   Result.DataType:=DataType;
end;

function TDBISAMFunctionParams.IsEqual(Value: TDBISAMFunctionParams): Boolean;
var
   I: Integer;
begin
   Result:=(Count=Value.Count);
   if Result then
      begin
      for I:=0 to Count-1 do
         begin
         Result:=Items[I].IsEqual(Value.Items[I]);
         if (not Result) then
            Break;
         end;
      end;
end;

{ TDBISAMFunctionParam }

constructor TDBISAMFunctionParam.Create(Collection: TCollection);
begin
   inherited Create(Collection);
   DataType:=ftUnknown;
end;

constructor TDBISAMFunctionParam.Create(AFunctionParams: TDBISAMFunctionParams);
begin
   Create(AFunctionParams);
end;

function TDBISAMFunctionParam.IsEqual(Value: TDBISAMFunctionParam): Boolean;
begin
   Result:=(DataType=Value.DataType);
end;

function TDBISAMFunctionParam.GetDataType: TFieldType;
begin
   Result:=FDataType;
end;

procedure TDBISAMFunctionParam.SetDataType(Value: TFieldType);
begin
   if (Value <> FDataType) then
      begin
      Engine.CheckInactive;
      FDataType:=Value;
      end;
end;

procedure TDBISAMFunctionParam.Assign(Source: TPersistent);
begin
   Engine.CheckInactive;
   if (Source is TDBISAMFunctionParam) then
      AssignDBISAMFunctionParam(TDBISAMFunctionParam(Source))
   else
      inherited Assign(Source);
end;

procedure TDBISAMFunctionParam.AssignDBISAMFunctionParam(DBISAMFunctionParam: TDBISAMFunctionParam);
begin
   if (DBISAMFunctionParam <> nil) then
      FDataType:=DBISAMFunctionParam.DataType;
end;

function TDBISAMFunctionParam.GetDisplayName: string;
begin
   Result:=inherited GetDisplayName
end;

function TDBISAMFunctionParam.GetNativeDataType: Byte;
begin
   if (DataType in [ftBlob..ftTypedBinary]) then
      Result:=TYPE_BLOB
   else
      Result:=FldTypeMap[DataType];
end;

function TDBISAMFunctionParam.GetNativeSubType: Byte;
begin
   Result:=FldSubTypeMap[DataType];
end;

{ TDBISAMBlobStream }

constructor TDBISAMBlobStream.Create(Field: TBlobField; Mode: TBlobStreamMode);
var
   OpenMode: Byte;
   TempSize: Integer;
begin
   FField:=Field;
   FDataSet:=(FField.DataSet as TDBISAMBaseDataSet);
   FFieldNo:=FField.FieldNo;
   if (not FDataSet.GetActiveRecBuf(FBuffer)) then
      Exit;
   if (FDataSet.State in [dsFilter,dsOldValue]) or (not FField.Modified) then
      begin
      if (Mode <> bmRead) then
         begin
         if FField.ReadOnly then
            DatabaseErrorFmt(SFieldReadOnly,[FField.DisplayName]);
         if (FDataSet is TDBISAMDataSet) then
            begin
            if (not (FDataSet.State in dsEditModes)) then
               DatabaseError(SNotEditing);
            OpenMode:=BLOB_OPENREADWRITE;
            end
         else
            begin
            { Just open read-only, do not raise an exception }
            if (not (FDataSet.State in dsEditModes)) then
               begin
               OpenMode:=BLOB_OPENREADONLY;
               Mode:=bmRead;
               end
            else
               OpenMode:=BLOB_OPENREADWRITE;
            end;
         end
      else
         OpenMode:=BLOB_OPENREADONLY;
      if (FDataSet.Handle <> nil) then
         FDataSet.Handle.OpenBlob(FFieldNo,FBuffer,OpenMode,False,False,
                                  TempSize,False);
      end;
   FOpened:=True;
   if (Mode=bmWrite) then
      Truncate;
end;

destructor TDBISAMBlobStream.Destroy;
begin
   if FOpened then
      begin
      if FModified then
         FField.Modified:=True;
      if (FDataSet.State in [dsFilter,dsOldValue]) or (not FField.Modified) then
         begin
         if (FDataSet.Handle <> nil) then
            begin
            with FDataSet.Handle do
               FreeBlob(FFieldNo,FBuffer,False,False);
            end;
         end;
      end;
   if FModified then
      begin
      try
         FDataSet.DataEvent(deFieldChange,Integer(FField));
      except
         FDataSet.InternalHandleException;
      end;
      end;
   inherited Destroy;
end;

procedure TDBISAMBlobStream.SetSize(NewSize: Integer);
begin
   if FOpened then
      begin
      if (NewSize > GetBlobSize) then
         begin
         if (FDataSet.Handle <> nil) then
            FDataSet.Handle.PutBlob(FFieldNo,FBuffer,NewSize,nil,0,False);
         FModified:=True;
         end
      else if (NewSize < GetBlobSize) then
         begin
         if (FDataSet.Handle <> nil) then
            FDataSet.Handle.TruncateBlob(FFieldNo,FBuffer,NewSize,False);
         FModified:=True;
         end;
      end;
end;

function TDBISAMBlobStream.Read(var Buffer; Count: Integer): Integer;
begin
   Result:=0;
   if FOpened then
      begin
      if (FDataSet.Handle <> nil) then
         FDataSet.Handle.GetBlob(FFieldNo,FBuffer,FPosition,
                                 @Buffer,Count,Result,False);
      Inc(FPosition,Result);
      end;
end;

function TDBISAMBlobStream.Write(const Buffer; Count: Integer): Integer;
begin
   Result:=0;
   if FOpened then
      begin
      if (FDataSet.Handle <> nil) then
         FDataSet.Handle.PutBlob(FFieldNo,FBuffer,FPosition,@Buffer,Count,False);
      Inc(FPosition,Count);
      Result:=Count;
      FModified:=True;
      end;
end;

function TDBISAMBlobStream.Seek(Offset: Integer; Origin: Word): Integer;
begin
   case Origin of
      0:
         FPosition:=Offset;
      1:
         Inc(FPosition,Offset);
      2:
         FPosition:=(GetBlobSize+Offset);
      end;
   Result:=FPosition;
end;

procedure TDBISAMBlobStream.Truncate;
begin
   if FOpened then
      begin
      if (FDataSet.Handle <> nil) then
         FDataSet.Handle.TruncateBlob(FFieldNo,FBuffer,FPosition,False);
      FModified:=True;
      end;
end;

function TDBISAMBlobStream.GetBlobSize: Integer;
begin
   Result:=0;
   if FOpened then
      begin
      if (FDataSet.Handle <> nil) then
         FDataSet.Handle.GetBlobSize(FFieldNo,FBuffer,Result,False);
      end;
end;

initialization
   FEngine:=TDBISAMEngine.Create(nil);
   FSession:=TDBISAMSession.Create(nil);
   FSession.SessionName:='Default';
finalization
   FEngine.Free;
end.
