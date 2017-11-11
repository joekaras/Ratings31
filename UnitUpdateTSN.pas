unit UnitUpdateTSN;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure UpdateTSN(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTC: TDBISAMTable;
   tblATL: TDBISAMTable;
   tblTJSummary: TDBISAMTable;
   tblTOSummary: TDBISAMTable;
   sFileName: string);



implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;


procedure UpdateTSN(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTC: TDBISAMTable;
   tblATL: TDBISAMTable;
   tblTJSummary: TDBISAMTable;
   tblTOSummary: TDBISAMTable;
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


   iFLD_TCAT: integer;
   iFLD_TSTS: integer;
   iFLD_TWIN: integer;
   iFLD_TITM: integer;
   iFLD_TROI: integer;

   iIdxKeyTrn: integer;

   sKeyTrnCategory: string;
   iKeyTrnCategory: integer;
   iKeyTrnStart: integer;
   fKeyTrnWinPct: double;
   sKeyTrnWinPct: string;
   fKeyTrnITMPct: double;
   fKeyTrnROI: double;
   sKeyTrnROI: string;

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

   fJockeyDistanceOnTurfStarts: double;
   fJockeyDistanceOnTurfWins: double;
   fJockeyDistanceOnTurfWinPct: double;

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

   iEndPos: integer;
   sAMPM: string;


   fValueROI: double;
   fValueROICnt: double;

   iATLIdx: integer;

   bInclude: boolean;

   iTCPlusMinus: integer;
   sPacificTime: string;


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
            sTmp := FastReplace(sTmp, '-', '', True);
            Split(sTmp, ',', lstS);

            iCnt := lstS.Count;

            sTrack := StringListTrim(lstS[1 - 1]);

            sDate := StringListTrim(lstS[2 - 1]);
            sRaceNbr := StringListTrim(lstS[3 - 1]);
            sPostPos := StringListTrim(lstS[4 - 1]);
            if (sTrack = 'CD') then begin
               if (atoi(sRaceNbr) = 2) then begin
                  sPostPos := StringListTrim(lstS[4 - 1]);
               end;
            end;

            sTodaysRaceClassification := StringListTrim(lstS[11 - 1]);
            //sRaceConditions := StringListTrim(lstS[16 - 1]);
            sTodaysMutuelList := StringListTrim(lstS[20 - 1]);

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

            //   sBackClass := StringListTrim(lstS[1267 - 1]);
   //            sAvgBris :=
   //            sBackSpeed :=
   //            sPacificPostTime :=
   //            sBackClass := StringListTrim(lstS[1267 - 1]);
   //            sAvgBris :=
   //            sBackSpeed :=
   //            sPacificPostTime :=

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


            iEndLoop := 10;
            for iIdxPP := 1 to iEndLoop do begin

               sPP2fPaceFigure := StringListTrim(lstS[iFLD_EARLY_PACE - 1]);
               sPP4fPaceFigure := StringListTrim(lstS[iFLD_MIDDLE_PACE - 1]);
               sPPLatePaceFigure := StringListTrim(lstS[iFLD_LATE_PACE - 1]);

               sPP2fPaceFigure := FastReplace(sPP2fPaceFigure, '-', '', True);
               sPP4fPaceFigure := FastReplace(sPP4fPaceFigure, '-', '', True);
               sPPLatePaceFigure := FastReplace(sPPLatePaceFigure, '-', '', True);

               sPP2fPacePos := StringListTrim(lstS[iFLD_EARLY_PACE_POS - 1]);
               sPP4fPacePos := StringListTrim(lstS[iFLD_MIDDLE_PACE_POS - 1]);
               sPPLatePacePos := StringListTrim(lstS[iFLD_LATE_PACE_POS - 1]);

               sPP2fPacePos := FastReplace(sPP2fPacePos, '-', '', True);
               sPP4fPacePos := FastReplace(sPP4fPacePos, '-', '', True);
               sPPLatePacePos := FastReplace(sPPLatePacePos, '-', '', True);

               sPPFinishPos := StringListTrim(lstS[iFLD_FINISH_PACE_POS - 1]);
               sPPOfficialSpeedRating := StringListTrim(lstS[iFLD_SPD - 1]);

               sPPRaceClassRating := StringListTrim(lstS[iFLD_RACE_CLASS - 1]);
               sPPClassRating := StringListTrim(lstS[iFLD_CLASS - 1]);


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

                  //if (Trim(sWagerTypes) = '') then begin
                  //   sWagerTypes := tblR.FieldByName('WagerType').AsString;
                 // end;

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
                  //tblR.FieldByName('WagerTypes').AsString := sWagerTypes;

                  //
                  tblR.FieldByName('Is10CentSuperfectaRace').AsBoolean := b10CentSuperfectaRace;
                  tblR.FieldByName('Is50CentTrifectaRace').AsBoolean := b50CentTrifectaRace;
                  tblR.FieldByName('Is50CentPk3Race').AsBoolean := b50CentPk3Race;
                  tblR.FieldByName('Is50CentPk4Race').AsBoolean := b50CentPk4Race;
                  if (b10CentSuperfectaRace) then begin
                     tblR.FieldByName('IsSuperRace').AsBoolean := True;
                  end;

                  sTmp := Trim(sPostTimes);
                  sTmp := FastReplace(sTmp, '(', '', True);
                  sTmp := FastReplace(sTmp, ')', '', True);

                  sPacificTime := tblR.FieldByName('PacificTime').AsString;

                  try
                     if (sTmp <> '') then begin
                        Split(sTmp, '/', lstPostTimes);
                        if (lstPostTimes.Count > 2) then begin
                           if (Length(StringListTrim(lstPostTimes[1])) >= 4) then begin
                              wMin := atow(RightStr(StringListTrim(lstPostTimes[1]), 2));
                              iEndPos := SmartPos(':', StringListTrim(lstPostTimes[1]));
                              wHour := atow(CopyStr(StringListTrim(lstPostTimes[1]), 1, iEndPos - 1));
                              if (wHour > 0) then begin
                                 if (wHour <= 10) then begin
                                    wHour := wHour + 12;
                                 end;
                              end;

                              if (wHour > 0) then begin
                                 if (wHour <= 11) then begin
                                    if ((sTrack = 'EVD') or (sTrack = 'FP')) then begin
                                       wHour := wHour + 12;
                                    end;
                                 end;
                              end;

                              if (sTrack = 'IND') then begin
                                 wHour := wHour - 1;
                              end;

                              // wHour := atow(CopyStr(SPacificTime, 1, 2));
 //
 //                              wHour := wHour + 2;
 //                              wMin := atow(CopyStr(SPacificTime, 3, 2));
 //                              wSec := 0;
 //                              wMSec := 0;
 //
 //                              tblR.FieldByName('EstTimeOfRace').AsDateTime := EncodeTime(wHour, wMin, wSec, wMSec);

                           end;
                        end;
                     end;



                     DecodeTime(tblR.FieldByName('EstTimeOfRace').AsDateTime, wHour, wMin, wSec, wMSec);

                     if (wHour > 0) then begin
                        if (wHour <= 9) then begin
                           wHour := wHour + 24;
                           sAMPM := sm.Str(wHour, 2) + ':';
                        end else begin
                           sAMPM := sm.Str(wHour, 2) + ':';
                        end;
                     end;

                     if (wHour > 12) then begin
                        tblR.FieldByName('CT').AsString := sAMPM + sm.Str(wHour - 12, 2) + ':' + sm.Str(wMin, 2);
                     end else begin
                        tblR.FieldByName('CT').AsString := sAMPM + sm.Str(wHour, 2) + ':' + sm.Str(wMin, 2);
                     end;
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;

                  sTmp := Trim(sPostTimes);
                  sTmp := FastReplace(sTmp, '(', '', True);
                  sTmp := FastReplace(sTmp, ')', '', True);
                  if (sTmp <> '') then begin
                     try
                        Split(sTmp, '/', lstPostTimes);

                        if (lstPostTimes.Count > 2) then begin
                           tblR.FieldByName('ET').AsString := sAMPM + StringListTrim(lstPostTimes[0]);

                           if (Length(StringListTrim(lstPostTimes[1])) = 4) then begin
                              tblR.FieldByName('CT').AsString := sAMPM + '0' + StringListTrim(lstPostTimes[1]);
                           end else begin
                              tblR.FieldByName('CT').AsString := sAMPM + StringListTrim(lstPostTimes[1]);
                           end;

                           tblR.FieldByName('MT').AsString := sAMPM + StringListTrim(lstPostTimes[2]);
                           tblR.FieldByName('PT').AsString := sAMPM + StringListTrim(lstPostTimes[3]);
                        end;
                     except
                     end;





                     if (sTrack = 'CD') then begin
                        if (atoi(sRaceNbr) = 2) then begin
                           if (sPacificTime <> '') then begin
                              if (Length(sPacificTime) = 1) then begin
                                 tblR.FieldByName('EstTimeOfRace').AsDateTime := EncodeTime(12, 16, 0, 0);
                              end;
                           end;
                        end;
                     end;


                     if (sPacificTime <> '') then begin
                        if (Length(sPacificTime) = 4) then begin
                           wHour := atow(CopyStr(SPacificTime, 1, 2));

                           wHour := wHour + 2;
                           wMin := atow(CopyStr(SPacificTime, 3, 2));
                           wSec := 0;
                           wMSec := 0;
                           try
                              tblR.FieldByName('EstTimeOfRace').AsDateTime := EncodeTime(wHour, wMin, wSec, wMSec);
                           except
                           end;
                        end;
                     end;

                     tblR.Post();
                     tblR.FlushBuffers();
                  end;

                  tblE.Edit();

                  tblE.FieldByName('TrnTodayStarts').AsFloat := fTotalTrnStarts;
                  tblE.FieldByName('TrnTodayWins').AsFloat := fTotalTrnWins;
                  tblE.FieldByName('TrnTodayWinPct').AsFloat := fTotalTrnWinPct;
                  tblE.FieldByName('ValueDesc').AsString := ' ';

                  try

                     iFLD_TCAT := 1337;
                     iFLD_TSTS := 1338;
                     iFLD_TWIN := 1339;
                     iFLD_TITM := 1340;
                     iFLD_TROI := 1341;

                     fValueROI := 0;
                     fValueROICnt := 0;

                     iEndLoop := 6;
                     iATLIdx := 0;
                     iTCPlusMinus := 0;

                     for iIdxKeyTrn := 1 to iEndLoop do begin
                        sKeyTrnCategory := Trim(StringListTrim(lstS[iFLD_TCAT - 1]));
                        sKeyTrnwinPct := Trim(StringListTrim(lstS[iFLD_TWIN - 1]));
                        iKeyTrnStart := atoi(StringListTrim(lstS[iFLD_TSTS - 1]));
                        fKeyTrnWinPct := atof(StringListTrim(lstS[iFLD_TWIN - 1]));
                        fKeyTrnITMPct := atof(StringListTrim(lstS[iFLD_TITM - 1]));
                        fKeyTrnROI := atof(StringListTrim(lstS[iFLD_TROI - 1]));
                        sKeyTrnROI := Trim(StringListTrim(lstS[iFLD_TROI - 1]));

                        if (sKeyTrnCategory <> '') then begin

                           if (fKeyTrnROI > 0) then begin
                              fValueROI := fValueROI + fKeyTrnROI;
                              fValueROICnt := fValueROICnt + 1;

                           end;

                           if (fKeyTrnWinPct > fTotalTrnWinPct) then begin
                              Inc(iTCPlusMinus);
                              //end else begin
                              //   Dec(iTCplusMinus);
                           end;

                           tblTC.IndexName := '';
                           tblTC.SetKey();
                           tblTC.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                           tblTC.FieldByName('Category').AsString := sKeyTrnCategory;
                           if not (tblTC.GotoKey()) then begin
                              tblTC.Append();
                              tblTC.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                              tblTC.FieldByName('Category').AsString := sKeyTrnCategory;
                              tblTC.FieldByName('Starts').AsInteger := iKeyTrnStart;
                              tblTC.FieldByName('WinPct').AsFloat := fKeyTrnWinPct;
                              tblTC.FieldByName('ITMPct').AsFloat := fKeyTrnITMPct;
                              tblTC.FieldByName('ROI').AsFloat := fKeyTrnROI;
                              tblTC.Post();
                           end else begin
                              tblTC.Edit();
                              tblTC.FieldByName('Starts').AsInteger := iKeyTrnStart;
                              tblTC.FieldByName('WinPct').AsFloat := fKeyTrnWinPct;
                              tblTC.FieldByName('ITMPct').AsFloat := fKeyTrnITMPct;
                              tblTC.FieldByName('ROI').AsFloat := fKeyTrnROI;
                              tblTC.Post();
                           end;
                        end;


                        iFLD_TCAT := iFLD_TCAT + 5;
                        iFLD_TSTS := iFLD_TSTS + 5;
                        iFLD_TWIN := iFLD_TWIN + 5;
                        iFLD_TITM := iFLD_TITM + 5;
                        iFLD_TROI := iFLD_TROI + 5;
                        if (sKeyTrnCategory <> '') then begin

                           iKeyTrnCategory := StringToCaseSelect(sKeyTrnCategory, [
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
                                 'Graded stakes',
                                 'Dirt to AW',
                                 'All Weather',
                                 '2nd off layoff',
                                 '46-90daysAway',
                                 'Clm repeater',
                                 'Turf to AW',
                                 'Sprints',
                                 '3rd off layoff',
                                 '1st Time Clmg',
                                 'AW to Turf',
                                 'Drops off claim',
                                 'Mdn to MdnClm',
                                 '1st Time MdnClm',
                                 'Dirt starts',
                                 '2YO',
                                 'AW to Dirt',
                                 'Debut Turf',
                                 'MdnClm to Mdn',
                                 '1st time lasix',
                                 '2nd time Lasix',
                                 'Drops off win',
                                 'Alarming drop',
                                 'Debut >= 1m',
                                 'Routes'

                              ]);
                           //ROI
                           //if (iKeyTrnCategory <> Allowance) and
      //                        (iKeyTrnCategory <> Claiming) and
      //                        (iKeyTrnCategory <> MaidenClaiming) and
      //                        (iKeyTrnCategory <> MaidenSpWt) and
      //                        (iKeyTrnCategory <> MdnWinLR) and
      //                        (iKeyTrnCategory <> Shipper) and
      //                        (iKeyTrnCategory <> TurfStarts) and
      //                        (iKeyTrnCategory <> WnrLastRace) and
      //                        (iKeyTrnCategory <> OneFiveDaysAway) and
      //                        (iKeyTrnCategory <> NoClassChg) and
      //                        (iKeyTrnCategory <> NonGradedStk) and
      //                        (iKeyTrnCategory <> GradedStakes) then begin
                              //                        -
                              //-
                              //-
                              //-
                              //-
                              //-
                              //Trainer angles appear on this report if the trainer has a return-on-investment of more than $2 and:
                              //3 starts and a winning percent of 100% or
                              //4-6 starts and a winning percent of at least 50% or
                              //7-15 starts and a winning percent of at least 40% or
                              //16-30 starts and a winning percent of at least 30% or
                              //31 or more starts and a winning percent of at least 25%
                              //ROI means Return on Investment. In this report as in all other DRF dat

                           tblATL.IndexName := '';
                           tblATL.SetKey();
                           tblATL.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                           tblATL.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                           tblATL.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
                           tblATL.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
                           tblATL.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                           tblATL.FieldByName('ListType').AsString := 'R';
                           if not (tblATL.GotoKey()) then begin
                              tblATL.Append();
                              tblATL.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                              tblATL.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                              tblATL.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
                              tblATL.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
                              tblATL.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;
                              tblATL.FieldByName('DistanceDesc').AsString := tblR.FieldByName('DistanceDesc').AsString;
                              tblATL.FieldByName('RaceType').AsString := tblE.FieldByName('RaceType').AsString;

                              tblATL.FieldByName('Horse').AsString := tblE.FieldByName('HorseName').AsString;
                              tblATL.FieldByName('Sire').AsString := tblE.FieldByName('Sire').AsString;
                              tblATL.FieldByName('DamSire').AsString := tblE.FieldByName('DamSire').AsString;
                              tblATL.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                              tblATL.FieldByName('Jockey').AsString := tblE.FieldByName('Jockey').AsString;
                              tblATL.FieldByName('Owner').AsString := tblE.FieldByName('Owner').AsString;
                              tblATL.FieldByName('MorningLineDesc').AsString := tblE.FieldByName('MorningLineDesc').AsString;
                              tblATL.FieldByName('ProgramNbr').AsString := tblE.FieldByName('ProgramNbr').AsString;
                              if (fKeyTrnROI > 0) then begin
                                 tblATL.FieldByName('ROI').AsFloat := fKeyTrnROI;
                              end else begin
                                 tblATL.FieldByName('ROI').AsFloat := 0;
                              end;
                              tblATL.FieldByName('ListType').AsString := 'R';
                              tblATL.Post();
                           end;

                           if (fKeyTrnROI > -1000.00) then begin
                              bInclude := True;

                              if (fKeyTrnWinPct = 100.00) and (iKeyTrnStart = 3) then begin
                                 bInclude := True;
                              end;

                              if (fKeyTrnWinPct >= 50.00) and ((iKeyTrnStart >= 4) and (iKeyTrnStart <= 6)) then begin
                                 bInclude := True;
                              end;

                              if (fKeyTrnWinPct >= 40.00) and ((iKeyTrnStart >= 7) and (iKeyTrnStart <= 15)) then begin
                                 bInclude := True;
                              end;

                              if (fKeyTrnWinPct >= 30.00) and ((iKeyTrnStart >= 16) and (iKeyTrnStart <= 30)) then begin
                                 bInclude := True;
                              end;

                              if (fKeyTrnWinPct >= 30.00) and ((iKeyTrnStart >= 30) and (iKeyTrnStart <= 999)) then begin
                                 bInclude := True;

                              end;

                              if (bInclude) then begin
                                 tblATL.IndexName := '';
                                 tblATL.SetKey();

                                 tblATL.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                                 tblATL.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                                 tblATL.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
                                 tblATL.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
                                 tblATL.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                                 tblATL.FieldByName('ListType').AsString := 'R';

                                 if not (tblATL.GotoKey()) then begin
                                    tblATL.Append();
                                    tblATL.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                                    tblATL.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                                    tblATL.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
                                    tblATL.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
                                    tblATL.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;
                                    tblATL.FieldByName('DistanceDesc').AsString := tblR.FieldByName('DistanceDesc').AsString;
                                    tblATL.FieldByName('RaceType').AsString := tblE.FieldByName('RaceType').AsString;

                                    tblATL.FieldByName('Horse').AsString := tblE.FieldByName('HorseName').AsString;
                                    tblATL.FieldByName('Sire').AsString := tblE.FieldByName('Sire').AsString;
                                    tblATL.FieldByName('DamSire').AsString := tblE.FieldByName('DamSire').AsString;
                                    tblATL.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                                    tblATL.FieldByName('Jockey').AsString := tblE.FieldByName('Jockey').AsString;
                                    tblATL.FieldByName('Owner').AsString := tblE.FieldByName('Owner').AsString;
                                    tblATL.FieldByName('MorningLineDesc').AsString := tblE.FieldByName('MorningLineDesc').AsString;
                                    tblATL.FieldByName('ProgramNbr').AsString := tblE.FieldByName('ProgramNbr').AsString;
                                    tblATL.FieldByName('Category').AsString := sKeyTrnCategory;

                                    tblATL.FieldByName('Starts').AsInteger := iKeyTrnStart;
                                    tblATL.FieldByName('WinPct').AsFloat := fKeyTrnWinPct;
                                    tblATL.FieldByName('ITMPct').AsFloat := fKeyTrnITMPct;
                                    if (fKeyTrnROI > 0) then begin
                                       tblATL.FieldByName('ROI').AsFloat := fKeyTrnROI;
                                    end else begin
                                       tblATL.FieldByName('ROI').AsFloat := 0;
                                    end;
                                    tblATL.FieldByName('ListType').AsString := 'R';
                                    tblATL.Post();
                                 end else begin
                                    tblATL.Edit();
                                    case (iATLIdx) of
                                       0: begin
                                             tblATL.FieldByName('Category').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct').AsFloat := fKeyTrnITMPct;
                                             //if (fKeyTrnROI > 0) then begin
                                             tblATL.FieldByName('ROI').AsFloat := fKeyTrnROI;
                                             //end else begin
                                             //   tblATL.FieldByName('ROI').AsFloat := 0;
                                             //end;
                                             Inc(iATLIdx)
                                          end;
                                       1: begin
                                             tblATL.FieldByName('Category2').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts2').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct2').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct2').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI2').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       2: begin
                                             tblATL.FieldByName('Category3').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts3').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct3').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct3').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI3').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       3: begin
                                             tblATL.FieldByName('Category4').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts4').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct4').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct4').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI4').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       4: begin
                                             tblATL.FieldByName('Category5').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts5').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct5').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct5').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI5').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       5: begin
                                             tblATL.FieldByName('Category6').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts6').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct6').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct6').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI6').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                    end;
                                    tblATL.Post();
                                 end;
                              end;
                           end;
                           // end;

                            //HIgh Win Pct
                           if (fKeyTrnWinPct >= 30.00) then begin
                              bInclude := False;

                              if (fKeyTrnWinPct = 100.00) and (iKeyTrnStart = 3) then begin
                                 bInclude := True;
                              end;

                              if not (bInclude) then begin
                                 if (fKeyTrnWinPct >= 50.00) and ((iKeyTrnStart >= 4) and (iKeyTrnStart <= 6)) then begin
                                    bInclude := True;
                                 end;
                              end;

                              if not (bInclude) then begin
                                 if (fKeyTrnWinPct >= 40.00) and ((iKeyTrnStart >= 7) and (iKeyTrnStart <= 15)) then begin
                                    bInclude := True;
                                 end;
                              end;

                              if not (bInclude) then begin
                                 if (iKeyTrnStart >= 30) then begin
                                    bInclude := True;
                                 end;
                              end;

                              if (bInclude) then begin
                                 tblATL.IndexName := '';
                                 tblATL.SetKey();

                                 tblATL.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                                 tblATL.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                                 tblATL.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
                                 tblATL.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
                                 tblATL.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                                 tblATL.FieldByName('ListType').AsString := 'W';

                                 if not (tblATL.GotoKey()) then begin
                                    tblATL.Append();
                                    tblATL.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                                    tblATL.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                                    tblATL.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
                                    tblATL.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
                                    tblATL.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;
                                    tblATL.FieldByName('DistanceDesc').AsString := tblR.FieldByName('DistanceDesc').AsString;
                                    tblATL.FieldByName('RaceType').AsString := tblE.FieldByName('RaceType').AsString;

                                    tblATL.FieldByName('Horse').AsString := tblE.FieldByName('HorseName').AsString;
                                    tblATL.FieldByName('Sire').AsString := tblE.FieldByName('Sire').AsString;
                                    tblATL.FieldByName('DamSire').AsString := tblE.FieldByName('DamSire').AsString;
                                    tblATL.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                                    tblATL.FieldByName('Jockey').AsString := tblE.FieldByName('Jockey').AsString;
                                    tblATL.FieldByName('Owner').AsString := tblE.FieldByName('Owner').AsString;
                                    tblATL.FieldByName('MorningLineDesc').AsString := tblE.FieldByName('MorningLineDesc').AsString;
                                    tblATL.FieldByName('ProgramNbr').AsString := tblE.FieldByName('ProgramNbr').AsString;
                                    tblATL.FieldByName('Category').AsString := sKeyTrnCategory;

                                    tblATL.FieldByName('Starts').AsInteger := iKeyTrnStart;
                                    tblATL.FieldByName('WinPct').AsFloat := fKeyTrnWinPct;
                                    tblATL.FieldByName('ITMPct').AsFloat := fKeyTrnITMPct;
                                    tblATL.FieldByName('ROI').AsFloat := fKeyTrnROI;
                                    tblATL.FieldByName('ListType').AsString := 'W';
                                    tblATL.Post();
                                 end else begin
                                    tblATL.Edit();
                                    case (iATLIdx) of
                                       1: begin
                                             tblATL.FieldByName('Category2').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts2').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct2').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct2').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI2').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       2: begin
                                             tblATL.FieldByName('Category3').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts3').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct3').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct3').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI3').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       3: begin
                                             tblATL.FieldByName('Category4').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts4').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct4').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct4').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI4').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       4: begin
                                             tblATL.FieldByName('Category5').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts5').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct5').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct5').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI5').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                       5: begin
                                             tblATL.FieldByName('Category6').AsString := sKeyTrnCategory;
                                             tblATL.FieldByName('Starts6').AsInteger := iKeyTrnStart;
                                             tblATL.FieldByName('WinPct6').AsFloat := fKeyTrnWinPct;
                                             tblATL.FieldByName('ITMPct6').AsFloat := fKeyTrnITMPct;
                                             tblATL.FieldByName('ROI6').AsFloat := fKeyTrnROI;
                                             Inc(iATLIdx)
                                          end;
                                    end;
                                    tblATL.Post();
                                 end;
                              end;
                           end;
                           //
                           //
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
                                 'Graded stakes',
                                 'Dirt to AW',
                                 'All Weather',
                                 '2nd off layoff',
                                 '46-90daysAway',
                                 'Clm repeater',
                                 'Turf to AW',
                                 'Sprints',
                                 '3rd off layoff',
                                 '1st Time Clmg',
                                 'AW to Turf',
                                 'Drops off claim',
                                 'Mdn to MdnClm',
                                 '1st Time MdnClm',
                                 'Dirt starts',
                                 '2YO',
                                 'AW to Dirt',
                                 'Debut Turf',
                                 'MdnClm to Mdn',
                                 '1st time lasix',
                                 '2nd time Lasix',
                                 'Drops off win',
                                 'Alarming drop',
                                 'Debut >= 1m',
                                 'Routes'

                              ]) of

                              FirstAfterClm: begin
                                    tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              FirstAtRoute: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              FirstOnGrass: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              FirstStrtWTrn: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              FirstTimeStr: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              FirstTimeBlinkers: begin
                                    tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SecondAfterClm: begin
                                    tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SecondCareerRace: begin
                                    tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SecondGrassRace: begin
                                    tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SecondRteRace: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SecondStrtWTrn: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              ThirtyOneToNinetyDaysAway: begin
                                    tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              NinetyPlusDaysAway: begin
                                    //tblE.FieldByName('TotalTrn120PlusStarts').AsInteger := iKeyTrnStart;
                                    //tblE.FieldByName('TotalTrn120PlusWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Allowance: begin
                                    tblE.FieldByName('TrnAlwWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';

                                 end;

                              BlinkersOff: begin
                                    tblE.FieldByName('TotalTrnBlinkersOffStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              BlnkrBackOn: begin
                                    tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')'; ;
                                 end;

                              BtnFavorite: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Claiming: begin
                                    tblE.FieldByName('TrnClmWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';

                                 end;

                              DebutMdnClm: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              DebutMdnSpwt: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              DirtToTurf: begin
                                    tblE.FieldByName('TrnDirtToTurfStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TrnDirtToTurfWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('IsDirtToTurf').AsBoolean := True;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Down2PlusClasses: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              DownOneClass: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              MaidenClaiming: begin
                                    tblE.FieldByName('TrnMdnWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              MaidenSpWt: begin
                                    tblE.FieldByName('TrnMdnWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              MdnWinLR: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              NoClassChg: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              RteToSprint: begin
                                    tblE.FieldByName('TrnRteToSprStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TrnRteToSprWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('IsRteToSpr').AsBoolean := True;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Shipper: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SprintToRte: begin
                                    tblE.FieldByName('TrnSprToRteStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TrnSprToRteWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('IsSprToRte').AsBoolean := True;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SprntRteSprnt: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SprntSprntRte: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              TurfStarts: begin
                                    tblE.FieldByName('TotalTrnTurfStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnTurfWinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              TurfToDirt: begin
                                    tblE.FieldByName('TrnTurfToDirtStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TrnTurfToDirtWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('IsTurfToDirt').AsBoolean := True;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Up2PlusClasses: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              UpOneClass: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              WnrLastRace: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              OneFiveDaysAway: begin
                                    //tblE.FieldByName('TotalTrn1To45Starts').AsInteger := iKeyTrnStart;
                                    //tblE.FieldByName('TotalTrn1To45WinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;
                              NonGradedStk: begin
                                    tblE.FieldByName('TrnStkWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              ShipperToUS: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              GradedStakes: begin
                                    tblE.FieldByName('TrnStkWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              DirttoAW: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              AllWeather: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Secondofflayoff: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Layoff4690daysAway: begin
                                    tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;

                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Clmrepeater: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              TurftoAW: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Sprints: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Thirdofflayoff: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              FirstTimeClmg: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              AWtoTurf: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Dropsoffclaim: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              MdntoMdnClm: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              FirstTimeMdnClm: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;



                              Dirtstarts: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              TwoYearOld: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              AWtoDirt: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              DebutTurf: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              MdnClmtoMdn: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Firsttimelasix: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              SecondtimeLasix: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Dropsoffwin: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              Alarmingdrop: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              DebutGt1m: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;


                              Routes: begin
                                    tblE.FieldByName('AngleDesc').AsString :=
                                       tblE.FieldByName('AngleDesc').AsString + '(' + sKeyTrnCategory + ':' + sKeyTrnwinPct + '/' + sKeyTrnROI + ')';
                                 end;

                              //else
                              //   hLog.AddToLog(sKeyTrnCategory, msevException);
                           end;


                        end;
                     end;

                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;

                  //   if (fValueROICnt > 0) then begin
      //                  tblE.FieldByName('ValueROI').AsFloat := fValueROI / fValueROICnt;
      //                  tblE.FieldByName('ValueROICnt').AsFloat := fValueROICnt;
      //               end;

                //  tblE.FieldByName('TotalTrn30Starts').AsFloat := fTrainerStsCurrentMeet;
//                  tblE.FieldByName('TotalTrn30Wins').AsFloat := fTrainerWinsCurrentMeet;
//                  tblE.FieldByName('TotalTrn30WinPct').AsFloat := fTrainerWinPctCurrentMeet;
//
//                  tblE.FieldByName('TotalJky30Starts').AsFloat := fJockeyStsCurrentMeet;
//                  tblE.FieldByName('TotalJky30Wins').AsFloat := fJockeyWinsCurrentMeet;
//                  tblE.FieldByName('TotalJky30WinPct').AsFloat := fJockeyWinPctCurrentMeet;
//
//                  tblE.FieldByName('TotalJkyStarts').AsFloat := fTotalJkyStarts;
//                  tblE.FieldByName('TotalJkyWins').AsFloat := fTotalJkyWins;
//                  tblE.FieldByName('TotalJkyWinPct').AsFloat := fTotalJkyWinPct;
//
//                  tblE.FieldByName('TotalJkyDaysStarts').AsFloat := fTotalJkyStarts;
//                  tblE.FieldByName('TotalJkyDaysWins').AsFloat := fTotalJkyWins;
//                  tblE.FieldByName('TotalJkyDaysWinPct').AsFloat := fTotalJkyWinPct;
//
//                  fjockeyDistanceOnTurfStarts := atof(StringListTrim(lstS[1368 - 1]));
//                  fjockeyDistanceOnTurfWins := atof(StringListTrim(lstS[1369 - 1]));
//                  if (fjockeyDistanceOnTurfStarts > 0) then begin
//                     fjockeyDistanceOnTurfWinPct := (fjockeyDistanceOnTurfWins / fjockeyDistanceOnTurfStarts) * 100;
//                  end else begin
//                     fjockeyDistanceOnTurfWinPct := 0;
//                  end;
//                  tblE.FieldByName('TotalJkyTurfStarts').AsFloat := fjockeyDistanceOnTurfStarts;
//                  tblE.FieldByName('TotalJkyTurfWins').AsFloat := fjockeyDistanceOnTurfWins;
//                  tblE.FieldByName('TotalJkyTurfWinPct').AsFloat := fjockeyDistanceOnTurfWinPct;
//
//                  tblE.FieldByName('TotalJkyOddsStarts').AsFloat := fTotalJkyStarts;
//                  tblE.FieldByName('TotalJkyOddsWins').AsFloat := fTotalJkyWins;
//                  tblE.FieldByName('TotalJkyOddsWinPct').AsFloat := fTotalJkyWinPct;
//
//
//                  tblE.FieldByName('TotalTrnStarts').AsFloat := fTotalTrnStarts;
//                  tblE.FieldByName('TotalTrnWins').AsFloat := fTotalTrnWins;
//                  tblE.FieldByName('TotalTrnWinPct').AsFloat := fTotalTrnWinPct;
//
//                  tblE.FieldByName('TotalTrnOddsStarts').AsFloat := fTotalTrnStarts;
//                  tblE.FieldByName('TotalTrnOddsWins').AsFloat := fTotalTrnWins;
//                  tblE.FieldByName('TotalTrnOddsWinPct').AsFloat := fTotalTrnWinPct;
//
//                  tblE.FieldByName('TCPlusMinus').AsInteger := iTCPlusMinus;

                    tblE.FieldByName('PSR').AsFloat := tblE.FieldByName('Power').AsFloat;
                    tblE.FieldByName('Power').AsFloat := atof(sTSNPowerRating);

                //  tblE.FieldByName('LastSpeed').AsInteger := atoi(sLastSpeedRating);

                 //// tblE.FieldByName('BackSpeed').AsInteger := 0;
//                  if (tblR.FieldByName('Surface').AsString = 'T') then begin
//                     tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeedTurf);
//                  end;
//
//                  if (tblR.FieldByName('Surface').AsString <> 'T') then begin
//                     if atoi(sBestTSNSpeedMostRecentYr) > atoi(sBestTSNSpeed2ndMostRecentYr) then begin
//                        tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeedMostRecentYr);
//                     end else begin
//                        tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeed2ndMostRecentYr);
//                     end;
//                  end;
                  // tblE.FieldByName('BackSpeed').AsInteger := 0;
            //                  if (tblR.FieldByName('Surface').AsString = 'T') then begin
            //                     tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeedTurf);
            //                  end;
            //
            //                  if (tblR.FieldByName('Surface').AsString <> 'T') then begin
            //                     if atoi(sBestTSNSpeedMostRecentYr) > atoi(sBestTSNSpeed2ndMostRecentYr) then begin
            //                        tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeedMostRecentYr);
            //                     end else begin
            //                        tblE.FieldByName('BackSpeed').AsInteger := atoi(sBestTSNSpeed2ndMostRecentYr);
            //                     end;
            //                  end;

                  tblE.FieldByName('QSP1stCall').AsInteger := atoi(sEarlySpeedPoints);
                  tblE.FieldByName('QSP1stCallRunStyle').AsString := sTSNRunStyle;

                  tblE.FieldByName('QSP2ndCall').AsInteger := atoi(sEarlySpeedPoints);
                  tblE.FieldByName('QSP2ndCallRunStyle').AsString := sTSNRunStyle;

               //   tblE.FieldByName('EarlyPacePos').AsFloat := fEarlyPacePosH;
                //  tblE.FieldByName('MiddlePacePos').AsFloat := fMiddlePacePosH;
                  tblE.FieldByName('LatePacePos').AsFloat := fLatePacePosH;
                  //tblE.FieldByName('FinishPacePos').AsFloat := fFinishPacePosH;

               //   tblE.FieldByName('EarlyPace').AsFloat := fEarlyPaceH;
              //    tblE.FieldByName('MiddlePace').AsFloat := fMiddlePaceH;
                  tblE.FieldByName('LatePace').AsFloat := fLatePaceH * 2;


             //     if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
//                     tblE.FieldByName('MiddlePace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat;
//                     tblE.FieldByName('MiddlePacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat;
//                  end;
//
//
//                  if (tblE.FieldByName('IsFirstTimeJuice').AsBoolean = True) then begin
//                     tblE.FieldByName('EarlyPace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat + 1;
//                     tblE.FieldByName('MiddlePace').AsFloat := tblE.FieldByName('MiddlePace').AsFloat + 1;
//                     //tblE.FieldByName('LatePace').AsFloat := tblE.FieldByName('LatePace').AsFloat;
//
//                     tblE.FieldByName('EarlyPacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat - 0.9;
//                     tblE.FieldByName('MiddlePacePos').AsFloat := tblE.FieldByName('MiddlePacePos').AsFloat - 0.9;
//                     //tblE.FieldByName('LatePacePos').AsFloat := tblE.FieldByName('LatePacePos').AsFloat;
//                 end;
//
//                  if (tblE.FieldByName('IsBlinkersOn').AsBoolean = True) then begin
//                     tblE.FieldByName('EarlyPace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat + 2;
//                     tblE.FieldByName('MiddlePace').AsFloat := tblE.FieldByName('MiddlePace').AsFloat + 2;
//                     //tblE.FieldByName('LatePace').AsFloat := tblE.FieldByName('LatePace').AsFloat;
//
//                     tblE.FieldByName('EarlyPacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat - 0.9;
//                     tblE.FieldByName('MiddlePacePos').AsFloat := tblE.FieldByName('MiddlePacePos').AsFloat - 0.9;
//                     //tblE.FieldByName('LatePacePos').AsFloat := tblE.FieldByName('LatePacePos').AsFloat;
//                  end;
//
//                  if (tblE.FieldByName('IsBlinkersOff').AsBoolean = True) then begin
//                     tblE.FieldByName('EarlyPace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat - 1;
//                     tblE.FieldByName('MiddlePace').AsFloat := tblE.FieldByName('MiddlePace').AsFloat - 1;
//                     tblE.FieldByName('LatePace').AsFloat := tblE.FieldByName('LatePace').AsFloat + 1;
//
//                     tblE.FieldByName('EarlyPacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat - 0.9;
//                     tblE.FieldByName('MiddlePacePos').AsFloat := tblE.FieldByName('MiddlePacePos').AsFloat - 0.9;
//                     tblE.FieldByName('LatePacePos').AsFloat := tblE.FieldByName('LatePacePos').AsFloat -0.9;
//                  end;
//
//                  if (tblE.FieldByName('LifeStarts').AsInteger = 1) then begin
//                     tblE.FieldByName('EarlyPace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat + 3;
//                     tblE.FieldByName('MiddlePace').AsFloat := tblE.FieldByName('MiddlePace').AsFloat + 3;
//                     tblE.FieldByName('LatePace').AsFloat := tblE.FieldByName('LatePace').AsFloat + 2;
//
//                     tblE.FieldByName('EarlyPacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat - 0.9;
//                     tblE.FieldByName('MiddlePacePos').AsFloat := tblE.FieldByName('MiddlePacePos').AsFloat - 0.9;
//                     tblE.FieldByName('LatePacePos').AsFloat := tblE.FieldByName('LatePacePos').AsFloat -0.9;
//                  end;
//
//                  if (tblE.FieldByName('LifeStarts').AsInteger = 2) then begin
//                     //tblE.FieldByName('EarlyPace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat + 3;
//                     //tblE.FieldByName('MiddlePace').AsFloat := tblE.FieldByName('MiddlePace').AsFloat + 3;
//                     tblE.FieldByName('LatePace').AsFloat := tblE.FieldByName('LatePace').AsFloat + 1;
//
//                     //tblE.FieldByName('EarlyPacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat - 0.9;
//                     //tblE.FieldByName('MiddlePacePos').AsFloat := tblE.FieldByName('MiddlePacePos').AsFloat - 0.9;
//                     tblE.FieldByName('LatePacePos').AsFloat := tblE.FieldByName('LatePacePos').AsFloat -0.9;
//                  end;
                  

                  if (tblR.FieldByName('Surface').AsString <> 'T') then begin
                     tblTC.IndexName := '';
                     tblTC.SetKey();
                     tblTC.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                     tblTC.FieldByName('Category').AsString := '2nd career race';

                     if (tblTC.GotoKey()) then begin
                        tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger := tblTC.FieldByName('Starts').AsInteger;
                        tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                        tblE.FieldByName('TrnTodayStarts').AsInteger := tblTC.FieldByName('Starts').AsInteger;
                        tblE.FieldByName('TrnTodayWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                     end;
                  end else begin
                     tblTC.IndexName := '';
                     tblTC.SetKey();
                     tblTC.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                     tblTC.FieldByName('Category').AsString := '2nd grass race';

                     if (tblTC.GotoKey()) then begin
                        tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger := tblTC.FieldByName('Starts').AsInteger;
                        tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                        tblE.FieldByName('TrnTodayStarts').AsInteger := tblTC.FieldByName('Starts').AsInteger;
                        tblE.FieldByName('TrnTodayWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                     end;
                  end;



               //   if (tblE.FieldByName('DaysLast').AsInteger > 90) then begin
//                     tblTC.IndexName := '';
//                     tblTC.SetKey();
//                     tblTC.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
//                     tblTC.FieldByName('Category').AsString := '90+ days away';
//                     if (tblTC.GotoKey()) then begin
//                        tblE.FieldByName('TotalTrn46To120Starts').AsInteger := tblTC.FieldByName('Starts').AsInteger;
//                        tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
//                        tblE.FieldByName('TrnTodayStarts').AsInteger := tblTC.FieldByName('Starts').AsInteger;
//                        tblE.FieldByName('TrnTodayWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
//                     end;
//                  end;

               //   //
//                  tblTJSummary.IndexName := '';
//                  tblTJSummary.SetKey();
//                  tblTJSummary.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
//                  tblTJSummary.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').AsString;
//                  if (tblTJSummary.GotoKey()) then begin
//                     tblE.FieldByName('TotalTrnJkyStarts').AsInteger := tblTJSummary.FieldByName('Starts').AsInteger;
//                     tblE.FieldByName('TotalTrnJkyWinPct').AsFloat := tblTJSummary.FieldByName('WinPct').AsFloat;
//                  end;
//
//                  //
//                  tblTOSummary.IndexName := '';
//                  tblTOSummary.SetKey();
//                  tblTOSummary.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
//                  tblTOSummary.FieldByName('Owner').Value := tblE.FieldByName('Owner').AsString;
//                  if (tblTOSummary.GotoKey()) then begin
//                     tblE.FieldByName('TotalTrnOwnStarts').AsInteger := tblTOSummary.FieldByName('Starts').AsInteger;
//                     tblE.FieldByName('TotalTrnOwnWinPct').AsFloat := tblTOSummary.FieldByName('WinPct').AsFloat;
//                  end;



                  //if (tblE.FieldByName('TotalTrnJkyStarts').AsFloat > 4) then begin
//                     tblE.FieldByName('TrainerJockeyRating').AsFloat := tblE.FieldByName('TotalTrnJkyWinPct').AsFloat;
//                  end else begin
//                     tblE.FieldByName('TrainerJockeyRating').AsFloat := 0;
//                  end;


//

                  //tblE.FieldByName('TrainerRating').AsFloat := tblE.FieldByName('TrnTodayWinPct').AsFloat;

                  //tblE.FieldByName('TrainerJockeyRating').AsFloat := tblE.FieldByName('TJ365WinPct').AsInteger;

                  //tblE.FieldByName('JockeyRating').AsFloat := tblE.FieldByName('TotalJkyWinPct').AsFloat;

                  //tblE.FieldByName('OwnerRating').AsFloat := tblE.FieldByName('TotalOwnWinPct').AsFloat;

                //  tblE.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;
                  tblE.Post();
                  tblE.FlushBuffers();
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


//
//procedure UpdateTrnCategory
//   (
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   tblTC: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: Integer
//   );
//begin
//
////                           '1st after clm',
//                           '1st time str',
//                           '1stTimeBlinkers',
//                           '2nd career race',
//                           '31-90daysAway',
//                           '90+ days away',
//                           'Blinkers off',
//                           'Blnkr back on',
//                           'Btn favorite',
//                           'Dirt to turf',
//                           'Down 2+ classes',
//                           'Down one class',
//                           'Maiden Clming',
//                           'Maiden Sp Wt',
//                           'Rte to Sprint',
//                           'Shipper',
//                           'Sprint to Rte',
//                           'Sprnt-Rte-Sprnt',
//                           'Sprnt-Sprnt-Rte',
//                           'Turf starts ',
//                           'Turf to dirt',
//                           '1-5 days away',
//
//                              tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;
//
//                              tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
//
//                              tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fKeyTrnWinPct;
//
//                              tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        ThirtyOneToNinetyDaysAway: begin
//                              tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;
//
//                        NinetyPlusDaysAway: begin
//                              tblE.FieldByName('TotalTrn120PlusStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrn120PlusWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        BlinkersOff: begin
//                              tblE.FieldByName('TotalTrnBlinkersOffStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        BlnkrBackOn: begin
//                              tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        DirtToTurf: begin
//                              tblE.FieldByName('TrnDirtToTurfStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TrnDirtToTurfWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        RteToSprint: begin
//                              tblE.FieldByName('TrnRteToSprStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TrnRteToSprWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        SprintToRte: begin
//                              tblE.FieldByName('TrnSprToRteStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TrnSprToRteWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        TurfStarts: begin
//                              tblE.FieldByName('TotalTrnTurfStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrnTurfWinPct').AsFloat := fKeyTrnWinPct;
//
//                        TurfToDirt: begin
//                              tblE.FieldByName('TrnTurfToDirtStarts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TrnTurfToDirtWinPct').AsFloat := fKeyTrnWinPct;
//
//
//                        OneFiveDaysAway: begin
//                              tblE.FieldByName('TotalTrn1To45Starts').AsInteger := iKeyTrnStart;
//                              tblE.FieldByName('TotalTrn1To45WinPct').AsFloat := fKeyTrnWinPct;
//
//
//   hLog.AddToLog('UpdateTrainer', msevOperation);
//   try
//      OpenTable(tblR);
//      OpenTable(tblE);
//
//      tblE.Filtered := False;
//      tblE.First();
//      while not tblE.Eof do begin
//         SetRaceEntriesKey(dm.tblRaces, dm.tblEntries);
//         UpdateEntriesProgressStatusBar(dm.tblEntries, 'Top Figures - ');
//
//         if tblR.GotoKey() then begin
//            tblR.Edit();
////            if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
////               tblR.FieldByName('TopLastSpeed').AsInteger := tblE.FieldByName('LastSpeed').AsInteger;
////            end;
////            if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
////               tblR.FieldByName('TopBackSpeed').AsInteger := tblE.FieldByName('BackSpeed').AsInteger;
////            end;
//            tblR.Post();
//         end;
//
//         tblE.Next();
//      end;
//   except
//      CloseTable(tblR);
//      CloseTable(tblE);
//      ClearPrgStatusBars();
//   end;
//
//   ClearPrgStatusBars();
//   CloseTable(tblR);
//   CloseTable(tblE);
//
//end;
//


end.

