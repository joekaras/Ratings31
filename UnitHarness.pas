unit UnitHarness;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure DownloadUSTACharts(Sender: TObject; sWhichCard: string);
procedure DownloadSCCharts(Sender: TObject; sWhichCard: string);

function GetHarnessFinalKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetHarnessDefaultKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetHarnessPostPosKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetHarnessConnectionKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetHarnessSpeedEarningsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
procedure CreateHarnessFinalKey(iIncCnt: integer; bOneDay: boolean);
procedure SetHarnessFinalRankings(bOneDay: boolean);
procedure CreateHarnessKeys(iIncCnt: integer; bOneDay: boolean);
procedure UpdateHarnessKeys(iIncCnt: integer; bOneDay: boolean);
procedure SetHarnessKeyRankings(bOneDay: boolean);
procedure CreateTodaysHarnessFiles(Sender: TObject);
procedure SetHarnessRankings(bOneDay: boolean);

procedure UpdateHarnessRankings(
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bOneDay: boolean
   );
procedure ImportHarness(Sender: TObject);
procedure ImportFlashNet(Sender: TObject);
procedure ImportAxcisHarnessEntry(lRecNo: Longint);
procedure SetHarnessFinalKeyEntries(
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean
   );
procedure ImportAxcisHarnessDriver(sHarnessDriverFileName: string);
procedure ImportAxcisHarnessTrainer(sHarnessTrainerFileName: string);
procedure UpdateHarnessWager(bOneDay: boolean);
procedure ParseFlashNet(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
procedure ParseUSTACharts(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
procedure ParseSCCharts(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
procedure ProcessUSTACharts(Sender: TObject);
procedure ProcessSCCharts(Sender: TObject);
procedure ImportAxcisHarnessRaceEntry(
   sHarnessRaceFileName: string;
   sHarnessEntryFileName: string;
   sHarnessPastFileName: string;
   sHarnessTrainerFileName: string;
   sHarnessDriverFileName: string);

procedure ImportAxcisHarnessPast(
   sHarnessEntryFileName: string;
   sHarnessPastFileName: string;
   sHarnessTrainerFileName: string;
   sHarnessDriverFileName: string);

implementation
uses HDataModule, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog,
   UnitCommonCode;

var
   qryHarnessSQL: TDBISAMQuery;

function GetHarnessFinalKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
begin

   sBaseKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin
      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]);
      //      sBaseKey := 'ALL';

      if ((tblE.FieldByName('SpdEarnWinPctRank').AsInteger > 0) and
         (tblE.FieldByName('SpdEarnWinPctRank').AsInteger <= HARNESS_KEY_MAX)) then begin
         sBaseKey := sBaseKey + '-SE-' + sm.Str(tblE.FieldByName('SpdEarnWinPctRank').AsInteger, 2);
      end else begin
         sBaseKey := sBaseKey + '-SE-' + sm.Str(99, 2);
      end;

      if ((tblE.FieldByName('TrnDrvWinPctRank').AsInteger > 0) and
         (tblE.FieldByName('TrnDrvWinPctRank').AsInteger <= HARNESS_KEY_MAX)) then begin
         sBaseKey := sBaseKey + '-TD-' + sm.Str(tblE.FieldByName('TrnDrvWinPctRank').AsInteger, 2);
      end else begin
         sBaseKey := sBaseKey + '-TD-' + sm.Str(99, 2);
      end;

      //      if ((tblE.FieldByName('PostPosWinPctRank').AsInteger > 0) and
      //         (tblE.FieldByName('PostPosWinPctRank').AsInteger <= HARNESS_KEY_MAX)) then begin
      //         sBaseKey := sBaseKey + '-PP-' + sm.Str(tblE.FieldByName('PostPosWinPctRank').AsInteger, 2);
      //      end else begin
      //         sBaseKey := sBaseKey + '-PP-' + sm.Str(99, 2);
      //      end;

      if ((tblE.FieldByName('DefaultWinPctRank').AsInteger > 0) and
         (tblE.FieldByName('DefaultWinPctRank').AsInteger <= HARNESS_KEY_MAX)) then begin
         sBaseKey := sBaseKey + '-DR-' + sm.Str(tblE.FieldByName('DefaultWinPctRank').AsInteger, 2);
      end else begin
         sBaseKey := sBaseKey + '-DR-' + sm.Str(99, 2);
      end;
   end;

   Result := sBaseKey;


end;

procedure SetHarnessFinalKeyEntries
   (
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean
   );
var
   iRank: integer;
   iRaceNbr: integer;
   sTrkCode: string;
   iPrevRaceNbr: integer;
   sPrevTrkCode: string;

   iStaCnt: integer;
   iTotalCnt: integer;

   sSubKey: string;
   sFinalKey: string;

begin

   iPrevRaceNbr := 0;
   sPrevTrkCode := '';
   iRank := 0;

   try
      OpenTable(hdm.tblRaces);
      OpenTable(hdm.tblEntries);
      OpenTable(hdm.tblFinalKey);

      if (bOneDay) then begin
         hdm.tblEntries.IndexName := 'ByRangeRaceDate';

         hdm.tblEntries.SetRangeStart;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.SetRangeEnd;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.ApplyRange;
      end;

      InitPrgBar(hdm.tblEntries.RecordCount);

      hdm.tblEntries.First();

      iPrevRaceNbr := 0;
      sPrevTrkCode := '';

      iStaCnt := 0;
      iTotalCnt := 0;

      staBar.SimpleText := 'Setting Harness Final Key ' + ' - ' +
         hdm.tblEntries.FieldByName('TrkCode').AsString + ' ' +
         hdm.tblEntries.FieldByName('RaceDate').AsString;
      Application.ProcessMessages();

      while not hdm.tblEntries.Eof do begin
         IncPrgBar();
         Application.ProcessMessages();

         if (iStaCnt > BATCH_SIZE) then begin
            staBar.SimpleText := 'Setting Final Harness Key ' + ' - ' +
               hdm.tblEntries.FieldByName('TrkCode').AsString + ' ' +
               hdm.tblEntries.FieldByName('RaceDate').AsString + ' Race # ' +
               hdm.tblEntries.FieldByName('RaceNbr').AsString + ' ' +
               IntToStr(iTotalCnt) + ' of ' + IntToStr(hdm.tblEntries.RecordCount);
            Application.ProcessMessages();
            iStaCnt := 0;
            if not hdm.dbBuggy.InTransaction then begin
               hdm.dbBuggy.StartTransaction();
            end else begin
               if hdm.dbBuggy.InTransaction then begin
                  hdm.dbBuggy.Commit;
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;


         try
            hdm.tblEntries.Edit();

            sSubKey := 'FINALKEY';
            sFinalKey := GetHarnessFinalKey(hdm.tblRaces, hdm.tblEntries);

            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sFinalKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblEntries.FieldByName('FinalKey').AsString := sFinalKey;
               hdm.tblEntries.FieldByName('FinalStarts').AsInteger := hdm.tblFinalKey.FieldByName('Starts').AsInteger;
               hdm.tblEntries.FieldByName('FinalWins').AsInteger := hdm.tblFinalKey.FieldByName('Wins').AsInteger;
               hdm.tblEntries.FieldByName('FinalWinPct').AsFloat := hdm.tblFinalKey.FieldByName('WinPct').AsFloat;
               hdm.tblEntries.FieldByName('FinalValueBet').AsFloat := hdm.tblFinalKey.FieldByName('ValueBet').AsFloat;
            end else begin
               hdm.tblEntries.FieldByName('FinalKey').AsString := sFinalKey;
               hdm.tblEntries.FieldByName('FinalStarts').AsInteger := -1;
               hdm.tblEntries.FieldByName('FinalWins').AsInteger := -1;
               hdm.tblEntries.FieldByName('FinalWinPct').AsFloat := -1;
               hdm.tblEntries.FieldByName('FinalValueBet').AsFloat := -1;
            end;
            hdm.tblEntries.Post();
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         hdm.tblEntries.Next();
         Application.ProcessMessages();
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         if hdm.dbBuggy.InTransaction then begin
            hdm.dbBuggy.Rollback();
         end;
         CloseTable(hdm.tblRaces);
         CloseTable(hdm.tblEntries);
         CloseTable(hdm.tblFinalKey);
         ClearPrgStatusBars();
      end;
   end;

   if hdm.dbBuggy.InTransaction then begin
      hdm.dbBuggy.Commit();
   end;

   CloseTable(hdm.tblRaces);
   CloseTable(hdm.tblEntries);
   CloseTable(hdm.tblFinalKey);
   ClearPrgStatusBars();

end;

procedure CreateTodaysHarnessFiles(Sender: TObject);
var
   sFileName: string;
begin

   hLog.AddToLog('CreateTodaysHarnessFiles', msevOperation);

   try
      try

         sFileName := SQL_PATH + 'CreateTodaysHarnessFiles.Sql';
         sQrySqlStatusSimpleText := sFileName;
         qryHarnessSQL.Close;
         qryHarnessSQL.Unprepare;
         qryHarnessSQL.Sql.Clear();
         qryHarnessSQL.Sql.LoadFromFile(sFileName);
         qryHarnessSQL.RequestLive := True;
         qryHarnessSQL.ParamByName('RaceDateParam').DataType := ftDate;
         qryHarnessSQL.ParamByName('RaceDateParam').AsDateTime := gedtOverrideDate;
         qryHarnessSQL.Prepare;
         qryHarnessSQL.ExecSQL;


      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      qryHarnessSQL.Close();
   end;

end;


function GetHarnessPostPosKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
begin

   sBaseKey := 'NONE';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin
      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]);
      //
      //      if (tblE.FieldByName('WinIndex').AsInteger < 0) then begin
      //         sBaseKey := sBaseKey + ':POST-';
      //      end;
      //
      //      if (tblE.FieldByName('WinIndex').AsInteger = 0) then begin
      //         sBaseKey := sBaseKey + ':POST=';
      //      end;
      //
      //      if (tblE.FieldByName('WinIndex').AsInteger > 0) then begin
      //         sBaseKey := sBaseKey + ':POST+';
      //      end;
      //
      //if ((tblE.FieldByName('PostPos').AsInteger > 0) and
      //   (tblE.FieldByName('WinIndexRank').AsInteger <= HARNESS_KEY_MAX)) then begin
      //   sBaseKey := sBaseKey + 'WI:' + sm.Str(tblE.FieldByName('WinIndexRank').AsInteger, 2);
      //end else begin
      //   sBaseKey := sBaseKey + 'WI:' + sm.Str(99, 2);
      //end;

      sBaseKey := sBaseKey + sm.Str(tblE.FieldByName('PostPos').AsInteger, 2);

   end;

   Result := sBaseKey;

end;

function GetHarnessSpeedEarningsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
   sTrkKey: string;
begin

   sBaseKey := 'NONE';
   sTrkKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin
      if ((tblE.FieldByName('AvgSpeedRank').AsInteger > 0) and
         (tblE.FieldByName('AvgSpeedRank').AsInteger <= HARNESS_KEY_MAX)) then begin
         sBaseKey := 'SPD:' + sm.Str(tblE.FieldByName('AvgSpeedRank').AsInteger, 2);
      end else begin
         sBaseKey := 'SPD:' + sm.Str(99, 2);
      end;

      if ((tblE.FieldByName('Last6EarningsRank').AsInteger > 0) and
         (tblE.FieldByName('Last6EarningsRank').AsInteger <= HARNESS_KEY_MAX)) then begin
         sBaseKey := sBaseKey + ' ER:' + sm.Str(tblE.FieldByName('Last6EarningsRank').AsInteger, 2);
      end else begin
         sBaseKey := sBaseKey + ' ER:' + sm.Str(99, 2);
      end;

   end;

   Result := sBaseKey;

end;


function GetHarnessConnectionKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
   sTrkKey: string;
begin

   sBaseKey := 'NONE';
   sTrkKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin

      sTrkKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]);
      sBaseKey := sTrkKey + 'TD-';
      if (tblE.FieldByName('TrnDrvWinPct').AsInteger >= tblE.FieldByName('TrnWinPct').AsInteger) then begin
         sBaseKey := sTrkKey + 'TD=';
      end;
      if (tblE.FieldByName('TrnDrvWinPct').AsInteger >= tblE.FieldByName('DrvWinPct').AsInteger) then begin
         sBaseKey := sTrkKey + 'TD=';
      end;
      if (tblE.FieldByName('TrnDrvWinPct').AsInteger > tblE.FieldByName('TrnWinPct').AsInteger) then begin
         if (tblE.FieldByName('TrnDrvWinPct').AsInteger > tblE.FieldByName('DrvWinPct').AsInteger) then begin
            sBaseKey := sTrkKey + 'TD+';
         end;
      end;

   end;

   Result := sBaseKey;

end;

function GetHarnessDefaultKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
   sTrnDrvKey: string;
begin

   sBaseKey := 'NONE';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin
      if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
         (tblE.FieldByName('PowerRank').AsInteger <= HARNESS_KEY_MAX)) then begin
         sBaseKey := 'PWR:' + sm.Str(tblE.FieldByName('PowerRank').AsInteger, 2);
      end else begin
         sBaseKey := 'PWR:' + sm.Str(99, 2);
      end;

      if ((tblE.FieldByName('MorningLineTo1Rank').AsInteger > 0) and
         (tblE.FieldByName('MorningLineTo1Rank').AsInteger <= HARNESS_KEY_MAX)) then begin
         sBaseKey := sBaseKey + ' ML:' + sm.Str(tblE.FieldByName('MorningLineTo1Rank').AsInteger, 2);
      end else begin
         sBaseKey := sBaseKey + ' ML:' + sm.Str(99, 2);
      end;
   end;

   Result := sBaseKey;

end;

procedure CreateHarnessKeys
   (
   iIncCnt: integer;
   bOneDay: boolean
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;

   sSubKey: string;
   sPostPosKey: string;
   sDefaultKey: string;
   sConnectionKey: string;
   sSpeedEarningsKey: string;

   procedure HarnessSummaryFlds(tblE: TDBISAMTable; tblFK: TDBISAMTable);
   var
      fStarts: double;
      fWins: double;
      fWinPct: double;

      fFldstarts: double;
      fTotalWins: double;
      fTotalWinPct: double;
      fTotalWagered: double;
      fTotalWon: double;
      fTotalProfitLoss: double;
      fTotalProfitLossPct: double;

      fValueBet: double;

      fAvgOdds: double;
      fMinOdds: double;
      fMaxOdds: double;
   begin

      tblFK.FieldByName('Starts').AsInteger := tblFK.FieldByName('Starts').AsInteger + 1;

      if (tblE.FieldByName('FinishPos').AsInteger = 1) then begin
         tblFK.FieldByName('Wins').AsInteger := tblFK.FieldByName('Wins').AsInteger + 1;
      end;

      if (tblE.FieldByName('FinishPos').AsInteger = 1) then begin
         tblFK.FieldByName('TotalOdds').AsFloat := tblFK.FieldByName('TotalOdds').AsFloat + tblE.FieldByName('Odds').AsFloat;
      end;

      if (tblFK.FieldByName('Wins').AsFloat > 0) then begin
         tblFK.FieldByName('AvgOdds').AsFloat := tblFK.FieldByName('TotalOdds').AsFloat / tblFK.FieldByName('Wins').AsFloat;
      end;

      if (tblE.FieldByName('FinishPos').AsInteger = 1) then begin

         if (tblE.FieldByName('Odds').AsFloat > 0) then begin
            if (tblE.FieldByName('Odds').AsFloat < tblFK.FieldByName('MinOdds').AsFloat) then begin
               tblFK.FieldByName('MinOdds').AsFloat := tblE.FieldByName('Odds').AsFloat;
            end;
         end;

         if (tblE.FieldByName('Odds').AsFloat > tblFK.FieldByName('MaxOdds').AsFloat) then begin
            tblFK.FieldByName('MaxOdds').AsFloat := tblE.FieldByName('Odds').AsFloat;
         end;

      end;

      fStarts := tblFK.FieldByName('Starts').AsFloat;
      fWins := tblFK.FieldByName('Wins').AsFloat;
      fAvgOdds := tblFK.FieldByName('AvgOdds').AsFloat;

      if (fStarts > 0) then begin
         fWinPct := (fWins / fStarts) * 100;
      end else begin
         fWinPct := 0;
      end;

      fTotalWagered := fStarts;
      fTotalWon := (fWins * fAvgOdds) + fWins;
      fTotalProfitLoss := Round((fTotalWon - fTotalWagered) * 100) / 100;
      fTotalProfitLossPct := (fTotalProfitLoss / fTotalWagered) * 100;
      fTotalProfitLossPct := Round((fTotalProfitLossPct) * 100) / 100;
      fTotalProfitLoss := fTotalProfitLoss;

      fValueBet := (fAvgOdds * fWinPct) / 100;

      tblFK.FieldByName('Wins').AsFloat := fWins;
      tblFK.FieldByName('WinPct').AsFloat := Round(fWinPct * 100) / 100;
      tblFK.FieldByName('TotalWagered').AsFloat := RoundTo(fTotalWagered, -2);
      tblFK.FieldByName('TotalWon').AsFloat := RoundTo(fTotalWon, -2);
      tblFK.FieldByName('TotalProfitLoss').AsFloat := RoundTo(fTotalProfitLoss, -2);
      tblFK.FieldByName('TotalProfitLossPct').AsFloat := fTotalProfitLossPct;
      tblFK.FieldByName('ValueBet').AsFloat := RoundTo(fValueBet, -2);
      tblFK.FieldByName('AvgOdds').AsFloat := RoundTo(fAvgOdds, -2);

   end;

begin

   hLog.AddToLog('CreateHarnessKeys', msevOperation);
   try
      CloseTable(hdm.tblEntries);
      OpenTable(hdm.tblEntries);

      CloseTable(hdm.tblRaces);
      OpenTable(hdm.tblRaces);

      try
         OpenTable(hdm.tblFinalKey);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      if (not bOneDay) then begin
         UpdateStatusBar('Clearing Keys');
         Application.ProcessMessages();

         InitPrgBar(hdm.tblFinalKey.RecordCount);

         iStaCnt := 0;
         iTotalCnt := 0;

         hdm.tblFinalKey.First();
         while not hdm.tblFinalKey.Eof do begin
            IncPrgBar();
            if hdm.tblFinalKey.FieldByName('SubKey').AsString <> 'FINALKEY' then begin
               hdm.tblFinalKey.Edit();
               hdm.tblFinalKey.FieldByName('Starts').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('Wins').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('WinPct').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalOdds').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('AvgOdds').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalWagered').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalWon').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalProfitLoss').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalProfitLossPct').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('ValueBet').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('MinOdds').AsFloat := 9999;
               hdm.tblFinalKey.FieldByName('MaxOdds').AsFloat := 0;
               hdm.tblFinalKey.Post();
            end;
            hdm.tblFinalKey.Next();
         end;
      end;

      if (bOneDay) then begin
         hdm.tblEntries.IndexName := 'ByRangeRaceDate';

         hdm.tblEntries.SetRangeStart;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.SetRangeEnd;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.ApplyRange;
      end;

      InitPrgBar(hdm.tblEntries.RecordCount);

      iStaCnt := 0;
      iTotalCnt := 0;

      hdm.tblEntries.First();
      while not hdm.tblEntries.Eof do begin

         if (iStaCnt > BATCH_SIZE) then begin
            if (bOneDay) then begin
               UpdateStatusbar('Updating HARNESS Keys - ' +
                  hdm.tblEntries.FieldByName('TrkCode').AsString + ' ' +
                  hdm.tblEntries.FieldByName('RaceDate').AsString + ' Race # ' +
                  hdm.tblEntries.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(hdm.tblEntries.RecordCount));
            end else begin
               UpdateStatusbar('Creating HARNESS Keys - ' +
                  hdm.tblEntries.FieldByName('TrkCode').AsString + ' ' +
                  hdm.tblEntries.FieldByName('RaceDate').AsString + ' Race # ' +
                  hdm.tblEntries.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(hdm.tblEntries.RecordCount));
            end;
            Application.ProcessMessages();
            iStaCnt := 0;
            if not hdm.dbBuggy.InTransaction then begin
               hdm.dbBuggy.StartTransaction();
            end else begin
               if hdm.dbBuggy.InTransaction then begin
                  hdm.dbBuggy.Commit;
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;

         IncPrgBar();

         if not (bOneDay) then begin

            if (hdm.tblEntries.FieldByName('Odds').AsFloat <= 0) then begin
               hdm.tblEntries.Next();
               continue;
            end;

            if (hdm.tblEntries.FieldByName('FinishPos').AsFloat <= 0) then begin
               hdm.tblEntries.Next();
               continue;
            end;
         end;

         hdm.tblEntries.Edit();

         // Connection Key
         sSubKey := 'TRN/DRV';
         sConnectionKey := GetHarnessConnectionKey(hdm.tblRaces, hdm.tblEntries);
         hdm.tblEntries.FieldByName('ConnectionKey').AsString := sConnectionKey;

         if not (bOneDay) then begin
            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sConnectionKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblFinalKey.Edit();
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end else begin
               hdm.tblFinalKey.Append();
               hdm.tblFinalKey.FieldByName('FinalKey').AsString := sConnectionKey;
               hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end;
         end;

         // Post Pos Key
         sSubKey := 'POST-POS';
         sPostPosKey := GetHarnessPostPosKey(hdm.tblRaces, hdm.tblEntries);
         hdm.tblEntries.FieldByName('PostPosKey').AsString := sPostPosKey;

         if not (bOneDay) then begin
            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sPostPosKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblFinalKey.Edit();
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end else begin
               hdm.tblFinalKey.Append();
               hdm.tblFinalKey.FieldByName('FinalKey').AsString := sPostPosKey;
               hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end;
         end;

         // Speed Earnings Key
         sSubKey := 'SPD-ERN';
         sSpeedEarningsKey := GetHarnessSpeedEarningsKey(hdm.tblRaces, hdm.tblEntries);
         hdm.tblEntries.FieldByName('SpdEarnKey').AsString := sSpeedEarningsKey;

         if not (bOneDay) then begin
            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sSpeedEarningsKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblFinalKey.Edit();
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end else begin
               hdm.tblFinalKey.Append();
               hdm.tblFinalKey.FieldByName('FinalKey').AsString := sSpeedEarningsKey;
               hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end;
         end;

         // Default Key
         sSubKey := 'DEFAULTKEY';
         sDefaultKey := GetHarnessDefaultKey(hdm.tblRaces, hdm.tblEntries);
         hdm.tblEntries.FieldByName('DefaultKey').AsString := sDefaultKey;

         if not (bOneDay) then begin
            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sDefaultKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblFinalKey.Edit();
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end else begin
               hdm.tblFinalKey.Append();
               hdm.tblFinalKey.FieldByName('FinalKey').AsString := sDefaultKey;
               hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
               HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
               hdm.tblFinalKey.Post();
            end;
         end;


         hdm.tblEntries.Post();
         hdm.tblEntries.Next();
      end;

   except
      if hdm.dbBuggy.InTransaction then begin
         hdm.dbBuggy.Rollback();
      end;
      CloseTable(hdm.tblEntries);
      CloseTable(hdm.tblRaces);
      CloseTable(hdm.tblFinalKey);
      ClearPrgStatusBars();
   end;

   if hdm.dbBuggy.InTransaction then begin
      hdm.dbBuggy.Commit;
   end;

   CloseTable(hdm.tblRaces);
   CloseTable(hdm.tblEntries);
   CloseTable(hdm.tblFinalKey);
   ClearPrgStatusBars();

end;


procedure CreateHarnessFinalKey
   (
   iIncCnt: integer;
   bOneDay: boolean
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;

   sFinalKey: string;
   sSubKey: string;

   sPostPosKey: string;
   sDefaultKey: string;
   sConnectionKey: string;

   procedure HarnessSummaryFlds(tblE: TDBISAMTable; tblFK: TDBISAMTable);
   var
      fStarts: double;
      fWins: double;
      fWinPct: double;

      fFldstarts: double;
      fTotalWins: double;
      fTotalWinPct: double;
      fTotalWagered: double;
      fTotalWon: double;
      fTotalProfitLoss: double;
      fTotalProfitLossPct: double;

      fValueBet: double;

      fAvgOdds: double;
      fMinOdds: double;
      fMaxOdds: double;
   begin

      tblFK.FieldByName('Starts').AsInteger := tblFK.FieldByName('Starts').AsInteger + 1;

      if (tblE.FieldByName('FinishPos').AsInteger = 1) then begin
         tblFK.FieldByName('Wins').AsInteger := tblFK.FieldByName('Wins').AsInteger + 1;
      end;

      if (tblE.FieldByName('FinishPos').AsInteger = 1) then begin
         tblFK.FieldByName('TotalOdds').AsFloat := tblFK.FieldByName('TotalOdds').AsFloat + tblE.FieldByName('Odds').AsFloat;
      end;

      if (tblFK.FieldByName('Wins').AsFloat > 0) then begin
         tblFK.FieldByName('AvgOdds').AsFloat := tblFK.FieldByName('TotalOdds').AsFloat / tblFK.FieldByName('Wins').AsFloat;
      end;

      if (tblE.FieldByName('FinishPos').AsInteger = 1) then begin

         if (tblE.FieldByName('Odds').AsFloat > 0) then begin
            if (tblE.FieldByName('Odds').AsFloat < tblFK.FieldByName('MinOdds').AsFloat) then begin
               tblFK.FieldByName('MinOdds').AsFloat := tblE.FieldByName('Odds').AsFloat;
            end;
         end;

         if (tblE.FieldByName('Odds').AsFloat > tblFK.FieldByName('MaxOdds').AsFloat) then begin
            tblFK.FieldByName('MaxOdds').AsFloat := tblE.FieldByName('Odds').AsFloat;
         end;

      end;

      fStarts := tblFK.FieldByName('Starts').AsFloat;
      fWins := tblFK.FieldByName('Wins').AsFloat;
      fAvgOdds := tblFK.FieldByName('AvgOdds').AsFloat;

      if (fStarts > 0) then begin
         fWinPct := (fWins / fStarts) * 100;
      end else begin
         fWinPct := 0;
      end;

      fTotalWagered := fStarts;
      fTotalWon := (fWins * fAvgOdds) + fWins;
      fTotalProfitLoss := Round((fTotalWon - fTotalWagered) * 100) / 100;
      fTotalProfitLossPct := (fTotalProfitLoss / fTotalWagered) * 100;
      fTotalProfitLossPct := Round((fTotalProfitLossPct) * 100) / 100;
      fTotalProfitLoss := fTotalProfitLoss;

      fValueBet := (fAvgOdds * fWinPct) / 100;

      tblFK.FieldByName('Wins').AsFloat := fWins;
      tblFK.FieldByName('WinPct').AsFloat := Round(fWinPct * 100) / 100;
      tblFK.FieldByName('TotalWagered').AsFloat := RoundTo(fTotalWagered, -2); ;
      tblFK.FieldByName('TotalWon').AsFloat := RoundTo(fTotalWon, -2); ;
      tblFK.FieldByName('TotalProfitLoss').AsFloat := RoundTo(fTotalProfitLoss, -2);
      tblFK.FieldByName('TotalProfitLossPct').AsFloat := fTotalProfitLossPct;
      tblFK.FieldByName('ValueBet').AsFloat := RoundTo(fValueBet, -2);
      tblFK.FieldByName('AvgOdds').AsFloat := RoundTo(fAvgOdds, -2);

   end;

begin

   hLog.AddToLog('CreateHarnessFinalKey', msevOperation);
   try
      CloseTable(hdm.tblEntries);
      OpenTable(hdm.tblEntries);

      CloseTable(hdm.tblRaces);
      OpenTable(hdm.tblRaces);

      try
         OpenTable(hdm.tblFinalKey);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      if (not bOneDay) then begin
         UpdateStatusbar('Clearing FINAL ORDER Key');
         Application.ProcessMessages();

         InitPrgBar(hdm.tblFinalKey.RecordCount);

         iStaCnt := 0;
         iTotalCnt := 0;

         hdm.tblFinalKey.First();
         while not hdm.tblFinalKey.Eof do begin
            IncPrgBar();

            hdm.tblFinalKey.Edit();
            if hdm.tblFinalKey.FieldByName('SubKey').AsString = 'FINALKEY' then begin
               hdm.tblFinalKey.FieldByName('Starts').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('Wins').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('WinPct').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalOdds').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('AvgOdds').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalWagered').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalWon').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalProfitLoss').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('TotalProfitLossPct').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('ValueBet').AsFloat := 0;
               hdm.tblFinalKey.FieldByName('MinOdds').AsFloat := 9999;
               hdm.tblFinalKey.FieldByName('MaxOdds').AsFloat := 0;
               hdm.tblFinalKey.Post();
            end;
            hdm.tblFinalKey.Next();
         end;
      end;

      if (bOneDay) then begin
         hdm.tblEntries.IndexName := 'ByRangeRaceDate';

         hdm.tblEntries.SetRangeStart;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.SetRangeEnd;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.ApplyRange;
      end;

      InitPrgBar(hdm.tblEntries.RecordCount);

      iStaCnt := 0;
      iTotalCnt := 0;

      hdm.tblEntries.First();
      while not hdm.tblEntries.Eof do begin

         if (iStaCnt > BATCH_SIZE) then begin
            if (bOneDay) then begin
               UpdateStatusbar('Updating HARNESS FINAL Key - ' +
                  hdm.tblEntries.FieldByName('TrkCode').AsString + ' ' +
                  hdm.tblEntries.FieldByName('RaceDate').AsString + ' Race # ' +
                  hdm.tblEntries.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(hdm.tblEntries.RecordCount));
            end else begin
               UpdateStatusbar('Creating HARNESS FINAL Key - ' +
                  hdm.tblEntries.FieldByName('TrkCode').AsString + ' ' +
                  hdm.tblEntries.FieldByName('RaceDate').AsString + ' Race # ' +
                  hdm.tblEntries.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(hdm.tblEntries.RecordCount));
            end;
            Application.ProcessMessages();
            iStaCnt := 0;
            if not hdm.dbBuggy.InTransaction then begin
               hdm.dbBuggy.StartTransaction();
            end else begin
               if hdm.dbBuggy.InTransaction then begin
                  hdm.dbBuggy.Commit;
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;

         IncPrgBar();

         if (hdm.tblEntries.FieldByName('Odds').AsFloat <= 0) then begin
            hdm.tblEntries.Next();
            continue;
         end;

         if (hdm.tblEntries.FieldByName('FinishPos').AsFloat <= 0) then begin
            hdm.tblEntries.Next();
            continue;
         end;


         hdm.tblEntries.Edit();
         sSubKey := 'FINALKEY';
         sFinalKey := GetHarnessFinalKey(hdm.tblRaces, hdm.tblEntries);
         hdm.tblEntries.FieldByName('FinalKey').AsString := sFinalKey;

         hdm.tblFinalKey.IndexName := '';
         hdm.tblFinalKey.SetKey();
         hdm.tblFinalKey.FieldByName('FinalKey').AsString := sFinalKey;
         hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
         if (hdm.tblFinalKey.GotoKey()) then begin
            hdm.tblFinalKey.Edit();
            HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
            hdm.tblFinalKey.Post();
         end else begin
            hdm.tblFinalKey.Append();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sFinalKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            HarnessSummaryFlds(hdm.tblEntries, hdm.tblFinalKey);
            hdm.tblFinalKey.Post();
         end;

         hdm.tblEntries.Next();
      end;

   except
      if hdm.dbBuggy.InTransaction then begin
         hdm.dbBuggy.Rollback();
      end;
      CloseTable(hdm.tblEntries);
      CloseTable(hdm.tblRaces);
      CloseTable(hdm.tblFinalKey);
      ClearPrgStatusBars();
   end;

   if hdm.dbBuggy.InTransaction then begin
      hdm.dbBuggy.Commit;
   end;

   CloseTable(hdm.tblRaces);
   CloseTable(hdm.tblEntries);
   CloseTable(hdm.tblFinalKey);
   ClearPrgStatusBars();

end;

procedure UpdateHarnessKeys
   (
   iIncCnt: integer;
   bOneDay: boolean
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;

   sFinalKey: string;
   sSubKey: string;

   sPostPosKey: string;
   sDefaultKey: string;
   sConnectionKey: string;
   sSpeedEarningsKey: string;


begin

   hLog.AddToLog('UpdateHarnessKeys', msevOperation);
   try
      CloseTable(hdm.tblEntries);
      OpenTable(hdm.tblEntries);

      CloseTable(hdm.tblRaces);
      OpenTable(hdm.tblRaces);

      try
         OpenTable(hdm.tblFinalKey);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;


      if (bOneDay) then begin
         hdm.tblEntries.IndexName := 'ByRangeRaceDate';

         hdm.tblEntries.SetRangeStart;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.SetRangeEnd;
         hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         hdm.tblEntries.KeyFieldCount := 1;

         hdm.tblEntries.ApplyRange;
      end;

      InitPrgBar(hdm.tblEntries.RecordCount);

      iStaCnt := 0;
      iTotalCnt := 0;

      hdm.tblEntries.First();
      while not hdm.tblEntries.Eof do begin

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusbar('Updating HARNESS Keys - ' +
               hdm.tblEntries.FieldByName('TrkCode').AsString + ' ' +
               hdm.tblEntries.FieldByName('RaceDate').AsString + ' Race # ' +
               hdm.tblEntries.FieldByName('RaceNbr').AsString + ' ' +
               IntToStr(iTotalCnt) + ' of ' + IntToStr(hdm.tblEntries.RecordCount));
            Application.ProcessMessages();
            iStaCnt := 0;
            if not hdm.dbBuggy.InTransaction then begin
               hdm.dbBuggy.StartTransaction();
            end else begin
               if hdm.dbBuggy.InTransaction then begin
                  hdm.dbBuggy.Commit;
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;

         IncPrgBar();

         hdm.tblEntries.Edit();
         //         try
         //            sSubKey := 'TRN/DRV';
         //            sConnectionKey := GetHarnessConnectionKey(hdm.tblRaces, hdm.tblEntries);
         //            hdm.tblEntries.FieldByName('ConnectionKey').AsString := sConnectionKey;
         //            hdm.tblFinalKey.IndexName := '';
         //            hdm.tblFinalKey.SetKey();
         //            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sConnectionKey;
         //            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
         //            if (hdm.tblFinalKey.GotoKey()) then begin
         //               hdm.tblEntries.FieldByName('ConnectionStarts').AsInteger := hdm.tblFinalKey.FieldByName('Starts').AsInteger;
         //               hdm.tblEntries.FieldByName('ConnectionWins').AsInteger := hdm.tblFinalKey.FieldByName('Wins').AsInteger;
         //               hdm.tblEntries.FieldByName('ConnectionWinPct').AsFloat := hdm.tblFinalKey.FieldByName('WinPct').AsFloat;
         //               hdm.tblEntries.FieldByName('ConnectionValueBet').AsFloat := hdm.tblFinalKey.FieldByName('ValueBet').AsFloat;
         //            end else begin
         //               hdm.tblEntries.FieldByName('ConnectionStarts').AsInteger := -1;
         //               hdm.tblEntries.FieldByName('ConnectionWins').AsInteger := -1;
         //               hdm.tblEntries.FieldByName('ConnectionWinPct').AsFloat := -1;
         //               hdm.tblEntries.FieldByName('ConnectionValueBet').AsFloat := -1;
         //            end;
         //         except
         //            on E: Exception do hLog.AddToLog(E.Message, msevException);
         //         end;

         try
            sSubKey := 'POST-POS';
            sPostPosKey := GetHarnessPostPosKey(hdm.tblRaces, hdm.tblEntries);
            hdm.tblEntries.FieldByName('PostPosKey').AsString := sPostPosKey;
            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sPostPosKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblEntries.FieldByName('PostPosStarts').AsInteger := hdm.tblFinalKey.FieldByName('Starts').AsInteger;
               hdm.tblEntries.FieldByName('PostPosWins').AsInteger := hdm.tblFinalKey.FieldByName('Wins').AsInteger;
               hdm.tblEntries.FieldByName('PostPosWinPct').AsFloat := hdm.tblFinalKey.FieldByName('WinPct').AsFloat;
               hdm.tblEntries.FieldByName('PostPosValueBet').AsFloat := hdm.tblFinalKey.FieldByName('ValueBet').AsFloat;
            end else begin
               hdm.tblEntries.FieldByName('PostPosStarts').AsInteger := -1;
               hdm.tblEntries.FieldByName('PostPosWins').AsInteger := -1;
               hdm.tblEntries.FieldByName('PostPosWinPct').AsFloat := -1;
               hdm.tblEntries.FieldByName('PostPosValueBet').AsFloat := -1;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         try
            sSubKey := 'SPD-EARN';
            sPostPosKey := GetHarnessSpeedEarningsKey(hdm.tblRaces, hdm.tblEntries);
            hdm.tblEntries.FieldByName('SpdEarnKey').AsString := sSpeedEarningsKey;
            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sSpeedEarningsKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblEntries.FieldByName('SpdEarnStarts').AsInteger := hdm.tblFinalKey.FieldByName('Starts').AsInteger;
               hdm.tblEntries.FieldByName('SpdEarnWins').AsInteger := hdm.tblFinalKey.FieldByName('Wins').AsInteger;
               hdm.tblEntries.FieldByName('SpdEarnWinPct').AsFloat := hdm.tblFinalKey.FieldByName('WinPct').AsFloat;
               hdm.tblEntries.FieldByName('SpdEarnValueBet').AsFloat := hdm.tblFinalKey.FieldByName('ValueBet').AsFloat;
            end else begin
               hdm.tblEntries.FieldByName('SpdEarnStarts').AsInteger := -1;
               hdm.tblEntries.FieldByName('SpdEarnWins').AsInteger := -1;
               hdm.tblEntries.FieldByName('SpdEarnWinPct').AsFloat := -1;
               hdm.tblEntries.FieldByName('SpdEarnValueBet').AsFloat := -1;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         try
            sSubKey := 'DEFAULTKEY';
            sDefaultKey := GetHarnessDefaultKey(hdm.tblRaces, hdm.tblEntries);
            hdm.tblEntries.FieldByName('DefaultKey').AsString := sDefaultKey;
            hdm.tblFinalKey.IndexName := '';
            hdm.tblFinalKey.SetKey();
            hdm.tblFinalKey.FieldByName('FinalKey').AsString := sDefaultKey;
            hdm.tblFinalKey.FieldByName('SubKey').AsString := sSubKey;
            if (hdm.tblFinalKey.GotoKey()) then begin
               hdm.tblEntries.FieldByName('DefaultStarts').AsInteger := hdm.tblFinalKey.FieldByName('Starts').AsInteger;
               hdm.tblEntries.FieldByName('DefaultWins').AsInteger := hdm.tblFinalKey.FieldByName('Wins').AsInteger;
               hdm.tblEntries.FieldByName('DefaultWinPct').AsFloat := hdm.tblFinalKey.FieldByName('WinPct').AsFloat;
               hdm.tblEntries.FieldByName('DefaultValueBet').AsFloat := hdm.tblFinalKey.FieldByName('ValueBet').AsFloat;
            end else begin
               hdm.tblEntries.FieldByName('DefaultStarts').AsInteger := -1;
               hdm.tblEntries.FieldByName('DefaultWins').AsInteger := -1;
               hdm.tblEntries.FieldByName('DefaultWinPct').AsFloat := -1;
               hdm.tblEntries.FieldByName('DefaultValueBet').AsFloat := -1;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
         hdm.tblEntries.Post();
         hdm.tblEntries.Next();
      end;

   except
      if hdm.dbBuggy.InTransaction then begin
         hdm.dbBuggy.Rollback();
      end;
      CloseTable(hdm.tblEntries);
      CloseTable(hdm.tblRaces);
      CloseTable(hdm.tblFinalKey);
      ClearPrgStatusBars();
   end;

   if hdm.dbBuggy.InTransaction then begin
      hdm.dbBuggy.Commit;
   end;

   CloseTable(hdm.tblRaces);
   CloseTable(hdm.tblEntries);
   CloseTable(hdm.tblFinalKey);
   ClearPrgStatusBars();

end;

procedure SetHarnessRankings(bOneDay: boolean);
begin

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByPowerRank', 'PowerRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByAvgSpeedRank', 'AvgSpeedRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByAvgClassRank', 'AvgClassRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByTrnWinPctRank', 'TrnWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByTrnUTRRank', 'TrnUTRRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByDrvWinPctRank', 'DrvWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByDrvUDRRank', 'DrvUDRRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByWinIndexRank', 'WinIndexRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByMorningLineTo1Rank', 'MorningLineTo1Rank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByLast6EarningsRank', 'Last6EarningsRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'BySireWinPctRank', 'SireWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByTrnDrvWinPctRank', 'TrnDrvWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByPaceStyle1stQRank', 'PaceStyle1stQRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByPaceStyle2ndQRank', 'PaceStyle2ndQRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByPaceStyle3rdQRank', 'PaceStyle3rdQRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByPaceStyleFinishRank', 'PaceStyleFinishRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


procedure SetHarnessKeyRankings(bOneDay: boolean);
begin

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByConnectionWinPctRank', 'ConnectionWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByDefaultWinPctRank', 'DefaultWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByPostPosWinPctRank', 'PostPosWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'BySpdEarnWinPctRank', 'SpdEarnWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


end;

procedure SetHarnessFinalRankings(bOneDay: boolean);
begin

   try
      //      UpdateHarnessRankings(hdm.tblEntries, 'ByFinalWinPctRank', 'FinalWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, bOneDay);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


end;

procedure UpdateHarnessRankings
   (
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean
   );
var
   iRaceNbr: integer;
   sTrkCode: string;
   iPrevRaceNbr: integer;
   sPrevTrkCode: string;
   iRank: integer;

   iStaCnt: integer;
   iTotalCnt: integer;

begin

   iPrevRaceNbr := 0;
   sPrevTrkCode := '';
   iRank := 0;

   try
      hLog.AddToLog('UpdateHarnessRankings: ', msevOperation);

      CloseTable(tbl);
      OpenTable(tbl);

      //Select GameID , Game_Name,
      //    SUM(if(IncomeType=101 then Value else 0) ) as Plays,
      //    SUM(if(IncomeType=102 then Value else 0) ) as free,
      //    SUM(if(IncomeType=103 then Value else 0) ) as Income,
      //    SUM(if(IncomeType=104 then Value else 0) ) as XPayout
      //    INTO  "\Memory\temp1"
      //    FROM ParentGame
      //    LEFT OUTER JOIN GameIncomeItems on GameIncomeItems.GameID=Game.GameID
      //    WHERE Businessdate='2004-12-18'
      //    and Controller_type <> 6
      //    GROUP BY ParentGameID  <<<< Where is ParentGameID coming from ?;
      //
      //Select GameID, Game_Name, Plays, Free, Income, XPayout, RUNSUM(1) AS Rank
      //    FROM "\Memory\temp1"
      //    GROUP BY GameID
      //    Order By Income Desc;

      //Select RaceId , Game_Name,
      //    SUM(if(IncomeType=101 then Value else 0) ) as Plays,
      //    SUM(if(IncomeType=102 then Value else 0) ) as free,
      //    SUM(if(IncomeType=103 then Value else 0) ) as Income,
      //    SUM(if(IncomeType=104 then Value else 0) ) as XPayout
      //    INTO  "\Memory\temp1"
      //    FROM ParentGame
      //    LEFT OUTER JOIN GameIncomeItems on GameIncomeItems.GameID=Game.GameID
      //    WHERE Businessdate='2004-12-18'
      //    and Controller_type <> 6
      //    GROUP BY ParentGameID  <<<< Where is ParentGameID coming from ?;
      //
      //Select GameID, Game_Name, Plays, Free, Income, XPayout, RUNSUM(1) AS Rank
      //    FROM "\Memory\temp1"
      //    GROUP BY GameID
      //    Order By Income Desc;



      tbl.IndexName := sIndexName;

      if (bOneDay) then begin
         tbl.SetRange([gedtOverrideDate], [gedtOverrideDate]);
      end;

      InitPrgBar(tbl.RecordCount);
      tbl.First();

      iPrevRaceNbr := 0;
      sPrevTrkCode := '';

      iStaCnt := 0;
      iTotalCnt := 0;

      staBar.SimpleText := sIndexName + ' - ' +
         tbl.FieldByName('TrkCode').AsString + ' ' +
         tbl.FieldByName('RaceDate').AsString;
      Application.ProcessMessages();

      while not tbl.Eof do begin
         IncPrgBar();
         Application.ProcessMessages();

         if (iStaCnt > BATCH_SIZE) then begin

            staBar.SimpleText := sIndexName + ' - ' +
               tbl.FieldByName('TrkCode').AsString + ' ' +
               tbl.FieldByName('RaceDate').AsString + ' Race # ' +
               tbl.FieldByName('RaceNbr').AsString + ' ' +
               IntToStr(iTotalCnt) + ' of ' + IntToStr(tbl.RecordCount);
            Application.ProcessMessages();
            iStaCnt := 0;
            if not hdm.dbBuggy.InTransaction then begin
               hdm.dbBuggy.StartTransaction();
            end else begin
               if hdm.dbBuggy.InTransaction then begin
                  hdm.dbBuggy.Commit;
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;

         iRaceNbr := tbl.FieldByName('RaceNbr').AsInteger;
         sTrkCode := tbl.FieldByName('TrkCode').AsString;

         if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin
            tbl.Edit();
            Inc(iRank);
            if (iRank <= 10) then begin
               tbl.FieldByName(sFldName).AsInteger := iRank;
            end else begin
               tbl.FieldByName(sFldName).AsInteger := 11;
            end;
            iPrevRaceNbr := iRaceNbr;
            sPrevTrkCode := sTrkCode;
            tbl.Post();
         end else begin
            tbl.Edit();
            iRank := 1;
            tbl.FieldByName(sFldName).AsInteger := iRank;
            iPrevRaceNbr := iRaceNbr;
            sPrevTrkCode := sTrkCode;
            tbl.Post();
         end;

         tbl.Next();
         Application.ProcessMessages();
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         if hdm.dbBuggy.InTransaction then begin
            hdm.dbBuggy.Rollback();
         end;
         CloseTable(tbl);
         ClearPrgStatusBars();
      end;
   end;

   if hdm.dbBuggy.InTransaction then begin
      hdm.dbBuggy.Commit();
   end;
   tbl.Filtered := False;
   tbl.IndexName := '';
   CloseTable(tbl);
   ClearPrgStatusBars();

end;

procedure ImportFlashNet(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sBuf: string;
   sSearch: string;

   tsFile: TSearchRec;

   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;

begin

   hLog.AddToLog('ImportFlashNet', msevOperation);
   try

      //      prgBar.Position := 0;
      //      pnlPrgBar.Visible := False;

      if gbUseOverrideDate then begin
         dtDownloadDate := gedtOverrideDate;
      end else begin
         dtDownloadDate := Now();
      end;

      //******
      iAttributes := faAnyFile;
      sPath := AXCIS_BUGGY_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*.htm';
      end else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         sFileName := sFileName + '*.htm';
         sSearch := sPath + sFileName;
      end;
      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := iEndPos - 5;

         sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
         sFileTrkCode := UpperCase(sFileTrkCode);

         sTmp := CopyStr(tsFile.Name, iStartPos, 4);
         sRaceMM := CopyStr(sTmp, 1, 2);
         sRaceDD := CopyStr(sTmp, 3, 2);

         sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
         iLen := Length(sTmp);
         sTmp := CopyStr(sTmp, 9, iLen - 8);
         sFileName := sPath + sTmp;
         sFileName := UpperCase(sFileName);
         DeleteFile(sFileTrkCode + sRaceMM + sRaceDD + 'FlashNet.txt');
         ParseFlashNet(sFileName, sFileTrkCode + 'FlashNet.txt', sFileTrkCode, dtDownloadDate);

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;

            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            sTmp := CopyStr(tsFile.Name, iStartPos, 4);
            sRaceMM := CopyStr(sTmp, 1, 2);
            sRaceDD := CopyStr(sTmp, 3, 2);

            sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
            iLen := Length(sTmp);
            sTmp := CopyStr(sTmp, 9, iLen - 8);
            sFileName := sPath + sTmp;
            sFileName := UpperCase(sFileName);
            DeleteFile('FlashNet.txt');
            ParseFlashNet(sFileName, sFileTrkCode + 'FlashNet.txt', sFileTrkCode, dtDownloadDate);

         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         FindClose(tsFile);
      end;
   end;

   ClearPrgStatusBars();

end;


procedure ParseFlashNet(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
var
   sIn: string;
   sOut: string;

   fsIn: TFileStream;
   fsOut: TFileStream;
   lstIn: TStringList;
   lstOut: TStringList;
   lstSplit: TStringList;

   iIdx: integer;
   iLen: integer;
   iStart: integer;
   iEndPos: Integer;

   iBotOdds: Integer;
   iTopOdds: Integer;

   sBotOdds: string;
   sTopOdds: string;

   sTmp: string;

   iLineType: integer;
   iRaceNbr: integer;

   sRaceKey: string;
   sPrevRaceKey: string;
   sWagerInfo: string;
   sPostTime: string;
   sDistance: string;
   sGait: string;
   sPurse: string;
   sRaceDesc: string;
   sClassRating: string;

   sTrkCode: string;
   sRaceNbr: string;
   iPostPos: integer;
   sProgramNbr: string;
   iProgramNbrSort: integer;
   sHorseName: string;
   sRaceType: string;
   sWinIndex: string;
   sMorningLineDesc: string;
   fMorningLineTo1: double;
   sMed: string;
   sEquip: string;
   fPower: double;
   sValueIndicator: string;
   sDollarIndicator: string;
   iAvgSpeed: integer;
   iAvgClass: integer;
   sClassChange: string;
   fPaceStyle1stQ: double;
   fPaceStyle2ndQ: double;
   fPaceStyle3rdQ: double;
   fPaceStyleFinish: double;
   iPaceStyleNbrOfRaces: integer;
   sTrainer: string;
   iTrnStarts: integer;
   iTrnWinPct: integer;
   iTrnPlcPct: integer;
   iTrnShoPct: integer;
   fTrnUTR: double;
   sDriver: string;
   iDrvStarts: integer;
   iDrvWinPct: integer;
   iDrvPlcPct: integer;
   iDrvShoPct: integer;
   fDrvUDR: double;
   iTrnDrvStarts: integer;
   iTrnDrvWinPct: integer;
   iRace1BackDaysAgo: integer;
   sRace1BackTrkCode: string;
   iRace1BackSpeed: integer;
   iRace1BackClass: integer;
   sRace1BackTime: string;
   fRace1Back4thQ: double;
   sRace1BackFinish: string;
   sRace1BackFinishLengths: string;
   iRace2BackDaysAgo: integer;
   sRace2BackTrkCode: string;
   iRace2BackSpeed: integer;
   iRace2BackClass: integer;
   sRace2BackTime: string;
   fRace2Back4thQ: double;
   sRace2BackFinish: string;
   sRace2BackFinishLengths: string;
   iRace3BackDaysAgo: integer;
   sRace3BackTrkCode: string;
   iRace3BackSpeed: integer;
   iRace3BackClass: integer;
   sRace3BackTime: string;
   fRace3Back4thQ: double;
   sRace3BackFinish: string;
   sRace3BackFinishLengths: string;
   iThisYearStarts: integer;
   iThisYearWins: integer;
   iThisYearPlcs: integer;
   iThisYearShos: integer;
   iThisYearEPS: integer;
   sThisYearBestTime: string;
   sThisYearBestTimeTrkCode: string;
   iLastYearStarts: integer;
   iLastYearWins: integer;
   iLastYearPlcs: integer;
   iLastYearShos: integer;
   iLastYearEPS: integer;
   sLastYearBestTime: string;
   sLastYearBestTimeTrkCode: string;
   iLast6Earnings: integer;
   iSireStarts: integer;
   iSireWinPct: integer;

   bAddLines: boolean;

   sLocalTime: string;
   dtLocalTimeOfRace: TDateTime;
   dtEstTimeOfRace: TDateTime;
   sHour: string;
   sMinute: string;
   wHour: word;
   wMinute: word;
   fTimeDiff: double;
   sTrkFullName: string;
   bPrintedOnValueSheet: boolean;
   bYouBetTrack: boolean;

   iPos: integer;
   iHPos: integer;
   iFPPos: integer;

   procedure InitVariables();
   begin
      iLineType := 0;
      iRaceNbr := 0;

      sRaceKey := '';
      sPrevRaceKey := '';
      sWagerInfo := '';
      sPostTime := '';
      sLocalTime := '';
      sDistance := '';
      sGait := '';
      sPurse := '';
      sRaceDesc := '';
      sClassRating := '';

      sTrkCode := '';
      sRaceNbr := '';
      iPostPos := 0;
      sProgramNbr := '';
      iProgramNbrSort := 0;
      sHorseName := '';
      sRaceType := '';
      sWinIndex := '';
      sMorningLineDesc := '';
      fMorningLineTo1 := 0;
      sMed := '';
      sEquip := '';
      fPower := 0;
      sValueIndicator := '';
      sDollarIndicator := '';
      iAvgSpeed := 0;
      iAvgClass := 0;
      sClassChange := '';
      fPaceStyle1stQ := 0;
      fPaceStyle2ndQ := 0;
      fPaceStyle3rdQ := 0;
      fPaceStyleFinish := 0;
      iPaceStyleNbrOfRaces := 0;
      sTrainer := '';
      iTrnStarts := 0;
      iTrnWinPct := 0;
      iTrnPlcPct := 0;
      iTrnShoPct := 0;
      fTrnUTR := 0;
      sDriver := '';
      iDrvStarts := 0;
      iDrvWinPct := 0;
      iDrvPlcPct := 0;
      iDrvShoPct := 0;
      fDrvUDR := 0;
      iTrnDrvStarts := 0;
      iTrnDrvWinPct := 0;
      iRace1BackDaysAgo := 0;
      sRace1BackTrkCode := '';
      iRace1BackSpeed := 0;
      iRace1BackClass := 0;
      sRace1BackTime := '';
      fRace1Back4thQ := 0;
      sRace1BackFinish := '';
      sRace1BackFinishLengths := '';
      iRace2BackDaysAgo := 0;
      sRace2BackTrkCode := '';
      iRace2BackSpeed := 0;
      iRace2BackClass := 0;
      sRace2BackTime := '';
      fRace2Back4thQ := 0;
      sRace2BackFinish := '';
      sRace2BackFinishLengths := '';
      iRace3BackDaysAgo := 0;
      sRace3BackTrkCode := '';
      iRace3BackSpeed := 0;
      iRace3BackClass := 0;
      sRace3BackTime := '';
      fRace3Back4thQ := 0;
      sRace3BackFinish := '';
      sRace3BackFinishLengths := '';
      iThisYearStarts := 0;
      iThisYearWins := 0;
      iThisYearPlcs := 0;
      iThisYearShos := 0;
      iThisYearEPS := 0;
      sThisYearBestTime := '';
      sThisYearBestTimeTrkCode := '';
      iLastYearStarts := 0;
      iLastYearWins := 0;
      iLastYearPlcs := 0;
      iLastYearShos := 0;
      iLastYearEPS := 0;
      sLastYearBestTime := '';
      sLastYearBestTimeTrkCode := '';
      iLast6Earnings := 0;
      iSireStarts := 0;
      iSireWinPct := 0;
      bYouBetTrack := False;

   end;

   function GetRaceNbr(sLine: string): integer;
   begin
      Result := 999;

      if (SmartPos('RACE 20', sLine) > 0) then begin
         Result := 20;
         Exit;
      end;
      if (SmartPos('RACE 19', sLine) > 0) then begin
         Result := 19;
         Exit;
      end;
      if (SmartPos('RACE 18', sLine) > 0) then begin
         Result := 18;
         Exit;
      end;
      if (SmartPos('RACE 17', sLine) > 0) then begin
         Result := 17;
         Exit;
      end;
      if (SmartPos('RACE 16', sLine) > 0) then begin
         Result := 16;
         Exit;
      end;
      if (SmartPos('RACE 15', sLine) > 0) then begin
         Result := 15;
         Exit;
      end;
      if (SmartPos('RACE 14', sLine) > 0) then begin
         Result := 14;
         Exit;
      end;
      if (SmartPos('RACE 13', sLine) > 0) then begin
         Result := 13;
         Exit;
      end;
      if (SmartPos('RACE 12', sLine) > 0) then begin
         Result := 12;
         Exit;
      end;
      if (SmartPos('RACE 11', sLine) > 0) then begin
         Result := 11;
         Exit;
      end;
      if (SmartPos('RACE 10', sLine) > 0) then begin
         Result := 10;
         Exit;
      end;
      if (SmartPos('RACE 9', sLine) > 0) then begin
         Result := 9;
         Exit;
      end;
      if (SmartPos('RACE 8', sLine) > 0) then begin
         Result := 8;
         Exit;
      end;
      if (SmartPos('RACE 7', sLine) > 0) then begin
         Result := 7;
         Exit;
      end;
      if (SmartPos('RACE 6', sLine) > 0) then begin
         Result := 6;
         Exit;
      end;
      if (SmartPos('RACE 5', sLine) > 0) then begin
         Result := 5;
         Exit;
      end;
      if (SmartPos('RACE 4', sLine) > 0) then begin
         Result := 4;
         Exit;
      end;
      if (SmartPos('RACE 3', sLine) > 0) then begin
         Result := 3;
         Exit;
      end;
      if (SmartPos('RACE 2', sLine) > 0) then begin
         Result := 2;
         Exit;
      end;
      if (SmartPos('RACE 1', sLine) > 0) then begin
         Result := 1;
         Exit;
      end;
   end;

   procedure SplitLine();
   begin
      try
         Split(sTmp, '|', lstSplit);
         if lstSplit.Count > 6 then begin
            sRaceKey := StringListTrim((UpperCase(lstSplit[0])));
            iRaceNbr := GetRaceNbr(sRaceKey);
            sWagerInfo := StringListTrim((UpperCase(lstSplit[2])));
            sPostTime := StringListTrim((UpperCase(lstSplit[3])));
            sLocalTime := StringListTrim((UpperCase(lstSplit[3])));
            sLocalTime := StringListTrim((FastReplace(sLocalTime, 'POST TIME', '', True)));

            iEndPos := SmartPos(':', sLocalTime);
            iLen := Length(sLocalTime);
            sHour := CopyStr(sLocalTime, 1, (iEndPos - 1));
            sMinute := CopyStr(sLocalTime, iEndPos + 1, 2);
            wHour := atow(sHour) + 12;
            wMinute := atow(sMinute);
            if (wHour >= 24) then begin
               wHour := wHour - 24;
            end;
            try
               dtLocalTimeOfRace := EncodeTime(wHour, wMinute, 0, 0);
            except on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            dtEstTimeOfRace := AddHrs(dtLocalTimeOfRace, fTimeDiff);

            sDistance := Trim(UpperCase(lstSplit[4]));
            if (SmartPos('PACE', sDistance) > 0) then begin
               sGait := 'PACE';
            end else begin
               sGait := 'TROT';
            end;
            sDistance := FastReplace(sDistance, 'PACE', '', True);
            sDistance := FastReplace(sDistance, 'TROT', '', True);

            sClassRating := StringListTrim(UpperCase(lstSplit[5]));
            sPurse := StringListTrim(UpperCase(lstSplit[6]));
            sRaceDesc := StringListTrim(UpperCase(lstSplit[7]));
         end;
      finally
         FreeAndNil(lstSplit);
      end;
      sPrevRaceKey := sRaceKey;
   end;

   procedure CleanLine();
   begin
      sTmp := FastReplace(sTmp, '&amp;', '&', True);
      sTmp := FastReplace(sTmp, '&bull;', '|', True);
      sTmp := FastReplace(sTmp, '•', '|', True);
      sTmp := FastReplace(sTmp, 'Other Races', '|', True);
      sTmp := FastReplace(sTmp, '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16', '', True);
      sTmp := FastReplace(sTmp, '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15', '', True);
      sTmp := FastReplace(sTmp, '1 2 3 4 5 6 7 8 9 10 11 12 13 14', '', True);
      sTmp := FastReplace(sTmp, '1 2 3 4 5 6 7 8 9 10 11 12 13', '', True);
      sTmp := FastReplace(sTmp, '1 2 3 4 5 6 7 8 9 10 11 12', '', True);
      sTmp := FastReplace(sTmp, '1 2 3 4 5 6 7 8 9 10 11', '', True);
      sTmp := FastReplace(sTmp, '1 2 3 4 5 6 7 8 9 10', '', True);
      sTmp := FastReplace(sTmp, 'HELP', '|', True);
      sTmp := FastReplace(sTmp, 'POWER   SPEED', '|', True);
      sTmp := FastReplace(sTmp, 'Post Time', '|Post Time', True);
      sTmp := FastReplace(sTmp, 'LASIX USERS:', '|LASIX USERS:', True);
   end;



begin

   try

      hLog.AddToLog('ParseFlashNet: ' + sFileName, msevOperation);
      UpdateStatusBar(sFileName);
      fsIn := TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite);

      SetLength(sIn, fsIn.Size + 1);
      fsIn.Read(sIn[1], fsIn.Size);
      sOut := HtmlExtractText(sIn, False, False, False, False);
      sOut := FastReplace(sOut, Chr(160), ' ', False);

      try
         fsOut := TFileStream.Create(sSaveFileName, fmCreate);
         fsOut.WriteBuffer(sOut[1], Length(sOut));
      finally
         fsOut.Free;
      end;

   finally
      fsIn.Free;
   end;

   try
      bAddLines := False;
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;
      lstSplit := TStringList.Create;

      lstIn.LoadFromFile(sSaveFileName);
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim((lstIn[iIdx]));
         if (sTmp = '') then begin
            continue;
         end;

         if ((SmartPos('Class Rating:', sTmp) > 0) and (SmartPos('Post Time', sTmp) > 0)) then begin
            iStart := SmartPos('RACE 1', sTmp);
            if (iStart > 0) then begin
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, iStart, (iLen - iStart));
            end;
            CleanLine();
            iStart := SmartPos('Purse:', sTmp);
            if (iStart > 0) then begin
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 1, (iStart - 1)) +

               'Purse:' +
                  CopyStr(sTmp, iStart + 6, 10) +
                  '|' +
                  CopyStr(sTmp, iStart + 16, (iLen - (iStart + 16)));
            end;

            lstOut.Add(sTmp);
            bAddLines := False;
            continue;
         end;

         if (SmartPos('Win   M/L Equip', sTmp) > 0) then begin
            bAddLines := True;
         end;

         if (bAddLines) then begin
            lstOut.Add(sTmp);
         end;
      end;

   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(sSaveFileName);
      FreeAndNil(lstOut);
   end;

   //
   try
      InitVariables();

      OpenTable(hdm.tblTrack);
      OpenTable(hdm.tblRaces);
      OpenTable(hdm.tblEntries);
      OpenTable(hdm.tblProcessed);

      lstIn := TStringList.Create;
      lstIn.LoadFromFile(sSaveFileName);

      hdm.tblTrack.IndexName := '';
      hdm.tblTrack.SetKey();
      hdm.tblTrack.FieldByName('TrkCode').Value := sFileTrkCode;
      if hdm.tblTrack.GotoKey() then begin
         fTimeDiff := hdm.tblTrack.FieldByName('TimeDiff').AsFloat;
         sTrkFullName := hdm.tblTrack.FieldByName('FullName').AsString;
         bPrintedOnValueSheet := hdm.tblTrack.FieldByName('IsPrintedOnValueSheet').AsBoolean;
         bYouBetTrack := hdm.tblTrack.FieldByName('IsYouBetTrack').AsBoolean;
      end else begin
         fTimeDiff := 0;
         sTrkFullName := 'NONE';
         bPrintedOnValueSheet := False;
      end;
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);

         // End of file
         if ((SmartPos('Copyright 2005 TrackMaster', sTmp) > 0)) then begin
            hdm.tblProcessed.IndexName := '';
            hdm.tblProcessed.SetKey();
            hdm.tblProcessed.FieldByName('TrkCode').AsString := sFileTrkCode;
            hdm.tblProcessed.FieldByName('RaceDate').Value := dtFileTrkDate;

            if (not hdm.tblProcessed.GotoKey()) then begin
               hdm.tblProcessed.Append();
               hdm.tblProcessed.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblProcessed.FieldByName('RaceDate').Value := dtFileTrkDate;
               hdm.tblProcessed.Post();
            end;
            break;
         end;

         if ((SmartPos('Class Rating:', sTmp) > 0) and (SmartPos('Post Time', sTmp) > 0)) then begin
            iLineType := FLASHNET_RACE_LINE_TYPE;
            // Assigned in SplitLine()
            // sWagerInfo, sPostTime, sDistanceGait, sPurse, sRaceDesc, sClassRating
            SplitLine();

            sTrkCode := sFileTrkCode;

            hdm.tblRaces.SetKey();
            hdm.tblRaces.FieldByName('TrkCode').AsString := sFileTrkCode;
            hdm.tblRaces.FieldByName('RaceNbr').AsInteger := iRaceNbr;
            hdm.tblRaces.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;

            if (hdm.tblRaces.GotoKey()) then begin
               hdm.tblRaces.Edit();
               hdm.tblRaces.FieldByName('RangeRaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblRaces.FieldByName('WagerInfo').AsString := sWagerInfo;
               hdm.tblRaces.FieldByName('PostTime').AsString := sPostTime;
               hdm.tblRaces.FieldByName('Distance').AsString := sDistance;
               hdm.tblRaces.FieldByName('Gait').AsString := sGait;
               hdm.tblRaces.FieldByName('ClassRating').AsString := sClassRating;
               hdm.tblRaces.FieldByName('Purse').AsString := sPurse;
               hdm.tblRaces.FieldByName('RaceDesc').AsString := sRaceDesc;
               hdm.tblRaces.FieldByName('EstTimeOfRace').AsDateTime := dtEstTimeOfRace;
               hdm.tblRaces.FieldByName('LocalTimeOfRace').AsDateTime := dtLocalTimeOfRace;
               hdm.tblRaces.FieldByName('TimeDiff').AsFloat := fTimeDiff;
               hdm.tblRaces.FieldByName('TrkFullName').AsString := sTrkFullName;
               hdm.tblRaces.FieldByName('IsPrintedOnValueSheet').AsBoolean := bPrintedOnValueSheet;
               hdm.tblRaces.FieldByName('IsYouBetTrack').AsBoolean := bYouBetTrack;
               hdm.tblRaces.Post();
            end else begin
               hdm.tblRaces.Append();
               hdm.tblRaces.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblRaces.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               hdm.tblRaces.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;

               hdm.tblRaces.FieldByName('RangeRaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblRaces.FieldByName('WagerInfo').AsString := sWagerInfo;
               hdm.tblRaces.FieldByName('PostTime').AsString := sPostTime;
               hdm.tblRaces.FieldByName('Distance').AsString := sDistance;
               hdm.tblRaces.FieldByName('Gait').AsString := sGait;
               hdm.tblRaces.FieldByName('ClassRating').AsString := sClassRating;
               hdm.tblRaces.FieldByName('Purse').AsString := sPurse;
               hdm.tblRaces.FieldByName('RaceDesc').AsString := sRaceDesc;
               hdm.tblRaces.FieldByName('EstTimeOfRace').AsDateTime := dtEstTimeOfRace;
               hdm.tblRaces.FieldByName('LocalTimeOfRace').AsDateTime := dtLocalTimeOfRace;
               hdm.tblRaces.FieldByName('TimeDiff').AsFloat := fTimeDiff;
               hdm.tblRaces.FieldByName('TrkFullName').AsString := sTrkFullName;
               hdm.tblRaces.FieldByName('IsPrintedOnValueSheet').AsBoolean := bPrintedOnValueSheet;
               hdm.tblRaces.FieldByName('IsYouBetTrack').AsBoolean := bYouBetTrack;
               hdm.tblRaces.Post();
            end;

            continue;
         end;

         //
         if (SmartPos('Win   M/L Equip', sTmp) > 0) then begin
            continue;
         end;
         if (SmartPos('P#  Horse                    PP', sTmp) > 0) then begin
            iLineType := FLASHNET_HORSE_LINE_TYPE;
            continue;
         end;

         //
         if (SmartPos('1st Race Back', sTmp) > 0) then begin
            continue;
         end;
         if (SmartPos('P# Ago Track CR', sTmp) > 0) then begin
            iLineType := FLASHNET_PP_LINE_TYPE;
            continue;
         end;

         //
         if (SmartPos('DR/TR', sTmp) > 0) then begin
            continue;
         end;
         if (SmartPos('P#  Driver', sTmp) > 0) then begin
            iLineType := FLASHNET_TRN_DRV_LINE_TYPE;
            continue;
         end;

         //
         if (SmartPos('TY Record', sTmp) > 0) then begin
            continue;
         end;
         if (SmartPos('P#  St   W   P', sTmp) > 0) then begin
            iLineType := FLASHNET_RECORD_LINE_TYPE;
            continue;
         end;

         if (iLineType = FLASHNET_HORSE_LINE_TYPE) then begin
            try
               //Win   M/L Equip/         Avg Avg  Class          Pace Style
               //P#  Horse                    PP Index Odds  Med   Power   SR  CR  Change   1Q   2Q   3Q   Fin Races
               //000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999
               //123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
               //1   RIVER CITY STORM          1    8   2/1   L     74.3   79  79             2.1  2.0  2.4  3.8  10
               //3   GAVIN HALL                3  -12   9/2   L H   71.8   78  79     Up      4.5  4.7  4.6  5.2  10
               //7   AC RICK O SHAY            7  -13   8/1  2L     52.5   36  39     Up      2.7  3.7  3.8  5.0   7
               //5   OGS SUSIE P               5   43   5/1         76.2L  78  80             4.1  4.7  4.7  3.9  10
               //2   POSTER WINTERWOOD         1    8  12/1  L-     75.8   83  84             4.4  4.2  3.9  3.3  10
               //1   POWERISCAPE               1   23  12/1         60.4   58  57             3.4  4.0  4.4  3.8  10
               sProgramNbr := CopyStr(sTmp, 1, 3);
               iProgramNbrSort := GetProgramNbrSort(sProgramNbr);
               //          sEntry := ''; Remove in database
               sHorseName := CopyStr(sTmp, 5, 25);
               iPostPos := atoi(CopyStr(sTmp, 30, 2));
               sWinIndex := CopyStr(sTmp, 32, 5);
               sMorningLineDesc := Trim(CopyStr(sTmp, 37, 6));
               if SmartPos('/', sMorningLineDesc) > 0 then begin
                  iEndPos := SmartPos('/', sMorningLineDesc);
                  iLen := Length(sMorningLineDesc);
                  sTopOdds := CopyStr(sMorningLineDesc, 1, iEndPos - 1);
                  iTopOdds := atoi(sTopOdds);
                  sBotOdds := CopyStr(sMorningLineDesc, iEndPos + 1, (iLen - iEndPos));
                  iBotOdds := atoi(sBotOdds);

                  if iBotOdds > 0 then begin
                     fMorningLineTo1 := iTopOdds / iBotOdds
                  end else begin
                     fMorningLineTo1 := 0;
                  end;
               end;

               //  Med   Power   SR  CR  Change   1Q   2Q   3Q   Fin Races
               //444444455555555556666666666777777777788888888889999999999
               //345678901234567890123456789012345678901234567890123456789
               //   L     74.3   79  79             2.1  2.0  2.4  3.8  10
               //   L H   71.8   78  79     Up      4.5  4.7  4.6  5.2  10
               //  2L     52.5   36  39     Up      2.7  3.7  3.8  5.0   7
               //         76.2L  78  80             4.1  4.7  4.7  3.9  10
               //  L-     75.8   83  8412345678901  4.4  4.2  3.9  3.3  10
               sMed := CopyStr(sTmp, 45, 2);
               sEquip := CopyStr(sTmp, 47, 2);
               fPower := atof(CopyStr(sTmp, 51, 5));
               sValueIndicator := CopyStr(sTmp, 56, 1);
               sDollarIndicator := 'NO';
               if (sValueIndicator = 'B') then begin
                  sDollarIndicator := '$$';
               end;
               if ((sValueIndicator = '+') or (sValueIndicator = 'L')) then begin
                  sDollarIndicator := '$';
               end;
               iAvgSpeed := atoi(CopyStr(sTmp, 57, 4));
               iAvgClass := atoi(CopyStr(sTmp, 61, 4));
               sClassChange := Trim(CopyStr(sTmp, 65, 10));

               //   1Q   2Q   3Q  Fin Races
               //777788888888889999999999
               //678901234567890123456789
               //  2.1  2.0  2.4  3.8  10
               //  4.5  4.7  4.6  5.2  10
               //  2.7  3.7  3.8  5.0   7
               //  4.1  4.7  4.7  3.9  10
               //  4.4  4.2  3.9  3.3  10
               fPaceStyle1stQ := atof(CopyStr(sTmp, 76, 5));
               fPaceStyle2ndQ := atof(CopyStr(sTmp, 81, 5));
               fPaceStyle3rdQ := atof(CopyStr(sTmp, 86, 5));
               fPaceStyleFinish := atof(CopyStr(sTmp, 91, 5));
               iPaceStyleNbrOfRaces := atoi(CopyStr(sTmp, 96, 4));

               hdm.tblEntries.SetKey();
               hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblEntries.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblEntries.FieldByName('ProgramNbr').AsString := sProgramNbr;

               if (hdm.tblEntries.GotoKey()) then begin
                  hdm.tblEntries.Edit();
                  hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := dtFileTrkDate;
                  hdm.tblEntries.FieldByName('Distance').AsString := sDistance;
                  hdm.tblEntries.FieldByName('Gait').AsString := sGait;
                  hdm.tblEntries.FieldByName('ProgramNbrSort').AsInteger := iProgramNbrSort;
                  hdm.tblEntries.FieldByName('HorseName').AsString := sHorseName;
                  hdm.tblEntries.FieldByName('PostPos').AsInteger := iPostPos;
                  hdm.tblEntries.FieldByName('WinIndex').AsInteger := atoi(Trim(sWinIndex));
                  hdm.tblEntries.FieldByName('MorningLineDesc').AsString := sMorningLineDesc;
                  hdm.tblEntries.FieldByName('MorningLineTo1').AsFloat := fMorningLineTo1;
                  hdm.tblEntries.FieldByName('Med').AsString := sMed;
                  hdm.tblEntries.FieldByName('Equip').AsString := sEquip;
                  hdm.tblEntries.FieldByName('Power').AsFloat := fPower;
                  hdm.tblEntries.FieldByName('ValueIndicator').AsString := sValueIndicator;
                  hdm.tblEntries.FieldByName('AvgSpeed').AsInteger := iAvgSpeed;
                  hdm.tblEntries.FieldByName('AvgClass').AsInteger := iAvgClass;
                  hdm.tblEntries.FieldByName('ClassChange').AsString := Trim(sClassChange);
                  hdm.tblEntries.FieldByName('PaceStyle1stQ').AsFloat := fPaceStyle1stQ;
                  hdm.tblEntries.FieldByName('PaceStyle2ndQ').AsFloat := fPaceStyle2ndQ;
                  hdm.tblEntries.FieldByName('PaceStyle3rdQ').AsFloat := fPaceStyle3rdQ;
                  hdm.tblEntries.FieldByName('PaceStyleFinish').AsFloat := fPaceStyleFinish;
                  hdm.tblEntries.FieldByName('PaceStyleNbrOfRaces').AsInteger := iPaceStyleNbrOfRaces;
                  hdm.tblEntries.FieldByName('IsPrintedOnValueSheet').AsBoolean := bPrintedOnValueSheet;
                  hdm.tblEntries.FieldByName('DollarIndicator').AsString := sDollarIndicator;
                  hdm.tblEntries.FieldByName('IsYouBetTrack').AsBoolean := bYouBetTrack;
                  hdm.tblEntries.Post();
               end else begin
                  hdm.tblEntries.Append();
                  hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
                  hdm.tblEntries.FieldByName('RaceNbr').AsInteger := iRaceNbr;
                  hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
                  hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := dtFileTrkDate;
                  hdm.tblEntries.FieldByName('ProgramNbr').AsString := sProgramNbr;
                  hdm.tblEntries.FieldByName('ProgramNbrSort').AsInteger := iProgramNbrSort;
                  hdm.tblEntries.FieldByName('Distance').AsString := sDistance;
                  hdm.tblEntries.FieldByName('Gait').AsString := sGait;
                  hdm.tblEntries.FieldByName('HorseName').AsString := sHorseName;
                  hdm.tblEntries.FieldByName('PostPos').AsInteger := iPostPos;
                  hdm.tblEntries.FieldByName('WinIndex').AsInteger := atoi(sWinIndex);
                  hdm.tblEntries.FieldByName('MorningLineDesc').AsString := sMorningLineDesc;
                  hdm.tblEntries.FieldByName('MorningLineTo1').AsFloat := fMorningLineTo1;
                  hdm.tblEntries.FieldByName('Med').AsString := sMed;
                  hdm.tblEntries.FieldByName('Equip').AsString := sEquip;
                  hdm.tblEntries.FieldByName('Power').AsFloat := fPower;
                  hdm.tblEntries.FieldByName('ValueIndicator').AsString := sValueIndicator;
                  hdm.tblEntries.FieldByName('AvgSpeed').AsInteger := iAvgSpeed;
                  hdm.tblEntries.FieldByName('AvgClass').AsInteger := iAvgClass;
                  hdm.tblEntries.FieldByName('ClassChange').AsString := sClassChange;
                  if (fPaceStyle1stQ > 0) then begin
                     hdm.tblEntries.FieldByName('PaceStyle1stQ').AsFloat := fPaceStyle1stQ;
                  end else begin
                     hdm.tblEntries.FieldByName('PaceStyle1stQ').AsFloat := 9999;
                  end;

                  if (fPaceStyle2ndQ > 0) then begin
                     hdm.tblEntries.FieldByName('PaceStyle2ndQ').AsFloat := fPaceStyle2ndQ;
                  end else begin
                     hdm.tblEntries.FieldByName('PaceStyle2ndQ').AsFloat := 9999;
                  end;

                  if (fPaceStyle3rdQ > 0) then begin
                     hdm.tblEntries.FieldByName('PaceStyle3rdQ').AsFloat := fPaceStyle3rdQ;
                  end else begin
                     hdm.tblEntries.FieldByName('PaceStyle3rdQ').AsFloat := 9999;
                  end;

                  if (fPaceStyleFinish > 0) then begin
                     hdm.tblEntries.FieldByName('PaceStyleFinish').AsFloat := fPaceStyleFinish;
                  end else begin
                     hdm.tblEntries.FieldByName('PaceStyleFinish').AsFloat := 9999;
                  end;

                  hdm.tblEntries.FieldByName('PaceStyleNbrOfRaces').AsInteger := iPaceStyleNbrOfRaces;
                  hdm.tblEntries.FieldByName('IsPrintedOnValueSheet').AsBoolean := bPrintedOnValueSheet;
                  hdm.tblEntries.FieldByName('DollarIndicator').AsString := sDollarIndicator;
                  hdm.tblEntries.FieldByName('IsYouBetTrack').AsBoolean := bYouBetTrack;
                  hdm.tblEntries.Post();
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         end;

         if (iLineType = FLASHNET_PP_LINE_TYPE) then begin
            try
               //1st Race Back                     2nd Race Back                     3rd Race Back
               //000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999
               //123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
               //P# Ago Track CR  SR Time  4Q  Finish Ago Track CR  SR Time  4Q  Finish Ago Track CR  SR Time  4Q  Finish
               //1   21 CALX  74  70 202.3 31.7  3-3½  28 CALX  73  69 203.0 30.7  1-¾   34 CALX  80 N/A        N/A  9-ds
               //1   11 DD    93  93 154.1 29.6  2-1¼  22 DD    91 N/A        N/A  SCR   28 DD    91  94 154.3 29.9  4-3¼
               //2   11 DD    93  90 155.0 30.7  4-6   28 DD    93  87 155.9 30.8  4-2¼  37 DD    93  91 154.5 30.4  3-1½ 
               iLen := Length(sTmp);
               if (iLen > 35) then begin
                  sProgramNbr := CopyStr(sTmp, 1, 3);
                  iRace1BackDaysAgo := atoi(CopyStr(sTmp, 4, 3));
                  sRace1BackTrkCode := CopyStr(sTmp, 8, 5);
                  iRace1BackClass := atoi(CopyStr(sTmp, 13, 3));
                  iRace1BackSpeed := atoi(CopyStr(sTmp, 17, 3));
                  sRace1BackTime := CopyStr(sTmp, 21, 6);
                  fRace1Back4thQ := atof(CopyStr(sTmp, 27, 4));
                  sRace1BackFinish := CopyStr(sTmp, 32, 2);
                  sRace1BackFinishLengths := CopyStr(sTmp, 35, 2);
               end;

               //2nd Race Back                     3rd Race Back
               //33444444444455555555556666666666777777777788888888889999999999
               //89012345678901234567890123456789012345678901234567890123456789
               //Ago Track CR  SR Time  4Q  Finish Ago Track CR  SR Time  4Q  Finish
               // 28 CALX  73  69 203.0 30.7  1-¾   34 CALX  80 N/A        N/A  9-ds
               // 22 DD    91 N/A        N/A  SCR   28 DD    91  94 154.3 29.9  4-3¼
               // 28 DD    93  87 155.9 30.8  4-2¼  37 DD    93  91 154.5 30.4  3-1½ 
               if (iLen > 69) then begin
                  iRace2BackDaysAgo := atoi(CopyStr(sTmp, 38, 3));
                  sRace2BackTrkCode := CopyStr(sTmp, 42, 5);
                  iRace2BackClass := atoi(CopyStr(sTmp, 47, 3));
                  iRace2BackSpeed := atoi(CopyStr(sTmp, 51, 3));
                  sRace2BackTime := CopyStr(sTmp, 55, 5);
                  fRace2Back4thQ := atof(CopyStr(sTmp, 61, 4));
                  sRace2BackFinish := CopyStr(sTmp, 66, 2);
                  sRace2BackFinishLengths := CopyStr(sTmp, 69, 2);
               end;

               //3rd Race Back
               //77777777788888888889999999999
               //12345678901234567890123456789
               // Ago Track CR  SR Time  4Q  Finish
               //  34 CALX  80 N/A        N/A  9-ds
               //  28 DD    91  94 154.3 29.9  4-3¼
               //  37 DD    93  91 154.5 30.4  3-1½ 
               if (iLen > 103) then begin
                  iRace3BackDaysAgo := atoi(CopyStr(sTmp, 72, 3));
                  sRace3BackTrkCode := CopyStr(sTmp, 76, 5);
                  iRace3BackClass := atoi(CopyStr(sTmp, 81, 3));
                  iRace3BackSpeed := atoi(CopyStr(sTmp, 85, 3));
                  sRace3BackTime := CopyStr(sTmp, 89, 5);
                  fRace3Back4thQ := atof(CopyStr(sTmp, 95, 4));
                  sRace3BackFinish := CopyStr(sTmp, 100, 2);
                  sRace3BackFinishLengths := CopyStr(sTmp, 103, 2);
               end;

               // Update Record
               hdm.tblEntries.SetKey();
               hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblEntries.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblEntries.FieldByName('ProgramNbr').AsString := sProgramNbr;
               if (hdm.tblEntries.GotoKey()) then begin
                  hdm.tblEntries.Edit();

                  hdm.tblEntries.FieldByName('Race1BackDaysAgo').AsInteger := iRace1BackDaysAgo;
                  hdm.tblEntries.FieldByName('Race1BackTrkCode').AsString := sRace1BackTrkCode;
                  hdm.tblEntries.FieldByName('Race1BackClass').AsInteger := iRace1BackClass;
                  hdm.tblEntries.FieldByName('Race1BackSpeed').AsInteger := iRace1BackSpeed;
                  hdm.tblEntries.FieldByName('Race1BackTime').AsString := sRace1BackTime;
                  hdm.tblEntries.FieldByName('Race1Back4thQ').AsFloat := fRace1Back4thQ;
                  hdm.tblEntries.FieldByName('Race1BackFinish').AsString := sRace1BackFinish;
                  hdm.tblEntries.FieldByName('Race1BackFinishLengths').AsString := sRace1BackFinishLengths;

                  hdm.tblEntries.FieldByName('Race2BackDaysAgo').AsInteger := iRace2BackDaysAgo;
                  hdm.tblEntries.FieldByName('Race2BackTrkCode').AsString := sRace2BackTrkCode;
                  hdm.tblEntries.FieldByName('Race2BackClass').AsInteger := iRace2BackClass;
                  hdm.tblEntries.FieldByName('Race2BackSpeed').AsInteger := iRace2BackSpeed;
                  hdm.tblEntries.FieldByName('Race2BackTime').AsString := sRace2BackTime;
                  hdm.tblEntries.FieldByName('Race2Back4thQ').AsFloat := fRace2Back4thQ;
                  hdm.tblEntries.FieldByName('Race2BackFinish').AsString := sRace2BackFinish;
                  hdm.tblEntries.FieldByName('Race2BackFinishLengths').AsString := sRace2BackFinishLengths;

                  hdm.tblEntries.FieldByName('Race3BackDaysAgo').AsInteger := iRace3BackDaysAgo;
                  hdm.tblEntries.FieldByName('Race3BackTrkCode').AsString := sRace3BackTrkCode;
                  hdm.tblEntries.FieldByName('Race3BackClass').AsInteger := iRace3BackClass;
                  hdm.tblEntries.FieldByName('Race3BackSpeed').AsInteger := iRace3BackSpeed;
                  hdm.tblEntries.FieldByName('Race3BackTime').AsString := sRace3BackTime;
                  hdm.tblEntries.FieldByName('Race3Back4thQ').AsFloat := fRace3Back4thQ;
                  hdm.tblEntries.FieldByName('Race3BackFinish').AsString := sRace3BackFinish;
                  hdm.tblEntries.FieldByName('Race3BackFinishLengths').AsString := sRace3BackFinishLengths;

                  hdm.tblEntries.Post();
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         end;

         if (iLineType = FLASHNET_TRN_DRV_LINE_TYPE) then begin
            try
               //00000000011111111112222222222333333333344444444445555555555666666666677777777778888888888999999999900000
               //12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234
               //P#  Driver                    St  W%  P%  S%  UDR  Trainer                   St  W%  P%  S%  UTR  St  W%
               //1   Herrera, Harold          107- 13- 14- 10 .224  Escobedo, Raul           253- 13- 17-  9 .254 100- 14
               sProgramNbr := CopyStr(sTmp, 1, 3);
               sDriver := CopyStr(sTmp, 5, 24);
               iDrvStarts := atoi(Trim(CopyStr(sTmp, 29, 4)));
               iDrvWinPct := atoi(Trim(CopyStr(sTmp, 34, 3)));
               iDrvPlcPct := atoi(Trim(CopyStr(sTmp, 38, 3)));
               iDrvShoPct := atoi(Trim(CopyStr(sTmp, 42, 3)));
               fDrvUDR := atof(Trim(CopyStr(sTmp, 46, 4)));

               //55555555666666666677777777778888888888999999999900000
               //23456789012345678901234567890123456789012345678901234
               //Trainer                   St  W%  P%  S%  UTR  St  W%
               //Escobedo, Raul           253- 13- 17-  9 .254 100- 14

               sTrainer := CopyStr(sTmp, 52, 24);
               iTrnStarts := atoi(Trim(CopyStr(sTmp, 76, 4)));
               iTrnWinPct := atoi(Trim(CopyStr(sTmp, 81, 3)));
               iTrnPlcPct := atoi(Trim(CopyStr(sTmp, 85, 3)));
               iTrnShoPct := atoi(Trim(CopyStr(sTmp, 89, 3)));
               fTrnUTR := atof(Trim(CopyStr(sTmp, 93, 4)));

               iTrnDrvStarts := atoi(CopyStr(sTmp, 98, 3));
               iTrnDrvWinPct := atoi(CopyStr(sTmp, 102, 3));

               // Update Record
               hdm.tblEntries.SetKey();
               hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblEntries.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblEntries.FieldByName('ProgramNbr').AsString := sProgramNbr;
               if (hdm.tblEntries.GotoKey()) then begin
                  hdm.tblEntries.Edit();

                  hdm.tblEntries.FieldByName('Driver').AsString := sDriver;
                  hdm.tblEntries.FieldByName('DrvStarts').AsInteger := iDrvStarts;
                  hdm.tblEntries.FieldByName('DrvWinPct').AsInteger := iDrvWinPct;
                  hdm.tblEntries.FieldByName('DrvPlcPct').AsInteger := iDrvPlcPct;
                  hdm.tblEntries.FieldByName('DrvShoPct').AsInteger := iDrvShoPct;
                  hdm.tblEntries.FieldByName('DrvUDR').AsFloat := fDrvUDR;
                  hdm.tblEntries.FieldByName('Trainer').AsString := sTrainer;
                  hdm.tblEntries.FieldByName('TrnStarts').AsInteger := iTrnStarts;
                  hdm.tblEntries.FieldByName('TrnWinPct').AsInteger := iTrnWinPct;
                  hdm.tblEntries.FieldByName('TrnPlcPct').AsInteger := iTrnPlcPct;
                  hdm.tblEntries.FieldByName('TrnShoPct').AsInteger := iTrnShoPct;
                  hdm.tblEntries.FieldByName('TrnUTR').AsFloat := fTrnUTR;
                  hdm.tblEntries.FieldByName('TrnDrvStarts').AsInteger := iTrnDrvStarts;
                  hdm.tblEntries.FieldByName('TrnDrvWinPct').AsInteger := iTrnDrvWinPct;
                  hdm.tblEntries.Post();
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
         end;

         if (iLineType = FLASHNET_RECORD_LINE_TYPE) then begin
            try
               //TY Record         TY Best Win         LY Record         LY Best Win   Last 6   Sire Stats
               //P#  St   W   P   S    EPS  Time   Track   St   W   P   S    EPS  Time   Track  $ Earn    St  Win%
               //000000000111111111122222222223333333333444444444455555555556666666666777777777788888888889999999999
               //123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
               //1    0-  0-  0-  0      0                 41- 13-  6-  5    757  1:58.4  CALX    1627    151 - 13
               //6    1-  1-  0-  0  14000  1:50.8  DD     34-  7-  8-  3   3003  1:51.6  M      26600   7131 - 14
               sProgramNbr := CopyStr(sTmp, 1, 3);
               iThisYearStarts := atoi(Trim(CopyStr(sTmp, 4, 3)));
               iThisYearWins := atoi(Trim(CopyStr(sTmp, 8, 3)));
               iThisYearPlcs := atoi(Trim(CopyStr(sTmp, 12, 3)));
               iThisYearShos := atoi(Trim(CopyStr(sTmp, 16, 3)));
               iThisYearEPS := atoi(Trim(CopyStr(sTmp, 20, 6)));
               sThisYearBestTime := CopyStr(sTmp, 28, 6);
               sThisYearBestTimeTrkCode := CopyStr(sTmp, 36, 5);

               //LY Record         LY Best Win   Last 6   Sire Stats
               //k   St   W   P   S    EPS  Time   Track  $ Earn    St  Win%
               //3444444444455555555556666666666777777777788888888889999999999
               //9012345678901234567890123456789012345678901234567890123456789
               //    41- 13-  6-  5    757  1:58.4  CALX    1627    151 - 13
               iLastYearStarts := atoi(Trim(CopyStr(sTmp, 42, 3)));
               iLastYearWins := atoi(Trim(CopyStr(sTmp, 46, 3)));
               iLastYearPlcs := atoi(Trim(CopyStr(sTmp, 50, 3)));
               iLastYearShos := atoi(Trim(CopyStr(sTmp, 54, 3)));
               iLastYearEPS := atoi(Trim(CopyStr(sTmp, 58, 6)));

               sLastYearBestTime := CopyStr(sTmp, 66, 6);
               sLastYearBestTimeTrkCode := CopyStr(sTmp, 74, 5);

               iLast6Earnings := atoi(Trim(CopyStr(sTmp, 80, 6)));
               iSireStarts := atoi(Trim(CopyStr(sTmp, 89, 5)));
               iSireWinPct := atoi(Trim(CopyStr(sTmp, 95, 3)));

               // Update Record
               hdm.tblEntries.SetKey();
               hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblEntries.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblEntries.FieldByName('ProgramNbr').AsString := sProgramNbr;
               if (hdm.tblEntries.GotoKey()) then begin
                  hdm.tblEntries.Edit();

                  hdm.tblEntries.FieldByName('ThisYearStarts').AsInteger := iThisYearStarts;
                  hdm.tblEntries.FieldByName('ThisYearWins').AsInteger := iThisYearWins;
                  hdm.tblEntries.FieldByName('ThisYearPlcs').AsInteger := iThisYearPlcs;
                  hdm.tblEntries.FieldByName('ThisYearShos').AsInteger := iThisYearShos;
                  hdm.tblEntries.FieldByName('ThisYearEPS').AsInteger := iThisYearEPS;
                  hdm.tblEntries.FieldByName('ThisYearBestTime').AsString := sThisYearBestTime;
                  hdm.tblEntries.FieldByName('ThisYearBestTimeTrkCode').AsString := sThisYearBestTimeTrkCode;

                  hdm.tblEntries.FieldByName('LastYearStarts').AsInteger := iLastYearStarts;
                  hdm.tblEntries.FieldByName('LastYearWins').AsInteger := iLastYearWins;
                  hdm.tblEntries.FieldByName('LastYearPlcs').AsInteger := iLastYearPlcs;
                  hdm.tblEntries.FieldByName('LastYearShos').AsInteger := iLastYearShos;
                  hdm.tblEntries.FieldByName('LastYearEPS').AsInteger := iLastYearEPS;
                  hdm.tblEntries.FieldByName('LastYearBestTime').AsString := sLastYearBestTime;
                  hdm.tblEntries.FieldByName('LastYearBestTimeTrkCode').AsString := sLastYearBestTimeTrkCode;

                  hdm.tblEntries.FieldByName('Last6Earnings').AsInteger := iLast6Earnings;
                  hdm.tblEntries.FieldByName('SireStarts').AsInteger := iSireStarts;
                  hdm.tblEntries.FieldByName('SireWinPct').AsInteger := iSireWinPct;

                  hdm.tblEntries.Post();
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
         end;

      end;


   finally
      CloseTable(hdm.tblTrack);
      CloseTable(hdm.tblRaces);
      CloseTable(hdm.tblEntries);
      CloseTable(hdm.tblProcessed);

      FreeAndNil(lstIn);
      FreeAndNil(lstSplit);
   end;

   UpdateStatusBar('');

end;




procedure DownloadUSTACharts(Sender: TObject; sWhichCard: string);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;
   sTrkCode: string;
   sChartsTrkCode: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

begin

   hLog.AddToLog('DownloadUSTACharts', msevOperation);
   CheckProxy();

   //if LOCATION = 'Exit' then begin
   //   idHTTP.ProxyParams.ProxyServer := 'localhost';
   //   idHTTP.ProxyParams.ProxyPort := 8080;
   //end;

   OpenTable(hdm.tblTrack);
   OpenTable(hdm.tblVendor);
   OpenTable(hdm.tblProcessed);

   try
      //      lblServerPath.Visible := True;
      //      lblLocalPath.Visible := True;

      InitPrgBar(hdm.tblTrack.RecordCount);
      hdm.tblTrack.First();

      while not hdm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download Harness Charts';
         Application.ProcessMessages();
         if (hdm.tblTrack.FieldByName('Country').AsString <> 'USA') then begin
            hdm.tblTrack.Next();
            continue;
         end;

         try
            hdm.tblVendor.IndexName := '';
            hdm.tblVendor.SetKey();
            hdm.tblVendor.FieldByName('Vendor').AsString := 'USTA';
            hdm.tblVendor.FieldByName('Product').AsString := 'Charts';

            if (hdm.tblVendor.GotoKey()) then begin
               sTrkCode := Trim(hdm.tblTrack.FieldByName('TrkCode').AsString);
               sChartsTrkCode := Trim(hdm.tblTrack.FieldByName('ChartsTrkCode').AsString);

               sBaseImportPath := hdm.tblVendor.FieldByName('BaseImportPath').AsString;
               sDownloadFileType := hdm.tblVendor.FieldByName('DownloadFileType').AsString;

               sDownloadLocation := USTA_CHARTS_PATH;
               //               idHTTP.Request.Host := INTERNET_USTA_HOME_PAGE;

               //               if bUseOverrideDate then begin
               //                  dtDownloadDate := gedtOverrideDate;
               //               end else begin
               //                  dtDownloadDate := Now() - 1;
               //               end;


                              // Check file was downloaded and imported
               hdm.tblProcessed.IndexName := '';
               hdm.tblProcessed.SetKey();
               hdm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
               hdm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
               if (not hdm.tblProcessed.GotoKey()) then begin
                  hdm.tblTrack.Next();
                  continue;
               end else begin
                  if (sWhichCard = BUGGY_EARLY_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessEarlyChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;

                  if (sWhichCard = BUGGY_LATE_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessLateChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               sFileName := Trim(sTrkCode) + '-' + sWhichCard + '-' +
                  sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) +
                  '.' + sDownloadFileType;

               sDownloadFullFileName := sDownloadLocation + sFileName;
               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 20000) then begin
                     DeleteFile(sDownloadFullFileName);
                     Application.ProcessMessages();
                  end;
               end;
               FindClose(tsFile);

               //http://racing.ustrotting.com/card_results.cfm?track_code=CALX&race_date=2005-01-09&race_type=6
               sServerFullFileName := sBaseImportPath + 'track_code=' + sChartsTrkCode;
               sServerFullFileName := sServerFullFileName + '&race_date=';
               sServerFullFileName := sServerFullFileName + sm.Str(wYear, 4) + '-' +
                  sm.Str(wMonth, 2) + '-' + sm.Str(wDay, 2);
               sServerFullFileName := sServerFullFileName + '&race_type=' + sWhichCard;

               //               lblServerPath.Caption := sServerFullFileName;
               //               lblLocalPath.Caption := sDownloadFullFileName;

               if not FileExists(sDownloadFullFileName) then begin
                  //                  DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                  //                  staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;
            end;

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         Sleep(SLEEP_LONG);
         hdm.tblTrack.Next();
      end;

   except
      CloseTable(hdm.tblTrack);
      CloseTable(hdm.tblVendor);
      CloseTable(hdm.tblProcessed);
      //      lblServerPath.Caption := '';
      //      lblLocalPath.Caption := '';
      //      lblServerPath.Visible := False;
      //      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
      Exit;
   end;

   CloseTable(hdm.tblTrack);
   CloseTable(hdm.tblVendor);
   CloseTable(hdm.tblProcessed);
   //   lblServerPath.Caption := '';
   //   lblLocalPath.Caption := '';
   //   lblServerPath.Visible := False;
   //   lblLocalPath.Visible := False;
   ClearPrgStatusBars();

end;

procedure DownloadSCCharts(Sender: TObject; sWhichCard: string);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;
   sTrkCode: string;
   sChartsTrkCode: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

begin

   hLog.AddToLog('DownloadSCCharts', msevOperation);
   CheckProxy();

   //if LOCATION = 'Exit' then begin
   //   idHTTP.ProxyParams.ProxyServer := 'localhost';
   //   idHTTP.ProxyParams.ProxyPort := 8080;
   //end;

   OpenTable(hdm.tblTrack);
   OpenTable(hdm.tblVendor);
   OpenTable(hdm.tblProcessed);

   try
      //      lblServerPath.Visible := True;
      //      lblLocalPath.Visible := True;

      InitPrgBar(hdm.tblTrack.RecordCount);
      hdm.tblTrack.First();

      while not hdm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download Harness Charts';
         Application.ProcessMessages();
         if (hdm.tblTrack.FieldByName('Country').AsString <> 'CAN') then begin
            hdm.tblTrack.Next();
            continue;
         end;

         try
            hdm.tblVendor.IndexName := '';
            hdm.tblVendor.SetKey();
            hdm.tblVendor.FieldByName('Vendor').AsString := 'SC';
            hdm.tblVendor.FieldByName('Product').AsString := 'Charts';

            if (hdm.tblVendor.GotoKey()) then begin
               sTrkCode := Trim(hdm.tblTrack.FieldByName('TrkCode').AsString);
               sChartsTrkCode := Trim(hdm.tblTrack.FieldByName('ChartsTrkCode').AsString);

               sBaseImportPath := hdm.tblVendor.FieldByName('BaseImportPath').AsString;
               sDownloadFileType := hdm.tblVendor.FieldByName('DownloadFileType').AsString;

               sDownloadLocation := SC_CHARTS_PATH;
               //               idHTTP.Request.Host := INTERNET_SC_HOME_PAGE;

               //               if bUseOverrideDate then begin
               //                  dtDownloadDate := gedtOverrideDate;
               //               end else begin
               //                  dtDownloadDate := Now() - 1;
               //               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

               // Check file was downloaded and imported
               hdm.tblProcessed.IndexName := '';
               hdm.tblProcessed.SetKey();
               hdm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
               hdm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
               if (not hdm.tblProcessed.GotoKey()) then begin
                  hdm.tblTrack.Next();
                  continue;
               end else begin
                  if (sWhichCard = BUGGY_EARLY_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessEarlyChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;

                  if (sWhichCard = BUGGY_LATE_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessLateChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               sFileName := Trim(sTrkCode) + '-' + sWhichCard + '-' +
                  sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) +
                  '.' + sDownloadFileType;
               sDownloadFullFileName := sDownloadLocation + sFileName;
               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 20000) then begin
                     DeleteFile(sDownloadFullFileName);
                     Application.ProcessMessages();
                  end;
               end;
               FindClose(tsFile);

               //http://www.standardbredcanada.ca/results/data/rflmdmo.html
               sServerFullFileName := sBaseImportPath + 'r' + sChartsTrkCode;
               case DayOfTheWeek(gedtOverrideDate) of
                  DaySunday: sServerFullFileName := sServerFullFileName + 'su';
                  DayMonday: sServerFullFileName := sServerFullFileName + 'mo';
                  DayTuesday: sServerFullFileName := sServerFullFileName + 'tu';
                  DayWednesday: sServerFullFileName := sServerFullFileName + 'we';
                  DayThursday: sServerFullFileName := sServerFullFileName + 'th';
                  DayFriday: sServerFullFileName := sServerFullFileName + 'fr';
                  DaySaturday: sServerFullFileName := sServerFullFileName + 'sa';
               end;

               sServerFullFileName := LowerCase(sServerFullFileName + '.' + sDownloadFileType);

               //               lblServerPath.Caption := sServerFullFileName;
               //               lblLocalPath.Caption := sDownloadFullFileName;

               if not FileExists(sDownloadFullFileName) then begin
                  //                  DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                  //                  staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;
            end;

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         Sleep(SLEEP_LONG);
         hdm.tblTrack.Next();
      end;

   except
      CloseTable(hdm.tblTrack);
      CloseTable(hdm.tblVendor);
      CloseTable(hdm.tblProcessed);
      //      lblServerPath.Caption := '';
      //      lblLocalPath.Caption := '';
      //      lblServerPath.Visible := False;
      //      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
      Exit;
   end;

   CloseTable(hdm.tblTrack);
   CloseTable(hdm.tblVendor);
   CloseTable(hdm.tblProcessed);
   //   lblServerPath.Caption := '';
   //   lblLocalPath.Caption := '';
   //   lblServerPath.Visible := False;
   //   lblLocalPath.Visible := False;
   ClearPrgStatusBars();

end;

procedure ProcessUSTACharts(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sBuf: string;
   sSearch: string;

   tsFile: TSearchRec;

   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;

begin

   hLog.AddToLog('Process USTA CHART Files', msevOperation);
   try

      //      prgBar.Position := 0;
      //      pnlPrgBar.Visible := False;

      //      if bUseOverrideDate then begin
      //         dtDownloadDate := gedtOverrideDate;
      //      end else begin
      //         dtDownloadDate := Now();
      //      end;

            //******
      iAttributes := faAnyFile;
      sPath := USTA_CHARTS_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*.html';
      end else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         sFileName := sFileName + '*.html';
         sSearch := sPath + sFileName;
      end;
      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         sFileTrkCode := UpperCase(CopyStr(tsFile.Name, 1, (SmartPos('-', tsFile.Name)) - 1));
         DeleteFile('USTAChart.txt');
         sFileName := sPath + tsFile.Name;
         ParseUSTACharts(sFileName, 'USTAChart.txt', sFileTrkCode, dtDownloadDate);

         while (FindNext(tsFile) = 0) do begin
            sFileTrkCode := UpperCase(CopyStr(tsFile.Name, 1, (SmartPos('-', tsFile.Name)) - 1));
            DeleteFile('USTAChart.txt');
            sFileName := sPath + tsFile.Name;
            ParseUSTACharts(sFileName, 'USTAChart.txt', sFileTrkCode, dtDownloadDate);
         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         FindClose(tsFile);
      end;
   end;

   ClearPrgStatusBars();

end;

procedure ParseUSTACharts(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
var
   sIn: string;
   sOut: string;

   fsIn: TFileStream;
   fsOut: TFileStream;
   lstIn: TStringList;
   lstOut: TStringList;
   lstSplit: TStringList;

   iIdx: integer;
   iLen: integer;
   iStart: integer;
   iEndPos: Integer;

   sTmp: string;

   iLineType: integer;
   iRaceNbr: integer;

   iPostPos: integer;
   iFinishPos: integer;
   sFinishPos: string;

   sOdds: string;
   fOdds: double;

   bAddLines: boolean;

   procedure InitVariables();
   begin
      iLineType := 0;
      iRaceNbr := 0;
      iPostPos := 0;
      iFinishPos := 0;
      sFinishPos := '';

      sOdds := '';
      fOdds := 0;
   end;

   function GetRaceNbr(sLine: string): integer;
   var iBegPos: integer;
   var iEndPos: integer;
   var iLen: integer;
   var sTmp: string;

   begin
      Result := 999;

      iBegPos := SmartPos(':', sLine);
      iEndPos := SmartPos('-', sLine);
      if ((iBegPos > 0) and (iEndPos > 0)) then begin
         iLen := (iEndPos - (iBegPos + 1));
         Result := atoi(Trim(CopyStr(sLine, (iBegPos + 1), iLen)));
      end;

   end;

   procedure SplitLine();
   begin
      try
         Split(sTmp, '|', lstSplit);
         if lstSplit.Count > 9 then begin
            if (StringListTrim((UpperCase(lstSplit[2]))) = 'SCR') then begin
               iPostPos := -1;
               iFinishPos := -1;
               fOdds := -1;
            end else begin
               iPostPos := atoi(StringListTrim(UpperCase(lstSplit[2])));
               sFinishPos := UpperCase(lstSplit[7]);
               if (SmartPos('/', sFinishPos) > 0) then begin
                  iEndPos := SmartPos('/', sFinishPos);
                  iLen := Length(sFinishPos);
                  iFinishPos := atoi(CopyStr(sFinishPos, 1, iEndPos - 1));
               end;
               sOdds := StringListTrim((UpperCase(lstSplit[10])));
               sOdds := FastReplace(sOdds, '*', '', True);
               fOdds := atof(sOdds);
            end;
         end;
      finally
         FreeAndNil(lstSplit);
      end;
   end;


begin

   try

      UpdateStatusBar(sFileName);
      fsIn := TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite);

      SetLength(sIn, fsIn.Size + 1);
      fsIn.Read(sIn[1], fsIn.Size);
      sOut := HtmlExtractText(sIn, False, True, True, False);

      sOut := FastReplace(sOut, Chr(160), '', False);
      sOut := FastReplace(sOut, ' ', '', False);

      try
         fsOut := TFileStream.Create(sSaveFileName, fmCreate);
         fsOut.WriteBuffer(sOut[1], Length(sOut));
      finally
         FreeAndNil(fsOut);
      end;

   finally
      FreeAndNil(fsIn);
   end;

   try
      bAddLines := False;
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;
      lstSplit := TStringList.Create;

      lstIn.LoadFromFile(sSaveFileName);
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         if (sTmp = '') then begin
            continue;
         end;

         if (sTmp = '|') then begin
            continue;
         end;

         if ((SmartPos('RACE:', sTmp) > 0) and (SmartPos('CLASS:', sTmp) > 0)) then begin
            lstOut.Add(sTmp);
            bAddLines := False;
            continue;
         end;

         if (SmartPos('|HORSE', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
         end;

         if (SmartPos('|1ST', UpperCase(sTmp)) > 0) then begin
            bAddLines := False;
         end;

         if (bAddLines) then begin
            sTmp := FastReplace(sTmp, ' ', '', True);
            lstOut.Add(sTmp);
         end;
      end;

   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(sSaveFileName);
      FreeAndNil(lstOut);
   end;


   //
   try
      InitVariables();

      OpenTable(hdm.tblRaces);
      OpenTable(hdm.tblEntries);
      OpenTable(hdm.tblProcessed);

      lstIn := TStringList.Create;
      lstIn.LoadFromFile(sSaveFileName);

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);

         // End of file
         if ((SmartPos('TheUnitedStatesTrottingAssociation', sTmp) > 0)) then begin
            break;
         end;

         if ((SmartPos('RACE:', UpperCase(sTmp)) > 0) and (SmartPos('PURSE:', UpperCase(sTmp)) > 0)) then begin
            iLineType := USTA_RACE_LINE_TYPE;
            iRaceNbr := GetRaceNbr(sTmp);
            continue;
         end;

         if ((SmartPos('|HorseName', sTmp) > 0)) then begin
            iLineType := USTA_HORSE_LINE_TYPE;
            continue;
         end;

         if (iLineType = USTA_HORSE_LINE_TYPE) then begin
            SplitLine();
            try
               hdm.tblEntries.IndexName := 'ByPostPos';
               hdm.tblEntries.SetKey();
               hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblEntries.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblEntries.FieldByName('PostPos').AsInteger := iPostPos;
               if (hdm.tblEntries.GotoKey()) then begin
                  if ((iFinishPos > 0) and (fOdds > 0)) then begin
                     hdm.tblEntries.Edit();
                     hdm.tblEntries.FieldByName('FinishPos').AsInteger := iFinishPos;
                     hdm.tblEntries.FieldByName('Odds').AsFloat := fOdds;
                     hdm.tblEntries.Post();
                  end;
               end;
            finally
               hdm.tblEntries.IndexName := '';
            end;
         end;
      end;

   finally
      CloseTable(hdm.tblRaces);
      CloseTable(hdm.tblEntries);
      CloseTable(hdm.tblProcessed);
      FreeAndNil(lstIn);
   end;

   UpdateStatusBar('');

end;

procedure ProcessSCCharts(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sBuf: string;
   sSearch: string;

   tsFile: TSearchRec;

   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;

begin

   hLog.AddToLog('Process SC CHART Files', msevOperation);
   try

      //      prgBar.Position := 0;
      //      pnlPrgBar.Visible := False;

      //      if bUseOverrideDate then begin
      //         dtDownloadDate := gedtOverrideDate;
      //      end else begin
      //         dtDownloadDate := Now();
      //      end;

            //******
      iAttributes := faAnyFile;
      sPath := SC_CHARTS_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*.html';
      end else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         sFileName := sFileName + '*.html';
         sSearch := sPath + sFileName;
      end;
      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         sFileTrkCode := UpperCase(CopyStr(tsFile.Name, 1, (SmartPos('-', tsFile.Name)) - 1));
         DeleteFile('SCChart.txt');
         sFileName := sPath + tsFile.Name;
         ParseSCCharts(sFileName, 'SCChart.txt', sFileTrkCode, dtDownloadDate);

         while (FindNext(tsFile) = 0) do begin
            sFileTrkCode := UpperCase(CopyStr(tsFile.Name, 1, (SmartPos('-', tsFile.Name)) - 1));
            DeleteFile('SCChart.txt');
            sFileName := sPath + tsFile.Name;
            ParseSCCharts(sFileName, 'SCChart.txt', sFileTrkCode, dtDownloadDate);
         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         FindClose(tsFile);
      end;
   end;

   ClearPrgStatusBars();

end;

procedure ParseSCCharts(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
var
   sIn: string;
   sOut: string;

   fsIn: TFileStream;
   fsOut: TFileStream;
   lstIn: TStringList;
   lstOut: TStringList;

   iIdx: integer;
   iLen: integer;
   iStart: integer;
   iEndPos: Integer;

   sTmp: string;

   iLineType: integer;
   iRaceNbr: integer;

   sProgramNbr: string;
   iFinishPos: integer;
   sFinishPos: string;

   sOdds: string;
   fOdds: double;

   bAddLines: boolean;

   procedure InitVariables();
   begin
      iLineType := 0;
      iRaceNbr := 0;
      sProgramNbr := '';
      iFinishPos := 0;
      sFinishPos := '';

      sOdds := '';
      fOdds := 0;
   end;

   function GetRaceNbr(sLine: string): integer;
   var iBegPos: integer;
      //   var iEndPos: integer;
   var iLen: integer;
   var sTmp: string;

   begin
      Result := 999;
      iBegPos := SmartPos('-', sLine);
      iLen := Length(sLine);
      if ((iBegPos > 0) and (iLen > 0)) then begin
         Result := atoi(Trim(CopyStr(sLine, (iBegPos + 1), iLen)));
      end;

   end;

   procedure CleanFinishPos();
   begin
      sFinishPos := FastReplace(sFinishPos, 'P1', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P2', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P3', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P4', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P5', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P6', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P7', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P8', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P9', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P10', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P11', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P12', '', True);
      sFinishPos := FastReplace(sFinishPos, 'P13', '', True);

      sFinishPos := FastReplace(sFinishPos, 'I', '', True);
      sFinishPos := FastReplace(sFinishPos, 'X', '', True);
   end;

   procedure ParseLine();
   begin
      try

         if ((SmartPos('SCRATCHED', sTmp) > 0) or (SmartPos('SCRATHCED', sTmp) > 0)) then begin
            sProgramNbr := CopyStr(sTmp, 1, 3);
            iFinishPos := -1;
            fOdds := -1.00;
         end else begin
            sProgramNbr := CopyStr(sTmp, 1, 3);

            sFinishPos := Trim(CopyStr(sTmp, 62, 10));
            if (SmartPos('/', sFinishPos) > 0) then begin
               iEndPos := SmartPos('/', sFinishPos);
               iLen := Length(sFinishPos);
               sFinishPos := CopyStr(sFinishPos, 1, iEndPos - 1);
               CleanFinishPos();
               iFinishPos := atoi(sFinishPos);
            end;
            sOdds := CopyStr(sTmp, 95, 7);
            fOdds := atof(sOdds);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

begin

   try

      UpdateStatusBar(sFileName);
      fsIn := TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite);

      SetLength(sIn, fsIn.Size + 1);
      fsIn.Read(sIn[1], fsIn.Size);
      sOut := HtmlExtractText(sIn, False, False, False, True);

      try
         fsOut := TFileStream.Create(sSaveFileName, fmCreate);
         fsOut.WriteBuffer(sOut[1], Length(sOut));
      finally
         FreeAndNil(fsOut);
      end;

   finally
      FreeAndNil(fsIn);
   end;

   try
      bAddLines := False;
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;

      lstIn.LoadFromFile(sSaveFileName);
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         if (sTmp = '') then begin
            continue;
         end;

         if ((SmartPos('2002 Standardbred Canada', sTmp) > 0)) then begin
            lstOut.Add(sTmp);
            break;
         end;

         if (SmartPos('Jump to race:', sTmp) > 0) then begin
            lstOut.Add('Race-1');
            bAddLines := False;
            continue;
         end;

         if (SmartPos('Race-', sTmp) > 0) then begin
            lstOut.Add(sTmp);
            bAddLines := False;
            continue;
         end;

         if ((SmartPos('Horse', sTmp) > 0) and (SmartPos('PP', sTmp) > 0)) then begin
            if ((SmartPos('Driver', sTmp) > 0) and (SmartPos('Trainer', sTmp) > 0)) then begin
               bAddLines := True;
            end;
         end;

         if (SmartPos('Time:', sTmp) > 0) then begin
            bAddLines := False;
         end;

         if (bAddLines) then begin
            lstOut.Add(sTmp);
         end;
      end;

   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(sSaveFileName);
      FreeAndNil(lstOut);
   end;


   //
   try
      InitVariables();

      OpenTable(hdm.tblRaces);
      OpenTable(hdm.tblEntries);
      OpenTable(hdm.tblProcessed);

      lstIn := TStringList.Create;
      lstIn.LoadFromFile(sSaveFileName);

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);

         // End of file
         if ((SmartPos('2002 Standardbred Canada', sTmp) > 0)) then begin
            break;
         end;

         if (SmartPos('RACE-', UpperCase(sTmp)) > 0) then begin
            iLineType := SC_RACE_LINE_TYPE;
            iRaceNbr := GetRaceNbr(sTmp);
            continue;
         end;

         if ((SmartPos('Horse', sTmp) > 0) and (SmartPos('PP', sTmp) > 0)) then begin
            if ((SmartPos('Driver', sTmp) > 0) and (SmartPos('Trainer', sTmp) > 0)) then begin
               iLineType := SC_HORSE_LINE_TYPE;
               continue;
            end;
         end;

         if (iLineType = SC_HORSE_LINE_TYPE) then begin
            ParseLine();
            try
               hdm.tblEntries.IndexName := '';
               hdm.tblEntries.SetKey();
               hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblEntries.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
               hdm.tblEntries.FieldByName('ProgramNbr').AsString := sProgramNbr;
               if (hdm.tblEntries.GotoKey()) then begin
                  if ((iFinishPos > 0) and (fOdds > 0)) then begin
                     hdm.tblEntries.Edit();
                     hdm.tblEntries.FieldByName('FinishPos').AsInteger := iFinishPos;
                     hdm.tblEntries.FieldByName('Odds').AsFloat := fOdds;
                     hdm.tblEntries.Post();
                  end;
               end;
            finally
               hdm.tblEntries.IndexName := '';
            end;
         end;
      end;

   finally
      CloseTable(hdm.tblRaces);
      CloseTable(hdm.tblEntries);
      CloseTable(hdm.tblProcessed);
      FreeAndNil(lstIn);
   end;

   UpdateStatusBar('');

end;


procedure ImportHarness(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;

begin

   hLog.AddToLog('ImportHarness', msevOperation);
   try

      //      prgBar.Position := 0;
      //      pnlPrgBar.Visible := False;
      //
      //      if bUseOverrideDate then begin
      //         dtDownloadDate := gedtOverrideDate;
      //      end else begin
      //         dtDownloadDate := Now();
      //      end;

            //******
      iAttributes := faAnyFile;
      sPath := AXCIS_BUGGY_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*r.exe';
      end
      else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         if gbTest then begin
            sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end else begin
            sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end;
         sFileName := sFileName + '*r.exe';
         sSearch := sPath + sFileName;
      end;
      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := iEndPos - 5;

         sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
         sFileTrkCode := UpperCase(sFileTrkCode);

         sTmp := CopyStr(tsFile.Name, iStartPos, 4);
         sRaceMM := CopyStr(sTmp, 1, 2);
         sRaceDD := CopyStr(sTmp, 3, 2);

         sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
         iLen := Length(sTmp);
         sTmp := CopyStr(sTmp, 9, iLen - 8);
         sFileName := sPath + sTmp;
         sFileName := UpperCase(sFileName);
         //         bOk := ExtractRar(sFileName);
         if bOk then begin
            dtPresent := Now();
            DecodeDate(dtPresent, wYear, wMonth, wDay);
            wDay := atow(sRaceDD);
            wMonth := atow(sRaceMM);

            if bProcessAllDates then begin
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
            end else begin
               dtAxcisRaceDate := dtDownloadDate;
            end;

            sHarnessRaceDbfName := 'raceshr.dbf';
            sHarnessEntryDbfName := 'horsehr.dbf';
            sHarnessTrainerDbfName := 'trainrhr.dbf';
            sHarnessDriverDbfName := 'driverhr.dbf';
            sHarnessPastDbfName := 'runlinhr.dbf';

            ImportAxcisHarnessDriver(sHarnessDriverDbfName);
            ImportAxcisHarnessTrainer(sHarnessTrainerDbfName);

            //try
            //   ImportAxcisHarnessRaceEntry(
            //      sHarnessRaceDbfName,
            //      sHarnessEntryDbfName,
            //      sHarnessPastDbfName,
            //      sHarnessTrainerDbfName,
            //      sHarnessDriverDbfName
            //      );
            //except
            //   on E: Exception do hLog.AddToLog(E.Message, msevException);
            //end;

            if not bProcessAllDates then begin
               try
                  ImportAxcisHarnessPast(sHarnessEntryDbfName, sHarnessPastDbfName, sHarnessTrainerDbfName, sHarnessDriverDbfName);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;
            end;
         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;

            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            sTmp := CopyStr(tsFile.Name, iStartPos, 4);
            sRaceMM := CopyStr(sTmp, 1, 2);
            sRaceDD := CopyStr(sTmp, 3, 2);

            sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
            iLen := Length(sTmp);
            sTmp := CopyStr(sTmp, 9, iLen - 8);
            sFileName := sPath + sTmp;
            sFileName := UpperCase(sFileName);
            //            bOk := ExtractRar(sFileName);
            if bOk then begin
               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);

               if bProcessAllDates then begin
                  dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
               end else begin
                  dtAxcisRaceDate := dtDownloadDate;
               end;

               sHarnessRaceDbfName := 'raceshr.dbf';
               sHarnessEntryDbfName := 'horsehr.dbf';
               sHarnessTrainerDbfName := 'trainrhr.dbf';
               sHarnessDriverDbfName := 'driverhr.dbf';
               sHarnessPastDbfName := 'runlinhr.dbf';
               // For Now
               //               try
               //                  ImportAxcisHarnessRaceEntry(
               //                     sHarnessRaceDbfName,
               //                     sHarnessEntryDbfName,
               //                     sHarnessPastDbfName,
               //                     sHarnessTrainerDbfName,
               //                     sHarnessDriverDbfName
               //                     );
               //               except
               //                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               //               end;

               ImportAxcisHarnessDriver(sHarnessDriverDbfName);
               ImportAxcisHarnessTrainer(sHarnessTrainerDbfName);

               if not bProcessAllDates then begin
                  try
                     ImportAxcisHarnessPast(sHarnessEntryDbfName, sHarnessPastDbfName, sHarnessTrainerDbfName, sHarnessDriverDbfName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;
            end;
         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         FindClose(tsFile);
         hdm.dbfHarnessRace.Active := False;
         hdm.dbfHarnessEntry.Active := False;
         hdm.dbfHarnessTrainer.Active := False;
         hdm.dbfHarnessDriver.Active := False;
         hdm.dbfHarnessPast.Active := False;
      end;
   end;

   ClearPrgStatusBars();
   hdm.dbfHarnessRace.Active := False;
   hdm.dbfHarnessEntry.Active := False;
   hdm.dbfHarnessTrainer.Active := False;
   hdm.dbfHarnessDriver.Active := False;
   hdm.dbfHarnessPast.Active := False;

end;

procedure ImportAxcisHarnessRaceEntry(
   sHarnessRaceFileName: string;
   sHarnessEntryFileName: string;
   sHarnessPastFileName: string;
   sHarnessTrainerFileName: string;
   sHarnessDriverFileName: string);
var
   lRecNo: Longint;
   bFinished: Boolean;
   sCurrTrkCode: string;
   sSendTrkCode: string;
   sChartsTrkCode: string;

begin

   //   hLog.AddToLog('ImportAxcisHarnessRaceEntry', msevOperation);
   //   try
   //
   //      hdm.dbfHarnessRace.Active := False;
   //      hdm.dbfHarnessRace.TableName := sHarnessRaceFileName;
   //      hdm.dbfHarnessRace.FilePath := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessRace.FilePathFull := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessRace.Active := True;
   //
   //      hdm.dbfHarnessEntry.Active := False;
   //      hdm.dbfHarnessEntry.TableName := sHarnessEntryFileName;
   //      hdm.dbfHarnessEntry.FilePath := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessEntry.FilePathFull := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessEntry.Active := True;
   //
   //
   //      hdm.dbfHarnessTrainer.Active := False;
   //      hdm.dbfHarnessTrainer.TableName := sHarnessTrainerFileName;
   //      hdm.dbfHarnessTrainer.FilePath := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessTrainer.FilePathFull := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessTrainer.Active := True;
   //
   //      hdm.dbfHarnessDriver.Active := False;
   //      hdm.dbfHarnessDriver.TableName := sHarnessDriverFileName;
   //      hdm.dbfHarnessDriver.FilePath := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessDriver.FilePathFull := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessDriver.Active := True;
   //
   //      hdm.dbfHarnessPast.Active := False;
   //      hdm.dbfHarnessPast.TableName := sHarnessPastFileName;
   //      hdm.dbfHarnessPast.FilePath := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessPast.FilePathFull := AXCIS_BUGGY_PATH;
   //      hdm.dbfHarnessPast.Active := True;
   //
   //
   //   except
   //      on E: Exception do begin
   //         hLog.AddToLog(E.Message, msevException);
   //         hdm.dbfHarnessRace.Active := False;
   //         hdm.dbfHarnessEntry.Active := False;
   //         hdm.dbfHarnessTrainer.Active := False;
   //         hdm.dbfHarnessDriver.Active := False;
   //         hdm.dbfHarnessPast.Active := False;
   //         ClearPrgStatusBars();
   //      end;
   //   end;
   //
   //   try
   //      OpenTable(hdm.tblRaces);
   //      OpenTable(hdm.tblTrack);
   //      OpenTable(hdm.tblEntries);
   //
   //      //      UpdateStatusBar('Loading ' + sHarnessRaceFileName);
   //
   //      InitPrgBar(hdm.dbfHarnessRace.RecordCount);
   //
   //      hdm.dbfHarnessRace.First;
   //
   //      bFinished := False;
   //      while (not bFinished) do begin
   //         IncPrgBar();
   //
   //         if (hdm.dbfHarnessRace.Eof) then begin
   //            bFinished := True;
   //         end;
   //
   //         sChartsTrkCode := '';
   //         hdm.tblTrack.IndexName := '';
   //         hdm.tblTrack.SetKey();
   //         hdm.tblTrack.FieldByName('TrkCode').Value := sFileTrkCode;
   //         if hdm.tblTrack.GotoKey() then begin
   //            sChartsTrkCode := Trim(hdm.tblTrack.FieldByName('ChartsTrkCode').AsString);
   //         end;
   //
   //         sCurrTrkCode := hdm.dbfHarnessRace.FieldByName('TRACK').AsString;
   //         sSendTrkCode := hdm.dbfHarnessRace.FieldByName('SEND_TRACK').AsString;
   //
   //         if (sCurrTrkCode = sChartsTrkCode) then begin
   //            staBar.SimpleText := 'Importing ' + hdm.dbfHarnessRace.FieldByName('TRACK').AsString +
   //               ' ' + DateToStr(dtAxcisRaceDate) + ' ' + hdm.dbfHarnessRace.FieldByName('RACE').AsString;
   //
   //            lRecNo := atol(hdm.dbfHarnessRace.FieldByName('HORSE1').AsString);
   //
   //            hdm.tblRaces.IndexName := '';
   //            hdm.tblRaces.SetKey();
   //
   //            hdm.tblRaces.FieldByName('TrkCode').AsString := sFileTrkCode;
   //            hdm.tblRaces.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
   //            hdm.tblRaces.FieldByName('RaceNbr').AsInteger := dbfHarnessRace.FieldByName('RACE').AsInteger;
   //
   //            if (hdm.tblRaces.GotoKey()) then begin
   //               ImportAxcisHarnessEntry(lRecNo);
   //            end;
   //         end;
   //         dbfHarnessRace.Next();
   //      end;
   //
   //   except
   //      on E: Exception do begin
   //         hLog.AddToLog(E.Message, msevException);
   //         ClearPrgStatusBars();
   //         dbfHarnessRace.Active := False;
   //         dbfHarnessEntry.Active := False;
   //         dbfHarnessTrainer.Active := False;
   //         dbfHarnessDriver.Active := False;
   //         dbfHarnessPast.Active := False;
   //
   //         CloseTable(hdm.tblRaces);
   //         CloseTable(hdm.tblEntries);
   //         CloseTable(hdm.tblEntries);
   //      end;
   //   end;
   //
   //   ClearPrgStatusBars();
   //   dbfHarnessRace.Active := False;
   //   dbfHarnessEntry.Active := False;
   //   dbfHarnessTrainer.Active := False;
   //   dbfHarnessDriver.Active := False;
   //   dbfHarnessPast.Active := False;
   //
   //   CloseTable(hdm.tblRaces);
   //   CloseTable(hdm.tblEntries);
   //   CloseTable(hdm.tblEntries);
end;


procedure ImportAxcisHarnessEntry(lRecNo: Longint);
var
   bFinished: boolean;
   fStarts: double;
   fWinPct: double;
   fWins: double;
   sCurrRaceNbr: string;
   sRaceNbr: string;

begin

   //   hLog.AddToLog('ImportAxcisHarnessEntry', msevOperation);
   //   try
   //
   //      dbfHarnessEntry.PhysicalRecNo := lRecNo;
   //
   //      sRaceNbr := dbfHarnessEntry.FieldByName('RACE').AsString;
   //      sCurrRaceNbr := dbfHarnessRace.FieldByName('RACE').AsString;
   //      bFinished := False;
   //      while (sRaceNbr = sCurrRaceNbr) and (not bFinished) do begin
   //
   //         if (sRaceNbr <> sCurrRaceNbr) then begin
   //            exit;
   //         end;
   //         if (hdm.dbfHarnessEntry.Eof) then begin
   //            bFinished := True;
   //         end;
   //
   //         hdm.tblEntries.IndexName := '';
   //         hdm.tblEntries.SetKey();
   //         hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
   //         hdm.tblEntries.FieldByName('RaceNbr').AsInteger := atoi(hdm.dbfHarnessRace.FieldByName('RACE').AsString);
   //         hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
   //         hdm.tblEntries.FieldByName('ProgramNbr').AsString := dbfHarnessEntry.FieldByName('PROGRAM').AsString;
   //
   //         try
   //            if (hdm.tblEntries.GotoKey()) then begin
   //               if hdm.tblEntries.RecordID > 0 then begin
   //               end;
   //            end;
   //         except
   //            on E: Exception do hLog.AddToLog(E.Message, msevException);
   //         end;
   //
   //         dbfHarnessEntry.Next();
   //         sRaceNbr := dbfHarnessEntry.FieldByName('RACE').AsString;
   //      end;
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
end;

procedure ImportAxcisHarnessDriver(sHarnessDriverFileName: string);
var
   lRecNo: Longint;
   bFinished: Boolean;

begin

   //
   //   hLog.AddToLog('ImportAxcisHarnessDriver', msevOperation);
   //   try
   //
   //      dbfHarnessDriver.Active := False;
   //      dbfHarnessDriver.TableName := sHarnessDriverFileName;
   //      dbfHarnessDriver.FilePath := AXCIS_BUGGY_PATH;
   //      dbfHarnessDriver.FilePathFull := AXCIS_BUGGY_PATH;
   //      dbfHarnessDriver.Active := True;
   //
   //
   //   except
   //      on E: Exception do begin
   //         hLog.AddToLog(E.Message, msevException);
   //         dbfHarnessDriver.Active := False;
   //         ClearPrgStatusBars();
   //      end;
   //   end;
   //
   //   try
   //      OpenTable(hdm.tblDriver);
   //
   //      //      UpdateStatusBar('Loading ' + sHarnessDriverFileName);
   //      InitPrgBar(hdm.dbfHarnessDriver.RecordCount);
   //
   //      dbfHarnessDriver.First;
   //
   //      bFinished := False;
   //      while (not bFinished) do begin
   //         IncPrgBar();
   //
   //         if (hdm.dbfHarnessDriver.Eof) then begin
   //            bFinished := True;
   //         end;
   //         hdm.tblDriver.IndexName := '';
   //         hdm.tblDriver.SetKey();
   //         hdm.tblDriver.FieldByName('Number').AsString := dbfHarnessDriver.FieldByName('DRIVERNUM').AsString;
   //         if not (hdm.tblDriver.GotoKey()) then begin
   //            hdm.tblDriver.Append();
   //            hdm.tblDriver.FieldByName('Number').AsString := dbfHarnessDriver.FieldByName('DRIVERNUM').AsString;
   //            hdm.tblDriver.FieldByName('Name').AsString := dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
   //            hdm.tblDriver.Post();
   //         end;
   //         dbfHarnessDriver.Next();
   //      end;
   //
   //   except
   //      on E: Exception do begin
   //         hLog.AddToLog(E.Message, msevException);
   //         ClearPrgStatusBars();
   //         dbfHarnessDriver.Active := False;
   //         CloseTable(hdm.tblDriver);
   //      end;
   //   end;
   //
   //   ClearPrgStatusBars();
   //   dbfHarnessDriver.Active := False;
   //   CloseTable(hdm.tblDriver);
end;

procedure ImportAxcisHarnessTrainer(sHarnessTrainerFileName: string);
var
   lRecNo: Longint;
   bFinished: Boolean;

begin

   hLog.AddToLog('ImportAxcisHarnessTrainer', msevOperation);
   //  try
  //
  //      dbfHarnessTrainer.Active := False;
  //      dbfHarnessTrainer.TableName := sHarnessTrainerFileName;
  //      dbfHarnessTrainer.FilePath := AXCIS_BUGGY_PATH;
  //      dbfHarnessTrainer.FilePathFull := AXCIS_BUGGY_PATH;
  //      dbfHarnessTrainer.Active := True;
  //
  //   except
  //      on E: Exception do begin
  //         hLog.AddToLog(E.Message, msevException);
  //         dbfHarnessTrainer.Active := False;
  //         ClearPrgStatusBars();
  //      end;
  //   end;
  //
  //   try
  //      OpenTable(hdm.tblTrainer);
  //
  //      //      UpdateStatusBar('Loading ' + sHarnessTrainerFileName);
  //      InitPrgBar(hdm.dbfHarnessTrainer.RecordCount);
  //
  //      dbfHarnessTrainer.First;
  //
  //      bFinished := False;
  //      while (not bFinished) do begin
  //         IncPrgBar();
  //
  //         if (hdm.dbfHarnessTrainer.Eof) then begin
  //            bFinished := True;
  //         end;
  //         hdm.tblTrainer.IndexName := '';
  //         hdm.tblTrainer.SetKey();
  //         hdm.tblTrainer.FieldByName('Number').AsString := dbfHarnessTrainer.FieldByName('TRAINERNUM').AsString;
  //         if not (hdm.tblTrainer.GotoKey()) then begin
  //            hdm.tblTrainer.Append();
  //            hdm.tblTrainer.FieldByName('Number').AsString := dbfHarnessTrainer.FieldByName('TRAINERNUM').AsString;
  //            hdm.tblTrainer.FieldByName('Name').AsString := dbfHarnessTrainer.FieldByName('TRAINNAME').AsString;
  //            hdm.tblTrainer.Post();
  //         end;
  //         dbfHarnessTrainer.Next();
  //      end;
  //
  //   except
  //      on E: Exception do begin
  //         hLog.AddToLog(E.Message, msevException);
  //         ClearPrgStatusBars();
  //         dbfHarnessTrainer.Active := False;
  //         CloseTable(hdm.tblTrainer);
  //      end;
  //   end;
  //
  //   ClearPrgStatusBars();
  //   dbfHarnessTrainer.Active := False;
  //   CloseTable(hdm.tblTrainer);
end;

procedure ImportAxcisHarnessPast
   (
   sHarnessEntryFileName: string;
   sHarnessPastFileName: string;
   sHarnessTrainerFileName: string;
   sHarnessDriverFileName: string
   );
var
   bFinished: boolean;

   sD: string;
   sM: string;
   sY: string;

   iStaCnt: integer;

   lHorseRecNo: longint;
   lDriverRecNo: longint;
   lSaveHorseRecNo: longint;

   sOwnerName: string;
   sBreederName: string;
   sSaddleCloth: string;

   sRace1BackTrkCode: string;
   sRace1BackRaceDesc: string;
   sRace1BackTrackSize: string;
   sRace1BackPostPos: string;
   sRace1BackGait: string;
   sRace1BackCond: string;
   sRace1BackClass: string;
   sRace1BackComment: string;
   sRace1BackClaimed: string;
   sRace1BackDriver: string;
   sRace1BackTrainer: string;
   sRace1BackFinish: string;
   sRace1BackDHDQ: string;
   sRace1BackFav: string;
   sRace1BackOdds: string;
   sRace1BackTime: string;
   sRace1Back4Q: string;

   sRace2BackTrkCode: string;
   sRace2BackRaceDesc: string;
   sRace2BackTrackSize: string;
   sRace2BackPostPos: string;
   sRace2BackGait: string;
   sRace2BackCond: string;
   sRace2BackClass: string;
   sRace2BackComment: string;
   sRace2BackClaimed: string;
   sRace2BackDriver: string;
   sRace2BackTrainer: string;
   sRace2BackFinish: string;
   sRace2BackDHDQ: string;
   sRace2BackFav: string;
   sRace2BackOdds: string;
   sRace2BackTime: string;
   sRace2Back4Q: string;

   sRace3BackTrkCode: string;
   sRace3BackRaceDesc: string;
   sRace3BackTrackSize: string;
   sRace3BackPostPos: string;
   sRace3BackGait: string;
   sRace3BackCond: string;
   sRace3BackClass: string;
   sRace3BackComment: string;
   sRace3BackClaimed: string;
   sRace3BackDriver: string;
   sRace3BackTrainer: string;
   sRace3BackFinish: string;
   sRace3BackDHDQ: string;
   sRace3BackFav: string;
   sRace3BackOdds: string;
   sRace3BackTime: string;
   sRace3Back4Q: string;

   iRaceNbr: integer;
begin
   //
   //   hLog.AddToLog('ImportAxcisHarnessPast', msevOperation);
   //   bFinished := False;
   //   try
   //      try
   //         dbfHarnessEntry.Active := False;
   //         dbfHarnessEntry.TableName := sHarnessEntryFileName;
   //         dbfHarnessEntry.FilePath := AXCIS_BUGGY_PATH;
   //         dbfHarnessEntry.FilePathFull := AXCIS_BUGGY_PATH;
   //         dbfHarnessEntry.Active := True;
   //
   //         dbfHarnessPast.Active := False;
   //         dbfHarnessPast.TableName := sHarnessPastFileName;
   //         dbfHarnessPast.FilePath := AXCIS_BUGGY_PATH;
   //         dbfHarnessPast.FilePathFull := AXCIS_BUGGY_PATH;
   //         dbfHarnessPast.Active := True;
   //
   //         dbfHarnessDriver.Active := False;
   //         dbfHarnessDriver.TableName := sHarnessDriverFileName;
   //         dbfHarnessDriver.FilePath := AXCIS_BUGGY_PATH;
   //         dbfHarnessDriver.FilePathFull := AXCIS_BUGGY_PATH;
   //         dbfHarnessDriver.Active := True;
   //
   //         dbfHarnessTrainer.Active := False;
   //         dbfHarnessTrainer.TableName := sHarnessTrainerFileName;
   //         dbfHarnessTrainer.FilePath := AXCIS_BUGGY_PATH;
   //         dbfHarnessTrainer.FilePathFull := AXCIS_BUGGY_PATH;
   //         dbfHarnessTrainer.Active := True;
   //
   //
   //         //         UpdateStatusBar('Loading ' + sHarnessPastFileName);
   //         InitPrgBar(hdm.dbfHarnessPast.RecordCount);
   //
   //
   //         iRaceNbr := 0;
   //         lSaveHorseRecNo := 0;
   //
   //         OpenTable(hdm.tblEntries);
   //         OpenTable(hdm.tblTrainer);
   //
   //         dbfHarnessPast.First();
   //         while (not bFinished) do begin
   //
   //            if (hdm.dbfHarnessPast.Eof) then begin
   //               bFinished := True;
   //            end;
   //
   //            IncPrgBar();
   //
   //            lHorseRecNo := atol(hdm.dbfHarnessPast.FieldByName('HN').AsString);
   //            if (lHorseRecNo > 0) then begin
   //               dbfHarnessEntry.PhysicalRecNo := lHorseRecNo;
   //               sOwnerName := dbfHarnessEntry.FieldByName('OWNER_NAME').AsString;
   //               sBreederName := dbfHarnessEntry.FieldByName('BREED_NAME').AsString;
   //               sSaddleCloth := dbfHarnessEntry.FieldByName('SADDLECLTH').AsString;
   //            end;
   //
   //            if LeftStr(hdm.dbfHarnessPast.FieldByName('CLASS').AsString, 4) = 'QUA ' then begin
   //               lSaveHorseRecNo := lHorseRecNo;
   //               dbfHarnessPast.Next();
   //               continue;
   //            end;
   //
   //            if (lHorseRecNo <> lSaveHorseRecNo) then begin
   //               if (lSaveHorseRecNo > 0) then begin
   //                  try
   //                     dbfHarnessEntry.PhysicalRecNo := lSaveHorseRecNo;
   //                     hdm.tblEntries.IndexName := 'ByHorseName';
   //                     hdm.tblEntries.SetKey();
   //                     hdm.tblEntries.FieldByName('RaceNbr').AsInteger := dbfHarnessEntry.FieldByName('RACE').AsInteger;
   //                     hdm.tblEntries.FieldByName('HorseName').AsString := dbfHarnessEntry.FieldByName('HORSE_NAME').AsString;
   //                     hdm.tblEntries.FieldByName('ProgramNbr').AsString := dbfHarnessEntry.FieldByName('PROGRAM').AsString;
   //
   //                     if (hdm.tblEntries.GotoKey()) then begin
   //                        hdm.tblEntries.Edit();
   //                        hdm.tblEntries.FieldByName('OwnerName').AsString := sOwnerName;
   //                        hdm.tblEntries.FieldByName('BreederName').AsString := sBreederName;
   //                        hdm.tblEntries.FieldByName('SaddleCloth').AsString := sSaddleCloth;
   //
   //                        hdm.tblEntries.FieldByName('Race1BackTrackSize').AsString := sRace1BackTrackSize;
   //                        hdm.tblEntries.FieldByName('Race1BackPostPos').AsInteger := atoi(sRace1BackPostPos);
   //                        hdm.tblEntries.FieldByName('Race1BackGait').AsString := sRace1BackGait;
   //                        hdm.tblEntries.FieldByName('Race1BackCond').AsString := sRace1BackCond;
   //                        hdm.tblEntries.FieldByName('Race1BackClassDesc').AsString := sRace1BackClass;
   //                        hdm.tblEntries.FieldByName('Race1BackComment').AsString := sRace1BackComment;
   //                        hdm.tblEntries.FieldByName('Race1BackClaimed').AsString := sRace1BackClaimed;
   //                        hdm.tblEntries.FieldByName('Race1BackRaceDesc').AsString := sRace1BackRaceDesc;
   //                        hdm.tblEntries.FieldByName('Race1BackDriver').AsString := sRace1BackDriver;
   //                        hdm.tblEntries.FieldByName('Race1BackTrainer').AsString := sRace1BackTrainer;
   //
   //                        hdm.tblEntries.FieldByName('Race2BackTrackSize').AsString := sRace2BackTrackSize;
   //                        hdm.tblEntries.FieldByName('Race2BackPostPos').AsInteger := atoi(sRace2BackPostPos);
   //                        hdm.tblEntries.FieldByName('Race2BackGait').AsString := sRace2BackGait;
   //                        hdm.tblEntries.FieldByName('Race2BackCond').AsString := sRace2BackCond;
   //                        hdm.tblEntries.FieldByName('Race2BackClassDesc').AsString := sRace2BackClass;
   //                        hdm.tblEntries.FieldByName('Race2BackComment').AsString := sRace2BackComment;
   //                        hdm.tblEntries.FieldByName('Race2BackClaimed').AsString := sRace2BackClaimed;
   //                        hdm.tblEntries.FieldByName('Race2BackRaceDesc').AsString := sRace2BackRaceDesc;
   //                        hdm.tblEntries.FieldByName('Race2BackDriver').AsString := sRace2BackDriver;
   //                        hdm.tblEntries.FieldByName('Race2BackTrainer').AsString := sRace2BackTrainer;
   //
   //                        hdm.tblEntries.FieldByName('Race3BackTrackSize').AsString := sRace3BackTrackSize;
   //                        hdm.tblEntries.FieldByName('Race3BackPostPos').AsInteger := atoi(sRace3BackPostPos);
   //                        hdm.tblEntries.FieldByName('Race3BackGait').AsString := sRace3BackGait;
   //                        hdm.tblEntries.FieldByName('Race3BackCond').AsString := sRace3BackCond;
   //                        hdm.tblEntries.FieldByName('Race3BackClassDesc').AsString := sRace3BackClass;
   //                        hdm.tblEntries.FieldByName('Race3BackComment').AsString := sRace3BackComment;
   //                        hdm.tblEntries.FieldByName('Race3BackClaimed').AsString := sRace3BackClaimed;
   //                        hdm.tblEntries.FieldByName('Race3BackRaceDesc').AsString := sRace3BackRaceDesc;
   //                        hdm.tblEntries.FieldByName('Race3BackDriver').AsString := sRace3BackDriver;
   //                        hdm.tblEntries.FieldByName('Race3BackTrainer').AsString := sRace3BackTrainer;
   //
   //                        hdm.tblEntries.Post();
   //                        dbfHarnessEntry.PhysicalRecNo := lHorseRecNo;
   //                     end;
   //                  finally
   //                     hdm.tblEntries.IndexName := '';
   //                  end;
   //               end;
   //
   //               iRaceNbr := 0;
   //               sOwnerName := '';
   //               sBreederName := '';
   //               sSaddleCloth := '';
   //               sRace1BackRaceDesc := '';
   //               sRace1BackTrackSize := '';
   //               sRace1BackPostPos := '';
   //               sRace1BackGait := '';
   //               sRace1BackCond := '';
   //               sRace1BackClass := '';
   //               sRace1BackComment := '';
   //               sRace1BackClaimed := '';
   //               sRace1BackDriver := '';
   //               sRace1BackTrainer := '';
   //               sRace1BackFinish := '';
   //               sRace1BackDHDQ := '';
   //               sRace1BackFav := '';
   //               sRace1BackOdds := '';
   //               sRace1BackTime := '';
   //               sRace1Back4Q := '';
   //
   //               sRace2BackRaceDesc := '';
   //               sRace2BackTrackSize := '';
   //               sRace2BackPostPos := '';
   //               sRace2BackGait := '';
   //               sRace2BackCond := '';
   //               sRace2BackClass := '';
   //               sRace2BackComment := '';
   //               sRace2BackClaimed := '';
   //               sRace2BackDriver := '';
   //               sRace2BackTrainer := '';
   //               sRace2BackFinish := '';
   //               sRace2BackDHDQ := '';
   //               sRace2BackFav := '';
   //               sRace2BackOdds := '';
   //               sRace2BackTime := '';
   //               sRace2Back4Q := '';
   //
   //               sRace3BackRaceDesc := '';
   //               sRace3BackTrackSize := '';
   //               sRace3BackPostPos := '';
   //               sRace3BackGait := '';
   //               sRace3BackCond := '';
   //               sRace3BackClass := '';
   //               sRace3BackComment := '';
   //               sRace3BackClaimed := '';
   //               sRace3BackDriver := '';
   //               sRace3BackTrainer := '';
   //               sRace3BackFinish := '';
   //               sRace3BackDHDQ := '';
   //               sRace3BackFav := '';
   //               sRace3BackOdds := '';
   //               sRace3BackTime := '';
   //               sRace3Back4Q := '';
   //
   //            end;
   //
   //
   //
   //            Inc(iRaceNbr);
   //
   //            if (iRaceNbr = 1) then begin
   //               sRace1BackTrkCode := dbfHarnessPast.FieldByName('TRACK').AsString;
   //               sRace1BackTrackSize := dbfHarnessPast.FieldByName('TRACKSIZE').AsString;
   //               sRace1BackPostPos := dbfHarnessPast.FieldByName('POST').AsString;
   //               sRace1BackGait := dbfHarnessPast.FieldByName('GAIT').AsString;
   //               sRace1BackCond := dbfHarnessPast.FieldByName('COND').AsString;
   //               sRace1BackClass := dbfHarnessPast.FieldByName('CLASS').AsString;
   //               sRace1BackComment := dbfHarnessPast.FieldByName('COMMENT').AsString;
   //               if (Trim(hdm.dbfHarnessPast.FieldByName('PPCLAIMED').AsString) <> '') then begin
   //                  sRace1BackClaimed := 'C';
   //               end else begin
   //                  sRace1BackClaimed := ' ';
   //               end;
   //
   //               if (atoi(hdm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)) > 0 then begin
   //                  sRace1BackFinish := FormatFloat('##', (atof(hdm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)));
   //               end else begin
   //                  sRace1BackFinish := FormatFloat('##', 0);
   //               end;
   //
   //               sRace1BackDHDQ := dbfHarnessPast.FieldByName('DHDQ').AsString;
   //               sRace1BackFav := dbfHarnessPast.FieldByName('FAV').AsString;
   //               if (atof(hdm.dbfHarnessPast.FieldByName('ODDS').AsString)) > 0 then begin
   //                  sRace1BackOdds := FormatFloat('##0.00', (atof(hdm.dbfHarnessPast.FieldByName('ODDS').AsString)));
   //               end else begin
   //                  sRace1BackOdds := FormatFloat('##0.00', 0.00);
   //               end;
   //
   //               sRace1BackTime := dbfHarnessPast.FieldByName('HRSE_TM_FN').AsString;
   //               if (atof(hdm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)) > 0 then begin
   //                  sRace1Back4Q := FormatFloat('#0.0', (atof(hdm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)));
   //               end else begin
   //                  sRace1Back4Q := '';
   //               end;
   //
   //               lDriverRecNo := atol(hdm.dbfHarnessPast.FieldByName('DN').AsString);
   //               if (lDriverRecNo > 0) then begin
   //                  dbfHarnessDriver.PhysicalRecNo := lDriverRecNo;
   //                  sRace1BackDriver := dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
   //               end else begin
   //                  sRace1BackDriver := '';
   //               end;
   //
   //               hdm.tblTrainer.IndexName := '';
   //               hdm.tblTrainer.SetKey();
   //               hdm.tblTrainer.FieldByName('Number').AsString := dbfHarnessPast.FieldByName('PPTRAINER').AsString;
   //               if (hdm.tblTrainer.GotoKey()) then begin
   //                  sRace1BackTrainer := hdm.tblTrainer.FieldByName('Name').AsString;
   //               end else begin
   //                  sRace1BackTrainer := '';
   //               end;
   //
   //               sY := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 3, 2);
   //               sM := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 5, 2);
   //               sD := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 7, 2);
   //               sRace1BackRaceDesc := '';
   //               sRace1BackRaceDesc :=
   //                  Format('%-2s', [sRace1BackPostPos]) + ' ' +
   //                  Format('%-2s', [sM]) + '/' +
   //                  Format('%-2s', [sD]) + '/' +
   //                  Format('%-2s', [sY]) + ' ' +
   //                  Format('%-5s', [sRace1BackTrkCode]) + ' ' +
   //                  Format('%2s', [sRace1BackCond]) + ' ' +
   //                  Format('%-13s', [sRace1BackClass]) + ' ' +
   //                  Format('%-1s', [sRace1BackClaimed]) + ' ' +
   //                  Format('%-14s', [sRace1BackComment]) + ' ' +
   //                  Format('%6s', [sRace1BackTime]) + ' ' +
   //                  Format('%4s', [sRace1Back4Q]) + ' ' +
   //                  Format('%2s', [sRace1BackFinish]) +
   //                  Format('%-2s', [sRace1BackDHDQ]) +
   //                  Format('%6s', [sRace1BackOdds]) +
   //                  Format('%1s', [sRace1BackFav]);
   //            end;
   //
   //            if (iRaceNbr = 2) then begin
   //               sRace2BackTrkCode := dbfHarnessPast.FieldByName('TRACK').AsString;
   //               sRace2BackTrackSize := dbfHarnessPast.FieldByName('TRACKSIZE').AsString;
   //               sRace2BackPostPos := dbfHarnessPast.FieldByName('POST').AsString;
   //               sRace2BackGait := dbfHarnessPast.FieldByName('GAIT').AsString;
   //               sRace2BackCond := dbfHarnessPast.FieldByName('COND').AsString;
   //               sRace2BackClass := dbfHarnessPast.FieldByName('CLASS').AsString;
   //               sRace2BackComment := dbfHarnessPast.FieldByName('COMMENT').AsString;
   //               if (Trim(hdm.dbfHarnessPast.FieldByName('PPCLAIMED').AsString) <> '') then begin
   //                  sRace2BackClaimed := 'C';
   //               end else begin
   //                  sRace2BackClaimed := ' ';
   //               end;
   //
   //               if (atoi(hdm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)) > 0 then begin
   //                  sRace2BackFinish := FormatFloat('##', (atof(hdm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)));
   //               end else begin
   //                  sRace2BackFinish := FormatFloat('##', 0);
   //               end;
   //
   //               sRace2BackDHDQ := dbfHarnessPast.FieldByName('DHDQ').AsString;
   //               sRace2BackFav := dbfHarnessPast.FieldByName('FAV').AsString;
   //               if (atof(hdm.dbfHarnessPast.FieldByName('ODDS').AsString)) > 0 then begin
   //                  sRace2BackOdds := FormatFloat('##0.00', (atof(hdm.dbfHarnessPast.FieldByName('ODDS').AsString)));
   //               end else begin
   //                  sRace2BackOdds := FormatFloat('##0.00', 0.00);
   //               end;
   //
   //               sRace2BackTime := dbfHarnessPast.FieldByName('HRSE_TM_FN').AsString;
   //               if (atof(hdm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)) > 0 then begin
   //                  sRace2Back4Q := FormatFloat('#0.0', (atof(hdm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)));
   //               end else begin
   //                  sRace2Back4Q := '';
   //               end;
   //
   //               lDriverRecNo := atol(hdm.dbfHarnessPast.FieldByName('DN').AsString);
   //               if (lDriverRecNo > 0) then begin
   //                  dbfHarnessDriver.PhysicalRecNo := lDriverRecNo;
   //                  sRace2BackDriver := dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
   //               end else begin
   //                  sRace2BackDriver := '';
   //               end;
   //
   //               hdm.tblTrainer.IndexName := '';
   //               hdm.tblTrainer.SetKey();
   //               hdm.tblTrainer.FieldByName('Number').AsString := dbfHarnessPast.FieldByName('PPTRAINER').AsString;
   //               if (hdm.tblTrainer.GotoKey()) then begin
   //                  sRace2BackTrainer := hdm.tblTrainer.FieldByName('Name').AsString;
   //               end else begin
   //                  sRace2BackTrainer := '';
   //               end;
   //
   //               sY := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 3, 2);
   //               sM := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 5, 2);
   //               sD := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 7, 2);
   //               sRace2BackRaceDesc := '';
   //               sRace2BackRaceDesc :=
   //                  Format('%-2s', [sRace2BackPostPos]) + ' ' +
   //                  Format('%-2s', [sM]) + '/' +
   //                  Format('%-2s', [sD]) + '/' +
   //                  Format('%-2s', [sY]) + ' ' +
   //                  Format('%-5s', [sRace2BackTrkCode]) + ' ' +
   //                  Format('%2s', [sRace2BackCond]) + ' ' +
   //                  Format('%-13s', [sRace2BackClass]) + ' ' +
   //                  Format('%-1s', [sRace2BackClaimed]) + ' ' +
   //                  Format('%-14s', [sRace2BackComment]) + ' ' +
   //                  Format('%6s', [sRace2BackTime]) + ' ' +
   //                  Format('%4s', [sRace2Back4Q]) + ' ' +
   //                  Format('%2s', [sRace2BackFinish]) +
   //                  Format('%-2s', [sRace2BackDHDQ]) +
   //                  Format('%6s', [sRace2BackOdds]) +
   //                  Format('%1s', [sRace2BackFav]);
   //            end;
   //
   //            if (iRaceNbr = 3) then begin
   //               sRace3BackTrkCode := dbfHarnessPast.FieldByName('TRACK').AsString;
   //               sRace3BackTrackSize := dbfHarnessPast.FieldByName('TRACKSIZE').AsString;
   //               sRace3BackPostPos := dbfHarnessPast.FieldByName('POST').AsString;
   //               sRace3BackGait := dbfHarnessPast.FieldByName('GAIT').AsString;
   //               sRace3BackCond := dbfHarnessPast.FieldByName('COND').AsString;
   //               sRace3BackClass := dbfHarnessPast.FieldByName('CLASS').AsString;
   //               sRace3BackComment := dbfHarnessPast.FieldByName('COMMENT').AsString;
   //               if (Trim(hdm.dbfHarnessPast.FieldByName('PPCLAIMED').AsString) <> '') then begin
   //                  sRace3BackClaimed := 'C';
   //               end else begin
   //                  sRace3BackClaimed := ' ';
   //               end;
   //               if (atoi(hdm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)) > 0 then begin
   //                  sRace3BackFinish := FormatFloat('##', (atof(hdm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)));
   //               end else begin
   //                  sRace3BackFinish := FormatFloat('##', 0);
   //               end;
   //
   //               sRace3BackDHDQ := dbfHarnessPast.FieldByName('DHDQ').AsString;
   //               sRace3BackFav := dbfHarnessPast.FieldByName('FAV').AsString;
   //               if (atof(hdm.dbfHarnessPast.FieldByName('ODDS').AsString)) > 0 then begin
   //                  sRace3BackOdds := FormatFloat('##0.00', (atof(hdm.dbfHarnessPast.FieldByName('ODDS').AsString)));
   //               end else begin
   //                  sRace3BackOdds := FormatFloat('##0.00', 0.00);
   //               end;
   //               sRace3BackTime := dbfHarnessPast.FieldByName('HRSE_TM_FN').AsString;
   //               if (atof(hdm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)) > 0 then begin
   //                  sRace3Back4Q := FormatFloat('#0.0', (atof(hdm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)));
   //               end else begin
   //                  sRace3Back4Q := '';
   //               end;
   //
   //               lDriverRecNo := atol(hdm.dbfHarnessPast.FieldByName('DN').AsString);
   //               if (lDriverRecNo > 0) then begin
   //                  dbfHarnessDriver.PhysicalRecNo := lDriverRecNo;
   //                  sRace3BackDriver := dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
   //               end else begin
   //                  sRace3BackDriver := '';
   //               end;
   //
   //               hdm.tblTrainer.IndexName := '';
   //               hdm.tblTrainer.SetKey();
   //               hdm.tblTrainer.FieldByName('Number').AsString := dbfHarnessPast.FieldByName('PPTRAINER').AsString;
   //               if (hdm.tblTrainer.GotoKey()) then begin
   //                  sRace3BackTrainer := hdm.tblTrainer.FieldByName('Name').AsString;
   //               end else begin
   //                  sRace3BackTrainer := '';
   //               end;
   //
   //               sY := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 3, 2);
   //               sM := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 5, 2);
   //               sD := CopyStr(hdm.dbfHarnessPast.FieldByName('DATE').AsString, 7, 2);
   //               sRace3BackRaceDesc := '';
   //               sRace3BackRaceDesc :=
   //                  Format('%-2s', [sRace3BackPostPos]) + ' ' +
   //                  Format('%-2s', [sM]) + '/' +
   //                  Format('%-2s', [sD]) + '/' +
   //                  Format('%-2s', [sY]) + ' ' +
   //                  Format('%-5s', [sRace3BackTrkCode]) + ' ' +
   //                  Format('%2s', [sRace3BackCond]) + ' ' +
   //                  Format('%-13s', [sRace3BackClass]) + ' ' +
   //                  Format('%-1s', [sRace3BackClaimed]) + ' ' +
   //                  Format('%-14s', [sRace3BackComment]) + ' ' +
   //                  Format('%6s', [sRace3BackTime]) + ' ' +
   //                  Format('%4s', [sRace3Back4Q]) + ' ' +
   //                  Format('%2s', [sRace3BackFinish]) +
   //                  Format('%-2s', [sRace3BackDHDQ]) +
   //                  Format('%6s', [sRace3BackOdds]) +
   //                  Format('%1s', [sRace3BackFav]);
   //            end;
   //
   //            lSaveHorseRecNo := lHorseRecNo;
   //            dbfHarnessPast.Next();
   //         end;
   //
   //      except
   //         on E: Exception do hLog.AddToLog(E.Message, msevException);
   //      end;
   //
   //   finally
   //      dbfHarnessEntry.Active := False;
   //      dbfHarnessPast.Active := False;
   //      dbfHarnessDriver.Active := False;
   //      dbfHarnessTrainer.Active := False;
   //      CloseTable(hdm.tblTrainer);
   //      CloseTable(hdm.tblEntries);
   //      ClearPrgStatusBars();
   //   end;

end;

procedure UpdateHarnessWager(bOneDay: boolean);
var
   sTopChoice: string;
   sSecondChoice: string;
   sThirdChoice: string;
   sFourthChoice: string;
   sFifthChoice: string;
   iRaceNbr: integer;
   sTrkCode: string;
   iSaveRaceNbr: integer;
   sSaveTrkCode: string;
   sProgramNbr: string;

begin

   //   hLog.AddToLog('UpdateHarnessWager, msevOperation);
   try
      try
         CloseTable(hdm.tblEntries);
         OpenTable(hdm.tblEntries);

         CloseTable(hdm.tblRaces);
         OpenTable(hdm.tblRaces);


         if (bOneDay) then begin
            hdm.tblRaces.IndexName := 'ByRangeRaceDate';

            hdm.tblRaces.SetRangeStart;
            hdm.tblRaces.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            hdm.tblRaces.KeyFieldCount := 1;

            hdm.tblRaces.SetRangeEnd;
            hdm.tblRaces.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            hdm.tblRaces.KeyFieldCount := 1;

            hdm.tblRaces.ApplyRange;
         end;

         InitPrgBar(hdm.tblRaces.RecordCount);

         while not hdm.tblRaces.Eof do begin
            sTopChoice := '';
            sSecondChoice := '';
            sThirdChoice := '';
            sFourthChoice := '';
            sFifthChoice := '';

            hdm.tblEntries.IndexName := 'ByPostPos';
            hdm.tblEntries.SetKey();
            hdm.tblEntries.FieldByName('RangeRaceDate').AsDateTime := hdm.tblRaces.FieldByName('RaceDate').AsDateTime;
            hdm.tblEntries.FieldByName('TrkCode').AsString := hdm.tblRaces.FieldByName('TrkCode').AsString;
            hdm.tblEntries.FieldByName('RaceDate').AsDateTime := hdm.tblRaces.FieldByName('RaceDate').AsDateTime;
            hdm.tblEntries.FieldByName('RaceNbr').AsInteger := hdm.tblRaces.FieldByName('RaceNbr').AsInteger;
            hdm.tblEntries.FieldByName('PostPos').AsInteger := 1;

            if (hdm.tblEntries.GotoKey()) then begin
               iRaceNbr := hdm.tblEntries.FieldByName('RaceNbr').AsInteger;
               sTrkCode := hdm.tblEntries.FieldByName('TrkCode').AsString;

               iSaveRaceNbr := hdm.tblEntries.FieldByName('RaceNbr').AsInteger;
               sSaveTrkCode := hdm.tblEntries.FieldByName('TrkCode').AsString;

               while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                  sProgramNbr := hdm.tblEntries.FieldByName('ProgramNbr').AsString;

                  if (hdm.tblEntries.FieldByName('FinalWinPctRank').AsInteger = 1) then begin
                     sTopChoice := Trim(sProgramNbr);
                  end;

                  if (hdm.tblEntries.FieldByName('FinalWinPctRank').AsInteger = 2) then begin
                     sSecondChoice := Trim(sProgramNbr);
                  end;

                  if (hdm.tblEntries.FieldByName('FinalWinPctRank').AsInteger = 3) then begin
                     sThirdChoice := Trim(sProgramNbr);
                  end;

                  if (hdm.tblEntries.FieldByName('FinalWinPctRank').AsInteger = 4) then begin
                     sFourthChoice := Trim(sProgramNbr);
                  end;

                  if (hdm.tblEntries.FieldByName('FinalWinPctRank').AsInteger = 5) then begin
                     sFifthChoice := Trim(sProgramNbr);
                  end;

                  hdm.tblEntries.Edit();
                  hdm.tblEntries.FieldByName('DollarIndicator').AsString := '';
                  hdm.tblEntries.FieldByName('IsTripleLiner').AsBoolean := False;

                  if (hdm.tblEntries.FieldByName('PaceStyle1stQRank').AsInteger = 1) then begin
                     if (hdm.tblEntries.FieldByName('PaceStyle2ndQRank').AsInteger = 1) then begin
                        if (hdm.tblEntries.FieldByName('PaceStyle3rdQRank').AsInteger = 1) then begin
                           if (hdm.tblEntries.FieldByName('PaceStyleFinishRank').AsInteger = 1) then begin
                              if (hdm.tblEntries.FieldByName('FinalValueBet').AsFloat >= 1.00) then begin
                                 hdm.tblEntries.FieldByName('DollarIndicator').AsString := '$';
                              end;
                           end;
                        end;
                     end;
                  end;

                  if (hdm.tblEntries.FieldByName('PaceStyle1stQRank').AsInteger = 1) then begin
                     if (hdm.tblEntries.FieldByName('PaceStyle2ndQRank').AsInteger = 1) then begin
                        if (hdm.tblEntries.FieldByName('PaceStyle3rdQRank').AsInteger = 1) then begin
                           if (hdm.tblEntries.FieldByName('PaceStyleFinishRank').AsInteger = 1) then begin
                              if (hdm.tblEntries.FieldByName('FinalValueBet').AsFloat >= 2.00) then begin
                                 hdm.tblEntries.FieldByName('DollarIndicator').AsString := '$$';
                              end;
                           end;
                        end;
                     end;
                  end;

                  if (hdm.tblEntries.FieldByName('PaceStyle1stQRank').AsInteger = 1) then begin
                     if (hdm.tblEntries.FieldByName('PaceStyle2ndQRank').AsInteger = 1) then begin
                        if (hdm.tblEntries.FieldByName('PaceStyle3rdQRank').AsInteger = 1) then begin
                           if (hdm.tblEntries.FieldByName('PaceStyleFinishRank').AsInteger = 1) then begin
                              hdm.tblEntries.FieldByName('IsTripleLiner').AsBoolean := True;
                           end;
                        end;
                     end;
                  end;

                  if (hdm.tblEntries.FieldByName('PaceStyle1stQRank').AsInteger = 1) then begin
                     if (hdm.tblEntries.FieldByName('PaceStyle2ndQRank').AsInteger = 1) then begin
                        if (hdm.tblEntries.FieldByName('PaceStyle3rdQRank').AsInteger = 1) then begin
                           hdm.tblEntries.FieldByName('IsTripleLiner').AsBoolean := True;
                        end;
                     end;
                  end;

                  if (hdm.tblEntries.FieldByName('PaceStyle2ndQRank').AsInteger = 1) then begin
                     if (hdm.tblEntries.FieldByName('PaceStyle3rdQRank').AsInteger = 1) then begin
                        if (hdm.tblEntries.FieldByName('PaceStyleFinishRank').AsInteger = 1) then begin
                           hdm.tblEntries.FieldByName('IsTripleLiner').AsBoolean := True;
                        end;
                     end;
                  end;

                  hdm.tblEntries.Post();


                  hdm.tblEntries.Next();
                  if (hdm.tblEntries.Eof) then begin
                     iRaceNbr := 0;
                     sTrkCode := '';
                  end else begin
                     iRaceNbr := hdm.tblEntries.FieldByName('RaceNbr').AsInteger;
                     sTrkCode := hdm.tblEntries.FieldByName('TrkCode').AsString;
                  end;
               end;
            end;

            hdm.tblRaces.Edit();
            hdm.tblRaces.FieldByName('Wager').AsString := sTopChoice + '-' + sSecondChoice + '-' + sThirdChoice + '-' + sFourthChoice + '-' + sFifthChoice;
            hdm.tblRaces.Post();
            hdm.tblRaces.Next();
         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTable(hdm.tblRaces);
      CloseTable(hdm.tblEntries);
      ClearPrgStatusBars();
   end;

end;

end.
