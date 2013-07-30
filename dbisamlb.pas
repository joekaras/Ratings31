{*************************************************************************
*
*      Common functionality and objects
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*      Please see referenced ZLIB units for copyright information on
*      Pascal ZLIB code
*
*************************************************************************}

{$I dbisamcp.inc}

unit dbisamlb;

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

Windows, DB, FMTBcd, dbisamcn;

type

   TSafeObject = class(TObject)
      private
         FSignature: string[10];
      public
         constructor Create; virtual;
         destructor Destroy; override;
         function IsObject: Boolean; virtual;
      end;

   TThreadTimer = class;

   TTimerThread = class(TThread)
      private
         FEvent: Pointer;
         FTimer: TThreadTimer;
         FInterval: LongWord;
      protected
         procedure Execute; override;
      public
         constructor Create(CreateSuspended: Boolean);
         destructor Destroy; override;
         property Timer: TThreadTimer read FTimer write FTimer;
         property Interval: LongWord read FInterval write FInterval;
         procedure Stop;
      end;

   TThreadTimer = class(TObject)
      private
         FInterval: LongWord;
         FThread: TTimerThread;
         FOnTimer: TNotifyEvent;
         FEnabled: Boolean;
         procedure UpdateTimer;
         procedure SetEnabled(Value: Boolean);
         procedure SetInterval(Value: Cardinal);
         procedure SetOnTimer(Value: TNotifyEvent);
         procedure FireTimer;
      public
         constructor Create;
         destructor Destroy; override;
         property Enabled: Boolean read FEnabled write SetEnabled default True;
         property Interval: Cardinal read FInterval write SetInterval default 1000;
         property OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
      end;

   TLocaleStringList = class(TStringList)
      private
         FLocaleID: Integer;
      public
         procedure Sort; override;
         function GetLocaleID: Integer;
         procedure SetLocaleID(Value: Integer);
         function Find(const S: AnsiString; var Index: Integer): Boolean; override;
         function FindUsingPartials(const S: AnsiString; var Index: Integer): Boolean; virtual;
         function FindPartial(const S: AnsiString; var Index: Integer;
                              PartialLength: Word): Boolean; virtual;
      end;

   TRecordsBitmap = class(TObject)
      private
         FBitmap: PChar;
         FBitmapSize: Integer;
         FNumOfBits: Integer;
         FAllocatedBits: Integer;
         FEdgeBits: Integer;
         FNumOfWords: Integer;
         procedure ResizeBitmap(Value: Integer);
         procedure SetNumOfBits(Value: Integer);
      public
         constructor Create;
         destructor Destroy; override;
         property NumOfBits: Integer read FNumOfBits write SetNumOfBits;
         function IsBitSet(Value: Integer): Boolean;
         procedure SetBit(Value: Integer);
         procedure ClearBit(Value: Integer);
         function GetTotalBitsSet: Integer;
         function GetPreviousBitsSet(var Value: Integer; NumBits: Integer): Boolean;
         function GetNextBitsSet(var Value: Integer; NumBits: Integer): Boolean;
         procedure AndBits(Source: TRecordsBitmap);
         procedure OrBits(Source: TRecordsBitmap);
         procedure XorBits(Source: TRecordsBitmap);
         procedure NotBits;
         procedure ClearBits;
         procedure SetBits;
         procedure Assign(Source: TRecordsBitmap);
      end;

   TExpToken = class(TObject)
      private
         FValueBufferSize: Integer;
         FTokenLiteral: AnsiString;
         FTokenType: TExpTokenType;
         FTokenOperator: TExpOperator;
         FOptimizeLevel: TOptimizeLevel;
         FOptimizeCount: Integer;
         FOptimizeCost: Int64;
         FLevel: Integer;
         FFieldName: string;
         FFieldNumber: Word;
         FSourceAlias: string;
         FDataSource: TObject;
         FSourceObject: TObject;
         FValue: PChar;
         FIsNull: Boolean;
         FInvalidValue: Boolean;
         FPartialLength: Integer;
         FCaseInsensitive: Boolean;
         FDescending: Boolean;  // Not used
         FDataType: Byte;
         FSubType: Byte;
         FDataSize: Integer;
         FDataDecimals: Byte;
         FLine: Integer;
         FColumn: Integer;
         FUpperExpToken: TExpToken;
         FLeftExpToken: TExpToken;
         FRightExpToken: TExpToken;
         FParamExpToken: TExpToken;
         FArgumentExpTokens: TList;
         FLeftPackOffset: Integer;
         FRightPackOffset: Integer;
         FExtraPackOffset: Integer;
         FArgumentsPackOffset: Integer;
         FPackPos: Integer;
         FUnpackPos: Integer;
         procedure SetDataSize(Value: Integer);
         procedure ResizeValueBuffer(Value: Integer);
         function GetPackSize(BufferSize: Integer): Integer;
         procedure BeginPack(BufferPos: Integer);
         procedure Pack(var DestBuffer: PChar; var DestBufferSize: Integer;
                        const Buffer; BufferSize: Integer);
         procedure BeginUnpack(SourceBufferPos: Integer);
         function GetUnpackSize(SourceBuffer: PChar): Integer;
         function Unpack(SourceBuffer: PChar; var Buffer): Integer;
         function GetArgumentExpToken(Index: Integer): TExpToken;
         procedure SetArgumentExpToken(Index: Integer; Value: TExpToken);
         function GetParamDataType: Byte;
         function GetParamSubType: Byte;
         function GetParamDataSize: Integer;
         procedure GetParamData(Buffer: Pointer);
      public
         constructor Create;
         destructor Destroy; override;
         property TokenLiteral: AnsiString read FTokenLiteral write FTokenLiteral;
         property TokenType: TExpTokenType read FTokenType write FTokenType;
         property TokenOperator: TExpOperator read FTokenOperator write FTokenOperator;
         property OptimizeLevel: TOptimizeLevel read FOptimizeLevel write FOptimizeLevel;
         property OptimizeCount: Integer read FOptimizeCount write FOptimizeCount;
         property OptimizeCost: Int64 read FOptimizeCost write FOptimizeCost;
         property Level: Integer read FLevel write FLevel;
         property FieldName: string read FFieldName write FFieldName;
         property FieldNumber: Word read FFieldNumber write FFieldNumber;
         property SourceAlias: string read FSourceAlias write FSourceAlias;
         property DataSource: TObject read FDataSource write FDataSource;
         property SourceObject: TObject read FSourceObject write FSourceObject;
         property Value: PChar read FValue;
         property IsNull: Boolean read FIsNull write FIsNull;
         property InvalidValue: Boolean read FInvalidValue write FInvalidValue;
         property PartialLength: Integer read FPartialLength write FPartialLength;
         property CaseInsensitive: Boolean read FCaseInsensitive write FCaseInsensitive;
         property Descending: Boolean read FDescending write FDescending;   // Not used
         property DataType: Byte read FDataType write FDataType;
         property SubType: Byte read FSubType write FSubType;
         property DataSize: Integer read FDataSize write SetDataSize;
         property DataDecimals: Byte read FDataDecimals write FDataDecimals;
         property Line: Integer read FLine write FLine;
         property Column: Integer read FColumn write FColumn;
         property UpperExpToken: TExpToken read FUpperExpToken write FUpperExpToken;
         property LeftExpToken: TExpToken read FLeftExpToken write FLeftExpToken;
         property RightExpToken: TExpToken read FRightExpToken write FRightExpToken;
         property ParamExpToken: TExpToken read FParamExpToken write FParamExpToken;
         property ArgumentExpToken[Index: Integer]: TExpToken read GetArgumentExpToken
                                                              write SetArgumentExpToken;
         property ArgumentExpTokens: TList read FArgumentExpTokens write FArgumentExpTokens;
         property LeftPackOffset: Integer read FLeftPackOffset write FLeftPackOffset;
         property RightPackOffset: Integer read FRightPackOffset write FRightPackOffset;
         property ExtraPackOffset: Integer read FExtraPackOffset write FExtraPackOffset;
         property ArgumentsPackOffset: Integer read FArgumentsPackOffset write FArgumentsPackOffset;
         procedure Copy(ExpTokenToCopy: TExpToken);
         procedure CopyValue(ExpTokenToCopy: TExpToken);
         function CopyToBuffer(var DestBuffer: PChar; var DestBufferSize: Integer;
                               DestBufferPos: Integer): Integer;
         function CopyFromBuffer(SourceBuffer: PChar; SourceBufferPos: Integer): Integer;
         function GetTotalPackSize: Integer;
         function Compare(ExpTokenToCompare: TExpToken): Boolean;
      end;

   TExpressionParser = class(TObject)
      private
         FOwner: TObject;
         FErrorCode: Word;
         FErrorDBName: string;
         FErrorTableName: string;
         FErrorContext: string;
         FObjectContext: TObject;
         FSize: Integer;
         FExpression: PChar;
         FPtr: PChar;
         FTokenPtr: PChar;
         FSaveTokenPtr: PChar;
         FToken: Char;
         FStringPtr: PChar;
         FStatementPtr: PChar;
         FExpressionPtr: PChar;
         FLastPtr: PChar;
         FCurLine: Integer;
         FLinePtr: PChar;
         FCurSaveTokenLine: Integer;
         FSaveLinePtr: PChar;
         FColumnOffset: Integer;
         procedure FreeExpression;
         function GetExpression: AnsiString;
         function GetCurColumn: Integer;
         function GetCurSaveTokenColumn: Integer;
         procedure CheckForLineTermAndIncrement;
         procedure CheckForAllFields(Token: TExpToken);
      public
         constructor Create(Owner: TObject); virtual;
         destructor Destroy; override;
         property Expression: AnsiString read GetExpression;
         property CurLine: Integer read FCurLine;
         property CurColumn: Integer read GetCurColumn;
         property CurSaveTokenLine: Integer read FCurSaveTokenLine;
         property CurSaveTokenColumn: Integer read GetCurSaveTokenColumn;
         property ErrorCode: Word read FErrorCode write FErrorCode;
         property ErrorDBName: string read FErrorDBName write FErrorDBName;
         property ErrorTableName: string read FErrorTableName write FErrorTableName;
         property ErrorContext: string read FErrorContext write FErrorContext;
         property ObjectContext: TObject read FObjectContext write FObjectContext;
         function GetNewExpToken: TExpToken;
         procedure MarkStatement;
         procedure MarkExpression;
         procedure MarkSaveToken;
         procedure SkipBlanks;
         procedure SkipComments;
         function NextToken: Char;
         function TokenLiteralString: AnsiString;
         function SaveTokenLiteralString: AnsiString;
         function TokenAsString: AnsiString;
         function TokenIsSymbol: Boolean;
         function TokenIsString: Boolean;
         function CheckTokenSymbol(const Value: AnsiString): Boolean;
         function CheckTokenString(const Value: AnsiString): Boolean;
         function CheckToken(Value: Char): Boolean;
         procedure ErrorIfNotToken(Value: Char);
         procedure ErrorIfNotSymbol(const Value: AnsiString);
         function SkipToken(Value: Char): Boolean;
         procedure ErrorIfNotSkipToken(Value: Char);
         function StatementAsString: AnsiString;
         function ExpressionAsString: AnsiString;
         procedure ExpectedTokenError(ExpectedToken: Char);
         procedure ExpectedExpressionError(const ExpectedExpression: AnsiString;
                                           Saved: Boolean);
         procedure InvalidExpressionError(Saved: Boolean);
         procedure SetExpression(ExpressionBuffer: PChar;
                                 LineOffset: Integer;
                                 ColumnOffset: Integer);
         function ParseDataTypeExpression(FieldToken: TExpToken;
                                          ParseOptions: TParseOptions;
                                          IgnoreMissing: Boolean): Boolean;
         function ParseExpression8(ParseOptions: TParseOptions): TExpToken;
         function ParseExpression7(ParseOptions: TParseOptions): TExpToken;
         function ParseExpression6(ParseOptions: TParseOptions): TExpToken;
         function ParseExpression5(ParseOptions: TParseOptions): TExpToken;
         function ParseExpression4(ParseOptions: TParseOptions): TExpToken;
         function ParseExpression3(ParseOptions: TParseOptions): TExpToken;
         function ParseExpression2(ParseOptions: TParseOptions): TExpToken;
         function ParseExpression1(ParseOptions: TParseOptions): TExpToken;
      end;

   TImportParser = class(TObject)
      private
         FOwner: TObject;
         FFieldDelimiter: Char;
         FErrorCode: Word;
         FErrorDBName: string;
         FErrorTableName: string;
         FErrorContext: string;
         FExpression: PChar;
         FPtr: PChar;
         FTokenPtr: PChar;
         FToken: Char;
         FStringPtr: PChar;
         FCurLine: Integer;
         FLinePtr: PChar;
         function GetCurColumn: Integer;
      public
         constructor Create(Owner: TObject); virtual;
         destructor Destroy; override;
         property FieldDelimiter: Char read FFieldDelimiter write FFieldDelimiter;
         property CurLine: Integer read FCurLine;
         property CurColumn: Integer read GetCurColumn;
         property ErrorCode: Word read FErrorCode write FErrorCode;
         property ErrorDBName: string read FErrorDBName write FErrorDBName;
         property ErrorTableName: string read FErrorTableName write FErrorTableName;
         property ErrorContext: string read FErrorContext write FErrorContext;
         property TokenPtr: PChar read FTokenPtr;
         procedure SkipBlanks;
         function NextToken: Char;
         function TokenLiteralString: AnsiString;
         function TokenAsString: AnsiString;
         function CheckTokenSymbol(const Value: AnsiString): Boolean;
         function CheckTokenString(const Value: AnsiString): Boolean;
         function CheckToken(Value: Char): Boolean;
         procedure ExpectedTokenError(ExpectedToken: Char);
         procedure ExpectedExpressionError(const ExpectedExpression: AnsiString);
         procedure InvalidExpressionError;
         procedure InvalidError(const InvalidMessage: AnsiString);
         procedure SetExpression(ExpressionBuffer: PChar);
         procedure IncLine;
      end;

   TExpressionVerifier = class(TObject)
      private
         FOwner: TObject;
         FErrorCode: Word;
         FErrorDBName: string;
         FErrorTableName: string;
         FErrorContext: string;
         FFieldClientData: Integer;
         FFieldCallback: pVerifyFieldCallback;
         function AddLiteral(const ExistingLiteral: AnsiString;
                             const NewLiteral: AnsiString): AnsiString;
         function GetTypeLiterals(ExpectedDataTypes: TDataTypeSet;
                                  ExpectedSubTypes: TSubTypeSet): AnsiString;
         function GetTokenTypeLiterals(ExpectedTokenTypes: TExpTokenTypeSet): AnsiString;
         function GetUnaryResultDataType(Operator: TExpOperator; LeftDataType: Byte): Byte;
         function GetBinaryResultDataType(Operator: TExpOperator; LeftDataType: Byte;
                                          RightDataType: Byte): Byte;
         function GetUnaryResultSubType(Operator: TExpOperator; LeftDataType: Byte;
                                        LeftSubType: Byte): Byte;
         function GetBinaryResultSubType(Operator: TExpOperator; LeftDataType: Byte;
                                         LeftSubType: Byte; RightDataType: Byte;
                                         RightSubType: Byte): Byte;
         procedure VerifyNextToken(NextToken: TExpToken;
                                   UpperToken: TExpToken;
                                   TransformBooleans: Boolean;
                                   AllowUnknownTypes: Boolean);
         procedure VerifyMultipleExpressions(const ErrorLiteral: string;
                                             ArgumentOffset: Integer;
                                             NextToken: TExpToken;
                                             TransformBooleans: Boolean;
                                             AllowUnknownTypes: Boolean);
         procedure TransformBooleanExpression(NextToken: TExpToken;
                                              TransformBooleans: Boolean);
      public
         constructor Create(Owner: TObject); virtual;
         destructor Destroy; override;
         property ErrorCode: Word read FErrorCode write FErrorCode;
         property ErrorDBName: string read FErrorDBName write FErrorDBName;
         property ErrorTableName: string read FErrorTableName write FErrorTableName;
         property ErrorContext: string read FErrorContext write FErrorContext;
         procedure SetFieldCallback(ClientData: Integer;
                                    FieldCallback: pVerifyFieldCallback);
         procedure ExpectedTypesError(const ExpToken: TExpToken;
                                      ExpectedDataTypes: TDataTypeSet;
                                      ExpectedSubTypes: TSubTypeSet);
         procedure ExpectedExpressionError(const ExpToken: TExpToken;
                                           const ExpectedExpression: AnsiString);
         procedure ExpectedTokenTypesError(const ExpToken: TExpToken;
                                           ExpectedTokenTypes: TExpTokenTypeSet);
         procedure CheckFieldTokenType(ExpToken: TExpToken);
         procedure CheckConstantTokenType(ExpToken: TExpToken);
         procedure CheckFieldConstantTokenType(ExpToken: TExpToken);
         procedure GeneralError(Line: Integer; Column: Integer;
                                const ErrorMessage: AnsiString); overload;
         procedure GeneralError(ExpToken: TExpToken;
                                const ErrorMessage: AnsiString); overload;
         procedure VerifyExpression(Expression: TExpToken;
                                    TransformBooleans: Boolean;
                                    AllowUnknownTypes: Boolean);
         procedure VerifyDataTypeToken(ExpToken: TExpToken);
         procedure VerifyDateTimeLiteral(LeftToken: TExpToken; RightToken: TExpToken);
         procedure CheckTypes(ExpToken: TExpToken;
                              ValidDataTypes: TDataTypeSet;
                              ValidSubTypes: TSubTypeSet;
                              AllowUnknownTypes: Boolean);
         procedure CheckUnaryTypes(Operator: TExpOperator;
                                   LeftExpToken: TExpToken;
                                   AllowUnknownTypes: Boolean);
         procedure CheckBinaryTypes(Operator: TExpOperator;
                                    LeftExpToken: TExpToken;
                                    RightExpToken: TExpToken;
                                    AllowUnknownTypes: Boolean);
         procedure CheckArgumentTypes(LeftExpToken: TExpToken;
                                      RightExpToken: TExpToken;
                                      AllowUnknownTypes: Boolean);
         procedure CheckStringTypes(ExpToken: TExpToken;
                                    AllowUnknownTypes: Boolean);
         procedure CheckBlobTypes(ExpToken: TExpToken;
                                  AllowUnknownTypes: Boolean);
         procedure CheckStringNumericDateTimeTypes(ExpToken: TExpToken;
                                                   AllowUnknownTypes: Boolean);
         procedure CheckBooleanTypes(ExpToken: TExpToken;
                                     AllowUnknownTypes: Boolean);
         procedure CheckNumericTypes(ExpToken: TExpToken;
                                     AllowUnknownTypes: Boolean);
         procedure CheckNumericDateTimeTypes(ExpToken: TExpToken;
                                             AllowUnknownTypes: Boolean);
         procedure CheckIntegerTypes(ExpToken: TExpToken;
                                     AllowUnknownTypes: Boolean);
         procedure CheckDateTimeTypes(ExpToken: TExpToken;
                                      AllowUnknownTypes: Boolean);
         procedure CheckCastTypes(SourceToken: TExpToken; DestToken: TExpToken;
                                  AllowUnknownTypes: Boolean);
      end;

{ OS-specific functionality }

function OSAllocCriticalSection: Pointer;
procedure OSInitializeCriticalSection(Section: Pointer);
procedure OSEnterCriticalSection(Section: Pointer);
procedure OSLeaveCriticalSection(Section: Pointer);
procedure OSDeleteCriticalSection(Section: Pointer);
procedure OSDeAllocCriticalSection(var Section: Pointer);
function OSAllocEvent: Pointer;
procedure OSSetEvent(Event: Pointer);
procedure OSResetEvent(Event: Pointer);
function OSWaitForEvent(Event: Pointer; Timeout: LongWord): Integer;
procedure OSDeAllocEvent(var Event: Pointer);
function OSLocaleID(LanguageID: Word; SortID: Word): Integer;
function OSLanguageID(PrimaryLanguageID: Byte; SubLanguageID: Byte): Word;
function OSValidLocale(LocaleID: Integer): Boolean;
function OSPrimaryLanguageID(LocaleID: Integer): Word;
function OSSubLanguageID(LocaleID: Integer): Word;
function OSBackSlash: string;
function OSForwardSlash: string;
function OSColon: string;
function OSExtSeparator: string;
function OSGetCurrentDirectory: string;
function OSGetTempDirectory: string;
function OSGetWindowsDirectory: string;
function OSGetSystemDirectory: string;
function OSGetComputerName: string;
function OSGetUserName: string;
function OSGetProcessID: Integer;
function OSGetThreadID: Integer;
function OSFileAttr(const AttrFileName: string; IsHidden: Boolean): Integer;
function OSFileAge(const AgeFileName: string; IsHidden: Boolean): Integer;
function OSFileExists(const ExistsFileName: string; IsHidden: Boolean): Boolean;
function OSTempFileName(const TempDirectory: string; const Extension: string): string;
function OSFileOpen(const OpenFileName: string;
                    IsReadOnly: Boolean; IsExclusive: Boolean;
                    IsTemporary: Boolean; IsHidden: Boolean): Integer;
function OSFileCreate(const CreateFileName: string;
                       IsTemporary: Boolean; IsHidden: Boolean): Integer;
function OSFileClose(Handle: Integer): Boolean;
function OSFileDelete(const DeleteFileName: string): Boolean;
function OSFileRename(const CurFileName: string; const NewFileName: string): Boolean;
function OSFileLock(Handle: Integer; Offset: Int64; NumBytes: Int64): Boolean;
function OSFileUnlock(Handle: Integer; Offset: Int64; NumBytes: Int64): Boolean;
function OSFileSeek(Handle: Integer; Offset: Int64; Origin: Integer): Int64;
function OSFileRead(Handle: Integer; var Buffer; Count: Integer): Integer;
function OSFileWrite(Handle: Integer; const Buffer; Count: Integer): Integer;
function OSSetEndOfFile(Handle: Integer): Boolean;
function OSFileFlush(Handle: Integer): Boolean;
procedure OSListFiles(FileList: TStrings; const DirMask: string;
                      IncludeExtensions: Boolean);
function OSSizeOfFile(const Value: string): Int64;
function OSTimeStampOfFile(const Value: string): TDateTime;
function OSLastNativeError: Word;
function OSLastError: Integer;
function OSLastSocketError: Integer;
function OSCompareFileNames(FirstFile: string; SecondFile: string): Integer;
function OSCompareChar(LocaleID: Integer;
                       FirstChar: Char; SecondChar: Char): Integer;
function OSCompareCharNoAccent(LocaleID: Integer;
                               FirstChar: Char; SecondChar: Char): Integer;
function OSCompareStrings(LocaleID: Integer;
                          FirstStringBuffer: PChar;
                          SecondStringBuffer: PChar;
                          PartialLength: Integer;
                          IsCaseInsensitive: Boolean): Integer;
procedure OSUpperString(LocaleID: Integer; StringBuffer: PChar);
procedure OSLowerString(LocaleID: Integer; StringBuffer: PChar);
function OSGetVersion: Currency;
function OSGetPlatform: Integer;
function OSGetTickCount: LongWord;
function OSCalcElapsedTime(BeginTicks: LongWord; EndTicks: LongWord): LongWord;
function OSUTCDateTime: TDateTime;
function OSCreateGUIDString: string;


function PadLeft(const Value: AnsiString; Padding: Integer; PadChar: Char): AnsiString;
function PadRight(const Value: AnsiString; Padding: Integer; PadChar: Char): AnsiString;
function Replicate(const Value: AnsiString; NumOfCopies: Integer): AnsiString;
function GetLeft(const Value: AnsiString; Count: Integer): AnsiString;
function GetRight(const Value: AnsiString; Count: Integer): AnsiString;
function Substr(const Value: AnsiString; Index: Integer; Count: Integer): AnsiString;
function At(const SearchFor: AnsiString; const Value: AnsiString): Integer;
function Rat(const SearchFor: AnsiString; const Value: AnsiString): Integer;
function TrimString(Value: PChar; TrimChar: Char): PChar;
function RightTrimString(Value: PChar; TrimChar: Char): PChar;
function LeftTrimString(Value: PChar; TrimChar: Char): PChar;
procedure LeftString(Value: PChar; Count: Integer; ResultValue: PChar);
procedure RightString(Value: PChar; Count: Integer; ResultValue: PChar); 
procedure RepeatString(Value: PChar; Count: Integer; ResultValue: PChar);
function PosString(SearchValue: PChar; Value: PChar): Integer;
function LikeString(LocaleID: Integer; Value: PChar; PatternValue: PChar;
                    EscapeCharacter: Char): Boolean;
function OccursString(SearchValue: PChar; Value: PChar): Integer;
function CalculateReplaceSize(SearchValue: PChar; ReplaceValue: PChar;
                              Value: PChar): Integer;
procedure ReplaceString(SearchValue: PChar; ReplaceValue: PChar;
                        Value: PChar; ResultValue: PChar);
function StripSlash(const Value: string): string;
function StripCRLFs(const Value: AnsiString): AnsiString;
function StripQuotes(const Value: AnsiString): AnsiString;
function ExpandQuotes(OuterQuoteChar: Char; const Value: AnsiString): AnsiString;
function ConvertQuotes(OuterQuoteChar: Char; const Value: AnsiString): AnsiString;
function ConvertToLiteral(const Value: AnsiString): AnsiString;
function ConvertSlashes(const Value: string): string;
function ExtractFileRoot(const Value: string; const Ext: string): string;
function EnsureFileExt(const Value: string; const OldExt: string;
                       const NewExt: string): string;
function RemoveDriveRoot(const Value: string): string;
function Escape(const Value: string): string;
function MatchString(const Value: string; const PatternValue: string;
                    LikeSyntax: Boolean; const EscapeCharacter: string;
                    CaseSensitive: Boolean): Boolean;
function IsAlpha(Value: Char): Boolean;
function IsNumeric(Value: Char): Boolean;
function IsAlphaNumeric(Value: Char): Boolean;
function IsNonLeading(Value: Char): Boolean;
function IsSpace(Value: Char): Boolean;
function CompareTStrings(LocaleID: Integer;
                         Value1: TStrings; Value2: TStrings): Boolean;
function RemoveFromTStrings(const Value: string; Strings: TStrings): Boolean;
procedure V123EncryptBuffer(var Buffer; NumBytes: Integer;
                            Key1: Byte; Key2: Byte);
procedure V123DecryptBuffer(var Buffer; NumBytes: Integer;
                              Key1: Byte; Key2: Byte);
function WrapIncInteger(Value: Integer): Integer;
procedure FlipFloatBits(Value: double; Buffer: PChar);
procedure FlipIntegerBits(Value: Integer; Buffer: PChar);
procedure FlipLargeIntBits(Value: Int64; Buffer: PChar);
function FlipIntegerSign(Value: Integer): Integer;
function FlipCurrencySign(Value: Currency): Currency;
procedure FlipSmallIntBits(Value: SmallInt; Buffer: PChar);
procedure FlipWordBits(Value: Word; Buffer: PChar);
procedure FlipCurrencyBits(Value: Currency; Buffer: PChar);
function FloatToComp(Value: double; Decimals: Byte): Comp;
function CompToFloat(Value: Comp): double;
function MakeBCDDisplayFormat(NumDecimals: Word): string;
function TruncateFloat(Value: Extended; Decimals: Byte): Extended;
function RoundFloat(Value: Extended; Decimals: Byte): Extended;
function FloorFloat(X: Extended; Decimals: Byte): Extended;
function PowerFloat(X: Extended; Y: Byte): Extended;
function CurrToComp(Value: Currency; Decimals: Byte): Comp;
function CompToCurr(Value: Comp): Currency;
function CurrToTBCD(Value: Currency; Decimals: Byte): TBCD;
function TBCDToCurr(Value: TBCD): Currency;
function TruncateCurr(Value: Currency; Decimals: Byte): Currency;
function RoundCurr(Value: Currency; Decimals: Byte): Currency;
function FloorCurr(X: Currency): Currency;
function PowerCurr(X: Currency; Y: Byte): Currency;
function WithinBounds(Value: Int64; LowBound: Int64; HighBound: Int64): Boolean;
function IsAChar(const Value: string): Boolean;
function IsAByte(const Value: string): Boolean;
function IsAWord(const Value: string): Boolean;
function IsAnInteger(const Value: string): Boolean;
function IsASmallInt(const Value: string): Boolean;
function IsALargeInt(const Value: string): Boolean;
function IsABoolean(const Value: string): Boolean;
function IsAFloat(const Value: string): Boolean;
function IsABCD(const Value: string): Boolean;
function IsADate(const Value: string): Boolean;
function IsADateTime(const Value: string): Boolean;
function IsATime(const Value: string): Boolean;
function IsADateNonAnsi(const Value: string): Boolean;
function IsADateTimeNonAnsi(const Value: string): Boolean;
function IsATimeNonAnsi(const Value: string): Boolean;
procedure CopyList(SourceList: TList; DestList: TList);
function GetDuplicateCount(PreviousKeyPtr: PChar;
                           NextKeyPtr: PChar;
                           CompareLength: Word): Byte;
function GetTrailingCount(NextKeyPtr: PChar; CompareLength: Word): Byte;
procedure FillTrail(NextKeyPtr: PChar; FillCount: Byte);
function AddBS(const PathName: string): string;
function RemoveBS(const PathName: string): string;
function RemoveLeadingBS(const PathName: string): string;
function RemoveAllBS(const PathName: string): string;
function RemoveAllLeadingBS(const PathName: string): string;
function RemoveAllTrailingBS(const PathName: string): string;
function RemoveLastDir(const Value: string): string;
function AddFS(const PathName: string): string;
function RemoveFS(const PathName: string): string;
function ContainsDirectory(const Value: string): Boolean;
function MemoryDirectory(const Value: string): Boolean;

function StripFilePathAndExtension(const Value: string; const Ext: string): string;
function MaximumInteger(FirstInteger: Integer; SecondInteger: Integer): Integer;
function MinimumInteger(FirstInteger: Integer; SecondInteger: Integer): Integer;
function MaximumLargeInt(FirstLargeInt: Int64; SecondLargeInt: Int64): Int64;
function MinimumLargeInt(FirstLargeInt: Int64; SecondLargeInt: Int64): Int64;
function MaximumWord(FirstWord: Word; SecondWord: Word): Word;
function MinimumWord(FirstWord: Word; SecondWord: Word): Word;
function MaximumSmallInt(FirstSmallInt: SmallInt; SecondSmallInt: SmallInt): SmallInt;
function MinimumSmallInt(FirstSmallInt: SmallInt; SecondSmallInt: SmallInt): SmallInt;
function MaximumBCD(FirstBCD: Currency; SecondBCD: Currency): Currency;
function MinimumBCD(FirstBCD: Currency; SecondBCD: Currency): Currency;
function MaximumFloat(FirstFloat: Extended; SecondFloat: Extended): Extended;
function MinimumFloat(FirstFloat: Extended; SecondFloat: Extended): Extended;
function MaximumComp(FirstComp: comp; SecondComp: comp): comp;
function MinimumComp(FirstComp: comp; SecondComp: comp): comp;
function MaximumByte(FirstByte: Byte; SecondByte: Byte): Byte;
function MinimumByte(FirstByte: Byte; SecondByte: Byte): Byte;
procedure MBCSInc(LocaleID: Integer; var CurPtr: PChar);
function CompareMBCSChar(LocaleID: Word;
                         FirstChar: PChar; SecondChar: PChar): Integer;
function CompareChar(LocaleID: Integer;
                     FirstChar: Char; SecondChar: Char): Integer;
function CompareBytes(FirstBuffer: PChar; SecondBuffer: PChar;
                      CompareLength: Word; Descending: Boolean): Integer;
function CopyDiskFile(const FromFileName: string;
                      const ToFileName: string): Integer;
function AppendDiskFile(const FromFileName: string;
                        const ToFileName: string): Integer;
procedure ResizeBuffer(Value: Integer; var BufferToResize: PChar;
                       var ExistingSize: Integer; ShrinkBuffer: Boolean=False);
function BlockOffset(Value: Integer; BlockSize: Integer): Integer;
function ConvertStringToDateTime(SourceBuffer: PChar;
                                  DestDataType: Byte): Boolean;
function ConvertFormatToDateTime(SourceBuffer: PChar;
                                 DestDataType: Byte;
                                 const DateFormat: string;
                                 const TimeFormat: string): Boolean;
function ConvertDateTimeToFormat(SourceBuffer: PChar;
                                 SourceDataType: Byte;
                                 const DateFormat: string;
                                 const TimeFormat: string): Boolean;
function FormatStrToDate(const Value: string; const DateFormat: string): TDateTime;
function FormatStrToTime(const Value: string; const TimeFormat: string): TDateTime;
function FormatStrToDateTime(const Value: string; const DateFormat: string;
                             const TimeFormat: string): TDateTime;
function ConvertFormatToNumber(SourceBuffer: PChar;
                               DestDataType: Byte;
                               DestDataDecimals: Byte;
                               DecSeparator: Char): Boolean;
function ConvertNumberToFormat(SourceBuffer: PChar;
                               SourceDataType: Byte;
                               DecSeparator: Char): Boolean;
function FormatStrToFloat(const Value: string; DecSeparator: Char): double;
function FormatStrToCurr(const Value: string; DecSeparator: Char): Currency;
function FloatToFormatStr(Value: double; DecSeparator: Char): string;
function CurrToFormatStr(Value: Currency; DecSeparator: Char): string;
function ConvertExpression(FromDataType: Byte; FromDataSize: Word;
                           FromDataDecimals: Byte;
                           ToDataType: Byte; ToDataSize: Word;
                           ToDataDecimals: Byte; ExprBuffer: PChar): Boolean;
function VerifyWordBool(Value: WordBool): WordBool;
function VerifyCompareResult(Value: Integer): Integer;
procedure EvaluateUnary(Operator: TExpOperator; LeftToken: TExpToken;
                        ResultToken: TExpToken);
procedure EvaluateBinary(Operator: TExpOperator; LeftToken: TExpToken;
                         RightToken: TExpToken; ResultToken: TExpToken;
                         LocaleID: Integer);
procedure EvaluateCompare(Operator: TExpOperator; PartialLength: Word;
                          IsCaseInsensitive: Boolean; LeftToken: TExpToken;
                          RightToken: TExpToken; ResultToken: TExpToken;
                          LocaleID: Integer);
procedure ConvertConstant(SourceDataType: Byte; SourceBuffer: PChar;
                          DestDataType: Byte; DestDataDecimals: Byte;
                          DestBuffer: PChar;
                          var RangeError: Boolean);
function EndsWithWildCard(Value: PChar; WildcardValue: PChar;
                          EscapeChar: Char): Boolean;
function BuildNextFilterExpression(NextToken: TExpToken;
                                   ClientData: Integer;
                                   FieldCallback: pEvaluateFieldCallback;
                                   LocaleID: Integer;
                                   IsCaseInsensitive: Boolean; NoPartialMatch: Boolean): TExpToken;
function EvaluateConstant(DestToken: TExpToken; ConstantToken: TExpToken;
                          RecordBuffer: PChar; ClientData: Integer;
                          FieldCallback: pEvaluateFieldCallback;
                          LocaleID: Integer): TExpToken;
procedure ReverseBinaryOperator(NextToken: TExpToken);
procedure ReverseBinaryTokens(NextToken: TExpToken);
procedure ReverseBinaryTokenOperator(NextToken: TExpToken);
procedure SwitchTokens(LeftToken: TExpToken; RightToken: TExpToken);
procedure AddTokens(var DestTokens: TExpToken; NextToken: TExpToken);
{ Version 5 }
function ContainsNots(NextToken: TExpToken): Boolean;
{ Version 5 }
function ContainsFields(NextToken: TExpToken): Boolean;
function ContainsFieldsOutsideAggregates(NextToken: TExpToken): Boolean;
function ContainsConstants(NextToken: TExpToken): Boolean;
{ Version 5 }
function ContainsTextSearch(NextToken: TExpToken): Boolean;
{ Version 5 }
function ContainsAggregates(NextToken: TExpToken): Boolean;
function ConvertToExtended(DataType: Byte; Buffer: PChar): Extended;
function ConvertToInteger(DataType: Byte; Buffer: PChar): Integer;
procedure EvaluateExpressionToken(NextToken: TExpToken; RecordBuffer: PChar;
                                  ClientData: Integer;
                                  FieldCallback: pEvaluateFieldCallback;
                                  LocaleID: Integer);
procedure EvaluateExtract(LeftToken: TExpToken;
                          ResultToken: TExpToken);
procedure EvaluateCustomFunction(ResultToken: TExpToken;
                                 RecordBuffer: PChar;
                                 ClientData: Integer;
                                 FieldCallback: pEvaluateFieldCallback;
                                 LocaleID: Integer);
procedure EvaluateExpression(ResultToken: TExpToken;
                             ExpressionToken: TExpToken);
function BuildExpressionLiteral(NextToken: TExpToken): AnsiString;
function CopyExpressionTokens(ExpressionTokens: TExpToken): TExpToken;
function CopyNextExpressionToken(NextToken: TExpToken): TExpToken;
function PackExpressionTokens(ExpressionTokens: TExpToken; var DestBuffer: PChar): Integer;
function PackNextExpressionToken(NextToken: TExpToken; var DestBuffer: PChar;
                                 var DestBufferSize: Integer;
                                 DestBufferPos: Integer): Integer;
procedure TranslateExpressionTokens(ExpressionTokens: TExpToken);
procedure TranslateNextExpressionToken(NextToken: TExpToken);
function UnpackExpressionTokens(SourceBuffer: PChar;
                                var ExpressionTokens: TExpToken): Integer;
function UnpackNextExpressionToken(SourceBuffer: PChar; SourceBufferPos: Integer;
                                   var NextToken: TExpToken): Integer;
procedure UntranslateExpressionTokens(ExpressionTokens: TExpToken);
procedure UntranslateNextExpressionToken(NextToken: TExpToken);
function CompareExpressionTokens(FirstExpressionTokens: TExpToken;
                                 SecondExpressionTokens: TExpToken): Boolean;
function CompareNextExpressionToken(FirstToken: TExpToken;
                                    SecondToken: TExpToken): Boolean;
procedure FreeExpressionTokens(var ExpressionTokens: TExpToken);
procedure FreeNextExpressionToken(var NextToken: TExpToken);
function GetFieldToken(NextToken: TExpToken): TExpToken;
function GetAggregateToken(NextToken: TExpToken): TExpToken;
function GetLeftMostToken(NextToken: TExpToken): TExpToken;
function GetOperatorForAggregate(const FunctionName: string): TExpOperator;
function IsCaseInsensitiveToken(Token: TExpToken): Boolean;
function IsCaseInsensitiveField(Token: TExpToken): Boolean;
function IsTextSearchFunc(Token: TExpToken): Boolean;
procedure DeAllocMem(var Buffer);
procedure ConvertErrorFmt(const Msg: string; const Args: array of const);
function AnsiDateToStr(Value: TDateTime): string;
function AnsiTimeToStr(Value: TDateTime; MilitaryTime: Boolean): string;
function AnsiDateTimeToStr(Value: TDateTime; MilitaryTime: Boolean): string;
function StrToAnsiDate(const Value: string): TDateTime;
function StrToAnsiTime(const Value: string): TDateTime;
function StrToAnsiDateTime(const Value: string): TDateTime;
function AnsiBooleanToStr(Value: Boolean): string;
function StrToAnsiBoolean(const Value: string): Boolean;
function AnsiFloatToStr(Value: Extended): string;
function StrToAnsiFloat(const Value: string): Extended;
function AnsiCurrToStr(Value: Currency): string;
function StrToAnsiCurr(const Value: string): Currency;
function GetMilliSecondsBetween(Value1: TDateTime; Value2: TDateTime): Int64;
function GetSecondsBetween(Value1: TDateTime; Value2: TDateTime): Int64;
function GetMinutesBetween(Value1: TDateTime; Value2: TDateTime): Int64;
function GetHoursBetween(Value1: TDateTime; Value2: TDateTime): Int64;
function GetDaysBetween(Value1: TDateTime; Value2: TDateTime): Int64;
function GetWeeksBetween(Value1: TDateTime; Value2: TDateTime): Int64;
function TextTimeInterval(Interval: Int64): string;
function IsDayofMonth(Value: TDateTime; WeekNumber: Byte; DayNumber: Byte): Boolean;
function ISODayOfWeek(Value: TDateTime): Byte;
function ISODayOfYear(Value: TDateTime): Word;
function ISOWeekNumber(Value: TDateTime): Byte;
function GetCurrentYear: Word;
function GetYearsFromMilliseconds(Value: Int64): Integer;
function GetDaysFromMilliseconds(Value: Int64): Integer;
function GetHoursFromMilliseconds(Value: Int64): Integer;
function GetMinutesFromMilliseconds(Value: Int64): Integer;
function GetSecondsFromMilliseconds(Value: Int64): Integer;
function GetMilliSecondsFromMilliseconds(Value: Int64): Integer;
function IsRightSet(RightsValue: Integer; RightNum: Byte): Boolean;
procedure SetRight(var RightsValue: Integer; RightNum: Byte; Value: Boolean);
function Extract(var Value: AnsiString;
                 const Separator: AnsiString): AnsiString;
function RightExtract(var Value: AnsiString;
                      const Separator: AnsiString): AnsiString;
function ParseOriginTable(const Value: string): string;
function ParseOriginField(const Value: string): string;
function CharSetToString(Value: TCharSet): string;
function StringToCharSet(Value: string): TCharSet;
procedure StringToList(const Value: AnsiString; const Separator: AnsiString;
                       List: TStrings);
function ListToString(List: TStrings; const Separator: AnsiString): AnsiString;
function GetOptimizeLevelText(OptimizeLevel: TOptimizeLevel): string;
function GetJoinTypeText(JoinType: TJoinType): string;
function GetMergeTypeText(MergeType: TMergeType): string;
function NativeDataTypeToSQLString(DataType: Byte; SubType: Byte;
                                   DataSize: Word; DataDecimals: Byte): string;

implementation

uses Math, WinSock, dbisamen, dbisamsq, dbisamst;

function CompareLanguageStrings(List: TStringList;
                                Index1: Integer; Index2: Integer): Integer;
begin
   Result:=OSCompareStrings(TLocaleStringList(List).GetLocaleID,
                            PChar(List[Index1]),PChar(List[Index2]),0,True);
end;

function GetMillisecondsBetween(Value1: TDateTime; Value2: TDateTime): Int64;
var
   Stamp1: TTimeStamp;
   Stamp2: TTimeStamp;
begin
   Stamp1:=DateTimeToTimeStamp(Value1);
   Stamp2:=DateTimeToTimeStamp(Value2);
   Result:=Trunc((((((Stamp2.Date-Stamp1.Date)*24)*60)*60)*1000)+
                     (Stamp2.Time-Stamp1.Time));
end;

function GetSecondsBetween(Value1: TDateTime; Value2: TDateTime): Int64;
var
   Stamp1: TTimeStamp;
   Stamp2: TTimeStamp;
begin
   Stamp1:=DateTimeToTimeStamp(Value1);
   Stamp2:=DateTimeToTimeStamp(Value2);
   Result:=Trunc(((((Stamp2.Date-Stamp1.Date)*24)*60)*60)+
                   ((Stamp2.Time-Stamp1.Time)/1000));
end;

function GetMinutesBetween(Value1: TDateTime; Value2: TDateTime): Int64;
var
   Stamp1: TTimeStamp;
   Stamp2: TTimeStamp;
begin
   Stamp1:=DateTimeToTimeStamp(Value1);
   Stamp2:=DateTimeToTimeStamp(Value2);
   Result:=Trunc((((Stamp2.Date-Stamp1.Date)*24)*60)+
                   (((Stamp2.Time-Stamp1.Time)/1000)/60));
end;

function GetHoursBetween(Value1: TDateTime; Value2: TDateTime): Int64;
var
   Stamp1: TTimeStamp;
   Stamp2: TTimeStamp;
begin
   Stamp1:=DateTimeToTimeStamp(Value1);
   Stamp2:=DateTimeToTimeStamp(Value2);
   Result:=Trunc(((Stamp2.Date-Stamp1.Date)*24)+
                ((((Stamp2.Time-Stamp1.Time)/1000)/60)/60));
end;

function GetDaysBetween(Value1: TDateTime; Value2: TDateTime): Int64;
var
   Stamp1: TTimeStamp;
   Stamp2: TTimeStamp;
begin
   Stamp1:=DateTimeToTimeStamp(Value1);
   Stamp2:=DateTimeToTimeStamp(Value2);
   Result:=Trunc((Stamp2.Date-Stamp1.Date)+
                (((((Stamp2.Time-Stamp1.Time)/1000)/60)/60)/24));
end;

function GetWeeksBetween(Value1: TDateTime; Value2: TDateTime): Int64;
var
   Stamp1: TTimeStamp;
   Stamp2: TTimeStamp;
begin
   Stamp1:=DateTimeToTimeStamp(Value1);
   Stamp2:=DateTimeToTimeStamp(Value2);
   Result:=Trunc(((Stamp2.Date-Stamp1.Date)/7)+
                ((((((Stamp2.Time-Stamp1.Time)/1000)/60)/60)/24)/7));
end;

function TextTimeInterval(Interval: Int64): string;
const
   Descs: array[1..6] of string=('Month',' Week','Day','Hour','Minute','Second');
var
   I: Word;
   Desc: string;
   Start: Boolean;
   Values: array[1..6] of Int64;
begin
   Result:='';
   Values[1]:=Trunc(Interval/(31*24*3600));
   Interval:=Interval-(Values[1]*(31*24*3600));
   Values[2]:=Trunc(Interval/(7*24*3600));
   Interval:=Interval-(Values[2]*(7*24*3600));
   Values[3]:=Trunc(Interval/(24*3600));
   Interval:=Interval-(Values[3]*(24*3600));
   Values[4]:=Trunc(Interval/3600);
   Interval:=Interval-(Values[4]*3600);
   Values[5]:=Trunc(Interval/60);
   Interval:=Interval-(Values[5]*60);
   Values[6]:=Interval;
   Start:=False;
   for I:=1 to High(Values) do
      begin
      if (Values[I] <> 1) then
         Desc:=Descs[I]+'s'
      else
         Desc:=Descs[I];
      if (not Start) and (Values[I]=0) then
         Continue
      else
         Start:=True;
      if (I < High(Values)) then
         Result:=Result+IntToStr(Values[I])+' '+Desc+', '
      else
         Result:=Result+IntToStr(Values[I])+' '+Desc;
      end;
end;

function IsDayofMonth(Value: TDateTime; WeekNumber: Byte; DayNumber: Byte): Boolean;
var
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
   TempDate: TDateTime;
   I: Integer;
   NumFound: Integer;
begin
   Result:=False;
   DecodeDate(Value,TempYear,TempMonth,TempDay);
   if (TempMonth=12) then
      TempDate:=(EncodeDate((TempYear+1),1,1)-1)
   else
      TempDate:=(EncodeDate(TempYear,(TempMonth+1),1)-1);
   DecodeDate(TempDate,TempYear,TempMonth,TempDay);
   NumFound:=0;
   case WeekNumber of
      MONTHLY_FIRST_DOW:
         begin
         for I:=1 to TempDay do
            begin
            if (DayOfWeek(EncodeDate(TempYear,TempMonth,I))=DayNumber) then
               begin
               Result:=True;
               Break;
               end;
            end;
         end;
      MONTHLY_SECOND_DOW:
         begin
         for I:=1 to TempDay do
            begin
            if (DayOfWeek(EncodeDate(TempYear,TempMonth,I))=DayNumber) then
               begin
               Inc(NumFound);
               if (NumFound=2) then
                  begin
                  Result:=True;
                  Break;
                  end;
               end;
            end;
         end;
      MONTHLY_THIRD_DOW:
         begin
         for I:=1 to TempDay do
            begin
            if (DayOfWeek(EncodeDate(TempYear,TempMonth,I))=DayNumber) then
               begin
               Inc(NumFound);
               if (NumFound=3) then
                  begin
                  Result:=True;
                  Break;
                  end;
               end;
            end;
         end;
      MONTHLY_FOURTH_DOW:
         begin
         for I:=1 to TempDay do
            begin
            if (DayOfWeek(EncodeDate(TempYear,TempMonth,I))=DayNumber) then
               begin
               Inc(NumFound);
               if (NumFound=4) then
                  begin
                  Result:=True;
                  Break;
                  end;
               end;
            end;
         end;
      MONTHLY_LAST_DOW:
         begin
         for I:=TempDay downto 1 do
            begin
            if (DayOfWeek(EncodeDate(TempYear,TempMonth,I))=DayNumber) then
               begin
               Result:=True;
               Break;
               end;
            end;
         end;
      end;      
end;

function ISODayOfWeek(Value: TDateTime): Byte;
begin
   if (DayOfWeek(Value)=1) then
      Result:=7
   else
      Result:=(DayOfWeek(Value)-1);
end;

function ISODayOfYear(Value: TDateTime): Word;
var
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
   TempDate: TDateTime;
begin
   DecodeDate(Value,TempYear,TempMonth,TempDay);
   TempMonth:=1;
   TempDay:=1;
   TempDate:=EncodeDate(TempYear,TempMonth,TempDay);
   Result:=Word((Trunc(Value)-Trunc(TempDate)+1));
end;

function ISOBeginOfYear(Value: Word): TDateTime;
begin
   Result:=EncodeDate(Value,1,1);
   while (ISODayOfWeek(Result) <> 1) do
      Result:=(Result+1);
   if (Result > EncodeDate(Value,1,4)) then
      Result:=(Result-7);
end;

function ISOWeekNumber(Value: TDateTime): Byte;
var
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
   TempDate: TDateTime;
   TempBOY: TDateTime;
   TempBOPY: TDateTime;
   TempBONY: TDateTime;
   TempNumDays: Word;
begin
   DecodeDate(Value,TempYear,TempMonth,TempDay);
   TempDate:=EncodeDate(TempYear,TempMonth,TempDay);
   TempBOY:=ISOBeginOfYear(TempYear);
   TempBOPY:=ISOBeginOfYear(TempYear-1);
   TempBONY:=ISOBeginOfYear(TempYear+1);
   if (Value >= TempBONY) then
      TempNumDays:=Trunc((TempDate-TempBONY)+1)
   else if (Value < TempBOY) then
      TempNumDays:=Trunc((TempDate-TempBOPY)+1)
   else
      TempNumDays:=Trunc((TempDate-TempBOY)+1);
   if ((TempNumDays mod 7)=0) then
      Result:=(TempNumDays div 7)
   else
      Result:=((TempNumDays div 7)+1);
end;

function GetYearsFromMilliseconds(Value: Int64): Integer;
begin
   Result:=(Value div MSECS_PER_YEAR);
end;

function GetDaysFromMilliseconds(Value: Int64): Integer;
begin
   Result:=((Value-(GetYearsFromMilliseconds(Value)*MSECS_PER_YEAR)) div MSECS_PER_DAY);
end;

function GetHoursFromMilliseconds(Value: Int64): Integer;
begin
   Result:=((Value-(GetYearsFromMilliseconds(Value)*MSECS_PER_YEAR)-
                   (GetDaysFromMilliseconds(Value)*MSECS_PER_DAY)) div MSECS_PER_HOUR);
end;

function GetMinutesFromMilliseconds(Value: Int64): Integer;
begin
   Result:=((Value-(GetYearsFromMilliseconds(Value)*MSECS_PER_YEAR)-
                   (GetDaysFromMilliseconds(Value)*MSECS_PER_DAY)-
                   (GetHoursFromMilliseconds(Value)*MSECS_PER_HOUR)) div MSECS_PER_MIN);
end;

function GetSecondsFromMilliseconds(Value: Int64): Integer;
begin
   Result:=((Value-(GetYearsFromMilliseconds(Value)*MSECS_PER_YEAR)-
                   (GetDaysFromMilliseconds(Value)*MSECS_PER_DAY)-
                   (GetHoursFromMilliseconds(Value)*MSECS_PER_HOUR)-
                   (GetMinutesFromMilliseconds(Value)*MSECS_PER_MIN)) div MSECS_PER_SEC);
end;

function GetMilliSecondsFromMilliseconds(Value: Int64): Integer;
begin
   Result:=(Value-(GetYearsFromMilliseconds(Value)*MSECS_PER_YEAR)-
                  (GetDaysFromMilliseconds(Value)*MSECS_PER_DAY)-
                  (GetHoursFromMilliseconds(Value)*MSECS_PER_HOUR)-
                  (GetMinutesFromMilliseconds(Value)*MSECS_PER_MIN)-
                  (GetSecondsFromMilliseconds(Value)*MSECS_PER_SEC));
end;

function IsRightSet(RightsValue: Integer; RightNum: Byte): Boolean;
begin
   Result:=((RightsValue and (1 shl RightNum)) <> 0);
end;

procedure SetRight(var RightsValue: Integer; RightNum: Byte; Value: Boolean);
begin
   if Value then
      RightsValue:=(RightsValue or (1 shl RightNum))
   else
      RightsValue:=(RightsValue and not (1 shl RightNum));
end;

function Extract(var Value: AnsiString;
                 const Separator: AnsiString): AnsiString;
begin
   if (At(Separator,Value) > 0) then
      begin
      Result:=Substr(Value,1,At(Separator,Value)-1);
      Value:=Substr(Value,At(Separator,Value)+Length(Separator),Length(Value));
      end
   else
      begin
      Result:=Value;
      Value:='';
      end;
end;

function RightExtract(var Value: AnsiString;
                      const Separator: AnsiString): AnsiString;
begin
   if (Rat(Separator,Value) > 0) then
      begin
      Result:=Substr(Value,Rat(Separator,Value)+Length(Separator),Length(Value));
      Value:=Substr(Value,1,Rat(Separator,Value)-1);
      end
   else
      begin
      Result:=Value;
      Value:='';
      end;
end;

function ParseOriginTable(const Value: string): string;
var
   SepPos: Integer;
begin
   Result:='';
   SepPos:=At(PARSE_ALIAS_QUALIFIER,Value);
   if (SepPos <> 0) then
      Result:=Substr(Value,1,(SepPos-1));
end;

function ParseOriginField(const Value: string): string;
var
   SepPos: Integer;
begin
   Result:='';
   SepPos:=At(PARSE_ALIAS_QUALIFIER,Value);
   if (SepPos <> 0) then
      Result:=Substr(Value,(SepPos+1),Length(Value));
end;

function CharSetToString(Value: TCharSet): string;
var
   I: Byte;
begin
   Result:='';
   for I:=1 to High(Byte) do
      begin
      if (AnsiChar(I) in Value) then
         Result:=Result+AnsiChar(I);
      end;
end;

function StringToCharSet(Value: string): TCharSet;
var
   I: Integer;
begin
   Result:=[];
   for I:=1 to Length(Value) do
      Include(Result,Value[I]);
end;

procedure StringToList(const Value: AnsiString; const Separator: AnsiString;
                       List: TStrings);
var
   TempString: AnsiString;
begin
   List.Clear;
   TempString:=Value;
   while (TempString <> '') do
      List.Add(Extract(TempString,Separator));
end;

function ListToString(List: TStrings; const Separator: AnsiString): AnsiString;
var
   I: Integer;
begin
   Result:='';
   for I:=0 to List.Count-1 do
      begin
      if (Result='') then
         Result:=List[I]
      else
         Result:=Result+Separator+List[I];
      end;
end;

function GetOptimizeLevelText(OptimizeLevel: TOptimizeLevel): string;
begin
   Result:='';
   case OptimizeLevel of
      olFull:
         Result:='OPTIMIZED';
      olPartial:
         Result:='PARTIALLY-OPTIMIZED';
      olNone:
         Result:='UN-OPTIMIZED';
      end;
end;

function GetJoinTypeText(JoinType: TJoinType): string;
begin
   Result:='';
   case JoinType of
      jtNone:
         Result:='CARTESIAN JOIN';
      jtInner:
         Result:='INNER JOIN';
      jtLeftOuter:
         Result:='LEFT OUTER JOIN';
      end;
end;

function GetMergeTypeText(MergeType: TMergeType): string;
begin
   Result:='';
   case MergeType of
      mtUnion:
         Result:='UNION';
      mtUnionAll:
         Result:='UNION ALL';
      mtIntersect:
         Result:='INTERSECT';
      mtIntersectAll:
         Result:='INTERSECT ALL';
      mtExcept:
         Result:='EXCEPT';
      mtExceptAll:
         Result:='EXCEPT ALL';
      end;
end;

function NativeDataTypeToSQLString(DataType: Byte; SubType: Byte;
                                   DataSize: Word; DataDecimals: Byte): string;
begin
   Result:='';
   case DataType of
      TYPE_ZSTRING:
         begin
         case SubType of
            SUBTYPE_FIXED:
               Result:='CHAR('+IntToStr(DataSize-1)+')';
            SUBTYPE_UNICODE:
               Result:='WIDECHAR('+IntToStr(DataSize-1)+')';
            SUBTYPE_GUID:
               Result:='GUID';
            else
               Result:='VARCHAR('+IntToStr(DataSize-1)+')';
            end;
         end;
      TYPE_BLOB:
         begin
         case SubType of
            SUBTYPE_MEMO:
               Result:='MEMO';
            SUBTYPE_GRAPHIC:
               Result:='GRAPHIC';
            else
               Result:='BLOB';
            end;
         end;
      TYPE_DATE:
         Result:='DATE';
      TYPE_TIME:
         Result:='TIME';
      TYPE_TIMESTAMP:
         Result:='TIMESTAMP';
      TYPE_BOOL:
         Result:='BOOLEAN';
      TYPE_INT16:
         Result:='SMALLINT';
      TYPE_UINT16:
         Result:='WORD';
      TYPE_INT32:
         begin
         case SubType of
            SUBTYPE_AUTOINC:
               Result:='AUTOINC';
            else
               Result:='INTEGER';
            end;
         end;
      TYPE_INT64:
         Result:='LARGEINT';
      TYPE_FLOAT:
         begin
         case SubType of
            SUBTYPE_MONEY:
               Result:='MONEY';
            else
               Result:='FLOAT';
            end;
         end;
      TYPE_BCD:
         Result:='DECIMAL(0,'+IntToStr(DataDecimals)+')';
      TYPE_BYTES:
         Result:='BYTES('+IntToStr(DataSize)+')';
      TYPE_VARBYTES:
         Result:='VARBYTES('+IntToStr(DataSize)+')';
      end;
end;

function PadLeft(const Value: AnsiString; Padding: Integer; PadChar: Char): AnsiString;
var
   NumToPad: Integer;
   I: Integer;
begin
   Result:=Value;
   if Length(Result) >= Padding then Exit;
   NumToPad:=Padding-Length(Result);
   for I:=1 to NumToPad do
      Result:=PadChar+Result;
end;

function PadRight(const Value: AnsiString; Padding: Integer; PadChar: Char): AnsiString;
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

function Replicate(const Value: AnsiString; NumOfCopies: Integer): AnsiString;
var
   I: Integer;
begin
   Result:='';
   for I:=1 to NumOfCopies do
      Result:=Result+Value;
end;

function GetLeft(const Value: AnsiString; Count: Integer): AnsiString;
begin
   Result:=System.Copy(Value,1,Count);
end;

function GetRight(const Value: AnsiString; Count: Integer): AnsiString;
begin
   Result:=System.Copy(Value,Length(Value)-Count+1,Count);
end;

function Substr(const Value: AnsiString; Index: Integer; Count: Integer): AnsiString;
begin
   Result:=System.Copy(Value,Index,Count);
end;

function At(const SearchFor: AnsiString; const Value: AnsiString): Integer;
begin
   Result:=Pos(SearchFor,Value);
end;

function Rat(const SearchFor: AnsiString; const Value: AnsiString): Integer;
var
   I: Integer;
begin
   Result:=0;
   for i:=Length(Value) downto 1 do
      begin
      if (Substr(Value,i,Length(SearchFor))=SearchFor) then
         begin
         Result:=I;
         Exit;
         end;
      end;
end;

function TrimString(Value: PChar; TrimChar: Char): PChar;
begin
   Result:=RightTrimString(LeftTrimString(Value,TrimChar),TrimChar);
end;

function RightTrimString(Value: PChar; TrimChar: Char): PChar;
var
   I: Integer;
begin
   Result:=Value;
   I:=(Integer(StrLen(Result))-1);
   Value:=(Result+I);
   while (I >= 0) and (Value^=TrimChar) do
      begin
      Dec(Value);
      Dec(I);
      end;
   Inc(Value);
   Value^:=#0;
end;

function LeftTrimString(Value: PChar; TrimChar: Char): PChar;
var
   I: Integer;
begin
   Result:=Value;
   I:=0;
   while (I < Integer(StrLen(Result))) and (Value^=TrimChar) do
      begin
      Inc(Value);
      Inc(I);
      end;
   StrLCopy(Result,Value,StrLen(Result));
end;

procedure LeftString(Value: PChar; Count: Integer; ResultValue: PChar);
begin
   StrLCopy(ResultValue,Value,Count);
end;

procedure RightString(Value: PChar; Count: Integer; ResultValue: PChar);
begin
   StrLCopy(ResultValue,(Value+((Integer(StrLen(Value))-Count))),Count);
end;

procedure RepeatString(Value: PChar; Count: Integer; ResultValue: PChar);
var
   I: Integer;
begin
   StrCopy(ResultValue,Value);
   for I:=2 to Count do
      StrCat(ResultValue,Value);
end;

function PosString(SearchValue: PChar; Value: PChar): Integer;
var
   PosPtr: PChar;
begin
   Result:=0;
   PosPtr:=AnsiStrPos(Value,SearchValue);
   if (PosPtr <> nil) then
      Result:=(PosPtr-Value)+1;
end;

function OccursString(SearchValue: PChar; Value: PChar): Integer;
var
   PosPtr: PChar;
begin
   Result:=0;
   PosPtr:=AnsiStrPos(Value,SearchValue);
   while (PosPtr <> nil) do
      begin
      Inc(Result);
      Inc(PosPtr,StrLen(SearchValue));
      PosPtr:=AnsiStrPos(PosPtr,SearchValue);
      end;
end;

function CalculateReplaceSize(SearchValue: PChar; ReplaceValue: PChar;
                              Value: PChar): Integer;
var
   Occurrences: Integer;
begin
   Result:=StrLen(Value);
   Occurrences:=OccursString(SearchValue,Value);
   if (Occurrences > 0) then
      Result:=(Result+((Integer(StrLen(ReplaceValue))-
               Integer(StrLen(SearchValue)))*Occurrences));
end;

procedure ReplaceString(SearchValue: PChar; ReplaceValue: PChar;
                        Value: PChar; ResultValue: PChar);
var
   ValuePtr: PChar;
   ResultPtr: PChar;
   PosPtr: PChar;
   SearchLen: Integer;
   ReplaceLen: Integer;
begin
   if (AnsiStrComp(SearchValue,ReplaceValue) <> CMP_EQUAL) then
      begin
      SearchLen:=StrLen(SearchValue);
      ReplaceLen:=StrLen(ReplaceValue);
      PosPtr:=AnsiStrPos(Value,SearchValue);
      ValuePtr:=Value;
      ResultPtr:=ResultValue;
      while (PosPtr <> nil) do
         begin
         StrLCopy(ResultPtr,ValuePtr,(PosPtr-ValuePtr));
         Inc(ResultPtr,(PosPtr-ValuePtr));
         Inc(ValuePtr,((PosPtr-ValuePtr)+SearchLen));
         StrCopy(ResultPtr,ReplaceValue);
         Inc(ResultPtr,ReplaceLen);
         Inc(PosPtr,SearchLen);
         PosPtr:=AnsiStrPos(PosPtr,SearchValue);
         end;
      StrLCopy(ResultPtr,ValuePtr,(StrEnd(Value)-ValuePtr));
      end
   else
      StrCopy(ResultValue,Value);
end;

function LikeString(LocaleID: Integer; Value: PChar; PatternValue: PChar;
                    EscapeCharacter: Char): Boolean;
var
   MatchingMultiple: Boolean;
   SavedPatternValue: PChar;
   SavedValue: PChar;
   NextLiteral: Boolean;
begin
   MatchingMultiple:=False;
   SavedPatternValue:=nil;
   SavedValue:=nil;
   Result:=False;
   while True do
      begin
      if (OSCompareStrings(LocaleID,PARSE_WILD_MULTIPLE,PatternValue,0,False)=CMP_EQUAL) then
         begin
         Result:=True;
         Break;
         end
      else if (Value^=#0) and (PatternValue^ <> #0) then
         begin
         if MatchingMultiple then
            begin
            PatternValue:=SavedPatternValue;
            Value:=SavedValue;
            MatchingMultiple:=False;
            MBCSInc(LocaleID,Value);
            end
         else
            begin
            Result:=False;
            Break;
            end;
         end
      else if (Value^=#0) and (PatternValue^=#0) then
         begin
         Result:=True;
         Break;
         end
      else
         begin
         if (EscapeCharacter <> #0) and (PatternValue^=EscapeCharacter) then
            begin
            NextLiteral:=True;
            MBCSInc(LocaleID,PatternValue);
            end
         else
            NextLiteral:=False;
         if (not NextLiteral) and (PatternValue^=PARSE_WILD_MULTIPLE) then
            begin
            SavedPatternValue:=PatternValue;
            SavedValue:=Value;
            MBCSInc(LocaleID,PatternValue);
            MatchingMultiple:=True;
            end
         else if (not NextLiteral) and (PatternValue^=PARSE_WILD_SINGLE) then
            begin
            MBCSInc(LocaleID,Value);
            MBCSInc(LocaleID,PatternValue);
            end
         else
            begin
            if (CompareMBCSChar(LocaleID,Value,PatternValue)=CMP_EQUAL) then
               begin
               MBCSInc(LocaleID,Value);
               MBCSInc(LocaleID,PatternValue);
               end
            else
               begin
               if MatchingMultiple then
                  begin
                  PatternValue:=SavedPatternValue;
                  Value:=SavedValue;
                  MatchingMultiple:=False;
                  MBCSInc(LocaleID,Value);
                  end
               else
                  begin
                  Result:=False;
                  Break;
                  end;
               end;
            end;
         end;
      end;
end;

function StripSlash(const Value: string): string;
begin
   Result:=Value;
   while At(OSForwardSlash,Result) > 0 do
      Delete(Result,At(OSForwardSlash,Result),1);
end;

function StripCRLFs(const Value: AnsiString): AnsiString;
begin
   Result:=Value;
   while At(PARSE_CR,Result) > 0 do
      Delete(Result,At(PARSE_CR,Result),1);
   while At(PARSE_LF,Result) > 0 do
      Delete(Result,At(PARSE_LF,Result),1);
end;

function StripQuotes(const Value: AnsiString): AnsiString;
begin
   Result:=Value;
   while At(PARSE_DOUBLEQUOTE,Result) > 0 do
      Delete(Result,At(PARSE_DOUBLEQUOTE,Result),1);
   while At(PARSE_SINGLEQUOTE,Result) > 0 do
      Delete(Result,At(PARSE_SINGLEQUOTE,Result),1);
end;

function ExpandQuotes(OuterQuoteChar: Char; const Value: AnsiString): AnsiString;
begin
   Result:=Value;
   if (OuterQuoteChar=PARSE_DOUBLEQUOTE) then
      Result:=StringReplace(Result,PARSE_DOUBLEQUOTE,
                            PARSE_DOUBLEQUOTE+PARSE_DOUBLEQUOTE,[rfReplaceAll])
   else if (OuterQuoteChar=PARSE_SINGLEQUOTE) then
      Result:=StringReplace(Result,PARSE_SINGLEQUOTE,
                            PARSE_SINGLEQUOTE+PARSE_SINGLEQUOTE,[rfReplaceAll]);
end;

function ConvertQuotes(OuterQuoteChar: Char; const Value: AnsiString): AnsiString;
var
   I: Integer;
begin
   Result:=Value;
   I:=Length(Result);
   if (OuterQuoteChar=PARSE_DOUBLEQUOTE) then
      begin
      while (I >= 2) do
         begin
         if (Result[I]=PARSE_DOUBLEQUOTE) and (Result[I-1]=PARSE_DOUBLEQUOTE) then
            begin
            Delete(Result,I,1);
            Dec(I);
            end;
         Dec(I);
         end;
      end
   else if (OuterQuoteChar=PARSE_SINGLEQUOTE) then
      begin
      while (I >= 2) do
         begin
         if (Result[I]=PARSE_SINGLEQUOTE) and (Result[I-1]=PARSE_SINGLEQUOTE) then
            begin
            Delete(Result,I,1);
            Dec(I);
            end;
         Dec(I);
         end;
      end
   else
      begin
      while (I >= 2) do
         begin
         if (Result[I]=PARSE_DOUBLEQUOTE) and (Result[I-1]=PARSE_DOUBLEQUOTE) then
            begin
            Delete(Result,I,1);
            Dec(I);
            end
         else if (Result[I]=PARSE_SINGLEQUOTE) and (Result[I-1]=PARSE_SINGLEQUOTE) then
            begin
            Delete(Result,I,1);
            Dec(I);
            end;
         Dec(I);
         end;
      end;
end;

function ConvertToLiteral(const Value: AnsiString): AnsiString;
var
   I: Integer;
begin
   Result:=PARSE_SINGLEQUOTE;
   for I:=1 to Length(Value) do
      begin
      case Value[I] of
         #0..#31:
            Result:=Result+PARSE_SINGLEQUOTE+'+#'+IntToStr(Ord(Value[I]))+'+'+PARSE_SINGLEQUOTE;
         PARSE_SINGLEQUOTE:
            Result:=Result+PARSE_SINGLEQUOTE+PARSE_SINGLEQUOTE;
         else
            Result:=Result+Value[I];
         end;
      end;
   Result:=Result+PARSE_SINGLEQUOTE;
end;

function ConvertSlashes(const Value: string): string;
begin
   Result:=StringReplace(Value,OSForwardSlash,OSBackSlash,[rfReplaceAll]);
end;

function ExtractFileRoot(const Value: string; const Ext: string): string;
var
   ExtensionPos: Integer;
   BackSlashPos: Integer;
begin
   Result:=Value;
   ExtensionPos:=Rat(OSExtSeparator,Result);
   BackSlashPos:=Rat(OSBackSlash,Result);
   if (ExtensionPos > 0) and (BackSlashPos < ExtensionPos) and
      ((Ext='') or ((Ext <> '') and (OSCompareFileNames(Substr(Result,ExtensionPos,Length(Result)),Ext)=0))) then
      Result:=GetLeft(Result,ExtensionPos-1);
end;

function RemoveDriveRoot(const Value: string): string;
begin
   Result:=Value;
   if At(OSColon,Result) > 0 then
      begin
      if At(OSColon+OSBackSlash,Result) > 0 then
         Result:=SubStr(Result,At(OSColon+OSBackSlash,Result)+2,Length(Result)-
                        At(OSColon+OSBackSlash,Result)+1)
      else
         Result:=SubStr(Result,At(OSColon,Result)+1,Length(Result)-At(OSColon,Result));
      end
   else
      if At(OSBackSlash,Result) > 0 then
         Result:=SubStr(Result,At(OSBackSlash,Result)+1,Length(Result)-At(OSBackSlash,Result));
end;

function EnsureFileExt(const Value: string; const OldExt: string;
                       const NewExt: string): string;
begin
   if (OSCompareFileNames(ExtractFileExt(Trim(Value)),OldExt)=0) then
      Result:=ChangeFileExt(Trim(Value),NewExt)
   else
      Result:=Trim(Value)+NewExt;
end;

function AddBS(const PathName: string): string;
begin
   Result:=Trim(PathName);
   if (Result <> '') and (Substr(Result,Length(Result),1) <> OSBackSlash) then
      Result:=Result+OSBackSlash;
end;

function RemoveBS(const PathName: string): string;
begin
   Result:=Trim(PathName);
   if (Substr(Result,Length(Result),1)=OSBackSlash) then
      Result:=Substr(Result,1,Length(Result)-1);
end;

function RemoveLeadingBS(const PathName: string): string;
begin
   Result:=Trim(PathName);
   if (Substr(Result,1,1)=OSBackSlash) then
      Result:=Substr(Result,2,Length(Result)-1);
end;

function RemoveAllBS(const PathName: string): string;
begin
   Result:=RemoveAllLeadingBS(PathName);
   Result:=RemoveAllTrailingBS(Result);
end;

function RemoveAllLeadingBS(const PathName: string): string;
begin
   Result:=RemoveLeadingBS(PathName);
   while (Substr(Result,1,1)=OSBackSlash) do
      Result:=RemoveLeadingBS(Result);
end;

function RemoveAllTrailingBS(const PathName: string): string;
begin
   Result:=RemoveBS(PathName);
   while (Substr(Result,Length(Result),1)=OSBackSlash) do
      Result:=RemoveBS(Result);
end;

function RemoveLastDir(const Value: string): string;
var
   BackSlashPos: Integer;
begin
   Result:=Value;
   BackSlashPos:=Rat(OSBackSlash,Result);
   if (BackSlashPos > 0) then
      Result:=GetLeft(Result,BackSlashPos-1);
end;

function AddFS(const PathName: string): string;
begin
   Result:=Trim(PathName);
   if (Result <> '') and (Substr(Result,Length(Result),1) <> OSForwardSlash) then
      Result:=Result+OSForwardSlash;
end;

function RemoveFS(const PathName: string): string;
begin
   Result:=Trim(PathName);
   if (Substr(Result,Length(Result),1)=OSForwardSlash) then
      Result:=Substr(Result,1,Length(Result)-1);
end;

function ContainsDirectory(const Value: string): Boolean;
begin
   Result:=((At(OSColon,Value) <> 0) or (At(OSBackSlash,Value) <> 0) or
            ((At(OSExtSeparator,Value) <> 0) and
             (Substr(Value,(At(OSExtSeparator,Value)+1),1)=
              OSBackSlash)));
end;

function MemoryDirectory(const Value: string): Boolean;
begin
   Result:=(AnsiCompareText(RemoveAllBS(Value),INMEMORY_DATABASE_NAME)=0);
end;


function StripFilePathAndExtension(const Value: string; const Ext: string): string;
begin
   Result:=ExtractFileRoot(ExtractFileName(Value),Ext);
end;

function Escape(const Value: string): string;
begin
   Result:=StringReplace(Value,PARSE_BACKSLASH,PARSE_BACKSLASH+PARSE_BACKSLASH,
                         [rfReplaceAll]);
end;

function MatchString(const Value: string; const PatternValue: string;
                     LikeSyntax: Boolean; const EscapeCharacter: string;
                     CaseSensitive: Boolean): Boolean;

   function MatchCompare(const FirstValue: string; const SecondValue: string): Integer;
   begin
      if CaseSensitive then
         Result:=AnsiCompareStr(FirstValue,SecondValue)
      else
         Result:=AnsiCompareText(FirstValue,SecondValue);
   end;

   function MatchPattern(const Value: string; const Pattern: string): Boolean;
   begin
      if ((not LikeSyntax) and (Pattern=PARSE_ASTERISK)) or
         (LikeSyntax and (Pattern=PARSE_WILD_MULTIPLE)) then
         Result:=True
      else if (Value='') and (Pattern <> '') then
         Result:=False
      else if (Value='') then
         Result:=True
      else
         begin
         if (Substr(Pattern,1,1)=EscapeCharacter) and (Length(Pattern) > 1) then
            begin
            if (MatchCompare(Substr(Value,1,1),Substr(Pattern,2,1))=0) then
               Result:=MatchPattern(Substr(Value,2,Length(Value)),
                                    Substr(Pattern,3,Length(Pattern)))
            else
               Result:=False;
            end
         else if ((not LikeSyntax) and (Substr(Pattern,1,1)=PARSE_ASTERISK)) or
                  (LikeSyntax and (Substr(Pattern,1,1)=PARSE_WILD_MULTIPLE)) then
            begin
            if MatchPattern(Value,Substr(Pattern,2,Length(Pattern))) then
               Result:=True
            else
               Result:=MatchPattern(Substr(Value,2,Length(Value)),Pattern);
            end
         else if (LikeSyntax and (Substr(Pattern,1,1)=PARSE_WILD_SINGLE)) then
            Result:=MatchPattern(Substr(Value,2,Length(Value)),
                                 Substr(Pattern,2,Length(Pattern)))
         else
            begin
            if (MatchCompare(Substr(Value,1,1),Substr(Pattern,1,1))=0) then
               Result:=MatchPattern(Substr(Value,2,Length(Value)),
                                    Substr(Pattern,2,Length(Pattern)))
            else
               Result:=False;
            end;
         end;
   end;

begin
   Result:=MatchPattern(Value,PatternValue);
end;

function WrapIncInteger(Value: Integer): Integer;
begin
   { Wrap around to 1 if at the last number }
   if (Value=High(Integer)) then
      Result:=0
   else
      Result:=Value;
   Inc(Result);
end;

procedure FlipFloatBits(Value: double; Buffer: PChar);
var
   NumberBytes: array [0..7] of Byte absolute Value;
   I: Byte;
begin
   if (Value < 0) then
      begin
      for I:=0 to 7 do
         (Buffer+(7-I))^:=AnsiChar(NumberBytes[I] xor $FF);
      end
   else
      begin
      Buffer^:=AnsiChar((NumberBytes[7] or $80));
      for I:=0 to 6 do
         (Buffer+(7-I))^:=AnsiChar(NumberBytes[I]);
      end;
end;

procedure FlipIntegerBits(Value: Integer; Buffer: PChar);
var
   NumberBytes: array [0..3] of Byte absolute Value;
   I: Byte;
begin
   for I:=0 to 3 do
      (Buffer+(3-I))^:=AnsiChar(NumberBytes[I]);
   if ((Byte(Buffer^) and 128) > 0) then
      Buffer^:=AnsiChar(Byte(Buffer^) xor 128)
   else
      Buffer^:=AnsiChar(Byte(Buffer^) or 128);
end;

procedure FlipLargeIntBits(Value: Int64; Buffer: PChar);
var
   NumberBytes: array [0..7] of Byte absolute Value;
   I: Byte;
begin
   for I:=0 to 7 do
      (Buffer+(7-I))^:=Chr(NumberBytes[I]);
   if ((Byte(Buffer^) and 128) > 0) then
      Buffer^:=Chr(Byte(Buffer^) xor 128)
   else
      Buffer^:=Chr(Byte(Buffer^) or 128);
end;

function FlipIntegerSign(Value: Integer): Integer;
begin
   Result:=(Value-(Value*2));
end;

function FlipCurrencySign(Value: Currency): Currency;
begin
   Result:=(Value-(Value*2));
end;

procedure FlipCurrencyBits(Value: Currency; Buffer: PChar);
var
   NumberBytes: array [0..7] of Byte absolute Value;
   I: Byte;
begin
   for I:=0 to 7 do
      (Buffer+(7-I))^:=Chr(NumberBytes[I]);
   if ((Byte(Buffer^) and 128) > 0) then
      Buffer^:=Chr(Byte(Buffer^) xor 128)
   else
      Buffer^:=Chr(Byte(Buffer^) or 128);
end;

procedure FlipSmallIntBits(Value: SmallInt; Buffer: PChar);
var
   NumberBytes: array [0..1] of Byte absolute Value;
   I: Byte;
begin
   for I:=0 to 1 do
      (Buffer+(1-I))^:=Chr(NumberBytes[I]);
   if ((Byte(Buffer^) and 128) > 0) then
      Buffer^:=Chr(Byte(Buffer^) xor 128)
   else
      Buffer^:=Chr(Byte(Buffer^) or 128);
end;

procedure FlipWordBits(Value: Word; Buffer: PChar);
var
   NumberBytes: array [0..1] of Byte absolute Value;
   I: Byte;
begin
   for I:=0 to 1 do
      (Buffer+(1-I))^:=Chr(NumberBytes[I]);
end;

function IsAlpha(Value: Char): Boolean;
begin
   Result:=(Value in ['_','A'..'Z','a'..'z',#128..#254]);
end;

function IsNumeric(Value: Char): Boolean;
begin
   Result:=(Value in ['0'..'9']);
end;

function IsAlphaNumeric(Value: Char): Boolean;
begin
   Result:=(IsAlpha(Value) or IsNumeric(Value));
end;

function IsNonLeading(Value: Char): Boolean;
begin
   Result:=(Value in ['!','@','$']);
end;

function IsSpace(Value: Char): Boolean;
begin
   Result:=(Value in ['\','/',':',';','`','=','*',
                      '+','-','.',',','<','>']);
end;

function CompareTStrings(LocaleID: Integer;
                         Value1: TStrings; Value2: TStrings): Boolean;
var
   I: Integer;
begin
   Result:=True;
   if ((Value1=nil) and (Value2 <> nil)) or
      ((Value1 <> nil) and (Value2=nil)) then
      Result:=False
   else if (Value1.Count <> Value2.Count) then
      Result:=False
   else
      begin
      for I:=0 to Value1.Count-1 do
         begin
         if (OSCompareStrings(LocaleID,PChar(Value1[I]),PChar(Value2[I]),0,True) <> 0) then
            begin
            Result:=False;
            Break;
            end;
         end;
      end;
end;

function RemoveFromTStrings(const Value: string; Strings: TStrings): Boolean;
var
   DeletePos: Integer;
begin
   Result:=False;
   DeletePos:=Strings.IndexOf(Value);
   if (DeletePos <> -1) then
      begin
      Strings.Delete(DeletePos);
      Result:=True;
      end;
end;

procedure V123EncryptBuffer(var Buffer; NumBytes: Integer;
                              Key1: Byte; Key2: Byte);
begin
  asm
     PUSH     EDI
     PUSH     EBX
     XOR      ECX,ECX
     MOV      ECX,NumBytes
     JCXZ     @@Done
     XOR      EBX,EBX
     MOV      BL,Key1
     MOV      BH,Key2
     MOV      EDI,Buffer
   @@Loop1:
     XOR       EAX,EAX
     MOV       AL,[EDI]
     XOR       AL,BL
     XOR       AL,BH
     MOV       [EDI],AL
     INC       BL
     DEC       BH
     INC       EDI
     LOOP      @@Loop1
   @@Done:
     POP       EBX
     POP       EDI
  end;
end;

procedure V123DecryptBuffer(var Buffer; NumBytes: Integer;
                              Key1: Byte; Key2: Byte);
begin
  asm
     PUSH     EDI
     PUSH     EBX
     XOR      ECX,ECX
     MOV      ECX,NumBytes
     JCXZ     @@Done
     XOR      EBX,EBX
     MOV      BL,Key1
     MOV      BH,Key2
     MOV      EDI,Buffer
   @@Loop1:
     XOR      EAX,EAX
     MOV      AL,[EDI]
     XOR      AL,BH
     XOR      AL,BL
     MOV      [EDI],AL
     INC      BL
     DEC      BH
     INC      EDI
     LOOP     @@Loop1
   @@Done:
     POP      EBX
     POP      EDI
  end;
end;

function FloatToComp(Value: double; Decimals: Byte): Comp;
var
   TempString: string;
   DecPos: Byte;
   DigitsToPad: Byte;
begin
   try
      TempString:=FormatFloat(MakeBCDDisplayFormat(Decimals),
                              RoundFloat(Value,Decimals));
   except
      TempString:='0';
   end;
   DecPos:=At(DecimalSeparator,TempString);
   if (DecPos > 0) then
      begin
      DigitsToPad:=(Decimals-(Length(TempString)-DecPos));
      Delete(TempString,DecPos,1);
      TempString:=PadRight(TempString,Length(TempString)+DigitsToPad,'0');
      end
   else
      begin
      DigitsToPad:=Decimals;
      TempString:=PadRight(TempString,Length(TempString)+DigitsToPad,'0');
      end;
   TempString:=TempString+IntToStr(Decimals);
   Result:=StrToFloat(TempString);
end;

function CompToFloat(Value: Comp): double;
var
   TempString: string;
   DecPos: Byte;
   Decimals: Byte;
   IsNegative: Boolean;
begin
   IsNegative:=False;
   try
      TempString:=FloatToStr(Value);
   except
      TempString:='04';
   end;
   if (Substr(TempString,1,1)=ANSI_NEGATIVE_SIGN) then
      begin
      IsNegative:=True;
      TempString:=Substr(TempString,2,Length(TempString)-1);
      end;
   Decimals:=Byte(StrToInt(Substr(TempString,Length(TempString),1)));
   Delete(TempString,Length(TempString),1);
   if (Length(TempString) < Decimals) then
      TempString:=PadLeft(TempString,Decimals,'0');
   DecPos:=(Length(TempString)-(Decimals-1));
   Insert(DecimalSeparator,TempString,DecPos);
   if (DecPos=1) then
      TempString:=PadLeft(TempString,Length(TempString)+1,'0');
   if IsNegative then
      TempString:=ANSI_NEGATIVE_SIGN+TempString;
   Result:=StrToFloat(TempString);
end;

function MakeBCDDisplayFormat(NumDecimals: Word): string;
begin
   Result:='##############0';
   if (NumDecimals > 0) then
      Result:=Result+ANSI_DECIMAL_SEPARATOR+Replicate('0',NumDecimals);
end;

function TruncateFloat(Value: Extended; Decimals: Byte): Extended;
begin
   if (Value <> 0) then
      begin
      if (Decimals > 20) then
         Decimals:=20;
      if (Decimals > 0) then
         Result:=Trunc((Value*PowerFloat(10,Decimals)))/PowerFloat(10,Decimals)
      else
         Result:=Trunc(Value);
      end
   else
      Result:=0;
end;

function RoundFloat(Value: Extended; Decimals: Byte): Extended;
begin
   if (Value <> 0) then
      begin
      if (Decimals > 20) then
         Decimals:=20;
      if (Value > 0) then
         begin
         if (Decimals > 0) then
            Result:=FloorFloat(((Value/PowerFloat(0.1,Decimals))+0.5),Decimals)*
                                 PowerFloat(0.1,Decimals)
         else
            Result:=FloorFloat(Value+0.5,0);
         end
      else
         begin
         if (Decimals > 0) then
            Result:=FloorFloat(((Value/PowerFloat(0.1,Decimals))-0.5),Decimals)*
                                 PowerFloat(0.1,Decimals)
         else
            Result:=FloorFloat(Value-0.5,0);
         end;
      end
   else
      Result:=0;
end;

function FloorFloat(X: Extended; Decimals: Byte): Extended;
begin
   Result:=Int(X);
end;

function PowerFloat(X: Extended; Y: Byte): Extended;
var
   Temp: Extended;
   I: Integer;
begin
   if (Y=0) then
      Result:=1
   else
      begin
      if (X=0) or (Y=1) then
         Result:=X
      else
         begin
         Temp:=1;
         for I:=1 to Abs(Y) do
            Temp:=Temp*X;
         if (Y > 0) then
            Result:=Temp
         else
            Result:=(1/Temp);
         end;
      end;
end;

function CurrToComp(Value: Currency; Decimals: Byte): Comp;
var
   TempString: string;
   DecPos: Byte;
   DigitsToPad: Integer;
begin
   try
      TempString:=FormatCurr(MakeBCDDisplayFormat(Decimals),
                             RoundCurr(Value,Decimals));
   except
      TempString:='0';
   end;
   DecPos:=At(DecimalSeparator,TempString);
   if (DecPos > 0) then
      begin
      DigitsToPad:=(Decimals-(Length(TempString)-DecPos));
      Delete(TempString,DecPos,1);
      TempString:=PadRight(TempString,Length(TempString)+DigitsToPad,'0');
      end
   else
      begin
      DigitsToPad:=Decimals;
      TempString:=PadRight(TempString,Length(TempString)+DigitsToPad,'0');
      end;
   TempString:=TempString+IntToStr(Decimals);
   Result:=StrToFloat(TempString);
end;

function CompToCurr(Value: Comp): Currency;
var
   TempString: string;
   DecPos: Byte;
   Decimals: Byte;
   IsNegative: Boolean;
begin
   IsNegative:=False;
   try
      TempString:=FloatToStr(Value);
   except
      TempString:='04';
   end;
   if (Substr(TempString,1,1)=ANSI_NEGATIVE_SIGN) then
      begin
      IsNegative:=True;
      TempString:=Substr(TempString,2,Length(TempString)-1);
      end;
   Decimals:=Byte(StrToInt(Substr(TempString,Length(TempString),1)));
   Delete(TempString,Length(TempString),1);
   if (Length(TempString) < Decimals) then
      TempString:=PadLeft(TempString,Decimals,'0');
   DecPos:=(Length(TempString)-(Decimals-1));
   Insert(DecimalSeparator,TempString,DecPos);
   if (DecPos=1) then
      TempString:=PadLeft(TempString,Length(TempString)+1,'0');
   if IsNegative then
      TempString:=ANSI_NEGATIVE_SIGN+TempString;
   Result:=StrToCurr(TempString);
end;

function CurrToTBCD(Value: Currency; Decimals: Byte): TBCD;
begin
   CurrToBCD(Value,Result,32,Decimals);
end;

function TBCDToCurr(Value: TBCD): Currency;
begin
   if (Value.Precision=0) then
      Result:=0
   else
      BCDToCurr(Value,Result);
end;

function TruncateCurr(Value: Currency; Decimals: Byte): Currency;
begin
   if (Value <> 0) then
      begin
      if (Decimals > 4) then
         Decimals:=4;
      if (Decimals > 0) then
         Result:=Trunc((Value*PowerCurr(10,Decimals)))/PowerCurr(10,Decimals)
      else
         Result:=Trunc(Value);
      end
   else
      Result:=0;
end;

function RoundCurr(Value: Currency; Decimals: Byte): Currency;
begin
   if (Value <> 0) then
      begin
      if (Decimals > 4) then
         Decimals:=4;
      if (Value > 0) then
         begin
         if (Decimals > 0) then
            Result:=FloorCurr(((Value/PowerCurr(0.1,Decimals))+0.5))*
                                PowerCurr(0.1,Decimals)
         else
            Result:=FloorCurr(Value+0.5);
         end
      else
         begin
         if (Decimals > 0) then
            Result:=FloorCurr(((Value/PowerCurr(0.1,Decimals))-0.5))*
                                PowerCurr(0.1,Decimals)
         else
            Result:=FloorCurr(Value-0.5);
         end;
      end
   else
      Result:=0;
end;

function FloorCurr(X: Currency): Currency;
begin
   Result:=Int(X);
end;

function PowerCurr(X: Currency; Y: Byte): Currency;
var
   Temp: Currency;
   I: Integer;
begin
   if (Y=0) then
      Result:=1
   else
      begin
      if (X=0) or (Y=1) then
         Result:=X
      else
         begin
         Temp:=1;
         for I:=1 to Abs(Y) do
            Temp:=Temp*X;
         if (Y > 0) then
            Result:=Temp
         else
            Result:=(1/Temp);
         end;
      end;
end;

function WithinBounds(Value: Int64; LowBound: Int64; HighBound: Int64): Boolean;
begin
   if (Value >= LowBound) and (Value <= HighBound) then
      Result:=True
   else
      Result:=False;
end;

function IsAChar(const Value: string): Boolean;
var
   TempInteger: Integer;
begin
   Result:=True;
   try
      TempInteger:=StrToInt(Value);
      if (TempInteger < -127) or
         (TempInteger > 127) then
         Result:=False;
   except
      Result:=False;
   end;
end;

function IsAByte(const Value: string): Boolean;
var
   TempInteger: Integer;
begin
   Result:=True;
   try
      TempInteger:=StrToInt(Value);
      if (TempInteger < Low(Byte)) or
         (TempInteger > High(Byte)) then
         Result:=False;
   except
      Result:=False;
   end;
end;

function IsAWord(const Value: string): Boolean;
var
   TempInteger: Integer;
begin
   Result:=True;
   try
      TempInteger:=StrToInt(Value);
      if (TempInteger < Low(Word)) or
         (TempInteger > High(Word)) then
         Result:=False;
   except
      Result:=False;
   end;
end;

function IsAnInteger(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToInt(Value);
   except
      Result:=False;
   end;
end;

function IsASmallInt(const Value: string): Boolean;
var
   TempInteger: Integer;
begin
   Result:=True;
   try
      TempInteger:=StrToInt(Value);
      if (TempInteger < Low(SmallInt)) or
         (TempInteger > High(SmallInt)) then
         Result:=False;
   except
      Result:=False;
   end;
end;

function IsALargeInt(const Value: string): Boolean;
var
   TempLargeInt: Int64;
begin
   Result:=True;
   try
      TempLargeInt:=StrToInt64(Value);
      if (TempLargeInt < Low(Int64)) or
         (TempLargeInt > High(Int64)) then
         Result:=False;
   except
      Result:=False;
   end;
end;

function IsABoolean(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToAnsiBoolean(Value);
   except
      Result:=False;
   end;
end;

function IsAFloat(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToAnsiFloat(Value);
   except
      Result:=False;
   end;
end;

function IsABCD(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToAnsiCurr(Value);
   except
      Result:=False;
   end;
end;

function IsADate(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToAnsiDate(Value);
   except
      Result:=False;
   end;
end;

function IsADateTime(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToAnsiDateTime(Value);
   except
      Result:=False;
   end;
end;

function IsATime(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToAnsiTime(Value);
   except
      Result:=False;
   end;
end;

function IsADateNonAnsi(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToDate(Value);
   except
      Result:=False;
   end;
end;

function IsADateTimeNonAnsi(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToDateTime(Value);
   except
      Result:=False;
   end;
end;

function IsATimeNonAnsi(const Value: string): Boolean;
begin
   Result:=True;
   try
      StrToTime(Value);
   except
      Result:=False;
   end;
end;

procedure CopyList(SourceList: TList; DestList: TList);
begin
   DestList.Clear;
   DestList.Capacity:=SourceList.Capacity;
   DestList.Count:=SourceList.Count;
   Move(SourceList.List^,DestList.List^,(SourceList.Capacity*SizeOf(Pointer)));
end;

function GetDuplicateCount(PreviousKeyPtr: PChar;
                           NextKeyPtr: PChar;
                           CompareLength: Word): Byte;
var
   I: Word;
begin
   I:=1;
   Result:=0;
   while (I <= CompareLength) and (I < High(Byte)) and
         (PreviousKeyPtr^=NextKeyPtr^) do
      begin
      Inc(PreviousKeyPtr);
      Inc(NextKeyPtr);
      Inc(I);
      Inc(Result);
      end;
end;

function GetTrailingCount(NextKeyPtr: PChar; CompareLength: Word): Byte;
var
   I: Word;
begin
   Result:=0;
   I:=1;
   while (I <= CompareLength) and (I < High(Byte)) and
         (NextKeyPtr^=#0) do
      begin
      Dec(NextKeyPtr);
      Inc(I);
      Inc(Result);
      end;
end;

procedure FillTrail(NextKeyPtr: PChar; FillCount: Byte);
begin
   FillChar(NextKeyPtr^,FillCount,#0);
end;

function MaximumInteger(FirstInteger: Integer; SecondInteger: Integer): Integer;
begin
   Result:=SecondInteger;
   if (FirstInteger > SecondInteger) then
      Result:=FirstInteger;
end;

function MinimumInteger(FirstInteger: Integer; SecondInteger: Integer): Integer;
begin
   Result:=SecondInteger;
   if (FirstInteger < SecondInteger) then
      Result:=FirstInteger;
end;

function MaximumLargeInt(FirstLargeInt: Int64; SecondLargeInt: Int64): Int64;
begin
   Result:=SecondLargeInt;
   if (FirstLargeInt > SecondLargeInt) then
      Result:=FirstLargeInt;
end;

function MinimumLargeInt(FirstLargeInt: Int64; SecondLargeInt: Int64): Int64;
begin
   Result:=SecondLargeInt;
   if (FirstLargeInt < SecondLargeInt) then
      Result:=FirstLargeInt;
end;

function MaximumWord(FirstWord: Word; SecondWord: Word): Word;
begin
   Result:=SecondWord;
   if (FirstWord > SecondWord) then
      Result:=FirstWord;
end;

function MinimumWord(FirstWord: Word; SecondWord: Word): Word;
begin
   Result:=SecondWord;
   if (FirstWord < SecondWord) then
      Result:=FirstWord;
end;

function MaximumSmallInt(FirstSmallInt: SmallInt; SecondSmallInt: SmallInt): SmallInt;
begin
   Result:=SecondSmallInt;
   if (FirstSmallInt > SecondSmallInt) then
      Result:=FirstSmallInt;
end;

function MinimumSmallInt(FirstSmallInt: SmallInt; SecondSmallInt: SmallInt): SmallInt;
begin
   Result:=SecondSmallInt;
   if (FirstSmallInt < SecondSmallInt) then
      Result:=FirstSmallInt;
end;

function MaximumBCD(FirstBCD: Currency; SecondBCD: Currency): Currency;
begin
   Result:=SecondBCD;
   if (FirstBCD > SecondBCD) then
      Result:=FirstBCD;
end;

function MinimumBCD(FirstBCD: Currency; SecondBCD: Currency): Currency;
begin
   Result:=SecondBCD;
   if (FirstBCD < SecondBCD) then
      Result:=FirstBCD;
end;

function MaximumFloat(FirstFloat: Extended; SecondFloat: Extended): Extended;
begin
   Result:=SecondFloat;
   if (FirstFloat > SecondFloat) then
      Result:=FirstFloat;
end;

function MinimumFloat(FirstFloat: Extended; SecondFloat: Extended): Extended;
begin
   Result:=SecondFloat;
   if (FirstFloat < SecondFloat) then
      Result:=FirstFloat;
end;

function MaximumComp(FirstComp: comp; SecondComp: comp): comp;
begin
   Result:=SecondComp;
   if (FirstComp > SecondComp) then
      Result:=FirstComp;
end;

function MinimumComp(FirstComp: comp; SecondComp: comp): comp;
begin
   Result:=SecondComp;
   if (FirstComp < SecondComp) then
      Result:=FirstComp;
end;

function MaximumByte(FirstByte: Byte; SecondByte: Byte): Byte;
begin
   Result:=SecondByte;
   if (FirstByte > SecondByte) then
      Result:=FirstByte;
end;

function MinimumByte(FirstByte: Byte; SecondByte: Byte): Byte;
begin
   Result:=SecondByte;
   if (FirstByte < SecondByte) then
      Result:=FirstByte;
end;

{ Thanks to Kunikazu Okada for this code to handle MBCSs }

procedure MBCSInc(LocaleID: Integer; var CurPtr: PChar);
begin
   if (LocaleID <> LOCALE_ANSI_STD) then
      begin
      if (StrByteType(CurPtr,0)=mbLeadByte) then
         Inc(CurPtr);
      if (CurPtr^=#0) then
         Exit;
      end;
   Inc(CurPtr);
end;

function CompareMBCSChar(LocaleID: Word;
                         FirstChar: PChar; SecondChar: PChar): Integer;
begin
   Result:=OSCompareCharNoAccent(LocaleID,FirstChar^,SecondChar^);
   if (LocaleID <> LOCALE_ANSI_STD) and (Result=CMP_EQUAL) then
      begin
      if (StrByteType(FirstChar,0)=mbLeadByte) then
         begin
         Inc(FirstChar);
         Inc(SecondChar);
         if (FirstChar^=#0) and (SecondChar^=#0) then
            Result:=CMP_EQUAL
         else if (FirstChar^=#0) and (SecondChar^ <> #0) then
            Result:=CMP_LESS
         else if (FirstChar^ <> #0) and (SecondChar^=#0) then
            Result:=CMP_GREATER
         else
            Result:=OSCompareCharNoAccent(LocaleID,FirstChar^,SecondChar^);
         end;
      end;
end;

function CompareChar(LocaleID: Integer;
                     FirstChar: Char; SecondChar: Char): Integer;
begin
   Result:=OSCompareCharNoAccent(LocaleID,FirstChar,SecondChar)
end;

function CompareBytes(FirstBuffer: PChar; SecondBuffer: PChar;
                      CompareLength: Word; Descending: Boolean): Integer;
var
   I: Word;
begin
   if (FirstBuffer=nil) then
      begin
      Result:=CMP_GREATER;
      Exit;
      end;
   I:=1;
   Result:=CMP_EQUAL;
   while (I <= CompareLength) and (SecondBuffer^=FirstBuffer^) do
      begin
      Inc(FirstBuffer);
      Inc(SecondBuffer);
      Inc(I);
      end;
   if (I <= CompareLength) then
      begin
      if Descending then
         begin
         if (FirstBuffer^ > SecondBuffer^) then
            Result:=CMP_LESS
         else
            Result:=CMP_GREATER;
         end
      else
         begin
         if (FirstBuffer^ > SecondBuffer^) then
            Result:=CMP_GREATER
         else
            Result:=CMP_LESS;
         end;
      end;
end;

function CopyDiskFile(const FromFileName: string;
                      const ToFileName: string): Integer;
var
   CopyBuffer: Pointer;
   BytesCopied: Longint;
   FromHandle: Integer;
   ToHandle: Integer;
begin
   Result:=DBISAM_NONE;
   CopyBuffer:=AllocMem(COPY_BUFFER_SIZE);
   try
      FromHandle:=OSFileOpen(FromFileName,True,True,False,False);
      if (FromHandle < 0) then
         begin
         Result:=FromHandle;
         Exit;
         end;
      try
         ToHandle:=OSFileCreate(ToFileName,False,False);
         if (ToHandle < 0) then
            begin
            Result:=ToHandle;
            Exit;
            end;
         try
            OSFileSeek(FromHandle,0,FROM_BOF);
            repeat
               BytesCopied:=OSFileRead(FromHandle,CopyBuffer^,COPY_BUFFER_SIZE);
               if (BytesCopied > 0) then
                  OSFileWrite(ToHandle,CopyBuffer^,BytesCopied);
            until (BytesCopied < COPY_BUFFER_SIZE);
         finally
            OSFileClose(ToHandle);
         end;
      finally
         OSFileClose(FromHandle);
      end;
   finally
      DeAllocMem(CopyBuffer);
   end;
end;

function AppendDiskFile(const FromFileName: string;
                        const ToFileName: string): Integer;
var
   CopyBuffer: Pointer;
   BytesCopied: Longint;
   FromHandle: Integer;
   ToHandle: Integer;
begin
   Result:=DBISAM_NONE;
   CopyBuffer:=AllocMem(COPY_BUFFER_SIZE);
   try
      FromHandle:=OSFileOpen(FromFileName,True,True,False,False);
      if (FromHandle < 0) then
         begin
         Result:=FromHandle;
         Exit;
         end;
      try
         if OSFileExists(ToFileName,False) then
            ToHandle:=OSFileOpen(ToFileName,False,True,False,False)
         else
            ToHandle:=OSFileCreate(ToFileName,False,False);
         if (ToHandle < 0) then
            begin
            Result:=ToHandle;
            Exit;
            end;
         try
            repeat
               BytesCopied:=OSFileRead(FromHandle,CopyBuffer^,COPY_BUFFER_SIZE);
               if (BytesCopied > 0) then
                  begin
                  OSFileSeek(ToHandle,0,FROM_EOF);
                  OSFileWrite(ToHandle,CopyBuffer^,BytesCopied);
                  end;
            until (BytesCopied < COPY_BUFFER_SIZE);
         finally
            OSFileClose(ToHandle);
         end;
      finally
         OSFileClose(FromHandle);
      end;
   finally
      DeAllocMem(CopyBuffer);
   end;
end;

{ OS-specific functionality }

function OSAllocCriticalSection: Pointer;
begin
   Result:=AllocMem(SizeOf(TRTLCriticalSection));
end;

procedure OSInitializeCriticalSection(Section: Pointer);
begin
   Windows.InitializeCriticalSection(TRTLCriticalSection(Section^));
end;

procedure OSEnterCriticalSection(Section: Pointer);
begin
   Windows.EnterCriticalSection(TRTLCriticalSection(Section^));
end;

procedure OSLeaveCriticalSection(Section: Pointer);
begin
   Windows.LeaveCriticalSection(TRTLCriticalSection(Section^));
end;

procedure OSDeleteCriticalSection(Section: Pointer);
begin
   Windows.DeleteCriticalSection(TRTLCriticalSection(Section^));
end;

procedure OSDeAllocCriticalSection(var Section: Pointer);
begin
   DeAllocMem(Section);
end;

function OSAllocEvent: Pointer;
begin
   Result:=Pointer(Windows.CreateEvent(nil,True,False,''));
end;

procedure OSSetEvent(Event: Pointer);
begin
   Windows.SetEvent(THandle(Event));
end;

procedure OSResetEvent(Event: Pointer);
begin
   Windows.ResetEvent(THandle(Event));
end;

function OSWaitForEvent(Event: Pointer; Timeout: LongWord): Integer;
begin
   case Windows.WaitForSingleObject(THandle(Event),Timeout) of
      WAIT_ABANDONED:
         Result:=ABANDONED;
      WAIT_OBJECT_0:
         Result:=SIGNALLED;
      WAIT_TIMEOUT:
         Result:=TIMEDOUT;
      else
         Result:=FAILED;
      end;
end;

procedure OSDeAllocEvent(var Event: Pointer);
begin
   Windows.CloseHandle(THandle(Event));
   Event:=nil;
end;

function OSLocaleID(LanguageID: Word; SortID: Word): Integer;
begin
   Result:=((Integer(SortID) shl 16) or Integer(LanguageID));
end;

function OSLanguageID(PrimaryLanguageID: Byte; SubLanguageID: Byte): Word;
begin
   Result:=((Word(SubLanguageID) shl 10) or Word(PrimaryLanguageID));
end;

function OSValidLocale(LocaleID: Integer): Boolean;
begin
   Result:=Windows.IsValidLocale(LocaleID,LCID_INSTALLED);
end;

function OSPrimaryLanguageID(LocaleID: Integer): Word;
begin
   Result:=(LongRec(LocaleID).Lo and $3FF);
end;

function OSSubLanguageID(LocaleID: Integer): Word;
begin
   Result:=(LongRec(LocaleID).Lo shr 10);
end;

function OSBackSlash: string;
begin
   Result:=PARSE_BACKSLASH;
end;

function OSForwardSlash: string;
begin
   Result:=PARSE_SLASH;
end;

function OSColon: string;
begin
   Result:=':';
end;

function OSExtSeparator: string;
begin
   Result:='.';
end;

function OSGetCurrentDirectory: string;
var
   TempBuffer: array [0..MAX_PATH] of Char;
begin
   FillChar(TempBuffer,SizeOf(TempBuffer),#0);
   Windows.GetCurrentDirectory(SizeOf(TempBuffer),@TempBuffer);
   Result:=StrPas(@TempBuffer);
end;

function OSGetTempDirectory: string;
var
   TempBuffer: array [0..MAX_PATH] of Char;
begin
   FillChar(TempBuffer,SizeOf(TempBuffer),#0);
   Windows.GetTempPath(SizeOf(TempBuffer),@TempBuffer);
   Result:=StrPas(@TempBuffer);
end;

function OSGetWindowsDirectory: string;
var
   TempBuffer: array [0..MAX_PATH] of Char;
begin
   FillChar(TempBuffer,SizeOf(TempBuffer),#0);
   Windows.GetWindowsDirectory(@TempBuffer,SizeOf(TempBuffer));
   Result:=StrPas(@TempBuffer);
end;

function OSGetSystemDirectory: string;
var
   TempBuffer: array [0..MAX_PATH] of Char;
begin
   FillChar(TempBuffer,SizeOf(TempBuffer),#0);
   Windows.GetSystemDirectory(@TempBuffer,SizeOf(TempBuffer));
   Result:=StrPas(@TempBuffer);
end;

function OSGetComputerName: string;
var
   TempBuffer: array [0..MAX_COMPUTERNAME_LENGTH] of Char;
   TempSize: DWORD;
begin
   FillChar(TempBuffer,SizeOf(TempBuffer),#0);
   TempSize:=SizeOf(TempBuffer);
   Windows.GetComputerName(@TempBuffer,TempSize);
   Result:=StrPas(@TempBuffer);
end;

function OSGetUserName: string;
var
   TempBuffer: array [0..High(Byte)] of Char;
   TempSize: DWORD;
begin
   FillChar(TempBuffer,SizeOf(TempBuffer),#0);
   TempSize:=SizeOf(TempBuffer);
   Windows.GetUserName(@TempBuffer,TempSize);
   Result:=StrPas(@TempBuffer);
end;

function OSGetProcessID: Integer;
begin
   Result:=Windows.GetCurrentProcessID;
end;

function OSGetThreadID: Integer;
begin
   Result:=Windows.GetCurrentThreadID;
end;

function OSFileAttr(const AttrFileName: string; IsHidden: Boolean): Integer;
var
   TempFileName: array [0..MAX_PATH] of Char;
   Attributes: Integer;
begin
   StrPCopy(@TempFileName,AttrFileName);
   Attributes:=Integer(Windows.GetFileAttributes(@TempFileName));
   if (Attributes <> -1) then
      begin
      if ((Attributes and FILE_ATTRIBUTE_READONLY)=FILE_ATTRIBUTE_READONLY) then
         Result:=ATTR_READONLY
      else
         Result:=ATTR_NORMAL;
      end
   else
      begin
      SetLastError(ERROR_FILE_NOT_FOUND);
      Result:=ATTR_ERROR;
      end;
end;

function OSFileAge(const AgeFileName: string; IsHidden: Boolean): Integer;
var
   Handle: THandle;
   FindData: TWin32FindData;
   LocalFileTime: TFileTime;
   TempFileName: array [0..MAX_PATH] of Char;
begin
   Handle:=Windows.FindFirstFile(StrPCopy(@TempFileName,AgeFileName),FindData);
   if (Handle <> INVALID_HANDLE_VALUE) then
      begin
      Windows.FindClose(Handle);
      if ((FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY)=0) then
         begin
         Windows.FileTimeToLocalFileTime(FindData.ftLastWriteTime,LocalFileTime);
         if Windows.FileTimeToDosDateTime(LocalFileTime,LongRec(Result).Hi,
                                          LongRec(Result).Lo) then
            Exit;
         end;
      end;
   Result:=-1;
end;

function OSFileExists(const ExistsFileName: string; IsHidden: Boolean): Boolean;
begin
   Result:=(OSFileAge(ExistsFileName,IsHidden) <> -1);
end;

function OSTempFileName(const TempDirectory: string; const Extension: string): string;
var
   I: Word;
   ThreadID: string;
begin
   Result:='';
   I:=0;
   ThreadID:=Substr(IntToStr(Abs(OSGetThreadID)),1,5);
   while OSFileExists(AddBS(TempDirectory)+ThreadID+IntToStr(I)+Extension,False) do
      Inc(I);
   Result:=AddBS(TempDirectory)+ThreadID+IntToStr(I)+Extension;
end;

function OSFileOpen(const OpenFileName: string;
                    IsReadOnly: Boolean; IsExclusive: Boolean;
                    IsTemporary: Boolean; IsHidden: Boolean): Integer;
var
   TempFileName: array [0..MAX_PATH] of Char;
   Flags: DWORD;
   AccessMode: LongWord;
   ShareMode: LongWord;
begin
   if IsReadOnly then
      AccessMode:=GENERIC_READ
   else
      AccessMode:=(GENERIC_READ or GENERIC_WRITE);
   if IsExclusive then
      ShareMode:=0
   else
      ShareMode:=(FILE_SHARE_READ or FILE_SHARE_WRITE);
   Flags:=0;
   if IsTemporary then
      Flags:=(Flags or FILE_ATTRIBUTE_TEMPORARY);
   if IsHidden then
      Flags:=(Flags or FILE_ATTRIBUTE_HIDDEN);
   if (Flags=0) then
      Flags:=FILE_ATTRIBUTE_NORMAL;
   Flags:=(Flags or FILE_FLAG_SEQUENTIAL_SCAN);
   Result:=Integer(Windows.CreateFile(StrPCopy(@TempFileName,OpenFileName),
                   AccessMode,ShareMode,nil,OPEN_EXISTING,Flags,0));
end;

function OSFileCreate(const CreateFileName: string;
                      IsTemporary: Boolean; IsHidden: Boolean): Integer;
var
   TempFileName: array [0..MAX_PATH] of Char;
   Flags: DWORD;
begin
   Flags:=0;
   if IsTemporary then
      Flags:=(Flags or FILE_ATTRIBUTE_TEMPORARY);
   if IsHidden then
      Flags:=(Flags or FILE_ATTRIBUTE_HIDDEN);
   if (Flags=0) then
      Flags:=FILE_ATTRIBUTE_NORMAL;
   Flags:=(Flags or FILE_FLAG_SEQUENTIAL_SCAN);
   Result:=Integer(Windows.CreateFile(StrPCopy(@TempFileName,CreateFileName),
                   (GENERIC_READ or GENERIC_WRITE),0,nil,CREATE_ALWAYS,Flags,0));
end;

function OSFileClose(Handle: Integer): Boolean;
begin
   Result:=CloseHandle(THandle(Handle));
end;

function OSFileDelete(const DeleteFileName: string): Boolean;
var
   TempFileName: array [0..MAX_PATH] of Char;
begin
   Result:=Windows.DeleteFile(StrPCopy(@TempFileName,DeleteFileName));
end;

function OSFileRename(const CurFileName: string; const NewFileName: string): Boolean;
var
   TempFileName1: array [0..MAX_PATH] of Char;
   TempFileName2: array [0..MAX_PATH] of Char;
begin
   Result:=Windows.MoveFile(StrPCopy(@TempFileName1,CurFileName),
                            StrPCopy(@TempFileName2,NewFileName));
end;

function OSFileLock(Handle: Integer; Offset: Int64; NumBytes: Int64): Boolean;
begin
   Result:=Windows.LockFile(THandle(Handle),Int64Rec(Offset).Lo,Int64Rec(Offset).Hi,
                            Int64Rec(NumBytes).Lo,Int64Rec(NumBytes).Hi);
end;

function OSFileUnlock(Handle: Integer; Offset: Int64; NumBytes: Int64): Boolean;
begin
   Result:=Windows.UnlockFile(THandle(Handle),Int64Rec(Offset).Lo,Int64Rec(Offset).Hi,
                               Int64Rec(NumBytes).Lo,Int64Rec(NumBytes).Hi);
end;

function OSFileSeek(Handle: Integer; Offset: Int64; Origin: Integer): Int64;
var
   HighOffset: Integer;
begin
   HighOffset:=Int64Rec(Offset).Hi;
   Int64Rec(Result).Lo:=Windows.SetFilePointer(THandle(Handle),Int64Rec(Offset).Lo,
                                               @HighOffset,Origin);
   Int64Rec(Result).Hi:=HighOffset;
end;

function OSFileRead(Handle: Integer; var Buffer; Count: Integer): Integer;
begin
   if (not Windows.ReadFile(THandle(Handle),Buffer,Count,LongWord(Result),nil)) then
      Result:=-1;
end;

function OSFileWrite(Handle: Integer; const Buffer; Count: Integer): Integer;
begin
   if (not Windows.WriteFile(THandle(Handle),Buffer,Count,LongWord(Result),nil)) then
      Result:=-1;
end;

function OSSetEndOfFile(Handle: Integer): Boolean;
begin
   Result:=Windows.SetEndOfFile(THandle(Handle));
end;

function OSFileFlush(Handle: Integer): Boolean;
begin
   Result:=Windows.FlushFileBuffers(THandle(Handle));
end;

procedure OSListFiles(FileList: TStrings; const DirMask: string;
                      IncludeExtensions: Boolean);
var
   SearchRec: TSearchRec;
   TempResult: Integer;
begin
   {$WARNINGS OFF}
   FileList.Clear;
   TempResult:=FindFirst(DirMask,(SysUtils.faReadOnly+faHidden),SearchRec);
   while (TempResult=0) do
      begin
      if IncludeExtensions then
         FileList.Add(SearchRec.Name)
      else
         FileList.Add(ExtractFileRoot(SearchRec.Name,''));
      TempResult:=FindNext(SearchRec);
      end;
   SysUtils.FindClose(SearchRec);
   {$WARNINGS ON}
end;

function OSSizeOfFile(const Value: string): Int64;
var
   SearchRec: TSearchRec;
   TempResult: Integer;
begin
   {$WARNINGS OFF}
   Result:=0;
   TempResult:=FindFirst(Value,(SysUtils.faReadOnly+faHidden),SearchRec);
   if (TempResult=0) then
      begin
      Int64Rec(Result).Lo:=SearchRec.FindData.nFileSizeLow;
      Int64Rec(Result).Hi:=SearchRec.FindData.nFileSizeHigh;
      end;
   SysUtils.FindClose(SearchRec);
   {$WARNINGS ON}
end;

function OSTimeStampOfFile(const Value: string): TDateTime;
var
   SearchRec: TSearchRec;
   TempResult: Integer;
begin
   {$WARNINGS OFF}
   Result:=0;
   TempResult:=FindFirst(Value,(SysUtils.faReadOnly+faHidden),SearchRec);
   if (TempResult=0) then
      Result:=FileDateToDateTime(SearchRec.Time);
   SysUtils.FindClose(SearchRec);
   {$WARNINGS ON}
end;

function OSLastNativeError: Word;
begin
   case OSLastError of
      ERROR_FILE_NOT_FOUND: Result:=DBISAM_OSENOENT;
      ERROR_PATH_NOT_FOUND: Result:=DBISAM_OSENOENT;
      ERROR_TOO_MANY_OPEN_FILES: Result:=DBISAM_OSEMFILE;
      ERROR_ACCESS_DENIED,ERROR_ALREADY_EXISTS: Result:=DBISAM_OSEACCES;
      ERROR_INVALID_HANDLE: Result:=DBISAM_OSEBADF;
      ERROR_OUTOFMEMORY,ERROR_NOT_ENOUGH_MEMORY: Result:=DBISAM_OSENOMEM;
      ERROR_INVALID_DRIVE: Result:=DBISAM_OSENODEV;
      ERROR_NOT_SAME_DEVICE: Result:=DBISAM_OSENOTSAM;
      ERROR_SHARING_VIOLATION,ERROR_NETWORK_ACCESS_DENIED: Result:=DBISAM_OSEACCES;
   else
      Result:=DBISAM_OSUNKNOWN;
   end;
end;

function OSLastError: Integer;
begin
   Result:=GetLastError;
end;

function OSLastSocketError: Integer;
begin
   Result:=WSAGetLastError;
end;

function OSCompareFileNames(FirstFile: string; SecondFile: string): Integer;
begin
   Result:=VerifyCompareResult(AnsiCompareText(FirstFile,SecondFile));
end;

function OSCompareChar(LocaleID: Integer;
                       FirstChar: Char; SecondChar: Char): Integer;
var
   TempFirstChar: array [0..1] of Char;
   TempSecondChar: array [0..1] of Char;   
begin
   if (LocaleID <> LOCALE_ANSI_STD) then
      Result:=(Windows.CompareString(LocaleID,SORT_STRINGSORT,
                                     @FirstChar,1,@SecondChar,1)-2)
   else
      begin
      TempFirstChar[0]:=FirstChar;
      TempFirstChar[1]:=#0;
      TempSecondChar[0]:=SecondChar;
      TempSecondChar[1]:=#0;
      Result:=CompareBytes(@TempFirstChar,@TempSecondChar,1,False);
      end;
end;

function OSCompareCharNoAccent(LocaleID: Integer;
                               FirstChar: Char; SecondChar: Char): Integer;
var
   TempFirstChar: array [0..1] of Char;
   TempSecondChar: array [0..1] of Char;
begin
   if (LocaleID <> LOCALE_ANSI_STD) then
      Result:=(Windows.CompareString(LocaleID,SORT_STRINGSORT+NORM_IGNORENONSPACE,
                                     @FirstChar,1,@SecondChar,1)-2)
   else
      begin
      TempFirstChar[0]:=FirstChar;
      TempFirstChar[1]:=#0;
      TempSecondChar[0]:=SecondChar;
      TempSecondChar[1]:=#0;
      Result:=CompareBytes(@TempFirstChar,@TempSecondChar,1,False);
      end;
end;

function OSCompareStrings(LocaleID: Integer;
                          FirstStringBuffer: PChar;
                          SecondStringBuffer: PChar;
                          PartialLength: Integer;
                          IsCaseInsensitive: Boolean): Integer;
var
   TempFirstString: PChar;
   TempSecondString: PChar;
begin
   if (LocaleID <> LOCALE_ANSI_STD) then
      begin
      if IsCaseInsensitive then
         begin
         if (PartialLength <> 0) then
            Result:=(Windows.CompareString(LocaleID,
                                           SORT_STRINGSORT+NORM_IGNORECASE+NORM_IGNORENONSPACE,
                                           FirstStringBuffer,PartialLength,
                                           SecondStringBuffer,PartialLength)-2)
         else
            Result:=(Windows.CompareString(LocaleID,
                                           SORT_STRINGSORT+NORM_IGNORECASE+NORM_IGNORENONSPACE,
                                           FirstStringBuffer,-1,
                                           SecondStringBuffer,-1)-2);
         end
      else
         begin
         if (PartialLength <> 0) then
            Result:=(Windows.CompareString(LocaleID,
                                           SORT_STRINGSORT+NORM_IGNORENONSPACE,
                                           FirstStringBuffer,PartialLength,
                                           SecondStringBuffer,PartialLength)-2)
         else
            Result:=(Windows.CompareString(LocaleID,
                                           SORT_STRINGSORT+NORM_IGNORENONSPACE,
                                           FirstStringBuffer,-1,
                                           SecondStringBuffer,-1)-2);
         end;
      end
   else
      begin
      if IsCaseInsensitive then
         begin
         TempFirstString:=AllocMem(StrLen(FirstStringBuffer)+1);
         TempSecondString:=AllocMem(StrLen(SecondStringBuffer)+1);
         try
            StrCopy(TempFirstString,FirstStringBuffer);
            OSUpperString(LocaleID,TempFirstString);
            StrCopy(TempSecondString,SecondStringBuffer);
            OSUpperString(LocaleID,TempSecondString);
            if (PartialLength <> 0) then
               Result:=CompareBytes(TempFirstString,TempSecondString,PartialLength,False)
            else
               Result:=CompareBytes(TempFirstString,TempSecondString,
                                    (StrLen(TempFirstString)+1),False);
         finally
            DeAllocMem(TempFirstString);
            DeAllocMem(TempSecondString);
         end;
         end
      else
         begin
         if (PartialLength <> 0) then
            Result:=CompareBytes(FirstStringBuffer,SecondStringBuffer,PartialLength,False)
         else
            Result:=CompareBytes(FirstStringBuffer,SecondStringBuffer,(StrLen(FirstStringBuffer)+1),False);
         end;
      end;
end;

procedure OSUpperString(LocaleID: Integer; StringBuffer: PChar);
var
   TempBuffer: PChar;
begin
   if DataEngine.IsWindows95 then
      begin
      if (LocaleID <> LOCALE_ANSI_STD) then
         begin
         TempBuffer:=AllocMem(StrLen(StringBuffer)+1);
         try
            Windows.LCMapString(LocaleID,LCMAP_UPPERCASE+LCMAP_LINGUISTIC_CASING,
                                StringBuffer,-1,
                                TempBuffer,StrLen(StringBuffer)+1);
            StrCopy(StringBuffer,TempBuffer);
         finally
            DeAllocMem(TempBuffer);
         end;
         end
      else
         AnsiStrUpper(StringBuffer);
      end
   else
      begin
      if (LocaleID <> LOCALE_ANSI_STD) then
         Windows.LCMapString(LocaleID,LCMAP_UPPERCASE+LCMAP_LINGUISTIC_CASING,
                             StringBuffer,-1,
                             StringBuffer,StrLen(StringBuffer)+1)
      else
         AnsiStrUpper(StringBuffer);
      end;
end;

procedure OSLowerString(LocaleID: Integer; StringBuffer: PChar);
var
   TempBuffer: PChar;
begin
   if DataEngine.IsWindows95 then
      begin
      if (LocaleID <> LOCALE_ANSI_STD) then
         begin
         TempBuffer:=AllocMem(StrLen(StringBuffer)+1);
         try
            Windows.LCMapString(LocaleID,LCMAP_LOWERCASE+LCMAP_LINGUISTIC_CASING,
                                StringBuffer,-1,
                                TempBuffer,StrLen(StringBuffer)+1);
            StrCopy(StringBuffer,TempBuffer);
         finally
            DeAllocMem(TempBuffer);
         end;
         end
      else
         AnsiStrLower(StringBuffer);
      end
   else
      begin
      if (LocaleID <> LOCALE_ANSI_STD) then
         Windows.LCMapString(LocaleID,LCMAP_LOWERCASE+LCMAP_LINGUISTIC_CASING,
                             StringBuffer,-1,
                             StringBuffer,StrLen(StringBuffer)+1)
      else
         AnsiStrLower(StringBuffer);
      end;
end;

function OSGetVersion: Currency;
var
   VersionInfo: TOSVersionInfo;
begin
   FillChar(VersionInfo,SizeOf(TOSVersionInfo),#0);
   VersionInfo.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
   Windows.GetVersionEx(VersionInfo);
   with VersionInfo do
      Result:=StrToCurr(IntToStr(dwMajorVersion)+DecimalSeparator+
                        IntToStr(dwMinorVersion));
end;

function OSGetPlatform: Integer;
var
   VersionInfo: TOSVersionInfo;
begin
   FillChar(VersionInfo,SizeOf(TOSVersionInfo),#0);
   VersionInfo.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
   Windows.GetVersionEx(VersionInfo);
   Result:=VersionInfo.dwPlatformID;
end;

function OSGetTickCount: LongWord;
begin
   Result:=Windows.GetTickCount;
end;

function OSCalcElapsedTime(BeginTicks: LongWord; EndTicks: LongWord): LongWord;
begin
   Result:=(EndTicks-BeginTicks);
end;

function OSUTCDateTime: TDateTime;
var
   TempSysTime: TSystemTime;
begin
   GetSystemTime(TempSysTime);
   Result:=SystemTimetoDateTime(TempSysTime);
end;

function OSCreateGUIDString: string;
var
   TempGUID: TGUID;
begin
   CreateGUID(TempGUID);
   Result:=GUIDToString(TempGUID);
end;


procedure ResizeBuffer(Value: Integer; var BufferToResize: PChar;
                       var ExistingSize: Integer;
                       ShrinkBuffer: Boolean=False);
begin
   if (Value > 0) then
      begin
      if (Value > ExistingSize) then
         begin
         if (ExistingSize=0) then
            BufferToResize:=AllocMem(Value)
         else
            begin
            ReAllocMem(BufferToResize,Value);
            FillChar((BufferToResize+ExistingSize)^,(Value-ExistingSize),#0);
            end;
         ExistingSize:=Value;
         end
      else if ShrinkBuffer and (Value < ExistingSize) then
         begin
         ReAllocMem(BufferToResize,Value);
         ExistingSize:=Value;
         end;
      end
   else
      begin
      if (ExistingSize > 0) then
         begin
         DeAllocMem(BufferToResize);
         ExistingSize:=0;
         end;
      end;
end;

function BlockOffset(Value: Integer; BlockSize: Integer): Integer;
begin
   Result:=Value;
   if ((Result mod BlockSize) <> 0) then
      Result:=((BlockSize*(Result div BlockSize))+BlockSize);
end;

function ConvertStringToDateTime(SourceBuffer: PChar;
                                  DestDataType: Byte): Boolean;
var
   TempString: string;
   TempDateTime: TDateTime;
   TempTimeStamp: TTimeStamp;
begin
   Result:=True;
   TempString:=StrPas(SourceBuffer);
   case DestDataType of
      TYPE_DATE:
         begin
         try
            TempDateTime:=StrToAnsiDate(TempString);
         except
            TempDateTime:=0;
            Result:=False;
         end;
         pInteger(SourceBuffer)^:=DateTimeToTimeStamp(TempDateTime).Date;
         end;
      TYPE_TIME:
         begin
         try
            TempDateTime:=StrToAnsiTime(TempString);
         except
            TempDateTime:=0;
            Result:=False;
         end;
         pInteger(SourceBuffer)^:=DateTimeToTimeStamp(TempDateTime).Time;
         end;
      TYPE_TIMESTAMP:
         begin
         try
            TempDateTime:=StrToAnsiDateTime(TempString);
         except
            TempDateTime:=0;
            Result:=False;
         end;
         TempTimeStamp:=DateTimeToTimeStamp(TempDateTime);
         pDouble(SourceBuffer)^:=TimeStampToMSecs(TempTimeStamp);
         end;
      end;
end;

function ConvertFormatToDateTime(SourceBuffer: PChar;
                                 DestDataType: Byte;
                                 const DateFormat: string;
                                 const TimeFormat: string): Boolean;
var
   TempString: string;
   TempDateTime: TDateTime;
   TempTimeStamp: TTimeStamp;
begin
   Result:=True;
   TempString:=StrPas(SourceBuffer);
   case DestDataType of
      TYPE_DATE:
         begin
         try
            TempDateTime:=FormatStrToDate(TempString,DateFormat);
         except
            TempDateTime:=0;
            Result:=False;
         end;
         pInteger(SourceBuffer)^:=DateTimeToTimeStamp(TempDateTime).Date;
         end;
      TYPE_TIME:
         begin
         try
            TempDateTime:=FormatStrToTime(TempString,TimeFormat);
         except
            TempDateTime:=0;
            Result:=False;
         end;
         pInteger(SourceBuffer)^:=DateTimeToTimeStamp(TempDateTime).Time;
         end;
      TYPE_TIMESTAMP:
         begin
         try
            TempDateTime:=FormatStrToDateTime(TempString,DateFormat,
                                              TimeFormat);
         except
            TempDateTime:=0;
            Result:=False;
         end;
         TempTimeStamp:=DateTimeToTimeStamp(TempDateTime);
         pDouble(SourceBuffer)^:=TimeStampToMSecs(TempTimeStamp);
         end;
      end;
end;

function ConvertDateTimeToFormat(SourceBuffer: PChar;
                                 SourceDataType: Byte;
                                 const DateFormat: string;
                                 const TimeFormat: string): Boolean;
var
   TempString: string;
   TempDateTime: TDateTime;
   TempTimeStamp: TTimeStamp;
begin
   Result:=True;
   case SourceDataType of
      TYPE_DATE:
         begin
         TempTimeStamp.Date:=pInteger(SourceBuffer)^;
         TempTimeStamp.Time:=0;
         try
            TempDateTime:=TimeStampToDateTime(TempTimeStamp);
            TempString:=FormatDateTime(DateFormat,TempDateTime);
         except
            Result:=False;
            TempString:='';
         end;
         StrPCopy(SourceBuffer,TempString);
         end;
      TYPE_TIME:
         begin
         TempTimeStamp.Date:=1;
         TempTimeStamp.Time:=pInteger(SourceBuffer)^;
         try
            TempDateTime:=TimeStampToDateTime(TempTimeStamp);
            TempString:=FormatDateTime(TimeFormat,TempDateTime);
         except
            Result:=False;
            TempString:='';
         end;
         StrPCopy(SourceBuffer,TempString);
         end;
      TYPE_TIMESTAMP:
         begin
         TempTimeStamp:=MSecsToTimeStamp(pDouble(SourceBuffer)^);
         try
            TempDateTime:=TimeStampToDateTime(TempTimeStamp);
            TempString:=FormatDateTime(DateFormat+' '+TimeFormat,TempDateTime);
         except
            Result:=False;
            TempString:='';
         end;
         StrPCopy(SourceBuffer,TempString);
         end;
      end;
end;

function FormatStrToDate(const Value: string; const DateFormat: string): TDateTime;
var
   I: Integer;
   TempCentury: Word;
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
   Separator: Char;
   OrderPos: Byte;
   FormatOrder: array [1..3] of Char;
   TempString: string;
   TempValue: string;
   YearLen: Byte;
begin
   Result:=0;
   try
      Separator:=#0;
      OrderPos:=1;
      FillChar(FormatOrder,SizeOf(FormatOrder),#0);
      for I:=1 to Length(DateFormat) do
         begin
         if (not (DateFormat[I] in ['d','D','m','M','y','Y',' '])) then
            begin
            if (Separator=#0) then
               Separator:=DateFormat[I];
            end
         else if (DateFormat[I] <> ' ') then
            begin
            if (FormatOrder[OrderPos]=#0) then
               FormatOrder[OrderPos]:=UpCase(DateFormat[I])
            else if (FormatOrder[OrderPos] <> UpCase(DateFormat[I])) then
               begin
               Inc(OrderPos);
               if (OrderPos <= 3) then
                  FormatOrder[OrderPos]:=UpCase(DateFormat[I]);
               end;
            end;
         end;
      TempYear:=0;
      TempMonth:=0;
      TempDay:=0;
      YearLen:=4;
      TempString:=Value;
      for OrderPos:=1 to 3 do
         begin
         if (At(Separator,TempString) > 0) then
            begin
            TempValue:=Substr(TempString,1,At(Separator,TempString)-1);
            TempString:=Substr(TempString,At(Separator,TempString)+1,Length(TempString));
            end
         else
            begin
            TempValue:=TempString;
            TempString:='';
            end;
         case FormatOrder[OrderPos] of
            'Y':
               begin
               YearLen:=Length(TempValue);
               TempYear:=StrToInt(TempValue);
               end;
            'M':
               TempMonth:=StrToInt(TempValue);
            'D':
               TempDay:=StrToInt(TempValue);
            end;
         end;
      if (YearLen <= 2) then
         begin
         TempCentury:=GetCurrentYear-TwoDigitYearCenturyWindow;
         Inc(TempYear,((TempCentury div 100)*100));
         if (TwoDigitYearCenturyWindow > 0) and (TempYear < TempCentury) then
            Inc(TempYear,100);
         end;
      Result:=EncodeDate(TempYear,TempMonth,TempDay);
   except
      ConvertErrorFmt('''%s'' is not a valid date',[Value])
   end;
end;

function GetCurrentYear: Word;
var
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
begin
   DecodeDate(Date,TempYear,TempMonth,TempDay);
   Result:=TempYear;
end;

function FormatStrToTime(const Value: string; const TimeFormat: string): TDateTime;
var
   I: Integer;
   TempHour: Word;
   TempMinute: Word;
   TempSecond: Word;
   TempMSecond: Word;
   MilitaryTime: Boolean;
   HourBias: Word;
   Separator: Char;
   OrderPos: Byte;
   FormatOrder: array [1..4] of Char;
   TempString: string;
   TempValue: string;
begin
   Result:=0;
   try
      Separator:=#0;
      OrderPos:=1;
      FillChar(FormatOrder,SizeOf(FormatOrder),#0);
      MilitaryTime:=True;
      for I:=1 to Length(TimeFormat) do
         begin
         if (not (TimeFormat[I] in ['a','A','p','P','h','H','m','M','s','S','z','Z',' '])) then
            begin
            if (Separator=#0) then
               Separator:=TimeFormat[I];
            end
         else if (TimeFormat[I] in ['a','A','p','P']) then
            begin
            if (I < Length(TimeFormat)) and
               (TimeFormat[I+1] in ['m','M']) then
               MilitaryTime:=False;
            end
         else if (TimeFormat[I] <> ' ') then
            begin
            if (not ((I > 1) and
                     (TimeFormat[I] in ['m','M']) and
                     (TimeFormat[I-1] in ['a','A','p','P'])) or
                     (TimeFormat[I]='.')) then
               begin
               if (FormatOrder[OrderPos]=#0) then
                  FormatOrder[OrderPos]:=UpCase(TimeFormat[I])
               else if (FormatOrder[OrderPos] <> UpCase(TimeFormat[I])) then
                  begin
                  Inc(OrderPos);
                  if (OrderPos <= 4) then
                     FormatOrder[OrderPos]:=UpCase(TimeFormat[I]);
                  end;
               end;
            end;
         end;
      TempHour:=0;
      TempMinute:=0;
      TempSecond:=0;
      TempMSecond:=0;
      TempString:=Value;
      HourBias:=0;
      for OrderPos:=1 to 4 do
         begin
         if (At(Separator,TempString) > 0) then
            begin
            TempValue:=Substr(TempString,1,At(Separator,TempString)-1);
            TempString:=Substr(TempString,At(Separator,TempString)+1,Length(TempString));
            end
         else
            begin
            if (At('.',TempString) > 0) then
               begin
               TempValue:=Substr(TempString,1,At('.',TempString)-1);
               TempString:=Substr(TempString,At('.',TempString)+1,Length(TempString));
               end
            else
               begin
               TempValue:=TempString;
               TempString:='';
               end;
            end;
         if (not MilitaryTime) then
            begin
            if (At('AM',UpperCase(TempValue)) > 0) then
               begin
               HourBias:=0;
               TempValue:=Trim(StringReplace(TempValue,'AM','',[rfIgnoreCase]));
               end
            else if (At('PM',UpperCase(TempValue)) > 0) then
               begin
               HourBias:=12;
               TempValue:=Trim(StringReplace(TempValue,'pm','',[rfIgnoreCase]));
               end;
            end;
         case FormatOrder[OrderPos] of
            'H':
               TempHour:=StrToInt(TempValue);
            'M':
               TempMinute:=StrToInt(TempValue);
            'S':
               TempSecond:=StrToInt(TempValue);
            'Z':
               TempMSecond:=StrToInt(TempValue);
            end;
         end;
      if (not MilitaryTime) then
         begin
         if (TempHour=12) then
            begin
            if (HourBias=0) then
               TempHour:=0;
            end
         else
            begin
            if (HourBias <> 0) then
               Inc(TempHour,HourBias);
            end;
         end;
      Result:=EncodeTime(TempHour,TempMinute,TempSecond,TempMSecond);
   except
      ConvertErrorFmt('''%s'' is not a valid time',[Value])
   end;
end;

function FormatStrToDateTime(const Value: string; const DateFormat: string;
                             const TimeFormat: string): TDateTime;
var
   TempDate: string;
   TempTime: string;
begin
   Result:=0;
   TempDate:=Value;
   TempTime:='';
   if (At(' ',Value) > 0) then
      begin
      TempDate:=Substr(Value,1,At(' ',Value)-1);
      TempTime:=Substr(Value,At(' ',Value)+1,Length(Value));
      end;
   if ((TempDate <> '') and (DateFormat <> '')) and
      ((TempTime <> '') and (TimeFormat <> '')) then
      Result:=FormatStrToDate(TempDate,DateFormat)+
              FormatStrToTime(TempTime,TimeFormat)
   else
      ConvertErrorFmt('''%s'' is not a valid date and time',[Value])
end;

function ConvertFormatToNumber(SourceBuffer: PChar;
                                DestDataType: Byte;
                               DestDataDecimals: Byte;
                               DecSeparator: Char): Boolean;
var
   TempString: string;
   TempDouble: double;
   TempCurrency: Currency;
begin
   Result:=True;
   TempString:=StrPas(SourceBuffer);
   case DestDataType of
      TYPE_FLOAT:
         begin
         try
            TempDouble:=FormatStrToFloat(TempString,DecSeparator);
         except
            TempDouble:=0;
            Result:=False;
         end;
         pDouble(SourceBuffer)^:=TempDouble;
         end;
      TYPE_BCD:
         begin
         try
            TempCurrency:=FormatStrToCurr(TempString,DecSeparator);
         except
            TempCurrency:=0;
            Result:=False;
         end;
         pBCD(SourceBuffer)^:=CurrToTBCD(TempCurrency,DestDataDecimals);
         end;
      end;
end;

function ConvertNumberToFormat(SourceBuffer: PChar;
                                SourceDataType: Byte;
                               DecSeparator: Char): Boolean;
var
   TempString: string;
   TempDouble: double;
   TempCurrency: Currency;
begin
   Result:=True;
   case SourceDataType of
      TYPE_FLOAT:
         begin
         TempDouble:=pDouble(SourceBuffer)^;
         try
            TempString:=FloatToFormatStr(TempDouble,DecSeparator);
         except
            Result:=False;
            TempString:='';
         end;
         StrPCopy(SourceBuffer,TempString);
         end;
      TYPE_BCD:
         begin
         TempCurrency:=TBCDToCurr(pBCD(SourceBuffer)^);
         try
            TempString:=CurrToFormatStr(TempCurrency,DecSeparator);
         except
            Result:=False;
            TempString:='';
         end;
         StrPCopy(SourceBuffer,TempString);
         end;
      end;
end;

function FormatStrToFloat(const Value: string; DecSeparator: Char): double;
var
   TempString: string;
begin
   TempString:=StringReplace(Value,DecSeparator,DecimalSeparator,[rfReplaceAll]);
   Result:=StrToFloat(TempString);
end;

function FormatStrToCurr(const Value: string; DecSeparator: Char): Currency;
var
   TempString: string;
begin
   TempString:=StringReplace(Value,DecSeparator,DecimalSeparator,[rfReplaceAll]);
   Result:=StrToCurr(TempString);
end;

function FloatToFormatStr(Value: double; DecSeparator: Char): string;
begin
   Result:=FloatToStr(Value);
   Result:=StringReplace(Result,DecimalSeparator,DecSeparator,[rfReplaceAll]);
end;

function CurrToFormatStr(Value: Currency; DecSeparator: Char): string;
begin
   Result:=CurrToStr(Value);
   Result:=StringReplace(Result,DecimalSeparator,DecSeparator,[rfReplaceAll]);
end;

function ConvertExpression(FromDataType: Byte; FromDataSize: Word;
                           FromDataDecimals: Byte;
                           ToDataType: Byte; ToDataSize: Word;
                           ToDataDecimals: Byte; ExprBuffer: PChar): Boolean;
var
   TempString: AnsiString;
   TempInteger: Integer;
   TempSmallInt: SmallInt;
   TempWord: Word;
   TempDouble: double;
   TempBCD: TBCD;
   TempDateTime: TDateTime;
   TempTimeStamp: TTimeStamp;
   TempBoolean: WordBool;
   TempLargeInt: Int64;
begin
   Result:=True;
   if (FromDataType <> ToDataType) then
      begin
      case FromDataType of
         TYPE_ZSTRING:
            begin
            SetLength(TempString,FromDataSize);
            FillChar(PChar(TempString)^,FromDataSize,#0);
            Move(ExprBuffer^,PChar(TempString)^,StrLen(ExprBuffer));
            case ToDataType of
               TYPE_FLOAT:
                  begin
                  try
                     TempDouble:=StrToAnsiFloat(TempString);
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BCD:
                  begin
                  try
                     TempBCD:=CurrToTBCD(StrToCurr(TempString),
                                          ToDataDecimals);
                  except
                     Result:=False;
                     FillChar(TempBCD,ToDataSize,#0);
                  end;
                  Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               TYPE_TIMESTAMP:
                  begin
                  try
                     TempDateTime:=StrToAnsiDateTime(TempString);
                  except
                     Result:=False;
                     TempDateTime:=0;
                  end;
                  TempTimeStamp:=DateTimeToTimeStamp(TempDateTime);
                  TempDouble:=TimeStampToMSecs(TempTimeStamp);
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT32:
                  begin
                  try
                     TempInteger:=StrToInt(TempString);
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT64:
                  begin
                  try
                     TempLargeInt:=StrToInt64(TempString);
                  except
                     Result:=False;
                     TempLargeInt:=0;
                  end;
                  Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_DATE:
                  begin
                  try
                     TempDateTime:=StrToAnsiDate(TempString);
                  except
                     Result:=False;
                     TempDateTime:=0;
                  end;
                  TempTimeStamp:=DateTimeToTimeStamp(TempDateTime);
                  TempInteger:=TempTimeStamp.Date;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_TIME:
                  begin
                  try
                     TempDateTime:=StrToAnsiTime(TempString);
                  except
                     Result:=False;
                     TempDateTime:=0;
                  end;
                  TempTimeStamp:=DateTimeToTimeStamp(TempDateTime);
                  TempInteger:=TempTimeStamp.Time;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT16:
                  begin
                  try
                     TempSmallInt:=StrToInt(TempString);
                  except
                     Result:=False;
                     TempSmallInt:=0;
                  end;
                  Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_UINT16:
                  begin
                  try
                     TempWord:=StrToInt(TempString);
                  except
                     Result:=False;
                     TempWord:=0;
                  end;
                  Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BOOL:
                  begin
                  try
                     TempBoolean:=VerifyWordBool(WordBool(StrToAnsiBoolean(TempString)));
                  except
                     Result:=False;
                     TempBoolean:=False;
                  end;
                  Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(PChar(TempString)^,ExprBuffer^,FromDataSize)
                  else
                     Move(PChar(TempString)^,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_INT32:
            begin
            Move(ExprBuffer^,TempInteger,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  try
                     TempString:=IntToStr(TempInteger);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_FLOAT:
                  begin
                  try
                     TempDouble:=TempInteger;
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BCD:
                  begin
                  try
                     TempBCD:=CurrToTBCD(TempInteger,
                                          ToDataDecimals);
                  except
                     Result:=False;
                     FillChar(TempBCD,ToDataSize,#0);
                  end;
                  Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BOOL:
                  begin
                  TempBoolean:=(TempInteger <> 0);
                  Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT64:
                  begin
                  try
                     TempLargeInt:=TempInteger;
                  except
                     Result:=False;
                     TempLargeInt:=0;
                  end;
                  Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT16:
                  begin
                  try
                     TempSmallInt:=TempInteger;
                  except
                     Result:=False;
                     TempSmallInt:=0;
                  end;
                  Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_UINT16:
                  begin
                  try
                     TempWord:=TempInteger;
                  except
                     Result:=False;
                     TempWord:=0;
                  end;
                  Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempInteger,ExprBuffer^,FromDataSize)
                  else
                     Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_INT64:
            begin
            Move(ExprBuffer^,TempLargeInt,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  try
                     TempString:=IntToStr(TempLargeInt);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_FLOAT:
                  begin
                  try
                     TempDouble:=TempLargeInt;
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BCD:
                  begin
                  try
                     TempBCD:=CurrToTBCD(TempLargeInt,
                                          ToDataDecimals);
                  except
                     Result:=False;
                     FillChar(TempBCD,ToDataSize,#0);
                  end;
                  Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BOOL:
                  begin
                  TempBoolean:=(TempLargeInt <> 0);
                  Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT16:
                  begin
                  try
                     TempSmallInt:=TempLargeInt;
                  except
                     Result:=False;
                     TempSmallInt:=0;
                  end;
                  Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_UINT16:
                  begin
                  try
                     TempWord:=TempLargeInt;
                  except
                     Result:=False;
                     TempWord:=0;
                  end;
                  Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT32:
                  begin
                  try
                     TempInteger:=TempLargeInt;
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempLargeInt,ExprBuffer^,FromDataSize)
                  else
                     Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_INT16:
            begin
            Move(ExprBuffer^,TempSmallInt,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  try
                     TempString:=IntToStr(TempSmallInt);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_FLOAT:
                  begin
                  try
                     TempDouble:=TempSmallInt;
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BCD:
                  begin
                  try
                     TempBCD:=CurrToTBCD(TempSmallInt,
                                          ToDataDecimals);
                  except
                     Result:=False;
                     FillChar(TempBCD,ToDataSize,#0);
                  end;
                  Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BOOL:
                  begin
                  TempBoolean:=(TempSmallInt <> 0);
                  Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT32:
                  begin
                  try
                     TempInteger:=TempSmallInt;
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT64:
                  begin
                  try
                     TempLargeInt:=TempSmallInt;
                  except
                     Result:=False;
                     TempLargeInt:=0;
                  end;
                  Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_UINT16:
                  begin
                  try
                     TempWord:=TempSmallInt;
                  except
                     Result:=False;
                     TempWord:=0;
                  end;
                  Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempSmallInt,ExprBuffer^,FromDataSize)
                  else
                     Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_UINT16:
            begin
            Move(ExprBuffer^,TempWord,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  try
                     TempString:=IntToStr(TempWord);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_FLOAT:
                  begin
                  try
                     TempDouble:=TempWord;
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BCD:
                  begin
                  try
                     TempBCD:=CurrToTBCD(TempWord,
                                          ToDataDecimals);
                  except
                     Result:=False;
                     FillChar(TempBCD,ToDataSize,#0);
                  end;
                  Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BOOL:
                  begin
                  TempBoolean:=(TempWord <> 0);
                  Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT32:
                  begin
                  try
                     TempInteger:=TempWord;
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT64:
                  begin
                  try
                     TempLargeInt:=TempWord;
                  except
                     Result:=False;
                     TempLargeInt:=0;
                  end;
                  Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT16:
                  begin
                  try
                     TempSmallInt:=TempWord;
                  except
                     Result:=False;
                     TempSmallInt:=0;
                  end;
                  Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempWord,ExprBuffer^,FromDataSize)
                  else
                     Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_DATE:
            begin
            Move(ExprBuffer^,TempInteger,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  TempTimeStamp.Date:=TempInteger;
                  TempTimeStamp.Time:=0;
                  try
                     TempDateTime:=TimeStampToDateTime(TempTimeStamp);
                     TempString:=AnsiDateToStr(TempDateTime);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_TIMESTAMP:
                  begin
                  TempTimeStamp.Date:=TempInteger;
                  TempTimeStamp.Time:=0;
                  try
                     TempDouble:=TimeStampToMSecs(TempTimeStamp);
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempInteger,ExprBuffer^,FromDataSize)
                  else
                     Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_TIME:
            begin
            Move(ExprBuffer^,TempInteger,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  TempTimeStamp.Date:=1;
                  TempTimeStamp.Time:=TempInteger;
                  try
                     TempDateTime:=TimeStampToDateTime(TempTimeStamp);
                     TempString:=AnsiTimeToStr(TempDateTime,True);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_TIMESTAMP:
                  begin
                  TempTimeStamp.Time:=TempInteger;
                  TempTimeStamp.Date:=DateTimeToTimeStamp(Date).Date;
                  try
                     TempDouble:=TimeStampToMSecs(TempTimeStamp);
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempInteger,ExprBuffer^,FromDataSize)
                  else
                     Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_TIMESTAMP:
            begin
            Move(ExprBuffer^,TempDouble,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  TempTimeStamp:=MSecsToTimeStamp(TempDouble);
                  try
                     TempDateTime:=TimeStampToDateTime(TempTimeStamp);
                     TempString:=AnsiDateTimeToStr(TempDateTime,True);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_DATE:
                  begin
                  TempTimeStamp:=MSecsToTimeStamp(TempDouble);
                  try
                     TempInteger:=TempTimeStamp.Date;
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_TIME:
                  begin
                  TempTimeStamp:=MSecsToTimeStamp(TempDouble);
                  try
                     TempInteger:=TempTimeStamp.Time;
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempDouble,ExprBuffer^,FromDataSize)
                  else
                     Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_BOOL:
            begin
            Move(ExprBuffer^,TempBoolean,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  try
                     TempString:=AnsiBooleanToStr(TempBoolean);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_BCD:
                  begin
                  if TempBoolean then
                     TempBCD:=CurrToTBCD(1,ToDataDecimals)
                  else
                     TempBCD:=CurrToTBCD(0,ToDataDecimals);
                  Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               TYPE_FLOAT:
                  begin
                  if TempBoolean then
                     TempDouble:=1
                  else
                     TempDouble:=0;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT32:
                  begin
                  if TempBoolean then
                     TempInteger:=1
                  else
                     TempInteger:=0;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT64:
                  begin
                  if TempBoolean then
                     TempLargeInt:=1
                  else
                     TempLargeInt:=0;
                  Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT16:
                  begin
                  if TempBoolean then
                     TempSmallInt:=1
                  else
                     TempSmallInt:=0;
                  Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_UINT16:
                  begin
                  if TempBoolean then
                     TempWord:=1
                  else
                     TempWord:=0;
                  Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempBoolean,ExprBuffer^,FromDataSize)
                  else
                     Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_FLOAT:
            begin
            Move(ExprBuffer^,TempDouble,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  try
                     TempString:=AnsiFloatToStr(TempDouble);
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_BCD:
                  begin
                  try
                     TempBCD:=CurrToTBCD(TempDouble,ToDataDecimals);
                  except
                     Result:=False;
                     FillChar(TempBCD,ToDataSize,#0);
                  end;
                  Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BOOL:
                  begin
                  TempBoolean:=(TempDouble <> 0);
                  Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT32:
                  begin
                  try
                     TempInteger:=Trunc(TempDouble);
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT64:
                  begin
                  try
                     TempLargeInt:=Trunc(TempDouble);
                  except
                     Result:=False;
                     TempLargeInt:=0;
                  end;
                  Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT16:
                  begin
                  try
                     TempSmallInt:=Trunc(TempDouble);
                  except
                     Result:=False;
                     TempSmallInt:=0;
                  end;
                  Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_UINT16:
                  begin
                  try
                     TempWord:=Trunc(TempDouble);
                  except
                     Result:=False;
                     TempWord:=0;
                  end;
                  Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempDouble,ExprBuffer^,FromDataSize)
                  else
                     Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_BCD:
            begin
            Move(ExprBuffer^,TempBCD,FromDataSize);
            case ToDataType of
               TYPE_ZSTRING:
                  begin
                  try
                     TempString:=CurrToStr(TBCDToCurr(TempBCD));
                  except
                     Result:=False;
                     TempString:='';
                  end;
                  StrCopy(ExprBuffer,PChar(TempString));
                  end;
               TYPE_FLOAT:
                  begin
                  try
                     TempDouble:=TBCDToCurr(TempBCD);
                  except
                     Result:=False;
                     TempDouble:=0;
                  end;
                  Move(TempDouble,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BOOL:
                  begin
                  TempBoolean:=(TBCDToCurr(TempBCD) <> 0);
                  Move(TempBoolean,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT32:
                  begin
                  try
                     TempInteger:=Trunc(TBCDToCurr(TempBCD));
                  except
                     Result:=False;
                     TempInteger:=0;
                  end;
                  Move(TempInteger,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT64:
                  begin
                  try
                     TempLargeInt:=Trunc(TBCDToCurr(TempBCD));
                  except
                     Result:=False;
                     TempLargeInt:=0;
                  end;
                  Move(TempLargeInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_INT16:
                  begin
                  try
                     TempSmallInt:=Trunc(TBCDToCurr(TempBCD));
                  except
                     Result:=False;
                     TempSmallInt:=0;
                  end;
                  Move(TempSmallInt,ExprBuffer^,ToDataSize);
                  end;
               TYPE_UINT16:
                  begin
                  try
                     TempWord:=Trunc(TBCDToCurr(TempBCD));
                  except
                     Result:=False;
                     TempWord:=0;
                  end;
                  Move(TempWord,ExprBuffer^,ToDataSize);
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  if (ToDataSize > FromDataSize) then
                     Move(TempBCD,ExprBuffer^,FromDataSize)
                  else
                     Move(TempBCD,ExprBuffer^,ToDataSize);
                  end;
               else
                  begin
                  FillChar(ExprBuffer^,ToDataSize,#0);
                  Result:=False;
                  end;
               end;
            end;
         TYPE_BYTES,TYPE_VARBYTES:
            begin
            if (ToDataType <> TYPE_BLOB)  then
               begin
               if (ToDataSize < FromDataSize) then
                  (ExprBuffer+(ToDataSize-1))^:=#0;
               end
            else
               begin
               FillChar(ExprBuffer^,ToDataSize,#0);
               Result:=False;
               end;
            end;
         end;
      end
   else
      begin
      if (FromDataType=TYPE_ZSTRING) then
         begin
         if (ToDataSize < FromDataSize) then
            (ExprBuffer+(ToDataSize-1))^:=#0;
         end;
      end;
end;

function VerifyWordBool(Value: WordBool): WordBool;
var
   TempWord: Word;
begin
   TempWord:=Word(Value);
   if (TempWord > 1) then
      TempWord:=1;
   Result:=WordBool(TempWord);
end;

function VerifyCompareResult(Value: Integer): Integer;
begin
   Result:=Value;
   if (Result > 0) then
      Result:=CMP_GREATER
   else if (Result < 0) then
      Result:=CMP_LESS;
end;

procedure EvaluateUnary(Operator: TExpOperator; LeftToken: TExpToken;
                        ResultToken: TExpToken);
begin
   try
      case Operator of
         eoNOT:
            pWordBool(ResultToken.Value)^:=(not pWordBool(LeftToken.Value)^);
         eoPLUS:
            begin
            if LeftToken.IsNull then
               begin
               ResultToken.IsNull:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_INT16:
                  pSmallInt(ResultToken.Value)^:=pSmallInt(LeftToken.Value)^;
               TYPE_UINT16:
                  pWord(ResultToken.Value)^:=pWord(LeftToken.Value)^;
               TYPE_INT32:
                  pInteger(ResultToken.Value)^:=pInteger(LeftToken.Value)^;
               TYPE_INT64:
                  pInt64(ResultToken.Value)^:=pInt64(LeftToken.Value)^;
               TYPE_FLOAT:
                  pDouble(ResultToken.Value)^:=pDouble(LeftToken.Value)^;
               TYPE_BCD:
                  pBCD(ResultToken.Value)^:=CurrToTBCD(TBCDToCurr(pBCD(LeftToken.Value)^),
                                                                     LeftToken.DataDecimals);
               TYPE_DATE,TYPE_TIME:
                  pInteger(ResultToken.Value)^:=pInteger(LeftToken.Value)^;
               TYPE_TIMESTAMP:
                  pDouble(ResultToken.Value)^:=pDouble(LeftToken.Value)^;
               end;
            end;
         eoMINUS:
            begin
            if LeftToken.IsNull then
               begin
               ResultToken.IsNull:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_INT16:
                  pSmallInt(ResultToken.Value)^:=-(pSmallInt(LeftToken.Value)^);
               TYPE_UINT16:
                  pWord(ResultToken.Value)^:=-(pWord(LeftToken.Value)^);
               TYPE_INT32:
                  pInteger(ResultToken.Value)^:=-(pInteger(LeftToken.Value)^);
               TYPE_INT64:
                  pInt64(ResultToken.Value)^:=-(pInt64(LeftToken.Value)^);
               TYPE_FLOAT:
                  pDouble(ResultToken.Value)^:=-(pDouble(LeftToken.Value)^);
               TYPE_BCD:
                  pBCD(ResultToken.Value)^:=CurrToTBCD(-(TBCDToCurr(pBCD(LeftToken.Value)^)),
                                                                     LeftToken.DataDecimals);
               TYPE_DATE,TYPE_TIME:
                  pInteger(ResultToken.Value)^:=-(pInteger(LeftToken.Value)^);
               TYPE_TIMESTAMP:
                  pDouble(ResultToken.Value)^:=-(pDouble(LeftToken.Value)^);
               end;
            end;
         end;
   finally
      if (ResultToken.DataType=TYPE_BOOL) then
         pWordBool(ResultToken.Value)^:=VerifyWordBool(pWordBool(ResultToken.Value)^);
   end;
end;

procedure EvaluateBinary(Operator: TExpOperator; LeftToken: TExpToken;
                         RightToken: TExpToken; ResultToken: TExpToken;
                         LocaleID: Integer);
var
   TempTimeStamp: TTimeStamp;
   CompareResult: Integer;
begin
   try
      case Operator of
         eoOR:
            pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^ or
                                            pWordBool(RightToken.Value)^);
         eoAND:
            pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^ and
                                            pWordBool(RightToken.Value)^);
         eoEQ:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               pWordBool(ResultToken.Value)^:=False;
               Exit;
               end
            else if (LeftToken.IsNull and RightToken.IsNull) then
               begin
               pWordBool(ResultToken.Value)^:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_UNKNOWN:
                  pWordBool(ResultToken.Value)^:=RightToken.IsNull;
               TYPE_BOOL:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^=
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^=
                                                        (pSmallInt(RightToken.Value)^ <> 0));
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^=
                                                        (pWord(RightToken.Value)^ <> 0));
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^=
                                                        (pInteger(RightToken.Value)^ <> 0));
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^=
                                                        (pInt64(RightToken.Value)^ <> 0));
                     end;
                  end;
               TYPE_ZSTRING,TYPE_BLOB:
                  begin
                  case RightToken.DataType of
                     TYPE_ZSTRING,TYPE_BLOB:
                        pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,
                                                                         LeftToken.Value,
                                                                         RightToken.Value,
                                                                         0,False)=CMP_EQUAL);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_INT16:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pSmallInt(LeftToken.Value)^ <> 0)=
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^=
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(Integer(pSmallInt(LeftToken.Value)^)=
                                                     Integer(pWord(RightToken.Value)^));
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^=
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^=
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^=
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^=
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pWord(LeftToken.Value)^ <> 0)=
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(Integer(pWord(LeftToken.Value)^)=
                                                     Integer(pSmallInt(RightToken.Value)^));
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^=
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^=
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^=
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^=
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^=
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pInteger(LeftToken.Value)^ <> 0)=
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pInt64(LeftToken.Value)^ <> 0)=
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^=
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^=
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^=
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^=
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^=
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^=
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_BCD:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)=
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)=
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)=
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)=
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)=
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)=
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_DATE:
                  begin
                  case RightToken.DataType of
                     TYPE_DATE:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     pInteger(RightToken.Value)^);
                     TYPE_TIMESTAMP:
                        begin
                        TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                        TempTimeStamp.Time:=0;
                        pWordBool(ResultToken.Value)^:=(TimeStampToMSecs(TempTimeStamp)=
                                                     pDouble(RightToken.Value)^);
                        end;
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_TIME:
                  begin
                  case RightToken.DataType of
                     TYPE_TIME:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^=
                                                     pInteger(RightToken.Value)^);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_TIMESTAMP:
                  begin
                  case RightToken.DataType of
                     TYPE_DATE:
                        begin
                        TempTimeStamp.Date:=pInteger(RightToken.Value)^;
                        TempTimeStamp.Time:=0;
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     TimeStampToMSecs(TempTimeStamp));
                        end;
                     TYPE_TIMESTAMP:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^=
                                                     pDouble(RightToken.Value)^);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  case RightToken.DataType of
                     TYPE_BYTES,TYPE_VARBYTES:
                        pWordBool(ResultToken.Value)^:=(CompareBytes(LeftToken.Value,
                                                                     RightToken.Value,
                                                                     LeftToken.DataSize,False)=CMP_EQUAL);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               end;
            end;
         eoNE:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               pWordBool(ResultToken.Value)^:=True;
               Exit;
               end
            else if (LeftToken.IsNull and RightToken.IsNull) then
               begin
               pWordBool(ResultToken.Value)^:=False;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_UNKNOWN:
                  pWordBool(ResultToken.Value)^:=(not RightToken.IsNull);
               TYPE_BOOL:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^ <>
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^ <>
                                                        (pSmallInt(RightToken.Value)^ <> 0));
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^ <>
                                                        (pWord(RightToken.Value)^ <> 0));
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^ <>
                                                        (pInteger(RightToken.Value)^ <> 0));
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pWordBool(LeftToken.Value)^ <>
                                                        (pInt64(RightToken.Value)^ <> 0));
                     end;
                  end;
               TYPE_ZSTRING,TYPE_BLOB:
                  begin
                   case RightToken.DataType of
                     TYPE_ZSTRING,TYPE_BLOB:
                        pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,
                                                                         LeftToken.Value,
                                                                         RightToken.Value,
                                                                         0,False) <> CMP_EQUAL);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_INT16:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pSmallInt(LeftToken.Value)^ <> 0) <> 
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <>
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(Integer(pSmallInt(LeftToken.Value)^) <>
                                                     Integer(pWord(RightToken.Value)^));
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <>
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <>
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <>
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <>
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pWord(LeftToken.Value)^ <> 0) <> 
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(Integer(pWord(LeftToken.Value)^) <>
                                                     Integer(pSmallInt(RightToken.Value)^));
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <>
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <>
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <>
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <>
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <>
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pInteger(LeftToken.Value)^ <> 0) <> 
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <> 
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <> 
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <>
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <>
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <> 
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <>
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightToken.DataType of
                     TYPE_BOOL:
                        pWordBool(ResultToken.Value)^:=((pInt64(LeftToken.Value)^ <> 0) <> 
                                                        pWordBool(RightToken.Value)^);
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <>
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <>
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <>
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <>
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <>
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <>
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <>
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <> 
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <> 
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <>
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <>
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <>
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_BCD:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <>
                                                     pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <>
                                                     pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <>
                                                     pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <>
                                                     pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <>
                                                     pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <>
                                                     TBCDToCurr(pBCD(RightToken.Value)^));
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_DATE:
                  begin
                  case RightToken.DataType of
                     TYPE_DATE:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <>
                                                     pInteger(RightToken.Value)^);
                     TYPE_TIMESTAMP:
                        begin
                        TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                        TempTimeStamp.Time:=0;
                        pWordBool(ResultToken.Value)^:=(TimeStampToMSecs(TempTimeStamp) <>
                                                     pDouble(RightToken.Value)^);
                        end;
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_TIME:
                  begin
                  case RightToken.DataType of
                     TYPE_TIME:
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <>
                                                     pInteger(RightToken.Value)^);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_TIMESTAMP:
                  begin
                  case RightToken.DataType of
                     TYPE_DATE:
                        begin
                        TempTimeStamp.Date:=pInteger(RightToken.Value)^;
                        TempTimeStamp.Time:=0;
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <>
                                                     TimeStampToMSecs(TempTimeStamp));
                        end;
                     TYPE_TIMESTAMP:
                        pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <>
                                                     pDouble(RightToken.Value)^);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               TYPE_BYTES,TYPE_VARBYTES:
                  begin
                  case RightToken.DataType of
                     TYPE_BYTES,TYPE_VARBYTES:
                        pWordBool(ResultToken.Value)^:=(CompareBytes(LeftToken.Value,
                                                                     RightToken.Value,
                                                                     LeftToken.DataSize,False) <> CMP_EQUAL);
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               end;
            end;
         eoGT:
            begin
            if (LeftToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
               begin
               if (RightToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
                  pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,
                                                                 LeftToken.Value,
                                                                 RightToken.Value,
                                                                 0,False)=CMP_GREATER);
               end
            else
               begin
               if LeftToken.IsNull or RightToken.IsNull then
                  begin
                  pWordBool(ResultToken.Value)^:=False;
                  Exit;
                  end;
               case LeftToken.DataType of
                  TYPE_INT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pSmallInt(LeftToken.Value)^) >
                                                        Integer(pWord(RightToken.Value)^));
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_UINT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pWord(LeftToken.Value)^) >
                                                        Integer(pSmallInt(RightToken.Value)^));
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT32:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ > 
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT64:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_FLOAT:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ > 
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ > 
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >

                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_BCD:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_DATE:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >
                                                        pInteger(RightToken.Value)^);
                        TYPE_TIMESTAMP:
                           begin
                           TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(TimeStampToMSecs(TempTimeStamp) >
                                                        pDouble(RightToken.Value)^);
                           end;
                        end;
                     end;
                  TYPE_TIME:
                     begin
                     if (RightToken.DataType=TYPE_TIME) then
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >
                                                     pInteger(RightToken.Value)^);
                     end;
                  TYPE_TIMESTAMP:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           begin
                           TempTimeStamp.Date:=pInteger(RightToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >
                                                        TimeStampToMSecs(TempTimeStamp));
                           end;
                        TYPE_TIMESTAMP:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >
                                                        pDouble(RightToken.Value)^);
                        end;
                     end;
                  end;
               end;
            end;
         eoGE:
            begin
            if (LeftToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
               begin
               if (RightToken.DataType in [TYPE_ZSTRING,TYPE_BLOB,TYPE_UNKNOWN]) then
                  begin
                  CompareResult:=OSCompareStrings(LocaleID,
                                                LeftToken.Value,
                                                RightToken.Value,
                                                0,False);
                  pWordBool(ResultToken.Value)^:=((CompareResult=CMP_GREATER) or
                                                    (CompareResult=CMP_EQUAL));
                  end;
               end
            else
               begin
               if LeftToken.IsNull and (not RightToken.IsNull) or
                  RightToken.IsNull and (not LeftToken.IsNull) then
                  begin
                  pWordBool(ResultToken.Value)^:=False;
                  Exit;
                  end
               else if (LeftToken.IsNull and RightToken.IsNull) then
                  begin
                  pWordBool(ResultToken.Value)^:=True;
                  Exit;
                  end;
               case LeftToken.DataType of
                  TYPE_INT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >= 
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pSmallInt(LeftToken.Value)^) >=
                                                        Integer(pWord(RightToken.Value)^));
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ >=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_UINT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pWord(LeftToken.Value)^) >=
                                                        Integer(pSmallInt(RightToken.Value)^));
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >= 
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ >=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT32:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >= 
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >= 
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >= 
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT64:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ >=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_FLOAT:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >= 
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_BCD:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) >=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_DATE:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >=
                                                        pInteger(RightToken.Value)^);
                        TYPE_TIMESTAMP:
                           begin
                           TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(TimeStampToMSecs(TempTimeStamp) >=
                                                        pDouble(RightToken.Value)^);
                           end;
                        end;
                     end;
                  TYPE_TIME:
                     begin
                     if (RightToken.DataType=TYPE_TIME) then
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ >=
                                                     pInteger(RightToken.Value)^);
                     end;
                  TYPE_TIMESTAMP:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           begin
                           TempTimeStamp.Date:=pInteger(RightToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >=
                                                        TimeStampToMSecs(TempTimeStamp));
                           end;
                        TYPE_TIMESTAMP:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ >=
                                                        pDouble(RightToken.Value)^);
                        end;
                     end;
                  end;
               end;
            end;
         eoLT:
            begin
            if (LeftToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
               begin
               if (RightToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
                  pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,                                                                 LeftToken.Value,
                                                                 RightToken.Value,
                                                                 0,False)=CMP_LESS);
               end
            else
               begin
               if LeftToken.IsNull or RightToken.IsNull then
                  begin
                  pWordBool(ResultToken.Value)^:=False;
                  Exit;
                  end;
               case LeftToken.DataType of
                  TYPE_INT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pSmallInt(LeftToken.Value)^) <
                                                        Integer(pWord(RightToken.Value)^));
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_UINT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pWord(LeftToken.Value)^) <
                                                        Integer(pSmallInt(RightToken.Value)^));
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ < 
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT32:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT64:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_FLOAT:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ < 
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_BCD:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_DATE:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                        pInteger(RightToken.Value)^);
                        TYPE_TIMESTAMP:
                           begin
                           TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(TimeStampToMSecs(TempTimeStamp) <
                                                        pDouble(RightToken.Value)^);
                           end;
                        end;
                     end;
                  TYPE_TIME:
                     begin
                     if (RightToken.DataType=TYPE_TIME) then
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <
                                                     pInteger(RightToken.Value)^);
                     end;
                  TYPE_TIMESTAMP:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           begin
                           TempTimeStamp.Date:=pInteger(RightToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <
                                                        TimeStampToMSecs(TempTimeStamp));
                           end;
                        TYPE_TIMESTAMP:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <
                                                        pDouble(RightToken.Value)^);
                        end;
                     end;
                  end;
               end;
            end;
         eoLE:
            begin
            if (LeftToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
               begin
               if (RightToken.DataType in [TYPE_ZSTRING,TYPE_BLOB,TYPE_UNKNOWN]) then
                  begin
                  CompareResult:=OSCompareStrings(LocaleID,
                                                LeftToken.Value,
                                                RightToken.Value,
                                                0,False);
                  pWordBool(ResultToken.Value)^:=((CompareResult=CMP_LESS) or
                                                    (CompareResult=CMP_EQUAL));
                  end;
               end
            else
               begin
               if LeftToken.IsNull and (not RightToken.IsNull) or
                  RightToken.IsNull and (not LeftToken.IsNull) then
                  begin
                  pWordBool(ResultToken.Value)^:=False;
                  Exit;
                  end
               else if (LeftToken.IsNull and RightToken.IsNull) then
                  begin
                  pWordBool(ResultToken.Value)^:=True;
                  Exit;
                  end;
               case LeftToken.DataType of
                  TYPE_INT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pSmallInt(LeftToken.Value)^) <=
                                                        Integer(pWord(RightToken.Value)^));
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ <=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_UINT16:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(Integer(pWord(LeftToken.Value)^) <=
                                                        Integer(pSmallInt(RightToken.Value)^));
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pWord(LeftToken.Value)^ <=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT32:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_INT64:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ <=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_FLOAT:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <= 
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_BCD:
                     begin
                     case RightToken.DataType of
                        TYPE_INT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <=
                                                        pSmallInt(RightToken.Value)^);
                        TYPE_UINT16:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <=
                                                        pWord(RightToken.Value)^);
                        TYPE_INT32:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <=
                                                        pInteger(RightToken.Value)^);
                        TYPE_INT64:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <=
                                                        pInt64(RightToken.Value)^);
                        TYPE_FLOAT:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <=
                                                        pDouble(RightToken.Value)^);
                        TYPE_BCD:
                           pWordBool(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^) <=
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  TYPE_DATE:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                        pInteger(RightToken.Value)^);
                        TYPE_TIMESTAMP:
                           begin
                           TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(TimeStampToMSecs(TempTimeStamp) <=
                                                        pDouble(RightToken.Value)^);
                           end;
                        end;
                     end;
                  TYPE_TIME:
                     begin
                     if (RightToken.DataType=TYPE_TIME) then
                        pWordBool(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ <=
                                                     pInteger(RightToken.Value)^);
                     end;
                  TYPE_TIMESTAMP:
                     begin
                     case RightToken.DataType of
                        TYPE_DATE:
                           begin
                           TempTimeStamp.Date:=pInteger(RightToken.Value)^;
                           TempTimeStamp.Time:=0;
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <=
                                                        TimeStampToMSecs(TempTimeStamp));
                           end;
                        TYPE_TIMESTAMP:
                           pWordBool(ResultToken.Value)^:=(pDouble(LeftToken.Value)^ <=
                                                        pDouble(RightToken.Value)^);
                        end;
                     end;
                  end;
               end;
            end;
         eoADD:
            begin
            if (not (LeftToken.DataType in [TYPE_ZSTRING,TYPE_BLOB])) and
               (not (RightToken.DataType in [TYPE_ZSTRING,TYPE_BLOB])) then
               begin
               if LeftToken.IsNull and (not RightToken.IsNull) or
                  RightToken.IsNull and (not LeftToken.IsNull) then
                  begin
                  FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
                  ResultToken.IsNull:=True;
                  Exit;
                  end
               else if LeftToken.IsNull and RightToken.IsNull then
                  begin
                  FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
                  ResultToken.IsNull:=True;
                  Exit;
                  end;
               end;
            case LeftToken.DataType of
               TYPE_ZSTRING,TYPE_BLOB:
                  begin
                  if (RightToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
                     begin
                     StrCopy(ResultToken.Value,LeftToken.Value);
                     StrCat(ResultToken.Value,RightToken.Value);
                     end;
                  end;
               TYPE_INT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^+
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^+
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^+
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^+
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pSmallInt(LeftToken.Value)^+
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     TYPE_DATE,TYPE_TIME:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_TIMESTAMP:
                        pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^+
                                                      pDouble(RightToken.Value)^);
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^+
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^+
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pWord(LeftToken.Value)^+
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^+
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pWord(LeftToken.Value)^+
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     TYPE_DATE,TYPE_TIME:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_TIMESTAMP:
                        pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^+
                                                      pDouble(RightToken.Value)^);
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pInteger(LeftToken.Value)^+
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     TYPE_DATE,TYPE_TIME:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_TIMESTAMP:
                        pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                      pDouble(RightToken.Value)^);
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^+
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^+
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^+
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^+
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pInt64(LeftToken.Value)^+
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     TYPE_DATE,TYPE_TIME:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_TIMESTAMP:
                        pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^+
                                                      pDouble(RightToken.Value)^);
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                        pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                        pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                        pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                        pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                     end;
                  end;
               TYPE_BCD:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pBCD(ResultToken.Value)^:=CurrToTBCD(TBCDToCurr(pBCD(LeftToken.Value)^)+
                                                       pSmallInt(RightToken.Value)^,
                                                       LeftToken.DataDecimals);
                     TYPE_UINT16:
                        pBCD(ResultToken.Value)^:=CurrToTBCD(TBCDToCurr(pBCD(LeftToken.Value)^)+
                                                       pWord(RightToken.Value)^,
                                                       LeftToken.DataDecimals);
                     TYPE_INT32:
                        pBCD(ResultToken.Value)^:=CurrToTBCD(TBCDToCurr(pBCD(LeftToken.Value)^)+
                                                       pInteger(RightToken.Value)^,
                                                       LeftToken.DataDecimals);
                     TYPE_INT64:
                        pBCD(ResultToken.Value)^:=CurrToTBCD(TBCDToCurr(pBCD(LeftToken.Value)^)+
                                                       pInt64(RightToken.Value)^,
                                                       LeftToken.DataDecimals);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)+
                                                       pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD(TBCDToCurr(pBCD(LeftToken.Value)^)+
                                                       TBCDToCurr(pBCD(RightToken.Value)^),
                                                       LeftToken.DataDecimals);
                     end;
                  end;
               TYPE_DATE:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pInt64(RightToken.Value)^);
                     end;
                  end;
               TYPE_TIME:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^+
                                                         pInt64(RightToken.Value)^);
                     end;
                  end;
               TYPE_TIMESTAMP:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                      pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                      pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                      pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^+
                                                      pInt64(RightToken.Value)^);
                     end;
                  end;
               end;
            end;
         eoSUB:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end
            else if LeftToken.IsNull and RightToken.IsNull then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_INT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^-
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^-
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^-
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^-
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pSmallInt(LeftToken.Value)^-
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^-
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^-
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pWord(LeftToken.Value)^-
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^-
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pWord(LeftToken.Value)^-
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pInteger(LeftToken.Value)^-
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^-
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^-
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^-
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^-
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pInt64(LeftToken.Value)^-
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                     end;
                  end;
               TYPE_BCD:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)-
                                                         pSmallInt(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_UINT16:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)-
                                                         pWord(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_INT32:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)-
                                                         pInteger(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_INT64:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)-
                                                         pInt64(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)-
                                                       pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)-
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         LeftToken.DataDecimals);
                     end;
                  end;
               TYPE_DATE:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32,TYPE_DATE:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pInt64(RightToken.Value)^);
                     end;
                  end;
               TYPE_TIME:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32,TYPE_TIME:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^-
                                                         pInt64(RightToken.Value)^);
                     end;
                  end;
               TYPE_TIMESTAMP:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                        pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                        pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                        pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                        pInt64(RightToken.Value)^);
                     TYPE_DATE:
                        begin
                        TempTimeStamp.Date:=pInteger(RightToken.Value)^;
                        TempTimeStamp.Time:=0;
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                         TimeStampToMSecs(TempTimeStamp));
                        end;
                     TYPE_TIME:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                         pInteger(RightToken.Value)^);
                     TYPE_TIMESTAMP:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^-
                                                      pDouble(RightToken.Value)^);
                     end;
                  end;
               end;
            end;
         eoMUL:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end
            else if LeftToken.IsNull and RightToken.IsNull then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_INT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^*
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^*
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^*
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^*
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^*
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pSmallInt(LeftToken.Value)^*
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^*
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^*
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^*
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pWord(LeftToken.Value)^*
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^*
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pWord(LeftToken.Value)^*
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^*
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^*
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^*
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pInteger(LeftToken.Value)^*
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^*
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pInteger(LeftToken.Value)^*
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^*
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^*
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^*
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^*
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^*
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((pInt64(LeftToken.Value)^*
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^*
                                                         pSmallInt(RightToken.Value)^);
                     TYPE_UINT16:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^*
                                                         pWord(RightToken.Value)^);
                     TYPE_INT32:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^*
                                                         pInteger(RightToken.Value)^);
                     TYPE_INT64:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^*
                                                         pInt64(RightToken.Value)^);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^*
                                                        pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^*
                                                        TBCDToCurr(pBCD(RightToken.Value)^));
                     end;
                  end;
               TYPE_BCD:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)*
                                                         pSmallInt(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_UINT16:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)*
                                                         pWord(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_INT32:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)*
                                                         pInteger(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_INT64:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)*
                                                         pInt64(RightToken.Value)^),
                                                         LeftToken.DataDecimals);
                     TYPE_FLOAT:
                        pDouble(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)*
                                                       pDouble(RightToken.Value)^);
                     TYPE_BCD:
                        pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)*
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         LeftToken.DataDecimals);
                     end;
                  end;
               end;
            end;
         eoDIV:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end
            else if LeftToken.IsNull and RightToken.IsNull then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_INT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^/
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^/
                                                           pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^/
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^/
                                                            pInt64(RightToken.Value)^);
                        end;
                     TYPE_FLOAT:
                        begin
                        if (pDouble(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^/
                                                           pDouble(RightToken.Value)^);
                        end;
                     TYPE_BCD:
                        begin
                        if (TBCDToCurr(pBCD(RightToken.Value)^)=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((pSmallInt(LeftToken.Value)^/
                                                         TBCDToCurr(pBCD(RightToken.Value)^)),
                                                         RightToken.DataDecimals);
                        end;
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^/
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^/
                                                            pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^/
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^/
                                                            pInt64(RightToken.Value)^);
                        end;
                     TYPE_FLOAT:
                        begin
                        if (pDouble(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pWord(LeftToken.Value)^/
                                                           pDouble(RightToken.Value)^);
                        end;
                     TYPE_BCD:
                        begin
                        if (TBCDToCurr(pBCD(RightToken.Value)^)=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((pWord(LeftToken.Value)^/
                                                            TBCDToCurr(pBCD(RightToken.Value)^)),
                                                            RightToken.DataDecimals);
                        end;
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^/
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^/
                                                            pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^/
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^/
                                                            pInt64(RightToken.Value)^);
                        end;
                     TYPE_FLOAT:
                        begin
                        if (pDouble(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInteger(LeftToken.Value)^/
                                                           pDouble(RightToken.Value)^);
                        end;
                     TYPE_BCD:
                        begin
                        if (TBCDToCurr(pBCD(RightToken.Value)^)=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((pInteger(LeftToken.Value)^/
                                                            TBCDToCurr(pBCD(RightToken.Value)^)),
                                                            RightToken.DataDecimals);
                        end;
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^/
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^/
                                                            pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^/
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^/
                                                            pInt64(RightToken.Value)^);
                        end;
                     TYPE_FLOAT:
                        begin
                        if (pDouble(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pInt64(LeftToken.Value)^/
                                                           pDouble(RightToken.Value)^);
                        end;
                     TYPE_BCD:
                        begin
                        if (TBCDToCurr(pBCD(RightToken.Value)^)=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((pInt64(LeftToken.Value)^/
                                                            TBCDToCurr(pBCD(RightToken.Value)^)),
                                                            RightToken.DataDecimals);
                        end;
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^/
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^/
                                                            pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^/
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^/
                                                            pInt64(RightToken.Value)^);
                        end;
                     TYPE_FLOAT:
                        begin
                        if (pDouble(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^/
                                                           pDouble(RightToken.Value)^);
                        end;
                     TYPE_BCD:
                        begin
                        if (TBCDToCurr(pBCD(RightToken.Value)^)=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(pDouble(LeftToken.Value)^/
                                                           TBCDToCurr(pBCD(RightToken.Value)^));
                        end;
                     end;
                  end;
               TYPE_BCD:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)/
                                                            pSmallInt(RightToken.Value)^),
                                                            LeftToken.DataDecimals);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)/
                                                            pWord(RightToken.Value)^),
                                                            LeftToken.DataDecimals);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then

                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)/
                                                            pInteger(RightToken.Value)^),
                                                            LeftToken.DataDecimals);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)/
                                                            pInt64(RightToken.Value)^),
                                                            LeftToken.DataDecimals);
                        end;
                     TYPE_FLOAT:
                        begin
                        if (pDouble(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pDouble(ResultToken.Value)^:=(TBCDToCurr(pBCD(LeftToken.Value)^)/
                                                          pDouble(RightToken.Value)^);
                        end;
                     TYPE_BCD:
                        begin
                        if (TBCDToCurr(pBCD(RightToken.Value)^)=0) then
                           ResultToken.IsNull:=True
                        else
                           pBCD(ResultToken.Value)^:=CurrToTBCD((TBCDToCurr(pBCD(LeftToken.Value)^)/
                                                            TBCDToCurr(pBCD(RightToken.Value)^)),
                                                            LeftToken.DataDecimals);
                        end;
                     end;
                  end;
               end;
            end;
         eoMOD:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end
            else if LeftToken.IsNull and RightToken.IsNull then
               begin
               FillChar(ResultToken.Value^,ResultToken.DataSize,#0);
               ResultToken.IsNull:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_INT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ mod
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ mod
                                                           pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ mod
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInt64(ResultToken.Value)^:=(pSmallInt(LeftToken.Value)^ mod
                                                            pInt64(RightToken.Value)^);
                        end;
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^ mod
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^ mod
                                                            pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pWord(LeftToken.Value)^ mod
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInt64(ResultToken.Value)^:=(pWord(LeftToken.Value)^ mod
                                                            pInt64(RightToken.Value)^);
                        end;
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ mod
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ mod
                                                            pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInteger(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ mod
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInt64(ResultToken.Value)^:=(pInteger(LeftToken.Value)^ mod
                                                            pInt64(RightToken.Value)^);
                        end;
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightToken.DataType of
                     TYPE_INT16:
                        begin
                        if (pSmallInt(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ mod
                                                            pSmallInt(RightToken.Value)^);
                        end;
                     TYPE_UINT16:
                        begin
                        if (pWord(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ mod
                                                            pWord(RightToken.Value)^);
                        end;
                     TYPE_INT32:
                        begin
                        if (pInteger(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ mod
                                                            pInteger(RightToken.Value)^);
                        end;
                     TYPE_INT64:
                        begin
                        if (pInt64(RightToken.Value)^=0) then
                           ResultToken.IsNull:=True
                        else
                           pInt64(ResultToken.Value)^:=(pInt64(LeftToken.Value)^ mod
                                                            pInt64(RightToken.Value)^);
                        end;
                     end;
                  end;
               end;
            end;
         end;
   finally
      if (ResultToken.DataType=TYPE_BOOL) then
         pWordBool(ResultToken.Value)^:=VerifyWordBool(pWordBool(ResultToken.Value)^);
   end;
end;

procedure EvaluateCompare(Operator: TExpOperator; PartialLength: Word;
                          IsCaseInsensitive: Boolean; LeftToken: TExpToken;
                          RightToken: TExpToken; ResultToken: TExpToken;
                          LocaleID: Integer);
begin
   try
      case Operator of
         eoEQ:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               pWordBool(ResultToken.Value)^:=False;
               Exit;
               end
            else if (LeftToken.IsNull and RightToken.IsNull) then
               begin
               pWordBool(ResultToken.Value)^:=True;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_UNKNOWN:
                  pWordBool(ResultToken.Value)^:=RightToken.IsNull;
               TYPE_ZSTRING,TYPE_BLOB:
                  begin
                  case RightToken.DataType of
                     TYPE_ZSTRING,TYPE_BLOB:
                        begin
                        if (PartialLength > 0) then
                           pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,
                                                                          LeftToken.Value,
                                                                          RightToken.Value,
                                                                          PartialLength,IsCaseInsensitive)=CMP_EQUAL)
                        else
                           pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,
                                                                          LeftToken.Value,
                                                                          RightToken.Value,
                                                                          0,IsCaseInsensitive)=CMP_EQUAL);
                        end;
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=LeftToken.IsNull;
                     end;
                  end;
               end;
            end;
         eoNE:
            begin
            if LeftToken.IsNull and (not RightToken.IsNull) or
               RightToken.IsNull and (not LeftToken.IsNull) then
               begin
               pWordBool(ResultToken.Value)^:=True;
               Exit;
               end
            else if LeftToken.IsNull and RightToken.IsNull then
               begin
               pWordBool(ResultToken.Value)^:=False;
               Exit;
               end;
            case LeftToken.DataType of
               TYPE_UNKNOWN:
                  pWordBool(ResultToken.Value)^:=(not RightToken.IsNull);
               TYPE_ZSTRING,TYPE_BLOB:
                  begin
                   case RightToken.DataType of
                     TYPE_ZSTRING,TYPE_BLOB:
                        begin
                        if (PartialLength > 0) then
                           pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,
                                                                          LeftToken.Value,
                                                                          RightToken.Value,
                                                                          PartialLength,IsCaseInsensitive) <> CMP_EQUAL)
                        else
                           pWordBool(ResultToken.Value)^:=(OSCompareStrings(LocaleID,
                                                                          LeftToken.Value,
                                                                          RightToken.Value,
                                                                          0,IsCaseInsensitive) <> CMP_EQUAL);
                        end;
                     TYPE_UNKNOWN:
                        pWordBool(ResultToken.Value)^:=(not LeftToken.IsNull);
                     end;
                  end;
               end;
            end;
         end;
   finally
      if (ResultToken.DataType=TYPE_BOOL) then
         pWordBool(ResultToken.Value)^:=VerifyWordBool(pWordBool(ResultToken.Value)^);
   end;
end;

procedure ConvertConstant(SourceDataType: Byte; SourceBuffer: PChar;
                          DestDataType: Byte; DestDataDecimals: Byte;
                          DestBuffer: PChar;
                          var RangeError: Boolean);
var
   TempTimeStamp: TTimeStamp;
begin
   RangeError:=False;
   case DestDataType of
      TYPE_BOOL:
         begin
         case SourceDataType of
            TYPE_INT16:
               pWordBool(DestBuffer)^:=VerifyWordBool(pSmallInt(SourceBuffer)^ <> 0);
            TYPE_UINT16:
               pWordBool(DestBuffer)^:=VerifyWordBool(pWord(SourceBuffer)^ <> 0);
            TYPE_INT32:
               pWordBool(DestBuffer)^:=VerifyWordBool(pInteger(SourceBuffer)^ <> 0);
            TYPE_INT64:
               pWordBool(DestBuffer)^:=VerifyWordBool(pInt64(SourceBuffer)^ <> 0);
            end;
         end;
      TYPE_INT16:
         begin
         case SourceDataType of
            TYPE_BOOL:
               begin
               if pWordBool(SourceBuffer)^ then
                  pSmallInt(DestBuffer)^:=1
               else
                  pSmallInt(DestBuffer)^:=0;
               end;
            TYPE_UINT16:
               begin
               if (Integer(pWord(SourceBuffer)^) > Integer(High(SmallInt))) then
                  begin
                  pSmallInt(DestBuffer)^:=High(SmallInt);
                  RangeError:=True;
                  end
               else
                  pSmallInt(DestBuffer)^:=pWord(SourceBuffer)^;
               end;
            TYPE_INT32:
               begin
               if (pInteger(SourceBuffer)^ > High(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=High(SmallInt);
                  RangeError:=True;
                  end
               else if (pInteger(SourceBuffer)^ < Low(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=Low(SmallInt);
                  RangeError:=True;
                  end
               else
                  pSmallInt(DestBuffer)^:=pInteger(SourceBuffer)^;
               end;
            TYPE_INT64:
               begin
               if (pInt64(SourceBuffer)^ > High(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=High(SmallInt);
                  RangeError:=True;
                  end
               else if (pInt64(SourceBuffer)^ < Low(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=Low(SmallInt);
                  RangeError:=True;
                  end
               else
                  pSmallInt(DestBuffer)^:=pInt64(SourceBuffer)^;
               end;
            TYPE_FLOAT:
               begin
               if (Trunc(pDouble(SourceBuffer)^) > High(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=High(SmallInt);
                  RangeError:=True;
                  end
               else if (Trunc(pDouble(SourceBuffer)^) < Low(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=Low(SmallInt);
                  RangeError:=True;
                  end
               else
                  pSmallInt(DestBuffer)^:=Trunc(pDouble(SourceBuffer)^);
               end;
            TYPE_BCD:
               begin
               if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) > High(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=High(SmallInt);
                  RangeError:=True;
                  end
               else if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) < Low(SmallInt)) then
                  begin
                  pSmallInt(DestBuffer)^:=Low(SmallInt);
                  RangeError:=True;
                  end
               else
                  pSmallInt(DestBuffer)^:=Trunc(TBCDToCurr(pBCD(SourceBuffer)^));
               end;
            end;
         end;
      TYPE_UINT16:
         begin
         case SourceDataType of
            TYPE_BOOL:
               begin
               if pWordBool(SourceBuffer)^ then
                  pWord(DestBuffer)^:=1
               else
                  pWord(DestBuffer)^:=0;
               end;
            TYPE_INT16:
               pWord(DestBuffer)^:=pSmallInt(SourceBuffer)^;
            TYPE_INT32:
               begin
               if (pInteger(SourceBuffer)^ > High(Word)) then
                  begin
                  pWord(DestBuffer)^:=High(Word);
                  RangeError:=True;
                  end
               else if (pInteger(SourceBuffer)^ < Low(Word)) then
                  begin
                  pWord(DestBuffer)^:=Low(Word);
                  RangeError:=True;
                  end
               else
                  pWord(DestBuffer)^:=pInteger(SourceBuffer)^;
               end;
            TYPE_INT64:
               begin
               if (pInt64(SourceBuffer)^ > High(Word)) then
                  begin
                  pWord(DestBuffer)^:=High(Word);
                  RangeError:=True;
                  end
               else if (pInt64(SourceBuffer)^ < Low(Word)) then
                  begin
                  pWord(DestBuffer)^:=Low(Word);
                  RangeError:=True;
                  end
               else
                  pWord(DestBuffer)^:=pInt64(SourceBuffer)^;
               end;
            TYPE_FLOAT:
               begin
               if (Trunc(pDouble(SourceBuffer)^) > High(Word)) then
                  begin
                  pWord(DestBuffer)^:=High(Word);
                  RangeError:=True;
                  end
               else if (Trunc(pDouble(SourceBuffer)^) < Low(Word)) then
                  begin
                  pWord(DestBuffer)^:=Low(Word);
                  RangeError:=True;
                  end
               else
                  pWord(DestBuffer)^:=Trunc(pDouble(SourceBuffer)^);
               end;
            TYPE_BCD:
               begin
               if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) > High(Word)) then
                  begin
                  pWord(DestBuffer)^:=High(Word);
                  RangeError:=True;
                  end
               else if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) < Low(Word)) then
                  begin
                  pWord(DestBuffer)^:=Low(Word);
                  RangeError:=True;
                  end
               else
                  pWord(DestBuffer)^:=Trunc(TBCDToCurr(pBCD(SourceBuffer)^));
               end;
            end;
         end;
      TYPE_INT32:
         begin
         case SourceDataType of
            TYPE_BOOL:
               begin
               if pWordBool(SourceBuffer)^ then
                  pInteger(DestBuffer)^:=1
               else
                  pInteger(DestBuffer)^:=0;
               end;
            TYPE_INT16:
               pInteger(DestBuffer)^:=pSmallInt(SourceBuffer)^;
            TYPE_UINT16:
               pInteger(DestBuffer)^:=pWord(SourceBuffer)^;
            TYPE_INT64:
               begin
               if (pInt64(SourceBuffer)^ > High(Integer)) then
                  begin
                  pInteger(DestBuffer)^:=High(Integer);
                  RangeError:=True;
                  end
               else if (pInt64(SourceBuffer)^ < Low(Integer)) then
                  begin
                  pInteger(DestBuffer)^:=Low(Integer);
                  RangeError:=True;
                  end
               else
                  pInteger(DestBuffer)^:=pInt64(SourceBuffer)^;
               end;
            TYPE_FLOAT:
               begin
               if (Trunc(pDouble(SourceBuffer)^) > High(Integer)) then
                  begin
                  pInteger(DestBuffer)^:=High(Integer);
                  RangeError:=True;
                  end
               else if (Trunc(pDouble(SourceBuffer)^) < Low(Integer)) then
                  begin
                  pInteger(DestBuffer)^:=Low(Integer);
                  RangeError:=True;
                  end
               else
                  pInteger(DestBuffer)^:=Trunc(pDouble(SourceBuffer)^);
               end;
            TYPE_BCD:
               begin
               if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) > High(Integer)) then
                  begin
                  pInteger(DestBuffer)^:=High(Integer);
                  RangeError:=True;
                  end
               else if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) < Low(Integer)) then
                  begin
                  pInteger(DestBuffer)^:=Low(Integer);
                  RangeError:=True;
                  end
               else
                  pInteger(DestBuffer)^:=Trunc(TBCDToCurr(pBCD(SourceBuffer)^));
               end;
            end;
         end;
      TYPE_INT64:
         begin
         case SourceDataType of
            TYPE_BOOL:
               begin
               if pWordBool(SourceBuffer)^ then
                  pInt64(DestBuffer)^:=1
               else
                  pInt64(DestBuffer)^:=0;
               end;
            TYPE_INT16:
               pInt64(DestBuffer)^:=pSmallInt(SourceBuffer)^;
            TYPE_UINT16:
               pInt64(DestBuffer)^:=pWord(SourceBuffer)^;
            TYPE_INT32:
               pInt64(DestBuffer)^:=pInteger(SourceBuffer)^;
            TYPE_FLOAT:
               begin
               if (Trunc(pDouble(SourceBuffer)^) > High(Int64)) then
                  begin
                  pInt64(DestBuffer)^:=High(Int64);
                  RangeError:=True;
                  end
               else if (Trunc(pDouble(SourceBuffer)^) < Low(Int64)) then
                  begin
                  pInt64(DestBuffer)^:=Low(Int64);
                  RangeError:=True;
                  end
               else
                  pInt64(DestBuffer)^:=Trunc(pDouble(SourceBuffer)^);
               end;
            TYPE_BCD:
               begin
               if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) > High(Int64)) then
                  begin
                  pInt64(DestBuffer)^:=High(Int64);
                  RangeError:=True;
                  end
               else if (Trunc(TBCDToCurr(pBCD(SourceBuffer)^)) < Low(Int64)) then
                  begin
                  pInt64(DestBuffer)^:=Low(Int64);
                  RangeError:=True;
                  end
               else
                  pInt64(DestBuffer)^:=Trunc(TBCDToCurr(pBCD(SourceBuffer)^));
               end;
            end;
         end;
      TYPE_FLOAT:
         begin
         case SourceDataType of
            TYPE_INT16:
               pDouble(DestBuffer)^:=pSmallInt(SourceBuffer)^;
            TYPE_UINT16:
               pDouble(DestBuffer)^:=pWord(SourceBuffer)^;
            TYPE_INT32:
               pDouble(DestBuffer)^:=pInteger(SourceBuffer)^;
            TYPE_INT64:
               pDouble(DestBuffer)^:=pInt64(SourceBuffer)^;
            TYPE_BCD:
               pDouble(DestBuffer)^:=TBCDToCurr(pBCD(SourceBuffer)^);
            end;
         end;
      TYPE_BCD:
         begin
         case SourceDataType of
            TYPE_INT16:
               pBCD(DestBuffer)^:=CurrToTBCD(pSmallInt(SourceBuffer)^,
                                                DestDataDecimals);
            TYPE_UINT16:
               pBCD(DestBuffer)^:=CurrToTBCD(pWord(SourceBuffer)^,
                                                DestDataDecimals);
            TYPE_INT32:
               pBCD(DestBuffer)^:=CurrToTBCD(pInteger(SourceBuffer)^,
                                                DestDataDecimals);
            TYPE_INT64:
               pBCD(DestBuffer)^:=CurrToTBCD(pInt64(SourceBuffer)^,
                                                DestDataDecimals);
            TYPE_FLOAT:
               pBCD(DestBuffer)^:=CurrToTBCD(pDouble(SourceBuffer)^,
                                                 DestDataDecimals);
            end;
         end;
      TYPE_DATE:
         begin
         if(SourceDataType=TYPE_TIMESTAMP) then
            begin
            TempTimeStamp:=MSecsToTimeStamp(pDouble(SourceBuffer)^);
            pInteger(DestBuffer)^:=TempTimeStamp.Date;
            end;
         end;
      TYPE_TIMESTAMP:
         begin
         if(SourceDataType=TYPE_DATE) then
            begin
            TempTimeStamp.Date:=pInteger(SourceBuffer)^;
            TempTimeStamp.Time:=0;
            pDouble(DestBuffer)^:=TimeStampToMSecs(TempTimeStamp);
            end;
         end;
      end;
end;

function EndsWithWildCard(Value: PChar; WildcardValue: PChar;
                          EscapeChar: Char): Boolean;
var
   StrPtr: PChar;
begin
   Result:=False;
   if (StrLen(Value) > 0) then
      begin
      if (Value^ <> WildcardValue^) or
         ((Value^=WildcardValue^) and (Value^=EscapeChar)) then
         begin
         if (AnsiStrPos(Value,WildcardValue)=(StrEnd(Value)-1)) then
            begin
            if ((StrEnd(Value)-2) > Value) then
               begin
               if ((StrEnd(Value)-2)^ <> EscapeChar) then
                  Result:=True;
               end
            else
               Result:=True;
            end
         else
            begin
            StrPtr:=AnsiStrPos(Value,WildcardValue);
            { Version 5 }
            while (StrPtr <> nil) and
                  (((StrPtr+1)^=WildcardValue^) or
                   (((StrPtr-1) > Value) and ((StrPtr-1)^=EscapeChar))) do
            { Version 5 } 
               begin
               StrPtr:=AnsiStrPos((StrPtr+1),WildcardValue);
               if (StrPtr=nil) or (StrPtr > (StrEnd(Value)-2)) then
                  begin
                  if ((StrPtr-1) > Value) then
                     begin
                     if ((StrPtr-1)^ <> EscapeChar) then
                        Result:=True;
                     end;
                  Break;
                  end
               end;
            end;
         end
      else if (Value^=WildcardValue^) and (Value^ <> EscapeChar) then
         begin
         StrPtr:=Value;
         while (StrPtr <> StrEnd(Value)) and (StrPtr^=WildcardValue^) do
            Inc(StrPtr);
         if (StrPtr=StrEnd(Value)) then
            Result:=True;
         end;
      end;
end;

function BuildNextFilterExpression(NextToken: TExpToken;
                                   ClientData: Integer;
                                   FieldCallback: pEvaluateFieldCallback;
                                   LocaleID: Integer;
                                   IsCaseInsensitive: Boolean;
                                   NoPartialMatch: Boolean): TExpToken;
var
   StringLength: Integer;
   I: Integer;
   AllCaseInsensitive: Boolean;
   TempChar: Char;
   CurPtr: PChar;
begin
   Result:=nil;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            begin
            if (not ContainsFields(LeftExpToken)) then
               Result:=EvaluateConstant(NextToken,LeftExpToken,nil,
                                        ClientData,FieldCallback,
                                        LocaleID)
            else
               begin
               Result:=TExpToken.Create;
               Result.Copy(NextToken);
               Result.ArgumentExpTokens.Clear;
               Result.LeftExpToken:=BuildNextFilterExpression(LeftExpToken,
                                                               ClientData,
                                                               FieldCallback,
                                                               LocaleID,
                                                               IsCaseInsensitive,
                                                               NoPartialMatch)
               end;
            end;
         etBINARY:
            begin
            if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) then
               begin
               Result:=TExpToken.Create;
               Result.Copy(NextToken);
               Result.ArgumentExpTokens.Clear;
               if IsCaseInsensitiveField(LeftExpToken) and
                  IsCaseInsensitiveToken(RightExpToken) and
                  (LeftExpToken.TokenOperator=RightExpToken.TokenOperator) then
                  Result.CaseInsensitive:=True;
               Result.LeftExpToken:=BuildNextFilterExpression(LeftExpToken,
                                                            ClientData,
                                                            FieldCallback,
                                                            LocaleID,
                                                            IsCaseInsensitive,
                                                            NoPartialMatch);
               if (not ContainsFields(RightExpToken)) then
                  Result.RightExpToken:=EvaluateConstant(LeftExpToken,RightExpToken,
                                                         nil,ClientData,FieldCallback,
                                                         LocaleID)
               else
                  Result.RightExpToken:=BuildNextFilterExpression(RightExpToken,
                                                      ClientData,
                                                      FieldCallback,
                                                      LocaleID,
                                                      IsCaseInsensitive,
                                                      NoPartialMatch);
               if (Result.RightExpToken.TokenType=etCONST) then
                  begin
                  if (TokenOperator in [eoEQ,eoNE]) and
                     (Result.RightExpToken.DataType=TYPE_ZSTRING) then
                     begin
                     { Now we need to check for the special case of a
                       partial string match }
                     StringLength:=StrLen(Result.RightExpToken.Value);
                     if EndsWithWildCard(Result.RightExpToken.Value,
                                         PARSE_ASTERISK,#0) or
                                         IsCaseInsensitive then
                        begin
                        Result.TokenType:=etCOMPARE;
                        Result.CaseInsensitive:=IsCaseInsensitive;
                        if EndsWithWildCard(Result.RightExpToken.Value,
                                            PARSE_ASTERISK,#0) and
                           (not NoPartialMatch) then
                           begin
                           CurPtr:=(StrEnd(Result.RightExpToken.Value)-1);
                           { Remove the wildcards, being sure to respect the
                             escape character }
                           while (CurPtr >= Result.RightExpToken.Value) and
                                 (CurPtr^=PARSE_ASTERISK) do
                              begin
                              Dec(CurPtr);
                              Dec(StringLength);
                              end;
                           if (StringLength=0) then
                              begin
                              Result.TokenType:=etBINARY;
                              with Result.LeftExpToken do
                                 begin
                                 TokenType:=etCONST;
                                 DataType:=TYPE_BOOL;
                                 SubType:=SUBTYPE_UNKNOWN;
                                 DataSize:=TYPE_BOOL_SIZE;
                                 pWordBool(Value)^:=VerifyWordBool(WordBool(True));
                                 end;
                              with Result.RightExpToken do
                                 begin
                                 TokenType:=etCONST;
                                 DataType:=TYPE_BOOL;
                                 SubType:=SUBTYPE_UNKNOWN;
                                 DataSize:=TYPE_BOOL_SIZE;
                                 pWordBool(Value)^:=VerifyWordBool(WordBool(True));
                                 end;
                              end
                           else
                              begin
                              Result.PartialLength:=StringLength;
                              Result.RightExpToken.DataSize:=(StringLength+1);
                              (Result.RightExpToken.Value+StringLength)^:=#0;
                              end;
                           end
                        else
                           Result.PartialLength:=0;
                        end;
                     end;
                  end;
               end
            else
               begin
               Result:=TExpToken.Create;
               Result.Copy(NextToken);
               Result.ArgumentExpTokens.Clear;
               if (not ContainsFields(LeftExpToken)) then
                  Result.LeftExpToken:=EvaluateConstant(LeftExpToken,LeftExpToken,
                                                        nil,ClientData,FieldCallback,
                                                        LocaleID)
               else
                  Result.LeftExpToken:=BuildNextFilterExpression(LeftExpToken,
                                                               ClientData,
                                                               FieldCallback,
                                                               LocaleID,
                                                               IsCaseInsensitive,
                                                               NoPartialMatch);
               if (not ContainsFields(RightExpToken)) then
                  Result.RightExpToken:=EvaluateConstant(RightExpToken,RightExpToken,
                                                         nil,ClientData,FieldCallback,
                                                         LocaleID)
               else
                  Result.RightExpToken:=BuildNextFilterExpression(RightExpToken,
                                                               ClientData,
                                                               FieldCallback,
                                                               LocaleID,
                                                               IsCaseInsensitive,
                                                               NoPartialMatch);
               end;
            end;
         etEXTBINARY:
            begin
            Result:=TExpToken.Create;
            Result.Copy(NextToken);
            Result.ArgumentExpTokens.Clear;
            case TokenOperator of
               eoLIKE,eoNOTLIKE:
                  begin
                  if IsCaseInsensitiveField(ArgumentExpToken[0]) and
                     IsCaseInsensitiveToken(ArgumentExpToken[1]) and
                     (ArgumentExpToken[0].TokenOperator=ArgumentExpToken[1].TokenOperator) then
                     Result.CaseInsensitive:=True;
                  Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[0],
                                                                        ClientData,
                                                                        FieldCallback,
                                                                        LocaleID,
                                                                        IsCaseInsensitive,
                                                                        NoPartialMatch));
                  if (not ContainsFields(ArgumentExpToken[1])) then
                     Result.ArgumentExpTokens.Add(EvaluateConstant(ArgumentExpToken[0],
                                                                   ArgumentExpToken[1],
                                                                   nil,ClientData,
                                                                   FieldCallback,
                                                                   LocaleID))
                  else
                     Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[1],
                                                                           ClientData,
                                                                           FieldCallback,
                                                                           LocaleID,
                                                                           IsCaseInsensitive,
                                                                           NoPartialMatch));
                  if (ArgumentExpToken[2] <> nil) then
                     begin
                     Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[2],
                                                                           ClientData,
                                                                           FieldCallback,
                                                                           LocaleID,
                                                                           IsCaseInsensitive,
                                                                           NoPartialMatch));
                     TempChar:=Result.ArgumentExpToken[2].Value^;
                     end
                  else
                     TempChar:=#0;
                  if (Result.ArgumentExpToken[1].DataType=TYPE_ZSTRING) then
                     begin
                     StringLength:=StrLen(Result.ArgumentExpToken[1].Value);
                     if EndsWithWildCard(Result.ArgumentExpToken[1].Value,
                                         PARSE_WILD_MULTIPLE,TempChar) and
                        (AnsiStrPos(Result.ArgumentExpToken[1].Value,PARSE_WILD_SINGLE)=nil) then
                        begin
                        Result.TokenType:=etCOMPARE;
                        case TokenOperator of
                           eoLIKE: Result.TokenOperator:=eoEQ;
                           eoNOTLIKE: Result.TokenOperator:=eoNE;
                           end;
                        Result.LeftExpToken:=Result.ArgumentExpToken[0];
                        Result.RightExpToken:=Result.ArgumentExpToken[1];
                        Result.ArgumentExpTokens.Clear;
                        CurPtr:=(StrEnd(Result.RightExpToken.Value)-1);
                        { Remove the wildcards, being sure to respect the
                          escape character }
                        while (CurPtr >= Result.RightExpToken.Value) and
                              (CurPtr^=PARSE_WILD_MULTIPLE) do
                           begin
                           if ((CurPtr-1) >= Result.RightExpToken.Value) and
                              ((CurPtr-1)^=TempChar) then
                              begin
                              (CurPtr-1)^:=CurPtr^;
                              Dec(CurPtr,2);
                              end
                           else
                              Dec(CurPtr);
                           Dec(StringLength);
                           end;
                        { Handle nothing but wildcards by converting it
                          to a simple True=True expression }
                        if (StringLength=0) then
                           begin
                           Result.TokenType:=etBINARY;
                           with Result.LeftExpToken do
                              begin
                              TokenType:=etCONST;
                              DataType:=TYPE_BOOL;
                              SubType:=SUBTYPE_UNKNOWN;
                              DataSize:=TYPE_BOOL_SIZE;
                              pWordBool(Value)^:=VerifyWordBool(WordBool(True));
                              end;
                           with Result.RightExpToken do
                              begin
                              TokenType:=etCONST;
                              DataType:=TYPE_BOOL;
                              SubType:=SUBTYPE_UNKNOWN;
                              DataSize:=TYPE_BOOL_SIZE;
                              pWordBool(Value)^:=VerifyWordBool(WordBool(True));
                              end;
                           end
                        else
                           begin
                           Result.PartialLength:=StringLength;
                           Result.RightExpToken.DataSize:=(StringLength+1);
                           (Result.RightExpToken.Value+StringLength)^:=#0;
                           end;
                        end;
                     end;
                  end;
               eoBETWEEN,eoNOTBETWEEN,eoIN,eoNOTIN:
                  begin
                  AllCaseInsensitive:=True;
                  for I:=1 to ArgumentExpTokens.Count-1 do
                     begin
                     if (not (IsCaseInsensitiveField(ArgumentExpToken[0]) and
                              IsCaseInsensitiveToken(ArgumentExpToken[I]) and
                              (ArgumentExpToken[0].TokenOperator=ArgumentExpToken[I].TokenOperator))) then
                        begin
                        AllCaseInsensitive:=False;
                        Break;
                        end;
                     end;
                  Result.CaseInsensitive:=AllCaseInsensitive;
                  Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[0],
                                                                        ClientData,
                                                                        FieldCallback,
                                                                        LocaleID,
                                                                        IsCaseInsensitive,
                                                                        NoPartialMatch));
                  for I:=1 to ArgumentExpTokens.Count-1 do
                     begin
                     if (not ContainsFields(ArgumentExpToken[I])) then
                        Result.ArgumentExpTokens.Add(EvaluateConstant(ArgumentExpToken[0],
                                                                      ArgumentExpToken[I],
                                                                      nil,ClientData,
                                                                      FieldCallback,
                                                                      LocaleID))
                     else
                        Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[I],
                                                                              ClientData,
                                                                              FieldCallback,
                                                                              LocaleID,
                                                                              IsCaseInsensitive,
                                                                              NoPartialMatch));
                     end;
                  end;
               eoSUBIN,eoNOTSUBIN:
                  begin
                  Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[0],
                                                                        ClientData,
                                                                        FieldCallback,
                                                                        LocaleID,
                                                                        IsCaseInsensitive,
                                                                        NoPartialMatch));
                  Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[1],
                                                                        ClientData,
                                                                        FieldCallback,
                                                                        LocaleID,
                                                                        IsCaseInsensitive,
                                                                        NoPartialMatch));
                  end;
               end;
            end;
         etFUNC:
            begin
            Result:=TExpToken.Create;
            Result.Copy(NextToken);
            Result.ArgumentExpTokens.Clear;
            for I:=0 to ArgumentExpTokens.Count-1 do
               begin
               if (not ContainsFields(ArgumentExpToken[I])) then
                  Result.ArgumentExpTokens.Add(EvaluateConstant(ArgumentExpToken[I],
                                                                ArgumentExpToken[I],
                                                                nil,ClientData,
                                                                FieldCallback,
                                                                LocaleID))
               else
                  Result.ArgumentExpTokens.Add(BuildNextFilterExpression(ArgumentExpToken[I],
                                                                        ClientData,
                                                                        FieldCallback,
                                                                        LocaleID,
                                                                        IsCaseInsensitive,
                                                                        NoPartialMatch));
               end;
            end;
         etFIELD,etCONST:
            begin
            Result:=TExpToken.Create;
            Result.Copy(NextToken);
            Result.ArgumentExpTokens.Clear;
            end;
         end;
      end;
end;

function EvaluateConstant(DestToken: TExpToken; ConstantToken: TExpToken;
                          RecordBuffer: PChar; ClientData: Integer;
                          FieldCallback: pEvaluateFieldCallback;
                          LocaleID: Integer): TExpToken;
var
   TempFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   RangeError: Boolean;
begin
   Result:=TExpToken.Create;
   Result.TokenType:=etCONST;
   EvaluateExpressionToken(ConstantToken,RecordBuffer,ClientData,
                           FieldCallback,LocaleID);
   Result.CopyValue(ConstantToken);
   { Version 5}
   if (Result.DataType <> TYPE_ZSTRING) then
      begin
      if (Result.DataType <> DestToken.DataType) then
         begin
         if (not Result.IsNull) then
            begin
            ConvertConstant(Result.DataType,Result.Value,
                            DestToken.DataType,DestToken.DataDecimals,
                            @TempFieldBuffer,RangeError);
            Move(TempFieldBuffer,Result.Value^,DestToken.DataSize);
            end;
         Result.DataType:=DestToken.DataType;
         Result.SubType:=DestToken.SubType;
         Result.DataSize:=DestToken.DataSize;
         Result.DataDecimals:=DestToken.DataDecimals;
         if RangeError then
            Result.InvalidValue:=True;
         end;
      end;
   { Version 5}
end;

procedure ReverseBinaryOperator(NextToken: TExpToken);
begin
   with NextToken do
      begin
      case TokenOperator of
         eoEQ: TokenOperator:=eoEQ;
         eoNE: TokenOperator:=eoNE;
         eoGT: TokenOperator:=eoLT;
         eoGE: TokenOperator:=eoLE;
         eoLT: TokenOperator:=eoGT;
         eoLE: TokenOperator:=eoGE;
         end;
      end;
end;

procedure ReverseBinaryTokens(NextToken: TExpToken);
var
   TempToken: TExpToken;
begin
   with NextToken do
      begin
      TempToken:=RightExpToken;
      RightExpToken:=LeftExpToken;
      LeftExpToken:=TempToken;
      end;
end;

procedure ReverseBinaryTokenOperator(NextToken: TExpToken);
begin
   ReverseBinaryOperator(NextToken);
   ReverseBinaryTokens(NextToken);
end;

procedure SwitchTokens(LeftToken: TExpToken; RightToken: TExpToken);
var
   TempLeftUpperToken: TExpToken;
   TempRightUpperToken: TExpToken;
begin
   TempLeftUpperToken:=LeftToken.UpperExpToken;
   TempRightUpperToken:=RightToken.UpperExpToken;
   { Replace the left side first }
   if (TempLeftUpperToken.LeftExpToken=LeftToken) then
      begin
      TempLeftUpperToken.LeftExpToken:=RightToken;
      TempLeftUpperToken.LeftExpToken.UpperExpToken:=TempRightUpperToken;
      end
   else
      begin
      TempLeftUpperToken.RightExpToken:=RightToken;
      TempLeftUpperToken.RightExpToken.UpperExpToken:=TempRightUpperToken;
      end;
   { Now the right }
   if (TempRightUpperToken.LeftExpToken=RightToken) then
      begin
      TempRightUpperToken.LeftExpToken:=LeftToken;
      TempRightUpperToken.LeftExpToken.UpperExpToken:=TempLeftUpperToken;
      end
   else
      begin
      TempRightUpperToken.RightExpToken:=LeftToken;
      TempRightUpperToken.RightExpToken.UpperExpToken:=TempLeftUpperToken;
      end;
end;

procedure AddTokens(var DestTokens: TExpToken; NextToken: TExpToken);
var
   TempToken: TExpToken;
begin
   if (DestTokens=nil) then
      DestTokens:=NextToken
   else
      begin
      TempToken:=TExpToken.Create;
      with TempToken do
         begin
         TokenLiteral:=PARSE_AND;
         TokenType:=etBINARY;
         TokenOperator:=eoAND;
         DataType:=TYPE_BOOL;
         LeftExpToken:=DestTokens;
         RightExpToken:=NextToken;
         end;
      DestTokens:=TempToken;
      end;
end;

{ Version 5 }
function ContainsNots(NextToken: TExpToken): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=(TokenOperator=eoNOT);
         etBINARY,etCOMPARE:
            Result:=(ContainsNots(LeftExpToken) or
                     ContainsNots(RightExpToken));
         etEXTBINARY,etFUNC:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               Result:=(Result or ContainsNots(ArgumentExpToken[I]));
            end;
         end;
      end;
end;
{ Version 5 }

function ContainsFields(NextToken: TExpToken): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=ContainsFields(LeftExpToken);
         etBINARY,etCOMPARE:
            Result:=(ContainsFields(LeftExpToken) or
                     ContainsFields(RightExpToken));
         etEXTBINARY,etFUNC:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               Result:=(Result or ContainsFields(ArgumentExpToken[I]));
            end;
         etFIELD:
            Result:=True;
         end;
      end;
end;

function ContainsFieldsOutsideAggregates(NextToken: TExpToken): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=ContainsFieldsOutsideAggregates(LeftExpToken);
         etBINARY,etCOMPARE:
            Result:=(ContainsFieldsOutsideAggregates(LeftExpToken) or
                     ContainsFieldsOutsideAggregates(RightExpToken));
         etEXTBINARY,etFUNC:
            begin
            if (not (TokenOperator in [eoSUM,eoRUNSUM,eoMIN,eoMAX,eoAVG,eoSTDDEV,eoCOUNT])) then
               begin
               for I:=0 to ArgumentExpTokens.Count-1 do
                  Result:=(Result or ContainsFieldsOutsideAggregates(ArgumentExpToken[I]));
               end;
            end;
         etFIELD:
            Result:=True;
         end;
      end;
end;

function ContainsConstants(NextToken: TExpToken): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=ContainsConstants(LeftExpToken);
         etBINARY,etCOMPARE:
            Result:=(ContainsConstants(LeftExpToken) or
                     ContainsConstants(RightExpToken));
         etEXTBINARY,etFUNC:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               Result:=(Result or ContainsConstants(ArgumentExpToken[I]));
            end;
         etCONST:
            Result:=True;
         end;
      end;
end;

{ Version 5 }
function ContainsTextSearch(NextToken: TExpToken): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=ContainsTextSearch(LeftExpToken);
         etBINARY,etCOMPARE:
            Result:=(ContainsTextSearch(LeftExpToken) or
                     ContainsTextSearch(RightExpToken));
         etEXTBINARY:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               Result:=(Result or ContainsTextSearch(ArgumentExpToken[I]));
            end;
         etFUNC:
            begin
            if (TokenOperator=eoTEXTSEARCH) then
               Result:=True
            else
               begin
               for I:=0 to ArgumentExpTokens.Count-1 do
                  Result:=(Result or ContainsTextSearch(ArgumentExpToken[I]));
               end;
            end;
         end;
      end;
end;
{ Version 5 }

function ContainsAggregates(NextToken: TExpToken): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=ContainsAggregates(LeftExpToken);
         etBINARY:
            Result:=(ContainsAggregates(LeftExpToken) or
                     ContainsAggregates(RightExpToken));
         etEXTBINARY:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               Result:=(Result or ContainsAggregates(ArgumentExpToken[I]));
            end;
         etFUNC:
            begin
            case TokenOperator of
               eoSUM,eoRUNSUM,eoMIN,eoMAX,eoAVG,eoSTDDEV,eoCOUNT:
                  Result:=True;
               else
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     Result:=(Result or ContainsAggregates(ArgumentExpToken[I]));
                  end;
               end;
            end;
         end;
      end;
end;

function ConvertToExtended(DataType: Byte; Buffer: PChar): Extended;
begin
   Result:=0;
   case DataType of
      TYPE_FLOAT:
         Result:=pDouble(Buffer)^;
      TYPE_BCD:
         Result:=TBCDToCurr(pBCD(Buffer)^);
      TYPE_INT16:
         Result:=pSmallInt(Buffer)^;
      TYPE_UINT16:
         Result:=pWord(Buffer)^;
      TYPE_INT32:
         Result:=pInteger(Buffer)^;
      TYPE_INT64:
         Result:=pInt64(Buffer)^;
      end;
end;

function ConvertToInteger(DataType: Byte; Buffer: PChar): Integer;
begin
   Result:=0;
   case DataType of
      TYPE_INT16:
         Result:=pSmallInt(Buffer)^;
      TYPE_UINT16:
         Result:=pWord(Buffer)^;
      TYPE_INT32:
         Result:=pInteger(Buffer)^;
      TYPE_INT64:
         Result:=pInt64(Buffer)^;
      end;
end;

procedure EvaluateExpressionToken(NextToken: TExpToken;
                                  RecordBuffer: PChar;
                                  ClientData: Integer;
                                  FieldCallback: pEvaluateFieldCallback;
                                  LocaleID: Integer);
var
   TempStartPos: Integer;
   TempLength: Integer;
   TempCount: Integer;
   TempDecimals: Integer;
   EvaluateLeft: Boolean;
   I: Integer;
   FoundNonNulls: Boolean;
   TempChar: Char;
   TempExtended: Extended;
begin
   with NextToken do
      begin
      InvalidValue:=False;
      case TokenType of
         etUNARY:
            begin
            IsNull:=False;
            EvaluateExpressionToken(LeftExpToken,RecordBuffer,
                                    ClientData,FieldCallback,LocaleID);
            { Evaluate the unary operator }
            EvaluateUnary(TokenOperator,LeftExpToken,NextToken);
            end;
         etBINARY:
            begin
            IsNull:=False;
            if (TokenOperator in [eoOR,eoAND]) then
               begin
               EvaluateExpressionToken(RightExpToken,RecordBuffer,
                                       ClientData,FieldCallback,LocaleID);
               EvaluateLeft:=True;
               { Perform short-circuit boolean evaluation now }
               case TokenOperator of
                  eoOR:
                     begin
                     if pWordBool(RightExpToken.Value)^ then
                        EvaluateLeft:=False;
                     end;
                  eoAND:
                     begin
                     if (not pWordBool(RightExpToken.Value)^) then
                        EvaluateLeft:=False;
                     end;
                  end;
               if EvaluateLeft then
                  begin
                  EvaluateExpressionToken(LeftExpToken,RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  { Evaluate the binary operator }
                  EvaluateBinary(TokenOperator,LeftExpToken,RightExpToken,
                                 NextToken,LocaleID);
                  end
               else
                  pWordBool(Value)^:=pWordBool(RightExpToken.Value)^;
               end
            else
               begin
               EvaluateExpressionToken(LeftExpToken,RecordBuffer,
                                       ClientData,FieldCallback,LocaleID);
               EvaluateExpressionToken(RightExpToken,RecordBuffer,
                                       ClientData,FieldCallback,LocaleID);
               { Here we check the data type and operator and if we're
                 concatenating strings then we need to add the two
                 string sizes together }
               if (TokenOperator=eoADD) and
                  (LeftExpToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) and
                  (RightExpToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
                  begin
                  DataSize:=((LeftExpToken.DataSize-1)+(RightExpToken.DataSize-1)+1);
                  DataDecimals:=0;
                  end;
               { Evaluate the binary operator }
               EvaluateBinary(TokenOperator,LeftExpToken,RightExpToken,
                              NextToken,LocaleID);
               end;
            end;
         etCOMPARE:
            begin
            IsNull:=False;
            EvaluateExpressionToken(LeftExpToken,RecordBuffer,
                                    ClientData,FieldCallback,LocaleID);
            EvaluateExpressionToken(RightExpToken,RecordBuffer,
                                    ClientData,FieldCallback,LocaleID);
            { Evaluate the compare operator, but only for strings }
            if (LeftExpToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
               EvaluateCompare(TokenOperator,PartialLength,CaseInsensitive,
                               LeftExpToken,RightExpToken,NextToken,LocaleID)
            else
               EvaluateBinary(TokenOperator,LeftExpToken,RightExpToken,
                              NextToken,LocaleID);
            end;
         etEXTBINARY:
            begin
            IsNull:=False;
            case TokenOperator of
               eoLIKE,eoNOTLIKE:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (ArgumentExpToken[2] <> nil) then
                     TempChar:=ArgumentExpToken[2].Value^
                  else
                     TempChar:=#0;
                  { Evaluate the like operator }
                  if ((not ArgumentExpToken[0].IsNull) and
                      (not ArgumentExpToken[1].IsNull)) and
                     LikeString(LocaleID,ArgumentExpToken[0].Value,
                                ArgumentExpToken[1].Value,TempChar) then
                     pWordBool(Value)^:=True
                  else
                     pWordBool(Value)^:=False;
                  if (TokenOperator=eoNOTLIKE) then
                     pWordBool(Value)^:=(not pWordBool(Value)^);
                  pWordBool(Value)^:=VerifyWordBool(pWordBool(Value)^);
                  end;
               eoBETWEEN,eoNOTBETWEEN:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[2],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  { Evaluate the between operator }
                  EvaluateBinary(eoGE,ArgumentExpToken[0],ArgumentExpToken[1],
                                 NextToken,LocaleID);
                  if pWordBool(Value)^ then
                     EvaluateBinary(eoLE,ArgumentExpToken[0],ArgumentExpToken[2],
                                    NextToken,LocaleID);
                  if (TokenOperator=eoNOTBETWEEN) then
                     pWordBool(Value)^:=(not pWordBool(Value)^);
                  pWordBool(Value)^:=VerifyWordBool(pWordBool(Value)^);
                  end;
               eoIN,eoNOTIN:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  for I:=1 to ArgumentExpTokens.Count-1 do
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[I],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     { Evaluate the binary operator }
                     EvaluateBinary(eoEQ,ArgumentExpToken[0],ArgumentExpToken[I],
                                    NextToken,LocaleID);
                     if pWordBool(Value)^ then
                        Break;
                     end;
                  if (TokenOperator=eoNOTIN) then
                     pWordBool(Value)^:=(not pWordBool(Value)^);
                  pWordBool(Value)^:=VerifyWordBool(pWordBool(Value)^);
                  end;
               eoSUBIN,eoNOTSUBIN:
                  begin
                  with TDataQuery(ArgumentExpToken[1].SourceObject) do
                     begin
                     BuildSubSelectFilter(NextToken);
                     pWordBool(Value)^:=(ResultTable.RecordCount <> 0);
                     end;
                  if (TokenOperator=eoNOTSUBIN) then
                     pWordBool(Value)^:=(not pWordBool(Value)^);
                  pWordBool(Value)^:=VerifyWordBool(pWordBool(Value)^);
                  end;
               end;
            end;
         etFUNC:
            begin
            IsNull:=False;
            case TokenOperator of
               eoSUM,eoRUNSUM,eoCOUNT,eoMIN,eoMAX,eoAVG,eoSTDDEV:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  CopyValue(ArgumentExpToken[0]);
                  end;
               eoUPPER:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  CopyValue(ArgumentExpToken[0]);
                  OSUpperString(LocaleID,Value);
                  end;
               eoLOWER:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  CopyValue(ArgumentExpToken[0]);
                  OSLowerString(LocaleID,Value);
                  end;
               eoLEFT:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  TempLength:=ConvertToInteger(ArgumentExpToken[1].DataType,
                                               ArgumentExpToken[1].Value);
                  if (TempLength < 0) then
                     TempLength:=0;
                  DataSize:=(TempLength+1);
                  if (TempLength > 0) then
                     LeftString(ArgumentExpToken[0].Value,TempLength,Value);
                  (Value+TempLength)^:=#0;
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoRIGHT:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  TempLength:=ConvertToInteger(ArgumentExpToken[1].DataType,
                                               ArgumentExpToken[1].Value);
                  if (TempLength < 0) then
                     TempLength:=0;
                  DataSize:=(TempLength+1);
                  if (TempLength > 0) then
                     RightString(ArgumentExpToken[0].Value,TempLength,Value);
                  (Value+TempLength)^:=#0;
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoREPEAT:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  TempCount:=ConvertToInteger(ArgumentExpToken[1].DataType,
                                              ArgumentExpToken[1].Value);
                  if (TempCount < 0) then
                     TempCount:=0;
                  DataSize:=((((ArgumentExpToken[0].DataSize-1)*TempCount))+1);
                  if (TempCount > 0) then
                     RepeatString(ArgumentExpToken[0].Value,TempCount,Value);
                  (Value+(((ArgumentExpToken[0].DataSize-1)*TempCount)))^:=#0;
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoCONCAT:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  DataSize:=((ArgumentExpToken[0].DataSize-1)+
                             (ArgumentExpToken[1].DataSize-1)+1);
                  DataDecimals:=0;
                  { Evaluate the binary operator }
                  EvaluateBinary(eoADD,ArgumentExpToken[0],ArgumentExpToken[1],
                                 NextToken,LocaleID);
                  end;
               eoLENGTH:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pInteger(Value)^:=StrLen(ArgumentExpToken[0].Value)
                  else
                     pInteger(Value)^:=0;
                  end;
               eoSUBSTRING:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  TempStartPos:=ConvertToInteger(ArgumentExpToken[1].DataType,
                                                 ArgumentExpToken[1].Value);
                  if (TempStartPos <= 0) then
                     TempStartPos:=1;
                  TempLength:=(Integer(StrLen(ArgumentExpToken[0].Value))-TempStartPos+1);
                  if (ArgumentExpToken[2] <> nil) then
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[2],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     TempLength:=ConvertToInteger(ArgumentExpToken[2].DataType,
                                                  ArgumentExpToken[2].Value);
                     end;
                  if (TempLength < 0) then
                     TempLength:=0;
                  DataSize:=(TempLength+1);
                  if (TempLength > 0) then
                     StrLCopy(Value,(ArgumentExpToken[0].Value+TempStartPos-1),TempLength);
                  (Value+TempLength)^:=#0;
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoTRIMLEADING:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  CopyValue(ArgumentExpToken[1]);
                  LeftTrimString(Value,ArgumentExpToken[0].Value^);
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoTRIMTRAILING:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  CopyValue(ArgumentExpToken[1]);
                  RightTrimString(Value,ArgumentExpToken[0].Value^);
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoTRIMBOTH:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  CopyValue(ArgumentExpToken[1]);
                  TrimString(Value,ArgumentExpToken[0].Value^);
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoEXTRACTYEAR,eoEXTRACTMONTH,eoEXTRACTWEEK,eoEXTRACTDAY,eoEXTRACTDAYOFWEEK,
               eoEXTRACTDAYOFYEAR,eoEXTRACTHOUR,eoEXTRACTMINUTE,eoEXTRACTSECOND,eoEXTRACTMSECOND:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExtract(ArgumentExpToken[0],NextToken);
                  end;
               eoMSECSYEARS,eoMSECSDAYS,eoMSECSHOURS,eoMSECSMINS,eoMSECSSECS,eoMSECSMSECS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     TempExtended:=ConvertToExtended(ArgumentExpToken[0].DataType,
                                                     ArgumentExpToken[0].Value);
                     case TokenOperator of
                        eoMSECSYEARS:
                           pInteger(Value)^:=GetYearsFromMilliseconds(Trunc(TempExtended));
                        eoMSECSDAYS:
                           pInteger(Value)^:=GetDaysFromMilliseconds(Trunc(TempExtended));
                        eoMSECSHOURS:
                           pInteger(Value)^:=GetHoursFromMilliseconds(Trunc(TempExtended));
                        eoMSECSMINS:
                           pInteger(Value)^:=GetMinutesFromMilliseconds(Trunc(TempExtended));
                        eoMSECSSECS:
                           pInteger(Value)^:=GetSecondsFromMilliseconds(Trunc(TempExtended));
                        eoMSECSMSECS:
                           pInteger(Value)^:=GetMillisecondsFromMilliseconds(Trunc(TempExtended));
                        end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoPOS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[1].IsNull) then
                     pInteger(Value)^:=PosString(ArgumentExpToken[0].Value,
                                                 ArgumentExpToken[1].Value)
                  else
                     pInteger(Value)^:=0;
                  end;
               eoOCCURS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[1].IsNull) then
                     pInteger(Value)^:=OccursString(ArgumentExpToken[0].Value,
                                                    ArgumentExpToken[1].Value)
                  else
                     pInteger(Value)^:=0;
                  end;
               eoREPLACE:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[2],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  DataSize:=(CalculateReplaceSize(ArgumentExpToken[0].Value,
                                                  ArgumentExpToken[1].Value,
                                                  ArgumentExpToken[2].Value)+1);
                  if (DataSize > ArgumentExpToken[2].DataSize) then
                     ArgumentExpToken[2].DataSize:=DataSize;
                  ReplaceString(ArgumentExpToken[0].Value,
                                ArgumentExpToken[1].Value,
                                ArgumentExpToken[2].Value,Value);
                  if (StrLen(Value)=0) then
                     IsNull:=True;
                  end;
               eoCAST:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpression(NextToken,ArgumentExpToken[0]);
                  end;
               eoABS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     case ArgumentExpToken[0].DataType of
                        TYPE_FLOAT:
                           pDouble(Value)^:=Abs(pDouble(ArgumentExpToken[0].Value)^);
                        TYPE_BCD:
                           pBCD(Value)^:=CurrToTBCD(Abs(TBCDToCurr(pBCD(ArgumentExpToken[0].Value)^)),
                                                        ArgumentExpToken[0].DataDecimals);
                        TYPE_INT16:
                           pSmallInt(Value)^:=Abs(pSmallInt(ArgumentExpToken[0].Value)^);
                        TYPE_UINT16:
                           pWord(Value)^:=Abs(pWord(ArgumentExpToken[0].Value)^);
                        TYPE_INT32:
                           pInteger(Value)^:=Abs(pInteger(ArgumentExpToken[0].Value)^);
                        TYPE_INT64:
                           pInt64(Value)^:=Abs(pInt64(ArgumentExpToken[0].Value)^);
                        end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoROUND:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     TempDecimals:=0;
                     if (ArgumentExpToken[1] <> nil) then
                        begin
                        EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                                ClientData,FieldCallback,LocaleID);
                        TempDecimals:=ConvertToInteger(ArgumentExpToken[1].DataType,
                                                       ArgumentExpToken[1].Value);
                        end;
                     case ArgumentExpToken[0].DataType of
                        TYPE_FLOAT:
                           pDouble(Value)^:=RoundFloat(pDouble(ArgumentExpToken[0].Value)^,
                                                       TempDecimals);
                        TYPE_BCD:
                           pBCD(Value)^:=CurrToTBCD(RoundCurr(TBCDToCurr(pBCD(ArgumentExpToken[0].Value)^),
                                                    TempDecimals),DataDecimals);
                        TYPE_INT16:
                           pSmallInt(Value)^:=pSmallInt(ArgumentExpToken[0].Value)^;
                        TYPE_UINT16:
                           pWord(Value)^:=pWord(ArgumentExpToken[0].Value)^;
                        TYPE_INT32:
                           pInteger(Value)^:=pInteger(ArgumentExpToken[0].Value)^;
                        TYPE_INT64:
                           pInt64(Value)^:=pInt64(ArgumentExpToken[0].Value)^;
                        end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoMOD:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateBinary(TokenOperator,
                                 ArgumentExpToken[0],ArgumentExpToken[1],
                                 NextToken,LocaleID);
                  end;
               eoACOS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     try
                        pDouble(Value)^:=ArcCos(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                                  ArgumentExpToken[0].Value));
                     except
                        { Suppress divide-by-zero errors }
                        IsNull:=True;
                     end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoASIN:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     try
                        pDouble(Value)^:=ArcSin(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                                  ArgumentExpToken[0].Value));
                     except
                        { Suppress divide-by-zero errors }
                        IsNull:=True;
                     end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoATAN:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pDouble(Value)^:=ArcTan(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                               ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoCOS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pDouble(Value)^:=Cos(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                            ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoCOT:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     try
                        pDouble(Value)^:=Cotan(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                                 ArgumentExpToken[0].Value));
                     except
                        { Suppress divide-by-zero errors }
                        IsNull:=True;
                     end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoDEGREES:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pDouble(Value)^:=RadToDeg(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                                 ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoEXP:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     try
                        pDouble(Value)^:=Exp(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                               ArgumentExpToken[0].Value));
                     except
                        { Suppress divide-by-zero errors }
                        IsNull:=True;
                     end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoLOG:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     try
                        pDouble(Value)^:=Ln(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                              ArgumentExpToken[0].Value));
                     except
                        { Suppress divide-by-zero errors }
                        IsNull:=True;
                     end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoLOG10:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     try
                        pDouble(Value)^:=Log10(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                                 ArgumentExpToken[0].Value));
                     except
                        { Suppress divide-by-zero errors }
                        IsNull:=True;
                     end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoRADIANS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pDouble(Value)^:=DegToRad(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                                 ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoSIN:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pDouble(Value)^:=Sin(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                            ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoSQRT:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pDouble(Value)^:=Sqrt(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                             ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoTAN:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pDouble(Value)^:=Tan(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                            ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoATAN2:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not (ArgumentExpToken[0].IsNull or ArgumentExpToken[1].IsNull)) then
                     pDouble(Value)^:=ArcTan2(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                                ArgumentExpToken[0].Value),
                                              ConvertToExtended(ArgumentExpToken[1].DataType,
                                                                ArgumentExpToken[1].Value))
                  else
                     IsNull:=True;
                  end;
               eoCEILING:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pInt64(Value)^:=Ceil(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                            ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoFLOOR:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     pInt64(Value)^:=Floor(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                             ArgumentExpToken[0].Value))
                  else
                     IsNull:=True;
                  end;
               eoPI:
                  pDouble(Value)^:=Pi;
               eoPOWER:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not (ArgumentExpToken[0].IsNull or ArgumentExpToken[1].IsNull)) then
                     pDouble(Value)^:=Power(ConvertToExtended(ArgumentExpToken[0].DataType,
                                                              ArgumentExpToken[0].Value),
                                            ConvertToExtended(ArgumentExpToken[1].DataType,
                                                              ArgumentExpToken[1].Value))
                  else
                     IsNull:=True;
                  end;
               eoRAND:
                  begin
                  if (ArgumentExpToken[0] <> nil) then
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     if (not ArgumentExpToken[0].IsNull) then
                        pDouble(Value)^:=Random(ConvertToInteger(ArgumentExpToken[0].DataType,
                                                                 ArgumentExpToken[0].Value))
                     else
                        pDouble(Value)^:=Random;
                     end
                  else
                     pDouble(Value)^:=Random;
                  end;
               eoSIGN:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     TempExtended:=ConvertToExtended(ArgumentExpToken[0].DataType,
                                                     ArgumentExpToken[0].Value);
                     if (TempExtended < 0) then
                        pInteger(Value)^:=-1
                     else if (TempExtended=0) then
                        pInteger(Value)^:=0
                     else if (TempExtended > 0) then
                        pInteger(Value)^:=1;
                     end
                  else
                     IsNull:=True;
                  end;
               eoTRUNCATE:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if (not ArgumentExpToken[0].IsNull) then
                     begin
                     TempDecimals:=0;
                     if (ArgumentExpToken[1] <> nil) then
                        begin
                        EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                                ClientData,FieldCallback,LocaleID);
                        TempDecimals:=ConvertToInteger(ArgumentExpToken[1].DataType,
                                                       ArgumentExpToken[1].Value);
                        end;
                     case ArgumentExpToken[0].DataType of
                        TYPE_FLOAT:
                           pDouble(Value)^:=TruncateFloat(pDouble(ArgumentExpToken[0].Value)^,TempDecimals);
                        TYPE_BCD:
                           pBCD(Value)^:=CurrToTBCD(TruncateCurr(TBCDToCurr(pBCD(ArgumentExpToken[0].Value)^),TempDecimals),
                                                    ArgumentExpToken[0].DataDecimals);
                        TYPE_INT16:
                           pSmallInt(Value)^:=pSmallInt(ArgumentExpToken[0].Value)^;
                        TYPE_UINT16:
                           pWord(Value)^:=pWord(ArgumentExpToken[0].Value)^;
                        TYPE_INT32:
                           pInteger(Value)^:=pInteger(ArgumentExpToken[0].Value)^;
                        TYPE_INT64:
                           pInt64(Value)^:=pInt64(ArgumentExpToken[0].Value)^;
                        end;
                     end
                  else
                     IsNull:=True;
                  end;
               eoIF:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if pWordBool(ArgumentExpToken[0].Value)^ then
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     EvaluateExpression(NextToken,ArgumentExpToken[1]);
                     end
                  else
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[2],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     EvaluateExpression(NextToken,ArgumentExpToken[2]);
                     end;
                  end;
               eoIFNULL:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  if ArgumentExpToken[0].IsNull then
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     EvaluateExpression(NextToken,ArgumentExpToken[1]);
                     end
                  else
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[2],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     EvaluateExpression(NextToken,ArgumentExpToken[2]);
                     end;
                  end;
               eoNULLIF:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateBinary(eoEQ,ArgumentExpToken[0],ArgumentExpToken[1],
                                 ArgumentExpToken[2],LocaleID);
                  if pWordBool(ArgumentExpToken[2].Value)^ then
                     begin
                     IsNull:=True;
                     FillChar(Value^,DataSize,#0);
                     end
                  else
                     begin
                     IsNull:=False;
                     CopyValue(ArgumentExpToken[0]);
                     end;
                  end;
               eoCASE:
                  begin
                  I:=0;
                  while (I <= (ArgumentExpToken[0].ArgumentExpTokens.Count-1)) do
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[0].ArgumentExpToken[I],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     if pWordBool(ArgumentExpToken[0].ArgumentExpToken[I].Value)^ then
                        begin
                        EvaluateExpressionToken(ArgumentExpToken[1].ArgumentExpToken[I],RecordBuffer,
                                                ClientData,FieldCallback,LocaleID);
                        EvaluateExpression(NextToken,ArgumentExpToken[1].ArgumentExpToken[I]);
                        Break;
                        end;
                     Inc(I);
                     end;
                  if (I=ArgumentExpToken[0].ArgumentExpTokens.Count) and
                     (I < ArgumentExpToken[1].ArgumentExpTokens.Count) then
                     begin
                     { Is there an ELSE ? }
                     EvaluateExpressionToken(ArgumentExpToken[1].ArgumentExpToken[I],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     EvaluateExpression(NextToken,ArgumentExpToken[1].ArgumentExpToken[I]);
                     end;
                  end;
               eoCASEOPTION:
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     EvaluateExpressionToken(ArgumentExpToken[I],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                  end;
               eoCASERESULT:
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     EvaluateExpressionToken(ArgumentExpToken[I],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                  end;
               eoCOALESCE:
                  begin
                  FoundNonNulls:=False;
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     begin
                     EvaluateExpressionToken(ArgumentExpToken[I],RecordBuffer,
                                             ClientData,FieldCallback,LocaleID);
                     if (not ArgumentExpToken[I].IsNull) then
                        begin
                        EvaluateExpression(NextToken,ArgumentExpToken[I]);
                        FoundNonNulls:=True;
                        Break;
                        end;
                     end;
                  if (not FoundNonNulls) then
                     begin
                     IsNull:=True;
                     { Version 5 }
                     FillChar(Value^,DataSize,#0);
                     { Version 5 }
                     end;
                  end;
               eoTEXTSEARCH:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  with ArgumentExpToken[1] do
                     begin
                     if (DataSource <> nil) then
                        begin
                        if (DataSource is TSourceTable) then
                           pWordBool(NextToken.Value)^:=
                                 TSourceTable(DataSource).DataCursor.TextSearch(
                                              FieldNumber,FieldName,
                                              NextToken.ArgumentExpToken[0].Value,
                                              StrLen(NextToken.ArgumentExpToken[0].Value),
                                              Value,StrLen(Value))
                        else if (DataSource is TDataCursor) then
                           pWordBool(NextToken.Value)^:=
                                 TDataCursor(DataSource).TextSearch(
                                              FieldNumber,FieldName,
                                              NextToken.ArgumentExpToken[0].Value,
                                              StrLen(NextToken.ArgumentExpToken[0].Value),
                                              Value,StrLen(Value))
                        else
                           pWordBool(NextToken.Value)^:=False;
                        end
                     else
                        pWordBool(NextToken.Value)^:=False;
                     end;
                  pWordBool(Value)^:=VerifyWordBool(pWordBool(Value)^);
                  end;
               eoTEXTOCCURS:
                  begin
                  EvaluateExpressionToken(ArgumentExpToken[0],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  EvaluateExpressionToken(ArgumentExpToken[1],RecordBuffer,
                                          ClientData,FieldCallback,LocaleID);
                  with ArgumentExpToken[1] do
                     begin
                     if (DataSource <> nil) then
                        begin
                        if (DataSource is TSourceTable) then
                           pInteger(NextToken.Value)^:=
                                 TSourceTable(DataSource).DataCursor.TextOccurs(
                                              FieldNumber,FieldName,
                                              NextToken.ArgumentExpToken[0].Value,
                                              StrLen(NextToken.ArgumentExpToken[0].Value),
                                              Value,StrLen(Value))
                        else if (DataSource is TDataCursor) then
                           pInteger(NextToken.Value)^:=
                                 TDataCursor(DataSource).TextOccurs(
                                              FieldNumber,FieldName,
                                              NextToken.ArgumentExpToken[0].Value,
                                              StrLen(NextToken.ArgumentExpToken[0].Value),
                                              Value,StrLen(Value))
                        else
                           pInteger(NextToken.Value)^:=0;
                        end
                     else
                        pInteger(NextToken.Value)^:=0;
                     end;
                  end;
               eoLASTAUTOINC,eoIDENTCURRENT:
                  begin
                  if (DataSource <> nil) then
                     begin
                     if (DataSource is TSourceTable) then
                        pInteger(Value)^:=
                              TSourceTable(DataSource).DataCursor.LastAutoIncID
                     else
                        pInteger(Value)^:=0;
                     end
                  else
                     pInteger(Value)^:=0;
                  end;
               eoCURDATE:
                  pInteger(Value)^:=DateTimeToTimeStamp(Date).Date;
               eoCURTIME:
                  pInteger(Value)^:=DateTimeToTimeStamp(Time).Time;
               eoCURTIMESTAMP:
                  pDouble(Value)^:=TimeStampToMSecs(DateTimeToTimeStamp(Now));
               eoCURGUID:
                  StrPCopy(Value,OSCreateGUIDString);
               eoCUSTOMFUNC:
                  EvaluateCustomFunction(NextToken,RecordBuffer,
                                         ClientData,FieldCallback,LocaleID);
               end;
            end;
         etFIELD:
            begin
            IsNull:=False;
            if Assigned(FieldCallback) then
               FieldCallback(ClientData,RecordBuffer,NextToken)
            else
               { This only occurs in SQL, so error code is hard-coded }
               DataEngine.RaiseError(DBISAM_SQLPARSE,'','','','','','',
                          'Internal error: Column '+
                          PARSE_DOUBLEQUOTE+FieldName+PARSE_DOUBLEQUOTE+
                          ' specified illegally');
            end;
         end;
      end;
end;

procedure EvaluateExtract(LeftToken: TExpToken;
                          ResultToken: TExpToken);
var
   TempYear: Word;
   TempMonth: Word;
   TempWeek: Byte;
   TempDay: Word;
   TempDayOfWeek: Byte;
   TempDayOfYear: Word;
   TempHour: Word;
   TempMinute: Word;
   TempSecond: Word;
   TempMSecond: Word;
   TempTimeStamp: TTimeStamp;
begin
   with ResultToken do
      begin
      if (not LeftToken.IsNull) then
         begin
         TempYear:=0;
         TempMonth:=0;
         TempWeek:=0;
         TempDay:=0;
         TempDayOfWeek:=0;
         TempDayOfYear:=0;
         TempHour:=0;
         TempMinute:=0;
         TempSecond:=0;
         TempMSecond:=0;
         if (TokenOperator=eoEXTRACTDAYOFWEEK) then
            begin
            case LeftToken.DataType of
               TYPE_DATE:
                  begin
                  TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                  TempTimeStamp.Time:=0;
                  TempDayOfWeek:=ISODayOfWeek(TimeStampToDateTime(TempTimeStamp));
                  end;
               TYPE_TIMESTAMP:
                  begin
                  TempTimeStamp:=MSecsToTimeStamp(pDouble(LeftToken.Value)^);
                  TempDayOfWeek:=ISODayOfWeek(TimeStampToDateTime(TempTimeStamp));
                  end;
               end;
            end
         else if (TokenOperator=eoEXTRACTDAYOFYEAR) then
            begin
            case LeftToken.DataType of
               TYPE_DATE:
                  begin
                  TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                  TempTimeStamp.Time:=0;
                  TempDayOfYear:=ISODayOfYear(TimeStampToDateTime(TempTimeStamp));
                  end;
               TYPE_TIMESTAMP:
                  begin
                  TempTimeStamp:=MSecsToTimeStamp(pDouble(LeftToken.Value)^);
                  TempDayOfYear:=ISODayOfYear(TimeStampToDateTime(TempTimeStamp));
                  end;
               end;
            end
         else if (TokenOperator=eoEXTRACTWEEK) then
            begin
            case LeftToken.DataType of
               TYPE_DATE:
                  begin
                  TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                  TempTimeStamp.Time:=0;
                  TempWeek:=ISOWeekNumber(TimeStampToDateTime(TempTimeStamp));
                  end;
               TYPE_TIMESTAMP:
                  begin
                  TempTimeStamp:=MSecsToTimeStamp(pDouble(LeftToken.Value)^);
                  TempWeek:=ISOWeekNumber(TimeStampToDateTime(TempTimeStamp));
                  end;
               end;
            end
         else
            begin
            case LeftToken.DataType of
               TYPE_DATE:
                  begin
                  TempTimeStamp.Date:=pInteger(LeftToken.Value)^;
                  TempTimeStamp.Time:=0;
                  DecodeDate(TimeStampToDateTime(TempTimeStamp),
                             TempYear,TempMonth,TempDay);
                  end;
               TYPE_TIME:
                  begin
                  TempTimeStamp.Date:=1;
                  TempTimeStamp.Time:=pInteger(LeftToken.Value)^;
                  DecodeTime(TimeStampToDateTime(TempTimeStamp),
                             TempHour,TempMinute,TempSecond,TempMSecond);
                  end;
               TYPE_TIMESTAMP:
                  begin
                  TempTimeStamp:=MSecsToTimeStamp(pDouble(LeftToken.Value)^);
                  DecodeDate(TimeStampToDateTime(TempTimeStamp),
                             TempYear,TempMonth,TempDay);
                  DecodeTime(TimeStampToDateTime(TempTimeStamp),
                             TempHour,TempMinute,TempSecond,TempMSecond);
                  end;
               end;
            end;
         case TokenOperator of
            eoEXTRACTYEAR:
               pInteger(Value)^:=TempYear;
            eoEXTRACTMONTH:
               pInteger(Value)^:=TempMonth;
            eoEXTRACTWEEK:
               pInteger(Value)^:=TempWeek;
            eoEXTRACTDAY:
               pInteger(Value)^:=TempDay;
            eoEXTRACTDAYOFWEEK:
               pInteger(Value)^:=TempDayOfWeek;
            eoEXTRACTDAYOFYEAR:
               pInteger(Value)^:=TempDayOfYear;
            eoEXTRACTHOUR:
               pInteger(Value)^:=TempHour;
            eoEXTRACTMINUTE:
               pInteger(Value)^:=TempMinute;
            eoEXTRACTSECOND:
               pInteger(Value)^:=TempSecond;
            eoEXTRACTMSECOND:
               pInteger(Value)^:=TempMSecond;
            end;
         end
      else
         IsNull:=True;
      end;
end;

procedure EvaluateCustomFunction(ResultToken: TExpToken;
                                 RecordBuffer: PChar;
                                 ClientData: Integer;
                                 FieldCallback: pEvaluateFieldCallback;
                                 LocaleID: Integer);
var
   TempFunctionDefinition: pFunctionDefinition;
   TempParamDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempRecordSize: Word;
   TempOffset: Word;
   TempRecordBuffer: PChar;
   TempResultSize: Integer;
   TempResultBuffer: PChar;
   I: Integer;
begin
   with ResultToken do
      begin
      TempFunctionDefinition:=DataEngine.GetFunctionDefinitionByName(TokenLiteral);
      if (TempFunctionDefinition <> nil) then
         begin
         FillChar(TempParamDefinitions,SizeOf(TempParamDefinitions),#0);
         with TempFunctionDefinition^ do
            begin
            for I:=1 to ParamCount do
               EvaluateExpressionToken(ArgumentExpToken[I-1],RecordBuffer,
                                       ClientData,FieldCallback,LocaleID);
            TempRecordSize:=0;
            for I:=1 to ParamCount do
               Inc(TempRecordSize,(FLDCHG_DATA+ArgumentExpToken[I-1].GetParamDataSize));
            TempRecordBuffer:=AllocMem(TempRecordSize);
            TempOffset:=0;
            for I:=1 to ParamCount do
               begin
               TempParamDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
               with TempParamDefinitions[I]^ do
                  begin
                  FieldNum:=I;
                  if (ArgumentExpToken[I-1].TokenType=etFIELD) then
                     begin
                     if (DataSource <> nil) then
                        begin
                        if (DataSource is TSourceTable) then
                           FieldName:=TSourceTable(ArgumentExpToken[I-1].DataSource).TableName+'_'+
                                      ArgumentExpToken[I-1].FieldName+'_'+IntToStr(I)
                        else if (DataSource is TDataCursor) then
                           FieldName:=TDataCursor(ArgumentExpToken[I-1].DataSource).TableName+'_'+
                                      ArgumentExpToken[I-1].FieldName+'_'+IntToStr(I)
                        else
                           FieldName:=ArgumentExpToken[I-1].SourceAlias+'_'+
                                      ArgumentExpToken[I-1].FieldName+'_'+IntToStr(I);
                        end
                     else
                        FieldName:=ArgumentExpToken[I-1].SourceAlias+'_'+
                                   ArgumentExpToken[I-1].FieldName+'_'+IntToStr(I)
                     end
                  else
                     FieldName:='Param'+'_'+IntToStr(I);
                  DataType:=ArgumentExpToken[I-1].GetParamDataType;
                  SubType:=ArgumentExpToken[I-1].GetParamSubType;
                  DataSize:=ArgumentExpToken[I-1].GetParamDataSize;
                  DataDecimals:=ArgumentExpToken[I-1].DataDecimals;
                  Offset:=TempOffset;
                  ArgumentExpToken[I-1].GetParamData((TempRecordBuffer+Offset+FLDCHG_DATA));
                  if (not ArgumentExpToken[I-1].IsNull) then
                     begin
                     if (DataType=TYPE_ZSTRING) then
                        begin
                        if (SubType <> SUBTYPE_FIXED) then
                           RightTrimString((TempRecordBuffer+Offset+FLDCHG_DATA),#32);
                        if (StrLen(TempRecordBuffer+Offset+FLDCHG_DATA) > 0) then
                           Boolean((TempRecordBuffer+Offset)^):=True;
                        end
                     else
                        Boolean((TempRecordBuffer+Offset)^):=True;
                     end;
                  Inc(TempOffset,(FLDCHG_DATA+DataSize));
                  end;
               end;
            try
               try
                  DataEngine.CustomFunction(UpperCase(TokenLiteral),
                                            ParamCount,TempParamDefinitions,
                                            TempRecordBuffer,
                                            DataType,TempResultSize,
                                            TempResultBuffer);
                  if (TempResultBuffer <> nil) then
                     begin
                     DataSize:=TempResultSize;
                     Move(TempResultBuffer^,Value^,TempResultSize);
                     DeAllocMem(TempResultBuffer);
                     end
                  else
                     IsNull:=True;
               except
                  IsNull:=True;
               end;
            finally
               for I:=1 to ParamCount do
                  DeAllocMem(TempParamDefinitions[I]);
               DeAllocMem(TempRecordBuffer);
            end;
            end;
         end;
      end;
end;

procedure EvaluateExpression(ResultToken: TExpToken;
                             ExpressionToken: TExpToken);
var
   ConvertBuffer: array [0..MAX_FIELD_SIZE] of Char;
begin
   with ResultToken do
      begin
      try
         if (not ExpressionToken.IsNull) then
            begin
            if (ExpressionToken.DataType <> TYPE_BLOB) and
               (DataType <> TYPE_BLOB) then
               begin
               FillChar(ConvertBuffer,SizeOf(ConvertBuffer),#0);
               Move(ExpressionToken.Value^,ConvertBuffer,
                    MinimumInteger(ExpressionToken.DataSize,(MAX_FIELD_SIZE+1)));
               if ConvertExpression(ExpressionToken.DataType,
                                    ExpressionToken.DataSize,
                                    ExpressionToken.DataDecimals,
                                    DataType,DataSize,
                                    DataDecimals,@ConvertBuffer) then
                  begin
                  Move(ConvertBuffer,Value^,DataSize);
                  if (DataType=TYPE_ZSTRING) then
                     (Value+DataSize-1)^:=#0;
                  end
               else
                  begin
                  FillChar(Value^,DataSize,#0);
                  IsNull:=True;
                  end;
               end
            else
               begin
               if (DataType=TYPE_ZSTRING) then
                  begin
                  Move(ExpressionToken.Value^,Value^,MinimumInteger(ExpressionToken.DataSize,
                                                                    DataSize));
                  (Value+DataSize-1)^:=#0;
                  end
               else
                  begin
                  DataSize:=ExpressionToken.DataSize;
                  Move(ExpressionToken.Value^,Value^,ExpressionToken.DataSize);
                  end;
               end
            end
         else
            begin
            IsNull:=True;
            { Version 5}
            FillChar(Value^,DataSize,#0);
            { Version 5 }
            end;
      finally
         if (DataType=TYPE_BOOL) then
            pWordBool(Value)^:=VerifyWordBool(pWordBool(Value)^);
      end;
      end;
end;

function BuildExpressionLiteral(NextToken: TExpToken): AnsiString;
var
   I: Integer;
begin
   Result:='';
   if (NextToken <> nil) then
      begin
      with NextToken do
         begin
         case TokenType of
            etUNARY:
               begin
               Result:=TokenLiteral;
               if (not (TokenOperator in [eoPLUS,eoMINUS])) then
                  Result:=Result+' '+BuildExpressionLiteral(LeftExpToken);
               end;
            etBINARY,etCOMPARE:
               begin
               Result:=BuildExpressionLiteral(LeftExpToken);
               Result:=Result+' '+TokenLiteral;
               Result:=Result+' '+BuildExpressionLiteral(RightExpToken);
               end;
            etEXTBINARY:
               begin
               Result:=BuildExpressionLiteral(ArgumentExpToken[0]);
               Result:=Result+' '+TokenLiteral;
               { Version 5 }
               case TokenOperator of
                  eoLIKE,eoNOTLIKE,eoSUBIN,eoNOTSUBIN:
                     begin
                     Result:=Result+' '+BuildExpressionLiteral(ArgumentExpToken[1]);
                     for I:=2 to NextToken.ArgumentExpTokens.Count-1 do
                        Result:=Result+' '+BuildExpressionLiteral(ArgumentExpToken[I]);
                     end;
                  eoBETWEEN,eoNOTBETWEEN:
                     begin
                     Result:=Result+' '+BuildExpressionLiteral(ArgumentExpToken[1]);
                     for I:=2 to NextToken.ArgumentExpTokens.Count-1 do
                        Result:=Result+' AND '+BuildExpressionLiteral(ArgumentExpToken[I]);
                     end;
                  eoIN,eoNOTIN:
                     begin
                     Result:=Result+' ('+BuildExpressionLiteral(ArgumentExpToken[1]);
                     for I:=2 to NextToken.ArgumentExpTokens.Count-1 do
                        Result:=Result+' , '+BuildExpressionLiteral(ArgumentExpToken[I]);
                     Result:=Result+')';
                     end;
                  end;
               { Version 5 }
               end;
            etFUNC:
               begin
               Result:=TokenLiteral;
               Result:=Result+PARSE_LEFTPAREN;
               case TokenOperator of
                  eoCAST:
                     begin
                     Result:=Result+BuildExpressionLiteral(ArgumentExpToken[0]);
                     Result:=Result+','+NativeDataTypeToSQLString(DataType,SubType,
                                                                  DataSize,DataDecimals);
                     end;
                  eoTRIMLEADING,eoTRIMTRAILING,eoTRIMBOTH:
                     begin
                     case TokenOperator of
                        eoTRIMLEADING:
                           Result:=Result+PARSE_LEADING;
                        eoTRIMTRAILING:
                           Result:=Result+PARSE_TRAILING;
                        eoTRIMBOTH:
                           Result:=Result+PARSE_BOTH;
                        end;
                     Result:=Result+' '+BuildExpressionLiteral(ArgumentExpToken[0]);
                     Result:=Result+','+BuildExpressionLiteral(ArgumentExpToken[1]);
                     end;
                  eoEXTRACTYEAR,eoEXTRACTMONTH,eoEXTRACTWEEK,eoEXTRACTDAY,eoEXTRACTDAYOFWEEK,
                  eoEXTRACTDAYOFYEAR,eoEXTRACTHOUR,eoEXTRACTMINUTE,eoEXTRACTSECOND,eoEXTRACTMSECOND:
                     begin
                     case TokenOperator of
                        eoEXTRACTYEAR:
                           Result:=Result+PARSE_YEAR;
                        eoEXTRACTMONTH:
                           Result:=Result+PARSE_MONTH;
                        eoEXTRACTWEEK:
                           Result:=Result+PARSE_WEEK;
                        eoEXTRACTDAY:
                           Result:=Result+PARSE_DAY;
                        eoEXTRACTDAYOFWEEK:
                           Result:=Result+PARSE_DAYOFWEEK;
                        eoEXTRACTDAYOFYEAR:
                           Result:=Result+PARSE_DAYOFYEAR;
                        eoEXTRACTHOUR:
                           Result:=Result+PARSE_HOUR;
                        eoEXTRACTMINUTE:
                           Result:=Result+PARSE_MINUTE;
                        eoEXTRACTSECOND:
                           Result:=Result+PARSE_SECOND;
                        eoEXTRACTMSECOND:
                           Result:=Result+PARSE_MSECOND;
                        end;
                     Result:=Result+','+BuildExpressionLiteral(ArgumentExpToken[1]);
                     end;
                  else
                     begin
                     for I:=0 to NextToken.ArgumentExpTokens.Count-1 do
                        begin
                        if (I > 0) then
                           Result:=Result+','+BuildExpressionLiteral(ArgumentExpToken[I])
                        else
                           Result:=Result+BuildExpressionLiteral(ArgumentExpToken[I]);
                        end;
                     end;
                  end;
               Result:=Result+PARSE_RIGHTPAREN;
               end;
            else
               Result:=TokenLiteral;
            end;
         end;
      end;         
end;

function CopyExpressionTokens(ExpressionTokens: TExpToken): TExpToken;
begin
   Result:=nil;
   if (ExpressionTokens <> nil) then
      Result:=CopyNextExpressionToken(ExpressionTokens);
end;

function CopyNextExpressionToken(NextToken: TExpToken): TExpToken;
var
   I: Integer;
begin
   Result:=TExpToken.Create;
   Result.Copy(NextToken);
   if (NextToken.LeftExpToken <> nil) then
      Result.LeftExpToken:=CopyNextExpressionToken(NextToken.LeftExpToken);
   if (NextToken.RightExpToken <> nil) then
      Result.RightExpToken:=CopyNextExpressionToken(NextToken.RightExpToken);
   if (NextToken.ArgumentExpTokens.Count > 0) then
      begin
      for I:=0 to NextToken.ArgumentExpTokens.Count-1 do
         begin
         if (NextToken.ArgumentExpToken[I] <> nil) then
            Result.ArgumentExpToken[I]:=CopyNextExpressionToken(NextToken.ArgumentExpToken[I])
         else
            Result.ArgumentExpToken[I]:=nil;
         end;
      end;
end;

function PackExpressionTokens(ExpressionTokens: TExpToken; var DestBuffer: PChar): Integer;
var
   TempBufferSize: Integer;
begin
   TempBufferSize:=0;
   if (ExpressionTokens <> nil) then
      Result:=PackNextExpressionToken(ExpressionTokens,DestBuffer,TempBufferSize,0)
   else
      Result:=0;
end;

function PackNextExpressionToken(NextToken: TExpToken; var DestBuffer: PChar;
                                 var DestBufferSize: Integer;
                                 DestBufferPos: Integer): Integer;
var
   I: Integer;
begin
   Result:=DestBufferPos;
   Inc(Result,NextToken.GetTotalPackSize);
   if (NextToken.LeftExpToken <> nil) then
      begin
      NextToken.LeftPackOffset:=Result;
      Result:=PackNextExpressionToken(NextToken.LeftExpToken,DestBuffer,
                                      DestBufferSize,Result);
      end;
   if (NextToken.RightExpToken <> nil) then
      begin
      NextToken.RightPackOffset:=Result;
      Result:=PackNextExpressionToken(NextToken.RightExpToken,DestBuffer,
                                      DestBufferSize,Result);
      end;
   if (NextToken.ArgumentExpTokens.Count > 0) then
      begin
      NextToken.ArgumentsPackOffset:=Result;
      for I:=0 to NextToken.ArgumentExpTokens.Count-1 do
         Result:=PackNextExpressionToken(NextToken.ArgumentExpToken[I],DestBuffer,
                                         DestBufferSize,Result);
      end;
   NextToken.CopyToBuffer(DestBuffer,DestBufferSize,DestBufferPos);
end;

procedure TranslateExpressionTokens(ExpressionTokens: TExpToken);
begin
   if (ExpressionTokens <> nil) then
      TranslateNextExpressionToken(ExpressionTokens);
end;

procedure TranslateNextExpressionToken(NextToken: TExpToken);
var
   I: Integer;
begin
   if (NextToken.LeftExpToken <> nil) then
      TranslateNextExpressionToken(NextToken.LeftExpToken);
   if (NextToken.RightExpToken <> nil) then
      TranslateNextExpressionToken(NextToken.RightExpToken);
   if (NextToken.ArgumentExpTokens.Count > 0) then
      begin
      for I:=0 to NextToken.ArgumentExpTokens.Count-1 do
         TranslateNextExpressionToken(NextToken.ArgumentExpToken[I]);
      end;
   case Byte(NextToken.TokenType) of
      0..3:
         begin
         { Do nothing }
         end;
      4:
         NextToken.TokenType:=TExpTokenType(12);
      5:
         NextToken.TokenType:=TExpTokenType(4);
      6:
         NextToken.TokenType:=TExpTokenType(5);
      7:
         NextToken.TokenType:=TExpTokenType(6);
      8:
         NextToken.TokenType:=TExpTokenType(10);
      end;
end;

function UnpackExpressionTokens(SourceBuffer: PChar;
                                var ExpressionTokens: TExpToken): Integer;
begin
   Result:=0;
   if (SourceBuffer <> nil) then
      Result:=UnpackNextExpressionToken(SourceBuffer,0,ExpressionTokens);
end;

function UnpackNextExpressionToken(SourceBuffer: PChar; SourceBufferPos: Integer;
                                   var NextToken: TExpToken): Integer;
var
   I: Integer;
   TempToken: TExpToken;
begin
   NextToken:=TExpToken.Create;
   Result:=NextToken.CopyFromBuffer(SourceBuffer,SourceBufferPos);
   if (NextToken.LeftPackOffset <> 0) then
      Result:=UnpackNextExpressionToken(SourceBuffer,Result,NextToken.FLeftExpToken);
   if (NextToken.RightPackOffset <> 0) then
      Result:=UnpackNextExpressionToken(SourceBuffer,Result,NextToken.FRightExpToken);
   if (NextToken.ArgumentsPackOffset <> 0) then
      begin
      for I:=0 to NextToken.ArgumentExpTokens.Count-1 do
         begin
         Result:=UnpackNextExpressionToken(SourceBuffer,Result,TempToken);
         NextToken.ArgumentExpToken[I]:=TempToken;
         end;
      end;
end;

procedure UntranslateExpressionTokens(ExpressionTokens: TExpToken);
begin
   if (ExpressionTokens <> nil) then
      UntranslateNextExpressionToken(ExpressionTokens);
end;

procedure UntranslateNextExpressionToken(NextToken: TExpToken);
var
   I: Integer;
begin
   if (NextToken.LeftExpToken <> nil) then
      UntranslateNextExpressionToken(NextToken.LeftExpToken);
   if (NextToken.RightExpToken <> nil) then
      UntranslateNextExpressionToken(NextToken.RightExpToken);
   if (NextToken.ArgumentExpTokens.Count > 0) then
      begin
      for I:=0 to NextToken.ArgumentExpTokens.Count-1 do
         UntranslateNextExpressionToken(NextToken.ArgumentExpToken[I]);
      end;
   case Byte(NextToken.TokenType) of
      0..3:
         begin
         { Do nothing }
         end;
      12:
         NextToken.TokenType:=TExpTokenType(4);
      4:
         NextToken.TokenType:=TExpTokenType(5);
      5:
         NextToken.TokenType:=TExpTokenType(6);
      6:
         NextToken.TokenType:=TExpTokenType(7);
      10:
         NextToken.TokenType:=TExpTokenType(8);
      end;
end;

function CompareExpressionTokens(FirstExpressionTokens: TExpToken;
                                 SecondExpressionTokens: TExpToken): Boolean;
begin
   Result:=False;
   if (FirstExpressionTokens <> nil) and (SecondExpressionTokens <> nil) then
      Result:=CompareNextExpressionToken(FirstExpressionTokens,
                                         SecondExpressionTokens)
   else if (FirstExpressionTokens=nil) and (SecondExpressionTokens=nil) then
      Result:=True;
end;

function CompareNextExpressionToken(FirstToken: TExpToken;
                                    SecondToken: TExpToken): Boolean;
var
   I: Integer;
begin
   Result:=False;
   if (FirstToken.LeftExpToken <> nil) and (SecondToken.LeftExpToken <> nil) then
      Result:=CompareNextExpressionToken(FirstToken.LeftExpToken,
                                         SecondToken.LeftExpToken)
   else if (FirstToken.LeftExpToken=nil) and (SecondToken.LeftExpToken=nil) then
      Result:=True;
   if Result then
      begin
      Result:=False;
      if (FirstToken.RightExpToken <> nil) and (SecondToken.RightExpToken <> nil) then
         Result:=CompareNextExpressionToken(FirstToken.RightExpToken,
                                            SecondToken.RightExpToken)
      else if (FirstToken.RightExpToken=nil) and (SecondToken.RightExpToken=nil) then
         Result:=True;
      if Result then
         begin
         Result:=False;
         if (FirstToken.ArgumentExpTokens.Count=SecondToken.ArgumentExpTokens.Count) then
            begin
            if (FirstToken.ArgumentExpTokens.Count > 0) then
               begin
               for I:=0 to FirstToken.ArgumentExpTokens.Count-1 do
                  begin
                  if (FirstToken.ArgumentExpToken[I] <> nil) and
                     (SecondToken.ArgumentExpToken[I] <> nil) then
                     Result:=CompareNextExpressionToken(FirstToken.ArgumentExpToken[I],
                                                        SecondToken.ArgumentExpToken[I])
                  else if (FirstToken.ArgumentExpToken[I]=nil) and
                          (SecondToken.ArgumentExpToken[I]=nil) then
                     Result:=True;
                  if Result then
                     Result:=FirstToken.Compare(SecondToken)
                  else
                     Break;
                  end;
               end
            else
               Result:=FirstToken.Compare(SecondToken);
            end;
         end;
      end;
end;

procedure FreeExpressionTokens(var ExpressionTokens: TExpToken);
begin
   if (ExpressionTokens <> nil) then
      FreeNextExpressionToken(ExpressionTokens);
end;

procedure FreeNextExpressionToken(var NextToken: TExpToken);
var
   I: Integer;
   TempToken: TExpToken;
begin
   if (NextToken.FLeftExpToken <> nil) then
      FreeNextExpressionToken(NextToken.FLeftExpToken);
   if (NextToken.FRightExpToken <> nil) then
      FreeNextExpressionToken(NextToken.FRightExpToken);
   if (NextToken.ArgumentExpTokens.Count > 0) then
      begin
      for I:=0 to NextToken.ArgumentExpTokens.Count-1 do
         begin
         TempToken:=NextToken.ArgumentExpToken[I];
         if (TempToken <> nil) then
            begin
            FreeNextExpressionToken(TempToken);
            NextToken.ArgumentExpToken[I]:=nil;
            end;
         end;
      end;
   NextToken.Free;
   NextToken:=nil;
end;

function GetFieldToken(NextToken: TExpToken): TExpToken;
var
   I: Integer;
begin
   Result:=nil;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=GetFieldToken(LeftExpToken);
         etBINARY,etCOMPARE:
            begin
            Result:=GetFieldToken(LeftExpToken);
            if (Result=nil) then
               Result:=GetFieldToken(RightExpToken);
            end;
         etEXTBINARY,etFUNC:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               begin
               Result:=GetFieldToken(ArgumentExpToken[I]);
               if (Result <> nil) then
                  Break;
               end;
            end;
         etFIELD:
            Result:=NextToken;
         end;
      end;
end;

function GetAggregateToken(NextToken: TExpToken): TExpToken;
var
   I: Integer;
begin
   Result:=nil;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=GetAggregateToken(LeftExpToken);
         etBINARY:
            begin
            Result:=GetAggregateToken(LeftExpToken);
            if (Result=nil) then
               Result:=GetAggregateToken(RightExpToken);
            end;
         etEXTBINARY:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               begin
               Result:=GetAggregateToken(ArgumentExpToken[I]);
               if (Result <> nil) then
                  Break;
               end;
            end;
         etFUNC:
            begin
            case TokenOperator of
               eoSUM,eoRUNSUM,eoMIN,eoMAX,eoAVG,eoSTDDEV,eoCOUNT:
                  Result:=NextToken;
               else
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     begin
                     Result:=GetAggregateToken(ArgumentExpToken[I]);
                     if (Result <> nil) then
                        Break;
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

function GetLeftMostToken(NextToken: TExpToken): TExpToken;
var
   TempLeftToken: TExpToken;
   TempRightToken: TExpToken;
begin
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=GetLeftMostToken(LeftExpToken);
         etBINARY,etCOMPARE:
            begin
            TempLeftToken:=GetLeftMostToken(LeftExpToken);
            TempRightToken:=GetLeftMostToken(RightExpToken);
            if (TempLeftToken.Line > TempRightToken.Line) or
               ((TempLeftToken.Line=TempRightToken.Line) and
                (TempLeftToken.Column > TempRightToken.Column)) then
               Result:=TempLeftToken
            else
               Result:=TempRightToken;
            end;
         else
            Result:=NextToken;
         end;
      end;
end;

function GetOperatorForAggregate(const FunctionName: string): TExpOperator;
begin
   Result:=eoNOTDEFINED;
   if (AnsiCompareText(PARSE_SUM,FunctionName)=0) then
      Result:=eoSUM
   else if (AnsiCompareText(PARSE_RUNSUM,FunctionName)=0) then
      Result:=eoRUNSUM
   else if (AnsiCompareText(PARSE_AVG,FunctionName)=0) then
      Result:=eoAVG
   else if (AnsiCompareText(PARSE_STDDEV,FunctionName)=0) then
      Result:=eoSTDDEV
   else if (AnsiCompareText(PARSE_MIN,FunctionName)=0) then
      Result:=eoMIN
   else if (AnsiCompareText(PARSE_MAX,FunctionName)=0) then
      Result:=eoMAX
   else if (AnsiCompareText(PARSE_COUNT,FunctionName)=0) then
      Result:=eoCOUNT;
end;

{ TSafeObject }

constructor TSafeObject.Create;
begin
  inherited Create;
  FSignature:=DBISAM_SIGNATURE;
end;

destructor TSafeObject.Destroy;
begin
  FSignature:='';
  inherited Destroy;
end;

function TSafeObject.IsObject: Boolean;
begin
   Result:=(Self <> nil) and (FSignature=DBISAM_SIGNATURE);
end;

{ TTimerThread }

constructor TTimerThread.Create(CreateSuspended: Boolean);
begin
   inherited Create(CreateSuspended);
   FreeOnTerminate:=True;
   FEvent:=OSAllocEvent;
end;

destructor TTimerThread.Destroy;
begin
   OSDeAllocEvent(FEvent);
   inherited Destroy;
end;

procedure TTimerThread.Execute;
var
   WaitResult: Integer;
begin
   while (not Terminated) do
      begin
      WaitResult:=OSWaitForEvent(FEvent,FInterval);
      OSResetEvent(FEvent);
      case WaitResult of
         TIMEDOUT:
            FTimer.FireTimer;
         SIGNALLED,ABANDONED,FAILED:
            Terminate;
         end;
      end;
end;

procedure TTimerThread.Stop;
begin
   while Suspended do
      Resume;
   OSSetEvent(FEvent);
end;

{ TThreadTimer }

constructor TThreadTimer.Create;
begin
   inherited Create;
   FInterval:=1000;
end;

destructor TThreadTimer.Destroy;
begin
   FEnabled:=False;
   UpdateTimer;
   inherited Destroy;
end;

procedure TThreadTimer.UpdateTimer;
begin
   if (FInterval <> 0) and FEnabled and Assigned(FOnTimer) then
      begin
      if (FThread <> nil) then
         begin
         FThread.Stop;
         FThread:=nil;      
         end;
      FThread:=TTimerThread.Create(True);
      with FThread do
         begin
         Timer:=Self;
         Interval:=Self.Interval;
         Resume;
         end;
      end
   else
      begin
      if (FThread <> nil) then
         begin
         FThread.Stop;
         FThread:=nil;
         end;
      end;
end;

procedure TThreadTimer.SetEnabled(Value: Boolean);
begin
   if (Value <> FEnabled) then
      begin
      FEnabled:=Value;
      UpdateTimer;
      end;
end;

procedure TThreadTimer.SetInterval(Value: LongWord);
begin
   if (Value <> FInterval) then
      begin
      FInterval:=Value;
      UpdateTimer;
      end;
end;

procedure TThreadTimer.SetOnTimer(Value: TNotifyEvent);
begin
   FOnTimer:=Value;
   UpdateTimer;
end;

procedure TThreadTimer.FireTimer;
begin
   if Assigned(FOnTimer) then
      FOnTimer(Self);
end;

{ TRecordsBitmap object }

constructor TRecordsBitmap.Create;
begin
   FBitmap:=nil;
   FBitmapSize:=0;
   FNumOfBits:=0;
   FAllocatedBits:=0;
   FEdgeBits:=0;
   FNumOfWords:=0;
end;

destructor TRecordsBitmap.Destroy;
begin
   ResizeBitmap(0);
   inherited Destroy;
end;

procedure TRecordsBitmap.ResizeBitmap(Value: Integer);
begin
   ResizeBuffer(Value,FBitmap,FBitmapSize);
end;

procedure TRecordsBitmap.SetNumOfBits(Value: Integer);
var
   OldBits: Integer;
begin
   if (Value <> FNumOfBits) then
      begin
      OldBits:=FNumOfBits;
      FNumOfBits:=Value;
      { Version 5 }
      if (FNumOfBits >= BITS_PER_WORD) then
         FEdgeBits:=(FNumOfBits mod BITS_PER_WORD)
      else
         FEdgeBits:=FNumOfBits;
      { Version 5 }
      if (FEdgeBits <> 0) then
         FAllocatedBits:=((BITS_PER_WORD*(FNumOfBits div BITS_PER_WORD))+BITS_PER_WORD)
      else
         FAllocatedBits:=FNumOfBits;
      ResizeBitmap(((FAllocatedBits div BITS_PER_WORD)*BITS_CHUNK_SIZE));
      FNumOfWords:=(FAllocatedBits div BITS_PER_WORD);
      { Version 5 }
      OldBits:=OldBits+1;
      while (OldBits > FNumOfBits) do
         begin
         if GetPreviousBitsSet(OldBits,1) then
            ClearBit(OldBits)
         else
            Break;
         end;
      { Version 5 }
      end;
end;

function TRecordsBitmap.IsBitSet(Value: Integer): Boolean;
begin
   Result:=(((Value-1) mod BITS_PER_WORD) in
            pBitmapArray(FBitmap)^[((Value-1) div BITS_PER_WORD)]);
end;

procedure TRecordsBitmap.SetBit(Value: Integer);
begin
   Include(pBitmapArray(FBitmap)^[((Value-1) div BITS_PER_WORD)],
           ((Value-1) mod BITS_PER_WORD));
end;

procedure TRecordsBitmap.ClearBit(Value: Integer);
begin
   Exclude(pBitmapArray(FBitmap)^[((Value-1) div BITS_PER_WORD)],
           ((Value-1) mod BITS_PER_WORD));
end;

function TRecordsBitmap.GetTotalBitsSet: Integer;
var
   I: Integer;
   J: Byte;
begin
   Result:=0;
   for I:=0 to FNumOfWords-1 do
      begin
      if (pLongWordArray(FBitmap)^[I] <> Low(LongWord)) then
         begin
         if (pLongWordArray(FBitmap)^[I]=High(LongWord)) then
            Inc(Result,BITS_PER_WORD)
         else
            begin
            for J:=0 to BITS_PER_WORD-1 do
               begin
               if (J in pBitmapArray(FBitmap)^[I]) then
                  Inc(Result);
               end;
            end;
         end;
      end;
end;

function TRecordsBitmap.GetPreviousBitsSet(var Value: Integer; NumBits: Integer): Boolean;
var
   I: Integer;
   J: Byte;
   TempValue: Integer;
   BitsFound: Integer;
   StartBit: Byte;
begin
   Result:=False;
   BitsFound:=0;
   TempValue:=Value;
   Dec(TempValue);
   if (TempValue <= 0)  then
      Exit;
   StartBit:=((TempValue-1) mod BITS_PER_WORD);
   I:=((TempValue-1) div BITS_PER_WORD);
   { Handle a starting bit that doesn't fall at the end of a word }
   if (StartBit <> (BITS_PER_WORD-1)) then
      begin
      for J:=StartBit downto 0 do
         begin
         if (J in pBitmapArray(FBitmap)^[I]) then
            begin
            if ((BitsFound+1) >= NumBits) then
               begin
               Value:=TempValue;
               Result:=True;
               Exit;
               end
            else
               Inc(BitsFound);
            end;
         Dec(TempValue);
         end;
      end;
   if (TempValue > 0) then
      begin
      for I:=((TempValue-1) div BITS_PER_WORD) downto 0 do
         begin
         if (pLongWordArray(FBitmap)^[I] <> Low(LongWord)) then
            begin
            if (pLongWordArray(FBitmap)^[I]=High(LongWord)) then
               begin
               if ((BitsFound+BITS_PER_WORD) >= NumBits) then
                  begin
                  Dec(TempValue,(NumBits-BitsFound-1));
                  Value:=TempValue;
                  Result:=True;
                  Exit;
                  end
               else
                  begin
                  Inc(BitsFound,BITS_PER_WORD);
                  Dec(TempValue,BITS_PER_WORD);
                  end;
               end
            else
               begin
               for J:=BITS_PER_WORD-1 downto 0 do
                  begin
                  if (J in pBitmapArray(FBitmap)^[I]) then
                     begin
                     if ((BitsFound+1) >= NumBits) then
                        begin
                        Value:=TempValue;
                        Result:=True;
                        Exit;
                        end
                     else
                        Inc(BitsFound);
                     end;
                  Dec(TempValue);
                  end;
               end;
            end
         else
            Dec(TempValue,BITS_PER_WORD);
         end;
      end;
end;

function TRecordsBitmap.GetNextBitsSet(var Value: Integer; NumBits: Integer): Boolean;
var
   I: Integer;
   J: Byte;
   TempValue: Integer;
   BitsFound: Integer;
   StartBit: Byte;
begin
   Result:=False;
   BitsFound:=0;
   TempValue:=Value;
   Inc(TempValue);
   if (TempValue > FNumOfBits)  then
      Exit;
   StartBit:=((TempValue-1) mod BITS_PER_WORD);
   I:=((TempValue-1) div BITS_PER_WORD);
   { Handle a starting bit that doesn't fall at the beginning of a word }
   if (StartBit <> 0) then
      begin
      for J:=StartBit to BITS_PER_WORD-1 do
         begin
         if (J in pBitmapArray(FBitmap)^[I]) then
            begin
            if ((BitsFound+1) >= NumBits) then
               begin
               Value:=TempValue;
               Result:=True;
               Exit;
               end
            else
               Inc(BitsFound);
            end;
         Inc(TempValue);
         end;
      end;
   if (TempValue <= FNumOfBits)  then
      begin
      for I:=((TempValue-1) div BITS_PER_WORD) to FNumOfWords-1 do
         begin
         if (pLongWordArray(FBitmap)^[I] <> Low(LongWord)) then
            begin
            if (pLongWordArray(FBitmap)^[I]=High(LongWord)) then
               begin
               if ((BitsFound+BITS_PER_WORD) >= NumBits) then
                  begin
                  Inc(TempValue,(NumBits-BitsFound-1));
                  Value:=TempValue;
                  Result:=True;
                  Exit;
                  end
               else
                  begin
                  Inc(BitsFound,BITS_PER_WORD);
                  Inc(TempValue,BITS_PER_WORD);
                  end;
               end
            else
               begin
               for J:=0 to BITS_PER_WORD-1 do
                  begin
                  if (J in pBitmapArray(FBitmap)^[I]) then
                     begin
                     if ((BitsFound+1) >= NumBits) then
                        begin
                        Value:=TempValue;
                        Result:=True;
                        Exit;
                        end
                     else
                        Inc(BitsFound);
                     end;
                  Inc(TempValue);
                  end;
               end;
            end
         else
            Inc(TempValue,BITS_PER_WORD);
         end;
      end;
end;

procedure TRecordsBitmap.AndBits(Source: TRecordsBitmap);
var
   I: Integer;
   J: Byte;
begin
   if (FEdgeBits=0) then
      begin
      for I:=0 to FNumOfWords-1 do
         pLongWordArray(FBitmap)^[I]:=(pLongWordArray(FBitmap)^[I] and
                                      pLongWordArray(Source.FBitmap)^[I]);
      end
   else
      begin
      for I:=0 to FNumOfWords-2 do
         pLongWordArray(FBitmap)^[I]:=(pLongWordArray(FBitmap)^[I] and
                                      pLongWordArray(Source.FBitmap)^[I]);
      I:=FNumOfWords-1;
      for J:=0 to FEdgeBits-1 do
         begin
         if (J in pBitmapArray(FBitmap)^[I]) and
            (J in pBitmapArray(Source.FBitmap)^[I]) then
            Include(pBitmapArray(FBitmap)^[I],J)
         else
            Exclude(pBitmapArray(FBitmap)^[I],J);
         end;
      end;
end;

procedure TRecordsBitmap.OrBits(Source: TRecordsBitmap);
var
   I: Integer;
   J: Byte;
begin
   if (FEdgeBits=0) then
      begin
      for I:=0 to FNumOfWords-1 do
         pLongWordArray(FBitmap)^[I]:=(pLongWordArray(FBitmap)^[I] or
                                      pLongWordArray(Source.FBitmap)^[I]);
      end
   else
      begin
      for I:=0 to FNumOfWords-2 do
         pLongWordArray(FBitmap)^[I]:=(pLongWordArray(FBitmap)^[I] or
                                      pLongWordArray(Source.FBitmap)^[I]);
      I:=FNumOfWords-1;
      for J:=0 to FEdgeBits-1 do
         begin
         if (J in pBitmapArray(FBitmap)^[I]) or
            (J in pBitmapArray(Source.FBitmap)^[I]) then
            Include(pBitmapArray(FBitmap)^[I],J)
         else
            Exclude(pBitmapArray(FBitmap)^[I],J);
         end;
      end;
end;

procedure TRecordsBitmap.XorBits(Source: TRecordsBitmap);
var
   I: Integer;
   J: Byte;
begin
   if (FEdgeBits=0) then
      begin
      for I:=0 to FNumOfWords-1 do
         pLongWordArray(FBitmap)^[I]:=(pLongWordArray(FBitmap)^[I] xor
                                      pLongWordArray(Source.FBitmap)^[I]);
      end
   else
      begin
      for I:=0 to FNumOfWords-2 do
         pLongWordArray(FBitmap)^[I]:=(pLongWordArray(FBitmap)^[I] xor
                                      pLongWordArray(Source.FBitmap)^[I]);
      I:=FNumOfWords-1;
      for J:=0 to FEdgeBits-1 do
         begin
         if (J in pBitmapArray(FBitmap)^[I]) xor
            (J in pBitmapArray(Source.FBitmap)^[I]) then
            Include(pBitmapArray(FBitmap)^[I],J)
         else
            Exclude(pBitmapArray(FBitmap)^[I],J);
         end;
      end;
end;

procedure TRecordsBitmap.NotBits;
var
   I: Integer;
   J: Byte;
begin
   if (FEdgeBits=0) then
      begin
      for I:=0 to FNumOfWords-1 do
         pLongWordArray(FBitmap)^[I]:=(not pLongWordArray(FBitmap)^[I]);
      end
   else
      begin
      for I:=0 to FNumOfWords-2 do
         pLongWordArray(FBitmap)^[I]:=(not pLongWordArray(FBitmap)^[I]);
      I:=FNumOfWords-1;
      for J:=0 to FEdgeBits-1 do
         begin
         if (J in pBitmapArray(FBitmap)^[I]) then
            Exclude(pBitmapArray(FBitmap)^[I],J)
         else
            Include(pBitmapArray(FBitmap)^[I],J);
         end;
      end;
end;

procedure TRecordsBitmap.ClearBits;
var
   I: Integer;
begin
   for I:=0 to FNumOfWords-1 do
      pLongWordArray(FBitmap)^[I]:=Low(LongWord);
end;

procedure TRecordsBitmap.SetBits;
var
   I: Integer;
   J: Byte;
begin
   if (FEdgeBits=0) then
      begin
      for I:=0 to FNumOfWords-1 do
         pLongWordArray(FBitmap)^[I]:=High(LongWord);
      end
   else
      begin
      for I:=0 to FNumOfWords-2 do
         pLongWordArray(FBitmap)^[I]:=High(LongWord);
      I:=FNumOfWords-1;
      for J:=0 to FEdgeBits-1 do
         Include(pBitmapArray(FBitmap)^[I],J);
      end;
end;

procedure TRecordsBitmap.Assign(Source: TRecordsBitmap);
begin
   SetNumOfBits(Source.FNumOfBits);
   Move(Source.FBitmap^,FBitmap^,MinimumInteger(FBitmapSize,Source.FBitmapSize));
end;

{ TExpToken }

constructor TExpToken.Create;
begin
   ResizeValueBuffer(MAX_FIELD_SIZE+1);
   FArgumentExpTokens:=TList.Create;
end;

destructor TExpToken.Destroy;
begin
   ResizeValueBuffer(0);
   FArgumentExpTokens.Free;
   inherited Destroy;
end;

procedure TExpToken.ResizeValueBuffer(Value: Integer);
begin
   if (Value <> 0) then
      begin
      if (Value > MIN_VALUE_BUFFER_ALLOCATION_SIZE) then
         ResizeBuffer(Value,FValue,FValueBufferSize)
      else
         ResizeBuffer(MIN_VALUE_BUFFER_ALLOCATION_SIZE,FValue,FValueBufferSize,True);
      end
   else
      ResizeBuffer(Value,FValue,FValueBufferSize);
end;

function TExpToken.GetParamDataType: Byte;
begin
   if ((FDataType=TYPE_ZSTRING) and ((DataSize-1) > MAX_FIELD_SIZE)) or
       (FDataType=TYPE_BLOB) then
      Result:=TYPE_BLOB
   else
      Result:=FDataType;
end;

function TExpToken.GetParamSubType: Byte;
begin
   if ((FDataType=TYPE_ZSTRING) and ((DataSize-1) > MAX_FIELD_SIZE)) or
       (FDataType=TYPE_BLOB) then
      Result:=SUBTYPE_MEMO
   else
      Result:=FSubType;
end;

function TExpToken.GetParamDataSize: Integer;
begin
   if ((FDataType=TYPE_ZSTRING) and ((DataSize-1) > MAX_FIELD_SIZE)) or
       (FDataType=TYPE_BLOB) then
      Result:=SizeOf(TBlobParam)
   else
      Result:=FDataSize;
end;

procedure TExpToken.GetParamData(Buffer: Pointer);
begin
   if ((FDataType=TYPE_ZSTRING) and ((DataSize-1) > MAX_FIELD_SIZE)) or
       (FDataType=TYPE_BLOB) then
      begin
      with TBlobParam(Buffer^) do
         begin
         BlobBuffer:=Value;
         BlobLength:=(DataSize-1);
         end;
      end
   else
      Move(Value^,Buffer^,DataSize);
end;

procedure TExpToken.Copy(ExpTokenToCopy: TExpToken);
begin
   FTokenLiteral:=ExpTokenToCopy.FTokenLiteral;
   FTokenType:=ExpTokenToCopy.FTokenType;
   FTokenOperator:=ExpTokenToCopy.FTokenOperator;
   FOptimizeLevel:=ExpTokenToCopy.FOptimizeLevel;
   FOptimizeCount:=ExpTokenToCopy.FOptimizeCount;
   FOptimizeCost:=ExpTokenToCopy.FOptimizeCost;
   FLevel:=ExpTokenToCopy.FLevel;
   FFieldName:=ExpTokenToCopy.FFieldName;
   FFieldNumber:=ExpTokenToCopy.FFieldNumber;
   FSourceAlias:=ExpTokenToCopy.FSourceAlias;
   FDataSource:=ExpTokenToCopy.FDataSource;
   FSourceObject:=ExpTokenToCopy.FSourceObject;
   ResizeValueBuffer(ExpTokenToCopy.FValueBufferSize);
   Move(ExpTokenToCopy.FValue^,FValue^,ExpTokenToCopy.FValueBufferSize);
   FIsNull:=ExpTokenToCopy.FIsNull;
   FInvalidValue:=ExpTokenToCopy.FInvalidValue;
   FPartialLength:=ExpTokenToCopy.FPartialLength;
   FCaseInsensitive:=ExpTokenToCopy.FCaseInsensitive;
   FDescending:=ExpTokenToCopy.FDescending;  // Not used
   FDataType:=ExpTokenToCopy.FDataType;
   FSubType:=ExpTokenToCopy.FSubType;
   FDataSize:=ExpTokenToCopy.FDataSize;
   FDataDecimals:=ExpTokenToCopy.FDataDecimals;
   FUpperExpToken:=ExpTokenToCopy.FUpperExpToken;
   FLeftExpToken:=ExpTokenToCopy.FLeftExpToken;
   FRightExpToken:=ExpTokenToCopy.FRightExpToken;
   CopyList(ExpTokenToCopy.ArgumentExpTokens,FArgumentExpTokens);
end;

procedure TExpToken.CopyValue(ExpTokenToCopy: TExpToken);
begin
   ResizeValueBuffer(ExpTokenToCopy.FValueBufferSize);
   Move(ExpTokenToCopy.FValue^,FValue^,ExpTokenToCopy.FValueBufferSize);
   FIsNull:=ExpTokenToCopy.FIsNull;
   FInvalidValue:=ExpTokenToCopy.FInvalidValue;
   FDataType:=ExpTokenToCopy.FDataType;
   FSubType:=ExpTokenToCopy.FSubType;
   FDataSize:=ExpTokenToCopy.FDataSize;
   FDataDecimals:=ExpTokenToCopy.FDataDecimals;
end;

procedure TExpToken.BeginPack(BufferPos: Integer);
begin
   FPackPos:=BufferPos;
end;

procedure TExpToken.Pack(var DestBuffer: PChar; var DestBufferSize: Integer;
                         const Buffer; BufferSize: Integer);
begin
   ResizeBuffer(FPackPos+SizeOf(Integer)+BufferSize,DestBuffer,DestBufferSize);
   Move(BufferSize,(DestBuffer+FPackPos)^,SizeOf(Integer));
   Inc(FPackPos,SizeOf(Integer));
   Move(Buffer,(DestBuffer+FPackPos)^,BufferSize);
   Inc(FPackPos,BufferSize);
end;

function TExpToken.GetPackSize(BufferSize: Integer): Integer;
begin
   Result:=(SizeOf(Integer)+BufferSize);
end;

function TExpToken.GetTotalPackSize: Integer;
begin
   Result:=0;
   Inc(Result,GetPackSize(Length(FTokenLiteral)));
   Inc(Result,GetPackSize(SizeOf(TExpTokenType)));
   Inc(Result,GetPackSize(SizeOf(TExpOperator)));
   Inc(Result,GetPackSize(SizeOf(TOptimizeLevel)));
   Inc(Result,GetPackSize(Length(FFieldName)));
   Inc(Result,GetPackSize(SizeOf(Word)));
   Inc(Result,GetPackSize(SizeOf(Integer)));
   Inc(Result,GetPackSize(FDataSize));
   Inc(Result,GetPackSize(SizeOf(Boolean)));
   Inc(Result,GetPackSize(SizeOf(Integer)));
   Inc(Result,GetPackSize(SizeOf(Boolean)));
   Inc(Result,GetPackSize(SizeOf(Boolean)));
   Inc(Result,GetPackSize(SizeOf(Byte)));
   Inc(Result,GetPackSize(SizeOf(Byte)));
   Inc(Result,GetPackSize(SizeOf(Byte)));
   Inc(Result,GetPackSize(SizeOf(Integer)));
   Inc(Result,GetPackSize(SizeOf(Integer)));
   Inc(Result,GetPackSize(SizeOf(Integer)));
   Inc(Result,GetPackSize(SizeOf(Integer)));
end;

function TExpToken.CopyToBuffer(var DestBuffer: PChar; var DestBufferSize: Integer;
                                DestBufferPos: Integer): Integer;
begin
   BeginPack(DestBufferPos);
   Pack(DestBuffer,DestBufferSize,PChar(FTokenLiteral)^,Length(FTokenLiteral));
   Pack(DestBuffer,DestBufferSize,FTokenType,SizeOf(TExpTokenType));
   Pack(DestBuffer,DestBufferSize,FTokenOperator,SizeOf(TExpOperator));
   Pack(DestBuffer,DestBufferSize,FOptimizeLevel,SizeOf(TOptimizeLevel));
   Pack(DestBuffer,DestBufferSize,FFieldName[1],Length(FFieldName));
   Pack(DestBuffer,DestBufferSize,FFieldNumber,SizeOf(Word));
   Pack(DestBuffer,DestBufferSize,FDataSize,SizeOf(Integer));
   Pack(DestBuffer,DestBufferSize,FValue^,FDataSize);
   Pack(DestBuffer,DestBufferSize,FIsNull,SizeOf(Boolean));
   Pack(DestBuffer,DestBufferSize,FPartialLength,SizeOf(Integer));
   Pack(DestBuffer,DestBufferSize,FCaseInsensitive,SizeOf(Boolean));
   Pack(DestBuffer,DestBufferSize,FDescending,SizeOf(Boolean));  // Not used
   Pack(DestBuffer,DestBufferSize,FDataType,SizeOf(Byte));
   Pack(DestBuffer,DestBufferSize,FSubType,SizeOf(Byte));
   Pack(DestBuffer,DestBufferSize,FDataDecimals,SizeOf(Byte));
   Pack(DestBuffer,DestBufferSize,FLeftPackOffset,SizeOf(Integer));
   Pack(DestBuffer,DestBufferSize,FRightPackOffset,SizeOf(Integer));
   Pack(DestBuffer,DestBufferSize,FArgumentExpTokens.Count,SizeOf(Integer));
   Pack(DestBuffer,DestBufferSize,FArgumentsPackOffset,SizeOf(Integer));
   Result:=FPackPos;
end;

procedure TExpToken.BeginUnpack(SourceBufferPos: Integer);
begin
   FUnpackPos:=SourceBufferPos;
end;

function TExpToken.GetUnpackSize(SourceBuffer: PChar): Integer;
begin
   Move((SourceBuffer+FUnpackPos)^,Result,SizeOf(Integer));
end;

function TExpToken.Unpack(SourceBuffer: PChar; var Buffer): Integer;
begin
   Move((SourceBuffer+FUnpackPos)^,Result,SizeOf(Integer));
   Inc(FUnpackPos,SizeOf(Integer));
   Move((SourceBuffer+FUnpackPos)^,Buffer,Result);
   Inc(FUnpackPos,Result);
end;

function TExpToken.CopyFromBuffer(SourceBuffer: PChar; SourceBufferPos: Integer): Integer;
var
   TempSize: Integer;
   TempCount: Integer;
begin
   BeginUnpack(SourceBufferPos);
   TempSize:=GetUnpackSize(SourceBuffer);
   SetLength(FTokenLiteral,TempSize);
   Unpack(SourceBuffer,PChar(FTokenLiteral)^);
   Unpack(SourceBuffer,FTokenType);
   Unpack(SourceBuffer,FTokenOperator);
   Unpack(SourceBuffer,FOptimizeLevel);
   FFieldName[0]:=Char(Byte(Unpack(SourceBuffer,FFieldName[1])));
   Unpack(SourceBuffer,FFieldNumber);
   Unpack(SourceBuffer,FDataSize);
   ResizeValueBuffer(FDataSize);
   Unpack(SourceBuffer,FValue^);
   Unpack(SourceBuffer,FIsNull);
   Unpack(SourceBuffer,FPartialLength);
   Unpack(SourceBuffer,FCaseInsensitive);
   Unpack(SourceBuffer,FDescending);  // Not used
   Unpack(SourceBuffer,FDataType);
   Unpack(SourceBuffer,FSubType);
   Unpack(SourceBuffer,FDataDecimals);
   Unpack(SourceBuffer,FLeftPackOffset);
   Unpack(SourceBuffer,FRightPackOffset);
   Unpack(SourceBuffer,TempCount);
   FArgumentExpTokens.Count:=TempCount;
   Unpack(SourceBuffer,FArgumentsPackOffset);
   Result:=FUnpackPos;
end;

function TExpToken.Compare(ExpTokenToCompare: TExpToken): Boolean;
begin
   Result:=False;
   if (FTokenType=ExpTokenToCompare.FTokenType) and
      (FTokenOperator=ExpTokenToCompare.FTokenOperator) and
      (AnsiCompareText(FFieldName,ExpTokenToCompare.FFieldName)=0) and
      (OSCompareFileNames(FSourceAlias,ExpTokenToCompare.FSourceAlias)=0) and
      (FPartialLength=ExpTokenToCompare.FPartialLength) and
      (FCaseInsensitive=ExpTokenToCompare.FCaseInsensitive) and
      (FDescending=ExpTokenToCompare.FDescending) and  // Not used
      (FDataType=ExpTokenToCompare.FDataType) and
      (FSubType=ExpTokenToCompare.FSubType) and
      (FDataSize=ExpTokenToCompare.FDataSize) and
      (FDataDecimals=ExpTokenToCompare.FDataDecimals) then
      begin
      if (FTokenType=etCONST) then
         begin
         if (FIsNull=ExpTokenToCompare.FIsNull) and
            (CompareBytes(FValue,ExpTokenToCompare.FValue,FDataSize,False)=CMP_EQUAL) then
            Result:=True
         else
            Result:=False;
         end
      else
         Result:=True;
      end;
end;

procedure TExpToken.SetDataSize(Value: Integer);
begin
   if (Value <> FDataSize) then
      begin
      ResizeValueBuffer(Value);
      FDataSize:=Value;
      end;
end;

function TExpToken.GetArgumentExpToken(Index: Integer): TExpToken;
begin
   if (Index >= FArgumentExpTokens.Count) then
      Result:=nil
   else
      Result:=FArgumentExpTokens[Index];
end;

procedure TExpToken.SetArgumentExpToken(Index: Integer; Value: TExpToken);
begin
   if (Index >= FArgumentExpTokens.Count) then
      FArgumentExpTokens.Count:=(Index+1);
   FArgumentExpTokens[Index]:=Value;
end;

{ TExpressionParser }

constructor TExpressionParser.Create(Owner: TObject);
begin
   FOwner:=Owner;
end;

destructor TExpressionParser.Destroy;
begin
   FreeExpression;
   inherited Destroy;
end;

procedure TExpressionParser.FreeExpression;
begin
   if (FSize <> 0) then
      begin
      DeAllocMem(FExpression);
      FPtr:=nil;
      FTokenPtr:=nil;
      FToken:=PARSE_TERM;
      FStringPtr:=nil;
      FStatementPtr:=nil;
      FExpressionPtr:=nil;
      FLastPtr:=nil;
      FSize:=0;
      FLinePtr:=nil;
      FCurLine:=0;
      end;
end;

procedure TExpressionParser.ExpectedTokenError(ExpectedToken: Char);
begin
   if (FTokenPtr^ in [PARSE_TERM,PARSE_CR,PARSE_LF]) then
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Missing '+ExpectedToken+' in '+FErrorContext,'','',
                            CurLine,CurColumn)
   else
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Expected '+ExpectedToken+' but instead found '+TokenLiteralString+
                            ' in '+FErrorContext,'','',
                            CurLine,CurColumn);
end;

procedure TExpressionParser.ExpectedExpressionError(const ExpectedExpression: AnsiString;
                                                    Saved: Boolean);
var
   TempLine: Integer;
   TempColumn: Integer;
   TempString: AnsiString;
begin
   if Saved then
      begin
      TempLine:=CurSaveTokenLine;
      TempColumn:=CurSaveTokenColumn;
      TempString:=SaveTokenLiteralString;
      end
   else
      begin
      TempLine:=CurLine;
      TempColumn:=CurColumn;
      TempString:=TokenLiteralString;
      end;
   if (FTokenPtr^=PARSE_TERM) then
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Missing '+ExpectedExpression+' in '+FErrorContext,'','',
                            TempLine,TempColumn)
   else
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Expected '+ExpectedExpression+' but instead found '+
                            TempString+' in '+FErrorContext,'','',
                            TempLine,TempColumn);
end;

procedure TExpressionParser.InvalidExpressionError(Saved: Boolean);
var
   TempLine: Integer;
   TempColumn: Integer;
   TempString: AnsiString;
begin
   if Saved then
      begin
      TempLine:=CurSaveTokenLine;
      TempColumn:=CurSaveTokenColumn;
      TempString:=SaveTokenLiteralString;
      end
   else
      begin
      TempLine:=CurLine;
      TempColumn:=CurColumn;
      TempString:=TokenLiteralString;
      end;
   DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                         'Invalid expression '+TempString+
                         ' found '+' in '+FErrorContext,'','',
                         TempLine,TempColumn);
end;

procedure TExpressionParser.SetExpression(ExpressionBuffer: PChar;
                                          LineOffset: Integer;
                                          ColumnOffset: Integer);
begin
   FreeExpression;
   FSize:=StrLen(ExpressionBuffer)+1;
   FExpression:=AllocMem(FSize);
   StrLCopy(FExpression,ExpressionBuffer,FSize);
   FPtr:=FExpression;
   FTokenPtr:=FExpression;
   FSaveTokenPtr:=nil;
   FToken:=PARSE_TERM;
   FStringPtr:=FExpression;
   FStatementPtr:=nil;
   FExpressionPtr:=nil;
   FLastPtr:=nil;
   FLinePtr:=FExpression;
   FCurLine:=LineOffset;
   FCurSaveTokenLine:=FCurLine;
   FSaveLinePtr:=nil;
   FColumnOffset:=ColumnOffset;
end;

function TExpressionParser.GetNewExpToken: TExpToken;
begin
   Result:=TExpToken.Create;
   with Result do
      begin
      TokenLiteral:=SaveTokenLiteralString;
      Line:=CurSaveTokenLine;
      Column:=CurSaveTokenColumn;
      SourceObject:=FObjectContext;
      end;
end;

function TExpressionParser.GetExpression: AnsiString;
begin
   Result:=AnsiString(FExpression);
end;

function TExpressionParser.GetCurColumn: Integer;
begin
   Result:=((FTokenPtr-FLinePtr)+FColumnOffset);
end;

function TExpressionParser.GetCurSaveTokenColumn: Integer;
begin
   Result:=((FSaveTokenPtr-FSaveLinePtr)+FColumnOffset);
end;

procedure TExpressionParser.MarkStatement;
begin
   FStatementPtr:=FTokenPtr;
end;

procedure TExpressionParser.MarkExpression;
begin
   FExpressionPtr:=FTokenPtr;
end;

procedure TExpressionParser.MarkSaveToken;
begin
   FSaveTokenPtr:=FTokenPtr;
   FCurSaveTokenLine:=FCurLine;
   FSaveLinePtr:=FLinePtr;
end;

procedure TExpressionParser.CheckForLineTermAndIncrement;
begin
   case FPtr^ of
      PARSE_CR:
         begin
         Inc(FPtr);
         if (FPtr^=PARSE_LF) then
            Inc(FPtr);
         Inc(FCurLine);
         FColumnOffset:=1;
         FLinePtr:=FPtr;
         end;
      PARSE_LF:
         begin
         Inc(FPtr);
         Inc(FCurLine);
         FColumnOffset:=1;
         FLinePtr:=FPtr;
         end;
      else
         Inc(FPtr);
      end;
end;

procedure TExpressionParser.SkipBlanks;
begin
   while (not (FPtr^ in [PARSE_TERM,#33..#255])) do
      CheckForLineTermAndIncrement;
end;

procedure TExpressionParser.SkipComments;
begin
   while True do
      begin
      SkipBlanks;
      if (FPtr^ <> PARSE_TERM) and
         (FPtr^=PARSE_MINUS) and
         ((FPtr+1)^ <> PARSE_TERM) and
         ((FPtr+1)^=PARSE_MINUS) then
         begin
         Inc(FPtr,2);
         while (not (FPtr^ in [PARSE_TERM,PARSE_CR,PARSE_LF])) do
            Inc(FPtr);
         end
      else if (FPtr^ <> PARSE_TERM) and
         (FPtr^=PARSE_SLASH) and
         ((FPtr+1)^ <> PARSE_TERM) and
         ((FPtr+1)^=PARSE_ASTERISK) then
         begin
         Inc(FPtr,2);
         while (FPtr^ <> PARSE_TERM) and
               ((FPtr^ <> PARSE_ASTERISK) or
                ((FPtr^=PARSE_ASTERISK) and
                 ((FPtr+1)^ <> PARSE_TERM) and
                 ((FPtr+1)^ <> PARSE_SLASH))) do
            CheckForLineTermAndIncrement;
         if (FPtr^=PARSE_ASTERISK) and
            ((FPtr+1)^ <> PARSE_TERM) and
            ((FPtr+1)^=PARSE_SLASH) then
            Inc(FPtr,2)
         else
            ExpectedTokenError(PARSE_SLASH);
         end
      else
         Break;
      end;
end;

function TExpressionParser.NextToken: Char;
var
   P: PChar;
begin
   FLastPtr:=FPtr;
   SkipComments;
   P:=FPtr;
   FTokenPtr:=P;
   if IsAlpha(P^) then
      begin
      Inc(P);
      while IsAlphaNumeric(P^) or IsNonLeading(P^) do
         Inc(P);
      Result:=TOKEN_SYMBOL;
      end
   else if (P^=PARSE_POUND) then
      begin
      Inc(P);
      while IsNumeric(P^) do
         Inc(P);
      Result:=TOKEN_CHAR;
      end
   else if (P^=PARSE_SINGLEQUOTE) then
      begin
      Inc(P);
      while True do
         begin
         case P^ of
            PARSE_TERM,PARSE_CR,PARSE_LF:
               begin
               FPtr:=(P-1);
               FStringPtr:=(P-1);
               FToken:=TOKEN_SINGLESTRING;
               ExpectedTokenError(PARSE_SINGLEQUOTE);
               end;
            PARSE_SINGLEQUOTE:
               begin
               Inc(P);
               if (P^ <> PARSE_SINGLEQUOTE) then
                  Break;
               end;
            end;
         Inc(P);
         end;
      FStringPtr:=P;
      Result:=TOKEN_SINGLESTRING;
      end
   else if (P^=PARSE_DOUBLEQUOTE) then
      begin
      Inc(P);
      while True do
         begin
         case P^ of
            PARSE_TERM,PARSE_CR,PARSE_LF:
               begin
               FPtr:=(P-1);
               FStringPtr:=(P-1);
               FToken:=TOKEN_DOUBLESTRING;
               ExpectedTokenError(PARSE_DOUBLEQUOTE);
               end;
            PARSE_DOUBLEQUOTE:
               begin
               Inc(P);
               if (P^ <> PARSE_DOUBLEQUOTE) then
                  Break;
               end;
            end;
         Inc(P);
         end;
      FStringPtr:=P;
      Result:=TOKEN_DOUBLESTRING;
      end
   else if (P^=PARSE_LEFTBRACKET) then
      begin
      Inc(P);
      while True do
         begin
         case P^ of
            PARSE_TERM,PARSE_CR,PARSE_LF:
               begin
               FPtr:=(P-1);
               FStringPtr:=(P-1);
               FToken:=TOKEN_BRACKETSYMBOL;
               ExpectedTokenError(PARSE_RIGHTBRACKET);
               end;
            PARSE_RIGHTBRACKET:
               begin
               Inc(P);
               Break;
               end;
            end;
         Inc(P);
         end;
      FStringPtr:=P;
      Result:=TOKEN_BRACKETSYMBOL;
      end
   else if IsNumeric(P^) then
      begin
      Inc(P);
      while IsNumeric(P^) do
         Inc(P);
      Result:=TOKEN_INTEGER;
      while IsNumeric(P^) or
            (P^ in [ANSI_DECIMAL_SEPARATOR,'e','E',ANSI_POSITIVE_SIGN,ANSI_NEGATIVE_SIGN]) do
         begin
         if (P^ in [ANSI_POSITIVE_SIGN,ANSI_NEGATIVE_SIGN]) and (not ((P-1)^ in ['e','E'])) then
            Break
         else
            begin
            Result:=TOKEN_FLOAT;
            Inc(P);
            end;
         end;
      end
   else if (P^=ANSI_DECIMAL_SEPARATOR) and IsNumeric((P+1)^) then
      begin
      Inc(P);
      Result:=TOKEN_FLOAT;
      while IsNumeric(P^) or
            (P^ in ['e','E',ANSI_POSITIVE_SIGN,ANSI_NEGATIVE_SIGN]) do
         begin
         if (P^ in [ANSI_POSITIVE_SIGN,ANSI_NEGATIVE_SIGN]) and (not ((P-1)^ in ['e','E'])) then
            Break
         else
            Inc(P);
         end;
      end
   else
      begin
      Result:=P^;
      if (Result <> PARSE_TERM) then
         Inc(P);
      end;
   FPtr:=P;
   FToken:=Result;
end;

function TExpressionParser.TokenLiteralString: AnsiString;
begin
   SetLength(Result,(FPtr-FTokenPtr));
   Move(FTokenPtr^,PChar(Result)^,(FPtr-FTokenPtr));
end;

function TExpressionParser.SaveTokenLiteralString: AnsiString;
begin
   SetLength(Result,(FPtr-FSaveTokenPtr));
   Move(FSaveTokenPtr^,PChar(Result)^,(FPtr-FSaveTokenPtr));
end;

function TExpressionParser.TokenAsString: AnsiString;
var
   TempLength: Integer;
   TempPtr: PChar;
begin
   if (FToken in [TOKEN_BRACKETSYMBOL,TOKEN_DOUBLESTRING,TOKEN_SINGLESTRING]) then
      begin
      TempLength:=((FStringPtr-FTokenPtr)-2);
      TempPtr:=(FTokenPtr+1);
      end
   else
      begin
      TempLength:=(FPtr-FTokenPtr);
      TempPtr:=FTokenPtr;
      end;
   SetLength(Result,TempLength);
   Move(TempPtr^,PChar(Result)^,TempLength);
   if (FToken=TOKEN_SINGLESTRING) then
      Result:=ConvertQuotes(PARSE_SINGLEQUOTE,Result)
   else
      Result:=ConvertQuotes(' ',Result);
end;

function TExpressionParser.TokenIsSymbol: Boolean;
begin
   Result:=(FToken in [TOKEN_SYMBOL,TOKEN_BRACKETSYMBOL,TOKEN_DOUBLESTRING]);
end;

function TExpressionParser.TokenIsString: Boolean;
begin
   Result:=(FToken in [TOKEN_SINGLESTRING]);
end;

function TExpressionParser.CheckTokenSymbol(const Value: AnsiString): Boolean;
begin
   Result:=((FToken=TOKEN_SYMBOL) and
            (AnsiCompareText(TokenAsString,Value)=0));
end;

function TExpressionParser.CheckTokenString(const Value: AnsiString): Boolean;
begin
   Result:=((FToken=TOKEN_SINGLESTRING) and
            (AnsiCompareText(TokenAsString,Value)=0));
end;

function TExpressionParser.CheckToken(Value: Char): Boolean;
begin
   Result:=(FToken=Value);
end;

procedure TExpressionParser.ErrorIfNotToken(Value: Char);
begin
   if (not CheckToken(Value)) then
      ExpectedTokenError(Value);
end;

procedure TExpressionParser.ErrorIfNotSymbol(const Value: AnsiString);
begin
   if (not CheckTokenSymbol(Value)) then
      ExpectedExpressionError(Value,False);
end;

function TExpressionParser.SkipToken(Value: Char): Boolean;
begin
   Result:=False;
   if CheckToken(Value) then
      begin
      Result:=True;
      NextToken;
      end;
end;

procedure TExpressionParser.ErrorIfNotSkipToken(Value: Char);
begin
   ErrorIfNotToken(Value);
   NextToken;
end;

function TExpressionParser.StatementAsString: AnsiString;
var
   TempLength: Integer;
begin
   TempLength:=(FLastPtr-FStatementPtr);
   SetLength(Result,TempLength);
   Move(FStatementPtr^,pChar(Result)^,TempLength);
end;

function TExpressionParser.ExpressionAsString: AnsiString;
var
   TempLength: Integer;
begin
   TempLength:=(FLastPtr-FExpressionPtr);
   SetLength(Result,TempLength);
   Move(FExpressionPtr^,pChar(Result)^,TempLength);
   Result:=StripCRLFs(Result);
end;

function TExpressionParser.ParseDataTypeExpression(FieldToken: TExpToken;
                                                   ParseOptions: TParseOptions;
                                                   IgnoreMissing: Boolean): Boolean;
var
   TempDataTypeName: string;
begin
   TempDataTypeName:='';
   Result:=True;
   with FieldToken do
      begin
      if CheckTokenSymbol(PARSE_SMALLINT) then
         begin
         NextToken;
         DataType:=TYPE_INT16;
         end
      else if CheckTokenSymbol(PARSE_WORD) then
         begin
         NextToken;
         DataType:=TYPE_UINT16;
         end
      else if CheckTokenSymbol(PARSE_INTEGER) or
              CheckTokenSymbol(PARSE_INT) then
         begin
         NextToken;
         DataType:=TYPE_INT32;
         { Fix to get MS IDENTITY SQL to parse correctly -> ODBC ActiveSync }
         if CheckTokenSymbol(PARSE_IDENTITY) then
            begin
            NextToken;
            SubType:=SUBTYPE_AUTOINC;
            end;
         end
      else if CheckTokenSymbol(PARSE_LARGEINT) then
         begin
         NextToken;
         DataType:=TYPE_INT64;
         end
      else if CheckTokenSymbol(PARSE_AUTOINC) then
         begin
         NextToken;
         DataType:=TYPE_INT32;
         SubType:=SUBTYPE_AUTOINC;
         end
      else if CheckTokenSymbol(PARSE_DECIMAL) or
              CheckTokenSymbol(PARSE_NUMERIC) then
         begin
         if CheckTokenSymbol(PARSE_DECIMAL) then
            TempDataTypeName:='DECIMAL'
         else if CheckTokenSymbol(PARSE_NUMERIC) then
            TempDataTypeName:='NUMERIC';
         NextToken;
         if SkipToken(PARSE_LEFTPAREN) then
            begin
            ArgumentExpToken[1]:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
            ErrorIfNotSkipToken(PARSE_SEPARATOR);
            ArgumentExpToken[2]:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
            ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
            end;
         DataType:=TYPE_BCD;
         end
      else if CheckTokenSymbol(PARSE_FLOAT) then
         begin
         NextToken;
         if SkipToken(PARSE_LEFTPAREN) then
            begin
            ArgumentExpToken[1]:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
            ErrorIfNotSkipToken(PARSE_SEPARATOR);
            ArgumentExpToken[2]:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
            ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
            end;
         DataType:=TYPE_FLOAT;
         end
      else if CheckTokenSymbol(PARSE_MONEY) then
         begin
         NextToken;
         DataType:=TYPE_FLOAT;
         SubType:=SUBTYPE_MONEY;
         end
      else if CheckTokenSymbol(PARSE_CHARACTER) or
              CheckTokenSymbol(PARSE_CHAR) or
              CheckTokenSymbol(PARSE_VARCHAR) or
              CheckTokenSymbol(PARSE_WIDECHAR) then
         begin
         if CheckTokenSymbol(PARSE_CHARACTER) then
            begin
            TempDataTypeName:='CHARACTER';
            SubType:=SUBTYPE_FIXED;
            end
         else if CheckTokenSymbol(PARSE_CHAR) then
            begin
            TempDataTypeName:='CHAR';
            SubType:=SUBTYPE_FIXED;
            end
         else if CheckTokenSymbol(PARSE_VARCHAR) then
            begin
            TempDataTypeName:='VARCHAR';
            SubType:=SUBTYPE_UNKNOWN;
            end
         else if CheckTokenSymbol(PARSE_WIDECHAR) then
            begin
            TempDataTypeName:='WIDECHAR';
            SubType:=SUBTYPE_UNICODE;
            end;
         NextToken;
         ErrorIfNotSkipToken(PARSE_LEFTPAREN);
         ArgumentExpToken[1]:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
         ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
         DataType:=TYPE_ZSTRING;
         end
      else if CheckTokenSymbol(PARSE_GUID) then
         begin
         NextToken;
         DataType:=TYPE_ZSTRING;
         SubType:=SUBTYPE_GUID;
         end
      else if CheckTokenSymbol(PARSE_BYTES) or
              CheckTokenSymbol(PARSE_BINARY) then
         begin
         if CheckTokenSymbol(PARSE_BYTES) then
            TempDataTypeName:='BYTES'
         else if CheckTokenSymbol(PARSE_BINARY) then
            TempDataTypeName:='BINARY';
         NextToken;
         ErrorIfNotSkipToken(PARSE_LEFTPAREN);
         ArgumentExpToken[1]:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
         ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
         DataType:=TYPE_BYTES;
         end
      else if CheckTokenSymbol(PARSE_VARBYTES) or
              CheckTokenSymbol(PARSE_VARBINARY) then
         begin
         if CheckTokenSymbol(PARSE_VARBYTES) then
            TempDataTypeName:='VARBYTES'
         else if CheckTokenSymbol(PARSE_VARBINARY) then
            TempDataTypeName:='VARBINARY';
         NextToken;
         ErrorIfNotSkipToken(PARSE_LEFTPAREN);
         ArgumentExpToken[1]:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
         ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
         DataType:=TYPE_VARBYTES;
         end
      else if CheckTokenSymbol(PARSE_DATE) then
         begin
         NextToken;
         DataType:=TYPE_DATE;
         end
      else if CheckTokenSymbol(PARSE_TIME) then
         begin
         NextToken;
         DataType:=TYPE_TIME;
         end
      else if CheckTokenSymbol(PARSE_TIMESTAMP) then
         begin
         NextToken;
         DataType:=TYPE_TIMESTAMP;
         end
      else if CheckTokenSymbol(PARSE_BOOLEAN) or
              CheckTokenSymbol(PARSE_BOOL) or
              CheckTokenSymbol(PARSE_BIT) then
         begin
         NextToken;
         DataType:=TYPE_BOOL;
         end
      else if CheckTokenSymbol(PARSE_BLOB) then
         begin
         NextToken;
         DataType:=TYPE_BLOB;
         SubType:=SUBTYPE_UNKNOWN;
         end
      else if CheckTokenSymbol(PARSE_LONGVARBINARY) then
         begin
         NextToken;
         DataType:=TYPE_BLOB;
         SubType:=SUBTYPE_UNKNOWN;
         end
      else if CheckTokenSymbol(PARSE_LONGVARCHAR) or
              CheckTokenSymbol(PARSE_MEMO) then
         begin
         NextToken;
         DataType:=TYPE_BLOB;
         SubType:=SUBTYPE_MEMO;
         end
      else if CheckTokenSymbol(PARSE_GRAPHIC) then
         begin
         NextToken;
         DataType:=TYPE_BLOB;
         SubType:=SUBTYPE_GRAPHIC;
         end
      else
         begin
         if (not IgnoreMissing) then
            ExpectedExpressionError('SQL data type',False)
         else
            Result:=False;
         end;
      end;
end;

procedure TExpressionParser.CheckForAllFields(Token: TExpToken);
begin
   if (Token.TokenType=etFIELD) and
      (AnsiCompareText(Token.FieldName,PARSE_ALLFIELDS)=0) then
      InvalidExpressionError(True);       
end;

function TExpressionParser.ParseExpression8(ParseOptions: TParseOptions): TExpToken;
var
   TempByte: Integer;
   TempFunctionDefinition: pFunctionDefinition;
   I: Byte;
   TempWhenToken: TExpToken;
begin
   Result:=nil;
   try
      case FToken of
         TOKEN_INTEGER:
            begin
            MarkSaveToken;
            if IsAnInteger(TokenAsString) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  pInteger(Value)^:=StrToInt(TokenAsString);
                  end;
               end
            else if IsALargeInt(TokenAsString) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  DataType:=TYPE_INT64;
                  DataSize:=TYPE_INT64_SIZE;
                  pInt64(Value)^:=StrToInt64(TokenAsString);
                  end;
               end
            else if IsAFloat(TokenAsString) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  pDouble(Value)^:=StrToAnsiFloat(TokenAsString);
                  end;
               end
            else
               ExpectedExpressionError('numeric expression',False);
            NextToken;
            end;
         TOKEN_FLOAT:
            begin
            MarkSaveToken;
            if IsAFloat(TokenAsString) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  pDouble(Value)^:=StrToAnsiFloat(TokenAsString);
                  end;
               end
            else
               ExpectedExpressionError('numeric expression',False);
            NextToken;
            end;
         TOKEN_CHAR:
            begin
            MarkSaveToken;
            { Deal with character constants }
            if (Substr(TokenAsString,1,1)=PARSE_POUND) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  IsNull:=False;
                  DataType:=TYPE_ZSTRING;
                  DataSize:=SizeOf(Char)+1;
                  try
                     TempByte:=StrToInt(Substr(TokenAsString,2,Length(TokenAsString)));
                  except
                     TempByte:=-1;
                  end;
                  if (TempByte >= 0) and (TempByte <= High(Byte)) then
                     begin
                     Value^:=AnsiChar(TempByte);
                     (Value+1)^:=#0;
                     end
                  else
                     ExpectedExpressionError('character constant',False);
                  end;
               end
            else
               ExpectedExpressionError('character constant',False);
            NextToken;
            end;
         TOKEN_SINGLESTRING:
            begin
            MarkSaveToken;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etCONST;
               IsNull:=(Length(TokenAsString)=0);
               DataType:=TYPE_ZSTRING;
               DataSize:=Length(TokenAsString)+1;
               StrCopy(Value,PChar(TokenAsString));
               end;
            NextToken;
            end;
         TOKEN_BRACKETSYMBOL,TOKEN_DOUBLESTRING:
            begin
            MarkSaveToken;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etFIELD;
               FieldName:=Trim(TokenAsString);
               end;
            NextToken;
            { Check to see if we're dealing with an alias }
            if CheckToken(PARSE_ALIAS_QUALIFIER) then
               begin
               if (not (pmAllowTableQualifier in ParseOptions)) then
                  InvalidExpressionError(False);
               NextToken;
               if TokenIsSymbol or
                  CheckToken(PARSE_ALLFIELDS) then
                  begin
                  if CheckToken(PARSE_ALLFIELDS) and
                     (not (pmAllowAllFields in ParseOptions)) then
                     InvalidExpressionError(False);
                  with Result do
                     begin
                     TokenLiteral:=SaveTokenLiteralString;
                     SourceAlias:=StripFilePathAndExtension(FieldName,DataEngine.DataExtension);
                     FieldName:=Trim(TokenAsString);
                     end;
                  NextToken;
                  end
               else
                  ExpectedExpressionError('identifier',False);
               end;
            end;
         PARSE_PARAMETER:
            begin
            MarkSaveToken;
            if not (pmAllowParameters in ParseOptions) then
               InvalidExpressionError(False);
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etCONST;
               IsNull:=True;
               end;
            if (FOwner is TQueryStatement) then
               TQueryStatement(FOwner).ConstantParameters.Add(Result);
            NextToken;
            end;
         PARSE_LEFTPAREN:
            begin
            NextToken;
            Result:=ParseExpression1(ParseOptions-[pmAllowAllFields]);
            ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
            end;
         PARSE_ALLFIELDS:
            begin
            MarkSaveToken;
            if not (pmAllowAllFields in ParseOptions) then
               InvalidExpressionError(False);
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etFIELD;
               FieldName:=Trim(TokenAsString);
               end;
            NextToken;
            end;
         TOKEN_SYMBOL:
            begin
            MarkSaveToken;
            if ((AnsiCompareText(TokenAsString,PARSE_SUM)=0) or
                (AnsiCompareText(TokenAsString,PARSE_RUNSUM)=0) or
                (AnsiCompareText(TokenAsString,PARSE_AVG)=0) or
                (AnsiCompareText(TokenAsString,PARSE_STDDEV)=0) or
                (AnsiCompareText(TokenAsString,PARSE_MIN)=0) or
                (AnsiCompareText(TokenAsString,PARSE_MAX)=0) or
                (AnsiCompareText(TokenAsString,PARSE_COUNT)=0)) then
               begin
               if not (pmAllowAggregates in ParseOptions) then
                  InvalidExpressionError(False);
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=GetOperatorForAggregate(TokenAsString);
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  if (TokenOperator=eoCOUNT) then
                     ArgumentExpTokens.Add(ParseExpression5(ParseOptions+[pmAllowAllFields]))
                  else
                     ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_LOWER)=0) or
                    (AnsiCompareText(TokenAsString,PARSE_LCASE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoLOWER;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_UPPER)=0) or
                    (AnsiCompareText(TokenAsString,PARSE_UCASE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoUPPER;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_LEFT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoLEFT;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_FOR) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_FOR+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_RIGHT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoRIGHT;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_FOR) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_FOR+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_REPEAT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoREPEAT;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_FOR) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_FOR+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CONCAT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCONCAT;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_WITH) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_WITH+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_LENGTH)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoLENGTH;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_SUBSTRING)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoSUBSTRING;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_FROM) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_FROM+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if CheckTokenSymbol(PARSE_FOR) or
                     CheckToken(PARSE_SEPARATOR) then
                     begin
                     NextToken;
                     ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                     end;
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_REPLACE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoREPLACE;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_WITH) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_WITH+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_IN) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_IN+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_POS)=0) or
                    (AnsiCompareText(TokenAsString,PARSE_POSITION)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoPOS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_IN) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_IN+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_OCCURS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoOCCURS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_IN) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_IN+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CAST)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCAST;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_AS) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_AS+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ParseDataTypeExpression(Result,ParseOptions,False);
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_TRIM)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  DataType:=TYPE_ZSTRING;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  if CheckTokenSymbol(PARSE_LEADING) then
                     TokenOperator:=eoTRIMLEADING
                  else if CheckTokenSymbol(PARSE_TRAILING) then
                     TokenOperator:=eoTRIMTRAILING
                  else if CheckTokenSymbol(PARSE_BOTH) then
                     TokenOperator:=eoTRIMBOTH
                  else
                     ExpectedExpressionError(PARSE_LEADING+', '+PARSE_TRAILING+
                                             ', or '+PARSE_BOTH,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_FROM) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_FROM+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_ALLTRIM)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoTRIMBOTH;
                  DataType:=TYPE_ZSTRING;
                  ArgumentExpTokens.Add(GetNewExpToken);
                  with ArgumentExpToken[0] do
                     begin
                     TokenLiteral:=' ';
                     TokenType:=etCONST;
                     DataType:=TYPE_ZSTRING;
                     DataSize:=2;
                     StrCopy(Value,' ');
                     end;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_LTRIM)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoTRIMLEADING;
                  DataType:=TYPE_ZSTRING;
                  ArgumentExpTokens.Add(GetNewExpToken);
                  with ArgumentExpToken[0] do
                     begin
                     TokenLiteral:=' ';
                     TokenType:=etCONST;
                     DataType:=TYPE_ZSTRING;
                     DataSize:=2;
                     StrCopy(Value,' ');
                     end;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_RTRIM)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoTRIMTRAILING;
                  DataType:=TYPE_ZSTRING;
                  ArgumentExpTokens.Add(GetNewExpToken);
                  with ArgumentExpToken[0] do
                     begin
                     TokenLiteral:=' ';
                     TokenType:=etCONST;
                     DataType:=TYPE_ZSTRING;
                     DataSize:=2;
                     StrCopy(Value,' ');
                     end;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_EXTRACT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  if CheckTokenSymbol(PARSE_YEAR) then
                     TokenOperator:=eoEXTRACTYEAR
                  else if CheckTokenSymbol(PARSE_MONTH) then
                     TokenOperator:=eoEXTRACTMONTH
                  else if CheckTokenSymbol(PARSE_WEEK) then
                     TokenOperator:=eoEXTRACTWEEK
                  else if CheckTokenSymbol(PARSE_DAY) then
                     TokenOperator:=eoEXTRACTDAY
                  else if CheckTokenSymbol(PARSE_DAYOFWEEK) then
                     TokenOperator:=eoEXTRACTDAYOFWEEK
                  else if CheckTokenSymbol(PARSE_DAYOFYEAR) then
                     TokenOperator:=eoEXTRACTDAYOFYEAR
                  else if CheckTokenSymbol(PARSE_HOUR) then
                     TokenOperator:=eoEXTRACTHOUR
                  else if CheckTokenSymbol(PARSE_MINUTE) then
                     TokenOperator:=eoEXTRACTMINUTE
                  else if CheckTokenSymbol(PARSE_SECOND) then
                     TokenOperator:=eoEXTRACTSECOND
                  else if CheckTokenSymbol(PARSE_MSECOND) then
                     TokenOperator:=eoEXTRACTMSECOND
                  else
                     ExpectedExpressionError(PARSE_YEAR+', '+PARSE_MONTH+', '+
                                        PARSE_WEEK+', '+PARSE_DAY+', '+
                                        PARSE_DAYOFWEEK+', '+
                                        PARSE_DAYOFYEAR+', '+
                                        PARSE_HOUR+', '+PARSE_MINUTE+', '+
                                        PARSE_SECOND+', or '+PARSE_MSECOND,False);
                  NextToken;
                  if not (CheckTokenSymbol(PARSE_FROM) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_FROM+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_YEARSFROMMSECS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoMSECSYEARS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_DAYSFROMMSECS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoMSECSDAYS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_HOURSFROMMSECS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoMSECSHOURS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_MINSFROMMSECS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoMSECSMINS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_SECSFROMMSECS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoMSECSSECS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_MSECSFROMMSECS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoMSECSMSECS;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_ABS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoABS;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_ROUND)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoROUND;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if CheckTokenSymbol(PARSE_TO)  or
                     CheckToken(PARSE_SEPARATOR) then
                     begin
                     NextToken;
                     ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                     end;
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_MOD)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoMOD;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_SEPARATOR);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_ACOS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoACOS;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_ASIN)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoASIN;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_ATAN)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoATAN;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_ATAN2)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoATAN2;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_SEPARATOR);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CEILING)=0) or
                    (AnsiCompareText(TokenAsString,PARSE_CEIL)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCEILING;
                  DataType:=TYPE_INT64;
                  DataSize:=TYPE_INT64_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_COS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCOS;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_COT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCOT;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_DEGREES)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoDEGREES;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_EXP)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoEXP;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_FLOOR)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoFLOOR;
                  DataType:=TYPE_INT64;
                  DataSize:=TYPE_INT64_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_LOG)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoLOG;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_LOG10)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoLOG10;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_PI)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoPI;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  if SkipToken(PARSE_LEFTPAREN) then
                     ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_POWER)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoPOWER;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if (not (CheckTokenSymbol(PARSE_TO) or
                           CheckToken(PARSE_SEPARATOR))) then
                     ExpectedExpressionError(PARSE_TO+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_RADIANS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoRADIANS;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_RAND)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoRAND;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  if SkipToken(PARSE_LEFTPAREN) then
                     begin
                     if CheckTokenSymbol(PARSE_RANGE) then
                        begin
                        NextToken;
                        ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                        end
                     else if (not CheckToken(PARSE_RIGHTPAREN)) then
                        ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                     ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                     end;
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_SIGN)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoSIGN;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_SIN)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoSIN;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_SQRT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoSQRT;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_TAN)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoTAN;
                  DataType:=TYPE_FLOAT;
                  DataSize:=TYPE_FLOAT_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_TRUNCATE)=0) or
                    (AnsiCompareText(TokenAsString,PARSE_TRUNC)=0)then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoTRUNCATE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if CheckTokenSymbol(PARSE_TO)  or
                     CheckToken(PARSE_SEPARATOR) then
                     begin
                     NextToken;
                     ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                     end;
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_IF)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoIF;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions+[pmAllowExtPredicates]));
                  if not (CheckTokenSymbol(PARSE_THEN) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_THEN+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions+[pmAllowExtPredicates]));
                  if not (CheckTokenSymbol(PARSE_ELSE) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_ELSE+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions+[pmAllowExtPredicates]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_IFNULL)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoIFNULL;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_THEN) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_THEN+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_ELSE) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_ELSE+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_NULLIF)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoNULLIF;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                  if (not CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CASE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCASE;
                  NextToken;
                  ArgumentExpTokens.Add(GetNewExpToken);
                  with ArgumentExpToken[0] do
                     begin
                     TokenType:=etFUNC;
                     TokenOperator:=eoCASEOPTION;
                     end;
                  ArgumentExpTokens.Add(GetNewExpToken);
                  with ArgumentExpToken[1] do
                     begin
                     TokenType:=etFUNC;
                     TokenOperator:=eoCASERESULT;
                     end;
                  if (not CheckTokenSymbol(PARSE_WHEN)) then
                     { Parse expression token for first option }
                     TempWhenToken:=ParseExpression1(ParseOptions-[pmAllowAllFields])
                  else
                     TempWhenToken:=nil;
                  if not CheckTokenSymbol(PARSE_WHEN) then
                     ExpectedExpressionError(PARSE_WHEN,False);
                  NextToken;
                  try
                     while True do
                        begin
                        if (TempWhenToken <> nil) then
                           begin
                           ArgumentExpToken[0].ArgumentExpTokens.Add(GetNewExpToken);
                           with ArgumentExpToken[0].ArgumentExpToken[ArgumentExpToken[0].ArgumentExpTokens.Count-1] do
                              begin
                              TokenLiteral:=PARSE_EQUAL;
                              TokenType:=etBINARY;
                              TokenOperator:=eoEQ;
                              { Version 5 }
                              LeftExpToken:=CopyExpressionTokens(TempWhenToken);
                              { Version 5 }
                              RightExpToken:=ParseExpression1(ParseOptions-[pmAllowAllFields]);
                              end;
                           end
                        else
                           ArgumentExpToken[0].ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                        if not CheckTokenSymbol(PARSE_THEN) then
                           ExpectedExpressionError(PARSE_THEN,False);
                        NextToken;
                        ArgumentExpToken[1].ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                        if not CheckTokenSymbol(PARSE_WHEN) then
                           Break;
                        NextToken;
                        end;
                     if CheckTokenSymbol(PARSE_ELSE) then
                        begin
                        NextToken;
                        ArgumentExpToken[1].ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                        end
                     else
                        begin
                        ArgumentExpToken[1].ArgumentExpTokens.Add(GetNewExpToken);
                        with ArgumentExpToken[1].ArgumentExpToken[ArgumentExpToken[1].ArgumentExpTokens.Count-1] do
                           begin
                           TokenLiteral:=PARSE_NULL;
                           TokenType:=etCONST;
                           IsNull:=True;
                           end;
                        end;
                     if not CheckTokenSymbol(PARSE_END) then
                        ExpectedExpressionError(PARSE_END,False);
                     NextToken;
                  finally
                     FreeExpressionTokens(TempWhenToken);
                  end;
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_COALESCE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCOALESCE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                  while True do
                     begin
                     if (not SkipToken(PARSE_SEPARATOR)) then
                        Break;
                     ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                     end;
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_TEXTSEARCH)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoTEXTSEARCH;
                  DataType:=TYPE_BOOL;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_IN) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_IN+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_TEXTOCCURS)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoTEXTOCCURS;
                  DataType:=TYPE_UINT16;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  if not (CheckTokenSymbol(PARSE_IN) or
                          CheckToken(PARSE_SEPARATOR)) then
                     ExpectedExpressionError(PARSE_IN+' or '+PARSE_SEPARATOR,False);
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_LASTAUTOINC)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoLASTAUTOINC;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_IDENTCURRENT)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoIDENTCURRENT;
                  DataType:=TYPE_INT32;
                  DataSize:=TYPE_INT32_SIZE;
                  NextToken;
                  ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                  ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CURDATE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCURDATE;
                  DataType:=TYPE_DATE;
                  DataSize:=TYPE_DATE_SIZE;
                  NextToken;
                  if SkipToken(PARSE_LEFTPAREN) then
                     ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CURTIME)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCURTIME;
                  DataType:=TYPE_TIME;
                  DataSize:=TYPE_TIME_SIZE;
                  NextToken;
                  if SkipToken(PARSE_LEFTPAREN) then
                     ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CURDATETIME)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCURTIMESTAMP;
                  DataType:=TYPE_TIMESTAMP;
                  DataSize:=TYPE_TIMESTAMP_SIZE;
                  NextToken;
                  if SkipToken(PARSE_LEFTPAREN) then
                     ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_CURGUID)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etFUNC;
                  TokenOperator:=eoCURGUID;
                  DataType:=TYPE_ZSTRING;
                  DataSize:=TYPE_GUID_SIZE;
                  NextToken;
                  if SkipToken(PARSE_LEFTPAREN) then
                     ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_TRUE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  DataType:=TYPE_BOOL;
                  DataSize:=TYPE_BOOL_SIZE;
                  pWordBool(Value)^:=VerifyWordBool(True);
                  NextToken;
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_FALSE)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  DataType:=TYPE_BOOL;
                  DataSize:=TYPE_BOOL_SIZE;
                  pWordBool(Value)^:=VerifyWordBool(False);
                  NextToken;
                  end;
               end
            else if (AnsiCompareText(TokenAsString,PARSE_NULL)=0) then
               begin
               Result:=GetNewExpToken;
               with Result do
                  begin
                  TokenType:=etCONST;
                  IsNull:=True;
                  NextToken;
                  end;
               end
            else
               begin
               TempFunctionDefinition:=DataEngine.GetFunctionDefinitionByName(TokenAsString);
               if (TempFunctionDefinition <> nil) then
                  begin
                  with TempFunctionDefinition^ do
                     begin
                     Result:=GetNewExpToken;
                     with Result do
                        begin
                        TokenType:=etFUNC;
                        TokenOperator:=eoCUSTOMFUNC;
                        DataType:=ResultType;
                        SubType:=ResultSubType;
                        DataSize:=GetDefaultDataSize(ResultType,ResultSubType);
                        NextToken;
                        ErrorIfNotSkipToken(PARSE_LEFTPAREN);
                        for I:=1 to ParamCount do
                           begin
                           ArgumentExpTokens.Add(ParseExpression1(ParseOptions-[pmAllowAllFields]));
                           if (I < ParamCount) then
                              ErrorIfNotSkipToken(PARSE_SEPARATOR);
                           end;
                        ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                        end;
                     end;
                  end
               else
                  begin
                  Result:=GetNewExpToken;
                  with Result do
                     begin
                     TokenType:=etFIELD;
                     FieldName:=Trim(TokenAsString);
                     end;
                  NextToken;
                  { Check to see if we're dealing with an alias }
                  if CheckToken(PARSE_ALIAS_QUALIFIER) then
                     begin
                     if (not (pmAllowTableQualifier in ParseOptions)) then
                        InvalidExpressionError(False);
                     NextToken;
                     if TokenIsSymbol or
                        CheckToken(PARSE_ALLFIELDS) then
                        begin
                        if CheckToken(PARSE_ALLFIELDS) and
                           (not (pmAllowAllFields in ParseOptions)) then
                           InvalidExpressionError(False);
                        with Result do
                           begin
                           TokenLiteral:=SaveTokenLiteralString;
                           SourceAlias:=StripFilePathAndExtension(FieldName,DataEngine.DataExtension);
                           FieldName:=Trim(TokenAsString);
                           end;
                        NextToken;
                        end
                     else
                        ExpectedExpressionError('identifier',False);
                     end;
                  end;
               end;
            end
         else
            ExpectedExpressionError('expression',False);
         end;
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

function TExpressionParser.ParseExpression7(ParseOptions: TParseOptions): TExpToken;
begin
   Result:=nil;
   try
      if CheckToken(PARSE_PLUS) then
         begin
         MarkSaveToken;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etUNARY;
            TokenOperator:=eoPLUS;
            NextToken;
            LeftExpToken:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
            DataType:=LeftExpToken.DataType;
            TokenLiteral:=TokenLiteral+LeftExpToken.TokenLiteral;
            end;
         end
      else if CheckToken(PARSE_MINUS) then
         begin
         MarkSaveToken;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etUNARY;
            TokenOperator:=eoMINUS;
            NextToken;
            LeftExpToken:=ParseExpression8(ParseOptions-[pmAllowAllFields]);
            DataType:=LeftExpToken.DataType;
            TokenLiteral:=TokenLiteral+LeftExpToken.TokenLiteral;
            end;
         end
      else
         Result:=ParseExpression8(ParseOptions);
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

function TExpressionParser.ParseExpression6(ParseOptions: TParseOptions): TExpToken;
var
   TempExpToken: TExpToken;
begin
   Result:=ParseExpression7(ParseOptions);
   try
      while True do
         begin
         if CheckToken(PARSE_MULTIPLY) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoMUL;
               DataType:=TempExpToken.DataType;
               LeftExpToken:=TempExpToken;
               NextToken;
               RightExpToken:=ParseExpression7(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else if CheckToken(PARSE_DIVIDE) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoDIV;
               DataType:=TempExpToken.DataType;
               LeftExpToken:=TempExpToken;
               NextToken;
               RightExpToken:=ParseExpression7(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else if CheckTokenSymbol(PARSE_MOD) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoMOD;
               DataType:=TempExpToken.DataType;
               LeftExpToken:=TempExpToken;
               NextToken;
               RightExpToken:=ParseExpression7(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else
            Break;
         end;
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

function TExpressionParser.ParseExpression5(ParseOptions: TParseOptions): TExpToken;
var
   TempExpToken: TExpToken;
begin
   Result:=ParseExpression6(ParseOptions);
   try
      while True do
         begin
         if CheckToken(PARSE_PLUS) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoADD;
               DataType:=TempExpToken.DataType;
               LeftExpToken:=TempExpToken;
               NextToken;
               RightExpToken:=ParseExpression6(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else if CheckToken(PARSE_MINUS) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoSUB;
               DataType:=TempExpToken.DataType;
               LeftExpToken:=TempExpToken;
               NextToken;
               RightExpToken:=ParseExpression6(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else if CheckToken(PARSE_CONCATENATE) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoADD;
               DataType:=TempExpToken.DataType;
               LeftExpToken:=TempExpToken;
               NextToken;
               ErrorIfNotSkipToken(PARSE_CONCATENATE);
               RightExpToken:=ParseExpression6(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else
            Break;
         end;
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

function TExpressionParser.ParseExpression4(ParseOptions: TParseOptions): TExpToken;
var
   TempExpToken: TExpToken;
   TempObjectContext: TObject;
begin
   Result:=ParseExpression5(ParseOptions);
   try
      if CheckToken(PARSE_EQUAL) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etBINARY;
            TokenOperator:=eoEQ;
            DataType:=TYPE_BOOL;
            LeftExpToken:=TempExpToken;
            NextToken;
            RightExpToken:=ParseExpression5(ParseOptions-[pmAllowAllFields]);
            end;
         end
      else if CheckToken(PARSE_LESSTHAN) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etBINARY;
            DataType:=TYPE_BOOL;
            LeftExpToken:=TempExpToken;
            NextToken;
            if CheckToken(PARSE_GREATERTHAN) then
               begin
               TokenLiteral:=SaveTokenLiteralString;
               TokenOperator:=eoNE;
               NextToken;
               end
            else if CheckToken(PARSE_EQUAL) then
               begin
               TokenLiteral:=SaveTokenLiteralString;
               TokenOperator:=eoLE;
               NextToken;
               end
            else
               TokenOperator:=eoLT;
            RightExpToken:=ParseExpression5(ParseOptions-[pmAllowAllFields]);
            end;
         end
      else if CheckToken(PARSE_GREATERTHAN) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etBINARY;
            DataType:=TYPE_BOOL;
            LeftExpToken:=TempExpToken;
            NextToken;
            if CheckToken(PARSE_LESSTHAN) then
               begin
               TokenLiteral:=SaveTokenLiteralString;
               TokenOperator:=eoNE;
               NextToken;
               end
            else if CheckToken(PARSE_EQUAL) then
               begin
               TokenLiteral:=SaveTokenLiteralString;
               TokenOperator:=eoGE;
               NextToken;
               end
            else
               TokenOperator:=eoGT;
            RightExpToken:=ParseExpression5(ParseOptions-[pmAllowAllFields]);
            end;
         end
      else if CheckTokenSymbol(PARSE_NOT) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etEXTBINARY;
            DataType:=TYPE_BOOL;
            ArgumentExpTokens.Add(TempExpToken);
            NextToken;
            if CheckTokenSymbol(PARSE_BETWEEN) then
               begin
               if not (pmAllowExtPredicates in ParseOptions) then
                  InvalidExpressionError(True);
               TokenLiteral:=SaveTokenLiteralString;
               TokenOperator:=eoNOTBETWEEN;
               NextToken;
               ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
               ErrorIfNotSymbol(PARSE_AND);
               NextToken;
               ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
               end
            else if CheckTokenSymbol(PARSE_LIKE) then
               begin
               if not (pmAllowExtPredicates in ParseOptions) then
                  InvalidExpressionError(True);
               TokenLiteral:=SaveTokenLiteralString;
               TokenOperator:=eoNOTLIKE;
               NextToken;
               ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
               if CheckTokenSymbol(PARSE_LIKE_ESCAPE) then
                  begin
                  NextToken;
                  ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
                  end;
               end
            else if CheckTokenSymbol(PARSE_IN) then
               begin
               if not (pmAllowExtPredicates in ParseOptions) then
                  InvalidExpressionError(True);
               TokenLiteral:=SaveTokenLiteralString;
               NextToken;
               ErrorIfNotSkipToken(PARSE_LEFTPAREN);
               if CheckTokenSymbol(PARSE_SELECT) then
                  begin
                  if not (pmAllowSubSelects in ParseOptions) then
                     InvalidExpressionError(False);
                  MarkSaveToken;
                  TokenOperator:=eoNOTSUBIN;
                  TempExpToken:=GetNewExpToken;
                  with TempExpToken do
                     begin
                     TokenType:=etFIELD;
                     SourceObject:=TDataQuery.Create(TQueryStatement(FOwner));
                     TDataQuery(FObjectContext).AddSubQuery(TDataQuery(SourceObject));
                     with TDataQuery(SourceObject) do
                        begin
                        WantLiveResult:=True;
                        SubSelectType:=stSubSelect;
                        TempObjectContext:=FObjectContext;
                        FObjectContext:=SourceObject;
                        try
                           ParseQuery(TDataQuery(TempObjectContext));
                           TokenLiteral:=StatementText;
                        finally
                           FObjectContext:=TempObjectContext;
                        end;
                        end;
                     end;
                  ArgumentExpTokens.Add(TempExpToken);
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end
               else
                  begin
                  TokenOperator:=eoNOTIN;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  while True do
                     begin
                     if (not SkipToken(PARSE_SEPARATOR)) then
                        Break;
                     ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                     end;
                  ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
                  end;
               end
            else
               ExpectedExpressionError('expression',False);
            end;
         end
      else if CheckTokenSymbol(PARSE_LIKE) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         if not (pmAllowExtPredicates in ParseOptions) then
            InvalidExpressionError(False);
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etEXTBINARY;
            TokenOperator:=eoLIKE;
            DataType:=TYPE_BOOL;
            ArgumentExpTokens.Add(TempExpToken);
            NextToken;
            ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
            if CheckTokenSymbol(PARSE_LIKE_ESCAPE) then
               begin
               NextToken;
               ArgumentExpTokens.Add(ParseExpression8(ParseOptions-[pmAllowAllFields]));
               end;
            end;
         end
      else if CheckTokenSymbol(PARSE_BETWEEN) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         if not (pmAllowExtPredicates in ParseOptions) then
            InvalidExpressionError(False);
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etEXTBINARY;
            TokenOperator:=eoBETWEEN;
            DataType:=TYPE_BOOL;
            ArgumentExpTokens.Add(TempExpToken);
            NextToken;
            ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
            ErrorIfNotSymbol(PARSE_AND);
            NextToken;
            ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
            end;
         end
      else if CheckTokenSymbol(PARSE_IN) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         if not (pmAllowExtPredicates in ParseOptions) then
            InvalidExpressionError(False);
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etEXTBINARY;
            DataType:=TYPE_BOOL;
            ArgumentExpTokens.Add(TempExpToken);
            NextToken;
            ErrorIfNotSkipToken(PARSE_LEFTPAREN);
            if CheckTokenSymbol(PARSE_SELECT) then
               begin
               if not (pmAllowSubSelects in ParseOptions) then
                  InvalidExpressionError(False);
               MarkSaveToken;
               TokenOperator:=eoSUBIN;
               TempExpToken:=GetNewExpToken;
               with TempExpToken do
                  begin
                  TokenType:=etFIELD;
                  SourceObject:=TDataQuery.Create(TQueryStatement(FOwner));
                  TDataQuery(FObjectContext).AddSubQuery(TDataQuery(SourceObject));
                  with TDataQuery(SourceObject) do
                     begin
                     WantLiveResult:=True;
                     SubSelectType:=stSubSelect;
                     TempObjectContext:=FObjectContext;
                     FObjectContext:=SourceObject;
                     try
                        ParseQuery(TDataQuery(TempObjectContext));
                        TokenLiteral:=StatementText;
                     finally
                        FObjectContext:=TempObjectContext;
                     end;
                     end;
                  end;
               ArgumentExpTokens.Add(TempExpToken);
               ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
               end
            else
               begin
               TokenOperator:=eoIN;
               ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
               while True do
                  begin
                  if (not SkipToken(PARSE_SEPARATOR)) then
                     Break;
                  ArgumentExpTokens.Add(ParseExpression5(ParseOptions-[pmAllowAllFields]));
                  end;
               ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
               end;
            end;
         end
      else if CheckTokenSymbol(PARSE_IS) then
         begin
         CheckForAllFields(Result);
         MarkSaveToken;
         TempExpToken:=Result;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etBINARY;
            DataType:=TYPE_BOOL;
            LeftExpToken:=TempExpToken;
            NextToken;
            if CheckTokenSymbol(PARSE_NULL) then
               begin
               if not (pmAllowExtPredicates in ParseOptions) then
                  InvalidExpressionError(True);
               TokenLiteral:=SaveTokenLiteralString;
               TokenOperator:=eoEQ;
               NextToken;
               RightExpToken:=GetNewExpToken;
               with RightExpToken do
                  begin
                  TokenLiteral:='';
                  TokenType:=etCONST;
                  IsNull:=True;
                  end;
               end
            else if CheckTokenSymbol(PARSE_NOT) then
               begin
               NextToken;
               if CheckTokenSymbol(PARSE_NULL) then
                  begin
                  if not (pmAllowExtPredicates in ParseOptions) then
                     InvalidExpressionError(True);
                  TokenLiteral:=SaveTokenLiteralString;
                  TokenOperator:=eoNE;
                  NextToken;
                  RightExpToken:=GetNewExpToken;
                  with RightExpToken do
                     begin
                     TokenLiteral:='';
                     TokenType:=etCONST;
                     IsNull:=True;
                     end;
                  end
               else
                  ExpectedExpressionError(PARSE_NULL,False);
               end
            else
               ExpectedExpressionError(PARSE_NULL+' or '+PARSE_NOT,False);
            end;
         end;
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

function TExpressionParser.ParseExpression3(ParseOptions: TParseOptions): TExpToken;
begin
   Result:=nil;
   try
      if CheckTokenSymbol(PARSE_NOT) then
         begin
         MarkSaveToken;
         Result:=GetNewExpToken;
         with Result do
            begin
            TokenType:=etUNARY;
            TokenOperator:=eoNOT;
            DataType:=TYPE_BOOL;
            NextToken;
            LeftExpToken:=ParseExpression4(ParseOptions-[pmAllowAllFields]);
            end;
         end
      else
         Result:=ParseExpression4(ParseOptions);
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

function TExpressionParser.ParseExpression2(ParseOptions: TParseOptions): TExpToken;
var
   TempExpToken: TExpToken;
begin
   Result:=ParseExpression3(ParseOptions);
   try
      while True do
         begin
         if CheckTokenSymbol(PARSE_AND) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoAND;
               DataType:=TYPE_BOOL;
               LeftExpToken:=TempExpToken;
               NextToken;
               RightExpToken:=ParseExpression3(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else
            Break;
         end;
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

function TExpressionParser.ParseExpression1(ParseOptions: TParseOptions): TExpToken;
var
   TempExpToken: TExpToken;
begin
   Result:=ParseExpression2(ParseOptions);
   try
      while True do
         begin
         if CheckTokenSymbol(PARSE_OR) then
            begin
            CheckForAllFields(Result);
            MarkSaveToken;
            TempExpToken:=Result;
            Result:=GetNewExpToken;
            with Result do
               begin
               TokenType:=etBINARY;
               TokenOperator:=eoOR;
               DataType:=TYPE_BOOL;
               LeftExpToken:=TempExpToken;
               NextToken;
               RightExpToken:=ParseExpression2(ParseOptions-[pmAllowAllFields]);
               end;
            end
         else
            Break;
         end;
   except
      FreeExpressionTokens(Result);
      raise;
   end;
end;

{ TImportParser }

constructor TImportParser.Create(Owner: TObject);
begin
   FOwner:=Owner;
   FExpression:=nil;
   FPtr:=nil;
   FTokenPtr:=nil;
   FToken:=PARSE_TERM;
   FStringPtr:=nil;
   FLinePtr:=nil;
   FCurLine:=0;
end;

destructor TImportParser.Destroy;
begin
   FPtr:=nil;
   FTokenPtr:=nil;
   FToken:=PARSE_TERM;
   FStringPtr:=nil;
   inherited Destroy;
end;

function TImportParser.GetCurColumn: Integer;
begin
   Result:=((FTokenPtr-FLinePtr)+1);
end;

procedure TImportParser.ExpectedTokenError(ExpectedToken: Char);
begin
   if (FTokenPtr^ in [PARSE_TERM,PARSE_CR,PARSE_LF]) then
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Missing '+ExpectedToken+' in '+FErrorContext,'','',
                            CurLine,CurColumn)
   else
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Expected '+ExpectedToken+' but instead found '+TokenLiteralString+
                            ' in '+FErrorContext,'','',
                            CurLine,CurColumn);
end;

procedure TImportParser.ExpectedExpressionError(const ExpectedExpression: AnsiString);
begin
   if (FTokenPtr^=PARSE_TERM) then
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Missing '+ExpectedExpression+' in '+FErrorContext,'','',
                            CurLine,CurColumn)
   else
      DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                            'Expected '+ExpectedExpression+' but instead found '+
                            TokenLiteralString+' in '+FErrorContext,'','',
                            CurLine,CurColumn);
end;

procedure TImportParser.InvalidExpressionError;
begin
   DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                         'Invalid expression '+TokenLiteralString+
                         ' found '+' in '+FErrorContext,'','',
                         CurLine,CurColumn);
end;

procedure TImportParser.InvalidError(const InvalidMessage: AnsiString);
begin
   DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                         InvalidMessage+' in '+FErrorContext,'','',
                         CurLine,CurColumn);
end;

procedure TImportParser.SetExpression(ExpressionBuffer: PChar);
begin
   FExpression:=ExpressionBuffer;
   FPtr:=FExpression;
   FTokenPtr:=FExpression;
   FToken:=PARSE_TERM;
   FStringPtr:=FExpression;
   FLinePtr:=FExpression;
   FCurLine:=1;
end;

procedure TImportParser.IncLine;
begin
   Inc(FCurLine);
   FLinePtr:=FPtr;
end;

procedure TImportParser.SkipBlanks;
begin
   while True do
      begin
      if (FPtr^ <> ' ') then
         Break;
      Inc(FPtr);
      end;
end;

function TImportParser.NextToken: Char;
var
   P: PChar;
begin
   SkipBlanks;
   P:=FPtr;
   FTokenPtr:=P;
   if (P^=PARSE_SINGLEQUOTE) then
      begin
      Inc(P);
      while True do
         begin
         case P^ of
            PARSE_TERM,PARSE_CR,PARSE_LF:
               begin
               FPtr:=(P-1);
               FStringPtr:=(P-1);
               FToken:=TOKEN_SINGLESTRING;
               ExpectedTokenError(PARSE_SINGLEQUOTE);
               end;
            PARSE_SINGLEQUOTE:
               begin
               Inc(P);
               if (P^ <> PARSE_SINGLEQUOTE) then
                  Break;
               end;
            end;
         Inc(P);
         end;
      FStringPtr:=P;
      Result:=TOKEN_SINGLESTRING;
      end
   else if (P^=PARSE_DOUBLEQUOTE) then
      begin
      Inc(P);
      while True do
         begin
         case P^ of
            PARSE_TERM,PARSE_CR,PARSE_LF:
               begin
               FPtr:=(P-1);
               FStringPtr:=(P-1);
               FToken:=TOKEN_DOUBLESTRING;
               ExpectedTokenError(PARSE_DOUBLEQUOTE);
               end;
            PARSE_DOUBLEQUOTE:
               begin
               Inc(P);
               if (P^ <> PARSE_DOUBLEQUOTE) then
                  Break;
               end;
            end;
         Inc(P);
         end;
      FStringPtr:=P;
      Result:=TOKEN_DOUBLESTRING;
      end
   else if (not (P^ in [FFieldDelimiter,PARSE_CR,PARSE_LF,PARSE_TERM])) then
      begin
      Inc(P);
      while (not (P^ in [FFieldDelimiter,PARSE_CR,PARSE_LF,PARSE_TERM])) do
         Inc(P);
      Result:=TOKEN_SYMBOL;
      end
   else
      begin
      Result:=P^;
      if (Result <> PARSE_TERM) then
         Inc(P);
      end;
   FPtr:=P;
   FToken:=Result;
end;

function TImportParser.TokenLiteralString: AnsiString;
begin
   SetLength(Result,(FPtr-FTokenPtr));
   Move(FTokenPtr^,PChar(Result)^,(FPtr-FTokenPtr));
end;

function TImportParser.TokenAsString: AnsiString;
var
   TempLength: Integer;
   TempPtr: PChar;
begin
   if (FToken in [TOKEN_SINGLESTRING,TOKEN_DOUBLESTRING]) then
      begin
      TempLength:=((FStringPtr-FTokenPtr)-2);
      TempPtr:=(FTokenPtr+1);
      end
   else
      begin
      TempLength:=(FPtr-FTokenPtr);
      TempPtr:=FTokenPtr;
      end;
   SetLength(Result,TempLength);
   Move(TempPtr^,PChar(Result)^,TempLength);
   if (FToken=TOKEN_SINGLESTRING) then
      Result:=ConvertQuotes(PARSE_SINGLEQUOTE,Result)
   else if (FToken=TOKEN_DOUBLESTRING) then
      Result:=ConvertQuotes(PARSE_DOUBLEQUOTE,Result)
   else
      Result:=ConvertQuotes(' ',Result);
end;

function TImportParser.CheckTokenSymbol(const Value: AnsiString): Boolean;
begin
   Result:=((FToken in [TOKEN_SYMBOL]) and
            (AnsiCompareText(TokenAsString,Value)=0));
end;

function TImportParser.CheckTokenString(const Value: AnsiString): Boolean;
begin
   Result:=((FToken in [TOKEN_SINGLESTRING,TOKEN_DOUBLESTRING]) and
            (AnsiCompareText(TokenAsString,Value)=0));
end;

function TImportParser.CheckToken(Value: Char): Boolean;
begin
   Result:=(FToken=Value);
end;

{ TExpressionVerifier }

constructor TExpressionVerifier.Create(Owner: TObject);
begin
   FOwner:=Owner;
end;

destructor TExpressionVerifier.Destroy;
begin
   inherited Destroy;
end;

procedure TExpressionVerifier.SetFieldCallback(ClientData: Integer;
                                               FieldCallback: pVerifyFieldCallback);
begin
   FFieldClientData:=ClientData;
   FFieldCallback:=pVerifyFieldCallback(@FieldCallback);
end;

function TExpressionVerifier.AddLiteral(const ExistingLiteral: AnsiString;
                                        const NewLiteral: AnsiString): AnsiString;
begin
   if (ExistingLiteral='') then
      Result:=NewLiteral
   else
      Result:=ExistingLiteral+', '+NewLiteral;
end;

function TExpressionVerifier.GetTypeLiterals(ExpectedDataTypes: TDataTypeSet;
                                             ExpectedSubTypes: TSubTypeSet): AnsiString;
var
   NumAdded: Integer;
begin
   Result:='NULL';
   NumAdded:=0;
   if (TYPE_ZSTRING in ExpectedDataTypes) then
      begin
      if (SUBTYPE_FIXED in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_ZSTRING_FIXED);
         Inc(NumAdded);
         end;
      if (SUBTYPE_GUID in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_ZSTRING_GUID);
         Inc(NumAdded);
         end;
      if (SUBTYPE_UNKNOWN in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_ZSTRING);
         Inc(NumAdded);
         end;
      end;
   if (TYPE_BYTES in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_BYTES);
      Inc(NumAdded);
      end;
   if (TYPE_VARBYTES in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_VARBYTES);
      Inc(NumAdded);
      end;
   if (TYPE_BOOL in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_BOOL);
      Inc(NumAdded);
      end;
   if (TYPE_INT16 in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_INT16);
      Inc(NumAdded);
      end;
   if (TYPE_UINT16 in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_UINT16);
      Inc(NumAdded);
      end;
   if (TYPE_INT32 in ExpectedDataTypes) then
      begin
      if (SUBTYPE_AUTOINC in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_INT32_AUTOINC);
         Inc(NumAdded);
         end;
      if (SUBTYPE_UNKNOWN in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_INT32);
         Inc(NumAdded);
         end;
      end;
   if (TYPE_INT64 in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_INT64);
      Inc(NumAdded);
      end;
   if (TYPE_FLOAT in ExpectedDataTypes) then
      begin
      if (SUBTYPE_MONEY in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_FLOAT_MONEY);
         Inc(NumAdded);
         end;
      if (SUBTYPE_UNKNOWN in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_FLOAT);
         Inc(NumAdded);
         end;
      end;
   if (TYPE_BCD in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_BCD);
      Inc(NumAdded);
      end;
   if (TYPE_DATE in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_DATE);
      Inc(NumAdded);
      end;
   if (TYPE_TIME in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_TIME);
      Inc(NumAdded);
      end;
   if (TYPE_TIMESTAMP in ExpectedDataTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TYPESTR_TIMESTAMP);
      Inc(NumAdded);
      end;
   if (TYPE_BLOB in ExpectedDataTypes) then
      begin
      if (SUBTYPE_MEMO in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_BLOB_MEMO);
         Inc(NumAdded);
         end;
      if (SUBTYPE_GRAPHIC in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_BLOB_GRAPHIC);
         Inc(NumAdded);
         end;
      if (SUBTYPE_UNKNOWN in ExpectedSubTypes) then
         begin
         Result:=AddLiteral(Result,DBISAM_TYPESTR_BLOB);
         Inc(NumAdded);
         end;   
      end;
   if (NumAdded > 1) and (Rat(' ',Result) > 0) then
      Result:=Copy(Result,1,(Rat(' ',Result)-1))+' or '+
              Copy(Result,(Rat(' ',Result)+1),Length(Result));
   Result:=Result+' expression';
end;

procedure TExpressionVerifier.ExpectedTypesError(const ExpToken: TExpToken;
                                                 ExpectedDataTypes: TDataTypeSet;
                                                 ExpectedSubTypes: TSubTypeSet);
begin
   DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                         'Expected '+GetTypeLiterals(ExpectedDataTypes,ExpectedSubTypes)+
                         ' but instead found '+ExpToken.TokenLiteral+
                         ' in '+FErrorContext,'','',ExpToken.Line,ExpToken.Column);
end;

procedure TExpressionVerifier.CheckTypes(ExpToken: TExpToken;
                                         ValidDataTypes: TDataTypeSet;
                                         ValidSubTypes: TSubTypeSet;
                                         AllowUnknownTypes: Boolean);
begin
   if (not ((AllowUnknownTypes and (ExpToken.DataType=TYPE_UNKNOWN)) or
            ((ExpToken.DataType in ValidDataTypes) and
             (ExpToken.SubType in ValidSubTypes)))) then
      ExpectedTypesError(ExpToken,ValidDataTypes,ValidSubTypes);
end;

procedure TExpressionVerifier.CheckUnaryTypes(Operator: TExpOperator; LeftExpToken: TExpToken;
                                              AllowUnknownTypes: Boolean);
begin
   case Operator of
      eoNOT:
         CheckTypes(LeftExpToken,[TYPE_BOOL],[SUBTYPE_UNKNOWN],AllowUnknownTypes);
      eoPLUS,eoMINUS:
         CheckTypes(LeftExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                    [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],AllowUnknownTypes);
      end;
end;

procedure TExpressionVerifier.CheckBinaryTypes(Operator: TExpOperator;
                                               LeftExpToken: TExpToken;
                                               RightExpToken: TExpToken;
                                               AllowUnknownTypes: Boolean);
begin
   case Operator of
      eoAND,eoOR:
         begin
         CheckTypes(LeftExpToken,[TYPE_BOOL],[SUBTYPE_UNKNOWN],AllowUnknownTypes);
         if (LeftExpToken.DataType=TYPE_BOOL) then
            CheckTypes(RightExpToken,[TYPE_BOOL],[SUBTYPE_UNKNOWN],AllowUnknownTypes);
         end;
      eoEQ,eoNE:
         begin
         CheckTypes(LeftExpToken,[TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES,TYPE_BLOB,TYPE_BOOL,
                    TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                    TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
                    [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO,SUBTYPE_GRAPHIC,
                     SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnknownTypes);
         case LeftExpToken.DataType of
            TYPE_ZSTRING:
               begin
               if (RightExpToken.DataType=TYPE_ZSTRING) then
                  CheckTypes(RightExpToken,[TYPE_ZSTRING],
                             [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
               else
                  { Version 5 }
                  CheckTypes(RightExpToken,[TYPE_ZSTRING,TYPE_BLOB],
                             [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO],AllowUnknownTypes);
                  { Version 5 }
               end;
            TYPE_BLOB:
               begin
               if (LeftExpToken.SubType=SUBTYPE_MEMO) then
                  begin
                  if (RightExpToken.DataType=TYPE_ZSTRING) then
                     CheckTypes(RightExpToken,[TYPE_ZSTRING],
                                [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
                  else
                     { Version 5 }
                     CheckTypes(RightExpToken,[TYPE_ZSTRING,TYPE_BLOB],
                                [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO],AllowUnknownTypes);
                     { Version 5 }
                  end
               else
                  CheckTypes(RightExpToken,[],[],AllowUnknownTypes);
               end;
            TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
               CheckTypes(RightExpToken,[TYPE_BOOL,TYPE_INT32,TYPE_INT64,
                          TYPE_INT16,TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                           AllowUnknownTypes);
            TYPE_FLOAT,TYPE_BCD:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                          TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                           AllowUnknownTypes);
            TYPE_DATE:
               CheckTypes(RightExpToken,[TYPE_DATE,TYPE_TIMESTAMP],
                          [SUBTYPE_UNKNOWN],AllowUnknownTypes);
            TYPE_TIME:
               CheckTypes(RightExpToken,[TYPE_TIME],
                          [SUBTYPE_UNKNOWN],AllowUnknownTypes);
            TYPE_TIMESTAMP:
               CheckTypes(RightExpToken,[TYPE_DATE,TYPE_TIMESTAMP],
                          [SUBTYPE_UNKNOWN],AllowUnknownTypes);
            TYPE_BOOL:
               CheckTypes(RightExpToken,[TYPE_BOOL,TYPE_INT32,TYPE_INT64,
                          TYPE_INT16,TYPE_UINT16],
                          [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
            TYPE_BYTES,TYPE_VARBYTES:
               CheckTypes(RightExpToken,[TYPE_BYTES,TYPE_VARBYTES],
                          [SUBTYPE_UNKNOWN],AllowUnknownTypes);
            end;
         end;
      eoGT,eoGE,eoLT,eoLE:
         begin
         CheckTypes(LeftExpToken,[TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES,TYPE_BLOB,
                    TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                    TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
                    [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO,
                     SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnknownTypes);
         case LeftExpToken.DataType of
            TYPE_ZSTRING:
               begin
               if (RightExpToken.DataType=TYPE_ZSTRING) then
                  CheckTypes(RightExpToken,[TYPE_ZSTRING],
                             [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
               else
                  { Version 5 }
                  CheckTypes(RightExpToken,[TYPE_ZSTRING,TYPE_BLOB],
                             [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO],AllowUnknownTypes);
                  { Version 5 }
               end;
            TYPE_BLOB:
               begin
               if (LeftExpToken.SubType=SUBTYPE_MEMO) then
                  begin
                  if (RightExpToken.DataType=TYPE_ZSTRING) then
                     CheckTypes(RightExpToken,[TYPE_ZSTRING],
                                [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
                  else
                     { Version 5 }
                     CheckTypes(RightExpToken,[TYPE_ZSTRING,TYPE_BLOB],
                                [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO],AllowUnknownTypes);
                     { Version 5 }
                  end
               else
                  CheckTypes(RightExpToken,[],[],AllowUnknownTypes);
               end;
            TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                          TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                          AllowUnknownTypes);
            TYPE_FLOAT,TYPE_BCD:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                          TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                          AllowUnknownTypes);
            TYPE_DATE:
               CheckTypes(RightExpToken,[TYPE_DATE,TYPE_TIMESTAMP],
                          [SUBTYPE_UNKNOWN],AllowUnknownTypes);
            TYPE_TIME:
               CheckTypes(RightExpToken,[TYPE_TIME],
                          [SUBTYPE_UNKNOWN],AllowUnknownTypes);
            TYPE_TIMESTAMP:
               CheckTypes(RightExpToken,[TYPE_DATE,TYPE_TIMESTAMP],
                          [SUBTYPE_UNKNOWN],AllowUnknownTypes);
            end;
         end;
      eoADD:
         begin
         CheckTypes(LeftExpToken,[TYPE_ZSTRING,TYPE_BLOB,
                    TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                    TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
                    [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO,
                     SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnknownTypes);
         case LeftExpToken.DataType of
            TYPE_ZSTRING:
               begin
               if (RightExpToken.DataType=TYPE_ZSTRING) then
                  CheckTypes(RightExpToken,[TYPE_ZSTRING],
                             [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
               else
                  { Version 5 }
                  CheckTypes(RightExpToken,[TYPE_ZSTRING,TYPE_BLOB],
                             [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO],AllowUnknownTypes);
                  { Version 5 }
               end;
            TYPE_BLOB:
               begin
               if (LeftExpToken.SubType=SUBTYPE_MEMO) then
                  begin
                  if (RightExpToken.DataType=TYPE_ZSTRING) then
                     CheckTypes(RightExpToken,[TYPE_ZSTRING],
                                [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
                  else
                     { Version 5 }
                     CheckTypes(RightExpToken,[TYPE_ZSTRING,TYPE_BLOB],
                                [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO],AllowUnknownTypes);
                     { Version 5 }
                  end
               else
                  CheckTypes(RightExpToken,[],[],AllowUnknownTypes);
               end;
            TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                          TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],AllowUnknownTypes);
            TYPE_FLOAT,TYPE_BCD:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                          TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                          AllowUnknownTypes);
            TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16],
                          [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
            end;
         end;
      eoSUB:
         begin
         CheckTypes(LeftExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                    TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
                    [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnknownTypes);
         case LeftExpToken.DataType of
            TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                          TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                           AllowUnknownTypes);
            TYPE_FLOAT,TYPE_BCD:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                           TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                           AllowUnknownTypes);
            TYPE_DATE:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                           TYPE_UINT16,TYPE_DATE],
                          [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
            TYPE_TIME:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                           TYPE_UINT16,TYPE_TIME],
                          [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
            TYPE_TIMESTAMP:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                           TYPE_UINT16,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
                          [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
            end;
         end;
      eoMUL,eoDIV:
         begin
         CheckTypes(LeftExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                    TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                    [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC,SUBTYPE_MONEY],
                     AllowUnknownTypes);
         case LeftExpToken.DataType of
            TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                          TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                          AllowUnknownTypes);
            TYPE_FLOAT,TYPE_BCD:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                          TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                          [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                           AllowUnknownTypes);
            end;
         end;
      eoMOD:
         begin
         CheckTypes(LeftExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16],
                    [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
         case LeftExpToken.DataType of
            TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
               CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16],
                          [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
            end;
         end;
      end;
end;

procedure TExpressionVerifier.CheckArgumentTypes(LeftExpToken: TExpToken;
                                                 RightExpToken: TExpToken;
                                                 AllowUnknownTypes: Boolean);
begin
   CheckTypes(LeftExpToken,[TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES,TYPE_BLOB,TYPE_BOOL,
              TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
              TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
              [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO,SUBTYPE_GRAPHIC,
               SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnknownTypes);
   case LeftExpToken.DataType of
      TYPE_ZSTRING:
         begin
         if (RightExpToken.DataType=TYPE_ZSTRING) then
            CheckTypes(RightExpToken,[TYPE_ZSTRING],
                       [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
         else
            { Version 5 }
            CheckTypes(RightExpToken,[TYPE_ZSTRING,TYPE_BLOB],
                       [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_MEMO],AllowUnknownTypes);
            { Version 5 }
         end;
      TYPE_BLOB:
         begin
         if (LeftExpToken.SubType=SUBTYPE_MEMO) then
            begin
            if (RightExpToken.DataType=TYPE_ZSTRING) then
               CheckTypes(RightExpToken,[TYPE_ZSTRING],
                          [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
            else
               CheckTypes(RightExpToken,[TYPE_BLOB],[SUBTYPE_MEMO],AllowUnknownTypes);
            end
         else
            CheckTypes(RightExpToken,[TYPE_BLOB],[SUBTYPE_UNKNOWN,SUBTYPE_MEMO,SUBTYPE_GRAPHIC],AllowUnknownTypes);
         end;
      TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
         CheckTypes(RightExpToken,[TYPE_BOOL,TYPE_INT32,TYPE_INT64,
                    TYPE_INT16,TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                    [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                     AllowUnknownTypes);
      TYPE_FLOAT,TYPE_BCD:
         CheckTypes(RightExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,
                    TYPE_UINT16,TYPE_FLOAT,TYPE_BCD],
                    [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],
                     AllowUnknownTypes);
      TYPE_DATE:
         CheckTypes(RightExpToken,[TYPE_DATE,TYPE_TIMESTAMP],
                    [SUBTYPE_UNKNOWN],AllowUnknownTypes);
      TYPE_TIME:
         CheckTypes(RightExpToken,[TYPE_TIME],
                    [SUBTYPE_UNKNOWN],AllowUnknownTypes);
      TYPE_TIMESTAMP:
         CheckTypes(RightExpToken,[TYPE_DATE,TYPE_TIMESTAMP],
                    [SUBTYPE_UNKNOWN],AllowUnknownTypes);
      TYPE_BOOL:
         CheckTypes(RightExpToken,[TYPE_BOOL,TYPE_INT32,TYPE_INT64,
                    TYPE_INT16,TYPE_UINT16],
                    [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
      TYPE_BYTES,TYPE_VARBYTES:
         CheckTypes(RightExpToken,[TYPE_BYTES,TYPE_VARBYTES],
                    [SUBTYPE_UNKNOWN],AllowUnknownTypes);
      end;
end;

procedure TExpressionVerifier.CheckStringTypes(ExpToken: TExpToken;
                                              AllowUnknownTypes: Boolean);
begin
   if (ExpToken.DataType=TYPE_ZSTRING) then
      CheckTypes(ExpToken,[TYPE_ZSTRING],
                 [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID],AllowUnknownTypes)
   else
      CheckTypes(ExpToken,[TYPE_BLOB],[SUBTYPE_MEMO],AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckBlobTypes(ExpToken: TExpToken;
                                             AllowUnknownTypes: Boolean);
begin
   CheckTypes(ExpToken,[TYPE_BLOB],
              [SUBTYPE_UNKNOWN,SUBTYPE_MEMO,SUBTYPE_GRAPHIC],
              AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckStringNumericDateTimeTypes(ExpToken: TExpToken;
                                                              AllowUnknownTypes: Boolean);
begin
   CheckTypes(ExpToken,[TYPE_ZSTRING,TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
              TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
              [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,SUBTYPE_AUTOINC,
               SUBTYPE_MONEY],AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckBooleanTypes(ExpToken: TExpToken;
                                               AllowUnknownTypes: Boolean);
begin
   CheckTypes(ExpToken,[TYPE_BOOL,TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16],
              [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckNumericTypes(ExpToken: TExpToken;
                                               AllowUnknownTypes: Boolean);
begin
   CheckTypes(ExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
              TYPE_FLOAT,TYPE_BCD],
              [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckNumericDateTimeTypes(ExpToken: TExpToken;
                                                        AllowUnknownTypes: Boolean);
begin
   CheckTypes(ExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
              TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
              [SUBTYPE_UNKNOWN,SUBTYPE_MONEY,SUBTYPE_AUTOINC],AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckIntegerTypes(ExpToken: TExpToken;
                                               AllowUnknownTypes: Boolean);
begin
   CheckTypes(ExpToken,[TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16],
              [SUBTYPE_UNKNOWN,SUBTYPE_AUTOINC],AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckDateTimeTypes(ExpToken: TExpToken;
                                                AllowUnknownTypes: Boolean);
begin
   CheckTypes(ExpToken,[TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
              [SUBTYPE_UNKNOWN],AllowUnknownTypes);
end;

procedure TExpressionVerifier.CheckCastTypes(SourceToken: TExpToken; DestToken: TExpToken;
                                             AllowUnknownTypes: Boolean);
begin
   CheckTypes(DestToken,[TYPE_BLOB,TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES,
              TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_BOOL,
              TYPE_FLOAT,TYPE_BCD,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
              [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_GUID,
               SUBTYPE_MEMO,SUBTYPE_GRAPHIC,SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnkNownTypes);
   case DestToken.DataType of
      TYPE_BLOB,TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES:
         begin
         { Do nothing, these casts are always okay }
         end;
      TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_BOOL,TYPE_FLOAT,TYPE_BCD:
         CheckTypes(SourceToken,[TYPE_ZSTRING,TYPE_FLOAT,TYPE_BCD,TYPE_BOOL,TYPE_INT16,TYPE_INT32,
                    TYPE_INT64,TYPE_UINT16,TYPE_BYTES,TYPE_VARBYTES],
                   [SUBTYPE_UNKNOWN,SUBTYPE_FIXED,SUBTYPE_AUTOINC,SUBTYPE_MONEY],AllowUnknownTypes);
      TYPE_DATE:
         CheckTypes(SourceToken,[TYPE_ZSTRING,TYPE_DATE,TYPE_TIMESTAMP,
                    TYPE_BYTES,TYPE_VARBYTES],
                   [SUBTYPE_UNKNOWN,SUBTYPE_FIXED],AllowUnknownTypes);
      TYPE_TIME:
         CheckTypes(SourceToken,[TYPE_ZSTRING,TYPE_TIME,TYPE_TIMESTAMP,
                    TYPE_BYTES,TYPE_VARBYTES],
                   [SUBTYPE_UNKNOWN,SUBTYPE_FIXED],AllowUnknownTypes);
      TYPE_TIMESTAMP:
         CheckTypes(SourceToken,[TYPE_ZSTRING,TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP,
                    TYPE_BYTES,TYPE_VARBYTES],
                   [SUBTYPE_UNKNOWN,SUBTYPE_FIXED],AllowUnknownTypes);
      end;
end;

procedure TExpressionVerifier.ExpectedExpressionError(const ExpToken: TExpToken;
                                                      const ExpectedExpression: AnsiString);
begin
   DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                         'Expected '+ExpectedExpression+' but instead found '+
                         ExpToken.TokenLiteral+' in '+FErrorContext,'','',
                         ExpToken.Line,ExpToken.Column);
end;

function TExpressionVerifier.GetTokenTypeLiterals(ExpectedTokenTypes: TExpTokenTypeSet): AnsiString;
var
   NumAdded: Integer;
begin
   Result:='';
   NumAdded:=0;
   if (etUNARY in ExpectedTokenTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TOKENSTR_UNARY);
      Inc(NumAdded);
      end;
   if (etBINARY in ExpectedTokenTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TOKENSTR_BINARY);
      Inc(NumAdded);
      end;
   if (etCOMPARE in ExpectedTokenTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TOKENSTR_COMPARE);
      Inc(NumAdded);
      end;
   if (etEXTBINARY in ExpectedTokenTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TOKENSTR_EXTBINARY);
      Inc(NumAdded);
      end;
   if (etFIELD in ExpectedTokenTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TOKENSTR_FIELD);
      Inc(NumAdded);
      end;
   if (etCONST in ExpectedTokenTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TOKENSTR_CONST);
      Inc(NumAdded);
      end;
   if (etFUNC in ExpectedTokenTypes) then
      begin
      Result:=AddLiteral(Result,DBISAM_TOKENSTR_FUNC);
      Inc(NumAdded);
      end;
   if (NumAdded > 1) and (Rat(' ',Result) > 0) then
      Result:=Copy(Result,1,(Rat(' ',Result)-1))+' or '+
              Copy(Result,(Rat(' ',Result)+1),Length(Result));
end;

procedure TExpressionVerifier.ExpectedTokenTypesError(const ExpToken: TExpToken;
                                                      ExpectedTokenTypes: TExpTokenTypeSet);
begin
   DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                         'Expected '+GetTokenTypeLiterals(ExpectedTokenTypes)+
                         ' but instead found '+ExpToken.TokenLiteral+
                         ' in '+FErrorContext,'','',ExpToken.Line,ExpToken.Column);
end;

procedure TExpressionVerifier.CheckFieldTokenType(ExpToken: TExpToken);
begin
   if (ExpToken.TokenType <> etFIELD) then
      ExpectedTokenTypesError(ExpToken,[etFIELD]);
end;

procedure TExpressionVerifier.CheckConstantTokenType(ExpToken: TExpToken);
begin
   if (ExpToken.TokenType <> etCONST) then
      ExpectedTokenTypesError(ExpToken,[etCONST]);
end;

procedure TExpressionVerifier.CheckFieldConstantTokenType(ExpToken: TExpToken);
begin
   if (not (ExpToken.TokenType in [etCONST,etFIELD])) then
      ExpectedTokenTypesError(ExpToken,[etCONST,etFIELD]);
end;

procedure TExpressionVerifier.GeneralError(Line: Integer; Column: Integer;
                                           const ErrorMessage: AnsiString);
begin
   DataEngine.RaiseError(FErrorCode,'','',FErrorDBName,FErrorTableName,'','',
                         ErrorMessage+' in '+FErrorContext,'','',Line,Column);
end;

procedure TExpressionVerifier.GeneralError(ExpToken: TExpToken;
                                           const ErrorMessage: AnsiString);
var
   TempToken: TExpToken;
begin
   TempToken:=GetLeftMostToken(ExpToken);
   GeneralError(TempToken.Line,TempToken.Column,ErrorMessage);
end;

function TExpressionVerifier.GetUnaryResultDataType(Operator: TExpOperator; LeftDataType: Byte): Byte;
begin
   Result:=TYPE_UNKNOWN;
   if (Operator=eoNOT) then
      Result:=TYPE_BOOL
   else if (Operator in [eoPLUS,eoMINUS]) then
      Result:=LeftDataType;
end;

function TExpressionVerifier.GetUnaryResultSubType(Operator: TExpOperator; LeftDataType: Byte;
                                                   LeftSubType: Byte): Byte;
begin
   Result:=TYPE_UNKNOWN;
   if (Operator=eoNOT) then
      Result:=TYPE_UNKNOWN
   else if (Operator in [eoPLUS,eoMINUS]) then
      Result:=LeftSubType;
end;

function TExpressionVerifier.GetBinaryResultDataType(Operator: TExpOperator; LeftDataType: Byte;
                                                     RightDataType: Byte): Byte;
var
   I: Integer;
   TempDataType: Byte;
begin
   Result:=TYPE_UNKNOWN;
   for I:=1 to 2 do
      begin
      case Operator of
         eoAND,eoOR,eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE:
            Result:=TYPE_BOOL;
         eoADD:
            begin
            case LeftDataType of
               TYPE_ZSTRING:
                  begin
                  case RightDataType of
                     TYPE_ZSTRING:
                        Result:=TYPE_ZSTRING;
                     TYPE_BLOB:
                        Result:=TYPE_BLOB;
                     end;
                  end;
               TYPE_BLOB:
                  begin
                  case RightDataType of
                     TYPE_ZSTRING:
                        Result:=TYPE_BLOB;
                     TYPE_BLOB:
                        Result:=TYPE_BLOB;
                     end;
                  end;
               TYPE_INT32:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_DATE:
                        Result:=TYPE_DATE;
                     TYPE_TIME:
                        Result:=TYPE_TIME;
                     TYPE_TIMESTAMP:
                        Result:=TYPE_TIMESTAMP;
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_DATE:
                        Result:=TYPE_DATE;
                     TYPE_TIME:
                        Result:=TYPE_TIME;
                     TYPE_TIMESTAMP:
                        Result:=TYPE_TIMESTAMP;
                     end;
                  end;
               TYPE_INT16:
                  begin
                  case RightDataType of
                     TYPE_INT16,TYPE_UINT16,TYPE_INT32:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_DATE:
                        Result:=TYPE_DATE;
                     TYPE_TIME:
                        Result:=TYPE_TIME;
                     TYPE_TIMESTAMP:
                        Result:=TYPE_TIMESTAMP;
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightDataType of
                     TYPE_INT16,TYPE_UINT16,TYPE_INT32:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_DATE:
                        Result:=TYPE_DATE;
                     TYPE_TIME:
                        Result:=TYPE_TIME;
                     TYPE_TIMESTAMP:
                        Result:=TYPE_TIMESTAMP;
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  if (RightDataType in [TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                                        TYPE_FLOAT,TYPE_BCD]) then
                     Result:=TYPE_FLOAT;
                  end;
               TYPE_BCD:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     end;
                  end;
               TYPE_DATE:
                  begin
                  if (RightDataType in [TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16]) then
                     Result:=TYPE_DATE;
                  end;
               TYPE_TIME:
                  begin
                  if (RightDataType in [TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16]) then
                     Result:=TYPE_TIME;
                  end;
               TYPE_TIMESTAMP:
                  begin
                  if (RightDataType in [TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16]) then
                     Result:=TYPE_TIMESTAMP;
                  end;
               end;
            end;
         eoSUB:
            begin
            case LeftDataType of
               TYPE_INT32:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     end;
                  end;
               TYPE_INT16:
                  begin
                  case RightDataType of
                     TYPE_INT16,TYPE_UINT16,TYPE_INT32:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     end;
                  end;
               TYPE_UINT16:
                  begin
                  case RightDataType of
                     TYPE_INT16,TYPE_UINT16,TYPE_INT32:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  if (RightDataType in [TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                                        TYPE_FLOAT,TYPE_BCD]) then
                     Result:=TYPE_FLOAT;
                  end;
               TYPE_BCD:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     end;
                  end;
               TYPE_DATE:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_DATE;
                     TYPE_DATE:
                        Result:=TYPE_INT32;
                     end;
                  end;
               TYPE_TIME:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_TIME;
                     TYPE_TIME:
                        Result:=TYPE_INT32;
                     end;
                  end;
               TYPE_TIMESTAMP:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_TIMESTAMP;
                     TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP:
                        Result:=TYPE_FLOAT;
                     end;
                  end;
               end;
            end;
         eoMUL:
            begin
            case LeftDataType of
               TYPE_INT32,TYPE_INT16,TYPE_UINT16:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT64;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  if (RightDataType in [TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                                        TYPE_FLOAT,TYPE_BCD]) then
                     Result:=TYPE_FLOAT;
                  end;
               TYPE_BCD:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     end;
                  end;
               end;
            end;
         eoDIV:
            begin
            case LeftDataType of
               TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     TYPE_BCD:
                        Result:=TYPE_BCD;
                     end;
                  end;
               TYPE_FLOAT:
                  begin
                  if (RightDataType in [TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,
                                        TYPE_FLOAT,TYPE_BCD]) then
                     Result:=TYPE_FLOAT;
                  end;
               TYPE_BCD:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16,TYPE_BCD:
                        Result:=TYPE_BCD;
                     TYPE_FLOAT:
                        Result:=TYPE_FLOAT;
                     end;
                  end;
               end;
            end;
         eoMOD:
            begin
            case LeftDataType of
               TYPE_INT32,TYPE_INT16,TYPE_UINT16:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT32;
                     TYPE_INT64:
                        Result:=TYPE_INT64;
                     end;
                  end;
               TYPE_INT64:
                  begin
                  case RightDataType of
                     TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16:
                        Result:=TYPE_INT64;
                     end;
                  end;
               end;
            end;
         end;
      if (Result <> TYPE_UNKNOWN) then
         Break;
      if (I=1) then
         begin
         TempDataType:=LeftDataType;
         LeftDataType:=RightDataType;
         RightDataType:=TempDataType;
         end;
      end;
end;

function TExpressionVerifier.GetBinaryResultSubType(Operator: TExpOperator; LeftDataType: Byte;
                                                    LeftSubType: Byte; RightDataType: Byte;
                                                    RightSubType: Byte): Byte;
var
   I: Integer;
   TempSubType: Byte;
begin
   Result:=TYPE_UNKNOWN;
   for I:=1 to 2 do
      begin
      case Operator of
         eoAND,eoOR,eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE:
            Result:=TYPE_UNKNOWN;
         eoADD:
            begin
            case LeftDataType of
               TYPE_ZSTRING:
                  begin
                  if (RightDataType=TYPE_BLOB) then
                     Result:=SUBTYPE_MEMO;
                  end;
               TYPE_BLOB:
                  Result:=SUBTYPE_MEMO;
               else
                  begin
                  case LeftSubType of
                     SUBTYPE_MONEY:
                        begin
                        if (RightDataType in [TYPE_FLOAT,TYPE_INT32,TYPE_INT64,
                                              TYPE_INT16,TYPE_UINT16,TYPE_BCD]) then
                           Result:=SUBTYPE_MONEY;
                        end;
                     SUBTYPE_UNKNOWN:
                        begin
                        if (RightSubType=SUBTYPE_MONEY) then
                           Result:=SUBTYPE_MONEY;
                        end;
                     end;
                  end;
               end;
            end;
         eoMUL:
            begin
            case LeftSubType of
               SUBTYPE_MONEY:
                  begin
                  if (RightDataType in [TYPE_FLOAT,TYPE_INT32,TYPE_INT64,
                                        TYPE_INT16,TYPE_UINT16,TYPE_BCD]) then
                     Result:=SUBTYPE_MONEY;
                  end;
               SUBTYPE_UNKNOWN:
                  begin
                  if (RightSubType=SUBTYPE_MONEY) then
                     Result:=SUBTYPE_MONEY;
                  end;
               end;
            end;
         eoSUB,eoDIV:
            begin
            case LeftSubType of
               SUBTYPE_MONEY:
                  begin
                  if (RightDataType in [TYPE_FLOAT,TYPE_INT32,TYPE_INT64,
                                        TYPE_INT16,TYPE_UINT16,TYPE_BCD]) then
                     Result:=SUBTYPE_MONEY;
                  end;
               SUBTYPE_UNKNOWN:
                  begin
                  if (RightSubType=SUBTYPE_MONEY) then
                     Result:=SUBTYPE_UNKNOWN;
                  end;
               end;
            end;
         end;
      if (Result <> TYPE_UNKNOWN) then
         Break;
      if (I=1) then
         begin
         TempSubType:=LeftSubType;
         LeftSubType:=RightSubType;
         RightSubType:=TempSubType;
         end;
      end;
end;

procedure TExpressionVerifier.VerifyExpression(Expression: TExpToken;
                                               TransformBooleans: Boolean;
                                               AllowUnknownTypes: Boolean);
begin
   VerifyNextToken(Expression,nil,TransformBooleans,AllowUnknownTypes);
end;

procedure TExpressionVerifier.VerifyNextToken(NextToken: TExpToken; UpperToken: TExpToken;
                                              TransformBooleans: Boolean;
                                              AllowUnknownTypes: Boolean);
var
   I: Integer;
   TempToken: TExpToken;
   TempFunctionDefinition: pFunctionDefinition;
begin
   with NextToken do
      begin
      UpperExpToken:=UpperToken;
      case TokenType of
         etUNARY:
            begin
            VerifyNextToken(LeftExpToken,NextToken,TransformBooleans,
                            AllowUnknownTypes);
            CheckUnaryTypes(TokenOperator,LeftExpToken,AllowUnknownTypes);
            DataType:=GetUnaryResultDataType(TokenOperator,
                                             LeftExpToken.DataType);
            SubType:=GetUnaryResultSubType(TokenOperator,
                                           LeftExpToken.DataType,
                                           LeftExpToken.SubType);
            DataSize:=LeftExpToken.DataSize;
            DataDecimals:=LeftExpToken.DataDecimals;
            end;
         etBINARY:
            begin
            VerifyNextToken(LeftExpToken,NextToken,
                            TransformBooleans,AllowUnknownTypes);
            VerifyNextToken(RightExpToken,NextToken,
                            TransformBooleans,AllowUnknownTypes);
            VerifyDateTimeLiteral(LeftExpToken,RightExpToken);
            VerifyDateTimeLiteral(RightExpToken,LeftExpToken);
            CheckBinaryTypes(TokenOperator,LeftExpToken,RightExpToken,
                             AllowUnknownTypes);
            DataType:=GetBinaryResultDataType(TokenOperator,
                                              LeftExpToken.DataType,
                                              RightExpToken.DataType);
            SubType:=GetBinaryResultSubType(TokenOperator,
                                            LeftExpToken.DataType,
                                            LeftExpToken.SubType,
                                            RightExpToken.DataType,
                                            RightExpToken.SubType);
            { Here we check the data type and operator and if we're
              concatenating strings then we need to add the two
              string sizes together }
            if (TokenOperator=eoADD) and
               (LeftExpToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) and
               (RightExpToken.DataType in [TYPE_ZSTRING,TYPE_BLOB]) then
               begin
               DataSize:=((LeftExpToken.DataSize-1)+
                          (RightExpToken.DataSize-1)+1);
               DataDecimals:=0;
               end
            else
               begin
               case DataType of
                  TYPE_ZSTRING:
                     begin
                     DataSize:=MaximumWord(LeftExpToken.DataSize,
                                           RightExpToken.DataSize);
                     DataDecimals:=0;
                     end;
                  TYPE_BOOL:
                     begin
                     DataSize:=TYPE_BOOL_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_INT16:
                     begin
                     DataSize:=TYPE_INT16_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_UINT16:
                     begin
                     DataSize:=TYPE_UINT16_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_INT32:
                     begin
                     DataSize:=TYPE_INT32_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_INT64:
                     begin
                     DataSize:=TYPE_INT64_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_FLOAT:
                     begin
                     DataSize:=TYPE_FLOAT_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_BCD:
                     begin
                     DataSize:=TYPE_BCD_SIZE;
                     DataDecimals:=MaximumByte(LeftExpToken.DataDecimals,
                                               RightExpToken.DataDecimals);
                     end;
                  TYPE_DATE:
                     begin
                     DataSize:=TYPE_DATE_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_TIME:
                     begin
                     DataSize:=TYPE_TIME_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_TIMESTAMP:
                     begin
                     DataSize:=TYPE_TIMESTAMP_SIZE;
                     DataDecimals:=0;
                     end;
                  TYPE_BLOB:
                     begin
                     DataSize:=TYPE_BLOB_SIZE;
                     DataDecimals:=0;
                     end;
                  end;
               end;
            end;
         etEXTBINARY:
            begin
            case TokenOperator of
               eoLIKE,eoNOTLIKE:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  if (ArgumentExpToken[2] <> nil) then
                     VerifyNextToken(ArgumentExpToken[2],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  if (ArgumentExpToken[2] <> nil) then
                     CheckStringTypes(ArgumentExpToken[2],AllowUnknownTypes);
                  DataType:=TYPE_BOOL;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_BOOL_SIZE;
                  DataDecimals:=0;
                  end;
               eoBETWEEN,eoNOTBETWEEN,eoIN,eoNOTIN:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  for I:=1 to ArgumentExpTokens.Count-1 do
                     begin
                     VerifyNextToken(ArgumentExpToken[I],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                     VerifyDateTimeLiteral(ArgumentExpToken[0],ArgumentExpToken[I]);
                     VerifyDateTimeLiteral(ArgumentExpToken[I],ArgumentExpToken[0]);
                     CheckBinaryTypes(eoEQ,ArgumentExpToken[0],ArgumentExpToken[I],
                                      AllowUnknownTypes);
                     end;
                  DataType:=TYPE_BOOL;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_BOOL_SIZE;
                  DataDecimals:=0;
                  end;
               eoSUBIN,eoNOTSUBIN:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyDateTimeLiteral(ArgumentExpToken[0],ArgumentExpToken[1]);
                  VerifyDateTimeLiteral(ArgumentExpToken[1],ArgumentExpToken[0]);
                  CheckBinaryTypes(eoEQ,ArgumentExpToken[0],ArgumentExpToken[1],
                                   AllowUnknownTypes);
                  DataType:=TYPE_BOOL;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_BOOL_SIZE;
                  DataDecimals:=0;
                  end;
               end;
            end;
         etFUNC:
            begin
            case TokenOperator of
               eoSUM,eoRUNSUM,eoMIN,eoMAX,eoAVG,eoSTDDEV,eoCOUNT:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  { Don't worry about unknown data types here (parameters) since
                    these functions can't be used in places where parameters can be
                    used }
                  case TokenOperator of
                     eoCOUNT:
                        begin
                        { COUNT() operator can be used with any type so there's no
                          need for type checking }
                        DataType:=TYPE_INT32;
                        SubType:=SUBTYPE_UNKNOWN;
                        DataSize:=TYPE_INT32_SIZE;
                        DataDecimals:=0;
                        end;
                     eoSUM,eoRUNSUM:
                        begin
                        CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                        case ArgumentExpToken[0].DataType of
                           TYPE_INT16,TYPE_UINT16:
                              begin
                              DataType:=TYPE_INT32;
                              SubType:=SUBTYPE_UNKNOWN;
                              DataSize:=TYPE_INT32_SIZE;
                              DataDecimals:=0;
                              end;
                           TYPE_INT32:
                              begin
                              DataType:=TYPE_INT64;
                              SubType:=SUBTYPE_UNKNOWN;
                              DataSize:=TYPE_INT64_SIZE;
                              DataDecimals:=0;
                              end;
                           else
                              begin
                              if (ArgumentExpToken[0].DataType=TYPE_UNKNOWN) then
                                 begin
                                 DataType:=TYPE_FLOAT;
                                 SubType:=SUBTYPE_UNKNOWN;
                                 DataSize:=TYPE_FLOAT_SIZE;
                                 DataDecimals:=0;
                                 end
                              else
                                 begin
                                 DataType:=ArgumentExpToken[0].DataType;
                                 SubType:=ArgumentExpToken[0].SubType;
                                 DataSize:=ArgumentExpToken[0].DataSize;
                                 DataDecimals:=ArgumentExpToken[0].DataDecimals;
                                 end;
                              end;
                           end;
                        end;
                     eoAVG:
                        begin
                        CheckNumericDateTimeTypes(ArgumentExpToken[0],
                                                  AllowUnknownTypes);
                        case ArgumentExpToken[0].DataType of
                           TYPE_INT16,TYPE_UINT16:
                              begin
                              DataType:=TYPE_INT32;
                              SubType:=SUBTYPE_UNKNOWN;
                              DataSize:=TYPE_INT32_SIZE;
                              DataDecimals:=0;
                              end;
                           TYPE_INT32:
                              begin
                              DataType:=TYPE_INT64;
                              SubType:=SUBTYPE_UNKNOWN;
                              DataSize:=TYPE_INT64_SIZE;
                              DataDecimals:=0;
                              end;
                           else
                              begin
                              if (ArgumentExpToken[0].DataType=TYPE_UNKNOWN) then
                                 begin
                                 DataType:=TYPE_FLOAT;
                                 SubType:=SUBTYPE_UNKNOWN;
                                 DataSize:=TYPE_FLOAT_SIZE;
                                 DataDecimals:=0;
                                 end
                              else
                                 begin
                                 DataType:=ArgumentExpToken[0].DataType;
                                 SubType:=ArgumentExpToken[0].SubType;
                                 DataSize:=ArgumentExpToken[0].DataSize;
                                 DataDecimals:=ArgumentExpToken[0].DataDecimals;
                                 end;
                              end;
                           end;
                        end;
                     eoSTDDEV:
                        begin
                        CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                        DataType:=TYPE_FLOAT;
                        SubType:=SUBTYPE_UNKNOWN;
                        DataSize:=TYPE_FLOAT_SIZE;
                        DataDecimals:=0;
                        end;
                     eoMIN,eoMAX:
                        begin
                        CheckStringNumericDateTimeTypes(ArgumentExpToken[0],
                                                        AllowUnknownTypes);
                        if (ArgumentExpToken[0].DataType=TYPE_UNKNOWN) then
                           begin
                           DataType:=TYPE_FLOAT;
                           SubType:=SUBTYPE_UNKNOWN;
                           DataSize:=TYPE_FLOAT_SIZE;
                           DataDecimals:=0;
                           end
                        else
                           begin
                           DataType:=ArgumentExpToken[0].DataType;
                           SubType:=ArgumentExpToken[0].SubType;
                           if (SubType=SUBTYPE_AUTOINC) then
                              SubType:=SUBTYPE_UNKNOWN;
                           DataSize:=ArgumentExpToken[0].DataSize;
                           DataDecimals:=ArgumentExpToken[0].DataDecimals;
                           end;
                        end;
                     end;
                  end;
               eoUPPER,eoLOWER:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  if (ArgumentExpToken[0].DataType=TYPE_BLOB) then
                     begin
                     DataType:=TYPE_BLOB;
                     SubType:=SUBTYPE_MEMO;
                     end
                  else
                     begin
                     DataType:=ArgumentExpToken[0].DataType;
                     SubType:=ArgumentExpToken[0].SubType;
                     end;
                  DataSize:=ArgumentExpToken[0].DataSize;
                  DataDecimals:=0;
                  end;
               eoRIGHT,eoLEFT:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckIntegerTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  if (ArgumentExpToken[0].DataType=TYPE_BLOB) then
                     begin
                     DataType:=TYPE_BLOB;
                     SubType:=SUBTYPE_MEMO;
                     end
                  else
                     begin
                     DataType:=ArgumentExpToken[0].DataType;
                     SubType:=ArgumentExpToken[0].SubType;
                     end;
                  DataSize:=ArgumentExpToken[0].DataSize;
                  DataDecimals:=0;
                  end;
               eoREPEAT:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckIntegerTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  if (ArgumentExpToken[0].DataType=TYPE_BLOB) then
                     begin
                     DataType:=TYPE_BLOB;
                     SubType:=SUBTYPE_MEMO;
                     end
                  else
                     begin
                     DataType:=ArgumentExpToken[0].DataType;
                     SubType:=ArgumentExpToken[0].SubType;
                     end;
                  if (ArgumentExpToken[1].TokenType=etCONST) then
                     DataSize:=(((ArgumentExpToken[0].DataSize-1)*
                                  ConvertToInteger(ArgumentExpToken[1].DataType,
                                                   ArgumentExpToken[1].Value))+1)
                  else
                     DataSize:=ArgumentExpToken[0].DataSize;
                  DataDecimals:=0;
                  end;
               eoCONCAT:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=GetBinaryResultDataType(eoADD,
                                                    ArgumentExpToken[0].DataType,
                                                    ArgumentExpToken[1].DataType);
                  SubType:=GetBinaryResultSubType(eoADD,
                                                  ArgumentExpToken[0].DataType,
                                                  ArgumentExpToken[0].SubType,
                                                  ArgumentExpToken[1].DataType,
                                                  ArgumentExpToken[1].SubType);
                  DataSize:=((ArgumentExpToken[0].DataSize-1)+
                             (ArgumentExpToken[1].DataSize-1)+1);
                  DataDecimals:=0;
                  end;
               eoLENGTH:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  DataType:=TYPE_INT32;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoSUBSTRING:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  if (ArgumentExpToken[2] <> nil) then
                     VerifyNextToken(ArgumentExpToken[2],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckIntegerTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  if (ArgumentExpToken[2] <> nil) then
                     CheckIntegerTypes(ArgumentExpToken[2],AllowUnknownTypes);
                  if (ArgumentExpToken[0].DataType=TYPE_BLOB) then
                     begin
                     DataType:=TYPE_BLOB;
                     SubType:=SUBTYPE_MEMO;
                     end
                  else
                     begin
                     DataType:=ArgumentExpToken[0].DataType;
                     SubType:=ArgumentExpToken[0].SubType;
                     end;
                  DataSize:=ArgumentExpToken[0].DataSize;
                  DataDecimals:=0;
                  end;
               eoTRIMLEADING,eoTRIMTRAILING,eoTRIMBOTH:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  if (ArgumentExpToken[1].DataType=TYPE_BLOB) then
                     begin
                     DataType:=TYPE_BLOB;
                     SubType:=SUBTYPE_MEMO;
                     end
                  else
                     begin
                     DataType:=ArgumentExpToken[1].DataType;
                     SubType:=ArgumentExpToken[1].SubType;
                     end;
                  DataSize:=ArgumentExpToken[1].DataSize;
                  DataDecimals:=0;
                  end;
               eoEXTRACTYEAR,eoEXTRACTMONTH,eoEXTRACTWEEK,eoEXTRACTDAY,eoEXTRACTDAYOFWEEK,
               eoEXTRACTDAYOFYEAR,eoEXTRACTHOUR,eoEXTRACTMINUTE,eoEXTRACTSECOND,eoEXTRACTMSECOND:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  if (ArgumentExpToken[0].DataType=TYPE_ZSTRING) then
                     begin
                     if (not ConvertStringToDateTime(ArgumentExpToken[0].Value,
                                                     TYPE_DATE)) then
                        begin
                        if (not ConvertStringToDateTime(ArgumentExpToken[0].Value,
                                                        TYPE_TIME)) then
                           begin
                           if (not ConvertStringToDateTime(ArgumentExpToken[0].Value,
                                                           TYPE_TIMESTAMP)) then
                              ExpectedTypesError(ArgumentExpToken[0],
                                                 [TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],
                                                 [SUBTYPE_UNKNOWN])
                           else
                              begin
                              with ArgumentExpToken[0] do
                                 begin
                                 DataType:=TYPE_TIMESTAMP;
                                 DataSize:=TYPE_TIMESTAMP_SIZE;
                                 DataDecimals:=0;
                                 end;
                              end;
                           end
                        else
                           begin
                           with ArgumentExpToken[0] do
                              begin
                              DataType:=TYPE_TIME;
                              DataSize:=TYPE_TIME_SIZE;
                              DataDecimals:=0;
                              end;
                           end;
                        end
                     else
                        begin
                        with ArgumentExpToken[0] do
                           begin
                           DataType:=TYPE_DATE;
                           DataSize:=TYPE_DATE_SIZE;
                           DataDecimals:=0;
                           end;
                        end;
                     end;
                  CheckDateTimeTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  DataType:=TYPE_INT32;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoMSECSYEARS,eoMSECSDAYS,eoMSECSHOURS,eoMSECSMINS,eoMSECSSECS,eoMSECSMSECS:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  DataType:=TYPE_INT32;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoPOS:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=TYPE_INT32;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoOCCURS:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=TYPE_INT32;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoREPLACE:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[2],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[2],AllowUnknownTypes);
                  if (ArgumentExpToken[2].DataType=TYPE_BLOB) then
                     begin
                     DataType:=TYPE_BLOB;
                     SubType:=SUBTYPE_MEMO;
                     end
                  else
                     begin
                     DataType:=ArgumentExpToken[2].DataType;
                     SubType:=ArgumentExpToken[2].SubType;
                     end;
                  DataSize:=ArgumentExpToken[2].DataSize;
                  DataDecimals:=0;
                  end;
               eoCAST:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  if (not ((ArgumentExpToken[0].TokenType=etCONST) and
                            ArgumentExpToken[0].IsNull)) then
                     CheckCastTypes(ArgumentExpToken[0],NextToken,AllowUnknownTypes);
                  VerifyDataTypeToken(NextToken);
                  TransformBooleanExpression(NextToken,TransformBooleans);
                  end;
               eoABS:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  DataType:=ArgumentExpToken[0].DataType;
                  SubType:=ArgumentExpToken[0].SubType;
                  DataSize:=ArgumentExpToken[0].DataSize;
                  DataDecimals:=ArgumentExpToken[0].DataDecimals;
                  end;
               eoROUND:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  if (ArgumentExpToken[1] <> nil) then
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  if (ArgumentExpToken[1] <> nil) then
                     CheckIntegerTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=ArgumentExpToken[0].DataType;
                  SubType:=ArgumentExpToken[0].SubType;
                  DataSize:=ArgumentExpToken[0].DataSize;
                  DataDecimals:=ArgumentExpToken[0].DataDecimals;
                  end;
               eoMOD:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckIntegerTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckIntegerTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=GetBinaryResultDataType(TokenOperator,
                                                    ArgumentExpToken[0].DataType,
                                                    ArgumentExpToken[1].DataType);
                  SubType:=GetBinaryResultSubType(TokenOperator,
                                                  ArgumentExpToken[0].DataType,
                                                  ArgumentExpToken[0].SubType,
                                                  ArgumentExpToken[1].DataType,
                                                  ArgumentExpToken[1].SubType);
                  case DataType of
                     TYPE_INT16:
                        begin
                        DataSize:=TYPE_INT16_SIZE;
                        DataDecimals:=0;
                        end;
                     TYPE_UINT16:
                        begin
                        DataSize:=TYPE_UINT16_SIZE;
                        DataDecimals:=0;
                        end;
                     TYPE_INT32:
                        begin
                        DataSize:=TYPE_INT32_SIZE;
                        DataDecimals:=0;
                        end;
                     TYPE_INT64:
                        begin
                        DataSize:=TYPE_INT64_SIZE;
                        DataDecimals:=0;
                        end;
                     end;
                  end;
               eoACOS,eoASIN,eoATAN,eoCOS,eoCOT,eoDEGREES,eoEXP,
               eoLOG,eoLOG10,eoRADIANS,eoSIN,eoSQRT,eoTAN:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  DataType:=TYPE_FLOAT;
                  SubType:=0;
                  DataSize:=TYPE_FLOAT_SIZE;
                  DataDecimals:=0;
                  end;
               eoATAN2:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=TYPE_FLOAT;
                  SubType:=0;
                  DataSize:=TYPE_FLOAT_SIZE;
                  DataDecimals:=0;
                  end;
               eoCEILING,eoFLOOR:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  DataType:=TYPE_INT64;
                  SubType:=0;
                  DataSize:=TYPE_INT64_SIZE;
                  DataDecimals:=0;
                  end;
               eoPI:
                  begin
                  DataType:=TYPE_FLOAT;
                  SubType:=0;
                  DataSize:=TYPE_FLOAT_SIZE;
                  DataDecimals:=0;
                  end;
               eoPOWER:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=TYPE_FLOAT;
                  SubType:=0;
                  DataSize:=TYPE_FLOAT_SIZE;
                  DataDecimals:=0;
                  end;
               eoRAND:
                  begin
                  if (ArgumentExpToken[0] <> nil) then
                     begin
                     VerifyNextToken(ArgumentExpToken[0],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                     CheckIntegerTypes(ArgumentExpToken[0],AllowUnknownTypes);
                     end;
                  DataType:=TYPE_FLOAT;
                  SubType:=0;
                  DataSize:=TYPE_FLOAT_SIZE;
                  DataDecimals:=0;
                  end;
               eoSIGN:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  DataType:=TYPE_INT32;
                  SubType:=0;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoTRUNCATE:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  if (ArgumentExpToken[1] <> nil) then
                     VerifyNextToken(ArgumentExpToken[1],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                  CheckNumericTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  if (ArgumentExpToken[1] <> nil) then
                     CheckIntegerTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  DataType:=ArgumentExpToken[0].DataType;
                  SubType:=ArgumentExpToken[0].SubType;
                  DataSize:=ArgumentExpToken[0].DataSize;
                  DataDecimals:=ArgumentExpToken[0].DataDecimals;
                  end;
               eoIF:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[2],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckBooleanTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  VerifyMultipleExpressions('IF',1,NextToken,
                                            TransformBooleans,AllowUnknownTypes);
                  end;
               eoIFNULL:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[2],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyMultipleExpressions('IFNULL',1,NextToken,
                                            TransformBooleans,AllowUnknownTypes);
                  end;
               eoNULLIF:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyMultipleExpressions('NULLIF',0,NextToken,
                                            TransformBooleans,AllowUnknownTypes);
                  { Create result expression token }
                  ArgumentExpToken[2]:=TExpToken.Create;
                  with ArgumentExpToken[2] do
                     begin
                     DataType:=TYPE_BOOL;
                     DataSize:=TYPE_BOOL_SIZE;
                     end;
                  end;
               eoCASE:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  DataType:=ArgumentExpToken[1].DataType;
                  SubType:=ArgumentExpToken[1].SubType;
                  DataSize:=ArgumentExpToken[1].DataSize;
                  DataDecimals:=ArgumentExpToken[1].DataDecimals;
                  end;
               eoCASEOPTION:
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     begin
                     VerifyNextToken(ArgumentExpToken[I],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                     CheckBooleanTypes(ArgumentExpToken[I],AllowUnknownTypes);
                     end;
                  end;
               eoCASERESULT:
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     VerifyNextToken(ArgumentExpToken[I],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                  { Version 5 }
                  VerifyMultipleExpressions('CASE..THEN',0,NextToken,
                                            TransformBooleans,AllowUnknownTypes);
                  { Version 5 }
                  end;
               eoCOALESCE:
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     VerifyNextToken(ArgumentExpToken[I],NextToken,
                                     TransformBooleans,AllowUnknownTypes);
                  VerifyMultipleExpressions('COALESCE',0,NextToken,
                                            TransformBooleans,AllowUnknownTypes);
                  end;
               eoTEXTSEARCH:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  CheckFieldTokenType(ArgumentExpToken[1]);
                  DataType:=TYPE_BOOL;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_BOOL_SIZE;
                  DataDecimals:=0;
                  TransformBooleanExpression(NextToken,TransformBooleans);
                  end;
               eoTEXTOCCURS:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  VerifyNextToken(ArgumentExpToken[1],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[1],AllowUnknownTypes);
                  CheckFieldTokenType(ArgumentExpToken[1]);
                  DataType:=TYPE_INT32;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoLASTAUTOINC,eoIDENTCURRENT:
                  begin
                  VerifyNextToken(ArgumentExpToken[0],NextToken,
                                  TransformBooleans,AllowUnknownTypes);
                  CheckStringTypes(ArgumentExpToken[0],AllowUnknownTypes);
                  CheckConstantTokenType(ArgumentExpToken[0]);
                  { Version 5 }
                  if (DataSource=nil) then
                  { Version 5 }
                     begin
                     { Create a source table for retrieving the value, if not already
                       done }
                     if (TObject(FFieldClientData) is TDataQuery) then
                        begin
                        with TDataQuery(FFieldClientData) do
                           begin
                           DataSource:=TSourceTable.Create(TDataQuery(FFieldClientData));
                           ExtraTables.Add(DataSource);
                           TSourceTable(DataSource).TableName:=StrPas(ArgumentExpToken[0].Value);
                           end;
                        end;
                     end;
                  DataType:=TYPE_INT32;
                  SubType:=SUBTYPE_UNKNOWN;
                  DataSize:=TYPE_INT32_SIZE;
                  DataDecimals:=0;
                  end;
               eoCUSTOMFUNC:
                  begin
                  TempFunctionDefinition:=DataEngine.GetFunctionDefinitionByName(TokenLiteral);
                  if (TempFunctionDefinition <> nil) then
                     begin
                     TempToken:=TExpToken.Create;
                     try
                        with TempFunctionDefinition^ do
                           begin
                           for I:=1 to ParamCount do
                              begin
                              VerifyNextToken(ArgumentExpToken[I-1],NextToken,
                                              TransformBooleans,AllowUnknownTypes);
                              with TempToken do
                                 begin
                                 DataType:=ParamDefinitions[I].DataType;
                                 SubType:=ParamDefinitions[I].SubType;
                                 Line:=NextToken.ArgumentExpToken[I-1].Line;
                                 Column:=NextToken.ArgumentExpToken[I-1].Column;
                                 end;
                              CheckArgumentTypes(TempToken,ArgumentExpToken[I-1],
                                                 AllowUnknownTypes);
                              end;
                           end;
                        { Version 5 }
                        TransformBooleanExpression(NextToken,TransformBooleans);
                        { Version 5 }
                     finally
                        TempToken.Free;
                     end;
                     end;
                  end;
               end;
            end;
         etFIELD:
            begin
            if (FieldName <> PARSE_ALLFIELDS) then
               begin
               if Assigned(FFieldCallback) then
                  begin
                  if (not FFieldCallback(FFieldClientData,NextToken)) then
                     ExpectedTokenTypesError(NextToken,[etFIELD]);
                  TransformBooleanExpression(NextToken,TransformBooleans);
                  end;
               end;
            end;
         etCONST:
            TransformBooleanExpression(NextToken,TransformBooleans);
         end;
      end;
end;

procedure TExpressionVerifier.VerifyMultipleExpressions(const ErrorLiteral: string;
                                                        ArgumentOffset: Integer;
                                                        NextToken: TExpToken;
                                                        TransformBooleans: Boolean;
                                                        AllowUnknownTypes: Boolean);
var
   I: Integer;
   ResultToken: TExpToken;
begin
   with NextToken do
      begin
      { Handle special case of NULLs }
      ResultToken:=nil;
      for I:=ArgumentOffset to ArgumentExpTokens.Count-1 do
         begin
         if (not ArgumentExpToken[I].IsNull) then
            begin
            ResultToken:=ArgumentExpToken[I];
            Break;
            end;
         end;
      if (ResultToken=nil) then
         GeneralError(ArgumentExpToken[ArgumentOffset],
                      'At least one of the '+ErrorLiteral+' expression '+
                      'arguments must be a non-NULL value');
      I:=ArgumentOffset;
      while (I < ArgumentExpTokens.Count-1) do
         begin
         VerifyDateTimeLiteral(ArgumentExpToken[I],ArgumentExpToken[I+1]);
         VerifyDateTimeLiteral(ArgumentExpToken[I+1],ArgumentExpToken[I]);
         CheckArgumentTypes(ArgumentExpToken[I],ArgumentExpToken[I+1],True);
         Inc(I);
         end;
      DataType:=ArgumentExpToken[ArgumentOffset].DataType;
      SubType:=ArgumentExpToken[ArgumentOffset].SubType;
      DataSize:=ArgumentExpToken[ArgumentOffset].DataSize;
      DataDecimals:=ArgumentExpToken[ArgumentOffset].DataDecimals;
      { Handle type promotion here }
      for I:=ArgumentOffset to ArgumentExpTokens.Count-1 do
         begin
         if (ArgumentExpToken[I].DataSize > DataSize) or
            (ArgumentExpToken[I].DataDecimals > DataDecimals) then
            begin
            DataType:=ArgumentExpToken[I].DataType;
            SubType:=ArgumentExpToken[I].SubType;
            DataSize:=ArgumentExpToken[I].DataSize;
            DataDecimals:=ArgumentExpToken[I].DataDecimals;
            end;
         end;
      TransformBooleanExpression(NextToken,TransformBooleans);
      end;
end;

procedure TExpressionVerifier.TransformBooleanExpression(NextToken: TExpToken;
                                                         TransformBooleans: Boolean);
var
   TempToken: TExpToken;
begin
   { Handle the special case where there is just a field
     or function and no binary operator }
   if TransformBooleans and
      (NextToken.DataType in [TYPE_BOOL,TYPE_INT32,TYPE_INT64,TYPE_INT16,TYPE_UINT16]) and
      ((NextToken.UpperExpToken=nil) or
       (NextToken.UpperExpToken.TokenOperator in [eoAND,eoOR,eoNOT])) then
      begin
      TempToken:=TExpToken.Create;
      TempToken.Copy(NextToken);
      { Add the eoEQ node first }
      with NextToken do
         begin
         TokenLiteral:=PARSE_EQUAL;
         TokenType:=etBINARY;
         TokenOperator:=eoEQ;
         DataType:=TYPE_BOOL;
         DataSize:=TYPE_BOOL_SIZE;
         LeftExpToken:=TempToken;
         ArgumentExpTokens.Clear;
         end;
      { Then add the constant node }
      TempToken:=TExpToken.Create;
      with TempToken do
         begin
         TokenLiteral:=PARSE_TRUE;
         TokenType:=etCONST;
         DataType:=TYPE_BOOL;
         DataSize:=TYPE_BOOL_SIZE;
         pWordBool(Value)^:=VerifyWordBool(True);
         end;
      NextToken.RightExpToken:=TempToken;
      end;
end;

procedure TExpressionVerifier.VerifyDataTypeToken(ExpToken: TExpToken);
begin
   with ExpToken do
      begin
      { Now update the data size and decimals }
      case DataType of
         TYPE_FLOAT:
            DataSize:=TYPE_FLOAT_SIZE;
         TYPE_BCD:
            begin
            DataSize:=TYPE_BCD_SIZE;
            if (ArgumentExpToken[1] <> nil) and (ArgumentExpToken[2] <> nil) then
               begin
               CheckIntegerTypes(ArgumentExpToken[2],False);
               DataDecimals:=ConvertToInteger(ArgumentExpToken[2].DataType,
                                              ArgumentExpToken[2].Value);
               end;
            if (DataDecimals > 4) then
               GeneralError(ArgumentExpToken[2],
                            'Scale argument must be an integer less than or '+
                            'equal to 4 but greater than or equal to 0');
            end;
         TYPE_ZSTRING:
            begin
            if (SubType <> SUBTYPE_GUID) then
               begin
               if (ArgumentExpToken[1] <> nil) then
                  begin
                  CheckIntegerTypes(ArgumentExpToken[1],False);
                  DataSize:=(ConvertToInteger(ArgumentExpToken[1].DataType,
                                              ArgumentExpToken[1].Value)+1);
                  if (SubType=SUBTYPE_UNICODE) then
                     begin
                     if (((DataSize-1)*2) <= 0) or (((DataSize-1)*2) > MAX_FIELD_SIZE) then
                        GeneralError(ExpToken,'Length argument must be greater than 0 and '+
                                     'less than or equal to '+IntToStr(MAX_FIELD_SIZE));
                     end
                  else
                     begin
                     if ((DataSize-1) <= 0) or ((DataSize-1) > MAX_FIELD_SIZE) then
                        GeneralError(ExpToken,'Length argument must be greater than 0 and '+
                                     'less than or equal to '+IntToStr(MAX_FIELD_SIZE));
                     end;
                  end
               else
                  begin
                  if (ArgumentExpToken[0] <> nil) then
                     DataSize:=ArgumentExpToken[0].DataSize
                  else
                     DataSize:=10;
                  end;
               end
            else
               DataSize:=TYPE_GUID_SIZE;                  
            end;
         TYPE_BYTES,TYPE_VARBYTES:
            begin
            if (ArgumentExpToken[1] <> nil) then
               begin
               CheckIntegerTypes(ArgumentExpToken[1],False);
               DataSize:=ConvertToInteger(ArgumentExpToken[1].DataType,
                                          ArgumentExpToken[1].Value);
               end
            else
               begin
               if (ArgumentExpToken[0] <> nil) then
                  DataSize:=ArgumentExpToken[0].DataSize
               else
                  DataSize:=10;
               end;
            if (DataSize <= 0) or (DataSize > MAX_FIELD_SIZE) then
               GeneralError(ExpToken,'Length argument must be greater than 0 and '+
                            'less than or equal to '+IntToStr(MAX_FIELD_SIZE));
            end;
         TYPE_BLOB:
            begin
            { The ArgumentExpToken[0] will only be populated for CAST functions,
              so make sure to check for nil }
            if (ArgumentExpToken[0] <> nil) then
               DataSize:=ArgumentExpToken[0].DataSize;
            end;
         TYPE_BOOL:
            DataSize:=TYPE_BOOL_SIZE;
         TYPE_INT16:
            DataSize:=TYPE_INT16_SIZE;
         TYPE_UINT16:
            DataSize:=TYPE_UINT16_SIZE;
         TYPE_INT32:
            DataSize:=TYPE_INT32_SIZE;
         TYPE_INT64:
            DataSize:=TYPE_INT64_SIZE;
         TYPE_DATE:
            DataSize:=TYPE_DATE_SIZE;
         TYPE_TIME:
            DataSize:=TYPE_TIME_SIZE;
         TYPE_TIMESTAMP:
            DataSize:=TYPE_TIMESTAMP_SIZE;
         end;
      end;
end;

procedure TExpressionVerifier.VerifyDateTimeLiteral(LeftToken: TExpToken;
                                                    RightToken: TExpToken);
begin
   if (LeftToken.DataType in [TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP]) and
      ((RightToken.TokenType=etCONST) and (RightToken.DataType=TYPE_ZSTRING)) then
      begin
      if not ConvertStringToDateTime(RightToken.Value,
                                     LeftToken.DataType) then
         ExpectedTypesError(RightToken,[TYPE_DATE,TYPE_TIME,TYPE_TIMESTAMP],[SUBTYPE_UNKNOWN]);
      RightToken.DataType:=LeftToken.DataType;
      RightToken.DataSize:=LeftToken.DataSize;
      RightToken.DataDecimals:=LeftToken.DataDecimals;
      end;
end;

function IsCaseInsensitiveToken(Token: TExpToken): Boolean;
begin
   with Token do
      Result:=(TokenType=etFUNC) and
               ((TokenOperator=eoUPPER) or (TokenOperator=eoLOWER));
end;

function IsCaseInsensitiveField(Token: TExpToken): Boolean;
begin
   with Token do
      Result:=(TokenType=etFUNC) and
               ((TokenOperator=eoUPPER) or (TokenOperator=eoLOWER)) and
              (ArgumentExpTokens.Count=1) and
              (ArgumentExpToken[0].TokenType=etFIELD);
end;

function IsTextSearchFunc(Token: TExpToken): Boolean;
begin
   with Token do
      Result:=(TokenType=etFUNC) and
               (TokenOperator=eoTEXTSEARCH);
end;

procedure DeAllocMem(var Buffer);
begin
   if (Pointer(Buffer) <> nil) then
      begin
      FreeMem(Pointer(Buffer));
      Pointer(Buffer):=nil;
      end;
end;

{ ANSI Type Conversion Routines }

procedure ConvertErrorFmt(const Msg: string; const Args: array of const);
begin
   raise EConvertError.CreateFmt(Msg,Args);
end;

function AnsiDateToStr(Value: TDateTime): string;
var
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
begin
   DecodeDate(Value,TempYear,TempMonth,TempDay);
   Result:=PadLeft(IntToStr(TempYear),4,'0')+ANSI_DATE_SEPARATOR+
           PadLeft(IntToStr(TempMonth),2,'0')+ANSI_DATE_SEPARATOR+
           PadLeft(IntToStr(TempDay),2,'0');
end;

function AnsiTimeToStr(Value: TDateTime; MilitaryTime: Boolean): string;
var
   TempHour: Word;
   TempMin: Word;
   TempSec: Word;
   TempMSec: Word;
   IsPM: Boolean;
begin
   DecodeTime(Value,TempHour,TempMin,TempSec,TempMSec);
   IsPM:=False;
   if (not MilitaryTime) then
      begin
      IsPM:=(TempHour >= 12);
      if IsPM then
         TempHour:=(TempHour-12);
      if (TempHour=0) then
         TempHour:=12;
      end;
   Result:=PadLeft(IntToStr(TempHour),2,'0')+ANSI_TIME_SEPARATOR+
           PadLeft(IntToStr(TempMin),2,'0');
   if (TempSec <> 0) then
      begin
      Result:=Result+ANSI_TIME_SEPARATOR+PadLeft(IntToStr(TempSec),2,'0');
      if (TempMSec <> 0) then
         Result:=Result+ANSI_DECIMAL_SEPARATOR+IntToStr(TempMSec);
      end;
   if (not MilitaryTime) then
      begin
      if IsPM then
         Result:=Result+' '+ANSI_12HOUR_PM
      else
         Result:=Result+' '+ANSI_12HOUR_AM;
      end;
end;

function AnsiDateTimeToStr(Value: TDateTime; MilitaryTime: Boolean): string;
begin
   Result:=AnsiDateToStr(Value)+' '+
           AnsiTimeToStr(Value,MilitaryTime);
end;

function StrToAnsiDate(const Value: string): TDateTime;
var
   SeparatorPos: Integer;
   TempString: string;
   TempYear: Word;
   TempMonth: Word;
   TempDay: Word;
begin
   Result:=0;
   try
      TempString:=Value;
      SeparatorPos:=At(ANSI_DATE_SEPARATOR,TempString);
      if (SeparatorPos <> 0) then
         begin
         TempYear:=StrToInt(Substr(TempString,1,(SeparatorPos-1)));
         TempString:=Substr(TempString,SeparatorPos+1,Length(TempString));
         SeparatorPos:=At(ANSI_DATE_SEPARATOR,TempString);
         if (SeparatorPos <> 0) then
            begin
            TempMonth:=StrToInt(Substr(TempString,1,(SeparatorPos-1)));
            TempString:=Substr(TempString,SeparatorPos+1,Length(TempString));
            TempDay:=StrToInt(TempString);
            Result:=EncodeDate(TempYear,TempMonth,TempDay);
            end
         else
            ConvertErrorFmt('''%s'' is not a valid date',[Value])
         end
      else
         ConvertErrorFmt('''%s'' is not a valid date',[Value])
   except
      ConvertErrorFmt('''%s'' is not a valid date',[Value])
   end;
end;

function StrToAnsiTime(const Value: string): TDateTime;
var
   SeparatorPos: Integer;
   HourBias: Byte;
   AMPMPos: Integer;
   TempString: string;
   TempHour: Word;
   TempMin: Word;
   TempSec: Word;
   TempMSec: Word;
   MilitaryTime: Boolean;
begin
   Result:=0;
   try
      TempString:=Value;
      HourBias:=0;
      MilitaryTime:=True;
      AMPMPos:=At(ANSI_12HOUR_AM,UpperCase(TempString));
      if (AMPMPos <> 0) then
         begin
         TempString:=Substr(TempString,1,AMPMPos-1)+
                     Substr(TempString,AMPMPos+2,Length(TempString));
         MilitaryTime:=False;
         end
      else
         begin
         AMPMPos:=At(ANSI_12HOUR_PM,UpperCase(TempString));
         if (AMPMPos <> 0) then
            begin
            TempString:=Substr(TempString,1,AMPMPos-1)+
                        Substr(TempString,AMPMPos+2,Length(TempString));
            HourBias:=12;
            MilitaryTime:=False;
            end;
         end;
      TempString:=Trim(TempString);
      SeparatorPos:=At(ANSI_TIME_SEPARATOR,TempString);
      if (SeparatorPos <> 0) then
         begin
         TempHour:=StrToInt(Substr(TempString,1,(SeparatorPos-1)));
         TempString:=Substr(TempString,SeparatorPos+1,Length(TempString));
         SeparatorPos:=At(ANSI_TIME_SEPARATOR,TempString);
         if (SeparatorPos <> 0) then
            begin
            TempMin:=StrToInt(Substr(TempString,1,(SeparatorPos-1)));
            TempString:=Substr(TempString,SeparatorPos+1,Length(TempString));
            SeparatorPos:=At(ANSI_DECIMAL_SEPARATOR,TempString);
            if (SeparatorPos <> 0) then
               begin
               TempSec:=StrToInt(Substr(TempString,1,(SeparatorPos-1)));
               TempString:=Substr(TempString,SeparatorPos+1,Length(TempString));
               TempMSec:=StrToInt(TempString);
               end
            else
               begin
               TempSec:=StrToInt(TempString);
               TempMSec:=0;
               end;
            end
         else
            begin
            TempMin:=StrToInt(TempString);
            TempSec:=0;
            TempMSec:=0;
            end;
         if (not MilitaryTime) then
            begin
            if (TempHour=12) then
               begin
               if (HourBias=0) then
                  TempHour:=0;
               end
            else
               begin
               if (HourBias <> 0) then
                  Inc(TempHour,HourBias);
               end;
            end;
         Result:=EncodeTime(TempHour,TempMin,TempSec,TempMSec);
         end
      else
         ConvertErrorFmt('''%s'' is not a valid time',[Value]);
   except
      ConvertErrorFmt('''%s'' is not a valid time',[Value])
   end;
end;

function StrToAnsiDateTime(const Value: string): TDateTime;
var
   SeparatorPos: Integer;
begin
   Result:=0;
   try
      SeparatorPos:=At(' ',Value);
      if (SeparatorPos=0) then
         begin
         SeparatorPos:=At(':',Value);
         if (SeparatorPos=0) then
            Result:=StrToAnsiDate(Value)
         else
            Result:=StrToAnsiTime(Value);
         end
      else
         Result:=StrToAnsiDate(Substr(Value,1,(SeparatorPos-1)))+
                 StrToAnsiTime(Substr(Value,(SeparatorPos+1),Length(Value)));
   except
      ConvertErrorFmt('''%s'' is not a valid date and time',[Value])
   end;
end;

function AnsiBooleanToStr(Value: Boolean): string;
begin
   Result:='False';
   if Value then
      Result:='True';
end;

function StrToAnsiBoolean(const Value: string): Boolean;
begin
   Result:=False;
   if (AnsiCompareText(Value,'TRUE')=0) then
      Result:=True
   else if (AnsiCompareText(Value,'FALSE')=0) then
      Result:=False
   else
      ConvertErrorFmt('''%s'' is not a valid boolean',[Value])
end;

function AnsiFloatToStr(Value: Extended): string;
begin
   Result:=FloatToStr(Value);
   Result:=StringReplace(Result,DecimalSeparator,ANSI_DECIMAL_SEPARATOR,[rfReplaceAll]);
end;

function StrToAnsiFloat(const Value: string): Extended;
var
   TempString: string;
begin
   TempString:=StringReplace(Value,ANSI_DECIMAL_SEPARATOR,DecimalSeparator,[rfReplaceAll]);
   Result:=StrToFloat(TempString);
end;

function AnsiCurrToStr(Value: Currency): string;
begin
   Result:=CurrToStr(Value);
   Result:=StringReplace(Result,DecimalSeparator,ANSI_DECIMAL_SEPARATOR,[rfReplaceAll]);
end;

function StrToAnsiCurr(const Value: string): Currency;
var
   TempString: string;
begin
   TempString:=StringReplace(Value,ANSI_DECIMAL_SEPARATOR,DecimalSeparator,[rfReplaceAll]);
   Result:=StrToCurr(TempString);
end;

{ TLocaleStringList }

function TLocaleStringList.GetLocaleID: Integer;
begin
   Result:=FLocaleID;
end;

procedure TLocaleStringList.SetLocaleID(Value: Integer);
begin
   FLocaleID:=Value;
end;

procedure TLocaleStringList.Sort;
begin
  CustomSort(CompareLanguageStrings);
end;

function TLocaleStringList.Find(const S: AnsiString; var Index: Integer): Boolean;
var
   L: Integer;
   H: Integer;
   I: Integer;
   C: Integer;
begin
   Result := False;
   L := 0;
   H := Count - 1;
   while L <= H do
      begin
      I := (L + H) shr 1;
      C := OSCompareStrings(FLocaleID,PChar(Strings[I]),PChar(S),0,True);
      if C < 0 then L := I + 1 else
         begin
         H := I - 1;
         if C = 0 then
            begin
            Result := True;
            if Duplicates <> dupAccept then L := I;
            end;
         end;
      end;
   Index := L;
end;

function TLocaleStringList.FindUsingPartials(const S: AnsiString; var Index: Integer): Boolean;
var
   L: Integer;
   H: Integer;
   I: Integer;
   C: Integer;
   TempPartialLength: Word;
begin
   Result := False;
   L := 0;
   H := Count - 1;
   while L <= H do
      begin
      I := (L + H) shr 1;
      if ((StrEnd(PChar(Strings[I]))-1)^=PARSE_ASTERISK) then
         begin
         TempPartialLength:=(StrLen(PChar(Strings[I]))-1);
         C := OSCompareStrings(FLocaleID,PChar(Strings[I]),PChar(S),TempPartialLength,True);
         end
      else
         C := OSCompareStrings(FLocaleID,PChar(Strings[I]),PChar(S),0,True);
      if C < 0 then L := I + 1 else
         begin
         H := I - 1;
         if C = 0 then
            begin
            Result := True;
            if Duplicates <> dupAccept then L := I;
            end;
         end;
      end;
   Index := L;
end;

function TLocaleStringList.FindPartial(const S: AnsiString; var Index: Integer;
                                         PartialLength: Word): Boolean;
var
   L: Integer;
   H: Integer;
   I: Integer;
   C: Integer;
begin
   Result := False;
   L := Index;
   H := Count - 1;
   while L <= H do
      begin
      I := (L + H) shr 1;
      C := OSCompareStrings(FLocaleID,PChar(Strings[I]),PChar(S),PartialLength,True);
      if C < 0 then L := I + 1 else
         begin
         H := I - 1;
         if C = 0 then
            begin
            Result := True;
            if Duplicates <> dupAccept then L := I;
            end;
         end;
      end;
   Index := L;
end;

end.
