unit UnitUpdateWagerProabilities;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateWagers
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

procedure UpdateWagers
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

   fFinalLineTo1: double;
   fFinalLineTo1Probability: double;

   fFinalLineTo1Fair: double;
   fFinalLineTo1FairProbability: double;

   fTotalMorningLineTo1Probability: double;
   fTotalFinalLineTo1Probability: double;

   fFinalWinPct: double;
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

begin
   hLog.AddToLog('UpdateOddsProbability', msevOperation);

   try
      CloseTableExclusive(tblR);
      CloseTableExclusive(tblE);
      CloseTableExclusive(tblF);

      OpenTableExclusive(tblR);
      OpenTableExclusive(tblE);
      OpenTableExclusive(tblF);

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

            fMorningLineTo1FairProbability := 0;
            fMorningLineTo1Fair := 0;

            fFinalLineTo1Fair := 0;
            fFinalLineTo1FairProbability := 0;

            fMorningLineTo1 := tblE.FieldByName('MorningLineTo1').AsFloat;
            if (fMorningLineTo1 > 0) then begin
               fMorningLineTo1Probability := 1 / (1 + fMorningLineTo1);
            end;

            sMLOrderKey := GetMorningLineKey(tblR, tblE);
            tblF.IndexName := '';
            tblF.SetKey();
            tblF.FieldByName('OrderKey').AsString := sMLOrderKey;
            if (tblF.GotoKey()) then begin
               fMorningLineTo1Fair := tblF.FieldByName('AvgOdds').AsFloat;
               fMorningLineTo1FairProbability := tblF.FieldByName('WinPct').AsFloat / 100;
            end else begin
               fMorningLineTo1Fair := 0;
               fMorningLineTo1FairProbability := 0;
            end;

            //            tblR.IndexName := '';
            //            tblR.SetKey();
            //            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            //            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            //            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            //            if tblR.GotoKey() then begin
            //            end;

            tblE.Edit();
            tblE.FieldByName('MorningLineTo1Probability').AsFloat := RoundTo(fMorningLineTo1Probability, -4);
            tblE.FieldByName('MorningLineTo1FairProbability').AsFloat := RoundTo(fMorningLineTo1FairProbability, -4);
            tblE.FieldByName('MorningLineTo1Fair').AsFloat := RoundTo(fMorningLineTo1Fair, -2);

            // odds against = probability(event does not occur) /(1-probability(event does not occur))
            fProbabilityOccuring := (tblE.FieldByName('FinalWinPct').AsFloat / 100);
            fProbabilityNotOccuring := 1 - fProbabilityOccuring;
            if ((1 - fProbabilityNotOccuring > 0)) then begin
               fFinalLineTo1Fair := fProbabilityNotOccuring / (1 - fProbabilityNotOccuring);
            end else begin
               fFinalLineTo1Fair := 0;
            end;

            // For now they are the same
            tblE.FieldByName('FinalLineTo1').AsFloat := RoundTo(fFinalLineTo1Fair, -2);
            tblE.FieldByName('FinalLineTo1Probability').AsFloat := RoundTo(tblE.FieldByName('FinalWinPct').AsFloat / 100, -4);

            tblE.FieldByName('FinalLineTo1Fair').AsFloat := RoundTo(fFinalLineTo1Fair, -2);
            tblE.FieldByName('FinalLineTo1FairProbability').AsFloat := RoundTo(tblE.FieldByName('FinalWinPct').AsFloat / 100, -4);


            //Mathematical expectation (ME) is positive if the bettor has an edge and negative
            //if the bookmaker has an edge. A zero sum game is one in which both sides have 0%
            //expectation. It is given by the following equation where:
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

            fP := tblE.FieldByName('FinalWinPct').AsFloat / 100;
            fOdds := tblE.FieldByName('MorningLineTo1Fair').AsFloat;
            fBetAmt := 1.00;

            fA := fOdds / fBetAmt;
            fME := ((1 + fA) * fP) - 1;
            tblE.FieldByName('FinalME').AsFloat := RoundTo(fME, -4);

            //Staking Based on Value
            //Kellys formula basically says the better the value of a
            //selection the larger the proportion of your betting pool you
            //should put on.
            // Value is defined as the ratio of your probability of winning
            //versus the odds that are available
            // fA = fP - (1 - fP )/(fO - 1)
            //Where
            //fA = Proportion of betting fund
            //fP = Probability of winning (our opinion)
            //fO = Decimal odds (including stake return)
            fA := 0;
            fP := 0;
            fO := 0;

            fP := tblE.FieldByName('FinalWinPct').AsFloat / 100;
            fO := tblE.FieldByName('MorningLineTo1Fair').AsFloat + 1;
            if ((fO - 1) <> 0) then begin
               fA := fP - ((1 - fP) / (fO - 1));
            end;
            tblE.FieldByName('FinalKellyPct').AsFloat := RoundTo(fA, -4);

            //             E(X) = (payoff for W)*(prob. of W) + (payoff for L)*(prob. of L)

                        //M Pascual
            fWinPct := tblE.FieldByName('FinalWinPct').AsFloat;
            fLossPct := 100 - fWinPct;
            fLossProbability := fLossPct / 100;
            fWinProbability := fWinPct / 100;
            fOdds := tblE.FieldByName('MorningLineTo1Fair').AsFloat + 1;
            fBetUnit := 1;
            fExpectedProfitLossPct := (fWinProbability * fOdds) - (fLossProbability * fBetUnit);
            tblE.FieldByName('FinalExpectedProfitLossPct').AsFloat := RoundTo(fExpectedProfitLossPct, -4);

            tblE.Post();

            tblE.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      CloseTableExclusive(tblR);
      CloseTableExclusive(tblE);
      ClearPrgStatusBars();

   end;


   // calc probabilities based on ml odds and final win pct
   //try
   //   CloseTableExclusive(tblR);
   //   CloseTableExclusive(tblE);
   //
   //   OpenTableExclusive(tblR);
   //   OpenTableExclusive(tblE);
   //
   //   try
   //      InitPrgBar(tblE.RecordCount);
   //      iStaCnt := 0;
   //      iTotalCnt := 0;
   //
   //      tblE.First();
   //      while not tblE.Eof do begin
   //         if (iStaCnt > BATCH_SIZE) then begin
   //            staBar.SimpleText := 'Updating Odds Probability Step One - ' +
   //               tblE.FieldByName('TrkCode').AsString + ' ' +
   //               tblE.FieldByName('RaceDate').AsString + ' Race # ' +
   //               tblE.FieldByName('RaceNbr').AsString + ' ' +
   //               IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
   //            Application.ProcessMessages();
   //            iStaCnt := 0;
   //         end else begin
   //            Application.ProcessMessages();
   //            Inc(iStaCnt);
   //            Inc(iTotalCnt);
   //         end;
   //
   //         IncPrgBar();
   //
   //
   //         // Translate the "money line" in the newspaper to odds a true line
   //         // Calculate pProb = 1/(1+Odds) for each odds line - done here
   //         // Normalize pFAIR* = pProb / sum(pProb)
   //
   //         tblE.Edit();
   //         fMorningLineTo1 := 0;
   //         fMorningLineTo1Probability := 0;
   //         fMorningLineTo1 := tblE.FieldByName('MorningLineTo1').AsFloat;
   //
   //         // probability=odds/(1+odds)
   //         // probability=odds/(1+odds)
   //
   //         if (fMorningLineTo1 > 0) then begin
   //            //               fMorningLineTo1Probability := RoundTo(fMorningLineTo1 / (1 + fMorningLineTo1), -2);
   //
   //            fMorningLineTo1Probability := RoundTo(1 / fMorningLineTo1 + 1, -2);
   //
   //
   //            //               [(1-TakeOut/Win%)-1]
   //         end else begin
   //            fMorningLineTo1Probability := 0;
   //         end;
   //
   //         fFinalLineTo1 := 0;
   //         fFinalLineTo1Probability := 0;
   //         fFinalWinPct := tblE.FieldByName('FinalWinPct').AsFloat;
   //
   //         // odds=probability/(1-probability)
   //         if (fFinalWinPct > 0) then begin
   //            fProbability := fFinalWinPct / 100;
   //            fOdds := fProbability / (1 - fProbability);
   //            //             odds against = (1/probability) -1
   //            //             [(1-TakeOut/Win%)-1]
   //            fFinalLineTo1 := RoundTo((1 - 0.022 / fOdds) - 1, -2);
   //            fFinalLineTo1 := RoundTo(fOdds, -2);
   //         end else begin
   //            fFinalLineTo1 := 0;
   //         end;
   //
   //         // probability=odds/(1+odds)
   //         if (fFinalLineTo1 > 0) then begin
   //            fFinalLineTo1Probability := fFinalWinPct / 100;
   //         end else begin
   //            fFinalLineTo1Probability := 0;
   //         end;
   //
   //         tblE.FieldByName('MorningLineTo1Probability').AsFloat := fMorningLineTo1Probability;
   //         tblE.FieldByName('FinalLineTo1').AsFloat := fFinalLineTo1;
   //         tblE.FieldByName('FinalLineTo1Probability').AsFloat := fFinalLineTo1Probability;
   //
   //         tblE.Post();
   //
   //         tblE.Next();
   //      end;
   //
   //   except
   //      on E: Exception do begin
   //         hLog.AddToLog(E.Message, msevException);
   //      end;
   //   end;
   //
   //finally
   //   CloseTableExclusive(tblR);
   //   CloseTableExclusive(tblE);
   //   ClearPrgStatusBars();
   //end;
   //
   // Get the sum of probabilities
   //try
   //   CloseTableExclusive(tblR);
   //   CloseTableExclusive(tblE);
   //
   //   OpenTableExclusive(tblR);
   //   OpenTableExclusive(tblE);
   //
   //   try
   //      InitPrgBar(tblE.RecordCount);
   //      iStaCnt := 0;
   //      iTotalCnt := 0;
   //      fTotalMorningLineTo1Probability := 0;
   //      fTotalFinalLineTo1Probability := 0;
   //
   //      tblE.First();
   //      iPrevRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
   //      sPrevTrkCode := tblE.FieldByName('TrkCode').AsString;
   //
   //      while not tblE.Eof do begin
   //         if (iStaCnt > BATCH_SIZE) then begin
   //            staBar.SimpleText := 'Updating Odds Probability Step Two - ' +
   //               tblE.FieldByName('TrkCode').AsString + ' ' +
   //               tblE.FieldByName('RaceDate').AsString + ' Race # ' +
   //               tblE.FieldByName('RaceNbr').AsString + ' ' +
   //               IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
   //            Application.ProcessMessages();
   //            iStaCnt := 0;
   //         end else begin
   //            Application.ProcessMessages();
   //            Inc(iStaCnt);
   //            Inc(iTotalCnt);
   //         end;
   //
   //         IncPrgBar();
   //
   //         fMorningLineTo1 := 0;
   //         fMorningLineTo1Probability := 0;
   //
   //         fFinalLineTo1 := 0;
   //         fFinalLineTo1Probability := 0;
   //
   //         iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
   //         sTrkCode := tblE.FieldByName('TrkCode').AsString;
   //
   //
   //         // Translate the "money line" in the newspaper to odds a true line
   //         // Calculate pProb = probability=odds/(1+odds)
   //
   //         // Normalize pFAIR* = pProb / sum(pProb)
   //
   //         if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin
   //
   //            fMorningLineTo1Probability := tblE.FieldByName('MorningLineTo1Probability').AsFloat;
   //            fFinalLineTo1Probability := tblE.FieldByName('FinalLineTo1Probability').AsFloat;
   //
   //            fTotalMorningLineTo1Probability := fTotalMorningLineTo1Probability + fMorningLineTo1Probability;
   //            fTotalFinalLineTo1Probability := fTotalFinalLineTo1Probability + fFinalLineTo1Probability;
   //
   //            iPrevRaceNbr := iRaceNbr;
   //            sPrevTrkCode := sTrkCode;
   //
   //         end else begin
   //            tblR.IndexName := '';
   //            tblR.SetKey();
   //            tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
   //            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   //            tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
   //            if tblR.GotoKey() then begin
   //               tblR.Edit();
   //               tblR.FieldByName('TotalMorningLineTo1Probability').AsFloat := fTotalMorningLineTo1Probability;
   //               tblR.FieldByName('TotalFinalLineTo1Probability').AsFloat := fTotalFinalLineTo1Probability;
   //               tblR.Post();
   //            end;
   //
   //            iPrevRaceNbr := iRaceNbr;
   //            sPrevTrkCode := sTrkCode;
   //
   //            fTotalMorningLineTo1Probability := 0;
   //            fTotalFinalLineTo1Probability := 0;
   //
   //            fMorningLineTo1Probability := tblE.FieldByName('MorningLineTo1Probability').AsFloat;
   //            fFinalLineTo1Probability := tblE.FieldByName('FinalLineTo1Probability').AsFloat;
   //
   //            fTotalMorningLineTo1Probability := fTotalMorningLineTo1Probability + fMorningLineTo1Probability;
   //            fTotalFinalLineTo1Probability := fTotalFinalLineTo1Probability + fFinalLineTo1Probability;
   //
   //         end;
   //
   //         tblE.Next();
   //
   //      end;
   //   except
   //      on E: Exception do begin
   //         hLog.AddToLog(E.Message, msevException);
   //      end;
   //   end;
   //
   //finally
   //   tblR.IndexName := '';
   //   tblR.SetKey();
   //   tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
   //   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   //   tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
   //   if tblR.GotoKey() then begin
   //      tblR.Edit();
   //      tblR.FieldByName('TotalMorningLineTo1Probability').AsFloat := fTotalMorningLineTo1Probability;
   //      tblR.FieldByName('TotalFinalLineTo1Probability').AsFloat := fTotalFinalLineTo1Probability;
   //      tblR.Post();
   //   end;
   //   CloseTableExclusive(tblR);
   //   CloseTableExclusive(tblE);
   //   ClearPrgStatusBars();
   //end;

   // calc fair odds / probabilities
   //try
   //   CloseTableExclusive(tblR);
   //   CloseTableExclusive(tblE);
   //
   //   OpenTableExclusive(tblR);
   //   OpenTableExclusive(tblE);
   //
   //   try
   //      InitPrgBar(tblE.RecordCount);
   //      iStaCnt := 0;
   //      iTotalCnt := 0;
   //
   //      tblE.First();
   //      while not tblE.Eof do begin
   //         if (iStaCnt > BATCH_SIZE) then begin
   //            staBar.SimpleText := 'Updating Odds Probability Step Three - ' +
   //               tblE.FieldByName('TrkCode').AsString + ' ' +
   //               tblE.FieldByName('RaceDate').AsString + ' Race # ' +
   //               tblE.FieldByName('RaceNbr').AsString + ' ' +
   //               IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
   //            Application.ProcessMessages();
   //            iStaCnt := 0;
   //         end else begin
   //            Application.ProcessMessages();
   //            Inc(iStaCnt);
   //            Inc(iTotalCnt);
   //         end;
   //
   //         IncPrgBar();
   //
   //         fMorningLineTo1FairProbability := 0;
   //         fMorningLineTo1Fair := 0;
   //
   //         fFinalLineTo1Fair := 0;
   //         fFinalLineTo1FairProbability := 0;
   //
   //         tblR.IndexName := '';
   //         tblR.SetKey();
   //         tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   //         tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   //         tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
   //         if tblR.GotoKey() then begin
   //
   //            fTotalMorningLineTo1Probability := tblR.FieldByName('TotalMorningLineTo1Probability').AsFloat;
   //            fMorningLineTo1Probability := tblE.FieldByName('MorningLineTo1Probability').AsFloat;
   //
   //            if (fTotalMorningLineTo1Probability > 0) then begin
   //               fMorningLineTo1FairProbability := fMorningLineTo1Probability / fTotalMorningLineTo1Probability;
   //               if (fMorningLineTo1FairProbability > 0) then begin
   //                  // odds=probability/(1-probability)
   //                  fMorningLineTo1Fair := fMorningLineTo1FairProbability /
   //                     (1 - fMorningLineTo1FairProbability);
   //
   //               end;
   //            end else begin
   //               fMorningLineTo1FairProbability := 0;
   //               fMorningLineTo1Fair := 0;
   //            end;
   //
   //            fTotalFinalLineTo1Probability := tblR.FieldByName('TotalFinalLineTo1Probability').AsFloat;
   //            fFinalLineTo1Probability := tblE.FieldByName('FinalLineTo1Probability').AsFloat;
   //            if (fTotalFinalLineTo1Probability > 0) then begin
   //               fFinalLineTo1FairProbability := fFinalLineTo1Probability / (1 - fTotalFinalLineTo1Probability);
   //               // odds=probability/(1-probability)
   //               if (fFinalLineTo1FairProbability > 0) then begin
   //                  fFinalLineTo1Fair := fFinalLineTo1FairProbability /
   //                     (1 - fFinalLineTo1FairProbability);
   //
   //               end;
   //            end else begin
   //               fFinalLineTo1FairProbability := 0;
   //               fFinalLineTo1Fair := 0;
   //            end;
   //
   //            fTakeOut := 0.22;
   //
   //            fMorningLineTo1 := tblE.FieldByName('MorningLineTo1').AsFloat;
   //
   //            fMLWinPct := 1 / fMorningLineTo1;
   //            fFinalWinPct := tblE.FieldByName('FinalWinPct').AsFloat / 100;
   //            try
   //               fFinalLineTo1FairProbability := ((1 - fTakeOut) / fFinalWinPct) - 1;
   //            except
   //               fFinalLineTo1FairProbability := 0;
   //            end;
   //
   //            try
   //               fMorningLineTo1FairProbability := ((1 - fTakeOut) / fMLWinPct) - 1;
   //            except
   //               fMorningLineTo1FairProbability := 0;
   //            end;
   //
   //            try
   //               fFinalLineTo1Fair := (1 / fFinalLineTo1FairProbability) - 1;
   //            except
   //               fFinalLineTo1Fair := 0;
   //            end;
   //
   //            try
   //               fMorningLineTo1Fair := (1 / fMorningLineTo1FairProbability) - 1;
   //            except
   //               fFinalLineTo1Fair := 0;
   //            end;
   //
   //            //             odds against = (1/probability) -1
   //
   //            //about 7/5 on the board.[(1-TakeOut./Win%) -1], or [(1-0.22/0.33) -1] = 1.36 (which is
   //                           //             [(1-TakeOut/Win%)-1]
   //
   //         end;
   //
   //         tblE.Edit();
   //         tblE.FieldByName('MorningLineTo1FairProbability').AsFloat := fMorningLineTo1FairProbability;
   //         tblE.FieldByName('MorningLineTo1Fair').AsFloat := fMorningLineTo1Fair;
   //
   //         tblE.FieldByName('FinalLineTo1Fair').AsFloat := fFinalLineTo1Fair;
   //         tblE.FieldByName('FinalLineTo1FairProbability').AsFloat := fFinalLineTo1FairProbability;
   //         tblE.Post();
   //         tblE.Next();
   //      end;
   //
   //   except
   //      on E: Exception do begin
   //         hLog.AddToLog(E.Message, msevException);
   //      end;
   //   end;
   //
   //finally
   //   CloseTableExclusive(tblR);
   //   CloseTableExclusive(tblE);
   //   ClearPrgStatusBars();
   //
   //end;

end;



end.
 
