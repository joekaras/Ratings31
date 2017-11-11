unit UnitCommonCode;

interface
//   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,

uses Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   mlog, DBISAMTb, db, StdCtrls, ComCtrls, ExtCtrls,
   DIUnicode, DIHtmlParser, DIHtmlWriterPlugin, DIUnicodeHtmlWriter,
   DIHtmlCharSetPlugin, DIHtmlMisc, DIUtils,
   cxControls, cxContainer, cxEdit, cxProgressBar, cxPc;

type
   TNums = set of 1..20;
   TLArray = array[1..20, 1..20] of longint;
   TDArray = array[1..20, 1..20] of single;

const
   //
   //   TEST_FINAL_ORDER_DAYS = 91;
   //   FINAL_ORDER_DAYS = 91;
   //   LINER_ORDER_DAYS = 91;
   //   TURF_ORDER_DAYS = 91;
   //   DIRT_ORDER_DAYS = 91;
   //   RANKING_STAT_DAYS = 91;

   TEST_FINAL_ORDER_DAYS = 192;
   FINAL_ORDER_DAYS = 192;
   LINER_ORDER_DAYS = 192;
   TURF_ORDER_DAYS = 192;
   DIRT_ORDER_DAYS = 192;
   RANKING_STAT_DAYS = 391;
   RANKING_TRACK_STAT_DAYS = 391;

   STAT_DAYS = 732;

   TRN_STAT_DAYS = 732;
   BREEDING_STAT_DAYS = 732;
   RANKING_DAYS = 732;
   //
   //   STAT_DAYS = 365;
   //   TRN_STAT_DAYS = 365;
   //   BREEDING_STAT_DAYS = 365;
   //   RANKING_DAYS = 365;

   XS2_COUNT = 1;

   // Has to match array size
   MAX_ROWS = 20;
   MAX_COLS = 20;

   LAYOFF_DAYS = 31;

   // Offset where arrays will get loaded
   FLD_OFFSET = 10;
   FLD_TRK_OFFSET = 11;
   FLD_RACE_TYPE_OFFSET = 11;
   FLD_SURFACE_OFFSET = 11;

   OVERRIDE_DATE_TRUE = True;
   OVERRIDE_DATE_FALSE = False;

   ONE_DAY_TRUE = True;
   ONE_DAY_FALSE = False;

   CREATE_ALL_TRUE = True;
   CREATE_ALL_FALSE = False;

   BATCH_SIZE = 5000; // Try to keep below 128k
   LARGE_BATCH_SIZE = 10000; //1000;
   SMALL_BATCH_SIZE = 500; //500;

   AVERAGE_T_RANK = 101;
   AVERAGE_J_RANK = 101;
   AVERAGE_O_RANK = 251;

   AVERAGE_SIRE_RANK = 251;

   WIN_WAGER_KEY = 'WIN';

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

   //   MCP_FILE = 'MCP';
   MCP_FILE = 'MCP';
   ERD_FILE = 'ERD';
   LSC_FILE = 'LSC';

   TURF_SIRES = 'TS';
   GENERAL_SIRES = 'GS';
   JUVENILE_SIRES = 'JS';
   AEI_SIRES = 'ES';
   AW_SIRES = 'AW';

   ORDER_KEY_MAX = 4;
   ML_ORDER_KEY_MAX = 10;
   SPEED_ORDER_KEY_MAX = 3;

   HARNESS_KEY_MAX = 6;

   BUGGY_EARLY_CHARTS = '5';
   BUGGY_LATE_CHARTS = '6';

   PREV_WEEK_DAYS = 7;
   S_PREV_WEEK_DAYS = 'LAST45';

   SLEEP_LONG = 500;
   SLEEP_SHORT = 50;


   MAX_QSP_PP = 5;
   MAX_KSP_PP = 3;
   MAX_PP = 14;
   MAX_ANGLE_PP = 14;

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

   MIN_FINAL_ORDER_STARTS = 10;
   MIN_FINAL_ORDER_WIN_PCT = 30.00;

   MILE_IN_FEET = 5280;
   FEET_IN_FURLONG = 660;
   YARDS_IN_FURLONG = 220;


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

   ALT_ORDER = true;
   NORMAL_ORDER = false;
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

   //INTERNET_TSN_USER_CODE = 'karasks';
   //INTERNET_TSN_PASS_WORD = '1timeonly';
   //INTERNET_TSN_HOME_PAGE = 'www.tsnhorse.com';

   INTERNET_TSN_USER_CODE = '97karasks';
   INTERNET_TSN_PASS_WORD = '1timeonly';
   INTERNET_TSN_HOME_PAGE = 'www.brisnet.com';

   INTERNET_EQUIBASE_HOME_PAGE = 'www.equibase.com';
   INTERNET_DRF_HOME_PAGE = 'www.drf.com';
   INTERNET_BLOODHORSE_HOME_PAGE = 'http://breeding.bloodhorse.com';

   INTERNET_USTA_HOME_PAGE = 'racing.ustrotting.com';
   INTERNET_SC_HOME_PAGE = 'www.standardbredcanada.ca';

   //
   //

//   FTP_HOST = '64.202.163.74';
   FTP_HOST = 'ksklimited.com';
   FTP_USERNAME = 'JoeKarasKSK@ksklimited.com';
   //   FTP_USERNAME = 'JoeKarasKSK';
   //   FTP_PASSWORD = 'Only1Time';
   FTP_PASSWORD = 'Only1TimeHostGatorFTP';

   //   FTP_HOST = '64.202.163.74';
   JIM_FTP_HOST = 'www.onlinefolder.com';
   JIM_FTP_USERNAME = 'joekaras';
   JIM_FTP_PASSWORD = '1TimeOnly';


   FTP_TIP_REPORT_DIR = 'tipsheets';
   FTP_HOSPITAL_REPORT_DIR = 'altsheets';
   FTP_HOSPITAL_REPORT2_DIR = 'altsheets2';
   FTP_GIMMICK_REPORT_DIR = 'gimmicksheets';
   FTP_VALUE_REPORT_DIR = 'valuesheets';
   FTP_ANGLE_REPORT_DIR = 'anglesheets';
   FTP_SELECTION_REPORT_DIR = 'selectionsheets';
   FTP_RESULTS_REPORT_DIR = 'results';
   //   FTP_SUMMARY_REPORT_DIR = 'summary';
   FTP_YOUBET_RESULTS_REPORT_DIR = 'results';
   //   FTP_YOUBET_SUMMARY_REPORT_DIR = 'youbetsummary';
   FTP_WAGER_REPORT_DIR = 'wagers';
   FTP_CONTEST_REPORT_DIR = 'contestsheets';
   FTP_MIKE_REPORT_DIR = 'mike';
   FTP_JIM_REPORT_DIR = 'buggyprograms';

   FTP_HARNESS_REPORT_DIR = 'buggysheets';
   FTP_HARNESS_VALUE_REPORT_DIR = 'buggyvaluesheets';

   FTP_EXPORT_DIR = 'results';

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

   MIN_TRN_WIN_PCT = 6.00;

   MIN_TRI_VALUE = 1.10;
   MIN_PK3_VALUE = 1.00;
   MIN_PK4_VALUE = 1.00;
   MIN_PK6_VALUE = 1.00;

   TRN_DAYS = 271;
   TRN_JKY_DAYS = 271;
   JKY_DAYS = 271;

   MIN_FINAL_VALUE_STARTS = 10;
   MIN_FINAL_VALUE_ML = 2.00;
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

   DRF_OFF_LINE_TYPE = 8;
   DRF_WPS_LINE_TYPE = 10;
   DRF_WPS_WIN_LINE_TYPE = 11;
   DRF_WPS_PLC_LINE_TYPE = 12;
   DRF_WPS_SHO_LINE_TYPE = 13;
   DRF_WPS_OUT_LINE_TYPE = 14;


   FLASHNET_RACE_LINE_TYPE = 0;
   FLASHNET_HORSE_LINE_TYPE = 1;
   FLASHNET_PP_LINE_TYPE = 2;
   FLASHNET_TRN_DRV_LINE_TYPE = 3;
   FLASHNET_RECORD_LINE_TYPE = 4;

   USTA_RACE_LINE_TYPE = 0;
   USTA_HORSE_LINE_TYPE = 1;

   SC_RACE_LINE_TYPE = 0;
   SC_HORSE_LINE_TYPE = 1;

   MIN_AXCIS_FILE_SIZE = 25000;
   MIN_EQUIBASE_FILE_SIZE = 15000;
   MIN_DRF_FILE_SIZE = 15000;
   MIN_REPORT_FILE_SIZE = 5000;

   MIN_TSN_MCP_FILE_SIZE = 4000;
   MIN_TSN_XRD_FILE_SIZE = 1000;

   FINAL_ORDER_MIN = 1;
   FINAL_ORDER_MAX = 5;

   MIN_TRN_STAT_WIN_PCT = 18.00;

   TRN_STAT_THROWOUT_WIN_PCT = 6.00;
   JKY_STAT_THROWOUT_WIN_PCT = 6.00;
   DAYS_TO_PROCESS = 10;

   FirstAfterClm = 0;
   FirstAtRoute = 1;
   FirstOnGrass = 2;
   FirstStrtWTrn = 3;
   FirstTimeStr = 4;
   FirstTimeBlinkers = 5;
   SecondAfterClm = 6;
   SecondCareerRace = 7;
   SecondGrassRace = 8;
   SecondRteRace = 9;
   SecondStrtWTrn = 10;
   ThirtyOneToNinetyDaysAway = 11;
   NinetyPlusDaysAway = 12;
   Allowance = 13;
   BlinkersOff = 14;
   BlnkrBackOn = 15;
   BtnFavorite = 16;
   Claiming = 17;
   DebutMdnClm = 18;
   DebutMdnspwt = 19;
   DirtToTurf = 20;
   Down2PlusClasses = 21;
   DownOneClass = 22;
   MaidenClaiming = 23;
   MaidenSpWt = 24;
   MdnWinLR = 25;
   NoClassChg = 26;
   RteToSprint = 27;
   Shipper = 28;
   SprintToRte = 29;
   SprntRteSprnt = 30;
   SprntSprntRte = 31;
   TurfStarts = 32;
   TurfToDirt = 33;
   Up2PlusClasses = 34;
   UpOneClass = 35;
   WnrLastRace = 36;
   OneFiveDaysAway = 37;
   NonGradedStk = 38;
   ShipperToUS = 39;
   GradedStakes = 40;
   DirttoAW = 41;
   AllWeather = 42;
   Secondofflayoff = 43;
   Layoff4690daysAway = 44;
   Clmrepeater = 45;
   TurftoAW = 46;
   Sprints = 47;
   Thirdofflayoff = 48;
   FirstTimeClmg = 49;
   AWtoTurf = 50;
   Dropsoffclaim = 51;
   MdntoMdnClm = 52;
   FirstTimeMdnClm = 53;
   Dirtstarts = 54;
   TwoYearOld = 55;
   AWtoDirt = 56;
   DebutTurf = 57;
   MdnClmtoMdn = 58;
   Firsttimelasix = 59;
   SecondtimeLasix = 60;
   Dropsoffwin = 61;
   Alarmingdrop = 62;
   DebutGt1M = 63;
   Routes = 64;

   A1stLasix = 0;
   A1stStart45dLayff = 1;
   A2ndLasix = 2;
   A2ndStart45dLayff = 3;
   A3rdStart45dLayff = 4;
   A3yrolds = 5;
   A4youp = 6;
   A5To1to10To1 = 7;
   HAllowance = 8;
   HBlinkersOFF = 9;
   BlinkersON = 10;
   Claimed1bk = 11;
   Claimed2bk = 12;
   Claimed3bk = 13;
   HClaiming = 14;
   DirtSynth = 15;
   Dwn20PctPurse = 16;
   FAndM = 17;
   FTS = 18;
   Favorites = 19;
   MClm = 20;
   MaleHorses = 21;
   RouteDebut = 22;
   RouteToSprint = 23;
   HRoutes = 24;
   Splwt = 25;
   SprintToRoute = 26;
   HSprints = 27;
   Track = 28;
   TurfDebut = 29;
   Up20PctPurse = 30;
   Below5To1 = 31;
   A2yrolds = 32;



   EXACTA = 0;
   QUINELLA = 1;
   TRIFECTA = 2;
   SUPERFECTA = 3;
   DAILYDOUBLE = 4;
   PICKTHREE = 5;
   PICKFOUR = 6;
   PICKSIX = 7;
   PERFECTA = 8;
   EXACTOR = 9;
   TRIACTOR = 10;
   WIN4 = 11;
   CONSOLATIONDOUBLE = 12;
   MATCHRIVAL = 13;
   GRANDSLAM = 14;
   CONSOLATIONPICKTHREE = 15;
   PLACEPICKALL = 16;
   PICKSEVEN = 17;
   TRISUPER = 18;
   WINFOUR = 19;
   BINGOBET = 20;
   PICKFIVE = 21;
   PICKNINE = 22;
   CHOOSESIX = 23;
   HEADTOHEAD = 24;
   STRAIGHTFLUSH = 25;
   TWINTRIFECTA = 26;
   CLASSIX = 27;
   SUPERHIGHFIVE = 28;

var
   hLog: TmLog;

var

   msE: TMemoryStream;
   msR: TMemoryStream;

   gbUseOverrideDate: boolean;
   gbOpenCloseFiles: boolean;

   bAbortQuery: boolean;
   bAbortTransfer: Boolean;
   bAddToHTML: boolean;

   bProcessAllDates: boolean;
   sProcessAllDatesPath: string;
   sProcessAllDatesSearch: string;
   sProcessAllDatesSearchXrd: string;

   bTransferringData: Boolean;
   bUseProxyServer: boolean;

   dtAxcisRaceDate: TDateTime;
   dtPPRaceDate: TDateTime;

   dtSTime: TDateTime;
   fBackSpeed: double;
   fBackSpeedWinPct: double;
   fJky10WinPct: double;
   fJky30WinPct: double;
   fLastSpeed: double;
   fLastSpeedWinPct: double;
   fLifeMudWinPct: double;
   fLifeTurfWinPct: double;
   fMorningLine: double;
   fPace: double;
   fPaceWinPct: double;
   fPower: double;
   fPowerWinPct: double;
   fTotalJkyWinPct: double;
   fTotalTrnJkyWinPct: double;
   fTrn10WinPct: double;
   fTrn30WinPct: double;
   fTrnTodayWinPct: double;
   fTrnTurfWinPct: double;
   gdtLocalTimeOfRace: TDateTime;
   gbSuppressTimerOn: boolean;
   iDamItmPct: integer;
   iDamItms: integer;
   iDamPlcPct: integer;
   iDamPlcs: integer;
   iDamRoi: integer;
   iDamShoPct: integer;
   iDamShos: integer;
   iDamStarts: integer;
   iDamWinPct: integer;
   iDamWins: integer;
   iGimmicksRace: integer;
   iJockeyItmPct: integer;
   iJockeyItms: integer;
   iJockeyPlcPct: integer;
   iJockeyPlcs: integer;
   iJockeyRoi: integer;
   iJockeyShoPct: integer;
   iJockeyShos: integer;
   iJockeyStarts: integer;
   iJockeyWinPct: integer;
   iJockeyWins: integer;
   iPicksStaCnt: integer;
   iDDRace: integer;
   iPk3Race: integer;
   iPk4Race: integer;
   iPk6Race: integer;
   iProxyPort: integer;
   iSireItmPct: integer;
   iSireItms: integer;
   iSirePlcPct: integer;
   iSirePlcs: integer;
   iSireRoi: integer;
   iSireShoPct: integer;
   iSireShos: integer;
   iSireStarts: integer;
   iSireWinPct: integer;
   iSireWins: integer;
   iSuperRace: integer;
   iTotalTop: integer;
   iTotalTopMaiden: integer;
   iTotalTopMud: integer;
   iTotalTopTurf: integer;
   iTrainerItmPct: integer;
   iTrainerItms: integer;
   iTrainerPlcPct: integer;
   iTrainerPlcs: integer;
   iTrainerRoi: integer;
   iTrainerShoPct: integer;
   iTrainerShos: integer;
   iTrainerStarts: integer;
   iTrainerWinPct: integer;
   iTrainerWins: integer;
   iQuiRace: integer;
   iExaRace: integer;
   iTriRace: integer;
   lwBytesToTransfer: LongWord;
   sDamDbfName: string;
   sDamName: string;
   sDamSireName: string;
   sEntryDbfName: string;
   sFileTrkCode: string;
   dtFileTrkDate: TDateTime;
   sHTML: string;
   sJockeyDbfName: string;
   sMatchupDbfName: string;
   sPastDbfName: string;
   sProxyServer: string;
   sRaceDbfName: string;
   sSireDbfName: string;
   sSireName: string;
   sStatusBar: string;
   sQrySqlStatusSimpleText: string;
   sTrainerDbfName: string;

   sHarnessDriverDbfName: string;
   sHarnessPastDbfName: string;
   sHarnessEntryDbfName: string;
   sHarnessRaceDbfName: string;
   sHarnessTrainerDbfName: string;

   //
   alMorningLineTo1Rank: TLArray;
   adMorningLineTo1Odds: TDArray;
   adMorningLineTo1MinOdds: TDArray;
   adMorningLineTo1MaxOdds: TDArray;

   //
   alLastSpeedRank: TLArray;
   adLastSpeedOdds: TDArray;
   adLastSpeedMinOdds: TDArray;
   adLastSpeedMaxOdds: TDArray;

   //
   alPowerRank: TLArray;
   adPowerOdds: TDArray;
   adPowerMinOdds: TDArray;
   adPowerMaxOdds: TDArray;

   //
   alAvgClassRank: TLArray;
   adAvgClassOdds: TDArray;
   adAvgClassMinOdds: TDArray;
   adAvgClassMaxOdds: TDArray;

   //
   alAvgSpeedRank: TLArray;
   adAvgSpeedOdds: TDArray;
   adAvgSpeedMinOdds: TDArray;
   adAvgSpeedMaxOdds: TDArray;

   //
   alBackSpeedRank: TLArray;
   adBackSpeedOdds: TDArray;
   adBackSpeedMinOdds: TDArray;
   adBackSpeedMaxOdds: TDArray;

   //
//   alFinalWinPctRank: TLArray;
//   adFinalWinPctOdds: TDArray;
//   adFinalWinPctMinOdds: TDArray;
//   adFinalWinPctMaxOdds: TDArray;

   alTodaysWagerWinPctRank: TLArray;
   adTodaysWagerOrderOdds: TDArray;
   adTodaysWagerOrderMinOdds: TDArray;
   adTodaysWagerOrderMaxOdds: TDArray;

   //
//   alPrimaryWinPctRank: TLArray;
//   adPrimaryWinPctOdds: TDArray;
//   adPrimaryWinPctMinOdds: TDArray;
//   adPrimaryWinPctMaxOdds: TDArray;

//   alSecondaryWinPctRank: TLArray;
//   adSecondaryWinPctOdds: TDArray;
//   adSecondaryWinPctMinOdds: TDArray;
//   adSecondaryWinPctMaxOdds: TDArray;

//   alDefaultWinPctRank: TLArray;
//   adDefaultWinPctOdds: TDArray;
//   adDefaultWinPctMinOdds: TDArray;
//   adDefaultWinPctMaxOdds: TDArray;
//
   //
   alQSP1stCallRank: TLArray;
   adQSP1stCallOdds: TDArray;
   adQSP1stCallMinOdds: TDArray;
   adQSP1stCallMaxOdds: TDArray;

   alKSP1stCallRank: TLArray;
   adKSP1stCallOdds: TDArray;
   adKSP1stCallMinOdds: TDArray;
   adKSP1stCallMaxOdds: TDArray;

   //
   alQSP2ndCallRank: TLArray;
   adQSP2ndCallOdds: TDArray;
   adQSP2ndCallMinOdds: TDArray;
   adQSP2ndCallMaxOdds: TDArray;

   alKSP2ndCallRank: TLArray;
   adKSP2ndCallOdds: TDArray;
   adKSP2ndCallMinOdds: TDArray;
   adKSP2ndCallMaxOdds: TDArray;


   //
   alTrnTrackRank: TLArray;
   adTrnTrackOdds: TDArray;
   adTrnTrackMinOdds: TDArray;
   adTrnTrackMaxOdds: TDArray;

   alTrnWinsRank: TLArray;
   adTrnWinsOdds: TDArray;
   adTrnWinsMinOdds: TDArray;
   adTrnWinsMaxOdds: TDArray;

   alTrnEarningsRank: TLArray;
   adTrnEarningsOdds: TDArray;
   adTrnEarningsMinOdds: TDArray;
   adTrnEarningsMaxOdds: TDArray;

   //
   alJkyTrackRank: TLArray;
   adJkyTrackOdds: TDArray;
   adJkyTrackMinOdds: TDArray;
   adJkyTrackMaxOdds: TDArray;

   alJkyWinsRank: TLArray;
   adJkyWinsOdds: TDArray;
   adJkyWinsMinOdds: TDArray;
   adJkyWinsMaxOdds: TDArray;

   alJkyEarningsRank: TLArray;
   adJkyEarningsOdds: TDArray;
   adJkyEarningsMinOdds: TDArray;
   adJkyEarningsMaxOdds: TDArray;

   //
   alOwnWinsRank: TLArray;
   adOwnWinsOdds: TDArray;
   adOwnWinsMinOdds: TDArray;
   adOwnWinsMaxOdds: TDArray;

   alOwnEarningsRank: TLArray;
   adOwnEarningsOdds: TDArray;
   adOwnEarningsMinOdds: TDArray;
   adOwnEarningsMaxOdds: TDArray;

   //
   alEarlyPacePosRank: TLArray;
   adEarlyPacePosOdds: TDArray;
   adEarlyPacePosMinOdds: TDArray;
   adEarlyPacePosMaxOdds: TDArray;

   alMiddlePacePosRank: TLArray;
   adMiddlePacePosOdds: TDArray;
   adMiddlePacePosMinOdds: TDArray;
   adMiddlePacePosMaxOdds: TDArray;

   alLatePacePosRank: TLArray;
   adLatePacePosOdds: TDArray;
   adLatePacePosMinOdds: TDArray;
   adLatePacePosMaxOdds: TDArray;

   //
   alEarlyPaceRank: TLArray;
   adEarlyPaceOdds: TDArray;
   adEarlyPaceMinOdds: TDArray;
   adEarlyPaceMaxOdds: TDArray;

   alMiddlePaceRank: TLArray;
   adMiddlePaceOdds: TDArray;
   adMiddlePaceMinOdds: TDArray;
   adMiddlePaceMaxOdds: TDArray;

   alLatePaceRank: TLArray;
   adLatePaceOdds: TDArray;
   adLatePaceMinOdds: TDArray;
   adLatePaceMaxOdds: TDArray;

   //
   alTrfEarlyPaceRank: TLArray;
   adTrfEarlyPaceOdds: TDArray;
   adTrfEarlyPaceMinOdds: TDArray;
   adTrfEarlyPaceMaxOdds: TDArray;

   alTrfMiddlePaceRank: TLArray;
   adTrfMiddlePaceOdds: TDArray;
   adTrfMiddlePaceMinOdds: TDArray;
   adTrfMiddlePaceMaxOdds: TDArray;

   alTrfLatePaceRank: TLArray;
   adTrfLatePaceOdds: TDArray;
   adTrfLatePaceMinOdds: TDArray;
   adTrfLatePaceMaxOdds: TDArray;

   //
   alMudEarlyPaceRank: TLArray;
   adMudEarlyPaceOdds: TDArray;
   adMudEarlyPaceMinOdds: TDArray;
   adMudEarlyPaceMaxOdds: TDArray;

   alMudMiddlePaceRank: TLArray;
   adMudMiddlePaceOdds: TDArray;
   adMudMiddlePaceMaxOdds: TDArray;
   adMudMiddlePaceMinOdds: TDArray;

   alMudLatePaceRank: TLArray;
   adMudLatePaceOdds: TDArray;
   adMudLatePaceMinOdds: TDArray;
   adMudLatePaceMaxOdds: TDArray;

   //
   alDamAllWinPctRank: TLArray;
   adDamAllWinPctOdds: TDArray;
   adDamAllWinPctMinOdds: TDArray;
   adDamAllWinPctMaxOdds: TDArray;

   alDamAllTurfWinPctRank: TLArray;
   adDamAllTurfWinPctOdds: TDArray;
   adDamAllTurfWinPctMinOdds: TDArray;
   adDamAllTurfWinPctMaxOdds: TDArray;

   alDamAllMudWinPctRank: TLArray;
   adDamAllMudWinPctOdds: TDArray;
   adDamAllMudWinPctMinOdds: TDArray;
   adDamAllMudWinPctMaxOdds: TDArray;

   //
   alSireAllWinPctRank: TLArray;
   adSireAllWinPctOdds: TDArray;
   adSireAllTurfWinPctOdds: TDArray;
   adSireAllMudWinPctOdds: TDArray;

   alSireAllTurfWinPctRank: TLArray;
   adSireAllWinPctMinOdds: TDArray;
   adSireAllTurfWinPctMinOdds: TDArray;
   adSireAllMudWinPctMinOdds: TDArray;

   alSireAllMudWinPctRank: TLArray;
   adSireAllWinPctMaxOdds: TDArray;
   adSireAllTurfWinPctMaxOdds: TDArray;
   adSireAllMudWinPctMaxOdds: TDArray;

   //
   alDamSireAllWinPctRank: TLArray;
   adDamSireAllWinPctOdds: TDArray;
   adDamSireAllWinPctMinOdds: TDArray;
   adDamSireAllWinPctMaxOdds: TDArray;

   alDamSireAllTurfWinPctRank: TLArray;
   adDamSireAllTurfWinPctOdds: TDArray;
   adDamSireAllTurfWinPctMinOdds: TDArray;
   adDamSireAllTurfWinPctMaxOdds: TDArray;

   alDamSireAllMudWinPctRank: TLArray;
   adDamSireAllMudWinPctOdds: TDArray;
   adDamSireAllMudWinPctMinOdds: TDArray;
   adDamSireAllMudWinPctMaxOdds: TDArray;

   //
   alFDLRank: TLArray;
   adFDLOdds: TDArray;
   adFDLMinOdds: TDArray;
   adFDLMaxOdds: TDArray;

   alFDL0Rank: TLArray;
   adFDL0Odds: TDArray;
   adFDL0MinOdds: TDArray;
   adFDL0MaxOdds: TDArray;

   alFDL1Rank: TLArray;
   adFDL1Odds: TDArray;
   adFDL1MinOdds: TDArray;
   adFDL1MaxOdds: TDArray;

   alFDL2Rank: TLArray;
   adFDL2Odds: TDArray;
   adFDL2MinOdds: TDArray;
   adFDL2MaxOdds: TDArray;

   alFDL3Rank: TLArray;
   adFDL3Odds: TDArray;
   adFDL3MinOdds: TDArray;
   adFDL3MaxOdds: TDArray;

   alBDLRank: TLArray;
   adBDLOdds: TDArray;
   adBDLMinOdds: TDArray;
   adBDLMaxOdds: TDArray;

   alBDL0Rank: TLArray;
   adBDL0Odds: TDArray;
   adBDL0MinOdds: TDArray;
   adBDL0MaxOdds: TDArray;

   alBDL1Rank: TLArray;
   adBDL1Odds: TDArray;
   adBDL1MinOdds: TDArray;
   adBDL1MaxOdds: TDArray;

   alBDL2Rank: TLArray;
   adBDL2Odds: TDArray;
   adBDL2MinOdds: TDArray;
   adBDL2MaxOdds: TDArray;

   alBDL3Rank: TLArray;
   adBDL3Odds: TDArray;
   adBDL3MinOdds: TDArray;
   adBDL3MaxOdds: TDArray;

   //
   alTLRank: TLArray;
   adTLOdds: TDArray;
   adTLMinOdds: TDArray;
   adTLMaxOdds: TDArray;

   alTL0Rank: TLArray;
   adTL0Odds: TDArray;
   adTL0MinOdds: TDArray;
   adTL0MaxOdds: TDArray;

   alTL1Rank: TLArray;
   adTL1Odds: TDArray;
   adTL1MinOdds: TDArray;
   adTL1MaxOdds: TDArray;

   alTL2Rank: TLArray;
   adTL2Odds: TDArray;
   adTL2MinOdds: TDArray;
   adTL2MaxOdds: TDArray;

   alTL3Rank: TLArray;
   adTL3Odds: TDArray;
   adTL3MinOdds: TDArray;
   adTL3MaxOdds: TDArray;

   alTrfFDLRank: TLArray;
   adTrfFDLOdds: TDArray;
   adTrfFDLMinOdds: TDArray;
   adTrfFDLMaxOdds: TDArray;

   alTrfFDL0Rank: TLArray;
   adTrfFDL0Odds: TDArray;
   adTrfFDL0MinOdds: TDArray;
   adTrfFDL0MaxOdds: TDArray;

   alTrfFDL1Rank: TLArray;
   adTrfFDL1Odds: TDArray;
   adTrfFDL1MinOdds: TDArray;
   adTrfFDL1MaxOdds: TDArray;

   alTrfFDL2Rank: TLArray;
   adTrfFDL2Odds: TDArray;
   adTrfFDL2MinOdds: TDArray;
   adTrfFDL2MaxOdds: TDArray;

   alTrfFDL3Rank: TLArray;
   adTrfFDL3Odds: TDArray;
   adTrfFDL3MinOdds: TDArray;
   adTrfFDL3MaxOdds: TDArray;

   //
   alTrfBDLRank: TLArray;
   adTrfBDLOdds: TDArray;
   adTrfBDLMinOdds: TDArray;
   adTrfBDLMaxOdds: TDArray;

   alTrfBDL0Rank: TLArray;
   adTrfBDL0Odds: TDArray;
   adTrfBDL0MinOdds: TDArray;
   adTrfBDL0MaxOdds: TDArray;

   alTrfBDL1Rank: TLArray;
   adTrfBDL1Odds: TDArray;
   adTrfBDL1MinOdds: TDArray;
   adTrfBDL1MaxOdds: TDArray;

   alTrfBDL2Rank: TLArray;
   adTrfBDL2Odds: TDArray;
   adTrfBDL2MinOdds: TDArray;
   adTrfBDL2MaxOdds: TDArray;

   alTrfBDL3Rank: TLArray;
   adTrfBDL3Odds: TDArray;
   adTrfBDL3MinOdds: TDArray;
   adTrfBDL3MaxOdds: TDArray;

   //
   alTrfTLRank: TLArray;
   adTrfTLOdds: TDArray;
   adTrfTLMinOdds: TDArray;
   adTrfTLMaxOdds: TDArray;

   alTrfTL0Rank: TLArray;
   adTrfTL0Odds: TDArray;
   adTrfTL0MinOdds: TDArray;
   adTrfTL0MaxOdds: TDArray;

   alTrfTL1Rank: TLArray;
   adTrfTL1Odds: TDArray;
   adTrfTL1MinOdds: TDArray;
   adTrfTL1MaxOdds: TDArray;

   alTrfTL2Rank: TLArray;
   adTrfTL2Odds: TDArray;
   adTrfTL2MinOdds: TDArray;
   adTrfTL2MaxOdds: TDArray;

   alTrfTL3Rank: TLArray;
   adTrfTL3Odds: TDArray;
   adTrfTL3MinOdds: TDArray;
   adTrfTL3MaxOdds: TDArray;

   //
   alMudFDLRank: TLArray;
   adMudFDLOdds: TDArray;
   adMudFDLMinOdds: TDArray;
   adMudFDLMaxOdds: TDArray;

   alMudFDL0Rank: TLArray;
   adMudFDL0Odds: TDArray;
   adMudFDL0MinOdds: TDArray;
   adMudFDL0MaxOdds: TDArray;

   alMudFDL1Rank: TLArray;
   adMudFDL1Odds: TDArray;
   adMudFDL1MinOdds: TDArray;
   adMudFDL1MaxOdds: TDArray;

   alMudFDL2Rank: TLArray;
   adMudFDL2Odds: TDArray;
   adMudFDL2MinOdds: TDArray;
   adMudFDL2MaxOdds: TDArray;

   alMudFDL3Rank: TLArray;
   adMudFDL3Odds: TDArray;
   adMudFDL3MinOdds: TDArray;
   adMudFDL3MaxOdds: TDArray;

   //
   alMudBDLRank: TLArray;
   adMudBDLOdds: TDArray;
   adMudBDLMinOdds: TDArray;
   adMudBDLMaxOdds: TDArray;

   alMudBDL0Rank: TLArray;
   adMudBDL0Odds: TDArray;
   adMudBDL0MinOdds: TDArray;
   adMudBDL0MaxOdds: TDArray;

   alMudBDL1Rank: TLArray;
   adMudBDL1Odds: TDArray;
   adMudBDL1MinOdds: TDArray;
   adMudBDL1MaxOdds: TDArray;

   alMudBDL2Rank: TLArray;
   adMudBDL2Odds: TDArray;
   adMudBDL2MinOdds: TDArray;
   adMudBDL2MaxOdds: TDArray;

   alMudBDL3Rank: TLArray;
   adMudBDL3Odds: TDArray;
   adMudBDL3MinOdds: TDArray;
   adMudBDL3MaxOdds: TDArray;

   //
   alMudTLRank: TLArray;
   adMudTLOdds: TDArray;
   adMudTLMinOdds: TDArray;
   adMudTLMaxOdds: TDArray;

   alMudTL0Rank: TLArray;
   adMudTL0Odds: TDArray;
   adMudTL0MinOdds: TDArray;
   adMudTL0MaxOdds: TDArray;

   alMudTL1Rank: TLArray;
   adMudTL1Odds: TDArray;
   adMudTL1MinOdds: TDArray;
   adMudTL1MaxOdds: TDArray;

   alMudTL2Rank: TLArray;
   adMudTL2Odds: TDArray;
   adMudTL2MinOdds: TDArray;
   adMudTL2MaxOdds: TDArray;

   alMudTL3Rank: TLArray;
   adMudTL3Odds: TDArray;
   adMudTL3MinOdds: TDArray;
   adMudTL3MaxOdds: TDArray;

   gbTest: boolean;
   gbFilesToImportFound: boolean;

   LINER_FILTER_YOUBET: string;
   LINER_FILTER: string;
   SPEED_FILTER: string;
   BRED_1ST_FILTER: string;
   BRED_TURF_FILTER: string;
   BRED_2YO_FILTER: string;

   DOLLAR_FILTER: string;
   YOUBET_WAGER_FILTER: string;
   PTC_WAGER_FILTER: string;
   WAGER_FILTER: string;
   WAGER_FILTER_ALL: string;
   WAGER_FILTER_OVLY: string;
   TOP_PICK_FILTER: string;

   LOG_PATH: string;
   LOG_FILENAME: string;
   EXCEPTION_LOG_FILENAME: string;
   STATS_LOG_FILENAME: string;
   TSN_LOG_FILENAME: string;
   EQUIBASE_LOG_FILENAME: string;
   AXCIS_LOG_FILENAME: string;
   BLOODHORSE_LOG_FILENAME: string;

   DATA_PATH: string;
   DATA_BUGGY_PATH: string;
   SQL_PATH: string;
   //  MEM_PATH: String;
   AXCIS_PATH: string;
   AXCIS_BUGGY_PATH: string;
   ALT_AXCIS_PATH: string;
   SAVE_AXCIS_PATH: string;

   TSN_MCP_PATH: string;
   TSN_XRD_PATH: string;

   HDW_JCP_PATH: string;
   HDW_XRD_PATH: string;

   dtAltLastDateToProcess: TDateTime;
   dtAltFirstDateToProcess: TDateTime;
   dtAltStartDateProcessed: TDateTime;
   dtAltStopDateProcessed: TDateTime;
   gedtOverrideDate: TDateTime;

   bUseEquibase: boolean;
   bUseDRF: boolean;

   BACKUP_PATH: string;

   BACKUP_BUGGY_PATH: string;
   USTA_CHARTS_PATH: string;
   SC_CHARTS_PATH: string;

   TRACK_SELECTION_PATH: string;

   EQUIBASE_STATS_PATH: string;
   EQUIBASE_TRACK_LEADERS_PATH: string;

   TSN_STATS_PATH: string;
   TSN_LSC_PATH: string;

   BLOODHORSE_SIRES_PATH: string;

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
   PDF_HOSPITAL_REPORT2_PATH: string;
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

   EXPORT_REPORT_PATH: string;
   LOCATION: string;
   DAYS_TO_REPROCESS: integer;
   DATE_STATS_UPDATED_TO: TDateTime;
   DATE_FINAL_ORDER_UPDATED_TO: TDateTime;


function IsValidZip(sFileName: string): boolean;

function atoi(sIn: string): Integer;
function atol(sIn: string): Longint;
function atow(sIn: string): Word;
function atof(sIn: string): Double;

function ExecuteSQL(const ADir, ASQL: string): Integer;

function StringListTrim(const Search: string): string;
function GetWODistanceDesc(iDistanceInFeet: Integer): string;
function GetPastFurlongs(sDistanceDesc: string): double;
function GetMonthDesc(iMonth: Integer): string;
function GetFeetDistanceDesc(iDistanceInFeet: Integer): string;
function GetMorningLineDesc(fOdds: double): string;
function GetMorningLineProbability(fOdds: double): double;
function GetProgramNbrSort(sProgNbrIn: string): Integer;
function GetYardDistanceDesc(iDistanceInYards: Integer): string;
function GetFurlongDistanceDesc(fDistanceInFurlongs: double): string;
function GetAxcisSurface(sIn: string): string;
function GetRaceClass(sIn: string): string;
function GetTSNSurface(sIn: string): string;
function GetTSNRaceDesc(sIn: string): string;
function GetTSNRaceClass(sIn: string): string;
function StringToCaseSelect(Selector: string; CaseList: array of string): Integer;
function CleanEntryNbrs(sWagerIn: string): string;

procedure UpdateStatusBar(sMsg: string);
procedure ClearPrgStatusBars();
procedure IncPrgBar(); overload;
procedure IncPrgBar(wCount: Word); overload;
procedure InitPrgBar(lCount: longint);
procedure CheckProxy();

function HtmlExtractText(const s: string; bWriteTags: boolean; bNewLineAfterTR_ID: boolean; bNewLineAfterTD_ID: boolean; bNewLineAfterHR_ID: boolean): string;
function HtmlExtractHREF(const s: string; bWriteTags: boolean; bNewLineAfterTR_ID: boolean; bNewLineAfterTD_ID: boolean; bNewLineAfterHR_ID: boolean): string;
function SkipThisHHRecord(tblR: TDBISAMTable; tblH: TDBISAMTable): boolean;
procedure SummaryFlds(tblH: TDBISAMTable; memS: TDBISAMTable);

procedure InitDownloadLabels();
procedure UpdateDownloadLabels(sServerFullFileName: string; sDownloadFullFileName: string);
procedure ClearDownloadLabels();
procedure ParseLogFileForExceptions();

procedure SetRaceEntriesKey(tblR: TDBISAMTable; tblE: TDBISAMTable);
procedure SetRatingsEntriesKey(tblR: TDBISAMTable; tblE: TDBISAMTable);

procedure UpdateEntriesProgressStatusBar(tbl: TDBISAMTable; sHeading: string; staBar: TStatusBar; prgBar: TcxProgressBar); overload;
procedure UpdateEntriesProgressStatusBar(tbl: TDBISAMTable; sHeading: string); overload;

procedure UpdateRacesProgressStatusBar(tbl: TDBISAMTable; sHeading: string); overload;
procedure UpdateRacesProgressStatusBar(tbl: TDBISAMTable; sHeading: string; staBar: TStatusBar; prgBar: TcxProgressBar); overload;


procedure TimerOn(bOn: boolean);
function ExtractRar(sFileName: string): boolean;

procedure CreateLoadMemTables(tblR: TDBISAMTable; tblE: TDBISAMTable; memR: TDBISAMTable; memE: TDBISAMTable);
procedure SaveDeleteMemTables(tblR: TDBISAMTable; tblE: TDBISAMTable; memR: TDBISAMTable; memE: TDBISAMTable);


function InitLArray(aL: TLArray): TLArray;
function InitDArray(aD: TDArray): TDArray;
function InitMinDArray(aD: TDArray): TDArray;
function InitMaxDArray(aD: TDArray): TDArray;
function IncLDArray(fOdds: double; aD: TDArray; aL: TLArray; iRow: integer; iCol: integer): TLArray;
function IncLArray(aL: TLArray; iRow: integer; iCol: integer): TLArray;
function IncDArray(fOdds: double; aD: TDArray; iRow: integer; iCol: integer): TDArray;
function IncMaxDArray(fOdds: double; aMaxD: TDArray; iRow: integer; iCol: integer): TDArray;
function IncMinDArray(fOdds: double; aMinD: TDArray; iRow: integer; iCol: integer): TDArray;
procedure InitRankingArrays();
procedure IncLinerArrays(tblR: TDBISAMTable; tblE: TDBISAMTable);
procedure IncOtherArrays(tblR: TDBISAMTable; tblE: TDBISAMTable);

function SkipThisRecordForRankings(tblR: TDBISAMTable; tblH: TDBISAMTable): boolean;

implementation

uses StrMan, FastStringFuncs, FastStrings, FormMain, Math;

function atoi(sIn: string): Integer;
var
   I: Integer;
   C: Integer;

begin
   Result := 0;
   try
      Val(sIn, I, C);
      if C <> 0 then
         Result := 0
      else

         Result := I;
      if Result > 32678 then begin
         Result := 0;
      end;
   except
   end;

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

function StringListTrim(const Search: ansistring): ansistring;
var
   Index: byte;
   lenSearch: integer;
const
   BlackSpace = [#33..#126];
begin
   Index := 1;
   while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
      Index := Index + 1;

   //   Result := Copy(Search, Index, Length(Search) - Index);
   Result := Copy(Search, Index, 255);
   Index := Length(Result);
   while (Index > 0) and not (Result[Index] in BlackSpace) do
      Index := Index - 1;
   Result := Copy(Result, 1, Index);
   // Result := Copy(Result, 1, Length(Result));
end;

function GetProgramNbrSort(sProgNbrIn: string): Integer;
var
   sProgNbr: string;

begin

   sProgNbr := Trim(UpperCase(sProgNbrIn));

   Result := 0;

   if sProgNbr = '1' then
      Result := 100;
   if sProgNbr = '2' then
      Result := 200;
   if sProgNbr = '3' then
      Result := 300;
   if sProgNbr = '4' then
      Result := 400;
   if sProgNbr = '5' then
      Result := 500;
   if sProgNbr = '6' then
      Result := 600;
   if sProgNbr = '7' then
      Result := 700;
   if sProgNbr = '8' then
      Result := 800;
   if sProgNbr = '9' then
      Result := 900;
   if sProgNbr = '10' then
      Result := 1000;
   if sProgNbr = '11' then
      Result := 1100;
   if sProgNbr = '12' then
      Result := 1200;
   if sProgNbr = '13' then
      Result := 1300;
   if sProgNbr = '14' then
      Result := 1400;
   if sProgNbr = '15' then
      Result := 1500;
   if sProgNbr = '16' then
      Result := 1600;
   if sProgNbr = '17' then
      Result := 1700;
   if sProgNbr = '18' then
      Result := 1800;
   if sProgNbr = '19' then
      Result := 1900;
   if sProgNbr = '20' then
      Result := 2000;

   if sProgNbr = '1A' then
      Result := 101;
   if sProgNbr = '1B' then
      Result := 102;
   if sProgNbr = '1C' then
      Result := 103;
   if sProgNbr = '1F' then
      Result := 106;
   if sProgNbr = '1X' then
      Result := 124;

   if sProgNbr = '2A' then
      Result := 201;
   if sProgNbr = '2B' then
      Result := 202;
   if sProgNbr = '2C' then
      Result := 203;
   if sProgNbr = '2F' then
      Result := 206;
   if sProgNbr = '2X' then
      Result := 224;

   if sProgNbr = '3A' then
      Result := 301;
   if sProgNbr = '3B' then
      Result := 302;
   if sProgNbr = '3C' then
      Result := 303;
   if sProgNbr = '3F' then
      Result := 306;
   if sProgNbr = '3X' then
      Result := 324;

   if sProgNbr = '11A' then
      Result := 1101;
   if sProgNbr = '11B' then
      Result := 1102;
   if sProgNbr = '11C' then
      Result := 1103;
   if sProgNbr = '11D' then
      Result := 1104;
   if sProgNbr = '11E' then
      Result := 1105;
   if sProgNbr = '11F' then
      Result := 1106;
   if sProgNbr = '11G' then
      Result := 1107;
   if sProgNbr = '11X' then
      Result := 1124;

   if sProgNbr = '10A' then
      Result := 1001;
   if sProgNbr = '10B' then
      Result := 1002;
   if sProgNbr = '10C' then
      Result := 1003;
   if sProgNbr = '10D' then
      Result := 1004;
   if sProgNbr = '10E' then
      Result := 1005;
   if sProgNbr = '10F' then
      Result := 1006;
   if sProgNbr = '10G' then
      Result := 1007;
   if sProgNbr = '10X' then
      Result := 1024;

   if sProgNbr = '12A' then
      Result := 1201;
   if sProgNbr = '12B' then
      Result := 1202;
   if sProgNbr = '12C' then
      Result := 1203;
   if sProgNbr = '12D' then
      Result := 1204;
   if sProgNbr = '12E' then
      Result := 1205;
   if sProgNbr = '12F' then
      Result := 1206;
   if sProgNbr = '12G' then
      Result := 1207;
   if sProgNbr = '12X' then
      Result := 1224;

   if sProgNbr = '13A' then
      Result := 1301;
   if sProgNbr = '13B' then
      Result := 1302;
   if sProgNbr = '13C' then
      Result := 1303;
   if sProgNbr = '13D' then
      Result := 1304;
   if sProgNbr = '13E' then
      Result := 1305;
   if sProgNbr = '13F' then
      Result := 1306;
   if sProgNbr = '13G' then
      Result := 1307;
   if sProgNbr = '13X' then
      Result := 1324;

   if sProgNbr = '14A' then
      Result := 1401;
   if sProgNbr = '14B' then
      Result := 1402;
   if sProgNbr = '14C' then
      Result := 1403;
   if sProgNbr = '14D' then
      Result := 1404;
   if sProgNbr = '14E' then
      Result := 1405;
   if sProgNbr = '14F' then
      Result := 1406;
   if sProgNbr = '14G' then
      Result := 1407;
   if sProgNbr = '14X' then
      Result := 1424;

   if sProgNbr = '15A' then
      Result := 1501;
   if sProgNbr = '15B' then
      Result := 1502;
   if sProgNbr = '15C' then
      Result := 1503;
   if sProgNbr = '15D' then
      Result := 1504;
   if sProgNbr = '15E' then
      Result := 1505;
   if sProgNbr = '15F' then
      Result := 1506;
   if sProgNbr = '15G' then
      Result := 1507;
   if sProgNbr = '15X' then
      Result := 1524;

   if sProgNbr = 'AE1' then
      Result := 2001;
   if sProgNbr = 'AE2' then
      Result := 2002;
   if sProgNbr = 'AE3' then
      Result := 2003;
   if sProgNbr = 'AE4' then
      Result := 2004;
   if sProgNbr = 'AE5' then
      Result := 2005;

end;

function GetMonthDesc(iMonth: Integer): string;
begin

   case iMonth of
      1: Result := 'Jan';
      2: Result := 'Feb';
      3: Result := 'Mar';
      4: Result := 'Apr';
      5: Result := 'May';
      6: Result := 'Jun';
      7: Result := 'Jul';
      8: Result := 'Aug';
      9: Result := 'Sep';
      10: Result := 'Oct';
      11: Result := 'Nov';
      12: Result := 'Dec';
   else
      Result := 'UNK';
   end;

end;

function GetFeetDistanceDesc(iDistanceInFeet: Integer): string;
begin

   case iDistanceInFeet of
      110: Result := '.5f';
      220: Result := '1f';
      330: Result := '1.5f';
      440: Result := '2f';
      550: Result := '2.5f';
      660: Result := '3f';
      770: Result := '3.5f';
      880: Result := '4f';
      990: Result := '4.5f';
      1100: Result := '5f';
      1210: Result := '5.5f';
      1320: Result := '6f';
      1430: Result := '6.5f';
      1540: Result := '7f';
      1650: Result := '7.5f';
      1760: Result := '1m';
      1870: Result := '1 1/16m';
   else
      Result := IntToStr(iDistanceInFeet);
   end;

end;

function GetWODistanceDesc(iDistanceInFeet: Integer): string;
begin
   case iDistanceInFeet of
      110: Result := '.5f ';
      220: Result := '1f  ';
      330: Result := '1.5f';
      440: Result := '2f  ';
      550: Result := '2.5f';
      660: Result := '3f  ';
      770: Result := '3.5f';
      880: Result := '4f  ';
      990: Result := '4.5f';
      1100: Result := '5f  ';
      1210: Result := '5.5f';
      1320: Result := '6f  ';
      1430: Result := '6.5f';
      1540: Result := '7f  ';
      1650: Result := '7.5f';
      1760: Result := '1m  ';
      1870: Result := '1 1/16m';
   else
      Result := IntToStr(iDistanceInFeet);
   end;


end;


function GetMorningLineProbability(fOdds: double): double;
var
   sOdds: string;

begin


   Result := 0.001;
   if fOdds >= 0 then begin
      Result := 1 / (1 + fOdds);
   end;

end;

function GetMorningLineDesc(fOdds: double): string;
var
   sOdds: string;
   iOdds: integer;

begin


   sOdds := Format('%1.1f', [fOdds]);

   if sOdds = '0.1' then begin
      Result := '1-9';
      exit;
   end;

   if sOdds = '0.2' then begin
      Result := '1-5';
      exit;
   end;

   if sOdds = '0.4' then begin
      Result := '2-5';
      exit;
   end;

   if sOdds = '0.6' then begin
      Result := '3-5';
      exit;
   end;

   if sOdds = '0.8' then begin
      Result := '4-5';
      exit;
   end;

   if sOdds = '1' then begin
      Result := '1-1';
      exit;
   end;

   if fOdds = 1 then begin
      Result := '1-1';
      exit;
   end;

   if sOdds = '1.2' then begin
      Result := '6-5';
      exit;
   end;

   if sOdds = '1.4' then begin
      Result := '7-5';
      exit;
   end;

   if sOdds = '1.5' then begin
      Result := '3-2';
      exit;
   end;

   if sOdds = '1.6' then begin
      Result := '8-5';
      exit;
   end;

   if sOdds = '1.8' then begin
      Result := '9-5';
      exit;
   end;

   if (sOdds = '2') or (fOdds = 2) then begin
      Result := '2-1';
      exit;
   end;

   if sOdds = '2.5' then begin
      Result := '5/2';
      exit;
   end;

   if (sOdds = '3') or (fOdds = 3) then begin
      Result := '3-1';
      exit;
   end;

   if sOdds = '3.5' then begin
      Result := '7/2';
      exit;
   end;

   if (sOdds = '4') or (fOdds = 4) then begin
      Result := '4-1';
      exit;
   end;

   if sOdds = '4.5' then begin
      Result := '9/2';
      exit;
   end;

   if fOdds >= 5 then begin
      begin
         iOdds := Trunc(fOdds);
         sOdds := Format('%3d', [iOdds]);
         Result := (Trim(sOdds) + '-1');
         exit;
      end;
   end;

   Result := 'UNK';
end;

function GetYardDistanceDesc(iDistanceInYards: Integer): string;
var
   bAboutDistance: boolean;
   iDistance: Integer;
begin

   if (iDistanceInYards < 0) then begin
      iDistance := iDistanceInYards * -1;
      bAboutDistance := True;
   end else begin
      bAboutDistance := False;
   end;

   case iDistance of
      110: Result := '.5f';
      (110 * 2): Result := '1f';
      (110 * 3): Result := '1.5f';
      350: Result := '350y';
      400: Result := '400y';
      800: Result := '800y';
      (110 * 4): Result := '2f';
      (110 * 5): Result := '2.5f';
      (110 * 6): Result := '3f';
      (110 * 7): Result := '3.5f';
      (110 * 8): Result := '4f';
      (110 * 9): Result := '4.5f';
      (110 * 10): Result := '5f';
      (110 * 11): Result := '5.5f';
      (110 * 12): Result := '6f';
      (110 * 13): Result := '6.5f';
      (110 * 14): Result := '7f';
      (110 * 15): Result := '7.5f';
      (110 * 16): Result := '1m';
      1803: Result := '1m 40y';
      (110 * 16) + 40: Result := '1m 40y';
      1826: Result := '1m 70y';
      (110 * 16) + 70: Result := '1m 70y';
      (110 * 17): Result := '1 1/16m';
      (110 * 18): Result := '1 1/8m';
      (110 * 19): Result := '1 3/16m';
      (110 * 20): Result := '1 1/4m';
      (110 * 21): Result := '1 5/16m';
      (110 * 22): Result := '1 3/8m';
      (110 * 23): Result := '1 7/16m';
      (110 * 24): Result := '1 1/2m';
      (110 * 25): Result := '1 9/16m';
      (110 * 26): Result := '1 5/8m';
      (110 * 27): Result := '1 11/16m';
      (110 * 28): Result := '1 3/4m';
      (110 * 29): Result := '1 13/16m';
      (110 * 30): Result := '1 7/8m';
      (110 * 31): Result := '2m';
      (110 * 32): Result := '2 1/16m';
      (110 * 33): Result := '2 1/8m';
      (110 * 34): Result := '2 3/16m';
      (110 * 35): Result := '2 1/4m';
      (110 * 36): Result := '2 5/16m';
      (110 * 37): Result := '2 3/8m';
      (110 * 38): Result := '2 7/16m';
      (110 * 39): Result := '2 1/2m';
      (110 * 40): Result := '2 9/16m';
      (110 * 41): Result := '2 5/8m';
      (110 * 42): Result := '2 11/16m';
      (110 * 43): Result := '2 3/4m';
      (110 * 44): Result := '2 13/16m';
      (110 * 45): Result := '2 7/8m';
      (110 * 46): Result := '3m';
      (110 * 47): Result := '3 1/16m';
      (110 * 48): Result := '3 1/8m';
      (110 * 49): Result := '3 3/16m';
      (110 * 50): Result := '3 1/4m';
      (110 * 51): Result := '3 5/16m';
      (110 * 52): Result := '3 3/8m';
      (110 * 53): Result := '3 7/16m';
      (110 * 54): Result := '3 1/2m';
      (110 * 55): Result := '3 9/16m';
      (110 * 56): Result := '3 5/8m';
      (110 * 57): Result := '3 11/16m';
      (110 * 58): Result := '3 3/4m';
      (110 * 59): Result := '3 13/16m';
      (110 * 60): Result := '3 7/8m';
   else
      Result := IntToStr(iDistanceInYards);
   end;

   if (bAboutDistance) then begin
      Result := 'Ab ' + Result;
   end;

end;

function GetFurlongDistanceDesc(fDistanceInFurlongs: double): string;
var
   iDistanceInFurlongs: integer;
begin

   if (fDistanceInFurlongs < 0) then begin
      iDistanceInFurlongs := Trunc((fDistanceInFurlongs * -1) * 10);
   end;

   iDistanceInFurlongs := Trunc(fDistanceInFurlongs * 10);

   case iDistanceInFurlongs of
      82: Result := '1m 40y';
      83: Result := '1m 70y';
      5: Result := '.5f';
      10: Result := '1f';
      15: Result := '1.5f';
      20: Result := '2f';
      25: Result := '2.5f';
      30: Result := '3f';
      35: Result := '3.5f';
      40: Result := '4f';
      45: Result := '4.5f';
      50: Result := '5f';
      55: Result := '5.5f';
      60: Result := '6f';
      65: Result := '6.5f';
      70: Result := '7f';
      75: Result := '7.5f';
      80: Result := '1m';
      85: Result := '1 1/16m';
      90: Result := '1 1/8m';
      95: Result := '1 3/16m';
      100: Result := '1 1/4m';
      105: Result := '1 5/16m';
      110: Result := '1 3/8m';
      115: Result := '1 7/16m';
      120: Result := '1 1/2m';
      125: Result := '1 9/16m';
      130: Result := '1 5/8m';
      135: Result := '1 11/16m';
      140: Result := '1 3/4m';
      145: Result := '1 13/16m';
      150: Result := '1 7/8m';
      155: Result := '1 15/16m';
      160: Result := '2m';
      165: Result := '2 1/16m';
      170: Result := '2 1/8m';
      175: Result := '2 3/16m';
      180: Result := '2 1/4m';
      185: Result := '2 5/16m';
      190: Result := '2 3/8m';
      195: Result := '2 7/16m';
      200: Result := '2 1/2m';
      205: Result := '2 9/16m';
      210: Result := '2 5/8m';
      215: Result := '2 11/16m';
      220: Result := '2 3/4m';
      225: Result := '2 13/16m';
      230: Result := '2 7/8m';
      235: Result := '2 15/16m';
      240: Result := '3m';
      245: Result := '3 1/16m';
      250: Result := '3 1/8m';
      255: Result := '3 3/16m';
      260: Result := '3 1/4m';
      265: Result := '3 5/16m';
      270: Result := '3 3/8m';
      275: Result := '3 7/16m';
      280: Result := '3 1/2m';
      285: Result := '3 9/16m';
      290: Result := '3 5/8m';
      295: Result := '3 11/16m';
      300: Result := '3 3/4m';
      305: Result := '3 13/16m';
      310: Result := '3 7/8m';
      315: Result := '3 15/16m';
      320: Result := '4m';
   else
      Result := IntToStr(iDistanceInFurlongs);
   end;

end;

function GetRaceClass(sIn: string): string;
begin

   case StringToCaseSelect(sIn,
      ['HC', 'AL', 'CL', 'OC', 'MO', 'MC', 'MS', 'MD', 'SH', 'G1', 'G2', 'G3',
      'ST', 'FT']) of
      0: Result := HCP_RACE;
      1: Result := ALW_RACE;
      2: Result := CLM_RACE;
      3: Result := OCLM_RACE;
      4: Result := MSW_RACE;
      5: Result := MCL_RACE;
      6: Result := MSW_RACE;
      7: Result := MSW_RACE;
      8: Result := SHCP_RACE;
      9: Result := G1_RACE;
      10: Result := G2_RACE;
      11: Result := G3_RACE;
      12: Result := STK_RACE;
      13: Result := FUT_RACE;

   else
      Result := 'CLM';
   end;
end;

function GetTSNRaceClass(sIn: string): string;
begin


   case StringToCaseSelect(sIn,
      ['N', 'A', 'C', 'CO', 'S', 'M', 'G1', 'G2', 'G3', 'N', 'T', 'R']) of
      0: Result := HCP_RACE;
      1: Result := ALW_RACE;
      2: Result := CLM_RACE;
      3: Result := OCLM_RACE;
      4: Result := MSW_RACE;
      5: Result := MCL_RACE;
      9: Result := G1_RACE;
      10: Result := G2_RACE;
      11: Result := G3_RACE;
      12: Result := STK_RACE;
      13: Result := SHCP_RACE;
      14: Result := SALW_RACE;

   else
      Result := 'CLM';
   end;
end;

function GetTSNRaceDesc(sIn: string): string;
begin

   Result := 'Unknown';
   if sIn = 'N' then begin
      Result := 'Handicap';
   end;

   if sIn = 'A' then begin
      Result := 'Allowance';
   end;

   if sIn = 'C' then begin
      Result := 'Claiming';
   end;

   if sIn = 'OC' then begin
      Result := 'Optional Claiming';
   end;

   if sIn = 'M' then begin
      Result := 'Maiden Claiming';
   end;

   if sIn = 'S' then begin
      Result := 'Maiden Special Weight';
   end;

   if sIn = 'G1' then begin
      Result := 'Grade I';
   end;

   if sIn = 'G2' then begin
      Result := 'Grade II';
   end;

   if sIn = 'G3' then begin
      Result := 'Grade III';
   end;

   if sIn = 'ST' then begin
      Result := 'Stake';
   end;

end;

function GetTSNSurface(sIn: string): string;
begin

   case StringToCaseSelect(sIn,
      ['D', 'T', 'd', 't', 's', 'h', 'A']) of

      0: Result := 'D';
      1: Result := 'T';
      2: Result := 'D';
      3: Result := 'T';
      4: Result := 'T';
      5: Result := 'T';
      6: Result := 'A';
   else
      Result := 'D';
   end;

end;

function GetAxcisSurface(sIn: string): string;
begin

   // SURFACE
   // D                    D-Dirt
   // E                    D-Equitrack
   // F                    D-Dirt training
   // N                    D-Inner track
   // B                    T-Timber
   // C                    T-Downhill turf course
   // G                    T-Turf training
   // I                    T-Inner turf
   // J                    T-Jump race
   // M                    T-Hurdle
   // S                    T-Steeplechase
   // T                    T-Turf
   // U                    T-Hunt on turf
   // V                    T-Hunt Flat (Weatherbys only)

   case StringToCaseSelect(sIn,
      ['D', 'N', 'T', 'I', 'C', 'B', 'S', 'G', 'O', 'E']) of

      0: Result := 'D';
      1: Result := 'D';
      2: Result := 'T';
      3: Result := 'T';
      4: Result := 'T';
      5: Result := 'T';
      6: Result := 'T';
      7: Result := 'T';
      8: Result := 'T';
      9: Result := 'D';
   else
      Result := 'D';
   end;
end;

function StringToCaseSelect(Selector: string; CaseList: array of string): integer;
var
   Cnt: integer;
begin
   Result := -1;
   for Cnt := 0 to length(CaseList) - 1 do begin
      if Sm.IsSame(Selector, CaseList[Cnt]) then begin
         Result := Cnt;
         Break;
      end
   end;
end;

function GetWagerNbr(sProgNbrIn: string): Integer;
var
   sProgNbr: string;

begin

   sProgNbr := Trim(UpperCase(sProgNbrIn));

   Result := 0;

   if sProgNbr = '1' then
      Result := 1;
   if sProgNbr = '2' then
      Result := 2;
   if sProgNbr = '3' then
      Result := 3;
   if sProgNbr = '4' then
      Result := 4;
   if sProgNbr = '5' then
      Result := 5;
   if sProgNbr = '6' then
      Result := 6;
   if sProgNbr = '7' then
      Result := 7;
   if sProgNbr = '8' then
      Result := 8;
   if sProgNbr = '9' then
      Result := 9;
   if sProgNbr = '10' then
      Result := 10;
   if sProgNbr = '11' then
      Result := 11;
   if sProgNbr = '12' then
      Result := 12;
   if sProgNbr = '13' then
      Result := 13;
   if sProgNbr = '14' then
      Result := 14;
   if sProgNbr = '15' then
      Result := 15;
   if sProgNbr = '16' then
      Result := 16;
   if sProgNbr = '17' then
      Result := 17;
   if sProgNbr = '18' then
      Result := 18;
   if sProgNbr = '19' then
      Result := 19;
   if sProgNbr = '20' then
      Result := 20;

   if sProgNbr = '1A' then
      Result := 1;
   if sProgNbr = '1B' then
      Result := 1;
   if sProgNbr = '1C' then
      Result := 1;
   if sProgNbr = '1F' then
      Result := 1;
   if sProgNbr = '1X' then
      Result := 1;

   if sProgNbr = '2A' then
      Result := 2;
   if sProgNbr = '2B' then
      Result := 2;
   if sProgNbr = '2C' then
      Result := 2;
   if sProgNbr = '2F' then
      Result := 2;
   if sProgNbr = '2X' then
      Result := 2;

   if sProgNbr = '3A' then
      Result := 3;
   if sProgNbr = '3B' then
      Result := 3;
   if sProgNbr = '3C' then
      Result := 3;
   if sProgNbr = '3F' then
      Result := 3;
   if sProgNbr = '3X' then
      Result := 3;

   if sProgNbr = '11A' then
      Result := 11;
   if sProgNbr = '11B' then
      Result := 11;
   if sProgNbr = '11C' then
      Result := 11;
   if sProgNbr = '11D' then
      Result := 11;
   if sProgNbr = '11E' then
      Result := 11;
   if sProgNbr = '11F' then
      Result := 11;
   if sProgNbr = '11G' then
      Result := 11;
   if sProgNbr = '11X' then
      Result := 11;

   if sProgNbr = '10A' then
      Result := 10;
   if sProgNbr = '10B' then
      Result := 10;
   if sProgNbr = '10C' then
      Result := 10;
   if sProgNbr = '10D' then
      Result := 10;
   if sProgNbr = '10E' then
      Result := 10;
   if sProgNbr = '10F' then
      Result := 10;
   if sProgNbr = '10G' then
      Result := 10;
   if sProgNbr = '10X' then
      Result := 10;

   if sProgNbr = '12A' then
      Result := 12;
   if sProgNbr = '12B' then
      Result := 12;
   if sProgNbr = '12C' then
      Result := 12;
   if sProgNbr = '12D' then
      Result := 12;
   if sProgNbr = '12E' then
      Result := 12;
   if sProgNbr = '12F' then
      Result := 12;
   if sProgNbr = '12G' then
      Result := 12;
   if sProgNbr = '12X' then
      Result := 12;

   if sProgNbr = '13A' then
      Result := 13;
   if sProgNbr = '13B' then
      Result := 13;
   if sProgNbr = '13C' then
      Result := 13;
   if sProgNbr = '13D' then
      Result := 13;
   if sProgNbr = '13E' then
      Result := 13;
   if sProgNbr = '13F' then
      Result := 13;
   if sProgNbr = '13G' then
      Result := 13;
   if sProgNbr = '13X' then
      Result := 13;

   if sProgNbr = '14A' then
      Result := 14;
   if sProgNbr = '14B' then
      Result := 14;
   if sProgNbr = '14C' then
      Result := 14;
   if sProgNbr = '14D' then
      Result := 14;
   if sProgNbr = '14E' then
      Result := 14;
   if sProgNbr = '14F' then
      Result := 14;
   if sProgNbr = '14G' then
      Result := 14;
   if sProgNbr = '14X' then
      Result := 14;

   if sProgNbr = '15A' then
      Result := 15;
   if sProgNbr = '15B' then
      Result := 15;
   if sProgNbr = '15C' then
      Result := 15;
   if sProgNbr = '15D' then
      Result := 15;
   if sProgNbr = '15E' then
      Result := 15;
   if sProgNbr = '15F' then
      Result := 15;
   if sProgNbr = '15G' then
      Result := 15;
   if sProgNbr = '15X' then
      Result := 15;

   if sProgNbr = '16A' then
      Result := 16;
   if sProgNbr = '16B' then
      Result := 16;
   if sProgNbr = '16C' then
      Result := 16;
   if sProgNbr = '16D' then
      Result := 16;
   if sProgNbr = '16E' then
      Result := 16;
   if sProgNbr = '16F' then
      Result := 16;
   if sProgNbr = '16G' then
      Result := 16;
   if sProgNbr = '16X' then
      Result := 16;

end;

function CleanEntryNbrs(sWagerIn: string): string;
var
   sWagerOut: string;

begin

   Result := '';

   //   Result := FastReplace(sWagerIn, 'ALL', '999', False);
   sWagerOut := sWagerIn;
   sWagerOut := FastReplace(sWagerOut, 'A', '', False);
   sWagerOut := FastReplace(sWagerOut, 'B', '', False);
   sWagerOut := FastReplace(sWagerOut, 'C', '', False);
   sWagerOut := FastReplace(sWagerOut, 'D', '', False);
   sWagerOut := FastReplace(sWagerOut, 'E', '', False);
   sWagerOut := FastReplace(sWagerOut, 'F', '', False);
   sWagerOut := FastReplace(sWagerOut, 'X', '', False);
   sWagerOut := FastReplace(sWagerOut, '(', '', False);
   sWagerOut := FastReplace(sWagerOut, ')', '', False);

   Result := sWagerOut;
   //   Result := FastReplace(sWagerIn, '999', 'ALL', False);

end;

function ParseAllNames(sName: string): string;
var
   sTmp: string;
   iEndPos: integer;

begin

   sTmp := sName;
   if SmartPos('(', sTmp) > 1 then begin
      iEndPos := SmartPos('(', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sTmp := sName;
   if SmartPos('&', sTmp) > 7 then begin
      iEndPos := SmartPos('&', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sTmp := sName;
   if SmartPos('/', sTmp) > 7 then begin
      iEndPos := SmartPos('/', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sTmp := sName;
   if SmartPos('[', sTmp) > 7 then begin
      iEndPos := SmartPos('[', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sTmp := sName;
   if SmartPos('-', sTmp) > 10 then begin
      iEndPos := SmartPos('-', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sTmp := sName;
   if SmartPos('|', sTmp) > 10 then begin
      iEndPos := SmartPos('|', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sTmp := sName;
   if SmartPos(' AND ', sTmp) > 10 then begin
      iEndPos := SmartPos(' AND ', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sTmp := sName;
   if SmartPos(' OR ', sTmp) > 7 then begin
      iEndPos := SmartPos(' OR ', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sName := FastReplace(sName, ',', ' ', True);
   sName := FastReplace(sName, ' .A', 'A', True);
   sName := FastReplace(sName, ' .B', 'B', True);
   sName := FastReplace(sName, ' .C', 'C', True);
   sName := FastReplace(sName, ' .D', 'D', True);
   sName := FastReplace(sName, ' .E', 'E', True);
   sName := FastReplace(sName, ' .F', 'F', True);
   sName := FastReplace(sName, ' .G', 'G', True);
   sName := FastReplace(sName, ' .H', 'H', True);
   sName := FastReplace(sName, ' .I', 'I', True);
   sName := FastReplace(sName, ' .J', 'J', True);
   sName := FastReplace(sName, ' .K', 'K', True);
   sName := FastReplace(sName, ' .L', 'L', True);
   sName := FastReplace(sName, ' .M', 'M', True);
   sName := FastReplace(sName, ' .N', 'N', True);
   sName := FastReplace(sName, ' .O', 'O', True);
   sName := FastReplace(sName, ' .P', 'P', True);
   sName := FastReplace(sName, ' .Q', 'Q', True);
   sName := FastReplace(sName, ' .R', 'R', True);
   sName := FastReplace(sName, ' .S', 'S', True);
   sName := FastReplace(sName, ' .T', 'T', True);
   sName := FastReplace(sName, ' .U', 'U', True);
   sName := FastReplace(sName, ' .V', 'V', True);
   sName := FastReplace(sName, ' .W', 'W', True);
   sName := FastReplace(sName, ' .X', 'X', True);
   sName := FastReplace(sName, ' .Y', 'Y', True);
   sName := FastReplace(sName, ' .Z', 'Z', True);
   sName := FastReplace(sName, '"', '', True);
   sName := FastReplace(sName, ' JR', '', True);
   sName := FastReplace(sName, ' SR', '', True);
   sName := FastReplace(sName, '(', '', True);
   sName := FastReplace(sName, ')', '', True);
   sName := FastReplace(sName, '"', '', True);
   sName := FastReplace(sName, '"', '', True);
   sName := FastReplace(sName, ', LTD.', '', True);
   sName := FastReplace(sName, ', LTD.', '', True);
   sName := FastReplace(sName, ' LTD.', '', True);
   sName := FastReplace(sName, ' LTD ', '', True);
   sName := FastReplace(sName, ', INC.', '', True);
   sName := FastReplace(sName, ', INC.', '', True);
   sName := FastReplace(sName, ' INC.', '', True);
   sName := FastReplace(sName, ' INC ', '', True);
   sName := FastReplace(sName, ' INC', '', True);
   sName := FastReplace(sName, 'L.L.C ', '', True);
   sName := FastReplace(sName, ' L.L.C', '', True);
   sName := FastReplace(sName, ' LLC ', '', True);
   sName := FastReplace(sName, ' LLC', '', True);
   sName := FastReplace(sName, ' LLC.', '', True);
   sName := FastReplace(sName, ', ET AL ', '', True);
   sName := FastReplace(sName, ' ET AL ', '', True);
   sName := FastReplace(sName, ' ET AL', '', True);
   sName := FastReplace(sName, ' ,JR. ', '', True);
   sName := FastReplace(sName, ',JR. ', '', True);
   sName := FastReplace(sName, ' JR. ', '', True);
   sName := FastReplace(sName, ' JR', '', True);
   sName := FastReplace(sName, ',SR. ', '', True);
   sName := FastReplace(sName, ' SR. ', '', True);
   sName := FastReplace(sName, ' ,SR. ', '', True);

   sTmp := sName;
   if SmartPos(',', sTmp) > 10 then begin
      iEndPos := SmartPos(',', sTmp);
      sName := CopyStr(sTmp, 1, iEndPos - 1);
   end else begin
      sName := Trim(sTmp);
   end;

   sName := FastReplace(sName, 'CORP.', 'CORP', True);
   sName := FastReplace(sName, 'LIMITED', 'LTD', True);
   sName := FastReplace(sName, 'RACING STABLES', 'STABLE', True);
   sName := FastReplace(sName, 'STABLES LTD', 'STABLE', True);
   sName := FastReplace(sName, 'ADAM M. RUSSO', 'ADAM M RUSSO', True);
   sName := FastReplace(sName, 'ACKERLEY BROS FARM', 'ACKERLEY BROS', True);
   sName := FastReplace(sName, 'ACKERLEY BROS. FARM', 'ACKERLEY BROS', True);
   sName := FastReplace(sName, 'ACKERLEY BROTHERS FARM', 'ACKERLEY BROS', True);
   sName := FastReplace(sName, 'ACKERLEY BROTHERS FARM INC', 'ACKERLEY BROS', True);
   sName := FastReplace(sName, 'ABBOTT OR SCOTT', 'ABBOTT', True);
   sName := FastReplace(sName, 'A. PATRICK MCEVOY', 'A. P. MCEVOY', True);
   sName := FastReplace(sName, 'A. PATRICK MCEVOY SR', 'A. P. MCEVOY', True);

   Result := sName;

end;


procedure UpdateEntriesProgressStatusBar(tbl: TDBISAMTable; sHeading: string; staBar: TStatusBar; prgBar: TcxProgressBar); overload;
begin

   prgBar.Position := prgBar.Position + 1;

   staBar.SimpleText := sHeading +
      tbl.FieldByName('TrkCode').AsString + ' ' +
      tbl.FieldByName('RaceDate').AsString + ' Race # ' +
      tbl.FieldByName('RaceNbr').AsString + ' ' +
      tbl.FieldByName('HorseName').AsString;


end;

procedure UpdateRacesProgressStatusBar(tbl: TDBISAMTable; sHeading: string; staBar: TStatusBar; prgBar: TcxProgressBar); overload;
begin

   prgBar.Position := prgBar.Position + 1;

   staBar.SimpleText := sHeading +
      tbl.FieldByName('TrkCode').AsString + ' ' +
      tbl.FieldByName('RaceDate').AsString + ' Race # ' +
      tbl.FieldByName('RaceNbr').AsString;


end;

procedure InitPrgBar(lCount: longint);
begin

   MainForm.prgBar.Properties.Max := lCount;
   MainForm.prgBar.Position := 0;
   MainForm.prgBar.Width := MainForm.pnlPrgBar.Width - 10;
   MainForm.pnlPrgBar.Visible := True;
   MainForm.pgCtrlMain.ActivePage := MainForm.tabDaily;

end;

procedure UpdateStatusBar(sMsg: string);
begin

   MainForm.staBar.SimpleText := sMsg;

end;

procedure ClearPrgStatusBars();
begin

   MainForm.pnlPrgBar.Visible := False;
   MainForm.staBar.SimpleText := '';

end;

procedure IncPrgBar(); overload;
begin
   MainForm.prgBar.Position := MainForm.prgBar.Position + 1;
end;

procedure IncPrgBar(wCount: Word); overload;
begin
   MainForm.prgBar.Position := wCount;
end;

procedure CheckProxy;
begin

   if bUseProxyServer then begin
      MainForm.idHTTP.ProxyParams.ProxyServer := MainForm.edtProxy.Text;
      MainForm.idHTTP.ProxyParams.ProxyPort := 80;
   end;

end;


function HtmlExtractText(const s: string; bWriteTags: boolean; bNewLineAfterTR_ID: boolean; bNewLineAfterTD_ID: boolean; bNewLineAfterHR_ID: boolean): string;
var
   HtmlParser: TDIHtmlParser;
   HtmlWriter: TDIHtmlWriterPlugin;
   i: Integer;
begin
   { Create a HTML Parser object. }
   HtmlParser := TDIHtmlParser.Create(nil);
   HtmlParser.FilterText := fiShow;
   HtmlParser.NormalizeWhiteSpace := True;

   { Create a Writer Plugin and assign it to out HtmlParser. The Writer will
     store the extracted text for later retrival. At this stage, the Writer
     Plugin does not write anything automatically. We will switch the automatic
     writing on once the parser finds the first text which is not white space. }
   HtmlWriter := TDIHtmlWriterPlugin.Create(nil);
   HtmlWriter.HtmlParser := HtmlParser;

   HtmlParser.SourceBufferAsStrA := s;

   while HtmlParser.ParseNextPiece do
      case HtmlParser.PieceType of
         ptHtmlTag:
            { Triggered if the parse has encountered simple text formatting tags
              which we directly convert to single or double line breaks. }
            case HtmlParser.HtmlTag.TagID of
               TAG_HR_ID: begin
                     HtmlWriter.Writer.WriteStrA('Race-');
                  end;

               TAG_TR_ID: begin
                     HtmlWriter.Writer.WriteLineBreak;
                  end;

               TAG_TD_ID: begin
                     HtmlWriter.Writer.WriteStrA('|');
                  end;

               TAG_BR_ID: begin
                     HtmlWriter.Writer.DataToStrA;
                     HtmlWriter.Writer.WriteLineBreak;
                  end;



               TAG_DIV_ID, TAG_P_ID: begin
                     HtmlWriter.Writer.WriteLineBreak;
                     HtmlWriter.Writer.WriteLineBreak;
                  end;
            end;

         ptText:
            { Look out for the first piece of text which contains non-space characters. }
            for i := 0 to HtmlParser.DataSize - 1 do
               if not CharIsWhiteSpaceW(HtmlParser.Data[i]) then begin
                  { At this point the parser found a first piece of text which is
                    not white space. This is the time to instruct the Writer to
                    begin writing text as well as <A> link tags. The parser, on the
                    other hand, must no longer show any text but inform us about
                    some formatting tags. }
                  HtmlParser.FilterText := fiHide;
                  HtmlParser.HtmlTagFilters := TDITagFilters.Create;
                  HtmlParser.HtmlTagFilters.SetStart([TAG_BR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);

                  if (bNewLineAfterHR_ID) then begin
                     HtmlParser.HtmlTagFilters.SetStart([TAG_HR_ID, TAG_BR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);
                  end;

                  if (bNewLineAfterTR_ID) then begin
                     HtmlParser.HtmlTagFilters.SetStart([TAG_BR_ID, TAG_TR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);
                  end;

                  if (bNewLineAfterTD_ID) then begin
                     HtmlParser.HtmlTagFilters.SetStart([TAG_TD_ID, TAG_BR_ID, TAG_TR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);
                  end;


                  { Instruct the writer to write text, <A> start tags and </A> end
                    tags. }
                  HtmlWriter.FilterText := fiShow;
                  HtmlWriter.HtmlTagFilters := TDITagFilters.Create;
                  if (bWriteTags) then begin
                     HtmlWriter.HtmlTagFilters.SetStartEnd(TAG_A_ID, fiShow);
                  end else begin
                     HtmlWriter.HtmlTagFilters.SetStartEnd(TAG_A_ID, fiHide);
                  end;

                  { Write the current piece of text, since the write did not yet
                    write it automatically. }
                  HtmlWriter.WriteCurrentText;
                  Break;
               end;
      end;

   { Retrieve the text from the Writer Plugin. }
   Result := HtmlWriter.Writer.DataToStrA;

   HtmlParser.HtmlTagFilters.Free;
   HtmlParser.Free;

   HtmlWriter.HtmlTagFilters.Free;
   HtmlWriter.Free;
end;

function HtmlExtractHREF(const s: string; bWriteTags: boolean; bNewLineAfterTR_ID: boolean; bNewLineAfterTD_ID: boolean; bNewLineAfterHR_ID: boolean): string;
var
   HtmlParser: TDIHtmlParser;
   HtmlWriter: TDIHtmlWriterPlugin;
   i: Integer;
begin
   { Create a HTML Parser object. }
   HtmlParser := TDIHtmlParser.Create(nil);
   HtmlParser.FilterText := fiShow;
   HtmlParser.NormalizeWhiteSpace := True;

   { Create a Writer Plugin and assign it to out HtmlParser. The Writer will
     store the extracted text for later retrival. At this stage, the Writer
     Plugin does not write anything automatically. We will switch the automatic
     writing on once the parser finds the first text which is not white space. }
   HtmlWriter := TDIHtmlWriterPlugin.Create(nil);
   HtmlWriter.HtmlParser := HtmlParser;

   HtmlParser.SourceBufferAsStrA := s;

   while HtmlParser.ParseNextPiece do
      case HtmlParser.PieceType of
         ptHtmlTag:
            { Triggered if the parse has encountered simple text formatting tags
              which we directly convert to single or double line breaks. }
            case HtmlParser.HtmlTag.TagID of
               TAG_HR_ID: begin
                     HtmlWriter.Writer.WriteStrA('Race-');
                  end;

               TAG_TR_ID: begin
                     HtmlWriter.Writer.WriteLineBreak;
                  end;

               TAG_TD_ID: begin
                     HtmlWriter.Writer.WriteStrA('|');
                  end;

               TAG_BR_ID: begin
                     HtmlWriter.Writer.DataToStrA;
                     HtmlWriter.Writer.WriteLineBreak;
                  end;



               TAG_DIV_ID, TAG_P_ID: begin
                     HtmlWriter.Writer.WriteLineBreak;
                     HtmlWriter.Writer.WriteLineBreak;
                  end;
            end;

         ptText:
            { Look out for the first piece of text which contains non-space characters. }
            for i := 0 to HtmlParser.DataSize - 1 do
               if not CharIsWhiteSpaceW(HtmlParser.Data[i]) then begin
                  { At this point the parser found a first piece of text which is
                    not white space. This is the time to instruct the Writer to
                    begin writing text as well as <A> link tags. The parser, on the
                    other hand, must no longer show any text but inform us about
                    some formatting tags. }
                  HtmlParser.FilterText := fiHide;
                  HtmlParser.HtmlTagFilters := TDITagFilters.Create;
                  HtmlParser.HtmlTagFilters.SetStart([TAG_BR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);

                  if (bNewLineAfterHR_ID) then begin
                     HtmlParser.HtmlTagFilters.SetStart([TAG_HR_ID, TAG_BR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);
                  end;

                  if (bNewLineAfterTR_ID) then begin
                     HtmlParser.HtmlTagFilters.SetStart([TAG_BR_ID, TAG_TR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);
                  end;

                  if (bNewLineAfterTD_ID) then begin
                     HtmlParser.HtmlTagFilters.SetStart([TAG_TD_ID, TAG_BR_ID, TAG_TR_ID, TAG_DIV_ID, TAG_P_ID], fiShow);
                  end;


                  { Instruct the writer to write text, <A> start tags and </A> end
                    tags. }
                  HtmlWriter.FilterText := fiShow;
                  HtmlWriter.HtmlTagFilters := TDITagFilters.Create;
                  if (bWriteTags) then begin
                     HtmlWriter.HtmlTagFilters.SetStartEnd(TAG_A_ID, fiShow);
                  end else begin
                     HtmlWriter.HtmlTagFilters.SetStartEnd(TAG_A_ID, fiHide);
                  end;

                  { Write the current piece of text, since the write did not yet
                    write it automatically. }
                  HtmlWriter.WriteCurrentText;
                  Break;
               end;
      end;

   { Retrieve the text from the Writer Plugin. }
   Result := HtmlWriter.Writer.DataToStrA;

   HtmlParser.HtmlTagFilters.Free;
   HtmlParser.Free;

   HtmlWriter.HtmlTagFilters.Free;
   HtmlWriter.Free;
end;



function SkipThisHHRecord(tblR: TDBISAMTable; tblH: TDBISAMTable): boolean;
var
   iFinishPos: integer;
   fOdds: double;
   sSurface: string;
   sTrkCode: string;
   sRaceType: string;

begin

   Result := False;

   if (tblH.FieldByName('TrkCode').AsString = '') then begin
      Result := True;
      exit;
   end;

   iFinishPos := tblH.FieldByName('FinishPos').AsInteger;
   fOdds := tblH.FieldByName('Odds').AsFloat;
   sTrkCode := tblH.FieldByName('TrkCode').AsString;
   sSurface := tblH.FieldByName('Surface').AsString;
   sRaceType := tblH.FieldByName('RaceType').AsString;

   if (iFinishPos <= 0) then begin
      Result := True;
      exit;
   end;

   if (iFinishPos > 20) then begin
      Result := True;
      exit;
   end;

   if (fOdds <= 0.00) then begin
      Result := True;
      exit;
   end;

   if ((sRaceType <> MSW_RACE) and
      (sRaceType <> MCL_RACE) and
      (sRaceType <> ALW_RACE) and
      (sRaceType <> STK_RACE) and
      (sRaceType <> HCP_RACE) and
      (sRaceType <> CLM_RACE) and
      (sRaceType <> OCLM_RACE) and
      (sRaceType <> SALW_RACE) and
      (sRaceType <> SHCP_RACE) and
      (sRaceType <> OCLM_RACE) and
      (sRaceType <> SALW_RACE) and
      (sRaceType <> SHCP_RACE) and
      (sRaceType <> G1_RACE) and
      (sRaceType <> G2_RACE) and
      (sRaceType <> G3_RACE)) then begin
      Result := True;
      exit;
   end;

   if ((sSurface <> 'T') and (sSurface <> 'D')) then begin
      Result := True;
      exit;
   end;

end;

procedure SummaryFlds(tblH: TDBISAMTable; memS: TDBISAMTable);
var
   fStarts: double;
   fWins: double;
   fWinPct: double;

   fFldstarts: double;
   fTotalWins: double;
   fTotalWinPct: double;
   fTotalWagered: double;
   fTotalWon: double;
   fTotalProfitLoss: double;
   fTotalProfitLossPct: double;

   fValueBet: double;

   fAvgWinOdds: double;
   fMinOdds: double;
   fMaxOdds: double;
begin

   memS.FieldByName('Starts').AsInteger := memS.FieldByName('Starts').AsInteger + 1;

   if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
      memS.FieldByName('Wins').AsInteger := memS.FieldByName('Wins').AsInteger + 1;
   end;

   if (tblH.FieldByName('FinishPos').AsInteger > 0) then begin
      memS.FieldByName('TotalOdds').AsFloat := memS.FieldByName('TotalOdds').AsFloat + tblH.FieldByName('Odds').AsFloat;
   end;

   if (memS.FieldByName('Starts').AsFloat > 0) then begin
      memS.FieldByName('AvgOdds').AsFloat := memS.FieldByName('TotalOdds').AsFloat / memS.FieldByName('Starts').AsFloat;
   end;

   if (tblH.FieldByName('FinishPos').AsInteger > 0) then begin

      if (tblH.FieldByName('Odds').AsFloat > 0) then begin
         if (tblH.FieldByName('Odds').AsFloat < memS.FieldByName('MinOdds').AsFloat) then begin
            memS.FieldByName('MinOdds').AsFloat := tblH.FieldByName('Odds').AsFloat;
         end;
      end;

      if (tblH.FieldByName('Odds').AsFloat > memS.FieldByName('MaxOdds').AsFloat) then begin
         memS.FieldByName('MaxOdds').AsFloat := tblH.FieldByName('Odds').AsFloat;
      end;

   end;

   //
   if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
      memS.FieldByName('TotalWinOdds').AsFloat := memS.FieldByName('TotalWinOdds').AsFloat + tblH.FieldByName('Odds').AsFloat;
   end;

   if (memS.FieldByName('Wins').AsFloat > 0) then begin
      memS.FieldByName('AvgWinOdds').AsFloat := memS.FieldByName('TotalWinOdds').AsFloat / memS.FieldByName('Wins').AsFloat;
   end;

   if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin

      if (tblH.FieldByName('Odds').AsFloat > 0) then begin
         if (tblH.FieldByName('Odds').AsFloat < memS.FieldByName('MinWinOdds').AsFloat) then begin
            memS.FieldByName('MinWinOdds').AsFloat := tblH.FieldByName('Odds').AsFloat;
         end;
      end;

      if (tblH.FieldByName('Odds').AsFloat > memS.FieldByName('MaxWinOdds').AsFloat) then begin
         memS.FieldByName('MaxWinOdds').AsFloat := tblH.FieldByName('Odds').AsFloat;
      end;

   end;

   fStarts := memS.FieldByName('Starts').AsFloat;
   fWins := memS.FieldByName('Wins').AsFloat;
   fAvgWinOdds := RoundTo(memS.FieldByName('AvgWinOdds').AsFloat, -2);

   if (fStarts > 0) then begin
      fWinPct := (fWins / fStarts) * 100;
   end else begin
      fWinPct := 0;
   end;

   fTotalWagered := fStarts;
   fTotalWon := (fWins * fAvgWinOdds) + fWins;
   fTotalProfitLoss := Round((fTotalWon - fTotalWagered) * 100) / 100;
   fTotalProfitLossPct := (fTotalProfitLoss / fTotalWagered) * 100;
   fTotalProfitLossPct := Round((fTotalProfitLossPct) * 100) / 100;
   fTotalProfitLoss := fTotalProfitLoss;

   fValueBet := (fAvgWinOdds * fWinPct) / 100;


   memS.FieldByName('AvgWinOdds').AsFloat := fAvgWinOdds;
   memS.FieldByName('WinPct').AsFloat := Round(fWinPct * 100) / 100;
   memS.FieldByName('TotalWagered').AsFloat := RoundTo(fTotalWagered, -2);
   memS.FieldByName('TotalWon').AsFloat := RoundTo(fTotalWon, -2);
   memS.FieldByName('TotalProfitLoss').AsFloat := RoundTo(fTotalProfitLoss, -2);
   memS.FieldByName('TotalProfitLossPct').AsFloat := fTotalProfitLossPct;
   memS.FieldByName('ValueBet').AsFloat := RoundTo(fValueBet, -2);

end;

function ExecuteSQL(const ADir, ASQL: string): Integer;
var
   ASession: TDBISAMSession;
   ADatabase: TDBISAMDatabase;
   AQuery: TDBISAMQuery;
begin
   ASession := TDBISAMSession.Create(nil);
   try
      with ASession do begin
         { Provides a unique SessionName }
         AutoSessionName := True;
         PrivateDir := ADir;
      end;
      ADatabase := TDBISAMDatabase.Create(nil);
      try
         with ADatabase do begin
            DatabaseName := 'TempDatabase';
            { Assign the passed database path }
            Directory := ADir;
            SessionName := ASession.SessionName;
         end;
         AQuery := TDBISAMQuery.Create(nil);
         try
            with AQuery do begin
               DatabaseName := ADatabase.DatabaseName;
               ReQuestLive := True;
               SessionName := ASession.SessionName;
               SQL.Clear;
               { Assign the passed SQL statement }
               SQL.Add(ASQL);
               { Assign the passed event handler }
      //         OnQueryProgress := Progress;
               { Prepare the query to determine statement type }
               Prepare;
               if SQLStatementType = stSelect then
                  Open
               else
                  ExecSQL;
            end;
         finally
            { Return # of records processed }
            Result := AQuery.RowsAffected;
            AQuery.Free;
         end;
      finally
         ADatabase.Free;
      end;
   finally
      ASession.Free;
   end;
end;

procedure InitDownloadLabels();
begin
   MainForm.lblServerPath.Visible := True;
   MainForm.lblLocalPath.Visible := True;
end;

procedure ClearDownloadLabels();
begin
   MainForm.lblServerPath.Visible := False;
   MainForm.lblLocalPath.Visible := False;
end;

procedure UpdateDownloadLabels(sServerFullFileName: string; sDownloadFullFileName: string);
begin
   MainForm.lblServerPath.Caption := sServerFullFileName;
   MainForm.lblLocalPath.Caption := sDownloadFullFileName;
end;

procedure ParseLogFileForExceptions();
var
   iIdx: integer;

   lstIn: TStringList;
   lstOut: TStringList;

   sTmp: string;
   sPrevTmp: string;
   bAddLines: boolean;

begin

   try
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;
      bAddLines := False;

      if FileExists(LOG_PATH + LOG_FILENAME) then begin
         lstIn.LoadFromFile(LOG_PATH + LOG_FILENAME);
         sPrevTmp := '';
         for iIdx := 0 to lstIn.Count - 1 do begin
            sTmp := StringListTrim(lstIn[iIdx]);

            if (SmartPos('EXCEPTION', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
            end else begin
               bAddLines := True;
               bAddLines := False;
            end;

            if (bAddLines) then begin
               lstOut.Add(sPrevTmp);
               lstOut.Add(sTmp);
            end;
            sPrevTmp := sTmp;
         end;
      end;

      if FileExists(LOG_PATH + STATS_LOG_FILENAME) then begin
         lstIn.LoadFromFile(LOG_PATH + STATS_LOG_FILENAME);
         sPrevTmp := '';
         for iIdx := 0 to lstIn.Count - 1 do begin
            sTmp := StringListTrim(lstIn[iIdx]);

            if (SmartPos('EXCEPTION', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
            end else begin
               bAddLines := True;
               bAddLines := False;
            end;

            if (bAddLines) then begin
               lstOut.Add(sPrevTmp);
               lstOut.Add(sTmp);
            end;
            sPrevTmp := sTmp;
         end;
      end;

      if FileExists(LOG_PATH + TSN_LOG_FILENAME) then begin
         lstIn.LoadFromFile(LOG_PATH + TSN_LOG_FILENAME);
         sPrevTmp := '';
         for iIdx := 0 to lstIn.Count - 1 do begin
            sTmp := StringListTrim(lstIn[iIdx]);

            if (SmartPos('EXCEPTION', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
            end else begin
               bAddLines := True;
               bAddLines := False;
            end;

            if (bAddLines) then begin
               lstOut.Add(sPrevTmp);
               lstOut.Add(sTmp);
            end;
            sPrevTmp := sTmp;
         end;
      end;

      if FileExists(LOG_PATH + EQUIBASE_LOG_FILENAME) then begin
         lstIn.LoadFromFile(LOG_PATH + EQUIBASE_LOG_FILENAME);
         sPrevTmp := '';
         for iIdx := 0 to lstIn.Count - 1 do begin
            sTmp := StringListTrim(lstIn[iIdx]);

            if (SmartPos('EXCEPTION', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
            end else begin
               bAddLines := True;
               bAddLines := False;
            end;

            if (bAddLines) then begin
               lstOut.Add(sPrevTmp);
               lstOut.Add(sTmp);
            end;
            sPrevTmp := sTmp;
         end;
      end;


      if FileExists(LOG_PATH + AXCIS_LOG_FILENAME) then begin
         lstIn.LoadFromFile(LOG_PATH + AXCIS_LOG_FILENAME);
         sPrevTmp := '';
         for iIdx := 0 to lstIn.Count - 1 do begin
            sTmp := StringListTrim(lstIn[iIdx]);

            if (SmartPos('EXCEPTION', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
            end else begin
               bAddLines := True;
               bAddLines := False;
            end;

            if (bAddLines) then begin
               lstOut.Add(sPrevTmp);
               lstOut.Add(sTmp);
            end;
            sPrevTmp := sTmp;
         end;
      end;



      if FileExists(LOG_PATH + BLOODHORSE_LOG_FILENAME) then begin
         lstIn.LoadFromFile(LOG_PATH + BLOODHORSE_LOG_FILENAME);
         sPrevTmp := '';
         for iIdx := 0 to lstIn.Count - 1 do begin
            sTmp := StringListTrim(lstIn[iIdx]);

            if (SmartPos('EXCEPTION', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
            end else begin
               bAddLines := True;
               bAddLines := False;
            end;

            if (bAddLines) then begin
               lstOut.Add(sPrevTmp);
               lstOut.Add(sTmp);
            end;
            sPrevTmp := sTmp;
         end;
      end;


   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(LOG_PATH + EXCEPTION_LOG_FILENAME);
      FreeAndNil(lstOut);
   end;

end;

procedure SetRaceEntriesKey(tblR: TDBISAMTable; tblE: TDBISAMTable);
begin

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
   tblR.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
   tblR.FieldByName('RaceNbr').AsInteger := tblE.FieldByName('RaceNbr').AsInteger;

end;

procedure SetRatingsEntriesKey(tblR: TDBISAMTable; tblE: TDBISAMTable);
begin

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
   tblR.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
   tblR.FieldByName('RaceNbr').AsInteger := tblE.FieldByName('RaceNbr').AsInteger;
   tblR.FieldByName('PostPos').AsInteger := tblE.FieldByName('PostPos').AsInteger;

end;

procedure UpdateEntriesProgressStatusBar(tbl: TDBISAMTable; sHeading: string);
begin

   MainForm.prgBar.Position := MainForm.prgBar.Position + 1;

   MainForm.staBar.SimpleText := sHeading +
      tbl.FieldByName('TrkCode').AsString + ' ' +
      tbl.FieldByName('RaceDate').AsString + ' Race # ' +
      tbl.FieldByName('RaceNbr').AsString + ' ' +
      tbl.FieldByName('HorseName').AsString;

   Application.ProcessMessages();

end;

procedure UpdateRacesProgressStatusBar(tbl: TDBISAMTable; sHeading: string); overload;
begin

   MainForm.prgBar.Position := MainForm.prgBar.Position + 1;

   MainForm.staBar.SimpleText := sHeading +
      tbl.FieldByName('TrkCode').AsString + ' ' +
      tbl.FieldByName('RaceDate').AsString + ' Race # ' +
      tbl.FieldByName('RaceNbr').AsString;

   Application.ProcessMessages();

end;

procedure TimerOn(bOn: boolean);
begin
   if not gbSuppressTimerOn then begin
      MainForm.timChk.Enabled := bOn;
   end;
end;

function ExtractRar(sFileName: string): boolean;
var
   iFilesExtracted: integer;
begin

   try
      MainForm.ztvRar.ArchiveFile := sFileName;
      MainForm.ztvRar.ExtractDir := ExtractFilePath(sFileName);
      iFilesExtracted := MainForm.ztvRar.Extract();
      if iFilesExtracted = 0 then begin
         Result := False;
      end else begin
         Result := True;
      end;

   except
      Result := False;
      Exit;
   end;
end;


procedure CreateLoadMemTables
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   memR: TDBISAMTable;
   memE: TDBISAMTable
   );
begin
   try
      // Create in memory table for entries
      tblE.FieldDefs.Update;
      tblE.IndexDefs.Update;

      with memE do begin
         Name := 'memE';
         StoreDefs := True;
         SessionName := 'Default';
         DatabaseName := 'Memory';
         TableName := 'memEntries';
         FieldDefs.Assign(tblE.FieldDefs);
         IndexDefs.Assign(tblE.IndexDefs);
         CreateTable;
      end;
      try //Load data
         msE := TMemoryStream.Create;
         tblE.SaveToStream(msE);
         memE.LoadFromStream(msE);
      finally
         FreeAndNil(msE);
      end;

      //Same for races
      tblR.FieldDefs.Update;
      tblR.IndexDefs.Update;
      with memR do begin
         Name := 'memR';
         StoreDefs := True;
         SessionName := 'Default';
         DatabaseName := 'Memory';
         TableName := 'memRaces';
         FieldDefs.Assign(tblR.FieldDefs);
         IndexDefs.Assign(tblR.IndexDefs);
         CreateTable;
      end;
      try //Load data
         msR := TMemoryStream.Create;
         tblR.SaveToStream(msR);
         memR.LoadFromStream(msR);
      finally
         FreeAndNil(msR);
      end;

   finally
      memE.Active := False;
      memR.Active := False;
      tblE.Active := False;
      tblR.Active := False;
   end;

end;

procedure SaveDeleteMemTables
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   memR: TDBISAMTable;
   memE: TDBISAMTable
   );
begin

   try // Save Races
      msR := TMemoryStream.Create;
      memR.SaveToStream(msR);
      tblR.EmptyTable;
      tblR.LoadFromStream(msR);
   finally
      FreeAndNil(msR);
      memR.DeleteTable();
      tblR.Active := False;
   end;

   try // Same for entries
      msE := TMemoryStream.Create;
      memE.SaveToStream(msE);
      tblE.EmptyTable;
      tblE.LoadFromStream(msE);
   finally
      FreeAndNil(msE);
      memE.DeleteTable();
      tblE.Active := False;
   end;

end;


function InitLArray(aL: TLArray): TLArray;
var
   iRow: integer;
   iCol: integer;
begin

   for iRow := 1 to MAX_ROWS do begin
      for iCol := 1 to MAX_COLS do begin
         aL[iRow, iCol] := 0;
      end;
   end;

   Result := aL;

end;

function InitMinDArray(aD: TDArray): TDArray;
var
   iRow: integer;
   iCol: integer;
begin

   for iRow := 1 to MAX_ROWS do begin
      for iCol := 1 to MAX_COLS do begin
         aD[iRow, iCol] := 9999;
      end;
   end;

   Result := aD;

end;

function InitMaxDArray(aD: TDArray): TDArray;
var
   iRow: integer;
   iCol: integer;
begin

   for iRow := 1 to MAX_ROWS do begin
      for iCol := 1 to MAX_COLS do begin
         aD[iRow, iCol] := 0.00;
      end;
   end;

   Result := aD;

end;

function IncMaxDArray(fOdds: double; aMaxD: TDArray; iRow: integer; iCol: integer): TDArray;
begin

   if ((iRow >= 1) and (iRow <= MAX_ROWS)) then begin
      if ((iCol >= 1) and (iCol <= MAX_COLS)) then begin
         if (fOdds > aMaxD[iRow, iCol]) then begin
            aMaxD[iRow, iCol] := fOdds;
         end;
      end;
   end;

   Result := aMaxD;

end;

function IncMinDArray(fOdds: double; aMinD: TDArray; iRow: integer; iCol: integer): TDArray;
begin

   if ((iRow >= 1) and (iRow <= MAX_ROWS)) then begin
      if ((iCol >= 1) and (iCol <= MAX_COLS)) then begin
         if (fOdds < aMinD[iRow, iCol]) then begin
            aMinD[iRow, iCol] := fOdds;
         end;
      end;
   end;

   Result := aMinD;

end;



function InitDArray(aD: TDArray): TDArray;
var
   iRow: integer;
   iCol: integer;
begin

   for iRow := 1 to MAX_ROWS do begin
      for iCol := 1 to MAX_COLS do begin
         aD[iRow, iCol] := 0.00;
      end;
   end;

   Result := aD;

end;

function IncLDArray(fOdds: double; aD: TDArray; aL: TLArray; iRow: integer; iCol: integer): TLArray;
begin

   if ((iRow >= 1) and (iRow <= MAX_ROWS)) then begin
      if ((iCol >= 1) and (iCol <= MAX_COLS)) then begin
         Inc(aL[iRow, iCol]);
      end;
   end;

   Result := aL;

end;

function IncLArray(aL: TLArray; iRow: integer; iCol: integer): TLArray;
begin

   if ((iRow >= 1) and (iRow <= MAX_ROWS)) then begin
      if ((iCol >= 1) and (iCol <= MAX_COLS)) then begin
         Inc(aL[iRow, iCol]);
      end;
   end;

   Result := aL;

end;

function IncDArray(fOdds: double; aD: TDArray; iRow: integer; iCol: integer): TDArray;
begin

   if ((iRow >= 1) and (iRow <= MAX_ROWS)) then begin
      if ((iCol >= 1) and (iCol <= MAX_COLS)) then begin
         aD[iRow, iCol] := aD[iRow, iCol] + fOdds;
      end;
   end;

   Result := aD;

end;


procedure InitRankingArrays();
begin

   //
   alEarlyPaceRank := InitLArray(alEarlyPaceRank);
   alMiddlePaceRank := InitLArray(alMiddlePaceRank);
   alLatePaceRank := InitLArray(alLatePaceRank);

   adEarlyPaceOdds := InitDArray(adEarlyPaceOdds);
   adMiddlePaceOdds := InitDArray(adMiddlePaceOdds);
   adLatePaceOdds := InitDArray(adLatePaceOdds);

   adEarlyPaceMinOdds := InitMinDArray(adEarlyPaceMinOdds);
   adMiddlePaceMinOdds := InitMinDArray(adMiddlePaceMinOdds);
   adLatePaceMinOdds := InitMinDArray(adLatePaceMinOdds);

   adEarlyPaceMaxOdds := InitMaxDArray(adEarlyPaceMaxOdds);
   adMiddlePaceMaxOdds := InitMaxDArray(adMiddlePaceMaxOdds);
   adLatePaceMaxOdds := InitMaxDArray(adLatePaceMaxOdds);

   //
   alEarlyPacePosRank := InitLArray(alEarlyPacePosRank);
   alMiddlePacePosRank := InitLArray(alMiddlePacePosRank);
   alLatePacePosRank := InitLArray(alLatePacePosRank);

   adEarlyPacePosOdds := InitDArray(adEarlyPacePosOdds);
   adMiddlePacePosOdds := InitDArray(adMiddlePacePosOdds);
   adLatePacePosOdds := InitDArray(adLatePacePosOdds);

   adEarlyPacePosMinOdds := InitMinDArray(adEarlyPacePosMinOdds);
   adMiddlePacePosMinOdds := InitMinDArray(adMiddlePacePosMinOdds);
   adLatePacePosMinOdds := InitMinDArray(adLatePacePosMinOdds);

   adEarlyPacePosMaxOdds := InitMaxDArray(adEarlyPacePosMaxOdds);
   adMiddlePacePosMaxOdds := InitMaxDArray(adMiddlePacePosMaxOdds);
   adLatePacePosMaxOdds := InitMaxDArray(adLatePacePosMaxOdds);

   //
   alTrfEarlyPaceRank := InitLArray(alTrfEarlyPaceRank);
   alTrfMiddlePaceRank := InitLArray(alTrfMiddlePaceRank);
   alTrfLatePaceRank := InitLArray(alTrfLatePaceRank);

   adTrfEarlyPaceOdds := InitDArray(adTrfEarlyPaceOdds);
   adTrfMiddlePaceOdds := InitDArray(adTrfMiddlePaceOdds);
   adTrfLatePaceOdds := InitDArray(adTrfLatePaceOdds);

   adTrfEarlyPaceMinOdds := InitMinDArray(adTrfEarlyPaceMinOdds);
   adTrfMiddlePaceMinOdds := InitMinDArray(adTrfMiddlePaceMinOdds);
   adTrfLatePaceMinOdds := InitMinDArray(adTrfLatePaceMinOdds);

   adTrfEarlyPaceMaxOdds := InitMaxDArray(adTrfEarlyPaceMaxOdds);
   adTrfMiddlePaceMaxOdds := InitMaxDArray(adTrfMiddlePaceMaxOdds);
   adTrfLatePaceMaxOdds := InitMaxDArray(adTrfLatePaceMaxOdds);

   //
   alMudEarlyPaceRank := InitLArray(alMudEarlyPaceRank);
   alMudMiddlePaceRank := InitLArray(alMudMiddlePaceRank);
   alMudLatePaceRank := InitLArray(alMudLatePaceRank);

   adMudEarlyPaceOdds := InitDArray(adMudEarlyPaceOdds);
   adMudMiddlePaceOdds := InitDArray(adMudMiddlePaceOdds);
   adMudLatePaceOdds := InitDArray(adMudLatePaceOdds);

   adMudEarlyPaceMinOdds := InitMinDArray(adMudEarlyPaceMinOdds);
   adMudMiddlePaceMinOdds := InitMinDArray(adMudMiddlePaceMinOdds);
   adMudLatePaceMinOdds := InitMinDArray(adMudLatePaceMinOdds);

   adMudEarlyPaceMaxOdds := InitMaxDArray(adMudEarlyPaceMaxOdds);
   adMudMiddlePaceMaxOdds := InitMaxDArray(adMudMiddlePaceMaxOdds);
   adMudLatePaceMaxOdds := InitMaxDArray(adMudLatePaceMaxOdds);

   //
   alFDLRank := InitLArray(alFDLRank);
   alBDLRank := InitLArray(alBDLRank);
   alTLRank := InitLArray(alTLRank);

   adFDLOdds := InitDArray(adFDLOdds);
   adBDLOdds := InitDArray(adBDLOdds);
   adTLOdds := InitDArray(adTLOdds);

   adFDLMinOdds := InitMinDArray(adFDLMinOdds);
   adBDLMinOdds := InitMinDArray(adBDLMinOdds);
   adTLMinOdds := InitMinDArray(adTLMinOdds);

   adFDLMaxOdds := InitMaxDArray(adFDLMaxOdds);
   adBDLMaxOdds := InitMaxDArray(adBDLMaxOdds);
   adTLMaxOdds := InitMaxDArray(adTLMaxOdds);

   //
   alFDL0Rank := InitLArray(alFDL0Rank);
   alBDL0Rank := InitLArray(alBDL0Rank);
   alTL0Rank := InitLArray(alTL0Rank);

   adFDL0Odds := InitDArray(adFDL0Odds);
   adBDL0Odds := InitDArray(adBDL0Odds);
   adTL0Odds := InitDArray(adTL0Odds);

   adFDL0MinOdds := InitMinDArray(adFDL0MinOdds);
   adBDL0MinOdds := InitMinDArray(adBDL0MinOdds);
   adTL0MinOdds := InitMinDArray(adTL0MinOdds);

   adFDL0MaxOdds := InitMaxDArray(adFDL0MaxOdds);
   adBDL0MaxOdds := InitMaxDArray(adBDL0MaxOdds);
   adTL0MaxOdds := InitMaxDArray(adTL0MaxOdds);

   //
   alFDL1Rank := InitLArray(alFDL1Rank);
   alBDL1Rank := InitLArray(alBDL1Rank);
   alTL1Rank := InitLArray(alTL1Rank);

   adFDL1Odds := InitDArray(adFDL1Odds);
   adBDL1Odds := InitDArray(adBDL1Odds);
   adTL1Odds := InitDArray(adTL1Odds);

   adFDL1MinOdds := InitMinDArray(adFDL1MinOdds);
   adBDL1MinOdds := InitMinDArray(adBDL1MinOdds);
   adTL1MinOdds := InitMinDArray(adTL1MinOdds);

   adFDL1MaxOdds := InitMaxDArray(adFDL1MaxOdds);
   adBDL1MaxOdds := InitMaxDArray(adBDL1MaxOdds);
   adTL1MaxOdds := InitMaxDArray(adTL1MaxOdds);

   //
   alFDL2Rank := InitLArray(alFDL2Rank);
   alBDL2Rank := InitLArray(alBDL2Rank);
   alTL2Rank := InitLArray(alTL2Rank);

   adFDL2Odds := InitDArray(adFDL2Odds);
   adBDL2Odds := InitDArray(adBDL2Odds);
   adTL2Odds := InitDArray(adTL2Odds);

   adFDL2MinOdds := InitMinDArray(adFDL2MinOdds);
   adBDL2MinOdds := InitMinDArray(adBDL2MinOdds);
   adTL2MinOdds := InitMinDArray(adTL2MinOdds);

   adFDL2MaxOdds := InitMaxDArray(adFDL2MaxOdds);
   adBDL2MaxOdds := InitMaxDArray(adBDL2MaxOdds);
   adTL2MaxOdds := InitMaxDArray(adTL2MaxOdds);

   //
   alFDL3Rank := InitLArray(alFDL3Rank);
   alBDL3Rank := InitLArray(alBDL3Rank);
   alTL3Rank := InitLArray(alTL3Rank);

   adFDL3Odds := InitDArray(adFDL3Odds);
   adBDL3Odds := InitDArray(adBDL3Odds);
   adTL3Odds := InitDArray(adTL3Odds);

   adFDL3MinOdds := InitMinDArray(adFDL3MinOdds);
   adBDL3MinOdds := InitMinDArray(adBDL3MinOdds);
   adTL3MinOdds := InitMinDArray(adTL3MinOdds);

   adFDL3MaxOdds := InitMaxDArray(adFDL3MaxOdds);
   adBDL3MaxOdds := InitMaxDArray(adBDL3MaxOdds);
   adTL3MaxOdds := InitMaxDArray(adTL3MaxOdds);

   //
   alTrfFDLRank := InitLArray(alTrfFDLRank);
   alTrfBDLRank := InitLArray(alTrfBDLRank);
   alTrfTLRank := InitLArray(alTrfTLRank);

   adTrfFDLOdds := InitDArray(adTrfFDLOdds);
   adTrfBDLOdds := InitDArray(adTrfBDLOdds);
   adTrfTLOdds := InitDArray(adTrfTLOdds);

   adTrfFDLMinOdds := InitMinDArray(adTrfFDLMinOdds);
   adTrfBDLMinOdds := InitMinDArray(adTrfBDLMinOdds);
   adTrfTLMinOdds := InitMinDArray(adTrfTLMinOdds);

   adTrfFDLMaxOdds := InitMaxDArray(adTrfFDLMaxOdds);
   adTrfBDLMaxOdds := InitMaxDArray(adTrfBDLMaxOdds);
   adTrfTLMaxOdds := InitMaxDArray(adTrfTLMaxOdds);

   //
   alTrfFDL0Rank := InitLArray(alTrfFDL0Rank);
   alTrfBDL0Rank := InitLArray(alTrfBDL0Rank);
   alTrfTL0Rank := InitLArray(alTrfTL0Rank);

   adTrfFDL0Odds := InitDArray(adTrfFDL0Odds);
   adTrfBDL0Odds := InitDArray(adTrfBDL0Odds);
   adTrfTL0Odds := InitDArray(adTrfTL0Odds);

   adTrfFDL0MinOdds := InitMinDArray(adTrfFDL0MinOdds);
   adTrfBDL0MinOdds := InitMinDArray(adTrfBDL0MinOdds);
   adTrfTL0MinOdds := InitMinDArray(adTrfTL0MinOdds);

   adTrfFDL0MaxOdds := InitMaxDArray(adTrfFDL0MaxOdds);
   adTrfBDL0MaxOdds := InitMaxDArray(adTrfBDL0MaxOdds);
   adTrfTL0MaxOdds := InitMaxDArray(adTrfTL0MaxOdds);

   //
   alTrfFDL1Rank := InitLArray(alTrfFDL1Rank);
   alTrfBDL1Rank := InitLArray(alTrfBDL1Rank);
   alTrfTL1Rank := InitLArray(alTrfTL1Rank);

   adTrfFDL1Odds := InitDArray(adTrfFDL1Odds);
   adTrfBDL1Odds := InitDArray(adTrfBDL1Odds);
   adTrfTL1Odds := InitDArray(adTrfTL1Odds);

   adTrfFDL1MinOdds := InitMinDArray(adTrfFDL1MinOdds);
   adTrfBDL1MinOdds := InitMinDArray(adTrfBDL1MinOdds);
   adTrfTL1MinOdds := InitMinDArray(adTrfTL1MinOdds);

   adTrfFDL1MaxOdds := InitMaxDArray(adTrfFDL1MaxOdds);
   adTrfBDL1MaxOdds := InitMaxDArray(adTrfBDL1MaxOdds);
   adTrfTL1MaxOdds := InitMaxDArray(adTrfTL1MaxOdds);

   //
   alTrfFDL2Rank := InitLArray(alTrfFDL2Rank);
   alTrfBDL2Rank := InitLArray(alTrfBDL2Rank);
   alTrfTL2Rank := InitLArray(alTrfTL2Rank);

   adTrfFDL2Odds := InitDArray(adTrfFDL2Odds);
   adTrfBDL2Odds := InitDArray(adTrfBDL2Odds);
   adTrfTL2Odds := InitDArray(adTrfTL2Odds);

   adTrfFDL2MinOdds := InitMinDArray(adTrfFDL2MinOdds);
   adTrfBDL2MinOdds := InitMinDArray(adTrfBDL2MinOdds);
   adTrfTL2MinOdds := InitMinDArray(adTrfTL2MinOdds);

   adTrfFDL2MaxOdds := InitMaxDArray(adTrfFDL2MaxOdds);
   adTrfBDL2MaxOdds := InitMaxDArray(adTrfBDL2MaxOdds);
   adTrfTL2MaxOdds := InitMaxDArray(adTrfTL2MaxOdds);

   //
   alTrfFDL3Rank := InitLArray(alTrfFDL3Rank);
   alTrfBDL3Rank := InitLArray(alTrfBDL3Rank);
   alTrfTL3Rank := InitLArray(alTrfTL3Rank);

   adTrfFDL3Odds := InitDArray(adTrfFDL3Odds);
   adTrfBDL3Odds := InitDArray(adTrfBDL3Odds);
   adTrfTL3Odds := InitDArray(adTrfTL3Odds);

   adTrfFDL3MinOdds := InitMinDArray(adTrfFDL3MinOdds);
   adTrfBDL3MinOdds := InitMinDArray(adTrfBDL3MinOdds);
   adTrfTL3MinOdds := InitMinDArray(adTrfTL3MinOdds);

   adTrfFDL3MaxOdds := InitMaxDArray(adTrfFDL3MaxOdds);
   adTrfBDL3MaxOdds := InitMaxDArray(adTrfBDL3MaxOdds);
   adTrfTL3MaxOdds := InitMaxDArray(adTrfTL3MaxOdds);

   //
   alMudFDLRank := InitLArray(alMudFDLRank);
   alMudBDLRank := InitLArray(alMudBDLRank);
   alMudTLRank := InitLArray(alMudTLRank);

   adMudFDLOdds := InitDArray(adMudFDLOdds);
   adMudBDLOdds := InitDArray(adMudBDLOdds);
   adMudTLOdds := InitDArray(adMudTLOdds);

   adMudFDLMinOdds := InitMinDArray(adMudFDLMinOdds);
   adMudBDLMinOdds := InitMinDArray(adMudBDLMinOdds);
   adMudTLMinOdds := InitMinDArray(adMudTLMinOdds);

   adMudFDLMaxOdds := InitMaxDArray(adMudFDLMaxOdds);
   adMudBDLMaxOdds := InitMaxDArray(adMudBDLMaxOdds);
   adMudTLMaxOdds := InitMaxDArray(adMudTLMaxOdds);

   //
   alMudFDL0Rank := InitLArray(alMudFDL0Rank);
   alMudBDL0Rank := InitLArray(alMudBDL0Rank);
   alMudTL0Rank := InitLArray(alMudTL0Rank);

   adMudFDL0Odds := InitDArray(adMudFDL0Odds);
   adMudBDL0Odds := InitDArray(adMudBDL0Odds);
   adMudTL0Odds := InitDArray(adMudTL0Odds);

   adMudFDL0MinOdds := InitMinDArray(adMudFDL0MinOdds);
   adMudBDL0MinOdds := InitMinDArray(adMudBDL0MinOdds);
   adMudTL0MinOdds := InitMinDArray(adMudTL0MinOdds);

   adMudFDL0MaxOdds := InitMaxDArray(adMudFDL0MaxOdds);
   adMudBDL0MaxOdds := InitMaxDArray(adMudBDL0MaxOdds);
   adMudTL0MaxOdds := InitMaxDArray(adMudTL0MaxOdds);

   //
   alMudFDL1Rank := InitLArray(alMudFDL1Rank);
   alMudBDL1Rank := InitLArray(alMudBDL1Rank);
   alMudTL1Rank := InitLArray(alMudTL1Rank);

   adMudFDL1Odds := InitDArray(adMudFDL1Odds);
   adMudBDL1Odds := InitDArray(adMudBDL1Odds);
   adMudTL1Odds := InitDArray(adMudTL1Odds);

   adMudFDL1MinOdds := InitMinDArray(adMudFDL1MinOdds);
   adMudBDL1MinOdds := InitMinDArray(adMudBDL1MinOdds);
   adMudTL1MinOdds := InitMinDArray(adMudTL1MinOdds);

   adMudFDL1MaxOdds := InitMaxDArray(adMudFDL1MaxOdds);
   adMudBDL1MaxOdds := InitMaxDArray(adMudBDL1MaxOdds);
   adMudTL1MaxOdds := InitMaxDArray(adMudTL1MaxOdds);

   //
   alMudFDL2Rank := InitLArray(alMudFDL2Rank);
   alMudBDL2Rank := InitLArray(alMudBDL2Rank);
   alMudTL2Rank := InitLArray(alMudTL2Rank);

   adMudFDL2Odds := InitDArray(adMudFDL2Odds);
   adMudBDL2Odds := InitDArray(adMudBDL2Odds);
   adMudTL2Odds := InitDArray(adMudTL2Odds);

   adMudFDL2MinOdds := InitMinDArray(adMudFDL2MinOdds);
   adMudBDL2MinOdds := InitMinDArray(adMudBDL2MinOdds);
   adMudTL2MinOdds := InitMinDArray(adMudTL2MinOdds);

   adMudFDL2MaxOdds := InitMaxDArray(adMudFDL2MaxOdds);
   adMudBDL2MaxOdds := InitMaxDArray(adMudBDL2MaxOdds);
   adMudTL2MaxOdds := InitMaxDArray(adMudTL2MaxOdds);

   //
   alMudFDL3Rank := InitLArray(alMudFDL3Rank);
   alMudBDL3Rank := InitLArray(alMudBDL3Rank);
   alMudTL3Rank := InitLArray(alMudTL3Rank);

   adMudFDL3Odds := InitDArray(adMudFDL3Odds);
   adMudBDL3Odds := InitDArray(adMudBDL3Odds);
   adMudTL3Odds := InitDArray(adMudTL3Odds);

   adMudFDL3MinOdds := InitMinDArray(adMudFDL3MinOdds);
   adMudBDL3MinOdds := InitMinDArray(adMudBDL3MinOdds);
   adMudTL3MinOdds := InitMinDArray(adMudTL3MinOdds);

   adMudFDL3MaxOdds := InitMaxDArray(adMudFDL3MaxOdds);
   adMudBDL3MaxOdds := InitMaxDArray(adMudBDL3MaxOdds);
   adMudTL3MaxOdds := InitMaxDArray(adMudTL3MaxOdds);

   //
   alEarlyPaceRank := InitLArray(alEarlyPaceRank);
   adEarlyPaceOdds := InitDArray(adEarlyPaceOdds);
   adEarlyPaceMinOdds := InitDArray(adEarlyPaceMinOdds);
   adEarlyPaceMaxOdds := InitDArray(adEarlyPaceMaxOdds);

   alMiddlePaceRank := InitLArray(alMiddlePaceRank);
   adMiddlePaceOdds := InitDArray(adMiddlePaceOdds);
   adMiddlePaceMinOdds := InitDArray(adMiddlePaceMinOdds);
   adMiddlePaceMaxOdds := InitDArray(adMiddlePaceMaxOdds);

   alLatePaceRank := InitLArray(alLatePaceRank);
   adLatePaceOdds := InitDArray(adLatePaceOdds);
   adLatePaceMinOdds := InitDArray(adLatePaceMinOdds);
   adLatePaceMaxOdds := InitDArray(adLatePaceMaxOdds);

   //
   alEarlyPacePosRank := InitLArray(alEarlyPacePosRank);
   adEarlyPacePosOdds := InitDArray(adEarlyPacePosOdds);
   adEarlyPacePosMinOdds := InitDArray(adEarlyPacePosMinOdds);
   adEarlyPacePosMaxOdds := InitDArray(adEarlyPacePosMaxOdds);

   alMiddlePacePosRank := InitLArray(alMiddlePacePosRank);
   adMiddlePacePosOdds := InitDArray(adMiddlePacePosOdds);
   adMiddlePacePosMinOdds := InitDArray(adMiddlePacePosMinOdds);
   adMiddlePacePosMaxOdds := InitDArray(adMiddlePacePosMaxOdds);

   alLatePacePosRank := InitLArray(alLatePacePosRank);
   adLatePacePosOdds := InitDArray(adLatePacePosOdds);
   adLatePacePosMinOdds := InitDArray(adLatePacePosMinOdds);
   adLatePacePosMaxOdds := InitDArray(adLatePacePosMaxOdds);

   //
   alDamAllWinPctRank := InitLArray(alDamAllWinPctRank);
   adDamAllWinPctOdds := InitDArray(adDamAllWinPctOdds);
   adDamAllWinPctMinOdds := InitDArray(adDamAllWinPctMinOdds);
   adDamAllWinPctMaxOdds := InitDArray(adDamAllWinPctMaxOdds);

   alDamAllTurfWinPctRank := InitLArray(alDamAllTurfWinPctRank);
   adDamAllTurfWinPctOdds := InitDArray(adDamAllTurfWinPctOdds);
   adDamAllTurfWinPctMinOdds := InitDArray(adDamAllTurfWinPctMinOdds);
   adDamAllTurfWinPctMaxOdds := InitDArray(adDamAllTurfWinPctMaxOdds);

   alDamAllMudWinPctRank := InitLArray(alDamAllMudWinPctRank);
   adDamAllMudWinPctOdds := InitDArray(adDamAllMudWinPctOdds);
   adDamAllMudWinPctMinOdds := InitDArray(adDamAllMudWinPctMinOdds);
   adDamAllMudWinPctMaxOdds := InitDArray(adDamAllMudWinPctMaxOdds);

   //
   alDamSireAllWinPctRank := InitLArray(alDamSireAllWinPctRank);
   adDamSireAllWinPctOdds := InitDArray(adDamSireAllWinPctOdds);
   adDamSireAllWinPctMinOdds := InitDArray(adDamSireAllWinPctMinOdds);
   adDamSireAllWinPctMaxOdds := InitDArray(adDamSireAllWinPctMaxOdds);

   alDamSireAllTurfWinPctRank := InitLArray(alDamSireAllTurfWinPctRank);
   adDamSireAllTurfWinPctOdds := InitDArray(adDamSireAllTurfWinPctOdds);
   adDamSireAllTurfWinPctMinOdds := InitDArray(adDamSireAllTurfWinPctMinOdds);
   adDamSireAllTurfWinPctMaxOdds := InitDArray(adDamSireAllTurfWinPctMaxOdds);

   alDamSireAllMudWinPctRank := InitLArray(alDamSireAllMudWinPctRank);
   adDamSireAllMudWinPctOdds := InitDArray(adDamSireAllMudWinPctOdds);
   adDamSireAllMudWinPctMinOdds := InitDArray(adDamSireAllMudWinPctMinOdds);
   adDamSireAllMudWinPctMaxOdds := InitDArray(adDamSireAllMudWinPctMaxOdds);

   //
   alSireAllWinPctRank := InitLArray(alSireAllWinPctRank);
   adSireAllWinPctOdds := InitDArray(adSireAllWinPctOdds);
   adSireAllWinPctMinOdds := InitDArray(adSireAllWinPctMinOdds);
   adSireAllWinPctMaxOdds := InitDArray(adSireAllWinPctMaxOdds);

   alSireAllTurfWinPctRank := InitLArray(alSireAllTurfWinPctRank);
   adSireAllTurfWinPctOdds := InitDArray(adSireAllTurfWinPctOdds);
   adSireAllTurfWinPctMinOdds := InitDArray(adSireAllTurfWinPctMinOdds);
   adSireAllTurfWinPctMaxOdds := InitDArray(adSireAllTurfWinPctMaxOdds);

   alSireAllMudWinPctRank := InitLArray(alSireAllMudWinPctRank);
   adSireAllMudWinPctOdds := InitDArray(adSireAllMudWinPctOdds);
   adSireAllMudWinPctMinOdds := InitDArray(adSireAllMudWinPctMinOdds);
   adSireAllMudWinPctMaxOdds := InitDArray(adSireAllMudWinPctMaxOdds);

   //
   alMorningLineTo1Rank := InitLArray(alMorningLineTo1Rank);
   adMorningLineTo1Odds := InitDArray(adMorningLineTo1Odds);
   adMorningLineTo1MinOdds := InitMinDArray(adMorningLineTo1MinOdds);
   adMorningLineTo1MaxOdds := InitMaxDArray(adMorningLineTo1MaxOdds);

   //
   alLastSpeedRank := InitLArray(alLastSpeedRank);
   adLastSpeedOdds := InitDArray(adLastSpeedOdds);
   adLastSpeedMinOdds := InitDArray(adLastSpeedMinOdds);
   adLastSpeedMaxOdds := InitDArray(adLastSpeedMaxOdds);

   //
   alPowerRank := InitLArray(alPowerRank);
   adPowerOdds := InitDArray(adPowerOdds);
   adPowerMinOdds := InitMinDArray(adPowerMinOdds);
   adPowerMaxOdds := InitMaxDArray(adPowerMaxOdds);

   //
   alAvgClassRank := InitLArray(alAvgClassRank);
   adAvgClassOdds := InitDArray(adAvgClassOdds);
   adAvgClassMinOdds := InitMinDArray(adAvgClassMinOdds);
   adAvgClassMaxOdds := InitMaxDArray(adAvgClassMaxOdds);

   //
//   alFinalWinPctRank := InitLArray(alFinalWinPctRank);
//   adFinalWinPctOdds := InitDArray(adFinalWinPctOdds);
//   adFinalWinPctMinOdds := InitMinDArray(adFinalWinPctMinOdds);
//   adFinalWinPctMaxOdds := InitMaxDArray(adFinalWinPctMaxOdds);

   //
   alTodaysWagerWinPctRank := InitLArray(alTodaysWagerWinPctRank);
   adTodaysWagerOrderOdds := InitDArray(adTodaysWagerOrderOdds);
   adTodaysWagerOrderMinOdds := InitMinDArray(adTodaysWagerOrderMinOdds);
   adTodaysWagerOrderMaxOdds := InitMaxDArray(adTodaysWagerOrderMaxOdds);

   //
//   alPrimaryWinPctRank := InitLArray(alPrimaryWinPctRank);
//   adPrimaryWinPctOdds := InitDArray(adPrimaryWinPctOdds);
//   adPrimaryWinPctMinOdds := InitMinDArray(adPrimaryWinPctMinOdds);
//   adPrimaryWinPctMaxOdds := InitMaxDArray(adPrimaryWinPctMaxOdds);

   //
//   alSecondaryWinPctRank := InitLArray(alSecondaryWinPctRank);
//   adSecondaryWinPctOdds := InitDArray(adSecondaryWinPctOdds);
//   adSecondaryWinPctMinOdds := InitMinDArray(adSecondaryWinPctMinOdds);
//   adSecondaryWinPctMaxOdds := InitMaxDArray(adSecondaryWinPctMaxOdds);

   //
//   alDefaultWinPctRank := InitLArray(alDefaultWinPctRank);
//   adDefaultWinPctOdds := InitDArray(adDefaultWinPctOdds);
//   adDefaultWinPctMinOdds := InitMinDArray(adDefaultWinPctMinOdds);
//   adDefaultWinPctMaxOdds := InitMaxDArray(adDefaultWinPctMaxOdds);

   //
   alAvgSpeedRank := InitLArray(alAvgSpeedRank);
   adAvgSpeedOdds := InitDArray(adAvgSpeedOdds);
   adAvgSpeedMinOdds := InitMinDArray(adAvgSpeedMinOdds);
   adAvgSpeedMaxOdds := InitMaxDArray(adAvgSpeedMaxOdds);


   //
   alQSP1stCallRank := InitLArray(alQSP1stCallRank);
   adQSP1stCallOdds := InitDArray(adQSP1stCallOdds);
   adQSP1stCallMinOdds := InitMinDArray(adQSP1stCallMinOdds);
   adQSP1stCallMaxOdds := InitMaxDArray(adQSP1stCallMaxOdds);

   alKSP1stCallRank := InitLArray(alKSP1stCallRank);
   adKSP1stCallOdds := InitDArray(adKSP1stCallOdds);
   adKSP1stCallMinOdds := InitMinDArray(adKSP1stCallMinOdds);
   adKSP1stCallMaxOdds := InitMaxDArray(adKSP1stCallMaxOdds);

   //
   alQSP2ndCallRank := InitLArray(alQSP2ndCallRank);
   adQSP2ndCallOdds := InitDArray(adQSP2ndCallOdds);
   adQSP2ndCallMinOdds := InitMinDArray(adQSP2ndCallMinOdds);
   adQSP2ndCallMaxOdds := InitMaxDArray(adQSP2ndCallMaxOdds);

   alKSP2ndCallRank := InitLArray(alKSP2ndCallRank);
   adKSP2ndCallOdds := InitDArray(adKSP2ndCallOdds);
   adKSP2ndCallMinOdds := InitMinDArray(adKSP2ndCallMinOdds);
   adKSP2ndCallMaxOdds := InitMaxDArray(adKSP2ndCallMaxOdds);

   //
   alTrnTrackRank := InitLArray(alTrnTrackRank);
   adTrnTrackOdds := InitDArray(adTrnTrackOdds);
   adTrnTrackMinOdds := InitMinDArray(adTrnTrackMinOdds);
   adTrnTrackMaxOdds := InitMaxDArray(adTrnTrackMaxOdds);

   alJkyTrackRank := InitLArray(alJkyTrackRank);
   adJkyTrackOdds := InitDArray(adJkyTrackOdds);
   adJkyTrackMinOdds := InitMinDArray(adJkyTrackMinOdds);
   adJkyTrackMaxOdds := InitMaxDArray(adJkyTrackMaxOdds);

   alTrnWinsRank := InitLArray(alTrnWinsRank);
   adTrnWinsOdds := InitDArray(adTrnWinsOdds);
   adTrnWinsMinOdds := InitMinDArray(adTrnWinsMinOdds);
   adTrnWinsMaxOdds := InitMaxDArray(adTrnWinsMaxOdds);

   alTrnEarningsRank := InitLArray(alTrnEarningsRank);
   adTrnEarningsOdds := InitDArray(adTrnEarningsOdds);
   adTrnEarningsMinOdds := InitMinDArray(adTrnEarningsMinOdds);
   adTrnEarningsMaxOdds := InitMaxDArray(adTrnEarningsMaxOdds);

   //
   alJkyWinsRank := InitLArray(alJkyWinsRank);
   adJkyWinsOdds := InitDArray(adJkyWinsOdds);
   adJkyWinsMinOdds := InitMinDArray(adJkyWinsMinOdds);
   adJkyWinsMaxOdds := InitMaxDArray(adJkyWinsMaxOdds);

   alJkyEarningsRank := InitLArray(alJkyEarningsRank);
   adJkyEarningsOdds := InitDArray(adJkyEarningsOdds);
   adJkyEarningsMinOdds := InitMinDArray(adJkyEarningsMinOdds);
   adJkyEarningsMaxOdds := InitMaxDArray(adJkyEarningsMaxOdds);

   //
   alOwnWinsRank := InitLArray(alOwnWinsRank);
   adOwnWinsOdds := InitDArray(adOwnWinsOdds);
   adOwnWinsMinOdds := InitMinDArray(adOwnWinsMinOdds);
   adOwnWinsMaxOdds := InitMaxDArray(adOwnWinsMaxOdds);

   alOwnEarningsRank := InitLArray(alOwnEarningsRank);
   adOwnEarningsOdds := InitDArray(adOwnEarningsOdds);
   adOwnEarningsMinOdds := InitMinDArray(adOwnEarningsMinOdds);
   adOwnEarningsMaxOdds := InitMaxDArray(adOwnEarningsMaxOdds);

end;

procedure IncLinerArrays
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable
   );
var

   fOdds: double;
   iFinishPos: integer;
   sSurface: string;
   sTrkCond: string;
   sTrkCode: string;
   sRaceType: string;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   iFinalWinPctRank: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;


begin
   sSurface := tblE.FieldByName('Surface').AsString;
   sTrkCond := tblE.FieldByName('TrkCond').AsString;
   sRaceType := tblE.FieldByName('RaceType').AsString;

   iFinishPos := tblE.FieldByName('FinishPos').AsInteger;
   fOdds := tblE.FieldByName('Odds').AsFloat;

   iEarlyPaceRank := tblE.FieldByName('EarlyPaceRank').AsInteger;
   iMiddlePaceRank := tblE.FieldByName('MiddlePaceRank').AsInteger;
   iLatePaceRank := tblE.FieldByName('LatePaceRank').AsInteger;

   fEarlyPace := tblE.FieldByName('EarlyPace').AsFloat;
   fMiddlePace := tblE.FieldByName('MiddlePace').AsFloat;
   fLatePace := tblE.FieldByName('LatePace').AsFloat;

   iEarlyPacePosRank := tblE.FieldByName('EarlyPacePosRank').AsInteger;
   iMiddlePacePosRank := tblE.FieldByName('MiddlePacePosRank').AsInteger;
   iLatePacePosRank := tblE.FieldByName('LatePacePosRank').AsInteger;

   if ((tblE.FieldByName('EarlyPacePos').AsFloat = 9999) or
      (tblE.FieldByName('MiddlePacePos').AsFloat = 9999) or
      (tblE.FieldByName('LatePacePos').AsFloat = 9999)) then begin
      exit;
   end;

   if ((iEarlyPaceRank = 0) or (iMiddlePaceRank = 0) or (iLatePaceRank = 0)) then begin
      exit;
   end;

   if ((iEarlyPacePosRank = 0) or (iMiddlePacePosRank = 0) or (iLatePacePosRank = 0)) then begin
      exit;
   end;

   // Dirt Fast Track
   if ((sSurface = 'D') and (sTrkCond = 'FT')) then begin

      // Front Double liner
      // _  _  X
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         alFDLRank := IncLArray(alFDLRank, 1, iFinishPos);
         adFDLOdds := IncDArray(fOdds, adFDLOdds, 1, iFinishPos);
         adFDLMinOdds := IncMinDArray(fOdds, adFDLMinOdds, 1, iFinishPos);
         adFDLMaxOdds := IncMaxDArray(fOdds, adFDLMaxOdds, 1, iFinishPos);
      end else begin
         alFDLRank := IncLArray(alFDLRank, 2, iFinishPos);
         adFDLOdds := IncDArray(fOdds, adFDLOdds, 2, iFinishPos);
         adFDLMinOdds := IncMinDArray(fOdds, adFDLMinOdds, 2, iFinishPos);
         adFDLMaxOdds := IncMaxDArray(fOdds, adFDLMaxOdds, 2, iFinishPos);
      end;

      // Back Double liner
      // X  _  _
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         alBDLRank := IncLArray(alBDLRank, 1, iFinishPos);
         adBDLOdds := IncDArray(fOdds, adBDLOdds, 1, iFinishPos);
         adBDLMinOdds := IncMinDArray(fOdds, adBDLMinOdds, 1, iFinishPos);
         adBDLMaxOdds := IncMaxDArray(fOdds, adBDLMaxOdds, 1, iFinishPos);
      end else begin
         alBDLRank := IncLArray(alBDLRank, 2, iFinishPos);
         adBDLOdds := IncDArray(fOdds, adBDLOdds, 2, iFinishPos);
         adBDLMinOdds := IncMinDArray(fOdds, adBDLMinOdds, 2, iFinishPos);
         adBDLMaxOdds := IncMaxDArray(fOdds, adBDLMaxOdds, 2, iFinishPos);
      end;

      // Triple liner
      // _  _  _
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         alTLRank := IncLArray(alTLRank, 1, iFinishPos);
         adTLOdds := IncDArray(fOdds, adTLOdds, 1, iFinishPos);
         adTLMinOdds := IncMinDArray(fOdds, adTLMinOdds, 1, iFinishPos);
         adTLMaxOdds := IncMaxDArray(fOdds, adTLMaxOdds, 1, iFinishPos);
      end else begin
         alTLRank := IncLArray(alTLRank, 2, iFinishPos);
         adTLOdds := IncDArray(fOdds, adTLOdds, 2, iFinishPos);
         adTLMinOdds := IncMinDArray(fOdds, adTLMinOdds, 2, iFinishPos);
         adTLMaxOdds := IncMaxDArray(fOdds, adTLMaxOdds, 2, iFinishPos);
      end;

      // Front Double liner 0 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         //  X  X  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alFDL0Rank := IncLArray(alFDL0Rank, 1, iFinishPos);
            adFDL0Odds := IncDArray(fOdds, adFDL0Odds, 1, iFinishPos);
            adFDL0MinOdds := IncMinDArray(fOdds, adFDL0MinOdds, 1, iFinishPos);
            adFDL0MaxOdds := IncMaxDArray(fOdds, adFDL0MaxOdds, 1, iFinishPos);
         end else begin
            alFDL0Rank := IncLArray(alFDL0Rank, 2, iFinishPos);
            adFDL0Odds := IncDArray(fOdds, adFDL0Odds, 2, iFinishPos);
            adFDL0MinOdds := IncMinDArray(fOdds, adFDL0MinOdds, 2, iFinishPos);
            adFDL0MaxOdds := IncMaxDArray(fOdds, adFDL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 1 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alFDL1Rank := IncLArray(alFDL1Rank, 1, iFinishPos);
            adFDL1Odds := IncDArray(fOdds, adFDL1Odds, 1, iFinishPos);
            adFDL1MinOdds := IncMinDArray(fOdds, adFDL1MinOdds, 1, iFinishPos);
            adFDL1MaxOdds := IncMaxDArray(fOdds, adFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alFDL1Rank := IncLArray(alFDL1Rank, 2, iFinishPos);
            adFDL1Odds := IncDArray(fOdds, adFDL1Odds, 2, iFinishPos);
            adFDL1MinOdds := IncMinDArray(fOdds, adFDL1MinOdds, 2, iFinishPos);
            adFDL1MaxOdds := IncMaxDArray(fOdds, adFDL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alFDL1Rank := IncLArray(alFDL1Rank, 1, iFinishPos);
            adFDL1Odds := IncDArray(fOdds, adFDL1Odds, 1, iFinishPos);
            adFDL1MinOdds := IncMinDArray(fOdds, adFDL1MinOdds, 1, iFinishPos);
            adFDL1MaxOdds := IncMaxDArray(fOdds, adFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alFDL1Rank := IncLArray(alFDL1Rank, 2, iFinishPos);
            adFDL1Odds := IncDArray(fOdds, adFDL1Odds, 2, iFinishPos);
            adFDL1MinOdds := IncMinDArray(fOdds, adFDL1MinOdds, 2, iFinishPos);
            adFDL1MaxOdds := IncMaxDArray(fOdds, adFDL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alFDL1Rank := IncLArray(alFDL1Rank, 1, iFinishPos);
            adFDL1Odds := IncDArray(fOdds, adFDL1Odds, 1, iFinishPos);
            adFDL1MinOdds := IncMinDArray(fOdds, adFDL1MinOdds, 1, iFinishPos);
            adFDL1MaxOdds := IncMaxDArray(fOdds, adFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alFDL1Rank := IncLArray(alFDL1Rank, 2, iFinishPos);
            adFDL1Odds := IncDArray(fOdds, adFDL1Odds, 2, iFinishPos);
            adFDL1MinOdds := IncMinDArray(fOdds, adFDL1MinOdds, 2, iFinishPos);
            adFDL1MaxOdds := IncMaxDArray(fOdds, adFDL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 2 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alFDL2Rank := IncLArray(alFDL2Rank, 1, iFinishPos);
            adFDL2Odds := IncDArray(fOdds, adFDL2Odds, 1, iFinishPos);
            adFDL2MinOdds := IncMinDArray(fOdds, adFDL2MinOdds, 1, iFinishPos);
            adFDL2MaxOdds := IncMaxDArray(fOdds, adFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alFDL2Rank := IncLArray(alFDL2Rank, 2, iFinishPos);
            adFDL2Odds := IncDArray(fOdds, adFDL2Odds, 2, iFinishPos);
            adFDL2MinOdds := IncMinDArray(fOdds, adFDL2MinOdds, 2, iFinishPos);
            adFDL2MaxOdds := IncMaxDArray(fOdds, adFDL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alFDL2Rank := IncLArray(alFDL2Rank, 1, iFinishPos);
            adFDL2Odds := IncDArray(fOdds, adFDL2Odds, 1, iFinishPos);
            adFDL2MinOdds := IncMinDArray(fOdds, adFDL2MinOdds, 1, iFinishPos);
            adFDL2MaxOdds := IncMaxDArray(fOdds, adFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alFDL2Rank := IncLArray(alFDL2Rank, 2, iFinishPos);
            adFDL2Odds := IncDArray(fOdds, adFDL2Odds, 2, iFinishPos);
            adFDL2MinOdds := IncMinDArray(fOdds, adFDL2MinOdds, 2, iFinishPos);
            adFDL2MaxOdds := IncMaxDArray(fOdds, adFDL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alFDL2Rank := IncLArray(alFDL2Rank, 1, iFinishPos);
            adFDL2Odds := IncDArray(fOdds, adFDL2Odds, 1, iFinishPos);
            adFDL2MinOdds := IncMinDArray(fOdds, adFDL2MinOdds, 1, iFinishPos);
            adFDL2MaxOdds := IncMaxDArray(fOdds, adFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alFDL2Rank := IncLArray(alFDL2Rank, 2, iFinishPos);
            adFDL2Odds := IncDArray(fOdds, adFDL2Odds, 2, iFinishPos);
            adFDL2MinOdds := IncMinDArray(fOdds, adFDL2MinOdds, 2, iFinishPos);
            adFDL2MaxOdds := IncMaxDArray(fOdds, adFDL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 3 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         //  *  *  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alFDL3Rank := IncLArray(alFDL3Rank, 1, iFinishPos);
            adFDL3Odds := IncDArray(fOdds, adFDL3Odds, 1, iFinishPos);
            adFDL3MinOdds := IncMinDArray(fOdds, adFDL3MinOdds, 1, iFinishPos);
            adFDL3MaxOdds := IncMaxDArray(fOdds, adFDL3MaxOdds, 1, iFinishPos);
         end else begin
            alFDL3Rank := IncLArray(alFDL3Rank, 2, iFinishPos);
            adFDL3Odds := IncDArray(fOdds, adFDL3Odds, 2, iFinishPos);
            adFDL3MinOdds := IncMinDArray(fOdds, adFDL3MinOdds, 2, iFinishPos);
            adFDL3MaxOdds := IncMaxDArray(fOdds, adFDL3MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 0 dots
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         //  X  X  X
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
            alBDL0Rank := IncLArray(alBDL0Rank, 1, iFinishPos);
            adBDL0Odds := IncDArray(fOdds, adBDL0Odds, 1, iFinishPos);
            adBDL0MinOdds := IncMinDArray(fOdds, adBDL0MinOdds, 1, iFinishPos);
            adBDL0MaxOdds := IncMaxDArray(fOdds, adBDL0MaxOdds, 1, iFinishPos);
         end else begin
            alBDL0Rank := IncLArray(alBDL0Rank, 2, iFinishPos);
            adBDL0Odds := IncDArray(fOdds, adBDL0Odds, 2, iFinishPos);
            adBDL0MinOdds := IncMinDArray(fOdds, adBDL0MinOdds, 2, iFinishPos);
            adBDL0MaxOdds := IncMaxDArray(fOdds, adBDL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 1 dot
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alBDL1Rank := IncLArray(alBDL1Rank, 1, iFinishPos);
            adBDL1Odds := IncDArray(fOdds, adBDL1Odds, 1, iFinishPos);
            adBDL1MinOdds := IncMinDArray(fOdds, adBDL1MinOdds, 1, iFinishPos);
            adBDL1MaxOdds := IncMaxDArray(fOdds, adBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alBDL1Rank := IncLArray(alBDL1Rank, 2, iFinishPos);
            adBDL1Odds := IncDArray(fOdds, adBDL1Odds, 2, iFinishPos);
            adBDL1MinOdds := IncMinDArray(fOdds, adBDL1MinOdds, 2, iFinishPos);
            adBDL1MaxOdds := IncMaxDArray(fOdds, adBDL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alBDL1Rank := IncLArray(alBDL1Rank, 1, iFinishPos);
            adBDL1Odds := IncDArray(fOdds, adBDL1Odds, 1, iFinishPos);
            adBDL1MinOdds := IncMinDArray(fOdds, adBDL1MinOdds, 1, iFinishPos);
            adBDL1MaxOdds := IncMaxDArray(fOdds, adBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alBDL1Rank := IncLArray(alBDL1Rank, 2, iFinishPos);
            adBDL1Odds := IncDArray(fOdds, adBDL1Odds, 2, iFinishPos);
            adBDL1MinOdds := IncMinDArray(fOdds, adBDL1MinOdds, 2, iFinishPos);
            adBDL1MaxOdds := IncMaxDArray(fOdds, adBDL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alBDL1Rank := IncLArray(alBDL1Rank, 1, iFinishPos);
            adBDL1Odds := IncDArray(fOdds, adBDL1Odds, 1, iFinishPos);
            adBDL1MinOdds := IncMinDArray(fOdds, adBDL1MinOdds, 1, iFinishPos);
            adBDL1MaxOdds := IncMaxDArray(fOdds, adBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alBDL1Rank := IncLArray(alBDL1Rank, 2, iFinishPos);
            adBDL1Odds := IncDArray(fOdds, adBDL1Odds, 2, iFinishPos);
            adBDL1MinOdds := IncMinDArray(fOdds, adBDL1MinOdds, 2, iFinishPos);
            adBDL1MaxOdds := IncMaxDArray(fOdds, adBDL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 2 dot
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alBDL2Rank := IncLArray(alBDL2Rank, 1, iFinishPos);
            adBDL2Odds := IncDArray(fOdds, adBDL2Odds, 1, iFinishPos);
            adBDL2MinOdds := IncMinDArray(fOdds, adBDL2MinOdds, 1, iFinishPos);
            adBDL2MaxOdds := IncMaxDArray(fOdds, adBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alBDL2Rank := IncLArray(alBDL2Rank, 2, iFinishPos);
            adBDL2Odds := IncDArray(fOdds, adBDL2Odds, 2, iFinishPos);
            adBDL2MinOdds := IncMinDArray(fOdds, adBDL2MinOdds, 2, iFinishPos);
            adBDL2MaxOdds := IncMaxDArray(fOdds, adBDL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alBDL2Rank := IncLArray(alBDL2Rank, 1, iFinishPos);
            adBDL2Odds := IncDArray(fOdds, adBDL2Odds, 1, iFinishPos);
            adBDL2MinOdds := IncMinDArray(fOdds, adBDL2MinOdds, 1, iFinishPos);
            adBDL2MaxOdds := IncMaxDArray(fOdds, adBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alBDL2Rank := IncLArray(alBDL2Rank, 2, iFinishPos);
            adBDL2Odds := IncDArray(fOdds, adBDL2Odds, 2, iFinishPos);
            adBDL2MinOdds := IncMinDArray(fOdds, adBDL2MinOdds, 2, iFinishPos);
            adBDL2MaxOdds := IncMaxDArray(fOdds, adBDL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alBDL2Rank := IncLArray(alBDL2Rank, 1, iFinishPos);
            adBDL2Odds := IncDArray(fOdds, adBDL2Odds, 1, iFinishPos);
            adBDL2MinOdds := IncMinDArray(fOdds, adBDL2MinOdds, 1, iFinishPos);
            adBDL2MaxOdds := IncMaxDArray(fOdds, adBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alBDL2Rank := IncLArray(alBDL2Rank, 2, iFinishPos);
            adBDL2Odds := IncDArray(fOdds, adBDL2Odds, 2, iFinishPos);
            adBDL2MinOdds := IncMinDArray(fOdds, adBDL2MinOdds, 2, iFinishPos);
            adBDL2MaxOdds := IncMaxDArray(fOdds, adBDL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 3 dots
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alBDL3Rank := IncLArray(alBDL3Rank, 1, iFinishPos);
            adBDL3Odds := IncDArray(fOdds, adBDL3Odds, 1, iFinishPos);
            adBDL3MinOdds := IncMinDArray(fOdds, adBDL3MinOdds, 1, iFinishPos);
            adBDL3MaxOdds := IncMaxDArray(fOdds, adBDL3MaxOdds, 1, iFinishPos);
         end else begin
            alBDL3Rank := IncLArray(alBDL3Rank, 2, iFinishPos);
            adBDL3Odds := IncDArray(fOdds, adBDL3Odds, 2, iFinishPos);
            adBDL3MinOdds := IncMinDArray(fOdds, adBDL3MinOdds, 2, iFinishPos);
            adBDL3MaxOdds := IncMaxDArray(fOdds, adBDL3MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 0 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
            alTL0Rank := IncLArray(alTL0Rank, 1, iFinishPos);
            adTL0Odds := IncDArray(fOdds, adTL0Odds, 1, iFinishPos);
            adTL0MinOdds := IncMinDArray(fOdds, adTL0MinOdds, 1, iFinishPos);
            adTL0MaxOdds := IncMaxDArray(fOdds, adTL0MaxOdds, 1, iFinishPos);
         end else begin
            alTL0Rank := IncLArray(alTL0Rank, 2, iFinishPos);
            adTL0Odds := IncDArray(fOdds, adTL0Odds, 2, iFinishPos);
            adTL0MinOdds := IncMinDArray(fOdds, adTL0MinOdds, 2, iFinishPos);
            adTL0MaxOdds := IncMaxDArray(fOdds, adTL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 1 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alTL1Rank := IncLArray(alTL1Rank, 1, iFinishPos);
            adTL1Odds := IncDArray(fOdds, adTL1Odds, 1, iFinishPos);
            adTL1MinOdds := IncMinDArray(fOdds, adTL1MinOdds, 1, iFinishPos);
            adTL1MaxOdds := IncMaxDArray(fOdds, adTL1MaxOdds, 1, iFinishPos);
         end else begin
            alTL1Rank := IncLArray(alTL1Rank, 2, iFinishPos);
            adTL1Odds := IncDArray(fOdds, adTL1Odds, 2, iFinishPos);
            adTL1MinOdds := IncMinDArray(fOdds, adTL1MinOdds, 2, iFinishPos);
            adTL1MaxOdds := IncMaxDArray(fOdds, adTL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alTL1Rank := IncLArray(alTL1Rank, 1, iFinishPos);
            adTL1Odds := IncDArray(fOdds, adTL1Odds, 1, iFinishPos);
            adTL1MinOdds := IncMinDArray(fOdds, adTL1MinOdds, 1, iFinishPos);
            adTL1MaxOdds := IncMaxDArray(fOdds, adTL1MaxOdds, 1, iFinishPos);
         end else begin
            alTL1Rank := IncLArray(alTL1Rank, 2, iFinishPos);
            adTL1Odds := IncDArray(fOdds, adTL1Odds, 2, iFinishPos);
            adTL1MinOdds := IncMinDArray(fOdds, adTL1MinOdds, 2, iFinishPos);
            adTL1MaxOdds := IncMaxDArray(fOdds, adTL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alTL1Rank := IncLArray(alTL1Rank, 1, iFinishPos);
            adTL1Odds := IncDArray(fOdds, adTL1Odds, 1, iFinishPos);
            adTL1MinOdds := IncMinDArray(fOdds, adTL1MinOdds, 1, iFinishPos);
            adTL1MaxOdds := IncMaxDArray(fOdds, adTL1MaxOdds, 1, iFinishPos);
         end else begin
            alTL1Rank := IncLArray(alTL1Rank, 2, iFinishPos);
            adTL1Odds := IncDArray(fOdds, adTL1Odds, 2, iFinishPos);
            adTL1MinOdds := IncMinDArray(fOdds, adTL1MinOdds, 2, iFinishPos);
            adTL1MaxOdds := IncMaxDArray(fOdds, adTL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 2 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alTL2Rank := IncLArray(alTL2Rank, 1, iFinishPos);
            adTL2Odds := IncDArray(fOdds, adTL2Odds, 1, iFinishPos);
            adTL2MinOdds := IncMinDArray(fOdds, adTL2MinOdds, 1, iFinishPos);
            adTL2MaxOdds := IncMaxDArray(fOdds, adTL2MaxOdds, 1, iFinishPos);
         end else begin
            alTL2Rank := IncLArray(alTL2Rank, 2, iFinishPos);
            adTL2Odds := IncDArray(fOdds, adTL2Odds, 2, iFinishPos);
            adTL2MinOdds := IncMinDArray(fOdds, adTL2MinOdds, 2, iFinishPos);
            adTL2MaxOdds := IncMaxDArray(fOdds, adTL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alTL2Rank := IncLArray(alTL2Rank, 1, iFinishPos);
            adTL2Odds := IncDArray(fOdds, adTL2Odds, 1, iFinishPos);
            adTL2MinOdds := IncMinDArray(fOdds, adTL2MinOdds, 1, iFinishPos);
            adTL2MaxOdds := IncMaxDArray(fOdds, adTL2MaxOdds, 1, iFinishPos);
         end else begin
            alTL2Rank := IncLArray(alTL2Rank, 2, iFinishPos);
            adTL2Odds := IncDArray(fOdds, adTL2Odds, 2, iFinishPos);
            adTL2MinOdds := IncMinDArray(fOdds, adTL2MinOdds, 2, iFinishPos);
            adTL2MaxOdds := IncMaxDArray(fOdds, adTL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTL2Rank := IncLArray(alTL2Rank, 1, iFinishPos);
            adTL2Odds := IncDArray(fOdds, adTL2Odds, 1, iFinishPos);
            adTL2MinOdds := IncMinDArray(fOdds, adTL2MinOdds, 1, iFinishPos);
            adTL2MaxOdds := IncMaxDArray(fOdds, adTL2MaxOdds, 1, iFinishPos);
         end else begin
            alTL2Rank := IncLArray(alTL2Rank, 2, iFinishPos);
            adTL2Odds := IncDArray(fOdds, adTL2Odds, 2, iFinishPos);
            adTL2MinOdds := IncMinDArray(fOdds, adTL2MinOdds, 2, iFinishPos);
            adTL2MaxOdds := IncMaxDArray(fOdds, adTL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 3 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         //  *  *  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTL3Rank := IncLArray(alTL3Rank, 1, iFinishPos);
            adTL3Odds := IncDArray(fOdds, adTL3Odds, 1, iFinishPos);
            adTL3MinOdds := IncMinDArray(fOdds, adTL3MinOdds, 1, iFinishPos);
            adTL3MaxOdds := IncMaxDArray(fOdds, adTL3MaxOdds, 1, iFinishPos);
         end else begin
            alTL3Rank := IncLArray(alTL3Rank, 2, iFinishPos);
            adTL3Odds := IncDArray(fOdds, adTL3Odds, 2, iFinishPos);
            adTL3MinOdds := IncMinDArray(fOdds, adTL3MinOdds, 2, iFinishPos);
            adTL3MaxOdds := IncMaxDArray(fOdds, adTL3MaxOdds, 2, iFinishPos);
         end;
      end;

      alEarlyPaceRank := IncLArray(alEarlyPaceRank, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adEarlyPaceOdds := IncDArray(fOdds, adEarlyPaceOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adEarlyPaceMinOdds := IncMinDArray(fOdds, adEarlyPaceMinOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adEarlyPaceMaxOdds := IncMaxDArray(fOdds, adEarlyPaceMaxOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);

      alMiddlePaceRank := IncLArray(alMiddlePaceRank, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adMiddlePaceOdds := IncDArray(fOdds, adMiddlePaceOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adMiddlePaceMinOdds := IncMinDArray(fOdds, adMiddlePaceMinOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adMiddlePaceMaxOdds := IncMaxDArray(fOdds, adMiddlePaceMaxOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);

      alLatePaceRank := IncLArray(alLatePaceRank, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adLatePaceOdds := IncDArray(fOdds, adLatePaceOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adLatePaceMinOdds := IncMinDArray(fOdds, adLatePaceMinOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adLatePaceMaxOdds := IncMaxDArray(fOdds, adLatePaceMaxOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
   end;

   //Turf
   if (sSurface = 'T') then begin

      // Front Double liner
         // _  _  X
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         alTrfFDLRank := IncLArray(alTrfFDLRank, 1, iFinishPos);
         adTrfFDLOdds := IncDArray(fOdds, adTrfFDLOdds, 1, iFinishPos);
         adTrfFDLMinOdds := IncMinDArray(fOdds, adTrfFDLMinOdds, 1, iFinishPos);
         adTrfFDLMaxOdds := IncMaxDArray(fOdds, adTrfFDLMaxOdds, 1, iFinishPos);
      end else begin
         alTrfFDLRank := IncLArray(alTrfFDLRank, 2, iFinishPos);
         adTrfFDLOdds := IncDArray(fOdds, adTrfFDLOdds, 2, iFinishPos);
         adTrfFDLMinOdds := IncMinDArray(fOdds, adTrfFDLMinOdds, 2, iFinishPos);
         adTrfFDLMaxOdds := IncMaxDArray(fOdds, adTrfFDLMaxOdds, 2, iFinishPos);
      end;

      // Back Double liner
         // X  _  _
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         alTrfBDLRank := IncLArray(alTrfBDLRank, 1, iFinishPos);
         adTrfBDLOdds := IncDArray(fOdds, adTrfBDLOdds, 1, iFinishPos);
         adTrfBDLMinOdds := IncMinDArray(fOdds, adTrfBDLMinOdds, 1, iFinishPos);
         adTrfBDLMaxOdds := IncMaxDArray(fOdds, adTrfBDLMaxOdds, 1, iFinishPos);
      end else begin
         alTrfBDLRank := IncLArray(alTrfBDLRank, 2, iFinishPos);
         adTrfBDLOdds := IncDArray(fOdds, adTrfBDLOdds, 2, iFinishPos);
         adTrfBDLMinOdds := IncMinDArray(fOdds, adTrfBDLMinOdds, 2, iFinishPos);
         adTrfBDLMaxOdds := IncMaxDArray(fOdds, adTrfBDLMaxOdds, 2, iFinishPos);
      end;

      // Triple liner
      // _  _  _
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         alTrfTLRank := IncLArray(alTrfTLRank, 1, iFinishPos);
         adTrfTLOdds := IncDArray(fOdds, adTrfTLOdds, 1, iFinishPos);
         adTrfTLMinOdds := IncMinDArray(fOdds, adTrfTLMinOdds, 1, iFinishPos);
         adTrfTLMaxOdds := IncMaxDArray(fOdds, adTrfTLMaxOdds, 1, iFinishPos);
      end else begin
         alTrfTLRank := IncLArray(alTrfTLRank, 2, iFinishPos);
         adTrfTLOdds := IncDArray(fOdds, adTrfTLOdds, 2, iFinishPos);
         adTrfTLMinOdds := IncMinDArray(fOdds, adTrfTLMinOdds, 2, iFinishPos);
         adTrfTLMaxOdds := IncMaxDArray(fOdds, adTrfTLMaxOdds, 2, iFinishPos);
      end;

      // Front Double liner 0 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         //  X  X  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alTrfFDL0Rank := IncLArray(alTrfFDL0Rank, 1, iFinishPos);
            adTrfFDL0Odds := IncDArray(fOdds, adTrfFDL0Odds, 1, iFinishPos);
            adTrfFDL0MinOdds := IncMinDArray(fOdds, adTrfFDL0MinOdds, 1, iFinishPos);
            adTrfFDL0MaxOdds := IncMaxDArray(fOdds, adTrfFDL0MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL0Rank := IncLArray(alTrfFDL0Rank, 2, iFinishPos);
            adTrfFDL0Odds := IncDArray(fOdds, adTrfFDL0Odds, 2, iFinishPos);
            adTrfFDL0MinOdds := IncMinDArray(fOdds, adTrfFDL0MinOdds, 2, iFinishPos);
            adTrfFDL0MaxOdds := IncMaxDArray(fOdds, adTrfFDL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 1 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alTrfFDL1Rank := IncLArray(alTrfFDL1Rank, 1, iFinishPos);
            adTrfFDL1Odds := IncDArray(fOdds, adTrfFDL1Odds, 1, iFinishPos);
            adTrfFDL1MinOdds := IncMinDArray(fOdds, adTrfFDL1MinOdds, 1, iFinishPos);
            adTrfFDL1MaxOdds := IncMaxDArray(fOdds, adTrfFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL1Rank := IncLArray(alTrfFDL1Rank, 2, iFinishPos);
            adTrfFDL1Odds := IncDArray(fOdds, adTrfFDL1Odds, 2, iFinishPos);
            adTrfFDL1MinOdds := IncMinDArray(fOdds, adTrfFDL1MinOdds, 2, iFinishPos);
            adTrfFDL1MaxOdds := IncMaxDArray(fOdds, adTrfFDL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alTrfFDL1Rank := IncLArray(alTrfFDL1Rank, 1, iFinishPos);
            adTrfFDL1Odds := IncDArray(fOdds, adTrfFDL1Odds, 1, iFinishPos);
            adTrfFDL1MinOdds := IncMinDArray(fOdds, adTrfFDL1MinOdds, 1, iFinishPos);
            adTrfFDL1MaxOdds := IncMaxDArray(fOdds, adTrfFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL1Rank := IncLArray(alTrfFDL1Rank, 2, iFinishPos);
            adTrfFDL1Odds := IncDArray(fOdds, adTrfFDL1Odds, 2, iFinishPos);
            adTrfFDL1MinOdds := IncMinDArray(fOdds, adTrfFDL1MinOdds, 2, iFinishPos);
            adTrfFDL1MaxOdds := IncMaxDArray(fOdds, adTrfFDL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alTrfFDL1Rank := IncLArray(alTrfFDL1Rank, 1, iFinishPos);
            adTrfFDL1Odds := IncDArray(fOdds, adTrfFDL1Odds, 1, iFinishPos);
            adTrfFDL1MinOdds := IncMinDArray(fOdds, adTrfFDL1MinOdds, 1, iFinishPos);
            adTrfFDL1MaxOdds := IncMaxDArray(fOdds, adTrfFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL1Rank := IncLArray(alTrfFDL1Rank, 2, iFinishPos);
            adTrfFDL1Odds := IncDArray(fOdds, adTrfFDL1Odds, 2, iFinishPos);
            adTrfFDL1MinOdds := IncMinDArray(fOdds, adTrfFDL1MinOdds, 2, iFinishPos);
            adTrfFDL1MaxOdds := IncMaxDArray(fOdds, adTrfFDL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 2 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alTrfFDL2Rank := IncLArray(alTrfFDL2Rank, 1, iFinishPos);
            adTrfFDL2Odds := IncDArray(fOdds, adTrfFDL2Odds, 1, iFinishPos);
            adTrfFDL2MinOdds := IncMinDArray(fOdds, adTrfFDL2MinOdds, 1, iFinishPos);
            adTrfFDL2MaxOdds := IncMaxDArray(fOdds, adTrfFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL2Rank := IncLArray(alTrfFDL2Rank, 2, iFinishPos);
            adTrfFDL2Odds := IncDArray(fOdds, adTrfFDL2Odds, 2, iFinishPos);
            adTrfFDL2MinOdds := IncMinDArray(fOdds, adTrfFDL2MinOdds, 2, iFinishPos);
            adTrfFDL2MaxOdds := IncMaxDArray(fOdds, adTrfFDL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alTrfFDL2Rank := IncLArray(alTrfFDL2Rank, 1, iFinishPos);
            adTrfFDL2Odds := IncDArray(fOdds, adTrfFDL2Odds, 1, iFinishPos);
            adTrfFDL2MinOdds := IncMinDArray(fOdds, adTrfFDL2MinOdds, 1, iFinishPos);
            adTrfFDL2MaxOdds := IncMaxDArray(fOdds, adTrfFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL2Rank := IncLArray(alTrfFDL2Rank, 2, iFinishPos);
            adTrfFDL2Odds := IncDArray(fOdds, adTrfFDL2Odds, 2, iFinishPos);
            adTrfFDL2MinOdds := IncMinDArray(fOdds, adTrfFDL2MinOdds, 2, iFinishPos);
            adTrfFDL2MaxOdds := IncMaxDArray(fOdds, adTrfFDL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTrfFDL2Rank := IncLArray(alTrfFDL2Rank, 1, iFinishPos);
            adTrfFDL2Odds := IncDArray(fOdds, adTrfFDL2Odds, 1, iFinishPos);
            adTrfFDL2MinOdds := IncMinDArray(fOdds, adTrfFDL2MinOdds, 1, iFinishPos);
            adTrfFDL2MaxOdds := IncMaxDArray(fOdds, adTrfFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL2Rank := IncLArray(alTrfFDL2Rank, 2, iFinishPos);
            adTrfFDL2Odds := IncDArray(fOdds, adTrfFDL2Odds, 2, iFinishPos);
            adTrfFDL2MinOdds := IncMinDArray(fOdds, adTrfFDL2MinOdds, 2, iFinishPos);
            adTrfFDL2MaxOdds := IncMaxDArray(fOdds, adTrfFDL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 3 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         //  *  *  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTrfFDL3Rank := IncLArray(alTrfFDL3Rank, 1, iFinishPos);
            adTrfFDL3Odds := IncDArray(fOdds, adTrfFDL3Odds, 1, iFinishPos);
            adTrfFDL3MinOdds := IncMinDArray(fOdds, adTrfFDL3MinOdds, 1, iFinishPos);
            adTrfFDL3MaxOdds := IncMaxDArray(fOdds, adTrfFDL3MaxOdds, 1, iFinishPos);
         end else begin
            alTrfFDL3Rank := IncLArray(alTrfFDL3Rank, 2, iFinishPos);
            adTrfFDL3Odds := IncDArray(fOdds, adTrfFDL3Odds, 2, iFinishPos);
            adTrfFDL3MinOdds := IncMinDArray(fOdds, adTrfFDL3MinOdds, 2, iFinishPos);
            adTrfFDL3MaxOdds := IncMaxDArray(fOdds, adTrfFDL3MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 0 dots
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         //  X  X  X
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
            alTrfBDL0Rank := IncLArray(alTrfBDL0Rank, 1, iFinishPos);
            adTrfBDL0Odds := IncDArray(fOdds, adTrfBDL0Odds, 1, iFinishPos);
            adTrfBDL0MinOdds := IncMinDArray(fOdds, adTrfBDL0MinOdds, 1, iFinishPos);
            adTrfBDL0MaxOdds := IncMaxDArray(fOdds, adTrfBDL0MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL0Rank := IncLArray(alTrfBDL0Rank, 2, iFinishPos);
            adTrfBDL0Odds := IncDArray(fOdds, adTrfBDL0Odds, 2, iFinishPos);
            adTrfBDL0MinOdds := IncMinDArray(fOdds, adTrfBDL0MinOdds, 2, iFinishPos);
            adTrfBDL0MaxOdds := IncMaxDArray(fOdds, adTrfBDL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 1 dot
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alTrfBDL1Rank := IncLArray(alTrfBDL1Rank, 1, iFinishPos);
            adTrfBDL1Odds := IncDArray(fOdds, adTrfBDL1Odds, 1, iFinishPos);
            adTrfBDL1MinOdds := IncMinDArray(fOdds, adTrfBDL1MinOdds, 1, iFinishPos);
            adTrfBDL1MaxOdds := IncMaxDArray(fOdds, adTrfBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL1Rank := IncLArray(alTrfBDL1Rank, 2, iFinishPos);
            adTrfBDL1Odds := IncDArray(fOdds, adTrfBDL1Odds, 2, iFinishPos);
            adTrfBDL1MinOdds := IncMinDArray(fOdds, adTrfBDL1MinOdds, 2, iFinishPos);
            adTrfBDL1MaxOdds := IncMaxDArray(fOdds, adTrfBDL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alTrfBDL1Rank := IncLArray(alTrfBDL1Rank, 1, iFinishPos);
            adTrfBDL1Odds := IncDArray(fOdds, adTrfBDL1Odds, 1, iFinishPos);
            adTrfBDL1MinOdds := IncMinDArray(fOdds, adTrfBDL1MinOdds, 1, iFinishPos);
            adTrfBDL1MaxOdds := IncMaxDArray(fOdds, adTrfBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL1Rank := IncLArray(alTrfBDL1Rank, 2, iFinishPos);
            adTrfBDL1Odds := IncDArray(fOdds, adTrfBDL1Odds, 2, iFinishPos);
            adTrfBDL1MinOdds := IncMinDArray(fOdds, adTrfBDL1MinOdds, 2, iFinishPos);
            adTrfBDL1MaxOdds := IncMaxDArray(fOdds, adTrfBDL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alTrfBDL1Rank := IncLArray(alTrfBDL1Rank, 1, iFinishPos);
            adTrfBDL1Odds := IncDArray(fOdds, adTrfBDL1Odds, 1, iFinishPos);
            adTrfBDL1MinOdds := IncMinDArray(fOdds, adTrfBDL1MinOdds, 1, iFinishPos);
            adTrfBDL1MaxOdds := IncMaxDArray(fOdds, adTrfBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL1Rank := IncLArray(alTrfBDL1Rank, 2, iFinishPos);
            adTrfBDL1Odds := IncDArray(fOdds, adTrfBDL1Odds, 2, iFinishPos);
            adTrfBDL1MinOdds := IncMinDArray(fOdds, adTrfBDL1MinOdds, 2, iFinishPos);
            adTrfBDL1MaxOdds := IncMaxDArray(fOdds, adTrfBDL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 2 dot
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alTrfBDL2Rank := IncLArray(alTrfBDL2Rank, 1, iFinishPos);
            adTrfBDL2Odds := IncDArray(fOdds, adTrfBDL2Odds, 1, iFinishPos);
            adTrfBDL2MinOdds := IncMinDArray(fOdds, adTrfBDL2MinOdds, 1, iFinishPos);
            adTrfBDL2MaxOdds := IncMaxDArray(fOdds, adTrfBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL2Rank := IncLArray(alTrfBDL2Rank, 2, iFinishPos);
            adTrfBDL2Odds := IncDArray(fOdds, adTrfBDL2Odds, 2, iFinishPos);
            adTrfBDL2MinOdds := IncMinDArray(fOdds, adTrfBDL2MinOdds, 2, iFinishPos);
            adTrfBDL2MaxOdds := IncMaxDArray(fOdds, adTrfBDL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alTrfBDL2Rank := IncLArray(alTrfBDL2Rank, 1, iFinishPos);
            adTrfBDL2Odds := IncDArray(fOdds, adTrfBDL2Odds, 1, iFinishPos);
            adTrfBDL2MinOdds := IncMinDArray(fOdds, adTrfBDL2MinOdds, 1, iFinishPos);
            adTrfBDL2MaxOdds := IncMaxDArray(fOdds, adTrfBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL2Rank := IncLArray(alTrfBDL2Rank, 2, iFinishPos);
            adTrfBDL2Odds := IncDArray(fOdds, adTrfBDL2Odds, 2, iFinishPos);
            adTrfBDL2MinOdds := IncMinDArray(fOdds, adTrfBDL2MinOdds, 2, iFinishPos);
            adTrfBDL2MaxOdds := IncMaxDArray(fOdds, adTrfBDL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTrfBDL2Rank := IncLArray(alTrfBDL2Rank, 1, iFinishPos);
            adTrfBDL2Odds := IncDArray(fOdds, adTrfBDL2Odds, 1, iFinishPos);
            adTrfBDL2MinOdds := IncMinDArray(fOdds, adTrfBDL2MinOdds, 1, iFinishPos);
            adTrfBDL2MaxOdds := IncMaxDArray(fOdds, adTrfBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL2Rank := IncLArray(alTrfBDL2Rank, 2, iFinishPos);
            adTrfBDL2Odds := IncDArray(fOdds, adTrfBDL2Odds, 2, iFinishPos);
            adTrfBDL2MinOdds := IncMinDArray(fOdds, adTrfBDL2MinOdds, 2, iFinishPos);
            adTrfBDL2MaxOdds := IncMaxDArray(fOdds, adTrfBDL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 3 dots
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTrfBDL3Rank := IncLArray(alTrfBDL3Rank, 1, iFinishPos);
            adTrfBDL3Odds := IncDArray(fOdds, adTrfBDL3Odds, 1, iFinishPos);
            adTrfBDL3MinOdds := IncMinDArray(fOdds, adTrfBDL3MinOdds, 1, iFinishPos);
            adTrfBDL3MaxOdds := IncMaxDArray(fOdds, adTrfBDL3MaxOdds, 1, iFinishPos);
         end else begin
            alTrfBDL3Rank := IncLArray(alTrfBDL3Rank, 2, iFinishPos);
            adTrfBDL3Odds := IncDArray(fOdds, adTrfBDL3Odds, 2, iFinishPos);
            adTrfBDL3MinOdds := IncMinDArray(fOdds, adTrfBDL3MinOdds, 2, iFinishPos);
            adTrfBDL3MaxOdds := IncMaxDArray(fOdds, adTrfBDL3MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 0 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
            alTrfTL0Rank := IncLArray(alTrfTL0Rank, 1, iFinishPos);
            adTrfTL0Odds := IncDArray(fOdds, adTrfTL0Odds, 1, iFinishPos);
            adTrfTL0MinOdds := IncMinDArray(fOdds, adTrfTL0MinOdds, 1, iFinishPos);
            adTrfTL0MaxOdds := IncMaxDArray(fOdds, adTrfTL0MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL0Rank := IncLArray(alTrfTL0Rank, 2, iFinishPos);
            adTrfTL0Odds := IncDArray(fOdds, adTrfTL0Odds, 2, iFinishPos);
            adTrfTL0MinOdds := IncMinDArray(fOdds, adTrfTL0MinOdds, 2, iFinishPos);
            adTrfTL0MaxOdds := IncMaxDArray(fOdds, adTrfTL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 1 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alTrfTL1Rank := IncLArray(alTrfTL1Rank, 1, iFinishPos);
            adTrfTL1Odds := IncDArray(fOdds, adTrfTL1Odds, 1, iFinishPos);
            adTrfTL1MinOdds := IncMinDArray(fOdds, adTrfTL1MinOdds, 1, iFinishPos);
            adTrfTL1MaxOdds := IncMaxDArray(fOdds, adTrfTL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL1Rank := IncLArray(alTrfTL1Rank, 2, iFinishPos);
            adTrfTL1Odds := IncDArray(fOdds, adTrfTL1Odds, 2, iFinishPos);
            adTrfTL1MinOdds := IncMinDArray(fOdds, adTrfTL1MinOdds, 2, iFinishPos);
            adTrfTL1MaxOdds := IncMaxDArray(fOdds, adTrfTL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alTrfTL1Rank := IncLArray(alTrfTL1Rank, 1, iFinishPos);
            adTrfTL1Odds := IncDArray(fOdds, adTrfTL1Odds, 1, iFinishPos);
            adTrfTL1MinOdds := IncMinDArray(fOdds, adTrfTL1MinOdds, 1, iFinishPos);
            adTrfTL1MaxOdds := IncMaxDArray(fOdds, adTrfTL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL1Rank := IncLArray(alTrfTL1Rank, 2, iFinishPos);
            adTrfTL1Odds := IncDArray(fOdds, adTrfTL1Odds, 2, iFinishPos);
            adTrfTL1MinOdds := IncMinDArray(fOdds, adTrfTL1MinOdds, 2, iFinishPos);
            adTrfTL1MaxOdds := IncMaxDArray(fOdds, adTrfTL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alTrfTL1Rank := IncLArray(alTrfTL1Rank, 1, iFinishPos);
            adTrfTL1Odds := IncDArray(fOdds, adTrfTL1Odds, 1, iFinishPos);
            adTrfTL1MinOdds := IncMinDArray(fOdds, adTrfTL1MinOdds, 1, iFinishPos);
            adTrfTL1MaxOdds := IncMaxDArray(fOdds, adTrfTL1MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL1Rank := IncLArray(alTrfTL1Rank, 2, iFinishPos);
            adTrfTL1Odds := IncDArray(fOdds, adTrfTL1Odds, 2, iFinishPos);
            adTrfTL1MinOdds := IncMinDArray(fOdds, adTrfTL1MinOdds, 2, iFinishPos);
            adTrfTL1MaxOdds := IncMaxDArray(fOdds, adTrfTL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 2 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alTrfTL2Rank := IncLArray(alTrfTL2Rank, 1, iFinishPos);
            adTrfTL2Odds := IncDArray(fOdds, adTrfTL2Odds, 1, iFinishPos);
            adTrfTL2MinOdds := IncMinDArray(fOdds, adTrfTL2MinOdds, 1, iFinishPos);
            adTrfTL2MaxOdds := IncMaxDArray(fOdds, adTrfTL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL2Rank := IncLArray(alTrfTL2Rank, 2, iFinishPos);
            adTrfTL2Odds := IncDArray(fOdds, adTrfTL2Odds, 2, iFinishPos);
            adTrfTL2MinOdds := IncMinDArray(fOdds, adTrfTL2MinOdds, 2, iFinishPos);
            adTrfTL2MaxOdds := IncMaxDArray(fOdds, adTrfTL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alTrfTL2Rank := IncLArray(alTrfTL2Rank, 1, iFinishPos);
            adTrfTL2Odds := IncDArray(fOdds, adTrfTL2Odds, 1, iFinishPos);
            adTrfTL2MinOdds := IncMinDArray(fOdds, adTrfTL2MinOdds, 1, iFinishPos);
            adTrfTL2MaxOdds := IncMaxDArray(fOdds, adTrfTL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL2Rank := IncLArray(alTrfTL2Rank, 2, iFinishPos);
            adTrfTL2Odds := IncDArray(fOdds, adTrfTL2Odds, 2, iFinishPos);
            adTrfTL2MinOdds := IncMinDArray(fOdds, adTrfTL2MinOdds, 2, iFinishPos);
            adTrfTL2MaxOdds := IncMaxDArray(fOdds, adTrfTL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTrfTL2Rank := IncLArray(alTrfTL2Rank, 1, iFinishPos);
            adTrfTL2Odds := IncDArray(fOdds, adTrfTL2Odds, 1, iFinishPos);
            adTrfTL2MinOdds := IncMinDArray(fOdds, adTrfTL2MinOdds, 1, iFinishPos);
            adTrfTL2MaxOdds := IncMaxDArray(fOdds, adTrfTL2MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL2Rank := IncLArray(alTrfTL2Rank, 2, iFinishPos);
            adTrfTL2Odds := IncDArray(fOdds, adTrfTL2Odds, 2, iFinishPos);
            adTrfTL2MinOdds := IncMinDArray(fOdds, adTrfTL2MinOdds, 2, iFinishPos);
            adTrfTL2MaxOdds := IncMaxDArray(fOdds, adTrfTL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 3 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         //  *  *  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alTrfTL3Rank := IncLArray(alTrfTL3Rank, 1, iFinishPos);
            adTrfTL3Odds := IncDArray(fOdds, adTrfTL3Odds, 1, iFinishPos);
            adTrfTL3MinOdds := IncMinDArray(fOdds, adTrfTL3MinOdds, 1, iFinishPos);
            adTrfTL3MaxOdds := IncMaxDArray(fOdds, adTrfTL3MaxOdds, 1, iFinishPos);
         end else begin
            alTrfTL3Rank := IncLArray(alTrfTL3Rank, 2, iFinishPos);
            adTrfTL3Odds := IncDArray(fOdds, adTrfTL3Odds, 2, iFinishPos);
            adTrfTL3MinOdds := IncMinDArray(fOdds, adTrfTL3MinOdds, 2, iFinishPos);
            adTrfTL3MaxOdds := IncMaxDArray(fOdds, adTrfTL3MaxOdds, 2, iFinishPos);
         end;
      end;

      alTrfEarlyPaceRank := IncLArray(alTrfEarlyPaceRank, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adTrfEarlyPaceOdds := IncDArray(fOdds, adTrfEarlyPaceOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adTrfEarlyPaceMinOdds := IncMinDArray(fOdds, adTrfEarlyPaceMinOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adTrfEarlyPaceMaxOdds := IncMaxDArray(fOdds, adTrfEarlyPaceMaxOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);

      alTrfMiddlePaceRank := IncLArray(alTrfMiddlePaceRank, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adTrfMiddlePaceOdds := IncDArray(fOdds, adTrfMiddlePaceOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adTrfMiddlePaceMinOdds := IncMinDArray(fOdds, adTrfMiddlePaceMinOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adTrfMiddlePaceMaxOdds := IncMaxDArray(fOdds, adTrfMiddlePaceMaxOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);

      alTrfLatePaceRank := IncLArray(alTrfLatePaceRank, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adTrfLatePaceOdds := IncDArray(fOdds, adTrfLatePaceOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adTrfLatePaceMinOdds := IncMinDArray(fOdds, adTrfLatePaceMinOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adTrfLatePaceMaxOdds := IncMaxDArray(fOdds, adTrfLatePaceMaxOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
   end;
   // Turf

   // Mud
   if ((sSurface = 'D') and (sTrkCond <> 'FT')) then begin

      // Front Double liner
         // _  _  X
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         alMudFDLRank := IncLArray(alMudFDLRank, 1, iFinishPos);
         adMudFDLOdds := IncDArray(fOdds, adMudFDLOdds, 1, iFinishPos);
         adMudFDLMinOdds := IncMinDArray(fOdds, adMudFDLMinOdds, 1, iFinishPos);
         adMudFDLMaxOdds := IncMaxDArray(fOdds, adMudFDLMaxOdds, 1, iFinishPos);
      end else begin
         alMudFDLRank := IncLArray(alMudFDLRank, 2, iFinishPos);
         adMudFDLOdds := IncDArray(fOdds, adMudFDLOdds, 2, iFinishPos);
         adMudFDLMinOdds := IncMinDArray(fOdds, adMudFDLMinOdds, 2, iFinishPos);
         adMudFDLMaxOdds := IncMaxDArray(fOdds, adMudFDLMaxOdds, 2, iFinishPos);
      end;

      // Back Double liner
         // X  _  _
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         alMudBDLRank := IncLArray(alMudBDLRank, 1, iFinishPos);
         adMudBDLOdds := IncDArray(fOdds, adMudBDLOdds, 1, iFinishPos);
         adMudBDLMinOdds := IncMinDArray(fOdds, adMudBDLMinOdds, 1, iFinishPos);
         adMudBDLMaxOdds := IncMaxDArray(fOdds, adMudBDLMaxOdds, 1, iFinishPos);
      end else begin
         alMudBDLRank := IncLArray(alMudBDLRank, 2, iFinishPos);
         adMudBDLOdds := IncDArray(fOdds, adMudBDLOdds, 2, iFinishPos);
         adMudBDLMinOdds := IncMinDArray(fOdds, adMudBDLMinOdds, 2, iFinishPos);
         adMudBDLMaxOdds := IncMaxDArray(fOdds, adMudBDLMaxOdds, 2, iFinishPos);
      end;

      // Triple liner
      // _  _  _
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         alMudTLRank := IncLArray(alMudTLRank, 1, iFinishPos);
         adMudTLOdds := IncDArray(fOdds, adMudTLOdds, 1, iFinishPos);
         adMudTLMinOdds := IncMinDArray(fOdds, adMudTLMinOdds, 1, iFinishPos);
         adMudTLMaxOdds := IncMaxDArray(fOdds, adMudTLMaxOdds, 1, iFinishPos);
      end else begin
         alMudTLRank := IncLArray(alMudTLRank, 2, iFinishPos);
         adMudTLOdds := IncDArray(fOdds, adMudTLOdds, 2, iFinishPos);
         adMudTLMinOdds := IncMinDArray(fOdds, adMudTLMinOdds, 2, iFinishPos);
         adMudTLMaxOdds := IncMaxDArray(fOdds, adMudTLMaxOdds, 2, iFinishPos);
      end;

      // Front Double liner 0 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         //  X  X  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alMudFDL0Rank := IncLArray(alMudFDL0Rank, 1, iFinishPos);
            adMudFDL0Odds := IncDArray(fOdds, adMudFDL0Odds, 1, iFinishPos);
            adMudFDL0MinOdds := IncMinDArray(fOdds, adMudFDL0MinOdds, 1, iFinishPos);
            adMudFDL0MaxOdds := IncMaxDArray(fOdds, adMudFDL0MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL0Rank := IncLArray(alMudFDL0Rank, 2, iFinishPos);
            adMudFDL0Odds := IncDArray(fOdds, adMudFDL0Odds, 2, iFinishPos);
            adMudFDL0MinOdds := IncMinDArray(fOdds, adMudFDL0MinOdds, 2, iFinishPos);
            adMudFDL0MaxOdds := IncMaxDArray(fOdds, adMudFDL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 1 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alMudFDL1Rank := IncLArray(alMudFDL1Rank, 1, iFinishPos);
            adMudFDL1Odds := IncDArray(fOdds, adMudFDL1Odds, 1, iFinishPos);
            adMudFDL1MinOdds := IncMinDArray(fOdds, adMudFDL1MinOdds, 1, iFinishPos);
            adMudFDL1MaxOdds := IncMaxDArray(fOdds, adMudFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL1Rank := IncLArray(alMudFDL1Rank, 2, iFinishPos);
            adMudFDL1Odds := IncDArray(fOdds, adMudFDL1Odds, 2, iFinishPos);
            adMudFDL1MinOdds := IncMinDArray(fOdds, adMudFDL1MinOdds, 2, iFinishPos);
            adMudFDL1MaxOdds := IncMaxDArray(fOdds, adMudFDL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alMudFDL1Rank := IncLArray(alMudFDL1Rank, 1, iFinishPos);
            adMudFDL1Odds := IncDArray(fOdds, adMudFDL1Odds, 1, iFinishPos);
            adMudFDL1MinOdds := IncMinDArray(fOdds, adMudFDL1MinOdds, 1, iFinishPos);
            adMudFDL1MaxOdds := IncMaxDArray(fOdds, adMudFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL1Rank := IncLArray(alMudFDL1Rank, 2, iFinishPos);
            adMudFDL1Odds := IncDArray(fOdds, adMudFDL1Odds, 2, iFinishPos);
            adMudFDL1MinOdds := IncMinDArray(fOdds, adMudFDL1MinOdds, 2, iFinishPos);
            adMudFDL1MaxOdds := IncMaxDArray(fOdds, adMudFDL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alMudFDL1Rank := IncLArray(alMudFDL1Rank, 1, iFinishPos);
            adMudFDL1Odds := IncDArray(fOdds, adMudFDL1Odds, 1, iFinishPos);
            adMudFDL1MinOdds := IncMinDArray(fOdds, adMudFDL1MinOdds, 1, iFinishPos);
            adMudFDL1MaxOdds := IncMaxDArray(fOdds, adMudFDL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL1Rank := IncLArray(alMudFDL1Rank, 2, iFinishPos);
            adMudFDL1Odds := IncDArray(fOdds, adMudFDL1Odds, 2, iFinishPos);
            adMudFDL1MinOdds := IncMinDArray(fOdds, adMudFDL1MinOdds, 2, iFinishPos);
            adMudFDL1MaxOdds := IncMaxDArray(fOdds, adMudFDL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 2 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alMudFDL2Rank := IncLArray(alMudFDL2Rank, 1, iFinishPos);
            adMudFDL2Odds := IncDArray(fOdds, adMudFDL2Odds, 1, iFinishPos);
            adMudFDL2MinOdds := IncMinDArray(fOdds, adMudFDL2MinOdds, 1, iFinishPos);
            adMudFDL2MaxOdds := IncMaxDArray(fOdds, adMudFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL2Rank := IncLArray(alMudFDL2Rank, 2, iFinishPos);
            adMudFDL2Odds := IncDArray(fOdds, adMudFDL2Odds, 2, iFinishPos);
            adMudFDL2MinOdds := IncMinDArray(fOdds, adMudFDL2MinOdds, 2, iFinishPos);
            adMudFDL2MaxOdds := IncMaxDArray(fOdds, adMudFDL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alMudFDL2Rank := IncLArray(alMudFDL2Rank, 1, iFinishPos);
            adMudFDL2Odds := IncDArray(fOdds, adMudFDL2Odds, 1, iFinishPos);
            adMudFDL2MinOdds := IncMinDArray(fOdds, adMudFDL2MinOdds, 1, iFinishPos);
            adMudFDL2MaxOdds := IncMaxDArray(fOdds, adMudFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL2Rank := IncLArray(alMudFDL2Rank, 2, iFinishPos);
            adMudFDL2Odds := IncDArray(fOdds, adMudFDL2Odds, 2, iFinishPos);
            adMudFDL2MinOdds := IncMinDArray(fOdds, adMudFDL2MinOdds, 2, iFinishPos);
            adMudFDL2MaxOdds := IncMaxDArray(fOdds, adMudFDL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alMudFDL2Rank := IncLArray(alMudFDL2Rank, 1, iFinishPos);
            adMudFDL2Odds := IncDArray(fOdds, adMudFDL2Odds, 1, iFinishPos);
            adMudFDL2MinOdds := IncMinDArray(fOdds, adMudFDL2MinOdds, 1, iFinishPos);
            adMudFDL2MaxOdds := IncMaxDArray(fOdds, adMudFDL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL2Rank := IncLArray(alMudFDL2Rank, 2, iFinishPos);
            adMudFDL2Odds := IncDArray(fOdds, adMudFDL2Odds, 2, iFinishPos);
            adMudFDL2MinOdds := IncMinDArray(fOdds, adMudFDL2MinOdds, 2, iFinishPos);
            adMudFDL2MaxOdds := IncMaxDArray(fOdds, adMudFDL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Front Double liner 3 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
         //  *  *  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alMudFDL3Rank := IncLArray(alMudFDL3Rank, 1, iFinishPos);
            adMudFDL3Odds := IncDArray(fOdds, adMudFDL3Odds, 1, iFinishPos);
            adMudFDL3MinOdds := IncMinDArray(fOdds, adMudFDL3MinOdds, 1, iFinishPos);
            adMudFDL3MaxOdds := IncMaxDArray(fOdds, adMudFDL3MaxOdds, 1, iFinishPos);
         end else begin
            alMudFDL3Rank := IncLArray(alMudFDL3Rank, 2, iFinishPos);
            adMudFDL3Odds := IncDArray(fOdds, adMudFDL3Odds, 2, iFinishPos);
            adMudFDL3MinOdds := IncMinDArray(fOdds, adMudFDL3MinOdds, 2, iFinishPos);
            adMudFDL3MaxOdds := IncMaxDArray(fOdds, adMudFDL3MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 0 dots
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         //  X  X  X
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
            alMudBDL0Rank := IncLArray(alMudBDL0Rank, 1, iFinishPos);
            adMudBDL0Odds := IncDArray(fOdds, adMudBDL0Odds, 1, iFinishPos);
            adMudBDL0MinOdds := IncMinDArray(fOdds, adMudBDL0MinOdds, 1, iFinishPos);
            adMudBDL0MaxOdds := IncMaxDArray(fOdds, adMudBDL0MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL0Rank := IncLArray(alMudBDL0Rank, 2, iFinishPos);
            adMudBDL0Odds := IncDArray(fOdds, adMudBDL0Odds, 2, iFinishPos);
            adMudBDL0MinOdds := IncMinDArray(fOdds, adMudBDL0MinOdds, 2, iFinishPos);
            adMudBDL0MaxOdds := IncMaxDArray(fOdds, adMudBDL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 1 dot
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alMudBDL1Rank := IncLArray(alMudBDL1Rank, 1, iFinishPos);
            adMudBDL1Odds := IncDArray(fOdds, adMudBDL1Odds, 1, iFinishPos);
            adMudBDL1MinOdds := IncMinDArray(fOdds, adMudBDL1MinOdds, 1, iFinishPos);
            adMudBDL1MaxOdds := IncMaxDArray(fOdds, adMudBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL1Rank := IncLArray(alMudBDL1Rank, 2, iFinishPos);
            adMudBDL1Odds := IncDArray(fOdds, adMudBDL1Odds, 2, iFinishPos);
            adMudBDL1MinOdds := IncMinDArray(fOdds, adMudBDL1MinOdds, 2, iFinishPos);
            adMudBDL1MaxOdds := IncMaxDArray(fOdds, adMudBDL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alMudBDL1Rank := IncLArray(alMudBDL1Rank, 1, iFinishPos);
            adMudBDL1Odds := IncDArray(fOdds, adMudBDL1Odds, 1, iFinishPos);
            adMudBDL1MinOdds := IncMinDArray(fOdds, adMudBDL1MinOdds, 1, iFinishPos);
            adMudBDL1MaxOdds := IncMaxDArray(fOdds, adMudBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL1Rank := IncLArray(alMudBDL1Rank, 2, iFinishPos);
            adMudBDL1Odds := IncDArray(fOdds, adMudBDL1Odds, 2, iFinishPos);
            adMudBDL1MinOdds := IncMinDArray(fOdds, adMudBDL1MinOdds, 2, iFinishPos);
            adMudBDL1MaxOdds := IncMaxDArray(fOdds, adMudBDL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alMudBDL1Rank := IncLArray(alMudBDL1Rank, 1, iFinishPos);
            adMudBDL1Odds := IncDArray(fOdds, adMudBDL1Odds, 1, iFinishPos);
            adMudBDL1MinOdds := IncMinDArray(fOdds, adMudBDL1MinOdds, 1, iFinishPos);
            adMudBDL1MaxOdds := IncMaxDArray(fOdds, adMudBDL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL1Rank := IncLArray(alMudBDL1Rank, 2, iFinishPos);
            adMudBDL1Odds := IncDArray(fOdds, adMudBDL1Odds, 2, iFinishPos);
            adMudBDL1MinOdds := IncMinDArray(fOdds, adMudBDL1MinOdds, 2, iFinishPos);
            adMudBDL1MaxOdds := IncMaxDArray(fOdds, adMudBDL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 2 dot
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alMudBDL2Rank := IncLArray(alMudBDL2Rank, 1, iFinishPos);
            adMudBDL2Odds := IncDArray(fOdds, adMudBDL2Odds, 1, iFinishPos);
            adMudBDL2MinOdds := IncMinDArray(fOdds, adMudBDL2MinOdds, 1, iFinishPos);
            adMudBDL2MaxOdds := IncMaxDArray(fOdds, adMudBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL2Rank := IncLArray(alMudBDL2Rank, 2, iFinishPos);
            adMudBDL2Odds := IncDArray(fOdds, adMudBDL2Odds, 2, iFinishPos);
            adMudBDL2MinOdds := IncMinDArray(fOdds, adMudBDL2MinOdds, 2, iFinishPos);
            adMudBDL2MaxOdds := IncMaxDArray(fOdds, adMudBDL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alMudBDL2Rank := IncLArray(alMudBDL2Rank, 1, iFinishPos);
            adMudBDL2Odds := IncDArray(fOdds, adMudBDL2Odds, 1, iFinishPos);
            adMudBDL2MinOdds := IncMinDArray(fOdds, adMudBDL2MinOdds, 1, iFinishPos);
            adMudBDL2MaxOdds := IncMaxDArray(fOdds, adMudBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL2Rank := IncLArray(alMudBDL2Rank, 2, iFinishPos);
            adMudBDL2Odds := IncDArray(fOdds, adMudBDL2Odds, 2, iFinishPos);
            adMudBDL2MinOdds := IncMinDArray(fOdds, adMudBDL2MinOdds, 2, iFinishPos);
            adMudBDL2MaxOdds := IncMaxDArray(fOdds, adMudBDL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alMudBDL2Rank := IncLArray(alMudBDL2Rank, 1, iFinishPos);
            adMudBDL2Odds := IncDArray(fOdds, adMudBDL2Odds, 1, iFinishPos);
            adMudBDL2MinOdds := IncMinDArray(fOdds, adMudBDL2MinOdds, 1, iFinishPos);
            adMudBDL2MaxOdds := IncMaxDArray(fOdds, adMudBDL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL2Rank := IncLArray(alMudBDL2Rank, 2, iFinishPos);
            adMudBDL2Odds := IncDArray(fOdds, adMudBDL2Odds, 2, iFinishPos);
            adMudBDL2MinOdds := IncMinDArray(fOdds, adMudBDL2MinOdds, 2, iFinishPos);
            adMudBDL2MaxOdds := IncMaxDArray(fOdds, adMudBDL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Back Double liner 3 dots
      if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alMudBDL3Rank := IncLArray(alMudBDL3Rank, 1, iFinishPos);
            adMudBDL3Odds := IncDArray(fOdds, adMudBDL3Odds, 1, iFinishPos);
            adMudBDL3MinOdds := IncMinDArray(fOdds, adMudBDL3MinOdds, 1, iFinishPos);
            adMudBDL3MaxOdds := IncMaxDArray(fOdds, adMudBDL3MaxOdds, 1, iFinishPos);
         end else begin
            alMudBDL3Rank := IncLArray(alMudBDL3Rank, 2, iFinishPos);
            adMudBDL3Odds := IncDArray(fOdds, adMudBDL3Odds, 2, iFinishPos);
            adMudBDL3MinOdds := IncMinDArray(fOdds, adMudBDL3MinOdds, 2, iFinishPos);
            adMudBDL3MaxOdds := IncMaxDArray(fOdds, adMudBDL3MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 0 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
            alMudTL0Rank := IncLArray(alMudTL0Rank, 1, iFinishPos);
            adMudTL0Odds := IncDArray(fOdds, adMudTL0Odds, 1, iFinishPos);
            adMudTL0MinOdds := IncMinDArray(fOdds, adMudTL0MinOdds, 1, iFinishPos);
            adMudTL0MaxOdds := IncMaxDArray(fOdds, adMudTL0MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL0Rank := IncLArray(alMudTL0Rank, 2, iFinishPos);
            adMudTL0Odds := IncDArray(fOdds, adMudTL0Odds, 2, iFinishPos);
            adMudTL0MinOdds := IncMinDArray(fOdds, adMudTL0MinOdds, 2, iFinishPos);
            adMudTL0MaxOdds := IncMaxDArray(fOdds, adMudTL0MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 1 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  X  X
         if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
            alMudTL1Rank := IncLArray(alMudTL1Rank, 1, iFinishPos);
            adMudTL1Odds := IncDArray(fOdds, adMudTL1Odds, 1, iFinishPos);
            adMudTL1MinOdds := IncMinDArray(fOdds, adMudTL1MinOdds, 1, iFinishPos);
            adMudTL1MaxOdds := IncMaxDArray(fOdds, adMudTL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL1Rank := IncLArray(alMudTL1Rank, 2, iFinishPos);
            adMudTL1Odds := IncDArray(fOdds, adMudTL1Odds, 2, iFinishPos);
            adMudTL1MinOdds := IncMinDArray(fOdds, adMudTL1MinOdds, 2, iFinishPos);
            adMudTL1MaxOdds := IncMaxDArray(fOdds, adMudTL1MaxOdds, 2, iFinishPos);
         end;
         // X  *  X
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
            alMudTL1Rank := IncLArray(alMudTL1Rank, 1, iFinishPos);
            adMudTL1Odds := IncDArray(fOdds, adMudTL1Odds, 1, iFinishPos);
            adMudTL1MinOdds := IncMinDArray(fOdds, adMudTL1MinOdds, 1, iFinishPos);
            adMudTL1MaxOdds := IncMaxDArray(fOdds, adMudTL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL1Rank := IncLArray(alMudTL1Rank, 2, iFinishPos);
            adMudTL1Odds := IncDArray(fOdds, adMudTL1Odds, 2, iFinishPos);
            adMudTL1MinOdds := IncMinDArray(fOdds, adMudTL1MinOdds, 2, iFinishPos);
            adMudTL1MaxOdds := IncMaxDArray(fOdds, adMudTL1MaxOdds, 2, iFinishPos);
         end;
         // X  X  *
         if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
            alMudTL1Rank := IncLArray(alMudTL1Rank, 1, iFinishPos);
            adMudTL1Odds := IncDArray(fOdds, adMudTL1Odds, 1, iFinishPos);
            adMudTL1MinOdds := IncMinDArray(fOdds, adMudTL1MinOdds, 1, iFinishPos);
            adMudTL1MaxOdds := IncMaxDArray(fOdds, adMudTL1MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL1Rank := IncLArray(alMudTL1Rank, 2, iFinishPos);
            adMudTL1Odds := IncDArray(fOdds, adMudTL1Odds, 2, iFinishPos);
            adMudTL1MinOdds := IncMinDArray(fOdds, adMudTL1MinOdds, 2, iFinishPos);
            adMudTL1MaxOdds := IncMaxDArray(fOdds, adMudTL1MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 2 dot
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         // *  *  X
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
            alMudTL2Rank := IncLArray(alMudTL2Rank, 1, iFinishPos);
            adMudTL2Odds := IncDArray(fOdds, adMudTL2Odds, 1, iFinishPos);
            adMudTL2MinOdds := IncMinDArray(fOdds, adMudTL2MinOdds, 1, iFinishPos);
            adMudTL2MaxOdds := IncMaxDArray(fOdds, adMudTL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL2Rank := IncLArray(alMudTL2Rank, 2, iFinishPos);
            adMudTL2Odds := IncDArray(fOdds, adMudTL2Odds, 2, iFinishPos);
            adMudTL2MinOdds := IncMinDArray(fOdds, adMudTL2MinOdds, 2, iFinishPos);
            adMudTL2MaxOdds := IncMaxDArray(fOdds, adMudTL2MaxOdds, 2, iFinishPos);
         end;

         // *  X  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
            alMudTL2Rank := IncLArray(alMudTL2Rank, 1, iFinishPos);
            adMudTL2Odds := IncDArray(fOdds, adMudTL2Odds, 1, iFinishPos);
            adMudTL2MinOdds := IncMinDArray(fOdds, adMudTL2MinOdds, 1, iFinishPos);
            adMudTL2MaxOdds := IncMaxDArray(fOdds, adMudTL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL2Rank := IncLArray(alMudTL2Rank, 2, iFinishPos);
            adMudTL2Odds := IncDArray(fOdds, adMudTL2Odds, 2, iFinishPos);
            adMudTL2MinOdds := IncMinDArray(fOdds, adMudTL2MinOdds, 2, iFinishPos);
            adMudTL2MaxOdds := IncMaxDArray(fOdds, adMudTL2MaxOdds, 2, iFinishPos);
         end;

         // X  *  *
         if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alMudTL2Rank := IncLArray(alMudTL2Rank, 1, iFinishPos);
            adMudTL2Odds := IncDArray(fOdds, adMudTL2Odds, 1, iFinishPos);
            adMudTL2MinOdds := IncMinDArray(fOdds, adMudTL2MinOdds, 1, iFinishPos);
            adMudTL2MaxOdds := IncMaxDArray(fOdds, adMudTL2MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL2Rank := IncLArray(alMudTL2Rank, 2, iFinishPos);
            adMudTL2Odds := IncDArray(fOdds, adMudTL2Odds, 2, iFinishPos);
            adMudTL2MinOdds := IncMinDArray(fOdds, adMudTL2MinOdds, 2, iFinishPos);
            adMudTL2MaxOdds := IncMaxDArray(fOdds, adMudTL2MaxOdds, 2, iFinishPos);
         end;
      end;

      // Triple liner 3 dots
      if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
         //  *  *  *
         if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
            alMudTL3Rank := IncLArray(alMudTL3Rank, 1, iFinishPos);
            adMudTL3Odds := IncDArray(fOdds, adMudTL3Odds, 1, iFinishPos);
            adMudTL3MinOdds := IncMinDArray(fOdds, adMudTL3MinOdds, 1, iFinishPos);
            adMudTL3MaxOdds := IncMaxDArray(fOdds, adMudTL3MaxOdds, 1, iFinishPos);
         end else begin
            alMudTL3Rank := IncLArray(alMudTL3Rank, 2, iFinishPos);
            adMudTL3Odds := IncDArray(fOdds, adMudTL3Odds, 2, iFinishPos);
            adMudTL3MinOdds := IncMinDArray(fOdds, adMudTL3MinOdds, 2, iFinishPos);
            adMudTL3MaxOdds := IncMaxDArray(fOdds, adMudTL3MaxOdds, 2, iFinishPos);
         end;
      end;

      alMudEarlyPaceRank := IncLArray(alMudEarlyPaceRank, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adMudEarlyPaceOdds := IncDArray(fOdds, adMudEarlyPaceOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adMudEarlyPaceMinOdds := IncMinDArray(fOdds, adMudEarlyPaceMinOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);
      adMudEarlyPaceMaxOdds := IncMaxDArray(fOdds, adMudEarlyPaceMaxOdds, tblE.FieldByName('EarlyPaceRank').AsInteger, iFinishPos);

      alMudMiddlePaceRank := IncLArray(alMudMiddlePaceRank, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adMudMiddlePaceOdds := IncDArray(fOdds, adMudMiddlePaceOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adMudMiddlePaceMinOdds := IncMinDArray(fOdds, adMudMiddlePaceMinOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);
      adMudMiddlePaceMaxOdds := IncMaxDArray(fOdds, adMudMiddlePaceMaxOdds, tblE.FieldByName('MiddlePaceRank').AsInteger, iFinishPos);

      alMudLatePaceRank := IncLArray(alMudLatePaceRank, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos); adMudLatePaceOdds := IncDArray(fOdds, adMudLatePaceOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adMudLatePaceOdds := IncDArray(fOdds, adMudLatePaceOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adMudLatePaceMinOdds := IncMinDArray(fOdds, adMudLatePaceMinOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
      adMudLatePaceMaxOdds := IncMaxDArray(fOdds, adMudLatePaceMaxOdds, tblE.FieldByName('LatePaceRank').AsInteger, iFinishPos);
   end;
   // Mud

end;


procedure IncOtherArrays
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable
   );
var

   fOdds: double;
   iFinishPos: integer;
   sSurface: string;
   sTrkCond: string;
   sTrkCode: string;
   sRaceType: string;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   iFinalWinPctRank: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;


begin
   iFinishPos := tblE.FieldByName('FinishPos').AsInteger;
   fOdds := tblE.FieldByName('Odds').AsFloat;


   //
   alQSP1stCallRank := IncLArray(alQSP1stCallRank, tblE.FieldByName('QSP1stCallRank').AsInteger, iFinishPos);
   adQSP1stCallOdds := IncDArray(fOdds, adQSP1stCallOdds, tblE.FieldByName('QSP1stCallRank').AsInteger, iFinishPos);
   adQSP1stCallMinOdds := IncMinDArray(fOdds, adQSP1stCallMinOdds, tblE.FieldByName('QSP1stCallRank').AsInteger, iFinishPos);
   adQSP1stCallMaxOdds := IncMaxDArray(fOdds, adQSP1stCallMaxOdds, tblE.FieldByName('QSP1stCallRank').AsInteger, iFinishPos);

   alKSP1stCallRank := IncLArray(alKSP1stCallRank, tblE.FieldByName('KSP1stCallRank').AsInteger, iFinishPos);
   adKSP1stCallOdds := IncDArray(fOdds, adKSP1stCallOdds, tblE.FieldByName('KSP1stCallRank').AsInteger, iFinishPos);
   adKSP1stCallMinOdds := IncMinDArray(fOdds, adKSP1stCallMinOdds, tblE.FieldByName('KSP1stCallRank').AsInteger, iFinishPos);
   adKSP1stCallMaxOdds := IncMaxDArray(fOdds, adKSP1stCallMaxOdds, tblE.FieldByName('KSP1stCallRank').AsInteger, iFinishPos);

   //
   alQSP2ndCallRank := IncLArray(alQSP2ndCallRank, tblE.FieldByName('QSP2ndCallRank').AsInteger, iFinishPos);
   adQSP2ndCallOdds := IncDArray(fOdds, adQSP2ndCallOdds, tblE.FieldByName('QSP2ndCallRank').AsInteger, iFinishPos);
   adQSP2ndCallMinOdds := IncMinDArray(fOdds, adQSP2ndCallMinOdds, tblE.FieldByName('QSP2ndCallRank').AsInteger, iFinishPos);
   adQSP2ndCallMaxOdds := IncMaxDArray(fOdds, adQSP2ndCallMaxOdds, tblE.FieldByName('QSP2ndCallRank').AsInteger, iFinishPos);

   alKSP2ndCallRank := IncLArray(alKSP2ndCallRank, tblE.FieldByName('KSP2ndCallRank').AsInteger, iFinishPos);
   adKSP2ndCallOdds := IncDArray(fOdds, adKSP2ndCallOdds, tblE.FieldByName('KSP2ndCallRank').AsInteger, iFinishPos);
   adKSP2ndCallMinOdds := IncMinDArray(fOdds, adKSP2ndCallMinOdds, tblE.FieldByName('KSP2ndCallRank').AsInteger, iFinishPos);
   adKSP2ndCallMaxOdds := IncMaxDArray(fOdds, adKSP2ndCallMaxOdds, tblE.FieldByName('KSP2ndCallRank').AsInteger, iFinishPos);


   //
   alTrnTrackRank := IncLArray(alTrnTrackRank, tblE.FieldByName('TrnTrackRank').AsInteger, iFinishPos);
   adTrnTrackOdds := IncDArray(fOdds, adTrnTrackOdds, tblE.FieldByName('TrnTrackRank').AsInteger, iFinishPos);
   adTrnTrackMinOdds := IncMinDArray(fOdds, adTrnTrackMinOdds, tblE.FieldByName('TrnTrackRank').AsInteger, iFinishPos);
   adTrnTrackMaxOdds := IncMaxDArray(fOdds, adTrnTrackMaxOdds, tblE.FieldByName('TrnTrackRank').AsInteger, iFinishPos);

   alTrnWinsRank := IncLArray(alTrnWinsRank, tblE.FieldByName('TrnWinsRank').AsInteger, iFinishPos);
   adTrnWinsOdds := IncDArray(fOdds, adTrnWinsOdds, tblE.FieldByName('TrnWinsRank').AsInteger, iFinishPos);
   adTrnWinsMinOdds := IncMinDArray(fOdds, adTrnWinsMinOdds, tblE.FieldByName('TrnWinsRank').AsInteger, iFinishPos);
   adTrnWinsMaxOdds := IncMaxDArray(fOdds, adTrnWinsMaxOdds, tblE.FieldByName('TrnWinsRank').AsInteger, iFinishPos);

   alTrnEarningsRank := IncLArray(alTrnEarningsRank, tblE.FieldByName('TrnEarningsRank').AsInteger, iFinishPos);
   adTrnEarningsOdds := IncDArray(fOdds, adTrnEarningsOdds, tblE.FieldByName('TrnEarningsRank').AsInteger, iFinishPos);
   adTrnEarningsMinOdds := IncMinDArray(fOdds, adTrnEarningsMinOdds, tblE.FieldByName('TrnEarningsRank').AsInteger, iFinishPos);
   adTrnEarningsMaxOdds := IncMaxDArray(fOdds, adTrnEarningsMaxOdds, tblE.FieldByName('TrnEarningsRank').AsInteger, iFinishPos);


   alJkyTrackRank := IncLArray(alJkyTrackRank, tblE.FieldByName('JkyTrackRank').AsInteger, iFinishPos);
   adJkyTrackOdds := IncDArray(fOdds, adJkyTrackOdds, tblE.FieldByName('JkyTrackRank').AsInteger, iFinishPos);
   adJkyTrackMinOdds := IncMinDArray(fOdds, adJkyTrackMinOdds, tblE.FieldByName('JkyTrackRank').AsInteger, iFinishPos);
   adJkyTrackMaxOdds := IncMaxDArray(fOdds, adJkyTrackMaxOdds, tblE.FieldByName('JkyTrackRank').AsInteger, iFinishPos);

   alJkyWinsRank := IncLArray(alJkyWinsRank, tblE.FieldByName('JkyWinsRank').AsInteger, iFinishPos);
   adJkyWinsOdds := IncDArray(fOdds, adJkyWinsOdds, tblE.FieldByName('JkyWinsRank').AsInteger, iFinishPos);
   adJkyWinsMinOdds := IncMinDArray(fOdds, adJkyWinsMinOdds, tblE.FieldByName('JkyWinsRank').AsInteger, iFinishPos);
   adJkyWinsMaxOdds := IncMaxDArray(fOdds, adJkyWinsMaxOdds, tblE.FieldByName('JkyWinsRank').AsInteger, iFinishPos);

   alJkyEarningsRank := IncLArray(alJkyEarningsRank, tblE.FieldByName('JkyEarningsRank').AsInteger, iFinishPos);
   adJkyEarningsOdds := IncDArray(fOdds, adJkyEarningsOdds, tblE.FieldByName('JkyEarningsRank').AsInteger, iFinishPos);
   adJkyEarningsMinOdds := IncMinDArray(fOdds, adJkyEarningsMinOdds, tblE.FieldByName('JkyEarningsRank').AsInteger, iFinishPos);
   adJkyEarningsMaxOdds := IncMaxDArray(fOdds, adJkyEarningsMaxOdds, tblE.FieldByName('JkyEarningsRank').AsInteger, iFinishPos);


   alOwnWinsRank := IncLArray(alOwnWinsRank, tblE.FieldByName('OwnWinsRank').AsInteger, iFinishPos);
   adOwnWinsOdds := IncDArray(fOdds, adOwnWinsOdds, tblE.FieldByName('OwnWinsRank').AsInteger, iFinishPos);
   adOwnWinsMinOdds := IncMinDArray(fOdds, adOwnWinsMinOdds, tblE.FieldByName('OwnWinsRank').AsInteger, iFinishPos);
   adOwnWinsMaxOdds := IncMaxDArray(fOdds, adOwnWinsMaxOdds, tblE.FieldByName('OwnWinsRank').AsInteger, iFinishPos);

   alOwnEarningsRank := IncLArray(alOwnEarningsRank, tblE.FieldByName('OwnEarningsRank').AsInteger, iFinishPos);
   adOwnEarningsOdds := IncDArray(fOdds, adOwnEarningsOdds, tblE.FieldByName('OwnEarningsRank').AsInteger, iFinishPos);
   adOwnEarningsMinOdds := IncMinDArray(fOdds, adOwnEarningsMinOdds, tblE.FieldByName('OwnEarningsRank').AsInteger, iFinishPos);
   adOwnEarningsMaxOdds := IncMaxDArray(fOdds, adOwnEarningsMaxOdds, tblE.FieldByName('OwnEarningsRank').AsInteger, iFinishPos);

   //
   alPowerRank := IncLArray(alPowerRank, tblE.FieldByName('PowerRank').AsInteger, iFinishPos);
   adPowerOdds := IncDArray(fOdds, adPowerOdds, tblE.FieldByName('PowerRank').AsInteger, iFinishPos);
   adPowerMinOdds := IncMinDArray(fOdds, adPowerMinOdds, tblE.FieldByName('PowerRank').AsInteger, iFinishPos);
   adPowerMaxOdds := IncMaxDArray(fOdds, adPowerMaxOdds, tblE.FieldByName('PowerRank').AsInteger, iFinishPos);

   alLastSpeedRank := IncLArray(alLastSpeedRank, tblE.FieldByName('LastSpeedRank').AsInteger, iFinishPos);
   adLastSpeedOdds := IncDArray(fOdds, adLastSpeedOdds, tblE.FieldByName('LastSpeedRank').AsInteger, iFinishPos);
   adLastSpeedMinOdds := IncMinDArray(fOdds, adLastSpeedMinOdds, tblE.FieldByName('LastSpeedRank').AsInteger, iFinishPos);
   adLastSpeedMaxOdds := IncMaxDArray(fOdds, adLastSpeedMaxOdds, tblE.FieldByName('LastSpeedRank').AsInteger, iFinishPos);

   alBackSpeedRank := IncLArray(alBackSpeedRank, tblE.FieldByName('BackSpeedRank').AsInteger, iFinishPos);
   adBackSpeedOdds := IncDArray(fOdds, adBackSpeedOdds, tblE.FieldByName('BackSpeedRank').AsInteger, iFinishPos);
   adBackSpeedMinOdds := IncMinDArray(fOdds, adBackSpeedMinOdds, tblE.FieldByName('BackSpeedRank').AsInteger, iFinishPos);
   adBackSpeedMaxOdds := IncMaxDArray(fOdds, adBackSpeedMaxOdds, tblE.FieldByName('BackSpeedRank').AsInteger, iFinishPos);

   alMorningLineTo1Rank := IncLArray(alMorningLineTo1Rank, tblE.FieldByName('MorningLineTo1Rank').AsInteger, iFinishPos);
   adMorningLineTo1Odds := IncDArray(fOdds, adMorningLineTo1Odds, tblE.FieldByName('MorningLineTo1Rank').AsInteger, iFinishPos);
   adMorningLineTo1MinOdds := IncMinDArray(fOdds, adMorningLineTo1MinOdds, tblE.FieldByName('MorningLineTo1Rank').AsInteger, iFinishPos);
   adMorningLineTo1MaxOdds := IncMaxDArray(fOdds, adMorningLineTo1MaxOdds, tblE.FieldByName('MorningLineTo1Rank').AsInteger, iFinishPos);

   alLatePacePosRank := IncLArray(alLatePacePosRank, tblE.FieldByName('LatePacePosRank').AsInteger, iFinishPos);
   alEarlyPacePosRank := IncLArray(alEarlyPacePosRank, tblE.FieldByName('EarlyPacePosRank').AsInteger, iFinishPos);
   alMiddlePacePosRank := IncLArray(alMiddlePacePosRank, tblE.FieldByName('MiddlePacePosRank').AsInteger, iFinishPos);

   adLatePacePosOdds := IncDArray(fOdds, adLatePacePosOdds, tblE.FieldByName('LatePacePosRank').AsInteger, iFinishPos);
   adLatePacePosMinOdds := IncMinDArray(fOdds, adLatePacePosMinOdds, tblE.FieldByName('LatePacePosRank').AsInteger, iFinishPos);
   adLatePacePosMaxOdds := IncMaxDArray(fOdds, adLatePacePosMaxOdds, tblE.FieldByName('LatePacePosRank').AsInteger, iFinishPos);

   adEarlyPacePosOdds := IncDArray(fOdds, adEarlyPacePosOdds, tblE.FieldByName('EarlyPacePosRank').AsInteger, iFinishPos);
   adEarlyPacePosMinOdds := IncMinDArray(fOdds, adEarlyPacePosMinOdds, tblE.FieldByName('EarlyPacePosRank').AsInteger, iFinishPos);
   adEarlyPacePosMaxOdds := IncMaxDArray(fOdds, adEarlyPacePosMaxOdds, tblE.FieldByName('EarlyPacePosRank').AsInteger, iFinishPos);

   adMiddlePacePosOdds := IncDArray(fOdds, adMiddlePacePosOdds, tblE.FieldByName('MiddlePacePosRank').AsInteger, iFinishPos);
   adMiddlePacePosMinOdds := IncMinDArray(fOdds, adMiddlePacePosMinOdds, tblE.FieldByName('MiddlePacePosRank').AsInteger, iFinishPos);
   adMiddlePacePosMaxOdds := IncMaxDArray(fOdds, adMiddlePacePosMaxOdds, tblE.FieldByName('MiddlePacePosRank').AsInteger, iFinishPos);


   //
//   alFinalWinPctRank := IncLArray(alFinalWinPctRank, tblE.FieldByName('FinalWinPctRank').AsInteger, iFinishPos);
//   adFinalWinPctOdds := IncDArray(fOdds, adFinalWinPctOdds, tblE.FieldByName('FinalWinPctRank').AsInteger, iFinishPos);
//   adFinalWinPctMinOdds := IncMinDArray(fOdds, adFinalWinPctMinOdds, tblE.FieldByName('FinalWinPctRank').AsInteger, iFinishPos);
//   adFinalWinPctMaxOdds := IncMaxDArray(fOdds, adFinalWinPctMaxOdds, tblE.FieldByName('FinalWinPctRank').AsInteger, iFinishPos);

   alTodaysWagerWinPctRank := IncLArray(alTodaysWagerWinPctRank, tblE.FieldByName('TodaysWagerWinPctRank').AsInteger, iFinishPos);
   adTodaysWagerOrderOdds := IncDArray(fOdds, adTodaysWagerOrderOdds, tblE.FieldByName('TodaysWagerWinPctRank').AsInteger, iFinishPos);
   adTodaysWagerOrderMinOdds := IncMinDArray(fOdds, adTodaysWagerOrderMinOdds, tblE.FieldByName('TodaysWagerWinPctRank').AsInteger, iFinishPos);
   adTodaysWagerOrderMaxOdds := IncMaxDArray(fOdds, adTodaysWagerOrderMaxOdds, tblE.FieldByName('TodaysWagerWinPctRank').AsInteger, iFinishPos);

   //
//   alPrimaryWinPctRank := IncLArray(alPrimaryWinPctRank, tblE.FieldByName('PrimaryWinPctRank').AsInteger, iFinishPos);
//   adPrimaryWinPctOdds := IncDArray(fOdds, adPrimaryWinPctOdds, tblE.FieldByName('PrimaryWinPctRank').AsInteger, iFinishPos);
//   adPrimaryWinPctMinOdds := IncMinDArray(fOdds, adPrimaryWinPctMinOdds, tblE.FieldByName('PrimaryWinPctRank').AsInteger, iFinishPos);
//   adPrimaryWinPctMaxOdds := IncMaxDArray(fOdds, adPrimaryWinPctMaxOdds, tblE.FieldByName('PrimaryWinPctRank').AsInteger, iFinishPos);

//   alSecondaryWinPctRank := IncLArray(alSecondaryWinPctRank, tblE.FieldByName('SecondaryWinPctRank').AsInteger, iFinishPos);
//   adSecondaryWinPctOdds := IncDArray(fOdds, adSecondaryWinPctOdds, tblE.FieldByName('SecondaryWinPctRank').AsInteger, iFinishPos);
//   adSecondaryWinPctMinOdds := IncMinDArray(fOdds, adSecondaryWinPctMinOdds, tblE.FieldByName('SecondaryWinPctRank').AsInteger, iFinishPos);
//   adSecondaryWinPctMaxOdds := IncMaxDArray(fOdds, adSecondaryWinPctMaxOdds, tblE.FieldByName('SecondaryWinPctRank').AsInteger, iFinishPos);

//   alDefaultWinPctRank := IncLArray(alDefaultWinPctRank, tblE.FieldByName('DefaultWinPctRank').AsInteger, iFinishPos);
//   adDefaultWinPctOdds := IncDArray(fOdds, adDefaultWinPctOdds, tblE.FieldByName('DefaultWinPctRank').AsInteger, iFinishPos);
//   adDefaultWinPctMinOdds := IncMinDArray(fOdds, adDefaultWinPctMinOdds, tblE.FieldByName('DefaultWinPctRank').AsInteger, iFinishPos);
//   adDefaultWinPctMaxOdds := IncMaxDArray(fOdds, adDefaultWinPctMaxOdds, tblE.FieldByName('DefaultWinPctRank').AsInteger, iFinishPos);

   if sSurface = 'D' then begin
      if sTrkCond <> 'FT' then begin
         alDamAllMudWinPctRank := IncLArray(alDamAllMudWinPctRank, tblE.FieldByName('DamAllMudWinPctRank').AsInteger, iFinishPos);
         adDamAllMudWinPctOdds := IncDArray(fOdds, adDamAllMudWinPctOdds, tblE.FieldByName('DamAllMudWinPctRank').AsInteger, iFinishPos);
         adDamAllMudWinPctMinOdds := IncMinDArray(fOdds, adDamAllMudWinPctMinOdds, tblE.FieldByName('DamAllMudWinPctRank').AsInteger, iFinishPos);
         adDamAllMudWinPctMaxOdds := IncMaxDArray(fOdds, adDamAllMudWinPctMaxOdds, tblE.FieldByName('DamAllMudWinPctRank').AsInteger, iFinishPos);

         alSireAllMudWinPctRank := IncLArray(alSireAllMudWinPctRank, tblE.FieldByName('SireAllMudWinPctRank').AsInteger, iFinishPos);
         adSireAllMudWinPctOdds := IncDArray(fOdds, adSireAllMudWinPctOdds, tblE.FieldByName('SireAllMudWinPctRank').AsInteger, iFinishPos);
         adSireAllMudWinPctMinOdds := IncMinDArray(fOdds, adSireAllMudWinPctMinOdds, tblE.FieldByName('SireAllMudWinPctRank').AsInteger, iFinishPos);
         adSireAllMudWinPctMaxOdds := IncMaxDArray(fOdds, adSireAllMudWinPctMaxOdds, tblE.FieldByName('SireAllMudWinPctRank').AsInteger, iFinishPos);

         alDamSireAllMudWinPctRank := IncLArray(alDamSireAllMudWinPctRank, tblE.FieldByName('DamSireAllMudWinPctRank').AsInteger, iFinishPos);
         adDamSireAllMudWinPctOdds := IncDArray(fOdds, adDamSireAllMudWinPctOdds, tblE.FieldByName('DamSireAllMudWinPctRank').AsInteger, iFinishPos);
         adDamSireAllMudWinPctMinOdds := IncMinDArray(fOdds, adDamSireAllMudWinPctMinOdds, tblE.FieldByName('DamSireAllMudWinPctRank').AsInteger, iFinishPos);
         adDamSireAllMudWinPctMaxOdds := IncMaxDArray(fOdds, adDamSireAllMudWinPctMaxOdds, tblE.FieldByName('DamSireAllMudWinPctRank').AsInteger, iFinishPos);
      end;
   end;

   //Turf
   if sSurface = 'T' then begin
      alDamAllTurfWinPctRank := IncLArray(alDamAllTurfWinPctRank, tblE.FieldByName('DamAllTurfWinPctRank').AsInteger, iFinishPos);
      adDamAllTurfWinPctOdds := IncDArray(fOdds, adDamAllTurfWinPctOdds, tblE.FieldByName('DamAllTurfWinPctRank').AsInteger, iFinishPos);
      adDamAllTurfWinPctMinOdds := IncMinDArray(fOdds, adDamAllTurfWinPctMinOdds, tblE.FieldByName('DamAllTurfWinPctRank').AsInteger, iFinishPos);
      adDamAllTurfWinPctMaxOdds := IncMaxDArray(fOdds, adDamAllTurfWinPctMaxOdds, tblE.FieldByName('DamAllTurfWinPctRank').AsInteger, iFinishPos);

      alSireAllTurfWinPctRank := IncLArray(alSireAllTurfWinPctRank, tblE.FieldByName('SireAllTurfWinPctRank').AsInteger, iFinishPos);
      adSireAllTurfWinPctOdds := IncDArray(fOdds, adSireAllTurfWinPctOdds, tblE.FieldByName('SireAllTurfWinPctRank').AsInteger, iFinishPos);
      adSireAllTurfWinPctMinOdds := IncMinDArray(fOdds, adSireAllTurfWinPctMinOdds, tblE.FieldByName('SireAllTurfWinPctRank').AsInteger, iFinishPos);
      adSireAllTurfWinPctMaxOdds := IncMaxDArray(fOdds, adSireAllTurfWinPctMaxOdds, tblE.FieldByName('SireAllTurfWinPctRank').AsInteger, iFinishPos);

      alDamSireAllTurfWinPctRank := IncLArray(alDamSireAllTurfWinPctRank, tblE.FieldByName('DamSireAllTurfWinPctRank').AsInteger, iFinishPos);
      adDamSireAllTurfWinPctOdds := IncDArray(fOdds, adDamSireAllTurfWinPctOdds, tblE.FieldByName('DamSireAllTurfWinPctRank').AsInteger, iFinishPos);
      adDamSireAllTurfWinPctMinOdds := IncMinDArray(fOdds, adDamSireAllTurfWinPctMinOdds, tblE.FieldByName('DamSireAllTurfWinPctRank').AsInteger, iFinishPos);
      adDamSireAllTurfWinPctMaxOdds := IncMaxDArray(fOdds, adDamSireAllTurfWinPctMaxOdds, tblE.FieldByName('DamSireAllTurfWinPctRank').AsInteger, iFinishPos);
   end;

   //MSW MCL
   if sSurface = 'D' then begin
      if sTrkCond = 'FT' then begin
         if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin

            alDamAllWinPctRank := IncLArray(alDamAllWinPctRank, tblE.FieldByName('DamAllWinPctRank').AsInteger, iFinishPos);
            adDamAllWinPctOdds := IncDArray(fOdds, adDamAllWinPctOdds, tblE.FieldByName('DamAllWinPctRank').AsInteger, iFinishPos);
            adDamAllWinPctMinOdds := IncMinDArray(fOdds, adDamAllWinPctMinOdds, tblE.FieldByName('DamAllWinPctRank').AsInteger, iFinishPos);
            adDamAllWinPctMaxOdds := IncMaxDArray(fOdds, adDamAllWinPctMaxOdds, tblE.FieldByName('DamAllWinPctRank').AsInteger, iFinishPos);

            alSireAllWinPctRank := IncLArray(alSireAllWinPctRank, tblE.FieldByName('SireAllWinPctRank').AsInteger, iFinishPos);
            adSireAllWinPctOdds := IncDArray(fOdds, adSireAllWinPctOdds, tblE.FieldByName('SireAllWinPctRank').AsInteger, iFinishPos);
            adSireAllWinPctMinOdds := IncMinDArray(fOdds, adSireAllWinPctMinOdds, tblE.FieldByName('SireAllWinPctRank').AsInteger, iFinishPos);
            adSireAllWinPctMaxOdds := IncMaxDArray(fOdds, adSireAllWinPctMaxOdds, tblE.FieldByName('SireAllWinPctRank').AsInteger, iFinishPos);

            alDamSireAllWinPctRank := IncLArray(alDamSireAllWinPctRank, tblE.FieldByName('DamSireAllWinPctRank').AsInteger, iFinishPos);
            adDamSireAllWinPctOdds := IncDArray(fOdds, adDamSireAllWinPctOdds, tblE.FieldByName('DamSireAllWinPctRank').AsInteger, iFinishPos);
            adDamSireAllWinPctMinOdds := IncMinDArray(fOdds, adDamSireAllWinPctMinOdds, tblE.FieldByName('DamSireAllWinPctRank').AsInteger, iFinishPos);
            adDamSireAllWinPctMaxOdds := IncMaxDArray(fOdds, adDamSireAllWinPctMaxOdds, tblE.FieldByName('DamSireAllWinPctRank').AsInteger, iFinishPos);
         end;
      end;
   end;
end;


function SkipThisRecordForRankings(tblR: TDBISAMTable; tblH: TDBISAMTable): boolean;
var
   iFinishPos: integer;
   fOdds: double;
   sSurface: string;
   sTrkCode: string;
   sRaceType: string;
   sTypeOfRace: string;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

begin

   Result := False;

   if (tblH.FieldByName('TrkCode').AsString = '') then begin
      Result := True;
      exit;
   end;

   iFinishPos := tblH.FieldByName('FinishPos').AsInteger;
   fOdds := tblH.FieldByName('Odds').AsFloat;

   fEarlyPace := tblH.FieldByName('EarlyPace').AsFloat;
   fMiddlePace := tblH.FieldByName('MiddlePace').AsFloat;
   fLatePace := tblH.FieldByName('LatePace').AsFloat;

   sTrkCode := tblH.FieldByName('TrkCode').AsString;
   sSurface := tblH.FieldByName('Surface').AsString;
   sRaceType := tblH.FieldByName('RaceType').AsString;
   sTypeOfRace := tblR.FieldByName('TypeOfRace').AsString;

   if (iFinishPos <= 0) then begin
      Result := True;
      exit;
   end;

   if (iFinishPos > MAX_ROWS) then begin
      Result := True;
      exit;
   end;

   if (fOdds <= 0.00) then begin
      Result := True;
      exit;
   end;

   if (fEarlyPace = 0) or (fMiddlePace = 0) or (fLatePace = 0) then begin
      Result := True;
      exit;
   end;

   if (tblH.FieldByName('EarlyPacePos').AsFloat = 0) or
      (tblH.FieldByName('MiddlePacePos').AsFloat = 0) or
      (tblH.FieldByName('LatePacePos').AsFloat = 0) then begin
      Result := True;
      exit;
   end;

   if (tblH.FieldByName('EarlyPacePos').AsFloat = 9999) or
      (tblH.FieldByName('MiddlePacePos').AsFloat = 9999) or
      (tblH.FieldByName('LatePacePos').AsFloat = 9999) then begin
      Result := True;
      exit;
   end;

   if ((sRaceType <> MSW_RACE) and
      (sRaceType <> MCL_RACE) and
      (sRaceType <> ALW_RACE) and
      (sRaceType <> STK_RACE) and
      (sRaceType <> HCP_RACE) and
      (sRaceType <> CLM_RACE) and
      (sRaceType <> OCLM_RACE) and
      (sRaceType <> SALW_RACE) and
      (sRaceType <> SHCP_RACE) and
      (sRaceType <> OCLM_RACE) and
      (sRaceType <> SALW_RACE) and
      (sRaceType <> SHCP_RACE) and
      (sRaceType <> G1_RACE) and
      (sRaceType <> G3_RACE) and
      (sRaceType <> G3_RACE)) then begin
      Result := True;
      exit;
   end;

   // Througbred Only
   if (sTypeOfRace <> 'T') then begin
      Result := True;
      exit;
   end;

   if ((sSurface <> 'T') and (sSurface <> 'D')) then begin
      Result := True;
      exit;
   end;

end;

function GetPastFurlongs(sDistanceDesc: string): double;
var sD: string;

begin

   Result := 0.0;

   sD := UpperCase(sDistanceDesc);

   if sD = ('1M 40Y') then Result := 8.2;
   if sD = ('1M 70Y') then Result := 8.3;
   if sD = ('5F') then Result := 5;
   if sD = ('1F') then Result := 1.0;
   if sD = ('1.5F') then Result := 1.5;
   if sD = ('2F') then Result := 2.0;
   if sD = ('2.5F') then Result := 2.5;
   if sD = ('3F') then Result := 3.0;
   if sD = ('3.5F') then Result := 3.5;
   if sD = ('4F') then Result := 4.0;
   if sD = ('4.5F') then Result := 4.5;
   if sD = ('5F') then Result := 5.0;
   if sD = ('5.5F') then Result := 5.5;
   if sD = ('6F') then Result := 6.0;
   if sD = ('6.5F') then Result := 6.5;
   if sD = ('7F') then Result := 7.0;
   if sD = ('7.5F') then Result := 7.5;
   if sD = ('1M') then Result := 8.0;
   if sD = ('1 1/16M') then Result := 8.5;
   if sD = ('1 1/8M') then Result := 9.0;
   if sD = ('1 3/16M') then Result := 9.5;
   if sD = ('1 1/4M') then Result := 10.0;
   if sD = ('1 5/16M') then Result := 10.5;
   if sD = ('1 3/8M') then Result := 11.0;
   if sD = ('1 7/16M') then Result := 11.5;
   if sD = ('1 1/2M') then Result := 12.0;
   if sD = ('1 9/16M') then Result := 12.5;
   if sD = ('1 5/8M') then Result := 13.0;
   if sD = ('1 11/16M') then Result := 13.5;
   if sD = ('1 3/4M') then Result := 14.0;
   if sD = ('1 13/16M') then Result := 14.5;
   if sD = ('1 7/8M') then Result := 15.0;
   if sD = ('1 15/16M') then Result := 15.5;
   if sD = ('2M') then Result := 16.0;
   if sD = ('2 1/16M') then Result := 16.5;
   if sD = ('2 1/8M') then Result := 17.0;
   if sD = ('2 3/16M') then Result := 17.5;
   if sD = ('2 1/4M') then Result := 18.0;
   if sD = ('2 5/16M') then Result := 18.5;
   if sD = ('2 3/8M') then Result := 19.0;
   if sD = ('2 7/16M') then Result := 19.5;
   if sD = ('2 1/2M') then Result := 20.0;
   if sD = ('2 9/16M') then Result := 20.5;
   if sD = ('2 5/8M') then Result := 21.0;
   if sD = ('2 11/16M') then Result := 21.5;
   if sD = ('2 3/4M') then Result := 22.0;
   if sD = ('2 13/16M') then Result := 22.5;
   if sD = ('2 7/8M') then Result := 23.0;
   if sD = ('2 15/16M') then Result := 23.5;
   if sD = ('3M') then Result := 24.0;
   if sD = ('3 1/16M') then Result := 24.5;
   if sD = ('3 1/8M') then Result := 25.0;
   if sD = ('3 3/16M') then Result := 25.5;
   if sD = ('3 1/4M') then Result := 26.0;
   if sD = ('3 5/16M') then Result := 26.5;
   if sD = ('3 3/8M') then Result := 27.0;
   if sD = ('3 7/16M') then Result := 27.5;
   if sD = ('3 1/2M') then Result := 28.0;
   if sD = ('3 9/16M') then Result := 28.5;
   if sD = ('3 5/8M') then Result := 29.0;
   if sD = ('3 11/16M') then Result := 29.5;
   if sD = ('3 3/4M') then Result := 30.0;
   if sD = ('3 13/16M') then Result := 30.5;
   if sD = ('3 7/8M') then Result := 31.0;
   if sD = ('3 15/16M') then Result := 31.5;
   if sD = ('4M') then Result := 32.0;
end;

function IsValidZip(sFileName: string): boolean;
var
   sIn: string;
   fsIn: TFileStream;
begin

   try

      Result := True;
      try
         MainForm.vZip.CheckArchive

      except

         Result := False;
      end;

      //fsIn := TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite);
      //SetLength(sIn, 1);
      //fsIn.Read(sIn[1], 1);
      //if (sIn = '<') then begin
      //   Result := False;
      //   Result := True;
      //end else begin
      //   Result := True;
      //end;
   finally
      //      FreeAndNil(fsIn);
   end;

end;

end.

