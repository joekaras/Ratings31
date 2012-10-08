unit UnitUpdateWagerProbability;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateWagerProbability
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

procedure UpdateWagerProbability
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
   iStaCnt: integer;
   iTotalCnt: integer;

   fFinalKellyPct: double;
   fAdjustedFinalKellyPct: double;
   fTotalFinalKellyPct: double;
   fEdge: double;
   fBettingBank: double;

   fWagerAmt: double;
   fPlcWagerAmt: double;
   fShoWagerAmt: double;


begin
   hLog.AddToLog('UpdateWagerProbability', msevOperation);

   try
      CloseTableExclusive(tblR);
      CloseTableExclusive(tblE);

      OpenTableExclusive(tblR);
      OpenTableExclusive(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;
         tblE.Filtered := False;
         tblE.Filter := WAGER_FILTER;
         tblE.Filtered := True;

         tblE.First();
         fFinalKellyPct := 0;
         fTotalFinalKellyPct := 0;

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Wager Amounts ' +
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

            // actually normalize all kellys to 100% so total bank per day is 100
            // Translate the "money line" in the newspaper to odds a true line
            // Calculate pProb = probability=odds/(1+odds)
            // Normalize pFAIR* = pProb / sum(pProb)
            fTotalFinalKellyPct := fTotalFinalKellyPct +
               tblE.FieldByName('FinalKellyPct').AsFloat;
            tblE.Next();

         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblE.Filtered := False;
      tblE.Filter := '';
      CloseTableExclusive(tblR);
      CloseTableExclusive(tblE);
      ClearPrgStatusBars();
   end;

   //
   try
      CloseTableExclusive(tblR);
      CloseTableExclusive(tblE);

      OpenTableExclusive(tblR);
      OpenTableExclusive(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
         tblE.Filtered := False;
         tblE.Filter := WAGER_FILTER;
         tblE.Filtered := True;

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Odds Probability Step Three - ' +
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

            fWagerAmt := 0;
            fPlcWagerAmt := 0;
            fShoWagerAmt := 0;

            fFinalKellyPct := 0;
            fAdjustedFinalKellyPct := 0;

            tblE.Edit();

            // Calculate pProb = probability=odds/(1+odds)
            // Normalize pFAIR* = pProb / sum(pProb)
            
            // Half Kelly
            fFinalKellyPct := tblE.FieldByName('FinalKellyPct').AsFloat * 0.5;
            fEdge := tblE.FieldByName('FinalKellyPct').AsFloat * 0.5;
            // if (fTotalFinalKellyPct > 1.00) then begin
            //   fEdge := fFinalKellyPct / fTotalFinalKellyPct;
            //end else begin
            //   fEdge := fFinalKellyPct;
            //end;

            fBettingBank := 100.00;
            fWagerAmt := RoundTo((fEdge * fBettingBank), 0);
            fPlcWagerAmt := fWagerAmt;
            fShoWagerAmt := fWagerAmt;
            if (fWagerAmt < 2.00) then begin
               fWagerAmt := 0;
               fPlcWagerAmt := 0;
               fShoWagerAmt := 0;
               tblE.FieldByName('IsTipSheetSelected').AsBoolean := False;
               tblE.FieldByName('IsAngleSheetSelected').AsBoolean := False;
               tblE.FieldByName('Wager').AsString := 'NO BET';
            end;

            tblE.FieldByName('WagerAmt').AsFloat := fWagerAmt;
            tblE.FieldByName('PlcWagerAmt').AsFloat := fPlcWagerAmt;
            tblE.FieldByName('ShoWagerAmt').AsFloat := fShoWagerAmt;

            // Add these fields to entry and hh
            //tblE.FieldByName('AdjustedFinalKellyPct').AsFloat := fAdjustedFinalKellyPct;
            //tblE.FieldByName('TotalFinalKellyPct').AsFloat := fTotalFinalKellyPct;

            tblE.Post();
            tblE.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblE.Filtered := False;
      tblE.Filter := '';
      CloseTableExclusive(tblR);
      CloseTableExclusive(tblE);
      ClearPrgStatusBars();

   end;

end;



end.

