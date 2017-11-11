unit UnitUpdateHDW;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure UpdateHDW(
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


procedure UpdateHDW(
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
   //   sPick3Nbrs: string;
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

   aEarlyPacePosO: array of double;
   aMiddlePacePosO: array of double;
   aLatePacePosO: array of double;
   aFinishPacePosH: array of double;

   aEarlyPacePosH: array of double;
   aMiddlePacePosH: array of double;
   aLatePacePosH: array of double;

   aClassRatingH: array of double;
   aClassRatingO: array of double;

   aRaceRatingH: array of double;
   aRaceRatingO: array of double;

   aClassRatingMax: array of double;
   aRaceRatingMax: array of double;

   fEarlyPaceH: double;
   fMiddlePaceH: double;
   fLatePaceH: double;

   fEarlyPaceO: double;
   fMiddlePaceO: double;
   fLatePaceO: double;

   fEarlyPaceMax: double;
   fMiddlePaceMax: double;
   fLatePaceMax: double;

   fClassRatingH: double;
   fRaceRatingH: double;

   fClassRatingO: double;
   fRaceRatingO: double;

   fClassRatingMax: double;
   fRaceRatingMax: double;

   aEarlyPaceH: array of double;
   aMiddlePaceH: array of double;
   aLatePaceH: array of double;

   aEarlyPaceO: array of double;
   aMiddlePaceO: array of double;
   aLatePaceO: array of double;

   aEarlyPaceMax: array of double;
   aMiddlePaceMax: array of double;
   aLatePaceMax: array of double;

   iEarlyPacePosLines: integer;
   iMiddlePacePosLines: integer;
   iLatePacePosLines: integer;
   iFinishPacePosLines: integer;

   iEarlyPaceLines: integer;
   iMiddlePaceLines: integer;
   iLatePaceLines: integer;

   iClassRatingLines: integer;
   iRaceRatingLines: integer;

   fEarlyPacePos: double;
   fMiddlePacePos: double;
   fLatePacePos: double;
   fFinishPacePos: double;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   fClassRating: double;
   fRaceRating: double;

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

   sJockeyDistanceOnTurfLabel: string;
   fJockeyDistanceOnTurfStarts: double;
   fJockeyDistanceOnTurfWins: double;
   fJockeyDistanceOnTurfWinPct: double;

   fJockeyStsPY: double;
   fJockeyWinsPY: double;
   fJockeyPlacesPY: double;
   fJockeyShowsPY: double;
   fJockeyROIPY: double;

   fTotalJky365Starts: double;
   fTotalJky365Wins: double;
   fTotalJky365WinPct: double;

   fTotalJky90Starts: double;
   fTotalJky90Wins: double;
   fTotalJky90WinPct: double;

   fTotalTrn365Starts: double;
   fTotalTrn365Wins: double;
   fTotalTrn365WinPct: double;

   fTotalTrn90Starts: double;
   fTotalTrn90Wins: double;
   fTotalTrn90WinPct: double;

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
   sDistanceYards: string;
   fDistanceInFurlongs: double;

begin


   hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
   hLog.AddToLog('Process TSN ProCaps - ' + sFileName, msevOperation);
   try
      try
         lstMCP := TStringList.Create;
         lstMCP.LoadFromFile(sFileName);

         for iIdx := 0 to lstMCP.Count - 1 do begin
            sTmp := lstMCP[iIdx];
            sTmp := FastReplace(sTmp, '"', '', True);
            //  sTmp := FastReplace(sTmp, '-', '', True);
            Split(sTmp, ',', lstS);

            iCnt := lstS.Count;

            sTrack := StringListTrim(lstS[1 - 1]);
            sTrack := FastReplace(sTrack, 'CTX', 'CT');
            sTrack := FastReplace(sTrack, 'SAX', 'SA');
            sTrack := FastReplace(sTrack, 'GPX', 'GP');
            sTrack := FastReplace(sTrack, 'APX', 'AP');
            sTrack := FastReplace(sTrack, 'FGX', 'FG');
            sTrack := FastReplace(sTrack, 'FLX', 'FL');
            sTrack := FastReplace(sTrack, 'FPX', 'FP');
            sTrack := FastReplace(sTrack, 'LAX', 'LA');
            sTrack := FastReplace(sTrack, 'LSX', 'LS');
            sTrack := FastReplace(sTrack, 'RPX', 'RP');
            sTrack := FastReplace(sTrack, 'TPX', 'TP');
            sTrack := FastReplace(sTrack, 'CDX', 'CD');
            sTrack := FastReplace(sTrack, 'GGX', 'GG');
            sTrack := FastReplace(sTrack, 'KDX', 'KD');
            sTrack := FastReplace(sTrack, 'OPX', 'OP');
            sTrack := FastReplace(sTrack, 'WOX', 'WO');
            sTrack := FastReplace(sTrack, 'SRX', 'SR');

            sDate := StringListTrim(lstS[2 - 1]);
            sRaceNbr := StringListTrim(lstS[3 - 1]);
            sPostPos := StringListTrim(lstS[4 - 1]);


            sTodaysRaceClassification := StringListTrim(lstS[11 - 1]);
            // sRaceConditions := StringListTrim(lstS[16 - 1]);
            sTodaysMutuelList := StringListTrim(lstS[20 - 1]);
            sDistanceYards := StringListTrim(lstS[6 - 1]);
            fDistanceInFurlongs := (atof(sDistanceYards) * 3) / FEET_IN_FURLONG * -1;

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
            sTSNAvgClassRating := ' '; // StringListTrim(lstS[1146 - 1]);

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

            // Last 365
            fTrainerStsCY := atof(StringListTrim(lstS[1147 - 1]));
            fTrainerWinsCY := atof(StringListTrim(lstS[1148 - 1]));
            fTrainerPlacesCY := atof(StringListTrim(lstS[1149 - 1]));
            fTrainerShowsCY := atof(StringListTrim(lstS[1150 - 1]));
            fTrainerROICY := atof(StringListTrim(lstS[1151 - 1]));

            // Last 90
            fTrainerStsPY := atof(StringListTrim(lstS[1152 - 1]));
            fTrainerWinsPY := atof(StringListTrim(lstS[1153 - 1]));
            fTrainerPlacesPY := atof(StringListTrim(lstS[1154 - 1]));
            fTrainerShowsPY := atof(StringListTrim(lstS[1155 - 1]));
            fTrainerROIPY := atof(StringListTrim(lstS[1156 - 1]));

            fTotalTrn365Starts := fTrainerStsCY; // + fTrainerStsPY;
            fTotalTrn365Wins := fTrainerWinsCY; // + fTrainerWinsPY;
            if (fTotalTrn365Starts > 0) then begin
               fTotalTrn365WinPct := (fTotalTrn365Wins / fTotalTrn365Starts) * 100;
            end else begin
               fTotalTrn365WinPct := 0;
            end;

            fTotalTrn90Starts := fTrainerStsPY; // + fTrainerStsPY;
            fTotalTrn90Wins := fTrainerWinsPY; // + fTrainerWinsPY;
            if (fTotalTrn90Starts > 0) then begin
               fTotalTrn90WinPct := (fTotalTrn90Wins / fTotalTrn90Starts) * 100;
            end else begin
               fTotalTrn90WinPct := 0;
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

            fTotalJky365Starts := fJockeyStsCY; // + fJockeyStsPY;
            fTotalJky365Wins := fJockeyWinsCY; // + fJockeyWinsPY;
            if (fTotalJky365Starts > 0) then begin
               fTotalJky365WinPct := (fTotalJky365Wins / fTotalJky365Starts) * 100;
            end else begin
               fTotalJky365WinPct := 0;
            end;

            fTotalJky90Starts := fJockeyStsPY; // + fJockeyStsPY;
            fTotalJky90Wins := fJockeyWinsPY; // + fJockeyWinsPY;
            if (fTotalJky90Starts > 0) then begin
               fTotalJky90WinPct := (fTotalJky90Wins / fTotalJky90Starts) * 100;
            end else begin
               fTotalJky90WinPct := 0;
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

            fEarlyPaceH := 0;
            fMiddlePaceH := 0;
            fLatePaceH := 0;

            fEarlyPaceO := 0;
            fMiddlePaceO := 0;
            fLatePaceO := 0;

            fEarlyPaceMax := 0;
            fMiddlePaceMax := 0;
            fLatePaceMax := 0;

            fClassRatingH := 0;
            fRaceRatingH := 0;

            fClassRatingO := 0;
            fRaceRatingO := 0;

            fClassRatingMax := 0;
            fRaceRatingMax := 0;


            iEarlyPaceLines := 0;
            iMiddlePaceLines := 0;
            iLatePaceLines := 0;

            iClassRatingLines := 0;
            iRaceRatingLines := 0;

            SetLength(aEarlyPaceH, iEarlyPaceLines);
            SetLength(aMiddlePaceH, iMiddlePaceLines);
            SetLength(aLatePaceH, iLatePaceLines);

            SetLength(aClassRatingH, iClassRatingLines);
            SetLength(aClassRatingO, iClassRatingLines);
            SetLength(aClassRatingMax, iClassRatingLines);

            iFLD_EARLY_PACE_POS := 576;
            iFLD_MIDDLE_PACE_POS := 586;
            iFLD_LATE_PACE_POS := 606;
            iFLD_FINISH_PACE_POS := 616;

            iFLD_EARLY_PACE := 766;
            iFLD_MIDDLE_PACE := 776;
            iFLD_LATE_PACE := 816;

            if (fDistanceInFurlongs >= 8.0) then begin
               iFLD_EARLY_PACE := 776;
               iFLD_MIDDLE_PACE := 786;
            end;


            iFLD_SPD := 846;

            // Cramer
            //iFLD_MIDDLE_PACE := 1234;
            //iFLD_LATE_PACE := 1244;
            //iFLD_SPD := 1268;


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

               //sPP2fPaceFigure := FastReplace(sPP2fPaceFigure, '-', '', True);
               //sPP4fPaceFigure := FastReplace(sPP4fPaceFigure, '-', '', True);
               //sPPLatePaceFigure := FastReplace(sPPLatePaceFigure, '-', '', True);

               sPP2fPacePos := StringListTrim(lstS[iFLD_EARLY_PACE_POS - 1]);
               sPP4fPacePos := StringListTrim(lstS[iFLD_MIDDLE_PACE_POS - 1]);
               sPPLatePacePos := StringListTrim(lstS[iFLD_LATE_PACE_POS - 1]);

               //     sPP2fPacePos := FastReplace(sPP2fPacePos, '-', '', True);
     //               sPP4fPacePos := FastReplace(sPP4fPacePos, '-', '', True);
     //               sPPLatePacePos := FastReplace(sPPLatePacePos, '-', '', True);

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
                  SetLength(aEarlyPaceO, iEarlyPaceLines);
                  SetLength(aEarlyPaceMax, iEarlyPaceLines);

                  aEarlyPaceH[iEarlyPaceLines - 1] := fEarlyPace;
                  aEarlyPaceO[iEarlyPaceLines - 1] := fEarlyPace;
                  aEarlyPaceMax[iEarlyPaceLines - 1] := fEarlyPace;
               end;

               fMiddlePace := atof(sPP4fPaceFigure);
               if fMiddlePace > 0 then begin
                  Inc(iMiddlePaceLines);

                  SetLength(aMiddlePaceH, iMiddlePaceLines);
                  SetLength(aMiddlePaceO, iMiddlePaceLines);
                  SetLength(aMiddlePaceMax, iMiddlePaceLines);

                  aMiddlePaceH[iMiddlePaceLines - 1] := fMiddlePace;
                  aMiddlePaceO[iMiddlePaceLines - 1] := fMiddlePace;
                  aMiddlePaceMax[iMiddlePaceLines - 1] := fMiddlePace;
               end;

               fLatePace := atof(sPPlatePaceFigure);
           //    if (fLatePace > 0) or (fLatePace < 0) then begin
              if (fLatePace > 0) then begin
                  Inc(iLatePaceLines);

                  SetLength(aLatePaceH, iLatePaceLines);
                  SetLength(aLatePaceO, iLatePaceLines);
                  SetLength(aLatePaceMax, iLatePaceLines);

                  aLatePaceH[iLatePaceLines - 1] := fLatePace + fMiddlePace;
                  aLatePaceO[iLatePaceLines - 1] := fLatePace + fMiddlePace;
                  aLatePaceMax[iLatePaceLines - 1] := fLatePace + fMiddlePace;
               end;

               fClassRating := atof(sPPClassRating);
               if fClassRating > 0 then begin
                  Inc(iClassRatingLines);

                  SetLength(aClassRatingH, iClassRatingLines);
                  SetLength(aClassRatingO, iClassRatingLines);
                  SetLength(aClassRatingMax, iClassRatingLines);

                  aClassRatingH[iClassRatingLines - 1] := fClassRating;
                  aClassRatingO[iClassRatingLines - 1] := fClassRating;
                  aClassRatingMax[iClassRatingLines - 1] := fClassRating;
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

            try
               if (iEarlyPacePosLines > 0) then begin
                  fEarlyPacePosH := RoundTo(HarmonicMean(aEarlyPacePosH), -2);
                  fEarlyPacePosO := RoundTo(Median(aEarlyPacePosH), -2);
               end else begin
                  fEarlyPacePosH := 9999;
                  fEarlyPacePosO := 9999;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               if (iMiddlePacePosLines > 0) then begin
                  fMiddlePacePosH := RoundTo(HarmonicMean(aMiddlePacePosH), -2);
                  fMiddlePacePosO := RoundTo(Median(aMiddlePacePosH), -2);
               end else begin
                  fMiddlePacePosH := 9999;
                  fMiddlePacePosO := 9999;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               if (iLatePacePosLines > 0) then begin
                  fLatePacePosH := RoundTo(HarmonicMean(aLatePacePosH), -2);
                  fLatePacePosO := RoundTo(Median(aLatePacePosH), -2);
               end else begin
                  fLatePacePosH := 9999;
                  fLatePacePosO := 9999;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               if (iFinishPacePosLines > 0) then begin
                  fFinishPacePosH := RoundTo(HarmonicMean(aFinishPacePosH), -2);
               end else begin
                  fFinishPacePosH := 9999;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               if (iEarlyPaceLines > 0) then begin
                  fEarlyPaceH := RoundTo(HarmonicMean(aEarlyPaceH), -2);
                  fEarlyPaceO := RoundTo(Median(aEarlyPaceO), -2);
                  fEarlyPaceMax := RoundTo(Largest(aEarlyPaceMax, 1), -2);
               end else begin
                  fEarlyPaceH := 0;
                  fEarlyPaceO := 0;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               if (iMiddlePaceLines > 0) then begin
                  fMiddlePaceH := RoundTo(HarmonicMean(aMiddlePaceH), -2);
                  fMiddlePaceO := RoundTo(Median(aMiddlePaceO), -2);
                  fMiddlePaceMax := RoundTo(Largest(aMiddlePaceMax, 1), -2);
               end else begin
                  fMiddlePaceH := 0;
                  fMiddlePaceO := 0;
                  fMiddlePaceMax := 0;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               if (iLatePaceLines > 0) then begin
                  fLatePaceH := RoundTo(HarmonicMean(aLatePaceH), -2);
                  //fLatePaceH := ESBHarmonicMean(aLatePaceH), -2);

                  fLatePaceO := RoundTo(Median(aLatePaceO), -2);
                  fLatePaceMax := RoundTo(Largest(aLatePaceMax, 1), -2);
               end else begin
                  fLatePaceH := 0;
                  fLatePaceO := 0;
                  fLatePaceMax := 0;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               if (iClassRatingLines > 0) then begin
                  fClassRatingH := RoundTo(HarmonicMean(aClassRatingH), -2);
                  fClassRatingO := RoundTo(Median(aClassRatingO), -2);
                  fClassRatingMax := RoundTo(Largest(aClassRatingMax, 1), -2);
               end else begin
                  fClassRatingH := 0;
                  fClassRatingO := 0;
                  fClassRatingMax := 0;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
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

                  tblE.FieldByName('TrnTodayStarts').AsFloat := fTotalTrn365Starts;
                  tblE.FieldByName('TrnTodayWins').AsFloat := fTotalTrn365Wins;
                  tblE.FieldByName('TrnTodayWinPct').AsFloat := fTotalTrn365WinPct;
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

                           if (fKeyTrnWinPct > fTotalTrn365WinPct) then begin
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
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': AQU', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': BEL', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': CTX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': DED', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': FGX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': GGX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': GPX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': HOU', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': LRL', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': MVR', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': OPX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': PEN', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': PHA', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': SAX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': SUN', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': TAM', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': TPX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': TUP', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': KEE', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': HAW', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': CDX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': SAR', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': APX', '', True);
                           sKeyTrnCategory := FastReplace(sKeyTrnCategory, ': MNR', '', True);

                           iKeyTrnCategory := StringToCaseSelect(sKeyTrnCategory, [
                              '1stLasix',
                                 '1stStart45dLayff',
                                 '2ndLasix',
                                 '2ndStart45dLayff',
                                 '3rdStart45dLayff',
                                 '3yr olds',
                                 '4yo up',
                                 '51 to 101',
                                 'Allowance',
                                 'Blinkers OFF',
                                 'Blinkers ON',
                                 'Claimed 1bk',
                                 'Claimed 2bk',
                                 'Claimed 3bk',
                                 'Claiming',
                                 'Dirt/Synth',
                                 'Dwn 20Pct Purse',
                                 'F&M',
                                 'FTS',
                                 'Favorites',
                                 'MClm',
                                 'Male Horses',
                                 'Route Debut',
                                 'Route to Sprint',
                                 'Routes',
                                 'Splwt',
                                 'Sprint to Route',
                                 'Sprints',
                                 'Track',
                                 'Turf Debut',
                                 'Up 20Pct Purse',
                                 'below 51',
                                 '2yr olds'


                              ]);

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
                              '1stLasix',
                                 '1stStart45dLayff',
                                 '2ndLasix',
                                 '2ndStart45dLayff',
                                 '3rdStart45dLayff',
                                 '3yr olds',
                                 '4yo up',
                                 '51 to 101',
                                 'Allowance',
                                 'Blinkers OFF',
                                 'Blinkers ON',
                                 'Claimed 1bk',
                                 'Claimed 2bk',
                                 'Claimed 3bk',
                                 'Claiming',
                                 'Dirt/Synth',
                                 'Dwn 20Pct Purse',
                                 'F&M',
                                 'FTS',
                                 'Favorites',
                                 'MClm',
                                 'Male Horses',
                                 'Route Debut',
                                 'Route to Sprint',
                                 'Routes',
                                 'Splwt',
                                 'Sprint to Route',
                                 'Sprints',
                                 'Track',
                                 'Turf Debut',
                                 'Up 20Pct Purse',
                                 'below 51',
                                 '2yr olds'
                                 ]) of

                              A1stLasix: begin
                                    tblE.FieldByName('TotalTrnFirstJuiceWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              A1stStart45dLayff: begin
                                    tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              A2ndLasix: begin // For reports same as 1st Juice
                                    tblE.FieldByName('TotalTrnFirstJuiceWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              A2ndStart45dLayff: begin
                                    tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              A3rdStart45dLayff: begin
                                    tblE.FieldByName('TotalTrn46To120Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn46To120WinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              A3yrolds: begin
                                    tblE.FieldByName('TotalTrn2yoStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn2yoWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              A4youp: begin
                                    tblE.FieldByName('TotalTrn2yoStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn2yoWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              A5To1to10To1: begin
                                    tblE.FieldByName('TotalTrnOddsStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnOddsWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              HAllowance: begin
                                    tblE.FieldByName('TrnAlwWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              HBlinkersOFF: begin
                                    tblE.FieldByName('TotalTrnBlinkersOffStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              BlinkersON: begin
                                    tblE.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              Claimed1bk: begin
                                    tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              Claimed2bk: begin
                                    tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              Claimed3bk: begin
                                    tblE.FieldByName('TotalTrnAftClmStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              HClaiming: begin
                                    tblE.FieldByName('TrnClmWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              Dwn20PctPurse: begin
                                    tblE.FieldByName('TotalJky10WinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              FAndM: begin
                                    tblE.FieldByName('TotalTrnWork120PlusStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnWork120PlusWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              FTS: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              Favorites: begin
                                    tblE.FieldByName('TotalTrnOddsStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnOddsWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              MClm: begin
                                    tblE.FieldByName('TrnMdnWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              MaleHorses: begin
                                    tblE.FieldByName('TotalTrnWork120PlusStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnWork120PlusWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              RouteDebut: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              RouteToSprint: begin
                                    tblE.FieldByName('TrnRteToSprStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TrnRteToSprWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('IsRteToSpr').AsBoolean := True;
                                 end;
                              HRoutes: begin
                                 end;
                              Splwt: begin
                                    tblE.FieldByName('TrnMdnWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              SprintToRoute: begin
                                    tblE.FieldByName('TrnSprToRteStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TrnSprToRteWinPct').AsFloat := fKeyTrnWinPct;
                                    tblE.FieldByName('IsSprToRte').AsBoolean := True;
                                 end;
                              HSprints: begin
                                 end;
                              Track: begin
                                    tblE.FieldByName('TotalTrn30Starts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn30WinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              TurfDebut: begin
                                    tblE.FieldByName('TotalTrnDebutStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              Up20PctPurse: begin
                                    tblE.FieldByName('TotalBrdWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                              Below5To1: begin
                                    if (tblE.FieldByName('TotalTrnOddsStarts').AsInteger = 0) then begin
                                       tblE.FieldByName('TotalTrnOddsStarts').AsInteger := iKeyTrnStart;
                                       tblE.FieldByName('TotalTrnOddsWinPct').AsFloat := fKeyTrnWinPct;
                                    end;
                                 end;
                              A2yrolds: begin
                                    tblE.FieldByName('TotalTrn2yoStarts').AsInteger := iKeyTrnStart;
                                    tblE.FieldByName('TotalTrn2yoWinPct').AsFloat := fKeyTrnWinPct;
                                 end;
                           end;


                        end;
                     end;

                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;


                  tblE.FieldByName('TotalTrn1To45Starts').AsFloat := fTotalTrn90Starts;
                  tblE.FieldByName('TotalTrn1To45Wins').AsFloat := fTotalTrn90Wins;
                  tblE.FieldByName('TotalTrn1To45WinPct').AsFloat := fTotalTrn90WinPct;

                  tblE.FieldByName('TotalJkyDaysStarts').AsFloat := fTotalJky90Starts;
                  tblE.FieldByName('TotalJkyDaysWins').AsFloat := fTotalJky90Wins;
                  tblE.FieldByName('TotalJkyDaysWinPct').AsFloat := fTotalJky90WinPct;

                  tblE.FieldByName('TotalJkyStarts').AsFloat := fTotalJky365Starts;
                  tblE.FieldByName('TotalJkyWins').AsFloat := fTotalJky365Wins;
                  tblE.FieldByName('TotalJkyWinPct').AsFloat := fTotalJky365WinPct;


                  sjockeyDistanceOnTurfLabel := StringListTrim(lstS[1367 - 1]);
                  fjockeyDistanceOnTurfStarts := atof(StringListTrim(lstS[1368 - 1]));
                  fjockeyDistanceOnTurfWins := atof(StringListTrim(lstS[1369 - 1]));
                  if (fjockeyDistanceOnTurfStarts > 0) then begin
                     fjockeyDistanceOnTurfWinPct := (fjockeyDistanceOnTurfWins / fjockeyDistanceOnTurfStarts) * 100;
                  end else begin
                     fjockeyDistanceOnTurfWinPct := 0;
                  end;

                  //Resusing old fields
                  if (sjockeyDistanceOnTurfLabel = 'Routes') then begin
                     tblE.FieldByName('TotalJky2yoStarts').AsFloat := fjockeyDistanceOnTurfStarts;
                     tblE.FieldByName('TotalJky2yoWins').AsFloat := fjockeyDistanceOnTurfWins;
                     tblE.FieldByName('TotalJky2yoWinPct').AsFloat := fjockeyDistanceOnTurfWinPct;
                  end;

                  if (sjockeyDistanceOnTurfLabel = 'Sprints') then begin
                     tblE.FieldByName('TotalJky2yoStarts').AsFloat := fjockeyDistanceOnTurfStarts;
                     tblE.FieldByName('TotalJky2yoWins').AsFloat := fjockeyDistanceOnTurfWins;
                     tblE.FieldByName('TotalJky2yoWinPct').AsFloat := fjockeyDistanceOnTurfWinPct;
                  end;

                  if (sjockeyDistanceOnTurfLabel = 'Turf') then begin
                     tblE.FieldByName('TotalJkyTurfStarts').AsFloat := fjockeyDistanceOnTurfStarts;
                     tblE.FieldByName('TotalJkyTurfWins').AsFloat := fjockeyDistanceOnTurfWins;
                     tblE.FieldByName('TotalJkyTurfWinPct').AsFloat := fjockeyDistanceOnTurfWinPct;
                  end;

                  tblE.FieldByName('TotalTrnStarts').AsFloat := fTotalTrn365Starts;
                  tblE.FieldByName('TotalTrnWins').AsFloat := fTotalTrn365Wins;
                  tblE.FieldByName('TotalTrnWinPct').AsFloat := fTotalTrn365WinPct;

                  tblE.FieldByName('TCPlusMinus').AsInteger := iTCPlusMinus;


                  tblE.FieldByName('Power').AsFloat := atof(sTSNPowerRating);
                  tblE.FieldByName('PSR').AsFloat := tblE.FieldByName('Power').AsFloat;

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

                  tblE.FieldByName('EarlyPacePos').AsFloat := fEarlyPacePosH;
                  tblE.FieldByName('MiddlePacePos').AsFloat := fMiddlePacePosH;
                  tblE.FieldByName('LatePacePos').AsFloat := fLatePacePosH;
                  tblE.FieldByName('FinishPacePos').AsFloat := fFinishPacePosH;

                  tblE.FieldByName('EarlyPace').AsFloat := fEarlyPaceH;
                  tblE.FieldByName('MiddlePace').AsFloat := fMiddlePaceH;
                  if (fLatePaceH > fLatePaceO) then begin
                     tblE.FieldByName('LatePace').AsFloat := fLatePaceH;
                  end else begin
                     tblE.FieldByName('LatePace').AsFloat := fLatePaceO;
                  end;
                  if tblE.FieldByName('LatePace').AsFloat > 199 then begin
                     tblE.FieldByName('LatePace').AsFloat := 198;
                  end;

                  tblE.FieldByName('BackClass').AsFloat := fClassRatingMax;
                  tblE.FieldByName('AvgClass').AsFloat := fClassRatingH;


                  if (tblE.FieldByName('LifeStarts').AsInteger = 2) then begin
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

                  end;



                  //
                  tblTJSummary.IndexName := '';
                  tblTJSummary.SetKey();
                  tblTJSummary.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                  tblTJSummary.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').AsString;
                  if (tblTJSummary.GotoKey()) then begin
                     tblE.FieldByName('TotalTrnJkyStarts').AsInteger := tblTJSummary.FieldByName('Starts').AsInteger;
                     tblE.FieldByName('TotalTrnJkyWinPct').AsFloat := tblTJSummary.FieldByName('WinPct').AsFloat;
                  end;

                  //
                  tblTOSummary.IndexName := '';
                  tblTOSummary.SetKey();
                  tblTOSummary.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                  tblTOSummary.FieldByName('Owner').Value := tblE.FieldByName('Owner').AsString;
                  if (tblTOSummary.GotoKey()) then begin
                     tblE.FieldByName('TotalTrnOwnStarts').AsInteger := tblTOSummary.FieldByName('Starts').AsInteger;
                     tblE.FieldByName('TotalTrnOwnWinPct').AsFloat := tblTOSummary.FieldByName('WinPct').AsFloat;
                  end;

                  tblE.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;
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




end.

