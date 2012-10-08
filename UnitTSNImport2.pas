unit UnitTSNImportPCS;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure TSNImportPCS(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   sFileName: string);


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;


procedure ImportPCSFile(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   sFileName: string);
var
   lstPCS: TStringList;

   iRc: integer;
   iIdx: integer;
   iCnt: integer;

   iPos: integer;
   iHPos: integer;
   iFPPos: integer;

   iRaceNbr: integer;
   iLineLen: integer;
   iLineType: integer;

   sFinishPos: string;
   sOfficialFinishPos: string;

   sHorseName: string;
   sHorseNameHH: string;

   sOdds: string;
   sPostPos: string;
   sProgramNbr: string;

   sTmp: string;

   bRoute: boolean;
   msText: TMemoryStream;


   sResults: string;

   iPPIdx: integer;
   iIdxRes: integer;
   iOddsIdx: integer;
   iHorseIdx: integer;
   iFinPosIdx: integer;
   iProgNbrIdx: integer;

   //Race History
   sFootNotes: string;
   sFractionalTimes: string;
   sScratchedHorses: string;
   sOwners: string;
   sOwnerSilks: string;
   sOwner: string;
   sTrainers: string;
   sWeather: string;

   sDailyDoubleNbrs: string;
   fDailyDoubleWager: double;
   fDailyDoublePayout: double;

   sExactaNbrs: string;
   fExactaWager: double;
   fExactaPayout: double;

   sTrifectaNbrs: string;
   fTrifectaWager: double;
   fTrifectaPayout: double;

   sSuperfectaNbrs: string;
   fSuperfectaWager: double;
   fSuperfectaPayout: double;

   sQuinellaNbrs: string;
   fQuinellaWager: double;
   fQuinellaPayout: double;

   sParse: string;
   sPick3Nbrs: string;
   fPick3Wager: double;
   fPick3Payout: double;
   sPick3NbrsLeg1: string;
   sPick3NbrsLeg2: string;
   sPick3NbrsLeg3: string;

   sPick4Nbrs: string;
   fPick4Wager: double;
   fPick4Payout: double;

   sPick6Nbrs: string;
   fPick6Wager: double;
   fPick6Payout: double;

   sWagerNbrs: string;
   fWagerPayout: double;
   sWagerPayout: string;

   sWinNbrs: string;
   sPlcNbrs: string;
   sShoNbrs: string;

   fWinPayout: double;
   fWinPlcPayout: double;
   fWinShoPayout: double;
   fPlcPayout: double;
   fPlcShoPayout: double;
   fShoPayout: double;

   bFavorite: boolean;

   sKey: string;

   lstS: TStringList;
   lstPostTimes: TStringList;

   sTrack: string;
   sDate: string;
   sRaceNbr: string;
   sTSNPowerRating: string;

   sBestTSNSpeedFastTrack: string;
   sBestTSNSpeedTurf: string;
   sBestTSNSpeedOffTrack: string;
   sBestTSNSpeedDistance: string;
   sAuctionSalesPrice: string;
   sWhereSoldAtAuction: string;
   sBestTSNSpeedLife: string;
   sBestTSNSpeedMostRecentYr: string;
   sBestTSNSpeed2ndMostRecentYr: string;
   sBestTSNSpeedTrack: string;

   sTSNLastClassRating: string;
   sTSNAvgClassRating: string;


   s2fPaceFigure: string;
   s4fPaceFigure: string;
   s6fPaceFigure: string;
   s8fPaceFigure: string;
   s10fPaceFigure: string;
   sLatePaceFigure: string;
   sLastSpeedRating: string;

   sPP2fPaceFigure: string;
   sPP4fPaceFigure: string;
   sPP6fPaceFigure: string;
   sPP8fPaceFigure: string;
   sPP10fPaceFigure: string;
   sPPLatePaceFigure: string;

   sPPRaceClassRating: string;
   sPPClassRating: string;

   sPP2fPacePos: string;
   sPP4fPacePos: string;
   sPP6fPacePos: string;
   sPP8fPacePos: string;
   sPP10fPacePos: string;
   sPPLatePacePos: string;
   sPPFinishPos: string;

   sPPOfficialSpeedRating: string;

   sTSNRunStyle: string;
   sEarlySpeedPoints: string;

   iFLD_EARLY_PACE_POS: integer;
   iFLD_EARLY_PACE: integer;
   iFLD_MIDDLE_PACE_POS: integer;
   iFLD_MIDDLE_PACE: integer;
   iFLD_LATE_PACE_POS: integer;
   iFLD_LATE_PACE: integer;
   iFLD_SPD: integer;
   iFLD_CLASS: integer;
   iFLD_RACE_CLASS: integer;

   iFLD_FINISH_PACE_POS: integer;

   iEndLoop: integer;
   iIdxPP: integer;

   fEarlyPacePosH: double;
   fMiddlePacePosH: double;
   fLatePacePosH: double;
   fEarlyPacePosO: double;
   fMiddlePacePosO: double;
   fLatePacePosO: double;
   fFinishPacePosH: double;

   aEarlyPacePosH: array of double;
   aMiddlePacePosH: array of double;
   aLatePacePosH: array of double;
   aEarlyPacePosO: array of double;
   aMiddlePacePosO: array of double;
   aLatePacePosO: array of double;
   aFinishPacePosH: array of double;

   fEarlyPaceH: double;
   fMiddlePaceH: double;
   fLatePaceH: double;

   fEarlyPaceO: double;
   fMiddlePaceO: double;
   fLatePaceO: double;

   aEarlyPaceH: array of double;
   aMiddlePaceH: array of double;
   aLatePaceH: array of double;

   iEarlyPacePosLines: integer;
   iMiddlePacePosLines: integer;
   iLatePacePosLines: integer;
   iFinishPacePosLines: integer;

   iEarlyPaceLines: integer;
   iMiddlePaceLines: integer;
   iLatePaceLines: integer;

   fEarlyPacePos: double;
   fMiddlePacePos: double;
   fLatePacePos: double;
   fFinishPacePos: double;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   fBackClass: double;

   iFLD_TCAT: integer;
   iFLD_TSTS: integer;
   iFLD_TWIN: integer;
   iFLD_TITM: integer;
   iFLD_TROI: integer;

   iIdxKeyTrn: integer;

   sKeyTrnCategory: string;
   iKeyTrnStart: integer;
   fKeyTrnWinPct: double;
   fKeyTrnITMPct: double;
   fKeyTrnROI: double;

   fTrainerStsCY: double;
   fTrainerWinsCY: double;
   fTrainerPlacesCY: double;
   fTrainerShowsCY: double;
   fTrainerROICY: double;

   fTrainerStsPY: double;
   fTrainerWinsPY: double;
   fTrainerPlacesPY: double;
   fTrainerShowsPY: double;
   fTrainerROIPY: double;

   fJockeyStsCY: double;
   fJockeyWinsCY: double;
   fJockeyPlacesCY: double;
   fJockeyShowsCY: double;
   fJockeyROICY: double;

   fJockeyStsPY: double;
   fJockeyWinsPY: double;
   fJockeyPlacesPY: double;
   fJockeyShowsPY: double;
   fJockeyROIPY: double;

   fTotalJkyStarts: double;
   fTotalJkyWins: double;
   fTotalJkyWinPct: double;

   fTotalTrnStarts: double;
   fTotalTrnWins: double;
   fTotalTrnWinPct: double;

   sDirtPedigreeRating: string;
   sMudPedigreeRating: string;
   sTurfPedigreeRating: string;
   sDistPedigreeRating: string;

   fTrainerStsCurrentMeet: double;
   fTrainerWinsCurrentMeet: double;
   fTrainerWinPctCurrentMeet: double;
   fTrainerPlacesCurrentMeet: double;
   fTrainerShowsCureentMeet: double;

   fJockeyStsCurrentMeet: double;
   fJockeyWinsCurrentMeet: double;
   fJockeyWinPctCurrentMeet: double;
   fJockeyPlacesCurrentMeet: double;
   fJockeyShowsCurrentMeet: double;

   iSireTurfLastYearRank: integer;
   iSireGeneralLastYearRank: integer;
   iSireJuvenileLastYearRank: integer;

   iSireTurfThisYearRank: integer;
   iSireGeneralThisYearRank: integer;
   iSireJuvenileThisYearRank: integer;

   fClassRating: double;
   fTurfRating: double;
   fMudRating: double;

   iAge: integer;

   sTodaysRaceClassification: string;
   sRaceConditions: string;
   sTodaysMutuelList: string;
   sWagerTypes: string;
   sPostTimes: string;

   b10CentSuperfectaRace: boolean;
   b50CentTrifectaRace: boolean;
   b50CentPk3Race: boolean;
   b50CentPk4Race: boolean;

   wYear, wMonth, wDay, wHour, wMin, wSec, wMSec: Word;

   sAMPM: string;

strack                              : string;                    //      1
sraceDate                           : string;                    //      2
sraceNum                            : string;                    //      3
spostPosition                       : string;                    //      4
sentry                              : string;                    //      5
sdistanceYards                      : string;                    //      6
ssurface                            : string;                    //      7
sreserved1                          : string;                    //      8
sraceType                           : string;                    //      9
sageSexRestriction                  : string;                    //     10
stdyRaceClassification              : string;                    //     11
spurse                              : string;                    //     12
sclaimingPrice                      : string;                    //     13
shorseClaimingPrice                 : string;                    //     14
strackRecord                        : string;                    //     15
sraceConditions                     : string;                    //     16
stdyLasixList                       : string;                    //     17
stdyButeList                        : string;                    //     18
stdyCoupledList                     : string;                    //     19
stdyMutelList                       : string;                    //     20
ssimHostTrackCode                   : string;                    //     21
ssimHostTrackRaceNum                : string;                    //     22
sbreedType                          : string;                    //     23
stdyNasalStripChange                : string;                    //     24
sreserved2                          : string;                    //     25
sTodaysAllWeather                   : string;                    //     26
sreserved4                          : string;                    //     27
stdyTrainer                         : string;                    //     28
strainerStats                       : string;                    //     29
strainerWins                        : string;                    //     30
strainerPlaces                      : string;                    //     31
strainerShows                       : string;                    //     32
stdyJockey                          : string;                    //     33
sapprenticeWgtallow                 : string;                    //     34
sjockeySts                          : string;                    //     35
sjockeyWins                         : string;                    //     36
sjockeyPlaces                       : string;                    //     37
sjockeyShows                        : string;                    //     38
stdyOwner                           : string;                    //     39
sownerSilks                         : string;                    //     40
sMTO_AE                             : string;                    //     41
sreserved5                          : string;                    //     42
sprogramNumber                      : string;                    //     43
smorningLine                        : string;                    //     44
shorseName                          : string;                    //     45
syearOfBirth                        : string;                    //     46
sfoalingMonth                       : string;                    //     47
sreserved6                          : string;                    //     48
ssex                                : string;                    //     49
shorseColor                         : string;                    //     50
sweight                             : string;                    //     51
ssire                               : string;                    //     52
ssireSire                           : string;                    //     53
sdam                                : string;                    //     54
sdamsSire                           : string;                    //     55
sbreeder                            : string;                    //     56
sbredState                          : string;                    //     57
sprogramPostPosition                : string;                    //     58
sreserved7                          : string;                    //     59
sreserved8                          : string;                    //     60
sreserved9                          : string;                    //     61
stodaysMeds1                        : string;                    //     62
stodaysMeds2                        : string;                    //     63
sequipmentChange                    : string;                    //     64
sdistStarts                         : string;                    //     65
sdistWins                           : string;                    //     66
sdistPlaces                         : string;                    //     67
sdistShows                          : string;                    //     68
sdistEarnings                       : string;                    //     69
strackStarts                        : string;                    //     70
strackWins                          : string;                    //     71
strackPlaces                        : string;                    //     72
strackShows                         : string;                    //     73
strackEarnings                      : string;                    //     74
sturfStarts                         : string;                    //     75
sturfWins                           : string;                    //     76
sturfPlaces                         : string;                    //     77
sturfShows                          : string;                    //     78
sturfEarnings                       : string;                    //     79
swetStarts                          : string;                    //     80
swetWins                            : string;                    //     81
swetPlaces                          : string;                    //     82
swetShows                           : string;                    //     83
swetEarnings                        : string;                    //     84
scurYear                            : string;                    //     85
scurStarts                          : string;                    //     86
scurWins                            : string;                    //     87
scurPlaces                          : string;                    //     88
scurShows                           : string;                    //     89
scurEarnings                        : string;                    //     90
sprevYear                           : string;                    //     91
sprevStarts                         : string;                    //     92
sprevWins                           : string;                    //     93
sprevPlaces                         : string;                    //     94
sprevShows                          : string;                    //     95
sprevEarnings                       : string;                    //     96
slifeStarts                         : string;                    //     97
slifeWins                           : string;                    //     98
slifePlaces                         : string;                    //     99
slifeShows                          : string;                    //    100
slifeEarnings                       : string;                    //    101
sdateWorkout1                       : string;                    //    102
sdateWorkout2                       : string;                    //    103
sdateWorkout3                       : string;                    //    104
sdateWorkout4                       : string;                    //    105
sdateWorkout5                       : string;                    //    106
sdateWorkout6                       : string;                    //    107
sdateWorkout7                       : string;                    //    108
sdateWorkout8                       : string;                    //    109
sdateWorkout9                       : string;                    //    110
sdateWorkout10                      : string;                    //    111
sdateWorkout11                      : string;                    //    112
sdateWorkout12                      : string;                    //    113
stimeWorkout1                       : string;                    //    114
stimeWorkout2                       : string;                    //    115
stimeWorkout3                       : string;                    //    116
stimeWorkout4                       : string;                    //    117
stimeWorkout5                       : string;                    //    118
stimeWorkout6                       : string;                    //    119
stimeWorkout7                       : string;                    //    120
stimeWorkout8                       : string;                    //    121
stimeWorkout9                       : string;                    //    122
stimeWorkout10                      : string;                    //    123
stimeWorkout11                      : string;                    //    124
stimeWorkout12                      : string;                    //    125
strackWorkout1                      : string;                    //    126
strackWorkout2                      : string;                    //    127
strackWorkout3                      : string;                    //    128
strackWorkout4                      : string;                    //    129
strackWorkout5                      : string;                    //    130
strackWorkout6                      : string;                    //    131
strackWorkout7                      : string;                    //    132
strackWorkout8                      : string;                    //    133
strackWorkout9                      : string;                    //    134
strackWorkout10                     : string;                    //    135
strackWorkout11                     : string;                    //    136
strackWorkout12                     : string;                    //    137
sdistanceWorkout1                   : string;                    //    138
sdistanceWorkout2                   : string;                    //    139
sdistanceWorkout3                   : string;                    //    140
sdistanceWorkout4                   : string;                    //    141
sdistanceWorkout5                   : string;                    //    142
sdistanceWorkout6                   : string;                    //    143
sdistanceWorkout7                   : string;                    //    144
sdistanceWorkout8                   : string;                    //    145
sdistanceWorkout9                   : string;                    //    146
sdistanceWorkout10                  : string;                    //    147
sdistanceWorkout11                  : string;                    //    148
sdistanceWorkout12                  : string;                    //    149
sconditionWorkout1                  : string;                    //    150
sconditionWorkout2                  : string;                    //    151
sconditionWorkout3                  : string;                    //    152
sconditionWorkout4                  : string;                    //    153
sconditionWorkout5                  : string;                    //    154
sconditionWorkout6                  : string;                    //    155
sconditionWorkout7                  : string;                    //    156
sconditionWorkout8                  : string;                    //    157
sconditionWorkout9                  : string;                    //    158
sconditionWorkout10                 : string;                    //    159
sconditionWorkout11                 : string;                    //    160
sconditionWorkout12                 : string;                    //    161
sdescribeWorkout1                   : string;                    //    162
sdescribeWorkout2                   : string;                    //    163
sdescribeWorkout3                   : string;                    //    164
sdescribeWorkout4                   : string;                    //    165
sdescribeWorkout5                   : string;                    //    166
sdescribeWorkout6                   : string;                    //    167
sdescribeWorkout7                   : string;                    //    168
sdescribeWorkout8                   : string;                    //    169
sdescribeWorkout9                   : string;                    //    170
sdescribeWorkout10                  : string;                    //    171
sdescribeWorkout11                  : string;                    //    172
sdescribeWorkout12                  : string;                    //    173
sinnerIndicateWorkout1              : string;                    //    174
sinnerIndicateWorkout2              : string;                    //    175
sinnerIndicateWorkout3              : string;                    //    176
sinnerIndicateWorkout4              : string;                    //    177
sinnerIndicateWorkout5              : string;                    //    178
sinnerIndicateWorkout6              : string;                    //    179
sinnerIndicateWorkout7              : string;                    //    180
sinnerIndicateWorkout8              : string;                    //    181
sinnerIndicateWorkout9              : string;                    //    182
sinnerIndicateWorkout10             : string;                    //    183
sinnerIndicateWorkout11             : string;                    //    184
sinnerIndicateWorkout12             : string;                    //    185
snumWorksWorkout1                   : string;                    //    186
snumWorksWorkout2                   : string;                    //    187
snumWorksWorkout3                   : string;                    //    188
snumWorksWorkout4                   : string;                    //    189
snumWorksWorkout5                   : string;                    //    190
snumWorksWorkout6                   : string;                    //    191
snumWorksWorkout7                   : string;                    //    192
snumWorksWorkout8                   : string;                    //    193
snumWorksWorkout9                   : string;                    //    194
snumWorksWorkout10                  : string;                    //    195
snumWorksWorkout11                  : string;                    //    196
snumWorksWorkout12                  : string;                    //    197
srankWorkout1                       : string;                    //    198
srankWorkout2                       : string;                    //    199
srankWorkout3                       : string;                    //    200
srankWorkout4                       : string;                    //    201
srankWorkout5                       : string;                    //    202
srankWorkout6                       : string;                    //    203
srankWorkout7                       : string;                    //    204
srankWorkout8                       : string;                    //    205
srankWorkout9                       : string;                    //    206
srankWorkout10                      : string;                    //    207
srankWorkout12                      : string;                    //    208
srankWorkout12                      : string;                    //    209
sBrisRunStyle                       : string;                    //    210
sQuirin                             : string;                    //    211
sreserved20                         : string;                    //    212
sreserved22                         : string;                    //    213
stwoFBrisPaceParForLevel            : string;                    //    214
sfourFBrisPaceParForLevel           : string;                    //    215
ssizFBrisPaceParForLevel            : string;                    //    216
sBrisSpeedParForClassLevel          : string;                    //    217
sBrisLatePaceParForLevel            : string;                    //    218
sreserved22                         : string;                    //    219
sreserved23                         : string;                    //    220
sreserved24                         : string;                    //    221
sreserved25                         : string;                    //    222
sreserved26                         : string;                    //    223
sdaysSinceLastRace                  : string;                    //    224
sdrfRaceCondition2                  : string;                    //    225
sdrfRaceCondition2                  : string;                    //    226
sdrfRaceCondition3                  : string;                    //    227
sdrfRaceCondition4                  : string;                    //    228
sdrfRaceCondition5                  : string;                    //    229
sdrfRaceCondition6                  : string;                    //    230
sreserved27                         : string;                    //    231
sreserved28                         : string;                    //    232
sreserved29                         : string;                    //    233
sreserved30                         : string;                    //    234
sreserved32                         : string;                    //    235
sreserved32                         : string;                    //    236
sreserved33                         : string;                    //    237
sreserved34                         : string;                    //    238
sreserved35                         : string;                    //    239
swagerTypes2                        : string;                    //    240
swagerTypes2                        : string;                    //    241
swagerTypes3                        : string;                    //    242
swagerTypes4                        : string;                    //    243
swagerTypes5                        : string;                    //    244
swagerTypes6                        : string;                    //    245
swagerTypes7                        : string;                    //    246
swagerTypes8                        : string;                    //    247
swagerTypes9                        : string;                    //    248
sreserved26                         : string;                    //    249
sreserved27                         : string;                    //    250
sBrisPrimePowerRating               : string;                    //    251
sreserved28                         : string;                    //    252
sreserved29                         : string;                    //    253
sreserved30                         : string;                    //    254
sreserved32                         : string;                    //    255
sppRaceDate2                        : string;                    //    256
sppRaceDate2                        : string;                    //    257
sppRaceDate3                        : string;                    //    258
sppRaceDate4                        : string;                    //    259
sppRaceDate5                        : string;                    //    260
sppRaceDate6                        : string;                    //    261
sppRaceDate7                        : string;                    //    262
sppRaceDate8                        : string;                    //    263
sppRaceDate9                        : string;                    //    264
sppRaceDate10                       : string;                    //    265
sppDaysPrev2                        : string;                    //    266
sppDaysPrev2                        : string;                    //    267
sppDaysPrev3                        : string;                    //    268
sppDaysPrev4                        : string;                    //    269
sppDaysPrev5                        : string;                    //    270
sppDaysPrev6                        : string;                    //    271
sppDaysPrev7                        : string;                    //    272
sppDaysPrev8                        : string;                    //    273
sppDaysPrev9                        : string;                    //    274
sppDaysPrev10                       : string;                    //    275
sppTrackCode2                       : string;                    //    276
sppTrackCode2                       : string;                    //    277
sppTrackCode3                       : string;                    //    278
sppTrackCode4                       : string;                    //    279
sppTrackCode5                       : string;                    //    280
sppTrackCode6                       : string;                    //    281
sppTrackCode7                       : string;                    //    282
sppTrackCode8                       : string;                    //    283
sppTrackCode9                       : string;                    //    284
sppTrackCode10                      : string;                    //    285
sppBrisTrackCode2                   : string;                    //    286
sppBrisTrackCode2                   : string;                    //    287
sppBrisTrackCode3                   : string;                    //    288
sppBrisTrackCode4                   : string;                    //    289
sppBrisTrackCode5                   : string;                    //    290
sppBrisTrackCode6                   : string;                    //    291
sppBrisTrackCode7                   : string;                    //    292
sppBrisTrackCode8                   : string;                    //    293
sppBrisTrackCode9                   : string;                    //    294
sppBrisTrackCode10                  : string;                    //    295
sppRaceNum2                         : string;                    //    296
sppRaceNum2                         : string;                    //    297
sppRaceNum3                         : string;                    //    298
sppRaceNum4                         : string;                    //    299
sppRaceNum5                         : string;                    //    300
sppRaceNum6                         : string;                    //    301
sppRaceNum7                         : string;                    //    302
sppRaceNum8                         : string;                    //    303
sppRaceNum9                         : string;                    //    304
sppRaceNum10                        : string;                    //    305
sppTrackCond2                       : string;                    //    306
sppTrackCond2                       : string;                    //    307
sppTrackCond3                       : string;                    //    308
sppTrackCond4                       : string;                    //    309
sppTrackCond5                       : string;                    //    310
sppTrackCond6                       : string;                    //    311
sppTrackCond7                       : string;                    //    312
sppTrackCond8                       : string;                    //    313
sppTrackCond9                       : string;                    //    314
sppTrackCond10                      : string;                    //    315
sppDistanceYards2                   : string;                    //    316
sppDistanceYards2                   : string;                    //    317
sppDistanceYards3                   : string;                    //    318
sppDistanceYards4                   : string;                    //    319
sppDistanceYards5                   : string;                    //    320
sppDistanceYards6                   : string;                    //    321
sppDistanceYards7                   : string;                    //    322
sppDistanceYards8                   : string;                    //    323
sppDistanceYards9                   : string;                    //    324
sppDistanceYards10                  : string;                    //    325
sppSurface2                         : string;                    //    326
sppSurface2                         : string;                    //    327
sppSurface3                         : string;                    //    328
sppSurface4                         : string;                    //    329
sppSurface5                         : string;                    //    330
sppSurface6                         : string;                    //    331
sppSurface7                         : string;                    //    332
sppSurface8                         : string;                    //    333
sppSurface9                         : string;                    //    334
sppSurface20                        : string;                    //    335
sppSpecialChute2                    : string;                    //    336
sppSpecialChute2                    : string;                    //    337
sppSpecialChute3                    : string;                    //    338
sppSpecialChute4                    : string;                    //    339
sppSpecialChute5                    : string;                    //    340
sppSpecialChute6                    : string;                    //    341
sppSpecialChute7                    : string;                    //    342
sppSpecialChute8                    : string;                    //    343
sppSpecialChute9                    : string;                    //    344
sppSpecialChute10                   : string;                    //    345
sppNumEntrants2                     : string;                    //    346
sppNumEntrants2                     : string;                    //    347
sppNumEntrants3                     : string;                    //    348
sppNumEntrants4                     : string;                    //    349
sppNumEntrants5                     : string;                    //    350
sppNumEntrants6                     : string;                    //    352
sppNumEntrants7                     : string;                    //    352
sppNumEntrants8                     : string;                    //    353
sppNumEntrants9                     : string;                    //    354
sppNumEntrants20                    : string;                    //    355
sppPostPosition2                    : string;                    //    356
sppPostPosition2                    : string;                    //    357
sppPostPosition3                    : string;                    //    358
sppPostPosition4                    : string;                    //    359
sppPostPosition5                    : string;                    //    360
sppPostPosition6                    : string;                    //    362
sppPostPosition7                    : string;                    //    362
sppPostPosition8                    : string;                    //    363
sppPostPosition9                    : string;                    //    364
sppPostPosition10                   : string;                    //    365
sppEquipment2                       : string;                    //    366
sppEquipment2                       : string;                    //    367
sppEquipment3                       : string;                    //    368
sppEquipment4                       : string;                    //    369
sppEquipment5                       : string;                    //    370
sppEquipment6                       : string;                    //    372
sppEquipment7                       : string;                    //    372
sppEquipment8                       : string;                    //    373
sppEquipment9                       : string;                    //    374
sppEquipment10                      : string;                    //    375
sppReserved2_2                      : string;                    //    376
sppReserved2_2                      : string;                    //    377
sppReserved2_3                      : string;                    //    378
sppReserved2_4                      : string;                    //    379
sppReserved2_5                      : string;                    //    380
sppReserved2_6                      : string;                    //    382
sppReserved2_7                      : string;                    //    382
sppReserved2_8                      : string;                    //    383
sppReserved2_9                      : string;                    //    384
sppReserved2_10                     : string;                    //    385
sppMeds2                            : string;                    //    386
sppMeds2                            : string;                    //    387
sppMeds3                            : string;                    //    388
sppMeds4                            : string;                    //    389
sppMeds5                            : string;                    //    390
sppMeds6                            : string;                    //    392
sppMeds7                            : string;                    //    392
sppMeds8                            : string;                    //    393
sppMeds9                            : string;                    //    394
sppMeds20                           : string;                    //    395
sppTripComment1                     : string;                    //    396
sppTripComment2                     : string;                    //    397
sppTripComment3                     : string;                    //    398
sppTripComment4                     : string;                    //    399
sppTripComment5                     : string;                    //    400
sppTripComment6                     : string;                    //    401
sppTripComment7                     : string;                    //    402
sppTripComment8                     : string;                    //    403
sppTripComment9                     : string;                    //    404
sppTripComment10                    : string;                    //    405
sppWinnersName2                     : string;                    //    406
sppWinnersName2                     : string;                    //    407
sppWinnersName3                     : string;                    //    408
sppWinnersName4                     : string;                    //    409
sppWinnersName5                     : string;                    //    410
sppWinnersName6                     : string;                    //    411
sppWinnersName7                     : string;                    //    412
sppWinnersName8                     : string;                    //    413
sppWinnersName9                     : string;                    //    414
sppWinnersName10                    : string;                    //    415
spp2ndPlaceName2                    : string;                    //    416
spp2ndPlaceName2                    : string;                    //    417
spp2ndPlaceName3                    : string;                    //    418
spp2ndPlaceName4                    : string;                    //    419
spp2ndPlaceName5                    : string;                    //    420
spp2ndPlaceName6                    : string;                    //    421
spp2ndPlaceName7                    : string;                    //    422
spp2ndPlaceName8                    : string;                    //    423
spp2ndPlaceName9                    : string;                    //    424
spp2ndPlaceName10                   : string;                    //    425
spp3rdPlaceName2                    : string;                    //    426
spp3rdPlaceName2                    : string;                    //    427
spp3rdPlaceName3                    : string;                    //    428
spp3rdPlaceName4                    : string;                    //    429
spp3rdPlaceName5                    : string;                    //    430
spp3rdPlaceName6                    : string;                    //    431
spp3rdPlaceName7                    : string;                    //    432
spp3rdPlaceName8                    : string;                    //    433
spp3rdPlaceName9                    : string;                    //    434
spp3rdPlaceName10                   : string;                    //    435
sppWinnersWeight2                   : string;                    //    436
sppWinnersWeight2                   : string;                    //    437
sppWinnersWeight3                   : string;                    //    438
sppWinnersWeight4                   : string;                    //    439
sppWinnersWeight5                   : string;                    //    440
sppWinnersWeight6                   : string;                    //    441
sppWinnersWeight7                   : string;                    //    442
sppWinnersWeight8                   : string;                    //    443
sppWinnersWeight9                   : string;                    //    444
sppWinnersWeight10                  : string;                    //    445
spp2ndPlaceWeight2                  : string;                    //    446
spp2ndPlaceWeight2                  : string;                    //    447
spp2ndPlaceWeight3                  : string;                    //    448
spp2ndPlaceWeight4                  : string;                    //    449
spp2ndPlaceWeight5                  : string;                    //    450
spp2ndPlaceWeight6                  : string;                    //    451
spp2ndPlaceWeight7                  : string;                    //    452
spp2ndPlaceWeight8                  : string;                    //    453
spp2ndPlaceWeight9                  : string;                    //    454
spp2ndPlaceWeight10                 : string;                    //    455
spp3rdPlaceWeight2                  : string;                    //    456
spp3rdPlaceWeight2                  : string;                    //    457
spp3rdPlaceWeight3                  : string;                    //    458
spp3rdPlaceWeight4                  : string;                    //    459
spp3rdPlaceWeight5                  : string;                    //    460
spp3rdPlaceWeight6                  : string;                    //    461
spp3rdPlaceWeight7                  : string;                    //    462
spp3rdPlaceWeight8                  : string;                    //    463
spp3rdPlaceWeight9                  : string;                    //    464
spp3rdPlaceWeight10                 : string;                    //    465
sppWinnersMargin2                   : string;                    //    466
sppWinnersMargin2                   : string;                    //    467
sppWinnersMargin3                   : string;                    //    468
sppWinnersMargin4                   : string;                    //    469
sppWinnersMargin5                   : string;                    //    470
sppWinnersMargin6                   : string;                    //    472
sppWinnersMargin7                   : string;                    //    472
sppWinnersMargin8                   : string;                    //    473
sppWinnersMargin9                   : string;                    //    474
sppWinnersMargin20                  : string;                    //    475
spp2ndPlaceMargin2                  : string;                    //    476
spp2ndPlaceMargin2                  : string;                    //    477
spp2ndPlaceMargin3                  : string;                    //    478
spp2ndPlaceMargin4                  : string;                    //    479
spp2ndPlaceMargin5                  : string;                    //    480
spp2ndPlaceMargin6                  : string;                    //    481
spp2ndPlaceMargin7                  : string;                    //    482
spp2ndPlaceMargin8                  : string;                    //    483
spp2ndPlaceMargin9                  : string;                    //    484
spp2ndPlaceMargin10                 : string;                    //    485
spp3rdPlaceMargin2                  : string;                    //    486
spp3rdPlaceMargin2                  : string;                    //    487
spp3rdPlaceMargin3                  : string;                    //    488
spp3rdPlaceMargin4                  : string;                    //    489
spp3rdPlaceMargin5                  : string;                    //    490
spp3rdPlaceMargin6                  : string;                    //    492
spp3rdPlaceMargin7                  : string;                    //    492
spp3rdPlaceMargin8                  : string;                    //    493
spp3rdPlaceMargin9                  : string;                    //    494
spp3rdPlaceMargin10                 : string;                    //    495
sppExtraComment1                    : string;                    //    496
sppExtraComment2                    : string;                    //    497
sppExtraComment3                    : string;                    //    498
sppExtraComment4                    : string;                    //    499
sppExtraComment5                    : string;                    //    500
sppExtraComment6                    : string;                    //    501
sppExtraComment7                    : string;                    //    502
sppExtraComment8                    : string;                    //    503
sppExtraComment9                    : string;                    //    504
sppExtraComment10                   : string;                    //    505
sppWeight2                          : string;                    //    506
sppWeight2                          : string;                    //    507
sppWeight3                          : string;                    //    508
sppWeight4                          : string;                    //    509
sppWeight5                          : string;                    //    510
sppWeight6                          : string;                    //    511
sppWeight7                          : string;                    //    512
sppWeight8                          : string;                    //    513
sppWeight9                          : string;                    //    514
sppWeight20                         : string;                    //    515
sppOdds2                            : string;                    //    516
sppOdds2                            : string;                    //    517
sppOdds3                            : string;                    //    518
sppOdds4                            : string;                    //    519
sppOdds5                            : string;                    //    520
sppOdds6                            : string;                    //    521
sppOdds7                            : string;                    //    522
sppOdds8                            : string;                    //    523
sppOdds9                            : string;                    //    524
sppOdds20                           : string;                    //    525
sppEntry2                           : string;                    //    526
sppEntry2                           : string;                    //    527
sppEntry3                           : string;                    //    528
sppEntry4                           : string;                    //    529
sppEntry5                           : string;                    //    510
sppEntry6                           : string;                    //    531
sppEntry7                           : string;                    //    532
sppEntry8                           : string;                    //    533
sppEntry9                           : string;                    //    534
sppEntry20                          : string;                    //    535
sppRaceClassification1              : string;                    //    536
sppRaceClassification2              : string;                    //    537
sppRaceClassification3              : string;                    //    538
sppRaceClassification4              : string;                    //    539
sppRaceClassification5              : string;                    //    540
sppRaceClassification6              : string;                    //    541
sppRaceClassification7              : string;                    //    542
sppRaceClassification8              : string;                    //    543
sppRaceClassification9              : string;                    //    544
sppRaceClassification10             : string;                    //    545
sppClaimingPriceHorse2              : string;                    //    546
sppClaimingPriceHorse2              : string;                    //    547
sppClaimingPriceHorse3              : string;                    //    548
sppClaimingPriceHorse4              : string;                    //    549
sppClaimingPriceHorse5              : string;                    //    550
sppClaimingPriceHorse6              : string;                    //    551
sppClaimingPriceHorse7              : string;                    //    552
sppClaimingPriceHorse8              : string;                    //    553
sppClaimingPriceHorse9              : string;                    //    554
sppClaimingPriceHorse10             : string;                    //    555
sppPurse1                           : string;                    //    556
sppPurse2                           : string;                    //    557
sppPurse3                           : string;                    //    558
sppPurse4                           : string;                    //    559
sppPurse5                           : string;                    //    560
sppPurse6                           : string;                    //    561
sppPurse7                           : string;                    //    562
sppPurse8                           : string;                    //    563
sppPurse9                           : string;                    //    564
sppPurse10                          : string;                    //    565
sppStartingCallPos1                 : string;                    //    566
sppStartingCallPos2                 : string;                    //    567
sppStartingCallPos3                 : string;                    //    568
sppStartingCallPos4                 : string;                    //    569
sppStartingCallPos5                 : string;                    //    570
sppStartingCallPos6                 : string;                    //    571
sppStartingCallPos7                 : string;                    //    572
sppStartingCallPos8                 : string;                    //    573
sppStartingCallPos9                 : string;                    //    574
sppStartingCallPos10                : string;                    //    575
sppFirstCallPos1                    : string;                    //    576
sppFirstCallPos2                    : string;                    //    577
sppFirstCallPos3                    : string;                    //    578
sppFirstCallPos4                    : string;                    //    579
sppFirstCallPos5                    : string;                    //    580
sppFirstCallPos6                    : string;                    //    581
sppFirstCallPos7                    : string;                    //    582
sppFirstCallPos8                    : string;                    //    583
sppFirstCallPos9                    : string;                    //    584
sppFirstCallPos10                   : string;                    //    585
sppSecondCallPos2                   : string;                    //    586
sppSecondCallPos2                   : string;                    //    587
sppSecondCallPos3                   : string;                    //    588
sppSecondCallPos4                   : string;                    //    589
sppSecondCallPos5                   : string;                    //    590
sppSecondCallPos6                   : string;                    //    591
sppSecondCallPos7                   : string;                    //    592
sppSecondCallPos8                   : string;                    //    593
sppSecondCallPos9                   : string;                    //    594
sppSecondCallPos10                  : string;                    //    595
sppReserved3_1                      : string;                    //    596
sppReserved3_2                      : string;                    //    597
sppReserved3_3                      : string;                    //    598
sppReserved3_4                      : string;                    //    599
sppReserved3_5                      : string;                    //    600
sppReserved3_6                      : string;                    //    601
sppReserved3_7                      : string;                    //    602
sppReserved3_8                      : string;                    //    603
sppReserved3_9                      : string;                    //    604
sppReserved3_10                     : string;                    //    605
sppStretchPos1                      : string;                    //    606
sppStretchPos2                      : string;                    //    607
sppStretchPos3                      : string;                    //    608
sppStretchPos4                      : string;                    //    609
sppStretchPos5                      : string;                    //    610
sppStretchPos6                      : string;                    //    611
sppStretchPos7                      : string;                    //    612
sppStretchPos8                      : string;                    //    613
sppStretchPos9                      : string;                    //    614
sppStretchPos10                     : string;                    //    615
sppFinishPos1                       : string;                    //    616
sppFinishPos2                       : string;                    //    617
sppFinishPos3                       : string;                    //    618
sppFinishPos4                       : string;                    //    619
sppFinishPos5                       : string;                    //    620
sppFinishPos6                       : string;                    //    621
sppFinishPos7                       : string;                    //    622
sppFinishPos8                       : string;                    //    623
sppFinishPos9                       : string;                    //    624
sppFinishPos10                      : string;                    //    625
sppMoneyPos1                        : string;                    //    626
sppMoneyPos2                        : string;                    //    627
sppMoneyPos3                        : string;                    //    628
sppMoneyPos4                        : string;                    //    629
sppMoneyPos5                        : string;                    //    610
sppMoneyPos6                        : string;                    //    631
sppMoneyPos7                        : string;                    //    632
sppMoneyPos8                        : string;                    //    633
sppMoneyPos9                        : string;                    //    634
sppMoneyPos10                       : string;                    //    635
sppStartCallBeatenMargin1           : string;                    //    636
sppStartCallBeatenMargin2           : string;                    //    637
sppStartCallBeatenMargin3           : string;                    //    638
sppStartCallBeatenMargin4           : string;                    //    639
sppStartCallBeatenMargin5           : string;                    //    640
sppStartCallBeatenMargin6           : string;                    //    641
sppStartCallBeatenMargin7           : string;                    //    642
sppStartCallBeatenMargin8           : string;                    //    643
sppStartCallBeatenMargin9           : string;                    //    644
sppStartCallBeatenMargin10          : string;                    //    645
sppStartCallBeaten1                 : string;                    //    646
sppStartCallBeaten2                 : string;                    //    647
sppStartCallBeaten3                 : string;                    //    648
sppStartCallBeaten4                 : string;                    //    649
sppStartCallBeaten5                 : string;                    //    650
sppStartCallBeaten6                 : string;                    //    651
sppStartCallBeaten7                 : string;                    //    652
sppStartCallBeaten8                 : string;                    //    653
sppStartCallBeaten9                 : string;                    //    654
sppStartCallBeaten20                : string;                    //    655
sppFirstCallBeatenMargin1           : string;                    //    656
sppFirstCallBeatenMargin2           : string;                    //    657
sppFirstCallBeatenMargin3           : string;                    //    658
sppFirstCallBeatenMargin4           : string;                    //    659
sppFirstCallBeatenMargin5           : string;                    //    660
sppFirstCallBeatenMargin6           : string;                    //    661
sppFirstCallBeatenMargin7           : string;                    //    662
sppFirstCallBeatenMargin8           : string;                    //    663
sppFirstCallBeatenMargin9           : string;                    //    664
sppFirstCallBeatenMargin10          : string;                    //    665
sppFirstCallBeaten2                 : string;                    //    666
sppFirstCallBeaten2                 : string;                    //    667
sppFirstCallBeaten3                 : string;                    //    668
sppFirstCallBeaten4                 : string;                    //    669
sppFirstCallBeaten5                 : string;                    //    670
sppFirstCallBeaten6                 : string;                    //    671
sppFirstCallBeaten7                 : string;                    //    672
sppFirstCallBeaten8                 : string;                    //    673
sppFirstCallBeaten9                 : string;                    //    674
sppFirstCallBeaten20                : string;                    //    675
sppSecondCallBeatenMargin2          : string;                    //    676
sppSecondCallBeatenMargin2          : string;                    //    677
sppSecondCallBeatenMargin3          : string;                    //    678
sppSecondCallBeatenMargin4          : string;                    //    679
sppSecondCallBeatenMargin5          : string;                    //    680
sppSecondCallBeatenMargin6          : string;                    //    681
sppSecondCallBeatenMargin7          : string;                    //    682
sppSecondCallBeatenMargin8          : string;                    //    683
sppSecondCallBeatenMargin9          : string;                    //    684
sppSecondCallBeatenMargin10         : string;                    //    685
sppSecondCallBeaten1                : string;                    //    686
sppSecondCallBeaten2                : string;                    //    687
sppSecondCallBeaten3                : string;                    //    688
sppSecondCallBeaten4                : string;                    //    689
sppSecondCallBeaten5                : string;                    //    690
sppSecondCallBeaten6                : string;                    //    691
sppSecondCallBeaten7                : string;                    //    692
sppSecondCallBeaten8                : string;                    //    693
sppSecondCallBeaten9                : string;                    //    694
sppSecondCallBeaten10               : string;                    //    695
sppRaceShape2ndCall1                : string;                    //    696
sppRaceShape2ndCall2                : string;                    //    697
sppRaceShape2ndCall3                : string;                    //    698
sppRaceShape2ndCall4                : string;                    //    699
sppRaceShape2ndCall5                : string;                    //    700
sppRaceShape2ndCall6                : string;                    //    701
sppRaceShape2ndCall7                : string;                    //    702
sppRaceShape2ndCall8                : string;                    //    703
sppRaceShape2ndCall9                : string;                    //    704
sppRaceShape2ndCall10               : string;                    //    705
sppReserved5_2                      : string;                    //    706
sppReserved5_2                      : string;                    //    707
sppReserved5_3                      : string;                    //    708
sppReserved5_4                      : string;                    //    709
sppReserved5_5                      : string;                    //    710
sppReserved5_6                      : string;                    //    711
sppReserved5_7                      : string;                    //    712
sppReserved5_8                      : string;                    //    713
sppReserved5_9                      : string;                    //    714
sppReserved5_20                     : string;                    //    715
sppStretchBeatenMargin1             : string;                    //    716
sppStretchBeatenMargin2             : string;                    //    717
sppStretchBeatenMargin3             : string;                    //    718
sppStretchBeatenMargin4             : string;                    //    719
sppStretchBeatenMargin5             : string;                    //    720
sppStretchBeatenMargin6             : string;                    //    721
sppStretchBeatenMargin7             : string;                    //    722
sppStretchBeatenMargin8             : string;                    //    723
sppStretchBeatenMargin9             : string;                    //    724
sppStretchBeatenMargin10            : string;                    //    725
strack                              := StringListTrim(lstS[    1 - 1]);
sraceDate                           := StringListTrim(lstS[    2 - 1]);
sraceNum                            := StringListTrim(lstS[    3 - 1]);
spostPosition                       := StringListTrim(lstS[    4 - 1]);
sentry                              := StringListTrim(lstS[    5 - 1]);
sdistanceYards                      := StringListTrim(lstS[    6 - 1]);
ssurface                            := StringListTrim(lstS[    7 - 1]);
sreserved1                          := StringListTrim(lstS[    8 - 1]);
sraceType                           := StringListTrim(lstS[    9 - 1]);
sageSexRestriction                  := StringListTrim(lstS[   10 - 1]);
stdyRaceClassification              := StringListTrim(lstS[   11 - 1]);
spurse                              := StringListTrim(lstS[   12 - 1]);
sclaimingPrice                      := StringListTrim(lstS[   13 - 1]);
shorseClaimingPrice                 := StringListTrim(lstS[   14 - 1]);
strackRecord                        := StringListTrim(lstS[   15 - 1]);
sraceConditions                     := StringListTrim(lstS[   16 - 1]);
stdyLasixList                       := StringListTrim(lstS[   17 - 1]);
stdyButeList                        := StringListTrim(lstS[   18 - 1]);
stdyCoupledList                     := StringListTrim(lstS[   19 - 1]);
stdyMutelList                       := StringListTrim(lstS[   20 - 1]);
ssimHostTrackCode                   := StringListTrim(lstS[   21 - 1]);
ssimHostTrackRaceNum                := StringListTrim(lstS[   22 - 1]);
sbreedType                          := StringListTrim(lstS[   23 - 1]);
stdyNasalStripChange                := StringListTrim(lstS[   24 - 1]);
sreserved2                          := StringListTrim(lstS[   25 - 1]);
sTodaysAllWeather                   := StringListTrim(lstS[   26 - 1]);
sreserved4                          := StringListTrim(lstS[   27 - 1]);
stdyTrainer                         := StringListTrim(lstS[   28 - 1]);
strainerStats                       := StringListTrim(lstS[   29 - 1]);
strainerWins                        := StringListTrim(lstS[   30 - 1]);
strainerPlaces                      := StringListTrim(lstS[   31 - 1]);
strainerShows                       := StringListTrim(lstS[   32 - 1]);
stdyJockey                          := StringListTrim(lstS[   33 - 1]);
sapprenticeWgtallow                 := StringListTrim(lstS[   34 - 1]);
sjockeySts                          := StringListTrim(lstS[   35 - 1]);
sjockeyWins                         := StringListTrim(lstS[   36 - 1]);
sjockeyPlaces                       := StringListTrim(lstS[   37 - 1]);
sjockeyShows                        := StringListTrim(lstS[   38 - 1]);
stdyOwner                           := StringListTrim(lstS[   39 - 1]);
sownerSilks                         := StringListTrim(lstS[   40 - 1]);
sMTO_AE                             := StringListTrim(lstS[   41 - 1]);
sreserved5                          := StringListTrim(lstS[   42 - 1]);
sprogramNumber                      := StringListTrim(lstS[   43 - 1]);
smorningLine                        := StringListTrim(lstS[   44 - 1]);
shorseName                          := StringListTrim(lstS[   45 - 1]);
syearOfBirth                        := StringListTrim(lstS[   46 - 1]);
sfoalingMonth                       := StringListTrim(lstS[   47 - 1]);
sreserved6                          := StringListTrim(lstS[   48 - 1]);
ssex                                := StringListTrim(lstS[   49 - 1]);
shorseColor                         := StringListTrim(lstS[   50 - 1]);
sweight                             := StringListTrim(lstS[   51 - 1]);
ssire                               := StringListTrim(lstS[   52 - 1]);
ssireSire                           := StringListTrim(lstS[   53 - 1]);
sdam                                := StringListTrim(lstS[   54 - 1]);
sdamsSire                           := StringListTrim(lstS[   55 - 1]);
sbreeder                            := StringListTrim(lstS[   56 - 1]);
sbredState                          := StringListTrim(lstS[   57 - 1]);
sprogramPostPosition                := StringListTrim(lstS[   58 - 1]);
sreserved7                          := StringListTrim(lstS[   59 - 1]);
sreserved8                          := StringListTrim(lstS[   60 - 1]);
sreserved9                          := StringListTrim(lstS[   61 - 1]);
stodaysMeds1                        := StringListTrim(lstS[   62 - 1]);
stodaysMeds2                        := StringListTrim(lstS[   63 - 1]);
sequipmentChange                    := StringListTrim(lstS[   64 - 1]);
sdistStarts                         := StringListTrim(lstS[   65 - 1]);
sdistWins                           := StringListTrim(lstS[   66 - 1]);
sdistPlaces                         := StringListTrim(lstS[   67 - 1]);
sdistShows                          := StringListTrim(lstS[   68 - 1]);
sdistEarnings                       := StringListTrim(lstS[   69 - 1]);
strackStarts                        := StringListTrim(lstS[   70 - 1]);
strackWins                          := StringListTrim(lstS[   71 - 1]);
strackPlaces                        := StringListTrim(lstS[   72 - 1]);
strackShows                         := StringListTrim(lstS[   73 - 1]);
strackEarnings                      := StringListTrim(lstS[   74 - 1]);
sturfStarts                         := StringListTrim(lstS[   75 - 1]);
sturfWins                           := StringListTrim(lstS[   76 - 1]);
sturfPlaces                         := StringListTrim(lstS[   77 - 1]);
sturfShows                          := StringListTrim(lstS[   78 - 1]);
sturfEarnings                       := StringListTrim(lstS[   79 - 1]);
swetStarts                          := StringListTrim(lstS[   80 - 1]);
swetWins                            := StringListTrim(lstS[   81 - 1]);
swetPlaces                          := StringListTrim(lstS[   82 - 1]);
swetShows                           := StringListTrim(lstS[   83 - 1]);
swetEarnings                        := StringListTrim(lstS[   84 - 1]);
scurYear                            := StringListTrim(lstS[   85 - 1]);
scurStarts                          := StringListTrim(lstS[   86 - 1]);
scurWins                            := StringListTrim(lstS[   87 - 1]);
scurPlaces                          := StringListTrim(lstS[   88 - 1]);
scurShows                           := StringListTrim(lstS[   89 - 1]);
scurEarnings                        := StringListTrim(lstS[   90 - 1]);
sprevYear                           := StringListTrim(lstS[   91 - 1]);
sprevStarts                         := StringListTrim(lstS[   92 - 1]);
sprevWins                           := StringListTrim(lstS[   93 - 1]);
sprevPlaces                         := StringListTrim(lstS[   94 - 1]);
sprevShows                          := StringListTrim(lstS[   95 - 1]);
sprevEarnings                       := StringListTrim(lstS[   96 - 1]);
slifeStarts                         := StringListTrim(lstS[   97 - 1]);
slifeWins                           := StringListTrim(lstS[   98 - 1]);
slifePlaces                         := StringListTrim(lstS[   99 - 1]);
slifeShows                          := StringListTrim(lstS[  100 - 1]);
slifeEarnings                       := StringListTrim(lstS[  101 - 1]);
sdateWorkout1                       := StringListTrim(lstS[  102 - 1]);
sdateWorkout2                       := StringListTrim(lstS[  103 - 1]);
sdateWorkout3                       := StringListTrim(lstS[  104 - 1]);
sdateWorkout4                       := StringListTrim(lstS[  105 - 1]);
sdateWorkout5                       := StringListTrim(lstS[  106 - 1]);
sdateWorkout6                       := StringListTrim(lstS[  107 - 1]);
sdateWorkout7                       := StringListTrim(lstS[  108 - 1]);
sdateWorkout8                       := StringListTrim(lstS[  109 - 1]);
sdateWorkout9                       := StringListTrim(lstS[  110 - 1]);
sdateWorkout10                      := StringListTrim(lstS[  111 - 1]);
sdateWorkout11                      := StringListTrim(lstS[  112 - 1]);
sdateWorkout12                      := StringListTrim(lstS[  113 - 1]);
stimeWorkout1                       := StringListTrim(lstS[  114 - 1]);
stimeWorkout2                       := StringListTrim(lstS[  115 - 1]);
stimeWorkout3                       := StringListTrim(lstS[  116 - 1]);
stimeWorkout4                       := StringListTrim(lstS[  117 - 1]);
stimeWorkout5                       := StringListTrim(lstS[  118 - 1]);
stimeWorkout6                       := StringListTrim(lstS[  119 - 1]);
stimeWorkout7                       := StringListTrim(lstS[  120 - 1]);
stimeWorkout8                       := StringListTrim(lstS[  121 - 1]);
stimeWorkout9                       := StringListTrim(lstS[  122 - 1]);
stimeWorkout10                      := StringListTrim(lstS[  123 - 1]);
stimeWorkout11                      := StringListTrim(lstS[  124 - 1]);
stimeWorkout12                      := StringListTrim(lstS[  125 - 1]);
strackWorkout1                      := StringListTrim(lstS[  126 - 1]);
strackWorkout2                      := StringListTrim(lstS[  127 - 1]);
strackWorkout3                      := StringListTrim(lstS[  128 - 1]);
strackWorkout4                      := StringListTrim(lstS[  129 - 1]);
strackWorkout5                      := StringListTrim(lstS[  130 - 1]);
strackWorkout6                      := StringListTrim(lstS[  131 - 1]);
strackWorkout7                      := StringListTrim(lstS[  132 - 1]);
strackWorkout8                      := StringListTrim(lstS[  133 - 1]);
strackWorkout9                      := StringListTrim(lstS[  134 - 1]);
strackWorkout10                     := StringListTrim(lstS[  135 - 1]);
strackWorkout11                     := StringListTrim(lstS[  136 - 1]);
strackWorkout12                     := StringListTrim(lstS[  137 - 1]);
sdistanceWorkout1                   := StringListTrim(lstS[  138 - 1]);
sdistanceWorkout2                   := StringListTrim(lstS[  139 - 1]);
sdistanceWorkout3                   := StringListTrim(lstS[  140 - 1]);
sdistanceWorkout4                   := StringListTrim(lstS[  141 - 1]);
sdistanceWorkout5                   := StringListTrim(lstS[  142 - 1]);
sdistanceWorkout6                   := StringListTrim(lstS[  143 - 1]);
sdistanceWorkout7                   := StringListTrim(lstS[  144 - 1]);
sdistanceWorkout8                   := StringListTrim(lstS[  145 - 1]);
sdistanceWorkout9                   := StringListTrim(lstS[  146 - 1]);
sdistanceWorkout10                  := StringListTrim(lstS[  147 - 1]);
sdistanceWorkout11                  := StringListTrim(lstS[  148 - 1]);
sdistanceWorkout12                  := StringListTrim(lstS[  149 - 1]);
sconditionWorkout1                  := StringListTrim(lstS[  150 - 1]);
sconditionWorkout2                  := StringListTrim(lstS[  151 - 1]);
sconditionWorkout3                  := StringListTrim(lstS[  152 - 1]);
sconditionWorkout4                  := StringListTrim(lstS[  153 - 1]);
sconditionWorkout5                  := StringListTrim(lstS[  154 - 1]);
sconditionWorkout6                  := StringListTrim(lstS[  155 - 1]);
sconditionWorkout7                  := StringListTrim(lstS[  156 - 1]);
sconditionWorkout8                  := StringListTrim(lstS[  157 - 1]);
sconditionWorkout9                  := StringListTrim(lstS[  158 - 1]);
sconditionWorkout10                 := StringListTrim(lstS[  159 - 1]);
sconditionWorkout11                 := StringListTrim(lstS[  160 - 1]);
sconditionWorkout12                 := StringListTrim(lstS[  161 - 1]);
sdescribeWorkout1                   := StringListTrim(lstS[  162 - 1]);
sdescribeWorkout2                   := StringListTrim(lstS[  163 - 1]);
sdescribeWorkout3                   := StringListTrim(lstS[  164 - 1]);
sdescribeWorkout4                   := StringListTrim(lstS[  165 - 1]);
sdescribeWorkout5                   := StringListTrim(lstS[  166 - 1]);
sdescribeWorkout6                   := StringListTrim(lstS[  167 - 1]);
sdescribeWorkout7                   := StringListTrim(lstS[  168 - 1]);
sdescribeWorkout8                   := StringListTrim(lstS[  169 - 1]);
sdescribeWorkout9                   := StringListTrim(lstS[  170 - 1]);
sdescribeWorkout10                  := StringListTrim(lstS[  171 - 1]);
sdescribeWorkout11                  := StringListTrim(lstS[  172 - 1]);
sdescribeWorkout12                  := StringListTrim(lstS[  173 - 1]);
sinnerIndicateWorkout1              := StringListTrim(lstS[  174 - 1]);
sinnerIndicateWorkout2              := StringListTrim(lstS[  175 - 1]);
sinnerIndicateWorkout3              := StringListTrim(lstS[  176 - 1]);
sinnerIndicateWorkout4              := StringListTrim(lstS[  177 - 1]);
sinnerIndicateWorkout5              := StringListTrim(lstS[  178 - 1]);
sinnerIndicateWorkout6              := StringListTrim(lstS[  179 - 1]);
sinnerIndicateWorkout7              := StringListTrim(lstS[  180 - 1]);
sinnerIndicateWorkout8              := StringListTrim(lstS[  181 - 1]);
sinnerIndicateWorkout9              := StringListTrim(lstS[  182 - 1]);
sinnerIndicateWorkout10             := StringListTrim(lstS[  183 - 1]);
sinnerIndicateWorkout11             := StringListTrim(lstS[  184 - 1]);
sinnerIndicateWorkout12             := StringListTrim(lstS[  185 - 1]);
snumWorksWorkout1                   := StringListTrim(lstS[  186 - 1]);
snumWorksWorkout2                   := StringListTrim(lstS[  187 - 1]);
snumWorksWorkout3                   := StringListTrim(lstS[  188 - 1]);
snumWorksWorkout4                   := StringListTrim(lstS[  189 - 1]);
snumWorksWorkout5                   := StringListTrim(lstS[  190 - 1]);
snumWorksWorkout6                   := StringListTrim(lstS[  191 - 1]);
snumWorksWorkout7                   := StringListTrim(lstS[  192 - 1]);
snumWorksWorkout8                   := StringListTrim(lstS[  193 - 1]);
snumWorksWorkout9                   := StringListTrim(lstS[  194 - 1]);
snumWorksWorkout10                  := StringListTrim(lstS[  195 - 1]);
snumWorksWorkout11                  := StringListTrim(lstS[  196 - 1]);
snumWorksWorkout12                  := StringListTrim(lstS[  197 - 1]);
srankWorkout1                       := StringListTrim(lstS[  198 - 1]);
srankWorkout2                       := StringListTrim(lstS[  199 - 1]);
srankWorkout3                       := StringListTrim(lstS[  200 - 1]);
srankWorkout4                       := StringListTrim(lstS[  201 - 1]);
srankWorkout5                       := StringListTrim(lstS[  202 - 1]);
srankWorkout6                       := StringListTrim(lstS[  203 - 1]);
srankWorkout7                       := StringListTrim(lstS[  204 - 1]);
srankWorkout8                       := StringListTrim(lstS[  205 - 1]);
srankWorkout9                       := StringListTrim(lstS[  206 - 1]);
srankWorkout10                      := StringListTrim(lstS[  207 - 1]);
srankWorkout12                      := StringListTrim(lstS[  208 - 1]);
srankWorkout12                      := StringListTrim(lstS[  209 - 1]);
sBrisRunStyle                       := StringListTrim(lstS[  210 - 1]);
sQuirin                             := StringListTrim(lstS[  211 - 1]);
sreserved20                         := StringListTrim(lstS[  212 - 1]);
sreserved22                         := StringListTrim(lstS[  213 - 1]);
stwoFBrisPaceParForLevel            := StringListTrim(lstS[  214 - 1]);
sfourFBrisPaceParForLevel           := StringListTrim(lstS[  215 - 1]);
ssizFBrisPaceParForLevel            := StringListTrim(lstS[  216 - 1]);
sBrisSpeedParForClassLevel          := StringListTrim(lstS[  217 - 1]);
sBrisLatePaceParForLevel            := StringListTrim(lstS[  218 - 1]);
sreserved22                         := StringListTrim(lstS[  219 - 1]);
sreserved23                         := StringListTrim(lstS[  220 - 1]);
sreserved24                         := StringListTrim(lstS[  221 - 1]);
sreserved25                         := StringListTrim(lstS[  222 - 1]);
sreserved26                         := StringListTrim(lstS[  223 - 1]);
sdaysSinceLastRace                  := StringListTrim(lstS[  224 - 1]);
sdrfRaceCondition1                  := StringListTrim(lstS[  225 - 1]);
sdrfRaceCondition2                  := StringListTrim(lstS[  226 - 1]);
sdrfRaceCondition3                  := StringListTrim(lstS[  227 - 1]);
sdrfRaceCondition4                  := StringListTrim(lstS[  228 - 1]);
sdrfRaceCondition5                  := StringListTrim(lstS[  229 - 1]);
sdrfRaceCondition6                  := StringListTrim(lstS[  230 - 1]);
sreserved27                         := StringListTrim(lstS[  231 - 1]);
sreserved28                         := StringListTrim(lstS[  232 - 1]);
sreserved29                         := StringListTrim(lstS[  233 - 1]);
sreserved30                         := StringListTrim(lstS[  234 - 1]);
sreserved32                         := StringListTrim(lstS[  235 - 1]);
sreserved32                         := StringListTrim(lstS[  236 - 1]);
sreserved33                         := StringListTrim(lstS[  237 - 1]);
sreserved34                         := StringListTrim(lstS[  238 - 1]);
sreserved35                         := StringListTrim(lstS[  239 - 1]);
swagerTypes1                        := StringListTrim(lstS[  240 - 1]);
swagerTypes2                        := StringListTrim(lstS[  241 - 1]);
swagerTypes3                        := StringListTrim(lstS[  242 - 1]);
swagerTypes4                        := StringListTrim(lstS[  243 - 1]);
swagerTypes5                        := StringListTrim(lstS[  244 - 1]);
swagerTypes6                        := StringListTrim(lstS[  245 - 1]);
swagerTypes7                        := StringListTrim(lstS[  246 - 1]);
swagerTypes8                        := StringListTrim(lstS[  247 - 1]);
swagerTypes9                        := StringListTrim(lstS[  248 - 1]);
sreserved26                         := StringListTrim(lstS[  249 - 1]);
sreserved27                         := StringListTrim(lstS[  250 - 1]);
sBrisPrimePowerRating               := StringListTrim(lstS[  251 - 1]);
sreserved28                         := StringListTrim(lstS[  252 - 1]);
sreserved29                         := StringListTrim(lstS[  253 - 1]);
sreserved30                         := StringListTrim(lstS[  254 - 1]);
sreserved32                         := StringListTrim(lstS[  255 - 1]);
sppRaceDate1                        := StringListTrim(lstS[  256 - 1]);
sppRaceDate2                        := StringListTrim(lstS[  257 - 1]);
sppRaceDate3                        := StringListTrim(lstS[  258 - 1]);
sppRaceDate4                        := StringListTrim(lstS[  259 - 1]);
sppRaceDate5                        := StringListTrim(lstS[  260 - 1]);
sppRaceDate6                        := StringListTrim(lstS[  261 - 1]);
sppRaceDate7                        := StringListTrim(lstS[  262 - 1]);
sppRaceDate8                        := StringListTrim(lstS[  263 - 1]);
sppRaceDate9                        := StringListTrim(lstS[  264 - 1]);
sppRaceDate10                       := StringListTrim(lstS[  265 - 1]);
sppDaysPrev1                        := StringListTrim(lstS[  266 - 1]);
sppDaysPrev2                        := StringListTrim(lstS[  267 - 1]);
sppDaysPrev3                        := StringListTrim(lstS[  268 - 1]);
sppDaysPrev4                        := StringListTrim(lstS[  269 - 1]);
sppDaysPrev5                        := StringListTrim(lstS[  270 - 1]);
sppDaysPrev6                        := StringListTrim(lstS[  271 - 1]);
sppDaysPrev7                        := StringListTrim(lstS[  272 - 1]);
sppDaysPrev8                        := StringListTrim(lstS[  273 - 1]);
sppDaysPrev9                        := StringListTrim(lstS[  274 - 1]);
sppDaysPrev10                       := StringListTrim(lstS[  275 - 1]);
sppTrackCode1                       := StringListTrim(lstS[  276 - 1]);
sppTrackCode2                       := StringListTrim(lstS[  277 - 1]);
sppTrackCode3                       := StringListTrim(lstS[  278 - 1]);
sppTrackCode4                       := StringListTrim(lstS[  279 - 1]);
sppTrackCode5                       := StringListTrim(lstS[  280 - 1]);
sppTrackCode6                       := StringListTrim(lstS[  281 - 1]);
sppTrackCode7                       := StringListTrim(lstS[  282 - 1]);
sppTrackCode8                       := StringListTrim(lstS[  283 - 1]);
sppTrackCode9                       := StringListTrim(lstS[  284 - 1]);
sppTrackCode10                      := StringListTrim(lstS[  285 - 1]);
sppBrisTrackCode1                   := StringListTrim(lstS[  286 - 1]);
sppBrisTrackCode2                   := StringListTrim(lstS[  287 - 1]);
sppBrisTrackCode3                   := StringListTrim(lstS[  288 - 1]);
sppBrisTrackCode4                   := StringListTrim(lstS[  289 - 1]);
sppBrisTrackCode5                   := StringListTrim(lstS[  290 - 1]);
sppBrisTrackCode6                   := StringListTrim(lstS[  291 - 1]);
sppBrisTrackCode7                   := StringListTrim(lstS[  292 - 1]);
sppBrisTrackCode8                   := StringListTrim(lstS[  293 - 1]);
sppBrisTrackCode9                   := StringListTrim(lstS[  294 - 1]);
sppBrisTrackCode10                  := StringListTrim(lstS[  295 - 1]);
sppRaceNum1                         := StringListTrim(lstS[  296 - 1]);
sppRaceNum2                         := StringListTrim(lstS[  297 - 1]);
sppRaceNum3                         := StringListTrim(lstS[  298 - 1]);
sppRaceNum4                         := StringListTrim(lstS[  299 - 1]);
sppRaceNum5                         := StringListTrim(lstS[  300 - 1]);
sppRaceNum6                         := StringListTrim(lstS[  301 - 1]);
sppRaceNum7                         := StringListTrim(lstS[  302 - 1]);
sppRaceNum8                         := StringListTrim(lstS[  303 - 1]);
sppRaceNum9                         := StringListTrim(lstS[  304 - 1]);
sppRaceNum10                        := StringListTrim(lstS[  305 - 1]);
sppTrackCond1                       := StringListTrim(lstS[  306 - 1]);
sppTrackCond2                       := StringListTrim(lstS[  307 - 1]);
sppTrackCond3                       := StringListTrim(lstS[  308 - 1]);
sppTrackCond4                       := StringListTrim(lstS[  309 - 1]);
sppTrackCond5                       := StringListTrim(lstS[  310 - 1]);
sppTrackCond6                       := StringListTrim(lstS[  311 - 1]);
sppTrackCond7                       := StringListTrim(lstS[  312 - 1]);
sppTrackCond8                       := StringListTrim(lstS[  313 - 1]);
sppTrackCond9                       := StringListTrim(lstS[  314 - 1]);
sppTrackCond10                      := StringListTrim(lstS[  315 - 1]);
sppDistanceYards1                   := StringListTrim(lstS[  316 - 1]);
sppDistanceYards2                   := StringListTrim(lstS[  317 - 1]);
sppDistanceYards3                   := StringListTrim(lstS[  318 - 1]);
sppDistanceYards4                   := StringListTrim(lstS[  319 - 1]);
sppDistanceYards5                   := StringListTrim(lstS[  320 - 1]);
sppDistanceYards6                   := StringListTrim(lstS[  321 - 1]);
sppDistanceYards7                   := StringListTrim(lstS[  322 - 1]);
sppDistanceYards8                   := StringListTrim(lstS[  323 - 1]);
sppDistanceYards9                   := StringListTrim(lstS[  324 - 1]);
sppDistanceYards10                  := StringListTrim(lstS[  325 - 1]);
sppSurface1                         := StringListTrim(lstS[  326 - 1]);
sppSurface2                         := StringListTrim(lstS[  327 - 1]);
sppSurface3                         := StringListTrim(lstS[  328 - 1]);
sppSurface4                         := StringListTrim(lstS[  329 - 1]);
sppSurface5                         := StringListTrim(lstS[  330 - 1]);
sppSurface6                         := StringListTrim(lstS[  331 - 1]);
sppSurface7                         := StringListTrim(lstS[  332 - 1]);
sppSurface8                         := StringListTrim(lstS[  333 - 1]);
sppSurface9                         := StringListTrim(lstS[  334 - 1]);
sppSurface20                        := StringListTrim(lstS[  335 - 1]);
sppSpecialChute1                    := StringListTrim(lstS[  336 - 1]);
sppSpecialChute2                    := StringListTrim(lstS[  337 - 1]);
sppSpecialChute3                    := StringListTrim(lstS[  338 - 1]);
sppSpecialChute4                    := StringListTrim(lstS[  339 - 1]);
sppSpecialChute5                    := StringListTrim(lstS[  340 - 1]);
sppSpecialChute6                    := StringListTrim(lstS[  341 - 1]);
sppSpecialChute7                    := StringListTrim(lstS[  342 - 1]);
sppSpecialChute8                    := StringListTrim(lstS[  343 - 1]);
sppSpecialChute9                    := StringListTrim(lstS[  344 - 1]);
sppSpecialChute10                   := StringListTrim(lstS[  345 - 1]);
sppNumEntrants1                     := StringListTrim(lstS[  346 - 1]);
sppNumEntrants2                     := StringListTrim(lstS[  347 - 1]);
sppNumEntrants3                     := StringListTrim(lstS[  348 - 1]);
sppNumEntrants4                     := StringListTrim(lstS[  349 - 1]);
sppNumEntrants5                     := StringListTrim(lstS[  350 - 1]);
sppNumEntrants6                     := StringListTrim(lstS[  352 - 1]);
sppNumEntrants7                     := StringListTrim(lstS[  352 - 1]);
sppNumEntrants8                     := StringListTrim(lstS[  353 - 1]);
sppNumEntrants9                     := StringListTrim(lstS[  354 - 1]);
sppNumEntrants20                    := StringListTrim(lstS[  355 - 1]);
sppPostPosition2                    := StringListTrim(lstS[  356 - 1]);
sppPostPosition2                    := StringListTrim(lstS[  357 - 1]);
sppPostPosition3                    := StringListTrim(lstS[  358 - 1]);
sppPostPosition4                    := StringListTrim(lstS[  359 - 1]);
sppPostPosition5                    := StringListTrim(lstS[  360 - 1]);
sppPostPosition6                    := StringListTrim(lstS[  362 - 1]);
sppPostPosition7                    := StringListTrim(lstS[  362 - 1]);
sppPostPosition8                    := StringListTrim(lstS[  363 - 1]);
sppPostPosition9                    := StringListTrim(lstS[  364 - 1]);
sppPostPosition10                   := StringListTrim(lstS[  365 - 1]);
sppEquipment2                       := StringListTrim(lstS[  366 - 1]);
sppEquipment2                       := StringListTrim(lstS[  367 - 1]);
sppEquipment3                       := StringListTrim(lstS[  368 - 1]);
sppEquipment4                       := StringListTrim(lstS[  369 - 1]);
sppEquipment5                       := StringListTrim(lstS[  370 - 1]);
sppEquipment6                       := StringListTrim(lstS[  372 - 1]);
sppEquipment7                       := StringListTrim(lstS[  372 - 1]);
sppEquipment8                       := StringListTrim(lstS[  373 - 1]);
sppEquipment9                       := StringListTrim(lstS[  374 - 1]);
sppEquipment20                      := StringListTrim(lstS[  375 - 1]);
sppReserved2_2                      := StringListTrim(lstS[  376 - 1]);
sppReserved2_2                      := StringListTrim(lstS[  377 - 1]);
sppReserved2_3                      := StringListTrim(lstS[  378 - 1]);
sppReserved2_4                      := StringListTrim(lstS[  379 - 1]);
sppReserved2_5                      := StringListTrim(lstS[  380 - 1]);
sppReserved2_6                      := StringListTrim(lstS[  382 - 1]);
sppReserved2_7                      := StringListTrim(lstS[  382 - 1]);
sppReserved2_8                      := StringListTrim(lstS[  383 - 1]);
sppReserved2_9                      := StringListTrim(lstS[  384 - 1]);
sppReserved2_10                     := StringListTrim(lstS[  385 - 1]);
sppMeds2                            := StringListTrim(lstS[  386 - 1]);
sppMeds2                            := StringListTrim(lstS[  387 - 1]);
sppMeds3                            := StringListTrim(lstS[  388 - 1]);
sppMeds4                            := StringListTrim(lstS[  389 - 1]);
sppMeds5                            := StringListTrim(lstS[  390 - 1]);
sppMeds6                            := StringListTrim(lstS[  392 - 1]);
sppMeds7                            := StringListTrim(lstS[  392 - 1]);
sppMeds8                            := StringListTrim(lstS[  393 - 1]);
sppMeds9                            := StringListTrim(lstS[  394 - 1]);
sppMeds20                           := StringListTrim(lstS[  395 - 1]);
sppTripComment1                     := StringListTrim(lstS[  396 - 1]);
sppTripComment2                     := StringListTrim(lstS[  397 - 1]);
sppTripComment3                     := StringListTrim(lstS[  398 - 1]);
sppTripComment4                     := StringListTrim(lstS[  399 - 1]);
sppTripComment5                     := StringListTrim(lstS[  400 - 1]);
sppTripComment6                     := StringListTrim(lstS[  401 - 1]);
sppTripComment7                     := StringListTrim(lstS[  402 - 1]);
sppTripComment8                     := StringListTrim(lstS[  403 - 1]);
sppTripComment9                     := StringListTrim(lstS[  404 - 1]);
sppTripComment20                    := StringListTrim(lstS[  405 - 1]);
sppWinnersName2                     := StringListTrim(lstS[  406 - 1]);
sppWinnersName2                     := StringListTrim(lstS[  407 - 1]);
sppWinnersName3                     := StringListTrim(lstS[  408 - 1]);
sppWinnersName4                     := StringListTrim(lstS[  409 - 1]);
sppWinnersName5                     := StringListTrim(lstS[  410 - 1]);
sppWinnersName6                     := StringListTrim(lstS[  411 - 1]);
sppWinnersName7                     := StringListTrim(lstS[  412 - 1]);
sppWinnersName8                     := StringListTrim(lstS[  413 - 1]);
sppWinnersName9                     := StringListTrim(lstS[  414 - 1]);
sppWinnersName20                    := StringListTrim(lstS[  415 - 1]);
spp2ndPlaceName2                    := StringListTrim(lstS[  416 - 1]);
spp2ndPlaceName2                    := StringListTrim(lstS[  417 - 1]);
spp2ndPlaceName3                    := StringListTrim(lstS[  418 - 1]);
spp2ndPlaceName4                    := StringListTrim(lstS[  419 - 1]);
spp2ndPlaceName5                    := StringListTrim(lstS[  420 - 1]);
spp2ndPlaceName6                    := StringListTrim(lstS[  421 - 1]);
spp2ndPlaceName7                    := StringListTrim(lstS[  422 - 1]);
spp2ndPlaceName8                    := StringListTrim(lstS[  423 - 1]);
spp2ndPlaceName9                    := StringListTrim(lstS[  424 - 1]);
spp2ndPlaceName20                   := StringListTrim(lstS[  425 - 1]);
spp3rdPlaceName2                    := StringListTrim(lstS[  426 - 1]);
spp3rdPlaceName2                    := StringListTrim(lstS[  427 - 1]);
spp3rdPlaceName3                    := StringListTrim(lstS[  428 - 1]);
spp3rdPlaceName4                    := StringListTrim(lstS[  429 - 1]);
spp3rdPlaceName5                    := StringListTrim(lstS[  430 - 1]);
spp3rdPlaceName6                    := StringListTrim(lstS[  431 - 1]);
spp3rdPlaceName7                    := StringListTrim(lstS[  432 - 1]);
spp3rdPlaceName8                    := StringListTrim(lstS[  433 - 1]);
spp3rdPlaceName9                    := StringListTrim(lstS[  434 - 1]);
spp3rdPlaceName20                   := StringListTrim(lstS[  435 - 1]);
sppWinnersWeight2                   := StringListTrim(lstS[  436 - 1]);
sppWinnersWeight2                   := StringListTrim(lstS[  437 - 1]);
sppWinnersWeight3                   := StringListTrim(lstS[  438 - 1]);
sppWinnersWeight4                   := StringListTrim(lstS[  439 - 1]);
sppWinnersWeight5                   := StringListTrim(lstS[  440 - 1]);
sppWinnersWeight6                   := StringListTrim(lstS[  441 - 1]);
sppWinnersWeight7                   := StringListTrim(lstS[  442 - 1]);
sppWinnersWeight8                   := StringListTrim(lstS[  443 - 1]);
sppWinnersWeight9                   := StringListTrim(lstS[  444 - 1]);
sppWinnersWeight20                  := StringListTrim(lstS[  445 - 1]);
spp2ndPlaceWeight2                  := StringListTrim(lstS[  446 - 1]);
spp2ndPlaceWeight2                  := StringListTrim(lstS[  447 - 1]);
spp2ndPlaceWeight3                  := StringListTrim(lstS[  448 - 1]);
spp2ndPlaceWeight4                  := StringListTrim(lstS[  449 - 1]);
spp2ndPlaceWeight5                  := StringListTrim(lstS[  450 - 1]);
spp2ndPlaceWeight6                  := StringListTrim(lstS[  451 - 1]);
spp2ndPlaceWeight7                  := StringListTrim(lstS[  452 - 1]);
spp2ndPlaceWeight8                  := StringListTrim(lstS[  453 - 1]);
spp2ndPlaceWeight9                  := StringListTrim(lstS[  454 - 1]);
spp2ndPlaceWeight20                 := StringListTrim(lstS[  455 - 1]);
spp3rdPlaceWeight2                  := StringListTrim(lstS[  456 - 1]);
spp3rdPlaceWeight2                  := StringListTrim(lstS[  457 - 1]);
spp3rdPlaceWeight3                  := StringListTrim(lstS[  458 - 1]);
spp3rdPlaceWeight4                  := StringListTrim(lstS[  459 - 1]);
spp3rdPlaceWeight5                  := StringListTrim(lstS[  460 - 1]);
spp3rdPlaceWeight6                  := StringListTrim(lstS[  461 - 1]);
spp3rdPlaceWeight7                  := StringListTrim(lstS[  462 - 1]);
spp3rdPlaceWeight8                  := StringListTrim(lstS[  463 - 1]);
spp3rdPlaceWeight9                  := StringListTrim(lstS[  464 - 1]);
spp3rdPlaceWeight20                 := StringListTrim(lstS[  465 - 1]);
sppWinnersMargin2                   := StringListTrim(lstS[  466 - 1]);
sppWinnersMargin2                   := StringListTrim(lstS[  467 - 1]);
sppWinnersMargin3                   := StringListTrim(lstS[  468 - 1]);
sppWinnersMargin4                   := StringListTrim(lstS[  469 - 1]);
sppWinnersMargin5                   := StringListTrim(lstS[  470 - 1]);
sppWinnersMargin6                   := StringListTrim(lstS[  472 - 1]);
sppWinnersMargin7                   := StringListTrim(lstS[  472 - 1]);
sppWinnersMargin8                   := StringListTrim(lstS[  473 - 1]);
sppWinnersMargin9                   := StringListTrim(lstS[  474 - 1]);
sppWinnersMargin20                  := StringListTrim(lstS[  475 - 1]);
spp2ndPlaceMargin2                  := StringListTrim(lstS[  476 - 1]);
spp2ndPlaceMargin2                  := StringListTrim(lstS[  477 - 1]);
spp2ndPlaceMargin3                  := StringListTrim(lstS[  478 - 1]);
spp2ndPlaceMargin4                  := StringListTrim(lstS[  479 - 1]);
spp2ndPlaceMargin5                  := StringListTrim(lstS[  480 - 1]);
spp2ndPlaceMargin6                  := StringListTrim(lstS[  481 - 1]);
spp2ndPlaceMargin7                  := StringListTrim(lstS[  482 - 1]);
spp2ndPlaceMargin8                  := StringListTrim(lstS[  483 - 1]);
spp2ndPlaceMargin9                  := StringListTrim(lstS[  484 - 1]);
spp2ndPlaceMargin20                 := StringListTrim(lstS[  485 - 1]);
spp3rdPlaceMargin2                  := StringListTrim(lstS[  486 - 1]);
spp3rdPlaceMargin2                  := StringListTrim(lstS[  487 - 1]);
spp3rdPlaceMargin3                  := StringListTrim(lstS[  488 - 1]);
spp3rdPlaceMargin4                  := StringListTrim(lstS[  489 - 1]);
spp3rdPlaceMargin5                  := StringListTrim(lstS[  490 - 1]);
spp3rdPlaceMargin6                  := StringListTrim(lstS[  492 - 1]);
spp3rdPlaceMargin7                  := StringListTrim(lstS[  492 - 1]);
spp3rdPlaceMargin8                  := StringListTrim(lstS[  493 - 1]);
spp3rdPlaceMargin9                  := StringListTrim(lstS[  494 - 1]);
spp3rdPlaceMargin20                 := StringListTrim(lstS[  495 - 1]);
sppExtraComment1                    := StringListTrim(lstS[  496 - 1]);
sppExtraComment2                    := StringListTrim(lstS[  497 - 1]);
sppExtraComment3                    := StringListTrim(lstS[  498 - 1]);
sppExtraComment4                    := StringListTrim(lstS[  499 - 1]);
sppExtraComment5                    := StringListTrim(lstS[  500 - 1]);
sppExtraComment6                    := StringListTrim(lstS[  501 - 1]);
sppExtraComment7                    := StringListTrim(lstS[  502 - 1]);
sppExtraComment8                    := StringListTrim(lstS[  503 - 1]);
sppExtraComment9                    := StringListTrim(lstS[  504 - 1]);
sppExtraComment20                   := StringListTrim(lstS[  505 - 1]);
sppWeight2                          := StringListTrim(lstS[  506 - 1]);
sppWeight2                          := StringListTrim(lstS[  507 - 1]);
sppWeight3                          := StringListTrim(lstS[  508 - 1]);
sppWeight4                          := StringListTrim(lstS[  509 - 1]);
sppWeight5                          := StringListTrim(lstS[  510 - 1]);
sppWeight6                          := StringListTrim(lstS[  511 - 1]);
sppWeight7                          := StringListTrim(lstS[  512 - 1]);
sppWeight8                          := StringListTrim(lstS[  513 - 1]);
sppWeight9                          := StringListTrim(lstS[  514 - 1]);
sppWeight20                         := StringListTrim(lstS[  515 - 1]);
sppOdds2                            := StringListTrim(lstS[  516 - 1]);
sppOdds2                            := StringListTrim(lstS[  517 - 1]);
sppOdds3                            := StringListTrim(lstS[  518 - 1]);
sppOdds4                            := StringListTrim(lstS[  519 - 1]);
sppOdds5                            := StringListTrim(lstS[  520 - 1]);
sppOdds6                            := StringListTrim(lstS[  521 - 1]);
sppOdds7                            := StringListTrim(lstS[  522 - 1]);
sppOdds8                            := StringListTrim(lstS[  523 - 1]);
sppOdds9                            := StringListTrim(lstS[  524 - 1]);
sppOdds20                           := StringListTrim(lstS[  525 - 1]);
sppEntry2                           := StringListTrim(lstS[  526 - 1]);
sppEntry2                           := StringListTrim(lstS[  527 - 1]);
sppEntry3                           := StringListTrim(lstS[  528 - 1]);
sppEntry4                           := StringListTrim(lstS[  529 - 1]);
sppEntry5                           := StringListTrim(lstS[  510 - 1]);
sppEntry6                           := StringListTrim(lstS[  531 - 1]);
sppEntry7                           := StringListTrim(lstS[  532 - 1]);
sppEntry8                           := StringListTrim(lstS[  533 - 1]);
sppEntry9                           := StringListTrim(lstS[  534 - 1]);
sppEntry20                          := StringListTrim(lstS[  535 - 1]);
sppRaceClassification2              := StringListTrim(lstS[  536 - 1]);
sppRaceClassification2              := StringListTrim(lstS[  537 - 1]);
sppRaceClassification3              := StringListTrim(lstS[  538 - 1]);
sppRaceClassification4              := StringListTrim(lstS[  539 - 1]);
sppRaceClassification5              := StringListTrim(lstS[  540 - 1]);
sppRaceClassification6              := StringListTrim(lstS[  541 - 1]);
sppRaceClassification7              := StringListTrim(lstS[  542 - 1]);
sppRaceClassification8              := StringListTrim(lstS[  543 - 1]);
sppRaceClassification9              := StringListTrim(lstS[  544 - 1]);
sppRaceClassification20             := StringListTrim(lstS[  545 - 1]);
sppClaimingPriceHorse2              := StringListTrim(lstS[  546 - 1]);
sppClaimingPriceHorse2              := StringListTrim(lstS[  547 - 1]);
sppClaimingPriceHorse3              := StringListTrim(lstS[  548 - 1]);
sppClaimingPriceHorse4              := StringListTrim(lstS[  549 - 1]);
sppClaimingPriceHorse5              := StringListTrim(lstS[  550 - 1]);
sppClaimingPriceHorse6              := StringListTrim(lstS[  551 - 1]);
sppClaimingPriceHorse7              := StringListTrim(lstS[  552 - 1]);
sppClaimingPriceHorse8              := StringListTrim(lstS[  553 - 1]);
sppClaimingPriceHorse9              := StringListTrim(lstS[  554 - 1]);
sppClaimingPriceHorse20             := StringListTrim(lstS[  555 - 1]);
sppPurse2                           := StringListTrim(lstS[  556 - 1]);
sppPurse2                           := StringListTrim(lstS[  557 - 1]);
sppPurse3                           := StringListTrim(lstS[  558 - 1]);
sppPurse4                           := StringListTrim(lstS[  559 - 1]);
sppPurse5                           := StringListTrim(lstS[  560 - 1]);
sppPurse6                           := StringListTrim(lstS[  561 - 1]);
sppPurse7                           := StringListTrim(lstS[  562 - 1]);
sppPurse8                           := StringListTrim(lstS[  563 - 1]);
sppPurse9                           := StringListTrim(lstS[  564 - 1]);
sppPurse20                          := StringListTrim(lstS[  565 - 1]);
sppStartingCallPos2                 := StringListTrim(lstS[  566 - 1]);
sppStartingCallPos2                 := StringListTrim(lstS[  567 - 1]);
sppStartingCallPos3                 := StringListTrim(lstS[  568 - 1]);
sppStartingCallPos4                 := StringListTrim(lstS[  569 - 1]);
sppStartingCallPos5                 := StringListTrim(lstS[  570 - 1]);
sppStartingCallPos6                 := StringListTrim(lstS[  571 - 1]);
sppStartingCallPos7                 := StringListTrim(lstS[  572 - 1]);
sppStartingCallPos8                 := StringListTrim(lstS[  573 - 1]);
sppStartingCallPos9                 := StringListTrim(lstS[  574 - 1]);
sppStartingCallPos20                := StringListTrim(lstS[  575 - 1]);
sppFirstCallPos2                    := StringListTrim(lstS[  576 - 1]);
sppFirstCallPos2                    := StringListTrim(lstS[  577 - 1]);
sppFirstCallPos3                    := StringListTrim(lstS[  578 - 1]);
sppFirstCallPos4                    := StringListTrim(lstS[  579 - 1]);
sppFirstCallPos5                    := StringListTrim(lstS[  580 - 1]);
sppFirstCallPos6                    := StringListTrim(lstS[  581 - 1]);
sppFirstCallPos7                    := StringListTrim(lstS[  582 - 1]);
sppFirstCallPos8                    := StringListTrim(lstS[  583 - 1]);
sppFirstCallPos9                    := StringListTrim(lstS[  584 - 1]);
sppFirstCallPos20                   := StringListTrim(lstS[  585 - 1]);
sppSecondCallPos2                   := StringListTrim(lstS[  586 - 1]);
sppSecondCallPos2                   := StringListTrim(lstS[  587 - 1]);
sppSecondCallPos3                   := StringListTrim(lstS[  588 - 1]);
sppSecondCallPos4                   := StringListTrim(lstS[  589 - 1]);
sppSecondCallPos5                   := StringListTrim(lstS[  590 - 1]);
sppSecondCallPos6                   := StringListTrim(lstS[  591 - 1]);
sppSecondCallPos7                   := StringListTrim(lstS[  592 - 1]);
sppSecondCallPos8                   := StringListTrim(lstS[  593 - 1]);
sppSecondCallPos9                   := StringListTrim(lstS[  594 - 1]);
sppSecondCallPos20                  := StringListTrim(lstS[  595 - 1]);
sppReserved3_2                      := StringListTrim(lstS[  596 - 1]);
sppReserved3_2                      := StringListTrim(lstS[  597 - 1]);
sppReserved3_3                      := StringListTrim(lstS[  598 - 1]);
sppReserved3_4                      := StringListTrim(lstS[  599 - 1]);
sppReserved3_5                      := StringListTrim(lstS[  600 - 1]);
sppReserved3_6                      := StringListTrim(lstS[  601 - 1]);
sppReserved3_7                      := StringListTrim(lstS[  602 - 1]);
sppReserved3_8                      := StringListTrim(lstS[  603 - 1]);
sppReserved3_9                      := StringListTrim(lstS[  604 - 1]);
sppReserved3_20                     := StringListTrim(lstS[  605 - 1]);
sppStretchPos2                      := StringListTrim(lstS[  606 - 1]);
sppStretchPos2                      := StringListTrim(lstS[  607 - 1]);
sppStretchPos3                      := StringListTrim(lstS[  608 - 1]);
sppStretchPos4                      := StringListTrim(lstS[  609 - 1]);
sppStretchPos5                      := StringListTrim(lstS[  610 - 1]);
sppStretchPos6                      := StringListTrim(lstS[  611 - 1]);
sppStretchPos7                      := StringListTrim(lstS[  612 - 1]);
sppStretchPos8                      := StringListTrim(lstS[  613 - 1]);
sppStretchPos9                      := StringListTrim(lstS[  614 - 1]);
sppStretchPos20                     := StringListTrim(lstS[  615 - 1]);
sppFinishPos2                       := StringListTrim(lstS[  616 - 1]);
sppFinishPos2                       := StringListTrim(lstS[  617 - 1]);
sppFinishPos3                       := StringListTrim(lstS[  618 - 1]);
sppFinishPos4                       := StringListTrim(lstS[  619 - 1]);
sppFinishPos5                       := StringListTrim(lstS[  620 - 1]);
sppFinishPos6                       := StringListTrim(lstS[  621 - 1]);
sppFinishPos7                       := StringListTrim(lstS[  622 - 1]);
sppFinishPos8                       := StringListTrim(lstS[  623 - 1]);
sppFinishPos9                       := StringListTrim(lstS[  624 - 1]);
sppFinishPos20                      := StringListTrim(lstS[  625 - 1]);
sppMoneyPos2                        := StringListTrim(lstS[  626 - 1]);
sppMoneyPos2                        := StringListTrim(lstS[  627 - 1]);
sppMoneyPos3                        := StringListTrim(lstS[  628 - 1]);
sppMoneyPos4                        := StringListTrim(lstS[  629 - 1]);
sppMoneyPos5                        := StringListTrim(lstS[  610 - 1]);
sppMoneyPos6                        := StringListTrim(lstS[  631 - 1]);
sppMoneyPos7                        := StringListTrim(lstS[  632 - 1]);
sppMoneyPos8                        := StringListTrim(lstS[  633 - 1]);
sppMoneyPos9                        := StringListTrim(lstS[  634 - 1]);
sppMoneyPos20                       := StringListTrim(lstS[  635 - 1]);
sppStartCallBeatenMargin2           := StringListTrim(lstS[  636 - 1]);
sppStartCallBeatenMargin2           := StringListTrim(lstS[  637 - 1]);
sppStartCallBeatenMargin3           := StringListTrim(lstS[  638 - 1]);
sppStartCallBeatenMargin4           := StringListTrim(lstS[  639 - 1]);
sppStartCallBeatenMargin5           := StringListTrim(lstS[  640 - 1]);
sppStartCallBeatenMargin6           := StringListTrim(lstS[  641 - 1]);
sppStartCallBeatenMargin7           := StringListTrim(lstS[  642 - 1]);
sppStartCallBeatenMargin8           := StringListTrim(lstS[  643 - 1]);
sppStartCallBeatenMargin9           := StringListTrim(lstS[  644 - 1]);
sppStartCallBeatenMargin20          := StringListTrim(lstS[  645 - 1]);
sppStartCallBeaten2                 := StringListTrim(lstS[  646 - 1]);
sppStartCallBeaten2                 := StringListTrim(lstS[  647 - 1]);
sppStartCallBeaten3                 := StringListTrim(lstS[  648 - 1]);
sppStartCallBeaten4                 := StringListTrim(lstS[  649 - 1]);
sppStartCallBeaten5                 := StringListTrim(lstS[  650 - 1]);
sppStartCallBeaten6                 := StringListTrim(lstS[  651 - 1]);
sppStartCallBeaten7                 := StringListTrim(lstS[  652 - 1]);
sppStartCallBeaten8                 := StringListTrim(lstS[  653 - 1]);
sppStartCallBeaten9                 := StringListTrim(lstS[  654 - 1]);
sppStartCallBeaten20                := StringListTrim(lstS[  655 - 1]);
sppFirstCallBeatenMargin2           := StringListTrim(lstS[  656 - 1]);
sppFirstCallBeatenMargin2           := StringListTrim(lstS[  657 - 1]);
sppFirstCallBeatenMargin3           := StringListTrim(lstS[  658 - 1]);
sppFirstCallBeatenMargin4           := StringListTrim(lstS[  659 - 1]);
sppFirstCallBeatenMargin5           := StringListTrim(lstS[  660 - 1]);
sppFirstCallBeatenMargin6           := StringListTrim(lstS[  661 - 1]);
sppFirstCallBeatenMargin7           := StringListTrim(lstS[  662 - 1]);
sppFirstCallBeatenMargin8           := StringListTrim(lstS[  663 - 1]);
sppFirstCallBeatenMargin9           := StringListTrim(lstS[  664 - 1]);
sppFirstCallBeatenMargin10          := StringListTrim(lstS[  665 - 1]);
sppFirstCallBeaten1                 := StringListTrim(lstS[  666 - 1]);
sppFirstCallBeaten2                 := StringListTrim(lstS[  667 - 1]);
sppFirstCallBeaten3                 := StringListTrim(lstS[  668 - 1]);
sppFirstCallBeaten4                 := StringListTrim(lstS[  669 - 1]);
sppFirstCallBeaten5                 := StringListTrim(lstS[  670 - 1]);
sppFirstCallBeaten6                 := StringListTrim(lstS[  671 - 1]);
sppFirstCallBeaten7                 := StringListTrim(lstS[  672 - 1]);
sppFirstCallBeaten8                 := StringListTrim(lstS[  673 - 1]);
sppFirstCallBeaten9                 := StringListTrim(lstS[  674 - 1]);
sppFirstCallBeaten10                := StringListTrim(lstS[  675 - 1]);
sppSecondCallBeatenMargin2          := StringListTrim(lstS[  676 - 1]);
sppSecondCallBeatenMargin2          := StringListTrim(lstS[  677 - 1]);
sppSecondCallBeatenMargin3          := StringListTrim(lstS[  678 - 1]);
sppSecondCallBeatenMargin4          := StringListTrim(lstS[  679 - 1]);
sppSecondCallBeatenMargin5          := StringListTrim(lstS[  680 - 1]);
sppSecondCallBeatenMargin6          := StringListTrim(lstS[  681 - 1]);
sppSecondCallBeatenMargin7          := StringListTrim(lstS[  682 - 1]);
sppSecondCallBeatenMargin8          := StringListTrim(lstS[  683 - 1]);
sppSecondCallBeatenMargin9          := StringListTrim(lstS[  684 - 1]);
sppSecondCallBeatenMargin20         := StringListTrim(lstS[  685 - 1]);
sppSecondCallBeaten1                := StringListTrim(lstS[  686 - 1]);
sppSecondCallBeaten2                := StringListTrim(lstS[  687 - 1]);
sppSecondCallBeaten3                := StringListTrim(lstS[  688 - 1]);
sppSecondCallBeaten4                := StringListTrim(lstS[  689 - 1]);
sppSecondCallBeaten5                := StringListTrim(lstS[  690 - 1]);
sppSecondCallBeaten6                := StringListTrim(lstS[  691 - 1]);
sppSecondCallBeaten7                := StringListTrim(lstS[  692 - 1]);
sppSecondCallBeaten8                := StringListTrim(lstS[  693 - 1]);
sppSecondCallBeaten9                := StringListTrim(lstS[  694 - 1]);
sppSecondCallBeaten20               := StringListTrim(lstS[  695 - 1]);
sppRaceShape2ndCall1                := StringListTrim(lstS[  696 - 1]);
sppRaceShape2ndCall2                := StringListTrim(lstS[  697 - 1]);
sppRaceShape2ndCall3                := StringListTrim(lstS[  698 - 1]);
sppRaceShape2ndCall4                := StringListTrim(lstS[  699 - 1]);
sppRaceShape2ndCall5                := StringListTrim(lstS[  700 - 1]);
sppRaceShape2ndCall6                := StringListTrim(lstS[  701 - 1]);
sppRaceShape2ndCall7                := StringListTrim(lstS[  702 - 1]);
sppRaceShape2ndCall8                := StringListTrim(lstS[  703 - 1]);
sppRaceShape2ndCall9                := StringListTrim(lstS[  704 - 1]);
sppRaceShape2ndCall10               := StringListTrim(lstS[  705 - 1]);
sppReserved5_2                      := StringListTrim(lstS[  706 - 1]);
sppReserved5_2                      := StringListTrim(lstS[  707 - 1]);
sppReserved5_3                      := StringListTrim(lstS[  708 - 1]);
sppReserved5_4                      := StringListTrim(lstS[  709 - 1]);
sppReserved5_5                      := StringListTrim(lstS[  710 - 1]);
sppReserved5_6                      := StringListTrim(lstS[  711 - 1]);
sppReserved5_7                      := StringListTrim(lstS[  712 - 1]);
sppReserved5_8                      := StringListTrim(lstS[  713 - 1]);
sppReserved5_9                      := StringListTrim(lstS[  714 - 1]);
sppReserved5_20                     := StringListTrim(lstS[  715 - 1]);
sppStretchBeatenMargin1             := StringListTrim(lstS[  716 - 1]);
sppStretchBeatenMargin2             := StringListTrim(lstS[  717 - 1]);
sppStretchBeatenMargin3             := StringListTrim(lstS[  718 - 1]);
sppStretchBeatenMargin4             := StringListTrim(lstS[  719 - 1]);
sppStretchBeatenMargin5             := StringListTrim(lstS[  720 - 1]);
sppStretchBeatenMargin6             := StringListTrim(lstS[  721 - 1]);
sppStretchBeatenMargin7             := StringListTrim(lstS[  722 - 1]);
sppStretchBeatenMargin8             := StringListTrim(lstS[  723 - 1]);
sppStretchBeatenMargin9             := StringListTrim(lstS[  724 - 1]);
sppStretchBeatenMargin20            := StringListTrim(lstS[  725 - 1]);
sppStretchBeaten2                   := StringListTrim(lstS[  726 - 1]);
sppStretchBeaten2                   := StringListTrim(lstS[  727 - 1]);
sppStretchBeaten3                   := StringListTrim(lstS[  728 - 1]);
sppStretchBeaten4                   := StringListTrim(lstS[  729 - 1]);
sppStretchBeaten5                   := StringListTrim(lstS[  710 - 1]);
sppStretchBeaten6                   := StringListTrim(lstS[  731 - 1]);
sppStretchBeaten7                   := StringListTrim(lstS[  732 - 1]);
sppStretchBeaten8                   := StringListTrim(lstS[  733 - 1]);
sppStretchBeaten9                   := StringListTrim(lstS[  734 - 1]);
sppStretchBeaten20                  := StringListTrim(lstS[  735 - 1]);
sppFinishBeatenMargin2              := StringListTrim(lstS[  736 - 1]);
sppFinishBeatenMargin2              := StringListTrim(lstS[  737 - 1]);
sppFinishBeatenMargin3              := StringListTrim(lstS[  738 - 1]);
sppFinishBeatenMargin4              := StringListTrim(lstS[  739 - 1]);
sppFinishBeatenMargin5              := StringListTrim(lstS[  740 - 1]);
sppFinishBeatenMargin6              := StringListTrim(lstS[  741 - 1]);
sppFinishBeatenMargin7              := StringListTrim(lstS[  742 - 1]);
sppFinishBeatenMargin8              := StringListTrim(lstS[  743 - 1]);
sppFinishBeatenMargin9              := StringListTrim(lstS[  744 - 1]);
sppFinishBeatenMargin20             := StringListTrim(lstS[  745 - 1]);
sppFinishBeaten2                    := StringListTrim(lstS[  746 - 1]);
sppFinishBeaten2                    := StringListTrim(lstS[  747 - 1]);
sppFinishBeaten3                    := StringListTrim(lstS[  748 - 1]);
sppFinishBeaten4                    := StringListTrim(lstS[  749 - 1]);
sppFinishBeaten5                    := StringListTrim(lstS[  750 - 1]);
sppFinishBeaten6                    := StringListTrim(lstS[  751 - 1]);
sppFinishBeaten7                    := StringListTrim(lstS[  752 - 1]);
sppFinishBeaten8                    := StringListTrim(lstS[  753 - 1]);
sppFinishBeaten9                    := StringListTrim(lstS[  754 - 1]);
sppFinishBeaten20                   := StringListTrim(lstS[  755 - 1]);
sppRaceShapeFirstCall1              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall2              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall3              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall4              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall5              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall6              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall7              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall8              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall9              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall10             := StringListTrim(lstS[    7 - 1]);
sppBris2fPaceRating1                := StringListTrim(lstS[  766 - 1]);
sppBris2fPaceRating2                := StringListTrim(lstS[  767 - 1]);
sppBris2fPaceRating3                := StringListTrim(lstS[  768 - 1]);
sppBris2fPaceRating4                := StringListTrim(lstS[  769 - 1]);
sppBris2fPaceRating5                := StringListTrim(lstS[  770 - 1]);
sppBris2fPaceRating6                := StringListTrim(lstS[  771 - 1]);
sppBris2fPaceRating7                := StringListTrim(lstS[  772 - 1]);
sppBris2fPaceRating8                := StringListTrim(lstS[  773 - 1]);
sppBris2fPaceRating9                := StringListTrim(lstS[  774 - 1]);
sppBris2fPaceRating10               := StringListTrim(lstS[  775 - 1]);
sppBris4fPaceRating2                := StringListTrim(lstS[  776 - 1]);
sppBris4fPaceRating2                := StringListTrim(lstS[  777 - 1]);
sppBris4fPaceRating3                := StringListTrim(lstS[  778 - 1]);
sppBris4fPaceRating4                := StringListTrim(lstS[  779 - 1]);
sppBris4fPaceRating5                := StringListTrim(lstS[  780 - 1]);
sppBris4fPaceRating6                := StringListTrim(lstS[  781 - 1]);
sppBris4fPaceRating7                := StringListTrim(lstS[  782 - 1]);
sppBris4fPaceRating8                := StringListTrim(lstS[  783 - 1]);
sppBris4fPaceRating9                := StringListTrim(lstS[  784 - 1]);
sppBris4fPaceRating10               := StringListTrim(lstS[  785 - 1]);
sppBris6fPaceRating1                := StringListTrim(lstS[  786 - 1]);
sppBris6fPaceRating2                := StringListTrim(lstS[  787 - 1]);
sppBris6fPaceRating3                := StringListTrim(lstS[  788 - 1]);
sppBris6fPaceRating4                := StringListTrim(lstS[  789 - 1]);
sppBris6fPaceRating5                := StringListTrim(lstS[  790 - 1]);
sppBris6fPaceRating6                := StringListTrim(lstS[  791 - 1]);
sppBris6fPaceRating7                := StringListTrim(lstS[  792 - 1]);
sppBris6fPaceRating8                := StringListTrim(lstS[  793 - 1]);
sppBris6fPaceRating9                := StringListTrim(lstS[  794 - 1]);
sppBris6fPaceRating20               := StringListTrim(lstS[  795 - 1]);
sppBris8fPaceRating1                := StringListTrim(lstS[  796 - 1]);
sppBris8fPaceRating2                := StringListTrim(lstS[  797 - 1]);
sppBris8fPaceRating3                := StringListTrim(lstS[  798 - 1]);
sppBris8fPaceRating4                := StringListTrim(lstS[  799 - 1]);
sppBris8fPaceRating5                := StringListTrim(lstS[  800 - 1]);
sppBris8fPaceRating6                := StringListTrim(lstS[  801 - 1]);
sppBris8fPaceRating7                := StringListTrim(lstS[  802 - 1]);
sppBris8fPaceRating8                := StringListTrim(lstS[  803 - 1]);
sppBris8fPaceRating9                := StringListTrim(lstS[  804 - 1]);
sppBris8fPaceRating10               := StringListTrim(lstS[  805 - 1]);
sppBris20fPaceRating1               := StringListTrim(lstS[  806 - 1]);
sppBris20fPaceRating2               := StringListTrim(lstS[  807 - 1]);
sppBris20fPaceRating3               := StringListTrim(lstS[  808 - 1]);
sppBris20fPaceRating4               := StringListTrim(lstS[  809 - 1]);
sppBris20fPaceRating5               := StringListTrim(lstS[  810 - 1]);
sppBris20fPaceRating6               := StringListTrim(lstS[  811 - 1]);
sppBris20fPaceRating7               := StringListTrim(lstS[  812 - 1]);
sppBris20fPaceRating8               := StringListTrim(lstS[  813 - 1]);
sppBris20fPaceRating9               := StringListTrim(lstS[  814 - 1]);
sppBris20fPaceRating10              := StringListTrim(lstS[  815 - 1]);
sppBrisLatePaceRating1              := StringListTrim(lstS[  816 - 1]);
sppBrisLatePaceRating2              := StringListTrim(lstS[  817 - 1]);
sppBrisLatePaceRating3              := StringListTrim(lstS[  818 - 1]);
sppBrisLatePaceRating4              := StringListTrim(lstS[  819 - 1]);
sppBrisLatePaceRating5              := StringListTrim(lstS[  820 - 1]);
sppBrisLatePaceRating6              := StringListTrim(lstS[  821 - 1]);
sppBrisLatePaceRating7              := StringListTrim(lstS[  822 - 1]);
sppBrisLatePaceRating8              := StringListTrim(lstS[  823 - 1]);
sppBrisLatePaceRating9              := StringListTrim(lstS[  824 - 1]);
sppBrisLatePaceRating10             := StringListTrim(lstS[  825 - 1]);
sppReserved7_1                      := StringListTrim(lstS[  826 - 1]);
sppReserved7_2                      := StringListTrim(lstS[  827 - 1]);
sppReserved7_3                      := StringListTrim(lstS[  828 - 1]);
sppReserved7_4                      := StringListTrim(lstS[  829 - 1]);
sppReserved7_5                      := StringListTrim(lstS[  810 - 1]);
sppReserved7_6                      := StringListTrim(lstS[  831 - 1]);
sppReserved7_7                      := StringListTrim(lstS[  832 - 1]);
sppReserved7_8                      := StringListTrim(lstS[  833 - 1]);
sppReserved7_9                      := StringListTrim(lstS[  834 - 1]);
sppReserved7_10                     := StringListTrim(lstS[  835 - 1]);
sppReserved8_2                      := StringListTrim(lstS[  836 - 1]);
sppReserved8_2                      := StringListTrim(lstS[  837 - 1]);
sppReserved8_3                      := StringListTrim(lstS[  838 - 1]);
sppReserved8_4                      := StringListTrim(lstS[  839 - 1]);
sppReserved8_5                      := StringListTrim(lstS[  840 - 1]);
sppReserved8_6                      := StringListTrim(lstS[  841 - 1]);
sppReserved8_7                      := StringListTrim(lstS[  842 - 1]);
sppReserved8_8                      := StringListTrim(lstS[  843 - 1]);
sppReserved8_9                      := StringListTrim(lstS[  844 - 1]);
sppReserved8_10                     := StringListTrim(lstS[  845 - 1]);
sppBrisSpeedRating1                 := StringListTrim(lstS[  846 - 1]);
sppBrisSpeedRating2                 := StringListTrim(lstS[  847 - 1]);
sppBrisSpeedRating3                 := StringListTrim(lstS[  848 - 1]);
sppBrisSpeedRating4                 := StringListTrim(lstS[  849 - 1]);
sppBrisSpeedRating5                 := StringListTrim(lstS[  850 - 1]);
sppBrisSpeedRating6                 := StringListTrim(lstS[  851 - 1]);
sppBrisSpeedRating7                 := StringListTrim(lstS[  852 - 1]);
sppBrisSpeedRating8                 := StringListTrim(lstS[  853 - 1]);
sppBrisSpeedRating9                 := StringListTrim(lstS[  854 - 1]);
sppBrisSpeedRating10                := StringListTrim(lstS[  855 - 1]);
sppDRFSpeedRating2                  := StringListTrim(lstS[  856 - 1]);
sppDRFSpeedRating2                  := StringListTrim(lstS[  857 - 1]);
sppDRFSpeedRating3                  := StringListTrim(lstS[  858 - 1]);
sppDRFSpeedRating4                  := StringListTrim(lstS[  859 - 1]);
sppDRFSpeedRating5                  := StringListTrim(lstS[  860 - 1]);
sppDRFSpeedRating6                  := StringListTrim(lstS[  861 - 1]);
sppDRFSpeedRating7                  := StringListTrim(lstS[  862 - 1]);
sppDRFSpeedRating8                  := StringListTrim(lstS[  863 - 1]);
sppDRFSpeedRating9                  := StringListTrim(lstS[  864 - 1]);
sppDRFSpeedRating10                 := StringListTrim(lstS[  865 - 1]);
sppDRFTrackVariant1                 := StringListTrim(lstS[  866 - 1]);
sppDRFTrackVariant2                 := StringListTrim(lstS[  867 - 1]);
sppDRFTrackVariant3                 := StringListTrim(lstS[  868 - 1]);
sppDRFTrackVariant4                 := StringListTrim(lstS[  869 - 1]);
sppDRFTrackVariant5                 := StringListTrim(lstS[  870 - 1]);
sppDRFTrackVariant6                 := StringListTrim(lstS[  871 - 1]);
sppDRFTrackVariant7                 := StringListTrim(lstS[  872 - 1]);
sppDRFTrackVariant8                 := StringListTrim(lstS[  873 - 1]);
sppDRFTrackVariant9                 := StringListTrim(lstS[  874 - 1]);
sppDRFTrackVariant20                := StringListTrim(lstS[  875 - 1]);
spp2fFraction1                      := StringListTrim(lstS[  876 - 1]);
spp2fFraction2                      := StringListTrim(lstS[  877 - 1]);
spp2fFraction3                      := StringListTrim(lstS[  878 - 1]);
spp2fFraction4                      := StringListTrim(lstS[  879 - 1]);
spp2fFraction5                      := StringListTrim(lstS[  880 - 1]);
spp2fFraction6                      := StringListTrim(lstS[  881 - 1]);
spp2fFraction7                      := StringListTrim(lstS[  882 - 1]);
spp2fFraction8                      := StringListTrim(lstS[  883 - 1]);
spp2fFraction9                      := StringListTrim(lstS[  884 - 1]);
spp2fFraction10                     := StringListTrim(lstS[  885 - 1]);
spp3fFraction2                      := StringListTrim(lstS[  886 - 1]);
spp3fFraction2                      := StringListTrim(lstS[  887 - 1]);
spp3fFraction3                      := StringListTrim(lstS[  888 - 1]);
spp3fFraction4                      := StringListTrim(lstS[  889 - 1]);
spp3fFraction5                      := StringListTrim(lstS[  890 - 1]);
spp3fFraction6                      := StringListTrim(lstS[  891 - 1]);
spp3fFraction7                      := StringListTrim(lstS[  892 - 1]);
spp3fFraction8                      := StringListTrim(lstS[  893 - 1]);
spp3fFraction9                      := StringListTrim(lstS[  894 - 1]);
spp3fFraction20                     := StringListTrim(lstS[  895 - 1]);
spp4fFraction2                      := StringListTrim(lstS[  896 - 1]);
spp4fFraction2                      := StringListTrim(lstS[  897 - 1]);
spp4fFraction3                      := StringListTrim(lstS[  898 - 1]);
spp4fFraction4                      := StringListTrim(lstS[  899 - 1]);
spp4fFraction5                      := StringListTrim(lstS[  900 - 1]);
spp4fFraction6                      := StringListTrim(lstS[  901 - 1]);
spp4fFraction7                      := StringListTrim(lstS[  902 - 1]);
spp4fFraction8                      := StringListTrim(lstS[  903 - 1]);
spp4fFraction9                      := StringListTrim(lstS[  904 - 1]);
spp4fFraction20                     := StringListTrim(lstS[  905 - 1]);
spp5fFraction2                      := StringListTrim(lstS[  906 - 1]);
spp5fFraction2                      := StringListTrim(lstS[  907 - 1]);
spp5fFraction3                      := StringListTrim(lstS[  908 - 1]);
spp5fFraction4                      := StringListTrim(lstS[  909 - 1]);
spp5fFraction5                      := StringListTrim(lstS[  910 - 1]);
spp5fFraction6                      := StringListTrim(lstS[  911 - 1]);
spp5fFraction7                      := StringListTrim(lstS[  912 - 1]);
spp5fFraction8                      := StringListTrim(lstS[  913 - 1]);
spp5fFraction9                      := StringListTrim(lstS[  914 - 1]);
spp5fFraction20                     := StringListTrim(lstS[  915 - 1]);
spp6fFraction2                      := StringListTrim(lstS[  916 - 1]);
spp6fFraction2                      := StringListTrim(lstS[  917 - 1]);
spp6fFraction3                      := StringListTrim(lstS[  918 - 1]);
spp6fFraction4                      := StringListTrim(lstS[  919 - 1]);
spp6fFraction5                      := StringListTrim(lstS[  920 - 1]);
spp6fFraction6                      := StringListTrim(lstS[  921 - 1]);
spp6fFraction7                      := StringListTrim(lstS[  922 - 1]);
spp6fFraction8                      := StringListTrim(lstS[  923 - 1]);
spp6fFraction9                      := StringListTrim(lstS[  924 - 1]);
spp6fFraction10                     := StringListTrim(lstS[  925 - 1]);
spp7fFraction1                      := StringListTrim(lstS[  926 - 1]);
spp7fFraction2                      := StringListTrim(lstS[  927 - 1]);
spp7fFraction3                      := StringListTrim(lstS[  928 - 1]);
spp7fFraction4                      := StringListTrim(lstS[  929 - 1]);
spp7fFraction5                      := StringListTrim(lstS[  910 - 1]);
spp7fFraction6                      := StringListTrim(lstS[  931 - 1]);
spp7fFraction7                      := StringListTrim(lstS[  932 - 1]);
spp7fFraction8                      := StringListTrim(lstS[  933 - 1]);
spp7fFraction9                      := StringListTrim(lstS[  934 - 1]);
spp7fFraction10                     := StringListTrim(lstS[  935 - 1]);
spp8fFraction1                      := StringListTrim(lstS[  936 - 1]);
spp8fFraction2                      := StringListTrim(lstS[  937 - 1]);
spp8fFraction3                      := StringListTrim(lstS[  938 - 1]);
spp8fFraction4                      := StringListTrim(lstS[  939 - 1]);
spp8fFraction5                      := StringListTrim(lstS[  940 - 1]);
spp8fFraction6                      := StringListTrim(lstS[  941 - 1]);
spp8fFraction7                      := StringListTrim(lstS[  942 - 1]);
spp8fFraction8                      := StringListTrim(lstS[  943 - 1]);
spp8fFraction9                      := StringListTrim(lstS[  944 - 1]);
spp8fFraction10                     := StringListTrim(lstS[  945 - 1]);
spp20fFraction1                     := StringListTrim(lstS[  946 - 1]);
spp20fFraction2                     := StringListTrim(lstS[  947 - 1]);
spp20fFraction3                     := StringListTrim(lstS[  948 - 1]);
spp20fFraction4                     := StringListTrim(lstS[  949 - 1]);
spp20fFraction5                     := StringListTrim(lstS[  950 - 1]);
spp20fFraction6                     := StringListTrim(lstS[  951 - 1]);
spp20fFraction7                     := StringListTrim(lstS[  952 - 1]);
spp20fFraction8                     := StringListTrim(lstS[  953 - 1]);
spp20fFraction9                     := StringListTrim(lstS[  954 - 1]);
spp20fFraction10                    := StringListTrim(lstS[  955 - 1]);
spp22fFraction1                     := StringListTrim(lstS[  956 - 1]);
spp22fFraction2                     := StringListTrim(lstS[  957 - 1]);
spp22fFraction3                     := StringListTrim(lstS[  958 - 1]);
spp22fFraction4                     := StringListTrim(lstS[  959 - 1]);
spp22fFraction5                     := StringListTrim(lstS[  960 - 1]);
spp22fFraction6                     := StringListTrim(lstS[  961 - 1]);
spp22fFraction7                     := StringListTrim(lstS[  962 - 1]);
spp22fFraction8                     := StringListTrim(lstS[  963 - 1]);
spp22fFraction9                     := StringListTrim(lstS[  964 - 1]);
spp22fFraction10                    := StringListTrim(lstS[  965 - 1]);
spp24fFraction1                     := StringListTrim(lstS[  966 - 1]);
spp24fFraction2                     := StringListTrim(lstS[  967 - 1]);
spp24fFraction3                     := StringListTrim(lstS[  968 - 1]);
spp24fFraction4                     := StringListTrim(lstS[  969 - 1]);
spp24fFraction5                     := StringListTrim(lstS[  970 - 1]);
spp24fFraction6                     := StringListTrim(lstS[  971 - 1]);
spp24fFraction7                     := StringListTrim(lstS[  972 - 1]);
spp24fFraction8                     := StringListTrim(lstS[  973 - 1]);
spp24fFraction9                     := StringListTrim(lstS[  974 - 1]);
spp24fFraction10                    := StringListTrim(lstS[  975 - 1]);
spp26fFraction2                     := StringListTrim(lstS[  976 - 1]);
spp26fFraction2                     := StringListTrim(lstS[  977 - 1]);
spp26fFraction3                     := StringListTrim(lstS[  978 - 1]);
spp26fFraction4                     := StringListTrim(lstS[  979 - 1]);
spp26fFraction5                     := StringListTrim(lstS[  980 - 1]);
spp26fFraction6                     := StringListTrim(lstS[  981 - 1]);
spp26fFraction7                     := StringListTrim(lstS[  982 - 1]);
spp26fFraction8                     := StringListTrim(lstS[  983 - 1]);
spp26fFraction9                     := StringListTrim(lstS[  984 - 1]);
spp26fFraction10                    := StringListTrim(lstS[  985 - 1]);
sppFirstFraction1                   := StringListTrim(lstS[  986 - 1]);
sppFirstFraction2                   := StringListTrim(lstS[  987 - 1]);
sppFirstFraction3                   := StringListTrim(lstS[  988 - 1]);
sppFirstFraction4                   := StringListTrim(lstS[  989 - 1]);
sppFirstFraction5                   := StringListTrim(lstS[  990 - 1]);
sppFirstFraction6                   := StringListTrim(lstS[  991 - 1]);
sppFirstFraction7                   := StringListTrim(lstS[  992 - 1]);
sppFirstFraction8                   := StringListTrim(lstS[  993 - 1]);
sppFirstFraction9                   := StringListTrim(lstS[  994 - 1]);
sppFirstFraction10                  := StringListTrim(lstS[  995 - 1]);
sppSecondFraction1                  := StringListTrim(lstS[  996 - 1]);
sppSecondFraction2                  := StringListTrim(lstS[  997 - 1]);
sppSecondFraction3                  := StringListTrim(lstS[  998 - 1]);
sppSecondFraction4                  := StringListTrim(lstS[  999 - 1]);
sppSecondFraction5                  := StringListTrim(lstS[ 1000 - 1]);
sppSecondFraction6                  := StringListTrim(lstS[ 1001 - 1]);
sppSecondFraction7                  := StringListTrim(lstS[ 1002 - 1]);
sppSecondFraction8                  := StringListTrim(lstS[ 1003 - 1]);
sppSecondFraction9                  := StringListTrim(lstS[ 1004 - 1]);
sppSecondFraction10                 := StringListTrim(lstS[ 1005 - 1]);
sppThirdFraction2                   := StringListTrim(lstS[ 1006 - 1]);
sppThirdFraction2                   := StringListTrim(lstS[ 1007 - 1]);
sppThirdFraction3                   := StringListTrim(lstS[ 1008 - 1]);
sppThirdFraction4                   := StringListTrim(lstS[ 1009 - 1]);
sppThirdFraction5                   := StringListTrim(lstS[ 1010 - 1]);
sppThirdFraction6                   := StringListTrim(lstS[ 1011 - 1]);
sppThirdFraction7                   := StringListTrim(lstS[ 1012 - 1]);
sppThirdFraction8                   := StringListTrim(lstS[ 1013 - 1]);
sppThirdFraction9                   := StringListTrim(lstS[ 1014 - 1]);
sppThirdFraction10                  := StringListTrim(lstS[ 1015 - 1]);
sppReserved9_1                      := StringListTrim(lstS[ 1016 - 1]);
sppReserved9_2                      := StringListTrim(lstS[ 1017 - 1]);
sppReserved9_3                      := StringListTrim(lstS[ 1018 - 1]);
sppReserved9_4                      := StringListTrim(lstS[ 1019 - 1]);
sppReserved9_5                      := StringListTrim(lstS[ 1020 - 1]);
sppReserved9_6                      := StringListTrim(lstS[ 1021 - 1]);
sppReserved9_7                      := StringListTrim(lstS[ 1022 - 1]);
sppReserved9_8                      := StringListTrim(lstS[ 1023 - 1]);
sppReserved9_9                      := StringListTrim(lstS[ 1024 - 1]);
sppReserved9_10                     := StringListTrim(lstS[ 1025 - 1]);
sppReserved10_1                     := StringListTrim(lstS[ 1026 - 1]);
sppReserved10_2                     := StringListTrim(lstS[ 1027 - 1]);
sppReserved10_3                     := StringListTrim(lstS[ 1028 - 1]);
sppReserved10_4                     := StringListTrim(lstS[ 1029 - 1]);
sppReserved10_5                     := StringListTrim(lstS[ 1030 - 1]);
sppReserved10_6                     := StringListTrim(lstS[ 1031 - 1]);
sppReserved10_7                     := StringListTrim(lstS[ 1032 - 1]);
sppReserved10_8                     := StringListTrim(lstS[ 1033 - 1]);
sppReserved10_9                     := StringListTrim(lstS[ 1034 - 1]);
sppReserved10_10                    := StringListTrim(lstS[ 1035 - 1]);
sppFinalTime1                       := StringListTrim(lstS[ 1036 - 1]);
sppFinalTime2                       := StringListTrim(lstS[ 1037 - 1]);
sppFinalTime3                       := StringListTrim(lstS[ 1038 - 1]);
sppFinalTime4                       := StringListTrim(lstS[ 1039 - 1]);
sppFinalTime5                       := StringListTrim(lstS[ 1040 - 1]);
sppFinalTime6                       := StringListTrim(lstS[ 1041 - 1]);
sppFinalTime7                       := StringListTrim(lstS[ 1042 - 1]);
sppFinalTime8                       := StringListTrim(lstS[ 1043 - 1]);
sppFinalTime9                       := StringListTrim(lstS[ 1044 - 1]);
sppFinalTime10                      := StringListTrim(lstS[ 1045 - 1]);
sppClaimedCode1                     := StringListTrim(lstS[ 1046 - 1]);
sppClaimedCode2                     := StringListTrim(lstS[ 1047 - 1]);
sppClaimedCode3                     := StringListTrim(lstS[ 1048 - 1]);
sppClaimedCode4                     := StringListTrim(lstS[ 1049 - 1]);
sppClaimedCode5                     := StringListTrim(lstS[ 1050 - 1]);
sppClaimedCode6                     := StringListTrim(lstS[ 1051 - 1]);
sppClaimedCode7                     := StringListTrim(lstS[ 1052 - 1]);
sppClaimedCode8                     := StringListTrim(lstS[ 1053 - 1]);
sppClaimedCode9                     := StringListTrim(lstS[ 1054 - 1]);
sppClaimedCode10                    := StringListTrim(lstS[ 1055 - 1]);
sppTrainer1                         := StringListTrim(lstS[ 1056 - 1]);
sppTrainer2                         := StringListTrim(lstS[ 1057 - 1]);
sppTrainer3                         := StringListTrim(lstS[ 1058 - 1]);
sppTrainer4                         := StringListTrim(lstS[ 1059 - 1]);
sppTrainer5                         := StringListTrim(lstS[ 1060 - 1]);
sppTrainer6                         := StringListTrim(lstS[ 1061 - 1]);
sppTrainer7                         := StringListTrim(lstS[ 1062 - 1]);
sppTrainer8                         := StringListTrim(lstS[ 1063 - 1]);
sppTrainer9                         := StringListTrim(lstS[ 1064 - 1]);
sppTrainer10                        := StringListTrim(lstS[ 1065 - 1]);
sppJockey1                          := StringListTrim(lstS[ 1066 - 1]);
sppJockey2                          := StringListTrim(lstS[ 1067 - 1]);
sppJockey3                          := StringListTrim(lstS[ 1068 - 1]);
sppJockey4                          := StringListTrim(lstS[ 1069 - 1]);
sppJockey5                          := StringListTrim(lstS[ 1070 - 1]);
sppJockey6                          := StringListTrim(lstS[ 1071 - 1]);
sppJockey7                          := StringListTrim(lstS[ 1072 - 1]);
sppJockey8                          := StringListTrim(lstS[ 1073 - 1]);
sppJockey9                          := StringListTrim(lstS[ 1074 - 1]);
sppJockey10                         := StringListTrim(lstS[ 1075 - 1]);
sppApprenticeWgtAllow1              := StringListTrim(lstS[ 1076 - 1]);
sppApprenticeWgtAllow2              := StringListTrim(lstS[ 1077 - 1]);
sppApprenticeWgtAllow3              := StringListTrim(lstS[ 1078 - 1]);
sppApprenticeWgtAllow4              := StringListTrim(lstS[ 1079 - 1]);
sppApprenticeWgtAllow5              := StringListTrim(lstS[ 1080 - 1]);
sppApprenticeWgtAllow6              := StringListTrim(lstS[ 1081 - 1]);
sppApprenticeWgtAllow7              := StringListTrim(lstS[ 1082 - 1]);
sppApprenticeWgtAllow8              := StringListTrim(lstS[ 1083 - 1]);
sppApprenticeWgtAllow9              := StringListTrim(lstS[ 1084 - 1]);
sppApprenticeWgtAllow10             := StringListTrim(lstS[ 1085 - 1]);
sppRaceType1                        := StringListTrim(lstS[ 1086 - 1]);
sppRaceType2                        := StringListTrim(lstS[ 1087 - 1]);
sppRaceType3                        := StringListTrim(lstS[ 1088 - 1]);
sppRaceType4                        := StringListTrim(lstS[ 1089 - 1]);
sppRaceType5                        := StringListTrim(lstS[ 1090 - 1]);
sppRaceType6                        := StringListTrim(lstS[ 1091 - 1]);
sppRaceType7                        := StringListTrim(lstS[ 1092 - 1]);
sppRaceType8                        := StringListTrim(lstS[ 1093 - 1]);
sppRaceType9                        := StringListTrim(lstS[ 1094 - 1]);
sppRaceType10                       := StringListTrim(lstS[ 1095 - 1]);
sppAgeSexRestrict1                  := StringListTrim(lstS[ 1096 - 1]);
sppAgeSexRestrict2                  := StringListTrim(lstS[ 1097 - 1]);
sppAgeSexRestrict3                  := StringListTrim(lstS[ 1098 - 1]);
sppAgeSexRestrict4                  := StringListTrim(lstS[ 1099 - 1]);
sppAgeSexRestrict5                  := StringListTrim(lstS[ 1100 - 1]);
sppAgeSexRestrict6                  := StringListTrim(lstS[ 1101 - 1]);
sppAgeSexRestrict7                  := StringListTrim(lstS[ 1102 - 1]);
sppAgeSexRestrict8                  := StringListTrim(lstS[ 1103 - 1]);
sppAgeSexRestrict9                  := StringListTrim(lstS[ 1104 - 1]);
sppAgeSexRestrict10                 := StringListTrim(lstS[ 1105 - 1]);
sppStateBredFlag1                   := StringListTrim(lstS[ 1106 - 1]);
sppStateBredFlag2                   := StringListTrim(lstS[ 1107 - 1]);
sppStateBredFlag3                   := StringListTrim(lstS[ 1108 - 1]);
sppStateBredFlag4                   := StringListTrim(lstS[ 1109 - 1]);
sppStateBredFlag5                   := StringListTrim(lstS[ 1110 - 1]);
sppStateBredFlag6                   := StringListTrim(lstS[ 1111 - 1]);
sppStateBredFlag7                   := StringListTrim(lstS[ 1112 - 1]);
sppStateBredFlag8                   := StringListTrim(lstS[ 1113 - 1]);
sppStateBredFlag9                   := StringListTrim(lstS[ 1114 - 1]);
sppStateBredFlag10                  := StringListTrim(lstS[ 1115 - 1]);
sppRestrictedQualifierFlag1         := StringListTrim(lstS[ 1116 - 1]);
sppRestrictedQualifierFlag2         := StringListTrim(lstS[ 1117 - 1]);
sppRestrictedQualifierFlag3         := StringListTrim(lstS[ 1118 - 1]);
sppRestrictedQualifierFlag4         := StringListTrim(lstS[ 1119 - 1]);
sppRestrictedQualifierFlag5         := StringListTrim(lstS[ 1120 - 1]);
sppRestrictedQualifierFlag6         := StringListTrim(lstS[ 1121 - 1]);
sppRestrictedQualifierFlag7         := StringListTrim(lstS[ 1122 - 1]);
sppRestrictedQualifierFlag8         := StringListTrim(lstS[ 1123 - 1]);
sppRestrictedQualifierFlag9         := StringListTrim(lstS[ 1124 - 1]);
sppRestrictedQualifierFlag10        := StringListTrim(lstS[ 1125 - 1]);
sppFavoriteIndicator1               := StringListTrim(lstS[ 1126 - 1]);
sppFavoriteIndicator2               := StringListTrim(lstS[ 1127 - 1]);
sppFavoriteIndicator3               := StringListTrim(lstS[ 1128 - 1]);
sppFavoriteIndicator4               := StringListTrim(lstS[ 1129 - 1]);
sppFavoriteIndicator5               := StringListTrim(lstS[ 1130 - 1]);
sppFavoriteIndicator6               := StringListTrim(lstS[ 1131 - 1]);
sppFavoriteIndicator7               := StringListTrim(lstS[ 1132 - 1]);
sppFavoriteIndicator8               := StringListTrim(lstS[ 1133 - 1]);
sppFavoriteIndicator9               := StringListTrim(lstS[ 1134 - 1]);
sppFavoriteIndicator10              := StringListTrim(lstS[ 1135 - 1]);
sppFrontBandages2                   := StringListTrim(lstS[ 1136 - 1]);
sppFrontBandages2                   := StringListTrim(lstS[ 1137 - 1]);
sppFrontBandages3                   := StringListTrim(lstS[ 1138 - 1]);
sppFrontBandages4                   := StringListTrim(lstS[ 1139 - 1]);
sppFrontBandages5                   := StringListTrim(lstS[ 1140 - 1]);
sppFrontBandages6                   := StringListTrim(lstS[ 1141 - 1]);
sppFrontBandages7                   := StringListTrim(lstS[ 1142 - 1]);
sppFrontBandages8                   := StringListTrim(lstS[ 1143 - 1]);
sppFrontBandages9                   := StringListTrim(lstS[ 1144 - 1]);
sppFrontBandages20                  := StringListTrim(lstS[ 1145 - 1]);
sreserved32                         := StringListTrim(lstS[ 1146 - 1]);
strainerCurStarts                   := StringListTrim(lstS[ 1147 - 1]);
strainerCurWins                     := StringListTrim(lstS[ 1148 - 1]);
strainerCurPlaces                   := StringListTrim(lstS[ 1149 - 1]);
sTrainerCurShows                    := StringListTrim(lstS[ 1150 - 1]);
strainerCurROI                      := StringListTrim(lstS[ 1151 - 1]);
strainerPrevStarts                  := StringListTrim(lstS[ 1152 - 1]);
strainerPrevWins                    := StringListTrim(lstS[ 1153 - 1]);
strainerPrevPlaces                  := StringListTrim(lstS[ 1154 - 1]);
sTrainerPrevShows                   := StringListTrim(lstS[ 1155 - 1]);
strainerPrevROI                     := StringListTrim(lstS[ 1156 - 1]);
sjockeyCurStarts                    := StringListTrim(lstS[ 1157 - 1]);
sjockeyCurWins                      := StringListTrim(lstS[ 1158 - 1]);
sjockeyCurPlaces                    := StringListTrim(lstS[ 1159 - 1]);
sjockeyCurShows                     := StringListTrim(lstS[ 1160 - 1]);
sjockeyCurROI                       := StringListTrim(lstS[ 1161 - 1]);
sjockeyPrevStarts                   := StringListTrim(lstS[ 1162 - 1]);
sjockeyPrevWins                     := StringListTrim(lstS[ 1163 - 1]);
sjockeyPrevPlaces                   := StringListTrim(lstS[ 1164 - 1]);
sjockeyPrevShows                    := StringListTrim(lstS[ 1165 - 1]);
sjockeyPrevROI                      := StringListTrim(lstS[ 1166 - 1]);
sbrisSpeedParForClass1              := StringListTrim(lstS[ 1167 - 1]);
sbrisSpeedParForClass2              := StringListTrim(lstS[ 1168 - 1]);
sbrisSpeedParForClass3              := StringListTrim(lstS[ 1169 - 1]);
sbrisSpeedParForClass4              := StringListTrim(lstS[ 1170 - 1]);
sbrisSpeedParForClass5              := StringListTrim(lstS[ 1171 - 1]);
sbrisSpeedParForClass6              := StringListTrim(lstS[ 1172 - 1]);
sbrisSpeedParForClass7              := StringListTrim(lstS[ 1173 - 1]);
sbrisSpeedParForClass8              := StringListTrim(lstS[ 1174 - 1]);
sbrisSpeedParForClass9              := StringListTrim(lstS[ 1175 - 1]);
sbrisSpeedParForClass10             := StringListTrim(lstS[ 1176 - 1]);
ssireStudFee                        := StringListTrim(lstS[ 1177 - 1]);
sbestBrisFastTrack                  := StringListTrim(lstS[ 1178 - 1]);
sbestBrisTurf                       := StringListTrim(lstS[ 1179 - 1]);
sbestBrisOff                        := StringListTrim(lstS[ 1180 - 1]);
sbestBrisDistance                   := StringListTrim(lstS[ 1181 - 1]);
sbarShoe2                           := StringListTrim(lstS[ 1182 - 1]);
sbarShoe2                           := StringListTrim(lstS[ 1183 - 1]);
sbarShoe3                           := StringListTrim(lstS[ 1184 - 1]);
sbarShoe4                           := StringListTrim(lstS[ 1185 - 1]);
sbarShoe5                           := StringListTrim(lstS[ 1186 - 1]);
sbarShoe6                           := StringListTrim(lstS[ 1187 - 1]);
sbarShoe7                           := StringListTrim(lstS[ 1188 - 1]);
sbarShoe8                           := StringListTrim(lstS[ 1189 - 1]);
sbarShoe9                           := StringListTrim(lstS[ 1190 - 1]);
sbarShoe20                          := StringListTrim(lstS[ 1191 - 1]);
scompanyLineCode1                   := StringListTrim(lstS[ 1192 - 1]);
scompanyLineCode2                   := StringListTrim(lstS[ 1193 - 1]);
scompanyLineCode3                   := StringListTrim(lstS[ 1194 - 1]);
scompanyLineCode4                   := StringListTrim(lstS[ 1195 - 1]);
scompanyLineCode5                   := StringListTrim(lstS[ 1196 - 1]);
scompanyLineCode6                   := StringListTrim(lstS[ 1197 - 1]);
scompanyLineCode7                   := StringListTrim(lstS[ 1198 - 1]);
scompanyLineCode8                   := StringListTrim(lstS[ 1199 - 1]);
scompanyLineCode9                   := StringListTrim(lstS[ 1200 - 1]);
scompanyLineCode10                  := StringListTrim(lstS[ 1201 - 1]);
slowClaimingPriceOfRace2            := StringListTrim(lstS[ 1202 - 1]);
slowClaimingPriceOfRace2            := StringListTrim(lstS[ 1203 - 1]);
slowClaimingPriceOfRace3            := StringListTrim(lstS[ 1204 - 1]);
slowClaimingPriceOfRace4            := StringListTrim(lstS[ 1205 - 1]);
slowClaimingPriceOfRace5            := StringListTrim(lstS[ 1206 - 1]);
slowClaimingPriceOfRace6            := StringListTrim(lstS[ 1207 - 1]);
slowClaimingPriceOfRace7            := StringListTrim(lstS[ 1208 - 1]);
slowClaimingPriceOfRace8            := StringListTrim(lstS[ 1209 - 1]);
slowClaimingPriceOfRace9            := StringListTrim(lstS[ 1210 - 1]);
slowClaimingPriceOfRace20           := StringListTrim(lstS[ 1211 - 1]);
shighClaimingPriceOfRace2           := StringListTrim(lstS[ 1212 - 1]);
shighClaimingPriceOfRace2           := StringListTrim(lstS[ 1213 - 1]);
shighClaimingPriceOfRace3           := StringListTrim(lstS[ 1214 - 1]);
shighClaimingPriceOfRace4           := StringListTrim(lstS[ 1215 - 1]);
shighClaimingPriceOfRace5           := StringListTrim(lstS[ 1216 - 1]);
shighClaimingPriceOfRace6           := StringListTrim(lstS[ 1217 - 1]);
shighClaimingPriceOfRace7           := StringListTrim(lstS[ 1218 - 1]);
shighClaimingPriceOfRace8           := StringListTrim(lstS[ 1219 - 1]);
shighClaimingPriceOfRace9           := StringListTrim(lstS[ 1220 - 1]);
shighClaimingPriceOfRace20          := StringListTrim(lstS[ 1221 - 1]);
sauctionPrice                       := StringListTrim(lstS[ 1222 - 1]);
swhenWhereAuction                   := StringListTrim(lstS[ 1223 - 1]);
sreserved33                         := StringListTrim(lstS[ 1224 - 1]);
sreserved34                         := StringListTrim(lstS[ 1225 - 1]);
sreserved35                         := StringListTrim(lstS[ 1226 - 1]);
sreserved36                         := StringListTrim(lstS[ 1227 - 1]);
sreserved37                         := StringListTrim(lstS[ 1228 - 1]);
sreserved38                         := StringListTrim(lstS[ 1229 - 1]);
sreserved39                         := StringListTrim(lstS[ 1230 - 1]);
sreserved40                         := StringListTrim(lstS[ 1231 - 1]);
sreserved42                         := StringListTrim(lstS[ 1232 - 1]);
sreserved42                         := StringListTrim(lstS[ 1233 - 1]);
sreserved43                         := StringListTrim(lstS[ 1234 - 1]);
sreserved44                         := StringListTrim(lstS[ 1235 - 1]);
sreserved45                         := StringListTrim(lstS[ 1236 - 1]);
sreserved46                         := StringListTrim(lstS[ 1237 - 1]);
sreserved47                         := StringListTrim(lstS[ 1238 - 1]);
sreserved48                         := StringListTrim(lstS[ 1239 - 1]);
sreserved49                         := StringListTrim(lstS[ 1240 - 1]);
sreserved50                         := StringListTrim(lstS[ 1241 - 1]);
sreserved52                         := StringListTrim(lstS[ 1242 - 1]);
sreserved52                         := StringListTrim(lstS[ 1243 - 1]);
sreserved53                         := StringListTrim(lstS[ 1244 - 1]);
sreserved54                         := StringListTrim(lstS[ 1245 - 1]);
sreserved55                         := StringListTrim(lstS[ 1246 - 1]);
sreserved56                         := StringListTrim(lstS[ 1247 - 1]);
sreserved57                         := StringListTrim(lstS[ 1248 - 1]);
sreserved58                         := StringListTrim(lstS[ 1249 - 1]);
sreserved59                         := StringListTrim(lstS[ 1250 - 1]);
sreserved60                         := StringListTrim(lstS[ 1251 - 1]);
sreserved62                         := StringListTrim(lstS[ 1252 - 1]);
sreserved62                         := StringListTrim(lstS[ 1253 - 1]);
sstartCode2                         := StringListTrim(lstS[ 1254 - 1]);
sstartCode2                         := StringListTrim(lstS[ 1255 - 1]);
sstartCode3                         := StringListTrim(lstS[ 1256 - 1]);
sstartCode4                         := StringListTrim(lstS[ 1257 - 1]);
sstartCode5                         := StringListTrim(lstS[ 1258 - 1]);
sstartCode6                         := StringListTrim(lstS[ 1259 - 1]);
sstartCode7                         := StringListTrim(lstS[ 1260 - 1]);
sstartCode8                         := StringListTrim(lstS[ 1261 - 1]);
sstartCode9                         := StringListTrim(lstS[ 1262 - 1]);
sstartCode20                        := StringListTrim(lstS[ 1263 - 1]);
sbrisDirtPedigreeRating             := StringListTrim(lstS[ 1264 - 1]);
sbrisMudPedigreeRating              := StringListTrim(lstS[ 1265 - 1]);
sbrisTurfPedigreeRating             := StringListTrim(lstS[ 1266 - 1]);
sbrisDistPedigreeRating             := StringListTrim(lstS[ 1267 - 1]);
sreserved2268                       := StringListTrim(lstS[ 1268 - 1]);
sreserved2269                       := StringListTrim(lstS[ 1269 - 1]);
sreserved2270                       := StringListTrim(lstS[ 1270 - 1]);
sreserved2272                       := StringListTrim(lstS[ 1271 - 1]);
sreserved2272                       := StringListTrim(lstS[ 1272 - 1]);
sreserved2273                       := StringListTrim(lstS[ 1273 - 1]);
sreserved2274                       := StringListTrim(lstS[ 1274 - 1]);
sreserved2275                       := StringListTrim(lstS[ 1275 - 1]);
sreserved2276                       := StringListTrim(lstS[ 1276 - 1]);
sreserved2277                       := StringListTrim(lstS[ 1277 - 1]);
sreserved2278                       := StringListTrim(lstS[ 1278 - 1]);
sreserved2279                       := StringListTrim(lstS[ 1279 - 1]);
sreserved2280                       := StringListTrim(lstS[ 1280 - 1]);
sreserved2282                       := StringListTrim(lstS[ 1281 - 1]);
sreserved2282                       := StringListTrim(lstS[ 1282 - 1]);
sreserved2283                       := StringListTrim(lstS[ 1283 - 1]);
sreserved2284                       := StringListTrim(lstS[ 1284 - 1]);
sreserved2285                       := StringListTrim(lstS[ 1285 - 1]);
sreserved2286                       := StringListTrim(lstS[ 1286 - 1]);
sreserved2287                       := StringListTrim(lstS[ 1287 - 1]);
sreserved2288                       := StringListTrim(lstS[ 1288 - 1]);
sreserved2289                       := StringListTrim(lstS[ 1289 - 1]);
sreserved2290                       := StringListTrim(lstS[ 1290 - 1]);
sreserved2292                       := StringListTrim(lstS[ 1291 - 1]);
sreserved2292                       := StringListTrim(lstS[ 1292 - 1]);
sreserved2293                       := StringListTrim(lstS[ 1293 - 1]);
sreserved2294                       := StringListTrim(lstS[ 1294 - 1]);
sreserved2295                       := StringListTrim(lstS[ 1295 - 1]);
sreserved2296                       := StringListTrim(lstS[ 1296 - 1]);
sreserved2297                       := StringListTrim(lstS[ 1297 - 1]);
sreserved2298                       := StringListTrim(lstS[ 1298 - 1]);
sreserved2299                       := StringListTrim(lstS[ 1299 - 1]);
sreserved2300                       := StringListTrim(lstS[ 1300 - 1]);
sreserved2302                       := StringListTrim(lstS[ 1301 - 1]);
sreserved2302                       := StringListTrim(lstS[ 1302 - 1]);
sreserved2303                       := StringListTrim(lstS[ 1303 - 1]);
sreserved2304                       := StringListTrim(lstS[ 1304 - 1]);
sreserved2305                       := StringListTrim(lstS[ 1305 - 1]);
sreserved2306                       := StringListTrim(lstS[ 1306 - 1]);
sreserved2307                       := StringListTrim(lstS[ 1307 - 1]);
sreserved2308                       := StringListTrim(lstS[ 1308 - 1]);
sreserved2309                       := StringListTrim(lstS[ 1309 - 1]);
sreserved2320                       := StringListTrim(lstS[ 1310 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1311 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1312 - 1]);
sreserved2323                       := StringListTrim(lstS[ 1313 - 1]);
sreserved2324                       := StringListTrim(lstS[ 1314 - 1]);
sreserved2325                       := StringListTrim(lstS[ 1315 - 1]);
sreserved2326                       := StringListTrim(lstS[ 1316 - 1]);
sreserved2327                       := StringListTrim(lstS[ 1317 - 1]);
sreserved2328                       := StringListTrim(lstS[ 1318 - 1]);
sreserved2329                       := StringListTrim(lstS[ 1319 - 1]);
sreserved2320                       := StringListTrim(lstS[ 1320 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1321 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1322 - 1]);
sreserved2323                       := StringListTrim(lstS[ 1323 - 1]);
sreserved2324                       := StringListTrim(lstS[ 1324 - 1]);
sreserved2325                       := StringListTrim(lstS[ 1325 - 1]);
sreserved2326                       := StringListTrim(lstS[ 1326 - 1]);
sreserved2327                       := StringListTrim(lstS[ 1327 - 1]);
sbestBrisLife                       := StringListTrim(lstS[ 1328 - 1]);
sbestBrisMostRecentYear             := StringListTrim(lstS[ 1329 - 1]);
sbestBrisPastYear                   := StringListTrim(lstS[ 1330 - 1]);
sbestBrisTrack                      := StringListTrim(lstS[ 1331 - 1]);
sstarts                             := StringListTrim(lstS[ 1332 - 1]);
swins                               := StringListTrim(lstS[ 1333 - 1]);
splaces                             := StringListTrim(lstS[ 1334 - 1]);
sshows                              := StringListTrim(lstS[ 1335 - 1]);
searnings                           := StringListTrim(lstS[ 1336 - 1]);
skeyTrainerStatCategory2            := StringListTrim(lstS[ 1337 - 1]);
skeyTrainerStatStarts2              := StringListTrim(lstS[ 1338 - 1]);
skeyTrainerStatWinPct2              := StringListTrim(lstS[ 1339 - 1]);
skeyTrainerStatITM2                 := StringListTrim(lstS[ 1340 - 1]);
skeyTrainerStatROI2                 := StringListTrim(lstS[ 1341 - 1]);
skeyTrainerStatCategory2            := StringListTrim(lstS[ 1342 - 1]);
skeyTrainerStatStarts2              := StringListTrim(lstS[ 1343 - 1]);
skeyTrainerStatWinPct2              := StringListTrim(lstS[ 1344 - 1]);
skeyTrainerStatITM2                 := StringListTrim(lstS[ 1345 - 1]);
skeyTrainerStatROI2                 := StringListTrim(lstS[ 1346 - 1]);
skeyTrainerStatCategory3            := StringListTrim(lstS[ 1347 - 1]);
skeyTrainerStatStarts3              := StringListTrim(lstS[ 1348 - 1]);
skeyTrainerStatWinPct3              := StringListTrim(lstS[ 1349 - 1]);
skeyTrainerStatITM3                 := StringListTrim(lstS[ 1350 - 1]);
skeyTrainerStatROI3                 := StringListTrim(lstS[ 1352 - 1]);
skeyTrainerStatCategory4            := StringListTrim(lstS[ 1352 - 1]);
skeyTrainerStatStarts4              := StringListTrim(lstS[ 1353 - 1]);
skeyTrainerStatWinPct4              := StringListTrim(lstS[ 1354 - 1]);
skeyTrainerStatITM4                 := StringListTrim(lstS[ 1355 - 1]);
skeyTrainerStatROI4                 := StringListTrim(lstS[ 1356 - 1]);
skeyTrainerStatCategory5            := StringListTrim(lstS[ 1357 - 1]);
skeyTrainerStatStarts5              := StringListTrim(lstS[ 1358 - 1]);
skeyTrainerStatWinPct5              := StringListTrim(lstS[ 1359 - 1]);
skeyTrainerStatITM5                 := StringListTrim(lstS[ 1360 - 1]);
skeyTrainerStatROI5                 := StringListTrim(lstS[ 1362 - 1]);
skeyTrainerStatCategory6            := StringListTrim(lstS[ 1362 - 1]);
skeyTrainerStatStarts6              := StringListTrim(lstS[ 1363 - 1]);
skeyTrainerStatWinPct6              := StringListTrim(lstS[ 1364 - 1]);
skeyTrainerStatITM6                 := StringListTrim(lstS[ 1365 - 1]);
skeyTrainerStatROI6                 := StringListTrim(lstS[ 1366 - 1]);
sjockeyDistanceOnTurfLabel          := StringListTrim(lstS[ 1367 - 1]);
sjockeyDistanceOnTurfStarts         := StringListTrim(lstS[ 1368 - 1]);
sjockeyDistanceOnTurfWins           := StringListTrim(lstS[ 1369 - 1]);
sjockeyDistanceOnTurfPlaces         := StringListTrim(lstS[ 1370 - 1]);
sjockeyDistanceOnTurfShows          := StringListTrim(lstS[ 1372 - 1]);
sjockeyDistanceOnTurfROI            := StringListTrim(lstS[ 1372 - 1]);
sjockeyDistanceOnTurfEarnings       := StringListTrim(lstS[ 1373 - 1]);
spostTimes                          := StringListTrim(lstS[ 1374 - 1]);
sreserved1375                       := StringListTrim(lstS[ 1375 - 1]);
sreserved1376                       := StringListTrim(lstS[ 1376 - 1]);
sreserved1377                       := StringListTrim(lstS[ 1377 - 1]);
sreserved1378                       := StringListTrim(lstS[ 1378 - 1]);
sreserved1379                       := StringListTrim(lstS[ 1379 - 1]);
sreserved1380                       := StringListTrim(lstS[ 1380 - 1]);
sreserved1381                       := StringListTrim(lstS[ 1381 - 1]);
sreserved1382                       := StringListTrim(lstS[ 1382 - 1]);
sreserved1383                       := StringListTrim(lstS[ 1383 - 1]);
sreserved1384                       := StringListTrim(lstS[ 1384 - 1]);
sreserved1385                       := StringListTrim(lstS[ 1385 - 1]);
sreserved1386                       := StringListTrim(lstS[ 1386 - 1]);
sreserved1387                       := StringListTrim(lstS[ 1387 - 1]);
sreserved1388                       := StringListTrim(lstS[ 1388 - 1]);
sreserved1389                       := StringListTrim(lstS[ 1389 - 1]);
sreserved1390                       := StringListTrim(lstS[ 1390 - 1]);
sreserved1391                       := StringListTrim(lstS[ 1391 - 1]);
sreserved1392                       := StringListTrim(lstS[ 1392 - 1]);
sPPSealed1                          := StringListTrim(lstS[ 1393 - 1]);
sPPSealed2                          := StringListTrim(lstS[ 1394 - 1]);
sPPSealed3                          := StringListTrim(lstS[ 1395 - 1]);
sPPSealed4                          := StringListTrim(lstS[ 1396 - 1]);
sPPSealed5                          := StringListTrim(lstS[ 1397 - 1]);
sPPSealed6                          := StringListTrim(lstS[ 1398 - 1]);
sPPSealed7                          := StringListTrim(lstS[ 1399 - 1]);
sPPSealed8                          := StringListTrim(lstS[ 1400 - 1]);
sPPSealed9                          := StringListTrim(lstS[ 1401 - 1]);
sPPSealed10                         := StringListTrim(lstS[ 1402 - 1]);
sPPAllSurface1                      := StringListTrim(lstS[ 1403 - 1]);
sPPAllSurface2                      := StringListTrim(lstS[ 1404 - 1]);
sPPAllSurface3                      := StringListTrim(lstS[ 1405 - 1]);
sPPAllSurface4                      := StringListTrim(lstS[ 1406 - 1]);
sPPAllSurface5                      := StringListTrim(lstS[ 1407 - 1]);
sPPAllSurface6                      := StringListTrim(lstS[ 1408 - 1]);
sPPAllSurface7                      := StringListTrim(lstS[ 1409 - 1]);
sPPAllSurface8                      := StringListTrim(lstS[ 1410 - 1]);
sPPAllSurface9                      := StringListTrim(lstS[ 1411 - 1]);
sPPAllSurface10                     := StringListTrim(lstS[ 1412 - 1]);
sreserved1413                       := StringListTrim(lstS[ 1413 - 1]);
sreserved1414                       := StringListTrim(lstS[ 1414 - 1]);
sreserved1415                       := StringListTrim(lstS[ 1415 - 1]);
sreserved1416                       := StringListTrim(lstS[ 1416 - 1]);
sreserved1417                       := StringListTrim(lstS[ 1417 - 1]);
sreserved1418                       := StringListTrim(lstS[ 1418 - 1]);
sreserved1419                       := StringListTrim(lstS[ 1419 - 1]);
sreserved1420                       := StringListTrim(lstS[ 1420 - 1]);
sreserved1421                       := StringListTrim(lstS[ 1421 - 1]);
sreserved1422                       := StringListTrim(lstS[ 1422 - 1]);
sreserved1423                       := StringListTrim(lstS[ 1423 - 1]);
sreserved1424                       := StringListTrim(lstS[ 1424 - 1]);
sreserved1425                       := StringListTrim(lstS[ 1425 - 1]);
sreserved1426                       := StringListTrim(lstS[ 1426 - 1]);
sreserved1427                       := StringListTrim(lstS[ 1427 - 1]);
sreserved1428                       := StringListTrim(lstS[ 1428 - 1]);
sreserved1429                       := StringListTrim(lstS[ 1429 - 1]);
sreserved1430                       := StringListTrim(lstS[ 1430 - 1]);
sreserved1431                       := StringListTrim(lstS[ 1431 - 1]);
sreserved1432                       := StringListTrim(lstS[ 1432 - 1]);
sreserved1433                       := StringListTrim(lstS[ 1433 - 1]);
sreserved1434                       := StringListTrim(lstS[ 1434 - 1]);
sreserved1435                       := StringListTrim(lstS[ 1435 - 1]);
sppStretchBeaten1                   : string;                    //    726
sppStretchBeaten2                   : string;                    //    727
sppStretchBeaten3                   : string;                    //    728
sppStretchBeaten4                   : string;                    //    729
sppStretchBeaten5                   : string;                    //    710
sppStretchBeaten6                   : string;                    //    731
sppStretchBeaten7                   : string;                    //    732
sppStretchBeaten8                   : string;                    //    733
sppStretchBeaten9                   : string;                    //    734
sppStretchBeaten10                  : string;                    //    735
sppFinishBeatenMargin1              : string;                    //    736
sppFinishBeatenMargin2              : string;                    //    737
sppFinishBeatenMargin3              : string;                    //    738
sppFinishBeatenMargin4              : string;                    //    739
sppFinishBeatenMargin5              : string;                    //    740
sppFinishBeatenMargin6              : string;                    //    741
sppFinishBeatenMargin7              : string;                    //    742
sppFinishBeatenMargin8              : string;                    //    743
sppFinishBeatenMargin9              : string;                    //    744
sppFinishBeatenMargin10             : string;                    //    745
sppFinishBeaten1                    : string;                    //    746
sppFinishBeaten2                    : string;                    //    747
sppFinishBeaten3                    : string;                    //    748
sppFinishBeaten4                    : string;                    //    749
sppFinishBeaten5                    : string;                    //    750
sppFinishBeaten6                    : string;                    //    751
sppFinishBeaten7                    : string;                    //    752
sppFinishBeaten8                    : string;                    //    753
sppFinishBeaten9                    : string;                    //    754
sppFinishBeaten20                   : string;                    //    755
sppRaceShapeFirstCall1              : string;                    //    756
sppRaceShapeFirstCall2              : string;                    //    757
sppRaceShapeFirstCall3              : string;                    //    758
sppRaceShapeFirstCall4              : string;                    //    759
sppRaceShapeFirstCall5              : string;                    //    760
sppRaceShapeFirstCall6              : string;                    //    761
sppRaceShapeFirstCall7              : string;                    //    762
sppRaceShapeFirstCall8              : string;                    //    763
sppRaceShapeFirstCall9              : string;                    //    764
sppRaceShapeFirstCall10             : string;                    //    765
sppBris2fPaceRating1                : string;                    //    766
sppBris2fPaceRating2                : string;                    //    767
sppBris2fPaceRating3                : string;                    //    768
sppBris2fPaceRating4                : string;                    //    769
sppBris2fPaceRating5                : string;                    //    770
sppBris2fPaceRating6                : string;                    //    771
sppBris2fPaceRating7                : string;                    //    772
sppBris2fPaceRating8                : string;                    //    773
sppBris2fPaceRating9                : string;                    //    774
sppBris2fPaceRating10               : string;                    //    775
sppBris4fPaceRating1                : string;                    //    776
sppBris4fPaceRating2                : string;                    //    777
sppBris4fPaceRating3                : string;                    //    778
sppBris4fPaceRating4                : string;                    //    779
sppBris4fPaceRating5                : string;                    //    780
sppBris4fPaceRating6                : string;                    //    781
sppBris4fPaceRating7                : string;                    //    782
sppBris4fPaceRating8                : string;                    //    783
sppBris4fPaceRating9                : string;                    //    784
sppBris4fPaceRating10               : string;                    //    785
sppBris6fPaceRating1                : string;                    //    786
sppBris6fPaceRating2                : string;                    //    787
sppBris6fPaceRating3                : string;                    //    788
sppBris6fPaceRating4                : string;                    //    789
sppBris6fPaceRating5                : string;                    //    790
sppBris6fPaceRating6                : string;                    //    791
sppBris6fPaceRating7                : string;                    //    792
sppBris6fPaceRating8                : string;                    //    793
sppBris6fPaceRating9                : string;                    //    794
sppBris6fPaceRating10               : string;                    //    795
sppBris8fPaceRating1                : string;                    //    796
sppBris8fPaceRating2                : string;                    //    797
sppBris8fPaceRating3                : string;                    //    798
sppBris8fPaceRating4                : string;                    //    799
sppBris8fPaceRating5                : string;                    //    800
sppBris8fPaceRating6                : string;                    //    801
sppBris8fPaceRating7                : string;                    //    802
sppBris8fPaceRating8                : string;                    //    803
sppBris8fPaceRating9                : string;                    //    804
sppBris8fPaceRating10               : string;                    //    805
sppBris20fPaceRating1               : string;                    //    806
sppBris20fPaceRating2               : string;                    //    807
sppBris20fPaceRating3               : string;                    //    808
sppBris20fPaceRating4               : string;                    //    809
sppBris20fPaceRating5               : string;                    //    810
sppBris20fPaceRating6               : string;                    //    811
sppBris20fPaceRating7               : string;                    //    812
sppBris20fPaceRating8               : string;                    //    813
sppBris20fPaceRating9               : string;                    //    814
sppBris20fPaceRating10              : string;                    //    815
sppBrisLatePaceRating1              : string;                    //    816
sppBrisLatePaceRating2              : string;                    //    817
sppBrisLatePaceRating3              : string;                    //    818
sppBrisLatePaceRating4              : string;                    //    819
sppBrisLatePaceRating5              : string;                    //    820
sppBrisLatePaceRating6              : string;                    //    821
sppBrisLatePaceRating7              : string;                    //    822
sppBrisLatePaceRating8              : string;                    //    823
sppBrisLatePaceRating9              : string;                    //    824
sppBrisLatePaceRating10             : string;                    //    825
sppReserved7_1                      : string;                    //    826
sppReserved7_2                      : string;                    //    827
sppReserved7_3                      : string;                    //    828
sppReserved7_4                      : string;                    //    829
sppReserved7_5                      : string;                    //    810
sppReserved7_6                      : string;                    //    831
sppReserved7_7                      : string;                    //    832
sppReserved7_8                      : string;                    //    833
sppReserved7_9                      : string;                    //    834
sppReserved7_10                     : string;                    //    835
sppReserved8_1                      : string;                    //    836
sppReserved8_2                      : string;                    //    837
sppReserved8_3                      : string;                    //    838
sppReserved8_4                      : string;                    //    839
sppReserved8_5                      : string;                    //    840
sppReserved8_6                      : string;                    //    841
sppReserved8_7                      : string;                    //    842
sppReserved8_8                      : string;                    //    843
sppReserved8_9                      : string;                    //    844
sppReserved8_10                     : string;                    //    845
sppBrisSpeedRating1                 : string;                    //    846
sppBrisSpeedRating2                 : string;                    //    847
sppBrisSpeedRating3                 : string;                    //    848
sppBrisSpeedRating4                 : string;                    //    849
sppBrisSpeedRating5                 : string;                    //    850
sppBrisSpeedRating6                 : string;                    //    851
sppBrisSpeedRating7                 : string;                    //    852
sppBrisSpeedRating8                 : string;                    //    853
sppBrisSpeedRating9                 : string;                    //    854
sppBrisSpeedRating10                : string;                    //    855
sppDRFSpeedRating1                  : string;                    //    856
sppDRFSpeedRating2                  : string;                    //    857
sppDRFSpeedRating3                  : string;                    //    858
sppDRFSpeedRating4                  : string;                    //    859
sppDRFSpeedRating5                  : string;                    //    860
sppDRFSpeedRating6                  : string;                    //    861
sppDRFSpeedRating7                  : string;                    //    862
sppDRFSpeedRating8                  : string;                    //    863
sppDRFSpeedRating9                  : string;                    //    864
sppDRFSpeedRating10                 : string;                    //    865
sppDRFTrackVariant1                 : string;                    //    866
sppDRFTrackVariant2                 : string;                    //    867
sppDRFTrackVariant3                 : string;                    //    868
sppDRFTrackVariant4                 : string;                    //    869
sppDRFTrackVariant5                 : string;                    //    870
sppDRFTrackVariant6                 : string;                    //    871
sppDRFTrackVariant7                 : string;                    //    872
sppDRFTrackVariant8                 : string;                    //    873
sppDRFTrackVariant9                 : string;                    //    874
sppDRFTrackVariant10                : string;                    //    875
spp2fFraction1                      : string;                    //    876
spp2fFraction2                      : string;                    //    877
spp2fFraction3                      : string;                    //    878
spp2fFraction4                      : string;                    //    879
spp2fFraction5                      : string;                    //    880
spp2fFraction6                      : string;                    //    881
spp2fFraction7                      : string;                    //    882
spp2fFraction8                      : string;                    //    883
spp2fFraction9                      : string;                    //    884
spp2fFraction10                     : string;                    //    885
spp3fFraction1                      : string;                    //    886
spp3fFraction2                      : string;                    //    887
spp3fFraction3                      : string;                    //    888
spp3fFraction4                      : string;                    //    889
spp3fFraction5                      : string;                    //    890
spp3fFraction6                      : string;                    //    891
spp3fFraction7                      : string;                    //    892
spp3fFraction8                      : string;                    //    893
spp3fFraction9                      : string;                    //    894
spp3fFraction10                     : string;                    //    895
spp4fFraction1                      : string;                    //    896
spp4fFraction2                      : string;                    //    897
spp4fFraction3                      : string;                    //    898
spp4fFraction4                      : string;                    //    899
spp4fFraction5                      : string;                    //    900
spp4fFraction6                      : string;                    //    901
spp4fFraction7                      : string;                    //    902
spp4fFraction8                      : string;                    //    903
spp4fFraction9                      : string;                    //    904
spp4fFraction10                     : string;                    //    905
spp5fFraction1                      : string;                    //    906
spp5fFraction2                      : string;                    //    907
spp5fFraction3                      : string;                    //    908
spp5fFraction4                      : string;                    //    909
spp5fFraction5                      : string;                    //    910
spp5fFraction6                      : string;                    //    911
spp5fFraction7                      : string;                    //    912
spp5fFraction8                      : string;                    //    913
spp5fFraction9                      : string;                    //    914
spp5fFraction10                     : string;                    //    915
spp6fFraction1                      : string;                    //    916
spp6fFraction2                      : string;                    //    917
spp6fFraction3                      : string;                    //    918
spp6fFraction4                      : string;                    //    919
spp6fFraction5                      : string;                    //    920
spp6fFraction6                      : string;                    //    921
spp6fFraction7                      : string;                    //    922
spp6fFraction8                      : string;                    //    923
spp6fFraction9                      : string;                    //    924
spp6fFraction10                     : string;                    //    925
spp7fFraction1                      : string;                    //    926
spp7fFraction2                      : string;                    //    927
spp7fFraction3                      : string;                    //    928
spp7fFraction4                      : string;                    //    929
spp7fFraction5                      : string;                    //    910
spp7fFraction6                      : string;                    //    931
spp7fFraction7                      : string;                    //    932
spp7fFraction8                      : string;                    //    933
spp7fFraction9                      : string;                    //    934
spp7fFraction10                     : string;                    //    935
spp8fFraction1                      : string;                    //    936
spp8fFraction2                      : string;                    //    937
spp8fFraction3                      : string;                    //    938
spp8fFraction4                      : string;                    //    939
spp8fFraction5                      : string;                    //    940
spp8fFraction6                      : string;                    //    941
spp8fFraction7                      : string;                    //    942
spp8fFraction8                      : string;                    //    943
spp8fFraction9                      : string;                    //    944
spp8fFraction10                     : string;                    //    945
spp20fFraction1                     : string;                    //    946
spp20fFraction2                     : string;                    //    947
spp20fFraction3                     : string;                    //    948
spp20fFraction4                     : string;                    //    949
spp20fFraction5                     : string;                    //    950
spp20fFraction6                     : string;                    //    951
spp20fFraction7                     : string;                    //    952
spp20fFraction8                     : string;                    //    953
spp20fFraction9                     : string;                    //    954
spp20fFraction10                    : string;                    //    955
spp22fFraction1                     : string;                    //    956
spp22fFraction2                     : string;                    //    957
spp22fFraction3                     : string;                    //    958
spp22fFraction4                     : string;                    //    959
spp22fFraction5                     : string;                    //    960
spp22fFraction6                     : string;                    //    961
spp22fFraction7                     : string;                    //    962
spp22fFraction8                     : string;                    //    963
spp22fFraction9                     : string;                    //    964
spp22fFraction10                    : string;                    //    965
spp24fFraction1                     : string;                    //    966
spp24fFraction2                     : string;                    //    967
spp24fFraction3                     : string;                    //    968
spp24fFraction4                     : string;                    //    969
spp24fFraction5                     : string;                    //    970
spp24fFraction6                     : string;                    //    971
spp24fFraction7                     : string;                    //    972
spp24fFraction8                     : string;                    //    973
spp24fFraction9                     : string;                    //    974
spp24fFraction20                    : string;                    //    975
spp26fFraction1                     : string;                    //    976
spp26fFraction2                     : string;                    //    977
spp26fFraction3                     : string;                    //    978
spp26fFraction4                     : string;                    //    979
spp26fFraction5                     : string;                    //    980
spp26fFraction6                     : string;                    //    981
spp26fFraction7                     : string;                    //    982
spp26fFraction8                     : string;                    //    983
spp26fFraction9                     : string;                    //    984
spp26fFraction10                    : string;                    //    985
sppFirstFraction1                   : string;                    //    986
sppFirstFraction2                   : string;                    //    987
sppFirstFraction3                   : string;                    //    988
sppFirstFraction4                   : string;                    //    989
sppFirstFraction5                   : string;                    //    990
sppFirstFraction6                   : string;                    //    991
sppFirstFraction7                   : string;                    //    992
sppFirstFraction8                   : string;                    //    993
sppFirstFraction9                   : string;                    //    994
sppFirstFraction10                  : string;                    //    995
sppSecondFraction1                  : string;                    //    996
sppSecondFraction2                  : string;                    //    997
sppSecondFraction3                  : string;                    //    998
sppSecondFraction4                  : string;                    //    999
sppSecondFraction5                  : string;                    //   1000
sppSecondFraction6                  : string;                    //   1001
sppSecondFraction7                  : string;                    //   1002
sppSecondFraction8                  : string;                    //   1003
sppSecondFraction9                  : string;                    //   1004
sppSecondFraction10                 : string;                    //   1005
sppThirdFraction2                   : string;                    //   1006
sppThirdFraction2                   : string;                    //   1007
sppThirdFraction3                   : string;                    //   1008
sppThirdFraction4                   : string;                    //   1009
sppThirdFraction5                   : string;                    //   1010
sppThirdFraction6                   : string;                    //   1011
sppThirdFraction7                   : string;                    //   1012
sppThirdFraction8                   : string;                    //   1013
sppThirdFraction9                   : string;                    //   1014
sppThirdFraction10                  : string;                    //   1015
sppReserved9_1                      : string;                    //   1016
sppReserved9_2                      : string;                    //   1017
sppReserved9_3                      : string;                    //   1018
sppReserved9_4                      : string;                    //   1019
sppReserved9_5                      : string;                    //   1020
sppReserved9_6                      : string;                    //   1021
sppReserved9_7                      : string;                    //   1022
sppReserved9_8                      : string;                    //   1023
sppReserved9_9                      : string;                    //   1024
sppReserved9_10                     : string;                    //   1025
sppReserved20_1                     : string;                    //   1026
sppReserved20_2                     : string;                    //   1027
sppReserved20_3                     : string;                    //   1028
sppReserved20_4                     : string;                    //   1029
sppReserved20_5                     : string;                    //   1030
sppReserved20_6                     : string;                    //   1031
sppReserved20_7                     : string;                    //   1032
sppReserved20_8                     : string;                    //   1033
sppReserved20_9                     : string;                    //   1034
sppReserved20_10                    : string;                    //   1035
sppFinalTime1                       : string;                    //   1036
sppFinalTime2                       : string;                    //   1037
sppFinalTime3                       : string;                    //   1038
sppFinalTime4                       : string;                    //   1039
sppFinalTime5                       : string;                    //   1040
sppFinalTime6                       : string;                    //   1041
sppFinalTime7                       : string;                    //   1042
sppFinalTime8                       : string;                    //   1043
sppFinalTime9                       : string;                    //   1044
sppFinalTime20                      : string;                    //   1045
sppClaimedCode1                     : string;                    //   1046
sppClaimedCode2                     : string;                    //   1047
sppClaimedCode3                     : string;                    //   1048
sppClaimedCode4                     : string;                    //   1049
sppClaimedCode5                     : string;                    //   1050
sppClaimedCode6                     : string;                    //   1051
sppClaimedCode7                     : string;                    //   1052
sppClaimedCode8                     : string;                    //   1053
sppClaimedCode9                     : string;                    //   1054
sppClaimedCode10                    : string;                    //   1055
sppTrainer1                         : string;                    //   1056
sppTrainer2                         : string;                    //   1057
sppTrainer3                         : string;                    //   1058
sppTrainer4                         : string;                    //   1059
sppTrainer5                         : string;                    //   1060
sppTrainer6                         : string;                    //   1061
sppTrainer7                         : string;                    //   1062
sppTrainer8                         : string;                    //   1063
sppTrainer9                         : string;                    //   1064
sppTrainer10                        : string;                    //   1065
sppJockey1                          : string;                    //   1066
sppJockey2                          : string;                    //   1067
sppJockey3                          : string;                    //   1068
sppJockey4                          : string;                    //   1069
sppJockey5                          : string;                    //   1070
sppJockey6                          : string;                    //   1071
sppJockey7                          : string;                    //   1072
sppJockey8                          : string;                    //   1073
sppJockey9                          : string;                    //   1074
sppJockey10                         : string;                    //   1075
sppApprenticeWgtAllow1              : string;                    //   1076
sppApprenticeWgtAllow2              : string;                    //   1077
sppApprenticeWgtAllow3              : string;                    //   1078
sppApprenticeWgtAllow4              : string;                    //   1079
sppApprenticeWgtAllow5              : string;                    //   1080
sppApprenticeWgtAllow6              : string;                    //   1081
sppApprenticeWgtAllow7              : string;                    //   1082
sppApprenticeWgtAllow8              : string;                    //   1083
sppApprenticeWgtAllow9              : string;                    //   1084
sppApprenticeWgtAllow10             : string;                    //   1085
sppRaceType1                        : string;                    //   1086
sppRaceType2                        : string;                    //   1087
sppRaceType3                        : string;                    //   1088
sppRaceType4                        : string;                    //   1089
sppRaceType5                        : string;                    //   1090
sppRaceType6                        : string;                    //   1091
sppRaceType7                        : string;                    //   1092
sppRaceType8                        : string;                    //   1093
sppRaceType9                        : string;                    //   1094
sppRaceType10                       : string;                    //   1095
sppAgeSexRestrict1                  : string;                    //   1096
sppAgeSexRestrict2                  : string;                    //   1097
sppAgeSexRestrict3                  : string;                    //   1098
sppAgeSexRestrict4                  : string;                    //   1099
sppAgeSexRestrict5                  : string;                    //   1100
sppAgeSexRestrict6                  : string;                    //   1101
sppAgeSexRestrict7                  : string;                    //   1102
sppAgeSexRestrict8                  : string;                    //   1103
sppAgeSexRestrict9                  : string;                    //   1104
sppAgeSexRestrict10                 : string;                    //   1105
sppStateBredFlag1                   : string;                    //   1106
sppStateBredFlag2                   : string;                    //   1107
sppStateBredFlag3                   : string;                    //   1108
sppStateBredFlag4                   : string;                    //   1109
sppStateBredFlag5                   : string;                    //   1110
sppStateBredFlag6                   : string;                    //   1111
sppStateBredFlag7                   : string;                    //   1112
sppStateBredFlag8                   : string;                    //   1113
sppStateBredFlag9                   : string;                    //   1114
sppStateBredFlag10                  : string;                    //   1115
sppRestrictedQualifierFlag1         : string;                    //   1116
sppRestrictedQualifierFlag2         : string;                    //   1117
sppRestrictedQualifierFlag3         : string;                    //   1118
sppRestrictedQualifierFlag4         : string;                    //   1119
sppRestrictedQualifierFlag5         : string;                    //   1120
sppRestrictedQualifierFlag6         : string;                    //   1121
sppRestrictedQualifierFlag7         : string;                    //   1122
sppRestrictedQualifierFlag8         : string;                    //   1123
sppRestrictedQualifierFlag9         : string;                    //   1124
sppRestrictedQualifierFlag10        : string;                    //   1125
sppFavoriteIndicator1               : string;                    //   1126
sppFavoriteIndicator2               : string;                    //   1127
sppFavoriteIndicator3               : string;                    //   1128
sppFavoriteIndicator4               : string;                    //   1129
sppFavoriteIndicator5               : string;                    //   1130
sppFavoriteIndicator6               : string;                    //   1131
sppFavoriteIndicator7               : string;                    //   1132
sppFavoriteIndicator8               : string;                    //   1133
sppFavoriteIndicator9               : string;                    //   1134
sppFavoriteIndicator10              : string;                    //   1135
sppFrontBandages1                   : string;                    //   1136
sppFrontBandages2                   : string;                    //   1137
sppFrontBandages3                   : string;                    //   1138
sppFrontBandages4                   : string;                    //   1139
sppFrontBandages5                   : string;                    //   1140
sppFrontBandages6                   : string;                    //   1141
sppFrontBandages7                   : string;                    //   1142
sppFrontBandages8                   : string;                    //   1143
sppFrontBandages9                   : string;                    //   1144
sppFrontBandages10                  : string;                    //   1145
sreserved32                         : string;                    //   1146
strainerCurStarts                   : string;                    //   1147
strainerCurWins                     : string;                    //   1148
strainerCurPlaces                   : string;                    //   1149
sTrainerCurShows                    : string;                    //   1150
strainerCurROI                      : string;                    //   1151
strainerPrevStarts                  : string;                    //   1152
strainerPrevWins                    : string;                    //   1153
strainerPrevPlaces                  : string;                    //   1154
sTrainerPrevShows                   : string;                    //   1155
strainerPrevROI                     : string;                    //   1156
sjockeyCurStarts                    : string;                    //   1157
sjockeyCurWins                      : string;                    //   1158
sjockeyCurPlaces                    : string;                    //   1159
sjockeyCurShows                     : string;                    //   1160
sjockeyCurROI                       : string;                    //   1161
sjockeyPrevStarts                   : string;                    //   1162
sjockeyPrevWins                     : string;                    //   1163
sjockeyPrevPlaces                   : string;                    //   1164
sjockeyPrevShows                    : string;                    //   1165
sjockeyPrevROI                      : string;                    //   1166
sbrisSpeedParForClass1              : string;                    //   1167
sbrisSpeedParForClass2              : string;                    //   1168
sbrisSpeedParForClass3              : string;                    //   1169
sbrisSpeedParForClass4              : string;                    //   1170
sbrisSpeedParForClass5              : string;                    //   1171
sbrisSpeedParForClass6              : string;                    //   1172
sbrisSpeedParForClass7              : string;                    //   1173
sbrisSpeedParForClass8              : string;                    //   1174
sbrisSpeedParForClass9              : string;                    //   1175
sbrisSpeedParForClass10             : string;                    //   1176
ssireStudFee                        : string;                    //   1177
sbestBrisFastTrack                  : string;                    //   1178
sbestBrisTurf                       : string;                    //   1179
sbestBrisOff                        : string;                    //   1180
sbestBrisDistance                   : string;                    //   1181
sbarShoe1                           : string;                    //   1182
sbarShoe2                           : string;                    //   1183
sbarShoe3                           : string;                    //   1184
sbarShoe4                           : string;                    //   1185
sbarShoe5                           : string;                    //   1186
sbarShoe6                           : string;                    //   1187
sbarShoe7                           : string;                    //   1188
sbarShoe8                           : string;                    //   1189
sbarShoe9                           : string;                    //   1190
sbarShoe10                          : string;                    //   1191
scompanyLineCode1                   : string;                    //   1192
scompanyLineCode2                   : string;                    //   1193
scompanyLineCode3                   : string;                    //   1194
scompanyLineCode4                   : string;                    //   1195
scompanyLineCode5                   : string;                    //   1196
scompanyLineCode6                   : string;                    //   1197
scompanyLineCode7                   : string;                    //   1198
scompanyLineCode8                   : string;                    //   1199
scompanyLineCode9                   : string;                    //   1200
scompanyLineCode10                  : string;                    //   1201
slowClaimingPriceOfRace1            : string;                    //   1202
slowClaimingPriceOfRace2            : string;                    //   1203
slowClaimingPriceOfRace3            : string;                    //   1204
slowClaimingPriceOfRace4            : string;                    //   1205
slowClaimingPriceOfRace5            : string;                    //   1206
slowClaimingPriceOfRace6            : string;                    //   1207
slowClaimingPriceOfRace7            : string;                    //   1208
slowClaimingPriceOfRace8            : string;                    //   1209
slowClaimingPriceOfRace9            : string;                    //   1210
slowClaimingPriceOfRace10           : string;                    //   1211
shighClaimingPriceOfRace1           : string;                    //   1212
shighClaimingPriceOfRace2           : string;                    //   1213
shighClaimingPriceOfRace3           : string;                    //   1214
shighClaimingPriceOfRace4           : string;                    //   1215
shighClaimingPriceOfRace5           : string;                    //   1216
shighClaimingPriceOfRace6           : string;                    //   1217
shighClaimingPriceOfRace7           : string;                    //   1218
shighClaimingPriceOfRace8           : string;                    //   1219
shighClaimingPriceOfRace9           : string;                    //   1220
shighClaimingPriceOfRace10          : string;                    //   1221
sauctionPrice                       : string;                    //   1222
swhenWhereAuction                   : string;                    //   1223
sreserved33                         : string;                    //   1224
sreserved34                         : string;                    //   1225
sreserved35                         : string;                    //   1226
sreserved36                         : string;                    //   1227
sreserved37                         : string;                    //   1228
sreserved38                         : string;                    //   1229
sreserved39                         : string;                    //   1230
sreserved40                         : string;                    //   1231
sreserved42                         : string;                    //   1232
sreserved42                         : string;                    //   1233
sreserved43                         : string;                    //   1234
sreserved44                         : string;                    //   1235
sreserved45                         : string;                    //   1236
sreserved46                         : string;                    //   1237
sreserved47                         : string;                    //   1238
sreserved48                         : string;                    //   1239
sreserved49                         : string;                    //   1240
sreserved50                         : string;                    //   1241
sreserved52                         : string;                    //   1242
sreserved52                         : string;                    //   1243
sreserved53                         : string;                    //   1244
sreserved54                         : string;                    //   1245
sreserved55                         : string;                    //   1246
sreserved56                         : string;                    //   1247
sreserved57                         : string;                    //   1248
sreserved58                         : string;                    //   1249
sreserved59                         : string;                    //   1250
sreserved60                         : string;                    //   1251
sreserved62                         : string;                    //   1252
sreserved62                         : string;                    //   1253
sstartCode2                         : string;                    //   1254
sstartCode2                         : string;                    //   1255
sstartCode3                         : string;                    //   1256
sstartCode4                         : string;                    //   1257
sstartCode5                         : string;                    //   1258
sstartCode6                         : string;                    //   1259
sstartCode7                         : string;                    //   1260
sstartCode8                         : string;                    //   1261
sstartCode9                         : string;                    //   1262
sstartCode20                        : string;                    //   1263
sbrisDirtPedigreeRating             : string;                    //   1264
sbrisMudPedigreeRating              : string;                    //   1265
sbrisTurfPedigreeRating             : string;                    //   1266
sbrisDistPedigreeRating             : string;                    //   1267
sreserved2268                       : string;                    //   1268
sreserved2269                       : string;                    //   1269
sreserved2270                       : string;                    //   1270
sreserved2272                       : string;                    //   1271
sreserved2272                       : string;                    //   1272
sreserved2273                       : string;                    //   1273
sreserved2274                       : string;                    //   1274
sreserved2275                       : string;                    //   1275
sreserved2276                       : string;                    //   1276
sreserved2277                       : string;                    //   1277
sreserved2278                       : string;                    //   1278
sreserved2279                       : string;                    //   1279
sreserved2280                       : string;                    //   1280
sreserved2282                       : string;                    //   1281
sreserved2282                       : string;                    //   1282
sreserved2283                       : string;                    //   1283
sreserved2284                       : string;                    //   1284
sreserved2285                       : string;                    //   1285
sreserved2286                       : string;                    //   1286
sreserved2287                       : string;                    //   1287
sreserved2288                       : string;                    //   1288
sreserved2289                       : string;                    //   1289
sreserved2290                       : string;                    //   1290
sreserved2292                       : string;                    //   1291
sreserved2292                       : string;                    //   1292
sreserved2293                       : string;                    //   1293
sreserved2294                       : string;                    //   1294
sreserved2295                       : string;                    //   1295
sreserved2296                       : string;                    //   1296
sreserved2297                       : string;                    //   1297
sreserved2298                       : string;                    //   1298
sreserved2299                       : string;                    //   1299
sreserved2300                       : string;                    //   1300
sreserved2302                       : string;                    //   1301
sreserved2302                       : string;                    //   1302
sreserved2303                       : string;                    //   1303
sreserved2304                       : string;                    //   1304
sreserved2305                       : string;                    //   1305
sreserved2306                       : string;                    //   1306
sreserved2307                       : string;                    //   1307
sreserved2308                       : string;                    //   1308
sreserved2309                       : string;                    //   1309
sreserved2320                       : string;                    //   1310
sreserved2322                       : string;                    //   1311
sreserved2322                       : string;                    //   1312
sreserved2323                       : string;                    //   1313
sreserved2324                       : string;                    //   1314
sreserved2325                       : string;                    //   1315
sreserved2326                       : string;                    //   1316
sreserved2327                       : string;                    //   1317
sreserved2328                       : string;                    //   1318
sreserved2329                       : string;                    //   1319
sreserved2320                       : string;                    //   1320
sreserved2322                       : string;                    //   1321
sreserved2322                       : string;                    //   1322
sreserved2323                       : string;                    //   1323
sreserved2324                       : string;                    //   1324
sreserved2325                       : string;                    //   1325
sreserved2326                       : string;                    //   1326
sreserved2327                       : string;                    //   1327
sbestBrisLife                       : string;                    //   1328
sbestBrisMostRecentYear             : string;                    //   1329
sbestBrisPastYear                   : string;                    //   1330
sbestBrisTrack                      : string;                    //   1331
sstarts                             : string;                    //   1332
swins                               : string;                    //   1333
splaces                             : string;                    //   1334
sshows                              : string;                    //   1335
searnings                           : string;                    //   1336
skeyTrainerStatCategory2            : string;                    //   1337
skeyTrainerStatStarts2              : string;                    //   1338
skeyTrainerStatWinPct2              : string;                    //   1339
skeyTrainerStatITM2                 : string;                    //   1340
skeyTrainerStatROI2                 : string;                    //   1341
skeyTrainerStatCategory2            : string;                    //   1342
skeyTrainerStatStarts2              : string;                    //   1343
skeyTrainerStatWinPct2              : string;                    //   1344
skeyTrainerStatITM2                 : string;                    //   1345
skeyTrainerStatROI2                 : string;                    //   1346
skeyTrainerStatCategory3            : string;                    //   1347
skeyTrainerStatStarts3              : string;                    //   1348
skeyTrainerStatWinPct3              : string;                    //   1349
skeyTrainerStatITM3                 : string;                    //   1350
skeyTrainerStatROI3                 : string;                    //   1352
skeyTrainerStatCategory4            : string;                    //   1352
skeyTrainerStatStarts4              : string;                    //   1353
skeyTrainerStatWinPct4              : string;                    //   1354
skeyTrainerStatITM4                 : string;                    //   1355
skeyTrainerStatROI4                 : string;                    //   1356
skeyTrainerStatCategory5            : string;                    //   1357
skeyTrainerStatStarts5              : string;                    //   1358
skeyTrainerStatWinPct5              : string;                    //   1359
skeyTrainerStatITM5                 : string;                    //   1360
skeyTrainerStatROI5                 : string;                    //   1362
skeyTrainerStatCategory6            : string;                    //   1362
skeyTrainerStatStarts6              : string;                    //   1363
skeyTrainerStatWinPct6              : string;                    //   1364
skeyTrainerStatITM6                 : string;                    //   1365
skeyTrainerStatROI6                 : string;                    //   1366
sjockeyDistanceOnTurfLabel          : string;                    //   1367
sjockeyDistanceOnTurfStarts         : string;                    //   1368
sjockeyDistanceOnTurfWins           : string;                    //   1369
sjockeyDistanceOnTurfPlaces         : string;                    //   1370
sjockeyDistanceOnTurfShows          : string;                    //   1372
sjockeyDistanceOnTurfROI            : string;                    //   1372
sjockeyDistanceOnTurfEarnings       : string;                    //   1373
spostTimes                          : string;                    //   1374
sreserved1375                       : string;                    //   1375
sreserved1376                       : string;                    //   1376
sreserved1377                       : string;                    //   1377
sreserved1378                       : string;                    //   1378
sreserved1379                       : string;                    //   1379
sreserved1380                       : string;                    //   1380
sreserved1381                       : string;                    //   1381
sreserved1382                       : string;                    //   1382
sreserved1383                       : string;                    //   1383
sreserved1384                       : string;                    //   1384
sreserved1385                       : string;                    //   1385
sreserved1386                       : string;                    //   1386
sreserved1387                       : string;                    //   1387
sreserved1388                       : string;                    //   1388
sreserved1389                       : string;                    //   1389
sreserved1390                       : string;                    //   1390
sreserved1391                       : string;                    //   1391
sreserved1392                       : string;                    //   1392
sPPSealed1                          : string;                    //   1393
sPPSealed2                          : string;                    //   1394
sPPSealed3                          : string;                    //   1395
sPPSealed4                          : string;                    //   1396
sPPSealed5                          : string;                    //   1397
sPPSealed6                          : string;                    //   1398
sPPSealed7                          : string;                    //   1399
sPPSealed8                          : string;                    //   1400
sPPSealed9                          : string;                    //   1401
sPPSealed10                         : string;                    //   1402
sPPAllSurface1                      : string;                    //   1403
sPPAllSurface2                      : string;                    //   1404
sPPAllSurface3                      : string;                    //   1405
sPPAllSurface4                      : string;                    //   1406
sPPAllSurface5                      : string;                    //   1407
sPPAllSurface6                      : string;                    //   1408
sPPAllSurface7                      : string;                    //   1409
sPPAllSurface8                      : string;                    //   1410
sPPAllSurface9                      : string;                    //   1411
sPPAllSurface10                     : string;                    //   1412
sreserved1413                       : string;                    //   1413
sreserved1414                       : string;                    //   1414
sreserved1415                       : string;                    //   1415
sreserved1416                       : string;                    //   1416
sreserved1417                       : string;                    //   1417
sreserved1418                       : string;                    //   1418
sreserved1419                       : string;                    //   1419
sreserved1420                       : string;                    //   1420
sreserved1421                       : string;                    //   1421
sreserved1422                       : string;                    //   1422
sreserved1423                       : string;                    //   1423
sreserved1424                       : string;                    //   1424
sreserved1425                       : string;                    //   1425
sreserved1426                       : string;                    //   1426
sreserved1427                       : string;                    //   1427
sreserved1428                       : string;                    //   1428
sreserved1429                       : string;                    //   1429
sreserved1430                       : string;                    //   1430
sreserved1431                       : string;                    //   1431
sreserved1432                       : string;                    //   1432
sreserved1433                       : string;                    //   1433
sreserved1434                       : string;                    //   1434
sreserved1435                       : string;                    //   1435


begin


procedure TSNImportPCS(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   sFileName: string);
var
   lstPCS: TStringList;

   iRc: integer;
   iIdx: integer;
   iCnt: integer;

   iPos: integer;
   iHPos: integer;
   iFPPos: integer;

   iRaceNbr: integer;
   iLineLen: integer;
   iLineType: integer;

   sFinishPos: string;
   sOfficialFinishPos: string;

   sHorseName: string;
   sHorseNameHH: string;

   sOdds: string;
   sPostPos: string;
   sProgramNbr: string;

   sTmp: string;

   bRoute: boolean;
   msText: TMemoryStream;


   sResults: string;

   iPPIdx: integer;
   iIdxRes: integer;
   iOddsIdx: integer;
   iHorseIdx: integer;
   iFinPosIdx: integer;
   iProgNbrIdx: integer;

   //Race History
   sFootNotes: string;
   sFractionalTimes: string;
   sScratchedHorses: string;
   sOwners: string;
   sOwnerSilks: string;
   sOwner: string;
   sTrainers: string;
   sWeather: string;

   sDailyDoubleNbrs: string;
   fDailyDoubleWager: double;
   fDailyDoublePayout: double;

   sExactaNbrs: string;
   fExactaWager: double;
   fExactaPayout: double;

   sTrifectaNbrs: string;
   fTrifectaWager: double;
   fTrifectaPayout: double;

   sSuperfectaNbrs: string;
   fSuperfectaWager: double;
   fSuperfectaPayout: double;

   sQuinellaNbrs: string;
   fQuinellaWager: double;
   fQuinellaPayout: double;

   sParse: string;
   sPick3Nbrs: string;
   fPick3Wager: double;
   fPick3Payout: double;
   sPick3NbrsLeg1: string;
   sPick3NbrsLeg2: string;
   sPick3NbrsLeg3: string;

   sPick4Nbrs: string;
   fPick4Wager: double;
   fPick4Payout: double;

   sPick6Nbrs: string;
   fPick6Wager: double;
   fPick6Payout: double;

   sWagerNbrs: string;
   fWagerPayout: double;
   sWagerPayout: string;

   sWinNbrs: string;
   sPlcNbrs: string;
   sShoNbrs: string;

   fWinPayout: double;
   fWinPlcPayout: double;
   fWinShoPayout: double;
   fPlcPayout: double;
   fPlcShoPayout: double;
   fShoPayout: double;

   bFavorite: boolean;

   sKey: string;

   lstS: TStringList;
   lstPostTimes: TStringList;

   sTrack: string;
   sDate: string;
   sRaceNbr: string;
   sTSNPowerRating: string;

   sBestTSNSpeedFastTrack: string;
   sBestTSNSpeedTurf: string;
   sBestTSNSpeedOffTrack: string;
   sBestTSNSpeedDistance: string;
   sAuctionSalesPrice: string;
   sWhereSoldAtAuction: string;
   sBestTSNSpeedLife: string;
   sBestTSNSpeedMostRecentYr: string;
   sBestTSNSpeed2ndMostRecentYr: string;
   sBestTSNSpeedTrack: string;

   sTSNLastClassRating: string;
   sTSNAvgClassRating: string;


   s2fPaceFigure: string;
   s4fPaceFigure: string;
   s6fPaceFigure: string;
   s8fPaceFigure: string;
   s10fPaceFigure: string;
   sLatePaceFigure: string;
   sLastSpeedRating: string;

   sPP2fPaceFigure: string;
   sPP4fPaceFigure: string;
   sPP6fPaceFigure: string;
   sPP8fPaceFigure: string;
   sPP10fPaceFigure: string;
   sPPLatePaceFigure: string;

   sPPRaceClassRating: string;
   sPPClassRating: string;

   sPP2fPacePos: string;
   sPP4fPacePos: string;
   sPP6fPacePos: string;
   sPP8fPacePos: string;
   sPP10fPacePos: string;
   sPPLatePacePos: string;
   sPPFinishPos: string;

   sPPOfficialSpeedRating: string;

   sTSNRunStyle: string;
   sEarlySpeedPoints: string;

   iFLD_EARLY_PACE_POS: integer;
   iFLD_EARLY_PACE: integer;
   iFLD_MIDDLE_PACE_POS: integer;
   iFLD_MIDDLE_PACE: integer;
   iFLD_LATE_PACE_POS: integer;
   iFLD_LATE_PACE: integer;
   iFLD_SPD: integer;
   iFLD_CLASS: integer;
   iFLD_RACE_CLASS: integer;

   iFLD_FINISH_PACE_POS: integer;

   iEndLoop: integer;
   iIdxPP: integer;

   fEarlyPacePosH: double;
   fMiddlePacePosH: double;
   fLatePacePosH: double;
   fEarlyPacePosO: double;
   fMiddlePacePosO: double;
   fLatePacePosO: double;
   fFinishPacePosH: double;

   aEarlyPacePosH: array of double;
   aMiddlePacePosH: array of double;
   aLatePacePosH: array of double;
   aEarlyPacePosO: array of double;
   aMiddlePacePosO: array of double;
   aLatePacePosO: array of double;
   aFinishPacePosH: array of double;

   fEarlyPaceH: double;
   fMiddlePaceH: double;
   fLatePaceH: double;

   fEarlyPaceO: double;
   fMiddlePaceO: double;
   fLatePaceO: double;

   aEarlyPaceH: array of double;
   aMiddlePaceH: array of double;
   aLatePaceH: array of double;

   iEarlyPacePosLines: integer;
   iMiddlePacePosLines: integer;
   iLatePacePosLines: integer;
   iFinishPacePosLines: integer;

   iEarlyPaceLines: integer;
   iMiddlePaceLines: integer;
   iLatePaceLines: integer;

   fEarlyPacePos: double;
   fMiddlePacePos: double;
   fLatePacePos: double;
   fFinishPacePos: double;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   fBackClass: double;

   iFLD_TCAT: integer;
   iFLD_TSTS: integer;
   iFLD_TWIN: integer;
   iFLD_TITM: integer;
   iFLD_TROI: integer;

   iIdxKeyTrn: integer;

   sKeyTrnCategory: string;
   iKeyTrnStart: integer;
   fKeyTrnWinPct: double;
   fKeyTrnITMPct: double;
   fKeyTrnROI: double;

   fTrainerStsCY: double;
   fTrainerWinsCY: double;
   fTrainerPlacesCY: double;
   fTrainerShowsCY: double;
   fTrainerROICY: double;

   fTrainerStsPY: double;
   fTrainerWinsPY: double;
   fTrainerPlacesPY: double;
   fTrainerShowsPY: double;
   fTrainerROIPY: double;

   fJockeyStsCY: double;
   fJockeyWinsCY: double;
   fJockeyPlacesCY: double;
   fJockeyShowsCY: double;
   fJockeyROICY: double;

   fJockeyStsPY: double;
   fJockeyWinsPY: double;
   fJockeyPlacesPY: double;
   fJockeyShowsPY: double;
   fJockeyROIPY: double;

   fTotalJkyStarts: double;
   fTotalJkyWins: double;
   fTotalJkyWinPct: double;

   fTotalTrnStarts: double;
   fTotalTrnWins: double;
   fTotalTrnWinPct: double;

   sDirtPedigreeRating: string;
   sMudPedigreeRating: string;
   sTurfPedigreeRating: string;
   sDistPedigreeRating: string;

   fTrainerStsCurrentMeet: double;
   fTrainerWinsCurrentMeet: double;
   fTrainerWinPctCurrentMeet: double;
   fTrainerPlacesCurrentMeet: double;
   fTrainerShowsCureentMeet: double;

   fJockeyStsCurrentMeet: double;
   fJockeyWinsCurrentMeet: double;
   fJockeyWinPctCurrentMeet: double;
   fJockeyPlacesCurrentMeet: double;
   fJockeyShowsCurrentMeet: double;

   iSireTurfLastYearRank: integer;
   iSireGeneralLastYearRank: integer;
   iSireJuvenileLastYearRank: integer;

   iSireTurfThisYearRank: integer;
   iSireGeneralThisYearRank: integer;
   iSireJuvenileThisYearRank: integer;

   fClassRating: double;
   fTurfRating: double;
   fMudRating: double;

   iAge: integer;

   sTodaysRaceClassification: string;
   sRaceConditions: string;
   sTodaysMutuelList: string;
   sWagerTypes: string;
   sPostTimes: string;

   b10CentSuperfectaRace: boolean;
   b50CentTrifectaRace: boolean;
   b50CentPk3Race: boolean;
   b50CentPk4Race: boolean;

   wYear, wMonth, wDay, wHour, wMin, wSec, wMSec: Word;

   sAMPM: string;

begin

   hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
   hLog.AddToLog('Process TSN ProCaps _ ' + sFileName, msevOperation);

   try
      try
         lstPCS := TStringList.Create;
         lstPCS.LoadFromFile(sFileName);

         for iIdx := 0 to lstPCS.Count _ 1 do begin
            sTmp := lstPCS[iIdx];
            sTmp := FastReplace(sTmp, '"', '', True);
            Split(sTmp, ',', lstS);

            iCnt := lstS.Count;

strack                              := StringListTrim(lstS[    1 - 1]);
sraceDate                           := StringListTrim(lstS[    2 - 1]);
sraceNum                            := StringListTrim(lstS[    3 - 1]);
spostPosition                       := StringListTrim(lstS[    4 - 1]);
sentry                              := StringListTrim(lstS[    5 - 1]);
sdistanceYards                      := StringListTrim(lstS[    6 - 1]);
ssurface                            := StringListTrim(lstS[    7 - 1]);
sreserved1                          := StringListTrim(lstS[    8 - 1]);
sraceType                           := StringListTrim(lstS[    9 - 1]);
sageSexRestriction                  := StringListTrim(lstS[   10 - 1]);
stdyRaceClassification              := StringListTrim(lstS[   11 - 1]);
spurse                              := StringListTrim(lstS[   12 - 1]);
sclaimingPrice                      := StringListTrim(lstS[   13 - 1]);
shorseClaimingPrice                 := StringListTrim(lstS[   14 - 1]);
strackRecord                        := StringListTrim(lstS[   15 - 1]);
sraceConditions                     := StringListTrim(lstS[   16 - 1]);
stdyLasixList                       := StringListTrim(lstS[   17 - 1]);
stdyButeList                        := StringListTrim(lstS[   18 - 1]);
stdyCoupledList                     := StringListTrim(lstS[   19 - 1]);
stdyMutelList                       := StringListTrim(lstS[   20 - 1]);
ssimHostTrackCode                   := StringListTrim(lstS[   21 - 1]);
ssimHostTrackRaceNum                := StringListTrim(lstS[   22 - 1]);
sbreedType                          := StringListTrim(lstS[   23 - 1]);
stdyNasalStripChange                := StringListTrim(lstS[   24 - 1]);
sreserved2                          := StringListTrim(lstS[   25 - 1]);
sTodaysAllWeather                   := StringListTrim(lstS[   26 - 1]);
sreserved4                          := StringListTrim(lstS[   27 - 1]);
stdyTrainer                         := StringListTrim(lstS[   28 - 1]);
strainerStats                       := StringListTrim(lstS[   29 - 1]);
strainerWins                        := StringListTrim(lstS[   30 - 1]);
strainerPlaces                      := StringListTrim(lstS[   31 - 1]);
strainerShows                       := StringListTrim(lstS[   32 - 1]);
stdyJockey                          := StringListTrim(lstS[   33 - 1]);
sapprenticeWgtallow                 := StringListTrim(lstS[   34 - 1]);
sjockeySts                          := StringListTrim(lstS[   35 - 1]);
sjockeyWins                         := StringListTrim(lstS[   36 - 1]);
sjockeyPlaces                       := StringListTrim(lstS[   37 - 1]);
sjockeyShows                        := StringListTrim(lstS[   38 - 1]);
stdyOwner                           := StringListTrim(lstS[   39 - 1]);
sownerSilks                         := StringListTrim(lstS[   40 - 1]);
sMTO_AE                             := StringListTrim(lstS[   41 - 1]);
sreserved5                          := StringListTrim(lstS[   42 - 1]);
sprogramNumber                      := StringListTrim(lstS[   43 - 1]);
smorningLine                        := StringListTrim(lstS[   44 - 1]);
shorseName                          := StringListTrim(lstS[   45 - 1]);
syearOfBirth                        := StringListTrim(lstS[   46 - 1]);
sfoalingMonth                       := StringListTrim(lstS[   47 - 1]);
sreserved6                          := StringListTrim(lstS[   48 - 1]);
ssex                                := StringListTrim(lstS[   49 - 1]);
shorseColor                         := StringListTrim(lstS[   50 - 1]);
sweight                             := StringListTrim(lstS[   51 - 1]);
ssire                               := StringListTrim(lstS[   52 - 1]);
ssireSire                           := StringListTrim(lstS[   53 - 1]);
sdam                                := StringListTrim(lstS[   54 - 1]);
sdamsSire                           := StringListTrim(lstS[   55 - 1]);
sbreeder                            := StringListTrim(lstS[   56 - 1]);
sbredState                          := StringListTrim(lstS[   57 - 1]);
sprogramPostPosition                := StringListTrim(lstS[   58 - 1]);
sreserved7                          := StringListTrim(lstS[   59 - 1]);
sreserved8                          := StringListTrim(lstS[   60 - 1]);
sreserved9                          := StringListTrim(lstS[   61 - 1]);
stodaysMeds1                        := StringListTrim(lstS[   62 - 1]);
stodaysMeds2                        := StringListTrim(lstS[   63 - 1]);
sequipmentChange                    := StringListTrim(lstS[   64 - 1]);
sdistStarts                         := StringListTrim(lstS[   65 - 1]);
sdistWins                           := StringListTrim(lstS[   66 - 1]);
sdistPlaces                         := StringListTrim(lstS[   67 - 1]);
sdistShows                          := StringListTrim(lstS[   68 - 1]);
sdistEarnings                       := StringListTrim(lstS[   69 - 1]);
strackStarts                        := StringListTrim(lstS[   70 - 1]);
strackWins                          := StringListTrim(lstS[   71 - 1]);
strackPlaces                        := StringListTrim(lstS[   72 - 1]);
strackShows                         := StringListTrim(lstS[   73 - 1]);
strackEarnings                      := StringListTrim(lstS[   74 - 1]);
sturfStarts                         := StringListTrim(lstS[   75 - 1]);
sturfWins                           := StringListTrim(lstS[   76 - 1]);
sturfPlaces                         := StringListTrim(lstS[   77 - 1]);
sturfShows                          := StringListTrim(lstS[   78 - 1]);
sturfEarnings                       := StringListTrim(lstS[   79 - 1]);
swetStarts                          := StringListTrim(lstS[   80 - 1]);
swetWins                            := StringListTrim(lstS[   81 - 1]);
swetPlaces                          := StringListTrim(lstS[   82 - 1]);
swetShows                           := StringListTrim(lstS[   83 - 1]);
swetEarnings                        := StringListTrim(lstS[   84 - 1]);
scurYear                            := StringListTrim(lstS[   85 - 1]);
scurStarts                          := StringListTrim(lstS[   86 - 1]);
scurWins                            := StringListTrim(lstS[   87 - 1]);
scurPlaces                          := StringListTrim(lstS[   88 - 1]);
scurShows                           := StringListTrim(lstS[   89 - 1]);
scurEarnings                        := StringListTrim(lstS[   90 - 1]);
sprevYear                           := StringListTrim(lstS[   91 - 1]);
sprevStarts                         := StringListTrim(lstS[   92 - 1]);
sprevWins                           := StringListTrim(lstS[   93 - 1]);
sprevPlaces                         := StringListTrim(lstS[   94 - 1]);
sprevShows                          := StringListTrim(lstS[   95 - 1]);
sprevEarnings                       := StringListTrim(lstS[   96 - 1]);
slifeStarts                         := StringListTrim(lstS[   97 - 1]);
slifeWins                           := StringListTrim(lstS[   98 - 1]);
slifePlaces                         := StringListTrim(lstS[   99 - 1]);
slifeShows                          := StringListTrim(lstS[  100 - 1]);
slifeEarnings                       := StringListTrim(lstS[  101 - 1]);
sdateWorkout1                       := StringListTrim(lstS[  102 - 1]);
sdateWorkout2                       := StringListTrim(lstS[  103 - 1]);
sdateWorkout3                       := StringListTrim(lstS[  104 - 1]);
sdateWorkout4                       := StringListTrim(lstS[  105 - 1]);
sdateWorkout5                       := StringListTrim(lstS[  106 - 1]);
sdateWorkout6                       := StringListTrim(lstS[  107 - 1]);
sdateWorkout7                       := StringListTrim(lstS[  108 - 1]);
sdateWorkout8                       := StringListTrim(lstS[  109 - 1]);
sdateWorkout9                       := StringListTrim(lstS[  110 - 1]);
sdateWorkout10                      := StringListTrim(lstS[  111 - 1]);
sdateWorkout11                      := StringListTrim(lstS[  112 - 1]);
sdateWorkout12                      := StringListTrim(lstS[  113 - 1]);
stimeWorkout1                       := StringListTrim(lstS[  114 - 1]);
stimeWorkout2                       := StringListTrim(lstS[  115 - 1]);
stimeWorkout3                       := StringListTrim(lstS[  116 - 1]);
stimeWorkout4                       := StringListTrim(lstS[  117 - 1]);
stimeWorkout5                       := StringListTrim(lstS[  118 - 1]);
stimeWorkout6                       := StringListTrim(lstS[  119 - 1]);
stimeWorkout7                       := StringListTrim(lstS[  120 - 1]);
stimeWorkout8                       := StringListTrim(lstS[  121 - 1]);
stimeWorkout9                       := StringListTrim(lstS[  122 - 1]);
stimeWorkout10                      := StringListTrim(lstS[  123 - 1]);
stimeWorkout11                      := StringListTrim(lstS[  124 - 1]);
stimeWorkout12                      := StringListTrim(lstS[  125 - 1]);
strackWorkout1                      := StringListTrim(lstS[  126 - 1]);
strackWorkout2                      := StringListTrim(lstS[  127 - 1]);
strackWorkout3                      := StringListTrim(lstS[  128 - 1]);
strackWorkout4                      := StringListTrim(lstS[  129 - 1]);
strackWorkout5                      := StringListTrim(lstS[  130 - 1]);
strackWorkout6                      := StringListTrim(lstS[  131 - 1]);
strackWorkout7                      := StringListTrim(lstS[  132 - 1]);
strackWorkout8                      := StringListTrim(lstS[  133 - 1]);
strackWorkout9                      := StringListTrim(lstS[  134 - 1]);
strackWorkout10                     := StringListTrim(lstS[  135 - 1]);
strackWorkout11                     := StringListTrim(lstS[  136 - 1]);
strackWorkout12                     := StringListTrim(lstS[  137 - 1]);
sdistanceWorkout1                   := StringListTrim(lstS[  138 - 1]);
sdistanceWorkout2                   := StringListTrim(lstS[  139 - 1]);
sdistanceWorkout3                   := StringListTrim(lstS[  140 - 1]);
sdistanceWorkout4                   := StringListTrim(lstS[  141 - 1]);
sdistanceWorkout5                   := StringListTrim(lstS[  142 - 1]);
sdistanceWorkout6                   := StringListTrim(lstS[  143 - 1]);
sdistanceWorkout7                   := StringListTrim(lstS[  144 - 1]);
sdistanceWorkout8                   := StringListTrim(lstS[  145 - 1]);
sdistanceWorkout9                   := StringListTrim(lstS[  146 - 1]);
sdistanceWorkout10                  := StringListTrim(lstS[  147 - 1]);
sdistanceWorkout11                  := StringListTrim(lstS[  148 - 1]);
sdistanceWorkout12                  := StringListTrim(lstS[  149 - 1]);
sconditionWorkout1                  := StringListTrim(lstS[  150 - 1]);
sconditionWorkout2                  := StringListTrim(lstS[  151 - 1]);
sconditionWorkout3                  := StringListTrim(lstS[  152 - 1]);
sconditionWorkout4                  := StringListTrim(lstS[  153 - 1]);
sconditionWorkout5                  := StringListTrim(lstS[  154 - 1]);
sconditionWorkout6                  := StringListTrim(lstS[  155 - 1]);
sconditionWorkout7                  := StringListTrim(lstS[  156 - 1]);
sconditionWorkout8                  := StringListTrim(lstS[  157 - 1]);
sconditionWorkout9                  := StringListTrim(lstS[  158 - 1]);
sconditionWorkout10                 := StringListTrim(lstS[  159 - 1]);
sconditionWorkout11                 := StringListTrim(lstS[  160 - 1]);
sconditionWorkout12                 := StringListTrim(lstS[  161 - 1]);
sdescribeWorkout1                   := StringListTrim(lstS[  162 - 1]);
sdescribeWorkout2                   := StringListTrim(lstS[  163 - 1]);
sdescribeWorkout3                   := StringListTrim(lstS[  164 - 1]);
sdescribeWorkout4                   := StringListTrim(lstS[  165 - 1]);
sdescribeWorkout5                   := StringListTrim(lstS[  166 - 1]);
sdescribeWorkout6                   := StringListTrim(lstS[  167 - 1]);
sdescribeWorkout7                   := StringListTrim(lstS[  168 - 1]);
sdescribeWorkout8                   := StringListTrim(lstS[  169 - 1]);
sdescribeWorkout9                   := StringListTrim(lstS[  170 - 1]);
sdescribeWorkout10                  := StringListTrim(lstS[  171 - 1]);
sdescribeWorkout11                  := StringListTrim(lstS[  172 - 1]);
sdescribeWorkout12                  := StringListTrim(lstS[  173 - 1]);
sinnerIndicateWorkout1              := StringListTrim(lstS[  174 - 1]);
sinnerIndicateWorkout2              := StringListTrim(lstS[  175 - 1]);
sinnerIndicateWorkout3              := StringListTrim(lstS[  176 - 1]);
sinnerIndicateWorkout4              := StringListTrim(lstS[  177 - 1]);
sinnerIndicateWorkout5              := StringListTrim(lstS[  178 - 1]);
sinnerIndicateWorkout6              := StringListTrim(lstS[  179 - 1]);
sinnerIndicateWorkout7              := StringListTrim(lstS[  180 - 1]);
sinnerIndicateWorkout8              := StringListTrim(lstS[  181 - 1]);
sinnerIndicateWorkout9              := StringListTrim(lstS[  182 - 1]);
sinnerIndicateWorkout10             := StringListTrim(lstS[  183 - 1]);
sinnerIndicateWorkout11             := StringListTrim(lstS[  184 - 1]);
sinnerIndicateWorkout12             := StringListTrim(lstS[  185 - 1]);
snumWorksWorkout1                   := StringListTrim(lstS[  186 - 1]);
snumWorksWorkout2                   := StringListTrim(lstS[  187 - 1]);
snumWorksWorkout3                   := StringListTrim(lstS[  188 - 1]);
snumWorksWorkout4                   := StringListTrim(lstS[  189 - 1]);
snumWorksWorkout5                   := StringListTrim(lstS[  190 - 1]);
snumWorksWorkout6                   := StringListTrim(lstS[  191 - 1]);
snumWorksWorkout7                   := StringListTrim(lstS[  192 - 1]);
snumWorksWorkout8                   := StringListTrim(lstS[  193 - 1]);
snumWorksWorkout9                   := StringListTrim(lstS[  194 - 1]);
snumWorksWorkout10                  := StringListTrim(lstS[  195 - 1]);
snumWorksWorkout11                  := StringListTrim(lstS[  196 - 1]);
snumWorksWorkout12                  := StringListTrim(lstS[  197 - 1]);
srankWorkout1                       := StringListTrim(lstS[  198 - 1]);
srankWorkout2                       := StringListTrim(lstS[  199 - 1]);
srankWorkout3                       := StringListTrim(lstS[  200 - 1]);
srankWorkout4                       := StringListTrim(lstS[  201 - 1]);
srankWorkout5                       := StringListTrim(lstS[  202 - 1]);
srankWorkout6                       := StringListTrim(lstS[  203 - 1]);
srankWorkout7                       := StringListTrim(lstS[  204 - 1]);
srankWorkout8                       := StringListTrim(lstS[  205 - 1]);
srankWorkout9                       := StringListTrim(lstS[  206 - 1]);
srankWorkout10                      := StringListTrim(lstS[  207 - 1]);
srankWorkout12                      := StringListTrim(lstS[  208 - 1]);
srankWorkout12                      := StringListTrim(lstS[  209 - 1]);
sBrisRunStyle                       := StringListTrim(lstS[  210 - 1]);
sQuirin                             := StringListTrim(lstS[  211 - 1]);
sreserved20                         := StringListTrim(lstS[  212 - 1]);
sreserved22                         := StringListTrim(lstS[  213 - 1]);
stwoFBrisPaceParForLevel            := StringListTrim(lstS[  214 - 1]);
sfourFBrisPaceParForLevel           := StringListTrim(lstS[  215 - 1]);
ssizFBrisPaceParForLevel            := StringListTrim(lstS[  216 - 1]);
sBrisSpeedParForClassLevel          := StringListTrim(lstS[  217 - 1]);
sBrisLatePaceParForLevel            := StringListTrim(lstS[  218 - 1]);
sreserved22                         := StringListTrim(lstS[  219 - 1]);
sreserved23                         := StringListTrim(lstS[  220 - 1]);
sreserved24                         := StringListTrim(lstS[  221 - 1]);
sreserved25                         := StringListTrim(lstS[  222 - 1]);
sreserved26                         := StringListTrim(lstS[  223 - 1]);
sdaysSinceLastRace                  := StringListTrim(lstS[  224 - 1]);
sdrfRaceCondition2                  := StringListTrim(lstS[  225 - 1]);
sdrfRaceCondition2                  := StringListTrim(lstS[  226 - 1]);
sdrfRaceCondition3                  := StringListTrim(lstS[  227 - 1]);
sdrfRaceCondition4                  := StringListTrim(lstS[  228 - 1]);
sdrfRaceCondition5                  := StringListTrim(lstS[  229 - 1]);
sdrfRaceCondition6                  := StringListTrim(lstS[  230 - 1]);
sreserved27                         := StringListTrim(lstS[  231 - 1]);
sreserved28                         := StringListTrim(lstS[  232 - 1]);
sreserved29                         := StringListTrim(lstS[  233 - 1]);
sreserved30                         := StringListTrim(lstS[  234 - 1]);
sreserved32                         := StringListTrim(lstS[  235 - 1]);
sreserved32                         := StringListTrim(lstS[  236 - 1]);
sreserved33                         := StringListTrim(lstS[  237 - 1]);
sreserved34                         := StringListTrim(lstS[  238 - 1]);
sreserved35                         := StringListTrim(lstS[  239 - 1]);
swagerTypes2                        := StringListTrim(lstS[  240 - 1]);
swagerTypes2                        := StringListTrim(lstS[  241 - 1]);
swagerTypes3                        := StringListTrim(lstS[  242 - 1]);
swagerTypes4                        := StringListTrim(lstS[  243 - 1]);
swagerTypes5                        := StringListTrim(lstS[  244 - 1]);
swagerTypes6                        := StringListTrim(lstS[  245 - 1]);
swagerTypes7                        := StringListTrim(lstS[  246 - 1]);
swagerTypes8                        := StringListTrim(lstS[  247 - 1]);
swagerTypes9                        := StringListTrim(lstS[  248 - 1]);
sreserved26                         := StringListTrim(lstS[  249 - 1]);
sreserved27                         := StringListTrim(lstS[  250 - 1]);
sBrisPrimePowerRating               := StringListTrim(lstS[  251 - 1]);
sreserved28                         := StringListTrim(lstS[  252 - 1]);
sreserved29                         := StringListTrim(lstS[  253 - 1]);
sreserved30                         := StringListTrim(lstS[  254 - 1]);
sreserved32                         := StringListTrim(lstS[  255 - 1]);
sppRaceDate2                        := StringListTrim(lstS[  256 - 1]);
sppRaceDate2                        := StringListTrim(lstS[  257 - 1]);
sppRaceDate3                        := StringListTrim(lstS[  258 - 1]);
sppRaceDate4                        := StringListTrim(lstS[  259 - 1]);
sppRaceDate5                        := StringListTrim(lstS[  260 - 1]);
sppRaceDate6                        := StringListTrim(lstS[  261 - 1]);
sppRaceDate7                        := StringListTrim(lstS[  262 - 1]);
sppRaceDate8                        := StringListTrim(lstS[  263 - 1]);
sppRaceDate9                        := StringListTrim(lstS[  264 - 1]);
sppRaceDate10                       := StringListTrim(lstS[  265 - 1]);
sppDaysPrev2                        := StringListTrim(lstS[  266 - 1]);
sppDaysPrev2                        := StringListTrim(lstS[  267 - 1]);
sppDaysPrev3                        := StringListTrim(lstS[  268 - 1]);
sppDaysPrev4                        := StringListTrim(lstS[  269 - 1]);
sppDaysPrev5                        := StringListTrim(lstS[  270 - 1]);
sppDaysPrev6                        := StringListTrim(lstS[  271 - 1]);
sppDaysPrev7                        := StringListTrim(lstS[  272 - 1]);
sppDaysPrev8                        := StringListTrim(lstS[  273 - 1]);
sppDaysPrev9                        := StringListTrim(lstS[  274 - 1]);
sppDaysPrev10                       := StringListTrim(lstS[  275 - 1]);
sppTrackCode2                       := StringListTrim(lstS[  276 - 1]);
sppTrackCode2                       := StringListTrim(lstS[  277 - 1]);
sppTrackCode3                       := StringListTrim(lstS[  278 - 1]);
sppTrackCode4                       := StringListTrim(lstS[  279 - 1]);
sppTrackCode5                       := StringListTrim(lstS[  280 - 1]);
sppTrackCode6                       := StringListTrim(lstS[  281 - 1]);
sppTrackCode7                       := StringListTrim(lstS[  282 - 1]);
sppTrackCode8                       := StringListTrim(lstS[  283 - 1]);
sppTrackCode9                       := StringListTrim(lstS[  284 - 1]);
sppTrackCode10                      := StringListTrim(lstS[  285 - 1]);
sppBrisTrackCode2                   := StringListTrim(lstS[  286 - 1]);
sppBrisTrackCode2                   := StringListTrim(lstS[  287 - 1]);
sppBrisTrackCode3                   := StringListTrim(lstS[  288 - 1]);
sppBrisTrackCode4                   := StringListTrim(lstS[  289 - 1]);
sppBrisTrackCode5                   := StringListTrim(lstS[  290 - 1]);
sppBrisTrackCode6                   := StringListTrim(lstS[  291 - 1]);
sppBrisTrackCode7                   := StringListTrim(lstS[  292 - 1]);
sppBrisTrackCode8                   := StringListTrim(lstS[  293 - 1]);
sppBrisTrackCode9                   := StringListTrim(lstS[  294 - 1]);
sppBrisTrackCode10                  := StringListTrim(lstS[  295 - 1]);
sppRaceNum2                         := StringListTrim(lstS[  296 - 1]);
sppRaceNum2                         := StringListTrim(lstS[  297 - 1]);
sppRaceNum3                         := StringListTrim(lstS[  298 - 1]);
sppRaceNum4                         := StringListTrim(lstS[  299 - 1]);
sppRaceNum5                         := StringListTrim(lstS[  300 - 1]);
sppRaceNum6                         := StringListTrim(lstS[  301 - 1]);
sppRaceNum7                         := StringListTrim(lstS[  302 - 1]);
sppRaceNum8                         := StringListTrim(lstS[  303 - 1]);
sppRaceNum9                         := StringListTrim(lstS[  304 - 1]);
sppRaceNum10                        := StringListTrim(lstS[  305 - 1]);
sppTrackCond2                       := StringListTrim(lstS[  306 - 1]);
sppTrackCond2                       := StringListTrim(lstS[  307 - 1]);
sppTrackCond3                       := StringListTrim(lstS[  308 - 1]);
sppTrackCond4                       := StringListTrim(lstS[  309 - 1]);
sppTrackCond5                       := StringListTrim(lstS[  310 - 1]);
sppTrackCond6                       := StringListTrim(lstS[  311 - 1]);
sppTrackCond7                       := StringListTrim(lstS[  312 - 1]);
sppTrackCond8                       := StringListTrim(lstS[  313 - 1]);
sppTrackCond9                       := StringListTrim(lstS[  314 - 1]);
sppTrackCond10                      := StringListTrim(lstS[  315 - 1]);
sppDistanceYards2                   := StringListTrim(lstS[  316 - 1]);
sppDistanceYards2                   := StringListTrim(lstS[  317 - 1]);
sppDistanceYards3                   := StringListTrim(lstS[  318 - 1]);
sppDistanceYards4                   := StringListTrim(lstS[  319 - 1]);
sppDistanceYards5                   := StringListTrim(lstS[  320 - 1]);
sppDistanceYards6                   := StringListTrim(lstS[  321 - 1]);
sppDistanceYards7                   := StringListTrim(lstS[  322 - 1]);
sppDistanceYards8                   := StringListTrim(lstS[  323 - 1]);
sppDistanceYards9                   := StringListTrim(lstS[  324 - 1]);
sppDistanceYards10                  := StringListTrim(lstS[  325 - 1]);
sppSurface2                         := StringListTrim(lstS[  326 - 1]);
sppSurface2                         := StringListTrim(lstS[  327 - 1]);
sppSurface3                         := StringListTrim(lstS[  328 - 1]);
sppSurface4                         := StringListTrim(lstS[  329 - 1]);
sppSurface5                         := StringListTrim(lstS[  330 - 1]);
sppSurface6                         := StringListTrim(lstS[  331 - 1]);
sppSurface7                         := StringListTrim(lstS[  332 - 1]);
sppSurface8                         := StringListTrim(lstS[  333 - 1]);
sppSurface9                         := StringListTrim(lstS[  334 - 1]);
sppSurface20                        := StringListTrim(lstS[  335 - 1]);
sppSpecialChute2                    := StringListTrim(lstS[  336 - 1]);
sppSpecialChute2                    := StringListTrim(lstS[  337 - 1]);
sppSpecialChute3                    := StringListTrim(lstS[  338 - 1]);
sppSpecialChute4                    := StringListTrim(lstS[  339 - 1]);
sppSpecialChute5                    := StringListTrim(lstS[  340 - 1]);
sppSpecialChute6                    := StringListTrim(lstS[  341 - 1]);
sppSpecialChute7                    := StringListTrim(lstS[  342 - 1]);
sppSpecialChute8                    := StringListTrim(lstS[  343 - 1]);
sppSpecialChute9                    := StringListTrim(lstS[  344 - 1]);
sppSpecialChute10                   := StringListTrim(lstS[  345 - 1]);
sppNumEntrants2                     := StringListTrim(lstS[  346 - 1]);
sppNumEntrants2                     := StringListTrim(lstS[  347 - 1]);
sppNumEntrants3                     := StringListTrim(lstS[  348 - 1]);
sppNumEntrants4                     := StringListTrim(lstS[  349 - 1]);
sppNumEntrants5                     := StringListTrim(lstS[  350 - 1]);
sppNumEntrants6                     := StringListTrim(lstS[  352 - 1]);
sppNumEntrants7                     := StringListTrim(lstS[  352 - 1]);
sppNumEntrants8                     := StringListTrim(lstS[  353 - 1]);
sppNumEntrants9                     := StringListTrim(lstS[  354 - 1]);
sppNumEntrants20                    := StringListTrim(lstS[  355 - 1]);
sppPostPosition2                    := StringListTrim(lstS[  356 - 1]);
sppPostPosition2                    := StringListTrim(lstS[  357 - 1]);
sppPostPosition3                    := StringListTrim(lstS[  358 - 1]);
sppPostPosition4                    := StringListTrim(lstS[  359 - 1]);
sppPostPosition5                    := StringListTrim(lstS[  360 - 1]);
sppPostPosition6                    := StringListTrim(lstS[  362 - 1]);
sppPostPosition7                    := StringListTrim(lstS[  362 - 1]);
sppPostPosition8                    := StringListTrim(lstS[  363 - 1]);
sppPostPosition9                    := StringListTrim(lstS[  364 - 1]);
sppPostPosition10                   := StringListTrim(lstS[  365 - 1]);
sppEquipment2                       := StringListTrim(lstS[  366 - 1]);
sppEquipment2                       := StringListTrim(lstS[  367 - 1]);
sppEquipment3                       := StringListTrim(lstS[  368 - 1]);
sppEquipment4                       := StringListTrim(lstS[  369 - 1]);
sppEquipment5                       := StringListTrim(lstS[  370 - 1]);
sppEquipment6                       := StringListTrim(lstS[  372 - 1]);
sppEquipment7                       := StringListTrim(lstS[  372 - 1]);
sppEquipment8                       := StringListTrim(lstS[  373 - 1]);
sppEquipment9                       := StringListTrim(lstS[  374 - 1]);
sppEquipment20                      := StringListTrim(lstS[  375 - 1]);
sppReserved2_2                      := StringListTrim(lstS[  376 - 1]);
sppReserved2_2                      := StringListTrim(lstS[  377 - 1]);
sppReserved2_3                      := StringListTrim(lstS[  378 - 1]);
sppReserved2_4                      := StringListTrim(lstS[  379 - 1]);
sppReserved2_5                      := StringListTrim(lstS[  380 - 1]);
sppReserved2_6                      := StringListTrim(lstS[  382 - 1]);
sppReserved2_7                      := StringListTrim(lstS[  382 - 1]);
sppReserved2_8                      := StringListTrim(lstS[  383 - 1]);
sppReserved2_9                      := StringListTrim(lstS[  384 - 1]);
sppReserved2_10                     := StringListTrim(lstS[  385 - 1]);
sppMeds2                            := StringListTrim(lstS[  386 - 1]);
sppMeds2                            := StringListTrim(lstS[  387 - 1]);
sppMeds3                            := StringListTrim(lstS[  388 - 1]);
sppMeds4                            := StringListTrim(lstS[  389 - 1]);
sppMeds5                            := StringListTrim(lstS[  390 - 1]);
sppMeds6                            := StringListTrim(lstS[  392 - 1]);
sppMeds7                            := StringListTrim(lstS[  392 - 1]);
sppMeds8                            := StringListTrim(lstS[  393 - 1]);
sppMeds9                            := StringListTrim(lstS[  394 - 1]);
sppMeds20                           := StringListTrim(lstS[  395 - 1]);
sppTripComment1                     := StringListTrim(lstS[  396 - 1]);
sppTripComment2                     := StringListTrim(lstS[  397 - 1]);
sppTripComment3                     := StringListTrim(lstS[  398 - 1]);
sppTripComment4                     := StringListTrim(lstS[  399 - 1]);
sppTripComment5                     := StringListTrim(lstS[  400 - 1]);
sppTripComment6                     := StringListTrim(lstS[  401 - 1]);
sppTripComment7                     := StringListTrim(lstS[  402 - 1]);
sppTripComment8                     := StringListTrim(lstS[  403 - 1]);
sppTripComment9                     := StringListTrim(lstS[  404 - 1]);
sppTripComment20                    := StringListTrim(lstS[  405 - 1]);
sppWinnersName2                     := StringListTrim(lstS[  406 - 1]);
sppWinnersName2                     := StringListTrim(lstS[  407 - 1]);
sppWinnersName3                     := StringListTrim(lstS[  408 - 1]);
sppWinnersName4                     := StringListTrim(lstS[  409 - 1]);
sppWinnersName5                     := StringListTrim(lstS[  410 - 1]);
sppWinnersName6                     := StringListTrim(lstS[  411 - 1]);
sppWinnersName7                     := StringListTrim(lstS[  412 - 1]);
sppWinnersName8                     := StringListTrim(lstS[  413 - 1]);
sppWinnersName9                     := StringListTrim(lstS[  414 - 1]);
sppWinnersName20                    := StringListTrim(lstS[  415 - 1]);
spp2ndPlaceName2                    := StringListTrim(lstS[  416 - 1]);
spp2ndPlaceName2                    := StringListTrim(lstS[  417 - 1]);
spp2ndPlaceName3                    := StringListTrim(lstS[  418 - 1]);
spp2ndPlaceName4                    := StringListTrim(lstS[  419 - 1]);
spp2ndPlaceName5                    := StringListTrim(lstS[  420 - 1]);
spp2ndPlaceName6                    := StringListTrim(lstS[  421 - 1]);
spp2ndPlaceName7                    := StringListTrim(lstS[  422 - 1]);
spp2ndPlaceName8                    := StringListTrim(lstS[  423 - 1]);
spp2ndPlaceName9                    := StringListTrim(lstS[  424 - 1]);
spp2ndPlaceName20                   := StringListTrim(lstS[  425 - 1]);
spp3rdPlaceName2                    := StringListTrim(lstS[  426 - 1]);
spp3rdPlaceName2                    := StringListTrim(lstS[  427 - 1]);
spp3rdPlaceName3                    := StringListTrim(lstS[  428 - 1]);
spp3rdPlaceName4                    := StringListTrim(lstS[  429 - 1]);
spp3rdPlaceName5                    := StringListTrim(lstS[  430 - 1]);
spp3rdPlaceName6                    := StringListTrim(lstS[  431 - 1]);
spp3rdPlaceName7                    := StringListTrim(lstS[  432 - 1]);
spp3rdPlaceName8                    := StringListTrim(lstS[  433 - 1]);
spp3rdPlaceName9                    := StringListTrim(lstS[  434 - 1]);
spp3rdPlaceName20                   := StringListTrim(lstS[  435 - 1]);
sppWinnersWeight2                   := StringListTrim(lstS[  436 - 1]);
sppWinnersWeight2                   := StringListTrim(lstS[  437 - 1]);
sppWinnersWeight3                   := StringListTrim(lstS[  438 - 1]);
sppWinnersWeight4                   := StringListTrim(lstS[  439 - 1]);
sppWinnersWeight5                   := StringListTrim(lstS[  440 - 1]);
sppWinnersWeight6                   := StringListTrim(lstS[  441 - 1]);
sppWinnersWeight7                   := StringListTrim(lstS[  442 - 1]);
sppWinnersWeight8                   := StringListTrim(lstS[  443 - 1]);
sppWinnersWeight9                   := StringListTrim(lstS[  444 - 1]);
sppWinnersWeight20                  := StringListTrim(lstS[  445 - 1]);
spp2ndPlaceWeight2                  := StringListTrim(lstS[  446 - 1]);
spp2ndPlaceWeight2                  := StringListTrim(lstS[  447 - 1]);
spp2ndPlaceWeight3                  := StringListTrim(lstS[  448 - 1]);
spp2ndPlaceWeight4                  := StringListTrim(lstS[  449 - 1]);
spp2ndPlaceWeight5                  := StringListTrim(lstS[  450 - 1]);
spp2ndPlaceWeight6                  := StringListTrim(lstS[  451 - 1]);
spp2ndPlaceWeight7                  := StringListTrim(lstS[  452 - 1]);
spp2ndPlaceWeight8                  := StringListTrim(lstS[  453 - 1]);
spp2ndPlaceWeight9                  := StringListTrim(lstS[  454 - 1]);
spp2ndPlaceWeight20                 := StringListTrim(lstS[  455 - 1]);
spp3rdPlaceWeight2                  := StringListTrim(lstS[  456 - 1]);
spp3rdPlaceWeight2                  := StringListTrim(lstS[  457 - 1]);
spp3rdPlaceWeight3                  := StringListTrim(lstS[  458 - 1]);
spp3rdPlaceWeight4                  := StringListTrim(lstS[  459 - 1]);
spp3rdPlaceWeight5                  := StringListTrim(lstS[  460 - 1]);
spp3rdPlaceWeight6                  := StringListTrim(lstS[  461 - 1]);
spp3rdPlaceWeight7                  := StringListTrim(lstS[  462 - 1]);
spp3rdPlaceWeight8                  := StringListTrim(lstS[  463 - 1]);
spp3rdPlaceWeight9                  := StringListTrim(lstS[  464 - 1]);
spp3rdPlaceWeight20                 := StringListTrim(lstS[  465 - 1]);
sppWinnersMargin2                   := StringListTrim(lstS[  466 - 1]);
sppWinnersMargin2                   := StringListTrim(lstS[  467 - 1]);
sppWinnersMargin3                   := StringListTrim(lstS[  468 - 1]);
sppWinnersMargin4                   := StringListTrim(lstS[  469 - 1]);
sppWinnersMargin5                   := StringListTrim(lstS[  470 - 1]);
sppWinnersMargin6                   := StringListTrim(lstS[  472 - 1]);
sppWinnersMargin7                   := StringListTrim(lstS[  472 - 1]);
sppWinnersMargin8                   := StringListTrim(lstS[  473 - 1]);
sppWinnersMargin9                   := StringListTrim(lstS[  474 - 1]);
sppWinnersMargin20                  := StringListTrim(lstS[  475 - 1]);
spp2ndPlaceMargin2                  := StringListTrim(lstS[  476 - 1]);
spp2ndPlaceMargin2                  := StringListTrim(lstS[  477 - 1]);
spp2ndPlaceMargin3                  := StringListTrim(lstS[  478 - 1]);
spp2ndPlaceMargin4                  := StringListTrim(lstS[  479 - 1]);
spp2ndPlaceMargin5                  := StringListTrim(lstS[  480 - 1]);
spp2ndPlaceMargin6                  := StringListTrim(lstS[  481 - 1]);
spp2ndPlaceMargin7                  := StringListTrim(lstS[  482 - 1]);
spp2ndPlaceMargin8                  := StringListTrim(lstS[  483 - 1]);
spp2ndPlaceMargin9                  := StringListTrim(lstS[  484 - 1]);
spp2ndPlaceMargin20                 := StringListTrim(lstS[  485 - 1]);
spp3rdPlaceMargin2                  := StringListTrim(lstS[  486 - 1]);
spp3rdPlaceMargin2                  := StringListTrim(lstS[  487 - 1]);
spp3rdPlaceMargin3                  := StringListTrim(lstS[  488 - 1]);
spp3rdPlaceMargin4                  := StringListTrim(lstS[  489 - 1]);
spp3rdPlaceMargin5                  := StringListTrim(lstS[  490 - 1]);
spp3rdPlaceMargin6                  := StringListTrim(lstS[  492 - 1]);
spp3rdPlaceMargin7                  := StringListTrim(lstS[  492 - 1]);
spp3rdPlaceMargin8                  := StringListTrim(lstS[  493 - 1]);
spp3rdPlaceMargin9                  := StringListTrim(lstS[  494 - 1]);
spp3rdPlaceMargin20                 := StringListTrim(lstS[  495 - 1]);
sppExtraComment1                    := StringListTrim(lstS[  496 - 1]);
sppExtraComment2                    := StringListTrim(lstS[  497 - 1]);
sppExtraComment3                    := StringListTrim(lstS[  498 - 1]);
sppExtraComment4                    := StringListTrim(lstS[  499 - 1]);
sppExtraComment5                    := StringListTrim(lstS[  500 - 1]);
sppExtraComment6                    := StringListTrim(lstS[  501 - 1]);
sppExtraComment7                    := StringListTrim(lstS[  502 - 1]);
sppExtraComment8                    := StringListTrim(lstS[  503 - 1]);
sppExtraComment9                    := StringListTrim(lstS[  504 - 1]);
sppExtraComment20                   := StringListTrim(lstS[  505 - 1]);
sppWeight2                          := StringListTrim(lstS[  506 - 1]);
sppWeight2                          := StringListTrim(lstS[  507 - 1]);
sppWeight3                          := StringListTrim(lstS[  508 - 1]);
sppWeight4                          := StringListTrim(lstS[  509 - 1]);
sppWeight5                          := StringListTrim(lstS[  510 - 1]);
sppWeight6                          := StringListTrim(lstS[  511 - 1]);
sppWeight7                          := StringListTrim(lstS[  512 - 1]);
sppWeight8                          := StringListTrim(lstS[  513 - 1]);
sppWeight9                          := StringListTrim(lstS[  514 - 1]);
sppWeight20                         := StringListTrim(lstS[  515 - 1]);
sppOdds2                            := StringListTrim(lstS[  516 - 1]);
sppOdds2                            := StringListTrim(lstS[  517 - 1]);
sppOdds3                            := StringListTrim(lstS[  518 - 1]);
sppOdds4                            := StringListTrim(lstS[  519 - 1]);
sppOdds5                            := StringListTrim(lstS[  520 - 1]);
sppOdds6                            := StringListTrim(lstS[  521 - 1]);
sppOdds7                            := StringListTrim(lstS[  522 - 1]);
sppOdds8                            := StringListTrim(lstS[  523 - 1]);
sppOdds9                            := StringListTrim(lstS[  524 - 1]);
sppOdds20                           := StringListTrim(lstS[  525 - 1]);
sppEntry2                           := StringListTrim(lstS[  526 - 1]);
sppEntry2                           := StringListTrim(lstS[  527 - 1]);
sppEntry3                           := StringListTrim(lstS[  528 - 1]);
sppEntry4                           := StringListTrim(lstS[  529 - 1]);
sppEntry5                           := StringListTrim(lstS[  510 - 1]);
sppEntry6                           := StringListTrim(lstS[  531 - 1]);
sppEntry7                           := StringListTrim(lstS[  532 - 1]);
sppEntry8                           := StringListTrim(lstS[  533 - 1]);
sppEntry9                           := StringListTrim(lstS[  534 - 1]);
sppEntry20                          := StringListTrim(lstS[  535 - 1]);
sppRaceClassification2              := StringListTrim(lstS[  536 - 1]);
sppRaceClassification2              := StringListTrim(lstS[  537 - 1]);
sppRaceClassification3              := StringListTrim(lstS[  538 - 1]);
sppRaceClassification4              := StringListTrim(lstS[  539 - 1]);
sppRaceClassification5              := StringListTrim(lstS[  540 - 1]);
sppRaceClassification6              := StringListTrim(lstS[  541 - 1]);
sppRaceClassification7              := StringListTrim(lstS[  542 - 1]);
sppRaceClassification8              := StringListTrim(lstS[  543 - 1]);
sppRaceClassification9              := StringListTrim(lstS[  544 - 1]);
sppRaceClassification20             := StringListTrim(lstS[  545 - 1]);
sppClaimingPriceHorse2              := StringListTrim(lstS[  546 - 1]);
sppClaimingPriceHorse2              := StringListTrim(lstS[  547 - 1]);
sppClaimingPriceHorse3              := StringListTrim(lstS[  548 - 1]);
sppClaimingPriceHorse4              := StringListTrim(lstS[  549 - 1]);
sppClaimingPriceHorse5              := StringListTrim(lstS[  550 - 1]);
sppClaimingPriceHorse6              := StringListTrim(lstS[  551 - 1]);
sppClaimingPriceHorse7              := StringListTrim(lstS[  552 - 1]);
sppClaimingPriceHorse8              := StringListTrim(lstS[  553 - 1]);
sppClaimingPriceHorse9              := StringListTrim(lstS[  554 - 1]);
sppClaimingPriceHorse20             := StringListTrim(lstS[  555 - 1]);
sppPurse2                           := StringListTrim(lstS[  556 - 1]);
sppPurse2                           := StringListTrim(lstS[  557 - 1]);
sppPurse3                           := StringListTrim(lstS[  558 - 1]);
sppPurse4                           := StringListTrim(lstS[  559 - 1]);
sppPurse5                           := StringListTrim(lstS[  560 - 1]);
sppPurse6                           := StringListTrim(lstS[  561 - 1]);
sppPurse7                           := StringListTrim(lstS[  562 - 1]);
sppPurse8                           := StringListTrim(lstS[  563 - 1]);
sppPurse9                           := StringListTrim(lstS[  564 - 1]);
sppPurse20                          := StringListTrim(lstS[  565 - 1]);
sppStartingCallPos2                 := StringListTrim(lstS[  566 - 1]);
sppStartingCallPos2                 := StringListTrim(lstS[  567 - 1]);
sppStartingCallPos3                 := StringListTrim(lstS[  568 - 1]);
sppStartingCallPos4                 := StringListTrim(lstS[  569 - 1]);
sppStartingCallPos5                 := StringListTrim(lstS[  570 - 1]);
sppStartingCallPos6                 := StringListTrim(lstS[  571 - 1]);
sppStartingCallPos7                 := StringListTrim(lstS[  572 - 1]);
sppStartingCallPos8                 := StringListTrim(lstS[  573 - 1]);
sppStartingCallPos9                 := StringListTrim(lstS[  574 - 1]);
sppStartingCallPos20                := StringListTrim(lstS[  575 - 1]);
sppFirstCallPos2                    := StringListTrim(lstS[  576 - 1]);
sppFirstCallPos2                    := StringListTrim(lstS[  577 - 1]);
sppFirstCallPos3                    := StringListTrim(lstS[  578 - 1]);
sppFirstCallPos4                    := StringListTrim(lstS[  579 - 1]);
sppFirstCallPos5                    := StringListTrim(lstS[  580 - 1]);
sppFirstCallPos6                    := StringListTrim(lstS[  581 - 1]);
sppFirstCallPos7                    := StringListTrim(lstS[  582 - 1]);
sppFirstCallPos8                    := StringListTrim(lstS[  583 - 1]);
sppFirstCallPos9                    := StringListTrim(lstS[  584 - 1]);
sppFirstCallPos20                   := StringListTrim(lstS[  585 - 1]);
sppSecondCallPos2                   := StringListTrim(lstS[  586 - 1]);
sppSecondCallPos2                   := StringListTrim(lstS[  587 - 1]);
sppSecondCallPos3                   := StringListTrim(lstS[  588 - 1]);
sppSecondCallPos4                   := StringListTrim(lstS[  589 - 1]);
sppSecondCallPos5                   := StringListTrim(lstS[  590 - 1]);
sppSecondCallPos6                   := StringListTrim(lstS[  591 - 1]);
sppSecondCallPos7                   := StringListTrim(lstS[  592 - 1]);
sppSecondCallPos8                   := StringListTrim(lstS[  593 - 1]);
sppSecondCallPos9                   := StringListTrim(lstS[  594 - 1]);
sppSecondCallPos20                  := StringListTrim(lstS[  595 - 1]);
sppReserved3_2                      := StringListTrim(lstS[  596 - 1]);
sppReserved3_2                      := StringListTrim(lstS[  597 - 1]);
sppReserved3_3                      := StringListTrim(lstS[  598 - 1]);
sppReserved3_4                      := StringListTrim(lstS[  599 - 1]);
sppReserved3_5                      := StringListTrim(lstS[  600 - 1]);
sppReserved3_6                      := StringListTrim(lstS[  601 - 1]);
sppReserved3_7                      := StringListTrim(lstS[  602 - 1]);
sppReserved3_8                      := StringListTrim(lstS[  603 - 1]);
sppReserved3_9                      := StringListTrim(lstS[  604 - 1]);
sppReserved3_20                     := StringListTrim(lstS[  605 - 1]);
sppStretchPos2                      := StringListTrim(lstS[  606 - 1]);
sppStretchPos2                      := StringListTrim(lstS[  607 - 1]);
sppStretchPos3                      := StringListTrim(lstS[  608 - 1]);
sppStretchPos4                      := StringListTrim(lstS[  609 - 1]);
sppStretchPos5                      := StringListTrim(lstS[  610 - 1]);
sppStretchPos6                      := StringListTrim(lstS[  611 - 1]);
sppStretchPos7                      := StringListTrim(lstS[  612 - 1]);
sppStretchPos8                      := StringListTrim(lstS[  613 - 1]);
sppStretchPos9                      := StringListTrim(lstS[  614 - 1]);
sppStretchPos20                     := StringListTrim(lstS[  615 - 1]);
sppFinishPos2                       := StringListTrim(lstS[  616 - 1]);
sppFinishPos2                       := StringListTrim(lstS[  617 - 1]);
sppFinishPos3                       := StringListTrim(lstS[  618 - 1]);
sppFinishPos4                       := StringListTrim(lstS[  619 - 1]);
sppFinishPos5                       := StringListTrim(lstS[  620 - 1]);
sppFinishPos6                       := StringListTrim(lstS[  621 - 1]);
sppFinishPos7                       := StringListTrim(lstS[  622 - 1]);
sppFinishPos8                       := StringListTrim(lstS[  623 - 1]);
sppFinishPos9                       := StringListTrim(lstS[  624 - 1]);
sppFinishPos20                      := StringListTrim(lstS[  625 - 1]);
sppMoneyPos2                        := StringListTrim(lstS[  626 - 1]);
sppMoneyPos2                        := StringListTrim(lstS[  627 - 1]);
sppMoneyPos3                        := StringListTrim(lstS[  628 - 1]);
sppMoneyPos4                        := StringListTrim(lstS[  629 - 1]);
sppMoneyPos5                        := StringListTrim(lstS[  610 - 1]);
sppMoneyPos6                        := StringListTrim(lstS[  631 - 1]);
sppMoneyPos7                        := StringListTrim(lstS[  632 - 1]);
sppMoneyPos8                        := StringListTrim(lstS[  633 - 1]);
sppMoneyPos9                        := StringListTrim(lstS[  634 - 1]);
sppMoneyPos20                       := StringListTrim(lstS[  635 - 1]);
sppStartCallBeatenMargin2           := StringListTrim(lstS[  636 - 1]);
sppStartCallBeatenMargin2           := StringListTrim(lstS[  637 - 1]);
sppStartCallBeatenMargin3           := StringListTrim(lstS[  638 - 1]);
sppStartCallBeatenMargin4           := StringListTrim(lstS[  639 - 1]);
sppStartCallBeatenMargin5           := StringListTrim(lstS[  640 - 1]);
sppStartCallBeatenMargin6           := StringListTrim(lstS[  641 - 1]);
sppStartCallBeatenMargin7           := StringListTrim(lstS[  642 - 1]);
sppStartCallBeatenMargin8           := StringListTrim(lstS[  643 - 1]);
sppStartCallBeatenMargin9           := StringListTrim(lstS[  644 - 1]);
sppStartCallBeatenMargin20          := StringListTrim(lstS[  645 - 1]);
sppStartCallBeaten2                 := StringListTrim(lstS[  646 - 1]);
sppStartCallBeaten2                 := StringListTrim(lstS[  647 - 1]);
sppStartCallBeaten3                 := StringListTrim(lstS[  648 - 1]);
sppStartCallBeaten4                 := StringListTrim(lstS[  649 - 1]);
sppStartCallBeaten5                 := StringListTrim(lstS[  650 - 1]);
sppStartCallBeaten6                 := StringListTrim(lstS[  651 - 1]);
sppStartCallBeaten7                 := StringListTrim(lstS[  652 - 1]);
sppStartCallBeaten8                 := StringListTrim(lstS[  653 - 1]);
sppStartCallBeaten9                 := StringListTrim(lstS[  654 - 1]);
sppStartCallBeaten20                := StringListTrim(lstS[  655 - 1]);
sppFirstCallBeatenMargin2           := StringListTrim(lstS[  656 - 1]);
sppFirstCallBeatenMargin2           := StringListTrim(lstS[  657 - 1]);
sppFirstCallBeatenMargin3           := StringListTrim(lstS[  658 - 1]);
sppFirstCallBeatenMargin4           := StringListTrim(lstS[  659 - 1]);
sppFirstCallBeatenMargin5           := StringListTrim(lstS[  660 - 1]);
sppFirstCallBeatenMargin6           := StringListTrim(lstS[  661 - 1]);
sppFirstCallBeatenMargin7           := StringListTrim(lstS[  662 - 1]);
sppFirstCallBeatenMargin8           := StringListTrim(lstS[  663 - 1]);
sppFirstCallBeatenMargin9           := StringListTrim(lstS[  664 - 1]);
sppFirstCallBeatenMargin20          := StringListTrim(lstS[  665 - 1]);
sppFirstCallBeaten2                 := StringListTrim(lstS[  666 - 1]);
sppFirstCallBeaten2                 := StringListTrim(lstS[  667 - 1]);
sppFirstCallBeaten3                 := StringListTrim(lstS[  668 - 1]);
sppFirstCallBeaten4                 := StringListTrim(lstS[  669 - 1]);
sppFirstCallBeaten5                 := StringListTrim(lstS[  670 - 1]);
sppFirstCallBeaten6                 := StringListTrim(lstS[  671 - 1]);
sppFirstCallBeaten7                 := StringListTrim(lstS[  672 - 1]);
sppFirstCallBeaten8                 := StringListTrim(lstS[  673 - 1]);
sppFirstCallBeaten9                 := StringListTrim(lstS[  674 - 1]);
sppFirstCallBeaten20                := StringListTrim(lstS[  675 - 1]);
sppSecondCallBeatenMargin2          := StringListTrim(lstS[  676 - 1]);
sppSecondCallBeatenMargin2          := StringListTrim(lstS[  677 - 1]);
sppSecondCallBeatenMargin3          := StringListTrim(lstS[  678 - 1]);
sppSecondCallBeatenMargin4          := StringListTrim(lstS[  679 - 1]);
sppSecondCallBeatenMargin5          := StringListTrim(lstS[  680 - 1]);
sppSecondCallBeatenMargin6          := StringListTrim(lstS[  681 - 1]);
sppSecondCallBeatenMargin7          := StringListTrim(lstS[  682 - 1]);
sppSecondCallBeatenMargin8          := StringListTrim(lstS[  683 - 1]);
sppSecondCallBeatenMargin9          := StringListTrim(lstS[  684 - 1]);
sppSecondCallBeatenMargin20         := StringListTrim(lstS[  685 - 1]);
sppSecondCallBeaten2                := StringListTrim(lstS[  686 - 1]);
sppSecondCallBeaten2                := StringListTrim(lstS[  687 - 1]);
sppSecondCallBeaten3                := StringListTrim(lstS[  688 - 1]);
sppSecondCallBeaten4                := StringListTrim(lstS[  689 - 1]);
sppSecondCallBeaten5                := StringListTrim(lstS[  690 - 1]);
sppSecondCallBeaten6                := StringListTrim(lstS[  691 - 1]);
sppSecondCallBeaten7                := StringListTrim(lstS[  692 - 1]);
sppSecondCallBeaten8                := StringListTrim(lstS[  693 - 1]);
sppSecondCallBeaten9                := StringListTrim(lstS[  694 - 1]);
sppSecondCallBeaten20               := StringListTrim(lstS[  695 - 1]);
sppRaceShape2ndCall1                := StringListTrim(lstS[  696 - 1]);
sppRaceShape2ndCall2                := StringListTrim(lstS[  697 - 1]);
sppRaceShape2ndCall3                := StringListTrim(lstS[  698 - 1]);
sppRaceShape2ndCall4                := StringListTrim(lstS[  699 - 1]);
sppRaceShape2ndCall5                := StringListTrim(lstS[  700 - 1]);
sppRaceShape2ndCall6                := StringListTrim(lstS[  701 - 1]);
sppRaceShape2ndCall7                := StringListTrim(lstS[  702 - 1]);
sppRaceShape2ndCall8                := StringListTrim(lstS[  703 - 1]);
sppRaceShape2ndCall9                := StringListTrim(lstS[  704 - 1]);
sppRaceShape2ndCall10               := StringListTrim(lstS[  705 - 1]);
sppReserved5_2                      := StringListTrim(lstS[  706 - 1]);
sppReserved5_2                      := StringListTrim(lstS[  707 - 1]);
sppReserved5_3                      := StringListTrim(lstS[  708 - 1]);
sppReserved5_4                      := StringListTrim(lstS[  709 - 1]);
sppReserved5_5                      := StringListTrim(lstS[  710 - 1]);
sppReserved5_6                      := StringListTrim(lstS[  711 - 1]);
sppReserved5_7                      := StringListTrim(lstS[  712 - 1]);
sppReserved5_8                      := StringListTrim(lstS[  713 - 1]);
sppReserved5_9                      := StringListTrim(lstS[  714 - 1]);
sppReserved5_20                     := StringListTrim(lstS[  715 - 1]);
sppStretchBeatenMargin2             := StringListTrim(lstS[  716 - 1]);
sppStretchBeatenMargin2             := StringListTrim(lstS[  717 - 1]);
sppStretchBeatenMargin3             := StringListTrim(lstS[  718 - 1]);
sppStretchBeatenMargin4             := StringListTrim(lstS[  719 - 1]);
sppStretchBeatenMargin5             := StringListTrim(lstS[  720 - 1]);
sppStretchBeatenMargin6             := StringListTrim(lstS[  721 - 1]);
sppStretchBeatenMargin7             := StringListTrim(lstS[  722 - 1]);
sppStretchBeatenMargin8             := StringListTrim(lstS[  723 - 1]);
sppStretchBeatenMargin9             := StringListTrim(lstS[  724 - 1]);
sppStretchBeatenMargin20            := StringListTrim(lstS[  725 - 1]);
sppStretchBeaten2                   := StringListTrim(lstS[  726 - 1]);
sppStretchBeaten2                   := StringListTrim(lstS[  727 - 1]);
sppStretchBeaten3                   := StringListTrim(lstS[  728 - 1]);
sppStretchBeaten4                   := StringListTrim(lstS[  729 - 1]);
sppStretchBeaten5                   := StringListTrim(lstS[  710 - 1]);
sppStretchBeaten6                   := StringListTrim(lstS[  731 - 1]);
sppStretchBeaten7                   := StringListTrim(lstS[  732 - 1]);
sppStretchBeaten8                   := StringListTrim(lstS[  733 - 1]);
sppStretchBeaten9                   := StringListTrim(lstS[  734 - 1]);
sppStretchBeaten20                  := StringListTrim(lstS[  735 - 1]);
sppFinishBeatenMargin2              := StringListTrim(lstS[  736 - 1]);
sppFinishBeatenMargin2              := StringListTrim(lstS[  737 - 1]);
sppFinishBeatenMargin3              := StringListTrim(lstS[  738 - 1]);
sppFinishBeatenMargin4              := StringListTrim(lstS[  739 - 1]);
sppFinishBeatenMargin5              := StringListTrim(lstS[  740 - 1]);
sppFinishBeatenMargin6              := StringListTrim(lstS[  741 - 1]);
sppFinishBeatenMargin7              := StringListTrim(lstS[  742 - 1]);
sppFinishBeatenMargin8              := StringListTrim(lstS[  743 - 1]);
sppFinishBeatenMargin9              := StringListTrim(lstS[  744 - 1]);
sppFinishBeatenMargin20             := StringListTrim(lstS[  745 - 1]);
sppFinishBeaten2                    := StringListTrim(lstS[  746 - 1]);
sppFinishBeaten2                    := StringListTrim(lstS[  747 - 1]);
sppFinishBeaten3                    := StringListTrim(lstS[  748 - 1]);
sppFinishBeaten4                    := StringListTrim(lstS[  749 - 1]);
sppFinishBeaten5                    := StringListTrim(lstS[  750 - 1]);
sppFinishBeaten6                    := StringListTrim(lstS[  751 - 1]);
sppFinishBeaten7                    := StringListTrim(lstS[  752 - 1]);
sppFinishBeaten8                    := StringListTrim(lstS[  753 - 1]);
sppFinishBeaten9                    := StringListTrim(lstS[  754 - 1]);
sppFinishBeaten20                   := StringListTrim(lstS[  755 - 1]);
sppRaceShapeFirstCall1              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall2              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall3              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall4              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall5              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall6              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall7              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall8              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall9              := StringListTrim(lstS[    7 - 1]);
sppRaceShapeFirstCall10             := StringListTrim(lstS[    7 - 1]);
sppBris2fPaceRating2                := StringListTrim(lstS[  766 - 1]);
sppBris2fPaceRating2                := StringListTrim(lstS[  767 - 1]);
sppBris2fPaceRating3                := StringListTrim(lstS[  768 - 1]);
sppBris2fPaceRating4                := StringListTrim(lstS[  769 - 1]);
sppBris2fPaceRating5                := StringListTrim(lstS[  770 - 1]);
sppBris2fPaceRating6                := StringListTrim(lstS[  771 - 1]);
sppBris2fPaceRating7                := StringListTrim(lstS[  772 - 1]);
sppBris2fPaceRating8                := StringListTrim(lstS[  773 - 1]);
sppBris2fPaceRating9                := StringListTrim(lstS[  774 - 1]);
sppBris2fPaceRating20               := StringListTrim(lstS[  775 - 1]);
sppBris4fPaceRating2                := StringListTrim(lstS[  776 - 1]);
sppBris4fPaceRating2                := StringListTrim(lstS[  777 - 1]);
sppBris4fPaceRating3                := StringListTrim(lstS[  778 - 1]);
sppBris4fPaceRating4                := StringListTrim(lstS[  779 - 1]);
sppBris4fPaceRating5                := StringListTrim(lstS[  780 - 1]);
sppBris4fPaceRating6                := StringListTrim(lstS[  781 - 1]);
sppBris4fPaceRating7                := StringListTrim(lstS[  782 - 1]);
sppBris4fPaceRating8                := StringListTrim(lstS[  783 - 1]);
sppBris4fPaceRating9                := StringListTrim(lstS[  784 - 1]);
sppBris4fPaceRating20               := StringListTrim(lstS[  785 - 1]);
sppBris6fPaceRating2                := StringListTrim(lstS[  786 - 1]);
sppBris6fPaceRating2                := StringListTrim(lstS[  787 - 1]);
sppBris6fPaceRating3                := StringListTrim(lstS[  788 - 1]);
sppBris6fPaceRating4                := StringListTrim(lstS[  789 - 1]);
sppBris6fPaceRating5                := StringListTrim(lstS[  790 - 1]);
sppBris6fPaceRating6                := StringListTrim(lstS[  791 - 1]);
sppBris6fPaceRating7                := StringListTrim(lstS[  792 - 1]);
sppBris6fPaceRating8                := StringListTrim(lstS[  793 - 1]);
sppBris6fPaceRating9                := StringListTrim(lstS[  794 - 1]);
sppBris6fPaceRating20               := StringListTrim(lstS[  795 - 1]);
sppBris8fPaceRating2                := StringListTrim(lstS[  796 - 1]);
sppBris8fPaceRating2                := StringListTrim(lstS[  797 - 1]);
sppBris8fPaceRating3                := StringListTrim(lstS[  798 - 1]);
sppBris8fPaceRating4                := StringListTrim(lstS[  799 - 1]);
sppBris8fPaceRating5                := StringListTrim(lstS[  800 - 1]);
sppBris8fPaceRating6                := StringListTrim(lstS[  801 - 1]);
sppBris8fPaceRating7                := StringListTrim(lstS[  802 - 1]);
sppBris8fPaceRating8                := StringListTrim(lstS[  803 - 1]);
sppBris8fPaceRating9                := StringListTrim(lstS[  804 - 1]);
sppBris8fPaceRating20               := StringListTrim(lstS[  805 - 1]);
sppBris20fPaceRating2               := StringListTrim(lstS[  806 - 1]);
sppBris20fPaceRating2               := StringListTrim(lstS[  807 - 1]);
sppBris20fPaceRating3               := StringListTrim(lstS[  808 - 1]);
sppBris20fPaceRating4               := StringListTrim(lstS[  809 - 1]);
sppBris20fPaceRating5               := StringListTrim(lstS[  810 - 1]);
sppBris20fPaceRating6               := StringListTrim(lstS[  811 - 1]);
sppBris20fPaceRating7               := StringListTrim(lstS[  812 - 1]);
sppBris20fPaceRating8               := StringListTrim(lstS[  813 - 1]);
sppBris20fPaceRating9               := StringListTrim(lstS[  814 - 1]);
sppBris20fPaceRating20              := StringListTrim(lstS[  815 - 1]);
sppBrisLatePaceRating2              := StringListTrim(lstS[  816 - 1]);
sppBrisLatePaceRating2              := StringListTrim(lstS[  817 - 1]);
sppBrisLatePaceRating3              := StringListTrim(lstS[  818 - 1]);
sppBrisLatePaceRating4              := StringListTrim(lstS[  819 - 1]);
sppBrisLatePaceRating5              := StringListTrim(lstS[  820 - 1]);
sppBrisLatePaceRating6              := StringListTrim(lstS[  821 - 1]);
sppBrisLatePaceRating7              := StringListTrim(lstS[  822 - 1]);
sppBrisLatePaceRating8              := StringListTrim(lstS[  823 - 1]);
sppBrisLatePaceRating9              := StringListTrim(lstS[  824 - 1]);
sppBrisLatePaceRating20             := StringListTrim(lstS[  825 - 1]);
sppReserved7_2                      := StringListTrim(lstS[  826 - 1]);
sppReserved7_2                      := StringListTrim(lstS[  827 - 1]);
sppReserved7_3                      := StringListTrim(lstS[  828 - 1]);
sppReserved7_4                      := StringListTrim(lstS[  829 - 1]);
sppReserved7_5                      := StringListTrim(lstS[  810 - 1]);
sppReserved7_6                      := StringListTrim(lstS[  831 - 1]);
sppReserved7_7                      := StringListTrim(lstS[  832 - 1]);
sppReserved7_8                      := StringListTrim(lstS[  833 - 1]);
sppReserved7_9                      := StringListTrim(lstS[  834 - 1]);
sppReserved7_20                     := StringListTrim(lstS[  835 - 1]);
sppReserved8_2                      := StringListTrim(lstS[  836 - 1]);
sppReserved8_2                      := StringListTrim(lstS[  837 - 1]);
sppReserved8_3                      := StringListTrim(lstS[  838 - 1]);
sppReserved8_4                      := StringListTrim(lstS[  839 - 1]);
sppReserved8_5                      := StringListTrim(lstS[  840 - 1]);
sppReserved8_6                      := StringListTrim(lstS[  841 - 1]);
sppReserved8_7                      := StringListTrim(lstS[  842 - 1]);
sppReserved8_8                      := StringListTrim(lstS[  843 - 1]);
sppReserved8_9                      := StringListTrim(lstS[  844 - 1]);
sppReserved8_20                     := StringListTrim(lstS[  845 - 1]);
sppBrisSpeedRating2                 := StringListTrim(lstS[  846 - 1]);
sppBrisSpeedRating2                 := StringListTrim(lstS[  847 - 1]);
sppBrisSpeedRating3                 := StringListTrim(lstS[  848 - 1]);
sppBrisSpeedRating4                 := StringListTrim(lstS[  849 - 1]);
sppBrisSpeedRating5                 := StringListTrim(lstS[  850 - 1]);
sppBrisSpeedRating6                 := StringListTrim(lstS[  851 - 1]);
sppBrisSpeedRating7                 := StringListTrim(lstS[  852 - 1]);
sppBrisSpeedRating8                 := StringListTrim(lstS[  853 - 1]);
sppBrisSpeedRating9                 := StringListTrim(lstS[  854 - 1]);
sppBrisSpeedRating20                := StringListTrim(lstS[  855 - 1]);
sppDRFSpeedRating2                  := StringListTrim(lstS[  856 - 1]);
sppDRFSpeedRating2                  := StringListTrim(lstS[  857 - 1]);
sppDRFSpeedRating3                  := StringListTrim(lstS[  858 - 1]);
sppDRFSpeedRating4                  := StringListTrim(lstS[  859 - 1]);
sppDRFSpeedRating5                  := StringListTrim(lstS[  860 - 1]);
sppDRFSpeedRating6                  := StringListTrim(lstS[  861 - 1]);
sppDRFSpeedRating7                  := StringListTrim(lstS[  862 - 1]);
sppDRFSpeedRating8                  := StringListTrim(lstS[  863 - 1]);
sppDRFSpeedRating9                  := StringListTrim(lstS[  864 - 1]);
sppDRFSpeedRating20                 := StringListTrim(lstS[  865 - 1]);
sppDRFTrackVariant2                 := StringListTrim(lstS[  866 - 1]);
sppDRFTrackVariant2                 := StringListTrim(lstS[  867 - 1]);
sppDRFTrackVariant3                 := StringListTrim(lstS[  868 - 1]);
sppDRFTrackVariant4                 := StringListTrim(lstS[  869 - 1]);
sppDRFTrackVariant5                 := StringListTrim(lstS[  870 - 1]);
sppDRFTrackVariant6                 := StringListTrim(lstS[  871 - 1]);
sppDRFTrackVariant7                 := StringListTrim(lstS[  872 - 1]);
sppDRFTrackVariant8                 := StringListTrim(lstS[  873 - 1]);
sppDRFTrackVariant9                 := StringListTrim(lstS[  874 - 1]);
sppDRFTrackVariant20                := StringListTrim(lstS[  875 - 1]);
spp2fFraction2                      := StringListTrim(lstS[  876 - 1]);
spp2fFraction2                      := StringListTrim(lstS[  877 - 1]);
spp2fFraction3                      := StringListTrim(lstS[  878 - 1]);
spp2fFraction4                      := StringListTrim(lstS[  879 - 1]);
spp2fFraction5                      := StringListTrim(lstS[  880 - 1]);
spp2fFraction6                      := StringListTrim(lstS[  881 - 1]);
spp2fFraction7                      := StringListTrim(lstS[  882 - 1]);
spp2fFraction8                      := StringListTrim(lstS[  883 - 1]);
spp2fFraction9                      := StringListTrim(lstS[  884 - 1]);
spp2fFraction20                     := StringListTrim(lstS[  885 - 1]);
spp3fFraction2                      := StringListTrim(lstS[  886 - 1]);
spp3fFraction2                      := StringListTrim(lstS[  887 - 1]);
spp3fFraction3                      := StringListTrim(lstS[  888 - 1]);
spp3fFraction4                      := StringListTrim(lstS[  889 - 1]);
spp3fFraction5                      := StringListTrim(lstS[  890 - 1]);
spp3fFraction6                      := StringListTrim(lstS[  891 - 1]);
spp3fFraction7                      := StringListTrim(lstS[  892 - 1]);
spp3fFraction8                      := StringListTrim(lstS[  893 - 1]);
spp3fFraction9                      := StringListTrim(lstS[  894 - 1]);
spp3fFraction20                     := StringListTrim(lstS[  895 - 1]);
spp4fFraction2                      := StringListTrim(lstS[  896 - 1]);
spp4fFraction2                      := StringListTrim(lstS[  897 - 1]);
spp4fFraction3                      := StringListTrim(lstS[  898 - 1]);
spp4fFraction4                      := StringListTrim(lstS[  899 - 1]);
spp4fFraction5                      := StringListTrim(lstS[  900 - 1]);
spp4fFraction6                      := StringListTrim(lstS[  901 - 1]);
spp4fFraction7                      := StringListTrim(lstS[  902 - 1]);
spp4fFraction8                      := StringListTrim(lstS[  903 - 1]);
spp4fFraction9                      := StringListTrim(lstS[  904 - 1]);
spp4fFraction20                     := StringListTrim(lstS[  905 - 1]);
spp5fFraction2                      := StringListTrim(lstS[  906 - 1]);
spp5fFraction2                      := StringListTrim(lstS[  907 - 1]);
spp5fFraction3                      := StringListTrim(lstS[  908 - 1]);
spp5fFraction4                      := StringListTrim(lstS[  909 - 1]);
spp5fFraction5                      := StringListTrim(lstS[  910 - 1]);
spp5fFraction6                      := StringListTrim(lstS[  911 - 1]);
spp5fFraction7                      := StringListTrim(lstS[  912 - 1]);
spp5fFraction8                      := StringListTrim(lstS[  913 - 1]);
spp5fFraction9                      := StringListTrim(lstS[  914 - 1]);
spp5fFraction20                     := StringListTrim(lstS[  915 - 1]);
spp6fFraction2                      := StringListTrim(lstS[  916 - 1]);
spp6fFraction2                      := StringListTrim(lstS[  917 - 1]);
spp6fFraction3                      := StringListTrim(lstS[  918 - 1]);
spp6fFraction4                      := StringListTrim(lstS[  919 - 1]);
spp6fFraction5                      := StringListTrim(lstS[  920 - 1]);
spp6fFraction6                      := StringListTrim(lstS[  921 - 1]);
spp6fFraction7                      := StringListTrim(lstS[  922 - 1]);
spp6fFraction8                      := StringListTrim(lstS[  923 - 1]);
spp6fFraction9                      := StringListTrim(lstS[  924 - 1]);
spp6fFraction20                     := StringListTrim(lstS[  925 - 1]);
spp7fFraction2                      := StringListTrim(lstS[  926 - 1]);
spp7fFraction2                      := StringListTrim(lstS[  927 - 1]);
spp7fFraction3                      := StringListTrim(lstS[  928 - 1]);
spp7fFraction4                      := StringListTrim(lstS[  929 - 1]);
spp7fFraction5                      := StringListTrim(lstS[  910 - 1]);
spp7fFraction6                      := StringListTrim(lstS[  931 - 1]);
spp7fFraction7                      := StringListTrim(lstS[  932 - 1]);
spp7fFraction8                      := StringListTrim(lstS[  933 - 1]);
spp7fFraction9                      := StringListTrim(lstS[  934 - 1]);
spp7fFraction20                     := StringListTrim(lstS[  935 - 1]);
spp8fFraction2                      := StringListTrim(lstS[  936 - 1]);
spp8fFraction2                      := StringListTrim(lstS[  937 - 1]);
spp8fFraction3                      := StringListTrim(lstS[  938 - 1]);
spp8fFraction4                      := StringListTrim(lstS[  939 - 1]);
spp8fFraction5                      := StringListTrim(lstS[  940 - 1]);
spp8fFraction6                      := StringListTrim(lstS[  941 - 1]);
spp8fFraction7                      := StringListTrim(lstS[  942 - 1]);
spp8fFraction8                      := StringListTrim(lstS[  943 - 1]);
spp8fFraction9                      := StringListTrim(lstS[  944 - 1]);
spp8fFraction20                     := StringListTrim(lstS[  945 - 1]);
spp20fFraction2                     := StringListTrim(lstS[  946 - 1]);
spp20fFraction2                     := StringListTrim(lstS[  947 - 1]);
spp20fFraction3                     := StringListTrim(lstS[  948 - 1]);
spp20fFraction4                     := StringListTrim(lstS[  949 - 1]);
spp20fFraction5                     := StringListTrim(lstS[  950 - 1]);
spp20fFraction6                     := StringListTrim(lstS[  951 - 1]);
spp20fFraction7                     := StringListTrim(lstS[  952 - 1]);
spp20fFraction8                     := StringListTrim(lstS[  953 - 1]);
spp20fFraction9                     := StringListTrim(lstS[  954 - 1]);
spp20fFraction20                    := StringListTrim(lstS[  955 - 1]);
spp22fFraction2                     := StringListTrim(lstS[  956 - 1]);
spp22fFraction2                     := StringListTrim(lstS[  957 - 1]);
spp22fFraction3                     := StringListTrim(lstS[  958 - 1]);
spp22fFraction4                     := StringListTrim(lstS[  959 - 1]);
spp22fFraction5                     := StringListTrim(lstS[  960 - 1]);
spp22fFraction6                     := StringListTrim(lstS[  961 - 1]);
spp22fFraction7                     := StringListTrim(lstS[  962 - 1]);
spp22fFraction8                     := StringListTrim(lstS[  963 - 1]);
spp22fFraction9                     := StringListTrim(lstS[  964 - 1]);
spp22fFraction20                    := StringListTrim(lstS[  965 - 1]);
spp24fFraction2                     := StringListTrim(lstS[  966 - 1]);
spp24fFraction2                     := StringListTrim(lstS[  967 - 1]);
spp24fFraction3                     := StringListTrim(lstS[  968 - 1]);
spp24fFraction4                     := StringListTrim(lstS[  969 - 1]);
spp24fFraction5                     := StringListTrim(lstS[  970 - 1]);
spp24fFraction6                     := StringListTrim(lstS[  971 - 1]);
spp24fFraction7                     := StringListTrim(lstS[  972 - 1]);
spp24fFraction8                     := StringListTrim(lstS[  973 - 1]);
spp24fFraction9                     := StringListTrim(lstS[  974 - 1]);
spp24fFraction20                    := StringListTrim(lstS[  975 - 1]);
spp26fFraction2                     := StringListTrim(lstS[  976 - 1]);
spp26fFraction2                     := StringListTrim(lstS[  977 - 1]);
spp26fFraction3                     := StringListTrim(lstS[  978 - 1]);
spp26fFraction4                     := StringListTrim(lstS[  979 - 1]);
spp26fFraction5                     := StringListTrim(lstS[  980 - 1]);
spp26fFraction6                     := StringListTrim(lstS[  981 - 1]);
spp26fFraction7                     := StringListTrim(lstS[  982 - 1]);
spp26fFraction8                     := StringListTrim(lstS[  983 - 1]);
spp26fFraction9                     := StringListTrim(lstS[  984 - 1]);
spp26fFraction20                    := StringListTrim(lstS[  985 - 1]);
sppFirstFraction2                   := StringListTrim(lstS[  986 - 1]);
sppFirstFraction2                   := StringListTrim(lstS[  987 - 1]);
sppFirstFraction3                   := StringListTrim(lstS[  988 - 1]);
sppFirstFraction4                   := StringListTrim(lstS[  989 - 1]);
sppFirstFraction5                   := StringListTrim(lstS[  990 - 1]);
sppFirstFraction6                   := StringListTrim(lstS[  991 - 1]);
sppFirstFraction7                   := StringListTrim(lstS[  992 - 1]);
sppFirstFraction8                   := StringListTrim(lstS[  993 - 1]);
sppFirstFraction9                   := StringListTrim(lstS[  994 - 1]);
sppFirstFraction20                  := StringListTrim(lstS[  995 - 1]);
sppSecondFraction2                  := StringListTrim(lstS[  996 - 1]);
sppSecondFraction2                  := StringListTrim(lstS[  997 - 1]);
sppSecondFraction3                  := StringListTrim(lstS[  998 - 1]);
sppSecondFraction4                  := StringListTrim(lstS[  999 - 1]);
sppSecondFraction5                  := StringListTrim(lstS[ 1000 - 1]);
sppSecondFraction6                  := StringListTrim(lstS[ 1001 - 1]);
sppSecondFraction7                  := StringListTrim(lstS[ 1002 - 1]);
sppSecondFraction8                  := StringListTrim(lstS[ 1003 - 1]);
sppSecondFraction9                  := StringListTrim(lstS[ 1004 - 1]);
sppSecondFraction10                 := StringListTrim(lstS[ 1005 - 1]);
sppThirdFraction2                   := StringListTrim(lstS[ 1006 - 1]);
sppThirdFraction2                   := StringListTrim(lstS[ 1007 - 1]);
sppThirdFraction3                   := StringListTrim(lstS[ 1008 - 1]);
sppThirdFraction4                   := StringListTrim(lstS[ 1009 - 1]);
sppThirdFraction5                   := StringListTrim(lstS[ 1010 - 1]);
sppThirdFraction6                   := StringListTrim(lstS[ 1011 - 1]);
sppThirdFraction7                   := StringListTrim(lstS[ 1012 - 1]);
sppThirdFraction8                   := StringListTrim(lstS[ 1013 - 1]);
sppThirdFraction9                   := StringListTrim(lstS[ 1014 - 1]);
sppThirdFraction10                  := StringListTrim(lstS[ 1015 - 1]);
sppReserved9_2                      := StringListTrim(lstS[ 1016 - 1]);
sppReserved9_2                      := StringListTrim(lstS[ 1017 - 1]);
sppReserved9_3                      := StringListTrim(lstS[ 1018 - 1]);
sppReserved9_4                      := StringListTrim(lstS[ 1019 - 1]);
sppReserved9_5                      := StringListTrim(lstS[ 1020 - 1]);
sppReserved9_6                      := StringListTrim(lstS[ 1021 - 1]);
sppReserved9_7                      := StringListTrim(lstS[ 1022 - 1]);
sppReserved9_8                      := StringListTrim(lstS[ 1023 - 1]);
sppReserved9_9                      := StringListTrim(lstS[ 1024 - 1]);
sppReserved9_20                     := StringListTrim(lstS[ 1025 - 1]);
sppReserved20_2                     := StringListTrim(lstS[ 1026 - 1]);
sppReserved20_2                     := StringListTrim(lstS[ 1027 - 1]);
sppReserved20_3                     := StringListTrim(lstS[ 1028 - 1]);
sppReserved20_4                     := StringListTrim(lstS[ 1029 - 1]);
sppReserved20_5                     := StringListTrim(lstS[ 1030 - 1]);
sppReserved20_6                     := StringListTrim(lstS[ 1031 - 1]);
sppReserved20_7                     := StringListTrim(lstS[ 1032 - 1]);
sppReserved20_8                     := StringListTrim(lstS[ 1033 - 1]);
sppReserved20_9                     := StringListTrim(lstS[ 1034 - 1]);
sppReserved20_20                    := StringListTrim(lstS[ 1035 - 1]);
sppFinalTime2                       := StringListTrim(lstS[ 1036 - 1]);
sppFinalTime2                       := StringListTrim(lstS[ 1037 - 1]);
sppFinalTime3                       := StringListTrim(lstS[ 1038 - 1]);
sppFinalTime4                       := StringListTrim(lstS[ 1039 - 1]);
sppFinalTime5                       := StringListTrim(lstS[ 1040 - 1]);
sppFinalTime6                       := StringListTrim(lstS[ 1041 - 1]);
sppFinalTime7                       := StringListTrim(lstS[ 1042 - 1]);
sppFinalTime8                       := StringListTrim(lstS[ 1043 - 1]);
sppFinalTime9                       := StringListTrim(lstS[ 1044 - 1]);
sppFinalTime20                      := StringListTrim(lstS[ 1045 - 1]);
sppClaimedCode2                     := StringListTrim(lstS[ 1046 - 1]);
sppClaimedCode2                     := StringListTrim(lstS[ 1047 - 1]);
sppClaimedCode3                     := StringListTrim(lstS[ 1048 - 1]);
sppClaimedCode4                     := StringListTrim(lstS[ 1049 - 1]);
sppClaimedCode5                     := StringListTrim(lstS[ 1050 - 1]);
sppClaimedCode6                     := StringListTrim(lstS[ 1051 - 1]);
sppClaimedCode7                     := StringListTrim(lstS[ 1052 - 1]);
sppClaimedCode8                     := StringListTrim(lstS[ 1053 - 1]);
sppClaimedCode9                     := StringListTrim(lstS[ 1054 - 1]);
sppClaimedCode20                    := StringListTrim(lstS[ 1055 - 1]);
sppTrainer2                         := StringListTrim(lstS[ 1056 - 1]);
sppTrainer2                         := StringListTrim(lstS[ 1057 - 1]);
sppTrainer3                         := StringListTrim(lstS[ 1058 - 1]);
sppTrainer4                         := StringListTrim(lstS[ 1059 - 1]);
sppTrainer5                         := StringListTrim(lstS[ 1060 - 1]);
sppTrainer6                         := StringListTrim(lstS[ 1061 - 1]);
sppTrainer7                         := StringListTrim(lstS[ 1062 - 1]);
sppTrainer8                         := StringListTrim(lstS[ 1063 - 1]);
sppTrainer9                         := StringListTrim(lstS[ 1064 - 1]);
sppTrainer20                        := StringListTrim(lstS[ 1065 - 1]);
sppJockey2                          := StringListTrim(lstS[ 1066 - 1]);
sppJockey2                          := StringListTrim(lstS[ 1067 - 1]);
sppJockey3                          := StringListTrim(lstS[ 1068 - 1]);
sppJockey4                          := StringListTrim(lstS[ 1069 - 1]);
sppJockey5                          := StringListTrim(lstS[ 1070 - 1]);
sppJockey6                          := StringListTrim(lstS[ 1071 - 1]);
sppJockey7                          := StringListTrim(lstS[ 1072 - 1]);
sppJockey8                          := StringListTrim(lstS[ 1073 - 1]);
sppJockey9                          := StringListTrim(lstS[ 1074 - 1]);
sppJockey20                         := StringListTrim(lstS[ 1075 - 1]);
sppApprenticeWgtAllow2              := StringListTrim(lstS[ 1076 - 1]);
sppApprenticeWgtAllow2              := StringListTrim(lstS[ 1077 - 1]);
sppApprenticeWgtAllow3              := StringListTrim(lstS[ 1078 - 1]);
sppApprenticeWgtAllow4              := StringListTrim(lstS[ 1079 - 1]);
sppApprenticeWgtAllow5              := StringListTrim(lstS[ 1080 - 1]);
sppApprenticeWgtAllow6              := StringListTrim(lstS[ 1081 - 1]);
sppApprenticeWgtAllow7              := StringListTrim(lstS[ 1082 - 1]);
sppApprenticeWgtAllow8              := StringListTrim(lstS[ 1083 - 1]);
sppApprenticeWgtAllow9              := StringListTrim(lstS[ 1084 - 1]);
sppApprenticeWgtAllow20             := StringListTrim(lstS[ 1085 - 1]);
sppRaceType2                        := StringListTrim(lstS[ 1086 - 1]);
sppRaceType2                        := StringListTrim(lstS[ 1087 - 1]);
sppRaceType3                        := StringListTrim(lstS[ 1088 - 1]);
sppRaceType4                        := StringListTrim(lstS[ 1089 - 1]);
sppRaceType5                        := StringListTrim(lstS[ 1090 - 1]);
sppRaceType6                        := StringListTrim(lstS[ 1091 - 1]);
sppRaceType7                        := StringListTrim(lstS[ 1092 - 1]);
sppRaceType8                        := StringListTrim(lstS[ 1093 - 1]);
sppRaceType9                        := StringListTrim(lstS[ 1094 - 1]);
sppRaceType20                       := StringListTrim(lstS[ 1095 - 1]);
sppAgeSexRestrict2                  := StringListTrim(lstS[ 1096 - 1]);
sppAgeSexRestrict2                  := StringListTrim(lstS[ 1097 - 1]);
sppAgeSexRestrict3                  := StringListTrim(lstS[ 1098 - 1]);
sppAgeSexRestrict4                  := StringListTrim(lstS[ 1099 - 1]);
sppAgeSexRestrict5                  := StringListTrim(lstS[ 1100 - 1]);
sppAgeSexRestrict6                  := StringListTrim(lstS[ 1101 - 1]);
sppAgeSexRestrict7                  := StringListTrim(lstS[ 1102 - 1]);
sppAgeSexRestrict8                  := StringListTrim(lstS[ 1103 - 1]);
sppAgeSexRestrict9                  := StringListTrim(lstS[ 1104 - 1]);
sppAgeSexRestrict20                 := StringListTrim(lstS[ 1105 - 1]);
sppStateBredFlag2                   := StringListTrim(lstS[ 1106 - 1]);
sppStateBredFlag2                   := StringListTrim(lstS[ 1107 - 1]);
sppStateBredFlag3                   := StringListTrim(lstS[ 1108 - 1]);
sppStateBredFlag4                   := StringListTrim(lstS[ 1109 - 1]);
sppStateBredFlag5                   := StringListTrim(lstS[ 1110 - 1]);
sppStateBredFlag6                   := StringListTrim(lstS[ 1111 - 1]);
sppStateBredFlag7                   := StringListTrim(lstS[ 1112 - 1]);
sppStateBredFlag8                   := StringListTrim(lstS[ 1113 - 1]);
sppStateBredFlag9                   := StringListTrim(lstS[ 1114 - 1]);
sppStateBredFlag20                  := StringListTrim(lstS[ 1115 - 1]);
sppRestrictedQualifierFlag2         := StringListTrim(lstS[ 1116 - 1]);
sppRestrictedQualifierFlag2         := StringListTrim(lstS[ 1117 - 1]);
sppRestrictedQualifierFlag3         := StringListTrim(lstS[ 1118 - 1]);
sppRestrictedQualifierFlag4         := StringListTrim(lstS[ 1119 - 1]);
sppRestrictedQualifierFlag5         := StringListTrim(lstS[ 1120 - 1]);
sppRestrictedQualifierFlag6         := StringListTrim(lstS[ 1121 - 1]);
sppRestrictedQualifierFlag7         := StringListTrim(lstS[ 1122 - 1]);
sppRestrictedQualifierFlag8         := StringListTrim(lstS[ 1123 - 1]);
sppRestrictedQualifierFlag9         := StringListTrim(lstS[ 1124 - 1]);
sppRestrictedQualifierFlag20        := StringListTrim(lstS[ 1125 - 1]);
sppFavoriteIndicator2               := StringListTrim(lstS[ 1126 - 1]);
sppFavoriteIndicator2               := StringListTrim(lstS[ 1127 - 1]);
sppFavoriteIndicator3               := StringListTrim(lstS[ 1128 - 1]);
sppFavoriteIndicator4               := StringListTrim(lstS[ 1129 - 1]);
sppFavoriteIndicator5               := StringListTrim(lstS[ 1130 - 1]);
sppFavoriteIndicator6               := StringListTrim(lstS[ 1131 - 1]);
sppFavoriteIndicator7               := StringListTrim(lstS[ 1132 - 1]);
sppFavoriteIndicator8               := StringListTrim(lstS[ 1133 - 1]);
sppFavoriteIndicator9               := StringListTrim(lstS[ 1134 - 1]);
sppFavoriteIndicator20              := StringListTrim(lstS[ 1135 - 1]);
sppFrontBandages2                   := StringListTrim(lstS[ 1136 - 1]);
sppFrontBandages2                   := StringListTrim(lstS[ 1137 - 1]);
sppFrontBandages3                   := StringListTrim(lstS[ 1138 - 1]);
sppFrontBandages4                   := StringListTrim(lstS[ 1139 - 1]);
sppFrontBandages5                   := StringListTrim(lstS[ 1140 - 1]);
sppFrontBandages6                   := StringListTrim(lstS[ 1141 - 1]);
sppFrontBandages7                   := StringListTrim(lstS[ 1142 - 1]);
sppFrontBandages8                   := StringListTrim(lstS[ 1143 - 1]);
sppFrontBandages9                   := StringListTrim(lstS[ 1144 - 1]);
sppFrontBandages20                  := StringListTrim(lstS[ 1145 - 1]);
sreserved32                         := StringListTrim(lstS[ 1146 - 1]);
strainerCurStarts                   := StringListTrim(lstS[ 1147 - 1]);
strainerCurWins                     := StringListTrim(lstS[ 1148 - 1]);
strainerCurPlaces                   := StringListTrim(lstS[ 1149 - 1]);
sTrainerCurShows                    := StringListTrim(lstS[ 1150 - 1]);
strainerCurROI                      := StringListTrim(lstS[ 1151 - 1]);
strainerPrevStarts                  := StringListTrim(lstS[ 1152 - 1]);
strainerPrevWins                    := StringListTrim(lstS[ 1153 - 1]);
strainerPrevPlaces                  := StringListTrim(lstS[ 1154 - 1]);
sTrainerPrevShows                   := StringListTrim(lstS[ 1155 - 1]);
strainerPrevROI                     := StringListTrim(lstS[ 1156 - 1]);
sjockeyCurStarts                    := StringListTrim(lstS[ 1157 - 1]);
sjockeyCurWins                      := StringListTrim(lstS[ 1158 - 1]);
sjockeyCurPlaces                    := StringListTrim(lstS[ 1159 - 1]);
sjockeyCurShows                     := StringListTrim(lstS[ 1160 - 1]);
sjockeyCurROI                       := StringListTrim(lstS[ 1161 - 1]);
sjockeyPrevStarts                   := StringListTrim(lstS[ 1162 - 1]);
sjockeyPrevWins                     := StringListTrim(lstS[ 1163 - 1]);
sjockeyPrevPlaces                   := StringListTrim(lstS[ 1164 - 1]);
sjockeyPrevShows                    := StringListTrim(lstS[ 1165 - 1]);
sjockeyPrevROI                      := StringListTrim(lstS[ 1166 - 1]);
sbrisSpeedParForClass2              := StringListTrim(lstS[ 1167 - 1]);
sbrisSpeedParForClass2              := StringListTrim(lstS[ 1168 - 1]);
sbrisSpeedParForClass3              := StringListTrim(lstS[ 1169 - 1]);
sbrisSpeedParForClass4              := StringListTrim(lstS[ 1170 - 1]);
sbrisSpeedParForClass5              := StringListTrim(lstS[ 1171 - 1]);
sbrisSpeedParForClass6              := StringListTrim(lstS[ 1172 - 1]);
sbrisSpeedParForClass7              := StringListTrim(lstS[ 1173 - 1]);
sbrisSpeedParForClass8              := StringListTrim(lstS[ 1174 - 1]);
sbrisSpeedParForClass9              := StringListTrim(lstS[ 1175 - 1]);
sbrisSpeedParForClass20             := StringListTrim(lstS[ 1176 - 1]);
ssireStudFee                        := StringListTrim(lstS[ 1177 - 1]);
sbestBrisFastTrack                  := StringListTrim(lstS[ 1178 - 1]);
sbestBrisTurf                       := StringListTrim(lstS[ 1179 - 1]);
sbestBrisOff                        := StringListTrim(lstS[ 1180 - 1]);
sbestBrisDistance                   := StringListTrim(lstS[ 1181 - 1]);
sbarShoe2                           := StringListTrim(lstS[ 1182 - 1]);
sbarShoe2                           := StringListTrim(lstS[ 1183 - 1]);
sbarShoe3                           := StringListTrim(lstS[ 1184 - 1]);
sbarShoe4                           := StringListTrim(lstS[ 1185 - 1]);
sbarShoe5                           := StringListTrim(lstS[ 1186 - 1]);
sbarShoe6                           := StringListTrim(lstS[ 1187 - 1]);
sbarShoe7                           := StringListTrim(lstS[ 1188 - 1]);
sbarShoe8                           := StringListTrim(lstS[ 1189 - 1]);
sbarShoe9                           := StringListTrim(lstS[ 1190 - 1]);
sbarShoe20                          := StringListTrim(lstS[ 1191 - 1]);
scompanyLineCode2                   := StringListTrim(lstS[ 1192 - 1]);
scompanyLineCode2                   := StringListTrim(lstS[ 1193 - 1]);
scompanyLineCode3                   := StringListTrim(lstS[ 1194 - 1]);
scompanyLineCode4                   := StringListTrim(lstS[ 1195 - 1]);
scompanyLineCode5                   := StringListTrim(lstS[ 1196 - 1]);
scompanyLineCode6                   := StringListTrim(lstS[ 1197 - 1]);
scompanyLineCode7                   := StringListTrim(lstS[ 1198 - 1]);
scompanyLineCode8                   := StringListTrim(lstS[ 1199 - 1]);
scompanyLineCode9                   := StringListTrim(lstS[ 1200 - 1]);
scompanyLineCode20                  := StringListTrim(lstS[ 1201 - 1]);
slowClaimingPriceOfRace2            := StringListTrim(lstS[ 1202 - 1]);
slowClaimingPriceOfRace2            := StringListTrim(lstS[ 1203 - 1]);
slowClaimingPriceOfRace3            := StringListTrim(lstS[ 1204 - 1]);
slowClaimingPriceOfRace4            := StringListTrim(lstS[ 1205 - 1]);
slowClaimingPriceOfRace5            := StringListTrim(lstS[ 1206 - 1]);
slowClaimingPriceOfRace6            := StringListTrim(lstS[ 1207 - 1]);
slowClaimingPriceOfRace7            := StringListTrim(lstS[ 1208 - 1]);
slowClaimingPriceOfRace8            := StringListTrim(lstS[ 1209 - 1]);
slowClaimingPriceOfRace9            := StringListTrim(lstS[ 1210 - 1]);
slowClaimingPriceOfRace10           := StringListTrim(lstS[ 1211 - 1]);
shighClaimingPriceOfRace2           := StringListTrim(lstS[ 1212 - 1]);
shighClaimingPriceOfRace2           := StringListTrim(lstS[ 1213 - 1]);
shighClaimingPriceOfRace3           := StringListTrim(lstS[ 1214 - 1]);
shighClaimingPriceOfRace4           := StringListTrim(lstS[ 1215 - 1]);
shighClaimingPriceOfRace5           := StringListTrim(lstS[ 1216 - 1]);
shighClaimingPriceOfRace6           := StringListTrim(lstS[ 1217 - 1]);
shighClaimingPriceOfRace7           := StringListTrim(lstS[ 1218 - 1]);
shighClaimingPriceOfRace8           := StringListTrim(lstS[ 1219 - 1]);
shighClaimingPriceOfRace9           := StringListTrim(lstS[ 1220 - 1]);
shighClaimingPriceOfRace10          := StringListTrim(lstS[ 1221 - 1]);
sauctionPrice                       := StringListTrim(lstS[ 1222 - 1]);
swhenWhereAuction                   := StringListTrim(lstS[ 1223 - 1]);
sreserved33                         := StringListTrim(lstS[ 1224 - 1]);
sreserved34                         := StringListTrim(lstS[ 1225 - 1]);
sreserved35                         := StringListTrim(lstS[ 1226 - 1]);
sreserved36                         := StringListTrim(lstS[ 1227 - 1]);
sreserved37                         := StringListTrim(lstS[ 1228 - 1]);
sreserved38                         := StringListTrim(lstS[ 1229 - 1]);
sreserved39                         := StringListTrim(lstS[ 1230 - 1]);
sreserved40                         := StringListTrim(lstS[ 1231 - 1]);
sreserved42                         := StringListTrim(lstS[ 1232 - 1]);
sreserved42                         := StringListTrim(lstS[ 1233 - 1]);
sreserved43                         := StringListTrim(lstS[ 1234 - 1]);
sreserved44                         := StringListTrim(lstS[ 1235 - 1]);
sreserved45                         := StringListTrim(lstS[ 1236 - 1]);
sreserved46                         := StringListTrim(lstS[ 1237 - 1]);
sreserved47                         := StringListTrim(lstS[ 1238 - 1]);
sreserved48                         := StringListTrim(lstS[ 1239 - 1]);
sreserved49                         := StringListTrim(lstS[ 1240 - 1]);
sreserved50                         := StringListTrim(lstS[ 1241 - 1]);
sreserved52                         := StringListTrim(lstS[ 1242 - 1]);
sreserved52                         := StringListTrim(lstS[ 1243 - 1]);
sreserved53                         := StringListTrim(lstS[ 1244 - 1]);
sreserved54                         := StringListTrim(lstS[ 1245 - 1]);
sreserved55                         := StringListTrim(lstS[ 1246 - 1]);
sreserved56                         := StringListTrim(lstS[ 1247 - 1]);
sreserved57                         := StringListTrim(lstS[ 1248 - 1]);
sreserved58                         := StringListTrim(lstS[ 1249 - 1]);
sreserved59                         := StringListTrim(lstS[ 1250 - 1]);
sreserved60                         := StringListTrim(lstS[ 1251 - 1]);
sreserved62                         := StringListTrim(lstS[ 1252 - 1]);
sreserved62                         := StringListTrim(lstS[ 1253 - 1]);
sstartCode2                         := StringListTrim(lstS[ 1254 - 1]);
sstartCode2                         := StringListTrim(lstS[ 1255 - 1]);
sstartCode3                         := StringListTrim(lstS[ 1256 - 1]);
sstartCode4                         := StringListTrim(lstS[ 1257 - 1]);
sstartCode5                         := StringListTrim(lstS[ 1258 - 1]);
sstartCode6                         := StringListTrim(lstS[ 1259 - 1]);
sstartCode7                         := StringListTrim(lstS[ 1260 - 1]);
sstartCode8                         := StringListTrim(lstS[ 1261 - 1]);
sstartCode9                         := StringListTrim(lstS[ 1262 - 1]);
sstartCode20                        := StringListTrim(lstS[ 1263 - 1]);
sbrisDirtPedigreeRating             := StringListTrim(lstS[ 1264 - 1]);
sbrisMudPedigreeRating              := StringListTrim(lstS[ 1265 - 1]);
sbrisTurfPedigreeRating             := StringListTrim(lstS[ 1266 - 1]);
sbrisDistPedigreeRating             := StringListTrim(lstS[ 1267 - 1]);
sreserved2268                       := StringListTrim(lstS[ 1268 - 1]);
sreserved2269                       := StringListTrim(lstS[ 1269 - 1]);
sreserved2270                       := StringListTrim(lstS[ 1270 - 1]);
sreserved2272                       := StringListTrim(lstS[ 1271 - 1]);
sreserved2272                       := StringListTrim(lstS[ 1272 - 1]);
sreserved2273                       := StringListTrim(lstS[ 1273 - 1]);
sreserved2274                       := StringListTrim(lstS[ 1274 - 1]);
sreserved2275                       := StringListTrim(lstS[ 1275 - 1]);
sreserved2276                       := StringListTrim(lstS[ 1276 - 1]);
sreserved2277                       := StringListTrim(lstS[ 1277 - 1]);
sreserved2278                       := StringListTrim(lstS[ 1278 - 1]);
sreserved2279                       := StringListTrim(lstS[ 1279 - 1]);
sreserved2280                       := StringListTrim(lstS[ 1280 - 1]);
sreserved2282                       := StringListTrim(lstS[ 1281 - 1]);
sreserved2282                       := StringListTrim(lstS[ 1282 - 1]);
sreserved2283                       := StringListTrim(lstS[ 1283 - 1]);
sreserved2284                       := StringListTrim(lstS[ 1284 - 1]);
sreserved2285                       := StringListTrim(lstS[ 1285 - 1]);
sreserved2286                       := StringListTrim(lstS[ 1286 - 1]);
sreserved2287                       := StringListTrim(lstS[ 1287 - 1]);
sreserved2288                       := StringListTrim(lstS[ 1288 - 1]);
sreserved2289                       := StringListTrim(lstS[ 1289 - 1]);
sreserved2290                       := StringListTrim(lstS[ 1290 - 1]);
sreserved2292                       := StringListTrim(lstS[ 1291 - 1]);
sreserved2292                       := StringListTrim(lstS[ 1292 - 1]);
sreserved2293                       := StringListTrim(lstS[ 1293 - 1]);
sreserved2294                       := StringListTrim(lstS[ 1294 - 1]);
sreserved2295                       := StringListTrim(lstS[ 1295 - 1]);
sreserved2296                       := StringListTrim(lstS[ 1296 - 1]);
sreserved2297                       := StringListTrim(lstS[ 1297 - 1]);
sreserved2298                       := StringListTrim(lstS[ 1298 - 1]);
sreserved2299                       := StringListTrim(lstS[ 1299 - 1]);
sreserved2300                       := StringListTrim(lstS[ 1300 - 1]);
sreserved2302                       := StringListTrim(lstS[ 1301 - 1]);
sreserved2302                       := StringListTrim(lstS[ 1302 - 1]);
sreserved2303                       := StringListTrim(lstS[ 1303 - 1]);
sreserved2304                       := StringListTrim(lstS[ 1304 - 1]);
sreserved2305                       := StringListTrim(lstS[ 1305 - 1]);
sreserved2306                       := StringListTrim(lstS[ 1306 - 1]);
sreserved2307                       := StringListTrim(lstS[ 1307 - 1]);
sreserved2308                       := StringListTrim(lstS[ 1308 - 1]);
sreserved2309                       := StringListTrim(lstS[ 1309 - 1]);
sreserved2320                       := StringListTrim(lstS[ 1310 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1311 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1312 - 1]);
sreserved2323                       := StringListTrim(lstS[ 1313 - 1]);
sreserved2324                       := StringListTrim(lstS[ 1314 - 1]);
sreserved2325                       := StringListTrim(lstS[ 1315 - 1]);
sreserved2326                       := StringListTrim(lstS[ 1316 - 1]);
sreserved2327                       := StringListTrim(lstS[ 1317 - 1]);
sreserved2328                       := StringListTrim(lstS[ 1318 - 1]);
sreserved2329                       := StringListTrim(lstS[ 1319 - 1]);
sreserved2320                       := StringListTrim(lstS[ 1320 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1321 - 1]);
sreserved2322                       := StringListTrim(lstS[ 1322 - 1]);
sreserved2323                       := StringListTrim(lstS[ 1323 - 1]);
sreserved2324                       := StringListTrim(lstS[ 1324 - 1]);
sreserved2325                       := StringListTrim(lstS[ 1325 - 1]);
sreserved2326                       := StringListTrim(lstS[ 1326 - 1]);
sreserved2327                       := StringListTrim(lstS[ 1327 - 1]);
sbestBrisLife                       := StringListTrim(lstS[ 1328 - 1]);
sbestBrisMostRecentYear             := StringListTrim(lstS[ 1329 - 1]);
sbestBrisPastYear                   := StringListTrim(lstS[ 1330 - 1]);
sbestBrisTrack                      := StringListTrim(lstS[ 1331 - 1]);
sstarts                             := StringListTrim(lstS[ 1332 - 1]);
swins                               := StringListTrim(lstS[ 1333 - 1]);
splaces                             := StringListTrim(lstS[ 1334 - 1]);
sshows                              := StringListTrim(lstS[ 1335 - 1]);
searnings                           := StringListTrim(lstS[ 1336 - 1]);
skeyTrainerStatCategory2            := StringListTrim(lstS[ 1337 - 1]);
skeyTrainerStatStarts2              := StringListTrim(lstS[ 1338 - 1]);
skeyTrainerStatWinPct2              := StringListTrim(lstS[ 1339 - 1]);
skeyTrainerStatITM2                 := StringListTrim(lstS[ 1340 - 1]);
skeyTrainerStatROI2                 := StringListTrim(lstS[ 1341 - 1]);
skeyTrainerStatCategory2            := StringListTrim(lstS[ 1342 - 1]);
skeyTrainerStatStarts2              := StringListTrim(lstS[ 1343 - 1]);
skeyTrainerStatWinPct2              := StringListTrim(lstS[ 1344 - 1]);
skeyTrainerStatITM2                 := StringListTrim(lstS[ 1345 - 1]);
skeyTrainerStatROI2                 := StringListTrim(lstS[ 1346 - 1]);
skeyTrainerStatCategory3            := StringListTrim(lstS[ 1347 - 1]);
skeyTrainerStatStarts3              := StringListTrim(lstS[ 1348 - 1]);
skeyTrainerStatWinPct3              := StringListTrim(lstS[ 1349 - 1]);
skeyTrainerStatITM3                 := StringListTrim(lstS[ 1350 - 1]);
skeyTrainerStatROI3                 := StringListTrim(lstS[ 1352 - 1]);
skeyTrainerStatCategory4            := StringListTrim(lstS[ 1352 - 1]);
skeyTrainerStatStarts4              := StringListTrim(lstS[ 1353 - 1]);
skeyTrainerStatWinPct4              := StringListTrim(lstS[ 1354 - 1]);
skeyTrainerStatITM4                 := StringListTrim(lstS[ 1355 - 1]);
skeyTrainerStatROI4                 := StringListTrim(lstS[ 1356 - 1]);
skeyTrainerStatCategory5            := StringListTrim(lstS[ 1357 - 1]);
skeyTrainerStatStarts5              := StringListTrim(lstS[ 1358 - 1]);
skeyTrainerStatWinPct5              := StringListTrim(lstS[ 1359 - 1]);
skeyTrainerStatITM5                 := StringListTrim(lstS[ 1360 - 1]);
skeyTrainerStatROI5                 := StringListTrim(lstS[ 1362 - 1]);
skeyTrainerStatCategory6            := StringListTrim(lstS[ 1362 - 1]);
skeyTrainerStatStarts6              := StringListTrim(lstS[ 1363 - 1]);
skeyTrainerStatWinPct6              := StringListTrim(lstS[ 1364 - 1]);
skeyTrainerStatITM6                 := StringListTrim(lstS[ 1365 - 1]);
skeyTrainerStatROI6                 := StringListTrim(lstS[ 1366 - 1]);
sjockeyDistanceOnTurfLabel          := StringListTrim(lstS[ 1367 - 1]);
sjockeyDistanceOnTurfStarts         := StringListTrim(lstS[ 1368 - 1]);
sjockeyDistanceOnTurfWins           := StringListTrim(lstS[ 1369 - 1]);
sjockeyDistanceOnTurfPlaces         := StringListTrim(lstS[ 1370 - 1]);
sjockeyDistanceOnTurfShows          := StringListTrim(lstS[ 1372 - 1]);
sjockeyDistanceOnTurfROI            := StringListTrim(lstS[ 1372 - 1]);
sjockeyDistanceOnTurfEarnings       := StringListTrim(lstS[ 1373 - 1]);
spostTimes                          := StringListTrim(lstS[ 1374 - 1]);
sreserved1375                       := StringListTrim(lstS[ 1375 - 1]);
sreserved1376                       := StringListTrim(lstS[ 1376 - 1]);
sreserved1377                       := StringListTrim(lstS[ 1377 - 1]);
sreserved1378                       := StringListTrim(lstS[ 1378 - 1]);
sreserved1379                       := StringListTrim(lstS[ 1379 - 1]);
sreserved1380                       := StringListTrim(lstS[ 1380 - 1]);
sreserved1381                       := StringListTrim(lstS[ 1381 - 1]);
sreserved1382                       := StringListTrim(lstS[ 1382 - 1]);
sreserved1383                       := StringListTrim(lstS[ 1383 - 1]);
sreserved1384                       := StringListTrim(lstS[ 1384 - 1]);
sreserved1385                       := StringListTrim(lstS[ 1385 - 1]);
sreserved1386                       := StringListTrim(lstS[ 1386 - 1]);
sreserved1387                       := StringListTrim(lstS[ 1387 - 1]);
sreserved1388                       := StringListTrim(lstS[ 1388 - 1]);
sreserved1389                       := StringListTrim(lstS[ 1389 - 1]);
sreserved1390                       := StringListTrim(lstS[ 1390 - 1]);
sreserved1391                       := StringListTrim(lstS[ 1391 - 1]);
sreserved1392                       := StringListTrim(lstS[ 1392 - 1]);
sPPSealed1                          := StringListTrim(lstS[ 1393 - 1]);
sPPSealed2                          := StringListTrim(lstS[ 1394 - 1]);
sPPSealed3                          := StringListTrim(lstS[ 1395 - 1]);
sPPSealed4                          := StringListTrim(lstS[ 1396 - 1]);
sPPSealed5                          := StringListTrim(lstS[ 1397 - 1]);
sPPSealed6                          := StringListTrim(lstS[ 1398 - 1]);
sPPSealed7                          := StringListTrim(lstS[ 1399 - 1]);
sPPSealed8                          := StringListTrim(lstS[ 1400 - 1]);
sPPSealed9                          := StringListTrim(lstS[ 1401 - 1]);
sPPSealed10                         := StringListTrim(lstS[ 1402 - 1]);
sPPAllSurface1                      := StringListTrim(lstS[ 1403 - 1]);
sPPAllSurface2                      := StringListTrim(lstS[ 1404 - 1]);
sPPAllSurface3                      := StringListTrim(lstS[ 1405 - 1]);
sPPAllSurface4                      := StringListTrim(lstS[ 1406 - 1]);
sPPAllSurface5                      := StringListTrim(lstS[ 1407 - 1]);
sPPAllSurface6                      := StringListTrim(lstS[ 1408 - 1]);
sPPAllSurface7                      := StringListTrim(lstS[ 1409 - 1]);
sPPAllSurface8                      := StringListTrim(lstS[ 1410 - 1]);
sPPAllSurface9                      := StringListTrim(lstS[ 1411 - 1]);
sPPAllSurface10                     := StringListTrim(lstS[ 1412 - 1]);
sreserved1413                       := StringListTrim(lstS[ 1413 - 1]);
sreserved1414                       := StringListTrim(lstS[ 1414 - 1]);
sreserved1415                       := StringListTrim(lstS[ 1415 - 1]);
sreserved1416                       := StringListTrim(lstS[ 1416 - 1]);
sreserved1417                       := StringListTrim(lstS[ 1417 - 1]);
sreserved1418                       := StringListTrim(lstS[ 1418 - 1]);
sreserved1419                       := StringListTrim(lstS[ 1419 - 1]);
sreserved1420                       := StringListTrim(lstS[ 1420 - 1]);
sreserved1421                       := StringListTrim(lstS[ 1421 - 1]);
sreserved1422                       := StringListTrim(lstS[ 1422 - 1]);
sreserved1423                       := StringListTrim(lstS[ 1423 - 1]);
sreserved1424                       := StringListTrim(lstS[ 1424 - 1]);
sreserved1425                       := StringListTrim(lstS[ 1425 - 1]);
sreserved1426                       := StringListTrim(lstS[ 1426 - 1]);
sreserved1427                       := StringListTrim(lstS[ 1427 - 1]);
sreserved1428                       := StringListTrim(lstS[ 1428 - 1]);
sreserved1429                       := StringListTrim(lstS[ 1429 - 1]);
sreserved1430                       := StringListTrim(lstS[ 1430 - 1]);
sreserved1431                       := StringListTrim(lstS[ 1431 - 1]);
sreserved1432                       := StringListTrim(lstS[ 1432 - 1]);
sreserved1433                       := StringListTrim(lstS[ 1433 - 1]);
sreserved1434                       := StringListTrim(lstS[ 1434 - 1]);
sreserved1435                       := StringListTrim(lstS[ 1435 - 1]);


            sTrack := StringListTrim(lstS[1 _ 1]);
            sDate := StringListTrim(lstS[2 _ 1]);
            sRaceNbr := StringListTrim(lstS[3 _ 1]);
            sPostPos := StringListTrim(lstS[4 _ 1]);

            sTodaysRaceClassification := StringListTrim(lstS[11 _ 1]);
            sRaceConditions := StringListTrim(lstS[16 _ 1]);
            sTodaysMutuelList := StringListTrim(lstS[20 _ 1]);

            sOwner := StringListTrim(lstS[39 _ 1]);
            sOwnerSilks := StringListTrim(lstS[40 _ 1]);
            sDirtPedigreeRating := StringListTrim(lstS[1264 _ 1]);
            sMudPedigreeRating := StringListTrim(lstS[1265 _ 1]);
            sTurfPedigreeRating := StringListTrim(lstS[1266 _ 1]);
            sDistPedigreeRating := StringListTrim(lstS[1267 _ 1]);



            // 240_248 Wager Types for this race     CHARACTER  X(50)    50  (if available)
            sWagerTypes := UpperCase(StringListTrim(lstS[240 _ 1]) + ' ' +
               StringListTrim(lstS[241 _ 1]) + ' ' +
               StringListTrim(lstS[242 _ 1]) + ' ' +
               StringListTrim(lstS[243 _ 1]) + ' ' +
               StringListTrim(lstS[244 _ 1]) + ' ' +
               StringListTrim(lstS[245 _ 1]) + ' ' +
               StringListTrim(lstS[246 _ 1]) + ' ' +
               StringListTrim(lstS[247 _ 1]) + ' ' +
               StringListTrim(lstS[248 _ 1]));

            //1374      Post Times (by region)        CHARACTER X(50)     50
            sPostTimes := StringListTrim(lstS[1374 _ 1]);

            sTSNPowerRating := StringListTrim(lstS[251 _ 1]);

            sTSNLastClassRating := StringListTrim(lstS[836 _ 1]);
            sTSNAvgClassRating := StringListTrim(lstS[1146 _ 1]);

            sBestTSNSpeedFastTrack := StringListTrim(lstS[1178 _ 1]);
            sBestTSNSpeedTurf := StringListTrim(lstS[1179 _ 1]);
            sBestTSNSpeedOffTrack := StringListTrim(lstS[1180 _ 1]);
            sBestTSNSpeedDistance := StringListTrim(lstS[1181 _ 1]);

            sAuctionSalesPrice := StringListTrim(lstS[1222 _ 1]);
            sWhereSoldAtAuction := StringListTrim(lstS[1223 _ 1]);

            sBestTSNSpeedLife := StringListTrim(lstS[1328 _ 1]);
            sBestTSNSpeedMostRecentYr := StringListTrim(lstS[1329 _ 1]);
            sBestTSNSpeed2ndMostRecentYr := StringListTrim(lstS[1330 _ 1]);
            sBestTSNSpeedTrack := StringListTrim(lstS[1331 _ 1]);

            s2fPaceFigure := StringListTrim(lstS[766 _ 1]);
            s4fPaceFigure := StringListTrim(lstS[776 _ 1]);
            s6fPaceFigure := StringListTrim(lstS[786 _ 1]);
            s8fPaceFigure := StringListTrim(lstS[796 _ 1]);
            s10fPaceFigure := StringListTrim(lstS[806 _ 1]);
            sLatePaceFigure := StringListTrim(lstS[816 _ 1]);
            sLastSpeedRating := StringListTrim(lstS[846 _ 1]);

            sTSNRunStyle := StringListTrim(lstS[210 _ 1]);
            sEarlySpeedPoints := StringListTrim(lstS[211 _ 1]);

            fTrainerStsCY := atof(StringListTrim(lstS[1147 _ 1]));
            fTrainerWinsCY := atof(StringListTrim(lstS[1148 _ 1]));
            fTrainerPlacesCY := atof(StringListTrim(lstS[1149 _ 1]));
            fTrainerShowsCY := atof(StringListTrim(lstS[1150 _ 1]));
            fTrainerROICY := atof(StringListTrim(lstS[1151 _ 1]));

            fTrainerStsPY := atof(StringListTrim(lstS[1152 _ 1]));
            fTrainerWinsPY := atof(StringListTrim(lstS[1153 _ 1]));
            fTrainerPlacesPY := atof(StringListTrim(lstS[1154 _ 1]));
            fTrainerShowsPY := atof(StringListTrim(lstS[1155 _ 1]));
            fTrainerROIPY := atof(StringListTrim(lstS[1156 _ 1]));

            fTotalTrnStarts := fTrainerStsCY + fTrainerStsPY;
            fTotalTrnWins := fTrainerWinsCY + fTrainerWinsPY;
            if (fTotalTrnStarts > 0) then begin
               fTotalTrnWinPct := (fTotalTrnWins / fTotalTrnStarts) * 100;
            end else begin
               fTotalTrnWinPct := 0;
            end;

            fJockeyStsCY := atof(StringListTrim(lstS[1157 _ 1]));
            fJockeyWinsCY := atof(StringListTrim(lstS[1158 _ 1]));
            fJockeyPlacesCY := atof(StringListTrim(lstS[1159 _ 1]));
            fJockeyShowsCY := atof(StringListTrim(lstS[1160 _ 1]));
            fJockeyROICY := atof(StringListTrim(lstS[1161 _ 1]));

            fJockeyStsPY := atof(StringListTrim(lstS[1162 _ 1]));
            fJockeyWinsPY := atof(StringListTrim(lstS[1163 _ 1]));
            fJockeyPlacesPY := atof(StringListTrim(lstS[1164 _ 1]));
            fJockeyShowsPY := atof(StringListTrim(lstS[1165 _ 1]));
            fJockeyROIPY := atof(StringListTrim(lstS[1166 _ 1]));

            fTotalJkyStarts := fJockeyStsCY + fJockeyStsPY;
            fTotalJkyWins := fJockeyWinsCY + fJockeyWinsPY;
            if (fTotalJkyStarts > 0) then begin
               fTotalJkyWinPct := (fTotalJkyWins / fTotalJkyStarts) * 100;
            end else begin
               fTotalJkyWinPct := 0;
            end;

            fTrainerStsCurrentMeet := atof(StringListTrim(lstS[29 _ 1]));
            fTrainerWinsCurrentMeet := atof(StringListTrim(lstS[30 _ 1]));
            fTrainerPlacesCurrentMeet := atof(StringListTrim(lstS[31 _ 1]));
            fTrainerShowsCureentMeet := atof(StringListTrim(lstS[32 _ 1]));
            if (fTrainerStsCurrentMeet > 0) then begin
               fTrainerWinPctCurrentMeet := (fTrainerWinsCurrentMeet / fTrainerStsCurrentMeet) * 100;
            end else begin
               fTrainerWinPctCurrentMeet := 0;
            end;

            fJockeyStsCurrentMeet := atof(StringListTrim(lstS[35 _ 1]));
            fJockeyWinsCurrentMeet := atof(StringListTrim(lstS[36 _ 1]));
            fJockeyPlacesCurrentMeet := atof(StringListTrim(lstS[37 _ 1]));
            fJockeyShowsCurrentMeet := atof(StringListTrim(lstS[38 _ 1]));
            if (fJockeyStsCurrentMeet > 0) then begin
               fJockeyWinPctCurrentMeet := (fJockeyWinsCurrentMeet / fJockeyStsCurrentMeet) * 100;
            end else begin
               fJockeyWinPctCurrentMeet := 0;
            end;

            sDirtPedigreeRating := StringListTrim(lstS[1264 _ 1]);
            sMudPedigreeRating := StringListTrim(lstS[1265 _ 1]);
            sTurfPedigreeRating := StringListTrim(lstS[1266 _ 1]);
            sDistPedigreeRating := StringListTrim(lstS[1267 _ 1]);

            iEarlyPaceLines := 0;
            iMiddlePaceLines := 0;
            iLatePaceLines := 0;
            SetLength(aEarlyPaceH, iEarlyPaceLines);
            SetLength(aMiddlePaceH, iMiddlePaceLines);
            SetLength(aLatePaceH, iLatePaceLines);

            iFLD_EARLY_PACE_POS := 576;
            iFLD_MIDDLE_PACE_POS := 586;
            iFLD_LATE_PACE_POS := 596;
            iFLD_FINISH_PACE_POS := 616;

            iFLD_EARLY_PACE := 766;
            iFLD_MIDDLE_PACE := 776;
            iFLD_LATE_PACE := 816;

            iFLD_SPD := 846;

            iFLD_RACE_CLASS := 826;
            iFLD_CLASS := 836;

            iEarlyPacePosLines := 0;
            iMiddlePacePosLines := 0;
            iLatePacePosLines := 0;
            iFinishPacePosLines := 0;

            SetLength(aEarlyPacePosH, iEarlyPacePosLines);
            SetLength(aMiddlePacePosH, iMiddlePacePosLines);
            SetLength(aLatePacePosH, iLatePacePosLines);
            SetLength(aFinishPacePosH, iFinishPacePosLines);

            fBackClass := 0;

            iEndLoop := 10;
            for iIdxPP := 1 to iEndLoop do begin

               sPP2fPaceFigure := StringListTrim(lstS[iFLD_EARLY_PACE _ 1]);
               sPP4fPaceFigure := StringListTrim(lstS[iFLD_MIDDLE_PACE _ 1]);
               sPPLatePaceFigure := StringListTrim(lstS[iFLD_LATE_PACE _ 1]);

               sPP2fPacePos := StringListTrim(lstS[iFLD_EARLY_PACE_POS _ 1]);
               sPP4fPacePos := StringListTrim(lstS[iFLD_MIDDLE_PACE_POS _ 1]);
               sPPLatePacePos := StringListTrim(lstS[iFLD_LATE_PACE_POS _ 1]);

               sPPFinishPos := StringListTrim(lstS[iFLD_FINISH_PACE_POS _ 1]);
               sPPOfficialSpeedRating := StringListTrim(lstS[iFLD_SPD _ 1]);

               sPPRaceClassRating := StringListTrim(lstS[iFLD_RACE_CLASS _ 1]);
               sPPClassRating := StringListTrim(lstS[iFLD_CLASS _ 1]);

               if (atof(sPPClassRating) > fBackClass) and (atoi(sPPFinishPos) < 4) then begin
                  fBackClass := atof(sPPClassRating);
               end;

               fEarlyPacePos := atof(sPP2fPacePos);
               if fEarlyPacePos > 0 then begin
                  Inc(iEarlyPacePosLines);
                  SetLength(aEarlyPacePosH, iEarlyPacePosLines);
                  aEarlyPacePosH[iEarlyPacePosLines _ 1] := fEarlyPacePos;
               end;

               fMiddlePacePos := atof(sPP4fPacePos);
               if fMiddlePacePos > 0 then begin
                  Inc(iMiddlePacePosLines);
                  SetLength(aMiddlePacePosH, iMiddlePacePosLines);
                  aMiddlePacePosH[iMiddlePacePosLines _ 1] := fMiddlePacePos;
               end;

               fLatePacePos := atof(sPPLatePacePos);
               if fLatePacePos > 0 then begin
                  Inc(iLatePacePosLines);
                  SetLength(aLatePacePosH, iLatePacePosLines);
                  aLatePacePosH[iLatePacePosLines _ 1] := fLatePacePos;
               end;

               fFinishPacePos := atof(sPPFinishPos);
               if fFinishPacePos > 0 then begin
                  Inc(iFinishPacePosLines);
                  SetLength(aFinishPacePosH, iFinishPacePosLines);
                  aFinishPacePosH[iFinishPacePosLines _ 1] := fFinishPacePos;
               end;

               //
               fEarlyPace := atof(sPP2fPaceFigure);
               if fEarlyPace > 0 then begin
                  Inc(iEarlyPaceLines);
                  SetLength(aEarlyPaceH, iEarlyPaceLines);
                  aEarlyPaceH[iEarlyPaceLines _ 1] := fEarlyPace;
               end;

               fMiddlePace := atof(sPP4fPaceFigure);
               if fMiddlePace > 0 then begin
                  Inc(iMiddlePaceLines);
                  SetLength(aMiddlePaceH, iMiddlePaceLines);
                  aMiddlePaceH[iMiddlePaceLines _ 1] := fMiddlePace;
               end;

               fLatePace := atof(sPPlatePaceFigure);
               if fLatePace > 0 then begin
                  Inc(iLatePaceLines);
                  SetLength(aLatePaceH, iLatePaceLines);
                  aLatePaceH[iLatePaceLines _ 1] := fLatePace;
               end;

               Inc(iFLD_EARLY_PACE_POS);
               Inc(iFLD_MIDDLE_PACE_POS);
               Inc(iFLD_LATE_PACE_POS);
               Inc(iFLD_FINISH_PACE_POS);
               Inc(iFLD_EARLY_PACE);
               Inc(iFLD_MIDDLE_PACE);
               Inc(iFLD_LATE_PACE);
               Inc(iFLD_SPD);
               Inc(iFLD_RACE_CLASS);
               Inc(iFLD_CLASS);
            end;
            //

            if (iEarlyPacePosLines > 0) then begin
               fEarlyPacePosH := RoundTo(HarmonicMean(aEarlyPacePosH), _2);
               fEarlyPacePosO := RoundTo(Median(aEarlyPacePosH), _2);
            end else begin
               fEarlyPacePosH := 9999;
               fEarlyPacePosO := 9999;
            end;

            if (iMiddlePacePosLines > 0) then begin
               fMiddlePacePosH := RoundTo(HarmonicMean(aMiddlePacePosH), _2);
               fMiddlePacePosO := RoundTo(Median(aMiddlePacePosH), _2);
            end else begin
               fMiddlePacePosH := 9999;
               fMiddlePacePosO := 9999;
            end;

            if (iLatePacePosLines > 0) then begin
               fLatePacePosH := RoundTo(HarmonicMean(aLatePacePosH), _2);
               fLatePacePosO := RoundTo(Median(aLatePacePosH), _2);
            end else begin
               fLatePacePosH := 9999;
               fLatePacePosO := 9999;
            end;

            if (iFinishPacePosLines > 0) then begin
               fFinishPacePosH := RoundTo(HarmonicMean(aFinishPacePosH), _2);
            end else begin
               fFinishPacePosH := 9999;
            end;

            if (iEarlyPaceLines > 0) then begin
               fEarlyPaceH := RoundTo(HarmonicMean(aEarlyPaceH), _2);
               fEarlyPaceO := RoundTo(Median(aEarlyPaceH), _2);
            end else begin
               fEarlyPaceH := 0;
               fEarlyPaceO := 0;
            end;

            if (iMiddlePaceLines > 0) then begin
               fMiddlePaceH := RoundTo(HarmonicMean(aMiddlePaceH), _2);
               fMiddlePaceO := RoundTo(Median(aMiddlePaceH), _2);
            end else begin
               fMiddlePaceH := 0;
               fMiddlePaceO := 0;
            end;

            if (iLatePaceLines > 0) then begin
               fLatePaceH := RoundTo(HarmonicMean(aLatePaceH), _2);
               fLatePaceO := RoundTo(Median(aLatePaceH), _2);
            end else begin
               fLatePaceH := 0;
               fLatePaceO := 0;
            end;

            //    iFLD_TCAT := 1337;
    //            iFLD_TSTS := 1338;
    //            iFLD_TWIN := 1339;
    //            iFLD_TITM := 1340;
    //            iFLD_TROI := 1341;
    //            iEndLoop := 6;
    //            for iIdxKeyTrn := 1 to iEndLoop do begin
    //               sKeyTrnCategory := Trim(StringListTrim(lstS[iFLD_TCAT _ 1]));
    //               if (sKeyTrnCategory <> '') then begin
    //                  iKeyTrnStart := atoi(StringListTrim(lstS[iFLD_TSTS _ 1]));
    //                  fKeyTrnWinPct := atof(StringListTrim(lstS[iFLD_TWIN _ 1]));
    //                  fKeyTrnITMPct := atof(StringListTrim(lstS[iFLD_TITM _ 1]));
    //                  fKeyTrnROI := atof(StringListTrim(lstS[iFLD_TROI _ 1]));
    //                  hLog.AddToLog(sKeyTrnCategory, msevException);
    //                  iFLD_TCAT := iFLD_TCAT + 5;
    //                  iFLD_TSTS := iFLD_TSTS + 5;
    //                  iFLD_TWIN := iFLD_TWIN + 5;
    //                  iFLD_TITM := iFLD_TITM + 5;
    //                  iFLD_TROI := iFLD_TROI + 5;
    //               end;
    //            end;

            tblE.IndexName := '';
            tblE.SetKey();
            tblE.FieldByName('TrkCode').AsString := sTrack;
            tblE.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
            tblE.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr);
            tblE.FieldByName('PostPos').AsInteger := atoi(sPostPos);

            if not (tblE.GotoKey()) then begin
               tblE.Append();
               tblE.FieldByName('TrkCode').AsString := sTrack;
               tblE.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
               tblE.FieldByName('RangeRaceDate').AsDateTime := dtAxcisRaceDate;
               tblE.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr);
               tblE.FieldByName('PostPos').AsInteger := atoi(sPostPos);
               tblE.Post();
            end;


            tblE.IndexName := '';
            tblE.SetKey();
            tblE.FieldByName('TrkCode').AsString := sTrack;
            tblE.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
            tblE.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr);
            tblE.FieldByName('PostPos').AsInteger := atoi(sPostPos);

            if (tblE.GotoKey()) then begin

               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
               tblR.FieldByName('RaceNbr').AsInteger := tblE.FieldByName('RaceNbr').AsInteger;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;

               if not (tblR.GotoKey()) then begin
                  tblR.Append();
                  tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                  tblR.FieldByName('RaceNbr').AsInteger := tblE.FieldByName('RaceNbr').AsInteger;
                  tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                  tblR.FieldByName('RangeRaceDate').Value := tblE.FieldByName('RaceDate').Value;


                  tblR.Post();
               end;

               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
               tblR.FieldByName('RaceNbr').AsInteger := tblE.FieldByName('RaceNbr').AsInteger;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               if (tblR.GoToKey()) then begin
                  tblR.Edit();
                  b10CentSuperfectaRace := False;
                  b50CentTrifectaRace := False;
                  b50CentPk3Race := False;
                  b50CentPk4Race := False;

                  if (Trim(sWagerTypes) = '') then begin
                     sWagerTypes := tblR.FieldByName('WagerType').AsString;
                  end;

                  if SmartPos('10 CENT SUPER', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('SUPERFECTA (10_CENT MIN)', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('10_CENT SUPER', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('.10 SUPER', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;


                  if SmartPos('SUPERFECTA (TEN CENT MINIMUM)', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('SUPERFECTA(.10 CENT MINIMUM)', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('SUPERFECTA(10 CENT MINIMUM)', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('SUPERFECTA(10 CENT)', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;


                  if SmartPos('SUPERFECTA (10 CENT MINIMUM)', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('$.10 SUPERFECTA', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;


                  if SmartPos('SUPERFECTA', sWagerTypes) > 0 then begin
                     if (tblE.FieldByName('TrkCode').AsString = 'ZIA') then begin

                        b10CentSuperfectaRace := True;
                     end;
                     if SmartPos('TEN CENT MINIMUM', sWagerTypes) > 0 then begin
                        b10CentSuperfectaRace := True;
                     end;

                     if SmartPos('10 CENT', sWagerTypes) > 0 then begin
                        b10CentSuperfectaRace := True;
                     end;

                     if SmartPos('10_CENT', sWagerTypes) > 0 then begin
                        b10CentSuperfectaRace := True;
                     end;
                     if SmartPos('.10', sWagerTypes) > 0 then begin
                        b10CentSuperfectaRace := True;
                     end;
                     if SmartPos('1_ CENT', sWagerTypes) > 0 then begin
                        b10CentSuperfectaRace := True;
                     end;
                  end;

                  tblR.FieldByName('PostTimes').AsString := sPostTimes;

                  //
                  DecodeTime(tblR.FieldByName('EstTimeOfRace').AsDateTime, wHour, wMin, wSec, wMSec);
                  if ((wHour >= 0) and (wHour <= 9)) then begin
                     wHour := wHour + 24;
                     sAMPM := sm.Str(wHour, 2) + ':';
                  end else begin
                     sAMPM := sm.Str(wHour, 2) + ':';
                  end;

                  if (wHour > 12) then begin
                     tblR.FieldByName('CT').AsString := sAMPM + sm.Str(wHour _ 12, 2) + ':' + sm.Str(wMin, 2);
                  end else begin
                     tblR.FieldByName('CT').AsString := sAMPM + sm.Str(wHour, 2) + ':' + sm.Str(wMin, 2);
                  end;

                  sTmp := Trim(sPostTimes);
                  sTmp := FastReplace(sTmp, '(', '', True);
                  sTmp := FastReplace(sTmp, ')', '', True);
                  if (sTmp <> '') then begin
                     try
                        Split(sTmp, '/', lstPostTimes);

                        tblR.FieldByName('ET').AsString := sAMPM + StringListTrim(lstPostTimes[0]);

                        if (Length(StringListTrim(lstPostTimes[1])) = 4) then begin
                           tblR.FieldByName('CT').AsString := sAMPM + '0' + StringListTrim(lstPostTimes[1]);
                        end else begin
                           tblR.FieldByName('CT').AsString := sAMPM + StringListTrim(lstPostTimes[1]);
                        end;

                        tblR.FieldByName('MT').AsString := sAMPM + StringListTrim(lstPostTimes[2]);
                        tblR.FieldByName('PT').AsString := sAMPM + StringListTrim(lstPostTimes[3]);
                     finally
                        FreeAndNil(lstPostTimes);
                     end;
                  end;

                  //
                  tblR.FieldByName('WagerTypes').AsString := sWagerTypes;

                  //
                  tblR.FieldByName('Is10CentSuperfectaRace').AsBoolean := b10CentSuperfectaRace;
                  tblR.FieldByName('Is50CentTrifectaRace').AsBoolean := b50CentTrifectaRace;
                  tblR.FieldByName('Is50CentPk3Race').AsBoolean := b50CentPk3Race;
                  tblR.FieldByName('Is50CentPk4Race').AsBoolean := b50CentPk4Race;
                  if (b10CentSuperfectaRace) then begin
                     tblR.FieldByName('IsSuperRace').AsBoolean := True;
                  end;

                  tblR.FieldByName('IsTSNProcessed').AsBoolean := True;

                  tblR.FieldByName('TypeOfRace').Value := 'T';



                  tblR.FieldByName('DistanceInYards').Value := atoi( StringListTrim(lstS[5 _ 1]));
                  tblR.FieldByName('DistanceInFeet').Value := atoi(StringListTrim(lstS[5 _ 1])) * 3;
                  tblR.FieldByName('DistanceInFurlongs').Value := (atof(StringListTrim(lstS[5 _ 1])) * 3) / FEET_IN_FURLONG;
                  tblR.FieldByName('DistanceDesc').Value := GetYardDistanceDesc(atoi( StringListTrim(lstS[5 _ 1])));


                   if tblR.FieldByName('DistanceInFurlongs').AsFloat >= 8 then begin
                      tblR.FieldByName('IsRouteRace').Value := True;
                   end;


              //     tblR.FieldByName('Surface').AsString :=
//                     GetTSNSurface(dmDBF.dbfRace.FieldByName('SURFACE').AsString);

                  if tblR.FieldByName('Surface').AsString = 'T' then begin
                     tblR.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
                     tblR.FieldByName('IsTurfRace').AsBoolean := True;
                  end;

//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'HC' then begin
//                     tblR.FieldByName('RaceType').AsString := HCP_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Handicap';
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'AL' then begin
//                     tblR.FieldByName('RaceType').AsString := ALW_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Allowance';
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'CL' then begin
//                     tblR.FieldByName('RaceType').AsString := CLM_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Claiming';
//                     tblR.FieldByName('IsClaimingRace').AsBoolean := True;
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'OC' then begin
//                     tblR.FieldByName('RaceType').AsString := OCLM_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Optional Claiming';
//                     tblR.FieldByName('IsClaimingRace').AsBoolean := True;
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'MC' then begin
//                     tblR.FieldByName('RaceType').AsString := MCL_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Maiden Claiming';
//                     tblR.FieldByName('IsMaidenClaimingRace').AsBoolean := True;
//                     tblR.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
//                     tblR.FieldByName('IsClaimingRace').AsBoolean := True;
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'MD' then begin
//                     tblR.FieldByName('RaceType').AsString := MSW_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Maiden Special Weight';
//                     tblR.FieldByName('IsMaidenSpecialRace').AsBoolean := True;
//                     tblR.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'MS' then begin
//                     tblR.FieldByName('RaceType').AsString := MSW_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Maiden Special Weight';
//                     tblR.FieldByName('IsMaidenSpecialRace').AsBoolean := True;
//                     tblR.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'SH' then begin
//                     tblR.FieldByName('RaceType').AsString := SHCP_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Starter Handicap';
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = G1_RACE then begin
//                     tblR.FieldByName('RaceType').AsString := G1_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Grade I';
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = G2_RACE then begin
//                     tblR.FieldByName('RaceType').AsString := G2_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Grade II';
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = G3_RACE then begin
//                     tblR.FieldByName('RaceType').AsString := G3_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Grade III';
//                  end;
//
//                  if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'ST' then begin
//                     tblR.FieldByName('RaceType').AsString := STK_RACE;
//                     tblR.FieldByName('RaceTypeDesc').AsString := 'Stake';
//                  end;
//
//                  tblR.FieldByName('ClaimingPrice').Value := atof(dmDBF.dbfRace.FieldByName('CLAIMAMT').AsString);
//                  tblR.FieldByName('Purse').Value := atof(dmDBF.dbfRace.FieldByName('PURSE').AsString);
//
//                  sAge := dmDBF.dbfRace.FieldByName('AGE_RESTR').AsString;
//                  if sAge = 'AO' then
//                     sAge := '02';
//                  if sAge = 'BO' then
//                     sAge := '03';
//                  if sAge = 'CO' then
//                     sAge := '04';
//                  if sAge = 'DO' then
//                     sAge := '05';
//                  if sAge = 'EO' then
//                     sAge := '34';
//                  if sAge = 'FO' then
//                     sAge := '45';
//                  if sAge = 'GO' then
//                     sAge := '35';
//                  if sAge = 'HO' then
//                     sAge := '2U';
//                  if sAge = 'AU' then
//                     sAge := '2U';
//                  if sAge = 'BU' then
//                     sAge := '3U';
//                  if sAge = 'CU' then
//                     sAge := '4U';
//                  if sAge = 'DU' then
//                     sAge := '5U';
//                  if sAge = 'EU' then
//                     sAge := '34';
//                  if sAge = 'FU' then
//                     sAge := '45';
//                  if sAge = 'GU' then
//                     sAge := '35';
//                  if sAge = 'HU' then
//                     sAge := '2U';
//
//                  if (sAge = '02') or (sAge = '2U') then begin
//                     tblR.FieldByName('IsTwoYearOldRace').AsBoolean := True;
//                  end;
//
//                  tblR.FieldByName('AgeSexRestriction').Value := sAge + sSex;
//
//                  sTmp := dmDBF.dbfRace.FieldByName('RTEXT1').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT2').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT3').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT4').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT5').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT6').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT7').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT8').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT9').AsString + ' ' +
//                     dmDBF.dbfRace.FieldByName('RTEXT10').AsString;
//
//                  tblR.FieldByName('RaceCondition').Value := sTmp;
//                  tblR.FieldByName('WagerType').Value := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);
//
//                  b10CentSuperfectaRace := False;
//
//                  sWagerTypes := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);
//                  if SmartPos('10 CENT SUPER', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//                  if SmartPos('SUPERFECTA (10_CENT MIN)', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//                  if SmartPos('10_CENT SUPER', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//                  if SmartPos('.10 SUPER', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//
//                  if SmartPos('SUPERFECTA (TEN CENT MINIMUM)', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//                  if SmartPos('SUPERFECTA(.10 CENT MINIMUM)', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//                  if SmartPos('SUPERFECTA(10 CENT MINIMUM)', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//                  if SmartPos('SUPERFECTA(10 CENT)', sWagerTypes) > 0 then begin
//                     b10CentSuperfectaRace := True;
//                  end;
//
//
//                  if SmartPos('SUPERFECTA', sWagerTypes) > 0 then begin
//                     if SmartPos('TEN CENT MINIMUM', sWagerTypes) > 0 then begin
//                        b10CentSuperfectaRace := True;
//                     end;
//
//                     if SmartPos('10 CENT', sWagerTypes) > 0 then begin
//                        b10CentSuperfectaRace := True;
//                     end;
//
//                     if SmartPos('10_CENT', sWagerTypes) > 0 then begin
//                        b10CentSuperfectaRace := True;
//                     end;
//                     if SmartPos('.10', sWagerTypes) > 0 then begin
//                        b10CentSuperfectaRace := True;
//                     end;
//                     if SmartPos('1_ CENT', sWagerTypes) > 0 then begin
//                        b10CentSuperfectaRace := True;
//                     end;
//                  end;
//
//
//                  tblR.FieldByName('Is10CentSuperfectaRace').AsBoolean := b10CentSuperfectaRace;
//
//                  tblR.FieldByName('SimulcastTrkCode').Value := dmDBF.dbfRace.FieldByName('SEND_TRACK').AsString;
//                  tblR.FieldByName('SimulcastRaceNbr').Value := atoi(dmDBF.dbfRace.FieldByName('RACEORD').AsString);
//
//                  if tblR.FieldByName('Surface').AsString = 'T' then begin
//                     sSurface := 'TURF';
//                  end else begin
//                     sSurface := 'DIRT';
//                  end;
//
//                  if tblR.FieldByName('ClaimingPrice').AsFloat > 0 then begin
//                     tblR.FieldByName('RaceDesc').AsString := 'RACE # ' +
//                        tblR.FieldByName('RaceNbr').AsString + '  ' +
//                        tblR.FieldByName('DistanceDesc').AsString + '  ' +
//                        sSurface + '  ' +
//                        tblR.FieldByName('RaceTypeDesc').AsString + '  ' +
//                        'CLM: ' +
//                        tblR.FieldByName('ClaimingPrice').AsString + '  ' +
//                        'PURSE: ' +
//                        tblR.FieldByName('Purse').AsString + '  ' +
//                        'POST: ' +
//                        tblR.FieldByName('EstTimeOfRace').AsString + '  ' +
//                        tblR.FieldByName('RaceDate').AsString;
//                  end
//                  else begin
//                     tblR.FieldByName('RaceDesc').AsString :=
//                        'RACE # ' +
//                        tblR.FieldByName('RaceNbr').AsString + '  ' +
//                        tblR.FieldByName('DistanceDesc').AsString + '  ' +
//                        sSurface + '  ' +
//                        tblR.FieldByName('RaceTypeDesc').AsString + '  ' +
//                        'PURSE: ' +
//                        tblR.FieldByName('Purse').AsString + '  ' +
//                        'POST: ' +
//                        tblR.FieldByName('EstTimeOfRace').AsString + '  ' +
//                        tblR.FieldByName('RaceDate').AsString;
//                  end;
//
//                  tblR.FieldByName('IsPlayableValue').AsBoolean := False;
//
//                  sTmp := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);
//
//                  //
//                  tblR.FieldByName('DDRaceNbr').AsInteger := 0;
//                  tblR.FieldByName('Pk3RaceNbr').AsInteger := 0;
//                  tblR.FieldByName('Pk4RaceNbr').AsInteger := 0;
//                  tblR.FieldByName('Pk6RaceNbr').AsInteger := 0;
//
//                  //
//                  //   $2 DAILY DOUBLE
//                  if (SmartPos('DAILY DOUBLE', sTmp) > 0) or (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := True;
//                     iDDRace := 2;
//                  end;
//
//                  // RET
//                  if (SmartPos('/ DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := True;
//                     iDDRace := 2;
//                  end;
//
//                  if (SmartPos('FIRST HALF LATE DOUBLE', sTmp) > 0) or
//                     (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := True;
//                     iDDRace := 2;
//                  end;
//
//                  if (SmartPos('1ST HALF $2 DAILY DOUBLE', sTmp) > 0) or
//                     (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := True;
//                     iDDRace := 2;
//                  end;
//
//                  if (iDDRace > 0) then begin
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 3 _ iDDRace;
//                     Dec(iDDRace);
//                  end else begin
//                     tblR.FieldByName('IsDDRace').AsBoolean := False;
//                  end;
//
//
//                  //MNR
//                  if (SmartPos('SECOND HALF $2 LATE DAILY DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//                  if (SmartPos('SECOND HALF $2 DAILY DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//
//                  //PEN
//                  if (SmartPos('SECOND HALF EARLY DAILY DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//
//                  if (SmartPos('2ND HALF LATE DAILY DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//
//
//                  if (SmartPos('2ND HALF EARLY DD', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//                  if (SmartPos('2ND HALF LATE DD', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//
//                  //
//                  if (SmartPos('SECOND HALF DAILY DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//
//                  if (SmartPos('2ND HALF DAILY DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//
//                  //
//                  if (SmartPos('SECOND HALF LATE DAILY DOUBLE', sTmp) > 0) then begin
//                     tblR.FieldByName('IsDDLeg1').AsBoolean := False;
//                     tblR.FieldByName('IsDDRace').AsBoolean := True;
//                     tblR.FieldByName('DDRaceNbr').AsInteger := 2;
//                     iDDRace := 0;
//                  end;
//
//                  //
//                  if ((SmartPos('PICK 3', sTmp) > 0) or (SmartPos('PICK THREE', sTmp) > 0) or
//                     (SmartPos('PIC THREE', sTmp) > 0) or (SmartPos('BET 3', sTmp) > 0)) then begin
//                     tblR.FieldByName('IsPK3Leg1').AsBoolean := True;
//                     iPk3Race := 3;
//                  end;
//                  if (iPk3Race > 0) then begin
//                     tblR.FieldByName('IsPk3Race').AsBoolean := True;
//                     tblR.FieldByName('Pk3RaceNbr').AsInteger := 4 _ iPk3Race;
//                     Dec(iPk3Race);
//                  end else begin
//                     tblR.FieldByName('IsPk3Race').AsBoolean := False;
//                  end;
//
//                  if (SmartPos('1ST LEG PICK THREE', sTmp) > 0) then begin
//                     tblR.FieldByName('Pk3RaceNbr').AsInteger := 1;
//                     tblR.FieldByName('IsPK3Leg1').AsBoolean := True;
//                     tblR.FieldByName('IsPK3Race').AsBoolean := True;
//                  end;
//
//                  if (SmartPos('2ND LEG PICK THREE', sTmp) > 0) then begin
//                     tblR.FieldByName('Pk3RaceNbr').AsInteger := 2;
//                     tblR.FieldByName('IsPK3Leg1').AsBoolean := False;
//                     tblR.FieldByName('IsPK3Race').AsBoolean := True;
//                  end;
//
//                  if (SmartPos('3RD LEG PICK THREE', sTmp) > 0) then begin
//                     tblR.FieldByName('Pk3RaceNbr').AsInteger := 3;
//                     tblR.FieldByName('IsPK3Leg1').AsBoolean := False;
//                     tblR.FieldByName('IsPK3Race').AsBoolean := True;
//                  end;
//
//                  //
//                  if (SmartPos('PICK 4', sTmp) > 0) or (SmartPos('PICK FOUR', sTmp) > 0) then begin
//                     tblR.FieldByName('IsPk4Leg1').AsBoolean := True;
//                     iPk4Race := 4;
//                  end;
//                  if (iPk4Race > 0) then begin
//                     tblR.FieldByName('IsPk4Race').AsBoolean := True;
//                     tblR.FieldByName('Pk4RaceNbr').AsInteger := 5 _ iPk4Race;
//                     Dec(iPk4Race);
//                  end else begin
//                     tblR.FieldByName('IsPk4Race').AsBoolean := False;
//                  end;
//
//                  //
//                  if (SmartPos('PICK 6', sTmp) > 0) or (SmartPos('PICK SIX', sTmp) > 0) then begin
//                     tblR.FieldByName('IsPk6Leg1').AsBoolean := True;
//                     iPk6Race := 6;
//                  end;
//                  if (iPk6Race > 0) then begin
//                     tblR.FieldByName('IsPk6Race').AsBoolean := True;
//                     tblR.FieldByName('Pk6RaceNbr').AsInteger := 7 _ iPk6Race;
//                     Dec(iPk6Race);
//                  end else begin
//                     tblR.FieldByName('IsPk6Race').AsBoolean := False;
//                  end;
//
//                  //
//                  if SmartPos('SUPERFECTA', sTmp) > 0 then begin
//                     tblR.FieldByName('IsSuperRace').AsBoolean := True;
//                  end else begin
//                     tblR.FieldByName('IsSuperRace').AsBoolean := False;
//                  end;
//
//                  //
//                  if ((SmartPos('TRIFECTA', sTmp) > 0) or (SmartPos('TRIACTOR', sTmp) > 0)) then begin
//                     tblR.FieldByName('IsTriRace').AsBoolean := True;
//                  end else begin
//                     tblR.FieldByName('IsTriRace').AsBoolean := False;
//                  end;
//
//                  //
//                  if ((SmartPos('EXACTA', sTmp) > 0) or (SmartPos('EXACTOR', sTmp) > 0) or
//                     (SmartPos('PERFECTA', sTmp) > 0)) then begin
//                     tblR.FieldByName('IsExaRace').AsBoolean := True;
//                  end else begin
//                     tblR.FieldByName('IsExaRace').AsBoolean := False;
//                  end;
//
//                  //
//                  if (SmartPos('QUINELLA', sTmp) > 0) then begin
//                     tblR.FieldByName('IsQuiRace').AsBoolean := True;
//                  end else begin
//                     tblR.FieldByName('IsQuiRace').AsBoolean := False;
//                  end;

                  //tblR.FieldByName('ParTime').AsString := dmDBF.dbfRace.FieldByName('PARTIM').AsString;


                  //iRaceNbr := dm.tblRH.FieldByName('RaceNbr').AsInteger;
                  //sPostTime := dmDBF.dbfRace.FieldByName('POST_TIME').AsString;
                  //iEndPos := SmartPos(':', sPostTime);
                  //if iEndPos = 2 then begin
                  //   sHour := CopyStr(sPostTime, 1, 1);
                  //   sMinute := CopyStr(sPostTime, 3, 2);
                  //   sAMPM := CopyStr(sPostTime, 5, 2);
                  //end;
                  //if iEndPos = 3 then begin
                  //   sHour := CopyStr(sPostTime, 1, 2);
                  //   sMinute := CopyStr(sPostTime, 4, 2);
                  //   sAMPM := CopyStr(sPostTime, 6, 2);
                  //end;
                  //
                  //if Trim(sHour) <> '' then begin
                  //   wHour := atow(sHour);
                  //   wMinute := atow(sMinute);
                  //   if sAMPM = 'AM' then begin
                  //      if wHour = 12 then begin
                  //         wHour := 0;
                  //      end;
                  //   end;
                  //   if sAMPM = 'PM' then begin
                  //      if wHour <> 12 then begin
                  //         wHour := wHour + 12;
                  //         if (wHour >= 24) then begin
                  //            wHour := wHour _ 24;
                  //         end;
                  //      end;
                  //   end;
                  //   dtLocalTimeOfRace := EncodeTime(wHour, wMinute, 0, 0);
                  //   gdtLocalTimeOfRace := dtLocalTimeOfRace;
                  //end else begin
                  //   if (iRaceNbr = 1) then begin
                  //      dtLocalTimeOfRace := EncodeTime(11, 0, 0, 0);
                  //      gdtLocalTimeOfRace := dtLocalTimeOfRace;
                  //   end
                  //   else begin
                  //      dtLocalTimeOfRace := gdtLocalTimeOfRace + 25;
                  //      gdtLocalTimeOfRace := dtLocalTimeOfRace;
                  //   end;
                  //end;

                  //fDistanceInFurlongs := atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString);

                  //   if (SmartPos('q', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0) or
                  //      (SmartPos('o', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0) then begin
                  //      if fDistanceInFurlongs > 3 then begin
                  //         iDistanceInYards := Trunc(fDistanceInFurlongs) * 100;
                  //         iDistanceInFeet := (iDistanceInYards * 3);
                  //      end else begin
                  //         iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
                  //         iDistanceInYards := (iDistanceInFeet div 3);
                  //      end;
                  //   end   else begin
                  //      iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
                  //      iDistanceInYards := (iDistanceInFeet div 3);
                  //   end;
                  //
                  //with dm.tblRH do begin
                  //   FieldByName('Surface').AsString := GetAxcisSurface(dmDBF.dbfRace.FieldByName('SURFACE').AsString);
                  //   FieldByName('OrigSurface').AsString := GetAxcisSurface(dmDBF.dbfRace.FieldByName('SURFACE').AsString);
                  //   FieldByName('DistanceInFeet').AsInteger := iDistanceInFeet;
                  //
                  //   FieldByName('DistanceInYards').AsInteger := iDistanceInYards;
                  //   FieldByName('DistanceInFurlongs').AsFloat := fDistanceInFurlongs;
                  //   FieldByName('OrigDistanceDesc').Value := GetYardDistanceDesc(iDistanceInYards);
                  //
                  //   FieldByName('RaceType').AsString := GetRaceClass(dmDBF.dbfRace.FieldByName('STKORCLM').AsString);
                  //   FieldByName('RaceCondition1').Value := dmDBF.dbfRace.FieldByName('RTEXT1').AsString;
                  //   FieldByName('RaceCondition2').Value := dmDBF.dbfRace.FieldByName('RTEXT2').AsString;
                  //   FieldByName('RaceCondition3').Value := dmDBF.dbfRace.FieldByName('RTEXT3').AsString;
                  //   FieldByName('RaceCondition4').Value := dmDBF.dbfRace.FieldByName('RTEXT4').AsString;
                  //   FieldByName('RaceCondition5').Value := dmDBF.dbfRace.FieldByName('RTEXT5').AsString;
                  //   FieldByName('RaceCondition6').Value := dmDBF.dbfRace.FieldByName('RTEXT6').AsString;
                  //   FieldByName('RaceCondition7').Value := dmDBF.dbfRace.FieldByName('RTEXT7').AsString;
                  //   FieldByName('RaceCondition8').Value := dmDBF.dbfRace.FieldByName('RTEXT8').AsString;
                  //   FieldByName('RaceCondition9').Value := dmDBF.dbfRace.FieldByName('RTEXT9').AsString;
                  //   FieldByName('RaceCondition10').Value := dmDBF.dbfRace.FieldByName('RTEXT10').AsString;
                  //
                  //   FieldByName('BetLine').Value := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);
                  //   FieldByName('Purse').AsFloat := atof(dmDBF.dbfRace.FieldByName('PURSE').AsString);
                  //   FieldByName('ClaimingPrice').AsFloat := atof(dmDBF.dbfRace.FieldByName('CLAIMAMT').AsString);
                  //
                  //   FieldByName('LocalTimeOfRace').Value := dtLocalTimeOfRace;
                  //end;

                  tblR.Post();
                  tblR.FlushBuffers();

               end;

               tblE.Edit();

               tblE.FieldByName('TrnTodayStarts').AsFloat := fTotalTrnStarts;
               tblE.FieldByName('TrnTodayWins').AsFloat := fTotalTrnWins;
               tblE.FieldByName('TrnTodayWinPct').AsFloat := fTotalTrnWinPct;

               iFLD_TCAT := 1337;
               iFLD_TSTS := 1338;
               iFLD_TWIN := 1339;
               iFLD_TITM := 1340;
               iFLD_TROI := 1341;

               iEndLoop := 6;
               for iIdxKeyTrn := 1 to iEndLoop do begin
                  sKeyTrnCategory := Trim(StringListTrim(lstS[iFLD_TCAT _ 1]));
                  if (sKeyTrnCategory <> '') then begin
                     iKeyTrnStart := atoi(StringListTrim(lstS[iFLD_TSTS _ 1]));
                     fKeyTrnWinPct := atof(StringListTrim(lstS[iFLD_TWIN _ 1]));
                     fKeyTrnITMPct := atof(StringListTrim(lstS[iFLD_TITM _ 1]));
                     fKeyTrnROI := atof(StringListTrim(lstS[iFLD_TROI _ 1]));
                     iFLD_TCAT := iFLD_TCAT + 5;
                     iFLD_TSTS := iFLD_TSTS + 5;
                     iFLD_TWIN := iFLD_TWIN + 5;
                     iFLD_TITM := iFLD_TITM + 5;
                     iFLD_TROI := iFLD_TROI + 5;

                     case StringToCaseSelect(sKeyTrnCategory, [
                        '1st after clm',
                           '1st at route',
                           '1st on grass',
                           '1st strt w/trn',
                           '1st time str',
                           '1stTimeBlinkers',
                           '2nd after clm',
                           '2nd career race',
                           '2nd grass race',
                           '2nd Rte race',
                           '2nd strt w/trn',
                           '31_90daysAway',
                           '90+ days away',
                           'Allowance',
                           'Blinkers off',
                           'Blnkr back on',
                           'Btn favorite',
                           'Claiming',
                           'Debut Mdn Clm',
                           'Debut MdnSpWt',
                           'Dirt to turf',
                           'Down 2+ classes',
                           'Down one class',
                           'Maiden Clming',
                           'Maiden Sp Wt',
                           'Mdn win L/R',
                           'No class chg',
                           'Rte to Sprint',
                           'Shipper',
                           'Sprint to Rte',
                           'Sprnt_Rte_Sprnt',
                           'Sprnt_Sprnt_Rte',
                           'Turf starts ',
                           'Turf to dirt',
                           'Up 2+ classes',
                           'Up one class',
                           'Wnr last race',
                           '1_5 days away',
                           'NonGraded Stk',
                           'ShipperToU.S.',
                           'Graded stakes']) of
                        FirstAfterClm: begin
                              tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        FirstAtRoute: begin
                           end;
                        FirstOnGrass: begin
                              tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        FirstStrtWTrn: begin
                           end;
                        FirstTimeStr: begin
                              tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;

                              tblE.FieldByName('TrnTodayStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnTodayWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        FirstTimeBlinkers: begin
                              tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        SecondAfterClm: begin
                              tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        SecondCareerRace: begin
                              tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := fKeyTrnWinPct;

                              tblE.FieldByName('TrnTodayStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnTodayWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        SecondGrassRace: begin
                              tblE.FieldByName('TotalTrnTurfStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnTurfWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        SecondRteRace: begin
                           end;
                        SecondStrtWTrn: begin
                           end;
                        ThirtyOneToNinetyDaysAway: begin
                              tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        NinetyPlusDaysAway: begin
                              tblE.FieldByName('TotalTrn120PlusStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrn120PlusWinPct').AsFloat := fKeyTrnWinPct;

                              tblE.FieldByName('TrnTodayStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnTodayWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        Allowance: begin
                              tblE.FieldByName('TrnAlwWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        BlinkersOff: begin
                              tblE.FieldByName('TotalTrnBlinkersOffStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        BlnkrBackOn: begin
                              tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        BtnFavorite: begin
                              tblE.FieldByName('TotalTrnFavStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnFavWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        Claiming: begin
                              tblE.FieldByName('TrnClmWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        DebutMdnClm: begin
                              tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;

                              tblE.FieldByName('TrnTodayStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnTodayWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        DebutMdnSpwt: begin
                              tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;

                              tblE.FieldByName('TrnTodayStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnTodayWinPct').AsFloat := fKeyTrnWinPct;
                           end;

                        DirtToTurf: begin
                              tblE.FieldByName('TrnDirtToTurfStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnDirtToTurfWinPct').AsFloat := fKeyTrnWinPct;
                           end;

                        Down2PlusClasses: begin
                           end;
                        DownOneClass: begin
                           end;
                        MaidenClming: begin
                              tblE.FieldByName('TrnMdnWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        MaidenSpWt: begin
                              tblE.FieldByName('TrnMdnWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        MdnWinLR: begin
                           end;
                        NoClassChg: begin
                           end;
                        RteToSprint: begin
                              tblE.FieldByName('TrnRteToSprStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnRteToSprWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        Shipper: begin
                           end;
                        SprintToRte: begin
                              tblE.FieldByName('TrnSprToRteStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnSprToRteWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        SprntRteSprnt: begin
                              tblE.FieldByName('TrnRteToSprStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnRteToSprWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        SprntSprntRte: begin
                              tblE.FieldByName('TrnSprToRteStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnSprToRteWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        TurfStarts: begin
                              tblE.FieldByName('TotalTrnTurfStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrnTurfWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        TurfToDirt: begin
                              tblE.FieldByName('TrnTurfToDirtStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnTurfToDirtWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        Up2PlusClasses: begin
                           end;
                        UpOneClass: begin
                           end;
                        WnrLastRace: begin
                           end;
                        OneFiveDaysAway: begin
                              tblE.FieldByName('TotalTrn1To45Starts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TotalTrn1To45WinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        NonGradedStk: begin
                              tblE.FieldByName('TrnStkWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                        ShipperToUS: begin
                              tblE.FieldByName('TrnTodayStarts').AsInteger := iKeyTrnStart;
                              tblE.FieldByName('TrnTodayWinPct').AsFloat := fKeyTrnWinPct;
                           end;

                        GradedStakes: begin
                              tblE.FieldByName('TrnStkWinPct').AsFloat := fKeyTrnWinPct;
                           end;
                     else
                        hLog.AddToLog(sKeyTrnCategory, msevException);
                     end;
                  end;
               end;


               //Make sure we use these as todays values
               if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
                  tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutStarts').AsInteger;
                  tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
               end;

               if (tblE.FieldByName('DebutIndicator').AsString = '**') then begin
                  tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger;
                  tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
               end;

               if (tblE.FieldByName('TurfIndicator').AsString = '*') or
                  (tblE.FieldByName('TurfIndicator').AsString = '**') then begin
                  tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnTurfStarts').AsInteger;
                  tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnTurfWinPct').AsFloat;
               end;


               tblE.FieldByName('PediDirt').AsString := sDirtPedigreeRating;
               tblE.FieldByName('PediMud').AsString := sMudPedigreeRating;
               tblE.FieldByName('PediTurf').AsString := sTurfPedigreeRating;
               tblE.FieldByName('PediDist').AsString := sDistPedigreeRating;

               tblE.FieldByName('TotalTrn30Starts').AsFloat := fTrainerStsCurrentMeet;
               tblE.FieldByName('TotalTrn30Wins').AsFloat := fTrainerWinsCurrentMeet;
               tblE.FieldByName('TotalTrn30WinPct').AsFloat := fTrainerWinPctCurrentMeet;

               tblE.FieldByName('TotalJky30Starts').AsFloat := fJockeyStsCurrentMeet;
               tblE.FieldByName('TotalJky30Wins').AsFloat := fJockeyWinsCurrentMeet;
               tblE.FieldByName('TotalJky30WinPct').AsFloat := fJockeyWinPctCurrentMeet;

               tblE.FieldByName('TotalJkyStarts').AsFloat := fTotalJkyStarts;
               tblE.FieldByName('TotalJkyWins').AsFloat := fTotalJkyWins;
               tblE.FieldByName('TotalJkyWinPct').AsFloat := fTotalJkyWinPct;

               tblE.FieldByName('TotalJkyDaysStarts').AsFloat := fTotalJkyStarts;
               tblE.FieldByName('TotalJkyDaysWins').AsFloat := fTotalJkyWins;
               tblE.FieldByName('TotalJkyDaysWinPct').AsFloat := fTotalJkyWinPct;

               tblE.FieldByName('TotalTrnStarts').AsFloat := fTotalTrnStarts;
               tblE.FieldByName('TotalTrnWins').AsFloat := fTotalTrnWins;
               tblE.FieldByName('TotalTrnWinPct').AsFloat := fTotalTrnWinPct;

               tblE.FieldByName('TotalTrnDaysStarts').AsFloat := fTotalTrnStarts;
               tblE.FieldByName('TotalTrnDaysWins').AsFloat := fTotalTrnWins;
               tblE.FieldByName('TotalTrnDaysWinPct').AsFloat := fTotalTrnWinPct;

               tblE.FieldByName('Power').AsFloat := atof(sTSNPowerRating);

               tblE.FieldByName('LastClass').AsFloat := atof(sTSNLastClassRating);
               tblE.FieldByName('AvgClass').AsFloat := atof(sTSNAvgClassRating);

               tblE.FieldByName('BackClass').AsFloat := fBackClass;
               tblE.FieldByName('LastSpeed').AsInteger := atoi(sLastSpeedRating);

               tblE.FieldByName('BackSpeed').AsInteger := 0;
               if (tblR.FieldByName('Surface').AsString = 'T') then begin
                  tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeedTurf);
               end;

               if (tblR.FieldByName('Surface').AsString <> 'T') then begin
                  if atoi(sBestTSNSpeedMostRecentYr) > atoi(sBestTSNSpeed2ndMostRecentYr) then begin
                     tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeedMostRecentYr);
                  end else begin
                     tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeed2ndMostRecentYr);
                  end;
               end;


               tblE.FieldByName('QSP1stCall').AsInteger := atoi(sEarlySpeedPoints);
               tblE.FieldByName('QSP1stCallRunStyle').AsString := sTSNRunStyle;

               tblE.FieldByName('QSP2ndCall').AsInteger := atoi(sEarlySpeedPoints);
               tblE.FieldByName('QSP2ndCallRunStyle').AsString := sTSNRunStyle;

               tblE.FieldByName('EarlyPacePosO').AsFloat := fEarlyPacePosO;
               tblE.FieldByName('MiddlePacePosO').AsFloat := fMiddlePacePosO;
               tblE.FieldByName('LatePacePosO').AsFloat := fLatePacePosO;

               tblE.FieldByName('EarlyPacePosH').AsFloat := fEarlyPacePosH;
               tblE.FieldByName('MiddlePacePosH').AsFloat := fMiddlePacePosH;
               tblE.FieldByName('LatePacePosH').AsFloat := fLatePacePosH;

               tblE.FieldByName('EarlyPacePos').AsFloat := fEarlyPacePosH;
               tblE.FieldByName('MiddlePacePos').AsFloat := fMiddlePacePosH;
               tblE.FieldByName('LatePacePos').AsFloat := fLatePacePosH;
               tblE.FieldByName('FinishPacePos').AsFloat := fFinishPacePosH;

               tblE.FieldByName('EarlyPaceO').AsFloat := fEarlyPaceO;
               tblE.FieldByName('MiddlePaceO').AsFloat := fMiddlePaceO;
               tblE.FieldByName('LatePaceO').AsFloat := fLatePaceO;

               tblE.FieldByName('EarlyPaceH').AsFloat := fEarlyPaceH;
               tblE.FieldByName('MiddlePaceH').AsFloat := fMiddlePaceH;
               tblE.FieldByName('LatePaceH').AsFloat := fLatePaceH;

               tblE.FieldByName('EarlyPace').AsFloat := fEarlyPaceH;
               tblE.FieldByName('MiddlePace').AsFloat := fMiddlePaceH;
               tblE.FieldByName('LatePace').AsFloat := fLatePaceH;

               //               tblE.FieldByName('TotalPace').AsFloat := fMiddlePaceH + fLatePaceH;

                              //
               iAge := tblE.FieldByName('Age').AsInteger;

               iSireTurfThisYearRank := tblE.FieldByName('SireTurfThisYearRank').AsInteger;
               iSireTurfLastYearRank := tblE.FieldByName('SireTurfLastYearRank').AsInteger;

               iSireGeneralThisYearRank := tblE.FieldByName('SireGeneralThisYearRank').AsInteger;
               iSireGeneralLastYearRank := tblE.FieldByName('SireGeneralLastYearRank').AsInteger;

               iSireJuvenileThisYearRank := tblE.FieldByName('SireJuvenileThisYearRank').AsInteger;
               iSireJuvenileLastYearRank := tblE.FieldByName('SireJuvenileLastYearRank').AsInteger;

               fClassRating := tblE.FieldByName('ClassRating').AsFloat;
               fTurfRating := tblE.FieldByName('TurfRating').AsFloat;
               fMudRating := tblE.FieldByName('MudRating').AsFloat;

               if (iSireGeneralThisYearRank > 0) and (iSireGeneralThisYearRank < 100) then begin
                  fClassRating := fClassRating + 1;
               end;

               if (iSireGeneralLastYearRank > 0) and (iSireGeneralLastYearRank < 100) then begin
                  fClassRating := fClassRating + 1;
               end;

               if (iAge = 2) then begin
                  if (iSireJuvenileThisYearRank > 0) and (iSireJuvenileThisYearRank < 100) then begin
                     fClassRating := fClassRating + 1;
                  end;
               end;

               if (iAge = 2) then begin
                  if (iSireJuvenileLastYearRank > 0) and (iSireJuvenileLastYearRank < 100) then begin
                     fClassRating := fClassRating + 1;
                  end;
               end;

               if (iSireTurfThisYearRank > 0) and (iSireTurfThisYearRank < 100) then begin
                  fTurfRating := fTurfRating + 1;
               end;

               if (iSireTurfLastYearRank > 0) and (iSireTurfLastYearRank < 100) then begin
                  fTurfRating := fTurfRating + 1;
               end;

               tblE.FieldByName('ClassRating').AsFloat := fClassRating;
               tblE.FieldByName('TurfRating').AsFloat := fTurfRating;
               tblE.FieldByName('MudRating').AsFloat := fMudRating;

               tblE.FieldByName('OwnerSilks').AsString := sOwnerSilks;
               //if dm.tblRaces.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
               //   bRouteRace := False;
               //end else begin
               //   bRouteRace := True;
               //end;
               //
               //sSurface := dm.tblRaces.FieldByName('Surface').AsString;
               //
               //dm.tblEntries.FieldByName('RaceType').AsString := dm.tblRaces.FieldByName('RaceType').AsString;
               //dm.tblEntries.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
               //dm.tblEntries.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);
               //
               //dm.tblEntries.FieldByName('RaceDate').Value := dtAxcisRaceDate;
               //dm.tblEntries.FieldByName('RangeRaceDate').Value := dtAxcisRaceDate;
               //dm.tblEntries.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;
               //dm.tblEntries.FieldByName('HorseName').Value := dmDBF.dbfEntry.FieldByName('HORSE_NAME').AsString;
               //dm.tblEntries.FieldByName('HorseNbr').Value := atoi(dmDBF.dbfEntry.FieldByName('HN').AsString);
               //
               //dm.tblEntries.FieldByName('Owner').Value := UpperCase(StripOutName(dmDBF.dbfEntry.FieldByName('OWNER_NAME').AsString));
               //dm.tblEntries.FieldByName('ProgramNbr').Value := dmDBF.dbfEntry.FieldByName('PROGRAM').AsString;
               //dm.tblEntries.FieldByName('ProgramNbrSort').Value := GetProgramNbrSort(dmDBF.dbfEntry.FieldByName('PROGRAM').AsString);
               //dm.tblEntries.FieldByName('PostPos').Value := dmDBF.dbfEntry.FieldByName('PP').AsString;
               //
               //lJockeyRecNo := atol(dmDBF.dbfEntry.FieldByName('JN').AsString);
               //if lJockeyRecNo > 0 then begin
               //   dmDBF.dbfJockey.PhysicalRecNo := lJockeyRecNo;
               //   dm.tblEntries.FieldByName('Jockey').Value := UpperCase(dmDBF.dbfJockey.FieldByName('JOCK_DISP').AsString);
               //   dm.tblEntries.FieldByName('JkyEquibaseKey').Value := dmDBF.dbfJockey.FieldByName('JOCKNUMB').AsString;
               //
               //   dm.tblJockey.IndexName := '';
               //   dm.tblJockey.SetKey();
               //   dm.tblJockey.FieldByName('Jockey').AsString := UpperCase(dmDBF.dbfJockey.FieldByName('JOCK_DISP').AsString);
               //   if not dm.tblJockey.GotoKey() then begin
               //      dm.tblJockey.Append();
               //      dm.tblJockey.FieldByName('Jockey').AsString := UpperCase(dmDBF.dbfJockey.FieldByName('JOCK_DISP').AsString);
               //      dm.tblJockey.FieldByName('JkyEquibaseKey').Value :=
               //         dmDBF.dbfJockey.FieldByName('JOCKNUMB').AsString;
               //      try
               //         dm.tblJockey.Post();
               //      except
               //         on E: Exception do hLog.AddToLog(E.Message, msevException);
               //      end;
               //   end else begin
               //      dm.tblJockey.Edit();
               //      dm.tblJockey.FieldByName('JkyEquibaseKey').Value := dmDBF.dbfJockey.FieldByName('JOCKNUMB').AsString;
               //      try
               //         dm.tblJockey.Post();
               //      except
               //         on E: Exception do hLog.AddToLog(E.Message, msevException);
               //      end;
               //   end;
               //end;
               //
               //lTrainerRecNo := atol(dmDBF.dbfEntry.FieldByName('TN').AsString);
               //if lTrainerRecNo > 0 then begin
               //   dmDBF.dbfTrainer.PhysicalRecNo := lTrainerRecNo;
               //   dm.tblEntries.FieldByName('Trainer').Value :=
               //      UpperCase(dmDBF.dbfTrainer.FieldByName('TRAN_DISP').AsString);
               //   dm.tblEntries.FieldByName('TrnEquibaseKey').Value := dmDBF.dbfTrainer.FieldByName('TRAINNUMB').AsString;
               //
               //   dm.tblTrainer.IndexName := '';
               //   dm.tblTrainer.SetKey();
               //   dm.tblTrainer.FieldByName('Trainer').AsString :=
               //      UpperCase(dmDBF.dbfTrainer.FieldByName('TRAN_DISP').AsString);
               //   if not dm.tblTrainer.GotoKey() then begin
               //      dm.tblTrainer.Append();
               //      dm.tblTrainer.FieldByName('Trainer').AsString := UpperCase(dmDBF.dbfTrainer.FieldByName('TRAN_DISP').AsString);
               //      dm.tblTrainer.FieldByName('TrnEquibaseKey').Value := dmDBF.dbfTrainer.FieldByName('TRAINNUMB').AsString;
               //      dm.tblTrainer.Post();
               //   end else begin
               //      dm.tblTrainer.Edit();
               //      dm.tblTrainer.FieldByName('TrnEquibaseKey').Value :=
               //         dmDBF.dbfTrainer.FieldByName('TRAINNUMB').AsString;
               //      dm.tblTrainer.Post();
               //   end;
               //end;
               //
               //lSireRecNo := atol(dmDBF.dbfEntry.FieldByName('SN').AsString);
               //if lSireRecNo > 0 then begin
               //   dmDBF.dbfSire.PhysicalRecNo := lSireRecNo;
               //   sTmp := dmDBF.dbfSire.FieldByName('SIRENAME').AsString;
               //   sTmp := UpperCase(sTmp);
               //   if SmartPos('(', sTmp) > 0 then begin
               //      iEndPos := SmartPos('(', sTmp);
               //      sSireName := Trim(CopyStr(sTmp, 1, iEndPos _ 1));
               //      sSireName := FastReplace(sSireName, '.', '', True);
               //   end else begin
               //      sSireName := Trim(sTmp);
               //      sSireName := FastReplace(sSireName, '.', '', True);
               //   end;
               //
               //   dm.tblEntries.FieldByName('Sire').Value := Trim(CopyStr(sSireName, 1, 16));
               //
               //   dm.tblEntries.FieldByName('SIRE_REC_FOAL').Value := dmDBF.dbfSire.FieldByName('REC_FOAL').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_TURF').Value := dmDBF.dbfSire.FieldByName('REC_TURF').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_2YR').Value := dmDBF.dbfSire.FieldByName('REC_2YR').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_STK').Value := dmDBF.dbfSire.FieldByName('REC_STK').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_OFFTRK').Value := dmDBF.dbfSire.FieldByName('REC_OFFTRK').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_FTS').Value := dmDBF.dbfSire.FieldByName('REC_FTS').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_OFSTRK').Value := dmDBF.dbfSire.FieldByName('REC_OFSTRK').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_DS').Value := dmDBF.dbfSire.FieldByName('REC_DS').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_DR').Value := dmDBF.dbfSire.FieldByName('REC_DR').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_TS').Value := dmDBF.dbfSire.FieldByName('REC_TS').AsString;
               //   dm.tblEntries.FieldByName('SIRE_REC_TR').Value := dmDBF.dbfSire.FieldByName('REC_TR').AsString;
               //
               //end;
               //
               //lDamRecNo := atol(dmDBF.dbfEntry.FieldByName('DN').AsString);
               //if lDamRecNo > 0 then begin
               //   dmDBF.dbfDam.PhysicalRecNo := lDamRecNo;
               //
               //   sTmp := dmDBF.dbfDam.FieldByName('DAMNAME').AsString;
               //   sTmp := UpperCase(sTmp);
               //   if SmartPos('(', sTmp) > 0 then begin
               //      iEndPos := SmartPos('(', sTmp);
               //      sDamName := CopyStr(sTmp, 1, iEndPos _ 1);
               //      sDamName := FastReplace(sDamName, '.', '', True);
               //   end else begin
               //      sDamName := Trim(sTmp);
               //      sDamName := FastReplace(sDamName, '.', '', True);
               //   end;
               //
               //   dm.tblEntries.FieldByName('Dam').Value := Trim(CopyStr(sDamName, 1, 16));
               //
               //   dm.tblEntries.FieldByName('DAM_REC_FOAL').Value := dmDBF.dbfDam.FieldByName('REC_FOAL').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_TURFST').Value := dmDBF.dbfDam.FieldByName('REC_TURFST').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_OFFTRK').Value := dmDBF.dbfDam.FieldByName('REC_OFFTRK').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_FTS').Value := dmDBF.dbfDam.FieldByName('REC_FTS').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_2YR').Value := dmDBF.dbfDam.FieldByName('REC_2YR').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_STKST').Value := dmDBF.dbfDam.FieldByName('REC_STKST').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_OFSTRK').Value := dmDBF.dbfDam.FieldByName('REC_OFSTRK').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_TS').Value := dmDBF.dbfDam.FieldByName('REC_TS').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_TR').Value := dmDBF.dbfDam.FieldByName('REC_TR').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_DS').Value := dmDBF.dbfDam.FieldByName('REC_DS').AsString;
               //   dm.tblEntries.FieldByName('DAM_REC_DR').Value := dmDBF.dbfDam.FieldByName('REC_DR').AsString;
               //
               //   sTmp := dmDBF.dbfDam.FieldByName('DAMSIRE').AsString;
               //   sTmp := UpperCase(sTmp);
               //   if SmartPos('(', sTmp) > 0 then begin
               //      iEndPos := SmartPos('(', sTmp);
               //      sDamSireName := CopyStr(sTmp, 1, iEndPos _ 1);
               //      sDamSireName := FastReplace(sDamSireName, '.', '', True);
               //   end else begin
               //      sDamSireName := Trim(sTmp);
               //      sDamSireName := FastReplace(sDamSireName, '.', '', True);
               //   end;
               //   dm.tblEntries.FieldByName('DamSire').Value := Trim(CopyStr(sDamSireName,
               //      1, 16));
               //end;
               //
               //sTmp := dmDBF.dbfEntry.FieldByName('AXCIS_ODDS').AsString;
               //if SmartPos('/', sTmp) > 0 then begin
               //   iEndPos := SmartPos('/', sTmp);
               //   iLen := Length(sTmp);
               //   sTopOdds := CopyStr(sTmp, 1, iEndPos _ 1);
               //   iTopOdds := atoi(sTopOdds);
               //   if (SmartPos('B', sTmp) > 0) or (SmartPos('L', sTmp) > 0) or
               //      (SmartPos('+', sTmp) > 0) or (SmartPos('_', sTmp) > 0) then begin
               //      sBotOdds := CopyStr(sTmp, iEndPos + 1, (iLen _ iEndPos _ 1));
               //      iBotOdds := atoi(sBotOdds);
               //   end else begin
               //      sBotOdds := CopyStr(sTmp, iEndPos + 1, (iLen _ iEndPos));
               //      iBotOdds := atoi(sBotOdds);
               //   end;
               //
               //   if (SmartPos('B', sTmp) > 0) then begin
               //      dm.tblEntries.FieldByName('ValueIndicator').AsString := '$$';
               //   end;
               //   if (SmartPos('+', sTmp) > 0) then begin
               //      dm.tblEntries.FieldByName('ValueIndicator').AsString := '$';
               //   end;
               //   if (SmartPos('L', sTmp) > 0) then begin
               //      dm.tblEntries.FieldByName('ValueIndicator').AsString := '$';
               //   end;
               //
               //   if iBotOdds > 0 then
               //      dm.tblEntries.FieldByName('MorningLineTo1').Value := iTopOdds / iBotOdds
               //   else
               //      dm.tblEntries.FieldByName('MorningLine').Value := 0;
               //end;
               //
               //dm.tblEntries.FieldByName('MorningLineDesc').Value := sTopOdds + '/' + sBotOdds;
               //
               //sTmp := dmDBF.dbfEntry.FieldByName('YOB').AsString;
               //dm.tblEntries.FieldByName('Age').Value := atoi(dmDBF.dbfEntry.FieldByName('YOB').AsString);
               //dm.tblEntries.FieldByName('Sex').Value := dmDBF.dbfEntry.FieldByName('SEX').AsString;
               //dm.tblEntries.FieldByName('Weight').Value := dmDBF.dbfEntry.FieldByName('WEIGHT').AsString;
               //dm.tblEntries.FieldByName('Color').Value := dmDBF.dbfEntry.FieldByName('COLOR').AsString;
               //
               //dm.tblEntries.FieldByName('Breeder').Value := UpperCase(StripOutName(dmDBF.dbfEntry.FieldByName('BREEDER').AsString));
               //
               //dm.tblEntries.FieldByName('BredIn').Value := dmDBF.dbfEntry.FieldByName('WH_FOALED').AsString;
               //dm.tblEntries.FieldByName('DaysLast').Value := atoi(dmDBF.dbfEntry.FieldByName('DAYS').AsString);
               //
               //// Lifetime Record
               //iStarts := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 1, 3));
               //if iStarts = 0 then begin
               //   dm.tblEntries.FieldByName('DebutIndicator').Value := '*';
               //   dm.tblEntries.FieldByName('IsDebut').AsBoolean := True;
               //end;
               //if iStarts = 1 then begin
               //   dm.tblEntries.FieldByName('DebutIndicator').Value := '**';
               //   dm.tblEntries.FieldByName('IsDebutTwo').AsBoolean := True;
               //end;
               //
               //iStarts := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 1, 3));
               //if iStarts = 0 then begin
               //   dm.tblEntries.FieldByName('TurfIndicator').Value := '*';
               //end;
               //if iStarts = 1 then begin
               //   dm.tblEntries.FieldByName('TurfIndicator').Value := '**';
               //end;
               //
               //iStarts := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 1, 3));
               //if iStarts = 0 then begin
               //   dm.tblEntries.FieldByName('MudIndicator').Value := '*';
               //end;
               //if iStarts = 1 then begin
               //   dm.tblEntries.FieldByName('MudIndicator').Value := '**';
               //end;
               //
               //sTmp := dmDBF.dbfEntry.FieldByName('MED').AsString;
               //if sTmp = 'N' then begin
               //   dm.tblEntries.FieldByName('Med').Value := '(L)';
               //end;
               //if sTmp = 'L' then begin
               //   dm.tblEntries.FieldByName('Med').Value := '(L)';
               //end;
               //if sTmp = 'X' then begin
               //   dm.tblEntries.FieldByName('Med').Value := '';
               //end;
               //
               //if sTmp = '1' then begin
               //   dm.tblEntries.FieldByName('Med').Value := '(L*)';
               //   dm.tblEntries.FieldByName('IsFirstTimeJuice').Value := True;
               //end;
               //if sTmp = '2' then begin
               //   dm.tblEntries.FieldByName('Med').Value := '(L**)';
               //   dm.tblEntries.FieldByName('IsSecondTimeJuice').Value := True;
               //end;
               //
               //dm.tblEntries.FieldByName('Equip').Value := dmDBF.dbfEntry.FieldByName('EQUIP').AsString;
               //dm.tblEntries.FieldByName('LastEquip').Value := dmDBF.dbfEntry.FieldByName('EQUIPLAST1').AsString;
               //
               //sTmp := dmDBF.dbfEntry.FieldByName('EQUIP').AsString;
               //if sTmp = 'ON' then begin
               //   dm.tblEntries.FieldByName('IsBlinkersOn').Value := True;
               //end;
               //if sTmp = 'OFF' then begin
               //   dm.tblEntries.FieldByName('IsBlinkersOff').Value := True;
               //end;
               //
               //dm.tblEntries.FieldByName('StartsWorks21').Value := atoi(dmDBF.dbfEntry.FieldByName('ST21').AsString);
               //
               //if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) > 3 then begin
               //   dm.tblEntries.FieldByName('DaysLastWork').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 1, 3));
               //   if dm.tblEntries.FieldByName('DaysLastWork').AsInteger > 0 then begin
               //      dm.tblEntries.FieldByName('DaysLastWork').AsInteger := dm.tblEntries.FieldByName('DaysLastWork').AsInteger + 1;
               //   end;
               //end;
               //
               //if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) > 8 then begin
               //   dm.tblEntries.FieldByName('DaysLastWork2').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 5, 3));
               //   if dm.tblEntries.FieldByName('DaysLastWork2').AsInteger > 0 then begin
               //      dm.tblEntries.FieldByName('DaysLastWork2').AsInteger := dm.tblEntries.FieldByName('DaysLastWork2').AsInteger + 1;
               //   end;
               //end;
               //
               //if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) >= 11 then begin
               //   dm.tblEntries.FieldByName('DaysLastWork3').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 9, 3));
               //   if dm.tblEntries.FieldByName('DaysLastWork3').AsInteger > 0 then begin
               //      dm.tblEntries.FieldByName('DaysLastWork3').AsInteger := dm.tblEntries.FieldByName('DaysLastWork3').AsInteger + 1;
               //   end;
               //end;
               //
               //dm.tblEntries.FieldByName('WorkLine1').AsString := '';
               //
               //dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 0;
               //if (dm.tblEntries.FieldByName('DaysLastWork').AsInteger <
               //   dm.tblEntries.FieldByName('DaysLast').AsInteger) then begin
               //   dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 1;
               //   dm.tblEntries.FieldByName('WorkLine1').AsString :=
               //      dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString;
               //end;
               //
               //if (dm.tblEntries.FieldByName('DaysLastWork2').AsInteger <
               //   dm.tblEntries.FieldByName('DaysLast').AsInteger) then begin
               //   dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 2;
               //   dm.tblEntries.FieldByName('WorkLine1').AsString :=
               //      dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString + ' ' +
               //      dmDBF.dbfEntry.FieldByName('LAST2_WORK').AsString;
               //end;
               //
               //if (dm.tblEntries.FieldByName('DaysLastWork3').AsInteger <
               //   dm.tblEntries.FieldByName('DaysLast').AsInteger) then begin
               //   dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 3;
               //   dm.tblEntries.FieldByName('WorkLine1').AsString :=
               //      dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString + ' ' +
               //      dmDBF.dbfEntry.FieldByName('LAST2_WORK').AsString + ' ' +
               //      dmDBF.dbfEntry.FieldByName('LAST3_WORK').AsString;
               //end;
               //
               //// If first start
               //if (dm.tblEntries.FieldByName('DaysLast').AsInteger = 0) then begin
               //   dm.tblEntries.FieldByName('WorkLine1').AsString :=
               //      dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString + ' ' +
               //      dmDBF.dbfEntry.FieldByName('LAST2_WORK').AsString + ' ' +
               //      dmDBF.dbfEntry.FieldByName('LAST3_WORK').AsString;
               //end;
               //
               //dm.tblEntries.FieldByName('WorkLine2').AsString :=
               //   dmDBF.dbfEntry.FieldByName('LAST7_WORK').AsString + '  ' +
               //   dmDBF.dbfEntry.FieldByName('LAST8_WORK').AsString + '  ' +
               //   dmDBF.dbfEntry.FieldByName('LAST9_WORK').AsString + '  ' +
               //   dmDBF.dbfEntry.FieldByName('LAST10_WRK').AsString + '  ' +
               //   dmDBF.dbfEntry.FieldByName('LAST11_WRK').AsString + '  ' +
               //   dmDBF.dbfEntry.FieldByName('LAST12_WRK').AsString;
               //
               //// Dirt Sprints
               //sStarts := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 1, 3);
               //sWins := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 5, 3);
               //sPlcs := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 9, 3);
               //sShos := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 13, 3);
               //sEPS := dmDBF.dbfEntry.FieldByName('S91_DS_EPS').AsString;
               //
               //
               ////  dm.tblHorseRecords.FieldByName('DirtSprStarts').AsInteger := atoi(sStarts);
               ////  dm.tblHorseRecords.FieldByName('DirtSprWins').AsInteger   := atoi(sWins);
               ////  dm.tblHorseRecords.FieldByName('DirtSprPlcs').AsInteger   := atoi(sPlcs);
               ////  dm.tblHorseRecords.FieldByName('DirtSprShos').AsInteger   := atoi(sShos);
               ////  dm.tblHorseRecords.FieldByName('DirtSprEPS').AsInteger    := atoi(sEPS);
               ////  dm.tblHorseRecords.FieldByName('DirtSprEarnings').AsInteger :=
               ////    atoi(sEPS) * atoi(sStarts);
               //
               //iDirtSprintsStarts := atoi(sStarts);
               //iDirtSprintsWins := atoi(sWins);
               //iDirtSprintsPlcs := atoi(sPlcs);
               //iDirtSprintsShos := atoi(sShos);
               //lDirtSprintsEarn := atoi(sEPS) * atoi(sStarts);
               //lDirtSprintsEPS := atol(sEPS);
               //
               //// Dirt Routes
               //sStarts := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 1, 3);
               //sWins := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 5, 3);
               //sPlcs := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 9, 3);
               //sShos := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 13, 3);
               //sEPS := dmDBF.dbfEntry.FieldByName('S91_DR_EPS').AsString;
               //
               ////  dm.tblHorseRecords.FieldByName('DirtRteStarts').AsInteger := atoi(sStarts);
               ////  dm.tblHorseRecords.FieldByName('DirtRteWins').AsInteger   := atoi(sWins);
               ////  dm.tblHorseRecords.FieldByName('DirtRtePlcs').AsInteger   := atoi(sPlcs);
               ////  dm.tblHorseRecords.FieldByName('DirtRteShos').AsInteger   := atoi(sShos);
               ////  dm.tblHorseRecords.FieldByName('DirtRteEPS').AsInteger    := atoi(sEPS);
               ////  dm.tblHorseRecords.FieldByName('DirtRteEarnings').AsInteger :=
               ////    atoi(sEPS) * atoi(sStarts);
               //
               //iDirtRoutesStarts := atoi(sStarts);
               //iDirtRoutesWins := atoi(sWins);
               //iDirtRoutesPlcs := atoi(sPlcs);
               //iDirtRoutesShos := atoi(sShos);
               //lDirtRoutesEarn := atoi(sEPS) * atoi(sStarts);
               //lDirtRoutesEPS := atol(sEPS);
               //
               //// Turf Sprints
               //sStarts := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 1, 3);
               //sWins := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 5, 3);
               //sPlcs := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 9, 3);
               //sShos := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 13, 3);
               //sEPS := dmDBF.dbfEntry.fieldByName('S91_TS_EPS').AsString;
               //
               ////  dm.tblHorseRecords.FieldByName('TurfSprStarts').AsInteger := atoi(sStarts);
               ////  dm.tblHorseRecords.FieldByName('TurfSprWins').AsInteger   := atoi(sWins);
               ////  dm.tblHorseRecords.FieldByName('TurfSprPlcs').AsInteger   := atoi(sPlcs);
               ////  dm.tblHorseRecords.FieldByName('TurfSprShos').AsInteger   := atoi(sShos);
               ////  dm.tblHorseRecords.FieldByName('TurfSprEPS').AsInteger    := atoi(sEPS);
               ////  dm.tblHorseRecords.FieldByName('TurfSprEarnings').AsInteger :=
               ////    atoi(sEPS) * atoi(sStarts);
               //
               //iTurfSprintsStarts := atoi(sStarts);
               //iTurfSprintsWins := atoi(sWins);
               //iTurfSprintsPlcs := atoi(sPlcs);
               //iTurfSprintsShos := atoi(sShos);
               //lTurfSprintsEarn := atoi(sEPS) * atoi(sStarts);
               //lTurfSprintsEPS := atol(sEPS);
               //
               //// Turf Routes
               //sStarts := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 1, 3);
               //sWins := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 5, 3);
               //sPlcs := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 9, 3);
               //sShos := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 13, 3);
               //sEPS := dmDBF.dbfEntry.FieldByName('S91_TR_EPS').AsString;
               //
               ////  dm.tblHorseRecords.FieldByName('TurfRteStarts').AsInteger := atoi(sStarts);
               ////  dm.tblHorseRecords.FieldByName('TurfRteWins').AsInteger   := atoi(sWins);
               ////  dm.tblHorseRecords.FieldByName('TurfRtePlcs').AsInteger   := atoi(sPlcs);
               ////  dm.tblHorseRecords.FieldByName('TurfRteShos').AsInteger   := atoi(sShos);
               ////  dm.tblHorseRecords.FieldByName('TurfRteEPS').AsInteger    := atoi(sEPS);
               ////  dm.tblHorseRecords.FieldByName('TurfRteEarnings').AsInteger :=
               ////    atoi(sEPS) * atoi(sStarts);
               //
               //iTurfRoutesStarts := atoi(sStarts);
               //iTurfRoutesWins := atoi(sWins);
               //iTurfRoutesPlcs := atoi(sPlcs);
               //iTurfRoutesShos := atoi(sShos);
               //lTurfRoutesEarn := atoi(sEPS) * atoi(sStarts);
               //lTurfRoutesEPS := atol(sEPS);
               //
               //iTotalRoutesStarts := iTurfRoutesStarts + iDirtRoutesStarts;
               //iTotalRoutesWins := iTurfRoutesWins + iDirtRoutesWins;
               //iTotalRoutesPlcs := iTurfRoutesPlcs + iDirtRoutesPlcs;
               //iTotalRoutesShos := iTurfRoutesShos + iDirtRoutesShos;
               //
               //iTotalSprintsStarts := iTurfSprintsStarts + iDirtSprintsStarts;
               //iTotalSprintsWins := iTurfSprintsWins + iDirtSprintsWins;
               //iTotalSprintsPlcs := iTurfSprintsPlcs + iDirtSprintsPlcs;
               //iTotalSprintsShos := iTurfSprintsShos + iDirtSprintsShos;
               //
               //
               //// Current Year Record
               ////  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 1, 2);
               ////  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 4, 2);
               ////  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 7, 2);
               ////  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 10, 2);
               ////  sEPS    := dmDBF.dbfEntry.GetFieldByName('TY_EPS');
               //
               ////  dm.tblHorseRecords.FieldByName('CurrStarts').AsInteger   := atoi(sStarts);
               ////  dm.tblHorseRecords.FieldByName('CurrWins').AsInteger     := atoi(sWins);
               ////  dm.tblHorseRecords.FieldByName('CurrPlcs').AsInteger     := atoi(sPlcs);
               ////  dm.tblHorseRecords.FieldByName('CurrShos').AsInteger     := atoi(sShos);
               ////  dm.tblHorseRecords.FieldByName('CurrEPS').AsInteger      := atoi(sEPS);
               ////  dm.tblHorseRecords.FieldByName('CurrEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);
               ////
               //// Last Year Record
               ////  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 1, 2);
               ////  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 4, 2);
               ////  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 7, 2);
               ////  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 10, 2);
               ////  sEPS    := dmDBF.dbfEntry.GetFieldByName('LY_EPS');
               ////
               // //dm.tblHorseRecords.FieldByName('PrevStarts').AsInteger   := atoi(sStarts);
               // //dm.tblHorseRecords.FieldByName('PrevWins').AsInteger     := atoi(sWins);
               // //dm.tblHorseRecords.FieldByName('PrevPlcs').AsInteger     := atoi(sPlcs);
               // //dm.tblHorseRecords.FieldByName('PrevShos').AsInteger     := atoi(sShos);
               // //dm.tblHorseRecords.FieldByName('PrevEPS').AsInteger      := atoi(sEPS);
               // //dm.tblHorseRecords.FieldByName('PrevEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);
               //
               // //   Dirt Sprint Record At Track
               // //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 1, 2);
               // //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 4, 2);
               // //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 7, 2);
               // //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 10, 2);
               // //
               // //   dm.tblHorseRecords.FieldByName('TrkDirtSprStarts').AsInteger := atoi(sStarts);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtSprWins').AsInteger := atoi(sWins);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtSprPlcs').AsInteger := atoi(sPlcs);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtSprShos').AsInteger := atoi(sShos);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtSprEPS').AsInteger := atoi(sEPS);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtSprEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);
               //
               // //   Dirt Route Record At Track
               // //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 1, 2);
               // //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 4, 2);
               // //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 7, 2);
               // //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 10, 2);
               // //
               // //   dm.tblHorseRecords.FieldByName('TrkDirtRteStarts').AsInteger := atoi(sStarts);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtRteWins').AsInteger := atoi(sWins);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtRtePlcs').AsInteger := atoi(sPlcs);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtRteShos').AsInteger := atoi(sShos);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtRteEPS').AsInteger := atoi(sEPS);
               // //   dm.tblHorseRecords.FieldByName('TrkDirtRteEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);
               //
               // //   Turf Sprint Record At Track
               // //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 1, 2);
               // //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 4, 2);
               // //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 7, 2);
               // //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 10, 2);
               // //
               // //   dm.tblHorseRecords.FieldByName('TrkTurfSprStarts').AsInteger := atoi(sStarts);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfSprWins').AsInteger := atoi(sWins);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfSprPlcs').AsInteger := atoi(sPlcs);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfSprShos').AsInteger := atoi(sShos);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfSprEPS').AsInteger := atoi(sEPS);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfSprEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);
               //
               // //   Turf Route Record At Track
               // //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 1, 2);
               // //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 4, 2);
               // //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 7, 2);
               // //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 10, 2);
               // //
               // //   dm.tblHorseRecords.FieldByName('TrkTurfRteStarts').AsInteger := atoi(sStarts);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfRteWins').AsInteger := atoi(sWins);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfRtePlcs').AsInteger := atoi(sPlcs);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfRteShos').AsInteger := atoi(sShos);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfRteEPS').AsInteger := atoi(sEPS);
               // //   dm.tblHorseRecords.FieldByName('TrkTurfRteEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);
               //
               // //   Distance Stats
               // //   Dirt Distance Record
               // //   sStarts := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 1, 2);
               // //   sWins := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 4, 2);
               // //   sPlcs := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 7, 2);
               // //   sShos := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 10, 2);
               // //
               // //   dm.tblHorseRecords.FieldByName('DistDirtStarts').AsInteger := atoi(sStarts);
               // //   dm.tblHorseRecords.FieldByName('DistDirtWins').AsInteger := atoi(sWins);
               // //   dm.tblHorseRecords.FieldByName('DistDirtPlcs').AsInteger := atoi(sPlcs);
               // //   dm.tblHorseRecords.FieldByName('DistDirtShos').AsInteger := atoi(sShos);
               //
               // //   Turf Distance
               // //   sStarts := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 1, 2);
               // //   sWins := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 4, 2);
               // //   sPlcs := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 7, 2);
               // //   sShos := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 10, 2);
               // //
               // //   dm.tblHorseRecords.FieldByName('DistTurfStarts').AsInteger := atoi(sStarts);
               // //   dm.tblHorseRecords.FieldByName('DistTurfWins').AsInteger := atoi(sWins);
               // //   dm.tblHorseRecords.FieldByName('DistTurfPlcs').AsInteger := atoi(sPlcs);
               // //   dm.tblHorseRecords.FieldByName('DistTurfShos').AsInteger := atoi(sShos);
               //
               // // Lifetime Dirt Distance
               ////  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 1, 3);
               ////  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 5, 2);
               ////  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 8, 2);
               ////  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 11, 2);
               ////
               ////  dm.tblHorseRecords.FieldByName('LifeDirtStarts').AsInteger := atoi(sStarts);
               ////  dm.tblHorseRecords.FieldByName('LifeDirtWins').AsInteger   := atoi(sWins);
               ////  dm.tblHorseRecords.FieldByName('LifeDirtPlcs').AsInteger   := atoi(sPlcs);
               ////  dm.tblHorseRecords.FieldByName('LifeDirtShos').AsInteger   := atoi(sShos);
               //
               ////  lEarn := (lDirtRoutesEPS * iDirtRoutesStarts) + (lDirtSprintsEPS * iDirtSprintsStarts);
               ////  if (atoi(sStarts) > 0) then
               ////  begin
               ////    lEPS := lEarn div atoi(sStarts);
               ////  end
               ////  else
               ////  begin
               ////    lEPS := 0;
               ////  end;
               ////
               ////  dm.tblHorseRecords.FieldByName('LifeDirtEarnings').Value := lEarn;
               ////  dm.tblHorseRecords.FieldByName('LifeDirtEPS').Value      := lEPS;
               //
               // //** Add Turf Debut Record
               ////  if (atoi(sStarts) = 0) then
               ////  begin
               ////    dm.tblHorseTurfDebutRecords.IndexName := '';
               ////    dm.tblHorseTurfDebutRecords.SetKey();
               ////    dm.tblHorseTurfDebutRecords.FieldByName('HorseName').Value :=
               ////      dmDBF.dbfEntry.GetFieldByName('HORSE_NAME');
               ////    if (dm.tblHorseTurfDebutRecords.GotoKey()) then
               ////    begin
               ////      dm.tblHorseTurfDebutRecords.Edit();
               ////      dm.tblHorseTurfDebutRecords.FieldByName('Starts').AsInteger := atoi(sStarts);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('Wins').AsInteger   := atoi(sWins);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('Earnings').Value   := lEarn;
               ////      dm.tblHorseTurfDebutRecords.FieldByName('SireName').Value   := Trim(sSireName);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('DamSireName').Value := Trim(sDamSireName);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('DamName').Value    := Trim(sDamName);
               ////      dm.tblHorseTurfDebutRecords.Post();
               ////      Application.ProcessMessages();
               ////    end
               ////    else
               ////    begin
               ////      dm.tblHorseTurfDebutRecords.Append();
               ////      dm.tblHorseTurfDebutRecords.FieldByName('HorseName').Value :=
               ////        dmDBF.dbfEntry.GetFieldByName('HORSE_NAME');
               ////      dm.tblHorseTurfDebutRecords.FieldByName('Starts').AsInteger := atoi(sStarts);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('Wins').AsInteger  := atoi(sWins);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('Earnings').Value  := lEarn;
               ////      dm.tblHorseTurfDebutRecords.FieldByName('SireName').Value  := Trim(sSireName);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('DamSireName').Value := Trim(sDamSireName);
               ////      dm.tblHorseTurfDebutRecords.FieldByName('DamName').Value   := Trim(sDamName);
               ////      dm.tblHorseTurfDebutRecords.Post();
               ////      Application.ProcessMessages();
               ////    end;
               ////  end;
               ////
               ////  // Soft Turf Stats
               ////  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 1, 3);
               ////  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 5, 2);
               ////  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 8, 2);
               ////  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 11, 2);
               //
               ////  dm.tblHorseRecords.FieldByName('LifeSoftStarts').AsInteger := atoi(sStarts);
               ////  dm.tblHorseRecords.FieldByName('LifeSoftWins').AsInteger   := atoi(sWins);
               ////  dm.tblHorseRecords.FieldByName('LifeSoftPlcs').AsInteger   := atoi(sPlcs);
               ////  dm.tblHorseRecords.FieldByName('LifeSoftShos').AsInteger   := atoi(sShos);
               ////
               //// Lifetime Turf Distance
               //sStarts := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 1, 3);
               //sWins := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 5, 2);
               //sPlcs := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 8, 2);
               //sShos := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 11, 2);
               //
               //dm.tblEntries.FieldByName('TurfStarts').AsInteger := atoi(sStarts);
               //dm.tblEntries.FieldByName('TurfWins').AsInteger := atoi(sWins);
               //dm.tblEntries.FieldByName('TurfPlcs').AsInteger := atoi(sPlcs);
               //dm.tblEntries.FieldByName('TurfShos').AsInteger := atoi(sShos);
               //
               //lEarn := (lTurfRoutesEPS * iTurfRoutesStarts) + (lTurfSprintsEPS * iTurfSprintsStarts);
               //if (atoi(sStarts) > 0) then begin
               //   lEPS := lEarn div atoi(sStarts);
               //end else begin
               //   lEPS := 0;
               //end;
               //
               //dm.tblEntries.FieldByName('TurfEarnings').Value := lEarn;
               //dm.tblEntries.FieldByName('TurfEPS').Value := lEPS;
               //
               //// 139  EARNWET  Num     9       Horses earnings total in all off track races
               //sStarts := '';
               //sWins := '';
               //sPlcs := '';
               //sShos := '';
               //
               //sStarts := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 1, 3);
               //sWins := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 5, 2);
               //sPlcs := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 8, 2);
               //sShos := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 11, 2);
               //
               //dm.tblEntries.FieldByName('MudStarts').AsInteger := atoi(sStarts);
               //dm.tblEntries.FieldByName('MudWins').AsInteger := atoi(sWins);
               //dm.tblEntries.FieldByName('MudPlcs').AsInteger := atoi(sPlcs);
               //dm.tblEntries.FieldByName('MudShos').AsInteger := atoi(sShos);
               //
               //lEarn := atol(dmDBF.dbfEntry.FieldByName('EARNWET').AsString);
               //if (atoi(sStarts) > 0) then begin
               //   lEPS := lEarn div atoi(sStarts);
               //end else begin
               //   lEPS := 0;
               //end;
               //dm.tblEntries.FieldByName('MudEarnings').Value := lEarn;
               //dm.tblEntries.FieldByName('MudEPS').Value := lEPS;
               //
               ////
               //sStarts := '';
               //sWins := '';
               //sPlcs := '';
               //sShos := '';
               //
               //// 75    TRK_D_S123  Char    11      Horses record at track dirt races since '91
               ////   76  TRK_T_S123  Char    11      Horses record at track turf races since '91
               ////   77  TRK_W_S123  Char    11      Horses record at track off_track  since '91
               ////   78  TRK_S_S123  Char    11      Horses record at track soft turf since '91
               ////   79  TRKDS_S123  Char    11      Horses record all tracks dirt sprints since '91
               ////   80  TRKDR_S123  Char    11      Horses record all tracks dirt routes since '91
               ////   81  TRKTS_S123  Char    11      Horses record all tracks turf sprints since '91
               ////   82  TRKTR_S123  Char    11      Horses record all tracks turf routes since '91
               ////   83  TRKDD_S123  Char    11      Horses record at track distance/dirt
               ////   84  TRKTD_S123  Char    11      Horses record at track distance/turf
               //
               //
               //// 75    TRK_D_S123  Char    11      Horses record at track dirt races since '91
               //sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 1, 2);
               //sWins := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 4, 2);
               //sPlcs := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 7, 2);
               //sShos := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 10, 2);
               //
               //dm.tblEntries.FieldByName('TrkStarts').AsInteger := atoi(sStarts);
               //dm.tblEntries.FieldByName('TrkWins').AsInteger := atoi(sWins);
               //dm.tblEntries.FieldByName('TrkPlcs').AsInteger := atoi(sPlcs);
               //dm.tblEntries.FieldByName('TrkShos').AsInteger := atoi(sShos);
               //
               //sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 1, 2);
               //sWins := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 4, 2);
               //sPlcs := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 7, 2);
               //sShos := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 10, 2);
               //
               //dm.tblEntries.FieldByName('TrkStarts').AsInteger := dm.tblEntries.FieldByName('TrkStarts').AsInteger + atoi(sStarts);
               //dm.tblEntries.FieldByName('TrkWins').AsInteger := dm.tblEntries.FieldByName('TrkWins').AsInteger + atoi(sWins);
               //dm.tblEntries.FieldByName('TrkPlcs').AsInteger := dm.tblEntries.FieldByName('TrkPlcs').AsInteger + atoi(sPlcs);
               //dm.tblEntries.FieldByName('TrkShos').AsInteger := dm.tblEntries.FieldByName('TrkShos').AsInteger + atoi(sShos);
               //
               //// 137   EARNTRK Num 9       Horses earnings total in all races at track
               //lEarn := atol(dmDBF.dbfEntry.FieldByName('EARNTRK').AsString);
               //if (atoi(sStarts) > 0) then begin
               //   lEPS := lEarn div atoi(sStarts);
               //end else begin
               //   lEPS := 0;
               //end;
               //dm.tblEntries.FieldByName('TrkEPS').Value := lEPS;
               //
               //
               ////DSP_
               ////TY_S123
               ////TY_EPS
               //
               //
               ////REC_TY
               //
               //// Lifetime Record
               //sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 1, 3);
               //sWins := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 5, 2);
               //sPlcs := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 8, 2);
               //sShos := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 11, 2);
               //sEarn := CopyStr(dmDBF.dbfEntry.FieldByName('OVRAL_REC1').AsString, 27, 7);
               //
               //dm.tblEntries.FieldByName('LifeStarts').AsInteger := atoi(sStarts);
               //dm.tblEntries.FieldByName('LifeWins').AsInteger := atoi(sWins);
               //dm.tblEntries.FieldByName('LifePlcs').AsInteger := atoi(sPlcs);
               //dm.tblEntries.FieldByName('LifeShos').AsInteger := atoi(sShos);
               //dm.tblEntries.FieldByName('LifeEarnings').AsInteger := atoi(sEarn);
               //
               //sEarn := CopyStr(dmDBF.dbfEntry.FieldByName('OVRAL_REC1').AsString, 27, 7);
               //lEarn := atol(sEarn);
               //if (atoi(sStarts) > 0) then begin
               //   lEPS := lEarn div atol(sStarts);
               //end else begin
               //   lEPS := 0;
               //end;
               //dm.tblEntries.FieldByName('LifeEPS').Value := lEPS;
               //
               //
               //if (dm.tblEntries.FieldByName('AvgClass').AsFloat = 0) then begin
               //   dm.tblEntries.FieldByName('AvgClass').AsFloat := atof(dmDBF.dbfEntry.FieldByName('AVE_CL').AsString);
               //end;
               //
               //if (dm.tblEntries.FieldByName('AvgSpeed').Value = 0) then begin
               //   dm.tblEntries.FieldByName('AvgSpeed').Value := atoi(dmDBF.dbfEntry.FieldByName('AVE_SP').AsString);
               //end;
               //
               //dm.tblEntries.FieldByName('AvgPurse').AsFloat := atof(dmDBF.dbfEntry.FieldByName('AV_PUR_VAL').AsString);
               //dm.tblEntries.FieldByName('TodaysClass').Value := atoi(dmDBF.dbfEntry.FieldByName('TODAYS_CLS').AsString);
               //
               //dm.tblEntries.FieldByName('AvgClassRating').Value := atoi(dmDBF.dbfEntry.FieldByName('AVE_CL').AsString);
               //
               //if dm.tblEntries.FieldByName('AvgSpeed').AsInteger = 0 then begin
               //   dm.tblEntries.FieldByName('AvgSpeed').AsInteger := dm.tblEntries.FieldByName('LastSpeed').AsInteger;
               //end;
               //if dm.tblEntries.FieldByName('AvgClass').AsFloat = 0 then begin
               //   dm.tblEntries.FieldByName('AvgClass').AsFloat := dm.tblEntries.FieldByName('TodaysClass').AsFloat;
               //end;
               //if dm.tblEntries.FieldByName('AvgClassRating').Value = 0 then begin
               //   dm.tblEntries.FieldByName('AvgClassRating').Value := dm.tblEntries.FieldByName('TodaysClass').AsFloat;
               //end;
               //
               //dm.tblEntries.FieldByName('RouteStarts').AsInteger := iTotalRoutesStarts;
               //dm.tblEntries.FieldByName('RouteWins').AsInteger := iTotalRoutesWins;
               //dm.tblEntries.FieldByName('RoutePlcs').AsInteger := iTotalRoutesPlcs;
               //dm.tblEntries.FieldByName('RouteShos').AsInteger := iTotalRoutesShos;
               //
               //dm.tblEntries.FieldByName('SprintStarts').AsInteger := iTotalSprintsStarts;
               //dm.tblEntries.FieldByName('SprintWins').AsInteger := iTotalSprintsWins;
               //dm.tblEntries.FieldByName('SprintPlcs').AsInteger := iTotalSprintsPlcs;
               //dm.tblEntries.FieldByName('SprintShos').AsInteger := iTotalSprintsShos;
               //
               //if (iTotalRoutesStarts = 0) then begin
               //   if (dm.tblRaces.FieldByName('IsRouteRace').AsBoolean) then begin
               //      dm.tblEntries.FieldByName('RouteIndicator').Value := '*';
               //   end;
               //end;
               //
               //if (iTotalRoutesStarts = 1) then begin
               //   if (dm.tblRaces.FieldByName('IsRouteRace').AsBoolean) then begin
               //      dm.tblEntries.FieldByName('RouteIndicator').Value := '**';
               //   end;
               //end;
               //
               ////Todays Surface/Distance
               //sTmp := dmDBF.dbfEntry.FieldByName('PACER').AsString;
               ////Check for Route or Sprint
               //if (Trim(sTmp) = '') then begin
               //   if dm.tblRaces.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
               //      sTmp := dmDBF.dbfEntry.FieldByName('PACER_SPR').AsString;
               //   end else begin
               //      sTmp := dmDBF.dbfEntry.FieldByName('PACER_RTE').AsString;
               //   end;
               //end;
               ////If Nothing use what we have
               //if (Trim(sTmp) = '') then begin
               //   sTmp := dmDBF.dbfEntry.FieldByName('PACER_ALL').AsString;
               //end;
               //
               //iLen := Length(sTmp);
               //if (iLen >= 14) then begin
               //   sAxcisEarlyPacePos := CopyStr(sTmp, 1, 4);
               //   sAxcisMiddlePacePos := CopyStr(sTmp, 6, 4);
               //   sAxcisLatePacePos := CopyStr(sTmp, 11, 4);
               //end else begin
               //   sAxcisEarlyPacePos := '';
               //   sAxcisMiddlePacePos := '';
               //   sAxcisLatePacePos := '';
               //end;
               //
               //fAxcisEarlyPacePos := atof(sAxcisEarlyPacePos);
               //fAxcisMiddlePacePos := atof(sAxcisMiddlePacePos);
               //fAxcisLatePacePos := atof(sAxcisLatePacePos);
               //
               //if fAxcisEarlyPacePos = 0 then begin
               //   fAxcisEarlyPacePos := 9999;
               //end;
               //if fAxcisMiddlePacePos = 0 then begin
               //   fAxcisMiddlePacePos := 9999;
               //end;
               //if fAxcisLatePacePos = 0 then begin
               //   fAxcisLatePacePos := 9999;
               //end;
               //
               //dm.tblEntries.FieldByName('AxcisEarlyPacePos').AsFloat := fAxcisEarlyPacePos;
               //dm.tblEntries.FieldByName('AxcisMiddlePacePos').AsFloat := fAxcisMiddlePacePos;
               //dm.tblEntries.FieldByName('AxcisLatePacePos').AsFloat := fAxcisLatePacePos;
               //
               ////Todays Surface/Distance
               //sTmp := dmDBF.dbfEntry.FieldByName('S_PACER').AsString;
               ////Check for Route or Sprint
               //if (Trim(sTmp) = '') then begin
               //   if dm.tblRaces.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
               //      sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_SPR').AsString;
               //   end else begin
               //      sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_RTE').AsString;
               //   end;
               //end;
               //
               ////If Nothing use what we have
               //if (Trim(sTmp) = '') then begin
               //   sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_ALL').AsString;
               //end;
               //iLen := Length(sTmp);
               //if (iLen >= 17) then begin
               //   dm.tblEntries.FieldByName('AxcisEarlyPace').AsFloat := atof(CopyStr(sTmp, 1, 5));
               //   dm.tblEntries.FieldByName('AxcisMiddlePace').AsFloat := atof(CopyStr(sTmp, 7, 5));
               //   dm.tblEntries.FieldByName('AxcisLatePace').AsFloat := atof(CopyStr(sTmp, 13, 5));
               //end else begin
               //   dm.tblEntries.FieldByName('AxcisEarlyPace').AsFloat := 0;
               //   dm.tblEntries.FieldByName('AxcisMiddlePace').AsFloat := 0;
               //   dm.tblEntries.FieldByName('AxcisLatePace').AsFloat := 0;
               //end;
               //
               //// We will use these from now on
               //dm.tblEntries.FieldByName('EarlyPacePos').AsFloat := fAxcisEarlyPacePos;
               //dm.tblEntries.FieldByName('MiddlePacePos').AsFloat := fAxcisMiddlePacePos;
               //dm.tblEntries.FieldByName('LatePacePos').AsFloat := fAxcisLatePacePos;
               //
               //dm.tblEntries.FieldByName('EarlyPace').AsFloat := atof(CopyStr(sTmp, 1, 5));
               //dm.tblEntries.FieldByName('MiddlePace').AsFloat := atof(CopyStr(sTmp, 7, 5));
               //dm.tblEntries.FieldByName('LatePace').AsFloat := atof(CopyStr(sTmp, 13, 5));
               //
               //
               tblE.Post();
               tblE.FlushBuffers();
            end;

         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;


   finally
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
      FreeAndNil(lstS);
      FreeAndNil(lstPCS);
   end;

end;


end.

