unit UnitTSNImport;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure ImportMCPFile(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   sFileName: string);


procedure ImportXRDFile(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   sFileName: string
   );

procedure ClearRaceResults(tblR: TDBISAMTable);
procedure UpdateMultiRaceResults(tblR: TDBISAMTable);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;


procedure ImportMCPFile(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   sFileName: string);
var
   lstMCP: TStringList;

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
   sLast2SpeedRating: string;
   sLast3SpeedRating: string;

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

   fJockeyDistanceOnTurfStarts: double;
   fJockeyDistanceOnTurfWins: double;
   fJockeyDistanceOnTurfWinPct: double;
               

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
   //   1 Track                         CHARACTER  XXX       3
   //   2 Date                          CHARACTER  XXXXXXXX  8
   //   3 Race #                        NUMERIC    99        2
   //   4 Post Position                 NUMERIC    99        2

   //*** Today's Horse/Trainer/Jockey/Owner ***
   //
   //  28 Today's Trainer               CHARACTER           30
   //  29 Trainer Sts     Current Meet  NUMERIC    9999      4
   //  30 Trainer Wins    Current Meet  NUMERIC     999      3
   //  31 Trainer Places  Current Meet  NUMERIC     999      3
   //  32 Trainer Shows   Cureent Meet  NUMERIC     999      3
   //  33 Today's Jockey                CHARACTER           25
   //  34 Apprentice wgt allow.(if any) NUMERIC      99      2
   //  35 Jockey  Sts     Current Meet  NUMERIC    9999      4
   //  36 Jockey  Wins    Current Meet  NUMERIC     999      3
   //  37 Jockey  Places  Current Meet  NUMERIC     999      3
   //  38 Jockey  Shows   Current Meet  NUMERIC     999      3
   //  39 Today's Owner                 CHARACTER           40
   //  40 Owner's Silks                 CHARACTER          100
   //  41 Main Track Only Indicator     CHARACTER            1  "M" for MTO
   //                                                           "A" for A.E.
   //  42 Reserved for possible future expansion
   //  43 Program Number (if available) CHARACTER   XXX      3
   //  44 Morn. Line Odds(if available) NUMERIC  999.99      6
   //
   //
   // 210 TSN Run Style designations    CHARACTER   XXX      3  E   Early
   // 211 Early Speed Points            NUMERIC       9      1
   // 240-248 Wager Types for this race     CHARACTER  X(50)    50  (if available)
   // 251 TSN Power Rating              NUMERIC    999.999   6

   // 1178      Best TSN Speed - Fast track   NUMERIC   999        3
   // 1179      Best TSN Speed - Turf         NUMERIC   999        3
   // 1180      Best TSN Speed - Off track    NUMERIC   999        3
   // 1181      Best TSN Speed - Distance     NUMERIC   999        3

   // 1222      Auction Sales Price           NUMERIC   99999999   8
   // 1223      Where Sold At Auction         CHARACTER X(12)     12

   // 1328      Best TSN Speed: Life          NUMERIC    999       3
   // 1329      Best TSN Speed: MostRecentYr  NUMERIC    999       3
   // 1330      Best TSN Speed: 2ndMstRcntYr  NUMERIC    999       3
   // 1331      Best TSN Speed: Track         NUMERIC    999       3
   //
   // 766- 775 TSN   2f Pace Figure
   // 776- 785 TSN   4f Pace Figure
   // 786- 795 TSN   6f Pace Figure
   // 796- 805 TSN   8f Pace Figure
   // 806- 815 TSN  10f Pace Figure
   // 816- 825 TSN Late Pace Figure
   // 846- 855 TSN Official Speed Rating

   //1146 Avg BRIS Class Rating last 3 sts   NUMERIC   999.9      5
   // 1147 Trainer      Sts     Current Year  NUMERIC   9999       4
   // 1148              Wins                                       4
   // 1149              Places                                     4
   // 1150              Shows                                      4
   // 1151              ROI     Current Year  NUMERIC   999.99     6
   // 1152 Trainer      Sts     Previous Year NUMERIC   9999       4
   // 1153              Wins                                       4
   // 1154              Places                                     4
   // 1155              Shows                                      4
   // 1156              ROI     Previous Year NUMERIC   999.99     6
   // 1157 Jockey       Sts     Current Year  NUMERIC   9999       4
   // 1158              Wins                                       4
   // 1159              Places                                     4
   // 1160              Shows                                      4
   // 1161              ROI     Current Year  NUMERIC   999.99     6
   // 1162 Jockey       Sts     Previous Year NUMERIC   9999       4
   // 1163              Wins                                       4
   // 1164              Places                                     4
   // 1165              Shows                                      4
   // 1166              ROI     Previous Year NUMERIC   999.99     6
   // 1264      BRIS Dirt Pedigree Rating     CHARACTER XXXX       4 eg. "115*"
   // 1265      BRIS Mud Pedigree Rating      CHARACTER XXXX       4
   // 1266      BRIS Turf Pedigree Rating     CHARACTER XXXX       4
   // 1267      BRIS Dist Pedigree Rating     CHARACTER XXXX       4

   // 1337      Key Trnr Stat Category #1     CHARACTER X(16)     16
   // 1338      # of starts            #1     NUMERIC   9999       4
   // 1339      Win%                   #1     NUMERIC   999.99     6
   // 1340      in-the-money (itm) %   #1     NUMERIC   999.99     6
   // 1341      $2ReturnOnInvestment   #1     NUMERIC   999.99     6
   // 1342      Key Trnr Stat Category #2     CHARACTER X(16)     16
   // 1343      # of starts            #2     NUMERIC   9999       4
   // 1344      Win%                   #2     NUMERIC   999.99     6
   // 1345      in-the-money (itm) %   #2     NUMERIC   999.99     6
   // 1346      $2ReturnOnInvestment   #2     NUMERIC   999.99     6
   // 1347      Key Trnr Stat Category #3     CHARACTER X(16)     16
   // 1348      # of starts            #3     NUMERIC   9999       4
   // 1349      Win%                   #3     NUMERIC   999.99     6
   // 1350      in-the-money (itm) %   #3     NUMERIC   999.99     6
   // 1351      $2ReturnOnInvestment   #3     NUMERIC   999.99     6
   // 1352      Key Trnr Stat Category #4     CHARACTER X(16)     16
   // 1353      # of starts            #4     NUMERIC   9999       4
   // 1354      Win%                   #4     NUMERIC   999.99     6
   // 1355      in-the-money (itm) %   #4     NUMERIC   999.99     6
   // 1356      $2ReturnOnInvestment   #5     NUMERIC   999.99     6
   // 1357      Key Trnr Stat Category #5     CHARACTER X(16)     16
   // 1358      # of starts            #5     NUMERIC   9999       4
   // 1359      Win%                   #5     NUMERIC   999.99     6
   // 1360      in-the-money (itm) %   #5     NUMERIC   999.99     6
   // 1361      $2ReturnOnInvestment   #5     NUMERIC   999.99     6
   // 1362      Key Trnr Stat Category #6     CHARACTER X(16)     16
   // 1363      # of starts            #6     NUMERIC   9999       4
   // 1364      Win%                   #6     NUMERIC   999.99     6
   // 1365      in-the-money (itm) %   #6     NUMERIC   999.99     6
   // 1366      $2ReturnOnInvestment   #6     NUMERIC   999.99     6
   // 1367      JKY@Dis/JKYonTurf Label       CHARACTER X(13)     13
   // 1368      JKY@Dis/JKYonTurf Starts      NUMERIC   9999       4
   // 1369      JKY@Dis/JKYonTurf Wins        NUMERIC   9999       4
   // 1370      JKY@Dis/JKYonTurf Places      NUMERIC   9999       4
   // 1371      JKY@Dis/JKYonTurf Shows       NUMERIC   9999       4
   // 1372      JKY@Dis/JKYonTurf ROI         NUMERIC   999.99     6
   // 1373      JKY@Dis/JKYonTurf Earnings    NUMERIC   999999999  9
   // 1374      Post Times (by region)        CHARACTER X(50)     50
   //           eg: 1:15/(12:15)/11:15/10:15
   // 1375-1382 Reserved
   // 1383-1392 Extended Start Comment        CHARACTER X(90)     90
   // 1393-1402 "Sealed" track indicator      CHARACTER X          1 "s"
   // 1403-1412 Prev. All-Weather Surface flagCHARACTER X          1 A - All Weather
   //                                                                    Surface
   //
   // 1413-1435 Reserved fields



   hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
   hLog.AddToLog('Process TSN ProCaps - ' + sFileName, msevOperation);
   try
      try
         lstMCP := TStringList.Create;
         lstMCP.LoadFromFile(sFileName);

         for iIdx := 0 to lstMCP.Count - 1 do begin
            sTmp := lstMCP[iIdx];
            sTmp := FastReplace(sTmp, '"', '', True);
            Split(sTmp, ',', lstS);

            iCnt := lstS.Count;

            sTrack := StringListTrim(lstS[1 - 1]);
            sDate := StringListTrim(lstS[2 - 1]);
            sRaceNbr := StringListTrim(lstS[3 - 1]);
            sPostPos := StringListTrim(lstS[4 - 1]);

            sTodaysRaceClassification := StringListTrim(lstS[11 - 1]);
            sRaceConditions := StringListTrim(lstS[16 - 1]);
            sTodaysMutuelList := StringListTrim(lstS[20 - 1]);

            sOwner := StringListTrim(lstS[39 - 1]);
            sOwnerSilks := StringListTrim(lstS[40 - 1]);
            sDirtPedigreeRating := StringListTrim(lstS[1264 - 1]);
            sMudPedigreeRating := StringListTrim(lstS[1265 - 1]);
            sTurfPedigreeRating := StringListTrim(lstS[1266 - 1]);
            sDistPedigreeRating := StringListTrim(lstS[1267 - 1]);








            //     11 Today's Race Classification   CHARACTER  X(14)    14 (eg. Alw44000n2L)
            //     16 Race Conditions               CHARACTER          500 see also
            //     20 Today's Mutuel list           CHARACTER          200     "        "


            // 240-248 Wager Types for this race     CHARACTER  X(50)    50  (if available)
            sWagerTypes := UpperCase(StringListTrim(lstS[240 - 1]) + ' ' +
               StringListTrim(lstS[241 - 1]) + ' ' +
               StringListTrim(lstS[242 - 1]) + ' ' +
               StringListTrim(lstS[243 - 1]) + ' ' +
               StringListTrim(lstS[244 - 1]) + ' ' +
               StringListTrim(lstS[245 - 1]) + ' ' +
               StringListTrim(lstS[246 - 1]) + ' ' +
               StringListTrim(lstS[247 - 1]) + ' ' +
               StringListTrim(lstS[248 - 1]));

            //1374      Post Times (by region)        CHARACTER X(50)     50
            sPostTimes := StringListTrim(lstS[1374 - 1]);

            sTSNPowerRating := StringListTrim(lstS[251 - 1]);

            sTSNLastClassRating := StringListTrim(lstS[836 - 1]);
            sTSNAvgClassRating := StringListTrim(lstS[1146 - 1]);

            sBestTSNSpeedFastTrack := StringListTrim(lstS[1178 - 1]);
            sBestTSNSpeedTurf := StringListTrim(lstS[1179 - 1]);
            sBestTSNSpeedOffTrack := StringListTrim(lstS[1180 - 1]);
            sBestTSNSpeedDistance := StringListTrim(lstS[1181 - 1]);

            sAuctionSalesPrice := StringListTrim(lstS[1222 - 1]);
            sWhereSoldAtAuction := StringListTrim(lstS[1223 - 1]);

            sBestTSNSpeedLife := StringListTrim(lstS[1328 - 1]);
            sBestTSNSpeedMostRecentYr := StringListTrim(lstS[1329 - 1]);
            sBestTSNSpeed2ndMostRecentYr := StringListTrim(lstS[1330 - 1]);
            sBestTSNSpeedTrack := StringListTrim(lstS[1331 - 1]);

            s2fPaceFigure := StringListTrim(lstS[766 - 1]);
            s4fPaceFigure := StringListTrim(lstS[776 - 1]);
            s6fPaceFigure := StringListTrim(lstS[786 - 1]);
            s8fPaceFigure := StringListTrim(lstS[796 - 1]);
            s10fPaceFigure := StringListTrim(lstS[806 - 1]);
            sLatePaceFigure := StringListTrim(lstS[816 - 1]);
            sLastSpeedRating := StringListTrim(lstS[846 - 1]);
            sLast2SpeedRating := StringListTrim(lstS[847 - 1]);
            sLast3SpeedRating := StringListTrim(lstS[848 - 1]);

            sTSNRunStyle := StringListTrim(lstS[210 - 1]);
            sEarlySpeedPoints := StringListTrim(lstS[211 - 1]);

            fTrainerStsCY := atof(StringListTrim(lstS[1147 - 1]));
            fTrainerWinsCY := atof(StringListTrim(lstS[1148 - 1]));
            fTrainerPlacesCY := atof(StringListTrim(lstS[1149 - 1]));
            fTrainerShowsCY := atof(StringListTrim(lstS[1150 - 1]));
            fTrainerROICY := atof(StringListTrim(lstS[1151 - 1]));

            fTrainerStsPY := atof(StringListTrim(lstS[1152 - 1]));
            fTrainerWinsPY := atof(StringListTrim(lstS[1153 - 1]));
            fTrainerPlacesPY := atof(StringListTrim(lstS[1154 - 1]));
            fTrainerShowsPY := atof(StringListTrim(lstS[1155 - 1]));
            fTrainerROIPY := atof(StringListTrim(lstS[1156 - 1]));

            fTotalTrnStarts := fTrainerStsCY + fTrainerStsPY;
            fTotalTrnWins := fTrainerWinsCY + fTrainerWinsPY;
            if (fTotalTrnStarts > 0) then begin
               fTotalTrnWinPct := (fTotalTrnWins / fTotalTrnStarts) * 100;
            end else begin
               fTotalTrnWinPct := 0;
            end;

            fJockeyStsCY := atof(StringListTrim(lstS[1157 - 1]));
            fJockeyWinsCY := atof(StringListTrim(lstS[1158 - 1]));
            fJockeyPlacesCY := atof(StringListTrim(lstS[1159 - 1]));
            fJockeyShowsCY := atof(StringListTrim(lstS[1160 - 1]));
            fJockeyROICY := atof(StringListTrim(lstS[1161 - 1]));

            fJockeyStsPY := atof(StringListTrim(lstS[1162 - 1]));
            fJockeyWinsPY := atof(StringListTrim(lstS[1163 - 1]));
            fJockeyPlacesPY := atof(StringListTrim(lstS[1164 - 1]));
            fJockeyShowsPY := atof(StringListTrim(lstS[1165 - 1]));
            fJockeyROIPY := atof(StringListTrim(lstS[1166 - 1]));

            fTotalJkyStarts := fJockeyStsCY + fJockeyStsPY;
            fTotalJkyWins := fJockeyWinsCY + fJockeyWinsPY;
            if (fTotalJkyStarts > 0) then begin
               fTotalJkyWinPct := (fTotalJkyWins / fTotalJkyStarts) * 100;
            end else begin
               fTotalJkyWinPct := 0;
            end;


            
            fjockeyDistanceOnTurfStarts := atof(StringListTrim(lstS[1368 - 1]));
            fjockeyDistanceOnTurfWins := atof(StringListTrim(lstS[1369 - 1]));
            if (fjockeyDistanceOnTurfStarts  > 0) then begin
               fjockeyDistanceOnTurfWinPct  := (fjockeyDistanceOnTurfWins / fjockeyDistanceOnTurfStarts) * 100;
            end else begin
               fjockeyDistanceOnTurfWinPct  := 0;
            end;
            
            fTrainerStsCurrentMeet := atof(StringListTrim(lstS[29 - 1]));
            fTrainerWinsCurrentMeet := atof(StringListTrim(lstS[30 - 1]));
            fTrainerPlacesCurrentMeet := atof(StringListTrim(lstS[31 - 1]));
            fTrainerShowsCureentMeet := atof(StringListTrim(lstS[32 - 1]));
            if (fTrainerStsCurrentMeet > 0) then begin
               fTrainerWinPctCurrentMeet := (fTrainerWinsCurrentMeet / fTrainerStsCurrentMeet) * 100;
            end else begin
               fTrainerWinPctCurrentMeet := 0;
            end;

            fJockeyStsCurrentMeet := atof(StringListTrim(lstS[35 - 1]));
            fJockeyWinsCurrentMeet := atof(StringListTrim(lstS[36 - 1]));
            fJockeyPlacesCurrentMeet := atof(StringListTrim(lstS[37 - 1]));
            fJockeyShowsCurrentMeet := atof(StringListTrim(lstS[38 - 1]));
            if (fJockeyStsCurrentMeet > 0) then begin
               fJockeyWinPctCurrentMeet := (fJockeyWinsCurrentMeet / fJockeyStsCurrentMeet) * 100;
            end else begin
               fJockeyWinPctCurrentMeet := 0;
            end;

            sDirtPedigreeRating := StringListTrim(lstS[1264 - 1]);
            sMudPedigreeRating := StringListTrim(lstS[1265 - 1]);
            sTurfPedigreeRating := StringListTrim(lstS[1266 - 1]);
            sDistPedigreeRating := StringListTrim(lstS[1267 - 1]);

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

               sPP2fPaceFigure := StringListTrim(lstS[iFLD_EARLY_PACE - 1]);
               sPP4fPaceFigure := StringListTrim(lstS[iFLD_MIDDLE_PACE - 1]);
               sPPLatePaceFigure := StringListTrim(lstS[iFLD_LATE_PACE - 1]);

               sPP2fPacePos := StringListTrim(lstS[iFLD_EARLY_PACE_POS - 1]);
               sPP4fPacePos := StringListTrim(lstS[iFLD_MIDDLE_PACE_POS - 1]);
               sPPLatePacePos := StringListTrim(lstS[iFLD_LATE_PACE_POS - 1]);

               sPPFinishPos := StringListTrim(lstS[iFLD_FINISH_PACE_POS - 1]);
               sPPOfficialSpeedRating := StringListTrim(lstS[iFLD_SPD - 1]);

               sPPRaceClassRating := StringListTrim(lstS[iFLD_RACE_CLASS - 1]);
               sPPClassRating := StringListTrim(lstS[iFLD_CLASS - 1]);

               if (atof(sPPClassRating) > fBackClass) and (atoi(sPPFinishPos) < 4) then begin
                  fBackClass := atof(sPPClassRating);
               end;

               fEarlyPacePos := atof(sPP2fPacePos);
               if fEarlyPacePos > 0 then begin
                  Inc(iEarlyPacePosLines);
                  SetLength(aEarlyPacePosH, iEarlyPacePosLines);
                  aEarlyPacePosH[iEarlyPacePosLines - 1] := fEarlyPacePos;
               end;

               fMiddlePacePos := atof(sPP4fPacePos);
               if fMiddlePacePos > 0 then begin
                  Inc(iMiddlePacePosLines);
                  SetLength(aMiddlePacePosH, iMiddlePacePosLines);
                  aMiddlePacePosH[iMiddlePacePosLines - 1] := fMiddlePacePos;
               end;

               fLatePacePos := atof(sPPLatePacePos);
               if fLatePacePos > 0 then begin
                  Inc(iLatePacePosLines);
                  SetLength(aLatePacePosH, iLatePacePosLines);
                  aLatePacePosH[iLatePacePosLines - 1] := fLatePacePos;
               end;

               fFinishPacePos := atof(sPPFinishPos);
               if fFinishPacePos > 0 then begin
                  Inc(iFinishPacePosLines);
                  SetLength(aFinishPacePosH, iFinishPacePosLines);
                  aFinishPacePosH[iFinishPacePosLines - 1] := fFinishPacePos;
               end;

               //
               fEarlyPace := atof(sPP2fPaceFigure);
               if fEarlyPace > 0 then begin
                  Inc(iEarlyPaceLines);
                  SetLength(aEarlyPaceH, iEarlyPaceLines);
                  aEarlyPaceH[iEarlyPaceLines - 1] := fEarlyPace;
               end;

               fMiddlePace := atof(sPP4fPaceFigure);
               if fMiddlePace > 0 then begin
                  Inc(iMiddlePaceLines);
                  SetLength(aMiddlePaceH, iMiddlePaceLines);
                  aMiddlePaceH[iMiddlePaceLines - 1] := fMiddlePace;
               end;

               fLatePace := atof(sPPlatePaceFigure);
               if fLatePace > 0 then begin
                  Inc(iLatePaceLines);
                  SetLength(aLatePaceH, iLatePaceLines);
                  aLatePaceH[iLatePaceLines - 1] := fLatePace;
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
               fEarlyPacePosH := RoundTo(HarmonicMean(aEarlyPacePosH), -2);
               fEarlyPacePosO := RoundTo(Median(aEarlyPacePosH), -2);
            end else begin
               fEarlyPacePosH := 9999;
               fEarlyPacePosO := 9999;
            end;

            if (iMiddlePacePosLines > 0) then begin
               fMiddlePacePosH := RoundTo(HarmonicMean(aMiddlePacePosH), -2);
               fMiddlePacePosO := RoundTo(Median(aMiddlePacePosH), -2);
            end else begin
               fMiddlePacePosH := 9999;
               fMiddlePacePosO := 9999;
            end;

            if (iLatePacePosLines > 0) then begin
               fLatePacePosH := RoundTo(HarmonicMean(aLatePacePosH), -2);
               fLatePacePosO := RoundTo(Median(aLatePacePosH), -2);
            end else begin
               fLatePacePosH := 9999;
               fLatePacePosO := 9999;
            end;

            if (iFinishPacePosLines > 0) then begin
               fFinishPacePosH := RoundTo(HarmonicMean(aFinishPacePosH), -2);
            end else begin
               fFinishPacePosH := 9999;
            end;

            if (iEarlyPaceLines > 0) then begin
               fEarlyPaceH := RoundTo(HarmonicMean(aEarlyPaceH), -2);
               fEarlyPaceO := RoundTo(Median(aEarlyPaceH), -2);
            end else begin
               fEarlyPaceH := 0;
               fEarlyPaceO := 0;
            end;

            if (iMiddlePaceLines > 0) then begin
               fMiddlePaceH := RoundTo(HarmonicMean(aMiddlePaceH), -2);
               fMiddlePaceO := RoundTo(Median(aMiddlePaceH), -2);
            end else begin
               fMiddlePaceH := 0;
               fMiddlePaceO := 0;
            end;

            if (iLatePaceLines > 0) then begin
               fLatePaceH := RoundTo(HarmonicMean(aLatePaceH), -2);
               fLatePaceO := RoundTo(Median(aLatePaceH), -2);
            end else begin
               fLatePaceH := 0;
               fLatePaceO := 0;
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

                  if SmartPos('SUPERFECTA (10-CENT MIN)', sWagerTypes) > 0 then begin
                     b10CentSuperfectaRace := True;
                  end;

                  if SmartPos('10-CENT SUPER', sWagerTypes) > 0 then begin
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

                     if SmartPos('10-CENT', sWagerTypes) > 0 then begin
                        b10CentSuperfectaRace := True;
                     end;
                     if SmartPos('.10', sWagerTypes) > 0 then begin
                        b10CentSuperfectaRace := True;
                     end;
                     if SmartPos('1- CENT', sWagerTypes) > 0 then begin
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
                     tblR.FieldByName('CT').AsString := sAMPM + sm.Str(wHour - 12, 2) + ':' + sm.Str(wMin, 2);
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

                  sTmp := Trim(sPostTimes);
                  sTmp := FastReplace(sTmp, '(', '', True);
                  sTmp := FastReplace(sTmp, ')', '', True);
                  if (sTmp <> '') then begin
                     try
                        Split(sTmp, '/', lstPostTimes);
                        if (Length(StringListTrim(lstPostTimes[1])) = 4) then begin
                           wHour := atow(LeftStr(StringListTrim(lstPostTimes[1]), 2));
                           wMin := atow(RightStr(StringListTrim(lstPostTimes[1]), 2));
                        end;
                     finally
                        FreeAndNil(lstPostTimes);
                     end;
                  end;


                  //
                  //tblR.FieldByName('WagerTypes').AsString := sWagerTypes;

                  //
                  tblR.FieldByName('Is10CentSuperfectaRace').AsBoolean := b10CentSuperfectaRace;
                  tblR.FieldByName('Is50CentTrifectaRace').AsBoolean := b50CentTrifectaRace;
                  tblR.FieldByName('Is50CentPk3Race').AsBoolean := b50CentPk3Race;
                  tblR.FieldByName('Is50CentPk4Race').AsBoolean := b50CentPk4Race;
                  if (b10CentSuperfectaRace) then begin
                     tblR.FieldByName('IsSuperRace').AsBoolean := True;
                  end;

                  tblR.FieldByName('IsTSNProcessed').AsBoolean := True;
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
                  sKeyTrnCategory := Trim(StringListTrim(lstS[iFLD_TCAT - 1]));
                  if (sKeyTrnCategory <> '') then begin
                     iKeyTrnStart := atoi(StringListTrim(lstS[iFLD_TSTS - 1]));
                     fKeyTrnWinPct := atof(StringListTrim(lstS[iFLD_TWIN - 1]));
                     fKeyTrnITMPct := atof(StringListTrim(lstS[iFLD_TITM - 1]));
                     fKeyTrnROI := atof(StringListTrim(lstS[iFLD_TROI - 1]));
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
                           '31-90daysAway',
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
                           'Sprnt-Rte-Sprnt',
                           'Sprnt-Sprnt-Rte',
                           'Turf starts ',
                           'Turf to dirt',
                           'Up 2+ classes',
                           'Up one class',
                           'Wnr last race',
                           '1-5 days away',
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
                        MaidenClaiming: begin
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

               if (tblE.FieldByName('TurfIndicator').AsString = '*') or
                  (tblE.FieldByName('TurfIndicator').AsString = '**') then begin
                  tblE.FieldByName('TrnTodayStarts').AsInteger := tblE.FieldByName('TotalTrnTurfStarts').AsInteger;
                  tblE.FieldByName('TrnTodayWinPct').AsFloat := tblE.FieldByName('TotalTrnTurfWinPct').AsFloat;
               end;
               


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

               tblE.FieldByName('TotalJkyTurfStarts').AsFloat := fjockeyDistanceOnTurfStarts;
               tblE.FieldByName('TotalJkyTurfWins').AsFloat := fjockeyDistanceOnTurfWins; 
               tblE.FieldByName('TotalJkyTurfWinPct').AsFloat := fjockeyDistanceOnTurfWinPct; 
               
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
               tblE.FieldByName('Last2Speed').AsInteger := atoi(sLast2SpeedRating);
               tblE.FieldByName('Last3Speed').AsInteger := atoi(sLast3SpeedRating);

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

               tblE.FieldByName('EarlyPacePos').AsFloat := fEarlyPacePosH;
               tblE.FieldByName('MiddlePacePos').AsFloat := fMiddlePacePosH;
               tblE.FieldByName('LatePacePos').AsFloat := fLatePacePosH;
               tblE.FieldByName('FinishPacePos').AsFloat := fFinishPacePosH;

               tblE.FieldByName('EarlyPace').AsFloat := fEarlyPaceH;
               tblE.FieldByName('MiddlePace').AsFloat := fMiddlePaceH;
               tblE.FieldByName('LatePace').AsFloat := fLatePaceH;


               //
               iAge := tblE.FieldByName('Age').AsInteger;

               iSireTurfThisYearRank := tblE.FieldByName('SireTurfThisYearRank').AsInteger;
               iSireTurfLastYearRank := tblE.FieldByName('SireTurfLastYearRank').AsInteger;

               iSireGeneralThisYearRank := tblE.FieldByName('SireGeneralThisYearRank').AsInteger;
               iSireGeneralLastYearRank := tblE.FieldByName('SireGeneralLastYearRank').AsInteger;

               iSireJuvenileThisYearRank := tblE.FieldByName('SireJuvenileThisYearRank').AsInteger;
               iSireJuvenileLastYearRank := tblE.FieldByName('SireJuvenileLastYearRank').AsInteger;

               //               fClassRating := tblE.FieldByName('ClassRating').AsFloat;
               //               fTurfRating := tblE.FieldByName('TurfRating').AsFloat;
               //               fMudRating := tblE.FieldByName('MudRating').AsFloat;
               //
               //               if (iSireGeneralThisYearRank > 0) and (iSireGeneralThisYearRank < 100) then begin
               //                  fClassRating := fClassRating + 1;
               //               end;
               //
               //               if (iSireGeneralLastYearRank > 0) and (iSireGeneralLastYearRank < 100) then begin
               //                  fClassRating := fClassRating + 1;
               //               end;
               //
               //               if (iAge = 2) then begin
               //                  if (iSireJuvenileThisYearRank > 0) and (iSireJuvenileThisYearRank < 100) then begin
               //                     fClassRating := fClassRating + 1;
               //                  end;
               //               end;
               ////
               ////               if (iAge = 2) then begin
               ////                  if (iSireJuvenileLastYearRank > 0) and (iSireJuvenileLastYearRank < 100) then begin
               ////                     fClassRating := fClassRating + 1;
               ////                  end;
               ////               end;
               ////
               ////               if (iSireTurfThisYearRank > 0) and (iSireTurfThisYearRank < 100) then begin
               ////                  fTurfRating := fTurfRating + 1;
               ////               end;
               ////
               ////               if (iSireTurfLastYearRank > 0) and (iSireTurfLastYearRank < 100) then begin
               ////                  fTurfRating := fTurfRating + 1;
               ////               end;
               //
               //               tblE.FieldByName('ClassRating').AsFloat := fClassRating;
               //               tblE.FieldByName('TurfRating').AsFloat := fTurfRating;
               //               tblE.FieldByName('MudRating').AsFloat := fMudRating;

               tblE.FieldByName('OwnerSilks').AsString := sOwnerSilks;

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
      FreeAndNil(lstMCP);
   end;

end;



procedure ImportXRDFile(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   sFileName: string
   );

var
   lstXRD: TStringList;

   iRc: integer;
   iIdxXRD: integer;
   iCnt: integer;

   iPos: integer;
   iHPos: integer;
   iFPPos: integer;

   iRaceNbr: integer;
   iLineLen: integer;
   iLineType: integer;

   sFinishPos: string;
   sOfficialFinishPos: string;

   iOfficialFinishPos: integer;
   iFinishPos: integer;

   sHorseName: string;

   sOdds: string;
   sProgramNbr: string;
   sTmp: string;

   sWagerType: string;

   bRoute: boolean;


   sResults: string;

   iPPIdx: integer;
   iIdxRes: integer;
   iOddsIdx: integer;
   iHorseIdx: integer;
   iFinPosIdx: integer;
   iProgNbrIdx: integer;

   //Race History
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

   sDummyNbrs: string;
   fDummyWager: double;
   fDummyPayout: double;

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

   sTrack: string;
   sDate: string;
   sRaceNbr: string;
   sPostPos: string;

   sMM: string;
   sDD: string;
   sYY: string;

   wYear: Word;
   wMonth: Word;
   wDay: Word;

   sTrkCode: string;

   dtRaceDate: TDateTime;

   iFLD_WTYP: integer;
   iFLD_WNBR: integer;
   iFLD_WBET: integer;
   iFLD_WPAY: integer;

   iIdxWager: integer;
   iEndLoop: integer;

   iPrevRaceNbr: integer;
   bTopOwnerOddsSheetSelected: boolean;
   bTopOwnerSheetSelected: boolean;

   iPowerRank: integer;
   fOdds: double;

   sTrkCond: string;
   sSurface: string;

begin

   try
      hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
      hLog.AddToLog('Process TSN XRD - ' + sFileName, msevOperation);
      OpenTable(tblR);
      OpenTable(tblE);

      try
         lstXRD := TStringList.Create;
         lstXRD.LoadFromFile(sFileName);

         iPrevRaceNbr := 0;
         for iIdxXRD := 0 to lstXRD.Count - 1 do begin
            sTmp := lstXRD[iIdxXRD];
            sTmp := FastReplace(sTmp, '"', '', True);
            Split(sTmp, ',', lstS);

            iCnt := lstS.Count;

            sRaceNbr := StringListTrim(lstS[3 - 1]);
            if (iPrevRaceNbr <> atoi(sRaceNbr)) then begin
               sDailyDoubleNbrs := '';
               fDailyDoubleWager := 0;
               fDailyDoublePayout := 0;

               sExactaNbrs := '';
               fExactaWager := 0;
               fExactaPayout := 0;

               sTrifectaNbrs := '';
               fTrifectaWager := 0;
               fTrifectaPayout := 0;

               sSuperfectaNbrs := '';
               fSuperfectaWager := 0;
               fSuperfectaPayout := 0;

               sQuinellaNbrs := '';
               fQuinellaWager := 0;
               fQuinellaPayout := 0;

               sPick3Nbrs := '';
               fPick3Wager := 0;
               fPick3Payout := 0;

               sPick3NbrsLeg1 := '';
               sPick3NbrsLeg2 := '';
               sPick3NbrsLeg3 := '';

               sPick4Nbrs := '';
               fPick4Wager := 0;
               fPick4Payout := 0;

               sPick6Nbrs := '';
               fPick6Wager := 0;
               fPick6Payout := 0;

               sWagerNbrs := '';
               fWagerPayout := 0;
               sWagerPayout := '';

               sWinNbrs := '';
               sPlcNbrs := '';
               sShoNbrs := '';

               fWinPayout := 0;
               fWinPlcPayout := 0;
               fWinShoPayout := 0;

               fPlcPayout := 0;
               fPlcShoPayout := 0;

               fShoPayout := 0;
            end;

            //  1. TRACK                       CHARACTER     XXX          3
            sTrkCode := StringListTrim(lstS[1 - 1]);

            //   2. DATE                        CHARACTER     XXXXXXXX     8  CYMD
            sTmp := StringListTrim(lstS[2 - 1]);
            sYY := CopyStr(sTmp, 1, 4);
            sMM := CopyStr(sTmp, 5, 2);
            sDD := CopyStr(sTmp, 7, 2);

            wDay := atow(sDD);
            wMonth := atow(sMM);
            wYear := atow(sYY);
            dtRaceDate := EncodeDate(wYear, wMonth, wDay);

            //   3. RACE NUMBER                 NUMERIC       99           2
            sRaceNbr := StringListTrim(lstS[3 - 1]);

            //5
            sSurface := StringListTrim(lstS[5 - 1]);

            // 17
            sTrkCond := StringListTrim(lstS[17 - 1]);

            //  18. Horse's POST POSITION       NUMERIC       99           2
            sPostPos := StringListTrim(lstS[18 - 1]);

            //  20. Horse's NAME                CHARACTER                 25
            sHorseName := StringListTrim(lstS[20 - 1]);

            //  30. Horse's Finish Position     NUMERIC       99           2  92=DidNotFinish
            sFinishPos := StringListTrim(lstS[30 - 1]);
            iFinishPos := atoi(StringListTrim(lstS[30 - 1]));

            //  37. Horse's Odds to $1.00       NUMERIC      999.99        6
            sOdds := StringListTrim(lstS[37 - 1]);

            //  49. Horse's Official Finish Pos NUMERIC       99           2
            sOfficialFinishPos := StringListTrim(lstS[49 - 1]);
            iOfficialFinishPos := atoi(StringListTrim(lstS[49 - 1]));

            //  50. Horse's Official PROGRAM #  CHARACTER     XXX          3
            sProgramNbr := StringListTrim(lstS[50 - 1]);

            //  75. Horse's $2 Win Payoff   - if any        9999.99        7
            //  76. Horse's $2 Place Payoff - if any        9999.99        7
            //  77. Horse's $2 Show Payoff  - if any        9999.99        7
            case iOfficialFinishPos of
               1: begin
                     sWinNbrs := sProgramNbr;
                     fWinPayout := atof(StringListTrim(lstS[75 - 1]));
                     fWinPlcPayout := atof(StringListTrim(lstS[76 - 1]));
                     fWinShoPayout := atof(StringListTrim(lstS[77 - 1]));
                  end;
               2: begin
                     sPlcNbrs := sProgramNbr;
                     fPlcPayout := atof(StringListTrim(lstS[76 - 1]));
                     fPlcShoPayout := atof(StringListTrim(lstS[77 - 1]));
                  end;
               3: begin
                     sShoNbrs := sProgramNbr;
                     fShoPayout := atof(StringListTrim(lstS[77 - 1]));
                  end;
            end;

            //   4. (reserved for future use)
            //   5. SURFACE                     CHARACTER     X            1 D-dirt
            //                                                               d-inner dirt
            //                                                               T-turf
            //                                                               t-inner turf
            //   6 - 15 (reserved for future use)
            //  16. FINAL TIME                 NUMERIC        999.99       6
            //  17. TRACK CONDITION             CHARACTER     XX           2
            //  18. Horse's POST POSITION       NUMERIC       99           2
            //  19. Horse's ENTRY/COUPLING FLAG CHARACTER     X            1  e-entry/coupled
            //  20. Horse's NAME                CHARACTER                 25
            //  21- 29 (reserved for future use)
            //  30. Horse's Finish Position     NUMERIC       99           2  92=DidNotFinish
            //  31- (reserved for future use)
            //  32. WagerType10_NAME            CHARACTER                 45
            //  33. WagerType11_NAME            CHARACTER                 45
            //  34. WagerType12_NAME            CHARACTER                 45
            //  35. WagerType13_NAME            CHARACTER                 45
            //  36. WagerType14_NAME            CHARACTER                 45
            //  38- 47 (reserved for future use)
            //  48. # starters/field size       NUMERIC       99           2
            //  49. Horse's Official Finish Pos NUMERIC       99           2
            //  50. Horse's Official PROGRAM #  CHARACTER     XXX          3
            //  51- 54 (reserved for future use)
            //  55. WagerType10_WinningNums     CHARACTER                 45 (ex. "3-7")
            //  56. WagerType11_WinningNums     CHARACTER                 45 (ex. "3-7")
            //  57. WagerType12_WinningNums     CHARACTER                 45 (ex. "3-7")
            //  58. WagerType13_WinningNums     CHARACTER                 45 (ex. "3-7")
            //  59. WagerType14_WinningNums     CHARACTER                 45 (ex. "3-7")
            //  60. WagerType10_$2Payoff        NUMERIC     999999999.99  12 ("45.80" payoff)
            //  61. WagerType11_$2Payoff        NUMERIC     999999999.99  12 ("45.80" payoff)
            //  62. WagerType12_$2Payoff        NUMERIC     999999999.99  12 ("45.80" payoff)
            //  63. WagerType13_$2Payoff        NUMERIC     999999999.99  12 ("45.80" payoff)
            //  64. WagerType14_$2Payoff        NUMERIC     999999999.99  12 ("45.80" payoff)
            //  65. WagerType10_Pool            NUMERIC     999999999.99  12
            //  66. WagerType11_Pool            NUMERIC     999999999.99  12
            //  67. WagerType12_Pool            NUMERIC     999999999.99  12
            //  68. WagerType13_Pool            NUMERIC     999999999.99  12
            //  69. WagerType14_Pool            NUMERIC     999999999.99  12
            //  70. WagerType10_BetAmt          NUMERIC     99.99          5
            //  71. WagerType11_BetAmt          NUMERIC     99.99          5
            //  72. WagerType12_BetAmt          NUMERIC     99.99          5
            //  73. WagerType13_BetAmt          NUMERIC     99.99          5
            //  74. WagerType14_BetAmt          NUMERIC     99.99          5
            //  75. Horse's $2 Win Payoff   - if any        9999.99        7
            //  76. Horse's $2 Place Payoff - if any        9999.99        7
            //  77. Horse's $2 Show Payoff  - if any        9999.99        7
            //  78. WagerType1_NAME          CHARACTER                  45 (ex. "EXACTA")
            //  79. WagerType2_NAME          CHARACTER                  45
            //  80. WagerType3_NAME          CHARACTER                  45
            //  81. WagerType4_NAME          CHARACTER                  45
            //  82. WagerType5_NAME          CHARACTER                  45
            //  83. WagerType6_NAME          CHARACTER                  45
            //  84. WagerType7_NAME          CHARACTER                  45
            //  85. WagerType8_NAME          CHARACTER                  45
            //  86. WagerType9_NAME          CHARACTER                  45
            //  87. WagerType1_WinningNums   CHARACTER                  45 (ex. "3-7")
            //  88. WagerType2_WinningNums   CHARACTER                  45
            //  89. WagerType3_WinningNums   CHARACTER                  45
            //  90. WagerType4_WinningNums   CHARACTER                  45
            //  91. WagerType5_WinningNums   CHARACTER                  45
            //  92. WagerType6_WinningNums   CHARACTER                  45
            //  93. WagerType7_WinningNums   CHARACTER                  45
            //  94. WagerType8_WinningNums   CHARACTER                  45
            //  95. WagerType9_WinningNums   CHARACTER                  45
            //  96. WagerType1_$2Payoff      NUMERIC       9999999.99   10  (ex. "45.80")
            //  97. WagerType2_$2Payoff      NUMERIC       9999999.99   10
            //  98. WagerType3_$2Payoff      NUMERIC       9999999.99   10
            //  99. WagerType4_$2Payoff      NUMERIC       9999999.99   10
            // 100. WagerType5_$2Payoff      NUMERIC       9999999.99   10
            // 101. WagerType6_$2Payoff      NUMERIC       9999999.99   10
            // 102. WagerType7_$2Payoff      NUMERIC       9999999.99   10
            // 103. WagerType8_$2Payoff      NUMERIC       9999999.99   10
            // 104. WagerType9_$2Payoff      NUMERIC       9999999.99   10
            // 105. WagerType1_Pool          NUMERIC     999999999.99   12
            // 106. WagerType2_Pool          NUMERIC     999999999.99   12
            // 107. WagerType3_Pool          NUMERIC     999999999.99   12
            // 108. WagerType4_Pool          NUMERIC     999999999.99   12
            // 109. WagerType5_Pool          NUMERIC     999999999.99   12
            // 110. WagerType6_Pool          NUMERIC     999999999.99   12
            // 111. WagerType7_Pool          NUMERIC     999999999.99   12
            // 112. WagerType8_Pool          NUMERIC     999999999.99   12
            // 113. WagerType9_Pool          NUMERIC     999999999.99   12
            // 114. WagerType1_BetAmt        NUMERIC            99.99   5
            // 115. WagerType2_BetAmt        NUMERIC            99.99   5
            // 116. WagerType3_BetAmt        NUMERIC            99.99   5
            // 117. WagerType4_BetAmt        NUMERIC            99.99   5
            // 118. WagerType5_BetAmt        NUMERIC            99.99   5
            // 119. WagerType6_BetAmt        NUMERIC            99.99   5
            // 120. WagerType7_BetAmt        NUMERIC            99.99   5
            // 121. WagerType8_BetAmt        NUMERIC            99.99   5
            // 122. WagerType9_BetAmt        NUMERIC            99.99   5
            // 123-254 (reserved for future use)


            iFLD_WTYP := 78;
            iFLD_WNBR := 87;
            iFLD_WBET := 114;
            iFLD_WPAY := 96;

            iEndLoop := 9;
            for iIdxWager := 1 to iEndLoop do begin
               sWagerType := StringListTrim(lstS[iFLD_WTYP - 1]);
               case StringToCaseSelect(sWagerType,
                  ['EXACTA',
                  'QUINELLA',
                     'TRIFECTA',
                     'SUPERFECTA',
                     'DAILY DOUBLE',
                     'PICK THREE',
                     'PICK FOUR',
                     'PICK SIX',
                     'PERFECTA',
                     'EXACTOR',
                     'TRIACTOR',
                     'WIN 4',
                     'CONSOLATION DOUBLE',
                     'MATCH RIVAL',
                     'GRAND SLAM',
                     'CONSOLATION PICK THREE',
                     'PLACE PICK ALL',
                     'PICK SEVEN',
                     'TRI SUPER',
                     'WIN FOUR',
                     'BINGO BET',
                     'PICK FIVE',
                     'CHOOSE 6',
                     'PICK NINE',
                     'HEAD TO HEAD',
                     'STRAIGHT FLUSH',
                     'TWIN TRIFECTA',
                     'CLASSIX',
                     'SUPER HIGH FIVE'
                     ]) of

                  EXACTA, PERFECTA, EXACTOR: begin
                        sExactaNbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fExactaWager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fExactaPayout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  QUINELLA: begin
                        sQuinellaNbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fQuinellaWager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fQuinellaPayout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  TRIFECTA, TRIACTOR: begin
                        sTrifectaNbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fTrifectaWager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fTrifectaPayout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  SUPERFECTA: begin
                        sSuperfectaNbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fSuperfectaWager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fSuperfectaPayout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  DAILYDOUBLE: begin
                        sDailyDoubleNbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fDailyDoubleWager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fDailyDoublePayout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  PICKTHREE: begin
                        sPick3Nbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fPick3Wager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fPick3Payout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  PICKFOUR, WIN4, WINFOUR: begin
                        sPick4Nbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fPick4Wager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fPick4Payout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  PICKSIX, CHOOSESIX, CLASSIX: begin
                        sPick6Nbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fPick6Wager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fPick6Payout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;
                  CONSOLATIONDOUBLE,
                     MATCHRIVAL,
                     GRANDSLAM,
                     CONSOLATIONPICKTHREE,
                     TRISUPER,
                     BINGOBET,
                     PICKSEVEN,
                     PICKFIVE,
                     PICKNINE,
                     HEADTOHEAD,
                     STRAIGHTFLUSH,
                     PLACEPICKALL,
                     TWINTRIFECTA,
                     SUPERHIGHFIVE: begin
                        sDummyNbrs := StringListTrim(lstS[iFLD_WNBR - 1]);
                        fDummyWager := atof(StringListTrim(lstS[iFLD_WBET - 1]));
                        fDummyPayout := atof(StringListTrim(lstS[iFLD_WPAY - 1]));
                     end;

               else
                  if Trim(sWagerType) <> '' then begin
                     hLog.AddToLog(sWagerType, msevException);
                  end;
               end;

               Inc(iFLD_WTYP);
               Inc(iFLD_WNBR);
               Inc(iFLD_WBET);
               Inc(iFLD_WPAY);
            end;

            //
          //  sProgramNbr := Trim(sProgramNbr);
//            if (atoi(sProgramNbr) < 10) then begin
//               sProgramNbr := ' ' + sProgramNbr;
//            end;

            tblE.IndexName := 'ByProgramNbr';
            tblE.SetKey();
            tblE.FieldByName('RangeRaceDate').Value := dtRaceDate;
            tblE.FieldByName('TrkCode').AsString := sTrkCode;
            tblE.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr);
            tblE.FieldByName('RaceDate').Value := dtRaceDate;
            tblE.FieldByName('ProgramNbr').AsString := Trim(sProgramNbr);

            bTopOwnerSheetSelected := False;
            bTopOwnerOddsSheetSelected := False;
            if (tblE.GotoKey()) then begin
               if ((atof(sOdds) > 0) and (atoi(sOfficialFinishPos) > 0)) then begin
                  tblE.Edit();

                  tblE.FieldByName('Surface').AsString := GetTSNSurface(sSurface);
                  tblE.FieldByName('TrkCond').AsString := sTrkCond;

                  tblE.FieldByName('Odds').AsFloat := atof(sOdds);
                  tblE.FieldByName('FinishPos').AsInteger := atoi(sOfficialFinishPos);

                  //                  iPowerRank := tblE.FieldByName('PowerRank').AsInteger;
                  fOdds := tblE.FieldByName('Odds').AsFloat;
                  if (fOdds > 0) then begin
                     tblE.FieldByName('OddsWinPct').AsFloat := (1 / (fOdds + 1)) * 100;
                  end else begin
                     tblE.FieldByName('OddsWinPct').AsFloat := 0;
                  end;
                  //                  bTopOwnerSheetSelected := tblE.FieldByName('IsTopOwnerSheetSelected').AsBoolean;
                  //                  bTopOwnerOddsSheetSelected := False;

                  //                  if (bTopOwnerSheetSelected) then begin
                  //                     if (iPowerRank < 16) then begin
                  //                        if (iPowerRank = 1) then begin
                  //                           if (fOdds <= 9) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 2) then begin
                  //                           if (fOdds <= 10) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 3) then begin
                  //                           if (fOdds <= 12) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 4) then begin
                  //                           if (fOdds <= 15) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 5) then begin
                  //                           if (fOdds <= 16) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 6) then begin
                  //                           if (fOdds <= 17) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 7) then begin
                  //                           if (fOdds <= 18) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 8) then begin
                  //                           if (fOdds <= 19) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 9) then begin
                  //                           if (fOdds <= 20) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 10) then begin
                  //                           if (fOdds <= 21) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                        if (iPowerRank = 11) then begin
                  //                           if (fOdds <= 22) then begin
                  //                              bTopOwnerOddsSheetSelected := True;
                  //                           end;
                  //                        end;
                  //
                  //                     end;
                  //                  end;
                  //
                  //                  tblE.FieldByName('IsTopOwnerOddsSheetSelected').AsBoolean := bTopOwnerOddsSheetSelected;
                  tblE.Post();
                  tblE.FlushBuffers();
               end;
            end;

            if (UpperCase(tblR.TableName) = 'RACEHISTORY') then begin
               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').AsString := sTrkCode;
               tblR.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr);
               tblR.FieldByName('RaceDate').Value := dtRaceDate;
            end else begin
               tblR.IndexName := 'ByActualPrimary';
               tblR.SetKey();
               tblR.FieldByName('RangeRaceDate').Value := dtRaceDate;
               tblR.FieldByName('TrkCode').AsString := sTrkCode;
               tblR.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr);
               tblR.FieldByName('RaceDate').Value := dtRaceDate;
            end;

            if (tblR.GotoKey()) then begin
               tblR.Edit();

               if (Trim(sWinNbrs) <> '') and (atoi(sOfficialFinishPos) = 1) then begin
                  tblR.FieldByName('WinNbrs').AsString := sWinNbrs + ' ' + sHorseName;
               end;

               if (Trim(sPlcNbrs) <> '') and (atoi(sOfficialFinishPos) = 2) then begin
                  tblR.FieldByName('PlcNbrs').AsString := sPlcNbrs + ' ' + sHorseName;
               end;

               if (Trim(sShoNbrs) <> '') and (atoi(sOfficialFinishPos) = 3) then begin
                  tblR.FieldByName('ShoNbrs').AsString := sShoNbrs + ' ' + sHorseName;
               end;

               if (Trim(sExactaNbrs) <> '') then begin
                  tblR.FieldByName('ExactaNbrs').AsString := sExactaNbrs;
                  tblR.FieldByName('ExactaWager').AsFloat := fExactaWager;
                  tblR.FieldByName('ExactaPayout').AsFloat := fExactaPayout;
               end;

               if (Trim(sDailyDoubleNbrs) <> '') then begin
                  tblR.FieldByName('DailyDoubleNbrsLastRace').AsString := sDailyDoubleNbrs;
                  tblR.FieldByName('DailyDoubleWagerLastRace').AsFloat := fDailyDoubleWager;
                  tblR.FieldByName('DailyDoublePayoutLastRace').AsFloat := fDailyDoublePayout;
               end;

               if (Trim(sTrifectaNbrs) <> '') then begin
                  tblR.FieldByName('TrifectaNbrs').AsString := sTrifectaNbrs;
                  tblR.FieldByName('TrifectaWager').AsFloat := fTrifectaWager;
                  tblR.FieldByName('TrifectaPayout').AsFloat := fTrifectaPayout;
               end;

               if (Trim(sSuperfectaNbrs) <> '') then begin
                  tblR.FieldByName('SuperfectaNbrs').AsString := sSuperfectaNbrs;
                  tblR.FieldByName('SuperfectaWager').AsFloat := fSuperfectaWager;
                  tblR.FieldByName('SuperfectaPayout').AsFloat := fSuperfectaPayout;
               end;

               if (Trim(sQuinellaNbrs) <> '') then begin
                  tblR.FieldByName('QuinellaNbrs').AsString := sQuinellaNbrs;
                  tblR.FieldByName('QuinellaWager').AsFloat := fQuinellaWager;
                  tblR.FieldByName('QuinellaPayout').AsFloat := fQuinellaPayout;
               end;

               if (Trim(sPick3Nbrs) <> '') then begin
                  tblR.FieldByName('Pick3NbrsLastRace').AsString := sPick3Nbrs;
                  tblR.FieldByName('Pick3WagerLastRace').AsFloat := fPick3Wager;
                  tblR.FieldByName('Pick3PayoutLastRace').AsFloat := fPick3Payout;
               end;

               if (Trim(sPick3NbrsLeg1) <> '') then begin
                  tblR.FieldByName('Pick3NbrsLeg1').AsString := sPick3NbrsLeg1;
                  tblR.FieldByName('Pick3NbrsLeg2').AsString := sPick3NbrsLeg2;
                  tblR.FieldByName('Pick3NbrsLeg3').AsString := sPick3NbrsLeg3;
               end;

               if (Trim(sPick4Nbrs) <> '') then begin
                  tblR.FieldByName('Pick4NbrsLastRace').AsString := sPick4Nbrs;
                  tblR.FieldByName('Pick4WagerLastRace').AsFloat := fPick4Wager;
                  tblR.FieldByName('Pick4PayoutLastRace').AsFloat := fPick4Payout;
               end;

               if (Trim(sPick6Nbrs) <> '') then begin
                  tblR.FieldByName('Pick6NbrsLastRace').AsString := sPick6Nbrs;
                  tblR.FieldByName('Pick6WagerLastRace').AsFloat := fPick6Wager;
                  tblR.FieldByName('Pick6PayoutLastRace').AsFloat := fPick6Payout;
               end;

               if (fWinPayout > 0) then begin
                  tblR.FieldByName('WinPayout').AsFloat := fWinPayout;
               end;
               if (fWinPlcPayout > 0) then begin
                  tblR.FieldByName('WinPlcPayout').AsFloat := fWinPlcPayout;
               end;
               if (fWinShoPayout > 0) then begin
                  tblR.FieldByName('WinShoPayout').AsFloat := fWinShoPayout;
               end;

               if (fPlcPayout > 0) then begin
                  tblR.FieldByName('PlcPayout').AsFloat := fPlcPayout;
               end;
               if (fPlcShoPayout > 0) then begin
                  tblR.FieldByName('PlcShoPayout').AsFloat := fPlcShoPayout;
               end;

               if (fShoPayout > 0) then begin
                  tblR.FieldByName('ShoPayout').AsFloat := fShoPayout;
               end;

               //  if (bTopOwnerOddsSheetSelected) then begin
            //                  tblR.FieldByName('NbrOfOwnerOddsSelected').AsInteger := tblR.FieldByName('NbrOfOwnerOddsSelected').AsInteger + 1;
            //               end;
            //
            //               if (bTopOwnerOddsSheetSelected) then begin
            //                  tblR.FieldByName('IsTopOwnerOddsSheetSelected').AsBoolean := bTopOwnerOddsSheetSelected;
            //               end;

               tblR.FieldByName('Surface').AsString := GetTSNSurface(sSurface);
               tblR.FieldByName('TrkCond').AsString := sTrkCond;
               tblR.Post();
               tblR.FlushBuffers();
            end;

            if (UpperCase(tblR.TableName) = 'RACEHISTORY') then begin
               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').AsString := sTrkCode;
               tblR.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr);
               tblR.FieldByName('RaceDate').Value := dtRaceDate;
            end else begin
               tblR.IndexName := 'ByActualPrimary';
               tblR.SetKey();
               tblR.FieldByName('RangeRaceDate').Value := dtRaceDate;
               tblR.FieldByName('TrkCode').AsString := sTrkCode;
               tblR.FieldByName('RaceNbr').AsInteger := atoi(sRaceNbr) - 2;
               tblR.FieldByName('RaceDate').Value := dtRaceDate;
            end;

            if (tblR.GotoKey()) then begin
               tblR.Edit();

               if (Trim(sPick3Nbrs) <> '') then begin
                  tblR.FieldByName('Pick3NbrsFirstRace').AsString := sPick3Nbrs;
                  tblR.FieldByName('Pick3WagerFirstRace').AsFloat := fPick3Wager;
                  tblR.FieldByName('Pick3PayoutFirstRace').AsFloat := fPick3Payout;
               end;

               tblR.Post();
               tblR.FlushBuffers();
            end;

            iPrevRaceNbr := atoi(sRaceNbr);
         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

   finally
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
      FreeAndNil(lstS);
      FreeAndNil(lstXRD);
      CloseTable(tblR);
      CloseTable(tblE);
   end;

end;

procedure ClearRaceResults(tblR: TDBISAMTable);
begin

   try
      hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
      hLog.AddToLog('Clear Race Results - ', msevOperation);
      OpenTable(tblR);

      //Start
      try
         InitPrgBar(tblR.RecordCount);
         tblR.First();
         while not tblR.Eof do begin
            UpdateStatusBar('Clearing Results');
            IncPrgBar();
            Application.ProcessMessages();

            tblR.Edit();

            //            tblR.FieldByName('IsTopOwnerOddsSheetSelected').AsBoolean := False;
            //            tblR.FieldByName('NbrOfOwnerOddsSelected').AsInteger := 0;
            tblR.FieldByName('WinNbrs').AsString := '';
            tblR.FieldByName('PlcNbrs').AsString := '';
            tblR.FieldByName('ShoNbrs').AsString := '';
            tblR.FieldByName('ExactaNbrs').AsString := '';
            tblR.FieldByName('ExactaWager').AsFloat := 0;
            tblR.FieldByName('ExactaPayout').AsFloat := 0;
            tblR.FieldByName('DailyDoubleNbrsLastRace').AsString := '';
            tblR.FieldByName('DailyDoubleWagerLastRace').AsFloat := 0;
            tblR.FieldByName('DailyDoublePayoutLastRace').AsFloat := 0;
            tblR.FieldByName('TrifectaNbrs').AsString := '';
            tblR.FieldByName('TrifectaWager').AsFloat := 0;
            tblR.FieldByName('TrifectaPayout').AsFloat := 0;
            tblR.FieldByName('SuperfectaNbrs').AsString := '';
            tblR.FieldByName('SuperfectaWager').AsFloat := 0;
            tblR.FieldByName('SuperfectaPayout').AsFloat := 0;
            tblR.FieldByName('QuinellaNbrs').AsString := '';
            tblR.FieldByName('QuinellaWager').AsFloat := 0;
            tblR.FieldByName('QuinellaPayout').AsFloat := 0;
            tblR.FieldByName('Pick3NbrsLastRace').AsString := '';
            tblR.FieldByName('Pick3WagerLastRace').AsFloat := 0;
            tblR.FieldByName('Pick3PayoutLastRace').AsFloat := 0;
            tblR.FieldByName('Pick3NbrsLeg1').AsString := '';
            tblR.FieldByName('Pick3NbrsLeg2').AsString := '';
            tblR.FieldByName('Pick3NbrsLeg3').AsString := '';
            tblR.FieldByName('Pick4NbrsLastRace').AsString := '';
            tblR.FieldByName('Pick4WagerLastRace').AsFloat := 0;
            tblR.FieldByName('Pick4PayoutLastRace').AsFloat := 0;
            tblR.FieldByName('Pick6NbrsLastRace').AsString := '';
            tblR.FieldByName('Pick6WagerLastRace').AsFloat := 0;
            tblR.FieldByName('Pick6PayoutLastRace').AsFloat := 0;
            tblR.FieldByName('WinPayout').AsFloat := 0;
            tblR.FieldByName('WinPlcPayout').AsFloat := 0;
            tblR.FieldByName('WinShoPayout').AsFloat := 0;
            tblR.FieldByName('PlcPayout').AsFloat := 0;
            tblR.FieldByName('PlcShoPayout').AsFloat := 0;
            tblR.FieldByName('ShoPayout').AsFloat := 0;
            tblR.Post();
            tblR.FlushBuffers();
            tblR.Next();
         end;
      except
      end;
      ClearPrgStatusBars();
   finally
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
      CloseTable(tblR);
   end;
end;

procedure UpdateMultiRaceResults(tblR: TDBISAMTable);
var
   sPick3: string;
   sTrkCode: string;
   dtRaceDate: TDateTime;
   iRaceNbr: integer;


begin

   try
      hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
      hLog.AddToLog('Update Race Results - ', msevOperation);
      OpenTable(tblR);

      //Start
      try
         InitPrgBar(tblR.RecordCount);
         tblR.IndexName := 'ByActualPrimary';
         tblR.First();
         while not tblR.Eof do begin
            UpdateStatusBar('Clearing Results');
            IncPrgBar();
            Application.ProcessMessages();

            sPick3 := tblR.FieldByName('Pick3').AsString;

            sTrkCode := tblR.FieldByName('TrkCode').Value;
            dtRaceDate := tblR.FieldByName('RaceDate').Value;
            iRaceNbr := tblR.FieldByName('RaceNbr').AsInteger;

            //            tblR.IndexName := 'ByActualPrimary';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').AsString := sTrkCode;
            tblR.FieldByName('RaceDate').AsDateTime := dtRaceDate;
            tblR.FieldByName('RaceNbr').AsInteger := iRaceNbr + 2;
            if (tblR.GotoKey()) then begin
               tblR.Edit();
               tblR.FieldByName('Pick3LastRace').AsString := sPick3;
               tblR.Post();
            end;
            tblR.FlushBuffers();
            tblR.Next();
         end;
      except
      end;
      ClearPrgStatusBars();

   finally
      tblR.IndexName := '';
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
      CloseTable(tblR);
   end;
end;



end.
