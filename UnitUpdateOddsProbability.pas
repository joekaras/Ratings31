unit UnitUpdateOddsProbability;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateOddsProbability
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblF: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitGetHandicappingKeys;

procedure UpdateOddsProbability
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblF: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var
   iRaceNbr: integer;
   sTrkCode: string;
   iPrevRaceNbr: integer;
   sPrevTrkCode: string;

   iStaCnt: integer;
   iTotalCnt: integer;

   fMorningLineTo1: double;
   fMorningLineTo1Probability: double;

   fMorningLineTo1Fair: double;
   fMorningLineTo1FairProbability: double;


   fTotalMorningLineTo1Probability: double;

   fFinalLineTo1FairProbability: double;
   fTotalFinalLineTo1Probability: double;
   fFinalWinPct: double;
   fFinalLineTo1: double;
   fFinalLineTo1Probability: double;
   fFinalLineTo1Fair: double;


   //   fFinalWinPct: double;

   fProbability: double;
   fOdds: double;
   fProbabilityOccuring: double;
   fProbabilityNotOccuring: double;

   fTakeOut: double;
   fMLWinPct: double;
   sMLOrderKey: string;

   fA: double;
   fP: double;
   fME: double;
   fO: double;
   fBetAmt: double;
   fWinPct: double;
   fLossPct: double;
   fLossProbability: double;
   fWinProbability: double;
   fBetUnit: double;
   fExpectedProfitLossPct: double;

   fWinProb: double;
   fWinOdds: double;
   fLossProb: double;
   fUnitStake: double;
   fUnitLoss: double;
   fExpectation: double;
   fEdge: double;

   fFinalAvgWinOdds: double;
   fFinalAvgOdds: double;

   iMorningLineTo1FairSampleSize: integer;

   fTodaysWagerLineTo1FairProbability: double;
   fTotalTodaysWagerLineTo1Probability: double;
   fTodaysWagerWinPct: double;
   fTodaysWagerLineTo1: double;
   fTodaysWagerLineTo1Probability: double;
   fTodaysWagerLineTo1Fair: double;
   fTodaysWagerAvgWinOdds: double;
   fTodaysWagerAvgOdds: double;

   procedure SetFlds();
   begin

      tblE.FieldByName('EstMorningLineStarts').AsInteger := tblF.FieldByName('Starts').AsInteger;
      tblE.FieldByName('EstMorningLineWins').AsInteger := tblF.FieldByName('Wins').AsInteger;
      tblE.FieldByName('EstMorningLineWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
      tblE.FieldByName('EstMorningLineAvgOdds').AsFloat := tblF.FieldByName('AvgOdds').AsFloat;
      tblE.FieldByName('EstMorningLineMinOdds').AsFloat := tblF.FieldByName('MinOdds').AsFloat;
      tblE.FieldByName('EstMorningLineMaxOdds').AsFloat := tblF.FieldByName('MaxOdds').AsFloat;
      tblE.FieldByName('EstMorningLineAvgWinOdds').AsFloat := tblF.FieldByName('AvgWinOdds').AsFloat;
      tblE.FieldByName('EstMorningLineMinWinOdds').AsFloat := tblF.FieldByName('MinWinOdds').AsFloat;
      tblE.FieldByName('EstMorningLineMaxWinOdds').AsFloat := tblF.FieldByName('MaxWinOdds').AsFloat;
      tblE.FieldByName('EstMorningLineValueBet').AsFloat := tblF.FieldByName('ValueBet').AsFloat;
      tblE.FieldByName('EstMorningLineIV').AsFloat := tblF.FieldByName('IV').AsFloat;
      tblE.FieldByName('EstMorningLineIVRoi').AsFloat := tblF.FieldByName('IVRoi').AsFloat;

   end;

   procedure ZeroFlds();
   begin
      iMorningLineTo1FairSampleSize := 0;
      fMorningLineTo1Fair := 0;
      fMorningLineTo1FairProbability := 0;

      tblE.FieldByName('EstMorningLineOrderKey').AsString := '';
      tblE.FieldByName('EstMorningLineStarts').AsInteger := 0;
      tblE.FieldByName('EstMorningLineWins').AsInteger := 0;
      tblE.FieldByName('EstMorningLineWinPct').AsFloat := 0;
      tblE.FieldByName('EstMorningLineAvgOdds').AsFloat := 0;
      tblE.FieldByName('EstMorningLineMinOdds').AsFloat := 0;
      tblE.FieldByName('EstMorningLineMaxOdds').AsFloat := 0;
      tblE.FieldByName('EstMorningLineAvgWinOdds').AsFloat := 0;
      tblE.FieldByName('EstMorningLineMinWinOdds').AsFloat := 0;
      tblE.FieldByName('EstMorningLineMaxWinOdds').AsFloat := 0;
      tblE.FieldByName('EstMorningLineValueBet').AsFloat := 0;
      tblE.FieldByName('EstMorningLineIV').AsFloat := 0;
      tblE.FieldByName('EstMorningLineIVRoi').AsFloat := 0;

   end;

begin
   exit;
   hLog.AddToLog('UpdateOddsProbability', msevOperation);

   try
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblF);

      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblF);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Odds Probability Step One - ' +
                  tblE.FieldByName('TrkCode').AsString + ' ' +
                  tblE.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblE.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
               Application.ProcessMessages();
               iStaCnt := 0;
            end else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;

            IncPrgBar();
            tblE.Edit();

            fMorningLineTo1FairProbability := 0;
            fMorningLineTo1Fair := 0;

            fFinalLineTo1Fair := 0;
            fFinalLineTo1FairProbability := 0;

            fTodaysWagerLineTo1Fair := 0;
            fTodaysWagerLineTo1FairProbability := 0;

            //            sMLOrderKey := GetMorningLineKey(tblR, tblE);
            //sMLOrderKey := GetTodaysWinPctRank(tblR, tblE);

            tblF.IndexName := '';
            tblF.SetKey();
            tblF.FieldByName('OrderKey').AsString := sMLOrderKey;
            if (tblF.GotoKey()) then begin
               tblE.FieldByName('EstMorningLineOrderKey').AsString := tblF.FieldByName('OrderKey').AsString;
               SetFlds();
            end else begin
               ZeroFlds();
            end;

            // Default to morning line
            fMorningLineTo1 := tblE.FieldByName('MorningLineTo1').AsFloat;
            if (fMorningLineTo1 > 0) then begin
               fMorningLineTo1Probability := (1 / (1 + fMorningLineTo1));
            end;

            // Calculate Best Guess On Actual Odds
            iMorningLineTo1FairSampleSize := tblF.FieldByName('Starts').AsInteger;

            // Compensate for longshot/favorite ML bias
            if (fMorningLineTo1 < 3.5) then begin
               fMorningLineTo1Fair := tblF.FieldByName('AvgWinOdds').AsFloat;
            end else begin
               fMorningLineTo1Fair := tblF.FieldByName('AvgOdds').AsFloat;
            end;
            if (fMorningLineTo1Fair > 0) then begin
               fMorningLineTo1FairProbability := (1 / (1 + fMorningLineTo1Fair));
            end;

            tblE.FieldByName('MorningLineTo1Probability').AsFloat := RoundTo(fMorningLineTo1Probability, -4);
            tblE.FieldByName('MorningLineTo1FairProbability').AsFloat := RoundTo(fMorningLineTo1FairProbability, -4);
            tblE.FieldByName('MorningLineTo1Fair').AsFloat := Trunc(fMorningLineTo1Fair);

            // Defaults first
            // Odds against = probability(event does not occur) /(1-probability(event does not occur))
            fProbabilityOccuring := (tblE.FieldByName('FinalWinPct').AsFloat / 100);
            if (fProbabilityOccuring = 0) then begin
               fProbabilityOccuring := 0.001;
            end;
            if ((1 - fProbabilityNotOccuring > 0)) then begin
               fFinalLineTo1Fair := (fProbabilityNotOccuring / (1 - fProbabilityNotOccuring));
            end else begin
               fFinalLineTo1Fair := 0;
            end;
            if (fFinalLineTo1Fair > 0) then begin
               fFinalLineTo1FairProbability := (1 / (1 + fFinalLineTo1Fair));
            end;

            // tblE.FieldByName('FinalLineTo1Fair').AsFloat := RoundTo(fFinalLineTo1Fair, 0);
            // tblE.FieldByName('FinalLineTo1FairProbability').AsFloat := RoundTo(fFinalLineTo1FairProbability, -4) ;
            // tblE.FieldByName('FinalLineTo1Fair').AsFloat := RoundTo(fFinalLineTo1Fair, 0);
            // tblE.FieldByName('FinalLineTo1FairProbability').AsFloat := RoundTo(fFinalLineTo1FairProbability, -4)  ;


            // Compensate for longshot/favorite ML bias
            fTodaysWagerAvgWinOdds := tblE.FieldByName('TodaysWagerAvgWinOdds').AsFloat;
            fTodaysWagerAvgOdds := tblE.FieldByName('TodaysWagerAvgOdds').AsFloat;
            if (fTodaysWagerAvgWinOdds > 0) and (fTodaysWagerAvgOdds > 0) then begin
               if (fMorningLineTo1 < 3.5) then begin
                  fTodaysWagerLineTo1Fair := fTodaysWagerAvgWinOdds;
               end else begin
                  fTodaysWagerLineTo1Fair := fTodaysWagerAvgOdds;
               end;
               if (fTodaysWagerLineTo1Fair > 0) then begin
                  fTodaysWagerLineTo1FairProbability := (1 / (1 + fTodaysWagerLineTo1Fair));
               end;
            end;

            fProbabilityOccuring := (tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100);
            if (fProbabilityOccuring = 0) then begin
               fProbabilityOccuring := 0.001;
            end;
            fProbabilityNotOccuring := (1 - fProbabilityOccuring);
            if ((1 - fProbabilityNotOccuring > 0)) then begin
               fTodaysWagerLineTo1Fair := (fProbabilityNotOccuring / (1 - fProbabilityNotOccuring));
            end;

            // For now they are the same
            tblE.FieldByName('TodaysWagerLineTo1Fair').AsFloat := RoundTo(fTodaysWagerLineTo1Fair, 0);
            tblE.FieldByName('TodaysWagerLineTo1FairProbability').AsFloat := RoundTo(fTodaysWagerLineTo1FairProbability, -4);

            tblE.FieldByName('TodaysWagerLineTo1Fair').AsFloat := RoundTo(fTodaysWagerLineTo1Fair, 0);
            tblE.FieldByName('TodaysWagerLineTo1FairProbability').AsFloat := RoundTo(fTodaysWagerLineTo1FairProbability, -4);

            // Mathematical expectation (ME) is positive if the bettor has an edge and negative
            // if the bookmaker has an edge. A zero sum game is one in which both sides have 0%
            // expectation. It is given by the following equation where:
            // fME = (1 + A) * P - 1
            // fP = Probability of winning.
            // fA = (fOdds/fBetAmt) Amount you can win / Amount you can Lose

            // So if you believe a 5/1 horse to be a 4/1 shot then
            // fP = .2 and A = 5 / 1 (where 5 is the money returned on a 1 unit bet and
            //                        1 is the 1 unit lost if the horse fails to win).
            // fME = (1+5) * .2 - 1
            //     = (6) * .2 - 1
            //     = 1.2 -1
            //     = .20
            // Therefore, on average, you will expect to make 20% profit everytime you bet
            // on a 4/1 horse going off at 5/1 at level stakes.
            fA := 0;
            fP := 0;
            fME := 0;

            fP := tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100;
            fOdds := tblE.FieldByName('MorningLineTo1Fair').AsFloat;
            fBetAmt := 1.00;

            fA := fOdds / fBetAmt;
            fME := ((1 + fA) * fP) - 1;
            tblE.FieldByName('TodaysWagerME').AsFloat := RoundTo(fME, -4);

            //fExpectation = (fWinProb x (fWinOdds x fUnitStake)) - (fLossProb x fUnitLoss)
            //fEdge = fExpectation / fWinOdds
            //fWager = 0.5 x fEdge x fBettingBank
            //Example:
            //Expectation = (0.35 x (5/2 x $1)) - (0.65 x $1) = 0.225 (Average gain of 23 cents per wager)
            //Edge = 0.225 / (5/2) = 9%
            //Wager = 0.5 x 0.09 x $2600 = $117
            //where WinProb = 35%, LossProb = 65%, WinOdds = 5/2, UnitStake = $1, UnitLoss = -$1, BettingBank = $2600.
            fWinProb := tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100;
            fWinOdds := tblE.FieldByName('MorningLineTo1Fair').AsFloat;
            fLossProb := 1.00 - fWinProb;
            fUnitStake := 1.00;
            fUnitLoss := 1.00;

            fExpectation := (fWinProb * (fWinOdds * fUnitStake)) - (fLossProb * fUnitLoss);
            if (fWinOdds > 0) then begin
               fEdge := fExpectation / fWinOdds;
            end else begin
               fEdge := 0;
            end;
            tblE.FieldByName('TodaysWagerKellyPct').AsFloat := RoundTo(fEdge, -4);

            // E(X) = (payoff for W)*(prob. of W) + (payoff for L)*(prob. of L)
            //M Pascual
            fWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100;
            fLossPct := 100 - fWinPct;
            fLossProbability := fLossPct / 100;
            fWinProbability := fWinPct / 100;
            fOdds := tblE.FieldByName('MorningLineTo1Fair').AsFloat + 1;
            fBetUnit := 1;
            fExpectedProfitLossPct := (fWinProbability * fOdds) - (fLossProbability * fBetUnit);
            tblE.FieldByName('TodaysWagerExpectedProfitLossPct').AsFloat := RoundTo(fExpectedProfitLossPct, -4);

            //
            //Pari-Mutuel Win-Wagering ROI (For Each Horse)
            //E(ROI) = (value /p) (1-t)  - 1
            //    where:
            //      E(ROI) = expected return on investment per $
            //      = true unknown/“to-be-estimated” probability of winning
            //      p = probability of winning as implied by the betting public’s win-pool wagers
            //      t = track take (typically, 15%-20% with occasional higher values for some exotic bets)
            //     (EstMLFair / TodaysWagerFair) * (1 - .17)) - 1
            fTodaysWagerLineTo1FairProbability := tblE.FieldByName('TodaysWagerLineTo1FairProbability').AsFloat;
            if (fTodaysWagerLineTo1FairProbability <> 0) then begin
               tblE.FieldByName('TodaysWagerExpectedWinRoi').AsFLoat := (fMorningLineTo1FairProbability / fTodaysWagerLineTo1FairProbability) * (1.00 - 0.17) - 1.00;
            end;
            //
            tblE.Post();
            tblE.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();

   end;

end;

end.
