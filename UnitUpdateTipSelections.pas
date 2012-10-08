unit UnitUpdateTipSelections;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateTipSheetSelections(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bLast30Days: boolean
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure UpdateTipSheetSelections
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bLast30Days: boolean
   );

var

   iNbrPaceCnt: integer;
   iTotalSpdCls: integer;



   bUES: boolean;
   bTRD1: boolean;
   bTRD2: boolean;
   bTR2Y: boolean;
   bTRT: boolean;


   bWagerSheetSelected: boolean;
   bLinerSheetSelected: boolean;

   bBlinkersOn: boolean;
   bBlinkersOff: boolean;

   bFirstTimeJuice: boolean;

   bSuperTrainer: boolean;
   bSuperOwner: boolean;
   bSuperJockey: boolean;
   bFrontDoubleLiner: boolean;
   bBackDoubleLiner: boolean;
   bTripleDot: boolean;
   bFrontDoubleDot: boolean;
   bBackDoubleDot: boolean;
   bTripleLiner: boolean;

   bEarlyDot: boolean;
   bMiddleDot: boolean;
   bLateDot: boolean;

   bEarlyLiner: boolean;
   bMiddleLiner: boolean;
   bLateLiner: boolean;

   bDollar: boolean;
   bDoubleDollar: boolean;

   sValueIndicator: string;
   sDollarIndicator: string;

   bFrontDoubleLiner0: boolean;
   bFrontDoubleLiner1: boolean;
   bFrontDoubleLiner2: boolean;
   bFrontDoubleLiner3: boolean;

   bBackDoubleLiner0: boolean;
   bBackDoubleLiner1: boolean;
   bBackDoubleLiner2: boolean;
   bBackDoubleLiner3: boolean;

   bTripleLiner0: boolean;
   bTripleLiner1: boolean;
   bTripleLiner2: boolean;
   bTripleLiner3: boolean;

   iLinerStartsByTrkAll: integer;
   iLinerWinsByTrkAll: integer;
   fLinerWinPctByTrkAll: double;
   fLinerValueBetByTrkAll: double;

   iLinerStartsByTrk0To3: integer;
   iLinerWinsByTrk0To3: integer;
   fLinerWinPctByTrk0To3: double;
   fLinerValueBetByTrk0To3: double;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   sWager: string;
   sOwner: string;
   sTrainer: string;
   sJockey: string;

   fWagerAmt: double;
   fPlcWagerAmt: double;
   fShoWagerAmt: double;

   iBreedingWagerAmt: integer;

   iPostPos: integer;

   bIsLayoffAndUp: boolean;
   bIsClaimedAndUp: boolean;
   bIsClaimedAndDown: boolean;

   sTurfIndicator: string;
   sDebutIndicator: string;
   sRouteIndicator: string;

   sSurface: string;
   sRaceType: string;
   sRaceShape: string;

   bTurfToDirt: boolean;
   bDirtToTurf: boolean;
   bRteToSpr: boolean;
   bSprToRte: boolean;


   fTotalTrnWinPct: double;
   fTotalJkyWinPct: double;
   fTotalOwnWinPct: double;

   fTrnSprToRteWinPct: double;
   fTrnRteToSprWinPct: double;

   fTrnDirtToTurfWinPct: double;
   iTrnTurfToDirtStarts: integer;

   fTrnTurfToDirtWinPct: double;
   iTrnDirtToTurfStarts: integer;

   iTrnSprToRteStarts: integer;
   iTrnRteToSprStarts: integer;

   iTotalTrnDebutStarts: integer;
   iTotalTrnDebutTwoStarts: integer;

   fTotalTrnDebutWinPct: double;
   fTotalTrnDebutTwoWinPct: double;

   iTotalTrn1To45Starts: integer;
   fTotalTrn1To45WinPct: double;

   iTotalTrn46To120Starts: integer;
   fTotalTrn46To120WinPct: double;

   iTotalTrn120PlusStarts: integer;
   fTotalTrn120PlusWinPct: double;

   iTotalTrnWork1To45Starts: integer;
   fTotalTrnWork1To45WinPct: double;

   iTotalTrnWork46To120Starts: integer;
   fTotalTrnWork46To120WinPct: double;

   iTotalTrnWork120PlusStarts: integer;
   fTotalTrnWork120PlusWinPct: double;

   //   fTrnDaysWinPct: double;

   fTotalTrnAftClmWinPct: double;
   fTotalTrnTurfWinPct: double;

   iTotalTrnAftClmStarts: integer;
   iTotalTrnTurfStarts: integer;

   iTotalTrnStarts: integer;
   iTotalJkyStarts: integer;
   iTotalTrnOddsStarts: integer;
   iTotalJkyOddsStarts: integer;
   iTotalOwnStarts: integer;

   iDaysLast: integer;

   iAngleChoice: integer;
   iTipChoice: integer;

   sTrnEquibaseKey: string;
   sJkyEquibaseKey: string;

   sAngleDesc: string;
   iLastPostPos: integer;

   sEquip: string;

   fTodaysClass: double;

   iPointsRank: integer;

   iFinalWinPctRank: integer;
   fFinalValueBet: double;
   fTodaysWagerValueBet: double;

   fFinalWinPct: double;


   fDistanceInFurlongs: double;

   iStaCnt: integer;
   iTotalCnt: integer;

   iTrnWinsRank: integer;
   iTrnEarningsRank: integer;
   iTrnTrackRank: integer;

   iJkyWinsRank: integer;
   iJkyEarningsRank: integer;
   iJkyTrackRank: integer;

   iOwnWinsRank: integer;
   iOwnEarningsRank: integer;

   iAge: integer;

   fTotalTrn2YoWinPct: double;

   dtLocalTimeOfRace: TDateTime;
   dtEstTimeOfRace: TDateTime;
   dtEstTimeOfFirstRace: TDateTime;

   fTimeDiff: double;

   iMorningLineTo1Rank: integer;
   fMorningLineOddsTo1: double;

   fMorningLineTo1FairProbability: double;
   fMorningLineTo1Fair: double;


   fTodaysWagerLineTo1: double;
   fTodaysWagerLineTo1Fair: double;
   fTodaysWagerLineTo1Probability: double;
   fTodaysWagerLineTo1FairProbability: double;

   fNbrStarters: double;
   fNbrDebutStarters: double;
   fNbrDebutTwoStarters: double;
   fNbrTurfDebutStarters: double;
   fNbrRouteDebutStarters: double;
   fPctOfDebutStarters: double;
   fPctOfTurfDebutStarters: double;

   fTodaysWagerME: double;
   fTodaysWagerKellyPct: double;
   fTodaysWagerExpectedProfitLossPct: double;

   iSireTurfLastYearRank: integer;
   iSireTurfLastYearPctOfEarnings: integer;
   iSireGeneralLastYearRank: integer;
   iSireJuvenileLastYearRank: integer;

   iSireTurfThisYearRank: integer;
   iSireTurfThisYearPctOfEarnings: integer;
   iSireGeneralThisYearRank: integer;
   iSireJuvenileThisYearRank: integer;

   //   iStartsWorks21: integer;
   //   iNbrWorksLast: integer;

   iQSP1stCall: integer;
   iQSP1stCallRank: integer;
   iKSP1stCall: integer;
   iKSP1stCallRank: integer;
   sQSP1stCallRunStyle: string;

   iQSP2ndCall: integer;
   iQSP2ndCallRank: integer;
   iKSP2ndCall: integer;
   iKSP2ndCallRank: integer;
   sQSP2ndCallRunStyle: string;

   b1stClm: boolean;
   b1stMCL: boolean;
   bShipIn: boolean;

   bXS: boolean;


   iNbrOfITMFinishes: integer;

   bTDT: boolean;
   bDTD: boolean;
   bRSR: boolean;
   bSRS: boolean;

   b1stOffLayoff: boolean;
   b2ndOffLayoff: boolean;
   b3rdOffLayoff: boolean;

   b2yoBred: boolean;
   b1stBred: boolean;
   bTurfBred: boolean;

   bQSP: boolean;
   bKSP: boolean;

   bQSP2: boolean;
   bKSP2: boolean;

   bUp: boolean;
   bDown: boolean;

   bTRK: boolean;

   bTRF: boolean;
   bMUD: boolean;

   bSPR: boolean;
   bRTE: boolean;


   sLastFavoriteIndicator: string;
   iLastFinishPos: integer;
   iLast2FinishPos: integer;
   iLast3FinishPos: integer;

   iLastSRWinnerRank: integer;
   iLastSRWinner: integer;

   iLastClassRank: integer;
   iBackClassRank: integer;

   iLastSpeedRank: integer;
   iBackSpeedRank: integer;

   iPowerRank: integer;

   fLastClass: double;
   fLast2Class: double;
   fLast3Class: double;

   fBackClass: double;

   iLastSpeed: integer;
   iLast2Speed: integer;
   iLast3Speed: integer;

   iBackSpeed: integer;

   iTopLastSpeed: integer;
   iTopBackSpeed: integer;
   fTopLastClass: double;
   fTopBackClass: double;
   iTopLastSRWinner: integer;

   fLifeStarts: double;
   fLifeWins: double;
   fLifePlcs: double;
   fLifeShos: double;

   fTrkStarts: double;
   fTrkWins: double;
   fTrkPlcs: double;
   fTrkShos: double;

   fTurfStarts: double;
   fTurfWins: double;
   fTurfPlcs: double;
   fTurfShos: double;

   fMudStarts: double;
   fMudWins: double;
   fMudPlcs: double;
   fMudShos: double;

   fRouteStarts: double;
   fRouteWins: double;
   fRoutePlcs: double;
   fRouteShos: double;

   fSprintStarts: double;
   fSprintWins: double;
   fSprintPlcs: double;
   fSprintShos: double;


   fLastOdds: double;
   fLast2Odds: double;
   fLast3Odds: double;

   fLastDistance: double;
   fLast2Distance: double;
   fLast3Distance: double;

   bIsRoute: boolean;
   bIsSprint: boolean;

   bLastIsRoute: boolean;
   bLast2IsRoute: boolean;
   bLast3IsRoute: boolean;

   bLastIsSprint: boolean;
   bLast2IsSprint: boolean;
   bLast3IsSprint: boolean;

   fLastDaysLast: double;
   fLast2DaysLast: double;
   fLast3DaysLast: double;

   fLastDaysSinceLastRace: double;
   fLast2DaysSinceLastRace: double;
   fLast3DaysSinceLastRace: double;


   sLastSurf: string;
   sLast2Surf: string;
   sLast3Surf: string;

   iLastPos1stCall: integer;
   iLastPos2ndCall: integer;
   iLastPosStrCall: integer;
   iLastPosFinCall: integer;

   iLast2Pos1stCall: integer;
   iLast2Pos2ndCall: integer;
   iLast2PosStrCall: integer;
   iLast2PosFinCall: integer;

   iLast3Pos1stCall: integer;
   iLast3Pos2ndCall: integer;
   iLast3PosStrCall: integer;
   iLast3PosFinCall: integer;

   fLastBL1stCall: double;
   fLastBL2ndCall: double;
   fLastBLStrCall: double;
   fLastBLFinCall: double;

   fLast2BL1stCall: double;
   fLast2BL2ndCall: double;
   fLast2BLStrCall: double;
   fLast2BLFinCall: double;

   fLast3BL1stCall: double;
   fLast3BL2ndCall: double;
   fLast3BLStrCall: double;
   fLast3BLFinCall: double;



   sTrkCode: string;

   sLastTrkCode: string;
   sLast2TrkCode: string;
   sLast3TrkCode: string;

begin

   hLog.AddToLog('UpdateTipSheetSelections', msevOperation);

   try
      try
         OpenTable(tblR);
         OpenTable(tblE);
         OpenTable(tblTrk);

         if (bLast30Days) then begin
            tblE.IndexName := 'ByRangeRaceDate';

            tblE.SetRangeStart;
            tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - 1);
            //         tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - PREV_WEEK_DAYS);
            tblE.KeyFieldCount := 1;

            tblE.SetRangeEnd;
            tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            tblE.KeyFieldCount := 1;

            tblE.ApplyRange;

            tblR.IndexName := 'ByRangeRaceDate';

            tblR.SetRangeStart;
            tblR.FieldByName('RangeRaceDate').AsDateTime := (Now() - 1);
            //         tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - PREV_WEEK_DAYS);
            tblR.KeyFieldCount := 1;

            tblR.SetRangeEnd;
            tblR.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            tblR.KeyFieldCount := 1;

            tblR.ApplyRange;
         end;


         //Start
         try
            InitPrgBar(tblR.RecordCount);
            tblR.First();
            if not dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.StartTransaction;
            end;

            UpdateStatusBar('Clearing Race Selections ');
            while not tblR.Eof do begin
               IncPrgBar();
               Application.ProcessMessages();
               if (bLast30Days) then begin
                  if tblE.FieldByName('RaceDate').AsDateTime < (Now() - PREV_WEEK_DAYS) then begin
                     tblE.Next();
                     continue;
                  end;
               end;
               tblR.Edit();
               //               tblR.FieldByName('IsOverlaySheetSelected').AsBoolean := False;
               tblR.FieldByName('IsWagerSheetSelected').AsBoolean := False;
               //               tblR.FieldByName('IsLinerSheetSelected').AsBoolean := False;
               tblR.Post();
               tblR.Next();
            end;

         except
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.Rollback;
            end;
            ClearPrgStatusBars();
         end;

         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.Commit;
         end;

         tblE.Filtered := False;
         InitPrgBar(tblE.RecordCount);

         tblE.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;

         UpdateStatusBar('Tip Report Selections ');
         while not tblE.Eof do begin
            IncPrgBar();
            Application.ProcessMessages();

            if (bLast30Days) then begin
               if tblE.FieldByName('RaceDate').AsDateTime < (Now() - PREV_WEEK_DAYS) then begin
                  tblE.Next();
                  continue;
               end;
            end;

            if (iStaCnt > BATCH_SIZE) then begin
               UpdateStatusBar('Tip Report Selections ');
               Application.ProcessMessages();
               iStaCnt := 0;
               if not dm.dbSireRate.InTransaction then begin
                  dm.dbSireRate.StartTransaction();
               end else begin
                  if dm.dbSireRate.InTransaction then begin
                     dm.dbSireRate.Commit;
                     dm.dbSireRate.StartTransaction();
                  end;
               end;
            end else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;


            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin

               tblR.Edit();

               //Put these here again so we can plug those values to history files also
               tblE.Edit();

               tblTrk.IndexName := '';
               tblTrk.SetKey();
               tblTrk.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').AsString;
               if tblTrk.GotoKey() then begin

                  fTimeDiff := dm.tblTrack.FieldByName('TimeDiff').AsFloat;

                  if (DayOfTheWeek(gedtOverrideDate) = DayMonday) then begin
                     tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetMon').AsBoolean;
                  end;

                  if (DayOfTheWeek(gedtOverrideDate) = DayTuesday) then begin
                     tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetTue').AsBoolean;
                  end;

                  if (DayOfTheWeek(gedtOverrideDate) = DayWednesday) then begin
                     tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetWed').AsBoolean;
                  end;

                  if (DayOfTheWeek(gedtOverrideDate) = DayThursday) then begin
                     tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetThu').AsBoolean;
                  end;

                  if (DayOfTheWeek(gedtOverrideDate) = DayFriday) then begin
                     tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetFri').AsBoolean;
                  end;

                  if (DayOfTheWeek(gedtOverrideDate) = DaySaturday) then begin
                     tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetSat').AsBoolean;
                  end;

                  if (DayOfTheWeek(gedtOverrideDate) = DaySunday) then begin
                     tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetSun').AsBoolean;
                  end;
               end;

               tblE.FieldByName('IsYouBetTrack').AsBoolean := tblTrk.FieldByName('IsYouBetTrack').AsBoolean;
               tblR.FieldByName('IsYouBetTrack').AsBoolean := tblE.FieldByName('IsYouBetTrack').AsBoolean;

               tblE.FieldByName('IsPTCTrack').AsBoolean := tblTrk.FieldByName('IsPTCTrack').AsBoolean;
               tblR.FieldByName('IsPTCTrack').AsBoolean := tblE.FieldByName('IsPTCTrack').AsBoolean;

               tblE.FieldByName('IsTwinSpiresTrack').AsBoolean := tblTrk.FieldByName('IsTwinSpiresTrack').AsBoolean;
               tblR.FieldByName('IsTwinSpiresTrack').AsBoolean := tblE.FieldByName('IsTwinSpiresTrack').AsBoolean;

               tblE.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;

               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  if tblE.FieldByName('LastClaimed').AsString = 'C' then begin
                     if tblR.FieldByName('ClaimingPrice').AsFloat > tblE.FieldByName('LastClmPrice').AsFloat then begin
                        tblE.FieldByName('IsClaimedAndUp').AsBoolean := True;
                     end;

                     if (tblR.FieldByName('RaceType').AsString <> 'MCL') and
                        (tblR.FieldByName('RaceType').AsString <> 'CLM') and
                        (tblR.FieldByName('RaceType').AsString <> 'OCL') then begin
                        tblE.FieldByName('IsClaimedAndUp').AsBoolean := True;
                     end;
                  end;

                  if tblE.FieldByName('LastClaimed').AsString = 'C' then begin
                     if tblR.FieldByName('ClaimingPrice').AsFloat < tblE.FieldByName('LastClmPrice').AsFloat then begin
                        tblE.FieldByName('IsClaimedAndDown').AsBoolean := True;
                     end;
                  end;

                  if (tblE.FieldByName('DaysLast').AsInteger >= 61) then begin
                     if (tblE.FieldByName('LastClmPrice').AsFloat > 0) then begin
                        if tblR.FieldByName('ClaimingPrice').AsFloat > tblE.FieldByName('LastClmPrice').AsFloat then begin
                           tblE.FieldByName('IsLayoffAndUp').AsBoolean := True;
                        end;
                        if (tblR.FieldByName('RaceType').AsString <> 'MCL') and
                           (tblR.FieldByName('RaceType').AsString <> 'CLM') and
                           (tblR.FieldByName('RaceType').AsString <> 'OCL') then begin
                           tblE.FieldByName('IsLayoffAndUp').AsBoolean := True;
                        end;
                     end;
                  end;
               end;

               bWagerSheetSelected := False;
               bLinerSheetSelected := False;


               bSuperTrainer := False;
               bSuperJockey := False;
               bSuperOwner := False;

               iBreedingWagerAmt := 0;

               fWagerAmt := 0;
               fPlcWagerAmt := 0;
               fShoWagerAmt := 0;

               bFrontDoubleLiner := False;
               bBackDoubleLiner := False;
               bTripleLiner := False;
               bFrontDoubleDot := False;
               bBackDoubleDot := False;
               bTripleDot := False;
               bDollar := False;
               bDoubleDollar := False;
               bFirstTimeJuice := False;

               bFrontDoubleLiner0 := False;
               bFrontDoubleLiner1 := False;
               bFrontDoubleLiner2 := False;
               bFrontDoubleLiner3 := False;

               bBackDoubleLiner0 := False;
               bBackDoubleLiner1 := False;
               bBackDoubleLiner2 := False;
               bBackDoubleLiner3 := False;

               bTripleLiner0 := False;
               bTripleLiner1 := False;
               bTripleLiner2 := False;
               bTripleLiner3 := False;

               iLinerStartsByTrkAll := 0;
               iLinerWinsByTrkAll := 0;
               fLinerWinPctByTrkAll := 0;
               fLinerValueBetByTrkAll := 0;

               iLinerStartsByTrk0To3 := 0;
               iLinerWinsByTrk0To3 := 0;
               fLinerWinPctByTrk0To3 := 0;
               fLinerValueBetByTrk0To3 := 0;

               iPostPos := 0;
               iLastPostPos := 0;

               bIsLayoffAndUp := False;
               bIsClaimedAndUp := False;
               bIsClaimedAndDown := False;

               sTurfIndicator := '';
               sDebutIndicator := '';
               sRouteIndicator := '';

               sSurface := '';
               sEquip := '';

               iAngleChoice := 0;
               iTipChoice := 0;

               sTrnEquibaseKey := '';
               sJkyEquibaseKey := '';

               iLastPostPos := 0;

               iFinalWinPctRank := 0;
               fTodaysWagerValueBet := 0;
               fFinalWinPct := 0;

               iPointsRank := 0;



               iJkyTrackRank := 0;
               iTrnTrackRank := 0;

               iTrnWinsRank := 0;
               iJkyWinsRank := 0;
               iOwnWinsRank := 0;

               iTrnEarningsRank := 0;
               iJkyEarningsRank := 0;
               iOwnEarningsRank := 0;

               fDistanceInFurlongs := 0;
               sValueIndicator := '';
               sDollarIndicator := '';

               fMorningLineOddsTo1 := 0;

               fMorningLineTo1FairProbability := 0;

               fTodaysWagerLineTo1 := 0;
               fTodaysWagerLineTo1Fair := 0;
               fTodaysWagerLineTo1Probability := 0;
               fTodaysWagerLineTo1FairProbability := 0;

               fMorningLineTo1Fair := 0;
               fMorningLineTo1FairProbability := 0;

               fNbrStarters := 0;
               fNbrDebutStarters := 0;
               fNbrDebutTwoStarters := 0;
               fNbrTurfDebutStarters := 0;
               fNbrRouteDebutStarters := 0;
               fPctOfDebutStarters := 0;
               fPctOfTurfDebutStarters := 0;

               //               iStartsWorks21 := 0;
               //               iNbrWorksLast := 0;

               fLastDaysSinceLastRace := 0;
               fLast2DaysSinceLastRace := 0;
               fLast3DaysSinceLastRace := 0;

               fLastDaysLast := 0;
               fLast2DaysLast := 0;
               fLast3DaysLast := 0;

               sAngleDesc := '';

               //
   //            iStartsWorks21 := tblE.FieldByName('StartsWorks21').AsInteger;
//               iNbrWorksLast := tblE.FieldByName('NbrWorksLast').AsInteger;

               sSurface := tblR.FieldByName('Surface').AsString;
               sRaceType := tblR.FieldByName('RaceType').AsString;
               sTrkCode := tblR.FieldByName('TrkCode').AsString;
               fDistanceInFurlongs := tblR.FieldByName('DistanceInFurlongs').AsFloat;
               if (fDistanceInFurlongs < MILE_FURLONGS) then begin
                  bIsRoute := False;
                  bIsSprint := True;
               end else begin
                  bIsRoute := True;
                  bIsSprint := False;
               end;

               if UpperCase(tblR.TableName) = 'RACE' then begin
                  sRaceShape := tblR.FieldByName('RaceShape').AsString;
               end;


               fNbrStarters := tblR.FieldByName('NbrStarters').AsFloat;
               fNbrDebutStarters := tblR.FieldByName('NbrDebutStarters').AsFloat;
               fNbrDebutTwoStarters := tblR.FieldByName('NbrDebutTwoStarters').AsFloat;
               fNbrTurfDebutStarters := tblR.FieldByName('NbrTurfDebutStarters').AsFloat;
               fNbrRouteDebutStarters := tblR.FieldByName('NbrRouteDebutStarters').AsFloat;

               if UpperCase(tblR.TableName) = 'RACE' then begin
                  iTopLastSpeed := tblR.FieldByName('TopLastSpeed').AsInteger;
                  iTopBackSpeed := tblR.FieldByName('TopBackSpeed').AsInteger;

                  //                  iTopLastSRWinner := tblR.FieldByName('TopLastSRWinner').AsInteger;
               end;

               if (fNbrStarters > 0) then begin
                  fPctOfDebutStarters := (fNbrDebutStarters / fNbrStarters) * 100;
               end else begin
                  fPctOfDebutStarters := 0;
               end;

               if (fNbrStarters > 0) then begin
                  fPctOfTurfDebutStarters := (fNbrTurfDebutStarters / fNbrStarters) * 100;
               end else begin
                  fPctOfTurfDebutStarters := 0;
               end;



               fMorningLineOddsTo1 := tblE.FieldByName('MorningLineTo1').AsFloat;
               iMorningLineTo1Rank := tblE.FieldByName('MorningLineTo1Rank').AsInteger;


               iAge := tblE.FieldByName('Age').AsInteger;

               iPostPos := tblE.FieldByName('PostPos').AsInteger;

               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  iLastPostPos := tblE.FieldByName('LastPostPos').AsInteger;
               end;

               sEquip := tblE.FieldByName('Equip').AsString;
               //               if UpperCase(tblE.TableName) = 'ENTRY' then begin
               //                  sValueIndicator := tblE.FieldByName('ValueIndicator').AsString;
               //               end;

               bIsLayoffAndUp := tblE.FieldByName('IsLayoffAndUp').AsBoolean;
               bIsClaimedAndUp := tblE.FieldByName('IsClaimedAndUp').AsBoolean;
               bIsClaimedAndDown := tblE.FieldByName('IsClaimedAndDown').AsBoolean;

               sTurfIndicator := tblE.FieldByName('TurfIndicator').AsString;
               sDebutIndicator := tblE.FieldByName('DebutIndicator').AsString;
               sRouteIndicator := tblE.FieldByName('RouteIndicator').AsString;

               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  fTotalTrnDebutWinPct := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
                  fTotalTrnDebutTwoWinPct := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
                  // Without workouts
                  fTotalTrn1To45WinPct := tblE.FieldByName('TotalTrn1To45WinPct').AsFloat;
                  fTotalTrn46To120WinPct := tblE.FieldByName('TotalTrn46To120WinPct').AsFloat;
                  fTotalTrn120PlusWinPct := tblE.FieldByName('TotalTrn120PlusWinPct').AsFloat;

                  // With workouts
                  fTotalTrnWork1To45WinPct := tblE.FieldByName('TotalTrnWork1To45WinPct').AsFloat;
                  fTotalTrnWork46To120WinPct := tblE.FieldByName('TotalTrnWork46To120WinPct').AsFloat;
                  fTotalTrnWork120PlusWinPct := tblE.FieldByName('TotalTrnWork120PlusWinPct').AsFloat;


                  iTotalTrnAftClmStarts := tblE.FieldByName('TotalTrnAftClmStarts').AsInteger;
                  fTotalTrnAftClmWinPct := tblE.FieldByName('TotalTrnAftClmWinPct').AsFloat;

                  fTotalTrnWinPct := RoundTo(tblE.FieldByName('TotalTrnWinPct').AsFloat, 1);

                  fTotalJkyWinPct := tblE.FieldByName('TotalJkyWinPct').AsFloat;
                  fTotalOwnWinPct := tblE.FieldByName('TotalOwnWinPct').AsFloat;

                  fTrnDirtToTurfWinPct := tblE.FieldByName('TrnDirtToTurfWinPct').AsFloat;
                  fTrnTurfToDirtWinPct := tblE.FieldByName('TrnTurfToDirtWinPct').AsFloat;

                  fTrnSprToRteWinPct := tblE.FieldByName('TrnSprToRteWinPct').AsFloat;
                  fTrnRteToSprWinPct := tblE.FieldByName('TrnRteToSprWinPct').AsFloat;

                  fTotalTrn2YoWinPct := tblE.FieldByName('TotalTrn2yoWinPct').AsFloat;

                  iTotalTrnDebutStarts := tblE.FieldByName('TotalTrnDebutStarts').AsInteger;
                  iTotalTrnDebutTwoStarts := tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger;

                  iTotalTrn120PlusStarts := tblE.FieldByName('TotalTrn120PlusStarts').AsInteger;
                  iTotalTrnWork120PlusStarts := tblE.FieldByName('TotalTrnWork120PlusStarts').AsInteger;

                  iTotalTrnTurfStarts := tblE.FieldByName('TotalTrnTurfStarts').AsInteger;
                  fTotalTrnTurfWinPct := tblE.FieldByName('TotalTrnTurfWinPct').AsFloat;

                  iTotalTrnStarts := tblE.FieldByName('TotalTrnStarts').AsInteger;
                  iTotalJkyStarts := tblE.FieldByName('TotalJkyStarts').AsInteger;

                  iTotalTrnOddsStarts := tblE.FieldByName('TotalTrnOddsStarts').AsInteger;
                  iTotalJkyOddsStarts := tblE.FieldByName('TotalJkyOddsStarts').AsInteger;

                  iTotalOwnStarts := tblE.FieldByName('TotalOwnStarts').AsInteger;

                  iTrnDirtToTurfStarts := tblE.FieldByName('TrnDirtToTurfStarts').AsInteger;
                  iTrnTurfToDirtStarts := tblE.FieldByName('TrnTurfToDirtStarts').AsInteger;

                  iTrnSprToRteStarts := tblE.FieldByName('TrnSprToRteStarts').AsInteger;
                  iTrnRteToSprStarts := tblE.FieldByName('TrnRteToSprStarts').AsInteger;
               end;

               bTurfToDirt := tblE.FieldByName('IsTurfToDirt').AsBoolean;
               bDirtToTurf := tblE.FieldByName('IsDirtToTurf').AsBoolean;

               bSprToRte := tblE.FieldByName('IsSprToRte').AsBoolean;
               bRteToSpr := tblE.FieldByName('IsRteToSpr').AsBoolean;

               iDaysLast := tblE.FieldByName('DaysLast').AsInteger;

               iQSP1stCall := tblE.FieldByName('QSP1stCall').AsInteger;
               iQSP1stCallRank := tblE.FieldByName('QSP1stCallRank').AsInteger;
               sQSP1stCallRunStyle := tblE.FieldByName('QSP1stCallRunStyle').AsString;
               if (iQSP1stCallRank = 1) then begin
                  bQSP := True;
               end else begin
                  bQSP := False;
               end;

               iKSP1stCall := tblE.FieldByName('KSP1stCall').AsInteger;
               iKSP1stCallRank := tblE.FieldByName('KSP1stCallRank').AsInteger;
               if (iKSP1stCallRank = 1) then begin
                  bKSP := True;
               end else begin
                  bKSP := False;
               end;


               iQSP2ndCall := tblE.FieldByName('QSP2ndCall').AsInteger;
               iQSP2ndCallRank := tblE.FieldByName('QSP2ndCallRank').AsInteger;
               sQSP2ndCallRunStyle := tblE.FieldByName('QSP2ndCallRunStyle').AsString;
               if (iQSP2ndCallRank = 1) then begin
                  bQSP2 := True;
               end else begin
                  bQSP2 := False;
               end;


               iKSP2ndCall := tblE.FieldByName('KSP2ndCall').AsInteger;
               iKSP2ndCallRank := tblE.FieldByName('KSP2ndCallRank').AsInteger;
               if (iKSP2ndCallRank = 1) then begin
                  bKSP2 := True;
               end else begin
                  bKSP2 := False;
               end;

               fEarlyPace := tblE.FieldByName('EarlyPace').AsFloat;
               fMiddlePace := tblE.FieldByName('MiddlePace').AsFloat;
               fLatePace := tblE.FieldByName('LatePace').AsFloat;

               iEarlyPaceRank := tblE.FieldByName('EarlyPaceRank').AsInteger;
               iMiddlePaceRank := tblE.FieldByName('MiddlePaceRank').AsInteger;
               iLatePaceRank := tblE.FieldByName('LatePaceRank').AsInteger;

               iEarlyPacePosRank := tblE.FieldByName('EarlyPacePosRank').AsInteger;
               iMiddlePacePosRank := tblE.FieldByName('MiddlePacePosRank').AsInteger;
               iLatePacePosRank := tblE.FieldByName('LatePacePosRank').AsInteger;


               iLastSpeedRank := tblE.FieldByName('LastSpeedRank').AsInteger;
               iBackSpeedRank := tblE.FieldByName('BackSpeedRank').AsInteger;
               iPowerRank := tblE.FieldByName('PowerRank').AsInteger;
               iLastSpeed := tblE.FieldByName('LastSpeed').AsInteger;
               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  iLast2Speed := tblE.FieldByName('Last2Speed').AsInteger;
                  iLast3Speed := tblE.FieldByName('Last3Speed').AsInteger;
               end;
               iBackSpeed := tblE.FieldByName('BackSpeed').AsInteger;

               bBackDoubleLiner := tblE.FieldByName('IsBackDoubleLiner').AsBoolean;
               bFrontDoubleLiner := tblE.FieldByName('IsFrontDoubleLiner').AsBoolean;

               bTripleDot := tblE.FieldByName('IsTripleDot').AsBoolean;
               bBackDoubleDot := tblE.FieldByName('IsBackDoubleDot').AsBoolean;
               bFrontDoubleDot := tblE.FieldByName('IsFrontDoubleDot').AsBoolean;
               bTripleLiner := tblE.FieldByName('IsTripleLiner').AsBoolean;

               //               bDollar := tblE.FieldByName('IsDollar').AsBoolean;
               //               bDoubleDollar := tblE.FieldByName('IsDoubleDollar').AsBoolean;

               bFrontDoubleLiner0 := tblE.FieldByName('IsFrontDoubleLiner0').AsBoolean;
               bFrontDoubleLiner1 := tblE.FieldByName('IsFrontDoubleLiner1').AsBoolean;
               bFrontDoubleLiner2 := tblE.FieldByName('IsFrontDoubleLiner2').AsBoolean;
               bFrontDoubleLiner3 := tblE.FieldByName('IsFrontDoubleLiner3').AsBoolean;

               bBackDoubleLiner0 := tblE.FieldByName('IsBackDoubleLiner0').AsBoolean;
               bBackDoubleLiner1 := tblE.FieldByName('IsBackDoubleLiner1').AsBoolean;
               bBackDoubleLiner2 := tblE.FieldByName('IsBackDoubleLiner2').AsBoolean;
               bBackDoubleLiner3 := tblE.FieldByName('IsBackDoubleLiner3').AsBoolean;

               bTripleLiner0 := tblE.FieldByName('IsTripleLiner0').AsBoolean;
               bTripleLiner1 := tblE.FieldByName('IsTripleLiner1').AsBoolean;
               bTripleLiner2 := tblE.FieldByName('IsTripleLiner2').AsBoolean;
               bTripleLiner3 := tblE.FieldByName('IsTripleLiner3').AsBoolean;

               bBlinkersOn := tblE.FieldByName('IsBlinkersOn').AsBoolean;
               bBlinkersOff := tblE.FieldByName('IsBlinkersOff').AsBoolean;

               bFirstTimeJuice := tblE.FieldByName('IsFirstTimeJuice').AsBoolean;

               //          fTrnDaysWinPct := 0;
          //               if (iNbrWorksLast > 0) then begin
          //                  if ((iDaysLast >= 1) and (iDaysLast <= 45)) then begin
          //                     fTrnDaysWinPct := RoundTo(fTotalTrnWork1To45WinPct, 1);
          //                  end;
          //                  if ((iDaysLast >= 46) and (iDaysLast <= 120)) then begin
          //                     fTrnDaysWinPct := RoundTo(fTotalTrnWork46To120WinPct, 1);
          //                  end;
          //                  if (iDaysLast > 120) then begin
          //                     fTrnDaysWinPct := RoundTo(fTotalTrnWork120PlusWinPct, 1);
          //                  end;
          //               end else begin
          //                  if ((iDaysLast >= 1) and (iDaysLast <= 45)) then begin
          //                     fTrnDaysWinPct := RoundTo(fTotalTrn1To45WinPct, 1);
          //                  end;
          //                  if ((iDaysLast >= 46) and (iDaysLast <= 120)) then begin
          //                     fTrnDaysWinPct := RoundTo(fTotalTrn46To120WinPct, 1);
          //                  end;
          //                  if (iDaysLast > 120) then begin
          //                     fTrnDaysWinPct := RoundTo(fTotalTrn120PlusWinPct, 1);
          //                  end;
          //               end;

               bEarlyDot := False;
               bMiddleDot := False;
               bLateDot := False;

               bEarlyLiner := False;
               bMiddleLiner := False;
               bLateLiner := False;


               //
               if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
                  (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
                  bEarlyDot := True;
               end;

               if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  bMiddleDot := True;
               end;

               if (tblE.FieldByName('LatePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('LatePacePosRank').AsInteger = 1) then begin
                  bLateDot := True;
               end;

               //
               if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
                  (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                  bEarlyLiner := True;
               end;

               if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                  bMiddleLiner := True;
               end;

               if (tblE.FieldByName('LatePace').AsFloat < 9999) and
                  (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                  bLateLiner := True;
               end;

               //If modified Change in GetXS2
               iNbrPaceCnt := 0;
               if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
                  (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
                  if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
                     (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                     Inc(iNbrPaceCnt);
                  end;
               end;
               if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
                     (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                     Inc(iNbrPaceCnt);
                  end;
               end;
               if ((tblE.FieldByName('QSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1)) then begin
                  Inc(iNbrPaceCnt);
               end;
               if ((tblE.FieldByName('KSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                  Inc(iNbrPaceCnt);
               end;
               //If modified Change in GetXS2


               //Now used to store liner/dot compares
               iTrnTrackRank := tblE.FieldByName('TrnTrackRank').AsInteger;
               iJkyTrackRank := tblE.FieldByName('JkyTrackRank').AsInteger;

               iTrnWinsRank := tblE.FieldByName('TrnWinsRank').AsInteger;
               iTrnEarningsRank := tblE.FieldByName('TrnEarningsRank').AsInteger;

               iJkyWinsRank := tblE.FieldByName('JkyWinsRank').AsInteger;
               iJkyEarningsRank := tblE.FieldByName('JkyEarningsRank').AsInteger;

               iOwnWinsRank := tblE.FieldByName('OwnWinsRank').AsInteger;
               iOwnEarningsRank := tblE.FieldByName('OwnEarningsRank').AsInteger;

               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  iSireTurfThisYearRank := tblE.FieldByName('SireTurfThisYearRank').AsInteger;
                  iSireTurfLastYearRank := tblE.FieldByName('SireTurfLastYearRank').AsInteger;

                  iSireTurfThisYearPctOfEarnings := tblE.FieldByName('SireTurfThisYearPctOfEarnings').AsInteger;
                  iSireTurfLastYearPctOfEarnings := tblE.FieldByName('SireTurfLastYearPctOfEarnings').AsInteger;

                  iSireGeneralThisYearRank := tblE.FieldByName('SireGeneralThisYearRank').AsInteger;
                  iSireGeneralLastYearRank := tblE.FieldByName('SireGeneralLastYearRank').AsInteger;

                  iSireJuvenileThisYearRank := tblE.FieldByName('SireJuvenileThisYearRank').AsInteger;
                  iSireJuvenileLastYearRank := tblE.FieldByName('SireJuvenileLastYearRank').AsInteger;
                  bSuperOwner := tblE.FieldByName('IsSuperOwner').AsBoolean;
                  bSuperJockey := tblE.FieldByName('IsSuperJockey').AsBoolean;
                  bSuperTrainer := tblE.FieldByName('IsSuperTrainer').AsBoolean;


                  sLastFavoriteIndicator := dm.tblEntries.FieldByName('LastFavoriteIndicator').AsString;
                  iLastFinishPos := dm.tblEntries.FieldByName('LastPosFinCall').AsInteger;
                  iLast2FinishPos := dm.tblEntries.FieldByName('Last2PosFinCall').AsInteger;
                  iLast3FinishPos := dm.tblEntries.FieldByName('Last3PosFinCall').AsInteger;
               end;

               fRouteStarts := 0;
               fSprintStarts := 0;

               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  fLifeStarts := dm.tblEntries.FieldByName('LifeStarts').AsFloat;
                  fLifeWins := dm.tblEntries.FieldByName('LifeWins').AsFloat;
                  fLifePlcs := dm.tblEntries.FieldByName('LifePlcs').AsFloat;
                  fLifeShos := dm.tblEntries.FieldByName('LifeShos').AsFloat;

                  fTrkStarts := dm.tblEntries.FieldByName('TrkStarts').AsFloat;
                  fTrkWins := dm.tblEntries.FieldByName('TrkWins').AsFloat;
                  fTrkPlcs := dm.tblEntries.FieldByName('TrkPlcs').AsFloat;
                  fTrkShos := dm.tblEntries.FieldByName('TrkShos').AsFloat;

                  fTurfStarts := dm.tblEntries.FieldByName('TurfStarts').AsFloat;
                  fTurfWins := dm.tblEntries.FieldByName('TurfWins').AsFloat;
                  fTurfPlcs := dm.tblEntries.FieldByName('TurfPlcs').AsFloat;
                  fTurfShos := dm.tblEntries.FieldByName('TurfShos').AsFloat;

                  fMudStarts := dm.tblEntries.FieldByName('MudStarts').AsFloat;
                  fMudWins := dm.tblEntries.FieldByName('MudWins').AsFloat;
                  fMudPlcs := dm.tblEntries.FieldByName('MudPlcs').AsFloat;
                  fMudShos := dm.tblEntries.FieldByName('MudShos').AsFloat;

                  fRouteStarts := tblE.FieldByName('RouteStarts').AsFloat;
                  fRouteWins := tblE.FieldByName('RouteWins').AsFloat;
                  fRoutePlcs := tblE.FieldByName('RoutePlcs').AsFloat;
                  fRouteShos := tblE.FieldByName('RouteShos').AsFloat;

                  fSprintStarts := tblE.FieldByName('SprintStarts').AsFloat;
                  fSprintWins := tblE.FieldByName('SprintWins').AsFloat;
                  fSprintPlcs := tblE.FieldByName('SprintPlcs').AsFloat;
                  fSprintShos := tblE.FieldByName('SprintShos').AsFloat;


                  iLastPos1stCall := tblE.FieldByName('LastPos1stCall').AsInteger;
                  iLastPos2ndCall := tblE.FieldByName('LastPos2ndCall').AsInteger;
                  iLastPosStrCall := tblE.FieldByName('LastPosStrCall').AsInteger;
                  iLastPosFinCall := tblE.FieldByName('LastPosFinCall').AsInteger;

                  iLast2Pos1stCall := tblE.FieldByName('Last2Pos1stCall').AsInteger;
                  iLast2Pos2ndCall := tblE.FieldByName('Last2Pos2ndCall').AsInteger;
                  iLast2PosStrCall := tblE.FieldByName('Last2PosStrCall').AsInteger;
                  iLast2PosFinCall := tblE.FieldByName('Last2PosFinCall').AsInteger;

                  iLast3Pos1stCall := tblE.FieldByName('Last3Pos1stCall').AsInteger;
                  iLast3Pos2ndCall := tblE.FieldByName('Last3Pos2ndCall').AsInteger;
                  iLast3PosStrCall := tblE.FieldByName('Last3PosStrCall').AsInteger;
                  iLast3PosFinCall := tblE.FieldByName('Last3PosFinCall').AsInteger;

                  fLastBL1stCall := tblE.FieldByName('LastBL1stCall').AsFloat;
                  fLastBL2ndCall := tblE.FieldByName('LastBL2ndCall').AsFloat;
                  fLastBLStrCall := tblE.FieldByName('LastBLStrCall').AsFloat;
                  fLastBLFinCall := tblE.FieldByName('LastBLFinCall').AsFloat;

                  fLast2BL1stCall := tblE.FieldByName('Last2BL1stCall').AsFloat;
                  fLast2BL2ndCall := tblE.FieldByName('Last2BL2ndCall').AsFloat;
                  fLast2BLStrCall := tblE.FieldByName('Last2BLStrCall').AsFloat;
                  fLast2BLFinCall := tblE.FieldByName('Last2BLFinCall').AsFloat;

                  fLast3BL1stCall := tblE.FieldByName('Last3BL1stCall').AsFloat;
                  fLast3BL2ndCall := tblE.FieldByName('Last3BL2ndCall').AsFloat;
                  fLast3BLStrCall := tblE.FieldByName('Last3BLStrCall').AsFloat;
                  fLast3BLFinCall := tblE.FieldByName('Last3BLFinCall').AsFloat;

                  fLastDaysLast := DaysApart(tblE.FieldByName('LastRaceDate').AsDateTime, tblE.FieldByName('RaceDate').AsDateTime);
                  fLast2DaysLast := DaysApart(tblE.FieldByName('Last2RaceDate').AsDateTime, tblE.FieldByName('RaceDate').AsDateTime);
                  fLast3DaysLast := DaysApart(tblE.FieldByName('Last3RaceDate').AsDateTime, tblE.FieldByName('RaceDate').AsDateTime);

                  fLastDaysSinceLastRace := DaysApart(tblE.FieldByName('LastRaceDate').AsDateTime, tblE.FieldByName('RaceDate').AsDateTime);
                  fLast2DaysSinceLastRace := DaysApart(tblE.FieldByName('Last2RaceDate').AsDateTime, tblE.FieldByName('LastRaceDate').AsDateTime);
                  fLast3DaysSinceLastRace := DaysApart(tblE.FieldByName('Last3RaceDate').AsDateTime, tblE.FieldByName('Last2RaceDate').AsDateTime);

                  sLastSurf := tblE.FieldByName('LastSurf').AsString;
                  sLast2Surf := tblE.FieldByName('Last2Surf').AsString;
                  sLast3Surf := tblE.FieldByName('Last3Surf').AsString;

                  fLastDistance := tblE.FieldByName('LastDistance').AsFloat;
                  fLast2Distance := tblE.FieldByName('Last2Distance').AsFloat;
                  fLast3Distance := tblE.FieldByName('Last3Distance').AsFloat;

                  sLastTrkCode := tblE.FieldByName('LastTrkCode').AsString;
                  sLast2TrkCode := tblE.FieldByName('Last2TrkCode').AsString;
                  sLast3TrkCode := tblE.FieldByName('Last3TrkCode').AsString;

                  fLastOdds := tblE.FieldByName('LastOdds').AsFloat;
                  fLast2Odds := tblE.FieldByName('Last2Odds').AsFloat;
                  fLast3Odds := tblE.FieldByName('Last3Odds').AsFloat;

                  if (fLastDistance < MILE_FURLONGS) then begin
                     bLastIsRoute := False;
                     bLastIsSprint := True;
                  end else begin
                     bLastIsRoute := True;
                     bLastIsSprint := False;
                  end;

                  if (fLast2Distance < MILE_FURLONGS) then begin
                     bLast2IsRoute := False;
                     bLast2IsSprint := True;
                  end else begin
                     bLast2IsRoute := True;
                     bLast2IsSprint := False;
                  end;

                  if (fLast3Distance < MILE_FURLONGS) then begin
                     bLast3IsRoute := False;
                     bLast3IsSprint := True;
                  end else begin
                     bLast3IsRoute := True;
                     bLast3IsSprint := False;
                  end;




                  // First/Second 2yo start
                  iAngleChoice := 0;
                  b2yoBred := False;
                  if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
                     if (sDebutIndicator = '*') then begin
                        if (iAge = 2) then begin
                           iAngleChoice := 20;
                           if (iSireJuvenileThisYearRank > 0) and (iSireJuvenileThisYearRank < 9999) then begin
                              Inc(iAngleChoice);
                              Inc(iBreedingWagerAmt);
                           end;
                           if (iSireJuvenileLastYearRank > 0) and (iSireJuvenileLastYearRank < 9999) then begin
                              Inc(iAngleChoice);
                              Inc(iBreedingWagerAmt);
                           end;
                        end;
                        if (iAngleChoice > 20) then begin
                           b2yoBred := True;
                        end else begin
                           iAngleChoice := 0;
                        end;
                     end;
                  end;

                  bTR2Y := False;
                  if (iAge = 2) then begin
                     if (fTotalTrn2YoWinPct > fTotalTrnWinPct) then begin
                        bTR2Y := True;
                     end;
                  end;

                  if (b2yoBred) then begin
                     sAngleDesc := sAngleDesc + ' 2YBRED ';
                  end;

                  // First/Second starter
                  b1stBred := False;
                  if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
                     if (sDebutIndicator = '*') then begin
                        iAngleChoice := 30;
                        if (iSireGeneralThisYearRank > 0) and (iSireGeneralThisYearRank < 9999) then begin
                           Inc(iAngleChoice);
                           Inc(iBreedingWagerAmt);
                        end;
                        if (iSireGeneralLastYearRank > 0) and (iSireGeneralLastYearRank < 9999) then begin
                           Inc(iAngleChoice);
                           Inc(iBreedingWagerAmt);
                        end;
                        if (iAngleChoice > 30) then begin
                           b1stBred := True;
                        end else begin
                           iAngleChoice := 0;
                        end;
                     end;
                  end;

                  bTRD1 := False;
                  if (sDebutIndicator = '*') then begin
                     if (fTotalTrnDebutWinPct > fTotalTrnWinPct) then begin
                        bTRD1 := True;
                     end;
                  end;

                  bTRD2 := False;
                  if (sDebutIndicator = '**') then begin
                     if (fTotalTrnDebutTwoWinPct > fTotalTrnWinPct) then begin
                        bTRD2 := True;
                     end;

                  end;

                  if (b1stBred) then begin
                     sAngleDesc := sAngleDesc + ' 1BRED ';
                  end;


                  // First/Second Turf start
                  bTurfBred := False;
                  if ((sSurface = 'T') and (sTurfIndicator = '*')) then begin
                     iAngleChoice := 40;
                     if (iSireTurfThisYearRank > 0) and (iSireTurfThisYearRank < 9999) then begin
                        Inc(iAngleChoice);
                        Inc(iBreedingWagerAmt);
                     end;
                     if (iSireTurfLastYearRank > 0) and (iSireTurfLastYearRank < 9999) then begin
                        Inc(iAngleChoice);
                        Inc(iBreedingWagerAmt);
                     end;
                     if (iAngleChoice > 40) then begin
                        bTurfBred := True;
                     end else begin
                        iAngleChoice := 0;
                     end;
                  end;

                  if (bTurfBred) then begin
                     sAngleDesc := sAngleDesc + ' TBRED ';
                  end;

                  //
//                  if (fLifeStarts > 0) then begin
//                     if sTrkCode <> sLastTrkCode then begin
//                        sAngleDesc := sAngleDesc + ' SHP ';
//                        bShipIn := True;
//                     end;
//                  end;
//
                  b1stOffLayoff := False;
                  b2ndOffLayoff := False;
                  b3rdOffLayoff := False;
                  // 3rd After Layoff - Layoff being 45 days
                  if (fLifeStarts >= 3) then begin
                     if (fLast3DaysSinceLastRace > 30) then begin
                        b3rdOffLayoff := True;
                        b1stOffLayoff := False;
                        b2ndOffLayoff := False;
                     end else begin
                        b1stOffLayoff := False;
                        b2ndOffLayoff := False;
                        b3rdOffLayoff := False;
                     end;
                  end;

                  // 2nd After Layoff - Layoff being 45 days
                  if (fLifeStarts >= 2) then begin
                     if (not b3rdOffLayoff) then begin
                        if (fLast2DaysSinceLastRace > 60) then begin
                           b2ndOffLayoff := True;
                           b1stOffLayoff := False;
                           b3rdOffLayoff := False;
                        end else begin
                           b1stOffLayoff := False;
                           b2ndOffLayoff := False;
                           b3rdOffLayoff := False;
                        end;
                     end;
                  end;

                  // 1st After Layoff - Layoff being 45 days
                  if (iDaysLast > 30) then begin
                     b1stOffLayoff := True;
                     b2ndOffLayoff := False;
                     b3rdOffLayoff := False;
                  end;

                  //                  if (b1stOffLayoff) and (not b2ndOffLayoff) and (not b3rdOffLayoff) then begin
                  //                     sAngleDesc := sAngleDesc + ' 1Lay ';
                  //                  end;
                  //                  if (not b1stOffLayoff) and (b2ndOffLayoff) and (not b3rdOffLayoff) then begin
                  //                     sAngleDesc := sAngleDesc + ' 2Lay ';
                  //                  end;
                  //                  if (not b1stOffLayoff) and (not b2ndOffLayoff) and (b3rdOffLayoff) then begin
                  //                     sAngleDesc := sAngleDesc + ' 3Lay ';
                  //                  end;

                  bTDT := False;
                  bDTD := False;
                  bRSR := False;
                  bSRS := False;
                  if (not b1stOffLayoff) and (not b2ndOffLayoff) then begin
                     //Turf To Dirt To Turf
                     if sSurface = 'T' then begin
                        if sLastSurf = 'D' then begin
                           if sLast2Surf = 'T' then begin
                              //                              sAngleDesc := sAngleDesc + ' TDT ';
                              bTDT := True;
                           end;
                        end;
                     end;

                     //Dirt To Turf To Dirt
                     if sSurface = 'D' then begin
                        if sLastSurf = 'T' then begin
                           if sLast2Surf = 'D' then begin
                              //                              sAngleDesc := sAngleDesc + ' DTD ';
                              bDTD := True;
                           end;
                        end;
                     end;

                     //Sprint To Route To Sprint
                     if (bLast2IsSprint) then begin
                        if (bLastIsRoute) then begin
                           if (bIsSprint) then begin
                              //                              sAngleDesc := sAngleDesc + ' SRS ';
                              bSRS := True;
                           end;
                        end;
                     end;

                     //Route To Sprint To Route
                     if (bLast2IsRoute) then begin
                        if (bLastIsSprint) then begin
                           if (bIsRoute) then begin
                              //                              sAngleDesc := sAngleDesc + ' RSR ';
                              bRSR := True;
                           end;
                        end;
                     end;

                  end; //(not b1stOffLayoff) and (not b2ndOffLayoff) then begin


                  // Up or Down today
                  bUp := True;
                  bDown := True;
                  if (fLastClass > 0) then begin
                     if (fTodaysClass > fLastClass) then begin
                        //                     sAngleDesc := sAngleDesc + ' UP ';
                        bUP := True;
                     end;
                     if (fTodaysClass < fLastClass) then begin
                        //                     sAngleDesc := sAngleDesc + ' DWN ';
                        bDown := True;
                     end;
                  end;




                  // House Horse
                  if (fTrkStarts >= 5) then begin
                     if ((fTrkWins / fTrkStarts) > 0.50) then begin
                        //sAngleDesc := sAngleDesc + ' TRK ';
                        bTRK := True;
                     end;
                  end;

                  // Turf Horse
                  if (fTurfStarts >= 5) then begin
                     if ((fTurfWins / fTurfStarts) > 0.50) then begin
                        bTRF := True;
                     end;
                  end;

                  // Mud Horse
                  if (fMudStarts >= 5) then begin
                     if ((fMudWins / fMudStarts) > 0.50) then begin
                        bMUD := True;
                     end;
                  end;

                  // Route Horse
                  if (fRouteStarts >= 5) then begin
                     if ((fRouteWins / fRouteStarts) > 0.50) then begin
                        bRTE := True;
                     end;
                  end;

                  // Sprint Horse
                  if (fSprintStarts >= 5) then begin
                     if ((fSprintWins / fSprintStarts) > 0.50) then begin
                        //sAngleDesc := sAngleDesc + ' SPR ';
                        bSPR := True;
                     end;
                  end;
               end;

               //Xtreme Speed - 1st call
               bXS := False;
               if (bEarlyLiner and bMiddleLiner and bQSP and bKSP and bQSP2 and bKSP2) then begin
                  bXS := True;
                  //                  sAngleDesc := sAngleDesc + ' XS ';
               end;




               if (tblE.FieldByName('Is1stClaiming').AsBoolean) then begin
                  //                  sAngleDesc := sAngleDesc + ' 1TCLM ';
               end;

               if (tblE.FieldByName('Is1stMCL').AsBoolean) then begin
                  //                  sAngleDesc := sAngleDesc + ' 1TMCL ';
               end;



               iTipChoice := 0;

               //Start main selection
               bWagerSheetSelected := False;
               fWagerAmt := 0;
               fPlcWagerAmt := 0;
               fShoWagerAmt := 0;

               //
               if sSurface = 'D' then begin
                  if bFrontDoubleLiner0 then begin
                     fWagerAmt := 2;
                     fPlcWagerAmt := 2;
                     fShoWagerAmt := 2;
                  end;

                  if bFrontDoubleLiner1 then begin
                     fWagerAmt := 3;
                     fPlcWagerAmt := 3;
                     fShoWagerAmt := 3;
                  end;

                  if bFrontDoubleLiner2 then begin
                     fWagerAmt := 4;
                     fPlcWagerAmt := 4;
                     fShoWagerAmt := 4;
                  end;

                  if bFrontDoubleLiner3 then begin
                     fWagerAmt := 5;
                     fPlcWagerAmt := 5;
                     fShoWagerAmt := 5;
                  end;

                  //
                  if bBackDoubleLiner0 then begin
                     fWagerAmt := 2;
                     fPlcWagerAmt := 2;
                     fShoWagerAmt := 2;
                  end;

                  if bBackDoubleLiner1 then begin
                     fWagerAmt := 3;
                     fPlcWagerAmt := 3;
                     fShoWagerAmt := 3;
                  end;

                  if bBackDoubleLiner2 then begin
                     fWagerAmt := 4;
                     fPlcWagerAmt := 4;
                     fShoWagerAmt := 4;
                  end;

                  if bBackDoubleLiner3 then begin
                     fWagerAmt := 5;
                     fPlcWagerAmt := 5;
                     fShoWagerAmt := 5;
                  end;

                  //
                  if bTripleLiner0 then begin
                     fWagerAmt := 2;
                     fPlcWagerAmt := 2;
                     fShoWagerAmt := 2;
                  end;

                  if bTripleLiner1 then begin
                     fWagerAmt := 3;
                     fPlcWagerAmt := 3;
                     fShoWagerAmt := 3;
                  end;

                  if bTripleLiner2 then begin
                     fWagerAmt := 4;
                     fPlcWagerAmt := 4;
                     fShoWagerAmt := 4;
                  end;

                  if bTripleLiner3 then begin
                     fWagerAmt := 5;
                     fPlcWagerAmt := 5;
                     fShoWagerAmt := 5;
                  end;
               end else begin
                  if bFrontDoubleLiner0 then begin
                     fWagerAmt := 2;
                     fPlcWagerAmt := 2;
                     fShoWagerAmt := 2;
                  end;

                  if bFrontDoubleLiner1 then begin
                     fWagerAmt := 3;
                     fPlcWagerAmt := 3;
                     fShoWagerAmt := 3;
                  end;

                  if bFrontDoubleLiner2 then begin
                     fWagerAmt := 4;
                     fPlcWagerAmt := 4;
                     fShoWagerAmt := 4;
                  end;

                  if bFrontDoubleLiner3 then begin
                     fWagerAmt := 5;
                     fPlcWagerAmt := 5;
                     fShoWagerAmt := 5;
                  end;

                  //
                  if bBackDoubleLiner0 then begin
                     fWagerAmt := 2;
                     fPlcWagerAmt := 2;
                     fShoWagerAmt := 2;
                  end;

                  if bBackDoubleLiner1 then begin
                     fWagerAmt := 3;
                     fPlcWagerAmt := 3;
                     fShoWagerAmt := 3;
                  end;

                  if bBackDoubleLiner2 then begin
                     fWagerAmt := 4;
                     fPlcWagerAmt := 4;
                     fShoWagerAmt := 4;
                  end;

                  if bBackDoubleLiner3 then begin
                     fWagerAmt := 5;
                     fPlcWagerAmt := 5;
                     fShoWagerAmt := 5;
                  end;

                  //
                  if bTripleLiner0 then begin
                     fWagerAmt := 2;
                     fPlcWagerAmt := 2;
                     fShoWagerAmt := 2;
                  end;

                  if bTripleLiner1 then begin
                     fWagerAmt := 3;
                     fPlcWagerAmt := 3;
                     fShoWagerAmt := 3;
                  end;

                  if bTripleLiner2 then begin
                     fWagerAmt := 4;
                     fPlcWagerAmt := 4;
                     fShoWagerAmt := 4;
                  end;

                  if bTripleLiner3 then begin
                     fWagerAmt := 5;
                     fPlcWagerAmt := 5;
                     fShoWagerAmt := 5;
                  end;
               end;

               if bQSP and bKSP then begin
                  fWagerAmt := 5;
                  fPlcWagerAmt := 5;
                  fShoWagerAmt := 5;
               end;



               //tblE.FieldByName('IsLinerSheetSelected').AsBoolean := bLinerSheetSelected;


               //tblE.FieldByName('IsDollar').AsBoolean := bDollar;
               //tblE.FieldByName('IsDoubleDollar').AsBoolean := bDoubleDollar;

//               tblE.FieldByName('IsUpInClass').Value := bUp;
//               tblE.FieldByName('IsDownInClass').Value := bDown;

               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  tblE.FieldByName('Is1stAfterLayoff').Value := b1stOffLayoff;
                  tblE.FieldByName('Is2ndAfterLayoff').Value := b2ndOffLayoff;
                  tblE.FieldByName('Is3rdAfterLayoff').Value := b3rdOffLayoff;

                  tblE.FieldByName('IsDirtToTurfToDirtAfterLayoff').Value := bDTD;
                  tblE.FieldByName('IsTurfToDirtToTurfAfterLayoff').Value := bTDT;
                  tblE.FieldByName('IsRouteToSprintToRouteAfterLayoff').Value := bRSR;
                  tblE.FieldByName('IsSprintToRouteToSprintAfterLayoff').Value := bSRS;

               end;



               if UpperCase(tblE.TableName) = 'ENTRY' then begin
                  tblE.FieldByName('Is2yoBred').Value := b2yoBred;
                  tblE.FieldByName('Is1stBred').Value := b1stBred;
                  tblE.FieldByName('IsTurfBred').Value := bTurfBred;
               end;


               if (Trim(sAngleDesc) <> '') then begin
                  tblE.FieldByName('AngleDesc').AsString :=
                     tblE.FieldByName('AngleDesc').AsString + '(' + sAngleDesc + ')';
               end;

               tblE.Post();

               tblR.FieldByName('IsPrintedOnValueSheet').AsBoolean := tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean;

               tblR.Post();
            end;

            tblE.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit();
      end;

      tblR.CancelRange;
      tblE.CancelRange;
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblTrk);
      ClearPrgStatusBars();
   end;

end;

end.
