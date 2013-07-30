{*************************************************************************
*
*      DBISAM string resources
*      for Delphi 3.x + and C++Builder 3.x +
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

{$I dbisamcp.inc}

unit dbisamst;

interface

{$I dbisamvr.inc}

resourcestring

   { Resource strings for engine error messages }

   DBISAM_ERRSTR_HEADER = 'DBISAM Engine Error # %u %s';

   DBISAM_ERRSTR_OSUNKNOWN = 'An unknown operating system error %u occurred with the table or backup file ''%s''';
   DBISAM_ERRSTR_OSENOMEM = 'There is insufficient operating system memory available for the current operation';
   DBISAM_ERRSTR_OSENOENT = 'Table or backup file ''%s'' does not exist';
   DBISAM_ERRSTR_OSEACCES = 'Access denied to table or backup file ''%s''';
   DBISAM_ERRSTR_OSENODEV = 'Access denied to logical operating system device for the table ''%s''';
   DBISAM_ERRSTR_LOCKREADLOCK = 'Cannot read lock the lock file for the database ''%s''';
   DBISAM_ERRSTR_LOCKREADUNLOCK = 'Cannot read unlock the lock file for the database ''%s''';
   DBISAM_ERRSTR_LOCKWRITELOCK = 'Cannot write lock the lock file for the database ''%s''';
   DBISAM_ERRSTR_LOCKWRITEUNLOCK = 'Cannot write unlock the lock file for the database ''%s''';
   DBISAM_ERRSTR_READLOCK = 'Cannot read lock the table ''%s''';
   DBISAM_ERRSTR_READUNLOCK = 'Cannot read unlock the table ''%s''';
   DBISAM_ERRSTR_WRITELOCK = 'Cannot write lock the table ''%s''';
   DBISAM_ERRSTR_WRITEUNLOCK = 'Cannot write unlock the table ''%s''';
   DBISAM_ERRSTR_TRANSLOCK = 'Transaction cannot lock the database ''%s''';
   DBISAM_ERRSTR_TRANSUNLOCK = 'Transaction cannot unlock the database ''%s''';
   DBISAM_ERRSTR_LOCKED = 'Cannot lock the table ''%s''';
   DBISAM_ERRSTR_UNLOCKFAILED = 'Cannot unlock the table or record in the table ''%s''';
   DBISAM_ERRSTR_TABLEOPEN = 'The table ''%s'' is already in use';
   DBISAM_ERRSTR_READERR = 'Error reading from the table or backup file ''%s''';
   DBISAM_ERRSTR_WRITEERR = 'Error writing to the table or backup file ''%s''';
   DBISAM_ERRSTR_RECLOCKFAILED = 'Cannot lock record in the table ''%s''';
   DBISAM_ERRSTR_OSEMFILE = 'Too many operating system files open while attempting to open the table ''%s''';
   DBISAM_ERRSTR_OSEBADF = 'Invalid operating system file handle for the table ''%s''';
   DBISAM_ERRSTR_OSENOTSAM = 'The table or backup file ''%s'' has been moved';
   DBISAM_ERRSTR_OLDVERSION = 'The table ''%s'' is not the correct version';
   DBISAM_ERRSTR_BADSIGNATURE = 'The table or backup file ''%s'' is not valid';
   DBISAM_ERRSTR_KEYVIOL = 'Duplicate key found in the index ''%s'' of the table ''%s''';
   DBISAM_ERRSTR_KEYORRECDELETED = 'Record has been changed or deleted by another user, session, or table cursor in the table ''%s''';
   DBISAM_ERRSTR_RECTOOBIG = 'Maximum record size exceeded in the table ''%s''';
   DBISAM_ERRSTR_FLDLIMIT = 'Maximum or minimum limits on number of fields exceeded in the table ''%s''';
   DBISAM_ERRSTR_INDEXLIMIT = 'Maximum or minimum limits on the index page size, the number of indexes, or the number of fields in an index exceeded in the table ''%s''';
   DBISAM_ERRSTR_RECNOTFOUND = 'Record not found in the table ''%s''';
   DBISAM_ERRSTR_NEEDEXCLACCESS = 'The table ''%s'' must be opened exclusively';
   DBISAM_ERRSTR_HEADERCORRUPT = 'Header information corrupt in the table ''%s''';
   DBISAM_ERRSTR_FILECORRUPT = 'Data record buffers corrupt in the table ''%s''';
   DBISAM_ERRSTR_INDEXCORRUPT = 'Index page buffers corrupt in the table ''%s''';
   DBISAM_ERRSTR_MEMOCORRUPT = 'BLOB block buffers corrupt in the table ''%s''';
   DBISAM_ERRSTR_OUTOFRANGE = 'Invalid field number or name ''%s'' specified for the table ''%s''';
   DBISAM_ERRSTR_INVALIDKEY = 'Invalid key size specified in the index ''%s'' for the table ''%s''';
   DBISAM_ERRSTR_REQDERR = 'A value must be provided for the field ''%s'' in the table ''%s''';
   DBISAM_ERRSTR_MINVALERR = 'The value for the field ''%s'' in the table ''%s'' is below the minimum allowable value';
   DBISAM_ERRSTR_MAXVALERR = 'The value for the field ''%s'' in the table ''%s'' is above the maximum allowable value';
   DBISAM_ERRSTR_INVALIDFLDTYPE = 'Invalid field definition specified for the field ''%s'' in the table ''%s''';
   DBISAM_ERRSTR_SEARCHCOLREQD = 'Invalid field ''%s'' specified for the index ''%s'' in the table ''%s''';
   DBISAM_ERRSTR_INVALIDBLOBLEN = 'Invalid BLOB length in the table ''%s''';
   DBISAM_ERRSTR_NOTABLOB = 'Invalid BLOB field ''%s'' specified for the table ''%s''';
   DBISAM_ERRSTR_ENDOFBLOB = 'End of BLOB field in the table ''%s'' reached prematurely';
   DBISAM_ERRSTR_INVALIDBLOBOFFSET = 'Invalid BLOB offset into the table ''%s'' specified';
   DBISAM_ERRSTR_INVALIDBLOBHANDLE = 'Invalid BLOB handle for the table ''%s'' specified';
   DBISAM_ERRSTR_OPENBLOBLIMIT = 'Too many BLOBs opened in the table ''%s''';
   DBISAM_ERRSTR_BLOBLIMIT = 'Too many BLOB fields or invalid BLOB block size specified for the table ''%s''';
   DBISAM_ERRSTR_BOF = 'Beginning of table ''%s'' unexpectedly encountered';
   DBISAM_ERRSTR_EOF = 'End of table ''%s'' unexpectedly encountered';
   DBISAM_ERRSTR_PRIMARYKEYREDEFINE = 'A primary index is already defined for the table ''%s'' and cannot be added again';
   DBISAM_ERRSTR_INDEXNAMEREQUIRED = 'The secondary index name is missing or not specified for the table ''%s''';
   DBISAM_ERRSTR_INDEXEXISTS = 'The secondary index ''%s'' already exists for the table ''%s''';
   DBISAM_ERRSTR_INVALIDINDEXNAME = 'Invalid secondary index name ''%s'' specified for the table ''%s''';
   DBISAM_ERRSTR_INVALIDIDXDESC = 'Invalid field number ''%s'' specified in the index ''%s'' for the table ''%s''';
   DBISAM_ERRSTR_INVALIDFILTER = 'Filter error for the table ''%s'' - %s at line %u, column %u';
   DBISAM_ERRSTR_NOSUCHFILTER = 'Invalid filter handle specified for the table ''%s''';
   DBISAM_ERRSTR_INTERNALLIMIT = 'Too many filters defined for the table ''%s''';
   DBISAM_ERRSTR_INVALIDFIELDNAME = 'Invalid or duplicate field name ''%s'' specified for the table ''%s''';
   DBISAM_ERRSTR_INVALIDVCHKSTRUCT = 'Invalid default expression or min/max constraint specified for the field ''%s'' in the table ''%s''';
   DBISAM_ERRSTR_NOTSUFFTABLERIGHTS = 'Insufficient rights to the table ''%s'', a password is required';
   DBISAM_ERRSTR_INVALIDPASSWORD = 'Password provided for the table ''%s'' is invalid';
   DBISAM_ERRSTR_CANNOTLOADLDDRV = 'The locale support for the table ''%s'' is not available or installed';
   DBISAM_ERRSTR_SQLPARSE = 'SQL parsing error - %s at line %u, column %u';
   DBISAM_ERRSTR_SQLEXEC = 'SQL execution error - %s';
   DBISAM_ERRSTR_TABLEFULL = 'The table ''%s'' is full and cannot contain any more data';
   DBISAM_ERRSTR_DATABASEFULL = 'The database ''%s'' is full and cannot contain any more tables';
   DBISAM_ERRSTR_NOCURRREC = 'No current record in the table ''%s''';
   DBISAM_ERRSTR_TABLEEXISTS = 'The table ''%s'' already exists';
   DBISAM_ERRSTR_COMPRESS = 'Error compressing data';
   DBISAM_ERRSTR_UNCOMPRESS = 'Error uncompressing data';
   DBISAM_ERRSTR_REMOTECOMMLOST = 'The connection to the database server at ''%s'' has been lost';
   DBISAM_ERRSTR_REMOTEENCRYPTREQ = 'The database server at ''%s'' requires an encrypted connection';
   DBISAM_ERRSTR_REMOTEUNKNOWN = 'An unknown error (''%s'') occurred with the connection to the database server at ''%s'', please check the server log';
   DBISAM_ERRSTR_REMOTECONNECT = 'A connection to the database server at ''%s'' cannot be established';
   DBISAM_ERRSTR_REMOTENOLOGIN = 'A connection to the database server at ''%s'' cannot be established, the server is not accepting new logins';
   DBISAM_ERRSTR_REMOTEMAXCONNECT = 'A connection to the database server at ''%s'' cannot be established, the maximum number of server or user connections has been reached';
   DBISAM_ERRSTR_REMOTEADDRESSBLOCK = 'A connection to the database server at ''%s'' cannot be established, the client address is blocked';
   DBISAM_ERRSTR_REMOTECALLBACKERR = 'A server callback error occurred for the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEVERSION = 'A call to the database server at ''%s'' failed, the client engine version does not match the server';
   DBISAM_ERRSTR_REMOTEINVLOGIN = 'A connection to the database server at ''%s'' cannot be established, the login information provided is invalid';
   DBISAM_ERRSTR_REMOTENOTAUTH = 'The user ''%s'' is not authorized to perform this operation with the database ''%s'' on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTENOTADMIN = 'The user ''%s'' is not authorized to perform administration functions on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEINVUSER = 'The user name is either invalid or blank';
   DBISAM_ERRSTR_REMOTENOUSER = 'The user ''%s'' does not exist on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEDUPUSER = 'The user ''%s'' already exists on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEINVDB = 'The database name or directory is either invalid or blank';
   DBISAM_ERRSTR_REMOTENODB = 'The database ''%s'' does not exist on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEDUPDB = 'The database ''%s'' already exists on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEINVDBUSER = 'The database user name is either invalid or blank';
   DBISAM_ERRSTR_REMOTENODBUSER = 'The database user ''%s'' does not exist for the database ''%s'' on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEDUPDBUSER = 'The database user ''%s'' already exists for the database ''%s'' on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEINVPROC = 'The procedure name is either invalid or blank';
   DBISAM_ERRSTR_REMOTENOPROC = 'The procedure ''%s'' does not exist on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEDUPPROC = 'The procedure ''%s'' already exists on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEINVPROCUSER = 'The procedure user name is either invalid or blank';
   DBISAM_ERRSTR_REMOTENOPROCUSER = 'The procedure user ''%s'' does not exist for the database ''%s'' on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEDUPPROCUSER = 'The procedure user ''%s'' already exists for the database ''%s'' on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEINVEVENT = 'The event name is either invalid or blank';
   DBISAM_ERRSTR_REMOTENOEVENT = 'The event ''%s'' does not exist on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEDUPEVENT = 'The event ''%s'' already exists on the database server at ''%s''';
   DBISAM_ERRSTR_REMOTEINVREQUEST = 'An invalid or unknown request was made to the database server at ''%s''';
   DBISAM_ERRSTR_IMPORTERROR = 'An error occurred during the import into the table ''%s'' - %s';
   DBISAM_ERRSTR_EXPORTERROR = 'An error occurred during the export from the table ''%s'' - %s';
   DBISAM_ERRSTR_LOADSTREAMERROR = 'An error occurred during the loading of a stream into the table ''%s'' - %s';
   DBISAM_ERRSTR_SAVESTREAMERROR = 'An error occurred during the saving of the table ''%s'' to a stream - %s';
   DBISAM_ERRSTR_TRIGGERERROR = 'An error occurred during a trigger on the table ''%s'' - %s';

   { Temporary table name for query result sets }

   DBISAM_ERRSTR_QUERY = 'query';

   { Resource strings for field type names }

   { Field type names }

   DBISAM_TYPESTR_ZSTRING = 'String';
   DBISAM_TYPESTR_ZSTRING_FIXED = 'FixedChar';
   DBISAM_TYPESTR_ZSTRING_UNICODE = 'WideString';
   DBISAM_TYPESTR_ZSTRING_GUID = 'GUID';
   DBISAM_TYPESTR_BYTES = 'Bytes';
   DBISAM_TYPESTR_VARBYTES = 'VarBytes';
   DBISAM_TYPESTR_BOOL = 'Boolean';
   DBISAM_TYPESTR_INT16 = 'SmallInt';
   DBISAM_TYPESTR_UINT16 = 'Word';
   DBISAM_TYPESTR_INT32 = 'Integer';
   DBISAM_TYPESTR_INT32_AUTOINC = 'AutoInc';
   DBISAM_TYPESTR_INT64 = 'LargeInt';
   DBISAM_TYPESTR_FLOAT = 'Float';
   DBISAM_TYPESTR_FLOAT_MONEY = 'Currency';
   DBISAM_TYPESTR_BCD = 'BCD';
   DBISAM_TYPESTR_DATE = 'Date';
   DBISAM_TYPESTR_TIME = 'Time';
   DBISAM_TYPESTR_TIMESTAMP = 'Timestamp';
   DBISAM_TYPESTR_BLOB = 'BLOB';
   DBISAM_TYPESTR_BLOB_MEMO = 'Memo';
   DBISAM_TYPESTR_BLOB_GRAPHIC = 'Graphic';

   { Expression token type names }

   DBISAM_TOKENSTR_UNARY = 'unary operator';
   DBISAM_TOKENSTR_BINARY = 'binary operator';
   DBISAM_TOKENSTR_COMPARE = 'compare operator';
   DBISAM_TOKENSTR_EXTBINARY = 'extended binary operator';
   DBISAM_TOKENSTR_FIELD = 'column name';
   DBISAM_TOKENSTR_CONST = 'constant value';
   DBISAM_TOKENSTR_TUPLE = 'sub-query';
   DBISAM_TOKENSTR_FUNC = 'function name';

   { TDataSet-level messages }

   SEngineExists = 'An engine component already exists';
   SEngineNotActive = 'Cannot perform this operation when the engine is not active';
   SEngineActive = 'Cannot perform this operation when the engine is active';
   SServerEngineSession = 'Cannot activate a remote session with the server engine'; 
   SDuplicateDatabaseName = 'Database name ''%s'' already exists';
   SDuplicateSessionName = 'Session name ''%s'' already exists';
   SInvalidSessionName = 'Session name ''%s'' is not valid';
   SDatabaseNameMissing = 'Database name is missing';
   SInvalidDatabaseName = 'Database name ''%s'' is not valid';
   SSessionNameMissing = 'Session name is missing';
   SDatabaseOpen = 'Cannot perform this operation on an open database';
   SDatabaseClosed = 'Cannot perform this operation on a closed database';
   SSessionActive = 'Cannot perform this operation on an active session';
   SSessionNotActive = 'Cannot perform this operation on an inactive session';
   SAutoSessionActive = 'Cannot perform this operation on the active auto-session';
   SAutoSessionExclusive = 'The active auto-session can be the only active session';
   SAutoSessionExists = 'This auto-session already exists';
   SHandleError = 'Error creating table handle';
   SEmptySQLStatement = 'No SQL statement available';
   SNoParameterType = 'No parameter type for parameter ''%s''';
   SNotEditing = 'Table is not in edit or insert mode';
   STableMismatch = 'Source and destination tables are incompatible';
   SFieldReadOnly = 'Field ''%s'' cannot be modified';
   SNotIndexField = 'Field ''%s'' is not in the current index';
   SCircularDataLink = 'Circular data links are not allowed';
   SFieldIndexError = 'Field index out of range';
   SNoFieldIndexes = 'No fields defined for the current index';
   SIndexFieldMissing = 'Cannot access index field ''%s''';
   SBeginTransError = 'Database ''%s'' already has an active transaction';
   SEndTransError = 'Database ''%s'' has no active transaction';
   SNoTableName = 'Missing table name';
   SNoLocateFields = 'No fields specified for locate';
   SNoBlobLocate = 'Blob field ''%s'' not allowed in locate or lookup';
   STooManyLocateFields = 'Too many fields for locate';
   SParamLargeInt = 'Cannot assign/retrieve large integer parameter values in Delphi 5';
   STooManyPrimaryIndexes = 'Only one primary index allowed per table';
   SNoFunctionResultType = 'No function result type for function ''%s''';
   SFunctionNotFound = 'Function ''%s'' not found';
   SNoFunctionParamDataType = 'Function parameter data type missing for function ''%s''';
   SUpdateFailed = 'Update failed';

implementation

end.


