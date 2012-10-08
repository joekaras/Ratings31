unit UnitCreatePrevious;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;


procedure CreatePreviousDaysDetailReports(Sender: TObject);
procedure CreatePrevious21DaysDetailReports(Sender: TObject);

procedure CreatePreviousDaysSummaryReports(Sender: TObject);
procedure CreatePrevious21DaysSummaryReports(Sender: TObject);

procedure CreatePreviousDaysYouBetDetailReports(Sender: TObject);
procedure CreatePrevious21DaysYouBetDetailReports(Sender: TObject);

procedure CreatePreviousDaysYouBetSummaryReports(Sender: TObject);
procedure CreatePrevious21DaysYouBetSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByRaceDateDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByRaceDateSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByTrkCodeDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByTrkCodeSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByRaceTypeDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByRaceTypeSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByMLDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByMLSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByRaceDateYouBetDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByRaceDateYouBetSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByTrkCodeYouBetDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByTrkCodeYouBetSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByRaceTypeYouBetDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByRaceTypeYouBetSummaryReports(Sender: TObject);

procedure CreatePrevious21DaysByMLYouBetDetailReports(Sender: TObject);
procedure CreatePrevious21DaysByMLYouBetSummaryReports(Sender: TObject);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitQrySQL;

procedure CreatePreviousDaysDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(WagerResultsReportForm) then begin
            WagerResultsReportForm := TWagerResultsReportForm.Create(Application);
         end;

         try

            if (chkWagerResultsReports.Checked) then begin
               WagerResultsReportForm.bWagerReports := True;
            end else begin
               WagerResultsReportForm.bWagerReports := False;
            end;

            WagerResultsReportForm.bPrintDetail := True;
            WagerResultsReportForm.bPreviousDay := True;
            WagerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(gedtOverrideDate);
            WagerResultsReportForm.varEndDate.Caption := DateToStr(gedtOverrideDate);

            WagerResultsReportForm.ShowModal;
         finally
            FreeAndNil(WagerResultsReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;

         try

            PreviousDaysReportForm.bYouBetTracks := False;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := True;
            PreviousDaysReportForm.bPreviousDay := True;
            PreviousDaysReportForm.varStartDate.Caption := 'For : ' + DateToStr(gedtOverrideDate);
            PreviousDaysReportForm.varEndDate.Caption := DateToStr(gedtOverrideDate);

            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;

            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;

            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;

            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePreviousDaysSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;
         try
            PreviousDaysReportForm.bYouBetTracks := False;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := False;
            PreviousDaysReportForm.bPreviousDay := True;
            PreviousDaysReportForm.varStartDate.Caption := 'For : ' + DateToStr(gedtOverrideDate);
            PreviousDaysReportForm.varEndDate.Caption := DateToStr(gedtOverrideDate);
            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;
            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;
            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;

            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePreviousDaysYouBetDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;
         try
            PreviousDaysReportForm.bYouBetTracks := True;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := True;
            PreviousDaysReportForm.bPreviousDay := True;
            PreviousDaysReportForm.varStartDate.Caption := 'For : ' + DateToStr(gedtOverrideDate);
            PreviousDaysReportForm.varEndDate.Caption := DateToStr(gedtOverrideDate);
            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;
            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;
            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;
            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

   }
end;

procedure CreatePreviousDaysYouBetSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;
         try
            PreviousDaysReportForm.bYouBetTracks := True;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := False;
            PreviousDaysReportForm.bPreviousDay := True;
            PreviousDaysReportForm.varStartDate.Caption := 'For : ' + DateToStr(gedtOverrideDate);
            PreviousDaysReportForm.varEndDate.Caption := DateToStr(gedtOverrideDate);
            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;
            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;

            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;
            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePrevious21DaysDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;
         try
            PreviousDaysReportForm.bYouBetTracks := False;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := True;
            PreviousDaysReportForm.bPreviousDay := False;
            PreviousDaysReportForm.varStartDate.Caption := 'For ' + DateToStr(gedtOverrideDate - (PREV_WEEK_DAYS + 1));
            PreviousDaysReportForm.varEndDate.Caption := ' To ' + DateToStr(gedtOverrideDate - 1);
            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;
            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;

            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;
            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePrevious21DaysSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;
         try
            PreviousDaysReportForm.bYouBetTracks := False;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := False;
            PreviousDaysReportForm.bPreviousDay := False;
            PreviousDaysReportForm.varStartDate.Caption := 'For ' + DateToStr(gedtOverrideDate - (PREV_WEEK_DAYS + 1));
            PreviousDaysReportForm.varEndDate.Caption := ' To ' + DateToStr(gedtOverrideDate - 1);
            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;
            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;

            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;
            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePrevious21DaysYouBetDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;
         try
            PreviousDaysReportForm.bYouBetTracks := True;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := True;
            PreviousDaysReportForm.bPreviousDay := False;
            PreviousDaysReportForm.varStartDate.Caption := 'For ' + DateToStr(gedtOverrideDate - (PREV_WEEK_DAYS + 1));
            PreviousDaysReportForm.varEndDate.Caption := ' To ' + DateToStr(gedtOverrideDate - 1);
            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;
            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;

            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;
            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysYouBetSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysReportForm) then begin
            PreviousDaysReportForm := TPreviousDaysReportForm.Create(Application);
         end;
         try
            PreviousDaysReportForm.bYouBetTracks := True;
            if (chkWagerResultsReports.Checked) then begin
               PreviousDaysReportForm.bWagerReports := True;
            end else begin
               PreviousDaysReportForm.bWagerReports := False;
            end;
            PreviousDaysReportForm.bPrintDetail := False;
            PreviousDaysReportForm.bPreviousDay := False;
            PreviousDaysReportForm.varStartDate.Caption := 'For ' + DateToStr(gedtOverrideDate - (PREV_WEEK_DAYS + 1));
            PreviousDaysReportForm.varEndDate.Caption := ' To ' + DateToStr(gedtOverrideDate - 1);
            if (chkBasicResultsReports.Checked) then begin
               PreviousDaysReportForm.bBasicReports := True;
            end else begin
               PreviousDaysReportForm.bBasicReports := False;
            end;
            if (chkSpecialResultsReports.Checked) then begin
               PreviousDaysReportForm.bSpecialReports := True;
            end else begin
               PreviousDaysReportForm.bSpecialReports := False;
            end;
            if (chkAllResultsReports.Checked) then begin
               PreviousDaysReportForm.bAllReports := True;
            end else begin
               PreviousDaysReportForm.bAllReports := False;
            end;
            PreviousDaysReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePrevious21DaysByRaceDateDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := True;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysByDayReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByRaceDateSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := True;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysByDayReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePrevious21DaysByTrkCodeDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := True;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            FreeAndNil(PreviousDaysByDayReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByTrkCodeSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := True;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByRaceTypeDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := True;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByRaceTypeSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := True;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByMLDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := True;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := True;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByMLSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := True;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := False;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := True;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByRaceDateYouBetDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := True;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByRaceDateYouBetSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := True;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePrevious21DaysByTrkCodeYouBetDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := True;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByTrkCodeYouBetSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := True;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByRaceTypeYouBetDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := True;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByRaceTypeYouBetSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := True;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := False;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;

procedure CreatePrevious21DaysByMLYouBetDetailReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := True;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := True;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;


procedure CreatePrevious21DaysByMLYouBetSummaryReports(Sender: TObject);
begin
   {
      try
         if not assigned(PreviousDaysByDayReportForm) then begin
            PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
         end;
         try

            PreviousDaysByDayReportForm.bAllTracks := False;
            PreviousDaysByDayReportForm.bCreateWagerTable := False;
            PreviousDaysByDayReportForm.bYouBetTracks := True;
            PreviousDaysByDayReportForm.bPrintDetail := False;
            PreviousDaysByDayReportForm.bByRaceDate := False;
            PreviousDaysByDayReportForm.bByTrkCode := False;
            PreviousDaysByDayReportForm.bByRaceType := False;
            PreviousDaysByDayReportForm.bByMorningLineTo1 := True;

            PreviousDaysByDayReportForm.ShowModal;
         finally
            PreviousDaysByDayReportForm.Free;
            PreviousDaysByDayReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   }
end;







end.
