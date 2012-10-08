unit unitUpdateOddsProbablity;

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

   fFinalLineTo1: double;
   fFinalLineTo1Probability: double;

   fFinalLineTo1Fair: double;
   fFinalLineTo1FairProbability: double;

   fTotalMorningLineTo1Probability: double;
   fTotalFinalLineTo1Probability: double;

   fFinalWinPct: double;
   fProbability: double;
   fOdds: double;

   fTakeOut: double;
   fMLWinPct: double;
   sMlOrderKey: string;   
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
            tblE.FieldByName('MorningLineTo1FairProbability').AsFloat := RoundTo(fMorningLineTo1FairProbability, -2); 
            tblE.FieldByName('MorningLineTo1Fair').AsFloat := fMorningLineTo1Fair;
   

           // odds against = probability(event does not occur) /(1-probability(event does not occur))
   
            fFinalLineTo1Fair  := 
            tblE.FieldByName('FinalLineTo1Fair').AsFloat := fFinalLineTo1Fair ;
            tblE.FieldByName('FinalLineTo1FairProbability').AsFloat := RoundTo(tblE.FieldByName('FinalWinPct').AsFloat / 100, -2);
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



