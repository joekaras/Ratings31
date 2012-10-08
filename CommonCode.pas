unit CommonCode;

interface
const
   BATCH_SIZE = 50; // Try to keep below 128k
   LARGE_BATCH_SIZE = 1000;

   AVERAGE_TJO_RANK = 51;

   DF_ERL_A = 'Dirt Fast (1) Pace Early';
   DF_LATE_A = 'Dirt Fast (1) Pace Late';
   DF_MID_A = 'Dirt Fast (1) Pace Middle';

   DF_FDL_A = 'Dirt Fast (2) Front Double Liner';
   DF_FDL_0 = 'Dirt Fast (2) Front Double Liner - 0 Dots';
   DF_FDL_1 = 'Dirt Fast (2) Front Double Liner - 1 Dot';
   DF_FDL_2 = 'Dirt Fast (2) Front Double Liner - 2 Dots';
   DF_FDL_3 = 'Dirt Fast (2) Front Double Liner - 3 Dots';

   DF_BDL_A = 'Dirt Fast (3) Back Double Liner';
   DF_BDL_0 = 'Dirt Fast (3) Back Double Liner - 0 Dots';
   DF_BDL_1 = 'Dirt Fast (3) Back Double Liner - 1 Dot';
   DF_BDL_2 = 'Dirt Fast (3) Back Double Liner - 2 Dots';
   DF_BDL_3 = 'Dirt Fast (3) Back Double Liner - 3 Dots';

   DF_TL_A = 'Dirt Fast (4) Triple Liner';
   DF_TL_0 = 'Dirt Fast (4) Triple Liner - 0 Dots';
   DF_TL_1 = 'Dirt Fast (4) Triple Liner - 1 Dot';
   DF_TL_2 = 'Dirt Fast (4) Triple Liner - 2 Dots';
   DF_TL_3 = 'Dirt Fast (4) Triple Liner - 3 Dots';


   T_ERL_A = 'Turf (1) Pace Early';
   T_LATE_A = 'Turf (1) Pace Late';
   T_MID_A = 'Turf (1) Pace Middle';

   T_FDL_A = 'Turf (2) Front Double Liner';
   T_FDL_0 = 'Turf (2) Front Double Liner - 0 Dots';
   T_FDL_1 = 'Turf (2) Front Double Liner - 1 Dot';
   T_FDL_2 = 'Turf (2) Front Double Liner - 2 Dots';
   T_FDL_3 = 'Turf (2) Front Double Liner - 3 Dots';

   T_BDL_A = 'Turf (3) Back Double Liner';
   T_BDL_0 = 'Turf (3) Back Double Liner - 0 Dots';
   T_BDL_1 = 'Turf (3) Back Double Liner - 1 Dot';
   T_BDL_2 = 'Turf (3) Back Double Liner - 2 Dots';
   T_BDL_3 = 'Turf (3) Back Double Liner - 3 Dots';

   T_TL_A = 'Turf (4) Triple Liner';
   T_TL_0 = 'Turf (4) Triple Liner - 0 Dots';
   T_TL_1 = 'Turf (4) Triple Liner - 1 Dot';
   T_TL_2 = 'Turf (4) Triple Liner - 2 Dots';
   T_TL_3 = 'Turf (4) Triple Liner - 3 Dots';

   M_ERL_A = 'Mud (1) Pace Early';
   M_LATE_A = 'Mud (1) Pace Late';
   M_MID_A = 'Mud (1) Pace Middle';

   M_FDL_A = 'Mud (2) Front Double Liner';
   M_FDL_0 = 'Mud (2) Front Double Liner - 0 Dots';
   M_FDL_1 = 'Mud (2) Front Double Liner - 1 Dot';
   M_FDL_2 = 'Mud (2) Front Double Liner - 2 Dots';
   M_FDL_3 = 'Mud (2) Front Double Liner - 3 Dots';

   M_BDL_A = 'Mud (3) Back Double Liner';
   M_BDL_0 = 'Mud (3) Back Double Liner - 0 Dots';
   M_BDL_1 = 'Mud (3) Back Double Liner - 1 Dot';
   M_BDL_2 = 'Mud (3) Back Double Liner - 2 Dots';
   M_BDL_3 = 'Mud (3) Back Double Liner - 3 Dots';

   M_TL_A = 'Mud (4) Triple Liner';
   M_TL_0 = 'Mud (4) Triple Liner - 0 Dots';
   M_TL_1 = 'Mud (4) Triple Liner - 1 Dot';
   M_TL_2 = 'Mud (4) Triple Liner - 2 Dots';
   M_TL_3 = 'Mud (4) Triple Liner - 3 Dots';

   JOCKEY_LEADERS = 'J';
   //   OWNER_LEADERS = 'O';
   TRAINER_LEADERS = 'T';

   THIS_YEAR = 'T';
   LAST_YEAR = 'L';

   TRAINER_WINS = 'TW';
   TRAINER_EARNINGS = 'TE';

   JOCKEY_WINS = 'JW';
   JOCKEY_EARNINGS = 'JE';

   OWNER_WINS = 'OW';
   OWNER_EARNINGS = 'OE';


   ORDER_KEY_MAX = 5;
   HARNESS_KEY_MAX = 5;

   BUGGY_EARLY_CHARTS = '5';
   BUGGY_LATE_CHARTS = '6';

   PREV_WEEK_DAYS = 7;

   SLEEP_LONG = 500;
   SLEEP_SHORT = 50;

   // Has to match array size
   MAX_ROWS = 20;
   MAX_COLS = 20;

   // Offset where arrays will get loaded
   FLD_OFFSET = 10;
   FLD_TRK_OFFSET = 11;
   FLD_RACE_TYPE_OFFSET = 11;
   FLD_SURFACE_OFFSET = 11;

   MAX_PP = 6;
   INI_FILE = 'RATINGS31.INI';

   MAX_TRI_CHOICES = 4;
   MAX_PK3_CHOICES = 3;

   PK3_CHOICE = 0;
   TRI_CHOICE = 1;

   MAX_TRI_WHEEL_CHOICES = 2;

   NO_CHOICE = 0;
   CHALK_CHOICE = 1;
   VALUE_CHOICE = 2;

   FINAL_WIN_PCT_RANK_CHOICE = 10;
   MORNING_LINE_TO_1_RANK_CHOICE = 11;
   LATE_PACE_RANK_CHOICE = 15;
   LAST_SPEED_RANK_CHOICE = 16;
   POWER_RANK_CHOICE = 17;
   BACK_SPEED_RANK_CHOICE = 19;
   TOTAL_TRN_OWN_WIN_PCT_RANK_CHOICE = 20;
   TOTAL_TRN_JKY_DAYS_WIN_PCT_RANK_CHOICE = 21;
   CLASS_RATING_RANK_CHOICE = 22;
   TURF_RATING_RANK_CHOICE = 23;

   FINAL_WIN_PCT_RANK_TWO_CHOICE = 30;
   FINAL_WIN_PCT_RANK_THREE_CHOICE = 31;
   FINAL_WIN_PCT_RANK_FOUR_CHOICE = 32;
   FINAL_WIN_PCT_RANK_FIVE_CHOICE = 33;
   FINAL_WIN_PCT_RANK_SIX_CHOICE = 34;
   FINAL_WIN_PCT_RANK_SEVEN_CHOICE = 35;

   MIN_FINAL_ORDER_STARTS = 50;
   MIN_FINAL_ORDER_WIN_PCT = 30.00;

   MILE_IN_FEET = 5280;
   FEET_IN_FURLONG = 660;
   YARDS_IN_FURLONG = 220;

   STAT_DAYS = 1464;

   TRN_STAT_DAYS = 1464;
   BREEDING_STAT_DAYS = 1464;

   RANKING_DAYS = 586;

   MIN_STARTS = 50;

   MSW_RACE = 'MSW';
   MCL_RACE = 'MCL';

   ALW_RACE = 'ALW';
   STK_RACE = 'STK';
   HCP_RACE = 'HCP';
   CLM_RACE = 'CLM';
   FUT_RACE = 'FUT';

   OCLM_RACE = 'OCLM';
   SALW_RACE = 'SALW';
   SHCP_RACE = 'SHCP';

   G1_RACE = 'G1';
   G2_RACE = 'G2';
   G3_RACE = 'G3';

   // 0  AXCIS Comma Delimited (Format B)
   // 1  AXCIS Comma Delimited (Format C)
   // 2  AXCIS Past Performances
   // 3  AXCIS TrackMaster
   // 4  AXCIS TrackMaster Plus
   // 5  BRIS AllWays/Capsheet/Plus5/Neurax Pro/Pace Maker 2
   // 6  BRIS DRF (MultiFile)
   // 7  BRIS DRF/HAT/Neurax/Multicaps/Common Ground
   // 8  ITS - Comma Delimited
   // 9  TSN - Millennium/ThoroNet Pro
   // 10 TSN - Past Performance/Pace Selector/ThoroNet/Procaps

   NO_PK3_TYPE = 0;
   CHALK_PK3_TYPE = 1;
   VALUE_PK3_TYPE = 2;
   BOTH_PK3_TYPE = 3;

   AXCIS_COMMAB = 0;
   AXCIS_COMMAC = 1;
   AXCIS_PP = 2;
   AXCIS_TM = 3;
   AXCIS_TM_PLUS = 4;

   BRIS_ALW = 5;
   BRIS_SINGLE = 6;
   BRIS_MULTI = 7;

   ITS_COMMA = 8;

   TSN_ALW = 9;
   TSN_SINGLE = 10;

   INTERNET_AXCIS_USER_CODE = 'ZSARAKLSR';
   INTERNET_AXCIS_PASS_WORD = '340526748';
   INTERNET_AXCIS_HOME_PAGE = 'www.axcis.com';
   INTERNET_EQUIBASE_HOME_PAGE = 'www.equibase.com';
   INTERNET_DRF_HOME_PAGE = 'www.drf.com';

   INTERNET_USTA_HOME_PAGE = 'racing.ustrotting.com';
   INTERNET_SC_HOME_PAGE = 'www.standardbredcanada.ca';

   //
   //

      //  FTP_HOST = '209.170.32.141';
   FTP_HOST = '66.226.14.141';
   //  FTP_HOST = 'ksklimited.com';
   FTP_USERNAME = 'jkaras1958ksk';
   FTP_PASSWORD = 'wildmagic2';

   FTP_TIP_REPORT_DIR = 'tipsheets';
   FTP_HOSPITAL_REPORT_DIR = 'altsheets';
   FTP_GIMMICK_REPORT_DIR = 'gimmicksheets';
   FTP_VALUE_REPORT_DIR = 'valuesheets';
   FTP_ANGLE_REPORT_DIR = 'anglesheets';
   FTP_SELECTION_REPORT_DIR = 'selectionsheets';
   FTP_RESULTS_REPORT_DIR = 'results';
   FTP_SUMMARY_REPORT_DIR = 'summary';
   FTP_YOUBET_RESULTS_REPORT_DIR = 'youbetresults';
   FTP_YOUBET_SUMMARY_REPORT_DIR = 'youbetsummary';
   FTP_WAGER_REPORT_DIR = 'wagers';
   FTP_CONTEST_REPORT_DIR = 'contestsheets';
   FTP_MIKE_REPORT_DIR = 'mike';
   FTP_JIM_REPORT_DIR = 'buggyprograms';

   FTP_HARNESS_REPORT_DIR = 'buggysheets';
   FTP_HARNESS_VALUE_REPORT_DIR = 'buggyvaluesheets';

   MIN_DEFAULT_STARTS = 25;
   MIN_JKY_STARTS = 25;
   MIN_JKY_TODAY_STARTS = 25;
   MIN_TRN_STARTS = 25;

   //  MIN_TRN_TODAY_STARTS = 10;
   //  MIN_TRN_ORDER_KEY_STARTS = 25;

   MILE_FURLONGS = 8;

   NO_TURF_RACES = 'NO TURF RACES';
   NO_TURF_MUD_RACES = 'NO TURF/MUD RACES';
   MUD_RACES = 'MUD RACES';
   TURF_RACES = 'TURF RACES';
   ALL_RACES = 'ALL RACES';
   NO_MAIDEN_TURF_RACES = 'NO MAIDEN TURF RACES';
   MAIDEN_RACES = 'MAIDEN RACES';
   DIRT_RACES = 'DIRT RACES';

   MAX_TRAN_COUNT = 100;
   MIN_TRAN_COUNT = 10;

   MIN_TRN_WIN_PCT = 6.00;

   MIN_TRI_VALUE = 1.10;
   MIN_PK3_VALUE = 1.00;
   MIN_PK4_VALUE = 1.00;
   MIN_PK6_VALUE = 1.00;

   TRN_DAYS = 271;
   TRN_JKY_DAYS = 271;
   JKY_DAYS = 271;

   MIN_FINAL_VALUE_STARTS = 100;
   MIN_FINAL_VALUE_ML = 2.50;
   MIN_FINAL_VALUE_VALUE = 1.20;
   MIN_FINAL_VALUE_WIN_PCT = 10.00;
   MIN_FINAL_VALUE_PROFITLOSS = 10.00;
   MIN_FINAL_VALUE_TRN_WIN_PCT = 10.00;

   MIN_TIP_SHEET_TRN_WIN_PCT = 12.00;
   MIN_TIP_SHEET_STARTS = 25;

   MIN_ANGLE_SHEET_TRN_WIN_PCT = 6.00;
   MIN_ANGLE_SHEET_STARTS = 10;

   MIN_VALUE_SHEET_TRN_WIN_PCT = 6.00;
   MIN_VALUE_SHEET_STARTS = 25;
   MAX_VALUE_ML_ODDS = 20.00;

   MIN_ANGLE_ML_ODDS = 2.50;
   MAX_ANGLE_ML_ODDS = 31.00;

   MIN_TIP_ML_ODDS = 1.01;
   MAX_TIP_ML_ODDS = 19.00;

   MAX_TRI_PLC_PROB = 0.60;
   MAX_TRI_PLC_ENTRIES = 3;

   MAX_TRI_SHO_PROB = 0.80;
   MAX_TRI_SHO_ENTRIES = 4;

   MIN_CHALK_WIN_PCT = 35;
   MIN_CHALK_STARTS = 20;
   MIN_CHALK_TRN_STARTS = 50;
   MIN_CHALK_TRN_WIN_PCT = 18.00;
   MIN_CHALK_ML = 1.00;
   MAX_CHALK_ML = 2.50;

   MIN_GREAT_TRN_WIN_PCT = 17.00;
   MIN_GREAT_TRN_STARTS = 25;

   MIN_GREAT_JKY_WIN_PCT = 15.00;
   MIN_GREAT_JKY_STARTS = 25;

   MIN_GREAT_OWN_WIN_PCT = 17.00;
   MIN_GREAT_OWN_STARTS = 25;

   MIN_PLAYABLE_WIN_PCT = 20;

   EQUIBASE_RACE_LINE_TYPE = 1;
   EQUIBASE_CLASS_LINE_TYPE = 2;
   EQUIBASE_PURSE_LINE_TYPE = 3;
   EQUIBASE_WEATHER_LINE_TYPE = 4;
   EQUIBASE_WAGER_LINE_TYPE = 5;
   EQUIBASE_COMMENT_LINE_TYPE = 6;
   EQUIBASE_PGM_DETAIL_LINE_TYPE = 7;
   EQUIBASE_FRAC_TIME_LINE_TYPE = 8;
   EQUIBASE_WINNER_LINE_TYPE = 9;

   EQUIBASE_WPS_LINE_TYPE = 10;
   EQUIBASE_WPS_WIN_LINE_TYPE = 11;
   EQUIBASE_WPS_PLC_LINE_TYPE = 12;
   EQUIBASE_WPS_SHO_LINE_TYPE = 13;
   EQUIBASE_WPS_OUT_LINE_TYPE = 14;

   EQUIBASE_VALUE_LINE_TYPE = 15;
   EQUIBASE_OFF_LINE_TYPE = 15;
   EQUIBASE_RATINGS_LINE_TYPE = 17;
   EQUIBASE_FOOTNOTES_LINE_TYPE = 18;
   EQUIBASE_OWNERS_LINE_TYPE = 19;
   EQUIBASE_TRAINERS_LINE_TYPE = 20;
   EQUIBASE_PEDIGREE_LINE_TYPE = 21;
   EQUIBASE_PGM_COMMENT_LINE_TYPE = 22;

   DRF_RACE_LINE_TYPE = 1;
   DRF_WINNER_LINE_TYPE = 9;
   DRF_PGM_DETAIL_LINE_TYPE = 7;
   DRF_OFF_AT_LINE_TYPE = 11;


   FLASHNET_RACE_LINE_TYPE = 0;
   FLASHNET_HORSE_LINE_TYPE = 1;
   FLASHNET_PP_LINE_TYPE = 2;
   FLASHNET_TRN_DRV_LINE_TYPE = 3;
   FLASHNET_RECORD_LINE_TYPE = 4;

   USTA_RACE_LINE_TYPE = 0;
   USTA_HORSE_LINE_TYPE = 1;

   SC_RACE_LINE_TYPE = 0;
   SC_HORSE_LINE_TYPE = 1;

   MIN_EQUIBASE_FILE_SIZE = 22000;
   MIN_DRF_FILE_SIZE = 22000;
   MIN_REPORT_FILE_SIZE = 5000;

   FINAL_ORDER_MIN = 1;
   FINAL_ORDER_MAX = 5;

   MIN_TRN_STAT_WIN_PCT = 18.00;

   TRN_STAT_THROWOUT_WIN_PCT = 6.00;
   JKY_STAT_THROWOUT_WIN_PCT = 6.00;
   DAYS_TO_PROCESS = 10;


var
   gbTest: boolean;

   LINER_FILTER: string;
   DOLLAR_FILTER: string;
   WAGER_FILTER: string;
   WAGER_FILTER_ALL: string;
   TOP_PICK_FILTER: string;

   LOG_PATH: string;
   LOG_FILENAME: string;
   DATA_PATH: string;
   DATA_BUGGY_PATH: string;
   SQL_PATH: string;
   //  MEM_PATH: String;
   AXCIS_PATH: string;
   AXCIS_BUGGY_PATH: string;
   ALT_AXCIS_PATH: string;
   SAVE_AXCIS_PATH: string;

   dtAltLastDateToProcess: TDateTime;
   dtAltFirstDateToProcess: TDateTime;
   dtAltStartDateProcessed: TDateTime;
   dtAltStopDateProcessed: TDateTime;

   bUseEquibase: boolean;
   bUseDRF: boolean;

   BACKUP_PATH: string;

   BACKUP_BUGGY_PATH: string;
   USTA_CHARTS_PATH: string;
   SC_CHARTS_PATH: string;

   TRACK_SELECTION_PATH: string;

   EQUIBASE_STATS_PATH: string;
   EQUIBASE_TRACK_LEADERS_PATH: string;

   EQUIBASE_CHARTS_PATH: string;
   EQUIBASE_ENTRIES_PATH: string;
   EQUIBASE_RESULTS_PATH: string;
   EQUIBASE_WORKOUTS_PATH: string;

   DRF_CHARTS_PATH: string;
   DRF_ENTRIES_PATH: string;
   DRF_RESULTS_PATH: string;
   DRF_WORKOUTS_PATH: string;
   //   PDF_SAVE_PATH: string;
   //   PDF_FULL_SHEETS_PATH: string;
   //   PDF_TURF_SHEETS_PATH: string;
   //   PDF_MAIDEN_SHEETS_PATH: string;
   //   PDF_MCL_SHEETS_PATH: string;
   //   PDF_MSW_SHEETS_PATH: string;
   //   PDF_CLM_SHEETS_PATH: string;
   //   PDF_ALW_SHEETS_PATH: string;
   //   PDF_NON_MAIDEN_SHEETS_PATH: string;

   PDF_TIP_REPORT_PATH: string;
   PDF_HOSPITAL_REPORT_PATH: string;
   PDF_GIMMICK_REPORT_PATH: string;
   PDF_VALUE_REPORT_PATH: string;
   PDF_ANGLE_REPORT_PATH: string;
   PDF_SELECTION_REPORT_PATH: string;
   PDF_RESULTS_REPORT_PATH: string;
   PDF_SUMMARY_REPORT_PATH: string;
   PDF_WAGER_REPORT_PATH: string;
   PDF_CONTEST_REPORT_PATH: string;
   PDF_YOUBET_RESULTS_REPORT_PATH: string;
   PDF_YOUBET_SUMMARY_REPORT_PATH: string;

   PDF_HARNESS_REPORT_PATH: string;
   PDF_HARNESS_VALUE_REPORT_PATH: string;
   PDF_BUGGY_REPORT_PATH: string;
   PDF_JIM_REPORT_PATH: string;
   PDF_MIKE_REPORT_PATH: string;

   LOCATION: string;
   DAYS_TO_REPROCESS: integer;
   DATE_STATS_UPDATED_TO: TDateTime;
   DATE_FINAL_ORDER_UPDATED_TO: TDateTime;

function atoi(sIn: string): Integer;
function atol(sIn: string): Longint;
function atow(sIn: string): Word;
function atof(sIn: string): Double;
function CleanEntryNbrs(sWagerIn: string): string;

implementation

uses FastStrings;

function atoi(sIn: string): Integer;
var
   I: Integer;
   C: Integer;

begin

   Val(sIn, I, C);
   if C <> 0 then
      Result := 0
   else
      Result := I;

end;

function atol(sIn: string): Longint;
var
   I: Longint;
   C: Integer;

begin

   Val(sIn, I, C);
   if C <> 0 then
      Result := 0
   else
      Result := I;

end;

function atow(sIn: string): Word;
var
   I: Word;
   C: Integer;

begin

   Val(sIn, I, C);
   if C <> 0 then
      Result := 0
   else
      Result := I;

end;

function atof(sIn: string): Double;
var
   I: Double;
   C: Integer;

begin


   Val(sIn, I, C);
   if C <> 0 then
      Result := 0
   else
      Result := I;

end;

//procedure OpenTbl(Tbl: TDBISAMTable);
//begin
//  if (Tbl.Active = False) then
//  begin
//    with Tbl do
//    begin
//      try
//        if not(Exists) and InMemory then
//          CreateTable;
//        Open;
//        First;
//      except
//        raise EOpenTable.Create('Error: couldn't open table.('+Tbl.TableName+':'+Tbl.Name+')');
//      end;
//    end;
//  end;
//end;
//
//
//procedure CloseTbl(Tbl: TDBISAMTable);
//begin
//  with Tbl do
//  begin
//    if (Active = True) then
//    begin
//      if (state = dsInsert) or (state = dsEdit) then
//      begin
//        try
//          Post;
//        except
//          Cancel;
//        end;
//      end;
//      Tbl.FlushBuffers;
//      Close;
//      if InMemory then
//      begin
//        try
//          DeleteTable;
//        except
//          { ... }
//        end;
//      end;
//    end;
//  end;
//end;
//
//function FormatSQLValue(AField: TField): string;
//begin
//  if AField.Value = Null then
//    Result := 'Null'
//  else
//  begin
//    case AField.DataType of
//      ftString, ftWideString:
//        Result := Format('''%s''', [AField.Value]);
//      ftFloat, ftCurrency, ftBCD:
//        Result := Format('%s', [AnsiFloatToStr(AField.Value)]);
//      ftDate:
//        Result := Format('''%s''', [AnsiDateToStr(AField.Value)]);
//      ftTime:
//        Result := Format('''%s''', [AnsiTimeToStr(AField.Value)]);
//      ftDateTime:
//        Result := Format('''%s''', [AnsiDateTimeToStr(AField.Value)]);
//    else
//      Result := Format('%s', [AField.Value]);
//    end;
//  end;
//end;
//
//function ExecuteSQL(const ADir, ASQL: string;
//  Progress: TQueryProgressEvent): Integer;
//var
//  ASession: TDBISAMSession;
//  ADatabase: TDBISAMDatabase;
//  AQuery: TDBISAMQuery;
//begin
//  ASession := TDBISAMSession.Create(nil);
//  try
//    with ASession do
//    begin
//      { Provides a unique SessionName }
//      AutoSessionName := True;
//      PrivateDir := ADir;
//    end;
//    ADatabase := TDBISAMDatabase.Create(nil);
//    try
//      with ADatabase do
//      begin
//        DatabaseName := 'TempDatabase';
//        { Assign the passed database path }
//        Directory := ADir;
//        SessionName := ASession.SessionName;
//      end;
//      AQuery := TDBISAMQuery.Create(nil);
//      try
//        with AQuery do
//        begin
//          DatabaseName := ADatabase.DatabaseName;
//          ReQuestLive := True;
//          SessionName := ASession.SessionName;
//          SQL.Clear;
//          { Assign the passed SQL statement }
//          SQL.Add(ASQL);
//          { Assign the passed event handler }
//          OnQueryProgress := Progress;
//          { Prepare the query to determine statement type }
//          Prepare;
//          if SQLStatementType = stSelect then
//            Open
//          else
//            ExecSQL;
//        end;
//      finally
//        { Return # of records processed }
//        Result := AQuery.RowsAffected;
//        AQuery.Free;
//      end;
//    finally
//      ADatabase.Free;
//    end;
//  finally
//    ASession.Free;
//  end;
//end;
//
//// Because the function creates a separate session component, it should be
//// safe to use in threads.
//
//// Examples of use:
//
////var
////  SQL: string;
////  Rows: Integer;
////// -------------------
////FDataPath := 'C:\MyDataDirectory';
////
////{ UPDATE Query }
////SQL := 'UPDATE MyTable'#13#10;
////SQL := SQL + 'SET MyStamp = CURRENT_TIMESTAMP'#13#10;
////SQL := SQL + 'COMMIT INTERVAL 350'#13#10;
////Rows := ExecuteSQL(DataPath, SQL, QueryProgress);
////
////{ Check for the existence of a record }
////SQL := 'SELECT MyID'#13#10;
////SQL := SQL + 'FROM MyTable'#13#10;
////SQL := SQL + 'WHERE MyID = 1753'#13#10;
////Rows := ExecuteSQL(DataPath, SQL, nil);
////if Rows > 0 then
////  ShowMessage('Record found')
////else
////  ShowMessage('Record not found');
//// Method 1
//procedure RefreshQuery(Q: TDBISamQuery);
//var
//    xB: TBookMark;
//begin
//    if not Q.Active then begin
//       exit;
//    end;
//
//    xB := Q.GetBookMark;
//    Q.Close;
//    Screen.Cursor := -17;
//    Q.Open;
//    Screen.Cursor := 0;
//
//    if Q.ValidBookMark(xB) then begin
//       Q.GotoBookMark(xB);
//    end;
//
//    Q.FreeBookMark(xB);
//end;
//
//// Method 2
//procedure RefreshQuery(Q: TDBISamQuery);
//var
//    TempFields: String;
//    TempValues: Array of Variant;
//    nI: Integer;
//begin
//    if not Q.Active then begin
//        exit;
//    end;
//    TempFields := '';
//    SetLength(TempValues, Q.FieldCount);
//    for nI := 0 to Q.FieldCount-1 do begin
//        TempFields := Format('%s%s;', [TempFields, Q.Fields[nI].FieldName]);
//        TempValues[nI] := Q.Fields[nI].Value;
//    end;
//    SetLength(TempFields, Length(TempFields)-1);
//    Q.DisableControls;
//    try
//        Q.Close;
//        Q.Open;
//        Q.Locate(TempFields, TempValues, []);
//    finally
//        Q.EnableControls;
//    end;
//end;
//

function CleanEntryNbrs(sWagerIn: string): string;
var
   sWagerOut: string;

begin

   Result := '';

   //   Result := FastReplace(sWagerIn, 'ALL', '999', False);

   Result := FastReplace(sWagerIn, 'A', '', False);
   Result := FastReplace(sWagerIn, 'B', '', False);
   Result := FastReplace(sWagerIn, 'C', '', False);
   Result := FastReplace(sWagerIn, 'D', '', False);
   Result := FastReplace(sWagerIn, 'E', '', False);
   Result := FastReplace(sWagerIn, 'F', '', False);
   Result := FastReplace(sWagerIn, 'X', '', False);

   //   Result := FastReplace(sWagerIn, '999', 'ALL', False);

end;



end.

