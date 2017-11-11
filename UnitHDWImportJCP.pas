unit UnitHDWImportJCP;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure HDWImportJCP(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblRH: TDBISAMTable;
   tblHH: TDBISAMTable;
   tblPP: TDBISAMTable;

   tblSCR: TDBISAMTable; //Class
   tblSTR: TDBISAMTable; //Turf
   tblSSR: TDBISAMTable; //Sprint
   tblSRR: TDBISAMTable; //Route
   tblSMR: TDBISAMTable; //Mud
   tblSAWR: TDBISAMTable; //All Weather

   tblDSCR: TDBISAMTable; //Class
   tblDSTR: TDBISAMTable; //Turf
   tblDSSR: TDBISAMTable; //Sprint
   tblDSRR: TDBISAMTable; //Route
   tblDSMR: TDBISAMTable; //Mud
   tblDSAWR: TDBISAMTable; //All Weather

   tblTR: TDBISAMTable; //Trainer
   tblTJR: TDBISAMTable; //Trainer Jockey
   tblTOR: TDBISAMTable; //Trainer Owner
   tblTTR: TDBISAMTable; //Trainer Track

   tblJR: TDBISAMTable; //Jockey
   tblJOR: TDBISAMTable; //Jockey Owner
   tblJTR: TDBISAMTable; //Jockey Track

   tblOR: TDBISAMTable; //Owner

   sFileName: string
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;


procedure HDWImportJCP(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblRH: TDBISAMTable;
   tblHH: TDBISAMTable;
   tblPP: TDBISAMTable;

   tblSCR: TDBISAMTable; //Class
   tblSTR: TDBISAMTable; //Turf
   tblSSR: TDBISAMTable; //Sprint
   tblSRR: TDBISAMTable; //Route
   tblSMR: TDBISAMTable; //Mud
   tblSAWR: TDBISAMTable; //All Weather

   tblDSCR: TDBISAMTable; //Class
   tblDSTR: TDBISAMTable; //Turf
   tblDSSR: TDBISAMTable; //Sprint
   tblDSRR: TDBISAMTable; //Route
   tblDSMR: TDBISAMTable; //Mud
   tblDSAWR: TDBISAMTable; //All Weather

   tblTR: TDBISAMTable; //Trainer
   tblTJR: TDBISAMTable; //Trainer Jockey
   tblTOR: TDBISAMTable; //Trainer Owner
   tblTTR: TDBISAMTable; //Trainer Track

   tblJR: TDBISAMTable; //Jockey
   tblJOR: TDBISAMTable; //Jockey Owner
   tblJTR: TDBISAMTable; //Jockey Track

   tblOR: TDBISAMTable; //Owner
   sFileName: string
   );
var

   sWO1: string;
   sWO2: string;
   sWO3: string;
   sWO4: string;
   sWO5: string;
   sWO6: string;

   iWOIdx: integer;

   sDD: string;
   sMM: string;
   sYYYY: string;

   sD: string;
   sM: string;
   sY: string;

   sMonthDesc: string;

   dtRaceDate: TDateTime;
   dtPPRaceDate: TDateTime;
   dtWORaceDate: TDateTime;
   dtWOCutoffDate: TDateTime;
   iDaysLast: integer;

   lstMCP: TStringList;
   lstSplit: TStringList;

   iFldStart: integer;
   iFldIdx: integer;

   iRc: integer;
   iIdx: integer;
   iCnt: integer;

   iPos: integer;
   iHPos: integer;
   iFPPos: integer;
   iBegPos: integer;
   iLen: integer;

   iRaceNbr: integer;
   iLineLen: integer;
   iLineType: integer;

   sTmp: string;
   sWagerTmp: string;

   lstS: TStringList;
   wYear, wMonth, wDay, wHour, wMin, wSec, wMSec: Word;

   sAMPM: string;



  // namespace KSK.PG.DB.Enum
   //   {

   //  public enum JcpField
   //  {
   //    TrackAbbreviation = 0,
   //    RaceDate = 1,
   //    RaceNumber = 2,
   //    PostPosition = 3,
   //    CouplingFlag = 4,
   //    DistanceInYards = 5,
   //    Surface = 6,
   //    Reserved8 = 7,
   //    RaceType = 8,
   //    AgeSexRestriction = 9,
   //    RaceClassification = 10,
   //    Purse = 11,
   //    ClaimingPrice = 12,
   //    HorseClaimingPrice = 13,
   //    TrackRecord = 14,
   //    RaceConditions = 15,
   //    LasixList = 16,
   //    ButeList = 17,
   //    CoupledList = 18,
   //    MutualList = 19,
   //    SimulcastHostTrackAbbreviation = 20,
   //    SimulcastHostTrackRaceNumber = 21,
   //    BreedType = 22,
   //    NasalStripChange = 23,
   //    AllWeatherSurfaceFlag = 24,
   //    Reserved26 = 25,
   //    Reserved27 = 26,
   //    Trainer = 27,
   //    TrainerStarts = 28,
   //    TrainerWins = 29,
   //    TrainerPlaces = 30,
   //    TrainerShows = 31,
   //    Jockey = 32,
   //    ApprenticeWeightAllowance = 33,
   //    JockeyStarts = 34,
   //    JockeyWins = 35,
   //    JockeyPlaces = 36,
   //    JockeyShows = 37,
   //    Owner = 38,
   //    OwnersSilks = 39,
   //    MainTrackOnlyAndAlsoEligibleIndicator = 40,
   //    Reserved42 = 41,
   //    ProgramNumber = 42,
   //    MorningLine = 43,
   //    HorseName = 44,
   //    YearOfBirth = 45,
   //    FoalingMonth = 46,
   //    BestFigDirt = 47,
   //    Sex = 48,
   //    HorseColor = 49,
   //    Weight = 50,
   //    Sire = 51,
   //    SireSire = 52,
   //    Dam = 53,
   //    DamsSire = 54,
   //    Breeder = 55,
   //    BredInState = 56,
   //    ProgramPostPosition = 57,
   //    JockeyRoiAtTrack = 58,
   //    TrainerRoiAtTrack = 59,
   //    GeldedSinceLastStart = 60,
   //    TodaysMedicine1 = 61,
   //    TodaysMedicine2 = 62,
   //    EquipmentChange = 63,
   //    DistanceStarts = 64,
   //    DistanceWins = 65,
   //    DistancePlaces = 66,
   //    DistanceShows = 67,
   //    DistanceEarnings = 68,
   //    TrackStarts = 69,
   //    TrackWins = 70,
   //    TrackPlaces = 71,
   //    TrackShows = 72,
   //    TrackEarnings = 73,
   //    TurfStarts = 74,
   //    TurfWins = 75,
   //    TurfPlaces = 76,
   //    TurfShows = 77,
   //    TurfEarnings = 78,
   //    MudStarts = 79,
   //    MudWins = 80,
   //    MudPlaces = 81,
   //    MudShows = 82,
   //    MudEarnings = 83,
   //    CurrentYearYear = 84,
   //    CurrentYearStarts = 85,
   //    CurrentYearWins = 86,
   //    CurrentYearPlaces = 87,
   //    CurrentYearShows = 88,
   //    CurrentYearEarnings = 89,
   //    PreviousYearYear = 90,
   //    PreviousYearStarts = 91,
   //    PreviousYearWins = 92,
   //    PreviousYearPlaces = 93,
   //    PreviousYearShows = 94,
   //    PreviousYearEarnings = 95,
   //    LifeTimeStarts = 96,
   //    LifeTimeWins = 97,
   //    LifeTimePlaces = 98,
   //    LifeTimeShows = 99,
   //    LifeTimeEarnings = 100,
   //    DateOfWorkout1 = 101,
   //    DateOfWorkout2 = 102,
   //    DateOfWorkout3 = 103,
   //    DateOfWorkout4 = 104,
   //    DateOfWorkout5 = 105,
   //    DateOfWorkout6 = 106,
   //    DateOfWorkout7 = 107,
   //    DateOfWorkout8 = 108,
   //    DateOfWorkout9 = 109,
   //    DateOfWorkout10 = 110,
   //    NotInHdwDateOfWorkout11 = 111,
   //    NotInHdwDateOfWorkout12 = 112,
   //    TimeOfWorkout1 = 113,
   //    TimeOfWorkout2 = 114,
   //    TimeOfWorkout3 = 115,
   //    TimeOfWorkout4 = 116,
   //    TimeOfWorkout5 = 117,
   //    TimeOfWorkout6 = 118,
   //    TimeOfWorkout7 = 119,
   //    TimeOfWorkout8 = 120,
   //    TimeOfWorkout9 = 121,
   //    TimeOfWorkout10 = 122,
   //    NotInHdwTimeOfWorkout11 = 123,
   //    NotInHdwTimeOfWorkout12 = 124,
   //    TrackAbbreviationWorkout1 = 125,
   //    TrackAbbreviationWorkout2 = 126,
   //    TrackAbbreviationWorkout3 = 127,
   //    TrackAbbreviationWorkout4 = 128,
   //    TrackAbbreviationWorkout5 = 129,
   //    TrackAbbreviationWorkout6 = 130,
   //    TrackAbbreviationWorkout7 = 131,
   //    TrackAbbreviationWorkout8 = 132,
   //    TrackAbbreviationWorkout9 = 133,
   //    TrackAbbreviationWorkout10 = 134,
   //    NotInHdwTrackAbbreviationWorkout11 = 135,
   //    NotInHdwTrackAbbreviationWorkout12 = 136,
   //    DistanceOfWorkout1 = 137,
   //    DistanceOfWorkout2 = 138,
   //    DistanceOfWorkout3 = 139,
   //    DistanceOfWorkout4 = 140,
   //    DistanceOfWorkout5 = 141,
   //    DistanceOfWorkout6 = 142,
   //    DistanceOfWorkout7 = 143,
   //    DistanceOfWorkout8 = 144,
   //    DistanceOfWorkout9 = 145,
   //    DistanceOfWorkout10 = 146,
   //    NotInHdwDistanceOfWorkout11 = 147,
   //    NotInHdwDistanceOfWorkout12 = 148,
   //    TrackConditionWorkout1 = 149,
   //    TrackConditionWorkout2 = 150,
   //    TrackConditionWorkout3 = 151,
   //    TrackConditionWorkout4 = 152,
   //    TrackConditionWorkout5 = 153,
   //    TrackConditionWorkout6 = 154,
   //    TrackConditionWorkout7 = 155,
   //    TrackConditionWorkout8 = 156,
   //    TrackConditionWorkout9 = 157,
   //    TrackConditionWorkout10 = 158,
   //    NotInHdwTrackConditionWorkout11 = 159,
   //    NotInHdwTrackConditionWorkout12 = 160,
   //    DescriptionWorkout1 = 161,
   //    DescriptionWorkout2 = 162,
   //    DescriptionWorkout3 = 163,
   //    DescriptionWorkout4 = 164,
   //    DescriptionWorkout5 = 165,
   //    DescriptionWorkout6 = 166,
   //    DescriptionWorkout7 = 167,
   //    DescriptionWorkout8 = 168,
   //    DescriptionWorkout9 = 169,
   //    DescriptionWorkout10 = 170,
   //    NotInHdwDescriptionWorkout11 = 171,
   //    NotInHdwDescriptionWorkout12 = 172,
   //    MainOrInnerTrackIndicatorWorkout1 = 173,
   //    MainOrInnerTrackIndicatorWorkout2 = 174,
   //    MainOrInnerTrackIndicatorWorkout3 = 175,
   //    MainOrInnerTrackIndicatorWorkout4 = 176,
   //    MainOrInnerTrackIndicatorWorkout5 = 177,
   //    MainOrInnerTrackIndicatorWorkout6 = 178,
   //    MainOrInnerTrackIndicatorWorkout7 = 179,
   //    MainOrInnerTrackIndicatorWorkout8 = 180,
   //    MainOrInnerTrackIndicatorWorkout9 = 181,
   //    MainOrInnerTrackIndicatorWorkout10 = 182,
   //    NotInHdwMainOrInnerTrackIndicatorWorkout11 = 183,
   //    NotInHdwMainOrInnerTrackIndicatorWorkout12 = 184,
   //    NumberOfWorksForDayWorkout1 = 185,
   //    NumberOfWorksForDayWorkout2 = 186,
   //    NumberOfWorksForDayWorkout3 = 187,
   //    NumberOfWorksForDayWorkout4 = 188,
   //    NumberOfWorksForDayWorkout5 = 189,
   //    NumberOfWorksForDayWorkout6 = 190,
   //    NumberOfWorksForDayWorkout7 = 191,
   //    NumberOfWorksForDayWorkout8 = 192,
   //    NumberOfWorksForDayWorkout9 = 193,
   //    NumberOfWorksForDayWorkout10 = 194,
   //    NotInHdwNumberOfWorksForDayWorkout11 = 195,
   //    NotInHdwNumberOfWorksForDayWorkout12 = 196,
   //    RankOfWorkoutForDay1 = 197,
   //    RankOfWorkoutForDay2 = 198,
   //    RankOfWorkoutForDay3 = 199,
   //    RankOfWorkoutForDay4 = 200,
   //    RankOfWorkoutForDay5 = 201,
   //    RankOfWorkoutForDay6 = 202,
   //    RankOfWorkoutForDay7 = 203,
   //    RankOfWorkoutForDay8 = 204,
   //    RankOfWorkoutForDay9 = 205,
   //    RankOfWorkoutForDay10 = 206,
   //    NotInHdwRankOfWorkoutForDay11 = 207,
   //    NotInHdwRankOfWorkoutForDay12 = 208,
   //    RunStyle = 209,
   //    QuirinSpeedPoints = 210,
   //    HdwNumericRunStyle = 211,
   //    HdwAltSpeedPoints = 212,
   //    TwoFurlongsPaceParForClassLevel = 213,
   //    FourFurlongsPaceParForClassLevel = 214,
   //    SixFurlongsPaceParForLevel = 215,
   //    SpeedParForClassLevel = 216,
   //    LatePaceParForClassLevel = 217,
   //    Reserved219 = 218,
   //    Reserved220 = 219,
   //    Reserved221 = 220,
   //    Reserved222 = 221,
   //    Reserved223 = 222,
   //    DaysSinceLastRace = 223,
   //    RaceConditions1 = 224,
   //    RaceConditions2 = 225,
   //    RaceConditions3 = 226,
   //    RaceConditions4 = 227,
   //    RaceConditions5 = 228,
   //    RaceConditions6 = 229,
   //    LifetimeStartsAllWeatherSurface = 230,
   //    LifetimeWinsAllWeatherSurface = 231,
   //    LifetimePlacesAllWeatherSurface = 232,
   //    LifetimeShowsAllWeatherSurface = 233,
   //    LifetimeEarningsAllWeatherSurface = 234,
   //    BestSpeedAllWeatherSurface = 235,
   //    Reserved237 = 236,
   //    LowClaimingPriceForRace = 237,
   //    StatebredFlagForRace = 238,
   //    WagerTypes1 = 239,
   //    WagerTypes2 = 240,
   //    WagerTypes3 = 241,
   //    WagerTypes4 = 242,
   //    WagerTypes5 = 243,
   //    WagerTypes6 = 244,
   //    WagerTypes7 = 245,
   //    WagerTypes8 = 246,
   //    WagerTypes9 = 247,
   //    Reserved249 = 248,
   //    Reserved250 = 249,
   //    HdwPsrRating = 250,
   //    Reserved252 = 251,
   //    Reserved253 = 252,
   //    Reserved254 = 253,
   //    Reserved255 = 254,
   //    PpRaceDate1 = 255,
   //    PpRaceDate2 = 256,
   //    PpRaceDate3 = 257,
   //    PpRaceDate4 = 258,
   //    PpRaceDate5 = 259,
   //    PpRaceDate6 = 260,
   //    PpRaceDate7 = 261,
   //    PpRaceDate8 = 262,
   //    PpRaceDate9 = 263,
   //    PpRaceDate10 = 264,
   //    PpDaysSincePreviousRace1 = 265,
   //    PpDaysSincePreviousRace2 = 266,
   //    PpDaysSincePreviousRace3 = 267,
   //    PpDaysSincePreviousRace4 = 268,
   //    PpDaysSincePreviousRace5 = 269,
   //    PpDaysSincePreviousRace6 = 270,
   //    PpDaysSincePreviousRace7 = 271,
   //    PpDaysSincePreviousRace8 = 272,
   //    PpDaysSincePreviousRace9 = 273,
   //    PpDaysSincePreviousRace10 = 274,
   //    PpBrisTrackAbbreviation1 = 275,
   //    PpBrisTrackAbbreviation2 = 276,
   //    PpBrisTrackAbbreviation3 = 277,
   //    PpBrisTrackAbbreviation4 = 278,
   //    PpBrisTrackAbbreviation5 = 279,
   //    PpBrisTrackAbbreviation6 = 280,
   //    PpBrisTrackAbbreviation7 = 281,
   //    PpBrisTrackAbbreviation8 = 282,
   //    PpBrisTrackAbbreviation9 = 283,
   //    PpBrisTrackAbbreviation10 = 284,
   //    PpTrackAbbreviation1 = 285,
   //    PpTrackAbbreviation2 = 286,
   //    PpTrackAbbreviation3 = 287,
   //    PpTrackAbbreviation4 = 288,
   //    PpTrackAbbreviation5 = 289,
   //    PpTrackAbbreviation6 = 290,
   //    PpTrackAbbreviation7 = 291,
   //    PpTrackAbbreviation8 = 292,
   //    PpTrackAbbreviation9 = 293,
   //    PpTrackAbbreviation10 = 294,
   //    PpRaceNumber1 = 295,
   //    PpRaceNumber2 = 296,
   //    PpRaceNumber3 = 297,
   //    PpRaceNumber4 = 298,
   //    PpRaceNumber5 = 299,
   //    PpRaceNumber6 = 300,
   //    PpRaceNumber7 = 301,
   //    PpRaceNumber8 = 302,
   //    PpRaceNumber9 = 303,
   //    PpRaceNumber10 = 304,
   //    PpTrackCondition1 = 305,
   //    PpTrackCondition2 = 306,
   //    PpTrackCondition3 = 307,
   //    PpTrackCondition4 = 308,
   //    PpTrackCondition5 = 309,
   //    PpTrackCondition6 = 310,
   //    PpTrackCondition7 = 311,
   //    PpTrackCondition8 = 312,
   //    PpTrackCondition9 = 313,
   //    PpTrackCondition10 = 314,
   //    PpDistanceInYards1 = 315,
   //    PpDistanceInYards2 = 316,
   //    PpDistanceInYards3 = 317,
   //    PpDistanceInYards4 = 318,
   //    PpDistanceInYards5 = 319,
   //    PpDistanceInYards6 = 320,
   //    PpDistanceInYards7 = 321,
   //    PpDistanceInYards8 = 322,
   //    PpDistanceInYards9 = 323,
   //    PpDistanceInYards10 = 324,
   //    PpSurface1 = 325,
   //    PpSurface2 = 326,
   //    PpSurface3 = 327,
   //    PpSurface4 = 328,
   //    PpSurface5 = 329,
   //    PpSurface6 = 330,
   //    PpSurface7 = 331,
   //    PpSurface8 = 332,
   //    PpSurface9 = 333,
   //    PpSurface10 = 334,
   //    PpSpecialChute1 = 335,
   //    PpSpecialChute2 = 336,
   //    PpSpecialChute3 = 337,
   //    PpSpecialChute4 = 338,
   //    PpSpecialChute5 = 339,
   //    PpSpecialChute6 = 340,
   //    PpSpecialChute7 = 341,
   //    PpSpecialChute8 = 342,
   //    PpSpecialChute9 = 343,
   //    PpSpecialChute10 = 344,
   //    PpNumberEntrants1 = 345,
   //    PpNumberEntrants2 = 346,
   //    PpNumberEntrants3 = 347,
   //    PpNumberEntrants4 = 348,
   //    PpNumberEntrants5 = 349,
   //    PpNumberEntrants6 = 350,
   //    PpNumberEntrants7 = 351,
   //    PpNumberEntrants8 = 352,
   //    PpNumberEntrants9 = 353,
   //    PpNumberEntrants10 = 354,
   //    PpPostPosition1 = 355,
   //    PpPostPosition2 = 356,
   //    PpPostPosition3 = 357,
   //    PpPostPosition4 = 358,
   //    PpPostPosition5 = 359,
   //    PpPostPosition6 = 360,
   //    PpPostPosition7 = 361,
   //    PpPostPosition8 = 362,
   //    PpPostPosition9 = 363,
   //    PpPostPosition10 = 364,
   //    PpEquipment1 = 365,
   //    PpEquipment2 = 366,
   //    PpEquipment3 = 367,
   //    PpEquipment4 = 368,
   //    PpEquipment5 = 369,
   //    PpEquipment6 = 370,
   //    PpEquipment7 = 371,
   //    PpEquipment8 = 372,
   //    PpEquipment9 = 373,
   //    PpEquipment10 = 374,
   //    Reserved376 = 375,
   //    Reserved377 = 376,
   //    Reserved378 = 377,
   //    Reserved379 = 378,
   //    Reserved380 = 379,
   //    Reserved381 = 380,
   //    Reserved382 = 381,
   //    Reserved383 = 382,
   //    Reserved384 = 383,
   //    Reserved385 = 384,
   //    PpMedicine1 = 385,
   //    PpMedicine2 = 386,
   //    PpMedicine3 = 387,
   //    PpMedicine4 = 388,
   //    PpMedicine5 = 389,
   //    PpMedicine6 = 390,
   //    PpMedicine7 = 391,
   //    PpMedicine8 = 392,
   //    PpMedicine9 = 393,
   //    PpMedicine10 = 394,
   //    PpTripComment1 = 395,
   //    PpTripComment2 = 396,
   //    PpTripComment3 = 397,
   //    PpTripComment4 = 398,
   //    PpTripComment5 = 399,
   //    PpTripComment6 = 400,
   //    PpTripComment7 = 401,
   //    PpTripComment8 = 402,
   //    PpTripComment9 = 403,
   //    PpTripComment10 = 404,
   //    PpWinnersName1 = 405,
   //    PpWinnersName2 = 406,
   //    PpWinnersName3 = 407,
   //    PpWinnersName4 = 408,
   //    PpWinnersName5 = 409,
   //    PpWinnersName6 = 410,
   //    PpWinnersName7 = 411,
   //    PpWinnersName8 = 412,
   //    PpWinnersName9 = 413,
   //    PpWinnersName10 = 414,
   //    PpPlacePlaceName1 = 415,
   //    PpPlacePlaceName2 = 416,
   //    PpPlacePlaceName3 = 417,
   //    PpPlacePlaceName4 = 418,
   //    PpPlacePlaceName5 = 419,
   //    PpPlacePlaceName6 = 420,
   //    PpPlacePlaceName7 = 421,
   //    PpPlacePlaceName8 = 422,
   //    PpPlacePlaceName9 = 423,
   //    PpPlacePlaceName10 = 424,
   //    PpShowPlaceName1 = 425,
   //    PpShowPlaceName2 = 426,
   //    PpShowPlaceName3 = 427,
   //    PpShowPlaceName4 = 428,
   //    PpShowPlaceName5 = 429,
   //    PpShowPlaceName6 = 430,
   //    PpShowPlaceName7 = 431,
   //    PpShowPlaceName8 = 432,
   //    PpShowPlaceName9 = 433,
   //    PpShowPlaceName10 = 434,
   //    PpWinnersWeight1 = 435,
   //    PpWinnersWeight2 = 436,
   //    PpWinnersWeight3 = 437,
   //    PpWinnersWeight4 = 438,
   //    PpWinnersWeight5 = 439,
   //    PpWinnersWeight6 = 440,
   //    PpWinnersWeight7 = 441,
   //    PpWinnersWeight8 = 442,
   //    PpWinnersWeight9 = 443,
   //    PpWinnersWeight10 = 444,
   //    PpPlacePlaceWeight1 = 445,
   //    PpPlacePlaceWeight2 = 446,
   //    PpPlacePlaceWeight3 = 447,
   //    PpPlacePlaceWeight4 = 448,
   //    PpPlacePlaceWeight5 = 449,
   //    PpPlacePlaceWeight6 = 450,
   //    PpPlacePlaceWeight7 = 451,
   //    PpPlacePlaceWeight8 = 452,
   //    PpPlacePlaceWeight9 = 453,
   //    PpPlacePlaceWeight10 = 454,
   //    PpShowPlaceWeight1 = 455,
   //    PpShowPlaceWeight2 = 456,
   //    PpShowPlaceWeight3 = 457,
   //    PpShowPlaceWeight4 = 458,
   //    PpShowPlaceWeight5 = 459,
   //    PpShowPlaceWeight6 = 460,
   //    PpShowPlaceWeight7 = 461,
   //    PpShowPlaceWeight8 = 462,
   //    PpShowPlaceWeight9 = 463,
   //    PpShowPlaceWeight10 = 464,
   //    PpWinnersMargin1 = 465,
   //    PpWinnersMargin2 = 466,
   //    PpWinnersMargin3 = 467,
   //    PpWinnersMargin4 = 468,
   //    PpWinnersMargin5 = 469,
   //    PpWinnersMargin6 = 470,
   //    PpWinnersMargin7 = 471,
   //    PpWinnersMargin8 = 472,
   //    PpWinnersMargin9 = 473,
   //    PpWinnersMargin10 = 474,
   //    PpPlaceMargin1 = 475,
   //    PpPlaceMargin2 = 476,
   //    PpPlaceMargin3 = 477,
   //    PpPlaceMargin4 = 478,
   //    PpPlaceMargin5 = 479,
   //    PpPlaceMargin6 = 480,
   //    PpPlaceMargin7 = 481,
   //    PpPlaceMargin8 = 482,
   //    PpPlaceMargin9 = 483,
   //    PpPlaceMargin10 = 484,
   //    PpShowMargin1 = 485,
   //    PpShowMargin2 = 486,
   //    PpShowMargin3 = 487,
   //    PpShowMargin4 = 488,
   //    PpShowMargin5 = 489,
   //    PpShowMargin6 = 490,
   //    PpShowMargin7 = 491,
   //    PpShowMargin8 = 492,
   //    PpShowMargin9 = 493,
   //    PpShowMargin10 = 494,
   //    PpExtraComment1 = 495,
   //    PpExtraComment2 = 496,
   //    PpExtraComment3 = 497,
   //    PpExtraComment4 = 498,
   //    PpExtraComment5 = 499,
   //    PpExtraComment6 = 500,
   //    PpExtraComment7 = 501,
   //    PpExtraComment8 = 502,
   //    PpExtraComment9 = 503,
   //    PpExtraComment10 = 504,
   //    PpWeight1 = 505,
   //    PpWeight2 = 506,
   //    PpWeight3 = 507,
   //    PpWeight4 = 508,
   //    PpWeight5 = 509,
   //    PpWeight6 = 510,
   //    PpWeight7 = 511,
   //    PpWeight8 = 512,
   //    PpWeight9 = 513,
   //    PpWeight10 = 514,
   //    PpOdds1 = 515,
   //    PpOdds2 = 516,
   //    PpOdds3 = 517,
   //    PpOdds4 = 518,
   //    PpOdds5 = 519,
   //    PpOdds6 = 520,
   //    PpOdds7 = 521,
   //    PpOdds8 = 522,
   //    PpOdds9 = 523,
   //    PpOdds10 = 524,
   //    PpEntry1 = 525,
   //    PpEntry2 = 526,
   //    PpEntry3 = 527,
   //    PpEntry4 = 528,
   //    PpEntry5 = 529,
   //    PpEntry6 = 530,
   //    PpEntry7 = 531,
   //    PpEntry8 = 532,
   //    PpEntry9 = 533,
   //    PpEntry10 = 534,
   //    PpRaceClassification1 = 535,
   //    PpRaceClassification2 = 536,
   //    PpRaceClassification3 = 537,
   //    PpRaceClassification4 = 538,
   //    PpRaceClassification5 = 539,
   //    PpRaceClassification6 = 540,
   //    PpRaceClassification7 = 541,
   //    PpRaceClassification8 = 542,
   //    PpRaceClassification9 = 543,
   //    PpRaceClassification10 = 544,
   //    PpClaimingPriceHorse1 = 545,
   //    PpClaimingPriceHorse2 = 546,
   //    PpClaimingPriceHorse3 = 547,
   //    PpClaimingPriceHorse4 = 548,
   //    PpClaimingPriceHorse5 = 549,
   //    PpClaimingPriceHorse6 = 550,
   //    PpClaimingPriceHorse7 = 551,
   //    PpClaimingPriceHorse8 = 552,
   //    PpClaimingPriceHorse9 = 553,
   //    PpClaimingPriceHorse10 = 554,
   //    PpPurse1 = 555,
   //    PpPurse2 = 556,
   //    PpPurse3 = 557,
   //    PpPurse4 = 558,
   //    PpPurse5 = 559,
   //    PpPurse6 = 560,
   //    PpPurse7 = 561,
   //    PpPurse8 = 562,
   //    PpPurse9 = 563,
   //    PpPurse10 = 564,
   //    PpStartingCallPosition1 = 565,
   //    PpStartingCallPosition2 = 566,
   //    PpStartingCallPosition3 = 567,
   //    PpStartingCallPosition4 = 568,
   //    PpStartingCallPosition5 = 569,
   //    PpStartingCallPosition6 = 570,
   //    PpStartingCallPosition7 = 571,
   //    PpStartingCallPosition8 = 572,
   //    PpStartingCallPosition9 = 573,
   //    PpStartingCallPosition10 = 574,
   //    PpFirstCallPosition1 = 575,
   //    PpFirstCallPosition2 = 576,
   //    PpFirstCallPosition3 = 577,
   //    PpFirstCallPosition4 = 578,
   //    PpFirstCallPosition5 = 579,
   //    PpFirstCallPosition6 = 580,
   //    PpFirstCallPosition7 = 581,
   //    PpFirstCallPosition8 = 582,
   //    PpFirstCallPosition9 = 583,
   //    PpFirstCallPosition10 = 584,
   //    PpSecondCallPosition1 = 585,
   //    PpSecondCallPosition2 = 586,
   //    PpSecondCallPosition3 = 587,
   //    PpSecondCallPosition4 = 588,
   //    PpSecondCallPosition5 = 589,
   //    PpSecondCallPosition6 = 590,
   //    PpSecondCallPosition7 = 591,
   //    PpSecondCallPosition8 = 592,
   //    PpSecondCallPosition9 = 593,
   //    PpSecondCallPosition10 = 594,
   //    PpGateCallPosition1 = 595,
   //    PpGateCallPosition2 = 596,
   //    PpGateCallPosition3 = 597,
   //    PpGateCallPosition4 = 598,
   //    PpGateCallPosition5 = 599,
   //    PpGateCallPosition6 = 600,
   //    PpGateCallPosition7 = 601,
   //    PpGateCallPosition8 = 602,
   //    PpGateCallPosition9 = 603,
   //    PpGateCallPosition10 = 604,
   //    PpStretchPosition1 = 605,
   //    PpStretchPosition2 = 606,
   //    PpStretchPosition3 = 607,
   //    PpStretchPosition4 = 608,
   //    PpStretchPosition5 = 609,
   //    PpStretchPosition6 = 610,
   //    PpStretchPosition7 = 611,
   //    PpStretchPosition8 = 612,
   //    PpStretchPosition9 = 613,
   //    PpStretchPosition10 = 614,
   //    PpFinishPosition1 = 615,
   //    PpFinishPosition2 = 616,
   //    PpFinishPosition3 = 617,
   //    PpFinishPosition4 = 618,
   //    PpFinishPosition5 = 619,
   //    PpFinishPosition6 = 620,
   //    PpFinishPosition7 = 621,
   //    PpFinishPosition8 = 622,
   //    PpFinishPosition9 = 623,
   //    PpFinishPosition10 = 624,
   //    PpMoneyPosition1 = 625,
   //    PpMoneyPosition2 = 626,
   //    PpMoneyPosition3 = 627,
   //    PpMoneyPosition4 = 628,
   //    PpMoneyPosition5 = 629,
   //    PpMoneyPosition6 = 630,
   //    PpMoneyPosition7 = 631,
   //    PpMoneyPosition8 = 632,
   //    PpMoneyPosition9 = 633,
   //    PpMoneyPosition10 = 634,
   //    PpStartCallBeatenMargin1 = 635,
   //    PpStartCallBeatenMargin2 = 636,
   //    PpStartCallBeatenMargin3 = 637,
   //    PpStartCallBeatenMargin4 = 638,
   //    PpStartCallBeatenMargin5 = 639,
   //    PpStartCallBeatenMargin6 = 640,
   //    PpStartCallBeatenMargin7 = 641,
   //    PpStartCallBeatenMargin8 = 642,
   //    PpStartCallBeatenMargin9 = 643,
   //    PpStartCallBeatenMargin10 = 644,
   //    PpStartCallBeaten1 = 645,
   //    PpStartCallBeaten2 = 646,
   //    PpStartCallBeaten3 = 647,
   //    PpStartCallBeaten4 = 648,
   //    PpStartCallBeaten5 = 649,
   //    PpStartCallBeaten6 = 650,
   //    PpStartCallBeaten7 = 651,
   //    PpStartCallBeaten8 = 652,
   //    PpStartCallBeaten9 = 653,
   //    PpStartCallBeaten10 = 654,
   //    PpFirstCallBeatenMargin1 = 655,
   //    PpFirstCallBeatenMargin2 = 656,
   //    PpFirstCallBeatenMargin3 = 657,
   //    PpFirstCallBeatenMargin4 = 658,
   //    PpFirstCallBeatenMargin5 = 659,
   //    PpFirstCallBeatenMargin6 = 660,
   //    PpFirstCallBeatenMargin7 = 661,
   //    PpFirstCallBeatenMargin8 = 662,
   //    PpFirstCallBeatenMargin9 = 663,
   //    PpFirstCallBeatenMargin10 = 664,
   //    PpFirstCallBeaten1 = 665,
   //    PpFirstCallBeaten2 = 666,
   //    PpFirstCallBeaten3 = 667,
   //    PpFirstCallBeaten4 = 668,
   //    PpFirstCallBeaten5 = 669,
   //    PpFirstCallBeaten6 = 670,
   //    PpFirstCallBeaten7 = 671,
   //    PpFirstCallBeaten8 = 672,
   //    PpFirstCallBeaten9 = 673,
   //    PpFirstCallBeaten10 = 674,
   //    PpSecondCallBeatenMargin1 = 675,
   //    PpSecondCallBeatenMargin2 = 676,
   //    PpSecondCallBeatenMargin3 = 677,
   //    PpSecondCallBeatenMargin4 = 678,
   //    PpSecondCallBeatenMargin5 = 679,
   //    PpSecondCallBeatenMargin6 = 680,
   //    PpSecondCallBeatenMargin7 = 681,
   //    PpSecondCallBeatenMargin8 = 682,
   //    PpSecondCallBeatenMargin9 = 683,
   //    PpSecondCallBeatenMargin10 = 684,
   //    PpSecondCallBeaten1 = 685,
   //    PpSecondCallBeaten2 = 686,
   //    PpSecondCallBeaten3 = 687,
   //    PpSecondCallBeaten4 = 688,
   //    PpSecondCallBeaten5 = 689,
   //    PpSecondCallBeaten6 = 690,
   //    PpSecondCallBeaten7 = 691,
   //    PpSecondCallBeaten8 = 692,
   //    PpSecondCallBeaten9 = 693,
   //    PpSecondCallBeaten10 = 694,
   //    PpRaceShapeSecondCall1 = 695,
   //    PpRaceShapeSecondCall2 = 696,
   //    PpRaceShapeSecondCall3 = 697,
   //    PpRaceShapeSecondCall4 = 698,
   //    PpRaceShapeSecondCall5 = 699,
   //    PpRaceShapeSecondCall6 = 700,
   //    PpRaceShapeSecondCall7 = 701,
   //    PpRaceShapeSecondCall8 = 702,
   //    PpRaceShapeSecondCall9 = 703,
   //    PpRaceShapeSecondCall10 = 704,
   //    Reserved706 = 705,
   //    Reserved707 = 706,
   //    Reserved708 = 707,
   //    Reserved709 = 708,
   //    Reserved710 = 709,
   //    Reserved711 = 710,
   //    Reserved712 = 711,
   //    Reserved713 = 712,
   //    Reserved714 = 713,
   //    Reserved715 = 714,
   //    PpStretchBeatenMargin1 = 715,
   //    PpStretchBeatenMargin2 = 716,
   //    PpStretchBeatenMargin3 = 717,
   //    PpStretchBeatenMargin4 = 718,
   //    PpStretchBeatenMargin5 = 719,
   //    PpStretchBeatenMargin6 = 720,
   //    PpStretchBeatenMargin7 = 721,
   //    PpStretchBeatenMargin8 = 722,
   //    PpStretchBeatenMargin9 = 723,
   //    PpStretchBeatenMargin10 = 724,
   //    PpStretchBeaten1 = 725,
   //    PpStretchBeaten2 = 726,
   //    PpStretchBeaten3 = 727,
   //    PpStretchBeaten4 = 728,
   //    PpStretchBeaten5 = 729,
   //    PpStretchBeaten6 = 730,
   //    PpStretchBeaten7 = 731,
   //    PpStretchBeaten8 = 732,
   //    PpStretchBeaten9 = 733,
   //    PpStretchBeaten10 = 734,
   //    PpFinishBeatenMargin1 = 735,
   //    PpFinishBeatenMargin2 = 736,
   //    PpFinishBeatenMargin3 = 737,
   //    PpFinishBeatenMargin4 = 738,
   //    PpFinishBeatenMargin5 = 739,
   //    PpFinishBeatenMargin6 = 740,
   //    PpFinishBeatenMargin7 = 741,
   //    PpFinishBeatenMargin8 = 742,
   //    PpFinishBeatenMargin9 = 743,
   //    PpFinishBeatenMargin10 = 744,
   //    PpFinishBeaten1 = 745,
   //    PpFinishBeaten2 = 746,
   //    PpFinishBeaten3 = 747,
   //    PpFinishBeaten4 = 748,
   //    PpFinishBeaten5 = 749,
   //    PpFinishBeaten6 = 750,
   //    PpFinishBeaten7 = 751,
   //    PpFinishBeaten8 = 752,
   //    PpFinishBeaten9 = 753,
   //    PpFinishBeaten10 = 754,
   //    PpRaceShapeFirstCall1 = 755,
   //    PpRaceShapeFirstCall2 = 756,
   //    PpRaceShapeFirstCall3 = 757,
   //    PpRaceShapeFirstCall4 = 758,
   //    PpRaceShapeFirstCall5 = 759,
   //    PpRaceShapeFirstCall6 = 760,
   //    PpRaceShapeFirstCall7 = 761,
   //    PpRaceShapeFirstCall8 = 762,
   //    PpRaceShapeFirstCall9 = 763,
   //    PpRaceShapeFirstCall10 = 764,
   //    PpTwoFurlongPaceRating1 = 765,
   //    PpTwoFurlongPaceRating2 = 766,
   //    PpTwoFurlongPaceRating3 = 767,
   //    PpTwoFurlongPaceRating4 = 768,
   //    PpTwoFurlongPaceRating5 = 769,
   //    PpTwoFurlongPaceRating6 = 770,
   //    PpTwoFurlongPaceRating7 = 771,
   //    PpTwoFurlongPaceRating8 = 772,
   //    PpTwoFurlongPaceRating9 = 773,
   //    PpTwoFurlongPaceRating10 = 774,
   //    PpFourFurlongPaceRating1 = 775,
   //    PpFourFurlongPaceRating2 = 776,
   //    PpFourFurlongPaceRating3 = 777,
   //    PpFourFurlongPaceRating4 = 778,
   //    PpFourFurlongPaceRating5 = 779,
   //    PpFourFurlongPaceRating6 = 780,
   //    PpFourFurlongPaceRating7 = 781,
   //    PpFourFurlongPaceRating8 = 782,
   //    PpFourFurlongPaceRating9 = 783,
   //    PpFourFurlongPaceRating10 = 784,
   //    PpSixFurlongPaceRating1 = 785,
   //    PpSixFurlongPaceRating2 = 786,
   //    PpSixFurlongPaceRating3 = 787,
   //    PpSixFurlongPaceRating4 = 788,
   //    PpSixFurlongPaceRating5 = 789,
   //    PpSixFurlongPaceRating6 = 790,
   //    PpSixFurlongPaceRating7 = 791,
   //    PpSixFurlongPaceRating8 = 792,
   //    PpSixFurlongPaceRating9 = 793,
   //    PpSixFurlongPaceRating10 = 794,
   //    PpEightFurlongPaceRating1 = 795,
   //    PpEightFurlongPaceRating2 = 796,
   //    PpEightFurlongPaceRating3 = 797,
   //    PpEightFurlongPaceRating4 = 798,
   //    PpEightFurlongPaceRating5 = 799,
   //    PpEightFurlongPaceRating6 = 800,
   //    PpEightFurlongPaceRating7 = 801,
   //    PpEightFurlongPaceRating8 = 802,
   //    PpEightFurlongPaceRating9 = 803,
   //    PpEightFurlongPaceRating10 = 804,
   //    PpTenFurlongPaceRating1 = 805,
   //    PpTenFurlongPaceRating2 = 806,
   //    PpTenFurlongPaceRating3 = 807,
   //    PpTenFurlongPaceRating4 = 808,
   //    PpTenFurlongPaceRating5 = 809,
   //    PpTenFurlongPaceRating6 = 810,
   //    PpTenFurlongPaceRating7 = 811,
   //    PpTenFurlongPaceRating8 = 812,
   //    PpTenFurlongPaceRating9 = 813,
   //    PpTenFurlongPaceRating10 = 814,
   //    PpLatePaceRating1 = 815,
   //    PpLatePaceRating2 = 816,
   //    PpLatePaceRating3 = 817,
   //    PpLatePaceRating4 = 818,
   //    PpLatePaceRating5 = 819,
   //    PpLatePaceRating6 = 820,
   //    PpLatePaceRating7 = 821,
   //    PpLatePaceRating8 = 822,
   //    PpLatePaceRating9 = 823,
   //    PpLatePaceRating10 = 824,
   //    PpRaceRating1 = 825,
   //    PpRaceRating2 = 826,
   //    PpRaceRating3 = 827,
   //    PpRaceRating4 = 828,
   //    PpRaceRating5 = 829,
   //    PpRaceRating6 = 830,
   //    PpRaceRating7 = 831,
   //    PpRaceRating8 = 832,
   //    PpRaceRating9 = 833,
   //    PpRaceRating10 = 834,
   //    PpClassRating1 = 835,
   //    PpClassRating2 = 836,
   //    PpClassRating3 = 837,
   //    PpClassRating4 = 838,
   //    PpClassRating5 = 839,
   //    PpClassRating6 = 840,
   //    PpClassRating7 = 841,
   //    PpClassRating8 = 842,
   //    PpClassRating9 = 843,
   //    PpClassRating10 = 844,
   //    PpSpeedRating1 = 845,
   //    PpSpeedRating2 = 846,
   //    PpSpeedRating3 = 847,
   //    PpSpeedRating4 = 848,
   //    PpSpeedRating5 = 849,
   //    PpSpeedRating6 = 850,
   //    PpSpeedRating7 = 851,
   //    PpSpeedRating8 = 852,
   //    PpSpeedRating9 = 853,
   //    PpSpeedRating10 = 854,
   //    PpDrfSpeedRating1 = 855,
   //    PpDrfSpeedRating2 = 856,
   //    PpDrfSpeedRating3 = 857,
   //    PpDrfSpeedRating4 = 858,
   //    PpDrfSpeedRating5 = 859,
   //    PpDrfSpeedRating6 = 860,
   //    PpDrfSpeedRating7 = 861,
   //    PpDrfSpeedRating8 = 862,
   //    PpDrfSpeedRating9 = 863,
   //    PpDrfSpeedRating10 = 864,
   //    PpDrfTrackVariant1 = 865,
   //    PpDrfTrackVariant2 = 866,
   //    PpDrfTrackVariant3 = 867,
   //    PpDrfTrackVariant4 = 868,
   //    PpDrfTrackVariant5 = 869,
   //    PpDrfTrackVariant6 = 870,
   //    PpDrfTrackVariant7 = 871,
   //    PpDrfTrackVariant8 = 872,
   //    PpDrfTrackVariant9 = 873,
   //    PpDrfTrackVariant10 = 874,
   //    PpTwoFurlongFraction1 = 875,
   //    PpTwoFurlongFraction2 = 876,
   //    PpTwoFurlongFraction3 = 877,
   //    PpTwoFurlongFraction4 = 878,
   //    PpTwoFurlongFraction5 = 879,
   //    PpTwoFurlongFraction6 = 880,
   //    PpTwoFurlongFraction7 = 881,
   //    PpTwoFurlongFraction8 = 882,
   //    PpTwoFurlongFraction9 = 883,
   //    Pp2FFraction10 = 884,
   //    PpThreeFurlongFraction1 = 885,
   //    PpThreeFurlongFraction2 = 886,
   //    Pp3FFraction3 = 887,
   //    PpThreeFurlongFraction4 = 888,
   //    PpThreeFurlongFraction5 = 889,
   //    PpThreeFurlongFraction6 = 890,
   //    PpThreeFurlongFraction7 = 891,
   //    PpThreeFurlongFraction8 = 892,
   //    PpThreeFurlongFraction9 = 893,
   //    PpThreeFurlongFraction10 = 894,
   //    PpFourFurlongFraction1 = 895,
   //    PpFourFurlongFraction2 = 896,
   //    PpFourFurlongFraction3 = 897,
   //    PpFourFurlongFraction4 = 898,
   //    PpFourFurlongFraction5 = 899,
   //    PpFourFurlongFraction6 = 900,
   //    PpFourFurlongFraction7 = 901,
   //    PpFourFurlongFraction8 = 902,
   //    PpFourFurlongFraction9 = 903,
   //    PpFourFurlongFraction10 = 904,
   //    PpFiveFurlongFraction1 = 905,
   //    PpFiveFurlongFraction2 = 906,
   //    PpFiveFurlongFraction3 = 907,
   //    PpFiveFurlongFraction4 = 908,
   //    PpFiveFurlongFraction5 = 909,
   //    PpFiveFurlongFraction6 = 910,
   //    PpFiveFurlongFraction7 = 911,
   //    PpFiveFurlongFraction8 = 912,
   //    PpFiveFurlongFraction9 = 913,
   //    PpFiveFurlongFraction10 = 914,
   //    PpSixFurlongFraction1 = 915,
   //    PpSixFurlongFraction2 = 916,
   //    PpSixFurlongFraction3 = 917,
   //    PpSixFurlongFraction4 = 918,
   //    PpSixFurlongFraction5 = 919,
   //    PpSixFurlongFraction6 = 920,
   //    PpSixFurlongFraction7 = 921,
   //    PpSixFurlongFraction8 = 922,
   //    PpSixFurlongFraction9 = 923,
   //    PpSixFurlongFraction10 = 924,
   //    PpSevenFurlongFraction1 = 925,
   //    PpSevenFurlongFraction2 = 926,
   //    PpSevenFurlongFraction3 = 927,
   //    PpSevenFurlongFraction4 = 928,
   //    PpSevenFurlongFraction5 = 929,
   //    PpSevenFurlongFraction6 = 930,
   //    PpSevenFurlongFraction7 = 931,
   //    PpSevenFurlongFraction8 = 932,
   //    PpSevenFurlongFraction9 = 933,
   //    PpSevenFurlongFraction10 = 934,
   //    PpEightFurlongFraction1 = 935,
   //    PpEightFurlongFraction2 = 936,
   //    PpEightFurlongFraction3 = 937,
   //    PpEightFurlongFraction4 = 938,
   //    PpEightFurlongFraction5 = 939,
   //    PpEightFurlongFraction6 = 940,
   //    PpEightFurlongFraction7 = 941,
   //    PpEightFurlongFraction8 = 942,
   //    PpEightFurlongFraction9 = 943,
   //    PpEightFurlongFraction10 = 944,
   //    PpTenFurlongFraction1 = 945,
   //    PpTenFurlongFraction2 = 946,
   //    PpTenFurlongFraction3 = 947,
   //    PpTenFurlongFraction4 = 948,
   //    PpTenFurlongFraction5 = 949,
   //    PpTenFurlongFraction6 = 950,
   //    PpTenFurlongFraction7 = 951,
   //    PpTenFurlongFraction8 = 952,
   //    PpTenFurlongFraction9 = 953,
   //    PpTenFurlongFraction10 = 954,
   //    PpTweleveFurlongFraction1 = 955,
   //    PpTweleveFurlongFraction2 = 956,
   //    PpTweleveFurlongFraction3 = 957,
   //    PpTweleveFurlongFraction4 = 958,
   //    PpTweleveFurlongFraction5 = 959,
   //    PpTweleveFurlongFraction6 = 960,
   //    PpTweleveFurlongFraction7 = 961,
   //    PpTweleveFurlongFraction8 = 962,
   //    PpTweleveFurlongFraction9 = 963,
   //    PpTweleveFurlongFraction10 = 964,
   //    PpFourteenFurlongFraction1 = 965,
   //    PpFourteenFurlongFraction2 = 966,
   //    PpFourteenFurlongFraction3 = 967,
   //    PpFourteenFurlongFraction4 = 968,
   //    PpFourteenFurlongFraction5 = 969,
   //    PpFourteenFurlongFraction6 = 970,
   //    PpFourteenFurlongFraction7 = 971,
   //    PpFourteenFurlongFraction8 = 972,
   //    PpFourteenFurlongFraction9 = 973,
   //    PpFourteenFurlongFraction10 = 974,
   //    PpSixteenFurlongFraction1 = 975,
   //    PpSixteenFurlongFraction2 = 976,
   //    PpSixteenFurlongFraction3 = 977,
   //    PpSixteenFurlongFraction4 = 978,
   //    PpSixteenFurlongFraction5 = 979,
   //    PpSixteenFurlongFraction6 = 980,
   //    PpSixteenFurlongFraction7 = 981,
   //    PpSixteenFurlongFraction8 = 982,
   //    PpSixteenFurlongFraction9 = 983,
   //    PpSixteenFurlongFraction10 = 984,
   //    PpFirstFraction1 = 985,
   //    PpFirstFraction2 = 986,
   //    PpFirstFraction3 = 987,
   //    PpFirstFraction4 = 988,
   //    PpFirstFraction5 = 989,
   //    PpFirstFraction6 = 990,
   //    PpFirstFraction7 = 991,
   //    PpFirstFraction8 = 992,
   //    PpFirstFraction9 = 993,
   //    PpFirstFraction10 = 994,
   //    PpSecondFraction1 = 995,
   //    PpSecondFraction2 = 996,
   //    PpSecondFraction3 = 997,
   //    PpSecondFraction4 = 998,
   //    PpSecondFraction5 = 999,
   //    PpSecondFraction6 = 1000,
   //    PpSecondFraction7 = 1001,
   //    PpSecondFraction8 = 1002,
   //    PpSecondFraction9 = 1003,
   //    PpSecondFraction10 = 1004,
   //    PpThirdFraction1 = 1005,
   //    PpThirdFraction2 = 1006,
   //    PpThirdFraction3 = 1007,
   //    PpThirdFraction4 = 1008,
   //    PpThirdFraction5 = 1009,
   //    PpThirdFraction6 = 1010,
   //    PpThirdFraction7 = 1011,
   //    PpThirdFraction8 = 1012,
   //    PpThirdFraction9 = 1013,
   //    PpThirdFraction10 = 1014,
   //    PpRunUp1 = 1015,
   //    PpRunUp2 = 1016,
   //    PpRunUp3 = 1017,
   //    PpRunUp4 = 1018,
   //    PpRunUp5 = 1019,
   //    PpRunUp6 = 1020,
   //    PpRunUp7 = 1021,
   //    PpRunUp8 = 1022,
   //    PpRunUp9 = 1023,
   //    PpRunUp10 = 1024,
   //    PpRunStyle1 = 1025,
   //    PpRunStyle2 = 1026,
   //    PpRunStyle3 = 1027,
   //    PpRunStyle4 = 1028,
   //    PpRunStyle5 = 1029,
   //    PpRunStyle6 = 1030,
   //    PpRunStyle7 = 1031,
   //    PpRunStyle8 = 1032,
   //    PpRunStyle9 = 1033,
   //    PpRunStyle10 = 1034,
   //    PpFinalTime1 = 1035,
   //    PpFinalTime2 = 1036,
   //    PpFinalTime3 = 1037,
   //    PpFinalTime4 = 1038,
   //    PpFinalTime5 = 1039,
   //    PpFinalTime6 = 1040,
   //    PpFinalTime7 = 1041,
   //    PpFinalTime8 = 1042,
   //    PpFinalTime9 = 1043,
   //    PpFinalTime10 = 1044,
   //    PpClaimedCode1 = 1045,
   //    PpClaimedCode2 = 1046,
   //    PpClaimedCode3 = 1047,
   //    PpClaimedCode4 = 1048,
   //    PpClaimedCode5 = 1049,
   //    PpClaimedCode6 = 1050,
   //    PpClaimedCode7 = 1051,
   //    PpClaimedCode8 = 1052,
   //    PpClaimedCode9 = 1053,
   //    PpClaimedCode10 = 1054,
   //    PpTrainer1 = 1055,
   //    PpTrainer2 = 1056,
   //    PpTrainer3 = 1057,
   //    PpTrainer4 = 1058,
   //    PpTrainer5 = 1059,
   //    PpTrainer6 = 1060,
   //    PpTrainer7 = 1061,
   //    PpTrainer8 = 1062,
   //    PpTrainer9 = 1063,
   //    PpTrainer10 = 1064,
   //    PpJockey1 = 1065,
   //    PpJockey2 = 1066,
   //    PpJockey3 = 1067,
   //    PpJockey4 = 1068,
   //    PpJockey5 = 1069,
   //    PpJockey6 = 1070,
   //    PpJockey7 = 1071,
   //    PpJockey8 = 1072,
   //    PpJockey9 = 1073,
   //    PpJockey10 = 1074,
   //    PpApprenticeWeigthAllowance1 = 1075,
   //    PpApprenticeWeigthAllowance2 = 1076,
   //    PpApprenticeWeigthAllowance3 = 1077,
   //    PpApprenticeWeigthAllowance4 = 1078,
   //    PpApprenticeWeigthAllowance5 = 1079,
   //    PpApprenticeWeigthAllowance6 = 1080,
   //    PpApprenticeWeigthAllowance7 = 1081,
   //    PpApprenticeWeigthAllowance8 = 1082,
   //    PpApprenticeWeigthAllowance9 = 1083,
   //    PpApprenticeWeigthAllowance10 = 1084,
   //    PpRaceType1 = 1085,
   //    PpRaceType2 = 1086,
   //    PpRaceType3 = 1087,
   //    PpRaceType4 = 1088,
   //    PpRaceType5 = 1089,
   //    PpRaceType6 = 1090,
   //    PpRaceType7 = 1091,
   //    PpRaceType8 = 1092,
   //    PpRaceType9 = 1093,
   //    PpRaceType10 = 1094,
   //    PpAgeSexRestriction1 = 1095,
   //    PpAgeSexRestriction2 = 1096,
   //    PpAgeSexRestriction3 = 1097,
   //    PpAgeSexRestriction4 = 1098,
   //    PpAgeSexRestriction5 = 1099,
   //    PpAgeSexRestriction6 = 1100,
   //    PpAgeSexRestriction7 = 1101,
   //    PpAgeSexRestriction8 = 1102,
   //    PpAgeSexRestriction9 = 1103,
   //    PpAgeSexRestriction10 = 1104,
   //    PpStateBredFlag1 = 1105,
   //    PpStateBredFlag2 = 1106,
   //    PpStateBredFlag3 = 1107,
   //    PpStateBredFlag4 = 1108,
   //    PpStateBredFlag5 = 1109,
   //    PpStateBredFlag6 = 1110,
   //    PpStateBredFlag7 = 1111,
   //    PpStateBredFlag8 = 1112,
   //    PpStateBredFlag9 = 1113,
   //    PpStateBredFlag10 = 1114,
   //    PpRestrictedQualifierFlag1 = 1115,
   //    PpRestrictedQualifierFlag2 = 1116,
   //    PpRestrictedQualifierFlag3 = 1117,
   //    PpRestrictedQualifierFlag4 = 1118,
   //    PpRestrictedQualifierFlag5 = 1119,
   //    PpRestrictedQualifierFlag6 = 1120,
   //    PpRestrictedQualifierFlag7 = 1121,
   //    PpRestrictedQualifierFlag8 = 1122,
   //    PpRestrictedQualifierFlag9 = 1123,
   //    PpRestrictedQualifierFlag10 = 1124,
   //    PpFavoriteIndicator1 = 1125,
   //    PpFavoriteIndicator2 = 1126,
   //    PpFavoriteIndicator3 = 1127,
   //    PpFavoriteIndicator4 = 1128,
   //    PpFavoriteIndicator5 = 1129,
   //    PpFavoriteIndicator6 = 1130,
   //    PpFavoriteIndicator7 = 1131,
   //    PpFavoriteIndicator8 = 1132,
   //    PpFavoriteIndicator9 = 1133,
   //    PpFavoriteIndicator10 = 1134,
   //    PpFrontBandages1 = 1135,
   //    PpFrontBandages2 = 1136,
   //    PpFrontBandages3 = 1137,
   //    PpFrontBandages4 = 1138,
   //    PpFrontBandages5 = 1139,
   //    PpFrontBandages6 = 1140,
   //    PpFrontBandages7 = 1141,
   //    PpFrontBandages8 = 1142,
   //    PpFrontBandages9 = 1143,
   //    PpFrontBandages10 = 1144,
   //    Reservesed1146 = 1145,
   //    TrainerLast365Starts = 1146,
   //    TrainerLast365Wins = 1147,
   //    TrainerLast365Places = 1148,
   //    TrainerLast365Shows = 1149,
   //    TrainerLast365Roi = 1150,
   //    TrainerLast90Starts = 1151,
   //    TrainerLast90Wins = 1152,
   //    TrainerLast90Places = 1153,
   //    TrainerLast90Shows = 1154,
   //    TrainerLast90Roi = 1155,
   //    JockeyLast365Starts = 1156,
   //    JockeyLast365Wins = 1157,
   //    JockeyLast365Places = 1158,
   //    JockeyLast365Shows = 1159,
   //    JockeyLast365Roi = 1160,
   //    JockeyLast90Starts = 1161,
   //    JockeyLast90Wins = 1162,
   //    JockeyLast90Places = 1163,
   //    JockeyLast90Shows = 1164,
   //    JockeyLast90Roi = 1165,
   //    PpSpeedParForClass1 = 1166,
   //    PpSpeedParForClass2 = 1167,
   //    PpSpeedParForClass3 = 1168,
   //    PpSpeedParForClass4 = 1169,
   //    PpSpeedParForClass5 = 1170,
   //    PpSpeedParForClass6 = 1171,
   //    PpSpeedParForClass7 = 1172,
   //    PpSpeedParForClass8 = 1173,
   //    PpSpeedParForClass9 = 1174,
   //    PpSpeedParForClass10 = 1175,
   //    SireStudFee = 1176,
   //    BestSpeedFastTrack = 1177,
   //    BestSpeedTurf = 1178,
   //    BestSpeedOffTrack = 1179,
   //    BestSpeedDistance = 1180,
   //    PpBarShoe1 = 1181,
   //    PpBarShoe2 = 1182,
   //    PpBarShoe3 = 1183,
   //    PpBarShoe4 = 1184,
   //    PpBarShoe5 = 1185,
   //    PpBarShoe6 = 1186,
   //    PpBarShoe7 = 1187,
   //    PpBarShoe8 = 1188,
   //    PpBarShoe9 = 1189,
   //    PpBarShoe10 = 1190,
   //    PpCompanyLineCode1 = 1191,
   //    PpCompanyLineCode2 = 1192,
   //    PpCompanyLineCode3 = 1193,
   //    PpCompanyLineCode4 = 1194,
   //    PpCompanyLineCode5 = 1195,
   //    PpCompanyLineCode6 = 1196,
   //    PpCompanyLineCode7 = 1197,
   //    PpCompanyLineCode8 = 1198,
   //    PpCompanyLineCode9 = 1199,
   //    PpCompanyLineCode10 = 1200,
   //    PpLowClaimingPriceOfRace1 = 1201,
   //    PpLowClaimingPriceOfRace2 = 1202,
   //    PpLowClaimingPriceOfRace3 = 1203,
   //    PpLowClaimingPriceOfRace4 = 1204,
   //    PpLowClaimingPriceOfRace5 = 1205,
   //    PpLowClaimingPriceOfRace6 = 1206,
   //    PpLowClaimingPriceOfRace7 = 1207,
   //    PpLowClaimingPriceOfRace8 = 1208,
   //    PpLowClaimingPriceOfRace9 = 1209,
   //    PpLowClaimingPriceOfRace10 = 1210,
   //    PpHighClaimingPriceOfRace1 = 1211,
   //    PpHighClaimingPriceOfRace2 = 1212,
   //    PpHighClaimingPriceOfRace3 = 1213,
   //    PpHighClaimingPriceOfRace4 = 1214,
   //    PpHighClaimingPriceOfRace5 = 1215,
   //    PpHighClaimingPriceOfRace6 = 1216,
   //    PpHighClaimingPriceOfRace7 = 1217,
   //    PpHighClaimingPriceOfRace8 = 1218,
   //    PpHighClaimingPriceOfRace9 = 1219,
   //    PpHighClaimingPriceOfRace10 = 1220,
   //    AuctionPrice = 1221,
   //    WhenWhereAuction = 1222,
   //    PpBreedTypeOfRace1 = 1223,
   //    PpBreedTypeOfRace2 = 1224,
   //    PpBreedTypeOfRace3 = 1225,
   //    PpBreedTypeOfRace4 = 1226,
   //    PpBreedTypeOfRace5 = 1227,
   //    PpBreedTypeOfRace6 = 1228,
   //    PpBreedTypeOfRace7 = 1229,
   //    PpBreedTypeOfRace8 = 1230,
   //    PpBreedTypeOfRace9 = 1231,
   //    PpBreedTypeOfRace10 = 1232,
   //    CramerF2E21 = 1233,
   //    CramerF2E22 = 1234,
   //    CramerF2E23 = 1235,
   //    CramerF2E24 = 1236,
   //    CramerF2E25 = 1237,
   //    CramerF2E26 = 1238,
   //    CramerF2E27 = 1239,
   //    CramerF2E28 = 1240,
   //    CramerF2E29 = 1241,
   //    CramerF2E210 = 1242,
   //    CramerF3Late1 = 1243,
   //    CramerF3Late2 = 1244,
   //    CramerF3Late3 = 1245,
   //    CramerF3Late4 = 1246,
   //    CramerF3Late5 = 1247,
   //    CramerF3Late6 = 1248,
   //    CramerF3Late7 = 1249,
   //    CramerF3Late8 = 1250,
   //    CramerF3Late9 = 1251,
   //    CramerF3Late10 = 1252,
   //    PpPriorCode1 = 1253,
   //    PpPriorCode2 = 1254,
   //    PpPriorCode3 = 1255,
   //    PpPriorCode4 = 1256,
   //    PpPriorCode5 = 1257,
   //    PpPriorCode6 = 1258,
   //    PpPriorCode7 = 1259,
   //    PpPriorCode8 = 1260,
   //    PpPriorCode9 = 1261,
   //    PpPriorCode10 = 1262,
   //    DirtPedigreeRating = 1263,
   //    MudPedigreeRating = 1264,
   //    TurfPedigreeRating = 1265,
   //    DistancePedigreeRating = 1266,
   //    CramerSpdRating1 = 1267,
   //    CramerSpdRating2 = 1268,
   //    CramerSpdRating3 = 1269,
   //    CramerSpdRating4 = 1270,
   //    CramerSpdRating5 = 1271,
   //    CramerSpdRating6 = 1272,
   //    CramerSpdRating7 = 1273,
   //    CramerSpdRating8 = 1274,
   //    CramerSpdRating9 = 1275,
   //    CramerSpdRating10 = 1276,
   //    Reserved1278 = 1277,
   //    Reserved1279 = 1278,
   //    Reserved1280 = 1279,
   //    Reserved1281 = 1280,
   //    Reserved1282 = 1281,
   //    Reserved1283 = 1282,
   //    Reserved1284 = 1283,
   //    Reserved1285 = 1284,
   //    Reserved1286 = 1285,
   //    Reserved1287 = 1286,
   //    Reserved1288 = 1287,
   //    Reserved1289 = 1288,
   //    Reserved1290 = 1289,
   //    Reserved1291 = 1290,
   //    Reserved1292 = 1291,
   //    Reserved1293 = 1292,
   //    Reserved1294 = 1293,
   //    Reserved1295 = 1294,
   //    Reserved1296 = 1295,
   //    Reserved1297 = 1296,
   //    Reserved1298 = 1297,
   //    Reserved1299 = 1298,
   //    Reserved1300 = 1299,
   //    Reserved1301 = 1300,
   //    Reserved1302 = 1301,
   //    Reserved1303 = 1302,
   //    Reserved1304 = 1303,
   //    Reserved1305 = 1304,
   //    Reserved1306 = 1305,
   //    Reserved1307 = 1306,
   //    Reserved1308 = 1307,
   //    Reserved1309 = 1308,
   //    Reserved1310 = 1309,
   //    Reserved1311 = 1310,
   //    Reserved1312 = 1311,
   //    Reserved1313 = 1312,
   //    Reserved1314 = 1313,
   //    Reserved1315 = 1314,
   //    Reserved1316 = 1315,
   //    Reserved1317 = 1316,
   //    Reserved1318 = 1317,
   //    Reserved1319 = 1318,
   //    Reserved1320 = 1319,
   //    Reserved1321 = 1320,
   //    Reserved1322 = 1321,
   //    Reserved1323 = 1322,
   //    Reserved1324 = 1323,
   //    Reserved1325 = 1324,
   //    Reserved1326 = 1325,
   //    Reserved1327 = 1326,
   //    BestSpeedLife = 1327,
   //    BestSpeedMostRecentYear = 1328,
   //    BestSpeedPastYear = 1329,
   //    BestSpeedTrack = 1330,
   //    FastDirtStarts = 1331,
   //    FastDirtWins = 1332,
   //    FastDirtPlaces = 1333,
   //    FastDirtShows = 1334,
   //    FastDirtEarnings = 1335,
   //    KeyTrainerStatCategory1 = 1336,
   //    KeyTrainerStatStarts1 = 1337,
   //    KeyTrainerStatWinPct1 = 1338,
   //    KeyTrainerStatItm1 = 1339,
   //    KeyTrainerStatRoi1 = 1340,
   //    KeyTrainerStatCategory2 = 1341,
   //    KeyTrainerStatStarts2 = 1342,
   //    KeyTrainerStatWinPct2 = 1343,
   //    KeyTrainerStatItm2 = 1344,
   //    KeyTrainerStatRoi2 = 1345,
   //    KeyTrainerStatCategory3 = 1346,
   //    KeyTrainerStatStarts3 = 1347,
   //    KeyTrainerStatWinPct3 = 1348,
   //    KeyTrainerStatItm3 = 1349,
   //    KeyTrainerStatRoi3 = 1350,
   //    KeyTrainerStatCategory4 = 1351,
   //    KeyTrainerStatStarts4 = 1352,
   //    KeyTrainerStatWinPct4 = 1353,
   //    KeyTrainerStatItm4 = 1354,
   //    KeyTrainerStatRoi4 = 1355,
   //    KeyTrainerStatCategory5 = 1356,
   //    KeyTrainerStatStarts5 = 1357,
   //    KeyTrainerStatWinPct5 = 1358,
   //    KeyTrainerStatItm5 = 1359,
   //    KeyTrainerStatRoi5 = 1360,
   //    KeyTrainerStatCategory6 = 1361,
   //    KeyTrainerStatStarts6 = 1362,
   //    KeyTrainerStatWinPct6 = 1363,
   //    KeyTrainerStatItm6 = 1364,
   //    KeyTrainerStatRoi6 = 1365,
   //    JockeyDistanceOnTurfLabel = 1366,
   //    JockeyDistanceOnTurfStarts = 1367,
   //    JockeyDistanceOnTurfWins = 1368,
   //    JockeyDistanceOnTurfPlaces = 1369,
   //    JockeyDistanceOnTurfShows = 1370,
   //    JockeyDistanceOnTurfRoi = 1371,
   //    JockeyDistanceOnTurfEarnings = 1372,
   //    PostTimes = 1373,
   //    Reserved1375 = 1374,
   //    Reserved1376 = 1375,
   //    Reserved1377 = 1376,
   //    Reserved1378 = 1377,
   //    Reserved1379 = 1378,
   //    Reserved1380 = 1379,
   //    Reserved1381 = 1380,
   //    Reserved1382 = 1381,
   //    Reserved1383 = 1382,
   //    Reserved1384 = 1383,
   //    PpExtendedStartComment1 = 1382,
   //    PpExtendedStartComment2 = 1383,
   //    PpExtendedStartComment3 = 1384,
   //    PpExtendedStartComment4 = 1385,
   //    PpExtendedStartComment5 = 1386,
   //    PpExtendedStartComment6 = 1387,
   //    PpExtendedStartComment7 = 1388,
   //    PpExtendedStartComment8 = 1389,
   //    PpExtendedStartComment9 = 1390,
   //    PpExtendedStartComment10 = 1391,
   //    PpSealed1 = 1392,
   //    PpSealed2 = 1393,
   //    PpSealed3 = 1394,
   //    PpSealed4 = 1395,
   //    PpSealed5 = 1396,
   //    PpSealed6 = 1397,
   //    PpSealed7 = 1398,
   //    PpSealed8 = 1399,
   //    PpSealed9 = 1400,
   //    PpSealed10 = 1401,
   //    PpAllSurface1 = 1402,
   //    PpAllSurface2 = 1403,
   //    PpAllSurface3 = 1404,
   //    PpAllSurface4 = 1405,
   //    PpAllSurface5 = 1406,
   //    PpAllSurface6 = 1407,
   //    PpAllSurface7 = 1408,
   //    PpAllSurface8 = 1409,
   //    PpAllSurface9 = 1410,
   //    PpAllSurface10 = 1411,
   //    Reserved1413 = 1412,
   //    Reserved1414 = 1413,
   //    Reserved1415 = 1414,
   //    Reserved1416 = 1415,
   //    Reserved1417 = 1416,
   //    MilitaryPostTime = 1417,
   //    Reserved1419 = 1418,
   //    Reserved1420 = 1419,
   //    Reserved1421 = 1420,
   //    Reserved1422 = 1421,
   //    Reserved1423 = 1422,
   //    Reserved1424 = 1423,
   //    Reserved1425 = 1424,
   //    Reserved1426 = 1425,
   //    Reserved1427 = 1426,
   //    Reserved1428 = 1427,
   //    Reserved1430 = 1429,
   //    Reserved1431 = 1430,
   //    Reserved1432 = 1431,
   //    Reserved1433 = 1432,
   //    Reserved1434 = 1433,
   //    Reserved1435 = 1434,
   //  }
   //}
      //    1
   strack: string;
   //    2
   sraceDate: string;
   //    3
   sraceNum: string;
   //    4
   spostPosition: string;
   //    5
   sentry: string;
   //    6
   sdistanceYards: string;
   //    7
   ssurface: string;
   //    8
   //sreserved1: string;
   //    9
   sraceType: string;
   //   10
   sageSexRestriction: string;
   //   11
   stdyRaceClassification: string;
   //   12
   spurse: string;
   //   13
   sclaimingPrice: string;
   //   14
   shorseClaimingPrice: string;
   //   15
   strackRecord: string;
   //   16
   sraceConditions: string;
   //   17
   stdyLasixList: string;
   //   18
   stdyButeList: string;
   //   19
   stdyCoupledList: string;
   //   20
   stdyMutelList: string;
   //   21
   ssimHostTrackCode: string;
   //   22
   ssimHostTrackRaceNum: string;
   //   23
   sbreedType: string;
   //   24
   stdyNasalStripChange: string;
   //   25
   sallSurface: string;
   //   26
   sTodaysAllWeather: string;
   //   27
   //sreserved4: string;
   //   28
   stdyTrainer: string;
   //   29
   strainerStats: string;
   //   30
   strainerWins: string;
   //   31
   strainerPlaces: string;
   //   32
   strainerShows: string;
   //   33
   stdyJockey: string;
   //   34
   sapprenticeWgtallow: string;
   //   35
   sjockeySts: string;
   //   36
   sjockeyWins: string;
   //   37
   sjockeyPlaces: string;
   //   38
   sjockeyShows: string;
   //   39
   stdyOwner: string;
   //   40
   sownerSilks: string;
   //   41
   sMTO_AE: string;
   //   42
   //sreserved5: string;
   //   43
   sprogramNumber: string;
   //   44
   smorningLine: string;
   //   45
   shorseName: string;
   //   46
   syearOfBirth: string;
   //   47
   sfoalingMonth: string;
   //   48
   //sreserved6: string;
   //   49
   ssex: string;
   //   50
   shorseColor: string;
   //   51
   sweight: string;
   //   52
   ssire: string;
   //   53
   ssireSire: string;
   //   54
   sdam: string;
   //   55
   sdamsSire: string;
   //   56
   sbreeder: string;
   //   57
   sbredState: string;
   //   58
   sprogramPostPosition: string;
   //   59
   //sreserved7: string;
   //   60
   //sreserved8: string;
   //   61
   //sreserved9: string;
   //   62
   stodaysMeds1: string;
   //   63
   stodaysMeds2: string;
   //   64
   sequipmentChange: string;
   //   65
   sdistStarts: string;
   //   66
   sdistWins: string;
   //   67
   sdistPlaces: string;
   //   68
   sdistShows: string;
   //   69
   sdistEarnings: string;
   //   70
   strackStarts: string;
   //   71
   strackWins: string;
   //   72
   strackPlaces: string;
   //   73
   strackShows: string;
   //   74
   strackEarnings: string;
   //   75
   sturfStarts: string;
   //   76
   sturfWins: string;
   //   77
   sturfPlaces: string;
   //   78
   sturfShows: string;
   //   79
   sturfEarnings: string;
   //   80
   swetStarts: string;
   //   81
   swetWins: string;
   //   82
   swetPlaces: string;
   //   83
   swetShows: string;
   //   84
   swetEarnings: string;
   //   85
   scurYear: string;
   //   86
   scurStarts: string;
   //   87
   scurWins: string;
   //   88
   scurPlaces: string;
   //   89
   scurShows: string;
   //   90
   scurEarnings: string;
   //   91
   sprevYear: string;
   //   92
   sprevStarts: string;
   //   93
   sprevWins: string;
   //   94
   sprevPlaces: string;
   //   95
   sprevShows: string;
   //   96
   sprevEarnings: string;
   //   97
   slifeStarts: string;
   //   98
   slifeWins: string;
   //   99
   slifePlaces: string;
   //  100
   slifeShows: string;
   //  101
   slifeEarnings: string;
   //102
   sdateWorkout: array[1..12] of string;
   //114
   stimeWorkout: array[1..12] of string;
   //126
   strackWorkout: array[1..12] of string;
   //138
   sdistanceWorkout: array[1..12] of string;
   //150
   sconditionWorkout: array[1..12] of string;
   //162
   sdescribeWorkout: array[1..12] of string;
   //174
   sinnerIndicateWorkout: array[1..12] of string;
   //186
   snumWorksWorkout: array[1..12] of string;
   //198
   srankWorkout: array[1..12] of string;
   //  210
   HdwRunStyle: string;
   //  211
   sQuirin: string;
   //  212

   HdwNumericRunStyle: string; //= 211,


   //  213
   HdwAltSpeedPoints: string; // = 212,
   //  214
   stwoFHdwPaceParForLevel: string;
   //  215
   sfourFHdwPaceParForLevel: string;
   //  216
   ssizFHdwPaceParForLevel: string;
   //  217
   sHdwSpeedParForClassLevel: string;
   //  218
   sHdwLatePaceParForLevel: string;
   //  219
   //sreserved22: string;
   //  220
   //sreserved23: string;
   //  221
   //sreserved24: string;
   //  222
   //sreserved25: string;
   //  223
   //sreserved26: string;
   //  224
   sdaysSinceLastRace: string;
   //  225 - 230
   sdrfRaceCondition: array[1..6] of string;
   //  231
   //sreserved27: string;
   //  232
   //sreserved28: string;
   //  233
   //sreserved29: string;
   //  234
   //sreserved30: string;
   //  235
   //sreserved31: string;
   //  236
   //sreserved236: string;
   //  237
   //sreserved33: string;
   //  238
   //sreserved34: string;
   //  239
   //sreserved35: string;
   //  240-248
   swagerTypes: array[1..9] of string;
   //  249
   sEquibaseRaceDesc: string;
   //  250
   //sreserved37: string;
   //  251
   sHdwPrimePowerRating: string;
   //  252
   //sreserved38: string;
   //  253
   //sreserved39: string;
   //  254
   //sreserved40: string;
   //  255
   //sreserved42: string;
   // 256- 265
   sppRaceDate: array[1..12] of string;
   // 266- 274
   sppDaysPrev: array[1..12] of string;
   // 276- 285
   sppTrackCode: array[1..12] of string;
   // 286- 295
   sppHdwTrackCode: array[1..12] of string;
   // 296- 305
   sppRaceNum: array[1..12] of string;
   // 306- 315
   sppTrackCond: array[1..12] of string;
   // 316- 325
   sppDistanceYards: array[1..12] of string;
   // 326- 335
   sppSurface: array[1..12] of string;
   // 336- 345
   sppSpecialChute: array[1..12] of string;
   // 346- 355
   sppNumEntrants: array[1..12] of string;
   // 356- 365
   sppPostPosition: array[1..12] of string;
   // 366- 375
   sppEquipment: array[1..12] of string;
   // 386- 395
   sppMeds: array[1..12] of string;
   // 396- 405
   sppTripComment: array[1..12] of string;
   // 406- 415
   sppWinnersName: array[1..12] of string;
   // 416- 425
   spp2ndPlaceName: array[1..12] of string;
   // 426- 435
   spp3rdPlaceName: array[1..12] of string;
   // 436- 445
   sppWinnersWeight: array[1..12] of string;
   // 446- 455
   spp2ndPlaceWeight: array[1..12] of string;
   // 456- 465
   spp3rdPlaceWeight: array[1..12] of string;
   // 466- 475
   sppWinnersMargin: array[1..12] of string;
   // 476- 485
   spp2ndPlaceMargin: array[1..12] of string;
   // 486- 495
   spp3rdPlaceMargin: array[1..12] of string;
   // 496- 505
   sppExtraComment: array[1..12] of string;
   // 506- 515
   sppWeight: array[1..12] of string;
   // 516- 525
   sppOdds: array[1..12] of string;
   // 526- 535
   sppEntry: array[1..12] of string;
   // 536- 545
   sppRaceClassification: array[1..12] of string;
   // 546- 555
   sppClaimingPriceHorse: array[1..12] of string;
   // 556- 565
   sppPurse: array[1..12] of string;
   // 566- 575
   sppStartingCallPos: array[1..12] of string;
   // 576- 585
   sppFirstCallPos: array[1..12] of string;
   // 586- 595
   sppSecondCallPos: array[1..12] of string;
   // 596- 605
   sppGateCallPos: array[1..12] of string;
   // 606- 615
   sppStretchPos: array[1..12] of string;
   // 616- 625
   sppFinishPos: array[1..12] of string;
   // 626- 635
   sppMoneyPos: array[1..12] of string;
   // 636- 645
   sppStartCallBeatenMargin: array[1..12] of string;
   // 646- 655
   sppStartCallBeaten: array[1..12] of string;
   // 656- 665
   sppFirstCallBeatenMargin: array[1..12] of string;
   // 666- 675
   sppFirstCallBeaten: array[1..12] of string;
   // 676- 685
   sppSecondCallBeatenMargin: array[1..12] of string;
   // 686- 695
   sppSecondCallBeaten: array[1..12] of string;
   // 696- 705
   sppRaceShape2ndCall: array[1..12] of string;
   // 716- 725
   sppStretchBeatenMargin: array[1..12] of string;
   // 726- 735
   sppStretchBeaten: array[1..12] of string;
   // 736- 745
   sppFinishBeatenMargin: array[1..12] of string;
   // 746- 755
   sppFinishBeaten: array[1..12] of string;
   // 756- 765
   sppRaceShapeFirstCall: array[1..12] of string;
   // 766- 775
   sppHdw2fPaceRating: array[1..12] of string;
   // 776- 785
   sppHdw4fPaceRating: array[1..12] of string;
   // 786- 795
   sppHdw6fPaceRating: array[1..12] of string;
   // 796- 805
   sppHdw8fPaceRating: array[1..12] of string;
   // 806- 815
   sppHdw10fPaceRating: array[1..12] of string;
   // 816- 825
   sppHdwLatePaceRating: array[1..12] of string;

   // 826- 825
   RaceRating: array[1..10] of string;

  // 826- 825
   ClassRating: array[1..10] of string;

   // 846- 855
   sppHdwSpeedRating: array[1..12] of string;
   // 856- 855
   sppDRFSpeedRating: array[1..12] of string;
   // 866- 855
   sppDRFTrackVariant: array[1..12] of string;
   // 876- 885
   spp2fFraction: array[1..12] of string;
   // 886- 895
   spp3fFraction: array[1..12] of string;
   // 896- 905
   spp4fFraction: array[1..12] of string;
   // 906- 915
   spp5fFraction: array[1..12] of string;
   // 916- 925
   spp6fFraction: array[1..12] of string;
   // 926- 935
   spp7fFraction: array[1..12] of string;
   // 936- 945
   spp8fFraction: array[1..12] of string;
   // 946- 955
   spp10fFraction: array[1..12] of string;
   // 956- 965
   spp12fFraction: array[1..12] of string;
   // 966- 975
   spp14fFraction: array[1..12] of string;
   // 976- 985
   spp16fFraction: array[1..12] of string;
   // 986- 995
   sppFirstFraction: array[1..12] of string;
   // 996-1005
   sppSecondFraction: array[1..12] of string;
   //1006-1015
   sppThirdFraction: array[1..12] of string;
   //1036-1045
   sppFinalTime: array[1..12] of string;
   //1046-1055
   sppClaimedCode: array[1..12] of string;
   //1056-1065
   sppTrainer: array[1..12] of string;
   //1066-1075
   sppJockey: array[1..12] of string;
   //1076-1085
   sppApprenticeWgtAllow: array[1..12] of string;
   //1086-1095
   sppRaceType: array[1..12] of string;
   //1096-1105
   sppAgeSexRestrict: array[1..12] of string;
   //1106-1115
   sppStateBredFlag: array[1..12] of string;
   //1116-1125
   sppRestrictedQualifierFlag: array[1..12] of string;
   //1126-1135
   sppFavoriteIndicator: array[1..12] of string;
   //1136-1145
   sppFrontBandages: array[1..12] of string;
   // 1146
   sHdwAvgClass: string;
   // 1147
   strainerCurStarts: string;
   // 1148
   strainerCurWins: string;
   // 1149
   strainerCurPlaces: string;
   // 1150
   sTrainerCurShows: string;
   // 1151
   strainerCurROI: string;
   // 1152
   strainerPrevStarts: string;
   // 1153
   strainerPrevWins: string;
   // 1154
   strainerPrevPlaces: string;
   // 1155
   sTrainerPrevShows: string;
   // 1156
   strainerPrevROI: string;
   // 1157
   sjockeyCurStarts: string;
   // 1158
   sjockeyCurWins: string;
   // 1159
   sjockeyCurPlaces: string;
   // 1160
   sjockeyCurShows: string;
   // 1161
   sjockeyCurROI: string;
   // 1162
   sjockeyPrevStarts: string;
   // 1163
   sjockeyPrevWins: string;
   // 1164
   sjockeyPrevPlaces: string;
   // 1165
   sjockeyPrevShows: string;
   // 1166
   sjockeyPrevROI: string;
   // 1167-1176
   sHdwSpeedParForClass: array[1..12] of string;
   // 1177
   ssireStudFee: string;
   // 1178
   sbestHdwFastTrack: string;
   // 1179
   sbestHdwTurf: string;
   // 1180
   sbestHdwOff: string;
   // 1181
   sbestHdwDistance: string;
   //1182-1191
   sbarShoe: array[1..12] of string;
   //1192-1201
   scompanyLineCode: array[1..12] of string;
   //1202-1211
   slowClaimingPriceOfRace: array[1..12] of string;
   //1212-1221
   shighClaimingPriceOfRace: array[1..12] of string;
   // 1222
   sauctionPrice: string;
   // 1223
   swhenWhereAuction: string;
   //    WhenWhereAuction = 1222,

    // 1224-1253

    // 1234,
   CramerF2E2: array[1..10] of string;

   //1244
   CramerF3Late: array[1..10] of string;

   //1268
   CramerSpdRating: array[1..10] of string;

   // sreserved62: string;
   // 1254-1266
   sstartCode: array[1..12] of string;
   // 1264
   sHdwDirtPedigreeRating: string;
   // 1265
   sHdwMudPedigreeRating: string;
   // 1266
   sHdwTurfPedigreeRating: string;
   // 1267
   sHdwDistPedigreeRating: string;
   // 1268-1328
   sbestHdwLife: string;
   // 1329
   sbestHdwMostRecentYear: string;
   // 1330
   sbestHdwPastYear: string;
   // 1331
   sbestHdwTrack: string;
   // 1332
   sstarts: string;
   // 1333
   swins: string;
   // 1334
   splaces: string;
   // 1335
   sshows: string;
   // 1336
   searnings: string;
   // 1337
   skeyTrainerStatCategory1: string;
   // 1338
   skeyTrainerStatStarts1: string;
   // 1339
   skeyTrainerStatWinPct1: string;
   // 1340
   skeyTrainerStatITM1: string;
   // 1341
   skeyTrainerStatROI1: string;
   // 1342
   skeyTrainerStatCategory2: string;
   // 1343
   skeyTrainerStatStarts2: string;
   // 1344
   skeyTrainerStatWinPct2: string;
   // 1345
   skeyTrainerStatITM2: string;
   // 1346
   skeyTrainerStatROI2: string;
   // 1347
   skeyTrainerStatCategory3: string;
   // 1348
   skeyTrainerStatStarts3: string;
   // 1349
   skeyTrainerStatWinPct3: string;
   // 1350
   skeyTrainerStatITM3: string;
   // 1352
   skeyTrainerStatROI3: string;
   // 1352
   skeyTrainerStatCategory4: string;
   // 1353
   skeyTrainerStatStarts4: string;
   // 1354
   skeyTrainerStatWinPct4: string;
   // 1355
   skeyTrainerStatITM4: string;
   // 1356
   skeyTrainerStatROI4: string;
   // 1357
   skeyTrainerStatCategory5: string;
   // 1358
   skeyTrainerStatStarts5: string;
   // 1359
   skeyTrainerStatWinPct5: string;
   // 1360
   skeyTrainerStatITM5: string;
   // 1362
   skeyTrainerStatROI5: string;
   // 1362
   skeyTrainerStatCategory6: string;
   // 1363
   skeyTrainerStatStarts6: string;
   // 1364
   skeyTrainerStatWinPct6: string;
   // 1365
   skeyTrainerStatITM6: string;
   // 1366
   skeyTrainerStatROI6: string;
   // 1367
   sjockeyDistanceOnTurfLabel: string;
   // 1368
   sjockeyDistanceOnTurfStarts: string;
   // 1369
   sjockeyDistanceOnTurfWins: string;
   // 1370
   sjockeyDistanceOnTurfPlaces: string;
   // 1372
   sjockeyDistanceOnTurfShows: string;
   // 1372
   sjockeyDistanceOnTurfROI: string;
   // 1373
   sjockeyDistanceOnTurfEarnings: string;
   // 1374
   spostTimes: string;
   // 1146
   sAvgClass: string;
   // 1376
   sHdwBackSpeed: string;
   //1377
   sACL: string;
   //1375
   sBackClass: string;
   //1418
   sPacificTime: string;
   //219
   sTJ365Starts: string;
   sTJ365Wins: string;
   //1378
   sTJMeetStarts: string;
   sTJMeetWins: string;


   // 1375 1392
     // 1383
   PpExtendedStartComment: array[1..12] of string;










   //sreserved1392: string;
   //1393-1402
   sPPSealed: array[1..12] of string;
   //1403-1412
   sPPAllSurface: array[1..12] of string;
   //sreserved1413: string;   //sreserved1435: string;


   sKeyName: string;
   sName: string;

   // For Last Race Desc
   sLTrackCode: string;
   sLSurf: string;
   sLPostPos: string;
   sLDistanceDesc: string;
   sLTrkCond: string;
   Present: TDateTime;
   sLRaceType: string;
   sLClmPrice: string;
   sLClaimed: string;
   sLPurse: string;
   sLRaceConditions: string;
   sLJockey: string;
   sLWeight: string;
   sLDQIndicator: string;
   sLFinishBeaten: string;
   sLFinishPos: string;
   sLOdds: string;
   sLFavoriteIndicator: string;

   sL1BL: string;
   iL1BL: integer;

   sL2BL: string;
   iL2BL: integer;


   fWins: double;
   fStarts: double;
   fWinPct: double;


   function ParseAAllNames(sName: string): string;
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


   procedure SplitName(sNameIn: string);
   var
      sPart1: string;
      sPart2: string;
      sPart3: string;
      sPart4: string;
      sPart5: string;
      sSr: string;
      sJr: string;

   begin
      try
         //| Sam B. David, Jr. |198|44|32|21|$984,012|22%|49%
         // DAVID JR SAM B
         //| Sam B. David |198|44|32|21|$984,012|22%|49%
         // DAVID SAM B
         sPart1 := '';
         sPart2 := '';
         sPart3 := '';
         sPart4 := '';
         sPart5 := '';
         sSr := '';
         sJr := '';

         sNameIn := FastReplace(sNameIn, '.', '', True);
         sNameIn := FastReplace(sNameIn, ' ', '|', True);

         Split(sNameIn, '|', lstSplit);
         if lstSplit.Count = 2 then begin
            sKeyName := StringListTrim(UpperCase(lstSplit[0])) + ' ' +
               StringListTrim(UpperCase(lstSplit[1]));
         end;

         if lstSplit.Count = 3 then begin
            sPart1 := StringListTrim(UpperCase(lstSplit[0]));
            sPart2 := StringListTrim(UpperCase(lstSplit[1]));
            sPart3 := StringListTrim(UpperCase(lstSplit[2]));
            if (Length(sPart1) = 1) then begin
               sPart1 := '';
            end;
            if (Length(sPart2) = 1) then begin
               sPart2 := '';
            end;
            if (Length(sPart3) = 1) then begin
               sPart3 := '';
            end;
            sKeyName := sPart1 + ' ' + sPart2 + ' ' + sPart3;
         end;

         if lstSplit.Count = 4 then begin
            sPart1 := StringListTrim(UpperCase(lstSplit[0]));
            sPart2 := StringListTrim(UpperCase(lstSplit[1]));
            sPart3 := StringListTrim(UpperCase(lstSplit[2]));
            sPart4 := StringListTrim(UpperCase(lstSplit[3]));
            if (Length(sPart1) = 1) then begin
               sPart1 := '';
            end;
            if (Length(sPart2) = 1) then begin
               sPart2 := '';
            end;
            if (Length(sPart3) = 1) then begin
               sPart3 := '';
            end;
            if (Length(sPart4) = 1) then begin
               sPart4 := '';
            end;

            if (sPart1 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart1 = 'SJR') then begin
               sSR := 'SR';
            end;
            if (sPart2 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart2 = 'SJR') then begin
               sSR := 'SR';
            end;
            if (sPart3 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart3 = 'SJR') then begin
               sSR := 'SR';
            end;
            if (sPart4 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart4 = 'SJR') then begin
               sSR := 'SR';
            end;

            if (sPart1 = 'JR') then begin
               sJR := '';
            end;
            if (sPart1 = 'SJR') then begin
               sSR := '';
            end;
            if (sPart2 = 'JR') then begin
               sJR := '';
            end;
            if (sPart2 = 'SJR') then begin
               sSR := '';
            end;
            if (sPart3 = 'JR') then begin
               sJR := '';
            end;
            if (sPart3 = 'SJR') then begin
               sSR := '';
            end;
            if (sPart4 = 'JR') then begin
               sJR := '';
            end;
            if (sPart4 = 'SJR') then begin
               sSR := '';
            end;
            sKeyName := sPart1 + ' ' + sPart2 + ' ' + sPart3 + ' ' + sPart4 + ' ' + sSr + sJr;

         end;
         if lstSplit.Count > 4 then begin
            sKeyName := sNameIn;
         end;

      finally
         FreeAndNil(lstSplit);
      end;
   end;

begin

   hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
   hLog.AddToLog('Process TSN MultiCaps _ ' + sFileName, msevOperation);

   try
      try
         lstMCP := TStringList.Create;
         lstMCP.LoadFromFile(sFileName);

         for iIdx := 0 to lstMCP.Count - 1 do begin

            sTmp := lstMCP[iIdx];
            sTmp := FastReplace(sTmp, '"', '', True);
            Split(sTmp, ',', lstS);

            iCnt := lstS.Count;

            strack := StringListTrim(lstS[1 - 1]);

            strack := FastReplace(strack, 'CTX', 'CT');
            strack := FastReplace(strack, 'SAX', 'SA');
            strack := FastReplace(strack, 'GPX', 'GP');
            strack := FastReplace(strack, 'APX', 'AP');
            strack := FastReplace(strack, 'FGX', 'FG');
            strack := FastReplace(strack, 'FLX', 'FL');
            strack := FastReplace(strack, 'FPX', 'FP');
            strack := FastReplace(strack, 'LAX', 'LA');
            strack := FastReplace(strack, 'LSX', 'LS');
            strack := FastReplace(strack, 'RPX', 'RP');
            strack := FastReplace(strack, 'TPX', 'TP');
            strack := FastReplace(strack, 'CDX', 'CD');
            strack := FastReplace(strack, 'GGX', 'GG');
            strack := FastReplace(strack, 'KDX', 'KD');
            strack := FastReplace(strack, 'OPX', 'OP');
            strack := FastReplace(strack, 'WOX', 'WO');
            strack := FastReplace(strack, 'SRX', 'SR');


            sraceDate := StringListTrim(lstS[2 - 1]);
            sraceNum := StringListTrim(lstS[3 - 1]);
            spostPosition := StringListTrim(lstS[4 - 1]);
            sentry := StringListTrim(lstS[5 - 1]);
            sdistanceYards := StringListTrim(lstS[6 - 1]);
            ssurface := StringListTrim(lstS[7 - 1]);
            sraceType := StringListTrim(lstS[9 - 1]);


            sageSexRestriction := StringListTrim(lstS[10 - 1]);
            stdyRaceClassification := StringListTrim(lstS[11 - 1]);
            spurse := StringListTrim(lstS[12 - 1]);
            sclaimingPrice := StringListTrim(lstS[13 - 1]);
            shorseClaimingPrice := StringListTrim(lstS[14 - 1]);
            strackRecord := StringListTrim(lstS[15 - 1]);
            sraceConditions := StringListTrim(lstS[16 - 1]);
            stdyLasixList := StringListTrim(lstS[17 - 1]);
            stdyButeList := StringListTrim(lstS[18 - 1]);
            stdyCoupledList := StringListTrim(lstS[19 - 1]);
            stdyMutelList := StringListTrim(lstS[20 - 1]);
            ssimHostTrackCode := StringListTrim(lstS[21 - 1]);
            ssimHostTrackRaceNum := StringListTrim(lstS[22 - 1]);
            sbreedType := StringListTrim(lstS[23 - 1]);
            stdyNasalStripChange := StringListTrim(lstS[24 - 1]);
            sAllSurface := StringListTrim(lstS[25 - 1]);
            sTodaysAllWeather := StringListTrim(lstS[26 - 1]);
            //sreserved4 := StringListTrim(lstS[27 - 1]);
            stdyTrainer := StringListTrim(lstS[28 - 1]);
            strainerStats := StringListTrim(lstS[29 - 1]);
            strainerWins := StringListTrim(lstS[30 - 1]);
            strainerPlaces := StringListTrim(lstS[31 - 1]);
            strainerShows := StringListTrim(lstS[32 - 1]);
            stdyJockey := StringListTrim(lstS[33 - 1]);
            sapprenticeWgtallow := StringListTrim(lstS[34 - 1]);
            sjockeySts := StringListTrim(lstS[35 - 1]);
            sjockeyWins := StringListTrim(lstS[36 - 1]);
            sjockeyPlaces := StringListTrim(lstS[37 - 1]);
            sjockeyShows := StringListTrim(lstS[38 - 1]);
            stdyOwner := StringListTrim(lstS[39 - 1]);
            sownerSilks := StringListTrim(lstS[40 - 1]);
            sMTO_AE := StringListTrim(lstS[41 - 1]);
            //sreserved5 := StringListTrim(lstS[42 - 1]);
            sprogramNumber := StringListTrim(lstS[43 - 1]);
            smorningLine := StringListTrim(lstS[44 - 1]);
            shorseName := StringListTrim(lstS[45 - 1]);
            syearOfBirth := StringListTrim(lstS[46 - 1]);
            sfoalingMonth := StringListTrim(lstS[47 - 1]);
            //sreserved6 := StringListTrim(lstS[48 - 1]);
            ssex := StringListTrim(lstS[49 - 1]);
            shorseColor := StringListTrim(lstS[50 - 1]);
            sweight := StringListTrim(lstS[51 - 1]);
            ssire := StringListTrim(lstS[52 - 1]);
            ssireSire := StringListTrim(lstS[53 - 1]);
            sdam := StringListTrim(lstS[54 - 1]);
            sdamsSire := StringListTrim(lstS[55 - 1]);
            sbreeder := StringListTrim(lstS[56 - 1]);
            sbredState := StringListTrim(lstS[57 - 1]);
            sprogramPostPosition := StringListTrim(lstS[58 - 1]);
            //sreserved7 := StringListTrim(lstS[59 - 1]);
            //sreserved8 := StringListTrim(lstS[60 - 1]);
            //sreserved9 := StringListTrim(lstS[61 - 1]);
            stodaysMeds1 := StringListTrim(lstS[62 - 1]);
            stodaysMeds2 := StringListTrim(lstS[63 - 1]);
            sequipmentChange := StringListTrim(lstS[64 - 1]);
            sdistStarts := StringListTrim(lstS[65 - 1]);
            sdistWins := StringListTrim(lstS[66 - 1]);
            sdistPlaces := StringListTrim(lstS[67 - 1]);
            sdistShows := StringListTrim(lstS[68 - 1]);
            sdistEarnings := StringListTrim(lstS[69 - 1]);
            strackStarts := StringListTrim(lstS[70 - 1]);
            strackWins := StringListTrim(lstS[71 - 1]);
            strackPlaces := StringListTrim(lstS[72 - 1]);
            strackShows := StringListTrim(lstS[73 - 1]);
            strackEarnings := StringListTrim(lstS[74 - 1]);
            sturfStarts := StringListTrim(lstS[75 - 1]);
            sturfWins := StringListTrim(lstS[76 - 1]);
            sturfPlaces := StringListTrim(lstS[77 - 1]);
            sturfShows := StringListTrim(lstS[78 - 1]);
            sturfEarnings := StringListTrim(lstS[79 - 1]);
            swetStarts := StringListTrim(lstS[80 - 1]);
            swetWins := StringListTrim(lstS[81 - 1]);
            swetPlaces := StringListTrim(lstS[82 - 1]);
            swetShows := StringListTrim(lstS[83 - 1]);
            swetEarnings := StringListTrim(lstS[84 - 1]);
            scurYear := StringListTrim(lstS[85 - 1]);
            scurStarts := StringListTrim(lstS[86 - 1]);
            scurWins := StringListTrim(lstS[87 - 1]);
            scurPlaces := StringListTrim(lstS[88 - 1]);
            scurShows := StringListTrim(lstS[89 - 1]);
            scurEarnings := StringListTrim(lstS[90 - 1]);
            sprevYear := StringListTrim(lstS[91 - 1]);
            sprevStarts := StringListTrim(lstS[92 - 1]);
            sprevWins := StringListTrim(lstS[93 - 1]);
            sprevPlaces := StringListTrim(lstS[94 - 1]);
            sprevShows := StringListTrim(lstS[95 - 1]);
            sprevEarnings := StringListTrim(lstS[96 - 1]);
            slifeStarts := StringListTrim(lstS[97 - 1]);
            slifeWins := StringListTrim(lstS[98 - 1]);
            slifePlaces := StringListTrim(lstS[99 - 1]);
            slifeShows := StringListTrim(lstS[100 - 1]);
            slifeEarnings := StringListTrim(lstS[101 - 1]);



            iFldStart := 102;
            for iFldIdx := 1 to 12 do begin
               sdateWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 114;
            for iFldIdx := 1 to 12 do begin
               sTimeWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               sTimeWorkout[iFldIdx] := FastReplace(sTimeWorkout[iFldIdx], '-', '', True);
               Inc(iFldStart);
            end;

            iFldStart := 126;
            for iFldIdx := 1 to 12 do begin
               strackWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               if (Length(strackWorkout[iFldIdx]) = 2) then begin
                  strackWorkout[iFldIdx] := strackWorkout[iFldIdx] + ' ';
               end;
               Inc(iFldStart);
            end;

            iFldStart := 138;
            for iFldIdx := 1 to 12 do begin
               sdistanceWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 150;
            for iFldIdx := 1 to 12 do begin
               sconditionWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 162;
            for iFldIdx := 1 to 12 do begin
               sdescribeWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               if (Length(sdescribeWorkout[iFldIdx]) = 1) then begin
                  sdescribeWorkout[iFldIdx] := sdescribeWorkout[iFldIdx] + ' ';
               end;
               Inc(iFldStart);
            end;

            iFldStart := 174;
            for iFldIdx := 1 to 12 do begin
               sinnerIndicateWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 186;
            for iFldIdx := 1 to 12 do begin
               snumWorksWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 198;
            for iFldIdx := 1 to 12 do begin
               srankWorkout[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               if (Length(srankWorkout[iFldIdx]) = 1) then begin
                  srankWorkout[iFldIdx] := ' ' + srankWorkout[iFldIdx];
               end;
               Inc(iFldStart);
            end;

            HdwRunStyle := StringListTrim(lstS[210 - 1]);

            sQuirin := StringListTrim(lstS[211 - 1]);

            HdwNumericRunStyle := StringListTrim(lstS[212 - 1]);
            HdwAltSpeedPoints  := StringListTrim(lstS[213 - 1]);

            stwoFHdwPaceParForLevel := StringListTrim(lstS[214 - 1]);
            sfourFHdwPaceParForLevel := StringListTrim(lstS[215 - 1]);
            ssizFHdwPaceParForLevel := StringListTrim(lstS[216 - 1]);
            sHdwSpeedParForClassLevel := StringListTrim(lstS[217 - 1]);
            sHdwLatePaceParForLevel := StringListTrim(lstS[218 - 1]);
            sdaysSinceLastRace := StringListTrim(lstS[224 - 1]);

            iFldStart := 225;
            for iFldIdx := 1 to 6 do begin
               sdrfRaceCondition[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 240;
            for iFldIdx := 1 to 9 do begin
               swagerTypes[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            sEquibaseRaceDesc := StringListTrim(lstS[249 - 1]);
            sHdwPrimePowerRating := StringListTrim(lstS[251 - 1]);


            iFldStart := 256;
            for iFldIdx := 1 to 10 do begin
               sppRaceDate[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 266;
            for iFldIdx := 1 to 10 do begin
               sppDaysPrev[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 276;
            for iFldIdx := 1 to 10 do begin
               sppTrackCode[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 286;
            for iFldIdx := 1 to 10 do begin
               sppHdwTrackCode[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 296;
            for iFldIdx := 1 to 10 do begin
               sppRaceNum[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 306;
            for iFldIdx := 1 to 10 do begin
               sppTrackCond[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 316;
            for iFldIdx := 1 to 10 do begin
               sppDistanceYards[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 326;
            for iFldIdx := 1 to 10 do begin
               sppSurface[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 336;
            for iFldIdx := 1 to 10 do begin
               sppSpecialChute[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 346;
            for iFldIdx := 1 to 10 do begin
               sppNumEntrants[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 356;
            for iFldIdx := 1 to 10 do begin
               sppPostPosition[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 366;
            for iFldIdx := 1 to 10 do begin
               sppEquipment[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 386;
            for iFldIdx := 1 to 10 do begin
               sppMeds[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            //Old Short Comments
            iFldStart := 396;
            for iFldIdx := 1 to 10 do begin
               sppTripComment[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            //New Extended Field Comments
            iFldStart := 1383;
            for iFldIdx := 1 to 10 do begin
               PpExtendedStartComment[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 406;
            for iFldIdx := 1 to 10 do begin
               sppWinnersName[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 416;
            for iFldIdx := 1 to 10 do begin
               spp2ndPlaceName[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 426;
            for iFldIdx := 1 to 10 do begin
               spp3rdPlaceName[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 436;
            for iFldIdx := 1 to 10 do begin
               sppWinnersWeight[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 446;
            for iFldIdx := 1 to 10 do begin
               spp2ndPlaceWeight[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 456;
            for iFldIdx := 1 to 10 do begin
               spp3rdPlaceWeight[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 466;
            for iFldIdx := 1 to 10 do begin
               sppWinnersMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 476;
            for iFldIdx := 1 to 10 do begin
               spp2ndPlaceMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 486;
            for iFldIdx := 1 to 10 do begin
               spp3rdPlaceMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 496;
            for iFldIdx := 1 to 10 do begin
               sppExtraComment[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 506;
            for iFldIdx := 1 to 10 do begin
               sppWeight[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 516;
            for iFldIdx := 1 to 10 do begin
               sppOdds[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 526;
            for iFldIdx := 1 to 10 do begin
               sppEntry[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 536;
            for iFldIdx := 1 to 10 do begin
               sppRaceClassification[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 546;
            for iFldIdx := 1 to 10 do begin
               sppClaimingPriceHorse[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 556;
            for iFldIdx := 1 to 10 do begin
               sppPurse[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 566;
            for iFldIdx := 1 to 10 do begin
               sppStartingCallPos[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 576;
            for iFldIdx := 1 to 10 do begin
               sppFirstCallPos[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 586;
            for iFldIdx := 1 to 10 do begin
               sppSecondCallPos[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 596;
            for iFldIdx := 1 to 10 do begin
               sppGateCallPos[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 606;
            for iFldIdx := 1 to 10 do begin
               sppStretchPos[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 616;
            for iFldIdx := 1 to 10 do begin
               sppFinishPos[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 626;
            for iFldIdx := 1 to 10 do begin
               sppMoneyPos[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 636;
            for iFldIdx := 1 to 10 do begin
               sppStartCallBeatenMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 646;
            for iFldIdx := 1 to 10 do begin
               sppStartCallBeaten[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 656;
            for iFldIdx := 1 to 10 do begin
               sppFirstCallBeatenMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 666;
            for iFldIdx := 1 to 10 do begin
               sppFirstCallBeaten[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 676;
            for iFldIdx := 1 to 10 do begin
               sppSecondCallBeatenMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 686;
            for iFldIdx := 1 to 10 do begin
               sppSecondCallBeaten[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 696;
            for iFldIdx := 1 to 10 do begin
               sppRaceShape2ndCall[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 716;
            for iFldIdx := 1 to 10 do begin
               sppStretchBeatenMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 726;
            for iFldIdx := 1 to 10 do begin
               sppStretchBeaten[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 736;
            for iFldIdx := 1 to 10 do begin
               sppFinishBeatenMargin[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 746;
            for iFldIdx := 1 to 10 do begin
               sppFinishBeaten[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 756;
            for iFldIdx := 1 to 10 do begin
               sppRaceShapeFirstCall[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 766;
            for iFldIdx := 1 to 10 do begin
               sppHdw2fPaceRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 776;
            for iFldIdx := 1 to 10 do begin
               sppHdw4fPaceRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 786;
            for iFldIdx := 1 to 10 do begin
               sppHdw6fPaceRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 796;
            for iFldIdx := 1 to 10 do begin
               sppHdw8fPaceRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 806;
            for iFldIdx := 1 to 10 do begin
               sppHdw10fPaceRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 816;
            for iFldIdx := 1 to 10 do begin
               sppHdwLatePaceRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 846;
            for iFldIdx := 1 to 10 do begin
               sppHdwSpeedRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 856;
            for iFldIdx := 1 to 10 do begin
               sppDRFSpeedRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 866;
            for iFldIdx := 1 to 10 do begin
               sppDRFTrackVariant[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 876;
            for iFldIdx := 1 to 10 do begin
               spp2fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 886;
            for iFldIdx := 1 to 10 do begin
               spp3fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 896;
            for iFldIdx := 1 to 10 do begin
               spp4fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 906;
            for iFldIdx := 1 to 10 do begin
               spp5fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 916;
            for iFldIdx := 1 to 10 do begin
               spp6fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 926;
            for iFldIdx := 1 to 10 do begin
               spp7fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 936;
            for iFldIdx := 1 to 10 do begin
               spp8fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 946;
            for iFldIdx := 1 to 10 do begin
               spp10fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 956;
            for iFldIdx := 1 to 10 do begin
               spp12fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 966;
            for iFldIdx := 1 to 10 do begin
               spp14fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 976;
            for iFldIdx := 1 to 10 do begin
               spp16fFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 986;
            for iFldIdx := 1 to 10 do begin
               sppFirstFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 996;
            for iFldIdx := 1 to 10 do begin
               sppSecondFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1006;
            for iFldIdx := 1 to 10 do begin
               sppThirdFraction[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1036;
            for iFldIdx := 1 to 10 do begin
               sppFinalTime[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1046;
            for iFldIdx := 1 to 10 do begin
               sppClaimedCode[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1056;
            for iFldIdx := 1 to 10 do begin
               sppTrainer[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1066;
            for iFldIdx := 1 to 10 do begin
               sppJockey[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1076;
            for iFldIdx := 1 to 10 do begin
               sppApprenticeWgtAllow[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1086;
            for iFldIdx := 1 to 10 do begin
               sppRaceType[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1096;
            for iFldIdx := 1 to 10 do begin
               sppAgeSexRestrict[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1106;
            for iFldIdx := 1 to 10 do begin
               sppStateBredFlag[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1116;
            for iFldIdx := 1 to 10 do begin
               sppRestrictedQualifierFlag[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1126;
            for iFldIdx := 1 to 10 do begin
               sppFavoriteIndicator[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               if sppFavoriteIndicator[iFldIdx] = '1' then begin
                  sppFavoriteIndicator[iFldIdx] := '*';
               end;
               Inc(iFldStart);
            end;

            iFldStart := 1136;
            for iFldIdx := 1 to 10 do begin
               sppFrontBandages[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1182;
            for iFldIdx := 1 to 10 do begin
               sbarShoe[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1192;
            for iFldIdx := 1 to 10 do begin
               scompanyLineCode[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1202;
            for iFldIdx := 1 to 10 do begin
               slowClaimingPriceOfRace[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1212;
            for iFldIdx := 1 to 10 do begin
               shighClaimingPriceOfRace[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1234;
            for iFldIdx := 1 to 10 do begin
               CramerF2E2[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;


            iFldStart := 826;
            for iFldIdx := 1 to 10 do begin
               RaceRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

               iFldStart := 836;
            for iFldIdx := 1 to 10 do begin
               ClassRating[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1244;
            for iFldIdx := 1 to 10 do begin
               CramerF3Late[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;


            iFldStart := 1268;
            for iFldIdx := 1 to 10 do begin
               CramerSpdRating [iFldIdx]:= StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1393;
            for iFldIdx := 1 to 10 do begin
               sPPSealed[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;

            iFldStart := 1403;
            for iFldIdx := 1 to 10 do begin
               sPPAllSurface[iFldIdx] := StringListTrim(lstS[iFldStart - 1]);
               Inc(iFldStart);
            end;


            strainerCurStarts := StringListTrim(lstS[1147 - 1]);
            strainerCurWins := StringListTrim(lstS[1148 - 1]);
            strainerCurPlaces := StringListTrim(lstS[1149 - 1]);
            sTrainerCurShows := StringListTrim(lstS[1150 - 1]);
            strainerCurROI := StringListTrim(lstS[1151 - 1]);

            strainerPrevStarts := StringListTrim(lstS[1152 - 1]);
            strainerPrevWins := StringListTrim(lstS[1153 - 1]);
            strainerPrevPlaces := StringListTrim(lstS[1154 - 1]);
            sTrainerPrevShows := StringListTrim(lstS[1155 - 1]);
            strainerPrevROI := StringListTrim(lstS[1156 - 1]);

            sjockeyCurStarts := StringListTrim(lstS[1157 - 1]);
            sjockeyCurWins := StringListTrim(lstS[1158 - 1]);
            sjockeyCurPlaces := StringListTrim(lstS[1159 - 1]);
            sjockeyCurShows := StringListTrim(lstS[1160 - 1]);
            sjockeyCurROI := StringListTrim(lstS[1161 - 1]);

            sjockeyPrevStarts := StringListTrim(lstS[1162 - 1]);
            sjockeyPrevWins := StringListTrim(lstS[1163 - 1]);
            sjockeyPrevPlaces := StringListTrim(lstS[1164 - 1]);
            sjockeyPrevShows := StringListTrim(lstS[1165 - 1]);
            sjockeyPrevROI := StringListTrim(lstS[1166 - 1]);

            ssireStudFee := StringListTrim(lstS[1177 - 1]);
            sbestHdwFastTrack := StringListTrim(lstS[1178 - 1]);
            sbestHdwTurf := StringListTrim(lstS[1179 - 1]);
            sbestHdwOff := StringListTrim(lstS[1180 - 1]);
            sbestHdwDistance := StringListTrim(lstS[1181 - 1]);


            sauctionPrice := StringListTrim(lstS[1222 - 1]);
            swhenWhereAuction := StringListTrim(lstS[1223 - 1]);

            sHdwDirtPedigreeRating := StringListTrim(lstS[1264 - 1]);
            sHdwMudPedigreeRating := StringListTrim(lstS[1265 - 1]);
            sHdwTurfPedigreeRating := StringListTrim(lstS[1266 - 1]);
            sHdwDistPedigreeRating := StringListTrim(lstS[1267 - 1]);

            sbestHdwLife := StringListTrim(lstS[1328 - 1]);
            sbestHdwMostRecentYear := StringListTrim(lstS[1329 - 1]);
            sbestHdwPastYear := StringListTrim(lstS[1330 - 1]);
            sbestHdwTrack := StringListTrim(lstS[1331 - 1]);

            sstarts := StringListTrim(lstS[1332 - 1]);
            swins := StringListTrim(lstS[1333 - 1]);
            splaces := StringListTrim(lstS[1334 - 1]);
            sshows := StringListTrim(lstS[1335 - 1]);
            searnings := StringListTrim(lstS[1336 - 1]);

            skeyTrainerStatCategory1 := StringListTrim(lstS[1337 - 1]);
            skeyTrainerStatStarts1 := StringListTrim(lstS[1338 - 1]);
            skeyTrainerStatWinPct1 := StringListTrim(lstS[1339 - 1]);
            skeyTrainerStatITM1 := StringListTrim(lstS[1340 - 1]);
            skeyTrainerStatROI1 := StringListTrim(lstS[1341 - 1]);

            skeyTrainerStatCategory2 := StringListTrim(lstS[1342 - 1]);
            skeyTrainerStatStarts2 := StringListTrim(lstS[1343 - 1]);
            skeyTrainerStatWinPct2 := StringListTrim(lstS[1344 - 1]);
            skeyTrainerStatITM2 := StringListTrim(lstS[1345 - 1]);
            skeyTrainerStatROI2 := StringListTrim(lstS[1346 - 1]);

            skeyTrainerStatCategory3 := StringListTrim(lstS[1347 - 1]);
            skeyTrainerStatStarts3 := StringListTrim(lstS[1348 - 1]);
            skeyTrainerStatWinPct3 := StringListTrim(lstS[1349 - 1]);
            skeyTrainerStatITM3 := StringListTrim(lstS[1350 - 1]);
            skeyTrainerStatROI3 := StringListTrim(lstS[1352 - 1]);

            skeyTrainerStatCategory4 := StringListTrim(lstS[1352 - 1]);
            skeyTrainerStatStarts4 := StringListTrim(lstS[1353 - 1]);
            skeyTrainerStatWinPct4 := StringListTrim(lstS[1354 - 1]);
            skeyTrainerStatITM4 := StringListTrim(lstS[1355 - 1]);
            skeyTrainerStatROI4 := StringListTrim(lstS[1356 - 1]);

            skeyTrainerStatCategory5 := StringListTrim(lstS[1357 - 1]);
            skeyTrainerStatStarts5 := StringListTrim(lstS[1358 - 1]);
            skeyTrainerStatWinPct5 := StringListTrim(lstS[1359 - 1]);
            skeyTrainerStatITM5 := StringListTrim(lstS[1360 - 1]);
            skeyTrainerStatROI5 := StringListTrim(lstS[1362 - 1]);

            skeyTrainerStatCategory6 := StringListTrim(lstS[1362 - 1]);
            skeyTrainerStatStarts6 := StringListTrim(lstS[1363 - 1]);
            skeyTrainerStatWinPct6 := StringListTrim(lstS[1364 - 1]);
            skeyTrainerStatITM6 := StringListTrim(lstS[1365 - 1]);
            skeyTrainerStatROI6 := StringListTrim(lstS[1366 - 1]);

            sjockeyDistanceOnTurfLabel := StringListTrim(lstS[1367 - 1]);
            sjockeyDistanceOnTurfStarts := StringListTrim(lstS[1368 - 1]);
            sjockeyDistanceOnTurfWins := StringListTrim(lstS[1369 - 1]);
            sjockeyDistanceOnTurfPlaces := StringListTrim(lstS[1370 - 1]);
            sjockeyDistanceOnTurfShows := StringListTrim(lstS[1372 - 1]);
            sjockeyDistanceOnTurfROI := StringListTrim(lstS[1372 - 1]);
            sjockeyDistanceOnTurfEarnings := StringListTrim(lstS[1373 - 1]);

            spostTimes := StringListTrim(lstS[1374 - 1]);

            //1146
            sAvgClass := ClassRating[1];

            //1376
            sHdwBackSpeed := StringListTrim(lstS[1328 - 1]);
            //1377
            sACL := StringListTrim(lstS[1377 - 1]);
            //1375
           
            sBackClass := ' '; // StringListTrim(lstS[1375 - 1]);
            //1418
            sPacificTime := StringListTrim(lstS[1418 - 1]);
            //219
            sTJ365Starts := StringListTrim(lstS[219 - 1]);
            sTJ365Wins := StringListTrim(lstS[220 - 1]);
            //1378
            sTJMeetStarts := StringListTrim(lstS[1413 - 1]);
            sTJMeetWins := StringListTrim(lstS[1414 - 1]);



            Present := Now;
            DecodeTime(Present, wHour, wMin, wSec, wMSec);


            if ((wHour >= 0) and (wHour < 12)) then begin
               if (Trim(sMTO_AE) = 'A') then begin
                  sMTO_AE := 'A';
                  //    continue;
               end;
               if (Trim(sMTO_AE) = 'M') then begin
                  sMTO_AE := 'M';
                  //    continue;
               end;
            end;
            //
            tblRH.IndexName := '';
            tblRH.SetKey();
            tblRH.FieldByName('TrkCode').AsString := sTrack;

            sYYYY := CopyStr(sraceDate, 1, 4);
            sMM := CopyStr(sraceDate, 5, 2);
            sDD := CopyStr(sraceDate, 7, 2);

            wDay := atow(sDD);
            wMonth := atow(sMM);
            wYear := atow(sYYYY);
            dtRaceDate := EncodeDate(wYear, wMonth, wDay);

            //
            tblRH.IndexName := '';
            tblRH.SetKey();
            tblRH.FieldByName('TrkCode').AsString := sTrack;
            tblRH.FieldByName('RaceDate').AsDateTime := dtRaceDate;
            tblRH.FieldByName('RaceNbr').AsInteger := atoi(sraceNum);
            //if (sTrack = 'HAW') then begin
            //   if (atoi(sRaceNum) = 7) then begin
            //      dtRaceDate := EncodeDate(wYear, wMonth, wDay);
             //  end;
            //0end;
            if not (tblRH.GotoKey()) then begin
               tblRH.Append();
               tblRH.FieldByName('TrkCode').AsString := sTrack;
               tblRH.FieldByName('RaceDate').AsDateTime := dtRaceDate;
               tblRH.FieldByName('RangeRaceDate').AsDateTime := dtRaceDate;
               tblRH.FieldByName('RaceNbr').AsInteger := atoi(sraceNum);
               tblRH.FieldByName('RaceType').AsString := GetTSNRaceClass(sRaceType);
               tblRH.FieldByName('Surface').AsString := GetTSNSurface(sSurface);
               tblRH.FieldByName('DistanceInFurlongs').AsFloat := (atof(sdistanceYards) * 3) / FEET_IN_FURLONG;

               if (tblRH.FieldByName('DistanceInFurlongs').AsFloat < 0) then begin
                  tblRH.FieldByName('DistanceInFurlongs').AsFloat := (atof(sdistanceYards) * 3) / FEET_IN_FURLONG * -1;
               end;

               if (Trim(sAllSurface) <> '') then begin
                  tblRH.FieldByName('Surface').AsString := 'A';
               end;

               if tblRH.FieldByName('Surface').AsString = 'T' then begin
                  tblRH.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
                  tblRH.FieldByName('IsTurfRace').AsBoolean := True;
               end;
               tblRH.FieldByName('BetLine').AsString := sWagerTypes[1] +
                  sWagerTypes[2] +
                  sWagerTypes[3] +
                  sWagerTypes[4] +
                  sWagerTypes[5] +
                  sWagerTypes[6] +
                  sWagerTypes[7] +
                  sWagerTypes[8] +
                  sWagerTypes[9];

               tblRH.Post();
            end;

            //
            tblHH.IndexName := '';
            tblHH.SetKey();
            tblHH.FieldByName('TrkCode').AsString := sTrack;
            tblHH.FieldByName('RaceDate').AsDateTime := dtRaceDate;
            tblHH.FieldByName('RaceNbr').AsInteger := atoi(sraceNum);
            tblHH.FieldByName('PostPos').AsInteger := atoi(sPostPosition);
            if not (tblHH.GotoKey()) then begin
               tblHH.Append();
               tblHH.FieldByName('TrkCode').AsString := sTrack;
               tblHH.FieldByName('RaceDate').AsDateTime := dtRaceDate;
               tblHH.FieldByName('RangeRaceDate').AsDateTime := dtRaceDate;
               tblHH.FieldByName('RaceNbr').AsInteger := atoi(sRaceNum);
               tblHH.FieldByName('PostPos').AsInteger := atoi(sPostPosition);
               tblHH.FieldByName('HorseName').AsString := sHorseName;
               tblHH.FieldByName('RaceType').AsString := GetTSNRaceClass(sRaceType);
               tblHH.FieldByName('Surface').AsString := GetTSNSurface(sSurface);

               tblHH.FieldByName('DistanceInFurlongs').AsFloat := (atof(sdistanceYards) * 3) / FEET_IN_FURLONG;
               if (tblHH.FieldByName('DistanceInFurlongs').AsFloat < 0) then begin
                  tblHH.FieldByName('DistanceInFurlongs').AsFloat := (atof(sdistanceYards) * 3) / FEET_IN_FURLONG * -1;
               end;

               tblHH.FieldByName('ProgramNbr').AsString := sprogramNumber;
               tblHH.FieldByName('ProgramNbrSort').AsInteger := GetProgramNbrSort(sprogramNumber);

               if (Trim(sAllSurface) <> '') then begin
                  tblHH.FieldByName('Surface').AsString := 'A';
               end;
               case atoi(sequipmentChange) of
                  1: begin
                        tblHH.FieldByName('Equip').AsString := 'ON';
                        tblHH.FieldByName('IsBlinkersOn').AsBoolean := True;
                     end;
                  2: begin
                        tblHH.FieldByName('Equip').AsString := 'OFF';
                        tblHH.FieldByName('IsBlinkersOff').AsBoolean := True;
                     end;
               end;

               tblHH.Post();
            end;

            //
            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').AsString := sTrack;
            tblR.FieldByName('RaceNbr').AsInteger := atoi(sraceNum);
            tblR.FieldByName('RaceDate').Value := dtRaceDate;
            if not (tblR.GotoKey()) then begin
               tblR.Append();

               tblR.FieldByName('TrkCode').AsString := sTrack;

               tblR.FieldByName('RaceNbr').AsInteger := atoi(sraceNum);
               tblR.FieldByName('RaceDate').Value := dtRaceDate;
               tblR.FieldByName('RangeRaceDate').Value := dtRaceDate;

               //               tblR.FieldByName('NbrOfOwnerOddsSelected').AsInteger := 0;
               //               tblR.FieldByName('IsActive').AsBoolean := False;

               tblR.FieldByName('Surface').AsString := GetTSNSurface(sSurface);
               if (Trim(sAllSurface) <> '') then begin
                  tblR.FieldByName('Surface').AsString := 'A';
               end;

               tblR.FieldByName('ActualSurface').AsString := tblR.FieldByName('Surface').AsString;

               if (tblR.FieldByName('Surface').AsString = 'T') then begin
                  tblR.FieldByName('AltSurface').AsString := 'D';
               end;
               if (tblR.FieldByName('Surface').AsString = 'D') then begin
                  tblR.FieldByName('AltSurface').AsString := 'D';
               end;
               if (tblR.FieldByName('Surface').AsString = 'A') then begin
                  tblR.FieldByName('AltSurface').AsString := 'D';
               end;

               tblR.FieldByName('DistanceInFeet').AsInteger := atoi(sdistanceYards) * 3;
               tblR.FieldByName('DistanceInYards').AsInteger := atoi(sdistanceYards);

               tblR.FieldByName('DistanceInFurlongs').AsFloat := (atof(sdistanceYards) * 3) / FEET_IN_FURLONG;
               if (tblR.FieldByName('DistanceInFurlongs').AsFloat < 0) then begin
                  tblR.FieldByName('DistanceInFurlongs').AsFloat := (atof(sdistanceYards) * 3) / FEET_IN_FURLONG * -1;
               end;

               tblR.FieldByName('DistanceDesc').AsString := GetYardDistanceDesc(atoi(sdistanceYards));

               tblR.FieldByName('RaceType').AsString := GetTSNRaceClass(sRaceType);

               if tblR.FieldByName('DistanceInFurlongs').AsFloat >= 8 then begin
                  tblR.FieldByName('IsRouteRace').Value := True;
               end;


               if tblR.FieldByName('Surface').AsString = 'T' then begin
                  tblR.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
                  tblR.FieldByName('IsTurfRace').AsBoolean := True;
               end;

               if sRaceType = 'N' then begin
                  tblR.FieldByName('RaceType').AsString := HCP_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Handicap';
               end;

               if sRaceType = 'A' then begin
                  tblR.FieldByName('RaceType').AsString := ALW_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Allowance';
               end;

               if sRaceType = 'C' then begin
                  tblR.FieldByName('RaceType').AsString := CLM_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Claiming';
                  tblR.FieldByName('IsClaimingRace').AsBoolean := True;
               end;

               if sRaceType = 'OC' then begin
                  tblR.FieldByName('RaceType').AsString := OCLM_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Optional Claiming';
                  tblR.FieldByName('IsClaimingRace').AsBoolean := True;
               end;

               if sRaceType = 'M' then begin
                  tblR.FieldByName('RaceType').AsString := MCL_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Maiden Claiming';
                  tblR.FieldByName('IsMaidenClaimingRace').AsBoolean := True;
                  tblR.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
                  tblR.FieldByName('IsClaimingRace').AsBoolean := True;
               end;

               if sRaceType = 'S' then begin
                  tblR.FieldByName('RaceType').AsString := MSW_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Maiden Special Weight';
                  tblR.FieldByName('IsMaidenSpecialRace').AsBoolean := True;
                  tblR.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
               end;


               if sRaceType = 'G1' then begin
                  tblR.FieldByName('RaceType').AsString := G1_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Grade I';
               end;

               if sRaceType = 'G2' then begin
                  tblR.FieldByName('RaceType').AsString := G2_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Grade II';
               end;

               if sRaceType = 'G3' then begin
                  tblR.FieldByName('RaceType').AsString := G3_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Grade III';
               end;

               if sRaceType = 'ST' then begin
                  tblR.FieldByName('RaceType').AsString := STK_RACE;
                  tblR.FieldByName('RaceTypeDesc').AsString := 'Stake';
               end;

               tblR.FieldByName('RaceDesc').AsString := stdyRaceClassification;
               tblR.FieldByName('RaceCondition').AsString := sraceConditions;
               tblR.FieldByName('RaceCondition1').AsString := sdrfRaceCondition[1];
               tblR.FieldByName('RaceCondition2').AsString := sdrfRaceCondition[2];
               tblR.FieldByName('RaceCondition3').AsString := sdrfRaceCondition[3];
               tblR.FieldByName('RaceCondition4').AsString := sdrfRaceCondition[4];
               tblR.FieldByName('RaceCondition5').AsString := sdrfRaceCondition[5];
               tblR.FieldByName('RaceCondition6').AsString := sdrfRaceCondition[6];

               tblR.FieldByName('RaceCondition').AsString := sdrfRaceCondition[1] +
                  sdrfRaceCondition[2] +
                  sdrfRaceCondition[3] +
                  sdrfRaceCondition[4] +
                  sdrfRaceCondition[5] +
                  sdrfRaceCondition[6];


               tblR.FieldByName('AgeSexRestriction').AsString := sageSexRestriction;
               tblR.FieldByName('Purse').AsFloat := atof(sPurse);

               tblR.FieldByName('ClaimingPrice').AsFloat := atof(sclaimingPrice);
               tblR.FieldByName('SimulcastTrkCode').AsString := ssimHostTrackCode;
               tblR.FieldByName('SimulcastRaceNbr').AsInteger := atoi(ssimHostTrackRaceNum);
               tblR.FieldByName('TypeOfRace').AsString := sbreedType;

               //             tblR.FieldByName('WagerType').AsString := sWagerTypes[1] +
             //                  sWagerTypes[2] +
             //                  sWagerTypes[3] +
             //                  sWagerTypes[4] +
             //                  sWagerTypes[5] +
             //                  sWagerTypes[6] +
             //                  sWagerTypes[7] +
             //                  sWagerTypes[8] +
             //                  sWagerTypes[9];

               tblR.FieldByName('BetLine').AsString := sWagerTypes[1] +
                  sWagerTypes[2] +
                  sWagerTypes[3] +
                  sWagerTypes[4] +
                  sWagerTypes[5] +
                  sWagerTypes[6] +
                  sWagerTypes[7] +
                  sWagerTypes[8] +
                  sWagerTypes[9];

               sWagerTmp := UpperCase(tblR.FieldByName('BetLine').AsString);
               tblR.FieldByName('IsDDRace').AsBoolean := False;
               tblR.FieldByName('DDRaceNbr').AsString := '';
               tblR.FieldByName('IsPk3Race').AsBoolean := False;
               tblR.FieldByName('Pk3RaceNbr').AsString := '';
               tblR.FieldByName('IsPk4Race').AsBoolean := False;
               tblR.FieldByName('Pk4RaceNbr').AsInteger := 0;
               tblR.FieldByName('IsPk6Race').AsBoolean := False;
               tblR.FieldByName('PK6RaceNbr').AsInteger := 0;
               tblR.FieldByName('IsTriRace').AsBoolean := False;
               tblR.FieldByName('IsSuperRace').AsBoolean := False;
               tblR.FieldByName('IsQuiRace').AsBoolean := False;
               tblR.FieldByName('IsExaRace').AsBoolean := False;
               tblR.FieldByName('NbrTriKey').AsInteger := 0;
               tblR.FieldByName('IsPk3Leg1').AsBoolean := False;
               tblR.FieldByName('IsPk4Leg1').AsBoolean := False;
               tblR.FieldByName('IsPk6Leg1').AsBoolean := False;
               tblR.FieldByName('IsPk9Leg1').AsBoolean := False;
               tblR.FieldByName('IsDDLeg1').AsBoolean := False;

               //               tblR.FieldByName('IsChalkValue').AsBoolean := False;
               //               tblR.FieldByName('IsPlayableValue').AsBoolean := False;
               //               tblR.FieldByName('IsFinalValue').AsBoolean := False;

               tblR.FieldByName('Pk3KeyType').AsInteger := 0;
               tblR.FieldByName('Pk3Selected').AsBoolean := False;

               tblR.FieldByName('TotalPk3Choices').AsInteger := 0;
               tblR.FieldByName('TotalTriChoices').AsInteger := 0;
               tblR.FieldByName('TotalSuperChoices').AsInteger := 0;
               tblR.FieldByName('TotalDDChoices').AsInteger := 0;

               tblR.FieldByName('TopLastSpeed').AsInteger := 0;
               tblR.FieldByName('TopBackSpeed').AsInteger := 0;

               tblR.FieldByName('AltWager1').AsString := '';
               tblR.FieldByName('AltWager2').AsString := '';
               tblR.FieldByName('AltWager3').AsString := '';
               tblR.FieldByName('AltWager4').AsString := '';
               tblR.FieldByName('AltWager5').AsString := '';
               tblR.FieldByName('AltWager6').AsString := '';

               tblR.FieldByName('Wager1').AsString := '';
               tblR.FieldByName('Wager2').AsString := '';
               tblR.FieldByName('Wager3').AsString := '';
               tblR.FieldByName('Wager4').AsString := '';
               tblR.FieldByName('Wager5').AsString := '';
               tblR.FieldByName('Wager6').AsString := '';

               tblR.FieldByName('WagerFinalOrder').AsString := '';
               tblR.FieldByName('WagerSheetOrder').AsString := '';
               tblR.FieldByName('TodaysWagerOrder').AsString := '';

               //               tblR.FieldByName('Chalk').AsString := '';
               //               tblR.FieldByName('Value').AsString := '';
               tblR.FieldByName('Tri').AsString := '';
               tblR.FieldByName('DD').AsString := '';
               tblR.FieldByName('Super').AsString := '';
               tblR.FieldByName('Exacta').AsString := '';
               tblR.FieldByName('Quinella').AsString := '';
               tblR.FieldByName('Pick3').AsString := '';
               tblR.FieldByName('Pick4').AsString := '';
               tblR.FieldByName('Pick6').AsString := '';
               //               tblR.FieldByName('ParTime').AsString := '';
               tblR.FieldByName('IsPrintedOnValueSheet').AsBoolean := False;
               //               tblR.FieldByName('IsLinerSheetSelected').AsBoolean := False;
               //               tblR.FieldByName('IsOverlaySheetSelected').AsBoolean := False;
               tblR.FieldByName('IsWagerSheetSelected').AsBoolean := False;
               //               tblR.FieldByName('IsTopOwnerSheetSelected').AsBoolean := False;
               //               tblR.FieldByName('IsTopOwnerOddsSheetSelected').AsBoolean := False;
               tblR.FieldByName('IsYoubetTrack').AsBoolean := False;
               tblR.FieldByName('IsPTCTrack').AsBoolean := False;
               tblR.FieldByName('IsTwinSpiresTrack').AsBoolean := False;
               //               tblR.FieldByName('RacePicks').AsString := '';
               //               tblR.FieldByName('IsRacePicksAvailable').AsBoolean := False;

               tblR.FieldByName('WPSWagerAmt').AsFloat := 0;
               tblR.FieldByName('SfcWagerAmt').AsFloat := 0;
               tblR.FieldByName('TriWagerAmt').AsFloat := 0;
               tblR.FieldByName('ExaWagerAmt').AsFloat := 0;
               tblR.FieldByName('QuiWagerAmt').AsFloat := 0;
               tblR.FieldByName('DDWagerAmt').AsFloat := 0;
               tblR.FieldByName('Pk3WagerAmt').AsFloat := 0;
               tblR.FieldByName('Pk4WagerAmt').AsFloat := 0;
               tblR.FieldByName('Pk6WagerAmt').AsFloat := 0;

               //
               tblR.FieldByName('DDRaceNbr').AsInteger := 0;
               tblR.FieldByName('Pk3RaceNbr').AsInteger := 0;
               tblR.FieldByName('Pk4RaceNbr').AsInteger := 0;
               tblR.FieldByName('Pk6RaceNbr').AsInteger := 0;

               //
               tblR.FieldByName('IsExactaMatched').AsBoolean := False;
               tblR.FieldByName('ExactaNbrs').AsString := '';
               tblR.FieldByName('ExactaWager').AsFloat := 0;
               tblR.FieldByName('ExactaPayout').AsFloat := 0;

               tblR.FieldByName('IsTrifectaMatched').AsBoolean := False;
               tblR.FieldByName('TrifectaNbrs').AsString := '';
               tblR.FieldByName('TrifectaWager').AsFloat := 0;
               tblR.FieldByName('TrifectaPayout').AsFloat := 0;

               tblR.FieldByName('IsSuperfectaMatched').AsBoolean := False;
               tblR.FieldByName('SuperfectaNbrs').AsString := '';
               tblR.FieldByName('SuperfectaWager').AsFloat := 0;
               tblR.FieldByName('SuperfectaPayout').AsFloat := 0;

               tblR.FieldByName('IsDailyDoubleMatchedFirstRace').AsBoolean := False;
               tblR.FieldByName('IsDailyDoubleMatchedLastRace').AsBoolean := False;
               tblR.FieldByName('DDFirstRace').AsString := '';
               tblR.FieldByName('DDLastRace').AsString := '';

               tblR.FieldByName('DailyDoubleNbrsFirstRace').AsString := '';
               tblR.FieldByName('DailyDoubleNbrsLastRace').AsString := '';
               tblR.FieldByName('DailyDoubleWagerFirstRace').AsFloat := 0;
               tblR.FieldByName('DailyDoubleWagerLastRace').AsFloat := 0;
               tblR.FieldByName('DailyDoublePayoutFirstRace').AsFloat := 0;
               tblR.FieldByName('DailyDoublePayoutLastRace').AsFloat := 0;

               tblR.FieldByName('IsQuinellaMatched').AsBoolean := False;
               tblR.FieldByName('QuinellaNbrs').AsString := '';
               tblR.FieldByName('QuinellaWager').AsFloat := 0;
               tblR.FieldByName('QuinellaPayout').AsFloat := 0;

               tblR.FieldByName('IsPick3MatchedFirstRace').AsBoolean := False;
               tblR.FieldByName('IsPick3MatchedLastRace').AsBoolean := False;
               tblR.FieldByName('Pick3FirstRace').AsString := '';
               tblR.FieldByName('Pick3LastRace').AsString := '';
               tblR.FieldByName('Pick3NbrsFirstRace').AsString := '';
               tblR.FieldByName('Pick3NbrsLastRace').AsString := '';
               tblR.FieldByName('Pick3WagerFirstRace').AsFloat := 0;
               tblR.FieldByName('Pick3WagerLastRace').AsFloat := 0;
               tblR.FieldByName('Pick3PayoutFirstRace').AsFloat := 0;
               tblR.FieldByName('Pick3PayoutLastRace').AsFloat := 0;
               tblR.FieldByName('Pick3NbrsLeg1').AsString := '';
               tblR.FieldByName('Pick3NbrsLeg2').AsString := '';
               tblR.FieldByName('Pick3NbrsLeg3').AsString := '';

               tblR.FieldByName('IsPick4MatchedFirstRace').AsBoolean := False;
               tblR.FieldByName('IsPick4MatchedLastRace').AsBoolean := False;
               tblR.FieldByName('Pick4FirstRace').AsString := '';
               tblR.FieldByName('Pick4LastRace').AsString := '';
               tblR.FieldByName('Pick4NbrsFirstRace').AsString := '';
               tblR.FieldByName('Pick4NbrsLastRace').AsString := '';
               tblR.FieldByName('Pick4WagerFirstRace').AsFloat := 0;
               tblR.FieldByName('Pick4WagerLastRace').AsFloat := 0;
               tblR.FieldByName('Pick4PayoutFirstRace').AsFloat := 0;
               tblR.FieldByName('Pick4PayoutLastRace').AsFloat := 0;
               tblR.FieldByName('Pick4NbrsLeg1').AsString := '';
               tblR.FieldByName('Pick4NbrsLeg2').AsString := '';
               tblR.FieldByName('Pick4NbrsLeg3').AsString := '';
               tblR.FieldByName('Pick4NbrsLeg4').AsString := '';

               tblR.FieldByName('IsPick6MatchedFirstRace').AsBoolean := False;
               tblR.FieldByName('IsPick6MatchedLastRace').AsBoolean := False;
               tblR.FieldByName('Pick6FirstRace').AsString := '';
               tblR.FieldByName('Pick6LastRace').AsString := '';
               tblR.FieldByName('Pick6NbrsFirstRace').AsString := '';
               tblR.FieldByName('Pick6NbrsLastRace').AsString := '';
               tblR.FieldByName('Pick6WagerFirstRace').AsFloat := 0;
               tblR.FieldByName('Pick6WagerLastRace').AsFloat := 0;
               tblR.FieldByName('Pick6PayoutFirstRace').AsFloat := 0;
               tblR.FieldByName('Pick6PayoutLastRace').AsFloat := 0;

               tblR.FieldByName('IsWinMatched').AsBoolean := False;
               tblR.FieldByName('WinNbrs').AsString := '';
               tblR.FieldByName('WinPayout').AsFloat := 0;
               tblR.FieldByName('WinPlcPayout').AsFloat := 0;
               tblR.FieldByName('WinShoPayout').AsFloat := 0;

               tblR.FieldByName('IsPlcMatched').AsBoolean := False;
               tblR.FieldByName('PlcNbrs').AsString := '';
               tblR.FieldByName('PlcPayout').AsFloat := 0;
               tblR.FieldByName('PlcShoPayout').AsFloat := 0;

               tblR.FieldByName('IsShoMatched').AsBoolean := False;
               tblR.FieldByName('ShoNbrs').AsString := '';
               tblR.FieldByName('ShoPayout').AsFloat := 0;

               //               tblR.FieldByName('Weather').AsString := '';
               //               tblR.FieldByName('TopLastSRWinner').AsString := '';
               tblR.FieldByName('RaceShape').AsString := '';
               tblR.FieldByName('PostTimes').AsString := '';

               tblR.FieldByName('Is10CentSuperfectaRace').AsBoolean := False;
               tblR.FieldByName('Is50CentTrifectaRace').AsBoolean := False;
               tblR.FieldByName('Is50CentPk3Race').AsBoolean := False;
               tblR.FieldByName('Is50CentPk4Race').AsBoolean := False;

               //               tblR.FieldByName('IsTSNProcessed').AsBoolean := True;
                              //   $2 DAILY DOUBLE
               if (SmartPos('DAILY DOUBLE', sWagerTmp) > 0) or (SmartPos('ROLLING DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;

               // RET
               if (SmartPos('/ DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;

               if (SmartPos('FIRST HALF LATE DOUBLE', sWagerTmp) > 0) or
                  (SmartPos('ROLLING DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;

               if (SmartPos('1ST HALF $2 DAILY DOUBLE', sWagerTmp) > 0) or
                  (SmartPos('ROLLING DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;

               if (iDDRace > 0) then begin
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 3 - iDDRace;
                  Dec(iDDRace);
               end else begin
                  tblR.FieldByName('IsDDRace').AsBoolean := False;
               end;


               //MNR
               if (SmartPos('SECOND HALF $2 LATE DAILY DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;
               if (SmartPos('SECOND HALF $2 DAILY DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               //PEN
               if (SmartPos('SECOND HALF EARLY DAILY DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               if (SmartPos('2ND HALF LATE DAILY DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;


               if (SmartPos('2ND HALF EARLY DD', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;
               if (SmartPos('2ND HALF LATE DD', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               //
               if (SmartPos('SECOND HALF DAILY DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               if (SmartPos('2ND HALF DAILY DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               //
               if (SmartPos('SECOND HALF LATE DAILY DOUBLE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsDDLeg1').AsBoolean := False;
                  tblR.FieldByName('IsDDRace').AsBoolean := True;
                  tblR.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               //
               if ((SmartPos('PICK 3', sWagerTmp) > 0) or (SmartPos('PICK THREE', sWagerTmp) > 0) or
                  (SmartPos('PIC THREE', sWagerTmp) > 0) or (SmartPos('BET 3', sWagerTmp) > 0)) then begin
                  tblR.FieldByName('IsPK3Leg1').AsBoolean := True;
                  iPk3Race := 3;
               end;
               if (iPk3Race > 0) then begin
                  tblR.FieldByName('IsPk3Race').AsBoolean := True;
                  tblR.FieldByName('Pk3RaceNbr').AsInteger := 4 - iPk3Race;
                  Dec(iPk3Race);
               end else begin
                  tblR.FieldByName('IsPk3Race').AsBoolean := False;
               end;

               if (SmartPos('1ST LEG PICK THREE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('Pk3RaceNbr').AsInteger := 1;
                  tblR.FieldByName('IsPK3Leg1').AsBoolean := True;
                  tblR.FieldByName('IsPK3Race').AsBoolean := True;
               end;

               if (SmartPos('2ND LEG PICK THREE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('Pk3RaceNbr').AsInteger := 2;
                  tblR.FieldByName('IsPK3Leg1').AsBoolean := False;
                  tblR.FieldByName('IsPK3Race').AsBoolean := True;
               end;

               if (SmartPos('3RD LEG PICK THREE', sWagerTmp) > 0) then begin
                  tblR.FieldByName('Pk3RaceNbr').AsInteger := 3;
                  tblR.FieldByName('IsPK3Leg1').AsBoolean := False;
                  tblR.FieldByName('IsPK3Race').AsBoolean := True;
               end;

               //
               if (SmartPos('PICK 4', sWagerTmp) > 0) or (SmartPos('PICK FOUR', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsPk4Leg1').AsBoolean := True;
                  iPk4Race := 4;
               end;
               if (iPk4Race > 0) then begin
                  tblR.FieldByName('IsPk4Race').AsBoolean := True;
                  tblR.FieldByName('Pk4RaceNbr').AsInteger := 5 - iPk4Race;
                  Dec(iPk4Race);
               end else begin
                  tblR.FieldByName('IsPk4Race').AsBoolean := False;
               end;

               //
               if (SmartPos('PICK 6', sWagerTmp) > 0) or (SmartPos('PICK SIX', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsPk6Leg1').AsBoolean := True;
                  iPk6Race := 6;
               end;
               if (iPk6Race > 0) then begin
                  tblR.FieldByName('IsPk6Race').AsBoolean := True;
                  tblR.FieldByName('Pk6RaceNbr').AsInteger := 7 - iPk6Race;
                  Dec(iPk6Race);
               end else begin
                  tblR.FieldByName('IsPk6Race').AsBoolean := False;
               end;

               //
               if SmartPos('SUPERFECTA', sWagerTmp) > 0 then begin
                  tblR.FieldByName('IsSuperRace').AsBoolean := True;
               end else begin
                  tblR.FieldByName('IsSuperRace').AsBoolean := False;
               end;

               //
               if ((SmartPos('TRIFECTA', sWagerTmp) > 0) or (SmartPos('TRIACTOR', sWagerTmp) > 0)) then begin
                  tblR.FieldByName('IsTriRace').AsBoolean := True;
               end else begin
                  tblR.FieldByName('IsTriRace').AsBoolean := False;
               end;

               //
               if ((SmartPos('EXACTA', sWagerTmp) > 0) or (SmartPos('EXACTOR', sWagerTmp) > 0) or
                  (SmartPos('PERFECTA', sWagerTmp) > 0)) then begin
                  tblR.FieldByName('IsExaRace').AsBoolean := True;
               end else begin
                  tblR.FieldByName('IsExaRace').AsBoolean := False;
               end;

               //
               if (SmartPos('QUINELLA', sWagerTmp) > 0) then begin
                  tblR.FieldByName('IsQuiRace').AsBoolean := True;
               end else begin
                  tblR.FieldByName('IsQuiRace').AsBoolean := False;
               end;


               tblR.FieldByName('TopEarlyPace').AsFloat := 0;
               tblR.FieldByName('TopMiddlePace').AsFloat := 0;
               tblR.FieldByName('TopLatePace').AsFloat := 0;
               tblR.FieldByName('TopEarlyPacePos').AsFloat := 0;
               tblR.FieldByName('TopMiddlePacePos').AsFloat := 0;
               tblR.FieldByName('TopLatePacePos').AsFloat := 0;

               tblR.FieldByName('SecondEarlyPace').AsFloat := 0;
               tblR.FieldByName('SecondMiddlePace').AsFloat := 0;
               tblR.FieldByName('SecondLatePace').AsFloat := 0;
               tblR.FieldByName('SecondEarlyPacePos').AsFloat := 0;
               tblR.FieldByName('SecondMiddlePacePos').AsFloat := 0;
               tblR.FieldByName('SecondLatePacePos').AsFloat := 0;

               tblR.FieldByName('MaxWPSBet').AsFloat := 0;
               tblR.FieldByName('MaxGimmickBet').AsFloat := 0;

               tblR.FieldByName('NbrStarters').AsInteger := 0;
               tblR.FieldByName('NbrDebutStarters').AsInteger := 0;
               tblR.FieldByName('NbrDebutTwoStarters').AsInteger := 0;
               tblR.FieldByName('NbrTurfDebutStarters').AsInteger := 0;
               tblR.FieldByName('NbrRouteDebutStarters').AsInteger := 0;
               tblR.FieldByName('NbrScratchedStarters').AsInteger := 0;
               tblR.FieldByName('NbrRunners').AsInteger := 0;
               //               tblR.FieldByName('IsEquibaseChartsProcessed').AsBoolean := False;
               //               tblR.FieldByName('IsDRFChartsProcessed').AsBoolean := False;

               tblR.FieldByName('OrigSurface').AsString := '';
               tblR.FieldByName('IsPk9Place').AsBoolean := False;
               tblR.FieldByName('Pk9RaceNbr').AsInteger := 0;

               //               tblR.FieldByName('IsPPValue').AsBoolean := False;
               //               tblR.FieldByName('IsMLValue').AsBoolean := False;
               //               tblR.FieldByName('FootNotes').AsString := '';
               //               tblR.FieldByName('Trainers').AsString := '';
               //               tblR.FieldByName('Owners').AsString := '';
               //               tblR.FieldByName('ScratchedHorses').AsString := '';
               //               tblR.FieldByName('FractionalTimes').AsString := '';


               tblR.FieldByName('EarlyPacePar').AsInteger := atoi(stwoFHdwPaceParForLevel);
               tblR.FieldByName('MiddlePacePar').AsInteger := atoi(sfourFHdwPaceParForLevel);
               tblR.FieldByName('LatePacePar').AsInteger := atoi(sHdwLatePaceParForLevel) + 100;
               tblR.FieldByName('SpeedPacePar').AsInteger := atoi(sHdwSpeedParForClassLevel);


               tblR.FieldByName('PacificTime').AsString := sPacificTime;
               tblR.Post();
            end;

            //
            tblE.IndexName := '';
            tblE.SetKey();
            tblE.FieldByName('TrkCode').AsString := sTrack;
            tblE.FieldByName('RaceDate').AsDateTime := dtRaceDate;
            tblE.FieldByName('RaceNbr').AsInteger := atoi(sraceNum);
            tblE.FieldByName('PostPos').AsInteger := atoi(sPostPosition);
            if not (tblE.GotoKey()) then begin

               tblE.Append();

               tblE.FieldByName('TrkCode').AsString := sTrack;
               tblE.FieldByName('RaceDate').AsDateTime := dtRaceDate;
               tblE.FieldByName('RangeRaceDate').AsDateTime := dtRaceDate;
               tblE.FieldByName('RaceNbr').AsInteger := atoi(sRaceNum);
               tblE.FieldByName('PostPos').AsInteger := atoi(sPostPosition);
               tblE.FieldByName('RaceType').AsString := GetTSNRaceClass(sRaceType);

               tblE.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;
               tblE.FieldByName('DistanceInFurlongs').AsFloat := tblR.FieldByName('DistanceInFurlongs').AsFloat;

               tblE.FieldByName('Entry').AsString := sEntry;

               tblE.FieldByName('ProgramNbr').AsString := sprogramNumber;
               tblE.FieldByName('ProgramNbrSort').AsInteger := GetProgramNbrSort(sprogramNumber);

               tblE.FieldByName('MorningLineTo1').AsFloat := atof(smorningLine);
               tblE.FieldByName('MorningLineDesc').AsString := GetMorningLineDesc(atof(smorningLine));

               tblE.FieldByName('HorseName').AsString := sHorseName;

               tblE.FieldByName('IsFirstTimeJuice').AsBoolean := False;
               tblE.FieldByName('Med').AsString := '';
               case atoi(stodaysMeds1) of
                  1: begin
                        tblE.FieldByName('Med').AsString := '(L)';
                     end;
                  2: begin
                        tblE.FieldByName('Med').AsString := '(B)';
                     end;
                  3: begin
                        tblE.FieldByName('Med').AsString := '(LB)';
                     end;
                  4: begin
                        tblE.FieldByName('Med').AsString := '(L*)';
                        tblE.FieldByName('IsFirstTimeJuice').AsBoolean := True;
                     end;
                  5: begin
                        tblE.FieldByName('Med').AsString := '(L*B)';
                     end;
               end;

               tblE.FieldByName('IsBlinkersOn').AsBoolean := False;
               tblE.FieldByName('IsBlinkersOff').AsBoolean := False;
               tblE.FieldByName('Equip').AsString := '';
               case atoi(sequipmentChange) of
                  1: begin
                        tblE.FieldByName('Equip').AsString := 'ON';
                        tblE.FieldByName('IsBlinkersOn').AsBoolean := True;
                     end;
                  2: begin
                        tblE.FieldByName('Equip').AsString := 'OFF';
                        tblE.FieldByName('IsBlinkersOff').AsBoolean := True;
                     end;
               end;

               tblE.FieldByName('IsScratched').AsBoolean := False;

               DecodeDate(dtRaceDate, wYear, wMonth, wDay);
               wYear := wYear - 2000;

               tblE.FieldByName('Age').AsInteger := wYear - atoi(sYearOfBirth);
               tblE.FieldByName('Sex').AsString := sSex;
               tblE.FieldByName('Color').AsString := sHorseColor;
               tblE.FieldByName('Weight').AsString := sWeight;
               tblE.FieldByName('IsSuperTrainer').AsBoolean := False;

               sKeyName := FastReplace(sTdyTrainer, '.', '', True);
               SplitName(sKeyName);
               tblE.FieldByName('Trainer').AsString := sKeyName;

               tblE.FieldByName('TrnWinsRank').AsInteger := 0;
               tblE.FieldByName('TrnEarningsRank').AsInteger := 0;
               tblE.FieldByName('TrnTrackRank').AsInteger := 0;

               tblE.FieldByName('IsSuperJockey').AsBoolean := False;

               sKeyName := FastReplace(sTdyJockey, '.', '', True);
               SplitName(sKeyName);
               tblE.FieldByName('Jockey').AsString := sKeyName;

               tblE.FieldByName('JkyWinsRank').AsInteger := 0;
               tblE.FieldByName('JkyEarningsRank').AsInteger := 0;
               tblE.FieldByName('JkyTrackRank').AsInteger := 0;

               tblE.FieldByName('IsSuperOwner').AsBoolean := False;


               tblE.FieldByName('Owner').AsString := stdyOwner;

               tblE.FieldByName('OwnWinsRank').AsInteger := 0;
               tblE.FieldByName('OwnEarningsRank').AsInteger := 0;
               tblE.FieldByName('Breeder').AsString := sBreeder;

               tblE.FieldByName('TotalTrnStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnWinPct').AsFloat := 0;
               tblE.FieldByName('TotalTrnWinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalTrnJkyStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnJkyWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnJkyWinPct').AsFloat := 0;
               tblE.FieldByName('TotalTrnJkyWinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalTrnOwnStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnOwnWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnOwnWinPct').AsFloat := 0;
               tblE.FieldByName('TotalTrnOwnWinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalTrn1To45Starts').AsInteger := 0;
               tblE.FieldByName('TotalTrn1To45Wins').AsInteger := 0;
               tblE.FieldByName('TotalTrn1To45WinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnWork1To45Starts').AsInteger := 0;
               tblE.FieldByName('TotalTrnWork1To45Wins').AsInteger := 0;
               tblE.FieldByName('TotalTrnWork1To45WinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrn46To120Starts').AsInteger := 0;
               tblE.FieldByName('TotalTrn46To120Wins').AsInteger := 0;
               tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnWork46To120Starts').AsInteger := 0;
               tblE.FieldByName('TotalTrnWork46To120Wins').AsInteger := 0;
               tblE.FieldByName('TotalTrnWork46To120WinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrn120PlusStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrn120PlusWins').AsInteger := 0;
               tblE.FieldByName('TotalTrn120PlusWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnWork120PlusStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnWork120PlusWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnWork120PlusWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnDebutStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnDebutWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnDebutTwoWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnFirstJuiceStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnFirstJuiceWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnFirstJuiceWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnBlinkersOnWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnBlinkersOffStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnBlinkersOffWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnTurfStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnTurfWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnTurfWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrn30Starts').AsInteger := 0;
               tblE.FieldByName('TotalTrn30Wins').AsInteger := 0;
               tblE.FieldByName('TotalTrn30WinPct').AsFloat := 0;
               tblE.FieldByName('TotalTrn30WinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnAftClmWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrnOddsStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrnOddsWins').AsInteger := 0;
               tblE.FieldByName('TotalTrnOddsWinPct').AsFloat := 0;
               tblE.FieldByName('TotalTrnOddsWinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalTrn1stStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrn1stWins').AsInteger := 0;
               tblE.FieldByName('TotalTrn1stWinPct').AsFloat := 0;

               tblE.FieldByName('TotalTrn2yoStarts').AsInteger := 0;
               tblE.FieldByName('TotalTrn2yoWins').AsInteger := 0;
               tblE.FieldByName('TotalTrn2yoWinPct').AsFloat := 0;
               tblE.FieldByName('TotalTrn2oWinPctRank').AsInteger := 0;

               tblE.FieldByName('TrnTodayStarts').AsInteger := 0;
               tblE.FieldByName('TrnTodayWins').AsInteger := 0;
               tblE.FieldByName('TrnTodayWinPct').AsFloat := 0;
               tblE.FieldByName('TrnTodayWinPctRank').AsInteger := 0;

               tblE.FieldByName('TrnDirtToTurfStarts').AsInteger := 0;
               tblE.FieldByName('TrnDirtToTurfWinPct').AsInteger := 0;

               tblE.FieldByName('TrnTurfToDirtStarts').AsInteger := 0;
               tblE.FieldByName('TrnTurfToDirtWinPct').AsInteger := 0;

               tblE.FieldByName('TrnRteToSprStarts').AsInteger := 0;
               tblE.FieldByName('TrnRteToSprWinPct').AsInteger := 0;

               tblE.FieldByName('TrnSprToRteStarts').AsInteger := 0;
               tblE.FieldByName('TrnSprToRteWinPct').AsInteger := 0;

               tblE.FieldByName('TrnStkWinPct').AsInteger := 0;
               tblE.FieldByName('TrnClmWinPct').AsInteger := 0;
               tblE.FieldByName('TrnMdnWinPct').AsInteger := 0;
               tblE.FieldByName('TrnAlwWinPct').AsInteger := 0;

               tblE.FieldByName('TotalJkyStarts').AsInteger := 0;
               tblE.FieldByName('TotalJkyWins').AsInteger := 0;
               tblE.FieldByName('TotalJkyWinPct').AsFloat := 0;
               tblE.FieldByName('TotalJkyWinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalJkyOddsStarts').AsInteger := 0;
               tblE.FieldByName('TotalJkyOddsWins').AsInteger := 0;
               tblE.FieldByName('TotalJkyOddsWinPct').AsFloat := 0;
               tblE.FieldByName('TotalJkyOddsWinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalJkyTurfStarts').AsInteger := 0;
               tblE.FieldByName('TotalJkyTurfWins').AsInteger := 0;
               tblE.FieldByName('TotalJkyTurfWinPct').AsFloat := 0;

               tblE.FieldByName('TotalJky30Starts').AsInteger := 0;
               tblE.FieldByName('TotalJky30Wins').AsInteger := 0;
               tblE.FieldByName('TotalJky30WinPct').AsFloat := 0;
               tblE.FieldByName('TotalJky30WinPctRank').AsInteger := 0;

               tblE.FieldByName('TotalJky2yoStarts').AsInteger := 0;
               tblE.FieldByName('TotalJky2yoWins').AsInteger := 0;
               tblE.FieldByName('TotalJky2yoWinPct').AsFloat := 0;

               tblE.FieldByName('TotalOwnStarts').AsInteger := 0;
               tblE.FieldByName('TotalOwnWins').AsInteger := 0;
               tblE.FieldByName('TotalOwnWinPct').AsFloat := 0;
               tblE.FieldByName('TotalOwnWinPctRank').AsInteger := 0;
               tblE.FieldByName('TotalOwnTop3WinPct').AsInteger := 0;

               tblE.FieldByName('TotalBrdStarts').AsInteger := 0;
               tblE.FieldByName('TotalBrdWins').AsInteger := 0;
               tblE.FieldByName('TotalBrdWinPct').AsFloat := 0;
               tblE.FieldByName('TotalBrdWinPctRank').AsInteger := 0;

               tblE.FieldByName('BredIn').AsString := sbredState;

               tblE.FieldByName('SireTurfLastYearRank').AsInteger := 0;
               tblE.FieldByName('SireTurfLastYearStarts').AsInteger := 0;
               tblE.FieldByName('SireTurfLastYearPctOfEarnings').AsInteger := 0;

               tblE.FieldByName('SireGeneralLastYearRank').AsInteger := 0;
               tblE.FieldByName('SireGeneralLastYearStudFee').AsFloat := 0;

               tblE.FieldByName('SireJuvenileLastYearRank').AsInteger := 0;
               tblE.FieldByName('SireJuvenileThisYearRank').AsInteger := 0;

               tblE.FieldByName('SireTurfThisYearRank').AsInteger := 0;
               tblE.FieldByName('SireTurfThisYearStarts').AsInteger := 0;
               tblE.FieldByName('SireTurfThisYearPctOfEarnings').AsInteger := 0;

               tblE.FieldByName('SireGeneralThisYearRank').AsInteger := 0;
               tblE.FieldByName('SireGeneralThisYearStudFee').AsFloat := 0;

               //tblE.FieldByName('SireArtificialThisYearRank').AsInteger := 0;
               //tblE.FieldByName('SireArtificialLastYearRank').AsInteger := 0;
               //tblE.FieldByName('SireAEI').AsFloat := 0;

               tblE.FieldByName('Sire').AsString := Trim(sSire);
               tblE.FieldByName('Dam').AsString := Trim(sDam);

               tblE.FieldByName('DamSire').AsString := Trim(sDamsSire);

               tblE.FieldByName('DamSireTurfLastYearRank').AsInteger := 0;
               tblE.FieldByName('DamSireTurfLastYearStarts').AsInteger := 0;
               tblE.FieldByName('DamSireTurfLastYearPctOfEarnings').AsInteger := 0;

               tblE.FieldByName('DamSireGeneralLastYearRank').AsInteger := 0;
               tblE.FieldByName('DamSireGeneralLastYearStudFee').AsFloat := 0;

               tblE.FieldByName('DamSireJuvenileLastYearRank').AsInteger := 0;
               tblE.FieldByName('DamSireJuvenileThisYearRank').AsInteger := 0;

               tblE.FieldByName('DamSireTurfThisYearRank').AsInteger := 0;
               tblE.FieldByName('DamSireTurfThisYearStarts').AsInteger := 0;
               tblE.FieldByName('DamSireTurfThisYearPctOfEarnings').AsInteger := 0;

               tblE.FieldByName('DamSireGeneralThisYearRank').AsInteger := 0;
               tblE.FieldByName('DamSireGeneralThisYearStudFee').AsFloat := 0;

               //tblE.FieldByName('DamSireArtificialThisYearRank').AsInteger := 0;
               //tblE.FieldByName('DamSireArtificialLastYearRank').AsInteger := 0;
               //tblE.FieldByName('DamSireAEI').AsFloat := 0;

               tblE.FieldByName('DaysLast').AsInteger := atoi(sdaysSinceLastRace);
               tblE.FieldByName('DaysLastWork').AsInteger := 0;

               tblE.FieldByName('MorningLineTo1Rank').AsInteger := 0;

               tblE.FieldByName('IsDirtToTurf').AsBoolean := False;
               tblE.FieldByName('IsTurfToDirt').AsBoolean := False;
               tblE.FieldByName('IsSprToRte').AsBoolean := False;
               tblE.FieldByName('IsRteToSpr').AsBoolean := False;

               //
//               tblE.FieldByName('SireClassRating').AsFloat := 0;
//               tblE.FieldByName('SireClassRatingRank').AsInteger := 0;
//               tblSCR.IndexName := 'GroupBy';
//               tblSCR.SetKey();
//               tblSCR.FieldByName('Sire').Value := tblE.FieldByName('Sire').Value;
//               if tblSCR.GotoKey() then begin
//                  tblE.FieldByName('SireClassRating').AsFloat := tblSCR.FieldByName('SireClassRating').AsFloat;
//               end;
//
//               tblE.FieldByName('DamSireClassRating').AsFloat := 0;
//               tblE.FieldByName('DamSireClassRatingRank').AsInteger := 0;
//               tblDSCR.IndexName := 'GroupBy';
//               tblDSCR.SetKey();
//               tblDSCR.FieldByName('DamSire').Value := tblE.FieldByName('DamSire').Value;
//               if tblDSCR.GotoKey() then begin
//                  tblE.FieldByName('DamSireClassRating').AsFloat := tblDSCR.FieldByName('DamSireClassRating').AsFloat;
//               end;
//
//               //
//               tblE.FieldByName('SireTurfRating').AsFloat := 0;
//               tblE.FieldByName('SireTurfRatingRank').AsInteger := 0;
//               tblSTR.IndexName := 'GroupBy';
//               tblSTR.SetKey();
//               tblSTR.FieldByName('Sire').Value := tblE.FieldByName('Sire').Value;
//               if tblSTR.GotoKey() then begin
//                  tblE.FieldByName('SireTurfRating').AsFloat := tblSTR.FieldByName('SireTurfRating').AsFloat;
//               end;
//
//               tblE.FieldByName('DamSireTurfRating').AsFloat := 0;
//               tblE.FieldByName('DamSireTurfRatingRank').AsInteger := 0;
//               tblDSTR.IndexName := 'GroupBy';
//               tblDSTR.SetKey();
//               tblDSTR.FieldByName('DamSire').Value := tblE.FieldByName('DamSire').Value;
//               if tblDSTR.GotoKey() then begin
//                  tblE.FieldByName('DamSireTurfRating').AsFloat := tblDSTR.FieldByName('DamSireTurfRating').AsFloat;
//               end;
//
//               //
//               tblE.FieldByName('SireRouteRating').AsFloat := 0;
//               tblE.FieldByName('SireRouteRatingRank').AsInteger := 0;
//               tblSRR.IndexName := 'GroupBy';
//               tblSRR.SetKey();
//               tblSRR.FieldByName('Sire').Value := tblE.FieldByName('Sire').Value;
//               if tblSRR.GotoKey() then begin
//                  tblE.FieldByName('SireRouteRating').AsFloat := tblSRR.FieldByName('SireRouteRating').AsFloat;
//               end;
//
//               tblE.FieldByName('DamSireRouteRating').AsFloat := 0;
//               tblE.FieldByName('DamSireRouteRatingRank').AsInteger := 0;
//               tblDSRR.IndexName := 'GroupBy';
//               tblDSRR.SetKey();
//               tblDSRR.FieldByName('DamSire').Value := tblE.FieldByName('DamSire').Value;
//               if tblDSRR.GotoKey() then begin
//                  tblE.FieldByName('DamSireRouteRating').AsFloat := tblDSRR.FieldByName('DamSireRouteRating').AsFloat;
//               end;
//
//               //
//               tblE.FieldByName('SireSprintRating').AsFloat := 0;
//               tblE.FieldByName('SireSprintRatingRank').AsInteger := 0;
//               tblSSR.IndexName := 'GroupBy';
//               tblSSR.SetKey();
//               tblSSR.FieldByName('Sire').Value := tblE.FieldByName('Sire').Value;
//               if tblSSR.GotoKey() then begin
//                  tblE.FieldByName('SireSprintRating').AsFloat := tblSSR.FieldByName('SireSprintRating').AsFloat;
//               end;
//
//               tblE.FieldByName('DamSireSprintRating').AsFloat := 0;
//               tblE.FieldByName('DamSireSprintRatingRank').AsInteger := 0;
//               tblDSSR.IndexName := 'GroupBy';
//               tblDSSR.SetKey();
//               tblDSSR.FieldByName('DamSire').Value := tblE.FieldByName('DamSire').Value;
//               if tblDSSR.GotoKey() then begin
//                  tblE.FieldByName('DamSireSprintRating').AsFloat := tblDSSR.FieldByName('DamSireSprintRating').AsFloat;
//               end;
//
//               //
//               tblE.FieldByName('SireMudRating').AsFloat := 0;
//               tblE.FieldByName('SireMudRatingRank').AsInteger := 0;
//               tblSMR.IndexName := 'GroupBy';
//               tblSMR.SetKey();
//               tblSMR.FieldByName('Sire').Value := tblE.FieldByName('Sire').Value;
//               if tblSMR.GotoKey() then begin
//                  tblE.FieldByName('SireMudRating').AsFloat := tblSMR.FieldByName('SireMudRating').AsFloat;
//               end;
//
//               tblE.FieldByName('DamSireMudRating').AsFloat := 0;
//               tblE.FieldByName('DamSireMudRatingRank').AsInteger := 0;
//               tblDSMR.IndexName := 'GroupBy';
//               tblDSMR.SetKey();
//               tblDSMR.FieldByName('DamSire').Value := tblE.FieldByName('DamSire').Value;
//               if tblDSMR.GotoKey() then begin
//                  tblE.FieldByName('DamSireMudRating').AsFloat := tblDSMR.FieldByName('DamSireMudRating').AsFloat;
//               end;
//
//               //
//               tblE.FieldByName('SireAWRating').AsFloat := 0;
//               tblE.FieldByName('SireAWRatingRank').AsInteger := 0;
//               tblSAWR.IndexName := 'GroupBy';
//               tblSAWR.SetKey();
//               tblSAWR.FieldByName('Sire').Value := tblE.FieldByName('Sire').Value;
//               if tblSAWR.GotoKey() then begin
//                  tblE.FieldByName('SireAWRating').AsFloat := tblSAWR.FieldByName('SireAWRating').AsFloat;
//               end;
//
//               tblE.FieldByName('DamSireAWRating').AsFloat := 0;
//               tblE.FieldByName('DamSireAWRatingRank').AsInteger := 0;
//               tblDSAWR.IndexName := 'GroupBy';
//               tblDSAWR.SetKey();
//               tblDSAWR.FieldByName('DamSire').Value := tblE.FieldByName('DamSire').Value;
//               if tblDSAWR.GotoKey() then begin
//                  tblE.FieldByName('DamSireAWRating').AsFloat := tblDSAWR.FieldByName('DamSireAWRating').AsFloat;
//               end;

               //
//               tblE.FieldByName('ClassRating').AsFloat := tblE.FieldByName('SireClassRating').AsFloat +
//                  tblE.FieldByName('DamSireClassRating').AsFloat;
//
//               tblE.FieldByName('TurfRating').AsFloat := tblE.FieldByName('SireTurfRating').AsFloat +
//                  tblE.FieldByName('DamSireTurfRating').AsFloat;
//
//               tblE.FieldByName('MudRating').AsFloat := tblE.FieldByName('SireMudRating').AsFloat +
//                  tblE.FieldByName('DamSireMudRating').AsFloat;
//
//               tblE.FieldByName('AWRating').AsFloat := tblE.FieldByName('SireAWRating').AsFloat +
//                  tblE.FieldByName('DamSireAWRating').AsFloat;

//
//               if (tblE.FieldByName('DistanceInFurlongs').AsFloat >= 8.00) then begin
//                  tblE.FieldByName('DistanceRating').AsFloat := tblE.FieldByName('SireRouteRating').AsFloat +
//                     tblE.FieldByName('DamSireRouteRating').AsFloat;
//               end else begin
//                  tblE.FieldByName('DistanceRating').AsFloat := tblE.FieldByName('SireSprintRating').AsFloat +
//                     tblE.FieldByName('DamSireSprintRating').AsFloat;
//               end;

               //


               sHdwDirtPedigreeRating := FastReplace(sHdwDirtPedigreeRating, '*', '', True);
               sHdwDirtPedigreeRating := FastReplace(sHdwDirtPedigreeRating, '?', '', True);
               tblE.FieldByName('ClassRating').AsFloat := atof(sHdwDirtPedigreeRating);
             //  if (tblE.FieldByName('ClassRating').AsFloat > 999) then begin
             //     tblE.FieldByName('ClassRating').AsFloat := 0;
              // end;

               sHdwMudPedigreeRating := FastReplace(sHdwMudPedigreeRating, '*', '', True);
               sHdwMudPedigreeRating := FastReplace(sHdwMudPedigreeRating, '?', '', True);
               tblE.FieldByName('MudRating').AsFloat := atof(sHdwMudPedigreeRating);
            //   if (tblE.FieldByName('MudRating').AsFloat > 999) then begin
             //     tblE.FieldByName('MudRating').AsFloat := 0;
             //  end;

               sHdwTurfPedigreeRating := FastReplace(sHdwTurfPedigreeRating, '*', '', True);
               sHdwTurfPedigreeRating := FastReplace(sHdwTurfPedigreeRating, '?', '', True);
              // tblE.FieldByName('TurfRating').AsFloat := atof(sHdwTurfPedigreeRating);
             //  if (tblE.FieldByName('TurfRating').AsFloat > 999) then begin
              //    tblE.FieldByName('TurfRating').AsFloat := 0;
             //  end;

               sHdwDistPedigreeRating := FastReplace(sHdwDistPedigreeRating, '*', '', True);
               sHdwDistPedigreeRating := FastReplace(sHdwDistPedigreeRating, '?', '', True);
               tblE.FieldByName('DistanceRating').AsFloat := atof(sHdwDistPedigreeRating);
             //  if (tblE.FieldByName('DistanceRating').AsFloat > 999) then begin
             //     tblE.FieldByName('DistanceRating').AsFloat := 0;
              // end;


               //               //
               //               tblE.FieldByName('OwnerRating').AsFloat := 0;
               //               tblE.FieldByName('OwnerRatingRank').AsInteger := 0;
               //               tblOR.IndexName := 'GroupBy';
               //               tblOR.SetKey();
               //               tblOR.FieldByName('Owner').Value := tblE.FieldByName('Owner').Value;
               //               if tblOR.GotoKey() then begin
               //                  tblE.FieldByName('OwnerRating').AsFloat := tblOR.FieldByName('OwnerRating').AsFloat;
               //               end;
               //
               //               //
               //               tblE.FieldByName('TrainerRating').AsFloat := 0;
               //               tblE.FieldByName('TrainerRatingRank').AsInteger := 0;
               //               tblTR.IndexName := 'GroupBy';
               //               tblTR.SetKey();
               //               tblTR.FieldByName('Trainer').Value := tblE.FieldByName('Trainer').Value;
               //               if tblTR.GotoKey() then begin
               //                  tblE.FieldByName('TrainerRating').AsFloat := tblTR.FieldByName('TrainerRating').AsFloat;
               //               end;
               //
               //               //
               //               tblE.FieldByName('TrainerJockeyRating').AsFloat := 0;
               //               tblE.FieldByName('TrainerJockeyRatingRank').AsInteger := 0;
               //               tblTJR.IndexName := 'GroupBy';
               //               tblTJR.SetKey();
               //               tblTJR.FieldByName('Trainer').Value := tblE.FieldByName('Trainer').Value;
               //               tblTJR.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').Value;
               //               if tblTJR.GotoKey() then begin
               //                  tblE.FieldByName('TrainerJockeyRating').AsFloat := tblTJR.FieldByName('TrainerJockeyRating').AsFloat;
               //               end;
               //
               //               tblE.FieldByName('TrainerOwnerRating').AsFloat := 0;
               //               tblE.FieldByName('TrainerOwnerRatingRank').AsInteger := 0;
               //               tblTOR.IndexName := 'GroupBy';
               //               tblTOR.SetKey();
               //               tblTOR.FieldByName('Trainer').Value := tblE.FieldByName('Trainer').Value;
               //               tblTOR.FieldByName('Owner').Value := tblE.FieldByName('Owner').Value;
               //               if tblTOR.GotoKey() then begin
               //                  tblE.FieldByName('TrainerOwnerRating').AsFloat := tblTOR.FieldByName('TrainerOwnerRating').AsFloat;
               //               end;
               //
               //               tblE.FieldByName('TrainerTrackRating').AsFloat := 0;
               //               tblE.FieldByName('TrainerTrackRatingRank').AsInteger := 0;
               //               tblTTR.IndexName := 'GroupBy';
               //               tblTTR.SetKey();
               //               tblTTR.FieldByName('Trainer').Value := tblE.FieldByName('Trainer').Value;
               //               tblTTR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
               //               if tblTTR.GotoKey() then begin
               //                  tblE.FieldByName('TrainerTrackRating').AsFloat := tblTTR.FieldByName('TrainerTrackRating').AsFloat;
               //               end;
               //
               //               //
               //               tblE.FieldByName('JockeyRating').AsFloat := 0;
               //               tblE.FieldByName('JockeyRatingRank').AsInteger := 0;
               //               tblJR.IndexName := 'GroupBy';
               //               tblJR.SetKey();
               //               tblJR.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').Value;
               //               if tblJR.GotoKey() then begin
               //                  tblE.FieldByName('JockeyRating').AsFloat := tblJR.FieldByName('JockeyRating').AsFloat;
               //               end;
               //
               //               tblE.FieldByName('JockeyOwnerRating').AsFloat := 0;
               //               tblE.FieldByName('JockeyOwnerRatingRank').AsInteger := 0;
               //               tblJOR.IndexName := 'GroupBy';
               //               tblJOR.SetKey();
               //               tblJOR.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').Value;
               //               tblJOR.FieldByName('Owner').Value := tblE.FieldByName('Owner').Value;
               //               if tblJOR.GotoKey() then begin
               //                  tblE.FieldByName('JockeyOwnerRating').AsFloat := tblJOR.FieldByName('JockeyOwnerRating').AsFloat;
               //               end;
               //
               //               tblE.FieldByName('JockeyTrackRating').AsFloat := 0;
               //               tblE.FieldByName('JockeyTrackRatingRank').AsInteger := 0;
               //               tblJTR.IndexName := 'GroupBy';
               //               tblJTR.SetKey();
               //               tblJTR.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').Value;
               //               tblJTR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
               //               if tblJTR.GotoKey() then begin
               //                  tblE.FieldByName('JockeyTrackRating').AsFloat := tblJTR.FieldByName('JockeyTrackRating').AsFloat;
               //               end;

               tblE.FieldByName('LastSpeed').AsInteger := 0;
               tblE.FieldByName('LastSpeedRank').AsInteger := 0;

               tblE.FieldByName('Power').AsFloat := 0;
               tblE.FieldByName('PowerRank').AsInteger := 0;

               tblE.FieldByName('BackSpeed').AsInteger := 0;
               tblE.FieldByName('BackSpeedRank').AsInteger := 0;

               tblE.FieldByName('AvgSpeed').AsInteger := 0;
               tblE.FieldByName('AvgSpeedRank').AsInteger := 0;

               tblE.FieldByName('EarlyPace').AsFloat := 0;
               tblE.FieldByName('EarlyPaceRank').AsInteger := 0;
               tblE.FieldByName('EarlyPacePos').AsFloat := 0;
               tblE.FieldByName('EarlyPacePosRank').AsInteger := 0;

               tblE.FieldByName('MiddlePace').AsFloat := 0;
               tblE.FieldByName('MiddlePaceRank').AsInteger := 0;
               tblE.FieldByName('MiddlePacePos').AsFloat := 0;
               tblE.FieldByName('MiddlePacePosRank').AsInteger := 0;

               tblE.FieldByName('LatePace').AsFloat := 0;
               tblE.FieldByName('LatePaceRank').AsInteger := 0;
               tblE.FieldByName('LatePacePos').AsFloat := 0;
               tblE.FieldByName('LatePacePosRank').AsInteger := 0;

               tblE.FieldByName('FinishPacePos').AsFloat := 0;
               tblE.FieldByName('FinishPacePosRank').AsInteger := 0;

               tblE.FieldByName('EarlyPaceAdvantage').AsFloat := 0;
               tblE.FieldByName('MiddlePaceAdvantage').AsFloat := 0;
               tblE.FieldByName('LatePaceAdvantage').AsFloat := 0;


               tblE.FieldByName('IsClaimed1Back').AsBoolean := False;
               tblE.FieldByName('IsClaimed2Back').AsBoolean := False;
               tblE.FieldByName('IsLayoffAndUp').AsBoolean := False;
               tblE.FieldByName('IsClaimedAndUp').AsBoolean := False;
               tblE.FieldByName('IsClaimedAndDown').AsBoolean := False;
               tblE.FieldByName('IsFirstTimeClaiming').AsBoolean := False;
               tblE.FieldByName('IsBelowClaimedPrice').AsBoolean := False;

               tblE.FieldByName('LifeStarts').AsInteger := atoi(slifeStarts);
               tblE.FieldByName('LifeWins').AsInteger := atoi(slifeWins);
               tblE.FieldByName('LifePlcs').AsInteger := atoi(slifePlaces);
               tblE.FieldByName('LifeShos').AsInteger := atoi(slifeShows);
               tblE.FieldByName('LifeEarnings').AsInteger := atoi(slifeEarnings);

               if atoi(slifeStarts) > 0 then begin
                  tblE.FieldByName('LifeEPS').AsInteger := atoi(slifeEarnings) div atoi(slifeStarts);
               end;

               tblE.FieldByName('DebutIndicator').AsString := '';
               if atoi(slifeStarts) = 0 then begin
                  tblE.FieldByName('DebutIndicator').AsString := '*';
                  //   tblE.FieldByName('IsDebut').AsBoolean := True;
               end;

               if atoi(slifeStarts) = 1 then begin
                  tblE.FieldByName('DebutIndicator').AsString := '**';
                  //tblE.FieldByName('IsDebutTwo').AsBoolean := True;
               end;

               tblE.FieldByName('TurfIndicator').AsString := '';
               tblE.FieldByName('TurfStarts').AsInteger := atoi(sturfStarts);
               tblE.FieldByName('TurfWins').AsInteger := atoi(sturfWins);
               tblE.FieldByName('TurfPlcs').AsInteger := atoi(sturfPlaces);
               tblE.FieldByName('TurfShos').AsInteger := atoi(sturfShows);
               tblE.FieldByName('TurfEarnings').AsInteger := atoi(sturfEarnings);

               if atoi(sturfStarts) > 0 then begin
                  tblE.FieldByName('TurfEPS').AsInteger := atoi(sTurfEarnings) div atoi(sTurfStarts);
               end;
               if atoi(sturfStarts) = 0 then begin
                  tblE.FieldByName('TurfIndicator').AsString := '*';
               end;

               if atoi(sturfStarts) = 1 then begin
                  tblE.FieldByName('TurfIndicator').AsString := '**';
               end;

               tblE.FieldByName('MudIndicator').AsString := '';
               tblE.FieldByName('MudStarts').AsInteger := atoi(swetStarts);
               tblE.FieldByName('MudWins').AsInteger := atoi(swetWins);
               tblE.FieldByName('MudPlcs').AsInteger := atoi(swetPlaces);
               tblE.FieldByName('MudShos').AsInteger := atoi(swetShows);
               tblE.FieldByName('MudEarnings').AsInteger := atoi(swetEarnings);
               if atoi(sWetStarts) > 0 then begin
                  tblE.FieldByName('MudEPS').AsInteger := atoi(sWetEarnings) div atoi(sWetStarts);
               end;
               if atoi(swetStarts) = 0 then begin
                  tblE.FieldByName('MudIndicator').AsString := '*';
               end;
               if atoi(swetStarts) = 1 then begin
                  tblE.FieldByName('MudIndicator').AsString := '**';
               end;

               tblE.FieldByName('TrkStarts').AsInteger := atoi(strackStarts);
               tblE.FieldByName('TrkWins').AsInteger := atoi(strackWins);
               tblE.FieldByName('TrkPlcs').AsInteger := atoi(strackPlaces);
               tblE.FieldByName('TrkShos').AsInteger := atoi(strackShows);
               tblE.FieldByName('TrkEarnings').AsInteger := atoi(strackEarnings);

               if atoi(strackStarts) > 0 then begin
                  tblE.FieldByName('TrkEPS').AsInteger := atoi(sTrackEarnings) div atoi(sTrackStarts);
               end;

               tblE.FieldByName('RouteIndicator').AsString := '';
               if tblR.FieldByName('DistanceInFurlongs').AsFloat >= 8 then begin
                  tblE.FieldByName('RouteStarts').AsInteger := atoi(sdistStarts);
                  tblE.FieldByName('RouteWins').AsInteger := atoi(sdistWins);
                  tblE.FieldByName('RoutePlcs').AsInteger := atoi(sdistPlaces);
                  tblE.FieldByName('RouteShos').AsInteger := atoi(sdistShows);
                  if atoi(sdistStarts) = 0 then begin
                     tblE.FieldByName('RouteIndicator').AsString := '*';
                  end;
                  if atoi(sdistStarts) = 1 then begin
                     tblE.FieldByName('RouteIndicator').AsString := '**';
                  end;
               end else begin
                  tblE.FieldByName('SprintStarts').AsInteger := atoi(sdistStarts);
                  tblE.FieldByName('SprintWins').AsInteger := atoi(sdistWins);
                  tblE.FieldByName('SprintPlcs').AsInteger := atoi(sdistPlaces);
                  tblE.FieldByName('SprintShos').AsInteger := atoi(sdistShows);
               end;

               tblE.FieldByName('AngleDesc').AsString := '';

               tblE.FieldByName('IsWagerSheetSelected').AsBoolean := False;
               tblE.FieldByName('IsYouBetTrack').AsBoolean := False;
               tblE.FieldByName('IsPTCTrack').AsBoolean := False;
               tblE.FieldByName('IsTwinSpiresTrack').AsBoolean := False;
               tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := False;

               tblE.FieldByName('HorseNbr').AsInteger := iIdx + 1;

               iDaysLast := atoi(sdaysSinceLastRace);
               dtWOCutoffDate := tblR.FieldByName('RaceDate').AsDateTime - iDaysLast;

               sWO1 := '';
               sWO2 := '';
               sWO3 := '';
               sWO4 := '';
               sWO5 := '';
               sWO6 := '';

               iWOIdx := 1;

               if (atof(sdateWorkout[iWOIdx]) > 0) then begin

                  sY := CopyStr(sdateWorkout[iWOIdx], 1, 4);
                  sM := CopyStr(sdateWorkout[iWOIdx], 5, 2);
                  sD := CopyStr(sdateWorkout[iWOIdx], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);

                  dtWORaceDate := EncodeDate(wYear, wMonth, wDay);

                  // if ((iDaysLast = 0) or (dtWORaceDate > dtWOCutoffDate)) then begin
                  sWO1 := CopyStr(sdateWorkout[iWOIdx], 5, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 7, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 3, 2) + ' ' +
                     strackWorkout[iWOIdx] + ' ' +
                     GetWODistanceDesc(atoi(sdistanceWorkout[iWOIdx])) + ' ' +
                     sconditionWorkout[iWOIdx] + ' ' +
                     stimeWorkout[iWOIdx] + ' ' + sdescribeWorkout[iWOIdx] + ' ' +
                     '(' + srankWorkout[iWOIdx] + '/' + snumWorksWorkout[iWOIdx] + ')';
                  // end;
               end;

               Inc(iWOIdx);
               if (atof(sdateWorkout[iWOIdx]) > 0) then begin
                  sY := CopyStr(sdateWorkout[iWOIdx], 1, 4);
                  sM := CopyStr(sdateWorkout[iWOIdx], 5, 2);
                  sD := CopyStr(sdateWorkout[iWOIdx], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);

                  dtWORaceDate := EncodeDate(wYear, wMonth, wDay);

                  //if ((iDaysLast = 0) or (dtWORaceDate > dtWOCutoffDate)) then begin
                  sWO2 := CopyStr(sdateWorkout[iWOIdx], 5, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 7, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 3, 2) + ' ' +
                     strackWorkout[iWOIdx] + ' ' +
                     GetWODistanceDesc(atoi(sdistanceWorkout[iWOIdx])) + ' ' +
                     sconditionWorkout[iWOIdx] + ' ' +
                     stimeWorkout[iWOIdx] + ' ' + sdescribeWorkout[iWOIdx] + ' ' +
                     '(' + srankWorkout[iWOIdx] + '/' + snumWorksWorkout[iWOIdx] + ')';
                  //end;
               end;

               Inc(iWOIdx);
               if (atof(sdateWorkout[iWOIdx]) > 0) then begin
                  sY := CopyStr(sdateWorkout[iWOIdx], 1, 4);
                  sM := CopyStr(sdateWorkout[iWOIdx], 5, 2);
                  sD := CopyStr(sdateWorkout[iWOIdx], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);

                  dtWORaceDate := EncodeDate(wYear, wMonth, wDay);

                  //if ((iDaysLast = 0) or (dtWORaceDate > dtWOCutoffDate)) then begin
                  sWO3 := CopyStr(sdateWorkout[iWOIdx], 5, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 7, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 3, 2) + ' ' +
                     strackWorkout[iWOIdx] + ' ' +
                     GetWODistanceDesc(atoi(sdistanceWorkout[iWOIdx])) + ' ' +
                     sconditionWorkout[iWOIdx] + ' ' +
                     stimeWorkout[iWOIdx] + ' ' + sdescribeWorkout[iWOIdx] + ' ' +
                     '(' + srankWorkout[iWOIdx] + '/' + snumWorksWorkout[iWOIdx] + ')';
                  // end;
               end;

               Inc(iWOIdx);
               if (atof(sdateWorkout[iWOIdx]) > 0) then begin
                  sY := CopyStr(sdateWorkout[iWOIdx], 1, 4);
                  sM := CopyStr(sdateWorkout[iWOIdx], 5, 2);
                  sD := CopyStr(sdateWorkout[iWOIdx], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);

                  dtWORaceDate := EncodeDate(wYear, wMonth, wDay);

                  //if ((iDaysLast = 0) or (dtWORaceDate > dtWOCutoffDate)) then begin
                  sWO4 := CopyStr(sdateWorkout[iWOIdx], 5, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 7, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 3, 2) + ' ' +
                     strackWorkout[iWOIdx] + ' ' +
                     GetWODistanceDesc(atoi(sdistanceWorkout[iWOIdx])) + ' ' +
                     sconditionWorkout[iWOIdx] + ' ' +
                     stimeWorkout[iWOIdx] + ' ' + sdescribeWorkout[iWOIdx] + ' ' +
                     '(' + srankWorkout[iWOIdx] + '/' + snumWorksWorkout[iWOIdx] + ')';
                  //end;
               end;

               Inc(iWOIdx);
               if (atof(sdateWorkout[iWOIdx]) > 0) then begin
                  sY := CopyStr(sdateWorkout[iWOIdx], 1, 4);
                  sM := CopyStr(sdateWorkout[iWOIdx], 5, 2);
                  sD := CopyStr(sdateWorkout[iWOIdx], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);

                  dtWORaceDate := EncodeDate(wYear, wMonth, wDay);

                  //if ((iDaysLast = 0) or (dtWORaceDate > dtWOCutoffDate)) then begin
                  sWO5 := CopyStr(sdateWorkout[iWOIdx], 5, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 7, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 3, 2) + ' ' +
                     strackWorkout[iWOIdx] + ' ' +
                     GetWODistanceDesc(atoi(sdistanceWorkout[iWOIdx])) + ' ' +
                     sconditionWorkout[iWOIdx] + ' ' +
                     stimeWorkout[iWOIdx] + ' ' + sdescribeWorkout[iWOIdx] + ' ' +
                     '(' + srankWorkout[iWOIdx] + '/' + snumWorksWorkout[iWOIdx] + ')';
                  // end;
               end;

               Inc(iWOIdx);
               if (atof(sdateWorkout[iWOIdx]) > 0) then begin
                  sY := CopyStr(sdateWorkout[iWOIdx], 1, 4);
                  sM := CopyStr(sdateWorkout[iWOIdx], 5, 2);
                  sD := CopyStr(sdateWorkout[iWOIdx], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);

                  dtWORaceDate := EncodeDate(wYear, wMonth, wDay);

                  //if ((iDaysLast = 0) or (dtWORaceDate > dtWOCutoffDate)) then begin
                  sWO6 := CopyStr(sdateWorkout[iWOIdx], 5, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 7, 2) + '/' +
                     CopyStr(sdateWorkout[iWOIdx], 3, 2) + ' ' +
                     strackWorkout[iWOIdx] + ' ' +
                     GetWODistanceDesc(atoi(sdistanceWorkout[iWOIdx])) + ' ' +
                     sconditionWorkout[iWOIdx] + ' ' +
                     stimeWorkout[iWOIdx] + ' ' + sdescribeWorkout[iWOIdx] + ' ' +
                     '(' + srankWorkout[iWOIdx] + '/' + snumWorksWorkout[iWOIdx] + ')';
                  //end;

               end;

               tblE.FieldByName('WorkLine1').AsString := sWO1 + ' ' + sWO2;
               tblE.FieldByName('WorkLine2').AsString := sWO3 + ' ' + sWO4;


               tblE.FieldByName('IsFrontDoubleLiner').AsBoolean := False;
               tblE.FieldByName('IsBackDoubleLiner').AsBoolean := False;
               tblE.FieldByName('IsTripleLiner').AsBoolean := False;
               tblE.FieldByName('IsFrontDoubleDot').AsBoolean := False;
               tblE.FieldByName('IsBackDoubleDot').AsBoolean := False;
               tblE.FieldByName('IsTripleDot').AsBoolean := False;
               tblE.FieldByName('IsFrontDoubleLiner0').AsBoolean := False;
               tblE.FieldByName('IsBackDoubleLiner0').AsBoolean := False;
               tblE.FieldByName('IsTripleLiner0').AsBoolean := False;
               tblE.FieldByName('IsFrontDoubleLiner1').AsBoolean := False;
               tblE.FieldByName('IsBackDoubleLiner1').AsBoolean := False;
               tblE.FieldByName('IsTripleLiner1').AsBoolean := False;
               tblE.FieldByName('IsFrontDoubleLiner2').AsBoolean := False;
               tblE.FieldByName('IsBackDoubleLiner2').AsBoolean := False;
               tblE.FieldByName('IsTripleLiner2').AsBoolean := False;
               tblE.FieldByName('IsFrontDoubleLiner3').AsBoolean := False;
               tblE.FieldByName('IsBackDoubleLiner3').AsBoolean := False;
               tblE.FieldByName('IsTripleLiner3').AsBoolean := False;


               tblE.FieldByName('TodaysWagerOrderKey').AsString := '';
               tblE.FieldByName('TodaysWagerStarts').AsInteger := 0;
               tblE.FieldByName('TodaysWagerWins').AsInteger := 0;
               tblE.FieldByName('TodaysWagerWinPct').AsFloat := atof(sHdwPrimePowerRating);
               tblE.FieldByName('TodaysWagerWinPctRank').AsInteger := 0;
               tblE.FieldByName('TodaysWagerAvgOdds').AsFloat := 0;
               tblE.FieldByName('TodaysWagerMinOdds').AsFloat := 0;
               tblE.FieldByName('TodaysWagerMaxOdds').AsFloat := 0;
               tblE.FieldByName('TodaysWagerAvgWinOdds').AsFloat := 0;
               tblE.FieldByName('TodaysWagerMinWinOdds').AsFloat := 0;
               tblE.FieldByName('TodaysWagerMaxWinOdds').AsFloat := 0;
               tblE.FieldByName('TodaysWagerValueBet').AsFloat := 0;

               if (Trim(sppraceDate[1]) <> '') then begin
                  sY := CopyStr(sppraceDate[1], 1, 4);
                  sM := CopyStr(sppraceDate[1], 5, 2);
                  sD := CopyStr(sppraceDate[1], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);
                  dtPPRaceDate := EncodeDate(wYear, wMonth, wDay);

                  tblE.FieldByName('LastTrkCode').AsString := sppTrackCode[1];
                  tblE.FieldByName('LastRaceNbr').AsInteger := atoi(sppRaceNum[1]);
                  tblE.FieldByName('LastRaceDate').AsDateTime := dtPPRaceDate;
                  tblE.FieldByName('LastPostPos').AsInteger := atoi(sppPostPosition[1]);
                  tblE.FieldByName('LastRaceType').AsString := GetTSNRaceClass(sppRaceType[1]);
                  tblE.FieldByName('LastSurf').AsString := GetTSNSurface(sppSurface[1]);
                  if (sPPAllSurface[1] = 'A') then begin
                     tblE.FieldByName('LastSurf').AsString := 'A';
                  end;

                  tblE.FieldByName('LastRaceConditions').AsString := UpperCase(sppRaceClassification[1]);
                  tblE.FieldByName('LastDistanceDesc').AsString := GetYardDistanceDesc(atoi(sppdistanceYards[1]));
                  tblE.FieldByName('LastDistance').AsFloat := (atof(sppdistanceYards[1]) * 3) / FEET_IN_FURLONG;
                  if (tblE.FieldByName('LastDistance').AsFloat < 0) then begin
                     tblE.FieldByName('LastDistance').AsFloat := ((atof(sppdistanceYards[1]) * 3) / FEET_IN_FURLONG) * -1;
                  end;
                  tblE.FieldByName('LastOdds').AsFloat := atof(sppOdds[1]);
                  tblE.FieldByName('LastFavoriteIndicator').AsString := '';
                  tblE.FieldByName('LastDQIndicator').AsString := '';
                  tblE.FieldByName('LastJockey').AsString := sppJockey[1];
                  tblE.FieldByName('LastComment').AsString := sppTripComment[1];
                  tblE.FieldByName('LastComment2').AsString := UpperCase(sppTripComment[1] + ' ' + sppExtraComment[1]);
                  tblE.FieldByName('LastTrkCond').AsString := sppTrackCond[1];
                  tblE.FieldByName('LastClmPrice').AsFloat := atof(sppClaimingPriceHorse[1]);
                  tblE.FieldByName('LastClaimed').AsString := sppClaimedCode[1];
                  tblE.FieldByName('LastPurse').AsFloat := atof(sppPurse[1]);
                  tblE.FieldByName('LastDay').AsString := UpperCase(sD);
                  tblE.FieldByName('LastMonthDesc').AsString := sMonthDesc;
                  tblE.FieldByName('LastYear').AsString := UpperCase(sY);
                  tblE.FieldByName('LastGateBreak').AsString := sppStartCallBeatenMargin[1];
                  tblE.FieldByName('LastLen1Back').AsString := sppFirstCallBeatenMargin[1];
                  tblE.FieldByName('LastLen2Back').AsString := sppSecondCallBeatenMargin[1];
                  tblE.FieldByName('LastStLenBack').AsString := sppStretchBeatenMargin[1];

                  tblE.FieldByName('LastFinishBeaten').AsString := sppFinishPos[1] + '-' + sppFinishBeatenMargin[1];

                  tblE.FieldByName('LastEquip').AsString := sppEquipment[1];
                  tblE.FieldByName('LastWeight').AsInteger := atoi(sppWeight[1]);
                  tblE.FieldByName('LastHorseTime').AsFloat := 0;

                  sLTrackCode := tblE.FieldByName('LastTrkCode').AsString;
                  sLSurf := tblE.FieldByName('LastSurf').AsString;
                  sLPostPos := tblE.FieldByName('LastPostPos').AsString;
                  sLDistanceDesc := LeftStr(tblE.FieldByName('LastDistanceDesc').AsString, 7);
                  sLTrkCond := tblE.FieldByName('LastTrkCond').AsString;
                  sLRaceType := tblE.FieldByName('LastRaceType').AsString;
                  sLClmPrice := tblE.FieldByName('LastClmPrice').AsString;
                  sLClaimed := tblE.FieldByName('LastClaimed').AsString;
                  sLPurse := tblE.FieldByName('LastPurse').AsString;
                  sLRaceConditions := LeftStr(tblE.FieldByName('LastRaceConditions').AsString, 10);
                  sLJockey := LeftStr(tblE.FieldByName('LastJockey').AsString, 7);
                  sLWeight := tblE.FieldByName('LastWeight').AsString;
                  sLDQIndicator := tblE.FieldByName('LastDqIndicator').AsString;
                  sLOdds := tblE.FieldByName('LastOdds').AsString;
                  sLFavoriteIndicator := tblE.FieldByName('LastFavoriteIndicator').AsString;

                  sLFinishPos := Trim(sppFinishPos[1]);
                  sTmp := Trim(sppFinishBeatenMargin[1]);

                  iLen := Length(sTmp);
                  iBegPos := SmartPos('.', sTmp);
                  if (iBegPos = 0) then begin
                     sLFinishBeaten := sLFinishPos + '-' + sppFinishBeatenMargin[1];
                  end else begin
                     sL2BL := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);
                     iL2BL := atoi(sL2BL);

                     iLen := Length(sTmp);
                     iBegPos := SmartPos('.', sTmp);
                     sL1BL := CopyStr(sTmp, 1, (iBegPos - 1));
                     sL1BL := Trim(sL1BL);
                     iL1BL := atoi(sL1BL);
                     if (iL1BL = 0) then begin
                        sL1BL := '';
                     end;

                     if (atoi(sLFinishPos) > 1) then begin
                        case iL2BL of
                           05: sLFinishBeaten := sL1BL + '-NS';
                           15: sLFinishBeaten := sL1BL + '-HD';
                           25: sLFinishBeaten := sL1BL + '-1/4';
                           50: sLFinishBeaten := sL1BL + '-1/2';
                           75: sLFinishBeaten := sL1BL + '-3/4';
                        else
                           sLFinishBeaten := sLFinishPos + '-' + sL1BL;
                        end;
                     end else begin
                        case iL2BL of
                           05: sLFinishBeaten := '1-NS';
                           15: sLFinishBeaten := '1-HD';
                           25: sLFinishBeaten := '1-1/4';
                           50: sLFinishBeaten := '1-1/2';
                           75: sLFinishBeaten := '1-3/4';
                        else
                           sLFinishBeaten := '1' + sL1BL;
                        end;
                     end;
                  end;

                  if Length(sLFinishBeaten) = 1 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 2 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 3 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 4 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 5 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;

                  if Length(sLOdds) = 1 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 2 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 3 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 4 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 5 then begin
                     sLOdds := ' ' + sLOdds;
                  end;

                  if Length(sLFinishPos) = 0 then begin
                     sLFinishPos := ' ' + sLFinishPos;
                  end;

                  if Length(sLFinishBeaten) = 1 then begin
                     sLFinishPos := ' ' + sLFinishPos;
                  end;


                  if sLFinishPos = ' 0' then begin
                     sLFinishBeaten := '  ';
                  end;

                  if sLOdds = '  0.00' then begin
                     sLOdds := '      ';
                  end;

                  tblE.FieldByName('LastRaceDesc').AsString := UpperCase(
                     Format('%-2s', [sD]) +
                     Format('%3s', [sMonthDesc]) +
                     Format('%-2s', [sY]) + ' ' +
                     Format('%-2s', [sLPostPos]) + ' ' +
                     Format('%-3s', [sLTrackCode]) + ' ' +
                     Format('%-1s', [sLSurf]) + ' ' +
                     Format('%-2s', [sLTrkCond]) + ' ' +
                     Format('%-7s', [sLDistanceDesc]) + ' ' +
                     // Format('%-4s', [sLRaceType]) +
                     //   Format('%-7s', [sLClmPrice]) +
                     // Format('%-1s', [sLClaimed]) +
                     //   Format('%-7s', [sLPurse]) + ' ' +
                     Format('%-10s', [sLRaceConditions]) + ' ' +
                     Format('%-7s', [sLJockey]) + ' ' +
                     Format('%-3s', [sLWeight]) + '|' +
                     Format('%-2s', [sLFinishPos]) + ' ' +
                     Format('%-7s', [sLFinishBeaten]) + '|' +
                     Format('%-6s', [sLOdds]) +
                     Format('%-1s', [sLFavoriteIndicator])
                     );


               end;

               if (Trim(sppraceDate[2]) <> '') then begin
                  sY := CopyStr(sppraceDate[2], 1, 4);
                  sM := CopyStr(sppraceDate[2], 5, 2);
                  sD := CopyStr(sppraceDate[2], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);
                  dtPPRaceDate := EncodeDate(wYear, wMonth, wDay);

                  tblE.FieldByName('Last2TrkCode').AsString := sppTrackCode[2];
                  tblE.FieldByName('Last2RaceNbr').AsInteger := atoi(sppRaceNum[2]);
                  tblE.FieldByName('Last2RaceDate').AsDateTime := dtPPRaceDate;
                  tblE.FieldByName('Last2PostPos').AsInteger := atoi(sppPostPosition[2]);
                  tblE.FieldByName('Last2RaceType').AsString := GetTSNRaceClass(sppRaceType[2]);
                  tblE.FieldByName('Last2Surf').AsString := GetTSNSurface(sppSurface[2]);
                  if (sPPAllSurface[2] = 'A') then begin
                     tblE.FieldByName('Last2Surf').AsString := 'A';
                  end;

                  tblE.FieldByName('Last2RaceConditions').AsString := UpperCase(sppRaceClassification[2]);
                  tblE.FieldByName('Last2DistanceDesc').AsString := GetYardDistanceDesc(atoi(sppdistanceYards[2]));
                  if (tblE.FieldByName('Last2Distance').AsFloat < 0) then begin
                     tblE.FieldByName('Last2Distance').AsFloat := ((atof(sppdistanceYards[2]) * 3) / FEET_IN_FURLONG) * -1;
                  end;
                  tblE.FieldByName('Last2Odds').AsFloat := atof(sppOdds[2]);
                  tblE.FieldByName('Last2FavoriteIndicator').AsString := '';
                  tblE.FieldByName('Last2DQIndicator').AsString := '';
                  tblE.FieldByName('Last2Jockey').AsString := sppJockey[2];
                  tblE.FieldByName('Last2Comment').AsString := sppTripComment[2];
                  tblE.FieldByName('Last2Comment2').AsString := UpperCase((sppTripComment[2] + ' ' + sppExtraComment[2]));
                  tblE.FieldByName('Last2TrkCond').AsString := sppTrackCond[2];
                  tblE.FieldByName('Last2ClmPrice').AsFloat := atof(sppClaimingPriceHorse[2]);
                  tblE.FieldByName('Last2Claimed').AsString := sppClaimedCode[2];
                  tblE.FieldByName('Last2Purse').AsFloat := atof(sppPurse[2]);
                  tblE.FieldByName('Last2Day').AsString := UpperCase(sD);
                  tblE.FieldByName('Last2MonthDesc').AsString := sMonthDesc;
                  tblE.FieldByName('Last2Year').AsString := UpperCase(sY);
                  tblE.FieldByName('Last2GateBreak').AsString := sppStartCallBeatenMargin[2];
                  tblE.FieldByName('Last2Len1Back').AsString := sppFirstCallBeatenMargin[2];
                  tblE.FieldByName('Last2Len2Back').AsString := sppSecondCallBeatenMargin[2];
                  tblE.FieldByName('Last2StLenBack').AsString := sppStretchBeatenMargin[2];

                  tblE.FieldByName('Last2FinishBeaten').AsString := sppFinishPos[2] + '-' + sppFinishBeatenMargin[2];

                  tblE.FieldByName('Last2Equip').AsString := sppEquipment[2];
                  tblE.FieldByName('Last2Weight').AsInteger := atoi(sppWeight[2]);
                  tblE.FieldByName('Last2HorseTime').AsFloat := 0;

                  sLTrackCode := tblE.FieldByName('Last2TrkCode').AsString;
                  sLSurf := tblE.FieldByName('Last2Surf').AsString;
                  sLPostPos := tblE.FieldByName('Last2PostPos').AsString;
                  sLDistanceDesc := LeftStr(tblE.FieldByName('Last2DistanceDesc').AsString, 7);
                  sLTrkCond := tblE.FieldByName('Last2TrkCond').AsString;
                  sLRaceType := tblE.FieldByName('Last2RaceType').AsString;
                  sLClmPrice := tblE.FieldByName('Last2ClmPrice').AsString;
                  sLClaimed := tblE.FieldByName('Last2Claimed').AsString;
                  sLPurse := tblE.FieldByName('Last2Purse').AsString;
                  sLRaceConditions := LeftStr(tblE.FieldByName('Last2RaceConditions').AsString, 10);
                  sLJockey := LeftStr(tblE.FieldByName('Last2Jockey').AsString, 7);
                  sLWeight := tblE.FieldByName('Last2Weight').AsString;
                  sLDQIndicator := tblE.FieldByName('Last2DqIndicator').AsString;
                  sLFinishBeaten := tblE.FieldByName('Last2FinishBeaten').AsString;
                  sLOdds := tblE.FieldByName('Last2Odds').AsString;
                  sLFavoriteIndicator := tblE.FieldByName('Last2FavoriteIndicator').AsString;

                  sLFinishPos := sppFinishPos[2];
                  sTmp := Trim(sppFinishBeatenMargin[2]);

                  iLen := Length(sTmp);
                  iBegPos := SmartPos('.', sTmp);
                  if (iBegPos = 0) then begin
                     sLFinishBeaten := sLFinishPos + '-' + sppFinishBeatenMargin[2];
                  end else begin
                     sL2BL := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);
                     iL2BL := atoi(sL2BL);

                     iLen := Length(sTmp);
                     iBegPos := SmartPos('.', sTmp);
                     sL1BL := CopyStr(sTmp, 1, (iBegPos - 1));
                     sL1BL := Trim(sL1BL);
                     iL1BL := atoi(sL1BL);
                     if (iL1BL = 0) then begin
                        sL1BL := '';
                     end;

                     if (atoi(sLFinishPos) > 1) then begin
                        case iL2BL of
                           05: sLFinishBeaten := sL1BL + '-NS';
                           15: sLFinishBeaten := sL1BL + '-HD';
                           25: sLFinishBeaten := sL1BL + '-1/4';
                           50: sLFinishBeaten := sL1BL + '-1/2';
                           75: sLFinishBeaten := sL1BL + '-3/4';
                        else
                           sLFinishBeaten := sLFinishPos + '-' + sL1BL;
                        end;
                     end else begin
                        case iL2BL of
                           05: sLFinishBeaten := '1-NS';
                           15: sLFinishBeaten := '1-HD';
                           25: sLFinishBeaten := '1-1/4';
                           50: sLFinishBeaten := '1-1/2';
                           75: sLFinishBeaten := '1-3/4';
                        else
                           sLFinishBeaten := '1' + sL1BL;
                        end;
                     end;
                  end;

                  if Length(sLFinishBeaten) = 1 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 2 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 3 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 4 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 5 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;


                  if Length(sLOdds) = 1 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 2 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 3 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 4 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 5 then begin
                     sLOdds := ' ' + sLOdds;
                  end;

                  if Length(sLFinishPos) = 0 then begin
                     sLFinishPos := ' ' + sLFinishPos;
                  end;

                  if Length(sLFinishBeaten) = 1 then begin
                     sLFinishPos := ' ' + sLFinishPos;
                  end;


                  if sLFinishPos = ' 0' then begin
                     sLFinishBeaten := '  ';
                  end;

                  if sLOdds = '  0.00' then begin
                     sLOdds := '      ';
                  end;

                  tblE.FieldByName('Last2RaceDesc').AsString := UpperCase(
                     Format('%-2s', [sD]) +
                     Format('%3s', [sMonthDesc]) +
                     Format('%-2s', [sY]) + ' ' +
                     Format('%-2s', [sLPostPos]) + ' ' +
                     Format('%-3s', [sLTrackCode]) + ' ' +
                     Format('%-1s', [sLSurf]) + ' ' +
                     Format('%-2s', [sLTrkCond]) + ' ' +
                     Format('%-7s', [sLDistanceDesc]) + ' ' +
                     // Format('%-4s', [sLRaceType]) +
                     //   Format('%-7s', [sLClmPrice]) +
                     // Format('%-1s', [sLClaimed]) +
                     //   Format('%-7s', [sLPurse]) + ' ' +
                     Format('%-10s', [sLRaceConditions]) + ' ' +
                     Format('%-7s', [sLJockey]) + ' ' +
                     Format('%-3s', [sLWeight]) + '|' +
                     Format('%-2s', [sLFinishPos]) + ' ' +
                     Format('%-7s', [sLFinishBeaten]) + '|' +
                     Format('%-6s', [sLOdds]) +
                     Format('%-1s', [sLFavoriteIndicator])
                     );


               end;

               if (Trim(sppraceDate[3]) <> '') then begin
                  sY := CopyStr(sppraceDate[3], 1, 4);
                  sM := CopyStr(sppraceDate[3], 5, 2);
                  sD := CopyStr(sppraceDate[3], 7, 2);
                  sMonthDesc := GetMonthDesc(atoi(sM));

                  wDay := atow(sD);
                  wMonth := atow(sM);
                  wYear := atow(sY);
                  dtPPRaceDate := EncodeDate(wYear, wMonth, wDay);

                  tblE.FieldByName('Last3TrkCode').AsString := sppTrackCode[3];
                  tblE.FieldByName('Last3RaceNbr').AsInteger := atoi(sppRaceNum[3]);
                  tblE.FieldByName('Last3RaceDate').AsDateTime := dtPPRaceDate;
                  tblE.FieldByName('Last3PostPos').AsInteger := atoi(sppPostPosition[3]);
                  tblE.FieldByName('Last3RaceType').AsString := GetTSNRaceClass(sppRaceType[3]);
                  tblE.FieldByName('Last3Surf').AsString := GetTSNSurface(sppSurface[3]);
                  if (sPPAllSurface[3] = 'A') then begin
                     tblE.FieldByName('Last3Surf').AsString := 'A';
                  end;

                  tblE.FieldByName('Last3RaceConditions').AsString := UpperCase(sppRaceClassification[3]);
                  tblE.FieldByName('Last3DistanceDesc').AsString := GetYardDistanceDesc(atoi(sppdistanceYards[3]));
                  if (tblE.FieldByName('Last3Distance').AsFloat < 0) then begin
                     tblE.FieldByName('Last3Distance').AsFloat := ((atof(sppdistanceYards[3]) * 3) / FEET_IN_FURLONG) * -1;
                  end;
                  tblE.FieldByName('Last3Odds').AsFloat := atof(sppOdds[3]);
                  tblE.FieldByName('Last3FavoriteIndicator').AsString := '';
                  tblE.FieldByName('Last3DQIndicator').AsString := '';
                  tblE.FieldByName('Last3Jockey').AsString := sppJockey[3];
                  tblE.FieldByName('Last3Comment').AsString := sppTripComment[3];
                  tblE.FieldByName('Last3Comment2').AsString := UpperCase((sppTripComment[3] + ' ' + sppExtraComment[3]));
                  tblE.FieldByName('Last3TrkCond').AsString := sppTrackCond[3];
                  tblE.FieldByName('Last3ClmPrice').AsFloat := atof(sppClaimingPriceHorse[3]);
                  tblE.FieldByName('Last3Claimed').AsString := sppClaimedCode[3];
                  tblE.FieldByName('Last3Purse').AsFloat := atof(sppPurse[3]);
                  tblE.FieldByName('Last3Day').AsString := UpperCase(sD);
                  tblE.FieldByName('Last3MonthDesc').AsString := sMonthDesc;
                  tblE.FieldByName('Last3Year').AsString := UpperCase(sY);
                  tblE.FieldByName('Last3GateBreak').AsString := sppStartCallBeatenMargin[3];
                  tblE.FieldByName('Last3Len1Back').AsString := sppFirstCallBeatenMargin[3];
                  tblE.FieldByName('Last3Len2Back').AsString := sppSecondCallBeatenMargin[3];
                  tblE.FieldByName('Last3StLenBack').AsString := sppStretchBeatenMargin[3];

                  tblE.FieldByName('Last3FinishBeaten').AsString := sppFinishPos[3] + '-' + sppFinishBeatenMargin[3];

                  tblE.FieldByName('Last3Equip').AsString := sppEquipment[3];
                  tblE.FieldByName('Last3Weight').AsInteger := atoi(sppWeight[3]);
                  tblE.FieldByName('Last3HorseTime').AsFloat := 0;

                  sLTrackCode := tblE.FieldByName('Last3TrkCode').AsString;
                  sLSurf := tblE.FieldByName('Last3Surf').AsString;
                  sLPostPos := tblE.FieldByName('Last3PostPos').AsString;
                  sLDistanceDesc := LeftStr(tblE.FieldByName('Last3DistanceDesc').AsString, 7);
                  sLTrkCond := tblE.FieldByName('Last3TrkCond').AsString;
                  sLRaceType := tblE.FieldByName('Last3RaceType').AsString;
                  sLClmPrice := tblE.FieldByName('Last3ClmPrice').AsString;
                  sLClaimed := tblE.FieldByName('Last3Claimed').AsString;
                  sLPurse := tblE.FieldByName('Last3Purse').AsString;
                  sLRaceConditions := LeftStr(tblE.FieldByName('Last3RaceConditions').AsString, 10);
                  sLJockey := LeftStr(tblE.FieldByName('Last3Jockey').AsString, 7);
                  sLWeight := tblE.FieldByName('Last3Weight').AsString;
                  sLDQIndicator := tblE.FieldByName('Last3DqIndicator').AsString;
                  sLFinishBeaten := tblE.FieldByName('Last3FinishBeaten').AsString;
                  sLOdds := tblE.FieldByName('Last3Odds').AsString;
                  sLFavoriteIndicator := tblE.FieldByName('Last3FavoriteIndicator').AsString;

                  sLFinishPos := sppFinishPos[3];
                  sTmp := Trim(sppFinishBeatenMargin[3]);

                  iLen := Length(sTmp);
                  iBegPos := SmartPos('.', sTmp);
                  if (iBegPos = 0) then begin
                     sLFinishBeaten := sLFinishPos + '-' + sppFinishBeatenMargin[3];
                  end else begin
                     sL2BL := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);
                     iL2BL := atoi(sL2BL);

                     iLen := Length(sTmp);
                     iBegPos := SmartPos('.', sTmp);
                     sL1BL := CopyStr(sTmp, 1, (iBegPos - 1));
                     sL1BL := Trim(sL1BL);
                     iL1BL := atoi(sL1BL);
                     if (iL1BL = 0) then begin
                        sL1BL := '';
                     end;

                     if (atoi(sLFinishPos) > 1) then begin
                        case iL2BL of
                           05: sLFinishBeaten := sL1BL + '-NS';
                           15: sLFinishBeaten := sL1BL + '-HD';
                           25: sLFinishBeaten := sL1BL + '-1/4';
                           50: sLFinishBeaten := sL1BL + '-1/2';
                           75: sLFinishBeaten := sL1BL + '-3/4';
                        else
                           sLFinishBeaten := sLFinishPos + '-' + sL1BL;
                        end;
                     end else begin
                        case iL2BL of
                           05: sLFinishBeaten := '1-NS';
                           15: sLFinishBeaten := '1-HD';
                           25: sLFinishBeaten := '1-1/4';
                           50: sLFinishBeaten := '1-1/2';
                           75: sLFinishBeaten := '1-3/4';
                        else
                           sLFinishBeaten := '1' + sL1BL;
                        end;
                     end;
                  end;

                  if Length(sLFinishBeaten) = 1 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 2 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 3 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 4 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;
                  if Length(sLFinishBeaten) = 5 then begin
                     sLFinishBeaten := ' ' + sLFinishBeaten;
                  end;

                  if Length(sLOdds) = 1 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 2 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 3 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 4 then begin
                     sLOdds := ' ' + sLOdds;
                  end;
                  if Length(sLOdds) = 5 then begin
                     sLOdds := ' ' + sLOdds;
                  end;

                  if Length(sLFinishPos) = 0 then begin
                     sLFinishPos := ' ' + sLFinishPos;
                  end;

                  if Length(sLFinishBeaten) = 1 then begin
                     sLFinishPos := ' ' + sLFinishPos;
                  end;


                  if sLFinishPos = ' 0' then begin
                     sLFinishBeaten := '  ';
                  end;

                  if sLOdds = '  0.00' then begin
                     sLOdds := '      ';
                  end;

                  tblE.FieldByName('Last3RaceDesc').AsString := UpperCase(
                     Format('%-2s', [sD]) +
                     Format('%3s', [sMonthDesc]) +
                     Format('%-2s', [sY]) + ' ' +
                     Format('%-2s', [sLPostPos]) + ' ' +
                     Format('%-3s', [sLTrackCode]) + ' ' +
                     Format('%-1s', [sLSurf]) + ' ' +
                     Format('%-2s', [sLTrkCond]) + ' ' +
                     Format('%-7s', [sLDistanceDesc]) + ' ' +
                     // Format('%-4s', [sLRaceType]) +
                     //   Format('%-7s', [sLClmPrice]) +
                     // Format('%-1s', [sLClaimed]) +
                     //   Format('%-7s', [sLPurse]) + ' ' +
                     Format('%-10s', [sLRaceConditions]) + ' ' +
                     Format('%-7s', [sLJockey]) + ' ' +
                     Format('%-3s', [sLWeight]) + '|' +
                     Format('%-2s', [sLFinishPos]) + ' ' +
                     Format('%-7s', [sLFinishBeaten]) + '|' +
                     Format('%-6s', [sLOdds]) +
                     Format('%-1s', [sLFavoriteIndicator])
                     );

               end;

               tblE.FieldByName('Odds').AsFloat := 0;
               tblE.FieldByName('FinishPos').AsFloat := 0;

               tblE.FieldByName('QSP1stCall').AsInteger := 0;
               tblE.FieldByName('QSP1stCallRank').AsInteger := 0;
               tblE.FieldByName('QSP1stCallRunStyle').AsString := '';

               tblE.FieldByName('QSP2ndCall').AsInteger := 0;
               tblE.FieldByName('QSP2ndCallRank').AsInteger := 0;
               tblE.FieldByName('QSP2ndCallRunStyle').AsString := '';

               tblE.FieldByName('KSP1stCall').AsInteger := 0;
               tblE.FieldByName('KSP1stCallRank').AsInteger := 0;
               tblE.FieldByName('KSP2ndCall').AsInteger := 0;
               tblE.FieldByName('KSP2ndCallRank').AsInteger := 0;

               tblE.FieldByName('Is1stClaiming').AsBoolean := False;
               tblE.FieldByName('Is1stMCL').AsBoolean := False;

               tblE.FieldByName('Is1stAfterLayoff').AsBoolean := False;
               tblE.FieldByName('Is2ndAfterLayoff').AsBoolean := False;
               tblE.FieldByName('Is3rdAfterLayoff').AsBoolean := False;

               tblE.FieldByName('IsDirtToTurfToDirtAfterLayoff').AsBoolean := False;
               tblE.FieldByName('IsTurfToDirtToTurfAfterLayoff').AsBoolean := False;

               tblE.FieldByName('IsRouteToSprintToRouteAfterLayoff').AsBoolean := False;
               tblE.FieldByName('IsSprintToRouteToSprintAfterLayoff').AsBoolean := False;

               tblE.FieldByName('Is2yoBred').AsBoolean := False;
               tblE.FieldByName('Is1stBred').AsBoolean := False;
               tblE.FieldByName('IsTurfBred').AsBoolean := False;

               tblE.FieldByName('Is1stOffLayoff').AsBoolean := False;
               tblE.FieldByName('Is2ndOffLayoff').AsBoolean := False;
               tblE.FieldByName('Is3rdOffLayoff').AsBoolean := False;
               tblE.FieldByName('StandingIn').AsString := '';
               tblE.FieldByName('StandingInRank').AsInteger := 0;
               tblE.FieldByName('IsOnStandingInList').AsBoolean := False;

               tblE.FieldByName('PacificTime').AsString := sPacificTime;

               tblE.FieldByName('AvgClass').AsFloat := atof(sAvgClass);
               tblE.FieldByName('BackClass').AsFloat := atof(sBackClass);
               tblE.FieldByName('BackSpeed').AsInteger := atoi(sHdwBackSpeed);

               tblE.FieldByName('JockeyRating').AsFloat := atoi(sTJMeetStarts);
               fWins := atof(sTJMeetWins);
               fStarts := atof(sTJMeetStarts);
               if (fStarts > 0) then begin
                  fWinPct := (fWins / fStarts) * 100;
               end else begin
                  fWinPct := 0;
               end;
               tblE.FieldByName('TJMeetStarts').AsFloat := fStarts;
               tblE.FieldByName('TJMeetWinPct').AsFloat := fWinPct;
               tblE.FieldByName('TrainerJockeyRating').AsFloat := tblE.FieldByName('TJ365WinPct').AsFloat;

               fWins := atof(sTJ365Wins);
               fStarts := atof(sTJ365Starts);
               if (fStarts > 0) then begin
                  fWinPct := (fWins / fStarts) * 100;
               end else begin
                  fWinPct := 0;
               end;
               tblE.FieldByName('TJ365Starts').AsFloat := fStarts;
               tblE.FieldByName('TJ365WinPct').AsFloat := fWinPct;

               if (fStarts > 16) then begin
                  tblE.FieldByName('TrainerJockeyRating').AsFloat := tblE.FieldByName('TJMeetWinPct').AsFloat;
               end;

               tblE.Post();
            end;


            for iFldIdx := 1 to 10 do begin
               if Trim(sppTrackCode[iFldIdx]) <> '' then begin
                  tblPP.IndexName := '';
                  tblPP.SetKey();
                  tblPP.FieldByName('TrkCode').AsString := sTrack;
                  tblPP.FieldByName('RaceDate').AsDateTime := dtRaceDate;
                  tblPP.FieldByName('HorseNbr').AsInteger := iIdx + 1;
                  tblPP.FieldByName('PPNbr').AsInteger := iFldIdx;


                  if not (tblPP.GotoKey()) then begin
                     tblPP.Append();
                     tblPP.FieldByName('TrkCode').AsString := sTrack;
                     tblPP.FieldByName('RaceDate').AsDateTime := dtRaceDate;
                     tblPP.FieldByName('HorseNbr').AsInteger := iIdx + 1;
                     tblPP.FieldByName('PPNbr').AsInteger := iFldIdx;

                     tblPP.FieldByName('Comment').Value := UpperCase(sppTripComment[iFldIdx]);
                     tblPP.FieldByName('Comment2').Value := UpperCase(sppExtraComment[iFldIdx]);

                     sY := CopyStr(sppraceDate[iFldIdx], 1, 4);
                     sM := CopyStr(sppraceDate[iFldIdx], 5, 2);
                     sD := CopyStr(sppraceDate[iFldIdx], 7, 2);
                     sMonthDesc := GetMonthDesc(atoi(sM));

                     wDay := atow(sD);
                     wMonth := atow(sM);
                     wYear := atow(sY);
                     dtPPRaceDate := EncodeDate(wYear, wMonth, wDay);

                     tblPP.FieldByName('Day').Value := UpperCase(sD);
                     tblPP.FieldByName('MonthDesc').Value := UpperCase(sMonthDesc);
                     tblPP.FieldByName('Year').Value := UpperCase(sY);

                     tblPP.FieldByName('DateOfRace').AsDateTime := dtPPRaceDate;
                     tblPP.FieldByName('DaysFromTodaysRace').AsFloat := DaysApart(dtPPRaceDate, dtRaceDate);

                     tblPP.FieldByName('RaceNbr').Value := UpperCase(sppRaceNum[iFldIdx]);
                     tblPP.FieldByName('TrkAbbr').Value := UpperCase(sppTrackCode[iFldIdx]);

                     tblPP.FieldByName('Surf').Value := GetTSNSurface(sppSurface[iFldIdx]);
                     if atoi(sPPAllSurface[iFldIdx]) = 1 then begin
                        tblPP.FieldByName('Surf').Value := 'A';
                     end;

                     tblPP.FieldByName('TrkCond').Value := UpperCase(sppTrackCond[iFldIdx]);
                     tblPP.FieldByName('DistanceDesc').Value := GetYardDistanceDesc(atoi(sppdistanceYards[iFldIdx]));

                     tblPP.FieldByName('Time1stCall').AsFloat := atof(UpperCase(sppFirstFraction[iFldIdx]));
                     tblPP.FieldByName('Time2ndCall').AsFloat := atof(UpperCase(sppSecondFraction[iFldIdx]));
                     tblPP.FieldByName('TimeStrCall').AsFloat := atof(UpperCase(sppThirdFraction[iFldIdx]));
                     tblPP.FieldByName('TimeFinCall').AsFloat := atof(UpperCase(sppFinalTime[iFldIdx]));

                     tblPP.FieldByName('Pos1stCall').AsFloat := atof(sppFirstCallPos[iFldIdx]);
                     tblPP.FieldByName('Pos2ndCall').AsFloat := atof(sppSecondCallPos[iFldIdx]);
                     tblPP.FieldByName('PosStrCall').AsFloat := atof(sppStretchPos[iFldIdx]);
                     tblPP.FieldByName('PosFinCall').AsFloat := atof(sppFinishPos[iFldIdx]);

                     tblPP.FieldByName('BL1stCall').AsFloat := atof(sppFirstCallBeaten[iFldIdx]);
                     tblPP.FieldByName('BL2ndCall').AsFloat := atof(sppSecondCallBeaten[iFldIdx]);
                     tblPP.FieldByName('BLStrCall').AsFloat := atof(sppStretchBeaten[iFldIdx]);
                     tblPP.FieldByName('BLFinCall').AsFloat := atof(sppFinishBeaten[iFldIdx]);

                     tblPP.FieldByName('ClmPrice').AsInteger := atoi(sppClaimingPriceHorse[iFldIdx]);
                     tblPP.FieldByName('Claimed').Value := UpperCase(sppClaimedCode[iFldIdx]);
                     tblPP.FieldByName('Purse').AsInteger := atoi(sppPurse[iFldIdx]);

                     tblPP.FieldByName('RaceConditions').Value := UpperCase(sppRaceClassification[iFldIdx]);
                     tblPP.FieldByName('RaceDesc').Value := GetTSNRaceDesc(sppRaceType[iFldIdx]);
                     tblPP.FieldByName('RaceType').Value := GetTSNRaceClass(sppRaceType[iFldIdx]);

                    // tblPP.FieldByName('Speed').AsInteger := atoi(CramerSpdRating[iFldIdx]);
                     tblPP.FieldByName('Speed').AsInteger := atoi(sppHdwSpeedRating[iFldIdx]);

                     tblPP.FieldByName('PostPos').AsInteger := atoi(sppPostPosition[iFldIdx]);

                     tblPP.FieldByName('GateBreak').Value := atof(sppStartCallBeatenMargin[iFldIdx]);
                     tblPP.FieldByName('Len1Back').Value := atof(sppFirstCallBeatenMargin[iFldIdx]);
                     tblPP.FieldByName('Len2Back').Value := atof(sppSecondCallBeatenMargin[iFldIdx]);
                     tblPP.FieldByName('StLenBack').Value := atof(sppStretchBeatenMargin[iFldIdx]);
                     tblPP.FieldByName('FinishBeaten').Value := atof(sppFinishBeatenMargin[iFldIdx]);

                     if atoi(sppFinishPos[iFldIdx]) <> atoi(sppMoneyPos[iFldIdx]) then begin
                        tblPP.FieldByName('DQIndicator').Value := 'DQ';
                     end;

                     tblPP.FieldByName('Jockey').Value := sppJockey[iFldIdx];
                     tblPP.FieldByName('Equip').Value := sppEquipment[iFldIdx];

                     tblPP.FieldByName('Weight').AsInteger := atoi(sppWeight[iFldIdx]);
                     tblPP.FieldByName('Odds').AsFloat := atof(sppOdds[iFldIdx]);

                     if Trim(sppFavoriteIndicator[iFldIdx]) = '1' then begin
                        tblPP.FieldByName('FavoriteIndicator').Value := '*';
                     end;

                     tblPP.FieldByName('HorseTime').AsFloat := atof(UpperCase(sppFinalTime[iFldIdx]));
                     tblPP.FieldByName('FldSize').AsInteger := atoi(sppNumEntrants[iFldIdx]);

                     tblPP.FieldByName('EarlyPace').Value := atof(CramerF2E2[iFldIdx]);
                     //tblPP.FieldByName('LatePace').Value := atof(CramerF3Late[iFldIdx]);

                     tblPP.FieldByName('EarlyPace').Value := atof(sppHdw2fPaceRating[iFldIdx]);
                     tblPP.FieldByName('MiddlePace').Value := atof(sppHdw4fPaceRating[iFldIdx]);
                     //tblPP.FieldByName('LatePace').Value := atof(sppHdwLatePaceRating[iFldIdx]);

                     tblPP.FieldByName('HHTrkCode').AsString := sTrack;
                     tblPP.FieldByName('HHRaceDate').AsDateTime := dtRaceDate;
                     tblPP.FieldByName('HHRaceNbr').AsInteger := atoi(sppraceNum[iFldIdx]);
                     tblPP.FieldByName('HHPostPos').AsInteger := atoi(spppostPosition[iFldIdx]);

                     tblPP.Post();
                  end;
               end;
            end;
         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
      FreeAndNil(lstS);
      FreeAndNil(lstMCP);
   end;

end;


end.

