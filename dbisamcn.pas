{*************************************************************************
*
*      DBISAM constants and type definitions
*      for Delphi 3.x + and C++Builder 3.x +
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

{$I dbisamcp.inc}

unit dbisamcn;

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

Windows, Messages, FMTBcd,

dbisamcr;

const

   { Engine version information constants and defines }

   ENGINE_VERSION = '4.24';
   ENGINE_VERSION_NUM = 4.24;

   ENGINE_BUILD = '1';
   ENGINE_BUILD_NUM = 1;

   ENGINE_TYPE = 'VCLCSSRC';

   { Memory manager tag bytes }

   MEMORY_TAG_BYTES = (SizeOf(Cardinal)*2);

   { Engine types }

   LOCAL_ENGINE = 0;
   SERVER_ENGINE = 1;

   { File signatures }

   DBISAM_SIGNATURE = 'DBISAM_SIG';
   COMPRESSION_SIGNATURE = 'DBISAM_COMP';

   { Data format version number }

   VERSION_NUMBER = 6;

   { File extensions }

   DATA_FILE_EXT = '.dat';
   INDEX_FILE_EXT = '.idx';
   BLOB_FILE_EXT = '.blb';

   DATA_BACKUP_FILE_EXT = '.dbk';
   INDEX_BACKUP_FILE_EXT = '.ibk';
   BLOB_BACKUP_FILE_EXT = '.bbk';

   DATA_UPGRADE_FILE_EXT = '.dup';
   INDEX_UPGRADE_FILE_EXT = '.iup';
   BLOB_UPGRADE_FILE_EXT = '.bup';

   DATA_TEMP_FILE_EXT = '.dat';
   INDEX_TEMP_FILE_EXT = '.idx';
   BLOB_TEMP_FILE_EXT = '.blb';

   { Maximum limits for error messages }

   MAX_ERRORMSGLEN = 254;

   { Error definitions }

   ERROR_REMOTENAME = 0;
   ERROR_USERNAME = 1;
   ERROR_DATABASENAME = 2;
   ERROR_TABLENAME = 3;
   ERROR_FIELDNAME = 4;
   ERROR_INDEXNAME = 5;
   ERROR_MESSAGE = 6;
   ERROR_OS = 7;
   ERROR_SOCKET = 8;

   { Error constants }

   DBISAM_NONE = 0;
   DBISAM_OSUNKNOWN = 11047;
   DBISAM_OSENOMEM = 11016;
   DBISAM_OSENOENT = 11010;
   DBISAM_OSEACCES = 11013;
   DBISAM_LOCKREADLOCK = 10221;
   DBISAM_LOCKREADUNLOCK = 10222;
   DBISAM_LOCKWRITELOCK = 10223;
   DBISAM_LOCKWRITEUNLOCK = 10224;
   DBISAM_READLOCK = 10225;
   DBISAM_READUNLOCK = 10226;
   DBISAM_WRITELOCK = 10227;
   DBISAM_WRITEUNLOCK = 10228;
   DBISAM_TRANSLOCK = 10229;
   DBISAM_TRANSUNLOCK = 10230;
   DBISAM_LOCKED = 10241;
   DBISAM_UNLOCKFAILED = 10242;
   DBISAM_TABLEOPEN = 10031;
   DBISAM_READERR = 9217;
   DBISAM_WRITEERR = 9218;
   DBISAM_RECLOCKFAILED = 10258;
   DBISAM_OSEMFILE = 11012;
   DBISAM_OSEBADF = 11014;
   DBISAM_OSENOTSAM = 11025;
   DBISAM_OSENODEV = 11023;
   DBISAM_OLDVERSION = 12035;
   DBISAM_BADSIGNATURE = 12036;
   DBISAM_KEYVIOL = 9729;
   DBISAM_KEYORRECDELETED = 8708;
   DBISAM_FLDLIMIT = 9492;
   DBISAM_RECTOOBIG = 9477;
   DBISAM_INDEXLIMIT = 9487;
   DBISAM_NEEDEXCLACCESS = 10253;
   DBISAM_HEADERCORRUPT = 8961;
   DBISAM_INDEXCORRUPT = 8965;
   DBISAM_FILECORRUPT = 8962;
   DBISAM_MEMOCORRUPT = 8963;
   DBISAM_OUTOFRANGE = 9985;
   DBISAM_INVALIDKEY = 10026;
   DBISAM_REQDERR = 9732;
   DBISAM_MINVALERR = 9730;
   DBISAM_MAXVALERR = 9731;
   DBISAM_INVALIDFLDTYPE = 10000;
   DBISAM_SEARCHCOLREQD = 12292;
   DBISAM_INVALIDBLOBLEN = 10029;
   DBISAM_NOTABLOB = 10753;
   DBISAM_ENDOFBLOB = 8711;
   DBISAM_INVALIDBLOBOFFSET = 9998;
   DBISAM_INVALIDBLOBHANDLE = 10030;
   DBISAM_OPENBLOBLIMIT = 9494;
   DBISAM_BLOBLIMIT = 9498;
   DBISAM_PRIMARYKEYREDEFINE = 9993;
   DBISAM_INDEXNAMEREQUIRED = 10010;
   DBISAM_INDEXEXISTS = 10027;
   DBISAM_INVALIDINDEXNAME = 10022;
   DBISAM_INVALIDIDXDESC = 10023;
   DBISAM_BOF = 8705;
   DBISAM_EOF = 8706;
   DBISAM_RECNOTFOUND = 8710;
   DBISAM_NOSUCHFILTER = 10050;
   DBISAM_INVALIDFILTER = 10051;
   DBISAM_INTERNALLIMIT = 9482;
   DBISAM_INVALIDVCHKSTRUCT = 10006;
   DBISAM_INVALIDFIELDNAME = 10038;
   DBISAM_NOTSUFFTABLERIGHTS = 10498;
   DBISAM_INVALIDPASSWORD = 10015;
   DBISAM_CANNOTLOADLDDRV = 15878;
   DBISAM_SQLPARSE = 11949;
   DBISAM_SQLEXEC = 11950;
   DBISAM_TABLEFULL = 9479;
   DBISAM_DATABASEFULL = 9480;
   DBISAM_NOCURRREC = 8709;
   DBISAM_TABLEEXISTS = 13060;
   DBISAM_COMPRESS = 15001;
   DBISAM_UNCOMPRESS = 15002;
   DBISAM_REMOTECOMMLOST = 11276;
   DBISAM_REMOTEENCRYPTREQ = 11277;
   DBISAM_REMOTEUNKNOWN = 11279;
   DBISAM_REMOTECONNECT = 11280;
   DBISAM_REMOTENOLOGIN = 11281;
   DBISAM_REMOTEMAXCONNECT = 11282;
   DBISAM_REMOTEADDRESSBLOCK = 11283;
   DBISAM_REMOTECALLBACK = 11284;
   DBISAM_REMOTECALLBACKERR = 11285;
   DBISAM_REMOTEVERSION = 11286;
   DBISAM_REMOTEINVLOGIN = 11287;
   DBISAM_REMOTENOTAUTH = 11288;
   DBISAM_REMOTENOTADMIN = 11289;
   DBISAM_REMOTEINVUSER = 11290;
   DBISAM_REMOTENOUSER = 11291;
   DBISAM_REMOTEDUPUSER = 11292;
   DBISAM_REMOTEINVDB = 11293;
   DBISAM_REMOTENODB = 11294;
   DBISAM_REMOTEDUPDB = 11295;
   DBISAM_REMOTEINVDBUSER = 11296;
   DBISAM_REMOTENODBUSER = 11297;
   DBISAM_REMOTEDUPDBUSER = 11298;
   DBISAM_REMOTEINVPROC = 11299;
   DBISAM_REMOTENOPROC = 11300;
   DBISAM_REMOTEDUPPROC = 11301;
   DBISAM_REMOTEINVPROCUSER = 11302;
   DBISAM_REMOTENOPROCUSER = 11303;
   DBISAM_REMOTEDUPPROCUSER = 11304;
   DBISAM_REMOTEINVEVENT = 11305;
   DBISAM_REMOTENOEVENT = 11306;
   DBISAM_REMOTEDUPEVENT = 11307;
   DBISAM_REMOTEINVREQUEST = 11308;
   DBISAM_IMPORTERROR = 11309;
   DBISAM_EXPORTERROR = 11310;
   DBISAM_LOADSTREAMERROR = 11312;
   DBISAM_SAVESTREAMERROR = 11313;
   DBISAM_TRIGGERERROR = 11314;

   { In-memory database name }

   INMEMORY_DATABASE_NAME = 'Memory';
   INMEMORY_TEMP_NAME = 'Temp';

   { File locks and handles }

   DEFAULT_LOCK_COUNT = ((High(SmallInt)+1) div 4);
   LOCK_EXPAND = 1024;
   DEFAULT_HANDLE_COUNT = 64;
   HANDLE_EXPAND = 4;

   { Maximum limits for tables, records, and fields }

   MAX_NUM_TABLES = ((High(SmallInt)+1) div 8);

   DEFAULT_RECORD_BUFFER_SIZE = (High(SmallInt)+1);
   MIN_RECORD_BUFFER_SIZE = ((High(SmallInt)+1) div 4);
   MIN_RECORD_BUFFER_COUNT = 16;
   DEFAULT_RECORD_BUFFER_COUNT = ((High(SmallInt)+1) div 4);
   RECORD_BUFFER_EXPAND = 64;
   DEFAULT_MRU_RECORDS = 4;

   MAX_NUM_FIELDS = 1024;

   MAX_FIELD_SIZE = 512;
   MAX_NUM_DECIMALS = 4;
   MAX_USERNAME_SIZE = 30; 
   MAX_DATABASENAME_SIZE = 60;
   MAX_DIRECTORY_SIZE = 255;
   MAX_TABLENAME_SIZE = 60;
   OLD_MAX_TABLENAME_SIZE = 50;
   MAX_FIELDNAME_SIZE = 60;
   OLD_MAX_FIELDNAME_SIZE = 30;
   MAX_FIELDORIGIN_SIZE = 100;
   MAX_FIELD_VALIDITY_SIZE = 100;
   OLD_MAX_FIELD_VALIDITY_SIZE = 50;
   MAX_FIELDDESC_SIZE = 100;
   OLD_MAX_FIELDDESC_SIZE = 50;
   MAX_TABLEDESC_SIZE = 100;
   OLD_MAX_TABLEDESC_SIZE = 50;
   MAX_FIELD_TYPES = 24;
   MAX_RECORD_SIZE = ((High(Word)+1)-(SizeOf(Byte)+1));

   { Filter constants }

   MAX_NUM_FILTERS = 64;

   { Constants for encryption and decryption }

   FIRST_LOCK = 48;
   SECOND_LOCK = 217;
   PASSWORD_LOCK1 = 76;
   PASSWORD_LOCK2 = 105;

   CRYPTO_BLOCK_SIZE = 8;

     { Constants for passwords }

   OLD_MAX_PASSWORD_LENGTH = 15;
   MAX_PASSWORD_LENGTH = 128;

   { Maximum limits for functions }

   MAX_NUM_FUNCS = 1024;
   MAX_FUNCNAME_SIZE = 128;
   MAX_NUM_FUNCPARAMS = 64;

   { Field types }

   TYPE_UNKNOWN = 0;
   TYPE_ZSTRING = 1;
   TYPE_DATE = 2;
   TYPE_BLOB = 3;
   TYPE_BOOL = 4;
   TYPE_INT16 = 5;
   TYPE_INT32 = 6;
   TYPE_FLOAT = 7;
   TYPE_BCD = 8;
   TYPE_BYTES = 9;
   TYPE_TIME = 10;
   TYPE_TIMESTAMP = 11;
   TYPE_UINT16 = 12;
   TYPE_UINT32 = 13;
   TYPE_FLOATIEEE = 14;
   TYPE_VARBYTES = 15;
   TYPE_LOCKINFO = 16;
   TYPE_CURSOR = 17;
   TYPE_INT64 = 18;
   TYPE_UINT64 = 19;
   TYPE_ADT = 20;
   TYPE_ARRAY = 21;
   TYPE_REF = 22;
   TYPE_TABLE = 23;

   { Field sub-types }

   SUBTYPE_UNKNOWN = 0;
   SUBTYPE_PASSWORD = 1;
   SUBTYPE_MONEY = 21;
   SUBTYPE_MEMO = 22;
   SUBTYPE_BINARY = 23;
   SUBTYPE_FMTMEMO = 24;
   SUBTYPE_OLEOBJ = 25;
   SUBTYPE_GRAPHIC = 26;
   SUBTYPE_DBSOLEOBJ = 27;
   SUBTYPE_TYPEDBINARY = 28;
   SUBTYPE_AUTOINC = 29;
   SUBTYPE_ACCOLEOBJ = 30;
   SUBTYPE_FIXED = 31;
   SUBTYPE_UNICODE = 32;
   SUBTYPE_HMEMO = 33;
   SUBTYPE_HBINARY = 34;
   SUBTYPE_ADTNESTEDTABLE = 35;
   SUBTYPE_BFILE = 36;
   SUBTYPE_ADTDATE = 37;
   SUBTYPE_GUID = 50;
   SUBTYPE_MD5 = 100;

   { Field sizes }

   TYPE_BOOL_SIZE = SizeOf(WordBool);
   TYPE_INT16_SIZE = SizeOf(SmallInt);
   TYPE_UINT16_SIZE = SizeOf(Word);
   TYPE_INT32_SIZE = SizeOf(Integer);
   TYPE_INT64_SIZE = SizeOf(Int64);
   TYPE_FLOAT_SIZE = SizeOf(Double);
   TYPE_BCD_SIZE = SizeOf(TBCD);
   TYPE_DATE_SIZE = SizeOf(Integer);
   TYPE_TIME_SIZE = SizeOf(Integer);
   TYPE_TIMESTAMP_SIZE = SizeOf(Double);
   TYPE_BLOB_SIZE = (SizeOf(Integer)*2);
   TYPE_GUID_LENGTH = 38;
   TYPE_GUID_SIZE = (TYPE_GUID_LENGTH+1);

   { International support constants }

   LOCALE_ANSI_STD = 0;
   ANSI_STD_LONG_NAME = 'ANSI Standard';
   ANSI_STD_SHORT_NAME = 'ANSI';

   NON_PRINTABLE_OFFSET = 31;

   { These constants are for convenience only when dealing with record
     data offsets }

   DELETEFLAG_SIZE = SizeOf(Boolean);
   NEXTFREE_SIZE = SizeOf(Integer);
   RECORDID_SIZE = SizeOf(Integer);
   RECORDHASH_SIZE = (SizeOf(Integer)*4);

   BLOBBLOCK_SIZE = SizeOf(Integer);
   SIGNATURE_SIZE = SizeOf(Integer);

   BLOB_DATA = (BLOBBLOCK_SIZE+SIGNATURE_SIZE);

   FLDCHG_DATA = SizeOf(Boolean);

   { Constants for locking }

   DEFAULT_LOCK_FILE_NAME = 'dbisam.lck';

   FILE_OPEN_WAIT = 100; { time in msecs }
   FILE_OPEN_RETRIES = 10;

   FILE_LOCK_WAIT = 3; { time in msecs }
   FILE_LOCK_RETRIES = (High(SmallInt)+1);

   READ_LOCK_WAIT = 3; { time in msecs }
   READ_LOCK_RETRIES = (High(SmallInt)+1);
   { Version 5 }
   MAX_READ_LOCK_COUNT = 100;
   { Version 5 }

   WRITE_LOCK_WAIT = 3; { time in msecs }
   WRITE_LOCK_RETRIES = (High(SmallInt)+1);

   TRANS_LOCK_WAIT = 3; { time in msecs }
   TRANS_LOCK_RETRIES = (High(SmallInt)+1);

   DEFAULT_RECORD_LOCK_WAIT = 100; { time in msecs }
   DEFAULT_RECORD_LOCK_RETRIES = 15;

   DEFAULT_RECORD_LOCK_BUFFER_COUNT = ((High(SmallInt)+1) div 4);
   RECORD_LOCK_BUFFER_EXPAND = ((High(SmallInt)+1) div 8);

   { Locking protocols }

   LOCK_PESSIMISTIC = 0;
   LOCK_OPTIMISTIC = 1;

   { Lock Indicator }

   NOLOCK_RECORD = 0;
   LOCK_RECORD = 1;
   UNLOCK_RECORD = 2;

   { Record status flags }

   RECORD_VALID = 0;
   RECORD_DELETED = 1;
   RECORD_ERROR = 2;
   RECORD_MODIFIED = 3;

   { Read-ahead direction }

   READ_CURRENT = 0;
   READ_FORWARD = 1;
   READ_BACKWARD = 2;

   { Session types }

   SESSION_LOCAL = 0;
   SESSION_REMOTE = 1;

   { Progress steps }

   DEFAULT_PROGRESS_STEPS = 20;
   MAX_PROGRESS_STEPS = 100;

   { Data loss causes }

   DATALOSS_UNKNOWN = 0;
   DATALOSS_KEYVIOLATION = 1;
   DATALOSS_VALCHECKFAIL = 2;
   DATALOSS_FIELDDELETE = 3;
   DATALOSS_FIELDCONVERT = 4;

   { Special index position for raw record access (used with SQL) }

   PHYSICAL_INDEX_POS = High(Byte);
   NULL_INDEX_POS = ((High(Byte)+1) div 2);

   { Special index names for SQL }

   GROUPBY_INDEX_NAME = 'GroupBy';
   DISTINCT_INDEX_NAME = 'Distinct';
   MERGE_INDEX_NAME = 'Merge';

   { Special field names for SQL }

   AVGCOUNT_FIELD_NAME = 'Sys__Avg__Count';
   STDDEVCOUNT_FIELD_NAME = 'Sys__StdDev__Count';
   STDDEVSUM_FIELD_NAME = 'Sys__StdDev__Sum';
   INTERSECT_FIELD_NAME = 'Sys__Intersect__Mark';

   { Special field number and name for record IDs and record stamps }

   RECORDID_FIELD_NUM = High(Word);
   RECORDID_FIELD_NAME = 'RecordID';

   RECORDHASH_FIELD_NUM = High(Word)-1;
   RECORDHASH_FIELD_NAME = 'RecordHash';

   { Size of auto primary index keys }

   AUTO_PRIMARYKEY_SIZE = FLDCHG_DATA+RECORDID_SIZE;

   { Position and size of full text index }

   TEXT_WORD_SIZE = 61;
   TEXT_FLDNUM_SIZE = SizeOf(Word);
   TEXT_INDEX_NAME = 'Sys Text';
   OLD_TEXT_INDEX_POS = 32;
   TEXT_INDEX_POS = 31;
   TEXT_KEY_SIZE = FLDCHG_DATA+TEXT_FLDNUM_SIZE+TEXT_WORD_SIZE+RECORDID_SIZE;

   TOTAL_STOP_WORDS = 22;

   StopWordsArray: array [1..TOTAL_STOP_WORDS] of string = ('A','AN','AND',
      'BE','FOR','HOW','IN','IS','IT','OF','ON','OR','THAT','THE','THIS','TO',
      'WAS','WHAT','WHEN','WHICH','WHY','WILL');

   { Compression constants for BLOBs, TCP/IP, and backup files }

   NO_COMPRESSION = 0;
   BEST_SPEED_COMPRESSION = 1;
   DEFAULT_COMPRESSION = 6;
   BEST_COMPRESSION = 9;
   TEMP_COMPRESSION_OFFSET = 10;

   MIN_COMPRESS_SIZE = 16;
   FAST_COMPRESS_SIZE = 1024;

   { These constants are for convenience only when dealing with key
     data offsets }

   RECORD_SIZE = SizeOf(Integer);
   KEYCOUNT_SIZE = SizeOf(Integer);
   DUPBYTE_SIZE = SizeOf(Byte);
   TRAILBYTE_SIZE = SizeOf(Byte);
   BOTH_SIZE = SizeOf(Word);
   KEY_DATA = (RECORD_SIZE+KEYCOUNT_SIZE+DUPBYTE_SIZE+TRAILBYTE_SIZE);

   { Constants for indexes and keys }

   MAX_NUM_PAGES = 2000000000;
   OLD_MAX_NUM_INDEXES = 32;
   MAX_NUM_INDEXES = 31;
   MAX_USER_INDEXES = 30;
   MAX_NUM_FLDSINKEY = 128;
   OLD_MAX_NUM_FLDSINKEY = 16;
   MAX_KEYLEN = (4096+KEY_DATA);
   MAX_INDEXNAME_SIZE = 60;
   OLD_MAX_INDEXNAME_SIZE = 30;
   MAX_INDEX_LEVELS = 64;
   MIN_PAGE_SIZE = 1024;
   DEFAULT_PAGE_SIZE = 4096;
   MAX_PAGE_SIZE = (DEFAULT_PAGE_SIZE*4);

   { Key size fits for SQL result sets }

   SMALL_KEY_SIZE = 256;
   MED_KEY_SIZE = 512;
   LARGE_KEY_SIZE = 1024;

   SMALL_PAGE_SIZE = DEFAULT_PAGE_SIZE;
   MED_PAGE_SIZE = (SMALL_PAGE_SIZE*2);
   LARGE_PAGE_SIZE = MAX_PAGE_SIZE;

   { Caching constants for pages and keys }

   DEFAULT_PAGE_BUFFER_SIZE = (High(Word)+1);
   MIN_PAGE_BUFFER_SIZE = (High(SmallInt)+1);
   DEFAULT_PAGE_BUFFER_COUNT = ((High(SmallInt)+1) div 4);
   MIN_PAGE_BUFFER_COUNT = 8;
   PAGE_BUFFER_EXPAND = 4;
   DEFAULT_MRU_PAGES = 2;

   { Index node types, do not change these constants !!!! }

   ROOT_NODE = 0;
   INTERNAL_NODE = 1;
   EXTERNAL_NODE = 2;
   BOTH_NODE = 3;
   DATA_NODE = 4;

   { Compression Levels }

   NO_COMPRESS = 0;
   DUPBYTE_COMPRESS = 1;
   TRAILBYTE_COMPRESS = 2;
   BOTH_COMPRESS = 3;

   { Page slack factor for optimizations }

   { Version 5 }
   COMPRESS_PAGE_SLACK_FACTOR = 0.30;
   UNCOMPRESS_PAGE_SLACK_FACTOR = 0.40;
   { Version 5 }

   { Constants for blobs }

   MAX_NUM_BLOCKS = 2000000000;
   MAX_NUM_BLOBS = 128;
   MAX_OPEN_BLOBS = 128;
   MIN_BLOCK_SIZE = 64;
   DEFAULT_BLOCK_SIZE = 512;
   MAX_BLOCK_SIZE = (High(Word)+1);

   { Caching constants for blobs }

   DEFAULT_BLOCK_BUFFER_SIZE = (High(SmallInt)+1);
   MIN_BLOCK_BUFFER_SIZE = ((High(SmallInt)+1) div 4);
   DEFAULT_BLOCK_BUFFER_COUNT = ((High(SmallInt)+1) div 4);
   MIN_BLOCK_BUFFER_COUNT = 32;
   BLOCK_BUFFER_EXPAND = 32;
   DEFAULT_MRU_BLOCKS = 4;

   { Blob open modes }

   BLOB_OPENREADONLY = 1;
   BLOB_OPENREADWRITE = 2;
   BLOB_OPENCOPY = 3;

   { Constants for I/O optimization }

   DEFAULT_FILTER_INDEX_THRESHHOLD = 1;

   { Character case for case-conversions }

   NO_CHANGE = 0;
   LOWER_CASE = 1;
   UPPER_CASE = 2;

   { Constants for SQL statement types }

   NO_STATEMENT = 0;
   SELECT_STATEMENT = 1;
   INSERT_STATEMENT = 2;
   UPDATE_STATEMENT = 3;
   DELETE_STATEMENT = 4;
   CREATE_TABLE_STATEMENT = 5;
   ALTER_TABLE_STATEMENT = 6;
   EMPTY_TABLE_STATEMENT = 7;
   OPTIMIZE_TABLE_STATEMENT = 8;
   EXPORT_TABLE_STATEMENT = 9;
   IMPORT_TABLE_STATEMENT = 10;
   VERIFY_TABLE_STATEMENT = 11;
   REPAIR_TABLE_STATEMENT = 12;
   UPGRADE_TABLE_STATEMENT = 13;
   DROP_TABLE_STATEMENT = 14;
   RENAME_TABLE_STATEMENT = 15;
   CREATE_INDEX_STATEMENT = 16;
   DROP_INDEX_STATEMENT = 17;
   START_TRANSACTION_STATEMENT = 18;
   ROLLBACK_TRANSACTION_STATEMENT = 19;
   COMMIT_TRANSACTION_STATEMENT = 20;
   BACKUP_STATEMENT = 21;
   RESTORE_STATEMENT = 22;

   { Comparison result flags }

   CMP_LESS = -1;
   CMP_EQUAL = 0;
   CMP_GREATER = 1;

   { Copy disk file buffer size }

   COPY_BUFFER_SIZE = ((High(Word)+1)-MEMORY_TAG_BYTES);

   { In-memory file allocation blocks }

   INMEMORY_ALLOCATION_SIZE = ((High(Word)+1)-MEMORY_TAG_BYTES);

   { File seek modes }

   FROM_BOF = 0;
   FROM_CURRENT = 1;
   FROM_EOF = 2;

   { Constants for record bitmaps }

   MAX_NUM_BITS = 1000000000;
   BITS_CHUNK_SIZE = SizeOf(LongWord);
   BITS_PER_WORD = (BITS_CHUNK_SIZE*8);
   BITMAP_ALLOCATION_SIZE = ((High(Byte)+1)*2);

   { Constants used for parsing SQL statements and expressions }

   PARSE_SINGLEQUOTE = #39;
   PARSE_DOUBLEQUOTE = #34;
   PARSE_TERM = #0;
   PARSE_CR = #13;
   PARSE_LF = #10;
   PARSE_CRLF = #13+#10;
   PARSE_PARAMETER = '?';
   PARSE_UNDERLINE = '_';
   PARSE_PERCENT = '%';
   PARSE_POUND = '#';
   PARSE_ALLFIELDS = '*';
   PARSE_SEPARATOR = ',';
   PARSE_AS = 'AS';
   PARSE_ALL = 'ALL';
   { Version 5}
   PARSE_ATSIGN = '@';
   { Version 5}
   PARSE_SELECT = 'SELECT';
   PARSE_INSERT = 'INSERT';
   PARSE_VALUES = 'VALUES';
   PARSE_UPDATE = 'UPDATE';
   PARSE_DELETE = 'DELETE';
   PARSE_CREATE = 'CREATE';
   PARSE_ALTER = 'ALTER';
   PARSE_EMPTY = 'EMPTY';
   PARSE_OPTIMIZE = 'OPTIMIZE';
   PARSE_EXPORT = 'EXPORT';
   PARSE_IMPORT = 'IMPORT';
   PARSE_VERIFY = 'VERIFY';
   PARSE_REPAIR = 'REPAIR';
   PARSE_UPGRADE = 'UPGRADE';
   PARSE_DROP = 'DROP';
   PARSE_RENAME = 'RENAME';
   PARSE_START = 'START';
   PARSE_TRANSACTION = 'TRANSACTION';
   PARSE_ROLLBACK = 'ROLLBACK';
   PARSE_COMMIT = 'COMMIT';
   PARSE_WORK = 'WORK';
   PARSE_ADD = 'ADD';
   PARSE_REDEFINE = 'REDEFINE';
   PARSE_COLUMN = 'COLUMN';
   PARSE_AT = 'AT';
   PARSE_TABLE = 'TABLE';
   PARSE_INDEX = 'INDEX';
   PARSE_PRIMARY = 'PRIMARY';
   PARSE_KEY = 'KEY';
   PARSE_CONSTRAINT = 'CONSTRAINT';
   PARSE_DEFAULT = 'DEFAULT';
   PARSE_MINIMUM = 'MINIMUM';
   PARSE_MAXIMUM = 'MAXIMUM';
   PARSE_CHARCASE = 'CHARCASE';
   PARSE_NOCHANGE = 'NOCHANGE';
   PARSE_TEXT = 'TEXT';
   PARSE_STOP = 'STOP';
   PARSE_WORDS = 'WORDS';
   PARSE_SPACE = 'SPACE';
   PARSE_INCLUDE = 'INCLUDE';
   PARSE_CHARS = 'CHARS';
   PARSE_UNIQUE = 'UNIQUE';
   PARSE_COMPRESS = 'COMPRESS';
   PARSE_DUPBYTE = 'DUPBYTE';
   PARSE_TRAILBYTE = 'TRAILBYTE';
   PARSE_NONE = 'NONE';
   PARSE_PAGE = 'PAGE';
   PARSE_BLOCK = 'BLOCK';
   PARSE_SIZE = 'SIZE';
   PARSE_DESCRIPTION = 'DESCRIPTION';
   PARSE_USER = 'USER';
   PARSE_MAJOR = 'MAJOR';
   PARSE_MINOR = 'MINOR';
   PARSE_VERSION = 'VERSION';
   PARSE_NOBACKUP = 'NOBACKUP';
   PARSE_INTERVAL = 'INTERVAL';
   PARSE_FLUSH = 'FLUSH';
   PARSE_LAST = 'LAST';
   PARSE_RIGHT = 'RIGHT';
   PARSE_LEFT = 'LEFT';
   PARSE_FULL = 'FULL';
   PARSE_JOIN = 'JOIN';
   PARSE_INNER = 'INNER';
   PARSE_OUTER = 'OUTER';
   PARSE_WHERE = 'WHERE';
   PARSE_ORDER = 'ORDER';
   PARSE_GROUP = 'GROUP';
   PARSE_HAVING = 'HAVING';
   PARSE_LOCALE = 'LOCALE';
   PARSE_CODE = 'CODE';
   PARSE_ON = 'ON';
   PARSE_ASC = 'ASC';
   PARSE_ASCENDING = 'ASCENDING';
   PARSE_DESC = 'DESC';
   PARSE_DESCENDING = 'DESCENDING';
   PARSE_NOCASE = 'NOCASE';
   PARSE_NOJOINOPTIMIZE = 'NOJOINOPTIMIZE';
   PARSE_JOINOPTIMIZECOSTS = 'JOINOPTIMIZECOSTS';
   PARSE_ENCRYPTED = 'ENCRYPTED';
   PARSE_WITH = 'WITH';
   PARSE_BY = 'BY';
   PARSE_UNION = 'UNION';
   PARSE_INTERSECT = 'INTERSECT';
   PARSE_EXCEPT = 'EXCEPT';
   PARSE_TOP = 'TOP';
   PARSE_RANGE = 'RANGE';
   PARSE_INTO = 'INTO';
   PARSE_DISTINCT = 'DISTINCT';
   PARSE_SET = 'SET';
   PARSE_DELIMITER = 'DELIMITER';
   PARSE_HEADERS = 'HEADERS';
   PARSE_COLUMNS = 'COLUMNS';
   PARSE_FORCEINDEXREBUILD = 'FORCEINDEXREBUILD';
   PARSE_ALIAS_QUALIFIER = '.';
   PARSE_PERIOD = '.';
   PARSE_COLON = ':';
   PARSE_SEMICOLON = ';';
   PARSE_CONCATENATE = '|';
   PARSE_PLUS = '+';
   PARSE_MINUS = '-';
   PARSE_MULTIPLY = '*';
   PARSE_DIVIDE = '/';
   PARSE_EQUAL = '=';
   PARSE_NOTEQUAL = '<>';
   PARSE_GREATERTHAN = '>';
   PARSE_GREATEREQUAL = '>=';
   PARSE_LESSTHAN = '<';
   PARSE_LESSEQUAL = '<=';
   PARSE_LEFTPAREN = '(';
   PARSE_RIGHTPAREN = ')';
   PARSE_LEFTBRACKET = '[';
   PARSE_RIGHTBRACKET = ']';
   PARSE_LEFTBRACE = '{';
   PARSE_RIGHTBRACE = '}';
   PARSE_ESCAPE_DATE = 'd';
   PARSE_ESCAPE_TIME = 't';
   PARSE_ESCAPE_TIMESTAMP = 'ts';
   PARSE_ESCAPE_JOIN = 'oj';
   PARSE_ESCAPE_FUNCTION = 'fn';
   PARSE_NOT = 'NOT';
   PARSE_AND = 'AND';
   PARSE_OR = 'OR';
   PARSE_TRUE = 'TRUE';
   PARSE_FALSE = 'FALSE';
   PARSE_IS = 'IS';
   PARSE_NULL = 'NULL';
   PARSE_NULLABLE = 'NULLABLE';
   PARSE_CURDATE = 'CURRENT_DATE';
   PARSE_CURTIME = 'CURRENT_TIME';
   PARSE_CURDATETIME = 'CURRENT_TIMESTAMP';
   PARSE_CURGUID = 'CURRENT_GUID';
   PARSE_DATE = 'DATE';
   PARSE_NOW = 'NOW';
   PARSE_LIKE = 'LIKE';
   PARSE_LIKE_ESCAPE = 'ESCAPE';
   PARSE_BETWEEN = 'BETWEEN';
   PARSE_IN = 'IN';
   PARSE_WILD_MULTIPLE = '%';
   PARSE_WILD_SINGLE = '_';
   PARSE_BACKSLASH = '\';
   PARSE_SLASH = '/';
   PARSE_ASTERISK = '*';
   PARSE_AVG = 'AVG';
   PARSE_STDDEV = 'STDDEV';
   PARSE_COUNT = 'COUNT';
   PARSE_MAX = 'MAX';
   PARSE_MIN = 'MIN';
   PARSE_SUM = 'SUM';
   PARSE_RUNSUM = 'RUNSUM';
   PARSE_LOWER = 'LOWER';
   PARSE_LCASE = 'LCASE';
   PARSE_UPPER = 'UPPER';
   PARSE_UCASE = 'UCASE';
   PARSE_SUBSTRING = 'SUBSTRING';
   PARSE_REPLACE = 'REPLACE';
   PARSE_OCCURS = 'OCCURS';
   PARSE_LENGTH = 'LENGTH';
   PARSE_POS = 'POS';
   PARSE_POSITION = 'POSITION';
   PARSE_FROM = 'FROM';
   PARSE_EXCLUSIVE = 'EXCLUSIVE';
   PARSE_FOR = 'FOR';
   PARSE_TRIM = 'TRIM';
   PARSE_ALLTRIM = 'ALLTRIM';
   PARSE_LEADING = 'LEADING';
   PARSE_TRAILING = 'TRAILING';
   PARSE_BOTH = 'BOTH';
   PARSE_LTRIM = 'LTRIM';
   PARSE_RTRIM = 'RTRIM';
   PARSE_REPEAT = 'REPEAT';
   PARSE_CONCAT = 'CONCAT';
   PARSE_CAST = 'CAST';
   PARSE_EXTRACT = 'EXTRACT';
   PARSE_YEARSFROMMSECS = 'YEARSFROMMSECS';
   PARSE_DAYSFROMMSECS = 'DAYSFROMMSECS';
   PARSE_HOURSFROMMSECS = 'HOURSFROMMSECS';
   PARSE_MINSFROMMSECS = 'MINSFROMMSECS';
   PARSE_SECSFROMMSECS = 'SECSFROMMSECS';
   PARSE_MSECSFROMMSECS = 'MSECSFROMMSECS';
   PARSE_YEAR = 'YEAR';
   PARSE_MONTH = 'MONTH';
   PARSE_WEEK = 'WEEK';
   PARSE_DAY = 'DAY';
   PARSE_DAYOFWEEK = 'DAYOFWEEK';
   PARSE_DAYOFYEAR = 'DAYOFYEAR';
   PARSE_HOUR = 'HOUR';
   PARSE_MINUTE = 'MINUTE';
   PARSE_SECOND = 'SECOND';
   PARSE_MSECOND = 'MSECOND';
   PARSE_IF = 'IF';
   PARSE_CASE = 'CASE';
   PARSE_WHEN = 'WHEN';
   PARSE_THEN = 'THEN';
   PARSE_ELSE = 'ELSE';
   PARSE_END = 'END';
   PARSE_NULLIF = 'NULLIF';
   PARSE_COALESCE = 'COALESCE';
   PARSE_IFNULL = 'IFNULL';
   PARSE_EXISTS = 'EXISTS';
   PARSE_ABS = 'ABS';
   PARSE_ROUND = 'ROUND';
   PARSE_TO = 'TO';
   PARSE_MOD = 'MOD';
   PARSE_ACOS = 'ACOS';
   PARSE_ASIN = 'ASIN';
   PARSE_ATAN = 'ATAN';
   PARSE_ATAN2 = 'ATAN2';
   PARSE_CEILING = 'CEILING';
   PARSE_CEIL = 'CEIL';
   PARSE_COS = 'COS';
   PARSE_COT = 'COT';
   PARSE_DEGREES = 'DEGREES';
   PARSE_EXP = 'EXP';
   PARSE_FLOOR = 'FLOOR';
   PARSE_LOG = 'LOG';
   PARSE_LOG10 = 'LOG10';
   PARSE_PI = 'PI';
   PARSE_POWER = 'POWER';
   PARSE_RADIANS = 'RADIANS';
   PARSE_RAND = 'RAND';
   PARSE_SIGN = 'SIGN';
   PARSE_SIN = 'SIN';
   PARSE_SQRT = 'SQRT';
   PARSE_TAN = 'TAN';
   PARSE_TRUNCATE = 'TRUNCATE';
   PARSE_TRUNC = 'TRUNC';
   PARSE_TEXTSEARCH = 'TEXTSEARCH';
   PARSE_TEXTOCCURS = 'TEXTOCCURS';
   PARSE_LASTAUTOINC = 'LASTAUTOINC';
   PARSE_IDENTITY = 'IDENTITY';
   PARSE_IDENTCURRENT = 'IDENT_CURRENT';
   PARSE_SMALLINT = 'SMALLINT';
   PARSE_WORD = 'WORD';
   PARSE_INTEGER = 'INTEGER';
   PARSE_INT = 'INT';
   PARSE_LARGEINT = 'LARGEINT';
   PARSE_DECIMAL = 'DECIMAL';
   PARSE_NUMERIC = 'NUMERIC';
   PARSE_FLOAT = 'FLOAT';
   PARSE_CHARACTER = 'CHARACTER';
   PARSE_CHAR = 'CHAR';
   PARSE_VARCHAR = 'VARCHAR';
   PARSE_WIDECHAR = 'WIDECHAR';
   PARSE_GUID = 'GUID';
   PARSE_LONGVARCHAR = 'LONGVARCHAR';
   PARSE_BOOLEAN = 'BOOLEAN';
   PARSE_BOOL = 'BOOL';
   PARSE_BIT = 'BIT';
   PARSE_BLOB = 'BLOB';
   PARSE_MEMO = 'MEMO';
   PARSE_GRAPHIC = 'GRAPHIC';
   PARSE_TIME = 'TIME';
   PARSE_TIMESTAMP = 'TIMESTAMP';
   PARSE_MONEY = 'MONEY';
   PARSE_AUTOINC = 'AUTOINC';
   PARSE_BYTES = 'BYTES';
   PARSE_VARBYTES = 'VARBYTES';
   PARSE_BINARY = 'BINARY';
   PARSE_VARBINARY = 'VARBINARY';
   PARSE_LONGVARBINARY = 'LONGVARBINARY';

   TOKEN_SYMBOL = #1;
   TOKEN_BRACKETSYMBOL = #2;
   TOKEN_SINGLESTRING = #3;
   TOKEN_DOUBLESTRING = #4;
   TOKEN_CHAR = #5;
   TOKEN_INTEGER = #6;
   TOKEN_FLOAT = #7;

   ANSI_DATE_SEPARATOR = '-';
   ANSI_TIME_SEPARATOR = ':';
   ANSI_12HOUR_AM = 'AM';
   ANSI_12HOUR_PM = 'PM';
   ANSI_DATE_FORMAT = 'yyyy-mm-dd';
   ANSI_TIME_FORMAT = 'hh:mm:ss.zzz ampm';

   ANSI_DECIMAL_SEPARATOR = '.';
   ANSI_POSITIVE_SIGN = '+';
   ANSI_NEGATIVE_SIGN = '-';

   { Allocation size for value buffers in expression tokens }

   MIN_VALUE_BUFFER_ALLOCATION_SIZE = (((High(SmallInt)+1) div 32)-MEMORY_TAG_BYTES);

   { Server defaults and constants }

   RECEIVE_NONE = 0;
   RECEIVE_PRESENT = 1;
   RECEIVE_ERROR = 2;

   { Server request codes }

   REQUEST_CONNECTPARAMS = 0;
   REQUEST_PING = 1;
   REQUEST_RECONNECT = 10;
   REQUEST_LOGIN = 20;
   REQUEST_LOGOUT = 30;
   REQUEST_SESSIONPARAMS = 40;
   REQUEST_DELALLMEMTABLES = 41;
   REQUEST_GETTABLENAMES = 50;
   REQUEST_OPENDATADIR = 60;
   REQUEST_CLOSEDATADIR = 70;
   REQUEST_ADDPASSWORD = 80;
   REQUEST_DELPASSWORD = 90;
   REQUEST_DELALLPASSWORDS = 100;
   REQUEST_STARTTRANS = 110;
   REQUEST_COMMITTRANS = 120;
   REQUEST_ROLLBACKTRANS = 130;
   REQUEST_BACKUP = 131;
   REQUEST_BACKUPINFO = 132;
   REQUEST_RESTORE = 133;
   REQUEST_CREATECURSOR = 140;
   REQUEST_OPENCURSOR = 150;
   REQUEST_CLOSECURSOR = 160;
   REQUEST_FREECURSOR = 170;
   REQUEST_SETINDEXNAME = 180;
   REQUEST_SETTOBEGIN = 190;
   REQUEST_SETTOEND = 200;
   REQUEST_SETTORECNO = 210;
   REQUEST_SETTOCURSOR = 220;
   REQUEST_GETCURRECORD = 230;
   REQUEST_CLONECURRECORD = 240;
   REQUEST_GETNEXTRECORD = 250;
   REQUEST_GETPRIORRECORD = 260;
   REQUEST_APPENDRECORD = 270;
   REQUEST_MODIFYRECORD = 280;
   REQUEST_DELETERECORD = 290;
   REQUEST_CANCELRECORD = 300;
   REQUEST_FLUSHBUFFERS = 310;
   REQUEST_FLUSHOSBUFFERS = 320;
   REQUEST_REFRESH = 330;
   REQUEST_SETTOBOOKMARK = 340;
   REQUEST_FIND = 350;
   REQUEST_LOCATE = 360;
   REQUEST_SETRANGE = 370;
   REQUEST_RESETRANGE = 380;
   REQUEST_LOCKTABLE = 390;
   REQUEST_UNLOCKTABLE = 400;
   REQUEST_UNLOCKRECORD = 410;
   REQUEST_LOCKSEMAPHORE = 420;
   REQUEST_UNLOCKSEMAPHORE = 430;
   REQUEST_GETDATAHEADER = 440;
   REQUEST_TABLEEXISTS = 450;
   REQUEST_TABLESIZE= 451;
   REQUEST_CREATETABLE = 470;
   REQUEST_ALTERTABLE = 480;
   REQUEST_REPAIRTABLE = 490;
   REQUEST_UPGRADETABLE = 500;
   REQUEST_EMPTYTABLE = 510;
   REQUEST_DELETETABLE = 520;
   REQUEST_RENAMETABLE = 530;
   REQUEST_OPTIMIZETABLE = 540;
   REQUEST_COPYTABLE = 550;
   REQUEST_IMPORTTABLE = 560;
   REQUEST_EXPORTTABLE = 570;
   REQUEST_LOADFROMSTREAM = 580;
   REQUEST_SAVETOSTREAM = 590;
   REQUEST_ADDPRIMARYINDEX = 600;
   REQUEST_ADDSECONDARYINDEX = 610;
   REQUEST_DELETEINDEX = 620;
   REQUEST_DELETEALLINDEXES = 630;
   REQUEST_OPENBLOB = 640;
   REQUEST_FREEBLOB = 650;
   REQUEST_FREEALLBLOBS = 660;
   REQUEST_GETBLOB = 670;
   REQUEST_PUTBLOB = 680;
   REQUEST_TRUNCATEBLOB = 690;
   REQUEST_GETBLOBSIZE = 700;
   REQUEST_TEXTINDEXPARAMS = 710;
   REQUEST_ADDEXPRFILTER = 720;
   REQUEST_ADDCALLBACKFILTER = 730;
   REQUEST_DROPFILTER = 740;
   REQUEST_ACTIVATEFILTER = 750;
   REQUEST_DEACTIVATEFILTER = 760;
   REQUEST_GETFILTEROPTIMIZELEVEL = 770;
   REQUEST_CALLBACKRESPONSE = 780;
   REQUEST_CREATESTMT = 790;
   REQUEST_PREPARESTMT = 800;
   REQUEST_EXECUTESTMT = 810;
   REQUEST_FREESTMT = 820;
   REQUEST_SAVERESULT = 830;
   REQUEST_MODIFYUSERPASSWORD = 840;
   REQUEST_GETUSERNAMES = 850;
   REQUEST_ADDUSER = 860;
   REQUEST_MODIFYUSER = 870;
   REQUEST_DELETEUSER = 880;
   REQUEST_GETUSER = 890;
   REQUEST_GETDBNAMES = 900;
   REQUEST_GETPROCNAMES = 901;
   REQUEST_ADDDB = 910;
   REQUEST_ADDPROC = 911;
   REQUEST_MODIFYDB = 920;
   REQUEST_MODIFYPROC = 921;
   REQUEST_DELETEDB = 930;
   REQUEST_DELETEPROC = 931;
   REQUEST_GETDB = 940;
   REQUEST_GETPROC = 941;
   REQUEST_GETDBUSERNAMES = 950;
   REQUEST_GETPROCUSERNAMES = 951;
   REQUEST_ADDDBUSER = 960;
   REQUEST_ADDPROCUSER = 961;
   REQUEST_MODIFYDBUSER = 970;
   REQUEST_MODIFYPROCUSER = 971;
   REQUEST_DELETEDBUSER = 980;
   REQUEST_DELETEPROCUSER = 981;
   REQUEST_GETDBUSER = 990;
   REQUEST_GETPROCUSER = 991;
   REQUEST_GETEVENTNAMES = 1000;
   REQUEST_ADDEVENT = 1010;
   REQUEST_MODIFYEVENT = 1020;
   REQUEST_DELETEEVENT = 1030;
   REQUEST_GETEVENT = 1040;
   REQUEST_MODIFYCONFIG = 1050;
   REQUEST_GETCONFIG = 1060;
   REQUEST_GETLOGCOUNT = 1070;
   REQUEST_GETLOGRECORD = 1080;
   REQUEST_GETSERVERNAME = 1090;
   REQUEST_GETSERVERDESC = 1100;
   REQUEST_STARTSERVER = 1110;
   REQUEST_STOPSERVER = 1120;
   REQUEST_GETUPTIME = 1130;
   REQUEST_GETMEMORYUSAGE = 1140;
   REQUEST_GETMAINPORT = 1150;
   REQUEST_GETADMINPORT = 1160;
   REQUEST_GETMAINADDRESS = 1170;
   REQUEST_GETMAINTHREADCACHESIZE = 1171;
   REQUEST_GETADMINADDRESS = 1180;
   REQUEST_GETADMINTHREADCACHESIZE = 1181;
   REQUEST_GETSESSIONS = 1190;
   REQUEST_GETCONNECTEDSESSIONS = 1200;
   REQUEST_GETSESSIONINFO = 1210;
   REQUEST_DISCONNECTSESSION = 1220;
   REQUEST_REMOVESESSION = 1230;
   REQUEST_GETDATETIME = 1240;
   REQUEST_GETUTCDATETIME = 1250;
   REQUEST_PROCEDURE = 1251;
   REQUEST_READNEXTRECORDBLOCK = 1270;
   REQUEST_READPRIORRECORDBLOCK = 1280;
   REQUEST_READFIRSTRECORDBLOCK = 1290;
   REQUEST_READLASTRECORDBLOCK = 1300;
   REQUEST_READABSOLUTERECORDBLOCK = 1310;
   REQUEST_READBOOKMARKRECORDBLOCK = 1320;
   REQUEST_REFRESHRECORDBLOCK = 1330;
   REQUEST_ADDRECORDBLOCK = 1340;
   REQUEST_UPDATERECORDBLOCK = 1350;
   REQUEST_DELETERECORDBLOCK = 1360;

   { Server callback codes }

   CALLBACK_PASSWORD = 0;
   CALLBACK_FILTER = 1;
   CALLBACK_PROGRESS = 2;
   CALLBACK_ABORTPROGRESS = 3;
   CALLBACK_STEPPEDPROGRESS = 4;
   CALLBACK_LOG = 5;
   CALLBACK_DATALOST = 6;
   CALLBACK_PROCEDUREPROGRESS = 7;
   CALLBACK_CACHEERROR = 8;

   { Database right constants }

   READ_RIGHT = 0;
   INSERT_RIGHT = 1;
   UPDATE_RIGHT = 2;
   DELETE_RIGHT = 3;
   CREATE_RIGHT = 4;
   ALTER_RIGHT = 5;
   DROP_RIGHT = 6;
   RENAME_RIGHT = 7;
   MAINTAIN_RIGHT = 8;
   BACKUP_RIGHT = 9;
   RESTORE_RIGHT = 10;

   { Procedure right constants }

   EXECUTE_RIGHT = 0;

   { Local database name for query result sets }

   REMOTE_RESULTSET_NAME = 'Remote_Query';

   { Server communication constants }

   MAX_SEND_SIZE = (High(Word)+1);
   DEFAULT_SEND_BUFFER_SIZE = (MAX_SEND_SIZE-MEMORY_TAG_BYTES);
   MAX_RECV_SIZE = (High(Word)+1);
   DEFAULT_RECV_BUFFER_SIZE = (MAX_RECV_SIZE-MEMORY_TAG_BYTES);

   MAX_LOGIN_ATTEMPTS = 3;

   DEFAULT_SERVER_NAME = 'DBSRVR';
   DEFAULT_SERVER_DESC = 'DBISAM Database Server';
   DEFAULT_ENCRYPT_PASSWORD = 'elevatesoft';
   DEFAULT_CONFIG_NAME = 'dbsrvr';
   DEFAULT_CONFIG_PASSWORD = 'elevatesoft';
   DEFAULT_THREAD_CACHE_SIZE = 10;
   DEFAULT_ADMIN_THREAD_CACHE_SIZE = 1;
   DEFAULT_PORT = 12005;
   DEFAULT_ADMIN_PORT = 12006;
   DEFAULT_ADDRESS = '127.0.0.1';
   DEFAULT_TIMEOUT = 300;
   MIN_TIMEOUT = 60;
   DEFAULT_PING = 60;
   MIN_PING = 30;
   PING_WAIT = 100;
   DEFAULT_MAX_CONNECTIONS = 100;
   DEFAULT_MAX_LIMITED_CONNECTIONS = 5;
   DEFAULT_MAX_LICENSED_CONNECTIONS = High(Word);
   DEFAULT_DEADSESSION_INTERVAL = 30;
   DEFAULT_DEADSESSION_EXPIRES = 43200;
   DEFAULT_MAX_DEADSESSIONS = 64;
   DEFAULT_REMOTE_READAHEAD = 50;
   DEFAULT_RECONNECT_SLEEP = 200;
   DEFAULT_MAX_USER_CONNECTIONS = 100;

   { Server configuration constants }

   CONFIG_EXT = '.scf';
   CONFIG_BACKUP_EXT = '.scb';
   CONFIG_LOCK1 = 21;
   CONFIG_LOCK2 = 98;

   { File import/export constants }

   IMPORT_READ_SIZE = ((High(Word)+1)-MEMORY_TAG_BYTES);
   EXPORT_WRITE_SIZE = ((High(Word)+1)-MEMORY_TAG_BYTES);

   MAX_EXPORT_SIZE = ((High(SmallInt)+1) div 8);

   { Stream load/save constants }

   SAVE_WRITE_SIZE = ((High(Word)+1)-MEMORY_TAG_BYTES);

   { Generic file attributes (for Kylix) }

   ATTR_ERROR = -1;
   ATTR_NORMAL = 0;
   ATTR_READONLY = 1;

   { Descending index constant }

   INDEX_ASC = 0;
   INDEX_DESC = 1;

   { Remote trace types }

   TRACE_TYPE_CONNECT = 0;
   TRACE_TYPE_RECONNECT = 1;
   TRACE_TYPE_DISCONNECT = 2;
   TRACE_TYPE_REQUEST = 3;
   TRACE_TYPE_REPLY = 4;

   { Server log categories and types }

   LOG_CATEGORY_INFO = 0;
   LOG_CATEGORY_WARNING = 1;
   LOG_CATEGORY_ERROR = 2;

   LOG_TYPE_NONE = 0;
   LOG_TYPE_SERVERSTART = 1;
   LOG_TYPE_SERVERSTOP = 2;
   LOG_TYPE_CONNECT = 3;
   LOG_TYPE_RECONNECT = 4;
   LOG_TYPE_DISCONNECT = 5;
   LOG_TYPE_LOGIN = 6;
   LOG_TYPE_LOGOUT = 7;
   LOG_TYPE_DEADSESSION = 8;
   LOG_TYPE_NOSESSION = 9;
   LOG_TYPE_ADDRESSBLOCK = 10;
   LOG_TYPE_MAXCONNECT = 11;
   LOG_TYPE_INVLOGIN = 12;
   LOG_TYPE_LOGINDENIED = 13;
   LOG_TYPE_CONFIG = 14;
   LOG_TYPE_SCHEDULEDEVENT = 15;

   { Server event constants }

   RUN_ONCE = 0;
   RUN_HOURLY = 1;
   RUN_DAILY = 2;
   RUN_WEEKLY = 3;
   RUN_MONTHLY = 4;

   MONTHLY_FIRST_DOW = 32;
   MONTHLY_SECOND_DOW = 33;
   MONTHLY_THIRD_DOW = 34;
   MONTHLY_FOURTH_DOW = 35;
   MONTHLY_LAST_DOW = 36;

   { Date and time conversion constants }

   MSECS_PER_YEAR = 31536000000;
   MSECS_PER_DAY = MSECS_PER_YEAR div 365;
   MSECS_PER_HOUR = MSECS_PER_DAY div 24;
   MSECS_PER_MIN = MSECS_PER_HOUR div 60;
   MSECS_PER_SEC = MSECS_PER_MIN div 60;

   { Threaded timer wait constants }

   ABANDONED = 0;
   SIGNALLED = 1;
   TIMEDOUT = 2;
   FAILED = 3;

   { Trigger types }

   TRIGGER_BEFOREINSERT = 0;
   TRIGGER_AFTERINSERT = 1;
   TRIGGER_BEFOREUPDATE = 2;
   TRIGGER_AFTERUPDATE = 3;
   TRIGGER_BEFOREDELETE = 4;
   TRIGGER_AFTERDELETE = 5;

   { Error event types }

   ERROR_EVENT_INSERT = 0;
   ERROR_EVENT_UPDATE = 1;
   ERROR_EVENT_DELETE = 3;

   { Error response types }

   ERROR_RESPONSE_FAIL = 0;
   ERROR_RESPONSE_ABORT = 1;
   ERROR_RESPONSE_RETRY = 2;
   ERROR_RESPONSE_SKIP = 3;

   { Query plans }

   QUERY_PLAN_LENGTH = 80;

   { Stream modes }

   STREAM_NORMAL = 0;
   STREAM_TO_CACHE = 1;
   STREAM_FROM_CACHE = 2;

   { Cached update kinds }

   CACHE_INSERT = 0;
   CACHE_UPDATE = 1;
   CACHE_DELETE = 2;

type

   { Text index types }

   TCharSet = set of Char;

   { Data type sets }

   TDataTypeSet = set of Byte;
   TSubTypeSet = set of Byte;

   { Translation pointer types }

   pComp = ^Comp;
   pWordBool = ^WordBool;

   TFieldExpressionType = (feDefault,feMinimum,feMaximum);

   TFieldDefinition = packed record
      FieldNum: Word;
      FieldName: string[MAX_FIELDNAME_SIZE];
      Description: string[MAX_FIELDDESC_SIZE];
      DataType: Byte;
      SubType: Byte;
      Length: Word;
      Decimals: Byte;
      DataSize: Word;
      DataDecimals: Byte;
      Offset: Word;
      Required: Boolean;
      CharCase: Byte;
      Minimum: string[MAX_FIELD_VALIDITY_SIZE];
      Maximum: string[MAX_FIELD_VALIDITY_SIZE];
      Default: string[MAX_FIELD_VALIDITY_SIZE];
      Compression: Byte;
      ExpressionField: Boolean;  { internal use only }
      ExpressionTokens: TObject; { internal use only }
      Hidden: Boolean; { internal use only }
      FieldOrigin: string[MAX_FIELDORIGIN_SIZE]; { internal use only }
      OriginFieldNum: Word; { internal use only }
      FieldPos: Word; { internal use only }
      FieldDatabaseOrigin: string[MAX_FIELDORIGIN_SIZE]; { internal use only }
      EmptySpace: array [1..76] of Byte;
      end;

   pFieldDefinition = ^TFieldDefinition;

   TV1FieldDefinition = packed record
      FieldNum: Word;
      FieldName: string[OLD_MAX_FIELDNAME_SIZE];
      Description: string[OLD_MAX_FIELDDESC_SIZE];
      DataType: Byte;
      SubType: Byte;
      Length: Byte;
      Decimals: Byte;
      Offset: Word;
      Required: Boolean;
      Encrypted: Boolean;
      Minimum: string[OLD_MAX_FIELD_VALIDITY_SIZE];
      Maximum: string[OLD_MAX_FIELD_VALIDITY_SIZE];
      Default: string[OLD_MAX_FIELD_VALIDITY_SIZE];
      EmptySpace: array [1..20] of Byte;
      end;

   pV1FieldDefinition = ^TV1FieldDefinition;

   TV123FieldDefinition = packed record
      FieldNum: Word;
      FieldName: string[OLD_MAX_FIELDNAME_SIZE];
      Description: string[OLD_MAX_FIELDDESC_SIZE];
      DataType: Byte;
      SubType: Byte;
      Length: Byte;
      Decimals: Byte;
      DataSize: Byte;
      DataDecimals: Byte;
      Offset: Word;
      Required: Boolean;
      CharCase: Byte;
      Minimum: string[OLD_MAX_FIELD_VALIDITY_SIZE];
      Maximum: string[OLD_MAX_FIELD_VALIDITY_SIZE];
      Default: string[OLD_MAX_FIELD_VALIDITY_SIZE];
      ExpressionField: Boolean;  { internal use only }
      ExpressionTokens: TObject; { internal use only }
      Hidden: Boolean; { internal use only }
      SortDescending: Boolean; { internal use only }
      FieldOrigin: string[MAX_FIELDORIGIN_SIZE];
      OriginFieldNum: Word; { internal use only }
      FieldPos: Word; { internal use only }
      FieldDatabaseOrigin: string[MAX_FIELDORIGIN_SIZE];
      EmptySpace: array [1..308] of Byte;
      end;

   pV123FieldDefinition = ^TV123FieldDefinition;

   TV123DataHeader = packed record
      UpdateStamp: Integer;
      BlobBlockSize: Integer;
      VersionNum: Byte;
      NextFreeRecord: Integer;
      NextEndingRecord: Integer;
      LastRecordID: Integer;
      RecordLength: Word;
      FieldCount: Word;
      BlobFieldCount: Word;
      LastUpdated: TDateTime;
      Description: string[OLD_MAX_TABLEDESC_SIZE];
      Encrypted: Boolean;
      Password: string[OLD_MAX_PASSWORD_LENGTH];
      LanguageID: Word;
      SortID: Word;
      UserMajorVersion: Word;
      UserMinorVersion: Word;
      IsDirty: Boolean;
      LastBlobSignature: Integer;
      LastEngineVersion: Currency;
      EmptySpace: array [1..3] of Byte;
   end;

   TDataHeader = packed record
      UpdateStamp: Integer;
      EmptySpace1: array [1..4] of Byte;
      VersionNum: Byte;
      FileSignature: TMD5Digest;
      NextFreeRecord: Integer;
      NextEndingRecord: Integer;
      LastRecordID: Integer;
      LastAutoIncID: Integer;
      RecordCount: Integer;
      RecordLength: Word;
      FieldCount: Word;
      BlobFieldCount: Word;
      BlobBlockSize: Integer;
      LastBlobSignature: Integer;
      IndexPageSize: Integer;
      LastUpdated: TDateTime;
      Description: string[MAX_TABLEDESC_SIZE];
      Encrypted: Boolean;
      Digest: TMD5Digest;
      LocaleID: Integer;
      UserMajorVersion: Word;
      UserMinorVersion: Word;
      IsDirty: Boolean;
      EmptySpace2: array [1..314] of Byte;
   end;

   TV123RecordHeader = packed record
      DeleteFlag: Boolean;
      NextFreeNumber: Integer;
      ID: Integer;
      end;

   pV123RecordHeader = ^TV123RecordHeader;

   TRecordHeader = packed record
      StatusFlag: Byte;
      NextFreeNumber: Integer;
      ID: Integer;
      Hash: TMD5Digest;
      end; 

   pRecordHeader = ^TRecordHeader;

   TDescendingKeyFields = array [1..MAX_NUM_FLDSINKEY] of Boolean;
   TOldDescendingKeyFields = array [1..OLD_MAX_NUM_FLDSINKEY] of Boolean;
   TKeyFields = array [1..MAX_NUM_FLDSINKEY] of Word;
   TOldKeyFields = array [1..OLD_MAX_NUM_FLDSINKEY] of Word;

   TIndexDefinition = packed record
      IndexName: string[MAX_INDEXNAME_SIZE];
      KeySize: Word;
      KeyForeign: Boolean;
      KeyForeignRule: Byte;
      KeyForeignTable: string[MAX_TABLENAME_SIZE];
      KeyDescending: Boolean;
      KeyCaseInsensitive: Boolean;
      KeyUnique: Boolean;
      KeyCompressionType: Byte;
      KeyFieldCount: Byte;
      KeyDescendingFields: TDescendingKeyFields;
      KeyFields: TKeyFields;
      NoKeyStatistics: Boolean;
      IndexChanged: Boolean; { internal use only }
      RemoveIndex: Boolean; { internal use only }
      EmptySpace: array [1..250] of Byte;
   end;

   pIndexDefinition = ^TIndexDefinition;

   TIndexHeader = packed record
      UpdateStamp: Integer;
      EmptySpace1: array [1..4] of Byte;
      VersionNum: Byte;
      FileSignature: TMD5Digest;
      NextFreePage: Integer;
      NextEndingPage: Integer;
      IndexCount: Byte;
      RootPages: array [0..MAX_NUM_INDEXES] of Integer;
      DataRootPages: array [0..MAX_NUM_INDEXES] of Integer;
      IsDirty: Boolean;
      EmptySpace2: array [1..221] of Byte;
   end;

   TV1IndexDefinition = packed record
      IndexName: string[OLD_MAX_INDEXNAME_SIZE];
      KeySize: Byte;
      KeyDescending: Boolean;
      KeyCaseInsensitive: Boolean;
      KeyUnique: Boolean;
      KeyFieldCount: Byte;
      KeyFields: TOldKeyFields;
      RootPtr: Integer;
      FreePagePtr: Integer;
   end;

   TV23IndexDefinition = packed record
      IndexName: string[OLD_MAX_INDEXNAME_SIZE];
      KeySize: Word;
      KeyDescending: Boolean;
      KeyCaseInsensitive: Boolean;
      KeyUnique: Boolean;
      KeyCompressionType: Byte;
      KeyFieldCount: Byte;
      KeyDescendingFields: TOldDescendingKeyFields;
      KeyFields: TOldKeyFields;
      RootPage: Integer;
      NextFreePage: Integer;
      IndexChanged: Boolean; { internal use only }
      RemoveIndex: Boolean; { internal use only }
      DataRootPage: Integer;
      NoKeyStatistics: Boolean; { internal use only }
      KeyTemporary: Boolean; { internal use only }
      EmptySpace: array [1..18] of Byte;
   end;

   TV1IndexHeader = packed record
      UpdateStamp: Integer;
      EmptySpace1: array [1..4] of Byte;
      VersionNum: Byte;
      FileSize: Integer;
      IndexCount: Byte;
      IndexesList: array [0..OLD_MAX_NUM_INDEXES] of TV1IndexDefinition;
      RecordCount: Integer;
      EmptySpace2: array [1..34] of Byte;
   end;

   TV23IndexHeader = packed record
      UpdateStamp: Integer;
      EmptySpace1: array [1..4] of Byte;
      VersionNum: Byte;
      NextEndingPage: Integer;
      IndexCount: Byte;
      IndexesList: array [0..OLD_MAX_NUM_INDEXES] of TV23IndexDefinition;
      RecordCount: Integer;
      NoPrimaryIndex: Boolean;
      IsDirty: Boolean;
      EmptySpace2: array [1..116] of Byte;
   end;

   TPageHeader = packed record
      PageType: Byte;
      NumberOfKeys: Word;
      LeftNumber: Integer;
      RightNumber: Integer;
      CompressedSize: Word;
      end;

   pPageHeader = ^TPageHeader;

   TBlockHeader = packed record
      PrevNumber: Integer;
      NextNumber: Integer;
      Length: Word;
      Signature: Integer;
      TotalLength: Integer;
      end;

   pBlockHeader = ^TBlockHeader;

   TV123BlobHeader = packed record
      UpdateStamp: Integer;
      EmptySpace1: array [1..4] of Byte;
      VersionNum: Byte;
      NextFreeBlock: Integer;
      NextEndingBlock: Integer;
      IsDirty: Boolean;
      EmptySpace2: array [1..494] of Byte;
   end;

   TBlobHeader = packed record
      UpdateStamp: Integer;
      EmptySpace1: array [1..4] of Byte;
      VersionNum: Byte;
      FileSignature: TMD5Digest;
      NextFreeBlock: Integer;
      NextEndingBlock: Integer;
      IsDirty: Boolean;
      EmptySpace: array [1..478] of Byte;
   end;

   TParamDefinition = packed record
      DataType: Byte;
      SubType: Byte;
      end;

   TFunctionDefinition = packed record
      FunctionName: string[MAX_FUNCNAME_SIZE];
      ResultType: Byte;
      ResultSubType: Byte;
      ParamCount: Byte;
      ParamDefinitions: array [1..MAX_NUM_FUNCPARAMS] of TParamDefinition;
      end;

   pFunctionDefinition = ^TFunctionDefinition;

   pProcedureProgressCallback = function (ClientData: Integer; const Status: string;
                                          PercentDone: Word; var Abort: Boolean): Boolean;

   pProgressCallback = function (ClientData: Integer; PercentDone: Word): Boolean;

   pSteppedProgressCallback = function (ClientData: Integer; const Step: string;
                                        PercentDone: Word): Boolean;

   pDataLostCallback = function (ClientData: Integer; Cause: Byte;
                                 const ContextInfo: string;
                                 var Continue: Boolean;
                                 var StopAsking: Boolean): Boolean;

   pLogCallback = function (ClientData: Integer; const LogMessage: string): Boolean;

   pFilterFunction = function (ClientData: Integer; RecordSize: Integer;
                               RecordBuffer: Pointer; RecordNum: Integer): Boolean;

   TFilterKeyBuffer = packed record
      KeyBuffer: array [0..MAX_KEYLEN-1] of Char;
      Cursor: TObject;
      end;

   pFilterKeyBuffer = ^TFilterKeyBuffer;

   pCopyFileCallback = function (ClientData: Integer; const FileName: string;
                                 PercentDone: Word): Boolean;

   TRequestHeader = packed record
      RequestSignature: TMD5Digest;
      TotalRequestSize: Integer;
      RequestCompression: Byte;
      RequestCode: Word;
      RequestParamSize: Integer;
      end;

   pRequestHeader = ^TRequestHeader;

   TReplyHeader = packed record
      ReplySignature: TMD5Digest;
      TotalReplySize: Integer;
      ReplyCompression: Byte;
      ResultCode: Word;
      ResultSize: Integer;
      end;

   pReplyHeader = ^TReplyHeader;

   pLoginCallback = function(ClientData: Integer; var UserName: ShortString;
                             var Password: ShortString): Boolean;

   pTimeoutCallback = function(ClientData: Integer; var StayConnected: Boolean): Boolean;

   TDataTraceRecord = packed record
      DateTime: TDateTime;
      EventType: Byte;
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

   pSendReceiveCallback = function (ClientData: Integer;
                                    NumBytes: Integer; 
                                    PercentDone: Word): Boolean;

   pTraceCallback = function(ClientData: Integer;
                             TraceRecord: TDataTraceRecord): Boolean;

   pReconnectCallback = function(ClientData: Integer;
                                 var Continue: Boolean;
                                 var StopAsking: Boolean): Boolean;

   pGetProcessIDCallback = function (ClientData: Integer; var ProcessID: string): Boolean;

   pGetPathCallback = function (ClientData: Integer; const DataDirectoryName: string;
                                var Path: string): Boolean;

   pGetRightsCallback = function (ClientData: Integer; const DataDirectoryName: string;
                                  var Rights: Integer): Boolean;

   pCheckRightsCallback = function (ClientData: Integer; DataDirectory: TObject;
                                    RightToCheck: Byte): Boolean;

   pPasswordCallback = function (ClientData: Integer): Boolean;

   TBlobParam = packed record
      BlobLength: Integer;
      BlobBuffer: PChar;
      end;

   pBlobParam = ^TBlobParam;

   TResultCalculation = (rcNone,rcSum,rcRunSum,rcMin,rcMax,rcAvg,rcStdDev,rcStdDevSum,rcCount);

   pAbortProgressCallback = function (ClientData: Integer; PercentDone: Word;
                                      var Abort: Boolean): Boolean;

   TDataLogRecord = packed record
      DateTime: TDateTime;
      Category: Byte;
      EventType: Byte;
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

   pServerLogEventCallback = function(ClientData: Integer;
                                      LogRecord: TDataLogRecord): Boolean;

   pServerLogCountCallback = function(ClientData: Integer;
                                      var LogCount: Integer): Boolean;

   pServerLogRecordCallback = function(ClientData: Integer; Number: Integer;
                                       var LogRecord: TDataLogRecord): Boolean;

   pServerNotifyCallback = function(ClientData: Integer): Boolean;

   pServerConnectCallback = function(ClientData: Integer; IsEncrypted: Boolean;
                                     const ConnectAddress: string;
                                     var UserData: TObject): Boolean;

   pServerReconnectCallback = function(ClientData: Integer; IsEncrypted: Boolean;
                                       const ConnectAddress: string;
                                       UserData: TObject): Boolean;

   pServerLoginCallback = function(ClientData: Integer; const UserName: string;
                                   UserData: TObject): Boolean;

   pServerLogoutCallback = function(ClientData: Integer; var UserData: TObject): Boolean;

   pServerDisconnectCallback = function(ClientData: Integer; UserData: TObject;
                                        const LastConnectAddress: string): Boolean;

   TConfigDays = array [1..7] of Boolean;

   TConfigMonths = array [1..12] of Boolean;

   pCryptoInitCallback = function (ClientData: Integer;
                                   Key: Pointer; KeyLen: Integer;
                                   out OutData: Pointer; out OutDataBytes: Integer): Boolean;

   pEncryptBlockCallback = function (ClientData: Integer; Data: Pointer;
                                     BlockBuffer: Pointer): Boolean;

   pDecryptBlockCallback = function (ClientData: Integer; Data: Pointer;
                                     BlockBuffer: Pointer): Boolean;

   pCryptoResetCallback = function (ClientData: Integer; Data: Pointer): Boolean;

   pCompressCallback = function (ClientData: Integer;
                                 const InBuffer: Pointer; InBytes: Integer; Level: Byte;
                                   out OutBuffer: Pointer; out OutBytes: Integer): Boolean;

   pDecompressCallback = function (ClientData: Integer;
                                   const InBuffer: Pointer; InBytes: Integer;
                                   out OutBuffer: Pointer; out OutBytes: Integer): Boolean;

   pTextIndexFilterCallback = function (ClientData: Integer;
                                        const TableName: string;
                                        const FieldName: string;
                                        var TextToIndex: AnsiString): Boolean;

   pTextIndexTokenFilterCallback = function (ClientData: Integer;
                                             const TableName: string;
                                             const FieldName: string;
                                             const TextIndexToken: string;
                                             var Include: Boolean): Boolean;

   pGetFunctionsCallback = function(ClientData: Integer;
                                    out FunctionCount: Word;
                                    out FunctionDefinitions: array of pFunctionDefinition): Boolean;

   pFunctionCallback = function (ClientData: Integer;
                                 const FunctionName: string;
                                 InParamCount: Word;
                                 const InParamDefinitions: array of pFieldDefinition;
                                 InRecordBuffer: PChar;
                                 ResultDataType: Byte;
                                 out ResultSize: Integer;
                                 out ResultBuffer: PChar): Boolean;

   pTriggerCallback = function (ClientData: Integer;
                                TriggerType: Byte;
                                DataSession: TObject;
                                DataDirectory: TObject;
                                DataCursor: TObject;
                                RecordNumber: Integer;
                                RecordBuffer: PChar;
                                OldRecordBuffer: PChar): Boolean;

   pErrorCallback = function (ClientData: Integer;
                              ErrorType: Byte;
                              DataSession: TObject;
                              DataDirectory: TObject;
                              DataCursor: TObject;
                              RecordNumber: Integer;
                              RecordBuffer: PChar;
                              E: Exception; var Response: Byte): Boolean;

   pCacheErrorCallback = function (ClientData: Integer;
                                   RecordNumber: Integer;
                                   RecordSize: Word;
                                   RecordBuffer: PChar;
                                   OldRecordBuffer: PChar;
                                   E: Exception;
                                   OperationType: Byte;
                                   Retrying: Boolean;
                                   var Response: Byte): Boolean;

   pServerScheduledEventCallback = function (ClientData: Integer;
                                             const EventName: string;
                                             var Completed: Boolean): Boolean;

   pServerProcedureCallback = function (ClientData: Integer;
                                        DataSession: TObject;
                                        const ProcedureName: string;
                                        InParamCount: Word;
                                        const InParamDefinitions: array of pFieldDefinition;
                                        InRecordBuffer: PChar;
                                        out OutParamCount: Word;
                                        out OutParamDefinitions: array of pFieldDefinition;
                                        out OutRecordBuffer: PChar;
                                        out OutBlobCount: Word;
                                        out OutBlobBuffers: array of PChar): Boolean;

   TLocaleCharMap = array [0..High(Byte)] of AnsiChar;

   pLocaleCharMap = ^TLocaleCharMap;

   TLocaleChar = packed record
      LocaleID: Integer;
      LocaleChar: AnsiChar;
      end;

   pLocaleChar = ^TLocaleChar;

   TLocaleCharMapEntry = packed record
      LocaleID: Integer;
      CharMap: TLocaleCharMap;
      end;

   pLocaleCharMapEntry = ^TLocaleCharMapEntry;

   TLockRecord = packed record
      BeginOffset: Int64;
      EndOffset: Int64;
      ByteLength: Int64;
      end;

   pLockRecord = ^TLockRecord;

   TFileHandleRecord = packed record
      Handle: Integer;
      FilePos:Int64;
      end;

   pFileHandleRecord = ^TFileHandleRecord;

   TWordBits = 0..(BITS_PER_WORD-1);
   TWordBitsSet = set of TWordBits;
   pBitmapArray = ^TBitmapArray;
   TBitmapArray = array[0..(MAX_NUM_BITS div BITS_PER_WORD)] of TWordBitsSet;
   pLongWordArray = ^TLongWordArray;
   TLongWordArray = array[0..(MAX_NUM_BITS div BITS_PER_WORD)] of LongWord;

   TOptimizeLevel = (olNone,olPartial,olFull);

   TExpOperator = (eoNOTDEFINED,eoISBLANK,eoNOTBLANK,eoEQ,eoNE,eoGT,
                   eoLT,eoGE,eoLE,eoNOT,eoAND,eoOR,eoTUPLE,eoFIELD,
                   eoCONST,eoMINUS,eoPLUS,eoADD,eoSUB,eoMUL,eoDIV,
                   eoSUM,eoRUNSUM,eoCOUNT,eoMIN,eoMAX,eoAVG,eoSTDDEV,
                   eoLIKE,eoIN,eoSUBIN,eoUPPER,eoLOWER,
                   eoBETWEEN,eoNOTBETWEEN,eoNOTLIKE,eoNOTIN,eoNOTSUBIN,
                   eoSUBSTRING,eoREPLACE,eoPOS,
                   eoOCCURS,eoTRIMLEADING,eoTRIMTRAILING,eoTRIMBOTH,eoLENGTH,
                   eoLEFT,eoRIGHT,eoREPEAT,eoCONCAT,
                   eoCAST,eoEXTRACTYEAR,eoEXTRACTMONTH,eoEXTRACTWEEK,eoEXTRACTDAY,
                   eoEXTRACTDAYOFWEEK,eoEXTRACTDAYOFYEAR,
                   eoEXTRACTHOUR,eoEXTRACTMINUTE,eoEXTRACTSECOND,eoEXTRACTMSECOND,
                   eoMSECSYEARS,eoMSECSDAYS,eoMSECSHOURS,eoMSECSMINS,eoMSECSSECS,eoMSECSMSECS,
                   eoIF,eoCOALESCE,eoIFNULL,eoABS,eoROUND,eoMOD,
                   eoACOS,eoASIN,eoATAN,eoATAN2,eoCEILING,eoCOS,eoCOT,
                   eoDEGREES,eoEXP,eoFLOOR,eoLOG,eoLOG10,eoPI,eoPOWER,
                   eoRADIANS,eoRAND,eoSIGN,eoSIN,eoSQRT,eoTAN,eoTRUNCATE,
                   eoTEXTSEARCH,eoTEXTOCCURS,eoLASTAUTOINC,eoIDENTCURRENT,
                   eoCUSTOMFUNC,eoCURDATE,eoCURTIME,eoCURTIMESTAMP,eoCURGUID,
                   eoSUBEXISTS,eoNOTSUBEXISTS,eoNULLIF,eoCASE,eoCASEOPTION,eoCASERESULT);

   TExpTokenType = (etNULL,etUNARY,etBINARY,etCOMPARE,etEXTBINARY,etFIELD,etCONST,
                    etTUPLE,etFUNC);

   TExpTokenTypeSet = set of TExpTokenType;

   TParseModifiers = (pmAllowAggregates,pmAllowAllFields,pmAllowExtPredicates,
                      pmAllowParameters,pmAllowSubSelects,pmAllowTableQualifier);

   TParseOptions = set of TParseModifiers;

   TJoinType = (jtNone,jtInner,jtLeftOuter,jtRightOuter,jtFullOuter);

   TMergeType = (mtNone,mtUnion,mtUnionAll,mtIntersect,mtIntersectAll,
                 mtExcept,mtExceptAll);

   TSubSelectType = (stNone,stInsertSelect,stSubSelect);

   pVerifyFieldCallback = function (ClientData: Integer; FieldToken: TObject): Boolean;

   pEvaluateFieldCallback = function (ClientData: Integer; RecordData: PChar;
                                      FieldToken: TObject): Boolean;

   TLocaleSettings = packed record
      CurrencyString: AnsiString;
      CurrencyFormat: Integer;
      NegCurrFormat: Integer;
      ThousandSeparator: Char;
      DecimalSeparator: Char;
      CurrencyDecimals: Integer;
      DateSeparator: Char;
      ShortDateFormat: AnsiString;
      LongDateFormat: AnsiString;
      TimeSeparator: Char;
      TimeAMString: AnsiString;
      TimePMString: AnsiString;
      ShortTimeFormat: AnsiString;
      LongTimeFormat: AnsiString;
      ShortMonthNames: array[1..12] of AnsiString;
      LongMonthNames: array[1..12] of AnsiString;
      ShortDayNames: array[1..7] of AnsiString;
      LongDayNames: array[1..7] of AnsiString;
      end;

   pLocaleSettings = ^TLocaleSettings;

   { Linux condition variable structure - keeps mutex and condition
     variable in the same place }


implementation

end.





