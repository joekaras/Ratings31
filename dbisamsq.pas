{*************************************************************************
*
*      TQueryStatement and helper objects source
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

{$I dbisamcp.inc}

unit dbisamsq;

interface

uses SysUtils,Classes,

{$I dbisamvr.inc}

Windows,

dbisamcn, dbisamen, dbisamlb, dbisamst;

type

   TQueryStatement = class;
   TDataQuery = class;
   TSourceTable = class;
   TJoinExpression = class;
   TResultField = class;
   TOrderByField = class;
   TGroupByField = class;
   TUpdateField = class;
   TUpdateValue = class;
   TCreateField = class;
   TCreateIndex = class;
   TCreateIndexField = class;

   TSourceAliasStringList = class(TStringList)
      private
         { Nothing }
      public
         procedure Sort; override;
         function Find(const S: AnsiString; var Index: Integer): Boolean; override;
      end;

   TResultField = class(TObject)
      private
         FDataQuery: TDataQuery;
         FSourceTable: TSourceTable;
         FFieldName: string;
         FFieldNum: Word;
         FAliasName: string;
         FDataType: Byte;
         FSubType: Byte;
         FDataSize: Word;
         FDataDecimals: Byte;
         FResultName: string;
         FAutoResultName: Boolean;
         FResultNum: Word;
         FResultDataType: Byte;
         FResultSubType: Byte;
         FResultDataSize: Word;
         FResultDataDecimals: Byte;
         FIsExpression: Boolean;
         FCalculationType: TResultCalculation;
         FCountNum: Word;
         FSumNum: Word;
         FCountAll: Boolean;
         FIsHidden: Boolean;
         FIsAggregateExpression: Boolean;
         FExpressionLiteral: string;
         FExpressionTokens: TExpToken;
         FResultExpressionLiteral: string;
         FResultExpressionTokens: TExpToken;
         procedure SetFieldName(const Value: string);
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property SourceTable: TSourceTable read FSourceTable
                                                  write FSourceTable;
         property FieldName: string read FFieldName write SetFieldName;
         property FieldNum: Word read FFieldNum write FFieldNum;
         property AliasName: string read FAliasName write FAliasName;
         property DataType: Byte read FDataType write FDataType;
         property SubType: Byte read FSubType write FSubType;
         property DataSize: Word read FDataSize write FDataSize;
         property DataDecimals: Byte read FDataDecimals write FDataDecimals;
         property ResultName: string read FResultName write FResultName;
         property AutoResultName: Boolean read FAutoResultName write FAutoResultName;
         property ResultNum: Word read FResultNum write FResultNum;
         property ResultDataType: Byte read FResultDataType write FResultDataType;
         property ResultSubType: Byte read FResultSubType write FResultSubType;
         property ResultDataSize: Word read FResultDataSize write FResultDataSize;
         property ResultDataDecimals: Byte read FResultDataDecimals write FResultDataDecimals;
         property CalculationType: TResultCalculation read FCalculationType
                                                      write FCalculationType;
         property CountNum: Word read FCountNum write FCountNum;
         property SumNum: Word read FSumNum write FSumNum;
         property CountAll: Boolean read FCountAll write FCountAll;
         property IsHidden: Boolean read FIsHidden write FIsHidden;
         property IsAggregateExpression: Boolean read FIsAggregateExpression
                                               write FIsAggregateExpression;
         property IsExpression: Boolean read FIsExpression
                                        write FIsExpression;
         property ExpressionLiteral: string read FExpressionLiteral
                                            write FExpressionLiteral;
         property ExpressionTokens: TExpToken read FExpressionTokens
                                                 write FExpressionTokens;
         property ResultExpressionLiteral: string read FResultExpressionLiteral
                                                  write FResultExpressionLiteral;
         property ResultExpressionTokens: TExpToken read FResultExpressionTokens
                                                    write FResultExpressionTokens;
      end;

   TOrderByField = class(TObject)
      private
         FDataQuery: TDataQuery;
         FFieldName: string;
         FAliasName: string;
         FFieldNum: Word;
         FDescending: Boolean;
         FExpressionLiteral: string;
         FExpressionTokens: TExpToken;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property FieldName: string read FFieldName write FFieldName;
         property AliasName: string read FAliasName write FAliasName;
         property FieldNum: Word read FFieldNum write FFieldNum;
         property Descending: Boolean read FDescending write FDescending;
         property ExpressionLiteral: string read FExpressionLiteral
                                            write FExpressionLiteral;
         property ExpressionTokens: TExpToken read FExpressionTokens
                                                 write FExpressionTokens;
      end;

   TGroupByField = class(TObject)
      private
         FDataQuery: TDataQuery;
         FFieldName: string;
         FAliasName: string;
         FFieldNum: Word;
         FExpressionLiteral: string;
         FExpressionTokens: TExpToken;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property FieldName: string read FFieldName write FFieldName;
         property AliasName: string read FAliasName write FAliasName;
         property FieldNum: Word read FFieldNum write FFieldNum;
         property ExpressionLiteral: string read FExpressionLiteral
                                            write FExpressionLiteral;
         property ExpressionTokens: TExpToken read FExpressionTokens
                                                 write FExpressionTokens;
      end;

   TUpdateField = class(TObject)
      private
         FDataQuery: TDataQuery;
         FSourceTable: TSourceTable;
         FFieldName: string;
         FFieldNum: Word;
         FAliasName: string;
         FDataType: Byte;
         FSubType: Byte;
         FDataSize: Word;
         FDataDecimals: Byte;
         FExpressionLiteral: string;
         FExpressionTokens: TExpToken;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property SourceTable: TSourceTable read FSourceTable
                                                  write FSourceTable;
         property FieldName: string read FFieldName write FFieldName;
         property FieldNum: Word read FFieldNum write FFieldNum;
         property AliasName: string read FAliasName write FAliasName;
         property DataType: Byte read FDataType write FDataType;
         property SubType: Byte read FSubType write FSubType;
         property DataSize: Word read FDataSize write FDataSize;
         property DataDecimals: Byte read FDataDecimals write FDataDecimals;
         property ExpressionLiteral: string read FExpressionLiteral
                                            write FExpressionLiteral;
         property ExpressionTokens: TExpToken read FExpressionTokens
                                                 write FExpressionTokens;
      end;

   TUpdateValue = class(TObject)
      private
         FDataQuery: TDataQuery;
         FExpressionLiteral: string;
         FExpressionTokens: TExpToken;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property ExpressionLiteral: string read FExpressionLiteral
                                            write FExpressionLiteral;
         property ExpressionTokens: TExpToken read FExpressionTokens
                                                 write FExpressionTokens;
      end;

   TCreateField = class(TObject)
      private
         FDataQuery: TDataQuery;
         FFieldName: string;
         FNewFieldName: string;
         FFieldNum: Word;
         FDataType: Byte;
         FSubType: Byte;
         FLength: Word;
         FDecimals: Byte;
         FDescription: string;
         FDescriptionSet: Boolean;
         FRequired: Boolean;
         FRequiredSet: Boolean;
         FCharCase: Byte;
         FCharCaseSet: Boolean;
         FCompression: Byte;
         FCompressionSet: Boolean;
         FMinimumValue: string;
         FMinimumValueSet: Boolean;
         FMaximumValue: string;
         FMaximumValueSet: Boolean;
         FDefaultValue: string;
         FDefaultValueSet: Boolean;
         FAddField: Boolean;
         FRedefineField: Boolean;
         FDropField: Boolean;
         FAtPos: Word;
         FExpressionLiteral: string;
         FExpressionTokens: TExpToken;
         FNewExpressionLiteral: string;
         FNewExpressionTokens: TExpToken;
         FOnlyIfExists: Boolean;
         FOnlyIfNotExists: Boolean;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property FieldName: string read FFieldName write FFieldName;
         property NewFieldName: string read FNewFieldName write FNewFieldName;
         property FieldNum: Word read FFieldNum write FFieldNum;
         property DataType: Byte read FDataType write FDataType;
         property SubType: Byte read FSubType write FSubType;
         property Length: Word read FLength write FLength;
         property Decimals: Byte read FDecimals write FDecimals;
         property Description: string read FDescription write FDescription;
         property DescriptionSet: Boolean read FDescriptionSet write FDescriptionSet;
         property Required: Boolean read FRequired write FRequired;
         property RequiredSet: Boolean read FRequiredSet write FRequiredSet;
         property CharCase: Byte read FCharCase write FCharCase;
         property CharCaseSet: Boolean read FCharCaseSet write FCharCaseSet;
         property Compression: Byte read FCompression write FCompression;
         property CompressionSet: Boolean read FCompressionSet write FCompressionSet;
         property MinimumValue: string read FMinimumValue write FMinimumValue;
         property MinimumValueSet: Boolean read FMinimumValueSet write FMinimumValueSet;
         property MaximumValue: string read FMaximumValue write FMaximumValue;
         property MaximumValueSet: Boolean read FMaximumValueSet write FMaximumValueSet;
         property DefaultValue: string read FDefaultValue write FDefaultValue;
         property DefaultValueSet: Boolean read FDefaultValueSet write FDefaultValueSet;
         property AddField: Boolean read FAddField write FAddField;
         property RedefineField: Boolean read FRedefineField write FRedefineField;
         property DropField: Boolean read FDropField write FDropField;
         property OnlyIfExists: Boolean read FOnlyIfExists write FOnlyIfExists;
         property OnlyIfNotExists: Boolean read FOnlyIfNotExists write FOnlyIfNotExists;
         property AtPos: Word read FAtPos write FAtPos;
         property ExpressionLiteral: string read FExpressionLiteral
                                            write FExpressionLiteral;
         property ExpressionTokens: TExpToken read FExpressionTokens
                                                 write FExpressionTokens;
         property NewExpressionLiteral: string read FNewExpressionLiteral
                                               write FNewExpressionLiteral;
         property NewExpressionTokens: TExpToken read FNewExpressionTokens
                                                 write FNewExpressionTokens;
      end;

   TCreateIndex = class(TObject)
      private
         FDataQuery: TDataQuery;
         FIndexName: string;
         FFieldsList: TList;
         FUnique: Boolean;
         FCaseInsensitive: Boolean;
         FCompressionLevel: Byte;
         FAddIndex: Boolean;
         FRedefineIndex: Boolean;
         FDropIndex: Boolean;
         FTextIndex: Boolean;
         FLine: Integer;
         FColumn: Integer;
         procedure FreeIndexFields;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property IndexName: string read FIndexName write FIndexName;
         property FieldsList: TList read FFieldsList write FFieldsList;
         property Unique: Boolean read FUnique write FUnique;
         property CaseInsensitive: Boolean read FCaseInsensitive
                                           write FCaseInsensitive;
         property CompressionLevel: Byte read FCompressionLevel
                                         write FCompressionLevel;
         property AddIndex: Boolean read FAddIndex write FAddIndex;
         property RedefineIndex: Boolean read FRedefineIndex write FRedefineIndex;
         property DropIndex: Boolean read FDropIndex write FDropIndex;
         property TextIndex: Boolean read FTextIndex write FTextIndex;
         property Line: Integer read FLine write FLine;
         property Column: Integer read FColumn write FColumn;
      end;

   TCreateIndexField = class(TObject)
      private
         FDataQuery: TDataQuery;
         FFieldName: string;
         FDescending: Boolean;
         FExpressionLiteral: string;
         FExpressionTokens: TExpToken;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property FieldName: string read FFieldName write FFieldName;
         property Descending: Boolean read FDescending write FDescending;
         property ExpressionLiteral: string read FExpressionLiteral
                                            write FExpressionLiteral;
         property ExpressionTokens: TExpToken read FExpressionTokens
                                              write FExpressionTokens;
      end;

   TJoin = class(TObject)
      private
         FSourceTable: TSourceTable;
         FJoinType: TJoinType;
         FTargetTable: TSourceTable;
         FJoinTokens: TExpToken;
         FJoinFilterHandle: Pointer;
         FJoinOptimizeLevel: TOptimizeLevel;
         FScanTokensGenerated: Boolean;
         function GetJoinTokens: TExpToken;
         procedure FreeJoinFilterHandle;
         procedure FlipNextJoinToken(NextToken: TExpToken);
         function ReduceNextJoinToken(NextToken: TExpToken;
                                      UpperToken: TExpToken;
                                      NoWhereReduce: Boolean): Boolean;
         function DependsUponNextJoinToken(NextToken: TExpToken;
                                           ParentTable: TSourceTable): Boolean;
         procedure GenerateJoinScanTokensPlan;
      public
         constructor Create(Owner: TSourceTable;
                            JoinType: TJoinType;
                            NextJoinToken: TExpToken;
                            TargetTable: TSourceTable); virtual;
         destructor Destroy; override;
         property JoinType: TJoinType read FJoinType write FJoinType;
         property TargetTable: TSourceTable read FTargetTable
                                                  write FTargetTable;
         property JoinTokens: TExpToken read GetJoinTokens;
         property JoinOptimizeLevel: TOptimizeLevel read FJoinOptimizeLevel
                                                    write FJoinOptimizeLevel;
         property ScanTokensGenerated: Boolean read FScanTokensGenerated
                                               write FScanTokensGenerated;
         procedure BuildJoinFilter;
         function BuildNextJoinFilter(NextToken: TExpToken;
                                      ClientData: Integer;
                                      FieldCallback: pEvaluateFieldCallback;
                                      LocaleID: Integer): TExpToken;
         procedure AddJoinTokens(JoinType: TJoinType;
                                 NextJoinToken: TExpToken);
         procedure FlipJoinTokens;
         function InitializeJoin: Boolean;
         procedure ReduceJoinExpression;
         function DependsUpon(ParentTable: TSourceTable): Boolean;
      end;

   TSourceTable = class(TObject)
      private
         FDataQuery: TDataQuery;
         FDataDirectory: TDataDirectory;
         FDataCursor: TDataCursor;
         FJoinOrder: Word;
         FOutputOrder: Word;
         FDirectoryName: string;
         FTableName: string;
         FAliasName: string;
         FExclusive: Boolean;
         FRecordSize: Word;
         FCurRecordBuffer: PChar;
         FJoins: TList;
         FBeginOfTable: Boolean;
         FEndOfTable: Boolean;
         FJoinScanTokens: TExpToken;
         FLine: Integer;
         FColumn: Integer;
         procedure FreeJoins;
         procedure FreeCurRecordBuffer;
         procedure SetTableName(const Value: string);
         procedure SetAliasName(const Value: string);
         function EvaluateJoinScanExpression: Boolean;
         procedure ReadNextRecords;
         procedure ReadPriorRecords;
      public
         constructor Create(Owner: TDataQuery); virtual;
         destructor Destroy; override;
         property JoinOrder: Word read FJoinOrder write FJoinOrder;
         property OutputOrder: Word read FOutputOrder write FOutputOrder;
         property DirectoryName: string read FDirectoryName;
         property TableName: string read FTableName write SetTableName;
         property AliasName: string read FAliasName write SetAliasName;
         property Exclusive: Boolean read FExclusive write FExclusive;
         property DataDirectory: TDataDirectory read FDataDirectory;
         property DataQuery: TDataQuery read FDataQuery;
         property DataCursor: TDataCursor read FDataCursor;
         property Joins: TList read FJoins;
         property JoinScanTokens: TExpToken read FJoinScanTokens;
         property BeginOfTable: Boolean read FBeginOfTable write FBeginOfTable;
         property EndOfTable: Boolean read FEndOfTable write FEndOfTable;
         property CurRecordBuffer: PChar read FCurRecordBuffer;
         property Line: Integer read FLine write FLine;
         property Column: Integer read FColumn write FColumn;
         procedure Open(ClientData: Integer; WantLive: Boolean);
         function FindField(const SourceFieldName: string): Word;
         function FindFirstFieldName(var FieldNumber: Word): string;
         procedure InitializeCurRecordBuffer;
         procedure AddJoin(NewJoinType: TJoinType;
                           NextJoinToken: TExpToken;
                           NewTargetTable: TSourceTable);
         procedure BumpJoinOrders;
         procedure ReduceJoins;
         procedure VerifyJoins(AllowUnknownTypes: Boolean);
         function GetJoinPosition(ExistingJoin: TJoin): Integer;
         procedure FirstRecord;
         procedure LastRecord;
         procedure NextRecord;
         procedure PriorRecord;
         procedure RefreshRecord;
         function FirstRecordRead(JoinType: TJoinType): Boolean;
         function LastRecordRead(JoinType: TJoinType): Boolean;
         function NextRecordRead: Boolean;
         function PriorRecordRead: Boolean;
         function RefreshRecordRead: Boolean;
         function PriorJoinRead(JoinPos: Integer): Boolean;
         function IsJoinedTo(NewJoinType: TJoinType;
                             NewTargetTable: TSourceTable): Boolean;
         function GetJoin(NewJoinType: TJoinType;
                          NewTargetTable: TSourceTable): TJoin;
         procedure AddJoinScanTokens(NextJoinToken: TExpToken);
      end;

   TJoinExpression = class(TObject)
      private
         FDataQuery: TDataQuery;
         FJoinType: TJoinType;
         FTargetTable: TSourceTable;
         FJoinTokens: TExpToken;
      public
         constructor Create(Owner: TDataQuery;
                            JoinType: TJoinType;
                            NextJoinToken: TExpToken;
                            TargetTable: TSourceTable); virtual;
         destructor Destroy; override;
         property JoinType: TJoinType read FJoinType write FJoinType;
         property TargetTable: TSourceTable read FTargetTable
                                            write FTargetTable;
         property JoinTokens: TExpToken read FJoinTokens;
      end;

   TDataQuery = class(TObject)
      private
         FQueryStatement: TQueryStatement;
         FParentQuery: TDataQuery;
         FSubQueries: TList;
         FMergeQueries: TList;
         FIsOpen: Boolean;
         FQueryType: Byte;
         FNoCaseIndex: Boolean;
         FUniqueIndex: Boolean;
         FUsingParentheses: Boolean;
         FExecutionTime: double;
         FWantLiveResult: Boolean;
         FRowsAffected: Integer;
         FMaxNumOfRows: Integer;
         FDistinctResult: Boolean;
         FHasAggregateCalcs: Boolean;
         FHasAvgs: Boolean;
         FHasStdDevs: Boolean;
         FHasRunSums: Boolean;
         FHasExpressions: Boolean;
         FHasBlobExpressions: Boolean;
         FHasScanExpressions: Boolean;
         FHasTempScanExpressions: Boolean;
         FJoinedResult: Boolean;
         FNoJoinOptimizations: Boolean;
         FJoinOptimizeCosts: Boolean;
         FHasWhereExpression: Boolean;
         FHasHavingExpression: Boolean;
         FOrderedResult: Boolean;
         FAutoOrderedResult: Boolean;
         FOrderByExistingIndex: Boolean;
         FOrderByIndexPos: Byte;
         FOrderByContainsExpressions: Boolean;
         FOrderByFields: TList;
         FOrderByCaseInsensitive: Boolean;
         FGroupedResult: Boolean;
         FGroupByFields: TList;
         FSingleRowResult: Boolean;
         FSimpleFunctionResult: Boolean;
         FSimpleFunctionIndexPos: Byte;
         FHavingResult: Boolean;
         FLiveResult: Boolean;
         FInPlaceResult: Boolean;
         FSubSelectType: TSubSelectType;
         FMergeType: TMergeType;
         FResultTableName: string;
         FNewResultTableName: string;
         FResultExclusive: Boolean;
         FResultIndexName: string;
         FResultFile: string;
         FDelimiter: Char;
         FHeaders: Boolean;
         FFields: TStrings;
         FDateFormat: string;
         FTimeFormat: string;
         FDecSeparator: Char;
         FForceIndexRebuild: Boolean;
         FResultDataDirectory: TDataDirectory;
         FResultTable: TDataCursor;
         FHasBlobFields: Boolean;
         FSourceTables: TList;
         FExtraTables: TList;
         FLastSmallestTable: TList;
         FJoinExpressions: TList;
         FResultFields: TList;
         FHiddenResultFields: TList;
         FUpdateFields: TList;
         FUpdateValues: TList;
         FCreateFields: TList;
         FCreateIndexes: TList;
         FCreateTextIndex: TCreateIndex;
         FWhereCostSet: Boolean;
         FTotalWhereCost: Int64;
         FWhereExpressionTokens: TExpToken;
         FHavingExpressionTokens: TExpToken;
         FScanExpressionTokens: TExpToken;
         FTempScanExpressionTokens: TExpToken;
         FSubSelectFilterHandle: Pointer;
         FEncrypted: Boolean;
         FEncryptionPassword: string;
         FLocaleID: Integer;
         FIndexPageSize: Integer;
         FBlobBlockSize: Integer;
         FDescription: string;
         FUserMajorVersion: Word;
         FUserMinorVersion: Word;
         FLastAutoInc: Integer;
         FNoBackups: Boolean;
         FCommitInterval: Integer;
         FCommitFlush: Boolean;
         FEncryptedSet: Boolean;
         FLocaleIDSet: Boolean;
         FIndexPageSizeSet: Boolean;
         FBlobBlockSizeSet: Boolean;
         FDescriptionSet: Boolean;
         FUserMajorVersionSet: Boolean;
         FUserMinorVersionSet: Boolean;
         FCommitIntervalSet: Boolean;
         FTopRows: Integer;
         FRangeStart: Integer;
         FRangeEnd: Integer;
         FOnlyIfExists: Boolean;
         FOnlyIfNotExists: Boolean;
         FStopWords: TStrings;
         FStopWordsSet: Boolean;
         FSpaceChars: TCharSet;
         { Version 5}
         FSpaceCharsSet: Boolean;
         { Version 5}
         FIncludeChars: TCharSet;
         { Version 5}
         FIncludeCharsSet: Boolean;
         { Version 5}
         FSelectAllColumns: Boolean;
         FTransactionTables: TStrings;
         FFieldCount: Word;
         FFieldDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
         FIndexCount: Byte;
         FIndexDefinitions: array [0..MAX_NUM_INDEXES] of pIndexDefinition;
         FStatementText: AnsiString;
         { Version 5}
         FIdentityOnly: Boolean;
         FStructureAltered: Boolean;
         FContainsNonCalcFields: Boolean;
         FContainsCalcFields: Boolean;
         { Version 5}
         procedure FreeSubQueries;
         procedure FreeMergeQueries;
         procedure FreeResultTable;
         procedure FreeResultFields;
         procedure FreeUpdateFields;
         procedure FreeUpdateValues;
         procedure FreeCreateFields;
         procedure FreeCreateIndexes;
         procedure FreeFieldDefinitions;
         procedure FreeIndexDefinitions;
         procedure FreeSourceTables;
         procedure FreeExtraTables;
         procedure FreeJoinExpressions;
         procedure FreeOrderByFields;
         procedure FreeGroupByFields;
         function InternalStatementTypeToString(StatementType: Byte): string;
         procedure ParseTerm;
         procedure ParseInto;
         procedure ParseJoinLeftParens(var NumJoinParens: Word);
         procedure ParseJoins(var NextTableOrder: Word; var NumJoinParens: Word);
         procedure ParseMerge;
         procedure ParseSelectQuery;
         procedure ParseWhere;
         procedure ParseGroupBy;
         procedure ParseHaving;
         procedure ParseOrderBy;
         procedure ParseTop;
         procedure ParseLocale;
         procedure ParseEncrypted;
         procedure ParseNoJoinOptimize;
         procedure ParseJoinOptimizeCosts;
         procedure ParseSelectExtensions;
         procedure ParseCommitInterval;
         procedure ParseInsertExtensions;
         procedure ParseUpdateExtensions;
         procedure ParseDeleteExtensions;
         procedure ParseInsertQuery;
         procedure ParseUpdateQuery;
         procedure ParseDeleteQuery;
         procedure ParseTextIndex;
         procedure ParseDescription;
         procedure ParseIndexPageSize;
         procedure ParseBlobBlockSize;
         procedure ParseUserVersion;
         procedure ParseLastAutoInc;
         procedure ParseNoBackup;
         procedure ParseIndexAttributes(CreateIndex: TCreateIndex);
         procedure ParseIndexFields(CreateIndex: TCreateIndex);
         procedure ParseIndexCompression(CreateIndex: TCreateIndex);
         procedure ParseDelimiter;
         procedure ParseHeaders;
         procedure ParseFields;
         procedure ParseFormats;
         procedure ParseIfExists;
         procedure ParseIfNotExists;
         function ParseTableName: string;
         procedure ParseCreateTableExtensions;
         procedure ParseCreateTableQuery;
         function ParseValidityCheck(FieldExpressionType: TFieldExpressionType): string;
         procedure ParseCreateIndexQuery;
         procedure ParseAlterTableExtensions;
         procedure ParseAlterTableQuery;
         procedure ParseEmptyTableQuery;
         procedure ParseOptimizeTableQuery;
         procedure ParseExportTableQuery;
         procedure ParseImportTableQuery;
         procedure ParseVerifyTableQuery;
         procedure ParseRepairTableQuery;
         procedure ParseUpgradeTableQuery;
         procedure ParseDropTableQuery;
         procedure ParseRenameTableQuery;
         procedure ParseDropIndexQuery;
         procedure ParseStartTransaction;
         procedure ParseRollbackTransaction;
         procedure ParseCommitTransaction;
         procedure CreateAggregateResultFields(NextToken: TExpToken);
         procedure SetupAggregateResultField(ResultField: TResultField;
                                             const ExpressionStr: AnsiString);
         procedure ParseSelectColumnExpression(ResultField: TResultField);
         procedure ParseUpdateColumnExpression(UpdateField: TUpdateField);
         procedure ParseUpdateValueExpression(UpdateValue: TUpdateValue;
                                              ParseOptions: TParseOptions);
         procedure ParseCreateColumnExpression(CreateField: TCreateField;
                                               NeedDataType: Boolean);
         procedure ParseCreateColumnAttributes(CreateField: TCreateField);
         procedure ParseCreateIndexFieldExpression(CreateIndexField: TCreateIndexField;
                                                   ParseSort: Boolean);
         procedure ParseGroupByFieldExpression(GroupByField: TGroupByField);
         procedure ParseOrderByFieldExpression(OrderByField: TOrderByField);
         function ParseCreateStopWordsExpression: string;
         function ParseCreateCharSetExpression: string;
         function ParseDelimiterExpression: Char;
         function ParseDecSeparatorExpression: Char;
         function ParseJoinExpression: TExpToken;
         function ParseWhereExpression(AllowSubSelects: Boolean): TExpToken;
         procedure ParseHavingExpression;
         procedure CheckForDuplicateSourceTable(const SourceAliasName: string;
                                                IgnoreTable: TSourceTable);
         function FindResultField(AllowCalculations: Boolean;
                                  const ResultFieldToFind: string;
                                  const SourceAlias: string;
                                  var ResultFieldNum: Word): TResultField;
         function FindResultAggregateFieldForExpression(NextToken: TExpToken): TResultField;
         procedure OpenSourceTables;
         procedure OpenExtraTables;
         procedure RefreshSourceTables;
         procedure RefreshExtraTables;
         function FindSourceTableForField(const FieldAlias: string;
                                          const FieldName: string;
                                          AllowBlankFieldName: Boolean;
                                          var FieldNum: Word): TSourceTable;
         function FindSourceTable(const SourceAlias: string): TSourceTable;
         procedure AddAllResultFields(FromTable: TSourceTable;
                                      var NextResultFieldNum: Word;
                                      OriginalLine: Integer;
                                      OriginalColumn: Integer);
         procedure AddAllUpdateFields(FromTable: TSourceTable;
                                      OriginalLine: Integer;
                                      OriginalColumn: Integer);
         procedure SetupLiveMapping;
         function GetUniqueResultName(const SourceFieldName: string;
                                       const ResultFieldName: string;
                                       CalculationType: TResultCalculation;
                                      ResultFieldToIgnore: TResultField): string;
         function AppendUniqueFieldID(const FieldName: string;
                                      const Value: string): string;
         procedure ProcessCalculation(CalcType: TResultCalculation;
                                      DataType: Byte;
                                      DataDecimals: Byte;
                                      SourceFieldBuffer: PChar;
                                      SourceIsBlank: Boolean;
                                      ResultFieldBuffer: PChar;
                                      ResultIsBlank: Boolean);
         procedure SetupDefaultJoins;
         procedure ReduceDefaultJoins;
         procedure SetupJoinExpressions;
         function GetJoinExpressionSourceTable(NextJoinToken: TExpToken;
                                               TargetTable: TSourceTable): TSourceTable;
         function CheckFieldsJoinOrder(NextToken: TExpToken;
                                       HighestJoinOrder: Integer): Boolean;
         procedure FlipRightOuterJoins;
         function CanOptimizeJoins: Boolean;
         function OptimizeJoins: TSourceTable;
         procedure UnOptimizeJoins(OldSmallestTable: TSourceTable);
         function CheckJoinOrders: Boolean;
         procedure FlipJoins(JoinType: TJoinType; ChildTable: TSourceTable);
         procedure FlipJoin(ParentTable: TSourceTable;
                            ChildTable: TSourceTable;
                            AlignNextTo: Boolean);
         function CalculateJoinOptimizeLevels: TOptimizeLevel;
         procedure VerifyAggregateResultFields(NextToken: TExpToken);
         procedure VerifyResultFields;
         procedure VerifyOrderByFields;
         procedure VerifyGroupByFields;
         procedure VerifyDistinctFields;
         procedure AssignResultTableParams;
         procedure CreateResultTable;
         procedure InitializeSourceRecordBuffers;
         function SameSourceTable(Value: TSourceTable): Boolean;
         function CanReturnLiveResult: Boolean;
         function CanReturnSingleRowResult: Boolean;
         function CanReturnSimpleFunctionResult: Boolean;
         procedure CheckForLiveOrderBy;
         procedure VerifyUpdateFields(AllowAllFields: Boolean);
         procedure VerifyUpdateValues(AllowUnknownTypes: Boolean);
         procedure ProcessSubSelectUpdateValues;
         function VerifyExpressionFieldData(FieldToken: TExpToken): Boolean;
         function VerifyWhereExpressionFieldData(FieldToken: TExpToken): Boolean;
         function VerifyHavingExpressionFieldData(FieldToken: TExpToken): Boolean;
         { Version 5 }
         function VerifyHavingExpressionResultFieldData(FieldToken: TExpToken): Boolean;
         { Version 5 }
         function EvaluateExpressionFieldData(RecordBuffer: PChar;
                                              FieldToken: TExpToken): Boolean;
         function EvaluateResetFieldData(RecordBuffer: PChar;
                                         FieldToken: TExpToken): Boolean;
         function EvaluateResultFieldData(RecordBuffer: PChar;
                                          FieldToken: TExpToken): Boolean;
         procedure EvaluateResultFields(RecordBuffer: PChar);
         procedure EvaluateAggregateResultFields(RecordBuffer: PChar);
         procedure AddWhereExpressionTokens(NextToken: TExpToken);
         procedure ReduceWhereExpression;
         function ReduceNextWhereExpressionToken(NextToken: TExpToken;
                                                 UpperToken: TExpToken): Boolean;
         procedure ReverseJoin(NextToken: TExpToken;
                               var LeftTable: TSourceTable;
                               var RightTable: TSourceTable);
         function ValidPathExists(LeftTable: TSourceTable;
                                  RightTable: TSourceTable): Boolean;
         procedure ReduceHavingExpression;
         procedure ReduceNextHavingExpressionToken(NextToken: TExpToken;
                                                       UpperToken: TExpToken);
         procedure SortJoinOrders;
         procedure SetJoinOrders;
         procedure AddScanTokens(NextToken: TExpToken);
         procedure AddTempScanTokens(NextToken: TExpToken);
         procedure VerifyScanExpression(AllowUnknownTypes: Boolean);
         procedure VerifyWhereExpression(AllowUnknownTypes: Boolean);
         { Version 5 }
         procedure VerifyHavingExpression(ResultFields: Boolean=False);
         { Version 5 }
         procedure VerifyJoinExpression(NextJoinToken: TExpToken;
                                        AllowUnknownTypes: Boolean);
         procedure ReduceJoins;
         procedure VerifyJoins(AllowUnknownTypes: Boolean);
         function EvaluateScanExpression: Boolean;
         function EvaluateTempScanExpression: Boolean;
         procedure EvaluateWhereExpression(OptimizedOnly: Boolean);
         procedure EvaluateNextWhereExpression(OptimizedOnly: Boolean;
                                              NextToken: TExpToken);
         function EvaluateHavingExpression(RecordBuffer: PChar): Boolean;
         procedure EvaluateInsertValueExpression(NextToken: TExpToken);
         procedure EvaluateSubSelectInsertValueExpression(SubQuery: TDataQuery;
                                                          RecordBuffer: PChar;
                                                          NextToken: TExpToken);
         function BuildNextSubSelectFilter(NextToken: TExpToken;
                                           ClientData: Integer;
                                           FieldCallback: pEvaluateFieldCallback;
                                           LocaleID: Integer): TExpToken;
         procedure EvaluateUpdateValueExpression(NextToken: TExpToken);
         procedure BuildWhereFilter(OptimizedOnly: Boolean;
                                    StartToken: TExpToken;
                                    TargetTable: TSourceTable);
         function FirstRecordRead: Boolean;
         function LastRecordRead: Boolean;
         function NextRecordRead: Boolean;
         function PriorRecordRead: Boolean;
         function RefreshRecordRead: Boolean;
         procedure ResetAllSourceFilters;
         function IsTargetOfJoin(CurJoin: TJoin;
                                 NewTargetTable: TSourceTable): Boolean;
         function IsTargetOfInnerJoin(NewTargetTable: TSourceTable): Boolean;
         function IsTargetOfOuterJoin(CurJoinType: TJoinType;
                                      NewTargetTable: TSourceTable): Boolean;
         function GetParentTable(CurJoinType: TJoinType; CurTargetTable: TSourceTable): TSourceTable;
         function GetDriverTable(CurTargetTable: TSourceTable): TSourceTable;
         procedure AbortProgress(PercentDone: Word; var Abort: Boolean);
         procedure Progress(PercentDone: Word);
         procedure SteppedProgress(const Step: string; PercentDone: Word);
         procedure DataLost(Cause: Byte; const ContextInfo: string;
                            var Continue: Boolean;
                            var StopAsking: Boolean);
         procedure Log(const LogMessage: string);
         procedure Plan(const PlanMessage: AnsiString);
         function ContainsMultipleDataSources(var ResultAlias: string;
                                              NextToken: TExpToken): Boolean;
         function EvaluateAliases(const LeftAlias: string;
                                  const RightAlias: string;
                                  var ResultAlias: string): Boolean;
         function ContainsJoins(NextToken: TExpToken): Boolean;
         procedure GroupRecords(SourceRecordBuffer: PChar;
                                DestRecordBuffer: PChar);
         procedure CalculateGroupRecord(SourceRecordBuffer: PChar);
         procedure InitializeRunSum(SourceRecordBuffer: PChar;
                                    DestRecordBuffer: PChar);
         procedure RunSumRecords(SourceRecordBuffer: PChar;
                                DestRecordBuffer: PChar);
         function HavingRecord(SourceRecordBuffer: PChar): Boolean;
         procedure PopulateResultRecord(RecordBuffer: PChar);
         procedure MassageCalculatedField(CalcType: TResultCalculation;
                                          DataType: Byte; FieldBuffer: PChar);
         procedure ExecuteSingleRowSelectQuery;
         function HitMaxRows(TotalCount: Integer): Boolean;
         procedure AddTopRow(RecordBuffer: PChar; NewRecordBuffer: PChar;
                             SetRecordHash: Boolean);
         procedure PrepareSelectQuery;
         procedure PrepareInsertQuery;
         procedure PrepareUpdateQuery;
         procedure PrepareDeleteQuery;
         procedure PrepareCreateTableQuery;
         procedure PrepareCreateIndexQuery;
         procedure PrepareAlterTableQuery;
         procedure PrepareEmptyTableQuery;
         procedure PrepareOptimizeTableQuery;
         procedure PrepareExportTableQuery;
         procedure PrepareImportTableQuery;
         procedure PrepareVerifyTableQuery;
         procedure PrepareRepairTableQuery;
         procedure PrepareUpgradeTableQuery;
         procedure PrepareDropTableQuery;
         procedure PrepareRenameTableQuery;
         procedure PrepareDropIndexQuery;
         function GetJoinsPlan: AnsiString;
         procedure ProcessJoins;
         { Version 5}
         procedure ExecuteIdentityQuery;
         { Version 5}
         procedure ExecuteSelectQuery;
         procedure ExecuteGroupedSelectQuery;
         procedure ExecuteDistinctSelectQuery;
         procedure ExecuteMerge;
         procedure AddMergeIndex(MergeType: TMergeType);
         procedure RemoveMergeIndex;
         procedure ExecuteInsertQuery;
         procedure ExecuteSubSelectInsertQuery;
         procedure ExecuteUpdateQuery;
         procedure ExecuteDeleteQuery;
         procedure ExecuteCreateTableQuery;
         procedure ExecuteCreateIndexQuery;
         procedure ExecuteAlterTableQuery;
         procedure ExecuteEmptyTableQuery;
         procedure ExecuteOptimizeTableQuery;
         procedure ExecuteExportTableQuery;
         procedure ExecuteImportTableQuery;
         procedure ExecuteVerifyTableQuery;
         procedure ExecuteRepairTableQuery;
         procedure ExecuteUpgradeTableQuery;
         procedure ExecuteDropTableQuery;
         procedure ExecuteRenameTableQuery;
         procedure ExecuteDropIndexQuery;
         function GetProgressPercent: Word;
         procedure CheckResultRights(DataDirectory: TDataDirectory);
         function GetMasterSourceTable: TSourceTable;
         function GetDataSession: TDataSession;
         function GetDataDirectory: TDataDirectory;
         function GetGeneratePlan: Boolean;
         { Version 5 }
         procedure GenerateWherePlan;
         { Version 5 }
      public
         constructor Create(Owner: TQueryStatement); virtual;
         destructor Destroy; override;
         property QueryStatement: TQueryStatement read FQueryStatement;
         property DataSession: TDataSession read GetDataSession;
         property DataDirectory: TDataDirectory read GetDataDirectory;
         property ParentQuery: TDataQuery read FParentQuery;
         property QueryType: Byte read FQueryType;
         property SubQueries: TList read FSubQueries;
         property MergeQueries: TList read FMergeQueries;
         property MasterSourceTable: TSourceTable read GetMasterSourceTable;
         property SourceTables: TList read FSourceTables;
         property ExtraTables: TList read FExtraTables;
         property JoinExpressions: TList read FJoinExpressions;
         property ResultFields: TList read FResultFields;
         property HiddenResultFields: TList read FHiddenResultFields;
         property ExecutionTime: Double read FExecutionTime;
         property IsOpen: Boolean read FIsOpen;
         property SubSelectType: TSubSelectType read FSubSelectType
                                                write FSubSelectType;
         property MergeType: TMergeType read FMergeType write FMergeType;
         property GroupedResult: Boolean read FGroupedResult;
         property MaxNumOfRows: Integer read FMaxNumOfRows write FMaxNumOfRows;
         property WantLiveResult: Boolean read FWantLiveResult write FWantLiveResult;
         property IsLiveResult: Boolean read FLiveResult;
         property InPlaceResult: Boolean read FInPlaceResult;
         property RowsAffected: Integer read FRowsAffected;
         property SelectAllColumns: Boolean read FSelectAllColumns write FSelectAllColumns;
         property ResultTable: TDataCursor read FResultTable write FResultTable;
         property LocaleID: Integer read FLocaleID;
         property UsingParentheses: Boolean read FUsingParentheses
                                            write FUsingParentheses;
         property ProgressPercent: Word read GetProgressPercent;
         property TransactionTables: TStrings read FTransactionTables;
         property GeneratePlan: Boolean read GetGeneratePlan;
         property StatementText: AnsiString read FStatementText;
         procedure SaveResultToTable(const NewDataDirectoryName: string;
                                     const NewTableName: string;
                                     SendProgress: Boolean);
         procedure ParseQuery(CallingQuery: TDataQuery);
         procedure PrepareQuery;
         procedure ExecuteQuery(var ResultSet: TDataCursor);
         procedure BuildSubSelectFilter(NextToken: TExpToken);
         procedure AddSubQuery(NewSubQuery: TDataQuery);
         procedure AddMergeQuery(NewMergeQuery: TDataQuery);
         procedure ExecuteError(const ErrorMessage: string);
      end;

   TQueryStatement = class(TSafeObject)
      private
         FDataDirectory: TDataDirectory;
         FRemoteID: Integer;
         FExpressionParser: TExpressionParser;
         FExpressionVerifier: TExpressionVerifier;
         FDataQuery: TDataQuery;
         FParametersCount: Integer;
         FConstantParameters: TList;
         FAbortProgressClientData: Integer;
         FAbortProgressCallback: pAbortProgressCallback;
         FProgressClientData: Integer;
         FProgressCallback: pProgressCallback;
         FSteppedProgressClientData: Integer;
         FSteppedProgressCallback: pSteppedProgressCallback;
         FDataLostCallback: pDataLostCallback;
         FDataLostClientData: Integer;
         FLogClientData: Integer;
         FLogCallback: pLogCallback;
         FStatementType: Byte;
         FExecutionTime: Double;
         FWantLiveResult: Boolean;
         FMaxNumOfRows: Integer;
         FIsLiveResult: Boolean;
         FInplaceResult: Boolean;
         FSelectAllColumns: Boolean;
         FTableName: string;
         FRowsAffected: Integer;
         FRemoteResultDataDirectoryName: string;
         FRemoteResultDataDirectory: TDataDirectory;
         FRemoteResultTable: TDataCursor;
         FGeneratePlan: Boolean;
         FPlan: TStrings;
         procedure SetRequestCode(Value: Word);
         function GetResultCode: Word;
         procedure Send;
         procedure SendReceive;
         procedure Receive;
         procedure StartRemoteRequest;
         procedure EndRemoteRequest;
         procedure BeginPack;
         procedure Pack(const Buffer; BufferSize: Integer);
         procedure EndPack;
         function Unpack(var Buffer): Integer;
         function GetIsRemote: Boolean;
         function GetIsEncrypted: Boolean;
         function GetConnected: Boolean;
         procedure CheckForConnection;
         procedure CheckForException;
         procedure DoAbortProgress(PercentDone: Word; var Abort: Boolean);
         procedure DoProgress(PercentDone: Word);
         procedure DoSteppedProgress(const Step: string; PercentDone: Word);
         procedure DoDataLost(Cause: Byte; const ContextInfo: string;
                              var Continue: Boolean;
                              var StopAsking: Boolean);
         procedure DoLog(const LogMessage: string);
         procedure CreateRemoteResultTable;
         procedure ResetRemoteResultTable;
         procedure FreeRemoteResultTable;
         function GetResultTable: TDataCursor;
         function GetProgressPercent: Word;
         function GetRemoteEngineVersion: Currency;
         function GetDataSession: TDataSession;
         function GetProperDataDirectoryName: string;
         procedure SetMaxNumOfRows(Value: Integer);
      public
         constructor Create(Owner: TDataDirectory); reintroduce; overload;
         destructor Destroy; override;
         property ExpressionParser: TExpressionParser read FExpressionParser;
         property ExpressionVerifier: TExpressionVerifier read FExpressionVerifier;
         property ParametersCount: Integer read FParametersCount;
         property ConstantParameters: TList read FConstantParameters;
         property DataSession: TDataSession read GetDataSession;
         property DataDirectory: TDataDirectory read FDataDirectory;
         property ProperDataDirectoryName: string read GetProperDataDirectoryName;
         property DataQuery: TDataQuery read FDataQuery;
         property ResultTable: TDataCursor read GetResultTable;
         property StatementType: Byte read FStatementType;
         property ExecutionTime: Double read FExecutionTime;
         property WantLiveResult: Boolean read FWantLiveResult write FWantLiveResult;
         property MaxNumOfRows: Integer read FMaxNumOfRows write SetMaxNumOfRows;
         property IsLiveResult: Boolean read FIsLiveResult;
         property InPlaceResult: Boolean read FInPlaceResult;
         property SelectAllColumns: Boolean read FSelectAllColumns;
         property TableName: string read FTableName;
         property RowsAffected: Integer read FRowsAffected;
         property IsRemote: Boolean read GetIsRemote;
         property IsEncrypted: Boolean read GetIsEncrypted;
         property RemoteID: Integer read FRemoteID;
         property Connected: Boolean read GetConnected;
         property ProgressPercent: Word read GetProgressPercent;
         property RemoteEngineVersion: Currency read GetRemoteEngineVersion;
         property GeneratePlan: Boolean read FGeneratePlan;
         property Plan: TStrings read FPlan;
         procedure ExecuteStatement(var ResultSet: TDataCursor;
                                    ParamCount: Word;
                                    const ParamDefinitions: array of pFieldDefinition;
                                    RecordBuffer: PChar;
                                    GenPlan: Boolean;
                                    var PlanText: AnsiString;
                                    SendProgress: Boolean;
                                    SendDataLost: Boolean;
                                    SendLog: Boolean);
         procedure PrepareStatement(SQLText: PChar;
                                    SQLLineOffset: Integer;
                                    SQLColumnOffset: Integer);
         function SetStatementParameters(ParamCount: Word;
                                         const ParamDefinitions: array of pFieldDefinition;
                                         RecordBuffer: PChar): Word;
         procedure PackParameters(ParamCount: Word;
                                  const ParamDefinitions: array of pFieldDefinition;
                                  RecordBuffer: PChar);
         procedure SaveResultToTable(const NewDataDirectoryName: string;
                                     const NewTableName: string;
                                     SendProgress: Boolean);
         procedure SetAbortProgressCallback(ClientData: Integer;
                                            AbortProgressCallback: pAbortProgressCallback);
         procedure SetProgressCallback(ClientData: Integer;
                                           ProgressCallback: pProgressCallback);
         procedure SetSteppedProgressCallback(ClientData: Integer;
                                              SteppedProgressCallback: pSteppedProgressCallback);
         procedure SetDataLostCallback(ClientData: Integer;
                                       DataLostCallback: pDataLostCallback);
         procedure SetLogCallback(ClientData: Integer;
                                  LogCallback: pLogCallback);
         procedure CheckCallbacks(NewClientData: Integer);
         procedure ExecuteError(const ErrorMessage: string);
      end;

function CompareOutputOrders(Item1, Item2: Pointer): Integer;
function CompareJoinOrders(Item1, Item2: Pointer): Integer;

implementation

uses DB,

FMTBcd,

dbisamcr;

function CompareOutputOrders(Item1, Item2: Pointer): Integer;
begin
   Result:=0;
   if (TSourceTable(Item1).OutputOrder < TSourceTable(Item2).OutputOrder) then
      Result:=-1
   else if (TSourceTable(Item1).OutputOrder > TSourceTable(Item2).OutputOrder) then
      Result:=1;
end;

function CompareJoinOrders(Item1, Item2: Pointer): Integer;
begin
   Result:=0;
   if (TSourceTable(Item1).JoinOrder < TSourceTable(Item2).JoinOrder) then
      Result:=-1
   else if (TSourceTable(Item1).JoinOrder > TSourceTable(Item2).JoinOrder) then
      Result:=1;
end;

function CompareSourceAliasStrings(List: TStringList;
                                   Index1: Integer; Index2: Integer): Integer;
begin
   Result:=OSCompareFileNames(List[Index1],List[Index2]);
end;

{ TSourceAliasStringList }

procedure TSourceAliasStringList.Sort;
begin
  CustomSort(CompareSourceAliasStrings);
end;

function TSourceAliasStringList.Find(const S: AnsiString; var Index: Integer): Boolean;
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
      C := OSCompareFileNames(Strings[I],S);
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

{ TResultField }

constructor TResultField.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
   FAutoResultName:=True;
end;

destructor TResultField.Destroy;
begin
   FreeExpressionTokens(FExpressionTokens);
   FreeExpressionTokens(FResultExpressionTokens);
   inherited Destroy;
end;

procedure TResultField.SetFieldName(const Value: string);
begin
   if (Value <> FFieldName) then
      begin
      FFieldName:=Value;
      if (FResultName='') and (Value <> PARSE_ALLFIELDS) then
         FResultName:=Value;
      end;
end;

{ TUpdateField }

constructor TUpdateField.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
end;

destructor TUpdateField.Destroy;
begin
   FreeExpressionTokens(FExpressionTokens);
   inherited Destroy;
end;

{ TUpdateValue }

constructor TUpdateValue.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
end;

destructor TUpdateValue.Destroy;
begin
   FreeExpressionTokens(FExpressionTokens);
   inherited Destroy;
end;

{ TCreateField }

constructor TCreateField.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
end;

destructor TCreateField.Destroy;
begin
   FreeExpressionTokens(FExpressionTokens);
   FreeExpressionTokens(FNewExpressionTokens);
   inherited Destroy;
end;

{ TCreateIndex }

constructor TCreateIndex.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
   FFieldsList:=TList.Create;
end;

destructor TCreateIndex.Destroy;
begin
   FreeIndexFields;
   FFieldsList.Free;
   inherited Destroy;
end;

procedure TCreateIndex.FreeIndexFields;
var
   I: Integer;
begin
   for I:=FFieldsList.Count-1 downto 0 do
      begin
      TCreateIndexField(FFieldsList[I]).Free;
      FFieldsList.Delete(I);
      end;
end;

{ TCreateIndexField }

constructor TCreateIndexField.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
end;

destructor TCreateIndexField.Destroy;
begin
   FreeExpressionTokens(FExpressionTokens);
   inherited Destroy;
end;

{ TOrderByField }

constructor TOrderByField.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
end;

destructor TOrderByField.Destroy;
begin
   FreeExpressionTokens(FExpressionTokens);
   inherited Destroy;
end;

{ TGroupByField }

constructor TGroupByField.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
end;

destructor TGroupByField.Destroy;
begin
   FreeExpressionTokens(FExpressionTokens);
   inherited Destroy;
end;

{ TJoin }

constructor TJoin.Create(Owner: TSourceTable;
                         JoinType: TJoinType;
                         NextJoinToken: TExpToken;
                         TargetTable: TSourceTable);
begin
   FSourceTable:=Owner;
   FJoinType:=JoinType;
   FTargetTable:=TargetTable;
   FJoinTokens:=NextJoinToken;
   FJoinFilterHandle:=nil;
end;

destructor TJoin.Destroy;
begin
   FreeJoinFilterHandle;
   FreeExpressionTokens(FJoinTokens);
   inherited Destroy;
end;

function TJoin.GetJoinTokens: TExpToken;
begin
   Result:=FJoinTokens;
end;

procedure TJoin.AddJoinTokens(JoinType: TJoinType;
                              NextJoinToken: TExpToken);
begin
   if (NextJoinToken <> nil) then
      begin
      FJoinType:=JoinType;
      AddTokens(FJoinTokens,NextJoinToken);
      end;
end;

procedure TJoin.FlipJoinTokens;
begin
   if (FJoinTokens <> nil) then
      FlipNextJoinToken(FJoinTokens);
end;

procedure TJoin.FlipNextJoinToken(NextToken: TExpToken);
begin
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            FlipNextJoinToken(LeftExpToken);
         etBINARY:
            begin
            if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) then
               ReverseBinaryTokenOperator(NextToken)
            else
               begin
               FlipNextJoinToken(LeftExpToken);
               FlipNextJoinToken(RightExpToken);
               end;
            end;
         end;
      end;
end;

procedure TJoin.ReduceJoinExpression;
begin
   if ReduceNextJoinToken(FJoinTokens,nil,False) then
      FJoinTokens:=nil;
end;

function TJoin.ReduceNextJoinToken(NextToken: TExpToken;
                                   UpperToken: TExpToken;
                                   NoWhereReduce: Boolean): Boolean;
var
   TempAlias: string;
   TempRightToken: TExpToken;
   TempLeftToken: TExpToken;
   LeftResult: Boolean;
   RightResult: Boolean;
begin
   Result:=False;
   with NextToken do
      begin
      UpperExpToken:=UpperToken;
      case TokenType of
         etUNARY:
            begin
            if (TokenOperator=eoNOT) then
               begin
               if FSourceTable.DataQuery.ContainsMultipleDataSources(TempAlias,NextToken) then
                  begin
                  FTargetTable.AddJoinScanTokens(UpperExpToken);
                  Result:=True;
                  end
               else if (FJoinType=jtInner) and (not NoWhereReduce) then
                  begin
                  FSourceTable.DataQuery.AddWhereExpressionTokens(NextToken);
                  Result:=True;
                  end
               else
                  ReduceNextJoinToken(LeftExpToken,NextToken,NoWhereReduce);
               end;
            end;
         etBINARY:
            begin
            { First check to see if we're dealing with a binary operator
              foOR or foAND }
            if (TokenOperator in [eoOR,eoAND]) then
               begin
               if (TokenOperator=eoOR) and
                  FSourceTable.DataQuery.ContainsMultipleDataSources(TempAlias,NextToken) then
                  begin
                  FTargetTable.AddJoinScanTokens(NextToken);
                  Result:=True;
                  end
               else
                  begin
                  { Version 5}
                  if (FJoinType=jtInner) and
                  { Version 5}
                     (not NoWhereReduce) and
                     (not FSourceTable.DataQuery.ContainsJoins(LeftExpToken)) and
                     (not FSourceTable.DataQuery.ContainsJoins(RightExpToken)) then
                     begin
                     FSourceTable.DataQuery.AddWhereExpressionTokens(NextToken);
                     Result:=True;
                     end
                  else
                     begin
                     if (TokenOperator=eoOR) then
                        begin
                        LeftResult:=ReduceNextJoinToken(LeftExpToken,NextToken,True);
                        RightResult:=ReduceNextJoinToken(RightExpToken,NextToken,True);
                        end
                     else
                        begin
                        LeftResult:=ReduceNextJoinToken(LeftExpToken,NextToken,NoWhereReduce);
                        RightResult:=ReduceNextJoinToken(RightExpToken,NextToken,NoWhereReduce);
                        end;
                     { Check to see what nodes we need to collapse in the
                       expression tree }
                     if (LeftResult and (not RightResult)) then
                        begin
                        TempRightToken:=RightExpToken;
                        NextToken.Copy(TempRightToken);
                        TempRightToken.Free;
                        Result:=False;
                        end
                     else if (RightResult and (not LeftResult)) then
                        begin
                        TempLeftToken:=LeftExpToken;
                        NextToken.Copy(TempLeftToken);
                        TempLeftToken.Free;
                        Result:=False;
                        end
                     else if (LeftResult and RightResult) then
                        begin
                        NextToken.Free;
                        Result:=True;
                        end;
                     end;
                  end;
               end
            else if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) and
                    (ContainsFields(LeftExpToken) and
                     ContainsFields(RightExpToken)) then
               begin
               if FSourceTable.DataQuery.ContainsMultipleDataSources(TempAlias,NextToken) then
                  begin
                  FTargetTable.AddJoinScanTokens(NextToken);
                  Result:=True;
                  end;
               end
            else if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) and
                    ((ContainsFields(LeftExpToken) and
                      (not ContainsFields(RightExpToken))) or
                     (ContainsFields(RightExpToken) and
                      (not ContainsFields(LeftExpToken)))) then
               begin
               { Make sure to reverse operators, if needed }
               if ((not ContainsFields(LeftExpToken)) and
                   ContainsFields(RightExpToken)) then
                  ReverseBinaryTokenOperator(NextToken);
               if FSourceTable.DataQuery.ContainsMultipleDataSources(TempAlias,NextToken) then
                  begin
                  FTargetTable.AddJoinScanTokens(NextToken);
                  Result:=True;
                  end
               else if (FJoinType=jtInner) and (not NoWhereReduce) then
                  begin
                  FSourceTable.DataQuery.AddWhereExpressionTokens(NextToken);
                  Result:=True;
                  end;
               end;
            end;
         etEXTBINARY,etFUNC:
            begin
            if FSourceTable.DataQuery.ContainsMultipleDataSources(TempAlias,NextToken) then
               begin
               FTargetTable.AddJoinScanTokens(NextToken);
               Result:=True;
               end
            else if (FJoinType=jtInner) and (not NoWhereReduce) then
               begin
               FSourceTable.DataQuery.AddWhereExpressionTokens(NextToken);
               Result:=True;
               end;
            end;
         end;
      end;
end;

function TJoin.DependsUpon(ParentTable: TSourceTable): Boolean;
var
   I: Integer;
begin
   if (FJoinTokens <> nil) then
      Result:=DependsUponNextJoinToken(FJoinTokens,ParentTable)
   else
      Result:=False;
   { Version 5 }
   if (not Result) then
      begin
      with FTargetTable do
         begin
         for I:=0 to Joins.Count-1 do
            begin
            if TJoin(Joins[I]).DependsUpon(ParentTable) then
               begin
               Result:=True;
               Break;
               end;
            end;
         end;
      end;
   { Version 5 }
end;

function TJoin.DependsUponNextJoinToken(NextToken: TExpToken;
                                        ParentTable: TSourceTable): Boolean;
var
   TempFieldToken: TExpToken;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=DependsUponNextJoinToken(LeftExpToken,ParentTable);
         etBINARY:
            begin
            { First check to see if we're dealing with a binary operator
              foOR or foAND }
            if (TokenOperator in [eoOR,eoAND]) then
               Result:=(DependsUponNextJoinToken(LeftExpToken,ParentTable) or
                        DependsUponNextJoinToken(RightExpToken,ParentTable))
            else if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) and
                    (ContainsFields(LeftExpToken) or
                     ContainsFields(RightExpToken)) then
               begin
               if ContainsFields(LeftExpToken) then
                  begin
                  TempFieldToken:=GetFieldToken(LeftExpToken);
                  if (TempFieldToken.DataSource <> nil) and
                     (TSourceTable(TempFieldToken.DataSource)=ParentTable) then
                     Result:=True;
                  end;
               if (not Result) and ContainsFields(RightExpToken) then
                  begin
                  TempFieldToken:=GetFieldToken(RightExpToken);
                  if (TempFieldToken.DataSource <> nil) and
                     (TSourceTable(TempFieldToken.DataSource)=ParentTable) then
                     Result:=True;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TJoin.FreeJoinFilterHandle;
begin
   if (FJoinFilterHandle <> nil) then
      begin
      FTargetTable.DataCursor.DropFilter(FJoinFilterHandle,False);
      FJoinFilterHandle:=nil;
      end;
end;

procedure TJoin.BuildJoinFilter;
var
   TempToken: TExpToken;
begin
   if (FJoinTokens <> nil) then
      begin
      if (FJoinFilterHandle <> nil) then
         TargetTable.DataCursor.ResetFilter(FJoinFilterHandle,nil,
                                      Integer(FSourceTable.DataQuery),
                                      @TDataQuery.EvaluateResetFieldData,
                                      FSourceTable.DataQuery.LocaleID)
      else
         begin
         TempToken:=BuildNextJoinFilter(FJoinTokens,Integer(FSourceTable.DataQuery),
                                      @TDataQuery.EvaluateExpressionFieldData,
                                      FSourceTable.DataQuery.LocaleID);
         TargetTable.DataCursor.AddFilter(0,nil,TempToken,True,nil,
                                      True,FSourceTable.DataQuery.FJoinOptimizeCosts,
                                      False,False,FJoinFilterHandle);
         with FSourceTable.DataQuery do
            begin
            if GeneratePlan then
               begin
               { Version 5 }
               if ContainsTextSearch(FJoinTokens) then
                  begin
                  Plan('NOTE: Optimized TEXTSEARCH() conditions do not use statistics '+
                       'and will show zero (0) for any I/O costs');
                  Plan('');
                  end;
               if ContainsNots(FJoinTokens) then
                  begin
                  Plan('NOTE: Using a NOT operator will force an optimized condition '+
                       'to be partially-optimized due to the need for an additional '+
                       'record scan to remove deleted records');
                  Plan('');
                  end;
               { Version 5 }
               if FSourceTable.DataQuery.FJoinOptimizeCosts then
                  begin
                  with TFilter(FJoinFilterHandle) do
                     begin
                     Plan('The expression:');
                     Plan('');
                     Plan(BuildExpressionLiteral(FJoinTokens));
                     Plan('');
                     if Rewritten then
                        Plan('has been rewritten and is '+GetOptimizeLevelText(OptimizeLevel)+
                             ' and is estimated to cost '+IntToStr(FilterTokens.OptimizeCost)+
                             ' bytes per candidate row')
                     else
                        Plan('is '+GetOptimizeLevelText(OptimizeLevel)+
                             ' and is estimated to cost '+IntToStr(FilterTokens.OptimizeCost)+
                             ' bytes per candidate row');
                     Plan('');
                     end;
                  end
               else
                  begin
                  with TFilter(FJoinFilterHandle) do
                     begin
                     Plan('The expression:');
                     Plan('');
                     Plan(BuildExpressionLiteral(FJoinTokens));
                     Plan('');
                     if Rewritten then
                        Plan('has been rewritten and is '+GetOptimizeLevelText(OptimizeLevel))
                     else
                        Plan('is '+GetOptimizeLevelText(OptimizeLevel));
                     Plan('');
                     end;
                  end;
               end;
            end;
         TargetTable.DataCursor.ActivateFilter(FJoinFilterHandle);
         end;
      end;
end;

function TJoin.BuildNextJoinFilter(NextToken: TExpToken;
                                   ClientData: Integer;
                                   FieldCallback: pEvaluateFieldCallback;
                                   LocaleID: Integer): TExpToken;
var
   TempLeftToken: TExpToken;
   TempRightToken: TExpToken;
   I: Integer;
begin
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            begin
            if (not ContainsFields(LeftExpToken)) then
               Result:=BuildNextFilterExpression(NextToken,ClientData,
                                                 FieldCallback,LocaleID,
                                                 False,True)
            else
               begin
               Result:=TExpToken.Create;
               Result.Copy(NextToken);
               Result.ArgumentExpTokens.Clear;
               Result.LeftExpToken:=BuildNextJoinFilter(LeftExpToken,ClientData,
                                                        FieldCallback,
                                                        LocaleID);
               end;
            end;
         etBINARY:
            begin
            if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) then
               begin
               if ContainsFields(LeftExpToken) and ContainsFields(RightExpToken) then
                  begin
                  TempLeftToken:=GetFieldToken(LeftExpToken);
                  TempRightToken:=GetFieldToken(RightExpToken);
                  { If the data sources are not the same, we have a regular join }
                  if (TempLeftToken.DataSource <> TempRightToken.DataSource) then
                     begin
                     Result:=TExpToken.Create;
                     Result.Copy(NextToken);
                     Result.ArgumentExpTokens.Clear;
                     if IsCaseInsensitiveField(LeftExpToken) and
                        IsCaseInsensitiveField(RightExpToken) and
                        (LeftExpToken.TokenOperator=RightExpToken.TokenOperator) then
                        Result.CaseInsensitive:=True;
                     Result.LeftExpToken:=BuildNextJoinFilter(RightExpToken,ClientData,
                                                              FieldCallback,
                                                              LocaleID);
                     Result.RightExpToken:=EvaluateConstant(RightExpToken,LeftExpToken,
                                                            nil,ClientData,FieldCallback,
                                                            LocaleID);
                     { Be sure to assign tokens to use for further re-evaluation }
                     Result.RightExpToken.ParamExpToken:=LeftExpToken;
                     ReverseBinaryOperator(Result);
                     end
                  else
                     begin
                     { If the data source is not for the target table, then
                       go ahead and evaluate the column now }
                     if (TempLeftToken.DataSource <> FTargetTable) then
                        begin
                        Result:=TExpToken.Create;
                        Result.Copy(NextToken);
                        Result.ArgumentExpTokens.Clear;
                        Result.LeftExpToken:=EvaluateConstant(LeftExpToken,LeftExpToken,
                                                              nil,ClientData,FieldCallback,
                                                              LocaleID);
                        { Be sure to assign tokens to use for further re-evaluation }
                        Result.LeftExpToken.ParamExpToken:=LeftExpToken;
                        Result.RightExpToken:=EvaluateConstant(LeftExpToken,RightExpToken,
                                                               nil,ClientData,FieldCallback,
                                                               LocaleID);
                        { Be sure to assign tokens to use for further re-evaluation }
                        Result.RightExpToken.ParamExpToken:=RightExpToken;
                        end
                     else
                        Result:=BuildNextFilterExpression(NextToken,ClientData,
                                                          FieldCallback,LocaleID,
                                                          False,True);
                     end;
                  end
               else
                  begin
                  { Make sure to reverse operators, if needed }
                  if ((not ContainsFields(LeftExpToken)) and
                      ContainsFields(RightExpToken)) then
                     ReverseBinaryTokenOperator(NextToken);
                  { If the data source is not for the target table, then
                    go ahead and evaluate the column now }
                  if ContainsFields(LeftExpToken) then
                     begin
                     TempLeftToken:=GetFieldToken(LeftExpToken);
                     if (TempLeftToken.DataSource <> FTargetTable) then
                        begin
                        Result:=TExpToken.Create;
                        Result.Copy(NextToken);
                        Result.ArgumentExpTokens.Clear;
                        Result.LeftExpToken:=EvaluateConstant(LeftExpToken,LeftExpToken,
                                                              nil,ClientData,FieldCallback,
                                                              LocaleID);
                        { Be sure to assign tokens to use for further re-evaluation }
                        Result.LeftExpToken.ParamExpToken:=LeftExpToken;
                        Result.RightExpToken:=EvaluateConstant(LeftExpToken,RightExpToken,
                                                               nil,ClientData,FieldCallback,
                                                               LocaleID);
                        { No need to assign tokens for further evaluation on the
                          right side due to no fields being present }
                        end
                     else
                        Result:=BuildNextFilterExpression(NextToken,ClientData,
                                                          FieldCallback,LocaleID,
                                                          False,True);
                     end
                  else
                     Result:=BuildNextFilterExpression(NextToken,ClientData,
                                                       FieldCallback,LocaleID,
                                                       False,True);
                  end;
               end
            else
               begin
               Result:=TExpToken.Create;
               Result.Copy(NextToken);
               Result.ArgumentExpTokens.Clear;
               Result.LeftExpToken:=BuildNextJoinFilter(LeftExpToken,ClientData,
                                                        FieldCallback,
                                                        LocaleID);
               Result.RightExpToken:=BuildNextJoinFilter(RightExpToken,ClientData,
                                                         FieldCallback,
                                                         LocaleID);
               end;
            end;
         { Version 5}
         etEXTBINARY:
            begin
            if ContainsFields(NextToken) then
               begin
               TempLeftToken:=GetFieldToken(ArgumentExpToken[0]);
               if (TempLeftToken.DataSource <> FTargetTable) then
                  begin
                  Result:=TExpToken.Create;
                  Result.Copy(NextToken);
                  Result.ArgumentExpTokens.Clear;
                  Result.ArgumentExpToken[0]:=EvaluateConstant(ArgumentExpToken[0],
                                                               ArgumentExpToken[0],
                                                               nil,ClientData,FieldCallback,
                                                               LocaleID);
                  { Be sure to assign tokens to use for further re-evaluation }
                  Result.ArgumentExpToken[0].ParamExpToken:=ArgumentExpToken[0];
                  for I:=1 to ArgumentExpTokens.Count-1 do
                     begin
                     Result.ArgumentExpToken[I]:=EvaluateConstant(ArgumentExpToken[0],ArgumentExpToken[I],
                                                                  nil,ClientData,FieldCallback,
                                                                  LocaleID);
                     { Be sure to assign tokens to use for further re-evaluation }
                     if ContainsFields(ArgumentExpToken[I]) then
                        Result.ArgumentExpToken[I].ParamExpToken:=ArgumentExpToken[I];
                     end;
                  end
               else
                  Result:=BuildNextFilterExpression(NextToken,ClientData,
                                                    FieldCallback,LocaleID,
                                                    False,True);
               end
            else
               Result:=BuildNextFilterExpression(NextToken,ClientData,
                                                 FieldCallback,LocaleID,
                                                 False,True);
            end;
         { Version 5}
         else
            Result:=BuildNextFilterExpression(NextToken,ClientData,
                                              FieldCallback,LocaleID,
                                              False,True);
         end;
      end;
end;

function TJoin.InitializeJoin: Boolean;
begin
   BuildJoinFilter;
   GenerateJoinScanTokensPlan;
   Result:=FTargetTable.FirstRecordRead(FJoinType);
   if (not Result) then
      begin
      if (FJoinType=jtLeftOuter) then
         Result:=True;
      end;
end;

procedure TJoin.GenerateJoinScanTokensPlan;
begin
   if (FTargetTable.JoinScanTokens <> nil) then
      begin
      if (not FScanTokensGenerated) then
         begin
         with FSourceTable.DataQuery do
            begin
            if GeneratePlan then
               begin
               Plan('The expression:');
               Plan('');
               Plan(BuildExpressionLiteral(FTargetTable.JoinScanTokens));
               Plan('');
               Plan('is '+GetOptimizeLevelText(olNone));
               Plan('');
               end;
            end;
         FScanTokensGenerated:=True;
         end;
      end;
end;

{ TSourceTable }

constructor TSourceTable.Create(Owner: TDataQuery);
begin
   FDataQuery:=Owner;
   FJoins:=TList.Create;
end;

destructor TSourceTable.Destroy;
begin
   FreeExpressionTokens(FJoinScanTokens);
   if (FJoins <> nil) then
      begin
      FreeJoins;
      FJoins.Free;
      FJoins:=nil;
      end;
   FreeCurRecordBuffer;
   if (FDataCursor <> nil) then
      begin
      with FDataCursor do
         begin
         CloseCursor(True);
         Free;
         end;
      FDataCursor:=nil;
      end;
   if (FDataDirectory <> nil) then
      begin
      FDataDirectory.DataSession.CloseDataDirectory(FDataDirectory,False);
      FDataDirectory:=nil;
      end;
   inherited Destroy;
end;

procedure TSourceTable.FreeJoins;
var
   I: Integer;
begin
   for I:=FJoins.Count-1 downto 0 do
      begin
      TJoin(FJoins[I]).Free;
      FJoins.Delete(I);
      end;
end;

procedure TSourceTable.FreeCurRecordBuffer;
begin
   DeAllocMem(FCurRecordBuffer);
   FRecordSize:=0;
end;

procedure TSourceTable.Open(ClientData: Integer; WantLive: Boolean);
var
   TempDirectory: string;
   TempRights: Integer;
begin
   TempDirectory:='';
   if FDataQuery.DataSession.IsServer then
      begin
      TempRights:=0;
      FDataQuery.DataSession.DoGetPath(FDirectoryName,TempDirectory);
      FDataDirectory:=FDataQuery.DataSession.OpenDataDirectory(FDirectoryName,TempDirectory,
                                                               FDataQuery.DataDirectory.KeepTablesOpen,
                                                               False,True);
      FDataQuery.DataSession.DoGetRights(FDirectoryName,TempRights);
      FDataDirectory.ServerRights:=TempRights;
      FDataQuery.DataSession.DoCheckRights(FDataDirectory,READ_RIGHT);
      end
   else
      begin
      if MemoryDirectory(FDirectoryName) then
         begin
         FDataQuery.DataSession.DoGetPath(FDirectoryName,TempDirectory);
         FDataDirectory:=FDataQuery.DataSession.OpenDataDirectory(FDirectoryName,TempDirectory,
                                                                  FDataQuery.DataDirectory.KeepTablesOpen,False);
         end
      else
         FDataDirectory:=FDataQuery.DataSession.OpenDataDirectory('',FDirectoryName,
                                                                  FDataQuery.DataDirectory.KeepTablesOpen,False);
      end;
   FDataCursor:=TDataCursor.Create(FDataDirectory,False);
   with FDataCursor do
      begin
      TableName:=FTableName;
      ReadOnly:=(not WantLive);
      Exclusive:=FExclusive;
      SourceTable:=True;
      OpenCursor(False);
      end;
   FRecordSize:=0;
   FCurRecordBuffer:=nil;
end;

procedure TSourceTable.SetTableName(const Value: string);
var
   TempString: string;
begin
   if (FDataCursor <> nil) and FDataCursor.IsOpen then
      Exit;
   TempString:=ConvertSlashes(Value);
   if (TempString <> FTableName) then
      begin
      if ContainsDirectory(TempString) then
         begin
         FTableName:=StripFilePathAndExtension(TempString,DataEngine.DataExtension);
         if FDataQuery.DataSession.IsServer then
            FDirectoryName:=RemoveAllBS(ExtractFilePath(TempString))
         else
            begin
            if MemoryDirectory(ExtractFilePath(TempString)) then
               FDirectoryName:=INMEMORY_DATABASE_NAME
            else
               FDirectoryName:=RemoveAllTrailingBS(ExtractFilePath(TempString));
            end;
         end
      else
         begin
         FTableName:=StripFilePathAndExtension(TempString,DataEngine.DataExtension);
         if FDataQuery.DataSession.IsServer then
            FDirectoryName:=FDataQuery.QueryStatement.DataDirectory.Name
         else
            begin
            if MemoryDirectory(FDataQuery.QueryStatement.DataDirectory.Name) then
               FDirectoryName:=INMEMORY_DATABASE_NAME
            else
               FDirectoryName:=FDataQuery.QueryStatement.DataDirectory.Directory;
            end;
         end;
      if (FAliasName='') then
         FAliasName:=StripFilePathAndExtension(FTableName,DataEngine.DataExtension);
      end;
end;

procedure TSourceTable.SetAliasName(const Value: string);
begin
   if (FDataCursor <> nil) and FDataCursor.IsOpen then
      Exit;
   if (Value <> FAliasName) then
      FAliasName:=Value;
end;

function TSourceTable.FindField(const SourceFieldName: string): Word;
begin
   Result:=FDataCursor.GetPhysicalFieldNumber(SourceFieldName);
end;

function TSourceTable.FindFirstFieldName(var FieldNumber: Word): string;
begin
   with FDataCursor.GetPhysicalFieldDefinition(1)^ do
      begin
      FieldNumber:=FieldNum;
      Result:=FieldName;
      end;
end;

procedure TSourceTable.InitializeCurRecordBuffer;
begin
   FreeCurRecordBuffer;
   FRecordSize:=FDataCursor.RecordSize;
   FCurRecordBuffer:=AllocMem(FRecordSize);
end;

procedure TSourceTable.AddJoin(NewJoinType: TJoinType;
                               NextJoinToken: TExpToken;
                               NewTargetTable: TSourceTable);
var
   I: Integer;
   JoinFound: Boolean;
begin
   JoinFound:=False;
   for I:=0 to FJoins.Count-1 do
      begin
      with TJoin(FJoins[I]) do
         begin
         if (TargetTable=NewTargetTable) and
            ((JoinType=NewJoinType) or (JoinType=jtNone)) then
            begin
            JoinFound:=True;
            AddJoinTokens(NewJoinType,NextJoinToken);
            Break;
            end;
         end;
      end;
   if not JoinFound then
      FJoins.Add(TJoin.Create(Self,NewJoinType,NextJoinToken,NewTargetTable));
end;

procedure TSourceTable.BumpJoinOrders;
var
   I: Integer;
begin
   for I:=0 to FJoins.Count-1 do
      begin
      with TJoin(FJoins[I]) do
         begin
         if (JoinType <> jtNone) then
            begin
            TargetTable.JoinOrder:=FJoinOrder+1;
            TargetTable.BumpJoinOrders;
            end;
         end;
      end;
end;

procedure TSourceTable.ReduceJoins;
var
   I: Integer;
begin
   for I:=0 to FJoins.Count-1 do
      begin
      with TJoin(FJoins[I]) do
         begin
         if (JoinTokens <> nil) then
            ReduceJoinExpression;
         end;
      end;
end;

procedure TSourceTable.VerifyJoins(AllowUnknownTypes: Boolean);
var
   I: Integer;
begin
   for I:=0 to FJoins.Count-1 do
      begin
      with TJoin(FJoins[I]) do
         begin
         if (JoinTokens <> nil) then
            FDataQuery.VerifyJoinExpression(JoinTokens,AllowUnknownTypes);
         end;
      end;
end;

function TSourceTable.GetJoinPosition(ExistingJoin: TJoin): Integer;
var
   I: Integer;
begin
   Result:=0;
   for I:=0 to FJoins.Count-1 do
      begin
      if ExistingJoin.DependsUpon(TJoin(FJoins[I]).TargetTable) then
         Result:=(I+1);
      end;
end;

procedure TSourceTable.AddJoinScanTokens(NextJoinToken: TExpToken);
begin
   AddTokens(FJoinScanTokens,NextJoinToken);
end;

function TSourceTable.EvaluateJoinScanExpression: Boolean;
begin
   EvaluateExpressionToken(FJoinScanTokens,nil,Integer(FDataQuery),
                           @TDataQuery.EvaluateExpressionFieldData,FDataQuery.LocaleID);
   Result:=pWordBool(FJoinScanTokens.Value)^;
end;

procedure TSourceTable.ReadNextRecords;
begin
   FEndOfTable:=False;
   while True do
      begin
      FEndOfTable:=(FDataCursor.GetNextRecord(FCurRecordBuffer)=DBISAM_EOF);
      if ((FDataCursor.GetRecordStatus(FCurRecordBuffer)=RECORD_VALID) and
          ((FJoinScanTokens=nil) or ((FJoinScanTokens <> nil) and EvaluateJoinScanExpression))) or
          FEndOfTable then
         Break;
      end;
end;

procedure TSourceTable.ReadPriorRecords;
begin
   FBeginOfTable:=False;
   while True do
      begin
      FBeginOfTable:=(FDataCursor.GetPriorRecord(FCurRecordBuffer)=DBISAM_BOF);
      if ((FDataCursor.GetRecordStatus(FCurRecordBuffer)=RECORD_VALID) and
          ((FJoinScanTokens=nil) or ((FJoinScanTokens <> nil) and EvaluateJoinScanExpression))) or
          FBeginOfTable then
         Break;
      end;
end;

procedure TSourceTable.FirstRecord;
begin
   FDataCursor.SetToBegin;
   ReadNextRecords;
end;

procedure TSourceTable.LastRecord;
begin
   FDataCursor.SetToEnd;
   ReadPriorRecords;
end;

procedure TSourceTable.NextRecord;
begin
   ReadNextRecords;
end;

procedure TSourceTable.PriorRecord;
begin
   ReadPriorRecords;
end;

procedure TSourceTable.RefreshRecord;
begin
   ReadNextRecords;
end;

function TSourceTable.FirstRecordRead(JoinType: TJoinType): Boolean;
var
   I: Integer;
begin
   FirstRecord;
   if FEndOfTable then
      begin
      Result:=False;
      if (FJoins.Count > 0) and (Self <> FDataQuery.MasterSourceTable) then
         begin
         for I:=0 to FJoins.Count-1 do
            TJoin(FJoins[I]).InitializeJoin;
         end;
      end
   else
      begin
      Result:=True;
      if (FJoins.Count > 0) then
         begin
         while (not FEndOfTable) do
            begin
            for I:=0 to FJoins.Count-1 do
               begin
               Result:=TJoin(FJoins[I]).InitializeJoin;
               if (not Result) then
                  Break;
               end;
            if (not Result) then
               NextRecord
            else
               Break;
            end;
         end;
      end;
end;

function TSourceTable.LastRecordRead(JoinType: TJoinType): Boolean;
var
   I: Integer;
begin
   LastRecord;
   if FBeginOfTable then
      begin
      Result:=False;
      if (FJoins.Count > 0) then
         begin
         for I:=0 to FJoins.Count-1 do
            TJoin(FJoins[I]).InitializeJoin;
         end;
      end
   else
      begin
      Result:=True;
      if (FJoins.Count > 0) then
         begin
         while (not FBeginOfTable) do
            begin
            for I:=0 to FJoins.Count-1 do
               begin
               Result:=TJoin(FJoins[I]).InitializeJoin;
               if (not Result) then
                  Break;
               end;
            if (not Result) then
               PriorRecord
            else
               Break;
            end;
         end;
      end;
end;

function TSourceTable.NextRecordRead: Boolean;
var
   I: Integer;
begin
   if (FJoins.Count > 0) then
      begin
      Result:=PriorJoinRead(FJoins.Count-1);
      if (not Result) then
         begin
         NextRecord;
         while (not FEndOfTable) do
            begin
            for I:=0 to FJoins.Count-1 do
               begin
               Result:=TJoin(FJoins[I]).InitializeJoin;
               if (not Result) then
                  Break;
               end;
            if Result then
               Break;
            NextRecord;
            end;
         end;
      end
   else
      begin
      NextRecord;
      Result:=(not FEndOfTable);
      end;
end;

function TSourceTable.PriorRecordRead: Boolean;
var
   I: Integer;
begin
   if (FJoins.Count > 0) then
      begin
      Result:=PriorJoinRead(FJoins.Count-1);
      if (not Result) then
         begin
         PriorRecord;
         while (not FEndOfTable) do
            begin
            for I:=0 to FJoins.Count-1 do
               begin
               Result:=TJoin(FJoins[I]).InitializeJoin;
               if (not Result) then
                  Break;
               end;
            if Result then
               Break;
            PriorRecord;
            end;
         end;
      end
   else
      begin
      PriorRecord;
      Result:=(not FEndOfTable);
      end;
end;

function TSourceTable.PriorJoinRead(JoinPos: Integer): Boolean;
begin
   if (JoinPos >= 0) then
      begin
      with TJoin(FJoins[JoinPos]) do
         begin
         Result:=TargetTable.NextRecordRead;
         if (not Result) then
            begin
            Result:=PriorJoinRead(JoinPos-1);
            if Result then
               begin
               Result:=TargetTable.FirstRecordRead(JoinType);
               if (not Result) then
                  begin
                  if (JoinType=jtLeftOuter) then
                     Result:=True;
                  end;
               end;
            end;
         end;
      end
   else
      Result:=False;
end;

function TSourceTable.RefreshRecordRead: Boolean;
var
   I: Integer;
begin
   RefreshRecord;
   if FEndOfTable then
      begin
      Result:=False;
      if (FJoins.Count > 0) then
         begin
         for I:=0 to FJoins.Count-1 do
            TJoin(FJoins[I]).InitializeJoin;
         end;
      end
   else
      begin
      Result:=True;
      if (FJoins.Count > 0) then
         begin
         while (not FEndOfTable) do
            begin
            for I:=0 to FJoins.Count-1 do
               begin
               Result:=TJoin(FJoins[I]).InitializeJoin;
               if (not Result) then
                  Break;
               end;
            if (not Result) then
               NextRecord
            else
               Break;
            end;
         end;
      end;
end;

function TSourceTable.IsJoinedTo(NewJoinType: TJoinType;
                                 NewTargetTable: TSourceTable): Boolean;
var
   I: Integer;
begin
   Result:=False;
   for I:=0 to FJoins.Count-1 do
      begin
      with TJoin(FJoins[I]) do
         begin
         if (JoinType=NewJoinType) and (TargetTable=NewTargetTable) then
            begin
            Result:=True;
            Break;
            end;
         end;
      end;
end;

function TSourceTable.GetJoin(NewJoinType: TJoinType;
                              NewTargetTable: TSourceTable): TJoin;
var
   I: Integer;
begin
   Result:=nil;
   for I:=0 to FJoins.Count-1 do
      begin
      with TJoin(FJoins[I]) do
         begin
         if (JoinType=NewJoinType) and (TargetTable=NewTargetTable) then
            begin
            Result:=FJoins[I];
            Break;
            end;
         end;
      end;
end;

{ TJoinExpression }

constructor TJoinExpression.Create(Owner: TDataQuery;
                                   JoinType: TJoinType;
                                   NextJoinToken: TExpToken;
                                   TargetTable: TSourceTable);
begin
   FDataQuery:=Owner;
   FJoinType:=JoinType;
   FJoinTokens:=NextJoinToken;
   FTargetTable:=TargetTable;
end;

destructor TJoinExpression.Destroy;
begin
   inherited;
end;

{ TQueryStatement }

constructor TQueryStatement.Create(Owner: TDataDirectory);
begin
   inherited Create;
   FDataDirectory:=Owner;
   FDataDirectory.AddQueryStatement(Self);
   if IsRemote then
      begin
      StartRemoteRequest;
      try
         CheckForConnection;
         SetRequestCode(REQUEST_CREATESTMT);
         BeginPack;
         Pack(FDataDirectory.RemoteID,SizeOf(Integer));
         EndPack;
         SendReceive;
         CheckForException;
         Unpack(FRemoteID);
      finally
         EndRemoteRequest;
      end;
      end
   else
      begin
      FDataQuery:=TDataQuery.Create(Self);
      FConstantParameters:=TList.Create;
      FExpressionParser:=TExpressionParser.Create(Self);
      FExpressionVerifier:=TExpressionVerifier.Create(Self);
      FPlan:=TStringList.Create;
      end;
end;

destructor TQueryStatement.Destroy;
begin
   FDataDirectory.RemoveQueryStatement(Self);
   if IsRemote then
      begin
      try
         StartRemoteRequest;
         try
            CheckForConnection;
            SetRequestCode(REQUEST_FREESTMT);
            BeginPack;
            Pack(FRemoteID,SizeOf(Integer));
            EndPack;
            SendReceive;
            CheckForException;
            FreeRemoteResultTable;
         finally
            EndRemoteRequest;
         end;
      except
      end;
      end
   else
      begin
      if (FDataQuery <> nil) then
         begin
         FDataQuery.Free;
         FDataQuery:=nil;
         end;
      if (FConstantParameters <> nil) then
         begin
         FConstantParameters.Free;
         FConstantParameters:=nil;
         end;
      if (FExpressionParser <> nil) then
         begin
         FExpressionParser.Free;
         FExpressionParser:=nil;
         end;
      if (FExpressionVerifier <> nil) then
         begin
         FExpressionVerifier.Free;
         FExpressionVerifier:=nil;
         end;
      if (FPlan <> nil) then
         begin
         FPlan.Free;
         FPlan:=nil;
         end;
      end;
   inherited Destroy;
end;

procedure TQueryStatement.CheckCallbacks(NewClientData: Integer);
begin
   if Assigned(FAbortProgressCallback) then
      FAbortProgressClientData:=NewClientData;
   if Assigned(FProgressCallback) then
      FProgressClientData:=NewClientData;
   if Assigned(FSteppedProgressCallback) then
      FSteppedProgressClientData:=NewClientData;
   if Assigned(FDataLostCallback) then
      FDataLostClientData:=NewClientData;
   if Assigned(FLogCallback) then
      FLogClientData:=NewClientData;
end;

procedure TQueryStatement.ExecuteError(const ErrorMessage: string);
begin
   DataEngine.RaiseError(DBISAM_SQLEXEC,'','','',ProperDataDirectoryName,'','',ErrorMessage);
end;

function TQueryStatement.GetDataSession: TDataSession;
begin
   Result:=FDataDirectory.DataSession;
end;

function TQueryStatement.GetProperDataDirectoryName: string;
begin
   Result:=FDataDirectory.ProperDataDirectoryName;
end;

function TQueryStatement.GetProgressPercent: Word;
begin
   Result:=DataSession.ProgressPercent;
end;

function TQueryStatement.GetRemoteEngineVersion: Currency;
begin
   Result:=DataSession.RemoteEngineVersion;
end;

procedure TQueryStatement.SetMaxNumOfRows(Value: Integer);
begin
   if (Value <> FMaxNumOfRows) then
      begin
      FMaxNumOfRows:=Value;
      if (FDataQuery <> nil) then
         FDataQuery.MaxNumOfRows:=FMaxNumOfRows;
      end;
end;

function TQueryStatement.GetResultTable: TDataCursor;
begin
   Result:=nil;
   if IsRemote then
      Result:=FRemoteResultTable
   else
      begin
      if (FDataQuery <> nil) then
         Result:=FDataQuery.ResultTable;
      end;
end;

procedure TQueryStatement.CreateRemoteResultTable;
var
   TempRemoteID: Integer;
begin
   if FIsLiveResult then
      begin
      FRemoteResultDataDirectoryName[0]:=Char(Byte(Unpack(FRemoteResultDataDirectoryName[1])));
      FRemoteResultDataDirectory:=DataSession.OpenDataDirectory(
                                  FRemoteResultDataDirectoryName,'',False,True);
      { Version 5 }
      if (RemoteEngineVersion >= 4.24) then
         Unpack(TempRemoteID)
      else
         TempRemoteID:=0;
      if (FRemoteResultDataDirectory.RemoteID=0) then
         FRemoteResultDataDirectory.RemoteID:=TempRemoteID;
      { Version 5 }
      FRemoteResultTable:=TDataCursor.Create(FRemoteResultDataDirectory,True);
      with FRemoteResultTable do
         begin
         UnpackResultSetInfo;
         OpenCursor(True);
         if (not FSelectAllColumns) then
            UnpackResultSetFields
         else
            SetDefaultFieldMapping;
         end;
      end
   else
      begin
      FRemoteResultDataDirectoryName:=REMOTE_RESULTSET_NAME;
      FRemoteResultDataDirectory:=DataSession.OpenDataDirectory(
                                  FRemoteResultDataDirectoryName,'',False,True);
      FRemoteResultTable:=TDataCursor.Create(FRemoteResultDataDirectory,True);
      with FRemoteResultTable do
         begin
         UnpackResultSetInfo;
         OpenCursor(True);
         end;
      end;
end;

procedure TQueryStatement.ResetRemoteResultTable;
begin
   if (FRemoteResultTable <> nil) then
      begin
      with FRemoteResultTable do
         begin
         FreeAllBlobs(True,True);
         DropFilter(nil,True);
         FiltersInEffect:=False;
         RangeInEffect:=False;
         UnpackCursorInfo;
         end;
      end;
end;

procedure TQueryStatement.FreeRemoteResultTable;
begin
   if (FRemoteResultTable <> nil) then
      begin
      with FRemoteResultTable do
         begin
         CloseCursor(True);
         Free;
         end;
      FRemoteResultTable:=nil;
      end;
   if (FRemoteResultDataDirectory <> nil) then
      begin
      DataSession.CloseDataDirectory(FRemoteResultDataDirectory,True);
      FRemoteResultDataDirectory:=nil;
      end;
end;

procedure TQueryStatement.SetRequestCode(Value: Word);
begin
   DataSession.SetRequestCode(Value);
end;

function TQueryStatement.GetResultCode: Word;
begin
   Result:=DataSession.GetResultCode;
end;

procedure TQueryStatement.Send;
begin
   DataSession.Send;
end;

procedure TQueryStatement.SendReceive;
var
   Reconnected: Boolean;
begin
   Reconnected:=False;
   while True do
      begin
      try
         Send;
         Receive;
         Break;
      except
         on E: Exception do
            begin
            if (not Reconnected) then
               begin
               DataSession.HandleReconnect;
               Reconnected:=True;
               end
            else
               raise;
            end;
      end;
      end;
end;

procedure TQueryStatement.Receive;
var
   TempCallbackType: Word;
   TempPercentDone: Word;
   TempAbort: Boolean;
   TempStep: string;
   TempCause: Byte;
   TempContextInfo: string;
   TempContinue: Boolean;
   TempStopAsking: Boolean;
   TempLogMessage: string;
begin
   while True do
      begin
      DataSession.Receive(TempCallbackType);
      if (GetResultCode=DBISAM_REMOTECALLBACK) then
         begin
         case TempCallbackType of
            CALLBACK_ABORTPROGRESS:
               begin
               Unpack(TempPercentDone);
               Unpack(TempAbort);
               DoAbortProgress(TempPercentDone,TempAbort);
               SetRequestCode(REQUEST_CALLBACKRESPONSE);
               BeginPack;
               Pack(TempAbort,SizeOf(Boolean));
               EndPack;
               Send;
               end;
            CALLBACK_PROGRESS:
               begin
               Unpack(TempPercentDone);
               DoProgress(TempPercentDone);
               end;
            CALLBACK_STEPPEDPROGRESS:
               begin
               TempStep[0]:=Char(Byte(Unpack(TempStep[1])));
               Unpack(TempPercentDone);
               DoSteppedProgress(TempStep,TempPercentDone);
               end;
            CALLBACK_DATALOST:
               begin
               Unpack(TempCause);
               TempContextInfo[0]:=Char(Byte(Unpack(TempContextInfo[1])));
               Unpack(TempContinue);
               Unpack(TempStopAsking);
               DoDataLost(TempCause,TempContextInfo,TempContinue,
                          TempStopAsking);
               SetRequestCode(REQUEST_CALLBACKRESPONSE);
               BeginPack;
               Pack(TempContinue,SizeOf(Boolean));
               Pack(TempStopAsking,SizeOf(Boolean));
               EndPack;
               Send;
               end;
            CALLBACK_LOG:
               begin
               TempLogMessage[0]:=Char(Byte(Unpack(TempLogMessage[1])));
               DoLog(TempLogMessage);
               end;
            else
               Break;
            end;
         end
      else
         Break;
      end;
end;

procedure TQueryStatement.StartRemoteRequest;
begin
   DataSession.StartRemoteRequest;
end;

procedure TQueryStatement.EndRemoteRequest;
begin
   DataSession.EndRemoteRequest;
end;

procedure TQueryStatement.BeginPack;
begin
   DataSession.BeginPack;
end;

procedure TQueryStatement.Pack(const Buffer; BufferSize: Integer);
begin
   DataSession.Pack(Buffer,BufferSize);
end;

procedure TQueryStatement.EndPack;
begin
   DataSession.EndPack;
end;

function TQueryStatement.Unpack(var Buffer): Integer;
begin
   Result:=DataSession.Unpack(Buffer);
end;

function TQueryStatement.GetIsRemote: Boolean;
begin
   Result:=DataSession.IsRemote;
end;

function TQueryStatement.GetIsEncrypted: Boolean;
begin
   Result:=DataSession.IsEncrypted;
end;

function TQueryStatement.GetConnected: Boolean;
begin
   Result:=DataSession.Connected;
end;

procedure TQueryStatement.CheckForConnection;
begin
   DataSession.CheckForConnection;
end;

procedure TQueryStatement.CheckForException;
begin
   DataSession.CheckForException;
end;

procedure TQueryStatement.DoAbortProgress(PercentDone: Word;
                                          var Abort: Boolean);
begin
   if Assigned(FAbortProgressCallback) then
      FAbortProgressCallback(FAbortProgressClientData,
                             PercentDone,Abort);
end;

procedure TQueryStatement.DoProgress(PercentDone: Word);
begin
   if Assigned(FProgressCallback) then
      FProgressCallback(FProgressClientData,PercentDone);
end;

procedure TQueryStatement.DoSteppedProgress(const Step: string; PercentDone: Word);
begin
   if Assigned(FSteppedProgressCallback) then
      FSteppedProgressCallback(FSteppedProgressClientData,
                               Step,PercentDone);
end;

procedure TQueryStatement.DoDataLost(Cause: Byte; const ContextInfo: string;
                                     var Continue: Boolean;
                                     var StopAsking: Boolean);
begin
   if Assigned(FDataLostCallback) then
      FDataLostCallback(FDataLostClientData,
                        Cause,ContextInfo,Continue,StopAsking);
end;

procedure TQueryStatement.DoLog(const LogMessage: string);
begin
   if Assigned(FLogCallback) then
      FLogCallback(FLogClientData,LogMessage);
end;

procedure TQueryStatement.PrepareStatement(SQLText: PChar;
                                           SQLLineOffset: Integer;
                                           SQLColumnOffset: Integer);
var
   TempSQLTextSize: Integer;
begin
   if IsRemote then
      begin
      StartRemoteRequest;
      try
         CheckForConnection;
         SetRequestCode(REQUEST_PREPARESTMT);
         BeginPack;
         Pack(FRemoteID,SizeOf(Integer));
         TempSQLTextSize:=StrLen(SQLText);
         Pack(TempSQLTextSize,SizeOf(Integer));
         Pack(SQLText^,TempSQLTextSize);
         Pack(FWantLiveResult,SizeOf(Boolean));
         Pack(FMaxNumOfRows,SizeOf(Integer));
         if (RemoteEngineVersion >= 4.09) then
            begin
            Pack(SQLLineOffset,SizeOf(Integer));
            Pack(SQLColumnOffset,SizeOf(Integer));
            end;
         EndPack;
         SendReceive;
         CheckForException;
         Unpack(FStatementType);
         Unpack(FIsLiveResult);
         Unpack(FInplaceResult);
         Unpack(FSelectAllColumns);
         if (RemoteEngineVersion > 4.03) then
            Unpack(FParametersCount);
         if (FStatementType=SELECT_STATEMENT) then
            begin
            FreeRemoteResultTable;
            CreateRemoteResultTable;
            end
         else
            begin
            if (RemoteEngineVersion >= 4.01) then
               FTableName[0]:=Char(Byte(Unpack(FTableName[1])))
            else
               FTableName:='';
            end;
      finally
         EndRemoteRequest;
      end;
      end
   else
      begin
      with FExpressionParser do
         begin
         ErrorCode:=DBISAM_SQLPARSE;
         ErrorDBName:=ProperDataDirectoryName;
         ErrorTableName:='';
         ErrorContext:='SQL statement';
         ObjectContext:=FDataQuery;
         SetExpression(SQLText,SQLLineOffset,SQLColumnOffset);
         NextToken;
         end;
      with FExpressionVerifier do
         begin
         ErrorCode:=DBISAM_SQLPARSE;
         ErrorDBName:=ProperDataDirectoryName;
         ErrorTableName:='';
         ErrorContext:='SQL statement';
         end;
      FConstantParameters.Clear;
      FDataQuery.ParseQuery(nil);
      FStatementType:=FDataQuery.QueryType;
      if (FStatementType=SELECT_STATEMENT) then
         begin
         FDataQuery.WantLiveResult:=FWantLiveResult;
         FDataQuery.MaxNumOfRows:=FMaxNumOfRows;
         end
      else
         begin
         FDataQuery.WantLiveResult:=True;
         FDataQuery.MaxNumOfRows:=-1;
         end;
      FDataQuery.PrepareQuery;
      FIsLiveResult:=FDataQuery.IsLiveResult;
      FInplaceResult:=FDataQuery.InPlaceResult;
      FSelectAllColumns:=FDataQuery.SelectAllColumns;
      FParametersCount:=FConstantParameters.Count;
      if (FStatementType=INSERT_STATEMENT) or
         (FStatementType=UPDATE_STATEMENT) or
         (FStatementType=DELETE_STATEMENT) then
         FTableName:=TSourceTable(FDataQuery.SourceTables[0]).TableName
      else if (FStatementType=CREATE_TABLE_STATEMENT) or
              (FStatementType=ALTER_TABLE_STATEMENT) or
              (FStatementType=EMPTY_TABLE_STATEMENT) or
              (FStatementType=OPTIMIZE_TABLE_STATEMENT) or
              (FStatementType=EXPORT_TABLE_STATEMENT) or
              (FStatementType=IMPORT_TABLE_STATEMENT) or
              (FStatementType=VERIFY_TABLE_STATEMENT) or
              (FStatementType=REPAIR_TABLE_STATEMENT) or
              (FStatementType=UPGRADE_TABLE_STATEMENT) or
              (FStatementType=DROP_TABLE_STATEMENT) or
              (FStatementType=RENAME_TABLE_STATEMENT) or
              (FStatementType=CREATE_INDEX_STATEMENT) or
              (FStatementType=DROP_INDEX_STATEMENT) then
         FTableName:=FDataQuery.ResultTable.TableName
      else
         FTableName:='';
      end;
end;

procedure TQueryStatement.ExecuteStatement(var ResultSet: TDataCursor;
                                           ParamCount: Word;
                                           const ParamDefinitions: array of pFieldDefinition;
                                           RecordBuffer: PChar;
                                           GenPlan: Boolean;
                                           var PlanText: AnsiString;
                                           SendProgress: Boolean;
                                           SendDataLost: Boolean;
                                           SendLog: Boolean);
var
   TempTablesList: TStrings;
   I: Integer;
   TempTableCount: Integer;
   TempTableName: string;
   TempPlanSize: Integer;
begin
   if IsRemote then
      begin
      StartRemoteRequest;
      try
         CheckForConnection;
         SetRequestCode(REQUEST_EXECUTESTMT);
         BeginPack;
         Pack(FRemoteID,SizeOf(Integer));
         PackParameters(ParamCount,ParamDefinitions,RecordBuffer);
         if (RemoteEngineVersion >= 4.11) then
            Pack(GenPlan,SizeOf(Boolean));
         Pack(SendProgress,SizeOf(Boolean));
         Pack(SendDataLost,SizeOf(Boolean));
         Pack(SendLog,SizeOf(Boolean));
         EndPack;
         SendReceive;
         CheckForException;
         Unpack(FExecutionTime);
         Unpack(FRowsAffected);
         if (RemoteEngineVersion >= 4.11) and GenPlan then
            begin
            Unpack(TempPlanSize);
            SetLength(PlanText,TempPlanSize);
            Unpack(PlanText[1]);
            end;
         if (FStatementType=SELECT_STATEMENT) then
            begin
            ResetRemoteResultTable;
            ResultSet:=FRemoteResultTable;
            end
         else
            ResultSet:=nil;
         case FStatementType of
            START_TRANSACTION_STATEMENT:
               begin
               if (RemoteEngineVersion >= 4.06) then
                  begin
                  TempTablesList:=TStringList.Create;
                  Unpack(TempTableCount);
                  for I:=1 to TempTableCount do
                     begin
                     TempTableName[0]:=Char(Byte(Unpack(TempTableName[1])));
                     TempTablesList.Add(TempTableName);
                     end;
                  end
               else
                  TempTablesList:=nil;
               try
                  with FDataDirectory do
                     begin
                     if (not InTransaction) then
                        StartTransaction(True,TempTablesList);
                     end;
               finally
                  if (TempTablesList <> nil) then
                     TempTablesList.Free;
               end;
               end;
            ROLLBACK_TRANSACTION_STATEMENT:
               begin
               with FDataDirectory do
                  begin
                  if InTransaction then
                     RollbackTransaction(True);
                  end;
               end;
            COMMIT_TRANSACTION_STATEMENT:
               begin
               with FDataDirectory do
                  begin
                  if InTransaction then
                     CommitTransaction(False,True,True);
                  end;
               end;
            end;
      finally
         EndRemoteRequest;
      end;
      end
   else
      begin
      FGeneratePlan:=GenPlan;
      { Set the statement parameters }
      if (ParamCount > 0) then
         SetStatementParameters(ParamCount,ParamDefinitions,RecordBuffer);
      { Execute statement }
      FDataQuery.ExecuteQuery(ResultSet);
      FExecutionTime:=FDataQuery.ExecutionTime;
      FRowsAffected:=FDataQuery.RowsAffected;
      if FGeneratePlan then
         PlanText:=FPlan.Text
      else
         PlanText:='';
      end;
end;

function TQueryStatement.SetStatementParameters(ParamCount: Word;
                                                const ParamDefinitions: array of pFieldDefinition;
                                                RecordBuffer: PChar): Word;
var
   I: Integer;
begin
   Result:=DBISAM_NONE;
   for I:=0 to (ParamCount-1) do
      begin
      if (I < FConstantParameters.Count) then
         begin
         with ParamDefinitions[I]^ do
            begin
            if (DataType <> TYPE_BLOB) then
               begin
               TExpToken(FConstantParameters[I]).DataType:=DataType;
               TExpToken(FConstantParameters[I]).SubType:=SubType;
               TExpToken(FConstantParameters[I]).DataSize:=DataSize;
               TExpToken(FConstantParameters[I]).DataDecimals:=DataDecimals;
               TExpToken(FConstantParameters[I]).IsNull:=(not Boolean((RecordBuffer+Offset)^));
               Move((RecordBuffer+FLDCHG_DATA+Offset)^,
                     TExpToken(FConstantParameters[I]).Value^,
                     TExpToken(FConstantParameters[I]).DataSize);
               end
            else
               begin
               if (SubType <> SUBTYPE_MEMO) then
                  begin
                  TExpToken(FConstantParameters[I]).DataType:=DataType;
                  TExpToken(FConstantParameters[I]).SubType:=SubType;
                  TExpToken(FConstantParameters[I]).DataSize:=
                        pBlobParam((RecordBuffer+FLDCHG_DATA+Offset))^.BlobLength;
                  TExpToken(FConstantParameters[I]).DataDecimals:=0;
                  TExpToken(FConstantParameters[I]).IsNull:=(not Boolean((RecordBuffer+Offset)^));
                  Move(pBlobParam((RecordBuffer+FLDCHG_DATA+Offset))^.BlobBuffer^,
                        TExpToken(FConstantParameters[I]).Value^,
                        TExpToken(FConstantParameters[I]).DataSize);
                  end
               else
                  begin
                  TExpToken(FConstantParameters[I]).DataType:=DataType;
                  TExpToken(FConstantParameters[I]).SubType:=SubType;
                  TExpToken(FConstantParameters[I]).DataSize:=
                        pBlobParam((RecordBuffer+FLDCHG_DATA+Offset))^.BlobLength+1;
                  TExpToken(FConstantParameters[I]).DataDecimals:=0;
                  TExpToken(FConstantParameters[I]).IsNull:=(not Boolean((RecordBuffer+Offset)^));
                  Move(pBlobParam((RecordBuffer+FLDCHG_DATA+Offset))^.BlobBuffer^,
                        TExpToken(FConstantParameters[I]).Value^,
                        TExpToken(FConstantParameters[I]).DataSize-1);
                  end;
               end;
            end;
         end
      else
         Break;
      end;
end;

procedure TQueryStatement.PackParameters(ParamCount: Word;
                                         const ParamDefinitions: array of pFieldDefinition;
                                         RecordBuffer: PChar);
begin
   DataSession.PackParameters(ParamCount,ParamDefinitions,RecordBuffer);
end;

procedure TQueryStatement.SetAbortProgressCallback(ClientData: Integer;
                                                   AbortProgressCallback: pAbortProgressCallback);
begin
   FAbortProgressClientData:=ClientData;
   FAbortProgressCallback:=pAbortProgressCallback(@AbortProgressCallback);
end;

procedure TQueryStatement.SetProgressCallback(ClientData: Integer;
                                              ProgressCallback: pProgressCallback);
begin
   FProgressClientData:=ClientData;
   FProgressCallback:=pProgressCallback(@ProgressCallback);
end;

procedure TQueryStatement.SetSteppedProgressCallback(ClientData: Integer;
                                                     SteppedProgressCallback: pSteppedProgressCallback);
begin
   FSteppedProgressClientData:=ClientData;
   FSteppedProgressCallback:=pSteppedProgressCallback(@SteppedProgressCallback);
end;

procedure TQueryStatement.SetDataLostCallback(ClientData: Integer;
                                              DataLostCallback: pDataLostCallback);
begin
   FDataLostClientData:=ClientData;
   FDataLostCallback:=pDataLostCallback(@DataLostCallback);
end;

procedure TQueryStatement.SetLogCallback(ClientData: Integer;
                                         LogCallback: pLogCallback);
begin
   FLogClientData:=ClientData;
   FLogCallback:=pLogCallback(@LogCallback);
end;

procedure TQueryStatement.SaveResultToTable(const NewDataDirectoryName: string;
                                            const NewTableName: string;
                                            SendProgress: Boolean);
begin
   if IsRemote then
      begin
      StartRemoteRequest;
      try
         CheckForConnection;
         SetRequestCode(REQUEST_SAVERESULT);
         BeginPack;
         Pack(FRemoteID,SizeOf(Integer));
         Pack(NewDataDirectoryName[1],Length(NewDataDirectoryName));
         Pack(NewTableName[1],Length(NewTableName));
         Pack(SendProgress,SizeOf(Boolean));
         EndPack;
         SendReceive;
         CheckForException;
      finally
         EndRemoteRequest;
      end;
      end
   else
      begin
      if (FDataQuery <> nil) then
         FDataQuery.SaveResultToTable(NewDataDirectoryName,NewTableName,False);
      end;
end;

{ TDataQuery }

constructor TDataQuery.Create(Owner: TQueryStatement);
begin
   FQueryStatement:=Owner;
   FMaxNumOfRows:=-1;
   FSubSelectType:=stNone;
   FMergeType:=mtNone;
   FSubQueries:=TList.Create;
   FMergeQueries:=TList.Create;
   FSourceTables:=TList.Create;
   FExtraTables:=TList.Create;
   { Version 5 }
   FLastSmallestTable:=TList.Create;
   { Version 5 }
   FJoinExpressions:=TList.Create;
   FResultFields:=TList.Create;
   { Version 5 }
   FHiddenResultFields:=TList.Create;
   { Version 5 }
   FUpdateFields:=TList.Create;
   FUpdateValues:=TList.Create;
   FCreateFields:=TList.Create;
   FCreateIndexes:=TList.Create;
   FOrderByFields:=TList.Create;
   FOrderByCaseInsensitive:=False;
   FGroupByFields:=TList.Create;
   FLocaleID:=LOCALE_ANSI_STD;
   FIndexPageSize:=DEFAULT_PAGE_SIZE;
   FBlobBlockSize:=DEFAULT_BLOCK_SIZE;
   FUserMajorVersion:=1;
   FUserMinorVersion:=0;
   FLastAutoInc:=-1;
   FTopRows:=-1;
   FRangeStart:=-1;
   FRangeEnd:=-1;
   FStopWords:=TStringList.Create;
   FSpaceChars:=[];
   FIncludeChars:=[];
   FDateFormat:=ANSI_DATE_FORMAT;
   FTimeFormat:=ANSI_TIME_FORMAT;
   FDecSeparator:=ANSI_DECIMAL_SEPARATOR;
end;

destructor TDataQuery.Destroy;
begin
   { Version 5 }
   if (FFields <> nil) then
      begin
      FFields.Free;
      FFields:=nil;
      end;
   if (FTransactionTables <> nil) then
      begin
      FTransactionTables.Free;
      FTransactionTables:=nil;
      end;
   if (FStopWords <> nil) then
      begin
      FStopWords.Free;
      FStopWords:=nil;
      end;
   { Version 5 }
   FreeSourceTables;
   FreeExtraTables;
   { Version 5 }
   if (FLastSmallestTable <> nil) then
      begin
      FLastSmallestTable.Free;
      FLastSmallestTable:=nil;      
      end;
   { Version 5 }
   FreeJoinExpressions;
   FreeResultTable;
   FreeResultFields;
   FreeUpdateFields;
   FreeUpdateValues;
   FreeCreateFields;
   FreeCreateIndexes;
   FreeFieldDefinitions;
   FreeIndexDefinitions;
   FreeOrderByFields;
   FreeGroupByFields;
   FreeExpressionTokens(FWhereExpressionTokens);
   FreeExpressionTokens(FHavingExpressionTokens);
   FreeExpressionTokens(FScanExpressionTokens);
   FreeExpressionTokens(FTempScanExpressionTokens);
   FreeSubQueries;
   FreeMergeQueries;
   inherited Destroy;
end;

procedure TDataQuery.FreeSubQueries;
var
   I: Integer;
begin
   if (FSubQueries <> nil) then
      begin
      for I:=(FSubQueries.Count-1) downto 0 do
         begin
         TDataQuery(FSubQueries[I]).Free;
         FSubQueries.Delete(I);
         end;
      FSubQueries.Free;
      FSubQueries:=nil;
      end;
end;

procedure TDataQuery.FreeMergeQueries;
var
   I: Integer;
begin
   if (FMergeQueries <> nil) then
      begin
      for I:=(FMergeQueries.Count-1) downto 0 do
         begin
         TDataQuery(FMergeQueries[I]).Free;
         FMergeQueries.Delete(I);
         end;
      FMergeQueries.Free;
      FMergeQueries:=nil;
      end;
end;

procedure TDataQuery.AddSubQuery(NewSubQuery: TDataQuery);
begin
   FSubQueries.Add(NewSubQuery);
end;

procedure TDataQuery.AddMergeQuery(NewMergeQuery: TDataQuery);
begin
   FMergeQueries.Add(NewMergeQuery);
end;

procedure TDataQuery.FreeResultTable;
begin
   if (FResultTable <> nil) and (not FInPlaceResult) then
      begin
      with FResultTable do
         begin
         CloseCursor(True);
         Free;
         end;
      end;
   FResultTable:=nil;
   if (FResultDataDirectory <> nil) then
      begin
      FResultDataDirectory.DataSession.CloseDataDirectory(FResultDataDirectory,False);
      FResultDataDirectory:=nil;
      end;
end;

procedure TDataQuery.FreeResultFields;
var
   I: Integer;
begin
   { Version 5 }
   if (FResultFields <> nil) then
   { Version 5 }
      begin
      for I:=(FResultFields.Count-1) downto 0 do
         begin
         TResultField(FResultFields[I]).Free;
         FResultFields.Delete(I);
         end;
      FResultFields.Free;
      FResultFields:=nil;
      end;
   { Version 5 }
   if (FHiddenResultFields <> nil) then
      begin
      FHiddenResultFields.Clear;
      FHiddenResultFields.Free;
      FHiddenResultFields:=nil;
      end;
   { Version 5 }
end;

procedure TDataQuery.FreeUpdateFields;
var
   I: Integer;
begin
   { Version 5 }
   if (FUpdateFields <> nil) then
   { Version 5 }
      begin
      for I:=(FUpdateFields.Count-1) downto 0 do
         begin
         TResultField(FUpdateFields[I]).Free;
         FUpdateFields.Delete(I);
         end;
      FUpdateFields.Free;
      FUpdateFields:=nil;
      end;
end;

procedure TDataQuery.FreeUpdateValues;
var
   I: Integer;
begin
   { Version 5 }
   if (FUpdateValues <> nil) then
   { Version 5 }
      begin
      for I:=(FUpdateValues.Count-1) downto 0 do
         begin
         TResultField(FUpdateValues[I]).Free;
         FUpdateValues.Delete(I);
         end;
      FUpdateValues.Free;
      FUpdateValues:=nil;
      end;
end;

procedure TDataQuery.FreeCreateFields;
var
   I: Integer;
begin
   { Version 5 }
   if (FCreateFields <> nil) then
   { Version 5 }
      begin
      for I:=(FCreateFields.Count-1) downto 0 do
         begin
         TCreateField(FCreateFields[I]).Free;
         FCreateFields.Delete(I);
         end;
      FCreateFields.Free;
      FCreateFields:=nil;
      end;
end;

procedure TDataQuery.FreeCreateIndexes;
var
   I: Integer;
begin
   { Version 5 }
   if (FCreateIndexes <> nil) then
   { Version 5 }
      begin
      for I:=(FCreateIndexes.Count-1) downto 0 do
         begin
         TCreateIndex(FCreateIndexes[I]).Free;
         FCreateIndexes.Delete(I);
         end;
      FCreateIndexes.Free;
      FCreateIndexes:=nil;
      end;
   { Free the text index object if not nil }
   if (FCreateTextIndex <> nil) then
      begin
      FCreateTextIndex.Free;
      FCreateTextIndex:=nil;
      end;
end;

procedure TDataQuery.FreeFieldDefinitions;
var
   I: Integer;
begin
   for I:=1 to FFieldCount do
      DeAllocMem(FFieldDefinitions[I]);
   FFieldCount:=0;
   FillChar(FFieldDefinitions,SizeOf(FFieldDefinitions),#0);
end;

procedure TDataQuery.FreeIndexDefinitions;
var
   I: Integer;
begin
   for I:=0 to FIndexCount do
       DeAllocMem(FIndexDefinitions[I]);
   DeAllocMem(FIndexDefinitions[TEXT_INDEX_POS]);
   FIndexCount:=0;
   FillChar(FIndexDefinitions,SizeOf(FIndexDefinitions),#0);
end;

procedure TDataQuery.FreeSourceTables;
var
   I: Integer;
begin
   { Version 5 }
   if (FSourceTables <> nil) then
   { Version 5 }
      begin
      { Free all table joins first }
      for I:=0 to FSourceTables.Count-1 do
         TSourceTable(FSourceTables[I]).FreeJoins;
      { Now free the tables themselves }
      for I:=(FSourceTables.Count-1) downto 0 do
         begin
         TSourceTable(FSourceTables[I]).Free;
         FSourceTables.Delete(I);
         end;
      FSourceTables.Free;
      FSourceTables:=nil;
      end;
end;

procedure TDataQuery.FreeExtraTables;
var
   I: Integer;
begin
   { Version 5 }
   if (FExtraTables <> nil) then
   { Version 5 }
      begin
      for I:=(FExtraTables.Count-1) downto 0 do
         begin
         TSourceTable(FExtraTables[I]).Free;
         FExtraTables.Delete(I);
         end;
      FExtraTables.Free;
      FExtraTables:=nil;
      end;
end;

procedure TDataQuery.FreeJoinExpressions;
var
   I: Integer;
begin
   { Version 5 }
   if (FJoinExpressions <> nil) then
   { Version 5 }
      begin
      for I:=(FJoinExpressions.Count-1) downto 0 do
         begin
         TJoinExpression(FJoinExpressions[I]).Free;
         FJoinExpressions.Delete(I);
         end;
      FJoinExpressions.Free;
      FJoinExpressions:=nil;
      end;
end;

procedure TDataQuery.FreeOrderByFields;
var
   I: Integer;
begin
   { Version 5 }
   if (FOrderByFields <> nil) then
   { Version 5 }
      begin
      for I:=(FOrderByFields.Count-1) downto 0 do
         begin
         TOrderByField(FOrderByFields[I]).Free;
         FOrderByFields.Delete(I);
         end;
      FOrderByFields.Free;
      FOrderByFields:=nil;
      end;
end;

procedure TDataQuery.FreeGroupByFields;
var
   I: Integer;
begin
   { Version 5 }
   if (FGroupByFields <> nil) then
   { Version 5 }
      begin
      for I:=(FGroupByFields.Count-1) downto 0 do
         begin
         TGroupByField(FGroupByFields[I]).Free;
         FGroupByFields.Delete(I);
         end;
      FGroupByFields.Free;
      FGroupByFields:=nil;
      end;
end;

procedure TDataQuery.ExecuteError(const ErrorMessage: string);
begin
   FQueryStatement.ExecuteError(ErrorMessage);
end;

function TDataQuery.GetProgressPercent: Word;
begin
   Result:=FQueryStatement.ProgressPercent;
end;

procedure TDataQuery.CheckResultRights(DataDirectory: TDataDirectory);
begin
   case FQueryType of
      SELECT_STATEMENT,EXPORT_TABLE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,READ_RIGHT);
      INSERT_STATEMENT,IMPORT_TABLE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,INSERT_RIGHT);
      UPDATE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,UPDATE_RIGHT);
      DELETE_STATEMENT,EMPTY_TABLE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,DELETE_RIGHT);
      CREATE_TABLE_STATEMENT,CREATE_INDEX_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,CREATE_RIGHT);
      ALTER_TABLE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,ALTER_RIGHT);
      DROP_TABLE_STATEMENT,DROP_INDEX_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,DROP_RIGHT);
      RENAME_TABLE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,RENAME_RIGHT);
      OPTIMIZE_TABLE_STATEMENT,VERIFY_TABLE_STATEMENT,
      REPAIR_TABLE_STATEMENT,UPGRADE_TABLE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,MAINTAIN_RIGHT);
      BACKUP_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,BACKUP_RIGHT);
      RESTORE_STATEMENT:
         DataSession.DoCheckRights(DataDirectory,RESTORE_RIGHT);
      end;
end;

function TDataQuery.GetDataSession: TDataSession;
begin
   Result:=FQueryStatement.DataSession;
end;

function TDataQuery.GetDataDirectory: TDataDirectory;
begin
   Result:=FQueryStatement.DataDirectory;
end;

function TDataQuery.GetGeneratePlan: Boolean;
begin
   Result:=FQueryStatement.GeneratePlan;
end;

function TDataQuery.GetMasterSourceTable: TSourceTable;
begin
   Result:=FSourceTables.First;
end;

procedure TDataQuery.ParseQuery(CallingQuery: TDataQuery);
begin
   if FIsOpen then
      Exit;
   FParentQuery:=CallingQuery;
   with FQueryStatement.ExpressionParser do
      begin
      if CheckToken(PARSE_LEFTPAREN) then
         begin
         NextToken;
         MarkStatement;
         MarkExpression;
         FUsingParentheses:=True;
         if CheckTokenSymbol(PARSE_SELECT) then
            FQueryType:=SELECT_STATEMENT
         else
            ExpectedExpressionError(PARSE_SELECT,False);
         end
      else
         begin
         MarkStatement;
         MarkExpression;
         if CheckTokenSymbol(PARSE_SELECT) then
            FQueryType:=SELECT_STATEMENT
         else if CheckTokenSymbol(PARSE_INSERT) then
            FQueryType:=INSERT_STATEMENT
         else if CheckTokenSymbol(PARSE_UPDATE) then
            FQueryType:=UPDATE_STATEMENT
         else if CheckTokenSymbol(PARSE_DELETE) then
            FQueryType:=DELETE_STATEMENT
         else if CheckTokenSymbol(PARSE_CREATE) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=CREATE_TABLE_STATEMENT
            else if CheckTokenSymbol(PARSE_INDEX) then
               FQueryType:=CREATE_INDEX_STATEMENT
            else if CheckTokenSymbol(PARSE_UNIQUE) then
               begin
               FQueryType:=CREATE_INDEX_STATEMENT;
               FUniqueIndex:=True;
               end
            else if CheckTokenSymbol(PARSE_NOCASE) then
               begin
               FQueryType:=CREATE_INDEX_STATEMENT;
               FNoCaseIndex:=True;
               end
            else
               ExpectedExpressionError(PARSE_TABLE+', '+PARSE_INDEX+', '+
                                       PARSE_UNIQUE+', or '+PARSE_NOCASE,False);
            end
         else if CheckTokenSymbol(PARSE_ALTER) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=ALTER_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_EMPTY) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=EMPTY_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_OPTIMIZE) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=OPTIMIZE_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_EXPORT) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=EXPORT_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_IMPORT) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=IMPORT_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_VERIFY) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=VERIFY_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_REPAIR) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=REPAIR_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_UPGRADE) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=UPGRADE_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_DROP) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=DROP_TABLE_STATEMENT
            else if CheckTokenSymbol(PARSE_INDEX) then
               FQueryType:=DROP_INDEX_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE+' or '+PARSE_INDEX,False);
            end
         else if CheckTokenSymbol(PARSE_RENAME) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TABLE) then
               FQueryType:=RENAME_TABLE_STATEMENT
            else
               ExpectedExpressionError(PARSE_TABLE,False);
            end
         else if CheckTokenSymbol(PARSE_START) then
            begin
            NextToken;
            if CheckTokenSymbol(PARSE_TRANSACTION) then
               FQueryType:=START_TRANSACTION_STATEMENT
            else
               ExpectedExpressionError(PARSE_TRANSACTION,False);
            end
         else if CheckTokenSymbol(PARSE_ROLLBACK) then
            FQueryType:=ROLLBACK_TRANSACTION_STATEMENT
         else if CheckTokenSymbol(PARSE_COMMIT) then
            FQueryType:=COMMIT_TRANSACTION_STATEMENT
         else
            ExpectedExpressionError(PARSE_SELECT+', '+PARSE_INSERT+', '+
                                    PARSE_UPDATE+', '+PARSE_DELETE+', '+
                                    PARSE_CREATE+', '+PARSE_ALTER+', '+
                                    PARSE_DROP+', '+PARSE_RENAME+', '+
                                    PARSE_EMPTY+', '+PARSE_OPTIMIZE+', '+
                                    PARSE_EXPORT+', '+PARSE_IMPORT+', '+
                                    PARSE_VERIFY+', '+PARSE_REPAIR+', '+
                                    PARSE_UPGRADE+', '+PARSE_START+', '+
                                    PARSE_ROLLBACK+', or '+PARSE_COMMIT,False);
         end;
      NextToken;
      ErrorContext:=UpperCase(ExpressionAsString)+' SQL statement';
      FQueryStatement.ExpressionVerifier.ErrorContext:=ErrorContext;
      case FQueryType of
         SELECT_STATEMENT:
            ParseSelectQuery;
         INSERT_STATEMENT:
            ParseInsertQuery;
         UPDATE_STATEMENT:
            ParseUpdateQuery;
         DELETE_STATEMENT:
            ParseDeleteQuery;
         CREATE_TABLE_STATEMENT:
            ParseCreateTableQuery;
         CREATE_INDEX_STATEMENT:
            ParseCreateIndexQuery;
         ALTER_TABLE_STATEMENT:
            ParseAlterTableQuery;
         EMPTY_TABLE_STATEMENT:
            ParseEmptyTableQuery;
         OPTIMIZE_TABLE_STATEMENT:
            ParseOptimizeTableQuery;
         EXPORT_TABLE_STATEMENT:
            ParseExportTableQuery;
         IMPORT_TABLE_STATEMENT:
            ParseImportTableQuery;
         VERIFY_TABLE_STATEMENT:
            ParseVerifyTableQuery;
         REPAIR_TABLE_STATEMENT:
            ParseRepairTableQuery;
         UPGRADE_TABLE_STATEMENT:
            ParseUpgradeTableQuery;
         DROP_TABLE_STATEMENT:
            ParseDropTableQuery;
         RENAME_TABLE_STATEMENT:
            ParseRenameTableQuery;
         DROP_INDEX_STATEMENT:
            ParseDropIndexQuery;
         START_TRANSACTION_STATEMENT:
            ParseStartTransaction;
         ROLLBACK_TRANSACTION_STATEMENT:
            ParseRollbackTransaction;
         COMMIT_TRANSACTION_STATEMENT:
            ParseCommitTransaction;
         end;
      FStatementText:=StatementAsString;
      end;
end;

function TDataQuery.InternalStatementTypeToString(StatementType: Byte): string;
begin
   case StatementType of
      SELECT_STATEMENT:
         Result:='SELECT';
      INSERT_STATEMENT:
         Result:='INSERT';
      UPDATE_STATEMENT:
         Result:='UPDATE';
      DELETE_STATEMENT:
         Result:='DELETE';
      CREATE_TABLE_STATEMENT:
         Result:='CREATE TABLE';
      ALTER_TABLE_STATEMENT:
         Result:='ALTER TABLE';
      EMPTY_TABLE_STATEMENT:
         Result:='EMPTY TABLE';
      OPTIMIZE_TABLE_STATEMENT:
         Result:='OPTIMIZE TABLE';
      EXPORT_TABLE_STATEMENT:
         Result:='EXPORT TABLE';
      IMPORT_TABLE_STATEMENT:
         Result:='IMPORT TABLE';
      VERIFY_TABLE_STATEMENT:
         Result:='VERIFY TABLE';
      REPAIR_TABLE_STATEMENT:
         Result:='REPAIR TABLE';
      UPGRADE_TABLE_STATEMENT:
         Result:='UPGRADE TABLE';
      DROP_TABLE_STATEMENT:
         Result:='DROP TABLE';
      RENAME_TABLE_STATEMENT:
         Result:='RENAME TABLE';
      CREATE_INDEX_STATEMENT:
         Result:='CREATE INDEX';
      DROP_INDEX_STATEMENT:
         Result:='DROP INDEX';
      START_TRANSACTION_STATEMENT:
         Result:='START TRANSACTION';
      ROLLBACK_TRANSACTION_STATEMENT:
         Result:='ROLLBACK';
      COMMIT_TRANSACTION_STATEMENT:
         Result:='COMMIT';
      BACKUP_STATEMENT:
         Result:='BACKUP';
      RESTORE_STATEMENT:
         Result:='RESTORE';
      else
         Result:='UNKNOWN';
      end;
end;

procedure TDataQuery.ParseInto;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_INTO) then
         begin
         if (Self <> FQueryStatement.DataQuery) then
            InvalidExpressionError(False);
         NextToken;
         FWantLiveResult:=False;
         FResultTableName:=ParseTableName;
         end;
      end;
end;

procedure TDataQuery.ParseTerm;
var
   TempString: string;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Allow for a semicolon at the end }
      if CheckToken(PARSE_SEMICOLON) then
         NextToken
      else
         begin
         if (not CheckToken(PARSE_TERM)) then
            begin
            TempString:=InternalStatementTypeToString(FQueryType);
            ExpectedExpressionError('end of statement',False);
            end;
         end;
      end;
end;

procedure TDataQuery.ParseJoinLeftParens(var NumJoinParens: Word);
begin
   with FQueryStatement.ExpressionParser do
      begin
      while CheckToken(PARSE_LEFTPAREN) do
         begin
         Inc(NumJoinParens);
         NextToken;
         end;
      end;
end;

procedure TDataQuery.ParseJoins(var NextTableOrder: Word; var NumJoinParens: Word);
var
   TempSourceTable: TSourceTable;
   TempJoinExpression: TJoinExpression;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if (CheckToken(TOKEN_SYMBOL) and
         (CheckTokenSymbol(PARSE_JOIN) or
          CheckTokenSymbol(PARSE_INNER) or
          CheckTokenSymbol(PARSE_RIGHT) or
          CheckTokenSymbol(PARSE_LEFT))) then
         begin
         while True do
            begin
            if CheckTokenSymbol(PARSE_JOIN) then
               begin
               FJoinedResult:=True;
               NextToken;
               TempSourceTable:=TSourceTable.Create(Self);
               FSourceTables.Add(TempSourceTable);
               TempSourceTable.OutputOrder:=NextTableOrder;
               Inc(NextTableOrder);
               TempSourceTable.Line:=CurLine;
               TempSourceTable.Column:=CurColumn;
               TempSourceTable.TableName:=ParseTableName;
               if CheckTokenSymbol(PARSE_AS) then
                  begin
                  NextToken;
                  if not TokenIsSymbol then
                     ExpectedExpressionError('table correlation name',False);
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end
               else if TokenIsSymbol and
                       ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                        (not CheckTokenSymbol(PARSE_ON))) then
                  begin
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end;
               if CheckTokenSymbol(PARSE_EXCLUSIVE) then
                  begin
                  TempSourceTable.Exclusive:=True;
                  NextToken;
                  end;
               CheckForDuplicateSourceTable(TempSourceTable.AliasName,
                                            TempSourceTable);
               ErrorIfNotSymbol(PARSE_ON);
               NextToken;
               TempJoinExpression:=TJoinExpression.Create(Self,jtInner,
                                                          ParseJoinExpression,
                                                          TempSourceTable);
               FJoinExpressions.Add(TempJoinExpression);
               end
            else if CheckTokenSymbol(PARSE_INNER) then
               begin
               FJoinedResult:=True;
               NextToken;
               ErrorIfNotSymbol(PARSE_JOIN);
               NextToken;
               TempSourceTable:=TSourceTable.Create(Self);
               FSourceTables.Add(TempSourceTable);
               TempSourceTable.OutputOrder:=NextTableOrder;
               Inc(NextTableOrder);
               TempSourceTable.Line:=CurLine;
               TempSourceTable.Column:=CurColumn;
               TempSourceTable.TableName:=ParseTableName;
               if CheckTokenSymbol(PARSE_AS) then
                  begin
                  NextToken;
                  if not TokenIsSymbol then
                     ExpectedExpressionError('table correlation name',False);
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end
               else if TokenIsSymbol and
                       ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                        (not CheckTokenSymbol(PARSE_ON))) then
                  begin
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end;
               if CheckTokenSymbol(PARSE_EXCLUSIVE) then
                  begin
                  TempSourceTable.Exclusive:=True;
                  NextToken;
                  end;
               CheckForDuplicateSourceTable(TempSourceTable.AliasName,
                                            TempSourceTable);
               ErrorIfNotSymbol(PARSE_ON);
               NextToken;
               TempJoinExpression:=TJoinExpression.Create(Self,jtInner,
                                                          ParseJoinExpression,
                                                          TempSourceTable);
               FJoinExpressions.Add(TempJoinExpression);
               end
            else if CheckTokenSymbol(PARSE_LEFT) then
               begin
               FJoinedResult:=True;
               NextToken;
               if CheckTokenSymbol(PARSE_OUTER) then
                  NextToken;
               ErrorIfNotSymbol(PARSE_JOIN);
               NextToken;
               TempSourceTable:=TSourceTable.Create(Self);
               FSourceTables.Add(TempSourceTable);
               TempSourceTable.OutputOrder:=NextTableOrder;
               Inc(NextTableOrder);
               TempSourceTable.Line:=CurLine;
               TempSourceTable.Column:=CurColumn;
               TempSourceTable.TableName:=ParseTableName;
               if CheckTokenSymbol(PARSE_AS) then
                  begin
                  NextToken;
                  if not TokenIsSymbol then
                     ExpectedExpressionError('table correlation name',False);
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end
               else if TokenIsSymbol and
                       ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                        (not CheckTokenSymbol(PARSE_ON))) then
                  begin
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end;
               if CheckTokenSymbol(PARSE_EXCLUSIVE) then
                  begin
                  TempSourceTable.Exclusive:=True;
                  NextToken;
                  end;
               CheckForDuplicateSourceTable(TempSourceTable.AliasName,
                                            TempSourceTable);
               ErrorIfNotSymbol(PARSE_ON);
               NextToken;
               TempJoinExpression:=TJoinExpression.Create(Self,jtLeftOuter,
                                                          ParseJoinExpression,
                                                          TempSourceTable);
               FJoinExpressions.Add(TempJoinExpression);
               end
            else if CheckTokenSymbol(PARSE_RIGHT) then
               begin
               FJoinedResult:=True;
               NextToken;
               if CheckTokenSymbol(PARSE_OUTER) then
                  NextToken;
               ErrorIfNotSymbol(PARSE_JOIN);
               NextToken;
               TempSourceTable:=TSourceTable.Create(Self);
               FSourceTables.Add(TempSourceTable);
               TempSourceTable.OutputOrder:=NextTableOrder;
               Inc(NextTableOrder);
               TempSourceTable.Line:=CurLine;
               TempSourceTable.Column:=CurColumn;
               TempSourceTable.TableName:=ParseTableName;
               if CheckTokenSymbol(PARSE_AS) then
                  begin
                  NextToken;
                  if not TokenIsSymbol then
                     ExpectedExpressionError('table correlation name',False);
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end
               else if TokenIsSymbol and
                       ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                        (not CheckTokenSymbol(PARSE_ON))) then
                  begin
                  TempSourceTable.AliasName:=TokenAsString;
                  NextToken;
                  end;
               if CheckTokenSymbol(PARSE_EXCLUSIVE) then
                  begin
                  TempSourceTable.Exclusive:=True;
                  NextToken;
                  end;
               CheckForDuplicateSourceTable(TempSourceTable.AliasName,
                                            TempSourceTable);
               ErrorIfNotSymbol(PARSE_ON);
               NextToken;
               TempJoinExpression:=TJoinExpression.Create(Self,jtRightOuter,
                                                          ParseJoinExpression,
                                                          TempSourceTable);
               FJoinExpressions.Add(TempJoinExpression);
               end
            else if CheckTokenSymbol(PARSE_FULL) then
               InvalidExpressionError(False)
            else
               Break;
            if (NumJoinParens > 0) then
               begin
               while CheckToken(PARSE_RIGHTPAREN) and (NumJoinParens > 0) do
                  begin
                  NextToken;
                  Dec(NumJoinParens);
                  end;
               end;
            end;
         if (NumJoinParens > 0) then
            ExpectedExpressionError(PARSE_RIGHTPAREN,False);
         end;
      end;
end;

procedure TDataQuery.ParseMerge;
var
   TempMergeQuery: TDataQuery;
   FoundMerges: Boolean;
begin
   with FQueryStatement.ExpressionParser do
      begin
      FoundMerges:=False;
      { Check for a UNION clause }
      while CheckTokenSymbol(PARSE_UNION) or
            CheckTokenSymbol(PARSE_INTERSECT) or
            CheckTokenSymbol(PARSE_EXCEPT) do
         begin
         FoundMerges:=True;
         if FOrderedResult and (not FAutoOrderedResult) then
            InvalidExpressionError(False);
         TempMergeQuery:=TDataQuery.Create(FQueryStatement);
         AddMergeQuery(TempMergeQuery);
         with TempMergeQuery do
            begin
            WantLiveResult:=True;
            if CheckTokenSymbol(PARSE_UNION) then
               begin
               NextToken;
               if CheckTokenSymbol(PARSE_ALL) then
                  begin
                  MergeType:=mtUnionAll;
                  NextToken;
                  end
               else if CheckTokenSymbol(PARSE_DISTINCT) then
                  begin
                  MergeType:=mtUnion;
                  NextToken;
                  end
               else
                  MergeType:=mtUnion;
               end
            else if CheckTokenSymbol(PARSE_INTERSECT) then
               begin
               NextToken;
               if CheckTokenSymbol(PARSE_ALL) then
                  begin
                  MergeType:=mtIntersectAll;
                  NextToken;
                  end
               else if CheckTokenSymbol(PARSE_DISTINCT) then
                  begin
                  MergeType:=mtIntersect;
                  NextToken;
                  end
               else
                  MergeType:=mtIntersect;
               end
            else if CheckTokenSymbol(PARSE_EXCEPT) then
               begin
               NextToken;
               if CheckTokenSymbol(PARSE_ALL) then
                  begin
                  MergeType:=mtExceptAll;
                  NextToken;
                  end
               else if CheckTokenSymbol(PARSE_DISTINCT) then
                  begin
                  MergeType:=mtExcept;
                  NextToken;
                  end
               else
                  MergeType:=mtExcept;
               end;
            ObjectContext:=TempMergeQuery;
            try
               ParseQuery(Self);
            finally
               ObjectContext:=Self;
            end;
            end;
         end;
      if FoundMerges then
         begin
         ParseOrderBy;
         ParseSelectExtensions;
         end;
      end;
end;

procedure TDataQuery.ParseSelectQuery;
var
   TempSourceTable: TSourceTable;
   TempResultField: TResultField;
   NextOutputOrder: Word;
   NumJoinParens: Word;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Version 5}
      { Handle @@IDENTITY queries for the ODBC driver }
      if CheckToken(PARSE_ATSIGN) then
         begin
         NextToken;
         ErrorIfNotSkipToken(PARSE_ATSIGN);
         ErrorIfNotSymbol(PARSE_IDENTITY);
         NextToken;
         FIdentityOnly:=True;
         ParseTerm;
         end
      { Version 5}
      else
         begin
         if CheckTokenSymbol(PARSE_ALL) then
            NextToken;
         { Check for DISTINCT keyword and set flag for a distinct
           result set }
         if CheckTokenSymbol(PARSE_DISTINCT) then
            begin
            FDistinctResult:=True;
            NextToken;
            end;
         { Parse source fields list from SQL Select statement }
         while True do
            begin
            TempResultField:=TResultField.Create(Self);
            FResultFields.Add(TempResultField);
            ParseSelectColumnExpression(TempResultField);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end;
         if (FResultFields.Count=1) and (TResultField(FResultFields[0]).FieldName=PARSE_ASTERISK) then
            FSelectAllColumns:=True;
         ParseInto;
         ErrorIfNotSymbol(PARSE_FROM);
         NextToken;
         { Parse source tables list from SQL Select statement }
         NextOutputOrder:=1;
         NumJoinParens:=0;
         while True do
            begin
            ParseJoinLeftParens(NumJoinParens);
            TempSourceTable:=TSourceTable.Create(Self);
            FSourceTables.Add(TempSourceTable);
            TempSourceTable.OutputOrder:=NextOutputOrder;
            Inc(NextOutputOrder);
            TempSourceTable.Line:=CurLine;
            TempSourceTable.Column:=CurColumn;
            TempSourceTable.TableName:=ParseTableName;
            if CheckTokenSymbol(PARSE_AS) then
               begin
               NextToken;
               if not TokenIsSymbol then
                  ExpectedExpressionError('table correlation name',False);
               TempSourceTable.AliasName:=TokenAsString;
               NextToken;
               end
            else
               begin
               { Check to see if the table name is qualified with an
                 alias after the table name }
               if TokenIsSymbol and
                  ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                   (not CheckTokenSymbol(PARSE_LEFT)) and
                   (not CheckTokenSymbol(PARSE_RIGHT)) and
                   (not CheckTokenSymbol(PARSE_INNER)) and
                   (not CheckTokenSymbol(PARSE_JOIN)) and
                   (not CheckTokenSymbol(PARSE_WHERE)) and
                   (not CheckTokenSymbol(PARSE_ORDER)) and
                   (not CheckTokenSymbol(PARSE_GROUP)) and
                   (not CheckTokenSymbol(PARSE_HAVING)) and
                   (not CheckTokenSymbol(PARSE_TOP)) and
                   (not CheckTokenSymbol(PARSE_RANGE)) and
                   (not CheckTokenSymbol(PARSE_ENCRYPTED)) and
                   (not CheckTokenSymbol(PARSE_LOCALE)) and
                   (not CheckTokenSymbol(PARSE_NOJOINOPTIMIZE)) and
                   (not CheckTokenSymbol(PARSE_UNION)) and
                   (not CheckTokenSymbol(PARSE_INTERSECT)) and
                   (not CheckTokenSymbol(PARSE_EXCEPT))) then
                  begin
                  if (FSubSelectType=stInsertSelect) then
                     begin
                     if (not CheckTokenSymbol(PARSE_COMMIT)) then
                        begin
                        TempSourceTable.AliasName:=TokenAsString;
                        NextToken;
                        end;
                     end
                  else
                     begin
                     TempSourceTable.AliasName:=TokenAsString;
                     NextToken;
                     end;
                  end;
               if CheckTokenSymbol(PARSE_EXCLUSIVE) then
                  begin
                  TempSourceTable.Exclusive:=True;
                  NextToken;
                  end;
               end;
            CheckForDuplicateSourceTable(TempSourceTable.AliasName,
                                         TempSourceTable);
            ParseJoins(NextOutputOrder,NumJoinParens);
            if CheckToken(PARSE_SEPARATOR) then
               { Flag result set as being joined since we're dealing
                 with more than one table }
               begin
               FJoinedResult:=True;
               NextToken;
               end
            else
               Break;
            end;
         ParseWhere;
         ParseGroupBy;
         ParseHaving;
         if (MergeType=mtNone) then
            ParseOrderBy;
         ParseSelectExtensions;
         if FUsingParentheses then
            ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
         if (MergeType=mtNone) then
            begin
            if (not FOrderedResult) or
               (FOrderedResult and FAutoOrderedResult) then
               ParseMerge;
            if (FSubSelectType=stNone) then
               ParseTerm;
            end;
         end;
      end;
end;

procedure TDataQuery.ParseWhere;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_WHERE) then
         begin
         FHasWhereExpression:=True;
         NextToken;
         FWhereExpressionTokens:=ParseWhereExpression(True);
         end;
      end;
end;

procedure TDataQuery.ParseGroupBy;
var
   TempGroupByField: TGroupByField;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_GROUP) then
         begin
         NextToken;
         { Make sure that the next token is the proper BY keyword }
         ErrorIfNotSymbol(PARSE_BY);
         NextToken;
         { Set flag to indicate that a GROUP BY statement exists }
         FGroupedResult:=True;
         { Parse group by list from SQL Select statement }
         while True do
            begin
            TempGroupByField:=TGroupByField.Create(Self);
            FGroupByFields.Add(TempGroupByField);
            ParseGroupByFieldExpression(TempGroupByField);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end;
         end;
      end;
end;

procedure TDataQuery.ParseHaving;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_HAVING) then
         begin
         NextToken;
         FHasHavingExpression:=True;
         FHavingResult:=True;
         ParseHavingExpression;
         end;
      end;
end;

procedure TDataQuery.ParseOrderBy;
var
   TempOrderByField: TOrderByField;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_ORDER) then
         begin
         { Mark the save token position for later error
           processing in the case of a merged query with an
           ORDER BY }
         MarkSaveToken;
         NextToken;
         { Make sure that the next token is the proper BY keyword }
         ErrorIfNotSymbol(PARSE_BY);
         NextToken;
         { Set flag to indicate that an ORDER BY statement exists }
         FOrderedResult:=True;
         { Parse order by list from SQL Select statement }
         while True do
            begin
            TempOrderByField:=TOrderByField.Create(Self);
            FOrderByFields.Add(TempOrderByField);
            ParseOrderByFieldExpression(TempOrderByField);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end;
         if CheckTokenSymbol(PARSE_NOCASE) then
            begin
            FOrderByCaseInsensitive:=True;
            NextToken;
            end;
         end
      else
         begin
         { If there's no ORDER BY and we've got a sub-select, then create
           a dummy ORDER BY so that the sub-select searching is optimized }
         if (FSubSelectType=stSubSelect) and
            (not FAutoOrderedResult) then
            begin
            FOrderedResult:=True;
            FAutoOrderedResult:=True;
            FOrderByCaseInsensitive:=False;
            TempOrderByField:=TOrderByField.Create(Self);
            FOrderByFields.Add(TempOrderByField);
            with TempOrderByField do
               begin
               ExpressionLiteral:='1';
               ExpressionTokens:=TExpToken.Create;
               ExpressionTokens.DataType:=TYPE_INT32;
               ExpressionTokens.DataSize:=TYPE_INT32_SIZE;
               pInteger(ExpressionTokens.Value)^:=1;
               FieldNum:=ConvertToInteger(ExpressionTokens.DataType,
                                          ExpressionTokens.Value);
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.ParseTop;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for TOP n clause }
      if CheckTokenSymbol(PARSE_TOP) then
         begin
         NextToken;
         if CheckToken(TOKEN_INTEGER) then
            begin
            FTopRows:=StrToInt(TokenAsString);
            NextToken;
            end
         else
            ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
         end;
      end;
end;

procedure TDataQuery.ParseLocale;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for LOCALE keyword }
      if CheckTokenSymbol(PARSE_LOCALE) then
         begin
         NextToken;
         if CheckTokenSymbol(PARSE_CODE) then
            begin
            NextToken;
            if (CheckToken(TOKEN_INTEGER) and DataEngine.IsValidLocale(StrToInt(TokenAsString))) then
               begin
               FLocaleID:=StrToInt(TokenAsString);
               FLocaleIDSet:=True;
               NextToken;
               end
            else
               ExpectedExpressionError('locale code',False);
            end
         else
            begin
            if TokenIsSymbol and DataEngine.IsValidLocaleConstant(TokenAsString) then
               begin
               FLocaleID:=DataEngine.ConvertLocaleConstantToID(TokenAsString);
               FLocaleIDSet:=True;
               NextToken;
               end
            else
               ExpectedExpressionError('locale constant',False);
            end;
         end;
      end;
end;

procedure TDataQuery.ParseEncrypted;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for ENCRYPTED WITH clause }
      if CheckTokenSymbol(PARSE_ENCRYPTED) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_WITH);
         NextToken;
         if CheckToken(TOKEN_SINGLESTRING) then
            begin
            FEncrypted:=True;
            FEncryptionPassword:=TokenAsString;
            if (FEncryptionPassword='') then
               FEncrypted:=False;
            FEncryptedSet:=True;
            NextToken;
            end
         else
            ExpectedExpressionError(DBISAM_TYPESTR_ZSTRING,False);
         end;
      end;
end;

procedure TDataQuery.ParseNoJoinOptimize;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for NOJOINOPTIMIZE clause }
      if CheckTokenSymbol(PARSE_NOJOINOPTIMIZE) then
         begin
         NextToken;
         FNoJoinOptimizations:=True;
         end;
      end;
end;

procedure TDataQuery.ParseJoinOptimizeCosts;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for JOINOPTIMIZECOSTS clause }
      if CheckTokenSymbol(PARSE_JOINOPTIMIZECOSTS) then
         begin
         NextToken;
         FJoinOptimizeCosts:=True;
         end;
      end;
end;

procedure TDataQuery.ParseSelectExtensions;
begin
   ParseTop;
   ParseLocale;
   ParseEncrypted;
   ParseNoJoinOptimize;
   ParseJoinOptimizeCosts;
end;

procedure TDataQuery.ParseCommitInterval;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for COMMIT INTERVAL or FLUSH keywords }
      if CheckTokenSymbol(PARSE_COMMIT) then
         begin
         NextToken;
         if CheckTokenSymbol(PARSE_INTERVAL) then
            begin
            NextToken;
            if CheckToken(TOKEN_INTEGER) then
               begin
               FCommitInterval:=StrToInt(TokenAsString);
               FCommitIntervalSet:=True;
               NextToken;
               if CheckTokenSymbol(PARSE_FLUSH) then
                  begin
                  NextToken;
                  FCommitFlush:=True;
                  end;
               end
            else
               ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
            end
         else if CheckTokenSymbol(PARSE_FLUSH) then
            begin
            NextToken;
            FCommitFlush:=True;
            end
         else
            ExpectedExpressionError(PARSE_INTERVAL+' and/or '+PARSE_FLUSH,False);
         end;
      end;
end;

procedure TDataQuery.ParseInsertExtensions;
begin
   ParseCommitInterval;
end;

procedure TDataQuery.ParseUpdateExtensions;
begin
   ParseCommitInterval;
   ParseNoJoinOptimize;
   ParseJoinOptimizeCosts;
end;

procedure TDataQuery.ParseDeleteExtensions;
begin
   ParseCommitInterval;
   ParseNoJoinOptimize;
   ParseJoinOptimizeCosts;
end;

procedure TDataQuery.ParseInsertQuery;
var
   TempSubSelectQuery: TDataQuery;
   TempSourceTable: TSourceTable;
   TempUpdateField: TUpdateField;
   TempUpdateDataValue: TUpdateValue;
   NextOutputOrder: Word;
begin
   with FQueryStatement.ExpressionParser do
      begin
      FWantLiveResult:=True;
      ErrorIfNotSymbol(PARSE_INTO);
      NextToken;
      NextOutputOrder:=1;
      TempSourceTable:=TSourceTable.Create(Self);
      FSourceTables.Add(TempSourceTable);
      TempSourceTable.OutputOrder:=NextOutputOrder;
      TempSourceTable.Line:=CurLine;
      TempSourceTable.Column:=CurColumn;
      TempSourceTable.TableName:=ParseTableName;
      { Check to see if the table name is qualified with an
        alias after the table name }
      if CheckTokenSymbol(PARSE_AS) then
         begin
         NextToken;
         if not TokenIsSymbol then
            ExpectedExpressionError('table correlation name',False);
         TempSourceTable.AliasName:=TokenAsString;
         NextToken;
         end
      else if TokenIsSymbol and
          ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
           (not CheckTokenSymbol(PARSE_VALUES)) and
           (not CheckTokenSymbol(PARSE_SELECT)) and
           (not CheckToken(PARSE_LEFTPAREN))) then
         begin
         TempSourceTable.AliasName:=TokenAsString;
         NextToken;
         end;
      if CheckTokenSymbol(PARSE_EXCLUSIVE) then
         begin
         TempSourceTable.Exclusive:=True;
         NextToken;
         end;
      if CheckToken(PARSE_LEFTPAREN) then
         begin
         NextToken;
         if (not CheckTokenSymbol(PARSE_SELECT)) then
            begin
            { Parse update fields list from SQL INSERT statement }
            while True do
               begin
               TempUpdateField:=TUpdateField.Create(Self);
               FUpdateFields.Add(TempUpdateField);
               ParseUpdateColumnExpression(TempUpdateField);
               if CheckToken(PARSE_SEPARATOR) then
                  NextToken
               else
                  Break;
               end;
            ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
            end
         else
            begin
            MarkSaveToken;
            TempUpdateField:=TUpdateField.Create(Self);
            FUpdateFields.Add(TempUpdateField);
            TempUpdateField.FieldName:=PARSE_ALLFIELDS;
            TempUpdateField.ExpressionTokens:=GetNewExpToken;
            TempUpdateField.ExpressionTokens.FieldName:=PARSE_ALLFIELDS;
            end;
         end
      else
         begin
         MarkSaveToken;
         TempUpdateField:=TUpdateField.Create(Self);
         FUpdateFields.Add(TempUpdateField);
         TempUpdateField.FieldName:=PARSE_ALLFIELDS;
         TempUpdateField.ExpressionTokens:=GetNewExpToken;
         TempUpdateField.ExpressionTokens.FieldName:=PARSE_ALLFIELDS;
         end;
      if CheckTokenSymbol(PARSE_VALUES) then
         begin
         NextToken;
         ErrorIfNotSkipToken(PARSE_LEFTPAREN);
         { Parse update values list from SQL INSERT statement }
         while True do
            begin
            TempUpdateDataValue:=TUpdateValue.Create(Self);
            FUpdateValues.Add(TempUpdateDataValue);
            ParseUpdateValueExpression(TempUpdateDataValue,
                                       [pmAllowParameters,pmAllowExtPredicates]);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end;
         ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
         end
      else if CheckTokenSymbol(PARSE_SELECT) then
         begin
         TempSubSelectQuery:=TDataQuery.Create(FQueryStatement);
         AddSubQuery(TempSubSelectQuery);
         with TempSubSelectQuery do
            begin
            WantLiveResult:=True;
            SubSelectType:=stInsertSelect;
            ObjectContext:=TempSubSelectQuery;
            try
               ParseQuery(Self);
            finally
               ObjectContext:=Self;
            end;
            end;
         end
      else
         ExpectedExpressionError(PARSE_VALUES+' or '+PARSE_SELECT,False);
      ParseInsertExtensions;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseUpdateQuery;
var
   TempSourceTable: TSourceTable;
   TempUpdateField: TUpdateField;
   TempUpdateDataValue: TUpdateValue;
   NextOutputOrder: Word;
   FirstTable: Boolean;
   TempString: string;
   NumJoinParens: Word;
begin
   with FQueryStatement.ExpressionParser do
      begin
      FWantLiveResult:=True;
      NextOutputOrder:=1;
      TempSourceTable:=nil;
      NumJoinParens:=0;
      { Need to retrieve the table name as a string }
      if TokenIsSymbol then
         begin
         TempSourceTable:=TSourceTable.Create(Self);
         FSourceTables.Add(TempSourceTable);
         TempSourceTable.OutputOrder:=NextOutputOrder;
         Inc(NextOutputOrder);
         TempSourceTable.Line:=CurLine;
         TempSourceTable.Column:=CurColumn;
         TempSourceTable.TableName:=ParseTableName;
         if CheckTokenSymbol(PARSE_AS) then
            begin
            NextToken;
            if not TokenIsSymbol then
               ExpectedExpressionError('table correlation name',False);
            TempSourceTable.AliasName:=TokenAsString;
            NextToken;
            end
         else
            begin
            { Check to see if the table name is qualified with an
              alias after the table name }
            if TokenIsSymbol and
               ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                (not CheckTokenSymbol(PARSE_SET))) then
               begin
               TempSourceTable.AliasName:=TokenAsString;
               NextToken;
               end;
            end;
         if CheckTokenSymbol(PARSE_EXCLUSIVE) then
            begin
            TempSourceTable.Exclusive:=True;
            NextToken;
            end;
         end
      else
         ExpectedExpressionError('table name',False);
      ErrorIfNotSymbol(PARSE_SET);
      NextToken;
      { Parse update fields and values list from SQL UPDATE statement }
      while True do
         begin
         TempUpdateField:=TUpdateField.Create(Self);
         FUpdateFields.Add(TempUpdateField);
         ParseUpdateColumnExpression(TempUpdateField);
         ErrorIfNotSkipToken(PARSE_EQUAL);
         TempUpdateDataValue:=TUpdateValue.Create(Self);
         FUpdateValues.Add(TempUpdateDataValue);
         ParseUpdateValueExpression(TempUpdateDataValue,
                                    [pmAllowParameters,pmAllowExtPredicates,
                                     pmAllowTableQualifier]);
         if CheckToken(PARSE_SEPARATOR) then
            NextToken
         else
            Break;
         end;
      FirstTable:=True;
      { We're now done with the mandatory keywords for the UPDATE
        statement, so the rest is optional }
      if CheckTokenSymbol(PARSE_FROM) then
         begin
         NextToken;
         { Parse source tables list from SQL UPDATE statement }
         while True do
            begin
            ParseJoinLeftParens(NumJoinParens);
            MarkSaveToken;
            if (not FirstTable) then
               begin
               TempSourceTable:=TSourceTable.Create(Self);
               FSourceTables.Add(TempSourceTable);
               TempSourceTable.OutputOrder:=NextOutputOrder;
               Inc(NextOutputOrder);
               TempSourceTable.Line:=CurLine;
               TempSourceTable.Column:=CurColumn;
               TempSourceTable.TableName:=ParseTableName;
               end
            else
               begin
               TempString:=ParseTableName;
               if (OSCompareFileNames(StripFilePathAndExtension(TempString,DataEngine.DataExtension),
                                      TempSourceTable.TableName) <> 0) then
                  ExpectedExpressionError('UPDATE table name',True);
               end;
            if CheckTokenSymbol(PARSE_AS) then
               begin
               NextToken;
               if not TokenIsSymbol then
                  ExpectedExpressionError('table correlation name',False);
               if (not FirstTable) then
                  TempSourceTable.AliasName:=TokenAsString
               else
                  begin
                  if (OSCompareFileNames(TokenAsString,TempSourceTable.AliasName) <> 0) then
                     ExpectedExpressionError('UPDATE table correlation name',False);
                  end;
               NextToken;
               end
            else
               begin
               { Check to see if the table name is qualified with an
                 alias after the table name }
               if TokenIsSymbol and
                  ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                   (not CheckTokenSymbol(PARSE_LEFT)) and
                   (not CheckTokenSymbol(PARSE_RIGHT)) and
                   (not CheckTokenSymbol(PARSE_INNER)) and
                   (not CheckTokenSymbol(PARSE_JOIN)) and
                   (not CheckTokenSymbol(PARSE_WHERE)) and
                   (not CheckTokenSymbol(PARSE_COMMIT)) and
                   (not CheckTokenSymbol(PARSE_NOJOINOPTIMIZE))) then
                  begin
                  if (not FirstTable) then
                     TempSourceTable.AliasName:=TokenAsString
                  else
                     begin
                     if (OSCompareFileNames(TokenAsString,TempSourceTable.AliasName) <> 0) then
                        ExpectedExpressionError('UPDATE table correlation name',False);
                     end;
                  NextToken;
                  end;
               end;
            if CheckTokenSymbol(PARSE_EXCLUSIVE) then
               begin
               TempSourceTable.Exclusive:=True;
               NextToken;
               end;
            CheckForDuplicateSourceTable(TempSourceTable.AliasName,
                                         TempSourceTable);
            FirstTable:=False;
            ParseJoins(NextOutputOrder,NumJoinParens);
            if CheckToken(PARSE_SEPARATOR) then
               { Flag result set as being joined since we're dealing
                 with more than one table }
               begin
               FJoinedResult:=True;
               NextToken;
               end
            else
               Break;
            end;
         end;
      ParseWhere;
      ParseUpdateExtensions;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseDeleteQuery;
var
   TempSourceTable: TSourceTable;
   NextOutputOrder: Word;
   TempString: string;
   NumJoinParens: Word;
begin
   with FQueryStatement.ExpressionParser do
      begin
      FWantLiveResult:=True;
      NextOutputOrder:=1;
      NumJoinParens:=0;
      ErrorIfNotSymbol(PARSE_FROM);
      NextToken;
      { Parse source tables list from SQL DELETE statement }
      while True do
         begin
         ParseJoinLeftParens(NumJoinParens);
         TempString:=ParseTableName;
         TempSourceTable:=TSourceTable.Create(Self);
         FSourceTables.Add(TempSourceTable);
         TempSourceTable.OutputOrder:=NextOutputOrder;
         Inc(NextOutputOrder);
         TempSourceTable.TableName:=TempString;
         if CheckTokenSymbol(PARSE_AS) then
            begin
            NextToken;
            if not TokenIsSymbol then
               ExpectedExpressionError('table correlation name',False);
            TempSourceTable.AliasName:=TokenAsString;
            NextToken;
            end
         else
            begin
            { Check to see if the table name is qualified with an
              alias after the table name }
            if TokenIsSymbol and
               ((not CheckTokenSymbol(PARSE_EXCLUSIVE)) and
                (not CheckTokenSymbol(PARSE_LEFT)) and
                (not CheckTokenSymbol(PARSE_RIGHT)) and
                (not CheckTokenSymbol(PARSE_INNER)) and
                (not CheckTokenSymbol(PARSE_JOIN)) and
                (not CheckTokenSymbol(PARSE_WHERE)) and
                (not CheckTokenSymbol(PARSE_COMMIT)) and
                (not CheckTokenSymbol(PARSE_NOJOINOPTIMIZE))) then
               begin
               TempSourceTable.AliasName:=TokenAsString;
               NextToken;
               end;
            end;
         if CheckTokenSymbol(PARSE_EXCLUSIVE) then
            begin
            TempSourceTable.Exclusive:=True;
            NextToken;
            end;
         CheckForDuplicateSourceTable(TempSourceTable.AliasName,
                                      TempSourceTable);
         ParseJoins(NextOutputOrder,NumJoinParens);
         if CheckToken(PARSE_SEPARATOR) then
            { Flag result set as being joined since we're dealing
              with more than one table }
            begin
            FJoinedResult:=True;
            NextToken;
            end
         else
            Break;
         end;
      ParseWhere;
      ParseDeleteExtensions;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseTextIndex;
var
   TempString: string;
   TempCreateIndexField: TCreateIndexField;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for TEXTINDEX clause }
      if CheckTokenSymbol(PARSE_TEXT) then
         begin
         NextToken;
         FCreateTextIndex:=TCreateIndex.Create(Self);
         ErrorIfNotSymbol(PARSE_INDEX);
         NextToken;
         ErrorIfNotSkipToken(PARSE_LEFTPAREN);
         if (not SkipToken(PARSE_RIGHTPAREN)) then
            begin
            while True do
               begin
               TempCreateIndexField:=TCreateIndexField.Create(Self);
               FCreateTextIndex.FieldsList.Add(TempCreateIndexField);
               ParseCreateIndexFieldExpression(TempCreateIndexField,False);
               if CheckToken(PARSE_SEPARATOR) then
                  NextToken
               else
                  Break;
               end;
            ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
            end;
         if CheckTokenSymbol(PARSE_STOP) then
            begin
            NextToken;
            ErrorIfNotSymbol(PARSE_WORDS);
            NextToken;
            TempString:=ParseCreateStopWordsExpression;
            StringToList(TempString,' ',FStopWords);
            FStopWordsSet:=True;
            end;
         if CheckTokenSymbol(PARSE_SPACE) then
            begin
            NextToken;
            ErrorIfNotSymbol(PARSE_CHARS);
            NextToken;
            FSpaceChars:=StringToCharSet(ParseCreateCharSetExpression);
            { Version 5}
            FSpaceCharsSet:=True;
            { Version 5}
            end;
         if CheckTokenSymbol(PARSE_INCLUDE) then
            begin
            NextToken;
            ErrorIfNotSymbol(PARSE_CHARS);
            NextToken;
            FIncludeChars:=StringToCharSet(ParseCreateCharSetExpression);
            { Version 5}
            FIncludeCharsSet:=True;
            { Version 5}
            end;
         end;
      end;
end;

procedure TDataQuery.ParseDescription;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for DESCRIPTION clause }
      if CheckTokenSymbol(PARSE_DESCRIPTION) then
         begin
         NextToken;
         FDescription:=TokenAsString;
         FDescriptionSet:=True;
         NextToken;
         end;
      end;
end;

procedure TDataQuery.ParseIndexPageSize;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for INDEX PAGE SIZE keyword }
      if CheckTokenSymbol(PARSE_INDEX) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_PAGE);
         NextToken;
         ErrorIfNotSymbol(PARSE_SIZE);
         NextToken;
         if CheckToken(TOKEN_INTEGER) then
            begin
            FIndexPageSize:=StrToInt(TokenAsString);
            FIndexPageSizeSet:=True;
            NextToken;
            end
         else
            ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
         end;
      end;
end;

procedure TDataQuery.ParseBlobBlockSize;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for BLOB BLOCK SIZE keyword }
      if CheckTokenSymbol(PARSE_BLOB) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_BLOCK);
         NextToken;
         ErrorIfNotSymbol(PARSE_SIZE);
         NextToken;
         if CheckToken(TOKEN_INTEGER) then
            begin
            FBlobBlockSize:=StrToInt(TokenAsString);
            FBlobBlockSizeSet:=True;
            NextToken;
            end
         else
            ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
         end;
      end;
end;

procedure TDataQuery.ParseUserVersion;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for USER MAJOR VERSION clause }
      if CheckTokenSymbol(PARSE_USER) then
         begin
         NextToken;
         if CheckTokenSymbol(PARSE_MAJOR) then
            begin
            NextToken;
            ErrorIfNotSymbol(PARSE_VERSION);
            NextToken;
            if CheckToken(TOKEN_INTEGER) then
               begin
               FUserMajorVersion:=StrToInt(TokenAsString);
               FUserMajorVersionSet:=True;
               NextToken;
               end
            else
               ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
            end
         else if CheckTokenSymbol(PARSE_MINOR) then
            begin
            NextToken;
            ErrorIfNotSymbol(PARSE_VERSION);
            NextToken;
            if CheckToken(TOKEN_INTEGER) then
               begin
               FUserMinorVersion:=StrToInt(TokenAsString);
               FUserMinorVersionSet:=True;
               NextToken;
               end
            else
               ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
            end
         else
            ExpectedExpressionError(PARSE_MAJOR+' or '+PARSE_MINOR,False);
         end;
      end;
end;

procedure TDataQuery.ParseLastAutoInc;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for LAST AUTOINC keyword }
      if CheckTokenSymbol(PARSE_LAST) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_AUTOINC);
         NextToken;
         if (not CheckToken(TOKEN_INTEGER)) then
            ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
         FLastAutoInc:=StrToInt(TokenAsString);
         { Version 5 }
         FStructureAltered:=True;
         { Version 5 }
         NextToken;
         end;
      end;
end;

procedure TDataQuery.ParseNoBackup;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for NOBACKUP clause }
      if CheckTokenSymbol(PARSE_NOBACKUP) then
         begin
         NextToken;
         FNoBackups:=True;
         end;
      end;
end;

procedure TDataQuery.ParseCreateTableExtensions;
begin
   ParseTextIndex;
   ParseDescription;
   ParseIndexPageSize;
   ParseBlobBlockSize;
   ParseLocale;
   ParseEncrypted;
   ParseUserVersion;
   ParseUserVersion;
   ParseLastAutoInc;
end;

procedure TDataQuery.ParseIndexAttributes(CreateIndex: TCreateIndex);
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for UNIQUE keyword }
      if CheckTokenSymbol(PARSE_UNIQUE) then
         begin
         NextToken;
         CreateIndex.Unique:=True;
         end;
      { Check for NOCASE keyword }
      if CheckTokenSymbol(PARSE_NOCASE) then
         begin
         NextToken;
         CreateIndex.CaseInsensitive:=True;
         end;
      end;
end;

procedure TDataQuery.ParseIndexFields(CreateIndex: TCreateIndex);
var
   TempCreateIndexField: TCreateIndexField;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ErrorIfNotSkipToken(PARSE_LEFTPAREN);
      while True do
         begin
         TempCreateIndexField:=TCreateIndexField.Create(Self);
         CreateIndex.FieldsList.Add(TempCreateIndexField);
         ParseCreateIndexFieldExpression(TempCreateIndexField,True);
         if CheckToken(PARSE_SEPARATOR) then
            NextToken
         else
            Break;
         end;
      ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
      end;
end;

procedure TDataQuery.ParseIndexCompression(CreateIndex: TCreateIndex);
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for COMPRESS keyword }
      if CheckTokenSymbol(PARSE_COMPRESS) then
         begin
         NextToken;
         if CheckTokenSymbol(PARSE_FULL) then
            CreateIndex.CompressionLevel:=BOTH_COMPRESS
         else if CheckTokenSymbol(PARSE_DUPBYTE) then
            CreateIndex.CompressionLevel:=DUPBYTE_COMPRESS
         else if CheckTokenSymbol(PARSE_TRAILBYTE) then
            CreateIndex.CompressionLevel:=TRAILBYTE_COMPRESS
         else if CheckTokenSymbol(PARSE_NONE) then
            CreateIndex.CompressionLevel:=NO_COMPRESS
         else
            ExpectedExpressionError(PARSE_FULL+', '+PARSE_DUPBYTE+', '+
                                    PARSE_TRAILBYTE+', or '+PARSE_NONE,False);
         NextToken;
         end;
      end;
end;

procedure TDataQuery.ParseDelimiter;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_DELIMITER) then
         begin
         NextToken;
         FDelimiter:=ParseDelimiterExpression;
         end
      else
         FDelimiter:=',';
      end;
end;

procedure TDataQuery.ParseHeaders;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_WITH) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_HEADERS);
         NextToken;
         FHeaders:=True;
         end;
      end;
end;

procedure TDataQuery.ParseFields;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_COLUMNS) then
         begin
         NextToken;
         ErrorIfNotSkipToken(PARSE_LEFTPAREN);
         while True do
            begin
            if TokenIsSymbol then
               begin
               if (FFields=nil) then
                  FFields:=TStringList.Create;
               FFields.Add(TokenAsString);
               NextToken;
               end
            else
               ExpectedExpressionError('column name',False);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end;
         ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
         end;
      end;
end;

procedure TDataQuery.ParseFormats;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_DATE) then
         begin
         NextToken;
         if TokenIsString then
            begin
            FDateFormat:=TokenAsString;
            NextToken;
            end
         else
            ExpectedExpressionError('date format string',False);
         end;
      if CheckTokenSymbol(PARSE_TIME) then
         begin
         NextToken;
         if TokenIsString then
            begin
            FTimeFormat:=TokenAsString;
            NextToken;
            end
         else
            ExpectedExpressionError('time format string',False);
         end;
      if CheckTokenSymbol(PARSE_DECIMAL) then
         begin
         NextToken;
         FDecSeparator:=ParseDecSeparatorExpression;
         end;
      end;
end;

procedure TDataQuery.ParseIfExists;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for the IF EXISTS clause }
      if CheckTokenSymbol(PARSE_IF) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_EXISTS);
         NextToken;
         FOnlyIfExists:=True;
         end;
      end;
end;

procedure TDataQuery.ParseIfNotExists;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for the IF NOT EXISTS clause }
      if CheckTokenSymbol(PARSE_IF) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_NOT);
         NextToken;
         ErrorIfNotSymbol(PARSE_EXISTS);
         NextToken;
         FOnlyIfNotExists:=True;
         end;
      end;
end;

function TDataQuery.ParseTableName: string;
begin
   Result:='';
   with FQueryStatement.ExpressionParser do
      begin
      { Need to retrieve the table name as a string }
      if TokenIsSymbol then
         begin
         Result:=TokenAsString;
         NextToken;
         if CheckToken(PARSE_BACKSLASH) then
            begin
            NextToken;
            if TokenIsSymbol then
               begin
               Result:=Result+PARSE_BACKSLASH+TokenAsString;
               NextToken;
               end
            else
               ExpectedExpressionError('table name',False);
            end;
         end
      else
         ExpectedExpressionError('table name',False);
      end;
end;

procedure TDataQuery.ParseCreateTableQuery;
var
   TempCreateField: TCreateField;
   TempCreateIndex: TCreateIndex;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfNotExists;
      FResultTableName:=ParseTableName;
      ErrorIfNotSkipToken(PARSE_LEFTPAREN);
      { Parse create fields list from SQL CREATE TABLE statement }
      while True do
         begin
         if (not CheckTokenSymbol(PARSE_CONSTRAINT)) and
            (not CheckTokenSymbol(PARSE_PRIMARY)) and
            (not CheckTokenSymbol(PARSE_UNIQUE)) and
            (not CheckTokenSymbol(PARSE_NOCASE)) and
            (not CheckTokenSymbol(PARSE_TEXT)) and
            (not CheckTokenSymbol(PARSE_DESCRIPTION)) and
            (not CheckTokenSymbol(PARSE_BLOB)) and
            (not CheckTokenSymbol(PARSE_LOCALE)) and
            (not CheckTokenSymbol(PARSE_ENCRYPTED)) and
            (not CheckTokenSymbol(PARSE_USER)) and
            (not CheckToken(PARSE_RIGHTPAREN)) then
            begin
            TempCreateField:=TCreateField.Create(Self);
            FCreateFields.Add(TempCreateField);
            ParseCreateColumnExpression(TempCreateField,True);
            if (not CheckToken(PARSE_SEPARATOR)) then
               ParseCreateColumnAttributes(TempCreateField);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end
         else
            Break;
         end;
      { Check for primary key or primary key constraint }
      if CheckTokenSymbol(PARSE_CONSTRAINT) or
         CheckTokenSymbol(PARSE_PRIMARY) or
         CheckTokenSymbol(PARSE_UNIQUE) or
         CheckTokenSymbol(PARSE_NOCASE) then
         begin
         TempCreateIndex:=TCreateIndex.Create(Self);
         FCreateIndexes.Add(TempCreateIndex);
         TempCreateIndex.Line:=CurLine;
         TempCreateIndex.Column:=CurColumn;
         if CheckTokenSymbol(PARSE_CONSTRAINT) then
            begin
            NextToken;
            NextToken; { skip over constraint name }
            end;
         ParseIndexAttributes(TempCreateIndex);
         ErrorIfNotSymbol(PARSE_PRIMARY);
         NextToken;
         ErrorIfNotSymbol(PARSE_KEY);
         NextToken;
         ParseIndexFields(TempCreateIndex);
         ParseIndexCompression(TempCreateIndex);
         end;
      ParseCreateTableExtensions;
      ErrorIfNotSkipToken(PARSE_RIGHTPAREN);
      ParseTerm;
      end;
end;

function TDataQuery.ParseValidityCheck(FieldExpressionType: TFieldExpressionType): string;
var
   TempString: string;
begin
   Result:='';
   with FQueryStatement.ExpressionParser do
      begin
      if (CheckToken(TOKEN_SYMBOL) and
          (CheckTokenSymbol(PARSE_CURDATE) or
           CheckTokenSymbol(PARSE_CURTIME) or
           CheckTokenSymbol(PARSE_CURDATETIME) or
           CheckTokenSymbol(PARSE_CURGUID) or
           CheckTokenSymbol(PARSE_TRUE) or
           CheckTokenSymbol(PARSE_FALSE))) or
          CheckToken(TOKEN_SINGLESTRING) or
          CheckToken(TOKEN_INTEGER) or
          CheckToken(TOKEN_FLOAT) or
          CheckToken(PARSE_MINUS) or
          CheckToken(PARSE_PLUS) then
         begin
         if CheckToken(PARSE_MINUS) or
            CheckToken(PARSE_PLUS) then
            begin
            TempString:=TokenAsString;
            NextToken;
            end
         else
            TempString:='';
         Result:=TempString+TokenAsString;
         NextToken;
         end
      else
         begin
         case FieldExpressionType of
            feDefault:
               ExpectedExpressionError('default expression',False);
            feMinimum:
               ExpectedExpressionError('minimum expression',False);
            feMaximum:
               ExpectedExpressionError('maximum expression',False);
            end;
         end;
      end;
end;

procedure TDataQuery.ParseCreateIndexQuery;
var
   TempCreateIndex: TCreateIndex;
begin
   with FQueryStatement.ExpressionParser do
      begin
      TempCreateIndex:=TCreateIndex.Create(Self);
      FCreateIndexes.Add(TempCreateIndex);
      TempCreateIndex.Unique:=FUniqueIndex;
      TempCreateIndex.CaseInsensitive:=FNoCaseIndex;
      ParseIndexAttributes(TempCreateIndex);
      if (TempCreateIndex.Unique or TempCreateIndex.CaseInsensitive) then
         begin
         ErrorIfNotSymbol(PARSE_INDEX);
         NextToken;
         end;
      ParseIfNotExists;
      if TokenIsSymbol then
         begin
         TempCreateIndex.IndexName:=TokenAsString;
         NextToken;
         end
      else
         ExpectedExpressionError('index name',False);
      ErrorIfNotSymbol(PARSE_ON);
      NextToken;
      FResultTableName:=ParseTableName;
      ParseIndexFields(TempCreateIndex);
      ParseIndexCompression(TempCreateIndex);
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseAlterTableExtensions;
begin
   ParseTextIndex;
   ParseDescription;
   ParseIndexPageSize;
   ParseBlobBlockSize;
   ParseLocale;
   ParseEncrypted;
   ParseUserVersion;
   ParseUserVersion;
   ParseLastAutoInc;
   ParseNoBackup;
end;

procedure TDataQuery.ParseAlterTableQuery;
var
   TempCreateField: TCreateField;
   TempCreateIndex: TCreateIndex;
   IsAdding: Boolean;
   IsRedefining: Boolean;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      { Parse add, drop, and redefine fields list from SQL ALTER TABLE statement }
      while True do
         begin
         if (CheckTokenSymbol(PARSE_ADD) or CheckTokenSymbol(PARSE_REDEFINE) or
             CheckTokenSymbol(PARSE_DROP)) then
            begin
            IsAdding:=False;
            IsRedefining:=False;
            if CheckTokenSymbol(PARSE_ADD) or
               CheckTokenSymbol(PARSE_REDEFINE) then
               begin
               if CheckTokenSymbol(PARSE_ADD) then
                  IsAdding:=True
               else
                  IsRedefining:=True;
               NextToken;
               { Check for primary key or primary key constraint }
               if CheckTokenSymbol(PARSE_CONSTRAINT) or
                  CheckTokenSymbol(PARSE_PRIMARY) or
                  CheckTokenSymbol(PARSE_UNIQUE) or
                  CheckTokenSymbol(PARSE_NOCASE) then
                  begin
                  TempCreateIndex:=TCreateIndex.Create(Self);
                  FCreateIndexes.Add(TempCreateIndex);
                  TempCreateIndex.AddIndex:=IsAdding;
                  TempCreateIndex.RedefineIndex:=IsRedefining;
                  TempCreateIndex.Line:=CurLine;
                  TempCreateIndex.Column:=CurColumn;
                  if CheckTokenSymbol(PARSE_CONSTRAINT) then
                     begin
                     NextToken;
                     NextToken; { skip over constraint name }
                     end;
                  ParseIndexAttributes(TempCreateIndex);
                  ErrorIfNotSymbol(PARSE_PRIMARY);
                  NextToken;
                  ErrorIfNotSymbol(PARSE_KEY);
                  NextToken;
                  ParseIndexFields(TempCreateIndex);
                  ParseIndexCompression(TempCreateIndex);
                  end
               else
                  begin
                  if CheckTokenSymbol(PARSE_COLUMN) then
                     NextToken;
                  TempCreateField:=TCreateField.Create(Self);
                  TempCreateField.AddField:=IsAdding;
                  TempCreateField.RedefineField:=IsRedefining;
                  FCreateFields.Add(TempCreateField);
                  if TempCreateField.RedefineField then
                     begin
                     if CheckTokenSymbol(PARSE_IF) then
                        begin
                        NextToken;
                        ErrorIfNotSymbol(PARSE_EXISTS);
                        NextToken;
                        TempCreateField.OnlyIfExists:=True;
                        end;
                     end
                  else
                     begin
                     if CheckTokenSymbol(PARSE_IF) then
                        begin
                        NextToken;
                        ErrorIfNotSymbol(PARSE_NOT);
                        NextToken;
                        ErrorIfNotSymbol(PARSE_EXISTS);
                        NextToken;
                        TempCreateField.OnlyIfNotExists:=True;
                        end;
                     end;
                  if IsRedefining then
                     begin
                     ParseCreateColumnExpression(TempCreateField,False);
                     if (not (TokenAsString='')) and
                        (not CheckTokenSymbol(PARSE_AT)) and
                        (not CheckTokenSymbol(PARSE_DESCRIPTION)) and
                        (not CheckTokenSymbol(PARSE_NOT)) and
                        (not CheckTokenSymbol(PARSE_NULLABLE)) and
                        (not CheckTokenSymbol(PARSE_DEFAULT)) and
                        (not CheckTokenSymbol(PARSE_MIN)) and
                        (not CheckTokenSymbol(PARSE_MINIMUM)) and
                        (not CheckTokenSymbol(PARSE_MAX)) and
                        (not CheckTokenSymbol(PARSE_MAXIMUM)) and
                        (not CheckTokenSymbol(PARSE_CHARCASE)) and
                        (not CheckTokenSymbol(PARSE_COMPRESS)) and
                        (not CheckTokenSymbol(PARSE_TEXT)) and
                        (not CheckTokenSymbol(PARSE_STOP)) and
                        (not CheckTokenSymbol(PARSE_SPACE)) and
                        (not CheckTokenSymbol(PARSE_INCLUDE)) and
                        (not CheckTokenSymbol(PARSE_INDEX)) and
                        (not CheckTokenSymbol(PARSE_BLOB)) and
                        (not CheckTokenSymbol(PARSE_LOCALE)) and
                        (not CheckTokenSymbol(PARSE_ENCRYPTED)) and
                        (not CheckTokenSymbol(PARSE_USER)) and
                        (not CheckTokenSymbol(PARSE_LAST)) and
                        (not CheckTokenSymbol(PARSE_NOBACKUP)) and
                        (not CheckToken(PARSE_SEMICOLON)) and
                        (not CheckToken(PARSE_TERM)) and
                        (not CheckToken(PARSE_SEPARATOR)) then
                        ParseCreateColumnExpression(TempCreateField,False);
                     end
                  else
                     ParseCreateColumnExpression(TempCreateField,True);
                  if (not CheckToken(PARSE_SEPARATOR)) then
                     begin
                     if CheckTokenSymbol(PARSE_AT) then
                        begin
                        NextToken;
                        if CheckToken(TOKEN_INTEGER) then
                           begin
                           TempCreateField.AtPos:=StrToInt(TokenAsString);
                           NextToken;
                           end
                        else
                           ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
                        end;
                     ParseCreateColumnAttributes(TempCreateField);
                     end;
                  end;
               end
            else if CheckTokenSymbol(PARSE_DROP) then
               begin
               NextToken;
               { Check for primary key or primary key constraint }
               if CheckTokenSymbol(PARSE_CONSTRAINT) or
                  CheckTokenSymbol(PARSE_PRIMARY) then
                  begin
                  TempCreateIndex:=TCreateIndex.Create(Self);
                  FCreateIndexes.Add(TempCreateIndex);
                  TempCreateIndex.DropIndex:=True;
                  TempCreateIndex.Line:=CurLine;
                  TempCreateIndex.Column:=CurColumn;
                  if CheckTokenSymbol(PARSE_CONSTRAINT) then
                     begin
                     NextToken;
                     NextToken; { skip over constraint name }
                     end;
                  ErrorIfNotSymbol(PARSE_PRIMARY);
                  NextToken;
                  ErrorIfNotSymbol(PARSE_KEY);
                  NextToken;
                  end
               else
                  begin
                  if CheckTokenSymbol(PARSE_COLUMN) then
                     NextToken;
                  TempCreateField:=TCreateField.Create(Self);
                  TempCreateField.DropField:=True;
                  FCreateFields.Add(TempCreateField);
                  if CheckTokenSymbol(PARSE_IF) then
                     begin
                     NextToken;
                     ErrorIfNotSymbol(PARSE_EXISTS);
                     NextToken;
                     TempCreateField.OnlyIfExists:=True;
                     end;
                  ParseCreateColumnExpression(TempCreateField,False);
                  end;
               end
            else
               ExpectedExpressionError(PARSE_ADD+', '+PARSE_DROP+', or '+
                                       PARSE_REDEFINE,False);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end
         else
            Break;
         end;
      ParseAlterTableExtensions;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseEmptyTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseOptimizeTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      if CheckTokenSymbol(PARSE_ON) then
         begin
         NextToken;
         if TokenIsSymbol then
            begin
            FResultIndexName:=TokenAsString;
            NextToken;
            end
         else
            ExpectedExpressionError('index name',False);
         end
      else
         FResultIndexName:='';
      ParseNoBackup;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseExportTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      if CheckTokenSymbol(PARSE_EXCLUSIVE) then
         begin
         FResultExclusive:=True;
         NextToken;
         end;
      ErrorIfNotSymbol(PARSE_TO);
      NextToken;
      if TokenIsSymbol then
         begin
         FResultFile:=TokenAsString;
         NextToken;
         ParseDelimiter;
         ParseHeaders;
         ParseFields;
         ParseFormats;
         end
      else
         ExpectedExpressionError('file name',False);
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseImportTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      if CheckTokenSymbol(PARSE_EXCLUSIVE) then
         begin
         FResultExclusive:=True;
         NextToken;
         end;
      ErrorIfNotSymbol(PARSE_FROM);
      NextToken;
      if TokenIsSymbol then
         begin
         FResultFile:=TokenAsString;
         NextToken;
         ParseDelimiter;
         ParseHeaders;
         ParseFields;
         ParseFormats;
         end
      else
         ExpectedExpressionError('file name',False);
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseVerifyTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseRepairTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      if CheckTokenSymbol(PARSE_FORCEINDEXREBUILD) then
         begin
         NextToken;
         FForceIndexRebuild:=True;
         end;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseUpgradeTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseDropTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseRenameTableQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      ErrorIfNotSymbol(PARSE_TO);
      NextToken;
      FNewResultTableName:=ParseTableName;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseDropIndexQuery;
begin
   with FQueryStatement.ExpressionParser do
      begin
      ParseIfExists;
      FResultTableName:=ParseTableName;
      if CheckToken(PARSE_ALIAS_QUALIFIER) then
         begin
         NextToken;
         { Need to retrieve the index name as a string }
         if TokenIsSymbol then
            begin
            FResultIndexName:=TokenAsString;
            NextToken;
            end
         else
            ExpectedExpressionError('index name',False);
         end;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseStartTransaction;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_WITH) then
         begin
         NextToken;
         if (FTransactionTables=nil) then
            FTransactionTables:=TStringList.Create
         else
            FTransactionTables.Clear;
         while True do
            begin
            FTransactionTables.Add(ParseTableName);
            if CheckToken(PARSE_SEPARATOR) then
               NextToken
            else
               Break;
            end;
         end;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseRollbackTransaction;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for WORK clause }
      if CheckTokenSymbol(PARSE_WORK) then
         NextToken;
      ParseTerm;
      end;
end;

procedure TDataQuery.ParseCommitTransaction;
begin
   with FQueryStatement.ExpressionParser do
      begin
      { Check for WORK clause }
      if CheckTokenSymbol(PARSE_WORK) then
         NextToken;
      { Check for FLUSH clause }
      if CheckTokenSymbol(PARSE_FLUSH) then
         begin
         FCommitFlush:=True;
         NextToken;
         end;
      ParseTerm;
      end;
end;

procedure TDataQuery.PrepareQuery;
var
   I: Integer;
begin
   { Prepare sub-queries and merge queries first }
   for I:=0 to FSubQueries.Count-1 do
      begin
      with TDataQuery(FSubQueries[I]) do
         PrepareQuery;
      end;
   for I:=0 to FMergeQueries.Count-1 do
      begin
      with TDataQuery(FMergeQueries[I]) do
         PrepareQuery;
      end;
   case FQueryType of
      SELECT_STATEMENT:
         PrepareSelectQuery;
      INSERT_STATEMENT:
         PrepareInsertQuery;
      UPDATE_STATEMENT:
         PrepareUpdateQuery;
      DELETE_STATEMENT:
         PrepareDeleteQuery;
      CREATE_TABLE_STATEMENT:
         PrepareCreateTableQuery;
      CREATE_INDEX_STATEMENT:
         PrepareCreateIndexQuery;
      ALTER_TABLE_STATEMENT:
         PrepareAlterTableQuery;
      EMPTY_TABLE_STATEMENT:
         PrepareEmptyTableQuery;
      OPTIMIZE_TABLE_STATEMENT:
         PrepareOptimizeTableQuery;
      EXPORT_TABLE_STATEMENT:
         PrepareExportTableQuery;
      IMPORT_TABLE_STATEMENT:
         PrepareImportTableQuery;
      VERIFY_TABLE_STATEMENT:
         PrepareVerifyTableQuery;
      REPAIR_TABLE_STATEMENT:
         PrepareRepairTableQuery;
      UPGRADE_TABLE_STATEMENT:
         PrepareUpgradeTableQuery;
      DROP_TABLE_STATEMENT:
         PrepareDropTableQuery;
      RENAME_TABLE_STATEMENT:
         PrepareRenameTableQuery;
      DROP_INDEX_STATEMENT:
         PrepareDropIndexQuery;
      end;
end;

procedure TDataQuery.PrepareSelectQuery;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      { Version 5}
      { Handle @@IDENTITY queries for the ODBC driver }
      if FIdentityOnly then
         begin
         AssignResultTableParams;
         CreateResultTable;
         end
      { Version 5}
      else
         begin
         { First check to see if the SQL includes both a GROUP BY and a
           DISTINCT clause }
         if FDistinctResult and FGroupedResult then
            FDistinctResult:=False;
         OpenSourceTables;
         { Next we need to verify all of the resultant field
           expressions to ensure that they are both correct and minimal }
         VerifyResultFields;
         { We need to check here to see if we're dealing with a single row result
           set (all calculated aggregates or constants) }
         if (not FGroupedResult) then
            begin
            if FHavingResult then
               GeneralError(FHavingExpressionTokens,
                            'A GROUP BY clause must exist '+
                            'in order to use the HAVING clause');
            FSingleRowResult:=CanReturnSingleRowResult;
            if FSingleRowResult then
               FGroupedResult:=True;
            FSimpleFunctionResult:=CanReturnSimpleFunctionResult;
            end;
         { If the query contains an ORDER BY statement, then we need
           to verify the ORDER BY fields  }
         if FOrderedResult then
            VerifyOrderByFields;
         { Check and see if we can return a live ORDER BY }
         CheckForLiveOrderBy;
         { We now need to check and see if the user wants a live result set.
           If they do then we just need to open the result set on the data
           file in question and install a new field mapping by setting the
           visibility of each field definition }
         if CanReturnLiveResult then
            begin
            FInPlaceResult:=True;
            FLiveResult:=True;
            { And now reduce the WHERE expression to it's proper contents }
            if FHasWhereExpression then
               begin
               VerifyWhereExpression(True);
               ReduceWhereExpression;
               end;
            if (FSubSelectType=stNone) and (FMergeType=mtNone) then
               begin
               with MasterSourceTable.DataCursor do
                  begin
                  ResultSet:=True;
                  if (not (ResultSet or SourceTable)) or
                     (ResultSet and SourceTable) then
                     DataTable.IncClientUseCount;
                  end;
               end;
            { Open extra tables after verifying expressions that may
              include LASTAUTOINC function calls}
            OpenExtraTables;
            { At this point we now need to install any new field mappings
              for the source table in order to support expression fields. }
            SetupLiveMapping;
            FResultTable:=MasterSourceTable.DataCursor;
            if (FSubSelectType <> stSubSelect) and (FMergeType=mtNone) then
               FResultTable.IndexPos:=FOrderByIndexPos
            else
               FResultTable.IndexPos:=PHYSICAL_INDEX_POS;
            end
         else
            begin
            FLiveResult:=False;
            FInplaceResult:=False;
            { At this point we now need to initialize the record buffers
              for the source tables }
            InitializeSourceRecordBuffers;
            { Set up the default Cartesian Joins for tables before processing joins
              in the WHERE clause }
            SetupDefaultJoins;
            SetupJoinExpressions;
            FlipRightOuterJoins;
            { Check and see if we can return a live ORDER BY again because
              we may have flipped around some tables due to ROJs, but only if
              we're dealing with a TOP N situation that could benefit from it }
            if (FTopRows <> -1) then
               CheckForLiveOrderBy
            else
               FOrderByExistingIndex:=False;
            { And now reduce the WHERE expression to it's proper contents,
              extracting the joins in the process }
            if FHasWhereExpression then
               begin
               VerifyWhereExpression(True);
               ReduceWhereExpression;
               end;
            if FHasHavingExpression then
               begin
               { Version 5 }
               { Verify the having expression fields first }
               VerifyHavingExpression;
               ReduceHavingExpression;
               { Now verify the having expression result fields }
               VerifyHavingExpression(True);
               { Version 5 }
               end;
            { Sort the source tables by the join order }
            SortJoinOrders;
            SetJoinOrders;
            { Now we need to remove any extra cartesian Joins }
            ReduceDefaultJoins;
            { If the query contains a GROUP BY or DISTINCT clause,
              then we need to verify them also }
            if FGroupedResult and (not FSingleRowResult) then
               VerifyGroupByFields
            else if FDistinctResult then
               VerifyDistinctFields;
            { Now verify any filter expressions }
            if FHasScanExpressions then
               VerifyScanExpression(True);
            if FJoinedResult then
               begin
               VerifyJoins(True);
               ReduceJoins;
               { Version 5 }
               if FHasWhereExpression then
                  ReduceWhereExpression;
               { Version 5 }
               end;
            AssignResultTableParams;
            CreateResultTable;
            { Open extra tables after verifying expressions that may
              include LASTAUTOINC function calls}
            OpenExtraTables;
            end;
         end;
      end;
end;

procedure TDataQuery.PrepareInsertQuery;
begin
   OpenSourceTables;
   InitializeSourceRecordBuffers;
   if DataSession.IsServer then
      CheckResultRights(MasterSourceTable.DataDirectory);
   if (FSubQueries.Count > 0) then
      ProcessSubSelectUpdateValues;
   { Next we need to verify all of the update fields
     to ensure that they are correct }
   VerifyUpdateFields(True);
   VerifyUpdateValues(True);
   { Open extra tables after verifying expressions that may
     include LASTAUTOINC function calls}
   OpenExtraTables;
end;

procedure TDataQuery.PrepareUpdateQuery;
begin
   OpenSourceTables;
   InitializeSourceRecordBuffers;
   { Set up the default Cartesian Joins for tables before processing joins
     in the WHERE clause }
   SetupDefaultJoins;
   SetupJoinExpressions;
   FlipRightOuterJoins;
   { And now reduce the WHERE expression to it's proper contents,
     extracting the joins in the process }
   if FHasWhereExpression then
      ReduceWhereExpression;
   if FHasHavingExpression then
      begin
      { Version 5 }
      { Verify the having expression fields first }
      VerifyHavingExpression;
      ReduceHavingExpression;
      { Now verify the having expression result fields }
      VerifyHavingExpression(True);
      { Version 5 }
      end;
   { Sort the source tables by the join order }
   SortJoinOrders;
   SetJoinOrders;
   if DataSession.IsServer then
      CheckResultRights(MasterSourceTable.DataDirectory);
   { Now we need to remove any extra cartesian Joins }
   ReduceDefaultJoins;
   { Next we need to verify all of the update fields
     to ensure that they are correct }
   VerifyUpdateFields(False);
   VerifyUpdateValues(True);
   { Now verify any filter expressions }
   if FHasWhereExpression then
      VerifyWhereExpression(True);
   if FHasScanExpressions then
      VerifyScanExpression(True);
   if FJoinedResult then
      begin
      VerifyJoins(True);
      ReduceJoins;
      { Version 5 }
      if FHasWhereExpression then
         ReduceWhereExpression;
      { Version 5 }
      end;
   { Open extra tables after verifying expressions that may
     include LASTAUTOINC function calls}
   OpenExtraTables;
end;

procedure TDataQuery.PrepareDeleteQuery;
begin
   OpenSourceTables;
   InitializeSourceRecordBuffers;
   { Set up the default Cartesian Joins for tables before processing joins
     in the WHERE clause }
   SetupDefaultJoins;
   SetupJoinExpressions;
   FlipRightOuterJoins;
   { And now reduce the WHERE expression to it's proper contents,
     extracting the joins in the process }
   if FHasWhereExpression then
      ReduceWhereExpression;
   if FHasHavingExpression then
      begin
      { Version 5 }
      { Verify the having expression fields first }
      VerifyHavingExpression;
      ReduceHavingExpression;
      { Now verify the having expression result fields }
      VerifyHavingExpression(True);
      { Version 5 }
      end;
   { Sort the source tables by the join order }
   SortJoinOrders;
   SetJoinOrders;
   if DataSession.IsServer then
      CheckResultRights(MasterSourceTable.DataDirectory);
   { Now we need to remove any extra cartesian Joins }
   ReduceDefaultJoins;
   { Now verify any filter expressions }
   if FHasWhereExpression then
      VerifyWhereExpression(True);
   if FHasScanExpressions then
      VerifyScanExpression(True);
   if FJoinedResult then
      begin
      VerifyJoins(True);
      ReduceJoins;
      { Version 5 }
      if FHasWhereExpression then
         ReduceWhereExpression;
      { Version 5 }
      end;
   { Open extra tables after verifying expressions that may
     include LASTAUTOINC function calls}
   OpenExtraTables;
end;

procedure TDataQuery.PrepareCreateTableQuery;
var
   I: Integer;
   J: Integer;
   H: Integer;
   TempCreateField: TCreateField;
   TempCreateIndex: TCreateIndex;
   TempCreateIndexField: TCreateIndexField;
begin
   FreeFieldDefinitions;
   FreeIndexDefinitions;
   AssignResultTableParams;
   with FQueryStatement.ExpressionVerifier do
      begin
      { Build the fields first }
      for I:=0 to FCreateFields.Count-1 do
         begin
         TempCreateField:=TCreateField(FCreateFields[I]);
         TempCreateField.FieldNum:=(I+1);
         FFieldDefinitions[TempCreateField.FieldNum]:=
               AllocMem(SizeOf(TFieldDefinition));
         with FFieldDefinitions[TempCreateField.FieldNum]^ do
            begin
            DataType:=TempCreateField.DataType;
            SubType:=TempCreateField.SubType;
            if (DataType in [TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES]) then
               Length:=TempCreateField.Length
            else if (DataType=TYPE_BCD) then
               Decimals:=TempCreateField.Decimals;
            FieldNum:=TempCreateField.FieldNum;
            FieldName:=TempCreateField.FieldName;
            Description:=TempCreateField.Description;
            ExpressionField:=False;
            CharCase:=TempCreateField.CharCase;
            Required:=TempCreateField.Required;
            Default:=TempCreateField.DefaultValue;
            Minimum:=TempCreateField.MinimumValue;
            Maximum:=TempCreateField.MaximumValue;
            Compression:=TempCreateField.Compression;
            end;
         Inc(FFieldCount);
         end;

      if (FCreateIndexes.Count=0) then
         begin
         { Just create a dummy primary index definition for the table }
         FIndexDefinitions[0]:=AllocMem(SizeOf(TIndexDefinition));
         with FIndexDefinitions[0]^ do
            begin
            KeyFieldCount:=1;
            KeyFields[1]:=RECORDID_FIELD_NUM;
            end;
         end
      else
         begin
         for I:=0 to FCreateIndexes.Count-1 do
            begin
            if (I > 0) then
               Inc(FIndexCount);
            TempCreateIndex:=TCreateIndex(FCreateIndexes[I]);
            FIndexDefinitions[FIndexCount]:=AllocMem(SizeOf(TIndexDefinition));
            with FIndexDefinitions[FIndexCount]^ do
               begin
               IndexName:=TempCreateIndex.IndexName;
               KeyUnique:=TempCreateIndex.Unique;
               KeyCaseInsensitive:=TempCreateIndex.CaseInsensitive;
               KeyCompressionType:=TempCreateIndex.CompressionLevel;
               KeyFieldCount:=TempCreateIndex.FieldsList.Count;
               for J:=0 to TempCreateIndex.FieldsList.Count-1 do
                  begin
                  TempCreateIndexField:=TCreateIndexField(TempCreateIndex.FieldsList[J]);
                  KeyFields[J+1]:=0;
                  for H:=1 to FFieldCount do
                     begin
                     if (AnsiCompareText(FFieldDefinitions[H]^.FieldName,
                                         TempCreateIndexField.FieldName)=0) then
                        begin
                        KeyFields[J+1]:=FFieldDefinitions[H]^.FieldNum;
                        Break;
                        end
                     else if (AnsiCompareText(RECORDID_FIELD_NAME,
                                              TempCreateIndexField.FieldName)=0) then
                        begin
                        KeyFields[J+1]:=RECORDID_FIELD_NUM;
                        Break;
                        end
                     else if (AnsiCompareText(RECORDHASH_FIELD_NAME,
                                              TempCreateIndexField.FieldName)=0) then
                        begin
                        KeyFields[J+1]:=RECORDHASH_FIELD_NUM;
                        Break;
                        end;
                     end;
                  { Force an error here if the field is not found and
                    doesn't have a field number }
                  if (KeyFields[J+1]=0) then
                     ExpectedTokenTypesError(TempCreateIndexField.ExpressionTokens,[etFIELD]);
                  if TempCreateIndexField.Descending then
                     begin
                     KeyDescending:=True;
                     KeyDescendingFields[J+1]:=True;
                     end;
                  end;
               end;
            end;
         end;

      FIndexDefinitions[TEXT_INDEX_POS]:=AllocMem(SizeOf(TIndexDefinition));

      if (FCreateTextIndex <> nil) then
         begin
         with FIndexDefinitions[TEXT_INDEX_POS]^ do
            begin
            IndexName:=TEXT_INDEX_NAME;
            KeyUnique:=False;
            KeyDescending:=False;
            FillChar(KeyDescendingFields,SizeOf(TDescendingKeyFields),#0);
            KeyCaseInsensitive:=False;
            KeyCompressionType:=BOTH_COMPRESS;
            NoKeyStatistics:=True;
            KeyFieldCount:=FCreateTextIndex.FieldsList.Count;
            for J:=0 to FCreateTextIndex.FieldsList.Count-1 do
               begin
               TempCreateIndexField:=TCreateIndexField(FCreateTextIndex.FieldsList[J]);
               KeyFields[J+1]:=0;
               for H:=1 to FFieldCount do
                  begin
                  if (AnsiCompareText(FFieldDefinitions[H]^.FieldName,
                                      TempCreateIndexField.FieldName)=0) then
                     begin
                     KeyFields[J+1]:=FFieldDefinitions[H]^.FieldNum;
                     Break;
                     end
                  else if (AnsiCompareText(RECORDID_FIELD_NAME,
                                           TempCreateIndexField.FieldName)=0) then
                     begin
                     KeyFields[J+1]:=RECORDID_FIELD_NUM;
                     Break;
                     end
                  else if (AnsiCompareText(RECORDHASH_FIELD_NAME,
                                           TempCreateIndexField.FieldName)=0) then
                     begin
                     KeyFields[J+1]:=RECORDHASH_FIELD_NUM;
                     Break;
                     end;
                  end;
               { Force an error here if the field is not found and
                 doesn't have a field number }
               if (KeyFields[J+1]=0) then
                  ExpectedTokenTypesError(TempCreateIndexField.ExpressionTokens,[etFIELD]);
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.PrepareCreateIndexQuery;
var
   J: Integer;
   H: Integer;
   TempCreateIndex: TCreateIndex;
   TempCreateIndexField: TCreateIndexField;
   TempFieldDefinition: pFieldDefinition;
begin
   FreeFieldDefinitions;
   FreeIndexDefinitions;
   AssignResultTableParams;
   with FQueryStatement.ExpressionVerifier do
      begin
      with FResultTable do
         begin
         { Version 5 }
         SystemOpen:=True;
         { Version 5 }
         Exclusive:=False;
         Temporary:=False;
         ResultSet:=False;
         OpenCursor(False);
         try
            TempCreateIndex:=TCreateIndex(FCreateIndexes[FIndexCount]);
            FIndexDefinitions[FIndexCount]:=AllocMem(SizeOf(TIndexDefinition));
            with FIndexDefinitions[FIndexCount]^ do
               begin
               IndexName:=TempCreateIndex.IndexName;
               KeyUnique:=TempCreateIndex.Unique;
               KeyCaseInsensitive:=TempCreateIndex.CaseInsensitive;
               KeyCompressionType:=TempCreateIndex.CompressionLevel;
               KeyFieldCount:=TempCreateIndex.FieldsList.Count;
               for J:=0 to TempCreateIndex.FieldsList.Count-1 do
                  begin
                  TempCreateIndexField:=TCreateIndexField(TempCreateIndex.FieldsList[J]);
                  KeyFields[J+1]:=0;
                  for H:=1 to FieldCount do
                     begin
                     TempFieldDefinition:=GetFieldDefinitionByPos(H);
                     if (AnsiCompareText(TempFieldDefinition^.FieldName,
                                         TempCreateIndexField.FieldName)=0) then
                        begin
                        KeyFields[J+1]:=TempFieldDefinition^.FieldNum;
                        Break;
                        end
                     else if (AnsiCompareText(RECORDID_FIELD_NAME,
                                              TempCreateIndexField.FieldName)=0) then
                        begin
                        KeyFields[J+1]:=RECORDID_FIELD_NUM;
                        Break;
                        end
                     else if (AnsiCompareText(RECORDHASH_FIELD_NAME,
                                              TempCreateIndexField.FieldName)=0) then
                        begin
                        KeyFields[J+1]:=RECORDHASH_FIELD_NUM;
                        Break;
                        end;
                     end;
                  { Force an error here if the field is not found and
                    doesn't have a field number }
                  if (KeyFields[J+1]=0) then
                     ExpectedTokenTypesError(TempCreateIndexField.ExpressionTokens,[etFIELD]);
                  if TempCreateIndexField.Descending then
                     begin
                     KeyDescending:=True;
                     KeyDescendingFields[J+1]:=True;
                     end;
                  end;
               end;
         finally
            CloseCursor(True);
         end;
         end;
      end;
end;

procedure TDataQuery.PrepareAlterTableQuery;
var
   I: Integer;
   J: Integer;
   H: Integer;
   TempFieldDefinition: pFieldDefinition;
   TempCreateField: TCreateField;
   TempCreateIndex: TCreateIndex;
   TempCreateIndexField: TCreateIndexField;
   TempFieldPos: Word;
   LastFieldPos: Word;
   PrimaryIndexDropped: Boolean;
begin
   FreeFieldDefinitions;
   FreeIndexDefinitions;
   AssignResultTableParams;
   with FQueryStatement.ExpressionVerifier do
      begin
      LastFieldPos:=0;
      { Build the fields first from the existing table }
      with FResultTable do
         begin
         { Version 5 }
         SystemOpen:=True;
         Exclusive:=False;
         { Version 5 }
         Temporary:=False;
         ResultSet:=False;
         if (not FOnlyIfExists) or
            (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
            begin
            OpenCursor(False);
            try
               if (not FEncryptedSet) then
                  begin
                  FEncrypted:=Encrypted;
                  FEncryptionPassword:=Password;
                  end
               else
                  FStructureAltered:=True;
               if (not FLocaleIDSet) then
                  FLocaleID:=LocaleID
               else
                  FStructureAltered:=True;
               if (not FIndexPageSizeSet) then
                  FIndexPageSize:=IndexPageSize
               else
                  FStructureAltered:=True;
               if (not FBlobBlockSizeSet) then
                  FBlobBlockSize:=BlobBlockSize
               else
                  FStructureAltered:=True;
               if (not FDescriptionSet) then
                  FDescription:=Description
               else
                  FStructureAltered:=True;
               if (not FUserMajorVersionSet) then
                  FUserMajorVersion:=UserMajorVersion
               else
                  FStructureAltered:=True;
               if (not FUserMinorVersionSet) then
                  FUserMinorVersion:=UserMinorVersion
               else
                  FStructureAltered:=True;

               { Version 5}
               if FStopWordsSet or FSpaceCharsSet or FIncludeCharsSet then
                  FStructureAltered:=True;
               { Version 5}

               FFieldCount:=FieldCount;
               for I:=1 to FFieldCount do
                  begin
                  FFieldDefinitions[I]:=AllocMem(SizeOf(TFieldDefinition));
                  FFieldDefinitions[I]^:=GetFieldDefinition(I)^;
                  LastFieldPos:=MaximumWord(LastFieldPos,FFieldDefinitions[I]^.FieldNum);
                  end;

               for I:=0 to FCreateFields.Count-1 do
                  begin
                  TempFieldPos:=0;
                  TempCreateField:=TCreateField(FCreateFields[I]);
                  if (TempCreateField.AtPos <> 0) then
                     begin
                     if (TempCreateField.AtPos < 1) then
                        GeneralError(TempCreateField.ExpressionTokens,'AT column position must be '+
                                     'greater than or equal to 1');
                     end;
                  if TempCreateField.AddField then
                     begin
                     Inc(FFieldCount);
                     TempCreateField.FieldNum:=FFieldCount;
                     Dec(FFieldCount);
                     for J:=1 to FFieldCount do
                        begin
                        if (AnsiCompareText(TempCreateField.FieldName,
                                            FFieldDefinitions[J]^.FieldName)=0) then
                           begin
                           TempFieldPos:=J;
                           Break;
                           end;
                        end;
                     if (TempFieldPos=0) then
                        begin
                        FStructureAltered:=True;
                        Inc(FFieldCount);
                        if (TempCreateField.AtPos <> 0) and
                           (TempCreateField.AtPos <= FFieldCount) then
                           begin
                           Move(FFieldDefinitions[TempCreateField.AtPos],
                                FFieldDefinitions[TempCreateField.AtPos+1],
                                ((FFieldCount-TempCreateField.AtPos)*SizeOf(pFieldDefinition)));
                           FFieldDefinitions[TempCreateField.AtPos]:=
                                 AllocMem(SizeOf(TFieldDefinition));
                           TempFieldPos:=TempCreateField.AtPos;
                           end
                        else
                           begin
                           FFieldDefinitions[FFieldCount]:=
                                 AllocMem(SizeOf(TFieldDefinition));
                           TempFieldPos:=FFieldCount;
                           end;
                        Inc(LastFieldPos);
                        with FFieldDefinitions[TempFieldPos]^ do
                           begin
                           DataType:=TempCreateField.DataType;
                           SubType:=TempCreateField.SubType;
                           if (DataType in [TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES]) then
                              Length:=TempCreateField.Length
                           else if (DataType=TYPE_BCD) then
                              Decimals:=TempCreateField.Decimals;
                           FieldNum:=LastFieldPos;
                           FieldName:=TempCreateField.FieldName;
                           Description:=TempCreateField.Description;
                           ExpressionField:=False;
                           CharCase:=TempCreateField.CharCase;
                           Required:=TempCreateField.Required;
                           Default:=TempCreateField.DefaultValue;
                           Minimum:=TempCreateField.MinimumValue;
                           Maximum:=TempCreateField.MaximumValue;
                           Compression:=TempCreateField.Compression;
                           end;
                        end
                     else if (not TempCreateField.OnlyIfNotExists) then
                        GeneralError(TempCreateField.ExpressionTokens,'Duplicate '+
                                     TempCreateField.FieldName+' column not allowed');
                     end
                  else if TempCreateField.RedefineField then
                     begin
                     TempCreateField.FieldNum:=0;
                     for J:=1 to FFieldCount do
                        begin
                        if (AnsiCompareText(TempCreateField.FieldName,
                                            FFieldDefinitions[J]^.FieldName)=0) then
                           begin
                           TempCreateField.FieldNum:=FFieldDefinitions[J]^.FieldNum;
                           TempFieldPos:=J;
                           Break;
                           end;
                        end;
                     if (TempFieldPos <> 0) then
                        begin
                        if (TempCreateField.AtPos <> 0) and
                           (TempCreateField.AtPos <= FFieldCount) then
                           begin
                           TempFieldDefinition:=FFieldDefinitions[TempFieldPos];
                           Move(FFieldDefinitions[TempFieldPos+1],
                                FFieldDefinitions[TempFieldPos],
                                ((FFieldCount-TempFieldPos)*SizeOf(pFieldDefinition)));
                           Move(FFieldDefinitions[TempCreateField.AtPos],
                                FFieldDefinitions[TempCreateField.AtPos+1],
                                ((FFieldCount-TempCreateField.AtPos)*SizeOf(pFieldDefinition)));
                           FFieldDefinitions[TempCreateField.AtPos]:=TempFieldDefinition;
                           TempFieldPos:=TempCreateField.AtPos;
                           end
                        else if (TempCreateField.AtPos > FFieldCount) then
                           begin
                           TempFieldDefinition:=FFieldDefinitions[TempFieldPos];
                           Move(FFieldDefinitions[TempFieldPos+1],
                                FFieldDefinitions[TempFieldPos],
                                ((FFieldCount-TempFieldPos)*SizeOf(pFieldDefinition)));
                           FFieldDefinitions[FFieldCount]:=TempFieldDefinition;
                           TempFieldPos:=FFieldCount;
                           end;
                        with FFieldDefinitions[TempFieldPos]^ do
                           begin
                           if (TempCreateField.DataType <> TYPE_UNKNOWN) then
                              begin
                              FStructureAltered:=True;
                              DataType:=TempCreateField.DataType;
                              SubType:=TempCreateField.SubType;
                              if (DataType in [TYPE_ZSTRING,TYPE_BYTES,TYPE_VARBYTES]) then
                                 Length:=TempCreateField.Length
                              else if (DataType=TYPE_BCD) then
                                 Decimals:=TempCreateField.Decimals;
                              end;
                           FieldNum:=TempCreateField.FieldNum;
                           if (TempCreateField.NewFieldName <> '') then
                              begin
                              FStructureAltered:=True;
                              FieldName:=TempCreateField.NewFieldName;
                              end;
                           if TempCreateField.DescriptionSet then
                              begin
                              FStructureAltered:=True;
                              Description:=TempCreateField.Description;
                              end;
                           ExpressionField:=False;
                           if TempCreateField.CharCaseSet then
                              begin
                              FStructureAltered:=True;
                              CharCase:=TempCreateField.CharCase;
                              end;
                           if TempCreateField.RequiredSet then
                              begin
                              FStructureAltered:=True;
                              Required:=TempCreateField.Required;
                              end;
                           if TempCreateField.DefaultValueSet then
                              begin
                              FStructureAltered:=True;
                              Default:=TempCreateField.DefaultValue;
                              end;
                           if TempCreateField.MinimumValueSet then
                              begin
                              FStructureAltered:=True;
                              Minimum:=TempCreateField.MinimumValue;
                              end;
                           if TempCreateField.MaximumValueSet then
                              begin
                              FStructureAltered:=True;
                              Maximum:=TempCreateField.MaximumValue;
                              end;
                           if TempCreateField.CompressionSet then
                              begin
                              FStructureAltered:=True;
                              Compression:=TempCreateField.Compression;
                              end;
                           end;
                        end
                     else if (not TempCreateField.OnlyIfExists) then
                        ExpectedTokenTypesError(TempCreateField.ExpressionTokens,[etFIELD]);
                     end
                  else if TempCreateField.DropField then
                     begin
                     TempCreateField.FieldNum:=0;
                     for J:=1 to FFieldCount do
                        begin
                        if (AnsiCompareText(TempCreateField.FieldName,
                                            FFieldDefinitions[J]^.FieldName)=0) then
                           begin
                           TempCreateField.FieldNum:=FFieldDefinitions[J]^.FieldNum;
                           TempFieldPos:=J;
                           Break;
                           end;
                        end;
                     if (TempFieldPos <> 0) then
                        begin
                        FStructureAltered:=True;
                        DeAllocMem(FFieldDefinitions[TempFieldPos]);
                        Move(FFieldDefinitions[TempFieldPos+1],
                             FFieldDefinitions[TempFieldPos],
                             ((FFieldCount-TempFieldPos)*SizeOf(pFieldDefinition)));
                        Dec(FFieldCount);
                        end
                     else if (not TempCreateField.OnlyIfExists) then
                        ExpectedTokenTypesError(TempCreateField.ExpressionTokens,[etFIELD]);
                     end;
                  end;

               FIndexCount:=IndexCount;

               for I:=0 to FIndexCount do
                  begin
                  FIndexDefinitions[I]:=AllocMem(SizeOf(TIndexDefinition));
                  FIndexDefinitions[I]^:=GetIndexDefinition(I)^;
                  end;

               PrimaryIndexDropped:=False;

               for I:=0 to FCreateIndexes.Count-1 do
                  begin
                  FStructureAltered:=True;
                  TempCreateIndex:=TCreateIndex(FCreateIndexes[I]);
                  if (TempCreateIndex.AddIndex or TempCreateIndex.RedefineIndex) then
                     begin
                     if TempCreateIndex.AddIndex then
                        begin
                        if (not AutoPrimaryIndex) and (not PrimaryIndexDropped) then
                           GeneralError(TempCreateIndex.Line,TempCreateIndex.Column,
                                        'Cannot REDEFINE an existing primary '+
                                        'index using the ADD keyword');
                        end;
                     with FIndexDefinitions[0]^ do
                        begin
                        IndexName:=TempCreateIndex.IndexName;
                        KeyUnique:=TempCreateIndex.Unique;
                        KeyDescending:=False;
                        KeyCaseInsensitive:=TempCreateIndex.CaseInsensitive;
                        KeyCompressionType:=TempCreateIndex.CompressionLevel;
                        KeyFieldCount:=TempCreateIndex.FieldsList.Count;
                        FillChar(KeyFields,SizeOf(KeyFields),#0);
                        for J:=0 to TempCreateIndex.FieldsList.Count-1 do
                           begin
                           TempCreateIndexField:=TCreateIndexField(TempCreateIndex.FieldsList[J]);
                           for H:=1 to FFieldCount do
                              begin
                              if (AnsiCompareText(FFieldDefinitions[H]^.FieldName,
                                                  TempCreateIndexField.FieldName)=0) then
                                 begin
                                 KeyFields[J+1]:=FFieldDefinitions[H]^.FieldNum;
                                 Break;
                                 end
                              else if (AnsiCompareText(RECORDID_FIELD_NAME,
                                                       TempCreateIndexField.FieldName)=0) then
                                 begin
                                 KeyFields[J+1]:=RECORDID_FIELD_NUM;
                                 Break;
                                 end
                              else if (AnsiCompareText(RECORDHASH_FIELD_NAME,
                                                       TempCreateIndexField.FieldName)=0) then
                                 begin
                                 KeyFields[J+1]:=RECORDHASH_FIELD_NUM;
                                 Break;
                                 end;
                              end;
                           { Force an error here if the field is not found and
                             doesn't have a field number }
                           if (KeyFields[J+1]=0) then
                              ExpectedTokenTypesError(TempCreateIndexField.ExpressionTokens,[etFIELD]);
                           if TempCreateIndexField.Descending then
                              begin
                              KeyDescending:=True;
                              KeyDescendingFields[J+1]:=True;
                              end
                           { Version 5 }
                           else
                              KeyDescendingFields[J+1]:=False;
                           { Version 5 }
                           end;
                        end;
                     end
                  else
                     begin
                     FillChar(FIndexDefinitions[0]^,SizeOf(TIndexDefinition),#0);
                     with FIndexDefinitions[0]^ do
                        begin
                        KeyFieldCount:=1;
                        KeyFields[1]:=RECORDID_FIELD_NUM;
                        end;
                     PrimaryIndexDropped:=True;
                     FStructureAltered:=True;
                     end;
                  end;

               FIndexDefinitions[TEXT_INDEX_POS]:=AllocMem(SizeOf(TIndexDefinition));
               FIndexDefinitions[TEXT_INDEX_POS]^:=GetIndexDefinition(TEXT_INDEX_POS)^;

               if (FCreateTextIndex <> nil) then
                  begin
                  FStructureAltered:=True;
                  with FIndexDefinitions[TEXT_INDEX_POS]^ do
                     begin
                     IndexName:=TEXT_INDEX_NAME;
                     KeyUnique:=False;
                     KeyDescending:=False;
                     FillChar(KeyDescendingFields,SizeOf(TDescendingKeyFields),#0);
                     KeyCaseInsensitive:=False;
                     KeyCompressionType:=BOTH_COMPRESS;
                     NoKeyStatistics:=True;
                     KeyFieldCount:=FCreateTextIndex.FieldsList.Count;
                     FillChar(KeyFields,SizeOf(KeyFields),#0);
                     for J:=0 to FCreateTextIndex.FieldsList.Count-1 do
                        begin
                        TempCreateIndexField:=TCreateIndexField(FCreateTextIndex.FieldsList[J]);
                        KeyFields[J+1]:=0;
                        for H:=1 to FFieldCount do
                           begin
                           if (AnsiCompareText(FFieldDefinitions[H]^.FieldName,
                                               TempCreateIndexField.FieldName)=0) then
                              begin
                              KeyFields[J+1]:=FFieldDefinitions[H]^.FieldNum;
                              Break;
                              end
                           else if (AnsiCompareText(RECORDID_FIELD_NAME,
                                                    TempCreateIndexField.FieldName)=0) then
                              begin
                              KeyFields[J+1]:=RECORDID_FIELD_NUM;
                              Break;
                              end
                           else if (AnsiCompareText(RECORDHASH_FIELD_NAME,
                                                    TempCreateIndexField.FieldName)=0) then
                              begin
                              KeyFields[J+1]:=RECORDHASH_FIELD_NUM;
                              Break;
                              end;
                           end;
                        { Force an error here if the field is not found and
                          doesn't have a field number }
                        if (KeyFields[J+1]=0) then
                           ExpectedTokenTypesError(TempCreateIndexField.ExpressionTokens,[etFIELD]);
                        end;
                     end;
                  end;

            finally
               CloseCursor(True);
            end;
            end;
         end;
      end;
end;

procedure TDataQuery.PrepareEmptyTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareOptimizeTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareExportTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareImportTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareVerifyTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareRepairTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareUpgradeTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareDropTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareRenameTableQuery;
begin
   AssignResultTableParams;
end;

procedure TDataQuery.PrepareDropIndexQuery;
begin
   AssignResultTableParams;
end;

function TDataQuery.GetJoinsPlan: AnsiString;
var
   I: Integer;
   J: Integer;
   TempSourceTable: TSourceTable;
   TempJoin: TJoin;
begin
   Result:='The driver table is the '+MasterSourceTable.TableName+' table ('+MasterSourceTable.AliasName+')';
   for I:=0 to FSourceTables.Count-1 do
      begin
      TempSourceTable:=TSourceTable(FSourceTables[I]);
      with TempSourceTable do
         begin
         for J:=0 to Joins.Count-1 do
            begin
            Result:=Result+PARSE_CRLF+PARSE_CRLF;
            TempJoin:=TJoin(Joins[J]);
            with TempJoin do
               begin
               if (JoinType <> jtNone) then
                  begin
                  if (JoinTokens <> nil) and (TargetTable.JoinScanTokens=nil) then
                     Result:=Result+'The '+TableName+' table ('+AliasName+') is joined to the '+
                                   TargetTable.TableName+' table ('+TargetTable.AliasName+') with the '+
                                   GetJoinTypeText(JoinType)+' expression:'+PARSE_CRLF+PARSE_CRLF+
                                   BuildExpressionLiteral(JoinTokens)
                  else if (JoinTokens <> nil) and (TargetTable.JoinScanTokens <> nil) then
                     Result:=Result+'The '+TableName+' table ('+AliasName+') is joined to the '+
                                   TargetTable.TableName+' table ('+TargetTable.AliasName+') with the '+
                                   GetJoinTypeText(JoinType)+' expression:'+PARSE_CRLF+PARSE_CRLF+
                                   BuildExpressionLiteral(JoinTokens)+' '+PARSE_AND+' '+
                                   BuildExpressionLiteral(TargetTable.JoinScanTokens)
                  else if (JoinTokens=nil) and (TargetTable.JoinScanTokens <> nil) then
                     Result:=Result+'The '+TableName+' table ('+AliasName+') is joined to the '+
                                   TargetTable.TableName+' table ('+TargetTable.AliasName+') with the '+
                                   GetJoinTypeText(JoinType)+' expression:'+PARSE_CRLF+PARSE_CRLF+
                                   BuildExpressionLiteral(TargetTable.JoinScanTokens);
                  end
               else
                  Result:=Result+'The '+TableName+' table ('+AliasName+') is joined to the '+
                                TargetTable.TableName+' table ('+TargetTable.AliasName+') with a '+
                                GetJoinTypeText(JoinType);
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.ProcessJoins;
var
   OldJoinOptimizationLevel: TOptimizeLevel;
   NewJoinOptimizationLevel: TOptimizeLevel;
   OldSmallestTable: TSourceTable;
   { Version 5 }
   I: Integer;
   JoinsCouldBeOptimized: Boolean;
   JoinsActuallyOptimized: Boolean;
   { Version 5 }
begin
   OldJoinOptimizationLevel:=CalculateJoinOptimizeLevels;
   if GeneratePlan then
      begin
      Plan('Join Ordering');
      Plan('-------------');
      Plan('');
      Plan(GetJoinsPlan);
      Plan('');
      if (not FNoJoinOptimizations) then
         begin
         Plan('Optimizer will attempt to re-order the joins to a more optimal order');
         Plan('Use the NOJOINOPTIMIZE clause at the end of the SQL statement to force '+
              'the optimizer to leave the joins in their declared order');
         Plan('');
         end;
      end;
   { Version 5 }
   JoinsCouldBeOptimized:=False;
   JoinsActuallyOptimized:=False;
   FLastSmallestTable.Clear;
   for I:=1 to FSourceTables.Count do
      begin
      if CanOptimizeJoins then
         begin
         JoinsCouldBeOptimized:=True;
         OldSmallestTable:=OptimizeJoins;
         FLastSmallestTable.Add(MasterSourceTable);
         NewJoinOptimizationLevel:=CalculateJoinOptimizeLevels;
         if ((OldJoinOptimizationLevel=olFull) and (NewJoinOptimizationLevel in [olPartial,olNone])) or
            ((OldJoinOptimizationLevel=olPartial) and (NewJoinOptimizationLevel=olNone)) or
            (not CheckJoinOrders) then
            UnOptimizeJoins(OldSmallestTable)
         else
            begin
            JoinsActuallyOptimized:=True;
            Break;
            end;
         end;
      end;
   if JoinsCouldBeOptimized then
      begin
      if JoinsActuallyOptimized then
         begin
         if GeneratePlan then
            begin
            Plan('Optimized Join Ordering');
            Plan('-----------------------');
            Plan('');
            Plan(GetJoinsPlan);
            Plan('');
            end;
         end
      else
         begin
         if GeneratePlan then
            begin
            Plan('The joins are already in optimal order and cannot be '+
                 'optimized any further');
            Plan('');
            end;
         end;
      end
   else
      begin
      if GeneratePlan then
         begin
         if FNoJoinOptimizations then
            Plan('The joins have not been attempted to be optimized due to the inclusion of '+
                 'the NOJOINOPTIMIZE clause')
         else
            Plan('The joins are already in optimal order and cannot be '+
                 'optimized any further');
         Plan('');
         end;
      end;
   { Version 5 }
end;

procedure TDataQuery.ExecuteQuery(var ResultSet: TDataCursor);
var
   BeginTicks: Cardinal;
   EndTicks: Cardinal;
   I: Integer;
   TempString: AnsiString;
begin
   BeginTicks:=OSGetTickCount;
   if GeneratePlan then
      begin
      if (FSubSelectType=stNone) and (FMergeType=mtNone) then
         begin
         Plan(Replicate('=',QUERY_PLAN_LENGTH));
         { Version 5 }
         Plan('SQL statement (Executed with '+ENGINE_VERSION+' Build '+ENGINE_BUILD+')');
         { Version 5 }
         Plan(Replicate('=',QUERY_PLAN_LENGTH));
         Plan('');
         Plan(TrimRight(FQueryStatement.ExpressionParser.Expression));
         Plan('');
         end
      else if (FSubSelectType <> stNone) then
         begin
         Plan(Replicate('-',QUERY_PLAN_LENGTH));
         Plan('Sub-query');
         Plan(Replicate('-',QUERY_PLAN_LENGTH));
         Plan('');
         Plan(TrimRight(FStatementText));
         Plan('');
         end
      else if (FMergeType <> mtNone) then
         begin
         Plan(Replicate('-',QUERY_PLAN_LENGTH));
         Plan(GetMergeTypeText(FMergeType)+' query');
         Plan(Replicate('-',QUERY_PLAN_LENGTH));
         Plan('');
         Plan(TrimRight(FStatementText));
         Plan('');
         end
      end;
   for I:=0 to FSubQueries.Count-1 do
      begin
      with TDataQuery(FSubQueries[I]) do
         ExecuteQuery(ResultSet);
      end;
   for I:=0 to FMergeQueries.Count-1 do
      begin
      with TDataQuery(FMergeQueries[I]) do
         ExecuteQuery(ResultSet);
      end;
   ResultSet:=nil;
   case FQueryType of
      SELECT_STATEMENT:
         begin
         { Reset the WHERE costs }
         FWhereCostSet:=False;
         FTotalWhereCost:=0;
         { First reset all source filters so that we don't mix filters }
         ResetAllSourceFilters;
         { Remove any temporary scan expressions }
         FHasTempScanExpressions:=False;
         FreeExpressionTokens(FTempScanExpressionTokens);
         { Now we need to re-verify any expressions if parameters are being used }
         if (FQueryStatement.ConstantParameters.Count > 0) then
            begin
            if FHasWhereExpression then
               VerifyWhereExpression(True);
            if FHasScanExpressions then
               VerifyScanExpression(True);
            if FJoinedResult then
               VerifyJoins(True);
            end;
         { Refresh the source tables automatically }
         RefreshSourceTables;
         RefreshExtraTables;
         if FInPlaceResult then
            begin
            if GeneratePlan then
               begin
               Plan('Result Set Generation');
               Plan('---------------------');
               Plan('');
               Plan('Result set will be live');
               Plan('');
               Plan('Result set will consist of one or more rows');
               Plan('');
               if (FOrderByIndexPos <> PHYSICAL_INDEX_POS) then
                  begin
                  if (FOrderByIndexPos=0) then
                     Plan('Result set will be ordered by the primary index for the table '+
                          MasterSourceTable.DataCursor.TableName)
                  else
                     Plan('Result set will be ordered by the secondary index '+
                          MasterSourceTable.DataCursor.GetIndexDefinition(FOrderByIndexPos)^.IndexName+' for the table '+
                          MasterSourceTable.DataCursor.TableName);
                  Plan('');
                  end
               else
                  begin
                  Plan('Result set will be in physical record order for the table '+
                       MasterSourceTable.DataCursor.TableName);
                  Plan('');
                  end;
               end;
            { If a WHERE clause exists then build the appropriate filters on the
              source tables using the WHERE expression }
            if FHasWhereExpression then
               begin
               { Version 5 }
               GenerateWherePlan;
               { Version 5 }
               EvaluateWhereExpression(False);
               end;
            end
         else
            begin
            if GeneratePlan then
               begin
               Plan('Result Set Generation');
               Plan('---------------------');
               Plan('');
               Plan('Result set will be canned');
               Plan('');
               if FGroupedResult and FSingleRowResult then
                  begin
                  Plan('Result set will consist of one grouped row');
                  Plan('');
                  end
               else if FGroupedResult then
                  begin
                  Plan('Result set will consist of one or more grouped rows');
                  Plan('');
                  Plan('Result set will be grouped by the following column(s) using a temporary index:');
                  Plan('');
                  { The GROUP BY index is always in the second position (0-based) }
                  with FResultTable.GetIndexDefinition(1)^ do
                     begin
                     for I:=1 to KeyFieldCount do
                        Plan(FResultTable.GetFieldDefinition(KeyFields[I])^.FieldName);
                     end;
                  Plan('');
                  if FHavingResult then
                     begin
                     Plan('The expression:');
                     Plan('');
                     Plan(BuildExpressionLiteral(FHavingExpressionTokens));
                     Plan('');
                     Plan('will be applied to each grouped row in the result set '+
                          'after the result set is generated');
                     Plan('');
                     end;
                  end
               else if FDistinctResult then
                  begin
                  Plan('Result set will consist of one or more distinct rows');
                  Plan('');
                  Plan('Duplicate result set rows will be removed using a temporary index on '+
                       'all of the result set columns');
                  Plan('');
                  end
               else
                  begin
                  Plan('Result set will consist of one or more rows');
                  Plan('');
                  end;
               if FOrderedResult then
                  begin
                  if FOrderByExistingIndex then
                     begin
                     if (FOrderByIndexPos=0) then
                        Plan('Result set will be ordered by the primary index for the table '+
                             MasterSourceTable.DataCursor.TableName)
                     else
                        Plan('Result set will be ordered by the secondary index '+
                             MasterSourceTable.DataCursor.GetIndexDefinition(FOrderByIndexPos)^.IndexName+' for the table '+
                             MasterSourceTable.DataCursor.TableName);
                     Plan('');
                     end
                  else
                     begin
                     if FOrderByCaseInsensitive then
                        Plan('Result set will be ordered by the following '+
                             'column(s) using a case-insensitive temporary index:')
                     else
                        Plan('Result set will be ordered by the following '+
                             'column(s) using a case-sensitive temporary index:');
                     Plan('');
                     with FResultTable.GetIndexDefinition(0)^ do
                        begin
                        for I:=1 to KeyFieldCount do
                           begin
                           if (KeyFields[I] <> RECORDID_FIELD_NUM) and
                              (KeyFields[I] <> RECORDHASH_FIELD_NUM) then
                              begin
                              TempString:=FResultTable.GetFieldDefinition(KeyFields[I])^.FieldName;
                              if KeyDescendingFields[I] then
                                 TempString:=TempString+' '+PARSE_DESC
                              else
                                 TempString:=TempString+' '+PARSE_ASC;
                              Plan(TempString);
                              end;
                           end;
                        end;
                     Plan('');
                     end;
                  end
               else if FGroupedResult and (not FSingleRowResult) then
                  begin
                  Plan('Result set will be ordered by the temporary index created for the grouping');
                  Plan('');
                  end;
               if (FMergeQueries.Count <> 0) then
                  begin
                  Plan('Result set will be merged with another result set '+
                       'by the UNION, INTERSECT, or EXCEPT operations, and '+
                       'any distinct merging will use a temporary index');
                  Plan('');
                  end;
               end;
            FResultTable.DropFilter(nil,False);
            FResultTable.EmptyTable;
            if FDistinctResult then
               FResultTable.IndexName:=DISTINCT_INDEX_NAME
            else if FGroupedResult then
               begin
               if (not FSingleRowResult) then
                  FResultTable.IndexName:=GROUPBY_INDEX_NAME
               else
                  FResultTable.IndexName:='';
               end
            else
               begin
               if (FSubSelectType <> stSubSelect) and (FMergeType=mtNone) then
                  FResultTable.IndexName:=''
               else
                  FResultTable.IndexPos:=PHYSICAL_INDEX_POS;
               end;
            { If there is a WHERE clause then we need to
              evaluate it first }
            if FHasWhereExpression then
               begin
               { Version 5 }
               GenerateWherePlan;
               { Version 5 }
               EvaluateWhereExpression(True);
               end;
            if FJoinedResult and (not (FOrderedResult and FOrderByExistingIndex)) then
               ProcessJoins;
            if FHasWhereExpression then
               EvaluateWhereExpression(False);
            if GeneratePlan then
               begin
               if FHasScanExpressions then
                  begin
                  Plan('Scan Expression Execution');
                  Plan('-------------------------');
                  Plan('');
                  Plan('The expression:');
                  Plan('');
                  Plan(BuildExpressionLiteral(FScanExpressionTokens));
                  Plan('');
                  Plan('is UN-OPTIMIZED and will be applied to each candidate row in the result set '+
                       'as the result set is generated');
                  Plan('');
                  end;
               if FJoinedResult then
                  begin
                  Plan('Join Execution');
                  Plan('--------------');
                  Plan('');
                  if FJoinOptimizeCosts then
                     begin
                     Plan('Costs ARE being taken into account when executing this join');
                     Plan('Remove the JOINOPTIMIZECOSTS clause at the end of the SQL statement to '+
                          'force the optimizer to stop considering costs when optimizing this join');
                     Plan('');
                     end
                  else
                     begin
                     Plan('Costs ARE NOT being taken into account when executing this join');
                     Plan('Use the JOINOPTIMIZECOSTS clause at the end of the SQL statement to '+
                          'force the optimizer to consider costs when optimizing this join');
                     Plan('');
                     end;
                  end;
               end;
            if FGroupedResult and FSingleRowResult then
               ExecuteSingleRowSelectQuery
            else if FGroupedResult then
               ExecuteGroupedSelectQuery
            else if FDistinctResult then
               ExecuteDistinctSelectQuery
            { Version 5}
            else if FIdentityOnly then
               ExecuteIdentityQuery
            { Version 5}
            else
               ExecuteSelectQuery;
            ExecuteMerge;
            with FResultTable do
               begin
               ForceRefresh;
               IndexName:='';
               SetToBegin;
               end;
            end;
         FRowsAffected:=FResultTable.RecordCount;
         ResultSet:=FResultTable;
         FIsOpen:=True;
         end;
      INSERT_STATEMENT:
         begin
         { Reset the WHERE costs }
         FWhereCostSet:=False;
         FTotalWhereCost:=0;
         { First reset all source filters so that we don't mix filters }
         ResetAllSourceFilters;
         { Remove any temporary scan expressions }
         FHasTempScanExpressions:=False;
         FreeExpressionTokens(FTempScanExpressionTokens);
         { Now we need to re-verify any expressions if parameters are being used }
         if (FQueryStatement.ConstantParameters.Count > 0) then
            VerifyUpdateValues(True);
         if (FSubQueries.Count > 0) then
            begin
            { Refresh the source tables automatically }
            RefreshSourceTables;
            RefreshExtraTables;
            ExecuteSubSelectInsertQuery;
            end
         else
            ExecuteInsertQuery;
         end;
      UPDATE_STATEMENT:
         begin
         { Reset the WHERE costs }
         FWhereCostSet:=False;
         FTotalWhereCost:=0;
         { First reset all source filters so that we don't mix filters }
         ResetAllSourceFilters;
         { Remove any temporary scan expressions }
         FHasTempScanExpressions:=False;
         FreeExpressionTokens(FTempScanExpressionTokens);
         { Now we need to re-verify any expressions if parameters are being used }
         if (FQueryStatement.ConstantParameters.Count > 0) then
            begin
            VerifyUpdateValues(True);
            if FHasWhereExpression then
               VerifyWhereExpression(True);
            if FHasScanExpressions then
               VerifyScanExpression(True);
            if FJoinedResult then
               VerifyJoins(True);
            end;
         { Refresh the source tables automatically }
         RefreshSourceTables;
         RefreshExtraTables;
         ExecuteUpdateQuery;
         end;
      DELETE_STATEMENT:
         begin
         { Reset the WHERE costs }
         FWhereCostSet:=False;
         FTotalWhereCost:=0;
         { First reset all source filters so that we don't mix filters }
         ResetAllSourceFilters;
         { Remove any temporary scan expressions }
         FHasTempScanExpressions:=False;
         FreeExpressionTokens(FTempScanExpressionTokens);
         { Now we need to re-verify any expressions if parameters are being used }
         if (FQueryStatement.ConstantParameters.Count > 0) then
            begin
            if FHasWhereExpression then
               VerifyWhereExpression(True);
            if FHasScanExpressions then
               VerifyScanExpression(True);
            if FJoinedResult then
               VerifyJoins(True);
            end;
         { Refresh the source tables automatically }
         RefreshSourceTables;
         RefreshExtraTables;
         ExecuteDeleteQuery;
         end;
      CREATE_TABLE_STATEMENT:
         ExecuteCreateTableQuery;
      CREATE_INDEX_STATEMENT:
         ExecuteCreateIndexQuery;
      ALTER_TABLE_STATEMENT:
         ExecuteAlterTableQuery;
      EMPTY_TABLE_STATEMENT:
         ExecuteEmptyTableQuery;
      OPTIMIZE_TABLE_STATEMENT:
         ExecuteOptimizeTableQuery;
      EXPORT_TABLE_STATEMENT:
         ExecuteExportTableQuery;
      IMPORT_TABLE_STATEMENT:
         ExecuteImportTableQuery;
      VERIFY_TABLE_STATEMENT:
         ExecuteVerifyTableQuery;
      REPAIR_TABLE_STATEMENT:
         ExecuteRepairTableQuery;
      UPGRADE_TABLE_STATEMENT:
         ExecuteUpgradeTableQuery;
      DROP_TABLE_STATEMENT:
         ExecuteDropTableQuery;
      RENAME_TABLE_STATEMENT:
         ExecuteRenameTableQuery;
      DROP_INDEX_STATEMENT:
         ExecuteDropIndexQuery;
      START_TRANSACTION_STATEMENT:
         begin
         with DataDirectory do
            begin
            if (not InTransaction) then
               StartTransaction(False,FTransactionTables)
            else
               ExecuteError('Transaction already in progress for '+
                            FQueryStatement.ProperDataDirectoryName+' database');
            end;
         end;
      ROLLBACK_TRANSACTION_STATEMENT:
         begin
         with DataDirectory do
            begin
            if InTransaction then
               RollbackTransaction(False)
            else
               ExecuteError('No transaction in progress for '+
                            FQueryStatement.ProperDataDirectoryName+' database');
            end;
         end;
      COMMIT_TRANSACTION_STATEMENT:
         begin
         with DataDirectory do
            begin
            if InTransaction then
               CommitTransaction(FCommitFlush,True,False)
            else
               ExecuteError('No transaction in progress for '+
                            FQueryStatement.ProperDataDirectoryName+' database');
            end;
         end;
      end;
   EndTicks:=OSGetTickCount;
   if (EndTicks > BeginTicks) then
      FExecutionTime:=(OSCalcElapsedTime(BeginTicks,EndTicks)/1000)
   else
      FExecutionTime:=0;
   if GeneratePlan then
      begin
      if (FSubSelectType=stNone) and (FMergeType=mtNone) then
         begin
         Plan(Replicate('=',QUERY_PLAN_LENGTH));
         Plan('>>>>> '+IntToStr(FRowsAffected)+' rows affected in '+FloatToStr(FExecutionTime)+' seconds');
         Plan(Replicate('=',QUERY_PLAN_LENGTH));
         end
      else
         begin
         Plan(Replicate('-',QUERY_PLAN_LENGTH));
         Plan('');
         end
      end;
end;

procedure TDataQuery.BuildSubSelectFilter(NextToken: TExpToken);
begin
   if (FSubSelectFilterHandle <> nil) then
      FResultTable.ResetFilter(FSubSelectFilterHandle,nil,Integer(Self),
                               @TDataQuery.EvaluateResetFieldData,
                               FLocaleID)
   else
      begin
      FResultTable.AddFilter(0,nil,
               BuildNextSubSelectFilter(NextToken,Integer(Self),
                                   @TDataQuery.EvaluateExpressionFieldData,
                                   FLocaleID),True,nil,
                                   True,True,False,False,FSubSelectFilterHandle);
      if GeneratePlan then
         begin
         Plan('Sub-Query Execution');
         Plan('-------------------');
         Plan('');
         with TFilter(FSubSelectFilterHandle) do
            begin
            Plan('The expression:');
            Plan('');
            Plan(BuildExpressionLiteral(NextToken));
            Plan('');
            if Rewritten then
               Plan('has been rewritten and is '+GetOptimizeLevelText(OptimizeLevel)+
                    ' and is estimated to cost '+IntToStr(FilterTokens.OptimizeCost)+
                    ' bytes per candidate row')
            else
               Plan('is '+GetOptimizeLevelText(OptimizeLevel)+
                    ' and is estimated to cost '+IntToStr(FilterTokens.OptimizeCost)+
                    ' bytes per candidate row');
            Plan('');
            end;
         end;
      FResultTable.ActivateFilter(FSubSelectFilterHandle);
      end;
end;

function TDataQuery.BuildNextSubSelectFilter(NextToken: TExpToken;
                                             ClientData: Integer;
                                             FieldCallback: pEvaluateFieldCallback;
                                             LocaleID: Integer): TExpToken;
var
   I: Integer;
begin
   Result:=TExpToken.Create;
   Result.Copy(NextToken); 
   Result.ArgumentExpTokens.Clear;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result.LeftExpToken:=BuildNextSubSelectFilter(LeftExpToken,ClientData,
                                                          FieldCallback,
                                                          LocaleID);
         etBINARY:
            begin
            if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) then
               begin
               if IsCaseInsensitiveField(LeftExpToken) and
                  IsCaseInsensitiveToken(RightExpToken) and
                  (LeftExpToken.TokenOperator=RightExpToken.TokenOperator) then
                  Result.CaseInsensitive:=True;
               Result.LeftExpToken:=BuildNextSubSelectFilter(RightExpToken,ClientData,
                                                             FieldCallback,
                                                             LocaleID);
               Result.RightExpToken:=EvaluateConstant(RightExpToken,LeftExpToken,
                                                      nil,ClientData,FieldCallback,
                                                      LocaleID);
               { Be sure to assign tokens to use for further re-evaluation }
               Result.RightExpToken.ParamExpToken:=LeftExpToken;
               end
            else
               begin
               Result.LeftExpToken:=BuildNextSubSelectFilter(LeftExpToken,ClientData,
                                                             FieldCallback,
                                                             LocaleID);
               Result.RightExpToken:=BuildNextSubSelectFilter(RightExpToken,ClientData,
                                                              FieldCallback,
                                                              LocaleID);
               end;
            end;
         etEXTBINARY:
            begin
            if (TokenOperator in [eoSUBIN,eoNOTSUBIN]) then
               begin
               if IsCaseInsensitiveField(ArgumentExpToken[0]) and
                  IsCaseInsensitiveToken(ArgumentExpToken[1]) and
                  (ArgumentExpToken[0].TokenOperator=ArgumentExpToken[1].TokenOperator) then
                  Result.CaseInsensitive:=True;
               Result.TokenType:=etBINARY;
               Result.TokenOperator:=eoEQ;
               Result.LeftExpToken:=BuildNextSubSelectFilter(ArgumentExpToken[1],
                                                             ClientData,
                                                             FieldCallback,
                                                             LocaleID);
               Result.RightExpToken:=EvaluateConstant(ArgumentExpToken[1],
                                                      ArgumentExpToken[0],
                                                      nil,ClientData,FieldCallback,
                                                      LocaleID);
               { Be sure to assign tokens to use for further re-evaluation }
               Result.RightExpToken.ParamExpToken:=ArgumentExpToken[0];
               end;
            end;
         etFUNC:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               begin
               if (not ContainsFields(ArgumentExpToken[I])) then
                  Result.ArgumentExpTokens.Add(EvaluateConstant(ArgumentExpToken[I],
                                                                ArgumentExpToken[I],
                                                                nil,ClientData,
                                                                FieldCallback,
                                                                LocaleID))
               else
                  Result.ArgumentExpTokens.Add(BuildNextSubSelectFilter(ArgumentExpToken[I],
                                                                        ClientData,
                                                                        FieldCallback,
                                                                        LocaleID));
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.GroupRecords(SourceRecordBuffer: PChar;
                                  DestRecordBuffer: PChar);
var
   I: Integer;
   TempSourceFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   SourceIsBlank: Boolean;
   TempResultFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   ResultIsBlank: Boolean;
begin
   for I:=0 to FResultFields.Count-1 do
      begin
      with TResultField(FResultFields[I]) do
         begin
         if (CalculationType <> rcNone) then
            begin
            FResultTable.GetField(ResultNum,
                                  SourceRecordBuffer,
                                  @TempSourceFieldBuffer,SourceIsBlank);
            FResultTable.GetField(ResultNum,
                                  DestRecordBuffer,
                                  @TempResultFieldBuffer,ResultIsBlank);
            if (not SourceIsBlank) then
               begin
               ProcessCalculation(CalculationType,
                                  ResultDataType,
                                  ResultDataDecimals,
                                  @TempSourceFieldBuffer,
                                  SourceIsBlank,
                                  @TempResultFieldBuffer,
                                  ResultIsBlank);
               FResultTable.PutField(ResultNum,DestRecordBuffer,
                                     @TempResultFieldBuffer,True,False);
               end
            { Always return 0 for COUNT, it is the exception to the NULL rules }
            else if (CalculationType=rcCount) then
               FResultTable.PutField(ResultNum,DestRecordBuffer,
                                     @TempResultFieldBuffer,True,False);
            case CalculationType of
               rcAvg:
                  begin
                  FResultTable.GetField(CountNum,
                                        DestRecordBuffer,
                                        @TempResultFieldBuffer,ResultIsBlank);
                  if (not SourceIsBlank) then
                     begin
                     ProcessCalculation(rcCount,TYPE_INT32,0,
                                        @TempSourceFieldBuffer,
                                        SourceIsBlank,
                                        @TempResultFieldBuffer,
                                        ResultIsBlank);
                     FResultTable.PutField(CountNum,DestRecordBuffer,
                                           @TempResultFieldBuffer,True,False);
                     end;
                  end;
               rcStdDev:
                  begin
                  FResultTable.GetField(SumNum,
                                        SourceRecordBuffer,
                                        @TempSourceFieldBuffer,SourceIsBlank);
                  FResultTable.GetField(SumNum,
                                        DestRecordBuffer,
                                        @TempResultFieldBuffer,ResultIsBlank);
                  if (not SourceIsBlank) then
                     begin
                     ProcessCalculation(rcSum,TYPE_FLOAT,0,
                                        @TempSourceFieldBuffer,
                                        SourceIsBlank,
                                        @TempResultFieldBuffer,
                                        ResultIsBlank);
                     FResultTable.PutField(SumNum,DestRecordBuffer,
                                           @TempResultFieldBuffer,True,False);
                     end;
                  FResultTable.GetField(CountNum,
                                        DestRecordBuffer,
                                        @TempResultFieldBuffer,ResultIsBlank);
                  if (not SourceIsBlank) then
                     begin
                     ProcessCalculation(rcCount,TYPE_INT32,0,
                                        @TempSourceFieldBuffer,
                                        SourceIsBlank,
                                        @TempResultFieldBuffer,
                                        ResultIsBlank);
                     FResultTable.PutField(CountNum,DestRecordBuffer,
                                           @TempResultFieldBuffer,True,False);
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.CalculateGroupRecord(SourceRecordBuffer: PChar);
var
   I: Integer;
   TempSourceFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   SourceIsBlank: Boolean;
   TempResultFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   ResultIsBlank: Boolean;
begin
   for I:=0 to FResultFields.Count-1 do
      begin
      with TResultField(FResultFields[I]) do
         begin
         case CalculationType of
            rcAvg:
               begin
               FResultTable.GetField(ResultNum,SourceRecordBuffer,
                                     @TempSourceFieldBuffer,SourceIsBlank);
               FResultTable.GetField(CountNum,SourceRecordBuffer,
                                     @TempResultFieldBuffer,ResultIsBlank);
               if (not SourceIsBlank) then
                  begin
                  { Now calculate the average }
                  case ResultDataType of
                     TYPE_INT32,TYPE_DATE,TYPE_TIME:
                        begin
                        if (pInteger(@TempResultFieldBuffer)^ <> 0) then
                           pInteger(@TempSourceFieldBuffer)^:=pInteger(@TempSourceFieldBuffer)^ div
                                                              pInteger(@TempResultFieldBuffer)^
                        else
                           pInteger(@TempSourceFieldBuffer)^:=0;
                        end;
                     TYPE_INT64:
                        begin
                        if (pInteger(@TempResultFieldBuffer)^ <> 0) then
                           pInt64(@TempSourceFieldBuffer)^:=pInt64(@TempSourceFieldBuffer)^ div
                                                            pInteger(@TempResultFieldBuffer)^
                        else
                           pInt64(@TempSourceFieldBuffer)^:=0;
                        end;
                     TYPE_BCD:
                        begin
                        if (pInteger(@TempResultFieldBuffer)^ <> 0) then
                           pBCD(@TempSourceFieldBuffer)^:=CurrToTBCD((TBCDToCurr(pBCD(@TempSourceFieldBuffer)^) /
                                                                      pInteger(@TempResultFieldBuffer)^),
                                                                       ResultDataDecimals)
                        else
                           pBCD(@TempSourceFieldBuffer)^:=CurrToTBCD(0,ResultDataDecimals);
                        end;
                     TYPE_FLOAT,TYPE_TIMESTAMP:
                        begin
                        if (pInteger(@TempResultFieldBuffer)^ <> 0) then
                           pDouble(@TempSourceFieldBuffer)^:=(pDouble(@TempSourceFieldBuffer)^ /
                                                              pInteger(@TempResultFieldBuffer)^)
                        else
                           pDouble(@TempSourceFieldBuffer)^:=0;
                        end;
                     end;
                  FResultTable.PutField(ResultNum,SourceRecordBuffer,
                                        @TempSourceFieldBuffer,True,False);
                  end;
               end;
            rcStdDev:
               begin
               FResultTable.GetField(SumNum,SourceRecordBuffer,
                                     @TempSourceFieldBuffer,SourceIsBlank);
               FResultTable.GetField(CountNum,SourceRecordBuffer,
                                     @TempResultFieldBuffer,ResultIsBlank);
               if (not SourceIsBlank) then
                  begin
                  { Now divide the square of the sum by the total count }
                  if (pInteger(@TempResultFieldBuffer)^ <> 0) then
                     pDouble(@TempSourceFieldBuffer)^:=(Sqr(pDouble(@TempSourceFieldBuffer)^) /
                                                        pInteger(@TempResultFieldBuffer)^)
                  else
                     pDouble(@TempSourceFieldBuffer)^:=0;
                  FResultTable.GetField(ResultNum,SourceRecordBuffer,
                                        @TempResultFieldBuffer,ResultIsBlank);
                  { Now subtract the above figure from the sum of the squares to
                    get the total variance }
                  pDouble(@TempSourceFieldBuffer)^:=(pDouble(@TempResultFieldBuffer)^-
                                                     pDouble(@TempSourceFieldBuffer)^);
                  { Now divide that result by the total count-1 to get variance, and
                    take the square root to get the std dev }
                  FResultTable.GetField(CountNum,SourceRecordBuffer,
                                        @TempResultFieldBuffer,ResultIsBlank);
                  if ((pInteger(@TempResultFieldBuffer)^-1) <> 0) then
                     pDouble(@TempSourceFieldBuffer)^:=Sqrt(pDouble(@TempSourceFieldBuffer)^ /
                                                            (pInteger(@TempResultFieldBuffer)^-1))
                  else
                     pDouble(@TempSourceFieldBuffer)^:=0;
                  FResultTable.PutField(ResultNum,SourceRecordBuffer,
                                        @TempSourceFieldBuffer,True,False);
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.InitializeRunSum(SourceRecordBuffer: PChar;
                                      DestRecordBuffer: PChar);
var
   I: Integer;
   TempSourceFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   SourceIsBlank: Boolean;
begin
   for I:=0 to FResultFields.Count-1 do
      begin
      with TResultField(FResultFields[I]) do
         begin
         if (CalculationType=rcRunSum) then
            begin
            FResultTable.GetField(ResultNum,SourceRecordBuffer,
                                  @TempSourceFieldBuffer,SourceIsBlank);
            if (not SourceIsBlank) then
               FResultTable.PutField(ResultNum,DestRecordBuffer,
                                     @TempSourceFieldBuffer,True,False);
            end;
         end;
      end;
end;

procedure TDataQuery.RunSumRecords(SourceRecordBuffer: PChar;
                                   DestRecordBuffer: PChar);
var
   I: Integer;
   TempSourceFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   SourceIsBlank: Boolean;
   TempResultFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   ResultIsBlank: Boolean;
begin
   for I:=0 to FResultFields.Count-1 do
      begin
      with TResultField(FResultFields[I]) do
         begin
         if (CalculationType=rcRunSum) then
            begin
            FResultTable.GetField(ResultNum,SourceRecordBuffer,
                                  @TempSourceFieldBuffer,SourceIsBlank);
            FResultTable.GetField(ResultNum,DestRecordBuffer,
                                  @TempResultFieldBuffer,ResultIsBlank);
            if (not SourceIsBlank) then
               begin
               case ResultDataType of
                  TYPE_INT32:
                     pInteger(@TempResultFieldBuffer)^:=(pInteger(@TempResultFieldBuffer)^+
                                                         pInteger(@TempSourceFieldBuffer)^);
                  TYPE_INT64:
                     pInt64(@TempResultFieldBuffer)^:=(pInt64(@TempResultFieldBuffer)^+
                                                       pInt64(@TempSourceFieldBuffer)^);
                  TYPE_BCD:
                     pBCD(@TempResultFieldBuffer)^:=CurrToTBCD((TBCDToCurr(pBCD(@TempResultFieldBuffer)^)+
                                                                TBCDToCurr(pBCD(@TempSourceFieldBuffer)^)),
                                                                           DataDecimals);
                  TYPE_FLOAT:
                     pDouble(@TempResultFieldBuffer)^:=(pDouble(@TempResultFieldBuffer)^+
                                                        pDouble(@TempSourceFieldBuffer)^);
                  end;
               FResultTable.PutField(ResultNum,DestRecordBuffer,
                                     @TempResultFieldBuffer,True,False);
               end;
            if (not ResultIsBlank) then
               FResultTable.PutField(ResultNum,SourceRecordBuffer,
                                     @TempResultFieldBuffer,True,False);
            end;
         end;
      end;
end;

function TDataQuery.HavingRecord(SourceRecordBuffer: PChar): Boolean;
begin
   Result:=EvaluateHavingExpression(SourceRecordBuffer);
end;

procedure TDataQuery.ExecuteSingleRowSelectQuery;
var
   TempAbort: Boolean;
   TempRecordNumber: Integer;
   LastRecordNumber: Integer;
   TempPercentDone: Word;
   TempLastPercentDone: Word;
   TempRecordCount: Integer;
   TempRecordBuffer: PChar;
   TempNewRecordBuffer: PChar;
   TempResultCount: Integer;
   TempGroupNumber: Integer;
   TempIsBlank: Boolean;
   I: Integer;
begin
   TempRecordBuffer:=AllocMem(FResultTable.RecordSize);
   TempNewRecordBuffer:=AllocMem(FResultTable.RecordSize);
   try
      TempAbort:=False;
      TempRecordNumber:=1;
      TempRecordCount:=MasterSourceTable.DataCursor.RecordCount;
      TempResultCount:=0;
      TempGroupNumber:=1;
      TempLastPercentDone:=0;
      { Check to see if we're dealing with a simple
        RecordCount situation with the Count aggregate }
      if FSimpleFunctionResult then
         begin
         with TResultField(FResultFields[0]) do
            begin
            case CalculationType of
               rcCount:
                  begin
                  TempRecordCount:=MasterSourceTable.DataCursor.RecordCount;
                  FResultTable.PutField(ResultNum,TempNewRecordBuffer,@TempRecordCount,
                                        True,False);
                  end;
               rcMin:
                  begin
                  MasterSourceTable.DataCursor.IndexPos:=FSimpleFunctionIndexPos;
                  try
                     if MasterSourceTable.DataCursor.GetIndexDefinition(FSimpleFunctionIndexPos)^.KeyDescendingFields[1] then
                        begin
                        if LastRecordRead then
                           begin
                           while True do
                              begin
                              with MasterSourceTable do
                                 begin
                                 DataCursor.GetPhysicalField(FieldNum,CurRecordBuffer,nil,
                                                             TempIsBlank);
                                 if (not TempIsBlank) then
                                    Break;
                                 end;
                              if (not PriorRecordRead) then
                                 Exit;
                              end;
                           FResultTable.InitRecord(TempNewRecordBuffer);
                           PopulateResultRecord(TempNewRecordBuffer);
                           if FHasExpressions then
                              EvaluateResultFields(TempNewRecordBuffer);
                           end;
                        end
                     else
                        begin
                        if FirstRecordRead then
                           begin
                           while True do
                              begin
                              with MasterSourceTable do
                                 begin
                                 DataCursor.GetPhysicalField(FieldNum,CurRecordBuffer,nil,
                                                             TempIsBlank);
                                 if (not TempIsBlank) then
                                    Break;
                                 end;
                              if (not NextRecordRead) then
                                 Exit;
                              end;
                           FResultTable.InitRecord(TempNewRecordBuffer);
                           PopulateResultRecord(TempNewRecordBuffer);
                           if FHasExpressions then
                              EvaluateResultFields(TempNewRecordBuffer);
                           end;
                        end;
                  finally
                     MasterSourceTable.DataCursor.IndexPos:=PHYSICAL_INDEX_POS;
                  end;
                  end;
               rcMax:
                  begin
                  MasterSourceTable.DataCursor.IndexPos:=FSimpleFunctionIndexPos;
                  try
                     if MasterSourceTable.DataCursor.GetIndexDefinition(FSimpleFunctionIndexPos)^.KeyDescendingFields[1] then
                        begin
                        if FirstRecordRead then
                           begin
                           while True do
                              begin
                              with MasterSourceTable do
                                 begin
                                 DataCursor.GetPhysicalField(FieldNum,CurRecordBuffer,nil,
                                                             TempIsBlank);
                                 if (not TempIsBlank) then
                                    Break;
                                 end;
                              if (not NextRecordRead) then
                                 Exit;
                              end;
                           FResultTable.InitRecord(TempNewRecordBuffer);
                           PopulateResultRecord(TempNewRecordBuffer);
                           if FHasExpressions then
                              EvaluateResultFields(TempNewRecordBuffer);
                           end;
                        end
                     else
                        begin
                        if LastRecordRead then
                           begin
                           while True do
                              begin
                              with MasterSourceTable do
                                 begin
                                 DataCursor.GetPhysicalField(FieldNum,CurRecordBuffer,nil,
                                                             TempIsBlank);
                                 if (not TempIsBlank) then
                                    Break;
                                 end;
                              if (not PriorRecordRead) then
                                 Exit;
                              end;
                           FResultTable.InitRecord(TempNewRecordBuffer);
                           PopulateResultRecord(TempNewRecordBuffer);
                           if FHasExpressions then
                              EvaluateResultFields(TempNewRecordBuffer);
                           end;
                        end;
                  finally
                     MasterSourceTable.DataCursor.IndexPos:=PHYSICAL_INDEX_POS;
                  end;
                  end;
               end;
            end;
         end
      else
         begin
         { Now set to the beginning of the source table(s)
           and continue }
         if FirstRecordRead then
            begin
            LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
            while (not TempAbort) do
               begin
               if (MasterSourceTable.DataCursor.PhysicalRecordNumber <> LastRecordNumber) then
                  begin
                  LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
                  TempPercentDone:=Trunc(((TempRecordNumber/TempRecordCount)*100));
                  if (TempPercentDone >= (TempLastPercentDone+ProgressPercent)) then
                     begin
                     AbortProgress(TempPercentDone,TempAbort);
                     TempLastPercentDone:=TempPercentDone;
                     end;
                  Inc(TempRecordNumber);
                  end;
               if FHasScanExpressions and
                  (not EvaluateScanExpression) then
                  begin
                  if (not NextRecordRead) then
                     Break
                  else
                     Continue;
                  end;
               if FHasTempScanExpressions and
                  (not EvaluateTempScanExpression) then
                  begin
                  if (not NextRecordRead) then
                     Break
                  else
                     Continue;
                  end;
               if HitMaxRows(TempResultCount) then
                  Break;
               FResultTable.InitRecord(TempRecordBuffer);
               PopulateResultRecord(TempRecordBuffer);
               if FHasExpressions then
                  EvaluateResultFields(TempRecordBuffer);
               if (TempGroupNumber=1) then
                  Move(TempRecordBuffer^,TempNewRecordBuffer^,FResultTable.RecordSize)
               else
                  GroupRecords(TempRecordBuffer,TempNewRecordBuffer);
               Inc(TempResultCount);
               if (not NextRecordRead) then
                  Break;
               Inc(TempGroupNumber);
               end;
            end
         else
            begin
            { Check for COUNT() function }
            for I:=0 to FResultFields.Count-1 do
               begin
               with TResultField(FResultFields[I]) do
                  begin
                  case CalculationType of
                     rcCount:
                        begin
                        TempRecordCount:=0;
                        FResultTable.PutField(ResultNum,TempNewRecordBuffer,@TempRecordCount,
                                              True,False);
                        end;
                     end;
                  end;
               end;
            end;
         end;
      if (not TempAbort) then
         begin
         if FHasAvgs or FHasStdDevs then
            CalculateGroupRecord(TempNewRecordBuffer);
         { Version 5 }
         if FHasAggregateCalcs then
            EvaluateAggregateResultFields(TempNewRecordBuffer);
         { Version 5 }
         FResultTable.AppendRecord(TempNewRecordBuffer,True,True,True,True);
         if (TempLastPercentDone <> 100) then
            AbortProgress(100,TempAbort);
         end;
   finally
      DeAllocMem(TempRecordBuffer);
      DeAllocMem(TempNewRecordBuffer);
   end;
end;

function TDataQuery.HitMaxRows(TotalCount: Integer): Boolean;
begin
   Result:=((FMaxNumOfRows >= 0) and (TotalCount >= FMaxNumOfRows)) or
           ((FTopRows <> -1) and
            ((FMergeQueries.Count=0) and
             (not FHavingResult) and (not FGroupedResult) and (not FDistinctResult)) and
            ((not FOrderedResult) or (FOrderedResult and FOrderByExistingIndex)) and
             (TotalCount=FTopRows));
end;

procedure TDataQuery.AddTopRow(RecordBuffer: PChar; NewRecordBuffer: PChar;
                               SetRecordHash: Boolean);
var
   SaveIndexPos: Byte;
begin
   with FResultTable do
      begin
      SaveIndexPos:=IndexPos;
      try
         IndexPos:=0;
         if (RecordCount < FTopRows) then
            AppendRecord(RecordBuffer,True,True,True,True)
         else
            begin
            CompareFind(RecordBuffer,FOrderByFields.Count);
            if (RecordNumber <= FTopRows) then
               begin
               AppendRecord(RecordBuffer,True,True,True,True);
               SetToEnd;
               GetCurrentRecord(NewRecordBuffer,False);
               DeleteRecord(NewRecordBuffer,True);
               end;
            end;
      finally
         IndexPos:=SaveIndexPos;
      end;
      end;
end;

{ Version 5}
procedure TDataQuery.ExecuteIdentityQuery;
var
   TempNewRecordBuffer: PChar;
   TempIdentity: Integer;
begin
   TempNewRecordBuffer:=AllocMem(FResultTable.RecordSize);
   try
      TempIdentity:=DataSession.SessionLastAutoInc;
      FResultTable.PutField(1,TempNewRecordBuffer,@TempIdentity,True,False);
      FResultTable.AppendRecord(TempNewRecordBuffer,False,True,True,True);
   finally
      DeAllocMem(TempNewRecordBuffer);
   end;
end;
{ Version 5}

procedure TDataQuery.ExecuteSelectQuery;
var
   I: Integer;
   TempAbort: Boolean;
   TempRecordNumber: Integer;
   LastRecordNumber: Integer;
   TempRecordCount: Integer;
   TempPercentDone: Word;
   TempLastPercentDone: Word;
   TempRecordBuffer: PChar;
   TempNewRecordBuffer: PChar;
   TempResultCount: Integer;
begin
   TempRecordBuffer:=AllocMem(FResultTable.RecordSize);
   TempNewRecordBuffer:=AllocMem(FResultTable.RecordSize);
   try
     { Now set to the beginning of the source table(s)
        and continue }
      TempAbort:=False;
      TempRecordNumber:=1;
      TempRecordCount:=MasterSourceTable.DataCursor.RecordCount;
      TempLastPercentDone:=0;
      TempResultCount:=0;
      { If there is no order to the result set then set the order based
        upon the record ID order of the only source table }
      if FResultTable.AutoPrimaryIndex and (FSourceTables.Count=1)then
         FResultTable.SuppressRecordIDs:=True;
      try
         { If we can use an index for the ORDER BY then do so now }
         if FOrderedResult and FOrderByExistingIndex then
            MasterSourceTable.DataCursor.IndexPos:=FOrderByIndexPos;
         if FirstRecordRead then
            begin
            LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
            while (not TempAbort) do
               begin
               try
                  if (MasterSourceTable.DataCursor.PhysicalRecordNumber <> LastRecordNumber) then
                     begin
                     LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
                     TempPercentDone:=Trunc(((TempRecordNumber/TempRecordCount)*100));
                     if (TempPercentDone >= (TempLastPercentDone+ProgressPercent)) then
                        begin
                        AbortProgress(TempPercentDone,TempAbort);
                        TempLastPercentDone:=TempPercentDone;
                        end;
                     Inc(TempRecordNumber);
                     end;
                  if FHasScanExpressions and
                     (not EvaluateScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  if FHasTempScanExpressions and
                     (not EvaluateTempScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  FResultTable.InitRecord(TempRecordBuffer);
                  PopulateResultRecord(TempRecordBuffer);
                  if FHasExpressions then
                     EvaluateResultFields(TempRecordBuffer);
                  if HitMaxRows(TempResultCount) then
                     Break;
                  with FResultTable do
                     begin
                     if SuppressRecordIDs then
                        PutRecordID(GetRecordID(TSourceTable(FSourceTables[0]).CurRecordBuffer),
                                    TempRecordBuffer);
                     if ((FTopRows <> -1) and (FMergeQueries.Count=0) and
                        ((not FOrderedResult) or FOrderedResult and (not FOrderByExistingIndex))) then
                        AddTopRow(TempRecordBuffer,TempNewRecordBuffer,True)
                     else
                        AppendRecord(TempRecordBuffer,False,True,True,True);
                     Inc(TempResultCount);
                     end;
               finally
                  if FHasBlobFields then
                     begin
                     for I:=0 to FSourceTables.Count-1 do
                        begin
                        with TSourceTable(FSourceTables[I]) do
                           begin
                           DataCursor.UpdateBlobBlocks(CurRecordBuffer,False);
                           DataCursor.FreeAllBlobs(False,False);
                           end;
                        end;
                     end;
               end;
               if (not NextRecordRead) then
                  Break;
               end;
            end;
         if (not TempAbort) then
            begin
            if (TempLastPercentDone <> 100) then
               AbortProgress(100,TempAbort);
            end;
      finally
         FResultTable.SuppressRecordIDs:=False;
      end;
   finally
      DeAllocMem(TempNewRecordBuffer);
      DeAllocMem(TempRecordBuffer);
   end;
end;

procedure TDataQuery.ExecuteGroupedSelectQuery;
var
   I: Integer;
   TempAbort: Boolean;
   TempRecordNumber: Integer;
   LastRecordNumber: Integer;
   TempRecordCount: Integer;
   TempPercentDone: Word;
   TempLastPercentDone: Word;
   TempRecordBuffer: PChar;
   TempNewRecordBuffer: PChar;
   TempResultCount: Integer;
   TempGroupNumber: Integer;
begin
   TempRecordBuffer:=AllocMem(FResultTable.RecordSize);
   TempNewRecordBuffer:=AllocMem(FResultTable.RecordSize);
   try
     { Now set to the beginning of the source table(s)
        and continue }
      TempAbort:=False;
      TempRecordNumber:=1;
      TempRecordCount:=MasterSourceTable.DataCursor.RecordCount;
      TempLastPercentDone:=0;
      TempResultCount:=0;
      if FirstRecordRead then
         begin
         LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
         while (not TempAbort) do
            begin
            try
               if (MasterSourceTable.DataCursor.PhysicalRecordNumber <> LastRecordNumber) then
                  begin
                  LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
                  TempPercentDone:=Trunc(((TempRecordNumber/TempRecordCount)*100));
                  if (TempPercentDone >= (TempLastPercentDone+ProgressPercent)) then
                     begin
                     AbortProgress(TempPercentDone,TempAbort);
                     TempLastPercentDone:=TempPercentDone;
                     end;
                  Inc(TempRecordNumber);
                  end;
               if FHasScanExpressions and
                  (not EvaluateScanExpression) then
                  begin
                  if (not NextRecordRead) then
                     Break
                  else
                     Continue;
                  end;
               if FHasTempScanExpressions and
                  (not EvaluateTempScanExpression) then
                  begin
                  if (not NextRecordRead) then
                     Break
                  else
                     Continue;
                  end;
               FResultTable.InitRecord(TempRecordBuffer);
               PopulateResultRecord(TempRecordBuffer);
               if FHasExpressions then
                  EvaluateResultFields(TempRecordBuffer);
               if HitMaxRows(TempResultCount) then
                  Break;
               with FResultTable do
                  begin
                  if ExactFind(TempRecordBuffer,TempNewRecordBuffer) then
                     begin
                     GroupRecords(TempRecordBuffer,TempNewRecordBuffer);
                     ModifyRecord(TempNewRecordBuffer,False,False,True);
                     end
                  else
                     AppendRecord(TempRecordBuffer,True,True,True,True);
                  Inc(TempResultCount);
                  end;
            finally
               if FHasBlobFields then
                  begin
                  for I:=0 to FSourceTables.Count-1 do
                     begin
                     with TSourceTable(FSourceTables[I]) do
                        begin
                        DataCursor.UpdateBlobBlocks(CurRecordBuffer,False);
                        DataCursor.FreeAllBlobs(False,False);
                        end;
                     end;
                  end;
            end;
            if (not NextRecordRead) then
               Break;
            end;
         if (not TempAbort) then
            begin
            { Now handle averages, runsums, and having filters }
            if FHasAggregateCalcs or FHasRunSums or
               FHasAvgs or FHasStdDevs or FHavingResult then
               begin
               with FResultTable do
                  begin
                  IndexPos:=0;
                  SetToBegin;
                  TempGroupNumber:=1;
                  if (GetNextRecord(TempRecordBuffer)=DBISAM_NONE) then
                     begin
                     FResultTable.InitRecord(TempNewRecordBuffer);
                     while (not TempAbort) do
                        begin
                        if FHasAvgs or FHasStdDevs then
                           CalculateGroupRecord(TempRecordBuffer);
                        if FHasRunSums then
                           begin
                           if (TempGroupNumber=1) then
                              InitializeRunSum(TempRecordBuffer,TempNewRecordBuffer)
                           else
                              RunSumRecords(TempRecordBuffer,TempNewRecordBuffer);
                           end;
                        if FHasAggregateCalcs then
                           EvaluateAggregateResultFields(TempRecordBuffer);
                        if (FHasAggregateCalcs or FHasRunSums or
                            FHasAvgs or FHasStdDevs) then
                           ModifyRecord(TempRecordBuffer,False,False,True);
                        if (GetNextRecord(TempRecordBuffer) <> DBISAM_NONE) then
                           Break;
                        Inc(TempGroupNumber);
                        end;
                     end;
                  { Now deal with the HAVING clause }
                  if FHavingResult then
                     begin
                     SetToBegin;
                     if (GetNextRecord(TempRecordBuffer)=DBISAM_NONE) then
                        begin
                        while True do
                           begin
                           if (not HavingRecord(TempRecordBuffer)) then
                              begin
                              DeleteRecord(TempRecordBuffer,True);
                              if (GetCurrentRecord(TempRecordBuffer,False) <> DBISAM_NONE) then
                                 Break;
                              end
                           else
                              begin
                              if (GetNextRecord(TempRecordBuffer) <> DBISAM_NONE) then
                                 Break;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            { Now process the top rows, if necessary }
            if (FMergeQueries.Count=0) and (FTopRows <> -1) then
               begin
               with FResultTable do
                  begin
                  IndexName:='';
                  SetToEnd;
                  while (RecordCount > FTopRows) do
                     begin
                     GetCurrentRecord(TempRecordBuffer,False);
                     DeleteRecord(TempRecordBuffer,True);
                     end;
                  end;
               end
            else
               FResultTable.IndexName:='';
            end;
         end;
      if (not TempAbort) then
         begin
         if (TempLastPercentDone <> 100) then
            AbortProgress(100,TempAbort);
         end;
   finally
      DeAllocMem(TempNewRecordBuffer);
      DeAllocMem(TempRecordBuffer);
   end;
end;

procedure TDataQuery.ExecuteDistinctSelectQuery;
var
   I: Integer;
   TempAbort: Boolean;
   TempRecordNumber: Integer;
   LastRecordNumber: Integer;
   TempRecordCount: Integer;
   TempPercentDone: Word;
   TempLastPercentDone: Word;
   TempRecordBuffer: PChar;
   TempNewRecordBuffer: PChar;
   TempResultCount: Integer;
begin
   TempRecordBuffer:=AllocMem(FResultTable.RecordSize);
   TempNewRecordBuffer:=AllocMem(FResultTable.RecordSize);
   try
     { Now set to the beginning of the source table(s)
        and continue }
      TempAbort:=False;
      TempRecordNumber:=1;
      TempRecordCount:=MasterSourceTable.DataCursor.RecordCount;
      TempLastPercentDone:=0;
      TempResultCount:=0;
      { If there is no order to the result set then set the order based
        upon the record ID order of the only source table }
      if FResultTable.AutoPrimaryIndex and (FSourceTables.Count=1)then
         FResultTable.SuppressRecordIDs:=True;
      try
         { If we can use an index for the ORDER BY then do so now }
         if FOrderedResult and FOrderByExistingIndex then
            MasterSourceTable.DataCursor.IndexPos:=FOrderByIndexPos;
         if FirstRecordRead then
            begin
            LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
            while (not TempAbort) do
               begin
               try
                  if (MasterSourceTable.DataCursor.PhysicalRecordNumber <> LastRecordNumber) then
                     begin
                     LastRecordNumber:=MasterSourceTable.DataCursor.PhysicalRecordNumber;
                     TempPercentDone:=Trunc(((TempRecordNumber/TempRecordCount)*100));
                     if (TempPercentDone >= (TempLastPercentDone+ProgressPercent)) then
                        begin
                        AbortProgress(TempPercentDone,TempAbort);
                        TempLastPercentDone:=TempPercentDone;
                        end;
                     Inc(TempRecordNumber);
                     end;
                  if FHasScanExpressions and
                     (not EvaluateScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  if FHasTempScanExpressions and
                     (not EvaluateTempScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  FResultTable.InitRecord(TempRecordBuffer);
                  PopulateResultRecord(TempRecordBuffer);
                  if FHasExpressions then
                     EvaluateResultFields(TempRecordBuffer);
                  if HitMaxRows(TempResultCount) then
                     Break;
                  with FResultTable do
                     begin
                     if SuppressRecordIDs then
                        PutRecordID(GetRecordID(TSourceTable(FSourceTables[0]).CurRecordBuffer),
                                    TempRecordBuffer);
                     PutRecordHash(MD5Buffer((TempRecordBuffer+SizeOf(TRecordHeader))^,
                                  (RecordSize-SizeOf(TRecordHeader))),TempRecordBuffer);
                     if (not ExactFind(TempRecordBuffer,TempNewRecordBuffer)) then
                        begin
                        if ((FTopRows <> -1) and (FMergeQueries.Count=0) and
                           ((not FOrderedResult) or FOrderedResult and (not FOrderByExistingIndex))) then
                           AddTopRow(TempRecordBuffer,TempNewRecordBuffer,False)
                        else
                           AppendRecord(TempRecordBuffer,True,False,True,True);
                        end;
                     Inc(TempResultCount);
                     end;
               finally
                  if FHasBlobFields then
                     begin
                     for I:=0 to FSourceTables.Count-1 do
                        begin
                        with TSourceTable(FSourceTables[I]) do
                           begin
                           DataCursor.UpdateBlobBlocks(CurRecordBuffer,False);
                           DataCursor.FreeAllBlobs(False,False);
                           end;
                        end;
                     end;
               end;
               if (not NextRecordRead) then
                  Break;
               end;
            end;
         if (not TempAbort) then
            begin
            if (TempLastPercentDone <> 100) then
               AbortProgress(100,TempAbort);
            end;
      finally
         FResultTable.SuppressRecordIDs:=False;
      end;
   finally
      DeAllocMem(TempNewRecordBuffer);
      DeAllocMem(TempRecordBuffer);
   end;
end;

procedure TDataQuery.ExecuteMerge;
var
   TempMergeQuery: TDataQuery;
   LastMergeQuery: TDataQuery;
   I: Integer;
   J: Integer;
   TempSourceRecordBuffer: PChar;
   TempResultRecordBuffer: PChar;
   TempNewRecordBuffer: PChar;
   TempFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   BlobHandle: Integer;
   BlobSizeToLoad: Integer;
   BlobSize: Integer;
   IsBlank: Boolean;
begin
   if (FMergeQueries.Count > 0) then
      begin
         TempResultRecordBuffer:=AllocMem(FResultTable.RecordSize);
         TempNewRecordBuffer:=AllocMem(FResultTable.RecordSize);
         try
            FResultTable.ForceRefresh;
            LastMergeQuery:=FMergeQueries.Last;
            for I:=0 to FMergeQueries.Count-1 do
               begin
               TempMergeQuery:=FMergeQueries[I];
               TempSourceRecordBuffer:=AllocMem(TempMergeQuery.ResultTable.RecordSize);
               try
                  { If not dealing with a UNION ALL situation exclusively, then
                    add the appropriate merge index for dealing with the merges }
                  if (not ((TempMergeQuery.MergeType=mtUnionAll) and
                           (LastMergeQuery.MergeType=mtUnionAll))) then
                     AddMergeIndex(TempMergeQuery.MergeType);
                  try
                     with FResultTable do
                        begin
                        TempMergeQuery.ResultTable.SetToBegin;
                        while (TempMergeQuery.ResultTable.GetNextRecord(TempSourceRecordBuffer)=DBISAM_NONE) do
                           begin
                           if (TempMergeQuery.ResultTable.GetRecordStatus(TempSourceRecordBuffer)=RECORD_VALID) then
                              begin
                              InitRecord(TempResultRecordBuffer);
                              for J:=0 to (TempMergeQuery.ResultFields.Count-TempMergeQuery.HiddenResultFields.Count-1) do
                                 begin
                                 with TResultField(TempMergeQuery.ResultFields[J]) do
                                    begin
                                    if (ResultDataType=TYPE_BLOB) then
                                       begin
                                       TempMergeQuery.ResultTable.OpenBlob(ResultNum,
                                                     TempSourceRecordBuffer,BLOB_OPENREADONLY,False,True,
                                                     BlobSizeToLoad,False);
                                       try
                                          TempMergeQuery.ResultTable.GetField(ResultNum,
                                                        TempSourceRecordBuffer,@BlobHandle,IsBlank);
                                          OpenBlob(ResultNum,TempResultRecordBuffer,BLOB_OPENREADWRITE,
                                                   False,True,BlobSize,False);
                                          BlobHandle:=FlipIntegerSign(BlobHandle);
                                          PutBlob(ResultNum,TempResultRecordBuffer,
                                                  0,TBlobBuffer(BlobHandle).Buffer,
                                                  BlobSizeToLoad,False);
                                       finally
                                          TempMergeQuery.ResultTable.FreeBlob(ResultNum,
                                                        TempSourceRecordBuffer,False,True);
                                       end;
                                       end
                                    else
                                       begin
                                       TempMergeQuery.ResultTable.GetField(ResultNum,
                                                     TempSourceRecordBuffer,@TempFieldBuffer,IsBlank);
                                       if (not IsBlank) then
                                          begin
                                          { Convert the value, if necessary }
                                          if (ResultDataType <> TResultField(FResultFields[J]).ResultDataType) then
                                             begin
                                             if not ConvertExpression(ResultDataType,ResultDataSize,
                                                                      ResultDataDecimals,
                                                                      TResultField(FResultFields[J]).ResultDataType,
                                                                      TResultField(FResultFields[J]).ResultDataSize,
                                                                      TResultField(FResultFields[J]).ResultDataDecimals,
                                                                      @TempFieldBuffer) then
                                                ExecuteError('Internal error: type mismatch between '+
                                                             'columns in UNION, INTERSECT, or EXCEPT operation');
                                             end;
                                          PutField(ResultNum,TempResultRecordBuffer,
                                                   @TempFieldBuffer,True,False)
                                          end
                                       else
                                          PutField(ResultNum,TempResultRecordBuffer,nil,True,False);
                                       end;
                                    end
                                 end;
                              case TempMergeQuery.MergeType of
                                 mtUnion:
                                    begin
                                    PutRecordHash(MD5Buffer((TempResultRecordBuffer+SizeOf(TRecordHeader))^,
                                                           (RecordSize-SizeOf(TRecordHeader))),TempResultRecordBuffer);
                                    if (not ExactFind(TempResultRecordBuffer,TempNewRecordBuffer)) then
                                       AppendRecord(TempResultRecordBuffer,True,False,True,True);
                                    end;
                                 mtUnionAll:
                                    AppendRecord(TempResultRecordBuffer,True,True,True,True);
                                 mtIntersect:
                                    begin
                                    PutRecordHash(MD5Buffer((TempResultRecordBuffer+SizeOf(TRecordHeader))^,
                                                           (RecordSize-SizeOf(TRecordHeader))),TempResultRecordBuffer);
                                    if ExactFind(TempResultRecordBuffer,TempNewRecordBuffer) then
                                       begin
                                       FResultTable.GetField(FResultTable.FieldCount,
                                                             TempNewRecordBuffer,@TempFieldBuffer,IsBlank);
                                       if IsBlank then
                                          begin
                                          pWordBool(@TempFieldBuffer)^:=True;
                                          FResultTable.PutField(FResultTable.FieldCount,
                                                                TempNewRecordBuffer,@TempFieldBuffer,True,False);
                                          ModifyRecord(TempNewRecordBuffer,False,True,False);
                                          end;
                                       end;
                                    end;
                                 mtIntersectAll:
                                    begin
                                    PutRecordHash(MD5Buffer((TempResultRecordBuffer+SizeOf(TRecordHeader))^,
                                                           (RecordSize-SizeOf(TRecordHeader))),TempResultRecordBuffer);
                                    if ExactFind(TempResultRecordBuffer,TempNewRecordBuffer) then
                                       begin
                                       { We have to do a range with INTERSECT ALL to make sure that
                                         try to mark all matching records }
                                       SetRange(False,TempResultRecordBuffer,1,TempResultRecordBuffer,1);
                                       try
                                          SetToBegin;
                                          while (GetNextRecord(TempResultRecordBuffer)=DBISAM_NONE) do
                                             begin
                                             FResultTable.GetField(FResultTable.FieldCount,
                                                                   TempResultRecordBuffer,@TempFieldBuffer,IsBlank);
                                             if IsBlank then
                                                begin
                                                pWordBool(@TempFieldBuffer)^:=True;
                                                FResultTable.PutField(FResultTable.FieldCount,
                                                                      TempResultRecordBuffer,@TempFieldBuffer,True,False);
                                                ModifyRecord(TempResultRecordBuffer,False,True,False);
                                                Break;
                                                end;
                                             end;
                                       finally
                                          ResetRange;
                                       end;
                                       end;
                                    end;
                                 mtExcept,mtExceptAll:
                                    begin
                                    PutRecordHash(MD5Buffer((TempResultRecordBuffer+SizeOf(TRecordHeader))^,
                                                           (RecordSize-SizeOf(TRecordHeader))),TempResultRecordBuffer);
                                    if ExactFind(TempResultRecordBuffer,TempNewRecordBuffer) then
                                       DeleteRecord(TempResultRecordBuffer,True);
                                    end;
                                 end;
                              end;
                           end;
                        { Now process the actual intersect "marks" and remove any
                          records that aren't "marked" }
                        if (TempMergeQuery.MergeType in [mtIntersect,mtIntersectAll]) then
                           begin
                           SetToBegin;
                           if (GetNextRecord(TempResultRecordBuffer)=DBISAM_NONE) then
                              begin
                              while True do
                                 begin
                                 FResultTable.GetField(FResultTable.FieldCount,
                                                       TempResultRecordBuffer,@TempFieldBuffer,IsBlank);
                                 if IsBlank then
                                    begin
                                    DeleteRecord(TempResultRecordBuffer,True);
                                    if (GetCurrentRecord(TempResultRecordBuffer,False) <> DBISAM_NONE) then
                                       Break;
                                    end
                                 else
                                    begin
                                    if (GetNextRecord(TempResultRecordBuffer) <> DBISAM_NONE) then
                                       Break;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                  finally
                     RemoveMergeIndex;
                  end;
               finally
                  DeAllocMem(TempSourceRecordBuffer);
               end;
               end;
            with FResultTable do
               begin
               { Now process the top rows, if necessary }
               if (FTopRows <> -1) then
                  begin
                  IndexName:='';
                  SetToEnd;
                  while (RecordCount > FTopRows) do
                     begin
                     GetCurrentRecord(TempResultRecordBuffer,False);
                     DeleteRecord(TempResultRecordBuffer,True);
                     end;
                  end;
               end;
         finally
            DeAllocMem(TempResultRecordBuffer);
            DeAllocMem(TempNewRecordBuffer);
         end;
      end;
end;

procedure TDataQuery.AddMergeIndex(MergeType: TMergeType);
var
   TempIndexDefinition: pIndexDefinition;
begin
   TempIndexDefinition:=AllocMem(SizeOf(TIndexDefinition));
   try
      with FResultTable do
         begin
         with TempIndexDefinition^ do
            begin
            IndexName:=MERGE_INDEX_NAME;
            KeyFieldCount:=1;
            KeyFields[1]:=RECORDHASH_FIELD_NUM;
            if (MergeType in [mtUnion,mtIntersect,mtExcept]) then
               KeyUnique:=True
            else
               KeyUnique:=False;
            KeyCompressionType:=DUPBYTE_COMPRESS;
            NoKeyStatistics:=True;
            end;
         AddSecondaryIndex(TempIndexDefinition,True,False);
         IndexName:=MERGE_INDEX_NAME;
         end;
   finally
      DeAllocMem(TempIndexDefinition);
   end;
end;

procedure TDataQuery.RemoveMergeIndex;
begin
   with FResultTable do
      begin
      if IndexExists(MERGE_INDEX_NAME) then
         begin
         DeleteIndex(MERGE_INDEX_NAME);
         IndexName:='';
         end;
      end;
end;

procedure TDataQuery.PopulateResultRecord(RecordBuffer: PChar);
var
   I: Integer;
   BlobSizeToLoad: Integer;
   BlobSize: Integer;
   BlobHandle: Integer;
   TempSourceFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   SourceIsBlank: Boolean;
begin
   for I:=0 to FResultFields.Count-1 do
      begin
      with TResultField(FResultFields[I]) do
         begin
         if (not IsExpression) then
            begin
            if (DataType=TYPE_BLOB) then
               begin
               BlobHandle:=0;
               SourceTable.DataCursor.GetPhysicalField(FieldNum,
                                                    SourceTable.CurRecordBuffer,
                                                    @BlobHandle,SourceIsBlank);
               if not SourceIsBlank then
                  begin
                  SourceTable.DataCursor.OpenBlob(FieldNum,SourceTable.CurRecordBuffer,
                                                  BLOB_OPENREADONLY,True,True,
                                                  BlobSizeToLoad,False);
                  BlobHandle:=0;
                  SourceTable.DataCursor.GetPhysicalField(FieldNum,
                                                       SourceTable.CurRecordBuffer,
                                                       @BlobHandle,SourceIsBlank);
                  FResultTable.OpenBlob(ResultNum,RecordBuffer,
                                        BLOB_OPENREADWRITE,True,True,BlobSize,False);
                  BlobHandle:=FlipIntegerSign(BlobHandle);
                  FResultTable.PutBlob(ResultNum,RecordBuffer,
                                       0,TBlobBuffer(BlobHandle).Buffer,
                                       BlobSizeToLoad,True);
                  end;
               end
            else
               begin
               SourceTable.DataCursor.GetPhysicalField(FieldNum,
                                                       SourceTable.CurRecordBuffer,
                                                       @TempSourceFieldBuffer,SourceIsBlank);
               if (CalculationType=rcCount) and CountAll then
                  SourceIsBlank:=False;
               if not SourceIsBlank then
                  begin
                  case CalculationType of
                     rcAvg:
                        begin
                        MassageCalculatedField(CalculationType,DataType,
                                               @TempSourceFieldBuffer);
                        FResultTable.PutField(ResultNum,RecordBuffer,
                                              @TempSourceFieldBuffer,True,False);
                        MassageCalculatedField(rcCount,DataType,
                                               @TempSourceFieldBuffer);
                        FResultTable.PutField(CountNum,RecordBuffer,
                                              @TempSourceFieldBuffer,True,False);
                        end;
                     rcStdDev:
                        begin
                        MassageCalculatedField(rcStdDevSum,DataType,
                                               @TempSourceFieldBuffer);
                        FResultTable.PutField(SumNum,RecordBuffer,
                                              @TempSourceFieldBuffer,True,False);
                        MassageCalculatedField(CalculationType,DataType,
                                               @TempSourceFieldBuffer);
                        FResultTable.PutField(ResultNum,RecordBuffer,
                                              @TempSourceFieldBuffer,True,False);
                        MassageCalculatedField(rcCount,DataType,
                                               @TempSourceFieldBuffer);
                        FResultTable.PutField(CountNum,RecordBuffer,
                                              @TempSourceFieldBuffer,True,False);
                        end;
                     else
                        begin
                        MassageCalculatedField(CalculationType,DataType,
                                               @TempSourceFieldBuffer);
                        FResultTable.PutField(ResultNum,RecordBuffer,
                                              @TempSourceFieldBuffer,True,False);
                        end;
                     end;
                  end
               else
                  FResultTable.PutField(ResultNum,RecordBuffer,nil,True,False);
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.MassageCalculatedField(CalcType: TResultCalculation;
                                            DataType: Byte; FieldBuffer: PChar);
begin
   case CalcType of
      rcCount:
         pInteger(FieldBuffer)^:=1;
      rcSum,rcRunSum,rcAvg:
         begin
         case DataType of
            TYPE_INT16:
               pInteger(FieldBuffer)^:=pSmallInt(FieldBuffer)^;
            TYPE_UINT16:
               pInteger(FieldBuffer)^:=pWord(FieldBuffer)^;
            TYPE_INT32:
               pInt64(FieldBuffer)^:=pInteger(FieldBuffer)^;
            end;
         end;
      rcStdDev:
         pDouble(FieldBuffer)^:=Sqr(pDouble(FieldBuffer)^);
      rcStdDevSum:
         begin
         case DataType of
            TYPE_INT16:
               pDouble(FieldBuffer)^:=pSmallInt(FieldBuffer)^;
            TYPE_INT32:
               pDouble(FieldBuffer)^:=pInteger(FieldBuffer)^;
            TYPE_UINT16:
               pDouble(FieldBuffer)^:=pWord(FieldBuffer)^;
            TYPE_INT64:
               pDouble(FieldBuffer)^:=pInt64(FieldBuffer)^;
            TYPE_BCD:
               pDouble(FieldBuffer)^:=TBCDToCurr(pBCD(FieldBuffer)^);
            end;
         end;
      end;
end;

procedure TDataQuery.ExecuteInsertQuery;
var
   I: Integer;
   TempResultFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   BlobSize: Integer;
   TempResultToken: TExpToken;
begin
   with MasterSourceTable.DataCursor do
      begin
      FRowsAffected:=0;
      InitRecord(MasterSourceTable.CurRecordBuffer);
      for I:=0 to FUpdateFields.Count-1 do
         begin
         with TUpdateField(FUpdateFields[I]) do
            begin
            TempResultToken:=TUpdateValue(FUpdateValues[I]).ExpressionTokens;
            EvaluateInsertValueExpression(TempResultToken);
            if (not TempResultToken.IsNull) then
               begin
               if (DataType=TYPE_BLOB) then
                  begin
                  OpenBlob(FieldNum,MasterSourceTable.CurRecordBuffer,
                           BLOB_OPENREADWRITE,True,True,BlobSize,False);
                  if (TempResultToken.DataType=TYPE_ZSTRING) or
                     ((TempResultToken.DataType=TYPE_BLOB) and
                      (TempResultToken.SubType=SUBTYPE_MEMO)) then
                     PutBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,
                             TempResultToken.Value,(TempResultToken.DataSize-1),True)
                  else
                     PutBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,
                             TempResultToken.Value,TempResultToken.DataSize,True);
                  end
               else
                  begin
                  Move(TempResultToken.Value^,TempResultFieldBuffer,
                       MinimumInteger(TempResultToken.DataSize,(MAX_FIELD_SIZE+1)));
                  if (TempResultToken.DataType <> DataType) then
                     begin
                     if not ConvertExpression(TempResultToken.DataType,TempResultToken.DataSize,
                                              TempResultToken.DataDecimals,
                                              DataType,DataSize,DataDecimals,
                                              @TempResultFieldBuffer) then
                        ExecuteError('Internal error: type mismatch between '+
                                     'column '+FieldName+' and constant value '+
                                     ExpressionLiteral+' in INSERT statement');
                     end;
                  PutField(FieldNum,MasterSourceTable.CurRecordBuffer,
                           @TempResultFieldBuffer,True,False);
                  end;
               end
            else
               PutField(FieldNum,MasterSourceTable.CurRecordBuffer,nil,
                        True,False);
            end;
         end;
      AppendRecord(MasterSourceTable.CurRecordBuffer,True,True);
      Inc(FRowsAffected);
      end;
end;

procedure TDataQuery.ExecuteSubSelectInsertQuery;
var
   I: Integer;
   TempAbort: Boolean;
   TempRecordNumber: Integer;
   TempRecordCount: Integer;
   TempPercentDone: Word;
   TempLastPercentDone: Word;
   TempRecordBuffer: PChar;
   TempResultFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   TempResultToken: TExpToken;
   WasInTransaction: Boolean;
   TempRowsAffected: Integer;
   BlobSize: Integer;
   TempSubQuery: TDataQuery;
begin
   TempSubQuery:=TDataQuery(FSubQueries[0]);
   TempRecordBuffer:=AllocMem(TempSubQuery.ResultTable.RecordSize);
   try
      with MasterSourceTable.DataCursor do
         begin
         WasInTransaction:=MasterSourceTable.DataDirectory.InTransaction;
         if (not WasInTransaction) then
            begin
            if (not FCommitIntervalSet) then
               FCommitInterval:=MinimumInteger(((DataEngine.MaxDataBufferSize*2) div
                                 MasterSourceTable.DataCursor.PhysicalRecordSize),
                                 DataEngine.MaxDataBufferCount);
            if (FTransactionTables=nil) then
               FTransactionTables:=TStringList.Create
            else
               FTransactionTables.Clear;
            FTransactionTables.Add(MasterSourceTable.DataCursor.TableName);
            MasterSourceTable.DataDirectory.StartTransaction(False,FTransactionTables);
            end;
         try
            TempAbort:=False;
            FRowsAffected:=0;
            TempRowsAffected:=0;
            TempRecordNumber:=1;
            TempRecordCount:=TempSubQuery.ResultTable.RecordCount;
            TempLastPercentDone:=0;
            TempSubQuery.ResultTable.SetToBegin;
            while (TempSubQuery.ResultTable.GetNextRecord(TempRecordBuffer)=DBISAM_NONE) and
                  (not TempAbort) do
               begin
               TempPercentDone:=Trunc(((TempRecordNumber/TempRecordCount)*100));
               if (TempPercentDone >= (TempLastPercentDone+ProgressPercent)) then
                  begin
                  AbortProgress(TempPercentDone,TempAbort);
                  TempLastPercentDone:=TempPercentDone;
                  end;
               Inc(TempRecordNumber);
               if (GetRecordStatus(TempRecordBuffer) <> RECORD_DELETED) then
                  begin
                  InitRecord(MasterSourceTable.CurRecordBuffer);
                  for I:=0 to FUpdateFields.Count-1 do
                     begin
                     with TUpdateField(FUpdateFields[I]) do
                        begin
                        TempResultToken:=TUpdateValue(FUpdateValues[I]).ExpressionTokens;
                        EvaluateSubSelectInsertValueExpression(TempSubQuery,
                                                               TempRecordBuffer,TempResultToken);
                        if (not TempResultToken.IsNull) then
                           begin
                           if (DataType=TYPE_BLOB) then
                              begin
                              OpenBlob(FieldNum,MasterSourceTable.CurRecordBuffer,
                                       BLOB_OPENREADWRITE,True,True,BlobSize,False);
                              if (TempResultToken.DataType=TYPE_ZSTRING) or
                                 ((TempResultToken.DataType=TYPE_BLOB) and
                                  (TempResultToken.SubType=SUBTYPE_MEMO)) then
                                 PutBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,
                                         TempResultToken.Value,(TempResultToken.DataSize-1),True)
                              else
                                 PutBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,
                                         TempResultToken.Value,TempResultToken.DataSize,True);
                              end
                           else
                              begin
                              Move(TempResultToken.Value^,TempResultFieldBuffer,
                                   MinimumInteger(TempResultToken.DataSize,(MAX_FIELD_SIZE+1)));
                              if (TempResultToken.DataType <> DataType) then
                                 begin
                                 if not ConvertExpression(TempResultToken.DataType,TempResultToken.DataSize,
                                                          TempResultToken.DataDecimals,
                                                          DataType,DataSize,DataDecimals,
                                                          @TempResultFieldBuffer) then
                                    ExecuteError('Internal error: type mismatch between '+
                                                 'column '+FieldName+' and constant value '+
                                                 ExpressionLiteral+' in INSERT statement');
                                 end;
                              PutField(FieldNum,MasterSourceTable.CurRecordBuffer,
                                       @TempResultFieldBuffer,True,False);
                              end;
                           end
                        else
                           PutField(FieldNum,MasterSourceTable.CurRecordBuffer,nil,
                                    True,False);
                        end;
                     end;
                  AppendRecord(MasterSourceTable.CurRecordBuffer,True,True);
                  Inc(TempRowsAffected);
                  if ((not WasInTransaction) or
                      (WasInTransaction and FCommitIntervalSet)) then
                     begin
                     if WasInTransaction then
                        begin
                        FRowsAffected:=TempRowsAffected;
                        if ((TempRowsAffected mod FCommitInterval)=0) then
                           begin
                           MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,False,False);
                           SynchLastUpdateStamps;
                           end;
                        end
                     else
                        begin
                        if ((TempRowsAffected mod FCommitInterval)=0) then
                           begin
                           MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,False,False);
                           SynchLastUpdateStamps;
                           FRowsAffected:=TempRowsAffected;
                           end;
                        end;
                     end
                  else
                     FRowsAffected:=TempRowsAffected;
                  end;
               end;
            if (not TempAbort) then
               begin
               if (not WasInTransaction) then
                  begin
                  MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,True,False);
                  FRowsAffected:=TempRowsAffected;
                  end;
               if (TempLastPercentDone <> 100) then
                  AbortProgress(100,TempAbort);
               end
            else
               begin
               if (not WasInTransaction) then
                  MasterSourceTable.DataDirectory.RollbackTransaction(False);
               end;
         except
            if (not WasInTransaction) then
               MasterSourceTable.DataDirectory.RollbackTransaction(False);
            raise;
         end;
         end;
   finally
      DeAllocMem(TempRecordBuffer);
   end;
end;

procedure TDataQuery.ExecuteUpdateQuery;
var
   I: Integer;
   TempAbort: Boolean;
   TempRecordNumber: Integer;
   LastRecordNumber: Integer;
   LastUpdateRecordNumber: Integer;
   TempPercentDone: Word;
   TempLastPercentDone: Word;
   TempRecordCount: Integer;
   TempResultFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   TempResultToken: TExpToken;
   WasInTransaction: Boolean;
   TempRowsAffected: Integer;
   BlobSize: Integer;
begin
   with MasterSourceTable.DataCursor do
      begin
      { If there is a WHERE clause then we need to
        evaluate it first }
      if FHasWhereExpression then
         begin
         { Version 5 }
         GenerateWherePlan;
         { Version 5 }
         EvaluateWhereExpression(True);
         end;
      if FJoinedResult then
         ProcessJoins;
      if FHasWhereExpression then
         EvaluateWhereExpression(False);
      if FHasScanExpressions then
         begin
         Plan('Scan Expression Execution');
         Plan('-------------------------');
         Plan('');
         Plan('The expression:');
         Plan('');
         Plan(BuildExpressionLiteral(FScanExpressionTokens));
         Plan('');
         Plan('is UN-OPTIMIZED and will be applied to each candidate row in the result set '+
              'as the result set is generated');
         Plan('');
         end;
      WasInTransaction:=MasterSourceTable.DataDirectory.InTransaction;
      if (not WasInTransaction) then
         begin
         if (not FCommitIntervalSet) then
            FCommitInterval:=MinimumInteger(((DataEngine.MaxDataBufferSize*2) div
                              MasterSourceTable.DataCursor.PhysicalRecordSize),
                              DataEngine.MaxDataBufferCount);
         if (FTransactionTables=nil) then
            FTransactionTables:=TStringList.Create
         else
            FTransactionTables.Clear;
         FTransactionTables.Add(MasterSourceTable.DataCursor.TableName);
         MasterSourceTable.DataDirectory.StartTransaction(False,FTransactionTables);
         end;
      try
         NoCursorChangeDetection:=True;
         try
            FRowsAffected:=0;
            TempRowsAffected:=0;
            TempAbort:=False;
            TempRecordNumber:=1;
            TempRecordCount:=RecordCount;
            TempLastPercentDone:=0;
            { Now set to the beginning of the source table(s)
              and continue }
            if FirstRecordRead then
               begin
               LastRecordNumber:=PhysicalRecordNumber;
               LastUpdateRecordNumber:=0;
               while (not TempAbort) do
                  begin
                  if (PhysicalRecordNumber <> LastRecordNumber) then
                     begin
                     LastRecordNumber:=PhysicalRecordNumber;
                     TempPercentDone:=Trunc(((TempRecordNumber/TempRecordCount)*100));
                     if (TempPercentDone >= (TempLastPercentDone+ProgressPercent)) then
                        begin
                        AbortProgress(TempPercentDone,TempAbort);
                        TempLastPercentDone:=TempPercentDone;
                        end;
                     Inc(TempRecordNumber);
                     end;
                  if FHasScanExpressions and
                     (not EvaluateScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  if FHasTempScanExpressions and
                     (not EvaluateTempScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  { If not dealing with joined tables, then track record
                    being updated and only continue if they don't match }
                  if FJoinedResult or
                     ((not FJoinedResult) and (PhysicalRecordNumber <> LastUpdateRecordNumber)) then
                     begin
                     GetCurrentRecord(MasterSourceTable.CurRecordBuffer,True);
                     try
                        for I:=0 to FUpdateFields.Count-1 do
                           begin
                           with TUpdateField(FUpdateFields[I]) do
                              begin
                              TempResultToken:=TUpdateValue(FUpdateValues[I]).ExpressionTokens;
                              EvaluateUpdateValueExpression(TempResultToken);
                              if (not TempResultToken.IsNull) then
                                 begin
                                 if (DataType=TYPE_BLOB) then
                                    begin
                                    OpenBlob(FieldNum,MasterSourceTable.CurRecordBuffer,
                                             BLOB_OPENREADWRITE,True,True,BlobSize,False);
                                    TruncateBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,True);
                                    if (TempResultToken.DataType=TYPE_ZSTRING) or
                                       ((TempResultToken.DataType=TYPE_BLOB) and
                                        (TempResultToken.SubType=SUBTYPE_MEMO)) then
                                       PutBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,
                                               TempResultToken.Value,(TempResultToken.DataSize-1),True)
                                    else
                                       PutBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,
                                               TempResultToken.Value,TempResultToken.DataSize,True);
                                    end
                                 else
                                    begin
                                    Move(TempResultToken.Value^,TempResultFieldBuffer,
                                         MinimumInteger(TempResultToken.DataSize,(MAX_FIELD_SIZE+1)));
                                    if (TempResultToken.DataType <> DataType) then
                                       begin
                                       if not ConvertExpression(TempResultToken.DataType,
                                                                TempResultToken.DataSize,
                                                                TempResultToken.DataDecimals,
                                                                DataType,DataSize,DataDecimals,
                                                                @TempResultFieldBuffer) then
                                          ExecuteError('Internal error: type mismatch between '+
                                                       'column '+FieldName+' and constant value '+
                                                       ExpressionLiteral+' in UPDATE statement');
                                       end;
                                    PutField(FieldNum,MasterSourceTable.CurRecordBuffer,
                                             @TempResultFieldBuffer,True,False);
                                    end;
                                 end
                              else
                                 begin
                                 if (DataType=TYPE_BLOB) then
                                    begin
                                    OpenBlob(FieldNum,MasterSourceTable.CurRecordBuffer,
                                             BLOB_OPENREADWRITE,True,True,BlobSize,False);
                                    TruncateBlob(FieldNum,MasterSourceTable.CurRecordBuffer,0,True);
                                    end
                                 else
                                    PutField(FieldNum,MasterSourceTable.CurRecordBuffer,nil,
                                             True,False);
                                 end;
                              end;
                           end;
                        ModifyRecord(MasterSourceTable.CurRecordBuffer,True,False);
                        GetCurrentRecord(MasterSourceTable.CurRecordBuffer,False);
                        LastUpdateRecordNumber:=PhysicalRecordNumber;
                        Inc(TempRowsAffected);
                        if ((not WasInTransaction) or
                            (WasInTransaction and FCommitIntervalSet)) then
                           begin
                           if WasInTransaction then
                              begin
                              FRowsAffected:=TempRowsAffected;
                              if ((TempRowsAffected mod FCommitInterval)=0) then
                                 begin
                                 MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,False,False);
                                 SynchLastUpdateStamps;
                                 end;
                              end
                           else
                              begin
                              if ((TempRowsAffected mod FCommitInterval)=0) then
                                 begin
                                 MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,False,False);
                                 SynchLastUpdateStamps;
                                 FRowsAffected:=TempRowsAffected;
                                 end;
                              end;
                           end
                        else
                           FRowsAffected:=TempRowsAffected;
                     except
                        CancelRecord;
                        raise;
                     end;
                     end;
                  if (not NextRecordRead) then
                     Break;
                  end;
               end;
            if (not TempAbort) then
               begin
               if (not WasInTransaction) then
                  begin
                  MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,True,False);
                  FRowsAffected:=TempRowsAffected;
                  end;
               if (TempLastPercentDone <> 100) then
                  AbortProgress(100,TempAbort);
               end
            else
               begin
               if (not WasInTransaction) then
                  MasterSourceTable.DataDirectory.RollbackTransaction(False);
               end;
         finally
            NoCursorChangeDetection:=False;
         end;
      except
         if (not WasInTransaction) then
            MasterSourceTable.DataDirectory.RollbackTransaction(False);
         raise;
      end;
      end;
end;

procedure TDataQuery.ExecuteDeleteQuery;
var
   TempAbort: Boolean;
   TempRecordNumber: Integer;
   LastRecordNumber: Integer;
   TempRecordCount: Integer;
   TempPercentDone: Word;
   TempLastPercentDone: Word;
   WasInTransaction: Boolean;
   TempRowsAffected: Integer;
begin
   with MasterSourceTable.DataCursor do
      begin
      { If there is a WHERE clause then we need to
        evaluate it first }
      if FHasWhereExpression then
         begin
         { Version 5 }
         GenerateWherePlan;
         { Version 5 }
         EvaluateWhereExpression(True);
         end;
      if FJoinedResult then
         ProcessJoins;
      if FHasWhereExpression then
         EvaluateWhereExpression(False);
      if FHasScanExpressions then
         begin
         Plan('Scan Expression Execution');
         Plan('-------------------------');
         Plan('');
         Plan('The expression:');
         Plan('');
         Plan(BuildExpressionLiteral(FScanExpressionTokens));
         Plan('');
         Plan('is UN-OPTIMIZED and will be applied to each candidate row in the result set '+
              'as the result set is generated');
         Plan('');
         end;
      WasInTransaction:=MasterSourceTable.DataDirectory.InTransaction;
      if (not WasInTransaction) then
         begin
         if (not FCommitIntervalSet) then
            FCommitInterval:=MinimumInteger(((DataEngine.MaxDataBufferSize*2) div
                              MasterSourceTable.DataCursor.PhysicalRecordSize),
                              DataEngine.MaxDataBufferCount);
         if (FTransactionTables=nil) then
            FTransactionTables:=TStringList.Create
         else
            FTransactionTables.Clear;
         FTransactionTables.Add(MasterSourceTable.DataCursor.TableName);
         MasterSourceTable.DataDirectory.StartTransaction(False,FTransactionTables);
         end;
      try
         NoCursorChangeDetection:=True;
         try
            FRowsAffected:=0;
            TempRowsAffected:=0;
            TempAbort:=False;
            TempRecordNumber:=1;
            TempRecordCount:=RecordCount;
            TempLastPercentDone:=0;
            { Now set to the beginning of the source table(s)
              and continue }
            if FirstRecordRead then
               begin
               LastRecordNumber:=PhysicalRecordNumber;
               while (not TempAbort) do
                  begin
                  if (PhysicalRecordNumber <> LastRecordNumber) then
                     begin
                     LastRecordNumber:=PhysicalRecordNumber;
                     TempPercentDone:=Trunc(((TempRecordNumber/TempRecordCount)*100));
                     if (TempPercentDone >= (TempLastPercentDone+ProgressPercent)) then
                        begin
                        AbortProgress(TempPercentDone,TempAbort);
                        TempLastPercentDone:=TempPercentDone;
                        end;
                     Inc(TempRecordNumber);
                     end;
                  if FHasScanExpressions and
                     (not EvaluateScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  if FHasTempScanExpressions and
                     (not EvaluateTempScanExpression) then
                     begin
                     if (not NextRecordRead) then
                        Break
                     else
                        Continue;
                     end;
                  DeleteRecord(MasterSourceTable.CurRecordBuffer,False);
                  Inc(TempRowsAffected);
                  if ((not WasInTransaction) or
                      (WasInTransaction and FCommitIntervalSet)) then
                     begin
                     if WasInTransaction then
                        begin
                        FRowsAffected:=TempRowsAffected;
                        if ((TempRowsAffected mod FCommitInterval)=0) then
                           begin
                           MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,False,False);
                           SynchLastUpdateStamps;
                           end;
                        end
                     else
                        begin
                        if ((TempRowsAffected mod FCommitInterval)=0) then
                           begin
                           MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,False,False);
                           SynchLastUpdateStamps;
                           FRowsAffected:=TempRowsAffected;
                           end;
                        end;
                     end
                  else
                     FRowsAffected:=TempRowsAffected;
                  if (not RefreshRecordRead) then
                     Break;
                  end;
               end;
            if (not TempAbort) then
               begin
               if (not WasInTransaction) then
                  begin
                  MasterSourceTable.DataDirectory.CommitTransaction(FCommitFlush,True,False);
                  FRowsAffected:=TempRowsAffected;
                  end;
               if (TempLastPercentDone <> 100) then
                  AbortProgress(100,TempAbort);
               end
            else
               begin
               if (not WasInTransaction) then
                  MasterSourceTable.DataDirectory.RollbackTransaction(False);
               end;
         finally
            NoCursorChangeDetection:=False;
         end;
      except
         if (not WasInTransaction) then
            MasterSourceTable.DataDirectory.RollbackTransaction(False);
         raise;
      end;
      end;
end;

procedure TDataQuery.ExecuteCreateTableQuery;
begin
   with FResultTable do
      begin
      { Version 5 }
      SystemOpen:=False;
      { Version 5 }
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfNotExists) or
         (FOnlyIfNotExists and (not DataDirectory.DataTableExists(TableName,False,False))) then
         begin
         { Version 5}
         if (not (FStopWordsSet or FSpaceCharsSet or FIncludeCharsSet)) then
         { Version 5}
            CreateTable(FLocaleID,
                        FUserMajorVersion,FUserMinorVersion,
                        FEncrypted,FEncryptionPassword,
                        FDescription,
                        FIndexPageSize,FBlobBlockSize,
                        FLastAutoInc,
                        nil,FSpaceChars,FIncludeChars,False,
                        FFieldCount,FFieldDefinitions,
                        FIndexCount,FIndexDefinitions)
         else
            CreateTable(FLocaleID,
                        FUserMajorVersion,FUserMinorVersion,
                        FEncrypted,FEncryptionPassword,
                        FDescription,
                        FIndexPageSize,FBlobBlockSize,
                        FLastAutoInc,
                        FStopWords,FSpaceChars,FIncludeChars,False,
                        FFieldCount,FFieldDefinitions,
                        FIndexCount,FIndexDefinitions);
         end;
      end;
end;

procedure TDataQuery.ExecuteCreateIndexQuery;
begin
   with FResultTable do
      begin
      { Version 5 }
      SystemOpen:=False;
      { Version 5 }
      Exclusive:=False;
      Temporary:=False;
      ResultSet:=False;
      OpenCursor(False);
      try
         if (not FOnlyIfNotExists) or
            (FOnlyIfNotExists and (not IndexExists(FIndexDefinitions[FIndexCount]^.IndexName))) then
            begin
            CloseCursor(True);
            Exclusive:=True;
            OpenCursor(False);
            SetProgressCallback(Integer(Self),@TDataQuery.Progress);
            SetDataLostCallback(Integer(Self),@TDataQuery.DataLost);
            AddSecondaryIndex(FIndexDefinitions[FIndexCount],False,False);
            end;
      finally
         CloseCursor(True);
      end;
      end;
end;

procedure TDataQuery.ExecuteAlterTableQuery;
begin
   with FResultTable do
      begin
      { Version 5 }
      SystemOpen:=False;
      { Version 5 }
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if FStructureAltered and
         ((not FOnlyIfExists) or
          (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False))) then
         begin
         SetProgressCallback(Integer(Self),@TDataQuery.Progress);
         SetDataLostCallback(Integer(Self),@TDataQuery.DataLost);
         { Version 5}
         if (not (FStopWordsSet or FSpaceCharsSet or FIncludeCharsSet)) then
         { Version 5}
            AlterTable(FLocaleID,
                       FUserMajorVersion,FUserMinorVersion,
                       FEncrypted,FEncryptionPassword,
                       FDescription,
                       FIndexPageSize,FBlobBlockSize,
                       FLastAutoInc,nil,[],[],FNoBackups,False,False,
                       FFieldCount,FFieldDefinitions,
                       FIndexCount,FIndexDefinitions)
         else
            AlterTable(FLocaleID,
                       FUserMajorVersion,FUserMinorVersion,
                       FEncrypted,FEncryptionPassword,
                       FDescription,
                       FIndexPageSize,FBlobBlockSize,
                       FLastAutoInc,FStopWords,FSpaceChars,FIncludeChars,
                       FNoBackups,False,False,
                       FFieldCount,FFieldDefinitions,
                       FIndexCount,FIndexDefinitions);
         end;
      end;
end;

procedure TDataQuery.ExecuteEmptyTableQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         begin
         OpenCursor(False);
         try
            FRowsAffected:=RecordCount;
            EmptyTable;
         finally
            CloseCursor(False);
         end;
         end;
      end;
end;

procedure TDataQuery.ExecuteOptimizeTableQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         begin
         SetProgressCallback(Integer(Self),@TDataQuery.Progress);
         FRowsAffected:=OptimizeTable(FResultIndexName,FNoBackups,False);
         end;
      end;
end;

procedure TDataQuery.ExecuteExportTableQuery;
var
   TempFieldDefinitions: array[1..MAX_NUM_FIELDS] of pFieldDefinition;
   NoFieldsSpecified: Boolean;

   procedure SetFieldDefinitions;
   var
      I: Integer;
   begin
      NoFieldsSpecified:=False;
      FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
      if (FFields=nil) then
         begin
         NoFieldsSpecified:=True;
         FFields:=TStringList.Create;
         for I:=0 to FResultTable.FieldCount-1 do
            begin
            TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
            TempFieldDefinitions[I+1]^:=FResultTable.GetFieldDefinition(I+1)^;
            FFields.Add(TempFieldDefinitions[I+1]^.FieldName);
            end;
         end
      else
         begin
         for I:=0 to FFields.Count-1 do
            begin
            TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
            TempFieldDefinitions[I+1]^:=FResultTable.GetFieldDefinitionByName(FFields[I])^;
            end;
         end;
   end;

   procedure ClearFieldDefinitions;
   var
      I: Integer;
   begin
      if NoFieldsSpecified then
         begin
         FFields.Free;
         FFields:=nil;
         end;
      for I:=1 to FResultTable.FieldCount do
         DeAllocMem(TempFieldDefinitions[I]);
   end;

begin
   with FResultTable do
      begin
      Exclusive:=FResultExclusive;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         begin
         OpenCursor(False);
         try
            SetFieldDefinitions;
            try
               SetProgressCallback(Integer(Self),@TDataQuery.Progress);
               FRowsAffected:=ExportTable(FResultFile,FDelimiter,FFields.Count,
                                          TempFieldDefinitions,FDateFormat,FTimeFormat,
                                          FDecSeparator,FHeaders,False);
            finally
               ClearFieldDefinitions;
            end;
         finally
            CloseCursor(False);
         end;
         end;
      end;
end;

procedure TDataQuery.ExecuteImportTableQuery;
var
   TempFieldDefinitions: array[1..MAX_NUM_FIELDS] of pFieldDefinition;
   NoFieldsSpecified: Boolean;

   procedure SetFieldDefinitions;
   var
      I: Integer;
   begin
      NoFieldsSpecified:=False;
      FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
      if (FFields=nil) then
         begin
         NoFieldsSpecified:=True;
         FFields:=TStringList.Create;
         for I:=0 to FResultTable.FieldCount-1 do
            begin
            TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
            TempFieldDefinitions[I+1]^:=FResultTable.GetFieldDefinition(I+1)^;
            FFields.Add(TempFieldDefinitions[I+1]^.FieldName);
            end;
         end
      else
         begin
         for I:=0 to FFields.Count-1 do
            begin
            TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
            TempFieldDefinitions[I+1]^:=FResultTable.GetFieldDefinitionByName(FFields[I])^;
            end;
         end;
   end;

   procedure ClearFieldDefinitions;
   var
      I: Integer;
   begin
      if NoFieldsSpecified then
         begin
         FFields.Free;
         FFields:=nil;
         end;
      for I:=1 to FResultTable.FieldCount do
         DeAllocMem(TempFieldDefinitions[I]);
   end;

begin
   with FResultTable do
      begin
      Exclusive:=FResultExclusive;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         begin
         OpenCursor(False);
         try
            SetFieldDefinitions;
            try
               SetProgressCallback(Integer(Self),@TDataQuery.Progress);
               FRowsAffected:=ImportTable(FResultFile,FDelimiter,FFields.Count,
                                          TempFieldDefinitions,FDateFormat,FTimeFormat,
                                          FDecSeparator,FHeaders,False);
            finally
               ClearFieldDefinitions;
            end;
         finally
            CloseCursor(False);
         end;
         end;
      end;
end;

procedure TDataQuery.ExecuteVerifyTableQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         begin
         SetSteppedProgressCallback(Integer(Self),@TDataQuery.SteppedProgress);
         SetLogCallback(Integer(Self),@TDataQuery.Log);
         RepairTable(True,False,False,False,False);
         end;
      end;
end;

procedure TDataQuery.ExecuteRepairTableQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         begin
         SetSteppedProgressCallback(Integer(Self),@TDataQuery.SteppedProgress);
         SetLogCallback(Integer(Self),@TDataQuery.Log);
         RepairTable(False,False,False,False,FForceIndexRebuild);
         end;
      end;
end;

procedure TDataQuery.ExecuteUpgradeTableQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         begin
         SetSteppedProgressCallback(Integer(Self),@TDataQuery.SteppedProgress);
         SetLogCallback(Integer(Self),@TDataQuery.Log);
         UpgradeTable(False,False);
         end;
      end;
end;

procedure TDataQuery.ExecuteDropTableQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         DeleteTable;
      end;
end;

procedure TDataQuery.ExecuteRenameTableQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      if (not FOnlyIfExists) or
         (FOnlyIfExists and FResultDataDirectory.DataTableExists(TableName,False,False)) then
         RenameTable(FNewResultTableName);
      end;
end;

procedure TDataQuery.ExecuteDropIndexQuery;
begin
   with FResultTable do
      begin
      Exclusive:=True;
      Temporary:=False;
      ResultSet:=False;
      OpenCursor(False);
      try
         if (AnsiCompareText(FResultIndexName,'PRIMARY')=0) then
            begin
            if FOnlyIfExists then
               begin
               if (not AutoPrimaryIndex) then
                  DeleteIndex('')
               end
            else
               DeleteIndex('')
            end
         else
            begin
            if (not FOnlyIfExists) or
               (FOnlyIfExists and IndexExists(FResultIndexName)) then
               DeleteIndex(FResultIndexName);
            end;
      finally
         CloseCursor(True);
      end;
      end;
end;

procedure TDataQuery.ResetAllSourceFilters;
var
   I: Integer;
   J: Integer;
   TempSourceTable: TSourceTable;
begin
   { Free join filter handles first }
   for I:=0 to FSourceTables.Count-1 do
      begin
      TempSourceTable:=TSourceTable(FSourceTables[I]);
      for J:=0 to TempSourceTable.Joins.Count-1 do
         begin
         with TJoin(TempSourceTable.Joins[J]) do
            begin
            FreeJoinFilterHandle;
            ScanTokensGenerated:=False;
            end;
         end;
      end;
   { Now free all remaining filters }
   for I:=0 to FSourceTables.Count-1 do
      begin
      TempSourceTable:=TSourceTable(FSourceTables[I]);
      TempSourceTable.DataCursor.DropFilter(nil,False);
      FSubSelectFilterHandle:=nil;
      TempSourceTable.EndOfTable:=False;
      end;
end;

function TDataQuery.GetUniqueResultName(const SourceFieldName: string;
                                        const ResultFieldName: string;
                                        CalculationType: TResultCalculation;
                                        ResultFieldToIgnore: TResultField): string;
var
   I: Integer;
   NewResultFieldName: string;
   IsDuplicate: Boolean;
   DuplicateSuffix: Word;
begin
   { If the result field name is blank then just assign the source field
     name }
   NewResultFieldName:=GetRight(ResultFieldName,MAX_FIELDNAME_SIZE);
   if (NewResultFieldName='') then
      begin
      { If the source field name is blank then we have an expression
        field that is either calculated or not }
      if (SourceFieldName='') then
         begin
         { This is a calculated field so assign the result field name
           based upon the type of calculation }
         if (CalculationType <> rcNone) then
            begin
            case CalculationType of
               rcCount: NewResultFieldName:='Count Of Expr';
               rcAvg: NewResultFieldName:='Average Of Expr';
               rcStdDev: NewResultFieldName:='StdDev Of Expr';
               rcMin: NewResultFieldName:='Min Of Expr';
               rcMax: NewResultFieldName:='Max Of Expr';
               rcSum: NewResultFieldName:='Sum Of Expr';
               rcRunSum: NewResultFieldName:='Running Sum Of Expr';
               end;
            end
         else
            { This is an expression field so just assign 'Expression'
              as the result field name }
            NewResultFieldName:='Expression';
         end
      else
         begin
         if (CalculationType <> rcNone) then
            begin
            case CalculationType of
               rcCount: NewResultFieldName:='Count Of '+SourceFieldName;
               rcAvg: NewResultFieldName:='Average Of '+SourceFieldName;
               rcStdDev: NewResultFieldName:='StdDev Of '+SourceFieldName;
               rcMin: NewResultFieldName:='Min Of '+SourceFieldName;
               rcMax: NewResultFieldName:='Max Of '+SourceFieldName;
               rcSum: NewResultFieldName:='Sum Of '+SourceFieldName;
               rcRunSum: NewResultFieldName:='Running Sum Of '+SourceFieldName;
               end;
            end
         else
            NewResultFieldName:=SourceFieldName;
         end;
      end;
   Result:=NewResultFieldName;
   { Now we need to check for duplicates and appropriately change
     duplicate field names so that they are unique by appending a
     duplicate number at the end of the field name }
   IsDuplicate:=True;
   DuplicateSuffix:=0;
   while IsDuplicate do
      begin
      IsDuplicate:=False;
      for I:=0 to FResultFields.Count-1 do
         begin
         if ((AnsiCompareText(RECORDID_FIELD_NAME,Result)=0) or
             (AnsiCompareText(RECORDHASH_FIELD_NAME,Result)=0)) or
             ((TResultField(FResultFields[I]) <> ResultFieldToIgnore) and
              (AnsiCompareText(TResultField(FResultFields[I]).ResultName,Result)=0)) then
            begin
            IsDuplicate:=True;
            Inc(DuplicateSuffix);
            Result:=AppendUniqueFieldID(NewResultFieldName,
                                        IntToStr(DuplicateSuffix));
            end
         else
            begin
            if (TResultField(FResultFields[I])=ResultFieldToIgnore) then
               Break;
            end;
         end;
      end;
end;

function TDataQuery.AppendUniqueFieldID(const FieldName: string;
                                         const Value: string): string;
begin
   Result:=FieldName;
   if (Length(Result+'_'+Value) > MAX_FIELDNAME_SIZE) then
      Result:=GetRight(Result,(MAX_FIELDNAME_SIZE-Length('_'+Value)))+'_'+Value
   else
      Result:=Result+'_'+Value;
end;

procedure TDataQuery.BuildWhereFilter(OptimizedOnly: Boolean;
                                      StartToken: TExpToken;
                                      TargetTable: TSourceTable);
var
   TempToken: TExpToken;
   OptimizeLevel: TOptimizeLevel;
   TempFilterHandle: Pointer;
begin
   { Now we need to start the recursive process of running through
     the where tokens and building the expression buffer in the process }
   TempToken:=BuildNextFilterExpression(StartToken,Integer(Self),
                                        @TDataQuery.EvaluateExpressionFieldData,
                                        FLocaleID,False,True);
   if (not FInplaceResult) and (not FSimpleFunctionResult) then
      begin
      { Don't calculate costs here, just check to see whether the
        expression is optimized or not }
      OptimizeLevel:=TargetTable.DataCursor.GetExpressionOptimizeLevel(TempToken,False);
      if (OptimizeLevel=olNone) then
         begin
         if (not OptimizedOnly) then
            begin
            if (not FJoinedResult) then
               begin
               AddTempScanTokens(TempToken);
               if GeneratePlan then
                  begin
                  Plan('The expression:');
                  Plan('');
                  Plan(BuildExpressionLiteral(StartToken));
                  Plan('');
                  Plan('is '+GetOptimizeLevelText(OptimizeLevel)+
                       ' and will be applied to each candidate row in the '+TargetTable.TableName+
                       ' table ('+TargetTable.AliasName+') as the result set is generated');
                  Plan('');
                  end;
               end
            else
               begin
               if IsTargetOfOuterJoin(jtLeftOuter,TargetTable) then
                  begin
                  AddTempScanTokens(TempToken);
                  if GeneratePlan then
                     begin
                     Plan('The expression:');
                     Plan('');
                     Plan(BuildExpressionLiteral(StartToken));
                     Plan('');
                     Plan('will be applied to each candidate row in the result set '+
                          'as the result set is generated due to the '+TargetTable.TableName+
                          ' table ('+TargetTable.AliasName+') being the target of an OUTER join');
                     Plan('');
                     end;
                  end
               else
                  begin
                  TargetTable.DataCursor.AddFilter(0,nil,TempToken,True,
                                                   nil,False,True,False,False,
                                                   TempFilterHandle);
                  if (FWhereCostSet and
                      (TFilter(TempFilterHandle).FilterTokens.OptimizeCost > FTotalWhereCost)) then
                     begin
                     TargetTable.DataCursor.DropFilter(TempFilterHandle,True);
                     { Have to rebuild expression tokens again here }
                     TempToken:=BuildNextFilterExpression(StartToken,Integer(Self),
                                                          @TDataQuery.EvaluateExpressionFieldData,
                                                          FLocaleID,False,True);
                     AddTempScanTokens(TempToken);
                     if GeneratePlan then
                        begin
                        Plan('The expression:');
                        Plan('');
                        Plan(BuildExpressionLiteral(StartToken));
                        Plan('');
                        Plan('is '+GetOptimizeLevelText(OptimizeLevel)+
                             ' and will be applied to each candidate row in the '+TargetTable.TableName+
                             ' table ('+TargetTable.AliasName+') as the result set is generated');
                        Plan('');
                        end;
                     end
                  else
                     begin
                     FWhereCostSet:=True;
                     Inc(FTotalWhereCost,TFilter(TempFilterHandle).FilterTokens.OptimizeCost);
                     if GeneratePlan then
                        begin
                        with TFilter(TempFilterHandle) do
                           begin
                           Plan('The expression:');
                           Plan('');
                           Plan(BuildExpressionLiteral(StartToken));
                           Plan('');
                           { Version 5 }
                           if Rewritten then
                              Plan('has been rewritten and is '+GetOptimizeLevelText(OptimizeLevel)+
                                   ', covers '+IntToStr(FilterTokens.OptimizeCount)+' rows or index keys, costs '+
                                   IntToStr(FilterTokens.OptimizeCost)+' bytes, and will be applied '+
                                   'to the '+TargetTable.TableName+' table ('+TargetTable.AliasName+
                                   ') before any joins')
                           else
                              Plan('is '+GetOptimizeLevelText(OptimizeLevel)+
                                   ', covers '+IntToStr(FilterTokens.OptimizeCount)+' rows or index keys, costs '+
                                   IntToStr(FilterTokens.OptimizeCost)+' bytes, and will be applied '+
                                   'to the '+TargetTable.TableName+' table ('+TargetTable.AliasName+
                                   ') before any joins');
                           { Version 5 }
                           Plan('');
                           end;
                        end;
                     TargetTable.DataCursor.ActivateFilter(TempFilterHandle);
                     end;
                  end;
               end;
            end
         else
            FreeExpressionTokens(TempToken);
         end
      else if OptimizedOnly then
         begin
         if (FJoinedResult and IsTargetOfOuterJoin(jtLeftOuter,TargetTable)) then
            begin
            AddTempScanTokens(TempToken);
            if GeneratePlan then
               begin
               Plan('The expression:');
               Plan('');
               Plan(BuildExpressionLiteral(StartToken));
               Plan('');
               Plan('will be applied to each candidate row in the result set '+
                    'as the result set is generated due to the '+TargetTable.TableName+
                    ' table ('+TargetTable.AliasName+') being the target of an OUTER join');
               Plan('');
               end;
            end
         else
            begin
            TargetTable.DataCursor.AddFilter(0,nil,TempToken,True,
                                             nil,False,True,False,False,TempFilterHandle);
            FWhereCostSet:=True;
            Inc(FTotalWhereCost,TFilter(TempFilterHandle).FilterTokens.OptimizeCost);
            if GeneratePlan then
               begin
               with TFilter(TempFilterHandle) do
                  begin
                  Plan('The expression:');
                  Plan('');
                  Plan(BuildExpressionLiteral(StartToken));
                  Plan('');
                  { Version 5 }
                  if Rewritten then
                     Plan('has been rewritten and is '+GetOptimizeLevelText(OptimizeLevel)+
                          ', covers '+IntToStr(FilterTokens.OptimizeCount)+' rows or index keys, costs '+
                          IntToStr(FilterTokens.OptimizeCost)+' bytes, and will be applied '+
                          'to the '+TargetTable.TableName+' table ('+TargetTable.AliasName+
                          ') before any joins')
                  else
                     Plan('is '+GetOptimizeLevelText(OptimizeLevel)+
                          ', covers '+IntToStr(FilterTokens.OptimizeCount)+' rows or index keys, costs '+
                          IntToStr(FilterTokens.OptimizeCost)+' bytes, and will be applied '+
                          'to the '+TargetTable.TableName+' table ('+TargetTable.AliasName+
                          ') before any joins');
                  { Version 5 }
                  Plan('');
                  end;
               end;
            TargetTable.DataCursor.ActivateFilter(TempFilterHandle);
            end;
         end
      else
         FreeExpressionTokens(TempToken);
      end
   else
      begin
      TargetTable.DataCursor.AddFilter(0,nil,TempToken,True,
                                        nil,False,True,False,False,TempFilterHandle);
      FWhereCostSet:=True;
      Inc(FTotalWhereCost,TFilter(TempFilterHandle).FilterTokens.OptimizeCost);
      if GeneratePlan then
         begin
         with TFilter(TempFilterHandle) do
            begin
            Plan('The expression:');
            Plan('');
            Plan(BuildExpressionLiteral(StartToken));
            Plan('');
            { Version 5 }
            if Rewritten then
               Plan('has been rewritten and is '+GetOptimizeLevelText(OptimizeLevel)+
                    ', covers '+IntToStr(FilterTokens.OptimizeCount)+' rows or index keys, costs '+
                    IntToStr(FilterTokens.OptimizeCost)+' bytes, and will be applied '+
                    'to the '+TargetTable.TableName+' table ('+TargetTable.AliasName+
                    ') before any joins')
            else
               Plan('is '+GetOptimizeLevelText(OptimizeLevel)+
                    ', covers '+IntToStr(FilterTokens.OptimizeCount)+' rows or index keys, costs '+
                    IntToStr(FilterTokens.OptimizeCost)+' bytes, and will be applied '+
                    'to the '+TargetTable.TableName+' table ('+TargetTable.AliasName+
                    ') before any joins');
            { Version 5 }
            Plan('');
            end;
         end;
      TargetTable.DataCursor.ActivateFilter(TempFilterHandle);
      end;
end;

procedure TDataQuery.ProcessCalculation(CalcType: TResultCalculation;
                                        DataType: Byte;
                                        DataDecimals: Byte;
                                        SourceFieldBuffer: PChar;
                                        SourceIsBlank: Boolean;
                                        ResultFieldBuffer: PChar;
                                        ResultIsBlank: Boolean);
begin
   case CalcType of
      rcCount:
         Inc(pInteger(ResultFieldBuffer)^);
      rcSum,rcRunSum,rcAvg:
         begin
         case DataType of
            TYPE_INT32:
               pInteger(ResultFieldBuffer)^:=(pInteger(ResultFieldBuffer)^+
                                              pInteger(SourceFieldBuffer)^);
            TYPE_INT64:
               pInt64(ResultFieldBuffer)^:=(pInt64(ResultFieldBuffer)^+
                                            pInt64(SourceFieldBuffer)^);
            TYPE_BCD:
               pBCD(ResultFieldBuffer)^:=CurrToTBCD((TBCDToCurr(pBCD(ResultFieldBuffer)^)+
                                                     TBCDToCurr(pBCD(SourceFieldBuffer)^)),
                                                    DataDecimals);
            TYPE_FLOAT:
               pDouble(ResultFieldBuffer)^:=(pDouble(ResultFieldBuffer)^+
                                             pDouble(SourceFieldBuffer)^);
            TYPE_DATE,TYPE_TIME:
               pInteger(ResultFieldBuffer)^:=(pInteger(ResultFieldBuffer)^+
                                              pInteger(SourceFieldBuffer)^);
            TYPE_TIMESTAMP:
               pDouble(ResultFieldBuffer)^:=(pDouble(ResultFieldBuffer)^+
                                             pDouble(SourceFieldBuffer)^);
            end;
         end;
      rcMin:
         begin
         if ResultIsBlank then
            begin
            case DataType of
               TYPE_ZSTRING:
                  StrCopy(ResultFieldBuffer,SourceFieldBuffer);
               TYPE_INT16:
                  pSmallInt(ResultFieldBuffer)^:=pSmallInt(SourceFieldBuffer)^;
               TYPE_INT32, TYPE_DATE, TYPE_TIME:
                  pInteger(ResultFieldBuffer)^:=pInteger(SourceFieldBuffer)^;
               TYPE_INT64:
                  pInt64(ResultFieldBuffer)^:=pInt64(SourceFieldBuffer)^;
               TYPE_UINT16:
                  pWord(ResultFieldBuffer)^:=pWord(SourceFieldBuffer)^;
               TYPE_BCD:
                  pBCD(ResultFieldBuffer)^:=pBCD(SourceFieldBuffer)^;
               TYPE_FLOAT:
                  pDouble(ResultFieldBuffer)^:=pDouble(SourceFieldBuffer)^;
               TYPE_TIMESTAMP:
                  pDouble(ResultFieldBuffer)^:=pDouble(SourceFieldBuffer)^;
               end;
            end
         else
            begin
            case DataType of
               TYPE_ZSTRING:
                  begin
                   if (OSCompareStrings(FLocaleID,SourceFieldBuffer,ResultFieldBuffer,
                                       0,False)=CMP_LESS) then
                     StrCopy(ResultFieldBuffer,SourceFieldBuffer);
                  end;
               TYPE_INT16:
                  pSmallInt(ResultFieldBuffer)^:=MinimumSmallInt(pSmallInt(ResultFieldBuffer)^,
                                                               pSmallInt(SourceFieldBuffer)^);
               TYPE_INT32, TYPE_DATE, TYPE_TIME:
                  pInteger(ResultFieldBuffer)^:=MinimumInteger(pInteger(ResultFieldBuffer)^,
                                                            pInteger(SourceFieldBuffer)^);
               TYPE_INT64:
                  pInt64(ResultFieldBuffer)^:=MinimumLargeInt(pInt64(ResultFieldBuffer)^,
                                                              pInt64(SourceFieldBuffer)^);
               TYPE_UINT16:
                  pWord(ResultFieldBuffer)^:=MinimumWord(pWord(ResultFieldBuffer)^,
                                                         pWord(SourceFieldBuffer)^);
               TYPE_BCD:
                  pBCD(ResultFieldBuffer)^:=CurrToTBCD(MinimumBCD(TBCDToCurr(pBCD(ResultFieldBuffer)^),
                                                        TBCDToCurr(pBCD(SourceFieldBuffer)^)),
                                                       DataDecimals);
               TYPE_FLOAT:
                  pDouble(ResultFieldBuffer)^:=MinimumFloat(pDouble(ResultFieldBuffer)^,
                                                            pDouble(SourceFieldBuffer)^);
               TYPE_TIMESTAMP:
                  pDouble(ResultFieldBuffer)^:=MinimumFloat(pDouble(ResultFieldBuffer)^,
                                                            pDouble(SourceFieldBuffer)^);
               end;
            end;
         end;
      rcMax:
         begin
         case DataType of
            TYPE_ZSTRING:
               begin
               if (OSCompareStrings(FLocaleID,SourceFieldBuffer,ResultFieldBuffer,
                                    0,False)=CMP_GREATER) then
                  StrCopy(ResultFieldBuffer,SourceFieldBuffer);
               end;
            TYPE_INT16:
               pSmallInt(ResultFieldBuffer)^:=MaximumSmallInt(pSmallInt(ResultFieldBuffer)^,
                                                            pSmallInt(SourceFieldBuffer)^);
            TYPE_INT32, TYPE_DATE, TYPE_TIME:
               pInteger(ResultFieldBuffer)^:=MaximumInteger(pInteger(ResultFieldBuffer)^,
                                                         pInteger(SourceFieldBuffer)^);
            TYPE_INT64:
               pInt64(ResultFieldBuffer)^:=MaximumLargeInt(pInt64(ResultFieldBuffer)^,
                                                         pInt64(SourceFieldBuffer)^);
            TYPE_UINT16:
               pWord(ResultFieldBuffer)^:=MaximumWord(pWord(ResultFieldBuffer)^,
                                                      pWord(SourceFieldBuffer)^);
            TYPE_BCD:
               pBCD(ResultFieldBuffer)^:=CurrToTBCD(MaximumBCD(TBCDToCurr(pBCD(ResultFieldBuffer)^),
                                                     TBCDToCurr(pBCD(SourceFieldBuffer)^)),
                                                    DataDecimals);
            TYPE_FLOAT:
               pDouble(ResultFieldBuffer)^:=MaximumFloat(pDouble(ResultFieldBuffer)^,
                                                         pDouble(SourceFieldBuffer)^);
            TYPE_TIMESTAMP:
               pDouble(ResultFieldBuffer)^:=MaximumFloat(pDouble(ResultFieldBuffer)^,
                                                         pDouble(SourceFieldBuffer)^);
            end;
         end;
      rcStdDev:
         pDouble(ResultFieldBuffer)^:=(pDouble(ResultFieldBuffer)^+
                                       pDouble(SourceFieldBuffer)^);
      end;
end;

{ Version 5 }
procedure TDataQuery.GenerateWherePlan;
begin
   if GeneratePlan then
      begin
      Plan('WHERE Clause Execution');
      Plan('----------------------');
      Plan('');
      if ContainsTextSearch(FWhereExpressionTokens) then
         begin
         Plan('NOTE: Optimized TEXTSEARCH() conditions do not use statistics '+
              'and will show zero (0) for any I/O costs');
         Plan('');
         end;
      if ContainsNots(FWhereExpressionTokens) then
         begin
         Plan('NOTE: Using a NOT operator will force an optimized condition '+
              'to be partially-optimized due to the need for an additional '+
              'record scan to remove deleted records');
         Plan('');
         end;
      end;
end;
{ Version 5 }

procedure TDataQuery.EvaluateWhereExpression(OptimizedOnly: Boolean);
begin
   EvaluateNextWhereExpression(OptimizedOnly,FWhereExpressionTokens);
end;

procedure TDataQuery.EvaluateNextWhereExpression(OptimizedOnly: Boolean;
                                                 NextToken: TExpToken);
var
   TempAlias: string;
   TempSourceTable: TSourceTable;
begin
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            begin
            if (not ContainsMultipleDataSources(TempAlias,NextToken)) then
               begin
               TempSourceTable:=FindSourceTable(TempAlias);
               if (TempSourceTable <> nil) then
                  BuildWhereFilter(OptimizedOnly,NextToken,TempSourceTable)
               else
                  ExecuteError('Internal error: table correlation name '+
                               TempAlias+' referenced in WHERE clause is '+
                               'not defined in the FROM clause');
               end
            else
               EvaluateNextWhereExpression(OptimizedOnly,LeftExpToken);
            end;
         etBINARY:
            begin
            if ContainsMultipleDataSources(TempAlias,NextToken) then
               begin
               EvaluateNextWhereExpression(OptimizedOnly,LeftExpToken);
               EvaluateNextWhereExpression(OptimizedOnly,RightExpToken);
               end
            else
               begin
               TempSourceTable:=FindSourceTable(TempAlias);
               if (TempSourceTable <> nil) then
                  BuildWhereFilter(OptimizedOnly,NextToken,
                                   TempSourceTable)
               else
                  ExecuteError('Internal error: table correlation name '+
                               TempAlias+' referenced in WHERE clause is '+
                               'not defined in the FROM clause');
               end;
            end;
         etEXTBINARY:
            begin
            if (not ContainsMultipleDataSources(TempAlias,NextToken)) then
               begin
               TempSourceTable:=FindSourceTable(TempAlias);
               if (TempSourceTable <> nil) then
                  BuildWhereFilter(OptimizedOnly,NextToken,TempSourceTable)
               else
                  ExecuteError('Internal error: table correlation name '+
                               TempAlias+' referenced in WHERE clause is '+
                               'not defined in the FROM clause');
               end
            else
               ExecuteError('Internal error: table filter error');
            end;
         end;
      end;
end;

procedure TDataQuery.SetupDefaultJoins;
var
   I: Integer;
begin
   for I:=0 to FSourceTables.Count-1 do
      begin
      if (I <> FSourceTables.Count-1) then
         TSourceTable(FSourceTables[I]).AddJoin(jtNone,nil,
                                                TSourceTable(FSourceTables[I+1]));
      end;
end;

procedure TDataQuery.ReduceDefaultJoins;
var
   I: Integer;
   J: Integer;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      for I:=0 to FSourceTables.Count-1 do
         begin
         with TSourceTable(FSourceTables[I]) do
            begin
            for J:=Joins.Count-1 downto 0 do
               begin
               with TJoin(Joins[J]) do
                  begin
                  if IsTargetOfJoin(TJoin(Joins[J]),
                                    TargetTable) then
                     begin
                     if (JoinType=jtNone) then
                        begin
                        TJoin(Joins[J]).Free;
                        Joins.Delete(J);
                        end
                     else
                        GeneralError(JoinTokens,'Table correlation name '+
                                     TargetTable.AliasName+' is the target of multiple '+
                                     'join conditions in the WHERE or JOIN clause')
                     end
                  else if (TargetTable.JoinOrder=1) and
                          (JoinType=jtNone) then
                     begin
                     TJoin(Joins[J]).Free;
                     Joins.Delete(J);
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.SetupJoinExpressions;
var
   I: Integer;
   TempSourceTable: TSourceTable;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      for I:=0 to FJoinExpressions.Count-1 do
         begin
         with TJoinExpression(FJoinExpressions[I]) do
            begin
            TempSourceTable:=GetJoinExpressionSourceTable(JoinTokens,TargetTable);
            if (TempSourceTable=nil) then
               GeneralError(JoinTokens,'JOIN clause expression for table '+
                            TargetTable.AliasName+' is invalid')
            else if (TempSourceTable.JoinOrder >= TargetTable.JoinOrder) or
                    (not CheckFieldsJoinOrder(JoinTokens,TargetTable.JoinOrder)) then
               GeneralError(JoinTokens,'Table correlation name '+
                            TempSourceTable.AliasName+' in JOIN clause '+
                            'expression is invalid')
            else
               TempSourceTable.AddJoin(JoinType,JoinTokens,TargetTable);
            end;
         end;
      end;
end;

function TDataQuery.GetJoinExpressionSourceTable(NextJoinToken: TExpToken;
                                                 TargetTable: TSourceTable): TSourceTable;
var
   LeftSourceTable: TSourceTable;
   RightSourceTable: TSourceTable;
   LeftFieldToken: TExpToken;
   RightFieldToken: TExpToken;
   TempFieldNum: Word;
   I: Integer;
begin
   Result:=nil;
   with NextJoinToken do
      begin
      case TokenType of
         etUNARY:
            Result:=GetJoinExpressionSourceTable(LeftExpToken,TargetTable);
         etBINARY:
            begin
            if (TokenOperator in [eoAND,eoOR]) then
               begin
               LeftSourceTable:=GetJoinExpressionSourceTable(LeftExpToken,TargetTable);
               RightSourceTable:=GetJoinExpressionSourceTable(RightExpToken,TargetTable);
               if (LeftSourceTable <> nil) and (RightSourceTable <> nil) then
                  begin
                  if (LeftSourceTable.JoinOrder > RightSourceTable.JoinOrder) then
                     Result:=LeftSourceTable
                  else
                     Result:=RightSourceTable;
                  end
               else if (LeftSourceTable <> nil) and (RightSourceTable=nil) then
                  Result:=LeftSourceTable
               else if (LeftSourceTable=nil) and (RightSourceTable <> nil) then
                  Result:=RightSourceTable;
               end
            else if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) then
               begin
               if ContainsFields(LeftExpToken) and ContainsFields(RightExpToken) then
                  begin
                  LeftFieldToken:=GetFieldToken(LeftExpToken);
                  LeftSourceTable:=FindSourceTableForField(LeftFieldToken.SourceAlias,
                                                           LeftFieldToken.FieldName,False,TempFieldNum);
                  RightFieldToken:=GetFieldToken(RightExpToken);
                  RightSourceTable:=FindSourceTableForField(RightFieldToken.SourceAlias,
                                                            RightFieldToken.FieldName,False,TempFieldNum);
                  if (LeftSourceTable <> nil) and (LeftSourceTable <> TargetTable) then
                     Result:=LeftSourceTable
                  else if (RightSourceTable <> nil) and (RightSourceTable <> TargetTable) then
                     begin
                     Result:=RightSourceTable;
                     if (LeftSourceTable <> nil) and (LeftSourceTable=TargetTable) then
                        ReverseBinaryTokenOperator(NextJoinToken);
                     end;
                  end;
               end;
            end;
         etEXTBINARY,etFUNC:
            begin
            if (ArgumentExpTokens.Count > 0) then
               begin
               if ContainsFields(ArgumentExpToken[0]) then
                  begin
                  LeftFieldToken:=GetFieldToken(ArgumentExpToken[0]);
                  LeftSourceTable:=FindSourceTableForField(LeftFieldToken.SourceAlias,
                                                           LeftFieldToken.FieldName,False,TempFieldNum);
                  for I:=1 to ArgumentExpTokens.Count-1 do
                     begin
                     if ContainsFields(ArgumentExpToken[I]) then
                        begin
                        RightFieldToken:=GetFieldToken(ArgumentExpToken[I]);
                        RightSourceTable:=FindSourceTableForField(RightFieldToken.SourceAlias,
                                                                  RightFieldToken.FieldName,False,TempFieldNum);
                        if (LeftSourceTable <> nil) and (LeftSourceTable <> TargetTable) then
                           Result:=LeftSourceTable
                        else if (RightSourceTable <> nil) and (RightSourceTable <> TargetTable) then
                           Result:=RightSourceTable;
                        if (Result <> nil) then
                           Break;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

function TDataQuery.CheckFieldsJoinOrder(NextToken: TExpToken;
                                         HighestJoinOrder: Integer): Boolean;
var
   LeftResult: Boolean;
   RightResult: Boolean;
   TempFieldNum: Word;
   I: Integer;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=CheckFieldsJoinOrder(LeftExpToken,HighestJoinOrder);
         etBINARY:
            begin
            LeftResult:=CheckFieldsJoinOrder(LeftExpToken,HighestJoinOrder);
            RightResult:=CheckFieldsJoinOrder(RightExpToken,HighestJoinOrder);
            if (LeftResult and RightResult) then
               Result:=True;
            end;
         etEXTBINARY,etFUNC:
            begin
            { Version 5 }
            if (ArgumentExpTokens.Count > 0) then
            { Version 5 }
               begin
               for I:=0 to ArgumentExpTokens.Count-1 do
                  begin
                  Result:=CheckFieldsJoinOrder(ArgumentExpToken[I],HighestJoinOrder);
                  if (not Result) then
                     Break;
                  end;
               end
            else
               Result:=True;
            end;
         etFIELD:
            begin
            with TDataQuery(SourceObject) do
               begin
               { Handle canned result sub-queries specifically }
               if ((SubSelectType=stSubSelect) and (not IsLiveResult)) then
                  Result:=True
               else
                  begin
                  DataSource:=FindSourceTableForField(SourceAlias,FieldName,False,
                                                      TempFieldNum);
                  if (DataSource <> nil) then
                     begin
                     SourceAlias:=TSourceTable(DataSource).AliasName;
                     FieldNumber:=TempFieldNum;
                     if (TSourceTable(DataSource).JoinOrder <= HighestJoinOrder) then
                        Result:=True;
                     end;
                  end;
               end;
            end;
         etCONST:
            Result:=True;
         end;
      end;
end;

procedure TDataQuery.FlipRightOuterJoins;
var
   I: Integer;
   TempSourceTable: TSourceTable;
   FoundRightJoins: Boolean;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      FoundRightJoins:=True;
      while FoundRightJoins do
         begin
         FoundRightJoins:=False;
         for I:=0 to (FSourceTables.Count-1) do
            begin
            TempSourceTable:=TSourceTable(FSourceTables[I]);
            if IsTargetOfOuterJoin(jtRightOuter,TempSourceTable) then
               begin
               if (FQueryType <> SELECT_STATEMENT) and
                  (GetDriverTable(TempSourceTable)=MasterSourceTable) then
                  GeneralError(TempSourceTable.Line,TempSourceTable.Column,
                               TempSourceTable.TableName+' table cannot be the '+
                               'target of a RIGHT OUTER JOIN')
               else
                  begin
                  FlipJoins(jtRightOuter,TempSourceTable);
                  SetJoinOrders;
                  FoundRightJoins:=True;
                  Break;
                  end;
               end;
            end;
         end;
      end;
end;

function TDataQuery.CanOptimizeJoins: Boolean;
var
   I: Integer;
   TempSourceTable: TSourceTable;
   SmallestTable: TSourceTable;
begin
   Result:=False;
   if FNoJoinOptimizations then
      Exit;
   SmallestTable:=nil;
   for I:=0 to (FSourceTables.Count-1) do
      begin
      TempSourceTable:=TSourceTable(FSourceTables[I]);
      { Don't optimize join conditions when there are scan expressions }
      if (TempSourceTable.JoinScanTokens <> nil) then
         begin
         SmallestTable:=nil;
         Break;
         end;
      { Don't touch the first table for non-SELECT statements such as UPDATE }
      if (FQueryType=SELECT_STATEMENT) or
         ((FQueryType <> SELECT_STATEMENT) and (TempSourceTable <> MasterSourceTable)) then
         begin
         if IsTargetOfInnerJoin(TempSourceTable) and
            (not IsTargetOfOuterJoin(jtLeftOuter,GetParentTable(jtInner,TempSourceTable))) then
            begin
            { Don't touch the first table for non-SELECT statements such as UPDATE }
            if (FQueryType=SELECT_STATEMENT) or
               ((FQueryType <> SELECT_STATEMENT) and
                (GetDriverTable(TempSourceTable) <> MasterSourceTable)) then
               begin
               { Version 5 }
               if (FLastSmallestTable.IndexOf(TempSourceTable) = -1) then
                  begin
                  if (SmallestTable <> nil) then
                     begin
                     if (SmallestTable.DataCursor.RecordCount >
                         TempSourceTable.DataCursor.RecordCount) then
                        SmallestTable:=TempSourceTable;
                     end
                  else
                     SmallestTable:=TempSourceTable;
                  end;
               { Version 5 }
               end;
            end;
         end;
      end;
   if (SmallestTable <> nil) and (SmallestTable <> MasterSourceTable) then
      begin
      if (SmallestTable.DataCursor.RecordCount < MasterSourceTable.DataCursor.RecordCount) then
         Result:=True;
      end;
end;

function TDataQuery.OptimizeJoins: TSourceTable;
var
   I: Integer;
   TempSourceTable: TSourceTable;
   SmallestTable: TSourceTable;
begin
   Result:=MasterSourceTable;
   SmallestTable:=nil;
   for I:=0 to (FSourceTables.Count-1) do
      begin
      TempSourceTable:=TSourceTable(FSourceTables[I]);
      { Don't touch the first table for non-SELECT statements such as UPDATE }
      if (FQueryType=SELECT_STATEMENT) or
         ((FQueryType <> SELECT_STATEMENT) and (TempSourceTable <> MasterSourceTable)) then
         begin
         if IsTargetOfInnerJoin(TempSourceTable) and
            (not IsTargetOfOuterJoin(jtLeftOuter,GetParentTable(jtInner,TempSourceTable))) then
            begin
            { Don't touch the first table for non-SELECT statements such as UPDATE }
            if (FQueryType=SELECT_STATEMENT) or
               ((FQueryType <> SELECT_STATEMENT) and
                (GetDriverTable(TempSourceTable) <> MasterSourceTable)) then
               begin
               { Version 5 }
               if (FLastSmallestTable.IndexOf(TempSourceTable) = -1) then
                  begin
                  if (SmallestTable <> nil) then
                     begin
                     if (SmallestTable.DataCursor.RecordCount >
                         TempSourceTable.DataCursor.RecordCount) then
                        SmallestTable:=TempSourceTable;
                     end
                  else
                     SmallestTable:=TempSourceTable;
                  end;
               { Version 5 }
               end;
            end;
         end;
      end;
   if (SmallestTable <> nil) and (SmallestTable <> MasterSourceTable) then
      begin
      if (SmallestTable.DataCursor.RecordCount < MasterSourceTable.DataCursor.RecordCount) then
         begin
         FlipJoins(jtInner,SmallestTable);
         SetJoinOrders;
         end;
      end;
end;

procedure TDataQuery.UnOptimizeJoins(OldSmallestTable: TSourceTable);
begin
   FlipJoins(jtInner,OldSmallestTable);
   SetJoinOrders;
end;

function TDataQuery.CheckJoinOrders: Boolean;
var
   I: Integer;
   J: Integer;
begin
   Result:=True;
   for I:=0 to (FSourceTables.Count-1) do
      begin
      with TSourceTable(FSourceTables[I]) do
         begin
         for J:=0 to (Joins.Count-1) do
            begin
            with TJoin(Joins[J]) do
               begin
               if (JoinTokens <> nil) and
                  (not CheckFieldsJoinOrder(JoinTokens,TargetTable.JoinOrder)) then
                  begin
                  Result:=False;
                  Exit;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.FlipJoins(JoinType: TJoinType; ChildTable: TSourceTable);
var
   ParentTable: TSourceTable;
   TempJoin: TJoin;
   I: Integer;
   MoveNextToParent: Boolean;
begin
   ParentTable:=GetParentTable(JoinType,ChildTable);
   { Need to make sure to flip around any INNER or
     default cartesian joins also }
   if (ParentTable=nil) then
      begin
      if (JoinType=jtRightOuter) then
         ParentTable:=GetParentTable(jtInner,ChildTable);
      if (ParentTable=nil) then
         ParentTable:=GetParentTable(jtNone,ChildTable);
      end;
   if (ParentTable <> nil) then
      begin
      FlipJoins(JoinType,ParentTable);
      TempJoin:=nil;
      with ParentTable do
         begin
         if (Joins.Count > 1) then
            MoveNextToParent:=True
         else
            MoveNextToParent:=False;
         for I:=0 to Joins.Count-1 do
            begin
            if (TJoin(Joins[I]).TargetTable=ChildTable) then
               begin
               TempJoin:=Joins[I];
               Joins.Delete(I);
               Break;
               end;
            end;
         end;
      if (TempJoin=nil) then
         ExecuteError('Internal error: join optimization error');
      { Version 5 - Changed order }
      TempJoin.TargetTable:=ParentTable;
      TempJoin.FlipJoinTokens;
      ChildTable.Joins.Insert(ChildTable.GetJoinPosition(TempJoin),TempJoin);
      { Version 5 }
      if (TempJoin.JoinType=jtRightOuter) then
         TempJoin.JoinType:=jtLeftOuter;
      FlipJoin(ParentTable,ChildTable,MoveNextToParent);
      { Now handle moving any other joins not involved in the flip - this is
        necessary to ensure that the join orders are properly taken into
        account when verifying that there are no fields in any of the join
        expressions that refer to tables that come *after* the target table
        of the join expression }
      if MoveNextToParent then
         begin
         { Remember the two tables are now flipped, and the parent is the
           child while the child is the parent }
         with ChildTable do
            begin
            for I:=0 to Joins.Count-1 do
               begin
               if (TJoin(Joins[I]).TargetTable <> ParentTable) then
                  FlipJoin(ParentTable,TJoin(Joins[I]).TargetTable,True);
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.FlipJoin(ParentTable: TSourceTable;
                              ChildTable: TSourceTable;
                              AlignNextTo: Boolean);
var
   OldPos: Integer;
   NewPos: Integer;
   TempSourceTable: TSourceTable;
begin
   { Now exchange the two positions }
   OldPos:=FSourceTables.IndexOf(ParentTable);
   NewPos:=FSourceTables.IndexOf(ChildTable);
   if (OldPos <> -1) and (NewPos <> -1) then
      begin
      if AlignNextTo then
         begin
         TempSourceTable:=TSourceTable(FSourceTables[NewPos]);
         FSourceTables.Delete(NewPos);
         FSourceTables.Insert(OldPos,TempSourceTable);
         end
      else
         FSourceTables.Exchange(OldPos,NewPos);
      end
   else
      ExecuteError('Internal error: join optimization error');
end;

function TDataQuery.CalculateJoinOptimizeLevels: TOptimizeLevel;
var
   I: Integer;
   J: Integer;
   TempSourceTable: TSourceTable;
   TempJoin: TJoin;
   TempTokens: TExpToken;
begin
   Result:=olFull;
   for I:=0 to FSourceTables.Count-1 do
      begin
      TempSourceTable:=TSourceTable(FSourceTables[I]);
      with TempSourceTable do
         begin
         for J:=0 to Joins.Count-1 do
            begin
            TempJoin:=TJoin(Joins[J]);
            with TempJoin do
               begin
               if (JoinTokens <> nil) then
                  begin
                  try
                     TempTokens:=BuildNextJoinFilter(JoinTokens,
                                                     Integer(Self),
                                                     @TDataQuery.EvaluateExpressionFieldData,
                                                     FLocaleID);
                     JoinOptimizeLevel:=TargetTable.DataCursor.GetExpressionOptimizeLevel(TempTokens,False);
                     Result:=TargetTable.DataCursor.EvaluateAndOptimizeLevels(Result,JoinOptimizeLevel);
                  finally
                     FreeExpressionTokens(TempTokens);
                  end;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.VerifyAggregateResultFields(NextToken: TExpToken);
var
   I: Integer;
   TempResultField: TResultField;
   TempExpToken: TExpToken;
begin
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            VerifyAggregateResultFields(LeftExpToken);
         etBINARY:
            begin
            VerifyAggregateResultFields(LeftExpToken);
            VerifyAggregateResultFields(RightExpToken);
            end;
         etEXTBINARY:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               VerifyAggregateResultFields(ArgumentExpToken[I]);
            end;
         etFUNC:
            begin
            case TokenOperator of
               eoSUM,eoRUNSUM,eoMIN,eoMAX,eoAVG,eoSTDDEV,eoCOUNT:
                  begin
                  TempResultField:=TResultField(DataSource);
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     begin
                     TempExpToken:=ArgumentExpToken[I];
                     FreeExpressionTokens(TempExpToken);
                     end;
                  ArgumentExpTokens.Clear;
                  TokenType:=etFIELD;
                  TokenOperator:=eoNOTDEFINED;
                  FieldNumber:=TempResultField.ResultNum;
                  DataSource:=nil;
                  end;
               else
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     VerifyAggregateResultFields(ArgumentExpToken[I]);
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.VerifyResultFields;
var
   I: Integer;
   J: Integer;
   TempResultField: TResultField;
   TempFieldCount: Word;
   TempFieldNum: Word;
   TempResultName: string;
   TempSourceTable: TSourceTable;
   TempSourceTableList: TList;
   TempMergeQuery: TDataQuery;
   TempTokens: TExpToken;
   TempLine: Integer;
   TempColumn: Integer;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      { Version 5 }
      { First thing to do is to add any hidden result fields }
      for I:=0 to FHiddenResultFields.Count-1 do
         FResultFields.Add(FHiddenResultFields[I]);
      { Version 5 }
      I:=0;
      TempFieldCount:=0;
      while (I < FResultFields.Count) do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         with TempResultField do
            begin
            if (FieldName=PARSE_ALLFIELDS) and
               (CalculationType=rcNone) then
               begin
               if (ResultName <> '') then
                  GeneralError(ResultExpressionTokens,'Invalid use of '+
                               'column correlation name '+ResultName);
               if (AliasName <> '') then
                  begin
                  SourceTable:=FindSourceTableForField(AliasName,FieldName,True,
                                                       TempFieldNum);
                  if (SourceTable <> nil) then
                     begin
                     TempSourceTable:=SourceTable;
                     TempLine:=TempResultField.ExpressionTokens.Line;
                     TempColumn:=TempResultField.ExpressionTokens.Column;
                     { First delete the current result field that
                       contains the * all fields specification }
                     TempResultField.Free;
                     FResultFields.Delete(I);
                     AddAllResultFields(TempSourceTable,TempFieldCount,
                                        TempLine,TempColumn);
                     I:=TempFieldCount;
                     Continue;
                     end
                  else
                     ExpectedTokenTypesError(ExpressionTokens,[etFIELD])
                  end
               else
                  begin
                  { Be sure to add the result fields in sorted output
                    order so that right outer joins don't alter the
                    output }
                  TempSourceTableList:=TList.Create;
                  try
                     for J:=0 to FSourceTables.Count-1 do
                        TempSourceTableList.Add(FSourceTables[J]);
                     TempSourceTableList.Sort(@CompareOutputOrders);
                     TempLine:=TempResultField.ExpressionTokens.Line;
                     TempColumn:=TempResultField.ExpressionTokens.Column;
                     { First delete the current result field that
                       contains the * all fields specification }
                     TempResultField.Free;
                     FResultFields.Delete(I);
                     for J:=0 to TempSourceTableList.Count-1 do
                        AddAllResultFields(TSourceTable(TempSourceTableList[J]),
                                           TempFieldCount,TempLine,TempColumn);
                     I:=TempFieldCount;
                     Continue;
                  finally
                     TempSourceTableList.Free;
                  end;
                  end;
               end;
            end;
         Inc(I);
         Inc(TempFieldCount);
         end;
      if (FResultFields.Count > MAX_NUM_FIELDS) then
         GeneralError(TResultField(FResultFields[MAX_NUM_FIELDS]).ExpressionTokens,
                      'Maximum number of columns ('+IntToStr(MAX_NUM_FIELDS)+') exceeded');
      FHasBlobFields:=False;
      for I:=0 to FResultFields.Count-1 do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         with TempResultField do
            begin
            if (ExpressionTokens <> nil) then
               begin
               with FQueryStatement.ExpressionVerifier do
                  begin
                  SetFieldCallback(Integer(Self),@TDataQuery.VerifyExpressionFieldData);
                  VerifyExpression(ExpressionTokens,False,True);
                  end;
               { Be sure to set the data type to the proper type for
                 aggregate functions }
               if ((ExpressionTokens.TokenType=etFUNC) and
                   (CalculationType <> rcNone)) then
                  begin
                  DataType:=ExpressionTokens.ArgumentExpToken[0].DataType;
                  SubType:=ExpressionTokens.ArgumentExpToken[0].SubType;
                  DataSize:=MinimumInteger(ExpressionTokens.ArgumentExpToken[0].DataSize,(MAX_FIELD_SIZE+1));
                  DataDecimals:=ExpressionTokens.ArgumentExpToken[0].DataDecimals;
                  ResultDataType:=ExpressionTokens.DataType;
                  ResultSubType:=ExpressionTokens.SubType;
                  ResultDataSize:=MinimumInteger(ExpressionTokens.DataSize,(MAX_FIELD_SIZE+1));
                  ResultDataDecimals:=ExpressionTokens.DataDecimals;
                  end
               else
                  begin
                  DataType:=ExpressionTokens.DataType;
                  SubType:=ExpressionTokens.SubType;
                  DataSize:=MinimumInteger(ExpressionTokens.DataSize,(MAX_FIELD_SIZE+1));
                  DataDecimals:=ExpressionTokens.DataDecimals;
                  ResultDataType:=DataType;
                  ResultSubType:=SubType;
                  ResultDataSize:=DataSize;
                  ResultDataDecimals:=DataDecimals;
                  end;
               { Check for BLOB expressions, which force a canned
                 result set }
               if (DataType=TYPE_BLOB) then
                  begin
                  FHasBlobFields:=True;
                  if IsExpression then
                     FHasBlobExpressions:=True;
                  end;
               { Now we need to check the data size to make sure that
                 we haven't exceeded the maximum field size }
               if (DataType=TYPE_ZSTRING) then
                  begin
                  if ((DataSize-1) > MAX_FIELD_SIZE) then
                     GeneralError(ExpressionTokens,'Maximum field size ('+
                                  IntToStr(MAX_FIELD_SIZE)+') exceeded for '+
                                  'column expression '+ExpressionLiteral)
                  else if ((DataSize-1)=0) then
                     begin
                     DataSize:=MAX_FIELD_SIZE+1;
                     ResultDataSize:=DataSize;
                     end;
                  end
               else if (DataType in [TYPE_BYTES,TYPE_VARBYTES]) then
                  begin
                  if (DataSize > MAX_FIELD_SIZE) then
                     GeneralError(ExpressionTokens,'Maximum field size ('+
                                  IntToStr(MAX_FIELD_SIZE)+') exceeded for '+
                                  'column expression '+ExpressionLiteral)
                  else if (DataSize=0) then
                     begin
                     DataSize:=MAX_FIELD_SIZE;
                     ResultDataSize:=DataSize;
                     end;
                  end
               else
                  begin
                  if (ExpressionTokens.TokenType=etCONST) and
                     (ExpressionTokens.IsNull) then
                     GeneralError(ExpressionTokens,'Invalid column expression');
                  end;
               end;
            end;
         end;
      FContainsNonCalcFields:=False;
      FContainsCalcFields:=False;
      { Now massage the result field names and numbers }
      for I:=0 to FResultFields.Count-1 do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         with TempResultField do
            begin
            { Now we need to use the field name and optional alias to
              find the proper source table for all fields }
            if (CalculationType <> rcNone) then
               begin
               FContainsCalcFields:=True;
               { Trap for special condition where the Count() calculation
                 is used with the * all fields symbol and use another field
                 name from the source list }
               if (FieldName=PARSE_ALLFIELDS) and
                  (CalculationType=rcCount) then
                  begin
                  { Set flag to know that this field is counting all
                    fields, so ignore NULL fields }
                  CountAll:=True;
                  SourceTable:=FindSourceTableForField(AliasName,FieldName,True,
                                                       TempFieldNum);
                  if (SourceTable <> nil) then
                     begin
                     TempResultName:=ResultName;
                     AliasName:=SourceTable.AliasName;
                     FieldName:=SourceTable.FindFirstFieldName(TempFieldNum);
                     FieldNum:=TempFieldNum;
                     ResultNum:=(I+1);
                     ResultName:=GetUniqueResultName('*',TempResultName,
                                                     CalculationType,
                                                     TResultField(FResultFields[I]));
                     end
                  else
                     ExpectedTokenTypesError(ExpressionTokens,[etFIELD])
                  end
               else
                  begin
                  SourceTable:=FindSourceTableForField(AliasName,FieldName,True,
                                                       TempFieldNum);
                  { Once we've found the proper source table for the
                    current field then we need to get the resultant field
                    name, incrementing the result field # in the process }
                  if (SourceTable <> nil) then
                     begin
                     AliasName:=SourceTable.AliasName;
                     ResultNum:=(I+1);
                     if IsExpression then
                        ResultName:=GetUniqueResultName('',ResultName,
                                                        CalculationType,
                                                        TResultField(FResultFields[I]))
                     else
                        begin
                        FieldNum:=TempFieldNum;
                        ResultName:=GetUniqueResultName(FieldName,ResultName,
                                                        CalculationType,
                                                        TResultField(FResultFields[I]));
                        end;
                     end
                  else
                     ExpectedTokenTypesError(ExpressionTokens,[etFIELD])
                  end;
               end
            else
               begin
               if IsExpression then
                  begin
                  if (ExpressionTokens <> nil) then
                     begin
                     { Version 5 }
                     if ContainsFieldsOutsideAggregates(ExpressionTokens) then
                        FContainsNonCalcFields:=True;
                     { Version 5 }
                     end
                  else
                     FContainsNonCalcFields:=True;
                  end
               else
                  FContainsNonCalcFields:=True;
               SourceTable:=FindSourceTableForField(AliasName,FieldName,True,
                                                    TempFieldNum);
               { Once we've found the proper source table for the
                 current field then we need to get the resultant field
                 name, incrementing the result field # in the process }
               if (SourceTable <> nil) then
                  begin
                  AliasName:=SourceTable.AliasName;
                  ResultNum:=(I+1);
                  if IsExpression then
                     ResultName:=GetUniqueResultName('',ResultName,
                                                     CalculationType,
                                                     TResultField(FResultFields[I]))
                  else
                     begin
                     FieldNum:=TempFieldNum;
                     ResultName:=GetUniqueResultName(FieldName,ResultName,
                                                     CalculationType,
                                                     TResultField(FResultFields[I]));
                     end;
                  end
               else
                  ExpectedTokenTypesError(ExpressionTokens,[etFIELD])
               end;
            end;
         end;
      { Be sure to modify the field tokens if any of the
        result fields is an aggregate expression }
      if FHasAggregateCalcs then
         begin
         for I:=0 to FResultFields.Count-1 do
            begin
            with TResultField(FResultFields[I]) do
               begin
               if IsAggregateExpression then
                  VerifyAggregateResultFields(ExpressionTokens);
               end;
            end;
         end;
      { Check for a missing GROUP BY clause }
      if FContainsCalcFields and FContainsNonCalcFields and (not FGroupedResult) then
         begin
         for I:=0 to FResultFields.Count-1 do
            begin
            TempResultField:=TResultField(FResultFields[I]);
            with TempResultField do
               begin
               if (CalculationType <> rcNone) then
                  GeneralError(ExpressionTokens,
                               'Invalid use of aggregate function(s), '+
                               'the necessary GROUP BY clause is missing');
               end;
            end;
         end;
      { Verify that if this is a sub-query, that the number of fields is 1 }
      if (FSubSelectType=stSubSelect) and (FResultFields.Count > 1) then
         GeneralError(TResultField(FResultFields[1]).ExpressionTokens,
                      'The number of columns in an IN sub-query cannot be more than 1');
      { Check to see if any UNION, INTERSECT, or EXCEPT clauses are in effect and that the
        result fields match }
      if (FMergeQueries.Count > 0) then
         begin
         for I:=0 to FMergeQueries.Count-1 do
            begin
            TempMergeQuery:=FMergeQueries[I];
            if ((FResultFields.Count-FHiddenResultFields.Count) <>
                (TempMergeQuery.ResultFields.Count-TempMergeQuery.HiddenResultFields.Count)) then
               begin
               TempTokens:=nil;
               if ((FResultFields.Count-FHiddenResultFields.Count) <
                   (TempMergeQuery.ResultFields.Count-TempMergeQuery.HiddenResultFields.Count)) then
                  TempTokens:=TResultField(TempMergeQuery.ResultFields[(FResultFields.Count-FHiddenResultFields.Count)]).ExpressionTokens
               else if ((FResultFields.Count-FHiddenResultFields.Count) >
                      (TempMergeQuery.ResultFields.Count-TempMergeQuery.HiddenResultFields.Count)) then
                  TempTokens:=TResultField(TempMergeQuery.ResultFields[TempMergeQuery.ResultFields.Count-
                                                                       TempMergeQuery.HiddenResultFields.Count-1]).ExpressionTokens;
               GeneralError(TempTokens,'The number of columns in queries '+
                            'involved in a UNION, INTERSECT, or EXCEPT '+
                            'operation must match');
               end;
            if FHasBlobFields and (TempMergeQuery.MergeType in [mtUnion,mtIntersect,mtExcept]) then
               begin
               for J:=0 to FResultFields.Count-1 do
                  begin
                  TempResultField:=TResultField(FResultFields[J]);
                  with TempResultField do
                     begin
                     if (ResultDataType=TYPE_BLOB) then
                        GeneralError(ExpressionTokens,
                                     'You cannot perform a UNION, INTERSECT, or '+
                                     'EXCEPT operation without the ALL '+
                                     'clause on queries containing BLOB columns');
                     end;
                  end;
               end;
            for J:=0 to FResultFields.Count-1 do
               begin
               TempResultField:=TResultField(FResultFields[J]);
               with TempResultField do
                  begin
                  CheckArgumentTypes(ExpressionTokens,
                                     TResultField(TempMergeQuery.ResultFields[J]).ExpressionTokens,
                                     False);
                  { Additional check for BLOBs }
                  if (ResultDataType=TYPE_BLOB) or
                     (TResultField(TempMergeQuery.ResultFields[J]).ResultDataType=TYPE_BLOB) then
                     begin
                     CheckBlobTypes(TResultField(TempMergeQuery.ResultFields[J]).ExpressionTokens,
                                    False);
                     CheckBlobTypes(TResultField(FResultFields[J]).ExpressionTokens,
                                    False);
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.EvaluateResultFields(RecordBuffer: PChar);
var
   I: Integer;
   BlobSize: Integer;
   TempFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
begin
   for I:=0 to FResultFields.Count-1 do
      begin
      with TResultField(FResultFields[I]) do
         begin
         if (not IsAggregateExpression) then
            begin
            if IsExpression and (ExpressionTokens <> nil) then
               begin
               EvaluateExpressionToken(ExpressionTokens,nil,Integer(Self),
                                       @TDataQuery.EvaluateExpressionFieldData,FLocaleID);
               if (DataType=TYPE_BLOB) then
                  begin
                  if (not ExpressionTokens.IsNull) then
                     begin
                     FResultTable.OpenBlob(ResultNum,RecordBuffer,BLOB_OPENREADWRITE,
                                           True,True,BlobSize,False);
                     if (ExpressionTokens.DataType=TYPE_ZSTRING) or
                        ((ExpressionTokens.DataType=TYPE_BLOB) and
                         (ExpressionTokens.SubType=SUBTYPE_MEMO)) then
                        FResultTable.PutBlob(ResultNum,RecordBuffer,0,ExpressionTokens.Value,
                                             (ExpressionTokens.DataSize-1),True)
                     else
                        FResultTable.PutBlob(ResultNum,RecordBuffer,0,ExpressionTokens.Value,
                                             ExpressionTokens.DataSize,True);
                     end;
                  end
               else
                  begin
                  if (not ExpressionTokens.IsNull) then
                     begin
                     Move(ExpressionTokens.Value^,TempFieldBuffer,
                          MinimumInteger(ExpressionTokens.DataSize,MAX_FIELD_SIZE));
                     case CalculationType of
                        rcAvg:
                           begin
                           MassageCalculatedField(CalculationType,DataType,
                                                  @TempFieldBuffer);
                           FResultTable.PutField(ResultNum,RecordBuffer,@TempFieldBuffer,
                                                 True,False);
                           MassageCalculatedField(rcCount,DataType,
                                                  @TempFieldBuffer);
                           FResultTable.PutField(CountNum,RecordBuffer,
                                                 @TempFieldBuffer,True,False);
                           end;
                        rcStdDev:
                           begin
                           MassageCalculatedField(rcStdDevSum,DataType,
                                                  @TempFieldBuffer);
                           FResultTable.PutField(SumNum,RecordBuffer,
                                                 @TempFieldBuffer,True,False);
                           MassageCalculatedField(CalculationType,DataType,
                                                  @TempFieldBuffer);
                           FResultTable.PutField(ResultNum,RecordBuffer,
                                                 @TempFieldBuffer,True,False);
                           MassageCalculatedField(rcCount,DataType,
                                                  @TempFieldBuffer);
                           FResultTable.PutField(CountNum,RecordBuffer,
                                                 @TempFieldBuffer,True,False);
                           end;
                        else
                           begin
                           MassageCalculatedField(CalculationType,DataType,
                                                  @TempFieldBuffer);
                           FResultTable.PutField(ResultNum,RecordBuffer,@TempFieldBuffer,
                                                 True,False);
                           end;
                        end;
                     end
                  else
                     FResultTable.PutField(ResultNum,RecordBuffer,nil,True,False);
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.EvaluateAggregateResultFields(RecordBuffer: PChar);
var
   I: Integer;
   BlobSize: Integer;
begin
   for I:=0 to FResultFields.Count-1 do
      begin
      with TResultField(FResultFields[I]) do
         begin
         if IsAggregateExpression then
            begin
            EvaluateExpressionToken(ExpressionTokens,RecordBuffer,Integer(Self),
                                    @TDataQuery.EvaluateResultFieldData,FLocaleID);
            if (DataType=TYPE_BLOB) then
               begin
               if (not ExpressionTokens.IsNull) then
                  begin
                  FResultTable.OpenBlob(ResultNum,RecordBuffer,BLOB_OPENREADWRITE,
                                        True,True,BlobSize,False);
                  if (ExpressionTokens.DataType=TYPE_ZSTRING) or
                     ((ExpressionTokens.DataType=TYPE_BLOB) and
                      (ExpressionTokens.SubType=SUBTYPE_MEMO)) then
                     FResultTable.PutBlob(ResultNum,RecordBuffer,0,ExpressionTokens.Value,
                                          (ExpressionTokens.DataSize-1),True)
                  else
                     FResultTable.PutBlob(ResultNum,RecordBuffer,0,ExpressionTokens.Value,
                                          ExpressionTokens.DataSize,True);
                  end;
               end
            else
               begin
               if (not ExpressionTokens.IsNull) then
                  FResultTable.PutField(ResultNum,RecordBuffer,ExpressionTokens.Value,
                                        True,False)
               else
                  FResultTable.PutField(ResultNum,RecordBuffer,nil,True,False);
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.AddWhereExpressionTokens(NextToken: TExpToken);
begin
   AddTokens(FWhereExpressionTokens,NextToken);
   FHasWhereExpression:=True;
end;

procedure TDataQuery.ReduceWhereExpression;
begin
   if ReduceNextWhereExpressionToken(FWhereExpressionTokens,nil) then
      begin
      FWhereExpressionTokens:=nil;
      FHasWhereExpression:=False;
      end;
end;

function TDataQuery.ReduceNextWhereExpressionToken(NextToken: TExpToken;
                                                   UpperToken: TExpToken): Boolean;
var
   LeftTable: TSourceTable;
   RightTable: TSourceTable;
   { Version 5 }
//   ParentTable: TSourceTable;
//   ParentJoin: TJoin;
   { Version 5 }
   LeftAlias: string;
   RightAlias: string;
   TempRightToken: TExpToken;
   TempLeftToken: TExpToken;
   LeftResult: Boolean;
   RightResult: Boolean;
   TempAlias: string;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      Result:=False;
      with NextToken do
         begin
         UpperExpToken:=UpperToken;
         case TokenType of
            etUNARY:
               begin
               if (TokenOperator=eoNOT) then
                  begin
                  { Version 5 }
                  if ContainsMultipleDataSources(TempAlias,NextToken) or
                     ContainsJoins(LeftExpToken) then
                  { Version 5 }
                     begin
                     AddScanTokens(NextToken);
                     Result:=True;
                     end
                  else
                     ReduceNextWhereExpressionToken(LeftExpToken,
                                                    NextToken);
                  end;
               end;
            etBINARY:
               begin
               { First check to see if we're dealing with a binary operator
                 foOR or foAND }
               if (TokenOperator in [eoOR,eoAND]) then
                  begin
                  if (TokenOperator=eoOR) and
                     (ContainsMultipleDataSources(TempAlias,NextToken) or
                      ContainsJoins(LeftExpToken) or ContainsJoins(RightExpToken)) then
                     begin
                     AddScanTokens(NextToken);
                     Result:=True;
                     end
                  else
                     begin
                     LeftResult:=ReduceNextWhereExpressionToken(LeftExpToken,
                                                                NextToken);
                     RightResult:=ReduceNextWhereExpressionToken(RightExpToken,
                                                                 NextToken);
                     { Check to see what nodes we need to collapse in the
                       expression tree }
                     if (LeftResult and (not RightResult)) then
                        begin
                        TempRightToken:=RightExpToken;
                        NextToken.Copy(TempRightToken);
                        TempRightToken.Free;
                        Result:=False;
                        end
                     else if (RightResult and (not LeftResult)) then
                        begin
                        TempLeftToken:=LeftExpToken;
                        NextToken.Copy(TempLeftToken);
                        TempLeftToken.Free;
                        Result:=False;
                        end
                     else if (LeftResult and RightResult) then
                        begin
                        NextToken.Free;
                        Result:=True;
                        end;
                     end;
                  end
               else if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) and
                       (ContainsFields(LeftExpToken)) and
                       (ContainsFields(RightExpToken)) then
                  begin
                  if ContainsMultipleDataSources(TempAlias,NextToken) then
                     begin
                     AddScanTokens(NextToken);
                     Result:=True;
                     end
                  else
                     begin
                     ContainsMultipleDataSources(LeftAlias,LeftExpToken);
                     ContainsMultipleDataSources(RightAlias,RightExpToken);
                     { Only build a join if the two aliases are different
                       for the two fields }
                     if (OSCompareFileNames(LeftAlias,RightAlias) <> 0) then
                        begin
                        LeftTable:=FindSourceTable(LeftAlias);
                        RightTable:=FindSourceTable(RightAlias);
                        if (LeftTable=nil) or (RightTable=nil) then
                           GeneralError(NextToken,'Internal error: '+
                                      'cannot validate table correlation names '+
                                      'involved in join');
                        { Reverse the join to reflect the FROM join order initially }
                        if (LeftTable.JoinOrder > RightTable.JoinOrder) then
                           ReverseJoin(NextToken,LeftTable,RightTable);
                        if (not LeftTable.IsJoinedTo(jtInner,RightTable)) then
                           begin
                           { If either table is already involved in an outer join then
                             just add the WHERE join as a scan expression to be
                             evaluated after the joins }
                           if LeftTable.IsJoinedTo(jtLeftOuter,RightTable) or
                              RightTable.IsJoinedTo(jtLeftOuter,LeftTable) then
                              begin
                              AddScanTokens(NextToken);
                              Result:=True;
                              end
                           else
                              begin
                              { Now check to see if we need to do any other modifications
                                to the join order to accomodate a clean access path }
                              if RightTable.IsJoinedTo(jtInner,LeftTable) then
                                 ReverseJoin(NextToken,LeftTable,RightTable)
                              else if IsTargetOfInnerJoin(RightTable) then
                                 begin
                                 { If an existing valid path is present, then try to
                                   use it to tack on this inner join to an existing
                                   inner join, otherwise just add the join as scan
                                   tokens }
                                 if ValidPathExists(LeftTable,RightTable) then
                                    begin
                                    { Version 5 }
{                                    if IsTargetOfInnerJoin(RightTable) then
                                       begin
                                       ParentTable:=GetParentTable(jtInner,RightTable);
                                       ParentJoin:=ParentTable.GetJoin(jtInner,RightTable);
                                       if (ParentJoin <> nil) then
                                          begin
                                          ParentJoin.AddJoinTokens(jtInner,NextToken);
                                          Result:=True;
                                          end
                                       else
                                          GeneralError(NextToken,'Internal error: '+
                                                       'cannot combine join expressions')
                                       end
                                    else
                                       begin}
                                    { Version 5 }
                                    { Version 5 }
                                       AddScanTokens(NextToken);
                                       Result:=True;
{                                       end;}
                                    { Version 5 }
                                    end
                                 else
                                    begin
                                    if (not IsTargetOfInnerJoin(LeftTable)) then
                                       begin
                                       if (FQueryType=SELECT_STATEMENT) or
                                          ((FQueryType <> SELECT_STATEMENT) and
                                           (LeftTable.JoinOrder <> 1)) then
                                          begin
                                          ReverseJoin(NextToken,LeftTable,RightTable);
                                          RightTable.JoinOrder:=LeftTable.JoinOrder+1;
                                          RightTable.BumpJoinOrders;
                                          end
                                       else
                                          begin
                                          FlipJoins(jtInner,RightTable);
                                          SetJoinOrders;
                                          end;
                                       end
                                    else
                                       begin
                                       AddScanTokens(NextToken);
                                       Result:=True;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        if (not Result) then
                           begin
                           { Check to see if we have a situation where there
                             are constants involved in an expression in the join.
                             If this is the case, then just make it a scan expression }
                           if (NextToken.RightExpToken.TokenType <> etCONST) and
                              ContainsConstants(NextToken.RightExpToken) then
                              AddScanTokens(NextToken)
                           else
                              begin
                              LeftTable.AddJoin(jtInner,NextToken,RightTable);
                              FJoinedResult:=True;
                              end;
                           Result:=True;
                           end;
                        end;
                     end;
                  end
               else if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) and
                       ((ContainsFields(LeftExpToken) and
                         (not ContainsFields(RightExpToken))) or
                        (ContainsFields(RightExpToken) and
                         (not ContainsFields(LeftExpToken)))) then
                  begin
                  { Make sure to reverse operators, if needed }
                  if ((not ContainsFields(LeftExpToken)) and
                      ContainsFields(RightExpToken)) then
                     ReverseBinaryTokenOperator(NextToken);
                  if ContainsMultipleDataSources(TempAlias,NextToken) then
                     begin
                     AddScanTokens(NextToken);
                     Result:=True;
                     end;
                  end;
               end;
            etEXTBINARY,etFUNC:
               begin
               { Sub-selects must be evaluated as scan expressions in order
                 to permit the record buffers to be properly initialized for
                 building the sub-select filter }
               if ContainsMultipleDataSources(TempAlias,NextToken) then
                  begin
                  AddScanTokens(NextToken);
                  Result:=True;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.ReverseJoin(NextToken: TExpToken;
                                 var LeftTable: TSourceTable;
                                 var RightTable: TSourceTable);
var
   TempSourceTable: TSourceTable;
begin
   ReverseBinaryTokenOperator(NextToken);
   TempSourceTable:=LeftTable;
   LeftTable:=RightTable;
   RightTable:=TempSourceTable;
end;

function TDataQuery.ValidPathExists(LeftTable: TSourceTable;
                                    RightTable: TSourceTable): Boolean;
var
   I: Integer;
begin
   Result:=False;
   with LeftTable do
      begin
      for I:=0 to Joins.Count-1 do
         begin
         with TJoin(Joins[I]) do
            begin
            if (JoinType <> jtNone) then
               begin
               if (TargetTable=RightTable) then
                  Result:=True
               else
                  Result:=ValidPathExists(TargetTable,RightTable);
               if Result then
                  Break;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.ReduceHavingExpression;
begin
   ReduceNextHavingExpressionToken(FHavingExpressionTokens,nil);
end;

procedure TDataQuery.ReduceNextHavingExpressionToken(NextToken: TExpToken;
                                                       UpperToken: TExpToken);
var
   TempResultField: TResultField;
   TempToken: TExpToken;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      with NextToken do
         begin
         UpperExpToken:=UpperToken;
         case TokenType of
            etUNARY:
               ReduceNextHavingExpressionToken(LeftExpToken,NextToken);
            etBINARY:
               begin
               ReduceNextHavingExpressionToken(LeftExpToken,NextToken);
               ReduceNextHavingExpressionToken(RightExpToken,NextToken);
               end;
            etFUNC:
               begin
               if (TokenOperator in [eoSUM,eoRUNSUM,eoCOUNT,eoMIN,eoMAX,eoAVG,eoSTDDEV]) then
                  begin
                  TempResultField:=FindResultAggregateFieldForExpression(NextToken);
                  if (TempResultField=nil) then
                     GeneralError(NextToken,'Expression in HAVING clause '+
                                  'not found in source columns')
                  else
                     begin
                     TokenType:=etFIELD;
                     FieldName:=TempResultField.ResultName;
                     FieldNumber:=TempResultField.ResultNum;
                     DataType:=TempResultField.ResultDataType;
                     SubType:=TempResultField.ResultSubType;
                     DataSize:=TempResultField.ResultDataSize;
                     DataDecimals:=TempResultField.ResultDataDecimals;
                     TempToken:=ArgumentExpToken[0];
                     FreeExpressionTokens(TempToken);
                     ArgumentExpTokens.Clear;
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.SortJoinOrders;
begin
   FSourceTables.Sort(@CompareJoinOrders);
end;

procedure TDataQuery.SetJoinOrders;
var
   I: Integer;
begin
   for I:=0 to FSourceTables.Count-1 do
      TSourceTable(FSourceTables[I]).JoinOrder:=I+1;
end;

procedure TDataQuery.AddScanTokens(NextToken: TExpToken);
begin
   AddTokens(FScanExpressionTokens,NextToken);
   FHasScanExpressions:=True;
end;

procedure TDataQuery.AddTempScanTokens(NextToken: TExpToken);
begin
   AddTokens(FTempScanExpressionTokens,NextToken);
   FHasTempScanExpressions:=True;
end;

procedure TDataQuery.VerifyScanExpression(AllowUnknownTypes: Boolean);
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      SetFieldCallback(Integer(Self),@TDataQuery.VerifyWhereExpressionFieldData);
      VerifyExpression(FScanExpressionTokens,True,AllowUnknownTypes);
      CheckTypes(FScanExpressionTokens,[TYPE_BOOL],[SUBTYPE_UNKNOWN],AllowUnknownTypes);
      end;
end;

procedure TDataQuery.VerifyWhereExpression(AllowUnknownTypes: Boolean);
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      SetFieldCallback(Integer(Self),@TDataQuery.VerifyWhereExpressionFieldData);
      VerifyExpression(FWhereExpressionTokens,True,AllowUnknownTypes);
      CheckTypes(FWhereExpressionTokens,[TYPE_BOOL],[SUBTYPE_UNKNOWN],AllowUnknownTypes);
      end;
end;

procedure TDataQuery.VerifyHavingExpression(ResultFields: Boolean=False);
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      { Version 5 }
      if ResultFields then
         SetFieldCallback(Integer(Self),@TDataQuery.VerifyHavingExpressionResultFieldData)
      else
         SetFieldCallback(Integer(Self),@TDataQuery.VerifyHavingExpressionFieldData);
      { Version 5 }
      VerifyExpression(FHavingExpressionTokens,True,True);
      CheckTypes(FHavingExpressionTokens,[TYPE_BOOL],[SUBTYPE_UNKNOWN],False);
      end;
end;

procedure TDataQuery.VerifyJoinExpression(NextJoinToken: TExpToken;
                                          AllowUnknownTypes: Boolean);
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      SetFieldCallback(Integer(Self),@TDataQuery.VerifyWhereExpressionFieldData);
      VerifyExpression(NextJoinToken,True,AllowUnknownTypes);
      CheckTypes(NextJoinToken,[TYPE_BOOL],[SUBTYPE_UNKNOWN],AllowUnknownTypes);
      end;
end;

procedure TDataQuery.ReduceJoins;
var
   I: Integer;
begin
   for I:=0 to FSourceTables.Count-1 do
      TSourceTable(FSourceTables[I]).ReduceJoins;
end;

procedure TDataQuery.VerifyJoins(AllowUnknownTypes: Boolean);
var
   I: Integer;
begin
   for I:=0 to FSourceTables.Count-1 do
      TSourceTable(FSourceTables[I]).VerifyJoins(AllowUnknownTypes);
end;

function TDataQuery.VerifyExpressionFieldData(FieldToken: TExpToken): Boolean;
var
   TempFieldNum: Word;
   TempFieldDefinition: pFieldDefinition;
begin
   Result:=False;
   with FieldToken do
      begin
      with TDataQuery(SourceObject) do
         begin
         { Be sure to update all of the data field types and field
           numbers in the current token }
         DataSource:=FindSourceTableForField(SourceAlias,FieldName,False,TempFieldNum);
         if (DataSource <> nil) then
            begin
            with TSourceTable(DataSource) do
               begin
               FieldNumber:=TempFieldNum;
               TempFieldDefinition:=DataCursor.GetPhysicalFieldDefinition(FieldNumber);
               SourceAlias:=AliasName;
               DataType:=TempFieldDefinition^.DataType;
               SubType:=TempFieldDefinition^.SubType;
               DataSize:=TempFieldDefinition^.DataSize;
               DataDecimals:=TempFieldDefinition^.DataDecimals;
               Result:=True;
               end;
            end;
         end;
      end;
end;

function TDataQuery.VerifyWhereExpressionFieldData(FieldToken: TExpToken): Boolean;
var
   TempFieldNum: Word;
   TempFieldDefinition: pFieldDefinition;
   TempResultField: TResultField;
begin
   Result:=False;
   with FieldToken do
      begin
      with TDataQuery(SourceObject) do
         begin
         { Handle canned result sub-queries specifically }
         if (TDataQuery(SourceObject) <> Self) and (SubSelectType=stSubSelect) and
            (not IsLiveResult) then
            begin
            TempResultField:=TResultField(ResultFields[0]);
            SourceAlias:=TempResultField.AliasName;
            FieldNumber:=TempResultField.ResultNum;
            FieldName:=TempResultField.ResultName;
            DataType:=TempResultField.DataType;
            SubType:=TempResultField.SubType;
            DataSize:=TempResultField.DataSize;
            DataDecimals:=TempResultField.DataDecimals;
            Result:=True;
            end
         else
            begin
            { Be sure to update the field name properly for live result
              sub-queries from the first result field }
            if (TDataQuery(SourceObject) <> Self) and (SubSelectType=stSubSelect) then
               FieldName:=TResultField(ResultFields[0]).FieldName;
            { Be sure to update all of the data field types and field
              numbers in the current token }
            DataSource:=FindSourceTableForField(SourceAlias,FieldName,False,TempFieldNum);
            if (DataSource <> nil) then
               begin
               with TSourceTable(DataSource) do
                  begin
                  FieldNumber:=TempFieldNum;
                  TempFieldDefinition:=DataCursor.GetPhysicalFieldDefinition(FieldNumber);
                  SourceAlias:=AliasName;
                  DataType:=TempFieldDefinition^.DataType;
                  SubType:=TempFieldDefinition^.SubType;
                  DataSize:=TempFieldDefinition^.DataSize;
                  DataDecimals:=TempFieldDefinition^.DataDecimals;
                  Result:=True;
                  end;
               end;
            end;
         end;
      end;
end;

{ Version 5 }
function TDataQuery.VerifyHavingExpressionFieldData(FieldToken: TExpToken): Boolean;
var
   TempFieldNum: Word;
   TempFieldDefinition: pFieldDefinition;
begin
   Result:=False;
   with FieldToken do
      begin
      { If the upper token is an aggregate, then check for the appropriate field }
      if (UpperExpToken.TokenType=etFUNC) and
         (UpperExpToken.TokenOperator in [eoSUM,eoRUNSUM,eoCOUNT,eoMIN,eoMAX,eoAVG,eoSTDDEV]) then
         begin
         with TDataQuery(SourceObject) do
            begin
            { Be sure to update all of the data field types and field
              numbers in the current token }
            DataSource:=FindSourceTableForField(SourceAlias,FieldName,False,TempFieldNum);
            if (DataSource <> nil) then
               begin
               with TSourceTable(DataSource) do
                  begin
                  FieldNumber:=TempFieldNum;
                  TempFieldDefinition:=DataCursor.GetPhysicalFieldDefinition(FieldNumber);
                  SourceAlias:=AliasName;
                  DataType:=TempFieldDefinition^.DataType;
                  SubType:=TempFieldDefinition^.SubType;
                  DataSize:=TempFieldDefinition^.DataSize;
                  DataDecimals:=TempFieldDefinition^.DataDecimals;
                  Result:=True;
                  end;
               end;
            end;
         end
      else
         Result:=True;
      end;
end;
{ Version 5 }

function TDataQuery.VerifyHavingExpressionResultFieldData(FieldToken: TExpToken): Boolean;
var
   TempResultField: TResultField;
   TempFieldNum: Word;
begin
   Result:=False;
   with FieldToken do
      begin
      { Be sure to update all of the data field types and field
        numbers in the current token }
      TempResultField:=FindResultField(True,FieldName,SourceAlias,TempFieldNum);
      if (TempResultField <> nil) then
         begin
         FieldNumber:=TempFieldNum;
         SourceAlias:=TempResultField.AliasName;
         DataType:=TempResultField.ResultDataType;
         SubType:=TempResultField.ResultSubType;
         DataSize:=TempResultField.ResultDataSize;
         DataDecimals:=TempResultField.ResultDataDecimals;
         Result:=True;
         end;
      end;
end;

function TDataQuery.EvaluateScanExpression: Boolean;
begin
   EvaluateExpressionToken(FScanExpressionTokens,nil,Integer(Self),
                           @TDataQuery.EvaluateExpressionFieldData,FLocaleID);
   Result:=pWordBool(FScanExpressionTokens.Value)^;
end;

function TDataQuery.EvaluateTempScanExpression: Boolean;
begin
   EvaluateExpressionToken(FTempScanExpressionTokens,nil,Integer(Self),
                           @TDataQuery.EvaluateExpressionFieldData,FLocaleID);
   Result:=pWordBool(FTempScanExpressionTokens.Value)^;
end;

function TDataQuery.EvaluateHavingExpression(RecordBuffer: PChar): Boolean;
begin
   EvaluateExpressionToken(FHavingExpressionTokens,RecordBuffer,Integer(Self),
                           @TDataQuery.EvaluateResultFieldData,FLocaleID);
   Result:=pWordBool(FHavingExpressionTokens.Value)^;
end;

procedure TDataQuery.EvaluateInsertValueExpression(NextToken: TExpToken);
begin
   EvaluateExpressionToken(NextToken,nil,Integer(Self),nil,FLocaleID);
end;

procedure TDataQuery.EvaluateSubSelectInsertValueExpression(SubQuery: TDataQuery;
                                                            RecordBuffer: PChar;
                                                            NextToken: TExpToken);
begin
   EvaluateExpressionToken(NextToken,RecordBuffer,Integer(SubQuery),
                           @TDataQuery.EvaluateResultFieldData,FLocaleID);
end;

procedure TDataQuery.EvaluateUpdateValueExpression(NextToken: TExpToken);
begin
   EvaluateExpressionToken(NextToken,nil,Integer(Self),
                           @TDataQuery.EvaluateExpressionFieldData,FLocaleID);
end;

function TDataQuery.EvaluateExpressionFieldData(RecordBuffer: PChar;
                                                FieldToken: TExpToken): Boolean;
var
   FieldIsBlank: Boolean;
   BlobHandle: Integer;
   BlobSizeToLoad: Integer;
   BlobSizeLoaded: Integer;
   { Version 5 }
   TempFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   { Version 5 }
begin
   Result:=True;
   with FieldToken do
      begin
      FieldIsBlank:=True;
      if (DataSource <> nil) then
         begin
         with TSourceTable(DataSource) do
            begin
            if (DataType=TYPE_BLOB) then
               begin
               BlobHandle:=0;
               DataCursor.GetPhysicalField(FieldNumber,CurRecordBuffer,
                                           @BlobHandle,FieldIsBlank);
               if not FieldIsBlank then
                  begin
                  DataCursor.OpenBlob(FieldNumber,CurRecordBuffer,
                                      BLOB_OPENREADONLY,True,True,BlobSizeToLoad,False);
                  try
                     if ((DataType=TYPE_BLOB) and (SubType=SUBTYPE_MEMO)) then
                        DataSize:=(BlobSizeToLoad+1)
                     else
                        DataSize:=BlobSizeToLoad;
                     DataCursor.GetBlob(FieldNumber,CurRecordBuffer,0,Value,
                                        BlobSizeToLoad,BlobSizeLoaded,True);
                     if (SubType=SUBTYPE_MEMO) then
                        (Value+BlobSizeToLoad)^:=#0;
                  finally
                     DataCursor.FreeBlob(FieldNumber,CurRecordBuffer,True,True);
                  end;
                  end
               else
                  begin
                  if ((DataType=TYPE_BLOB) and (SubType=SUBTYPE_MEMO)) then
                     begin
                     DataSize:=1;
                     Value^:=#0;
                     end
                  else
                     DataSize:=0;
                  end;
               end
            else
               { Version 5 }
               begin
               if (DataType=TYPE_ZSTRING) then
                  begin
                  DataCursor.GetPhysicalField(FieldNumber,CurRecordBuffer,@TempFieldBuffer,FieldIsBlank);
                  DataSize:=StrLen(@TempFieldBuffer)+1;
                  Move(TempFieldBuffer,Value^,DataSize);
                  end
               else
                  DataCursor.GetPhysicalField(FieldNumber,CurRecordBuffer,Value,FieldIsBlank);
               end;
               { Version 5 }
            end;
         end;
      IsNull:=FieldIsBlank;
      end;
end;


function TDataQuery.EvaluateResetFieldData(RecordBuffer: PChar;
                                           FieldToken: TExpToken): Boolean;
var
   FieldIsBlank: Boolean;
   BlobHandle: Integer;
   BlobSizeToLoad: Integer;
   BlobSizeLoaded: Integer;
   { Version 5 }
   TempFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   { Version 5 }
begin
   Result:=True;
   with FieldToken do
      begin
      FieldIsBlank:=True;
      if (DataSource <> nil) then
         begin
         with TSourceTable(DataSource) do
            begin
            if (DataType=TYPE_BLOB) then
               begin
               BlobHandle:=0;
               DataCursor.GetPhysicalField(FieldNumber,CurRecordBuffer,
                                           @BlobHandle,FieldIsBlank);
               if not FieldIsBlank then
                  begin
                  DataCursor.OpenBlob(FieldNumber,CurRecordBuffer,
                                      BLOB_OPENREADONLY,True,True,BlobSizeToLoad,False);
                  try
                     if ((DataType=TYPE_BLOB) and (SubType=SUBTYPE_MEMO)) then
                        DataSize:=(BlobSizeToLoad+1)
                     else
                        DataSize:=BlobSizeToLoad;
                     DataCursor.GetBlob(FieldNumber,CurRecordBuffer,0,Value,
                                        BlobSizeToLoad,BlobSizeLoaded,True);
                     if (SubType=SUBTYPE_MEMO) then
                        (Value+BlobSizeToLoad)^:=#0;
                  finally
                     DataCursor.FreeBlob(FieldNumber,CurRecordBuffer,True,True);
                  end;
                  end
               else
                  begin
                  if ((DataType=TYPE_BLOB) and (SubType=SUBTYPE_MEMO)) then
                     begin
                     DataSize:=1;
                     Value^:=#0;
                     end
                  else
                     DataSize:=0;
                  end;
               end
            else
               { Version 5 }
               begin
               if (DataType=TYPE_ZSTRING) then
                  begin
                  DataCursor.GetPhysicalField(FieldNumber,CurRecordBuffer,@TempFieldBuffer,FieldIsBlank);
                  DataSize:=StrLen(@TempFieldBuffer)+1;
                  Move(TempFieldBuffer,Value^,DataSize);
                  end
               else
                  DataCursor.GetPhysicalField(FieldNumber,CurRecordBuffer,Value,FieldIsBlank);
               end;
               { Version 5 }
            end;
         end;
      IsNull:=FieldIsBlank;
      end;
end;

function TDataQuery.EvaluateResultFieldData(RecordBuffer: PChar;
                                            FieldToken: TExpToken): Boolean;
var
   FieldIsBlank: Boolean;
   BlobHandle: Integer;
   BlobSizeToLoad: Integer;
   BlobSizeLoaded: Integer;
   { Version 5 }
   TempFieldBuffer: array [0..MAX_FIELD_SIZE] of Char;
   { Version 5 }
begin
   Result:=True;
   with FieldToken do
      begin
      FieldIsBlank:=True;
      with FResultTable do
         begin
         if (DataType=TYPE_BLOB) then
            begin
            BlobHandle:=0;
            GetPhysicalField(FieldNumber,RecordBuffer,
                             @BlobHandle,FieldIsBlank);
            if not FieldIsBlank then
               begin
               OpenBlob(FieldNumber,RecordBuffer,BLOB_OPENREADONLY,True,True,
                        BlobSizeToLoad,False);
               try
                  if ((DataType=TYPE_BLOB) and (SubType=SUBTYPE_MEMO)) then
                     DataSize:=(BlobSizeToLoad+1)
                  else
                     DataSize:=BlobSizeToLoad;
                  GetBlob(FieldNumber,RecordBuffer,0,Value,BlobSizeToLoad,
                          BlobSizeLoaded,True);
                  if (SubType=SUBTYPE_MEMO) then
                     (Value+BlobSizeToLoad)^:=#0;
               finally
                  FreeBlob(FieldNumber,RecordBuffer,True,True);
               end;
               end
            else
               begin
               if ((DataType=TYPE_BLOB) and (SubType=SUBTYPE_MEMO)) then
                  begin
                  DataSize:=1;
                  Value^:=#0;
                  end
               else
                  DataSize:=0;
               end;
            end
         else
            { Version 5 }
            begin
            if (DataType=TYPE_ZSTRING) then
               begin
               GetPhysicalField(FieldNumber,RecordBuffer,@TempFieldBuffer,FieldIsBlank);
               DataSize:=StrLen(@TempFieldBuffer)+1;
               Move(TempFieldBuffer,Value^,DataSize);
               end
            else
               GetPhysicalField(FieldNumber,RecordBuffer,Value,FieldIsBlank);
            end;
            { Version 5 }
         end;
      IsNull:=FieldIsBlank;
      end;
end;

function TDataQuery.FirstRecordRead: Boolean;
begin
   { Be sure to shortcut any constant expressions }
   if FHasScanExpressions then
      begin
      if (not ContainsFields(FScanExpressionTokens)) then
         begin
         Result:=EvaluateScanExpression;
         if (not Result) then
            Exit;
         end
      end;
   if FHasTempScanExpressions then
      begin
      if (not ContainsFields(FTempScanExpressionTokens)) then
         begin
         Result:=EvaluateTempScanExpression;
         if (not Result) then
            Exit;
         end
      end;
   Result:=TSourceTable(FSourceTables[0]).FirstRecordRead(jtNone);
end;

function TDataQuery.LastRecordRead: Boolean;
begin
   Result:=TSourceTable(FSourceTables[0]).LastRecordRead(jtNone);
end;

function TDataQuery.RefreshRecordRead: Boolean;
begin
   Result:=TSourceTable(FSourceTables[0]).RefreshRecordRead;
end;

function TDataQuery.NextRecordRead: Boolean;
begin
   Result:=TSourceTable(FSourceTables[0]).NextRecordRead;
end;

function TDataQuery.PriorRecordRead: Boolean;
begin
   Result:=TSourceTable(FSourceTables[0]).PriorRecordRead;
end;

procedure TDataQuery.OpenSourceTables;
var
   I: Integer;
begin
   for I:=0 to FSourceTables.Count-1 do
      begin
      with TSourceTable(FSourceTables[I]) do
         begin
         JoinOrder:=(I+1);
         Open(Integer(Self),FWantLiveResult);
         if (I=0) then
            begin
            if (not FLocaleIDSet) then
               FLocaleID:=DataCursor.LocaleID;
            end;
         end;
      end;
end;

procedure TDataQuery.OpenExtraTables;
var
   I: Integer;
begin
   for I:=0 to FExtraTables.Count-1 do
      begin
      with TSourceTable(FExtraTables[I]) do
         Open(Integer(Self),False);
      end;
end;

procedure TDataQuery.RefreshSourceTables;
var
   I: Integer;
begin
   if GeneratePlan then
      begin
      Plan('Tables Involved');
      Plan('---------------');
      Plan('');
      end;
   for I:=0 to FSourceTables.Count-1 do
      begin
      with TSourceTable(FSourceTables[I]) do
         begin
         DataCursor.Refresh;
         if GeneratePlan then
            begin
            if Exclusive then
               Plan(TableName+' ('+AliasName+') table opened exclusive, has '+
                    IntToStr(DataCursor.TotalRecordCount)+' rows')
            else
               Plan(TableName+' ('+AliasName+') table opened shared, has '+
                    IntToStr(DataCursor.TotalRecordCount)+' rows');
            end;
         end;
      end;
   if GeneratePlan then
      Plan('');
end;

procedure TDataQuery.RefreshExtraTables;
var
   I: Integer;
begin
   for I:=0 to FExtraTables.Count-1 do
      begin
      with TSourceTable(FExtraTables[I]) do
         begin
         if (DataCursor=nil) then
            ExecuteError('Illegal use of LASTAUTOINC() or IDENT_CURRENT() functions')
         else
            DataCursor.Refresh;
         end;
      end;
end;

procedure TDataQuery.VerifyOrderByFields;
var
   I: Integer;
   TempFieldNum: Word;
   TempOrderByField: TOrderByField;
   TempResultField: TResultField;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      if (FOrderByFields.Count > MAX_NUM_FIELDS) then
         GeneralError(TOrderByField(FOrderByFields[MAX_NUM_FIELDS]).ExpressionTokens,
                      'Maximum number of ORDER BY columns ('+
                      IntToStr(MAX_NUM_FIELDS)+') exceeded');
      for I:=0 to FOrderByFields.Count-1 do
         begin
         TempOrderByField:=TOrderByField(FOrderByFields[I]);
         with TempOrderByField do
            begin
            TempResultField:=nil;
            if (FieldNum <> 0) then
               begin
               if (FieldNum=0) or (FieldNum > FResultFields.Count) then
                  ExpectedExpressionError(ExpressionTokens,'column number')
               else
                  TempResultField:=FResultFields[FieldNum-1];
               if (TempResultField.DataType=TYPE_BLOB) then
                  GeneralError(ExpressionTokens,'Invalid ORDER BY BLOB column number')
               end
            else
               begin
               TempResultField:=FindResultField(False,FieldName,AliasName,TempFieldNum);
               if (TempResultField <> nil) then
                  begin
                  FieldNum:=TempFieldNum;
                  if (TempResultField.DataType=TYPE_BLOB) then
                     GeneralError(ExpressionTokens,'Invalid ORDER BY BLOB column name');
                  end
               else
                  ExpectedExpressionError(ExpressionTokens,'column name')
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.VerifyGroupByFields;
var
   I: Integer;
   TempFieldNum: Word;
   TempGroupByField: TGroupByField;
   TempResultField: TResultField;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      if (FGroupByFields.Count > MAX_NUM_FIELDS) then
         GeneralError(TGroupByField(FGroupByFields[MAX_NUM_FIELDS]).ExpressionTokens,
                      'Maximum number of GROUP BY columns ('+
                      IntToStr(MAX_NUM_FIELDS)+') exceeded');
      for I:=0 to FGroupByFields.Count-1 do
         begin
         TempGroupByField:=TGroupByField(FGroupByFields[I]);
         with TempGroupByField do
            begin
            if (FieldNum <> 0) then
               begin
               if (FieldNum=0) or (FieldNum > FResultFields.Count) then
                  ExpectedExpressionError(ExpressionTokens,'column number')
               else
                  begin
                  TempResultField:=TResultField(FResultFields[FieldNum-1]);
                  if (TempResultField.DataType=TYPE_BLOB) then
                     GeneralError(ExpressionTokens,'Invalid GROUP BY BLOB column number')
                  end;
               end
            else
               begin
               TempResultField:=FindResultField(False,FieldName,AliasName,TempFieldNum);
               if (TempResultField <> nil) then
                  begin
                  FieldNum:=TempFieldNum;
                  if (TempResultField.DataType=TYPE_BLOB) then
                     GeneralError(ExpressionTokens,'Invalid GROUP BY BLOB column name');
                  end
               else
                  ExpectedExpressionError(ExpressionTokens,'column name')
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.VerifyDistinctFields;
var
   I: Integer;
   TempResultField: TResultField;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      if (FResultFields.Count > MAX_NUM_FIELDS) then
         GeneralError(TResultField(FResultFields[MAX_NUM_FIELDS]).ExpressionTokens,
                      'Maximum number of DISTINCT columns ('+
                      IntToStr(MAX_NUM_FIELDS)+') exceeded');
      for I:=0 to FResultFields.Count-1 do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         with TempResultField do
            begin
            if (DataType=TYPE_BLOB) then
               GeneralError(ExpressionTokens,'Invalid DISTINCT BLOB column');
            end;
         end;
      end;
end;

procedure TDataQuery.AssignResultTableParams;
var
   TempDirectoryName: string;
   TempDirectory: string;
   TempRights: Integer;
begin
   TempDirectoryName:='';
   TempDirectory:='';
   { If the result set is not being explicitly created (INTO clause), then
     give it a temporary name }
   FResultTableName:=ConvertSlashes(FResultTableName);
   if (FResultTableName='') then
      begin
      FResultDataDirectory:=DataSession.OpenDataDirectory('',
                            DataSession.PrivateDirectory,False,False);
      FResultTable:=TDataCursor.Create(FResultDataDirectory,False);
      FResultTable.TableName:=ExtractFileRoot(FResultDataDirectory.GetTempDataTableName,DataEngine.DataExtension);
      FResultTable.ErrorTableName:=DBISAM_ERRSTR_QUERY+' ('+FResultTable.TableName+')';
      end
   else
      begin
      if ContainsDirectory(FResultTableName) then
         begin
         TempDirectoryName:=ExtractFilePath(FResultTableName);
         if DataSession.IsServer then
            begin
            TempDirectoryName:=RemoveAllBS(TempDirectoryName);
            TempRights:=0;
            DataSession.DoGetPath(TempDirectoryName,TempDirectory);
            FResultDataDirectory:=DataSession.OpenDataDirectory(TempDirectoryName,
                                  TempDirectory,False,False,True);
            DataSession.DoGetRights(TempDirectoryName,TempRights);
            FResultDataDirectory.ServerRights:=TempRights;
            CheckResultRights(FResultDataDirectory);
            FResultTable:=TDataCursor.Create(FResultDataDirectory,False);
            FResultTable.TableName:=StripFilePathAndExtension(FResultTableName,DataEngine.DataExtension);
            end
         else
            begin
            TempDirectoryName:=RemoveAllTrailingBS(TempDirectoryName);
            if MemoryDirectory(TempDirectoryName) then
               begin
               TempDirectoryName:=RemoveAllBS(TempDirectoryName);
               DataSession.DoGetPath(TempDirectoryName,TempDirectory);
               FResultDataDirectory:=DataSession.OpenDataDirectory(
                                     TempDirectoryName,TempDirectory,False,False);
               end
            else
               FResultDataDirectory:=DataSession.OpenDataDirectory('',
                                     TempDirectoryName,False,False);
            FResultTable:=TDataCursor.Create(FResultDataDirectory,False);
            FResultTable.TableName:=StripFilePathAndExtension(FResultTableName,DataEngine.DataExtension);
            end;
         end
      else
         begin
         if DataSession.IsServer then
            begin
            TempRights:=0;
            FResultDataDirectory:=DataSession.OpenDataDirectory(
                                  DataDirectory.Name,
                                  DataDirectory.Directory,False,False,True);
            DataSession.DoGetRights(DataDirectory.Name,TempRights);
            FResultDataDirectory.ServerRights:=TempRights;
            CheckResultRights(FResultDataDirectory);
            FResultTable:=TDataCursor.Create(FResultDataDirectory,False);
            FResultTable.TableName:=StripFilePathAndExtension(FResultTableName,DataEngine.DataExtension);
            end
         else
            begin
            FResultDataDirectory:=DataSession.OpenDataDirectory(
                                  DataDirectory.Name,
                                  DataDirectory.Directory,False,False);
            FResultTable:=TDataCursor.Create(FResultDataDirectory,False);
            FResultTable.TableName:=StripFilePathAndExtension(FResultTableName,DataEngine.DataExtension);
            end;
         end;
      end;
end;

procedure TDataQuery.CreateResultTable;
var
   I: Integer;
   J: Word;
   TempFieldCount: Word;
   TempFieldDefinitions: array [1..MAX_NUM_FIELDS] of pFieldDefinition;
   TempIndexCount: Byte;
   TempIndexDefinitions: array [0..MAX_NUM_INDEXES] of pIndexDefinition;
   TempResultField: TResultField;
   RemovePassword: Boolean;
   TempOrderByCount: Integer;
   TempGroupByCount: Integer;
   TempPageSize: Integer;
begin
   TempFieldCount:=0;
   TempIndexCount:=0;

   FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
   FillChar(TempIndexDefinitions,SizeOf(TempIndexDefinitions),#0);
   try
      { Version 5}
      { Handle @@IDENTITY queries for the ODBC driver }
      if FIdentityOnly then
         begin
         Inc(TempFieldCount);
         TempFieldDefinitions[TempFieldCount]:=AllocMem(SizeOf(TFieldDefinition));
         with TempFieldDefinitions[TempFieldCount]^ do
            begin
            DataType:=TYPE_INT32;
            SubType:=SUBTYPE_UNKNOWN;
            FieldNum:=1;
            FieldName:='Identity';
            ExpressionField:=False;
            CharCase:=NO_CHANGE;
            Required:=False;
            Default:='';
            Minimum:='';
            Maximum:='';
            Compression:=NO_COMPRESSION;
            end;
         TempIndexDefinitions[TempIndexCount]:=AllocMem(SizeOf(TIndexDefinition));
         end
         { Version 5}
      else
         begin
         { Build the fields first }
         for I:=0 to FResultFields.Count-1 do
            begin
            TempResultField:=TResultField(FResultFields[I]);
            FBlobBlockSize:=MaximumInteger(TempResultField.SourceTable.DataCursor.BlobBlockSize,
                                           FBlobBlockSize);
            TempFieldDefinitions[TempResultField.ResultNum]:=
                  AllocMem(SizeOf(TFieldDefinition));
            if (not TempResultField.IsExpression) and
               (TempResultField.CalculationType=rcNone) then
               TempFieldDefinitions[TempResultField.ResultNum]^:=
               TempResultField.SourceTable.DataCursor.GetPhysicalFieldDefinition(TempResultField.FieldNum)^;
            with TempFieldDefinitions[TempResultField.ResultNum]^ do
               begin
               if TempResultField.IsExpression or
                  (TempResultField.CalculationType <> rcNone) then
                  begin
                  DataType:=TempResultField.ResultDataType;
                  SubType:=TempResultField.ResultSubType;
                  case DataType of
                     TYPE_ZSTRING:
                        Length:=(TempResultField.ResultDataSize-1);
                     TYPE_BYTES,TYPE_VARBYTES:
                        Length:=TempResultField.ResultDataSize;
                     TYPE_BCD:
                        Decimals:=TempResultField.ResultDataDecimals;
                     end;
                  end;
               FieldNum:=TempResultField.ResultNum;
               FieldName:=TempResultField.ResultName;
               ExpressionField:=False;
               CharCase:=NO_CHANGE;
               Required:=False;
               Default:='';
               Minimum:='';
               Maximum:='';
               Compression:=NO_COMPRESSION;
               Hidden:=TempResultField.IsHidden;
               if (not TempResultField.IsExpression) then
                  begin
                  FieldOrigin:=TempResultField.SourceTable.TableName+
                               PARSE_ALIAS_QUALIFIER+TempResultField.FieldName;
                  if DataSession.IsServer then
                     FieldDatabaseOrigin:=TempResultField.SourceTable.DataDirectory.Name
                  else
                     FieldDatabaseOrigin:=TempResultField.SourceTable.DataDirectory.Directory;
                  end;
               end;
            Inc(TempFieldCount);
            end;

         if FHasAvgs or FHasStdDevs then
            begin
            { Now check for column averages or stddev and be sure to apply the proper
              expression fields to the correct columns }
            for I:=0 to FResultFields.Count-1 do
               begin
               TempResultField:=TResultField(FResultFields[I]);
               case TempResultField.CalculationType of
                  rcAvg:
                     begin
                     Inc(TempFieldCount);
                     TempResultField.CountNum:=TempFieldCount;
                     TempFieldDefinitions[TempFieldCount]:=
                           AllocMem(SizeOf(TFieldDefinition));
                     with TempFieldDefinitions[TempFieldCount]^ do
                        begin
                        DataType:=TYPE_INT32;
                        FieldNum:=TempFieldCount;
                        FieldName:=AVGCOUNT_FIELD_NAME+IntToStr(TempFieldCount);
                        ExpressionField:=False;
                        CharCase:=NO_CHANGE;
                        Required:=False;
                        Default:='';
                        Minimum:='';
                        Maximum:='';
                        Compression:=NO_COMPRESSION;
                        Hidden:=True;
                        end;
                     end;
                  rcStdDev:
                     begin
                     Inc(TempFieldCount);
                     TempResultField.CountNum:=TempFieldCount;
                     TempFieldDefinitions[TempFieldCount]:=
                           AllocMem(SizeOf(TFieldDefinition));
                     with TempFieldDefinitions[TempFieldCount]^ do
                        begin
                        DataType:=TYPE_INT32;
                        FieldNum:=TempFieldCount;
                        FieldName:=STDDEVCOUNT_FIELD_NAME+IntToStr(TempFieldCount);
                        ExpressionField:=False;
                        CharCase:=NO_CHANGE;
                        Required:=False;
                        Default:='';
                        Minimum:='';
                        Maximum:='';
                        Compression:=NO_COMPRESSION;
                        Hidden:=True;
                        end;
                     Inc(TempFieldCount);
                     TempResultField.SumNum:=TempFieldCount;
                     TempFieldDefinitions[TempFieldCount]:=
                           AllocMem(SizeOf(TFieldDefinition));
                     with TempFieldDefinitions[TempFieldCount]^ do
                        begin
                        DataType:=TYPE_FLOAT;
                        FieldNum:=TempFieldCount;
                        FieldName:=STDDEVSUM_FIELD_NAME+IntToStr(TempFieldCount);
                        ExpressionField:=False;
                        CharCase:=NO_CHANGE;
                        Required:=False;
                        Default:='';
                        Minimum:='';
                        Maximum:='';
                        Compression:=NO_COMPRESSION;
                        Hidden:=True;
                        end;
                     end;
                  end;
               end;
            end;

         { Check to see if we need to create a hidden "mark" field for intersect
           operations }

         for I:=0 to FMergeQueries.Count-1 do
            begin
            if (TDataQuery(FMergeQueries[I]).MergeType in [mtIntersect,mtIntersectAll]) then
               begin
               Inc(TempFieldCount);
               TempFieldDefinitions[TempFieldCount]:=
                     AllocMem(SizeOf(TFieldDefinition));
               with TempFieldDefinitions[TempFieldCount]^ do
                  begin
                  DataType:=TYPE_BOOL;
                  FieldNum:=TempFieldCount;
                  FieldName:=INTERSECT_FIELD_NAME+IntToStr(TempFieldCount);
                  ExpressionField:=False;
                  CharCase:=NO_CHANGE;
                  Required:=False;
                  Default:='';
                  Minimum:='';
                  Maximum:='';
                  Compression:=NO_COMPRESSION;
                  Hidden:=True;
                  end;
               Break;
               end;
            end;

         TempIndexDefinitions[TempIndexCount]:=AllocMem(SizeOf(TIndexDefinition));

         if (not FOrderedResult) then
            begin
            { Just create a dummy primary index definition for the result set
              for ordering purposes }
            with TempIndexDefinitions[TempIndexCount]^ do
               begin
               IndexName:='';
               KeyCaseInsensitive:=False;
               KeyFieldCount:=0;
               KeyUnique:=True;
               KeyCompressionType:=BOTH_COMPRESS;
               end;
            with MasterSourceTable.DataCursor.GetIndexDefinition(0)^ do
               begin
               for J:=1 to KeyFieldCount do
                  begin
                  for I:=0 to FResultFields.Count-1 do
                     begin
                     TempResultField:=TResultField(FResultFields[I]);
                     { Build a dummy ORDER BY based upon the primary index of
                       the first table in the FROM clause so that live queries
                       match canned queries in terms of ordering as much as
                       possible }
                     if (TempResultField.SourceTable=MasterSourceTable) then
                        begin
                        if (TempResultField.FieldNum=KeyFields[J]) then
                           begin
                           Inc(TempIndexDefinitions[TempIndexCount]^.KeyFieldCount);
                           TempIndexDefinitions[TempIndexCount]^.KeyFields[TempIndexDefinitions[TempIndexCount]^.KeyFieldCount]:=TempResultField.ResultNum;
                           TempIndexDefinitions[TempIndexCount]^.KeyDescendingFields[TempIndexDefinitions[TempIndexCount]^.KeyFieldCount]:=KeyDescendingFields[J];
                           end;
                        end;
                     end;
                  end;
               end;
            end
         else
            begin
            TempOrderByCount:=MinimumInteger(FOrderByFields.Count,(MAX_NUM_FLDSINKEY-1));
            with TempIndexDefinitions[TempIndexCount]^ do
               begin
               IndexName:='';
               KeyCaseInsensitive:=FOrderByCaseInsensitive;
               KeyFieldCount:=TempOrderByCount;
               KeyUnique:=True;
               KeyCompressionType:=BOTH_COMPRESS;
               end;
            for I:=0 to TempOrderByCount-1 do
               begin
               with TOrderByField(FOrderByFields[I]) do
                  begin
                  with TempIndexDefinitions[TempIndexCount]^ do
                     begin
                     KeyFields[I+1]:=FieldNum;
                     KeyDescendingFields[I+1]:=Descending;
                     end;
                  end;
               end;
            { Trap for instance where there all of the fields in the index
              are descending }
            with TempIndexDefinitions[TempIndexCount]^ do
               begin
               for I:=1 to KeyFieldCount do
                  begin
                  if KeyDescendingFields[I] then
                     KeyDescending:=True
                  else
                     begin
                     KeyDescending:=False;
                     Break;
                     end;
                  end;
               end;
            end;
         end;

      { Be sure to add the record ID to the end of the ordering
        primary index }
      with TempIndexDefinitions[TempIndexCount]^ do
         begin
         Inc(KeyFieldCount);
         KeyFields[KeyFieldCount]:=RECORDID_FIELD_NUM;
         end;

      { Create a dummy text index definition - never used }
      TempIndexDefinitions[TEXT_INDEX_POS]:=AllocMem(SizeOf(TIndexDefinition));

      { Now check to see if there is an GROUP BY statement, if so
        the we need to create an index on the result table }

      if FGroupedResult and (not FSingleRowResult) then
         begin
         Inc(TempIndexCount);
         TempIndexDefinitions[TempIndexCount]:=AllocMem(SizeOf(TIndexDefinition));
         TempGroupByCount:=MinimumInteger(FGroupByFields.Count,MAX_NUM_FLDSINKEY);
         with TempIndexDefinitions[TempIndexCount]^ do
            begin
            IndexName:=GROUPBY_INDEX_NAME;
            KeyUnique:=False;
            KeyFieldCount:=TempGroupByCount;
            KeyCompressionType:=BOTH_COMPRESS;
            end;
         for I:=0 to TempGroupByCount-1 do
            begin
            with TGroupByField(FGroupByFields[I]) do
               TempIndexDefinitions[TempIndexCount]^.KeyFields[I+1]:=FieldNum;
            end;
         { Copy the GROUP BY index to the ORDER BY index if there is no explicit
           order set, being sure to add the record ID for uniqueness }
         if (not FOrderedResult) then
            begin
            Move(TempIndexDefinitions[TempIndexCount]^,TempIndexDefinitions[TempIndexCount-1]^,
                                      SizeOf(TIndexDefinition));
            with TempIndexDefinitions[TempIndexCount-1]^ do
               begin
               KeyUnique:=True;
               KeyFieldCount:=KeyFieldCount+1;
               KeyFields[KeyFieldCount]:=RECORDID_FIELD_NUM;
               end;
            end;
         end
      else if FDistinctResult then
         begin
         Inc(TempIndexCount);
         TempIndexDefinitions[TempIndexCount]:=AllocMem(SizeOf(TIndexDefinition));
         with TempIndexDefinitions[TempIndexCount]^ do
            begin
            IndexName:=DISTINCT_INDEX_NAME;
            KeyFieldCount:=1;
            KeyFields[1]:=RECORDHASH_FIELD_NUM;
            KeyUnique:=False;
            KeyCompressionType:=DUPBYTE_COMPRESS;
            end;
         end;

      with FResultTable do
         begin
         Exclusive:=True;
         if (FResultTableName='') then
            Temporary:=True
         else
            Temporary:=False;
         ResultSet:=True;
         SuppressTriggers:=True;
         RemovePassword:=False;
         if FEncrypted then
            begin
            if not FResultDataDirectory.DataSession.CheckForPassword(FEncryptionPassword) then
               begin
               FResultDataDirectory.DataSession.AddPassword(FEncryptionPassword);
               RemovePassword:=True;
               end;
            end;
         try
            TempPageSize:=GetMaxPageSize(TempFieldCount,TempFieldDefinitions,
                                         TempIndexCount,TempIndexDefinitions);
            CreateTable(FLocaleID,
                        FUserMajorVersion,FUserMinorVersion,
                        FEncrypted,FEncryptionPassword,
                        FDescription,
                        TempPageSize,FBlobBlockSize,
                        -1,nil,[],[],True,
                        TempFieldCount,TempFieldDefinitions,
                        TempIndexCount,TempIndexDefinitions);
            OpenCursor(False);
         finally
            if FEncrypted and RemovePassword then
               FResultDataDirectory.DataSession.DeletePassword(FEncryptionPassword);
         end;
         end;

   finally
      for I:=1 to TempFieldCount do
         DeAllocMem(TempFieldDefinitions[I]);
      for I:=0 to TempIndexCount do
         DeAllocMem(TempIndexDefinitions[I]);
      DeAllocMem(TempIndexDefinitions[TEXT_INDEX_POS]);
   end;
end;

procedure TDataQuery.InitializeSourceRecordBuffers;
var
   I: Integer;
begin
   for I:=0 to FSourceTables.Count-1 do
      TSourceTable(FSourceTables[I]).InitializeCurRecordBuffer;
end;

function TDataQuery.SameSourceTable(Value: TSourceTable): Boolean;
var
   I: Integer;
begin
   Result:=False;
   for I:=0 to FSourceTables.Count-1 do
      begin
      with TSourceTable(FSourceTables[I]) do
         begin
         if (OSCompareFileNames(Value.DirectoryName,DirectoryName)=0) and
            (OSCompareFileNames(Value.TableName,TableName)=0) then
            begin
            Result:=True;
            Break;
            end;
         end;
      end;
end;

function TDataQuery.CanReturnLiveResult: Boolean;
begin
   Result:=FWantLiveResult and (FResultTableName='') and
           (not (FDistinctResult or FJoinedResult or FGroupedResult or FHavingResult)) and
           ((not FOrderedResult) or
           (FOrderedResult and FOrderByExistingIndex and (not FOrderByContainsExpressions))) and
           (not FHasBlobExpressions) and (FTopRows=-1) and
           (FMergeQueries.Count=0) and (FSubQueries.Count=0) and
           ((FSubSelectType=stNone) or ((FSubSelectType=stSubSelect) and (not FHasExpressions)) or
                                       ((FSubSelectType=stInsertSelect) and (not SameSourceTable(FParentQuery.MasterSourceTable))));
end;

function TDataQuery.CanReturnSingleRowResult: Boolean;
begin
   Result:=(FContainsCalcFields and (not FContainsNonCalcFields));
end;

function TDataQuery.CanReturnSimpleFunctionResult: Boolean;
var
   TempKeyFields: TKeyFields;
begin
   Result:=False; 
   if (FSubQueries.Count=0) and (FSourceTables.Count=1) and (FResultFields.Count=1) then
      begin
      with TResultField(FResultFields[0]) do
         begin
         if (CalculationType=rcCount) and CountAll then
            Result:=True
         else if (not IsExpression) and ((CalculationType=rcMin) or (CalculationType=rcMax)) then
            begin
            FillChar(TempKeyFields,SizeOf(TKeyFields),#0);
            TempKeyFields[1]:=FieldNum;
            with MasterSourceTable.DataCursor do
               begin
               if IndexAvailableForFields(1,TempKeyFields,False,False,FSimpleFunctionIndexPos) then
                  Result:=True;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.CheckForLiveOrderBy;
var
   I: Integer;
   TempIndexDefinition: TIndexDefinition;
   TempResultField: TResultField;
begin
   { Build the ORDER BY index definition }
   { Version 5 }
   FOrderByContainsExpressions:=False;
   FOrderByIndexPos:=0;
   FOrderByExistingIndex:=False;
   if (FOrderByFields.Count > 0) then
      begin
      FillChar(TempIndexDefinition,SizeOf(TIndexDefinition),#0);
      with TempIndexDefinition do
         begin
         KeyUnique:=False;
         KeyDescending:=False;
         FillChar(KeyDescendingFields,SizeOf(TDescendingKeyFields),#0);
         KeyCaseInsensitive:=FOrderByCaseInsensitive;
         KeyFieldCount:=FOrderByFields.Count;
         end;
      for I:=0 to FOrderByFields.Count-1 do
         begin
         with TOrderByField(FOrderByFields[I]) do
            begin
            TempResultField:=FResultFields[FieldNum-1];
            if (not TempResultField.IsExpression) then
               begin
               with TempIndexDefinition do
                  begin
                  KeyFields[I+1]:=TempResultField.FieldNum;
                  KeyDescendingFields[I+1]:=Descending;
                  if Descending then
                     KeyDescending:=True;
                  end;
               end
            else
               begin
               FOrderByContainsExpressions:=True;
               Break;
               end;
            end;
         end;
      { Need to check to see if the ORDER BY is allowable as a live
        result by looking at the available indexes }
      if (FMergeQueries.Count=0) and (not FOrderByContainsExpressions) then
         begin
         with MasterSourceTable.DataCursor do
            begin
            for I:=0 to IndexCount do
               begin
               { Version 5 }
               if CompareIndexDefinitions(@TempIndexDefinition,GetIndexDefinition(I),True,
                                          ((FSubSelectType <> stSubSelect) or
                                           ((FSubSelectType=stSubSelect) and (not FAutoOrderedResult)))) then
               { Version 5 }
                  begin
                  FOrderByExistingIndex:=True;
                  FOrderByIndexPos:=I;
                  Break;
                  end;
               end;
            end;
         end;
      end;
   { Version 5 }         
end;

procedure TDataQuery.CheckForDuplicateSourceTable(const SourceAliasName: string;
                                                  IgnoreTable: TSourceTable);
var
   I: Integer;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      for I:=0 to FSourceTables.Count-1 do
         begin
         if (TSourceTable(FSourceTables[I]) <> IgnoreTable) then
            begin
            with TSourceTable(FSourceTables[I]) do
               begin
               if (OSCompareFileNames(AliasName,SourceAliasName)=0) then
                  GeneralError(Line,Column,'Duplicate table or table '+
                               'correlation name '+SourceAliasName);
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.AddAllResultFields(FromTable: TSourceTable;
                                        var NextResultFieldNum: Word;
                                        OriginalLine: Integer;
                                        OriginalColumn: Integer);
var
   I: Word;
   TempFieldDefinition: pFieldDefinition;
   TempResultField: TResultField;
begin
   { Now begin adding the fields from the top down so that they
     appear in order in the list of result fields }
   for I:=1 to FromTable.DataCursor.PhysicalFieldCount do
      begin
      TempFieldDefinition:=FromTable.DataCursor.GetPhysicalFieldDefinition(I);
      if (not TempFieldDefinition^.Hidden) then
         begin
         Inc(NextResultFieldNum);
         TempResultField:=TResultField.Create(Self);
         FResultFields.Insert((NextResultFieldNum-1),TempResultField);
         with TempResultField do
            begin
            SourceTable:=FromTable;
            AliasName:=FromTable.AliasName;
            FieldName:=TempFieldDefinition^.FieldName;
            FieldNum:=TempFieldDefinition^.FieldNum;
            ResultNum:=NextResultFieldNum;
            ResultName:=GetUniqueResultName(FieldName,FieldName,
                                            rcNone,TempResultField);
            ExpressionLiteral:=TempFieldDefinition^.FieldName;
            DataType:=TempFieldDefinition^.DataType;
            SubType:=TempFieldDefinition^.SubType;
            DataSize:=TempFieldDefinition^.DataSize;
            DataDecimals:=TempFieldDefinition^.DataDecimals;
            ExpressionTokens:=TExpToken.Create;
            with ExpressionTokens do
               begin
               SourceObject:=Self;
               SourceAlias:=FromTable.AliasName;
               TokenLiteral:=TempFieldDefinition^.FieldName;
               TokenType:=etFIELD;
               FieldName:=TempFieldDefinition^.FieldName;
               DataType:=TempFieldDefinition^.DataType;
               SubType:=TempFieldDefinition^.SubType;
               DataSize:=TempFieldDefinition^.DataSize;
               DataDecimals:=TempFieldDefinition^.DataDecimals;
               Line:=OriginalLine;
               Column:=OriginalColumn;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.AddAllUpdateFields(FromTable: TSourceTable;
                                        OriginalLine: Integer;
                                        OriginalColumn: Integer);
var
   I: Word;
   TempFieldDefinition: pFieldDefinition;
   TempUpdateField: TUpdateField;
begin
   { Now begin adding the fields from the top down so that they
     appear in order in the list of result fields }
   for I:=1 to FromTable.DataCursor.PhysicalFieldCount do
      begin
      TempFieldDefinition:=FromTable.DataCursor.GetPhysicalFieldDefinition(I);
      if (not TempFieldDefinition^.Hidden) then
         begin
         TempUpdateField:=TUpdateField.Create(Self);
         FUpdateFields.Add(TempUpdateField);
         with TempUpdateField do
            begin
            SourceTable:=FromTable;
            AliasName:=FromTable.AliasName;
            FieldName:=TempFieldDefinition^.FieldName;
            FieldNum:=TempFieldDefinition^.FieldNum;
            ExpressionLiteral:=TempFieldDefinition^.FieldName;
            DataType:=TempFieldDefinition^.DataType;
            SubType:=TempFieldDefinition^.SubType;
            DataSize:=TempFieldDefinition^.DataSize;
            DataDecimals:=TempFieldDefinition^.DataDecimals;
            ExpressionTokens:=TExpToken.Create;
            with ExpressionTokens do
               begin
               SourceObject:=Self;
               SourceAlias:=FromTable.AliasName;
               TokenLiteral:=TempFieldDefinition^.FieldName;
               TokenType:=etFIELD;
               FieldName:=TempFieldDefinition^.FieldName;
               FieldNumber:=TempFieldDefinition^.FieldNum;
               DataType:=TempFieldDefinition^.DataType;
               SubType:=TempFieldDefinition^.SubType;
               DataSize:=TempFieldDefinition^.DataSize;
               DataDecimals:=TempFieldDefinition^.DataDecimals;
               Line:=OriginalLine;
               Column:=OriginalColumn;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.VerifyUpdateFields(AllowAllFields: Boolean);
var
   I: Integer;
   TempFieldDefinition: pFieldDefinition;
   TempUpdateField: TUpdateField;
   TempFieldNum: Word;
   TempSourceTable: TSourceTable;
   TempTokens: TExpToken;
   TempLine: Integer;
   TempColumn: Integer;
begin
   with FQueryStatement.ExpressionVerifier do
      begin
      I:=0;
      while (I < FUpdateFields.Count) do
         begin
         TempUpdateField:=TUpdateField(FUpdateFields[I]);
         with TempUpdateField do
            begin
            if (FieldName=PARSE_ALLFIELDS) then
               begin
               if AllowAllFields then
                  begin
                  SourceTable:=FindSourceTableForField(AliasName,FieldName,False,TempFieldNum);
                  if (SourceTable <> nil) then
                     begin
                     if (SourceTable <> MasterSourceTable) then
                        GeneralError(ExpressionTokens,'Only columns from the table being updated '+
                                     'can be assigned a value');
                     TempSourceTable:=SourceTable;
                     TempLine:=TempUpdateField.ExpressionTokens.Line;
                     TempColumn:=TempUpdateField.ExpressionTokens.Column;
                     { First delete the current result field that
                       contains the * all fields specification }
                     TempUpdateField.Free;
                     FUpdateFields.Delete(I);
                     AddAllUpdateFields(TempSourceTable,TempLine,TempColumn);
                     I:=TempSourceTable.DataCursor.PhysicalFieldCount;
                     Continue;
                     end
                  else
                     ExpectedTokenTypesError(ExpressionTokens,[etFIELD])
                  end
               else
                  ExpectedTokenTypesError(ExpressionTokens,[etFIELD])
               end
            else
               begin
               SourceTable:=FindSourceTableForField(AliasName,FieldName,False,
                                                    TempFieldNum);
               if (SourceTable <> nil) then
                  begin
                  if (SourceTable <> MasterSourceTable) then
                     GeneralError(ExpressionTokens,'Only columns from the table being updated '+
                                  'can be assigned a value');
                  TempFieldDefinition:=SourceTable.DataCursor.GetPhysicalFieldDefinitionByName(FieldName);
                  AliasName:=SourceTable.AliasName;
                  FieldName:=TempFieldDefinition^.FieldName;
                  FieldNum:=TempFieldDefinition^.FieldNum;
                  ExpressionLiteral:=TempFieldDefinition^.FieldName;
                  DataType:=TempFieldDefinition^.DataType;
                  SubType:=TempFieldDefinition^.SubType;
                  DataSize:=TempFieldDefinition^.DataSize;
                  DataDecimals:=TempFieldDefinition^.DataDecimals;
                  with ExpressionTokens do
                     begin
                     SourceAlias:=SourceTable.AliasName;
                     FieldName:=TempFieldDefinition^.FieldName;
                     FieldNumber:=TempFieldDefinition^.FieldNum;
                     DataType:=TempFieldDefinition^.DataType;
                     SubType:=TempFieldDefinition^.SubType;
                     DataSize:=TempFieldDefinition^.DataSize;
                     DataDecimals:=TempFieldDefinition^.DataDecimals;
                     end;
                  end
               else
                  ExpectedTokenTypesError(ExpressionTokens,[etFIELD])
               end;
            end;
         Inc(I);
         end;
      { We need to make sure that we have the same number of columns
        as values }
      if (FUpdateFields.Count <> FUpdateValues.Count) then
         begin
         TempTokens:=nil;
         if (FUpdateFields.Count < FUpdateValues.Count) then
            TempTokens:=TUpdateField(FUpdateFields[FUpdateFields.Count-1]).ExpressionTokens
         else if (FUpdateFields.Count > FUpdateValues.Count) then
            TempTokens:=TUpdateField(FUpdateFields[FUpdateValues.Count]).ExpressionTokens;
         GeneralError(TempTokens,'The number of columns must match '+
                      'match the number of values');
         end;
      FHasBlobFields:=False;
      for I:=0 to FUpdateFields.Count-1 do
         begin
         with TUpdateField(FUpdateFields[I]) do
            begin
            if (DataType=TYPE_BLOB) then
               FHasBlobFields:=True;
            end;
         end;
      end;
end;

procedure TDataQuery.VerifyUpdateValues(AllowUnknownTypes: Boolean);
var
   I: Integer;
   TempUpdateDataValue: TUpdateValue;
   TempUpdateField: TUpdateField;
begin
   for I:=0 to FUpdateValues.Count-1 do
      begin
      TempUpdateDataValue:=TUpdateValue(FUpdateValues[I]);
      with TempUpdateDataValue do
         begin
         if (FQueryType=INSERT_STATEMENT) then
            begin
            if (FSubQueries.Count=0) and (ExpressionTokens <> nil) then
               begin
               with FQueryStatement.ExpressionVerifier do
                  begin
                  SetFieldCallback(Integer(Self),nil);
                  VerifyExpression(ExpressionTokens,False,AllowUnknownTypes);
                  end;
               end;
            end
         else
            begin
            if (ExpressionTokens <> nil) then
               begin
               with FQueryStatement.ExpressionVerifier do
                  begin
                  SetFieldCallback(Integer(Self),@TDataQuery.VerifyExpressionFieldData);
                  VerifyExpression(ExpressionTokens,False,AllowUnknownTypes);
                  end;
               end;
            end;
         TempUpdateField:=TUpdateField(FUpdateFields[I]);
         with FQueryStatement.ExpressionVerifier do
            begin
            VerifyDateTimeLiteral(TempUpdateField.ExpressionTokens,ExpressionTokens);
            CheckArgumentTypes(TempUpdateField.ExpressionTokens,
                               ExpressionTokens,AllowUnknownTypes);
            end;
         end;
      end;
end;

procedure TDataQuery.ProcessSubSelectUpdateValues;
var
   I: Integer;
   TempResultField: TResultField;
   TempUpdateValue: TUpdateValue;
begin
   with TDataQuery(FSubQueries[0]) do
      begin
      for I:=0 to FResultFields.Count-1 do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         { Version 5 }
         if (not TempResultField.IsHidden) then
         { Version 5 }
            begin
            TempUpdateValue:=TUpdateValue.Create(Self);
            Self.FUpdateValues.Add(TempUpdateValue);
            with TempUpdateValue do
               begin
               ExpressionLiteral:=TempResultField.ExpressionLiteral;
               if IsLiveResult then
                  ExpressionTokens:=CopyExpressionTokens(TempResultField.ExpressionTokens)
               else
                  begin
                  ExpressionTokens:=TExpToken.Create;
                  with ExpressionTokens do
                     begin
                     SourceObject:=TDataQuery(Self.FSubQueries[0]);
                     SourceAlias:=TempResultField.AliasName;
                     TokenType:=etFIELD;
                     TokenLiteral:=TempResultField.ResultName;
                     FieldNumber:=TempResultField.ResultNum;
                     FieldName:=TempResultField.ResultName;
                     DataType:=TempResultField.ResultDataType;
                     SubType:=TempResultField.ResultSubType;
                     DataSize:=TempResultField.ResultDataSize;
                     DataDecimals:=TempResultField.ResultDataDecimals;
                     Line:=TempResultField.ExpressionTokens.Line;
                     Column:=TempResultField.ExpressionTokens.Column;
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

function TDataQuery.IsTargetOfJoin(CurJoin: TJoin;
                                   NewTargetTable: TSourceTable): Boolean;
var
   I: Integer;
   J: Integer;
begin
   Result:=False;
   for I:=0 to FSourceTables.Count-1 do
      begin
      with TSourceTable(FSourceTables[I]) do
         begin
         for J:=0 to Joins.Count-1 do
            begin
            if (CurJoin=nil) or
               (TJoin(Joins[J]) <> CurJoin) then
               begin
               with TJoin(Joins[J]) do
                  begin
                  if (TargetTable=NewTargetTable) and
                     (JoinType <> jtNone) then
                     begin
                     Result:=True;
                     Exit;
                     end;
                  end;
               end;
            end;
         end;
      end;
end;

function TDataQuery.IsTargetOfInnerJoin(NewTargetTable: TSourceTable): Boolean;
begin
   Result:=(GetParentTable(jtInner,NewTargetTable) <> nil);
end;

function TDataQuery.IsTargetOfOuterJoin(CurJoinType: TJoinType;
                                        NewTargetTable: TSourceTable): Boolean;
var
   TempParentTable: TSourceTable;
   TempTargetTable: TSourceTable;
begin
   Result:=False;
   TempTargetTable:=NewTargetTable;
   TempParentTable:=NewTargetTable;
   while (TempParentTable <> nil) do
      begin
      TempParentTable:=GetParentTable(CurJoinType,TempTargetTable);
      if (TempParentTable <> nil) then
         begin
         Result:=True;
         Break;
         end
      else
         TempParentTable:=GetParentTable(jtInner,TempTargetTable);
      TempTargetTable:=TempParentTable;
      end;
end;

function TDataQuery.GetParentTable(CurJoinType: TJoinType;
                                   CurTargetTable: TSourceTable): TSourceTable;
var
   I: Integer;
   J: Integer;
begin
   Result:=nil;
   for I:=0 to FSourceTables.Count-1 do
      begin
      with TSourceTable(FSourceTables[I]) do
         begin
         for J:=0 to Joins.Count-1 do
            begin
            with TJoin(Joins[J]) do
               begin
               if (TargetTable=CurTargetTable) and
                  (JoinType=CurJoinType) then
                  begin
                  Result:=FSourceTables[I];
                  Exit;
                  end;
               end;
            end;
         end;
      end;
end;

function TDataQuery.GetDriverTable(CurTargetTable: TSourceTable): TSourceTable;
var
   ParentTable: TSourceTable;
begin
   ParentTable:=CurTargetTable;
   while (ParentTable <> nil) do
      begin
      CurTargetTable:=ParentTable;
      ParentTable:=GetParentTable(jtInner,CurTargetTable);
      if (ParentTable=nil) then
         begin
         ParentTable:=GetParentTable(jtLeftOuter,CurTargetTable);
         if (ParentTable=nil) then
            ParentTable:=GetParentTable(jtRightOuter,CurTargetTable);
         end;
      end;
   Result:=CurTargetTable;
end;

procedure TDataQuery.SetupLiveMapping;
var
   I: Integer;
   TempDataCursor: TDataCursor;
   TempResultField: TResultField;
   TempFieldDefinitions: array[1..MAX_NUM_FIELDS] of pFieldDefinition;
begin
   FillChar(TempFieldDefinitions,SizeOf(TempFieldDefinitions),#0);
   try
      TempDataCursor:=TSourceTable(FSourceTables[0]).DataCursor;
      for I:=0 to FResultFields.Count-1 do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         TempFieldDefinitions[I+1]:=AllocMem(SizeOf(TFieldDefinition));
         { Check to see if we're dealing with an expression field,
           a regular field, or a regular expression field (already
           defined in the source table }
         with TempFieldDefinitions[I+1]^ do
            begin
            if TempResultField.IsExpression then
               begin
               DataType:=TempResultField.DataType;
               SubType:=TempResultField.SubType;
               case DataType of
                  TYPE_ZSTRING:
                     Length:=(TempResultField.DataSize-1);
                  TYPE_BYTES,TYPE_VARBYTES:
                     Length:=TempResultField.DataSize;
                  TYPE_BCD:
                     Decimals:=TempResultField.DataDecimals;
                  end;
               ExpressionField:=True;
               ExpressionTokens:=TempResultField.ExpressionTokens;
               FieldNum:=TempResultField.ResultNum;
               FieldName:=TempResultField.ResultName;
               FieldOrigin:='';
               OriginFieldNum:=0;
               FieldDatabaseOrigin:='';
               end
            else
               begin
               TempFieldDefinitions[I+1]^:=TempResultField.SourceTable.DataCursor.GetPhysicalFieldDefinition(
                                                      TempResultField.FieldNum)^;
               FieldOrigin:=TempResultField.SourceTable.TableName+
                            PARSE_ALIAS_QUALIFIER+TempResultField.FieldName;
               OriginFieldNum:=TempResultField.FieldNum;
               if DataSession.IsServer then
                  FieldDatabaseOrigin:=TempResultField.SourceTable.DataDirectory.Name
               else
                  FieldDatabaseOrigin:=TempResultField.SourceTable.DataDirectory.Directory;
               FieldName:=TempResultField.ResultName;
               if (TempResultField.FieldNum <> RECORDID_FIELD_NUM) then
                  FieldNum:=TempResultField.ResultNum;
               end;
            end;
         end;
      TempDataCursor.SetFieldMapping(FResultFields.Count,TempFieldDefinitions);
   finally
      for I:=0 to FResultFields.Count-1 do
         DeAllocMem(TempFieldDefinitions[I+1]);
   end;
end;

function TDataQuery.FindResultField(AllowCalculations: Boolean;
                                    const ResultFieldToFind: string;
                                    const SourceAlias: string;
                                    var ResultFieldNum: Word): TResultField;
var
   I: Integer;
   TempResultField: TResultField;
begin
   Result:=nil;
   ResultFieldNum:=0;
   if (SourceAlias <> '') then
      begin
      for I:=0 to FResultFields.Count-1 do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         if (AllowCalculations or
            ((not AllowCalculations) and (TempResultField.CalculationType=rcNone))) and
            (OSCompareFileNames(TempResultField.AliasName,SourceAlias)=0) and
            (AnsiCompareText(TempResultField.FieldName,ResultFieldToFind)=0) then
            begin
            ResultFieldNum:=TempResultField.ResultNum;
            Result:=TempResultField;
            Exit;
            end;
         end;
      end
   else
      begin
      for I:=0 to FResultFields.Count-1 do
         begin
         TempResultField:=TResultField(FResultFields[I]);
         if (AllowCalculations or
            ((not AllowCalculations) and (TempResultField.CalculationType=rcNone))) and
            (AnsiCompareText(TempResultField.FieldName,ResultFieldToFind)=0) or
            (AnsiCompareText(TempResultField.ResultName,ResultFieldToFind)=0) then
            begin
            ResultFieldNum:=TempResultField.ResultNum;
            Result:=TempResultField;
            Exit;
            end;
         end;
      end;
end;

function TDataQuery.FindResultAggregateFieldForExpression(NextToken: TExpToken): TResultField;
var
   I: Integer;
   TempResultField: TResultField;
begin
   Result:=nil;
   for I:=0 to FResultFields.Count-1 do
      begin
      TempResultField:=TResultField(FResultFields[I]);
      if CompareExpressionTokens(NextToken,TempResultField.ExpressionTokens) then
         begin
         Result:=TempResultField;
         Exit;
         end;
      end;
end;

function TDataQuery.FindSourceTableForField(const FieldAlias: string;
                                            const FieldName: string;
                                            AllowBlankFieldName: Boolean;
                                            var FieldNum: Word): TSourceTable;
var
   I: Integer;
   TempFieldNum: Word;
begin
   Result:=nil;
   if (FieldAlias <> '') then
      begin
      for I:=0 to FSourceTables.Count-1 do
         begin
         if (OSCompareFileNames(TSourceTable(FSourceTables[I]).AliasName,FieldAlias)=0) then
            begin
            if (FieldName=PARSE_ALLFIELDS) or
               ((FieldName='')  and AllowBlankFieldName) then
               begin
               Result:=TSourceTable(FSourceTables[I]);
               Exit;
               end
            else
               begin
               TempFieldNum:=TSourceTable(FSourceTables[I]).FindField(FieldName);
               if (TempFieldNum <> 0) then
                  begin
                  Result:=TSourceTable(FSourceTables[I]);
                  FieldNum:=TempFieldNum;
                  Exit;
                  end;
               end;
            end;
         end;
      end
   else
      begin
      if (FieldName=PARSE_ALLFIELDS) or
         ((FieldName='')  and AllowBlankFieldName) then
         Result:=TSourceTable(FSourceTables[0])
      else
         begin
         for I:=0 to FSourceTables.Count-1 do
            begin
            TempFieldNum:=TSourceTable(FSourceTables[I]).FindField(FieldName);
            if (TempFieldNum <> 0) then
               begin
               Result:=TSourceTable(FSourceTables[I]);
               FieldNum:=TempFieldNum;
               Exit;
               end;
            end;
         end;
      end;
end;

function TDataQuery.FindSourceTable(const SourceAlias: string): TSourceTable;
var
   I: Integer;
begin
   Result:=nil;
   if (SourceAlias='') then
      Result:=TSourceTable(FSourceTables[0])
   else
      begin
      for I:=0 to FSourceTables.Count-1 do
         begin
         if (OSCompareFileNames(TSourceTable(FSourceTables[I]).AliasName,SourceAlias)=0) then
            begin
            Result:=TSourceTable(FSourceTables[I]);
            Exit;
            end;
         end;
      end;
end;

procedure TDataQuery.CreateAggregateResultFields(NextToken: TExpToken);
var
   I: Integer;
   TempResultField: TResultField;
begin
   with FQueryStatement.ExpressionVerifier,
        NextToken do
      begin
      case TokenType of
         etUNARY:
            CreateAggregateResultFields(LeftExpToken);
         etBINARY:
            begin
            CreateAggregateResultFields(LeftExpToken);
            CreateAggregateResultFields(RightExpToken);
            end;
         etEXTBINARY:
            begin
            for I:=0 to ArgumentExpTokens.Count-1 do
               CreateAggregateResultFields(ArgumentExpToken[I]);
            end;
         etFUNC:
            begin
            case TokenOperator of
               eoSUM,eoRUNSUM,eoMIN,eoMAX,eoAVG,eoSTDDEV,eoCOUNT:
                  begin
                  TempResultField:=TResultField.Create(Self);
                  { Version 5 }
                  FHiddenResultFields.Add(TempResultField);
                  { Version 5 }
                  TempResultField.ExpressionTokens:=CopyExpressionTokens(NextToken);
                  TempResultField.IsHidden:=True;
                  SetupAggregateResultField(TempResultField,BuildExpressionLiteral(NextToken));
                  { Assign the result field as the data source }
                  DataSource:=TempResultField;
                  end;
               else
                  begin
                  for I:=0 to ArgumentExpTokens.Count-1 do
                     CreateAggregateResultFields(ArgumentExpToken[I]);
                  end;
               end;
            end;
         etFIELD:
            GeneralError(NextToken,'Invalid use of non-aggregated column in expression');
         end;
      end;
end;

procedure TDataQuery.SetupAggregateResultField(ResultField: TResultField;
                                               const ExpressionStr: AnsiString);
begin
   with FQueryStatement.ExpressionVerifier, ResultField do
      begin
      if ContainsAggregates(ExpressionTokens.ArgumentExpToken[0]) then
         GeneralError(ExpressionTokens,
                      'Invalid nesting of aggregate functions');
      case ExpressionTokens.TokenOperator of
         eoSUM: CalculationType:=rcSum;
         eoRUNSUM:
            begin
            FHasRunSums:=True;
            CalculationType:=rcRunSum;
            end;
         eoCOUNT: CalculationType:=rcCount;
         eoMIN: CalculationType:=rcMin;
         eoMAX: CalculationType:=rcMax;
         eoAVG:
            begin
            FHasAvgs:=True;
            CalculationType:=rcAvg;
            end;
         eoSTDDEV:
            begin
            FHasStdDevs:=True;
            CalculationType:=rcStdDev;
            end;
         end;
      if (ExpressionTokens.ArgumentExpTokens.Count > 0) then
         begin
         if (ExpressionTokens.ArgumentExpToken[0].TokenType <> etFIELD) then
            begin
            IsExpression:=True;
            ExpressionLiteral:=ExpressionStr;
            FHasExpressions:=True;
            end
         else
            begin
            IsExpression:=False;
            AliasName:=ExpressionTokens.ArgumentExpToken[0].SourceAlias;
            FieldName:=ExpressionTokens.ArgumentExpToken[0].FieldName;
            ExpressionLiteral:=ExpressionStr;
            ResultName:='';
            end;
         end;
      end;
end;

procedure TDataQuery.ParseSelectColumnExpression(ResultField: TResultField);
begin
   with ResultField,
        FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      ExpressionTokens:=ParseExpression1([pmAllowExtPredicates,
                                          pmAllowAggregates,
                                          pmAllowAllFields,
                                          pmAllowTableQualifier]);
      { Now need to check to see if the next token is an AS clause }
      if CheckTokenSymbol(PARSE_AS) then
         begin
         NextToken;
         ResultExpressionTokens:=ParseExpression8([pmAllowTableQualifier]);
         end
      else if TokenIsSymbol and
              ((not CheckTokenSymbol(PARSE_INTO) and
               (not CheckTokenSymbol(PARSE_FROM)))) then
         ResultExpressionTokens:=ParseExpression8([pmAllowTableQualifier]);
      { Check to see if we're dealing with an expression or not, here
        we also check for aggregate functions }
      if (ExpressionTokens.TokenType=etFIELD) then
         begin
         IsExpression:=False;
         ExpressionLiteral:=ExpressionAsString;
         AliasName:=ExpressionTokens.SourceAlias;
         FieldName:=ExpressionTokens.FieldName;
         end
      else if ContainsAggregates(ExpressionTokens) then
         begin
         if (ExpressionTokens.TokenType=etFUNC) and
            (ExpressionTokens.TokenOperator in [eoSUM,eoRUNSUM,eoMIN,eoMAX,eoAVG,eoSTDDEV,eoCOUNT]) then
            SetupAggregateResultField(ResultField,ExpressionAsString)
         else
            begin
            CreateAggregateResultFields(ExpressionTokens);
            IsExpression:=True;
            IsAggregateExpression:=True;
            ExpressionLiteral:=ExpressionAsString;
            FHasExpressions:=True;
            FHasAggregateCalcs:=True;
            end;
         end
      else
         begin
         IsExpression:=True;
         ExpressionLiteral:=ExpressionAsString;
         FHasExpressions:=True;
         end;
      if (ResultExpressionTokens <> nil) then
         begin
         CheckFieldTokenType(ResultExpressionTokens);
         ResultName:=ResultExpressionTokens.FieldName;
         AutoResultName:=False;
         end;
      end;
end;

procedure TDataQuery.ParseUpdateColumnExpression(UpdateField: TUpdateField);
begin
   with UpdateField,
        FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      ExpressionTokens:=ParseExpression8([pmAllowTableQualifier]);
      CheckFieldTokenType(ExpressionTokens);
      ExpressionLiteral:=ExpressionAsString;
      AliasName:=ExpressionTokens.SourceAlias;
      FieldName:=ExpressionTokens.FieldName;
      end;
end;

procedure TDataQuery.ParseUpdateValueExpression(UpdateValue: TUpdateValue;
                                                ParseOptions: TParseOptions);
begin
   with UpdateValue,FQueryStatement.ExpressionParser do
      begin
      MarkExpression;
      ExpressionTokens:=ParseExpression1(ParseOptions);
      ExpressionLiteral:=ExpressionAsString;
      end;
end;

procedure TDataQuery.ParseCreateColumnExpression(CreateField: TCreateField;
                                                 NeedDataType: Boolean);
begin
   with CreateField,
        FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      if (ExpressionTokens <> nil) then
         NewExpressionTokens:=ParseExpression8([])
      else
         ExpressionTokens:=ParseExpression8([]);
      ExpressionLiteral:=ExpressionAsString;
      CheckFieldTokenType(ExpressionTokens);
      if (NewExpressionTokens <> nil) then
         CheckFieldTokenType(ExpressionTokens);
      FieldName:=ExpressionTokens.FieldName;
      if ParseDataTypeExpression(ExpressionTokens,[],(not NeedDataType)) then
         begin
         VerifyDataTypeToken(ExpressionTokens);
         DataType:=ExpressionTokens.DataType;
         SubType:=ExpressionTokens.SubType;
         case DataType of
            TYPE_ZSTRING:
               Length:=(ExpressionTokens.DataSize-1);
            TYPE_BYTES,TYPE_VARBYTES:
               Length:=ExpressionTokens.DataSize;
            TYPE_BCD:
               Decimals:=ExpressionTokens.DataDecimals;
            end;
         end;
      if RedefineField and (NewExpressionTokens <> nil) then
         NewFieldName:=NewExpressionTokens.FieldName;
      end;
end;

procedure TDataQuery.ParseCreateColumnAttributes(CreateField: TCreateField);
var
   TempCreateIndex: TCreateIndex;
   TempCreateIndexField: TCreateIndexField;
begin
   with CreateField,
        FQueryStatement.ExpressionParser do
      begin
      if CheckTokenSymbol(PARSE_DESCRIPTION) then
         begin
         NextToken;
         CreateField.Description:=TokenAsString;
         CreateField.DescriptionSet:=True;
         NextToken;
         end;
      if CheckTokenSymbol(PARSE_NOT) then
         begin
         NextToken;
         ErrorIfNotSymbol(PARSE_NULL);
         CreateField.Required:=True;
         CreateField.RequiredSet:=True;
         NextToken;
         end
      else if CheckTokenSymbol(PARSE_NULLABLE) then
         begin
         CreateField.Required:=False;
         CreateField.RequiredSet:=True;
         NextToken;
         end;
      { Version 5 }
      if CheckTokenSymbol(PARSE_PRIMARY) then
         begin
         TempCreateIndex:=TCreateIndex.Create(Self);
         FCreateIndexes.Add(TempCreateIndex);
         TempCreateIndex.Line:=CurLine;
         TempCreateIndex.Column:=CurColumn;
         NextToken;
         ErrorIfNotSymbol(PARSE_KEY);
         NextToken;
         TempCreateIndexField:=TCreateIndexField.Create(Self);
         TempCreateIndex.FieldsList.Add(TempCreateIndexField);
         TempCreateIndexField.ExpressionTokens:=TExpToken.Create;
         with TempCreateIndexField.ExpressionTokens do
            begin
            Copy(CreateField.ExpressionTokens);
            ArgumentExpTokens.Clear;
            TempCreateIndexField.FieldName:=FieldName;
            TempCreateIndexField.ExpressionLiteral:=TokenLiteral;
            end;
         end
      else if CheckTokenSymbol(PARSE_UNIQUE) then
         begin
         TempCreateIndex:=TCreateIndex.Create(Self);
         FCreateIndexes.Add(TempCreateIndex);
         TempCreateIndex.Line:=CurLine;
         TempCreateIndex.Column:=CurColumn;
         TempCreateIndex.Unique:=True;
         TempCreateIndex.IndexName:=CreateField.FieldName;
         NextToken;
         TempCreateIndexField:=TCreateIndexField.Create(Self);
         TempCreateIndex.FieldsList.Add(TempCreateIndexField);
         TempCreateIndexField.ExpressionTokens:=TExpToken.Create;
         with TempCreateIndexField.ExpressionTokens do
            begin
            Copy(CreateField.ExpressionTokens);
            ArgumentExpTokens.Clear;
            TempCreateIndexField.FieldName:=FieldName;
            TempCreateIndexField.ExpressionLiteral:=TokenLiteral;
            end;
         end;
      { Version 5 }
      if CheckTokenSymbol(PARSE_DEFAULT) then
         begin
         NextToken;
         CreateField.DefaultValue:=ParseValidityCheck(feDefault);
         CreateField.DefaultValueSet:=True;
         end;
      if (CheckTokenSymbol(PARSE_MIN) or
          CheckTokenSymbol(PARSE_MINIMUM)) then
         begin
         NextToken;
         CreateField.MinimumValue:=ParseValidityCheck(feMinimum);
         CreateField.MinimumValueSet:=True;
         end;
      if (CheckTokenSymbol(PARSE_MAX) or
          CheckTokenSymbol(PARSE_MAXIMUM)) then
         begin
         NextToken;
         CreateField.MaximumValue:=ParseValidityCheck(feMaximum);
         CreateField.MaximumValueSet:=True;
         end;
      if CheckTokenSymbol(PARSE_CHARCASE) then
         begin
         NextToken;
         if CheckTokenSymbol(PARSE_UPPER) then
            CreateField.CharCase:=UPPER_CASE
         else if CheckTokenSymbol(PARSE_LOWER) then
            CreateField.CharCase:=LOWER_CASE
         else if CheckTokenSymbol(PARSE_NOCHANGE) then
            CreateField.CharCase:=NO_CHANGE
         else
            ExpectedExpressionError(PARSE_UPPER+', '+PARSE_LOWER+', or '+
                                    PARSE_NOCHANGE,False);
         CreateField.CharCaseSet:=True;
         NextToken;
         end;
      if CheckTokenSymbol(PARSE_COMPRESS) then
         begin
         NextToken;
         if CheckToken(TOKEN_INTEGER) then
            CreateField.Compression:=StrToInt(TokenAsString)
         else
            ExpectedExpressionError(DBISAM_TYPESTR_INT32,False);
         CreateField.CompressionSet:=True;
         NextToken;
         end;
      end;
end;

procedure TDataQuery.ParseCreateIndexFieldExpression(CreateIndexField: TCreateIndexField;
                                                     ParseSort: Boolean);
begin
   with CreateIndexField,
        FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      ExpressionTokens:=ParseExpression8([]);
      { Check for ASC or ASCENDING keyword }
      if (CheckTokenSymbol(PARSE_ASC) or
          CheckTokenSymbol(PARSE_ASCENDING)) then
         begin
         NextToken;
         CreateIndexField.Descending:=False;
         end
      { Check for DESC or DESCENDING keyword }
      else if (CheckTokenSymbol(PARSE_DESC) or
               CheckTokenSymbol(PARSE_DESCENDING)) then
         begin
         NextToken;
         CreateIndexField.Descending:=True;
         end;
      ExpressionLiteral:=ExpressionAsString;
      CheckFieldTokenType(ExpressionTokens);
      FieldName:=ExpressionTokens.FieldName;
      end;
end;

procedure TDataQuery.ParseGroupByFieldExpression(GroupByField: TGroupByField);
begin
   with GroupByField,
        FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      ExpressionTokens:=ParseExpression8([pmAllowTableQualifier]);
      ExpressionLiteral:=ExpressionAsString;
      CheckFieldConstantTokenType(ExpressionTokens);
      if (ExpressionTokens.TokenType=etFIELD) then
         begin
         AliasName:=ExpressionTokens.SourceAlias;
         FieldName:=ExpressionTokens.FieldName;
         end
      else if (ExpressionTokens.TokenType=etCONST) then
         begin
         CheckIntegerTypes(ExpressionTokens,False);
         FieldNum:=ConvertToInteger(ExpressionTokens.DataType,
                                    ExpressionTokens.Value);
         end;
      end;
end;

procedure TDataQuery.ParseOrderByFieldExpression(OrderByField: TOrderByField);
begin
   with OrderByField,
        FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      ExpressionTokens:=ParseExpression8([pmAllowTableQualifier]);
      { Check for ASC or ASCENDING keyword }
      if (CheckTokenSymbol(PARSE_ASC) or
          CheckTokenSymbol(PARSE_ASCENDING)) then
         begin
         NextToken;
         OrderByField.Descending:=False;
         end
      { Check for DESC or DESCENDING keyword }
      else if (CheckTokenSymbol(PARSE_DESC) or
               CheckTokenSymbol(PARSE_DESCENDING)) then
         begin
         NextToken;
         OrderByField.Descending:=True;
         end;
      ExpressionLiteral:=ExpressionAsString;
      CheckFieldConstantTokenType(ExpressionTokens);
      if (ExpressionTokens.TokenType=etFIELD) then
         begin
         AliasName:=ExpressionTokens.SourceAlias;
         FieldName:=ExpressionTokens.FieldName;
         end
      else if (ExpressionTokens.TokenType=etCONST) then
         begin
         CheckIntegerTypes(ExpressionTokens,False);
         FieldNum:=ConvertToInteger(ExpressionTokens.DataType,
                                    ExpressionTokens.Value);
         end;
      end;
end;

function TDataQuery.ParseCreateStopWordsExpression: string;
var
   TempToken: TExpToken;
begin
   Result:='';
   with FQueryStatement.ExpressionParser do
      begin
      MarkExpression;
      TempToken:=ParseExpression5([]);
      try
         EvaluateExpressionToken(TempToken,nil,0,nil,LOCALE_ANSI_STD);
         Result:=StrPas(TempToken.Value);
      finally
         FreeExpressionTokens(TempToken);
      end;
      end;
end;

function TDataQuery.ParseCreateCharSetExpression: string;
var
   TempToken: TExpToken;
begin
   Result:='';
   with FQueryStatement.ExpressionParser do
      begin
      MarkExpression;
      TempToken:=ParseExpression5([]);
      try
         EvaluateExpressionToken(TempToken,nil,0,nil,LOCALE_ANSI_STD);
         Result:=StrPas(TempToken.Value);
      finally
         FreeExpressionTokens(TempToken);
      end;
      end;
end;

function TDataQuery.ParseDelimiterExpression: Char;
var
   TempToken: TExpToken;
begin
   with FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      TempToken:=ParseExpression8([]);
      try
         CheckTypes(TempToken,[TYPE_ZSTRING],[SUBTYPE_UNKNOWN],False);
         CheckConstantTokenType(TempToken);
         Result:=TempToken.Value^;
      finally
         FreeExpressionTokens(TempToken);
      end;
      end;
end;

function TDataQuery.ParseDecSeparatorExpression: Char;
var
   TempToken: TExpToken;
begin
   with FQueryStatement.ExpressionParser,
        FQueryStatement.ExpressionVerifier do
      begin
      MarkExpression;
      TempToken:=ParseExpression8([]);
      try
         CheckTypes(TempToken,[TYPE_ZSTRING],[SUBTYPE_UNKNOWN],False);
         CheckConstantTokenType(TempToken);
         Result:=TempToken.Value^;
      finally
         FreeExpressionTokens(TempToken);
      end;
      end;
end;

function TDataQuery.ParseJoinExpression: TExpToken;
begin
   with FQueryStatement.ExpressionParser do
      Result:=ParseExpression1([pmAllowExtPredicates,pmAllowParameters,
                                pmAllowTableQualifier]);
end;

function TDataQuery.ParseWhereExpression(AllowSubSelects: Boolean): TExpToken;
begin
   with FQueryStatement.ExpressionParser do
      begin
      if AllowSubSelects then
         Result:=ParseExpression1([pmAllowExtPredicates,
                                   pmAllowParameters,
                                   pmAllowSubSelects,
                                   pmAllowTableQualifier])
      else
         Result:=ParseExpression1([pmAllowExtPredicates,
                                   pmAllowParameters,
                                   pmAllowTableQualifier]);
      end;
end;

procedure TDataQuery.ParseHavingExpression;
begin
   with FQueryStatement.ExpressionParser do
      FHavingExpressionTokens:=ParseExpression1([pmAllowAggregates,
                                                 pmAllowTableQualifier]);
end;

function TDataQuery.ContainsMultipleDataSources(var ResultAlias: string;
                                                NextToken: TExpToken): Boolean;
var
   LeftAlias: string;
   LeftResult: Boolean;
   RightAlias: string;
   RightResult: Boolean;
   TempFieldNum: Word;
   I: Integer;
begin
   Result:=False;
   ResultAlias:='';
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=ContainsMultipleDataSources(ResultAlias,LeftExpToken);
         etBINARY:
            begin
            LeftAlias:='';
            RightAlias:='';
            LeftResult:=ContainsMultipleDataSources(LeftAlias,LeftExpToken);
            RightResult:=ContainsMultipleDataSources(RightAlias,RightExpToken);
            if (LeftResult or RightResult) then
               Result:=True
            else
               begin
               if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) and
                  (ContainsFields(LeftExpToken) and ContainsFields(RightExpToken)) then
                  begin
                  { Handle joins in a special manner - don't return true even if
                    the two aliases are different, but be sure to return the resulting
                    alias as a concatenated string }
                  EvaluateAliases(LeftAlias,RightAlias,ResultAlias);
                  Result:=False;
                  end
               else
                  Result:=EvaluateAliases(LeftAlias,RightAlias,ResultAlias);
               end;
            end;
         etEXTBINARY,etFUNC:
            begin
            if (TokenOperator in [eoSUBIN,eoNOTSUBIN]) then
               Result:=True
            else
               begin
               LeftResult:=False;
               LeftAlias:='';
               for I:=0 to ArgumentExpTokens.Count-1 do
                  begin
                  RightResult:=ContainsMultipleDataSources(RightAlias,ArgumentExpToken[I]);
                  if (LeftResult or RightResult) then
                     Result:=True
                  else
                     Result:=EvaluateAliases(LeftAlias,RightAlias,ResultAlias);
                  if Result then
                     Break;
                  if (LeftAlias='') and (RightAlias <> '') then
                     LeftAlias:=RightAlias;
                  end;
               end;
            end;
         etFIELD:
            begin
            with TDataQuery(SourceObject) do
               begin
               { Handle canned result sub-queries specifically }
               if (TDataQuery(SourceObject) <> Self) and (SubSelectType=stSubSelect) and
                  (not IsLiveResult) then
                  ResultAlias:=''
               else
                  begin
                  DataSource:=FindSourceTableForField(SourceAlias,FieldName,False,
                                                      TempFieldNum);
                  if (DataSource <> nil) then
                     begin
                     SourceAlias:=TSourceTable(DataSource).AliasName;
                     FieldNumber:=TempFieldNum;
                     end;
                  ResultAlias:=SourceAlias;
                  end;
               end;
            end;
         etCONST:
            ResultAlias:=SourceAlias;
         end;
      end;
end;

function TDataQuery.EvaluateAliases(const LeftAlias: string;
                                    const RightAlias: string;
                                    var ResultAlias: string): Boolean;
var
   LeftAliases: TSourceAliasStringList;
   RightAliases: TSourceAliasStringList;
   I: Integer;
   FindPos: Integer;
begin
   Result:=False;
   ResultAlias:='';
   if ((LeftAlias <> '') and (RightAlias <> '')) then
      begin
      if (Pos(PARSE_SEMICOLON,LeftAlias) <> 0) or
         (Pos(PARSE_SEMICOLON,RightAlias) <> 0) then
         begin
         LeftAliases:=TSourceAliasStringList.Create;
         RightAliases:=TSourceAliasStringList.Create;
         try
            StringToList(LeftAlias,PARSE_SEMICOLON,LeftAliases);
            StringToList(RightAlias,PARSE_SEMICOLON,RightAliases);
            LeftAliases.Sort;
            RightAliases.Sort;
            if (LeftAliases.Count=RightAliases.Count) then
               begin
               for I:=0 to LeftAliases.Count-1 do
                  begin
                  if (not RightAliases.Find(LeftAliases[I],FindPos)) then
                     begin
                     Result:=True;
                     Break;
                     end;
                  end;
               if (not Result) then
                  begin
                  for I:=0 to RightAliases.Count-1 do
                     begin
                     if (not LeftAliases.Find(RightAliases[I],FindPos)) then
                        begin
                        Result:=True;
                        Break;
                        end;
                     end;
                  if (not Result) then
                     ResultAlias:=LeftAlias;
                  end;
               end
            else if (LeftAliases.Count > RightAliases.Count) then
               begin
               for I:=0 to RightAliases.Count-1 do
                  begin
                  if (not LeftAliases.Find(RightAliases[I],FindPos)) then
                     begin
                     Result:=True;
                     Break;
                     end;
                  end;
               if (not Result) then
                  ResultAlias:=LeftAlias;
               end
            else if (LeftAliases.Count < RightAliases.Count) then
               begin
               for I:=0 to LeftAliases.Count-1 do
                  begin
                  if (not RightAliases.Find(LeftAliases[I],FindPos)) then
                     begin
                     Result:=True;
                     Break;
                     end;
                  end;
               if (not Result) then
                  ResultAlias:=RightAlias;
               end;
         finally
            RightAliases.Free;
            LeftAliases.Free;
         end;
         end
      else
         begin
         if (OSCompareFileNames(LeftAlias,RightAlias) <> 0) then
            begin
            ResultAlias:=(LeftAlias+PARSE_SEMICOLON+RightAlias);
            Result:=True;
            end
         else
            ResultAlias:=LeftAlias;
         end;
      end
   else if (LeftAlias <> '') and (RightAlias='') then
      ResultAlias:=LeftAlias
   else if (LeftAlias='') and (RightAlias <> '') then
      ResultAlias:=RightAlias;
end;

function TDataQuery.ContainsJoins(NextToken: TExpToken): Boolean;
var
   LeftAlias: string;
   LeftResult: Boolean;
   RightAlias: string;
   RightResult: Boolean;
   TempAlias: string;
begin
   Result:=False;
   with NextToken do
      begin
      case TokenType of
         etUNARY:
            Result:=ContainsJoins(LeftExpToken);
         etBINARY:
            begin
            if (TokenOperator in [eoAND,eoOR]) then
               begin
               LeftResult:=ContainsJoins(LeftExpToken);
               RightResult:=ContainsJoins(RightExpToken);
               Result:=(LeftResult or RightResult);
               end
            else if (TokenOperator in [eoEQ,eoNE,eoGT,eoGE,eoLT,eoLE]) then
               begin
               if (ContainsFields(LeftExpToken) and ContainsFields(RightExpToken)) then
                  begin
                  LeftAlias:='';
                  RightAlias:='';
                  TempAlias:='';
                  ContainsMultipleDataSources(LeftAlias,LeftExpToken);
                  ContainsMultipleDataSources(RightAlias,RightExpToken);
                  Result:=EvaluateAliases(LeftAlias,RightAlias,TempAlias);
                  end;
               end;
            end;
         end;
      end;
end;

procedure TDataQuery.AbortProgress(PercentDone: Word; var Abort: Boolean);
begin
   FQueryStatement.DoAbortProgress(PercentDone,Abort);
end;

procedure TDataQuery.Progress(PercentDone: Word);
begin
   FQueryStatement.DoProgress(PercentDone);
end;

procedure TDataQuery.SteppedProgress(const Step: string; PercentDone: Word);
begin
   FQueryStatement.DoSteppedProgress(Step,PercentDone);
end;

procedure TDataQuery.DataLost(Cause: Byte; const ContextInfo: string;
                              var Continue: Boolean; var StopAsking: Boolean);
begin
   FQueryStatement.DoDataLost(Cause,ContextInfo,Continue,StopAsking);
end;

procedure TDataQuery.Log(const LogMessage: string);
begin
   FQueryStatement.DoLog(LogMessage);
end;

procedure TDataQuery.Plan(const PlanMessage: AnsiString);
begin
   FQueryStatement.Plan.Add(WrapText(PlanMessage,PARSE_CRLF,
                                     [' ',',','-',PARSE_CR,PARSE_LF],
                                     QUERY_PLAN_LENGTH));
end;

procedure TDataQuery.SaveResultToTable(const NewDataDirectoryName: string;
                                       const NewTableName: string;
                                       SendProgress: Boolean);
begin
   if FInplaceResult then
      begin
      with MasterSourceTable.DataCursor do
         begin
         SetProgressCallback(Integer(Self),@TDataQuery.Progress);
         CopyTable(NewDataDirectoryName,NewTableName,True,SendProgress)
         end;
      end
   else
      begin
      with FResultTable do
         begin
         SetProgressCallback(Integer(Self),@TDataQuery.Progress);
         CopyTable(NewDataDirectoryName,NewTableName,True,SendProgress);
         end;
      end;
end;

end.




