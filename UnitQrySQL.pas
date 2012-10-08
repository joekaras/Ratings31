unit UnitQrySQL;

interface

uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;



procedure qryGetRacesAndRunners(tblT: TDBISAMTable);
procedure qryUpdateIVRankingTables();
procedure qryUpdateIVFinalOrderTable();

procedure qryCreatePreviousDaysFiles();
procedure qryCreatePrevious21DaysFiles();
procedure qryCreateWagerTable();
procedure qryCreateWagerTableByMLTrkCode();

procedure qryCreateAnalysisTables();

procedure qryUpdateEntryOwnerFromXrefTrainer();
procedure qryDeleteNonContenders();

procedure qryDeleteLSC();

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking;


type
   TEventHandlers = class // create a dummy class
   public
      procedure qrySQLQueryProgress(Sender: TObject; PercentDone: Word; var AbortQuery: Boolean);
      procedure qrySQLAfterClose(DataSet: TDataSet);
      procedure qrySQLBeforeOpen(DataSet: TDataSet);
      procedure qrySQLNewRecord(DataSet: TDataSet);
      procedure qrySQLBeforeExecute(Sender: TObject);
      procedure qrySQLAfterExecute(Sender: TObject);
   end;

procedure TEventHandlers.qrySQLBeforeExecute(Sender: TObject);
begin
   InitPrgBar(100);
   Application.ProcessMessages();
end;

procedure TEventHandlers.qrySQLAfterExecute(Sender: TObject);
begin
   ClearPrgStatusBars();
   Application.ProcessMessages();
end;

procedure TEventHandlers.qrySQLNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TEventHandlers.qrySQLQueryProgress(Sender: TObject; PercentDone: Word; var AbortQuery: Boolean);
begin
   IncPrgBar(PercentDone);
   if bAbortQuery then begin
      AbortQuery := True;
   end;
   Application.ProcessMessages();
end;

procedure TEventHandlers.qrySQLAfterClose(DataSet: TDataSet);
begin
   ClearPrgStatusBars();
end;


procedure TEventHandlers.qrySQLBeforeOpen(DataSet: TDataSet);

begin
   InitPrgBar(100);
   Application.ProcessMessages();
end;

var
   qrySQL: TDBISAMQuery;
   EvHandler: TEventHandlers;

procedure qryGetRacesAndRunners(tblT: TDBISAMTable);
var
   sFileName: string;
begin

   hLog.AddToLog('qryGetRacesAndRunners', msevOperation);
   try
      CloseTable(tblT);
      OpenTable(tblT);
      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;

      try
         //SELECT DISTINCT
         //   COUNT(*) as WinnersAllRaces,
         //   SUM(NbrRunners) as RunnersAllRaces
         //FROM RaceHistory
         //WHERE NbrRunners > 0

         sFileName := SQL_PATH + 'qryTotalRacesAndRunners.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         //For Testing
      //   qrySQL.SQL.Text:= FastReplace(qrySQL.SQL.Text, 'RaceHistory', 'PrevWeekRH', False);
//         qrySQL.SQL.Text:= FastReplace(qrySQL.SQL.Text, 'HorseHistory', 'PrevWeekHH', False);
//
         qrySQL.RequestLive := True;
         qrySQL.Open();

         if qrySQL.RecordCount > 0 then begin
            qrySQL.First();

            tblT.IndexName := '';
            tblT.SetKey();
            tblT.FieldByName('TotalKey').AsString := 'IVLiner';
            if (tblT.GotoKey()) then begin
               tblT.Edit();
               tblT.FieldByName('IVWinnersAllRaces').AsFloat := qrySQL.FieldByName('WinnersAllRaces').AsFloat;
               tblT.FieldByName('IVRunnersAllRaces').AsFloat := qrySQL.FieldByName('RunnersAllRaces').AsFloat;
               tblT.Post();
            end;
         end;
      except

         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
      CloseTable(tblT);
      hLog.AddToLog('qryGetRacesAndRunners - End', msevOperation);
   end;

end;


procedure qryUpdateIVFinalOrderTable();
var
   sFileName: string;
begin

   hLog.AddToLog('qryUpdateIVFinalOrderTable', msevOperation);
   try
      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;

      try
         //UPDATE RankingStats
         //   SET IVGroupWinnersPct = IVWinners / IVWinnersAllRaces,
         //       IVGroupRunnersPct = IVRunners / IVRunnersAllRaces;
         //
         //UPDATE RankingStats
         //   SET IV = ROUND(IVGroupWinnersPct / IVGroupRunnersPct,2);
         //
         //UPDATE RankingStatsByTrk
         //   SET IVGroupWinnersPct = IVWinners / IVWinnersAllRaces,
         //       IVGroupRunnersPct = IVRunners / IVRunnersAllRaces;
         //
         //UPDATE RankingStatsByTrk
         //   SET IV = ROUND(IVGroupWinnersPct / IVGroupRunnersPct, 2);
         //
         //UPDATE FinalOrder
         //   SET LossPct = 100 - WinPct,
         //       IVRunners = Starts,
         //       IVWinners = Wins;
         //
         //UPDATE FinalOrder
         //  SET IVRunnersAllRaces = Totals.IVRunnersAllRaces,
         //      IVWinnersAllRaces = Totals.IVWinnersAllRaces
         //  FROM FinalOrder
         //  JOIN Totals ON FinalOrder.TotalKey = Totals.TotalKey;
         //
         //
         //UPDATE FinalOrder
         //   SET IVGroupWinnersPct = IVWinners / IVWinnersAllRaces,
         //       IVGroupRunnersPct = IVRunners / IVRunnersAllRaces;
         //
         //UPDATE FinalOrder
         //   SET IV = ROUND(IVGroupWinnersPct / IVGroupRunnersPct, 2);
         //
         sFileName := SQL_PATH + 'UpdateIVFinalOrderTable.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

      except

         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
      hLog.AddToLog('qryUpdateIVRankingAndFinalOrderTables-End', msevOperation);
   end;

end;

procedure qryUpdateIVRankingTables();
var
   sFileName: string;
begin

   hLog.AddToLog('qryUpdateIVRankingTables', msevOperation);
   try
      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;

      try
         //UPDATE RankingStats
         //   SET IVGroupWinnersPct = IVWinners / IVWinnersAllRaces,
         //       IVGroupRunnersPct = IVRunners / IVRunnersAllRaces;
         //
         //UPDATE RankingStats
         //   SET IV = ROUND(IVGroupWinnersPct / IVGroupRunnersPct,2);
         //
         //UPDATE RankingStatsByTrk
         //   SET IVGroupWinnersPct = IVWinners / IVWinnersAllRaces,
         //       IVGroupRunnersPct = IVRunners / IVRunnersAllRaces;
         //
         //UPDATE RankingStatsByTrk
         //   SET IV = ROUND(IVGroupWinnersPct / IVGroupRunnersPct, 2);
         //
         //UPDATE FinalOrder
         //   SET LossPct = 100 - WinPct,
         //       IVRunners = Starts,
         //       IVWinners = Wins;
         //
         //UPDATE FinalOrder
         //  SET IVRunnersAllRaces = Totals.IVRunnersAllRaces,
         //      IVWinnersAllRaces = Totals.IVWinnersAllRaces
         //  FROM FinalOrder
         //  JOIN Totals ON FinalOrder.TotalKey = Totals.TotalKey;
         //
         //
         //UPDATE FinalOrder
         //   SET IVGroupWinnersPct = IVWinners / IVWinnersAllRaces,
         //       IVGroupRunnersPct = IVRunners / IVRunnersAllRaces;
         //
         //UPDATE FinalOrder
         //   SET IV = ROUND(IVGroupWinnersPct / IVGroupRunnersPct, 2);
         //
         sFileName := SQL_PATH + 'UpdateIVRankingTables.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

      except

         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
      hLog.AddToLog('qryUpdateIVRankingAndFinalOrderTables-End', msevOperation);
   end;

end;

procedure qryCreatePreviousDaysFiles();
var
   sFileName: string;
begin
   hLog.AddToLog('CreatePreviousDaysFiles', msevOperation);

   try
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPrevDayRH);
      CloseTable(dm.tblPrevDayHH);
      CloseTable(dm.tblPrevWeekRH);
      CloseTable(dm.tblPrevWeekHH);

      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;

      try

         sFileName := SQL_PATH + 'CreatePreviousDaysRHFiles.Sql';
         sQrySqlStatusSimpleText := sFileName;
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ParamByName('RaceDateParam').DataType := ftDate;
         qrySQL.ParamByName('RaceDateParam').AsDateTime := gedtOverrideDate;
         qrySQL.Prepare;
         qrySQL.ExecSQL;

         sFileName := SQL_PATH + 'CreatePreviousDaysHHFiles.Sql';
         sQrySqlStatusSimpleText := sFileName;
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ParamByName('RaceDateParam').DataType := ftDate;
         qrySQL.ParamByName('RaceDateParam').AsDateTime := gedtOverrideDate;
         qrySQL.Prepare;
         qrySQL.ExecSQL;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPrevDayRH);
      CloseTable(dm.tblPrevDayHH);
      CloseTable(dm.tblPrevWeekRH);
      CloseTable(dm.tblPrevWeekHH);
      qrySQL.Close();
      FreeAndNil(qrySQL);
   end;
end;


procedure qryCreateWagerTableByMLTrkCode();
begin

   //hLog.AddToLog('CreateWagerTableByMLTrkCode', msevOperation);
   //try
   //   if not assigned(PreviousDaysByMLTrkCodeReportForm) then begin
   //      PreviousDaysByMLTrkCodeReportForm := TPreviousDaysByMLTrkCodeReportForm.Create(Application);
   //   end;
   //
   //   try
   //
   //      PreviousDaysByMLTrkCodeReportForm.bCreateWagerTable := True;
   //      PreviousDaysByMLTrkCodeReportForm.bAllTracks := True;
   //
   //      PreviousDaysByMLTrkCodeReportForm.bYouBetTracks := False;
   //      PreviousDaysByMLTrkCodeReportForm.bPrintDetail := False;
   //
   //      PreviousDaysByMLTrkCodeReportForm.ShowModal;
   //   finally
   //      PreviousDaysByMLTrkCodeReportForm.Free;
   //      PreviousDaysByMLTrkCodeReportForm := nil;
   //   end;
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;

end;

procedure qryCreatePrevious21DaysFiles();
var
   sFileName: string;
begin
   hLog.AddToLog('CreatePrevious21DaysFiles', msevOperation);

   try
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPrevDayRH);
      CloseTable(dm.tblPrevDayHH);
      CloseTable(dm.tblPrevWeekRH);
      CloseTable(dm.tblPrevWeekHH);

      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;
      try
         sFileName := SQL_PATH + 'CreatePrevious21DaysRHFiles.Sql';
         sQrySqlStatusSimpleText := sFileName;
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ParamByName('RaceDateStart').DataType := ftDate;
         qrySQL.ParamByName('RaceDateStart').AsDateTime := gedtOverrideDate - PREV_WEEK_DAYS;
         qrySQL.ParamByName('RaceDateEnd').DataType := ftDate;
         qrySQL.ParamByName('RaceDateEnd').AsDateTime := gedtOverrideDate - 1;
         qrySQL.Prepare;
         qrySQL.ExecSQL;

         sFileName := SQL_PATH + 'CreatePrevious21DaysHHFiles.Sql';
         sQrySqlStatusSimpleText := sFileName;
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ParamByName('RaceDateStart').DataType := ftDate;
         qrySQL.ParamByName('RaceDateStart').AsDateTime := gedtOverrideDate - PREV_WEEK_DAYS;
         qrySQL.ParamByName('RaceDateEnd').DataType := ftDate;
         qrySQL.ParamByName('RaceDateEnd').AsDateTime := gedtOverrideDate - 1;
         qrySQL.Prepare;
         qrySQL.ExecSQL;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPrevDayRH);
      CloseTable(dm.tblPrevDayHH);
      CloseTable(dm.tblPrevWeekRH);
      CloseTable(dm.tblPrevWeekHH);
      qrySQL.Close();
      FreeAndNil(qrySQL);
   end;

end;

procedure qryCreateWagerTable();
begin

   //hLog.AddToLog('CreateWagerTable', msevOperation);
   //
   //try
   //   if not assigned(PreviousDaysByDayReportForm) then begin
   //      PreviousDaysByDayReportForm := TPreviousDaysByDayReportForm.Create(Application);
   //   end;
   //
   //   try
   //
   //      PreviousDaysByDayReportForm.bCreateWagerTable := True;
   //      PreviousDaysByDayReportForm.bAllTracks := True;
   //      PreviousDaysByDayReportForm.bByMorningLineTo1 := True;
   //
   //      PreviousDaysByDayReportForm.bYouBetTracks := False;
   //      PreviousDaysByDayReportForm.bPrintDetail := False;
   //      PreviousDaysByDayReportForm.bByRaceDate := False;
   //      PreviousDaysByDayReportForm.bByTrkCode := False;
   //      PreviousDaysByDayReportForm.bByRaceType := False;
   //
   //      PreviousDaysByDayReportForm.ShowModal;
   //   finally
   //      PreviousDaysByDayReportForm.Free;
   //      PreviousDaysByDayReportForm := nil;
   //   end;
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;

end;

procedure qryCreateAnalysisTables();
var
   sFileName: string;
begin

   hLog.AddToLog('qryCreateAnalysisTables', msevOperation);
   try


      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;

      try

         sFileName := SQL_PATH + 'Update1stBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'UpdateX1stBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'Update2yoBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();
         sFileName := SQL_PATH + 'UpdateX2yoBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'UpdateTurfBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'UpdateXTurfBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'UpdateXtremeSpeed.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'Update1stBredSheetSelected.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'Update2yoBredSheetSelected.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'UpdateTurfBredSheetSelected.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'UpdateSpeedSheetSelected.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'qrySpeed.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'qry1stBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'qry2yoBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'qryTurfBred.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'qryAngles.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

         sFileName := SQL_PATH + 'qryRanks.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
      hLog.AddToLog('qryCreateAnalysisTables - END', msevOperation);
   end;

end;

procedure qryUpdateRankings(
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   iNbrOfDays: integer
   );
var
   sTmp: string;
   iRaceNbr: integer;
   sTrkCode: string;
   iPrevRaceNbr: integer;
   sPrevTrkCode: string;
   iRank: integer;
begin

   try
      //     CloseTable(dm.tblSummaryTotals);
      //    OpenTable(dm.tblSummaryTotals);

      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;

      //      TimerOn(False);
      qrySQL.Close;
      qrySQL.Unprepare;
      qrySQL.Sql.Clear();
      qrySQL.Sql.Add('DROP Memory\memTbl');
      qrySQL.Prepare;
      qrySQL.ExecSQL();

      sTmp := '';
      sTmp := sTmp + 'SELECT TrkCode,   ';
      sTmp := sTmp + 'RaceDate,         ';
      sTmp := sTmp + 'RaceNbr,          ';
      sTmp := sTmp + 'PostPos,          ';
      sTmp := sTmp + 'LastSpeed         ';
      sTmp := sTmp + '0 AS Ranking      ';

      sTmp := sTmp + 'INTO Memory\memTbl ';
      sTmp := sTmp + 'FROM Entry         ';
      sTmp := sTmp + 'ORDER BY TrkCode, RaceDate, RaceNbr, LastSpeed DESC';

      qrySQL.Sql.Add(sTmp);
      qrySQL.RequestLive := True;
      qrySQL.Prepare;
      qrySQL.Open();
      qrySQL.First();

      InitPrgBar(qrySQL.RecordCount);

      iRank := 0;
      iPrevRaceNbr := 0;
      sPrevTrkCode := '';


      while not qrySQL.EOF do begin
         IncPrgBar();
         iRaceNbr := tbl.FieldByName('RaceNbr').AsInteger;
         sTrkCode := tbl.FieldByName('TrkCode').AsString;

         if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin
            if (iRank < qrySql.FieldByName(sFldName).AsInteger) then begin
               Inc(iRank);
            end;

            if (iRank <> qrySql.FieldByName(sFldName).AsInteger) then begin
               tbl.Edit();
               if (iRank <= 10) then begin
                  tbl.FieldByName(sFldName).AsInteger := iRank;
               end else begin
                  tbl.FieldByName(sFldName).AsInteger := 11;
               end;
               tbl.Post();
            end;
            iPrevRaceNbr := iRaceNbr;
            sPrevTrkCode := sTrkCode;
         end else begin
            iRank := 1;
            if (iRank <> tbl.FieldByName(sFldName).AsInteger) then begin
               tbl.Edit();
               tbl.FieldByName(sFldName).AsInteger := iRank;
               tbl.Post();
            end;
            iPrevRaceNbr := iRaceNbr;
            sPrevTrkCode := sTrkCode;
         end;

         qrySQL.Next();
      end;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         qrySQL.Close();
         ClearPrgStatusBars();
      end;
   end;

   qrySQL.Close();
   ClearPrgStatusBars();
end;


//UpdateEntryOwnerFromXrefTrainer.sql

procedure qryUpdateEntryOwnerFromXrefTrainer();
var
   sFileName: string;
begin

   hLog.AddToLog('qryUpdateEntryOwnerFromXrefTrainer', msevOperation);
   try
      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;
      qrySQL.BeforeExecute := EvHandler.qrySQLBeforeExecute;
      qrySQL.AfterExecute := EvHandler.qrySQLAfterExecute;

      try
         //update entry
         //set entry.owner = XferOwner.ActualOwnerName
         //from entry, XferOwner
         //where entry.owner = XferOwner.Owner

         sFileName := SQL_PATH + 'UpdateEntryOwnerFromXrefTrainer.sql';
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ExecSQL();

      except

         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
      hLog.AddToLog('qryUpdateIVRankingAndFinalOrderTables-End', msevOperation);
   end;

end;

procedure qryDeleteNonContenders();
var
   sFileName: string;
begin
   hLog.AddToLog('DeleteNonContenders', msevOperation);

   try
      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;

      qrySQL.Close;
      qrySQL.Unprepare;
      qrySQL.Sql.Clear();
      qrySQL.Sql.Add('Delete From Entry Where IsWagerSheetSelected=False');
      qrySQL.RequestLive := True;
      qrySQL.Prepare;
      qrySQL.ExecSQL;

   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
   end;
end;

procedure qryDeleteLSC();
var
   sFileName: string;
begin
   hLog.AddToLog('DeleteNonContenders', msevOperation);

   try
      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';
      qrySQL.BeforeOpen := EvHandler.qrySQLBeforeOpen;
      qrySQL.AfterClose := EvHandler.qrySQLAfterClose;
      qrySQL.OnQueryProgress := EvHandler.qrySQLQueryProgress;
      qrySQL.OnNewRecord := EvHandler.qrySQLNewRecord;

      qrySQL.Close;
      qrySQL.Unprepare;
      qrySQL.Sql.Clear();
      qrySQL.Sql.Add('Delete From TSNDownload Where FileType=' + QuotedStr('LSC'));
      qrySQL.RequestLive := True;
      qrySQL.Prepare;
      qrySQL.ExecSQL;

   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
   end;
end;



end.
