unit UnitUpdateLines;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateProbabilityLines
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;


procedure UpdateProbabilityLines
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
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

   fMorningLineProbability: double;
   fTodaysWagerProbability: double;
   fTodaysWagerLineTo1Fair: double;
   fMorningLineProbabilitySquared: double;
   fTodaysWagerProbabilitySquared: double;

   fFinalProbability: double;
   fClassRating: double;
   fTurfRating: double;
   fMudRating: double;

   fTotalMorningLineProbability: double;
   fTotalTodaysWagerProbability: double;

   fNormalTotalMorningLineProbabilitySquared: double;
   fNormalTotalTodaysWagerProbabilitySquared: double;

   fTotalFinalProbability: double;

   fTotalClassRating: double;
   fTotalTurfRating: double;
   fTotalMudRating: double;

   fNormalMorningLineProbability: double;
   fNormalTodaysWagerProbability: double;

   fNormalMorningLineProbabilitySquared: double;
   fNormalTodaysWagerProbabilitySquared: double;

   fNormalFinalProbability: double;

   fNormalMorningLineOdds: double;
   fNormalTodaysWagerOdds: double;

   fNormalMorningLineOddsSquared: double;
   fNormalTodaysWagerOddsSquared: double;

   fNormalFinalOdds: double;

   fNormalClassRating: double;
   fNormalTurfRating: double;
   fNormalMudRating: double;

   fNormalClassOdds: double;
   fNormalTurfOdds: double;
   fNormalMudOdds: double;


begin
   hLog.AddToLog('UpdateValueLines', msevOperation);

   // Get the sum of probabilities
   try
      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
         iPrevRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
         sPrevTrkCode := tblE.FieldByName('TrkCode').AsString;

         fTotalMorningLineProbability := 0;
         fTotalFinalProbability := 0;
         fTotalTodaysWagerProbability := 0;

         fTotalClassRating := 0;
         fTotalTurfRating := 0;
         fTotalMudRating := 0;

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Odds Probability Step Two - ' +
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


            fMorningLineProbability := 0;
            fFinalProbability := 0;
            fTodaysWagerProbability := 0;

            fClassRating := 0;
            fTurfRating := 0;
            fMudRating := 0;

            iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
            sTrkCode := tblE.FieldByName('TrkCode').AsString;


            // Translate the "money line" in the newspaper to odds a true line
            // Calculate pProb = probability=odds/(1+odds)

            // Normalize pFAIR* = pProb / sum(pProb)

            if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin

               fMorningLineProbability := GetMorningLineProbability(tblE.FieldByName('MorningLineTo1').AsFloat);

               if (tblE.FieldByName('FinalWinPct').AsFloat > 0) then begin
                  fFinalProbability := tblE.FieldByName('FinalWinPct').AsFloat / 100;
               end else begin
                  fFinalProbability := 0.01;
               end;

               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat > 0) then begin
                  fTodaysWagerProbability := tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100;
               end else begin
                  fTodaysWagerProbability := 0.01;
               end;

               fClassRating := tblE.FieldByName('ClassRating').AsFloat;
               fTurfRating := tblE.FieldByName('TurfRating').AsFloat;
               fMudRating := tblE.FieldByName('MudRating').AsFloat;

               fTotalMorningLineProbability := fTotalMorningLineProbability + fMorningLineProbability;
               fTotalFinalProbability := fTotalFinalProbability + fFinalProbability;
               fTotalTodaysWagerProbability := fTotalTodaysWagerProbability + fTodaysWagerProbability;

               fTotalClassRating := fTotalClassRating + fClassRating;
               fTotalTurfRating := fTotalTurfRating + fTurfRating;
               fTotalMudRating := fTotalMudRating + fMudRating;

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;

            end else begin
               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
               if tblR.GotoKey() then begin
                  tblR.Edit();
                  tblR.FieldByName('TotalMorningLineProbability').AsFloat := RoundTo(fTotalMorningLineProbability, -4);
                  tblR.FieldByName('TotalFinalProbability').AsFloat := RoundTo(fTotalFinalProbability, -4);
                  tblR.FieldByName('TotalTodaysWagerProbability').AsFloat := RoundTo(fTotalTodaysWagerProbability, -4);
                  tblR.FieldByName('TotalClassRating').AsFloat := RoundTo(fTotalClassRating, -4);
                  tblR.FieldByName('TotalTurfRating').AsFloat := RoundTo(fTotalTurfRating, -4);
                  tblR.FieldByName('TotalMudRating').AsFloat := RoundTo(fTotalMudRating, -4);
                  tblR.Post();
               end;

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;

               fTotalFinalProbability := 0;
               fTotalMorningLineProbability := 0;
               fTotalTodaysWagerProbability := 0;
               fTotalClassRating := 0;
               fTotalTurfRating := 0;
               fTotalMudRating := 0;

               fFinalProbability := 0;
               fMorningLineProbability := 0;
               fTodaysWagerProbability := 0;
               fClassRating := 0;
               fTurfRating := 0;
               fMudRating := 0;

               fMorningLineProbability := GetMorningLineProbability(tblE.FieldByName('MorningLineTo1').AsFloat);


               if (tblE.FieldByName('FinalWinPct').AsFloat > 0) then begin
                  fFinalProbability := tblE.FieldByName('FinalWinPct').AsFloat / 100;
               end else begin
                  fFinalProbability := 0.01;
               end;

               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat > 0) then begin
                  fTodaysWagerProbability := tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100;
               end else begin
                  fTodaysWagerProbability := 0.01;
               end;

               fClassRating := tblE.FieldByName('ClassRating').AsFloat;
               fTurfRating := tblE.FieldByName('TurfRating').AsFloat;
               fMudRating := tblE.FieldByName('MudRating').AsFloat;

               fTotalMorningLineProbability := fTotalMorningLineProbability + fMorningLineProbability;
               fTotalFinalProbability := fTotalFinalProbability + fFinalProbability;
               fTotalTodaysWagerProbability := fTotalTodaysWagerProbability + fTodaysWagerProbability;

               fTotalClassRating := fTotalClassRating + fClassRating;
               fTotalTurfRating := fTotalTurfRating + fTurfRating;
               fTotalMudRating := fTotalMudRating + fMudRating;
            end;

            tblE.Next();

         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblR.IndexName := '';
      tblR.SetKey();
      tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
      tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
      tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
      if tblR.GotoKey() then begin
         tblR.Edit();
         tblR.FieldByName('TotalMorningLineProbability').AsFloat := RoundTo(fTotalMorningLineProbability, -4);
         tblR.FieldByName('TotalFinalProbability').AsFloat := RoundTo(fTotalFinalProbability, -4);
         tblR.FieldByName('TotalTodaysWagerProbability').AsFloat := RoundTo(fTotalTodaysWagerProbability, -4);
         tblR.FieldByName('TotalClassRating').AsFloat := RoundTo(fTotalClassRating, -4);
         tblR.FieldByName('TotalTurfRating').AsFloat := RoundTo(fTotalTurfRating, -4);
         tblR.FieldByName('TotalMudRating').AsFloat := RoundTo(fTotalMudRating, -4);
         tblR.Post();
      end;
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();
   end;

   // calc fair odds / probabilities
   try
      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
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


            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin

               fTotalMorningLineProbability := tblR.FieldByName('TotalMorningLineProbability').AsFloat;
               fTotalFinalProbability := tblR.FieldByName('TotalFinalProbability').AsFloat;
               fTotalTodaysWagerProbability := tblR.FieldByName('TotalTodaysWagerProbability').AsFloat;
               fTotalClassRating := tblR.FieldByName('TotalClassRating').AsFloat;
               fTotalTurfRating := tblR.FieldByName('TotalTurfRating').AsFloat;
               fTotalMudRating := tblR.FieldByName('TotalMudRating').AsFloat;

               fMorningLineProbability := GetMorningLineProbability(tblE.FieldByName('MorningLineTo1').AsFloat);

               if (tblE.FieldByName('FinalWinPct').AsFloat > 0) then begin
                  fFinalProbability := tblE.FieldByName('FinalWinPct').AsFloat / 100;
               end else begin
                  fFinalProbability := 0.01;
               end;

               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat > 0) then begin
                  fTodaysWagerProbability := tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100;
               end else begin
                  fTodaysWagerProbability := 0.01;
               end;

               fClassRating := tblE.FieldByName('ClassRating').AsFloat;
               fTurfRating := tblE.FieldByName('TurfRating').AsFloat;
               fMudRating := tblE.FieldByName('MudRating').AsFloat;

               //(Odds = 1 / W% - 1)     odds = prob/(1-prob)
               if (fTotalMorningLineProbability > 0) then begin
                  fNormalMorningLineProbability := fMorningLineProbability / fTotalMorningLineProbability;
                  if (fNormalMorningLineProbability > 0) then begin
                     fNormalMorningLineOdds := (1 / fNormalMorningLineProbability) - 1;
                  end else begin
                     fNormalMorningLineOdds := 0;
                  end;
               end else begin
                  fNormalMorningLineProbability := 0;
                  fNormalMorningLineOdds := 0;
               end;

               if (fTotalFinalProbability > 0) then begin
                  fNormalFinalProbability := fFinalProbability / fTotalFinalProbability;
                  if (fNormalFinalProbability > 0) then begin
                     fNormalFinalOdds := (1 / fNormalFinalProbability) - 1;
                  end else begin
                     fNormalFinalOdds := 0;
                  end;
               end else begin
                  fNormalFinalProbability := 0;
                  fNormalFinalOdds := 0;
               end;

               if (fTotalTodaysWagerProbability > 0) then begin
                  fNormalTodaysWagerProbability := fTodaysWagerProbability / fTotalTodaysWagerProbability;
                  if (fNormalTodaysWagerProbability > 0) then begin
                     fNormalTodaysWagerOdds := (1 / fNormalTodaysWagerProbability) - 1;
                  end else begin
                     fNormalTodaysWagerOdds := 0;
                  end;
               end else begin
                  fNormalTodaysWagerProbability := 0;
                  fNormalTodaysWagerOdds := 0;
               end;

               if (fTotalClassRating > 0) then begin
                  fNormalClassRating := fClassRating / fTotalClassRating;
                  if (fNormalClassRating > 0) then begin
                     fNormalClassOdds := (1 / fNormalClassRating) - 1;
                  end else begin
                     fNormalClassOdds := 0;
                  end;
               end else begin
                  fNormalClassRating := 0;
                  fNormalClassOdds := 0;
               end;

               if (fTotalTurfRating > 0) then begin
                  fNormalTurfRating := fTurfRating / fTotalTurfRating;
                  if (fNormalTurfRating > 0) then begin
                     fNormalTurfOdds := (1 / fNormalTurfRating) - 1;
                  end else begin
                     fNormalTurfOdds := 0;
                  end;
               end else begin
                  fNormalTurfRating := 0;
                  fNormalTurfOdds := 0;
               end;

               if (fTotalMudRating > 0) then begin
                  fNormalMudRating := fMudRating / fTotalMudRating;
                  if (fNormalMudRating > 0) then begin
                     fNormalMudOdds := (1 / fNormalMudRating) - 1;
                  end else begin
                     fNormalMudOdds := 0;
                  end;
               end else begin
                  fNormalMudRating := 0;
                  fNormalMudOdds := 0;
               end;
            end;

            if (tblE.FieldByName('TodaysWagerWinPct').AsFloat > 0) then begin
               fTodaysWagerProbability := tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100;
            end else begin
               fTodaysWagerProbability := 0.01;
            end;

            //fTodaysWagerProbability := (tblE.FieldByName('TodaysWagerWinPct').AsFloat / 100);
            fTodaysWagerLineTo1Fair := (1 / fTodaysWagerProbability) - 1;

            tblE.Edit();

            tblE.FieldByName('NormalMorningLineProbability').AsFloat := RoundTo(fNormalMorningLineProbability, -4);
            tblE.FieldByName('NormalFinalProbability').AsFloat := RoundTo(fNormalFinalProbability, -4);
            tblE.FieldByName('NormalTodaysWagerProbability').AsFloat := RoundTo(fNormalTodaysWagerProbability, -4);

            tblE.FieldByName('NormalMorningLineOdds').AsFloat := Trunc((fNormalMorningLineOdds * 1));
            tblE.FieldByName('NormalFinalOdds').AsFloat := Trunc((fNormalFinalOdds * 1));
            tblE.FieldByName('NormalTodaysWagerOdds').AsFloat := Trunc((fNormalTodaysWagerOdds * 1));

            tblE.FieldByName('NormalClassRating').AsFloat := RoundTo(fNormalClassRating, -4);
            tblE.FieldByName('NormalTurfRating').AsFloat := RoundTo(fNormalTurfRating, -4);
            tblE.FieldByName('NormalMudRating').AsFloat := RoundTo(fNormalMudRating, -4);

            tblE.FieldByName('NormalClassOdds').AsFloat := Trunc((fNormalClassOdds * 1));
            tblE.FieldByName('NormalTurfOdds').AsFloat := Trunc((fNormalTurfOdds * 1));
            tblE.FieldByName('NormalMudOdds').AsFloat := Trunc((fNormalMudOdds * 1));

            tblE.FieldByName('NormalMorningLineProbabilitySquared').AsFloat := RoundTo((fNormalMorningLineProbability * 100) * (fNormalMorningLineProbability * 100), -4);
            tblE.FieldByName('NormalTodaysWagerProbabilitySquared').AsFloat := RoundTo((fNormalTodaysWagerProbability * 100) * (fNormalTodaysWagerProbability * 100), -4);

            tblE.FieldByName('MorningLineProbability').AsFloat := RoundTo(fMorningLineProbability, -4);
            tblE.FieldByName('TodaysWagerLineTo1Fair').AsFloat := RoundTo(fTodaysWagerLineTo1Fair, 0);

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
   //
   // Get the sum of probabilities
   try
      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
         iPrevRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
         sPrevTrkCode := tblE.FieldByName('TrkCode').AsString;

         fNormalTotalMorningLineProbabilitySquared := 0;
         fNormalTotalTodaysWagerProbabilitySquared := 0;


         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Odds Probability Step Two - ' +
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


            fNormalMorningLineProbabilitySquared := 0;
            fNormalTodaysWagerProbabilitySquared := 0;


            iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
            sTrkCode := tblE.FieldByName('TrkCode').AsString;


            if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin

               fNormalMorningLineProbabilitySquared := tblE.FieldByName('NormalMorningLineProbabilitySquared').AsFloat;
               fNormalTodaysWagerProbabilitySquared := tblE.FieldByName('NormalTodaysWagerProbabilitySquared').AsFloat;

               fNormalTotalMorningLineProbabilitySquared := fNormalTotalMorningLineProbabilitySquared + fNormalMorningLineProbabilitySquared;
               fNormalTotalTodaysWagerProbabilitySquared := fNormalTotalTodaysWagerProbabilitySquared + fNormalTodaysWagerProbabilitySquared;

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;

            end else begin
               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
               if tblR.GotoKey() then begin
                  tblR.Edit();
                  tblR.FieldByName('NormalTotalMorningLineProbabilitySquared').AsFloat := RoundTo(fNormalTotalMorningLineProbabilitySquared, -4);
                  tblR.FieldByName('NormalTotalTodaysWagerProbabilitySquared').AsFloat := RoundTo(fNormalTotalTodaysWagerProbabilitySquared, -4);
                  tblR.Post();
               end;

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;

               fNormalTotalMorningLineProbabilitySquared := 0;
               fNormalTotalTodaysWagerProbabilitySquared := 0;

               fNormalMorningLineProbabilitySquared := 0;
               fNormalTodaysWagerProbabilitySquared := 0;

               fNormalMorningLineProbabilitySquared := tblE.FieldByName('NormalMorningLineProbabilitySquared').AsFloat;
               fNormalTodaysWagerProbabilitySquared := tblE.FieldByName('NormalTodaysWagerProbabilitySquared').AsFloat;

               fNormalTotalMorningLineProbabilitySquared := fNormalTotalMorningLineProbabilitySquared + fNormalMorningLineProbabilitySquared;
               fNormalTotalTodaysWagerProbabilitySquared := fNormalTotalTodaysWagerProbabilitySquared + fNormalTodaysWagerProbabilitySquared;
            end;

            tblE.Next();

         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblR.IndexName := '';
      tblR.SetKey();
      tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
      tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
      tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
      if tblR.GotoKey() then begin
         tblR.Edit();
         tblR.FieldByName('NormalTotalMorningLineProbabilitySquared').AsFloat := RoundTo(fNormalTotalMorningLineProbabilitySquared, -4);
         tblR.FieldByName('NormalTotalTodaysWagerProbabilitySquared').AsFloat := RoundTo(fNormalTotalTodaysWagerProbabilitySquared, -4);
         tblR.Post();
      end;
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();
   end;

   // calc fair odds / probabilities
   try
      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
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


            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

            if tblR.GotoKey() then begin

               fNormalTotalMorningLineProbabilitySquared := tblR.FieldByName('NormalTotalMorningLineProbabilitySquared').AsFloat;
               fNormalTotalTodaysWagerProbabilitySquared := tblR.FieldByName('NormalTotalTodaysWagerProbabilitySquared').AsFloat;

               fNormalMorningLineProbabilitySquared := tblE.FieldByName('NormalMorningLineProbabilitySquared').AsFloat;
               fNormalTodaysWagerProbabilitySquared := tblE.FieldByName('NormalTodaysWagerProbabilitySquared').AsFloat;


               //(Odds = 1 / W% - 1)     odds = prob/(1-prob)
               if (fNormalTotalMorningLineProbabilitySquared > 0) then begin
                  fNormalMorningLineProbabilitySquared := fNormalMorningLineProbabilitySquared / fNormalTotalMorningLineProbabilitySquared;
                  if (fNormalMorningLineProbabilitySquared > 0) then begin
                     fNormalMorningLineOddsSquared := (1 / fNormalMorningLineProbabilitySquared) - 1;
                  end else begin
                     fNormalMorningLineOddsSquared := 0;
                  end;
               end else begin
                  fNormalMorningLineProbabilitySquared := 0;
                  fNormalMorningLineOddsSquared := 0;
               end;


               if (fNormalTotalTodaysWagerProbabilitySquared > 0) then begin
                  fNormalTodaysWagerProbabilitySquared := fNormalTodaysWagerProbabilitySquared / fNormalTotalTodaysWagerProbabilitySquared;
                  if (fNormalTodaysWagerProbabilitySquared > 0) then begin
                     fNormalTodaysWagerOddsSquared := (1 / fNormalTodaysWagerProbabilitySquared) - 1;
                  end else begin
                     fNormalTodaysWagerOddsSquared := 0;
                  end;
               end else begin
                  fNormalTodaysWagerProbabilitySquared := 0;
                  fNormalTodaysWagerOddsSquared := 0;
               end;
            end;

            tblE.Edit();

            tblE.FieldByName('NormalMorningLineOddsSquared').AsFloat := Trunc((fNormalMorningLineOddsSquared * 1));
            if (tblE.FieldByName('NormalMorningLineOddsSquared').AsFloat > 99.99) then begin
               tblE.FieldByName('NormalMorningLineOddsSquared').AsFloat := 99.00;
            end;
            if (tblE.FieldByName('NormalMorningLineOddsSquared').AsFloat < 1) then begin
               tblE.FieldByName('NormalMorningLineOddsSquared').AsFloat := 1.00;
            end;

            tblE.FieldByName('NormalTodaysWagerOddsSquared').AsFloat := Trunc((fNormalTodaysWagerOddsSquared * 1));
            if (tblE.FieldByName('NormalTodaysWagerOddsSquared').AsFloat > 99.99) then begin
               tblE.FieldByName('NormalTodaysWagerOddsSquared').AsFloat := 99.00;
            end;
            if (tblE.FieldByName('NormalTodaysWagerOddsSquared').AsFloat < 1) then begin
               tblE.FieldByName('NormalTodaysWagerOddsSquared').AsFloat := 1.00;
            end;

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
