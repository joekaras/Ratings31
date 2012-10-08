unit UnitRPIAndIV;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls,
   cxControls, cxContainer, cxEdit, cxProgressBar;

procedure IndexRPIAndIV(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer);

procedure UpdateRPIAndIV(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, mlog, DatReport,
   UnitCommonCode, ESBMaths2, StrMan, UnitDBRoutines, FormMain,
   UnitSetRanking;

procedure UpdateRPIAndIV
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var
   bIsChalkValue: boolean;
   bIsFinalValue: boolean;
   bIsPlayableValue: boolean;

   sFinalOrderKey: string;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

   fMorningLineTo1RankIV: double;
   fPowerRankIV: double;

   fLastSpeedRankIV: double;
   fBackSpeedRankIV: double;
   fPastSpeedRankIV: double;
   fAvgSpeedRankIV: double;

   fLastClassRankIV: double;
   fBackClassRankIV: double;
   fAvgClassRankIV: double;
   fAvgClassRatingRankIV: double;

   fBackPace1RankIV: double;
   fBackPace2RankIV: double;
   fEarlyPaceRankIV: double;
   fMiddlePaceRankIV: double;
   fLatePaceRankIV: double;

   fEarlyPacePosRankIV: double;
   fMiddlePacePosRankIV: double;
   fLatePacePosRankIV: double;

   fDamAllWinPctRankIV: double;
   fSireAllWinPctRankIV: double;
   fTotalBrdWinPctRankIV: double;
   fDamSireAllWinPctRankIV: double;

   fDamAllMudWinPctRankIV: double;
   fSireAllMudWinPctRankIV: double;
   fDamSireAllMudWinPctRankIV: double;

   fDamAllTurfWinPctRankIV: double;
   fSireAllTurfWinPctRankIV: double;
   fDamSireAllTurfWinPctRankIV: double;

   fTotalTrnOddsWinPctRankIV: double;
   fTotalJkyOddsWinPctRankIV: double;
   fTotalTrnTurfWinPctRankIV: double;
   fTotalTrn10WinPctRankIV: double;
   fTotalTrn30WinPctRankIV: double;
   fTotalJky10WinPctRankIV: double;
   fTotalJky30WinPctRankIV: double;

   fTrnTodayWinPctRankIV: double;
   fTotalTrnWinPctRankIV: double;
   //   fTotalTrnDaysWinPctRankIV: double;
   fTotalTrnJkyWinPctRankIV: double;
   //   fTotalTrnJkyDaysWinPctRankIV: double;
   fTotalJkyWinPctRankIV: double;
   //   fTotalJkyDaysWinPctRankIV: double;
   fTotalTrnOwnWinPctRankIV: double;
   fTotalOwnWinPctRankIV: double;

   fBaseIV: double;
   fPaceIV: double;
   fPacePosIV: double;
   fClassIV: double;
   fSpeedIV: double;
   fMaidenIV: double;
   fTurfIV: double;
   fMudIV: double;
   fConnectionIV: double;

   fMorningLineTo1WinPct: double;
   fPowerWinPct: double;

   fLastSpeedWinPct: double;
   fBackSpeedWinPct: double;
   fPastSpeedWinPct: double;
   fAvgSpeedWinPct: double;

   fLastClassWinPct: double;
   fBackClassWinPct: double;
   fAvgClassWinPct: double;
   fAvgClassRatingWinPct: double;

   fBackPace1WinPct: double;
   fBackPace2WinPct: double;
   fEarlyPaceWinPct: double;
   fMiddlePaceWinPct: double;
   fLatePaceWinPct: double;

   fEarlyPacePosWinPct: double;
   fMiddlePacePosWinPct: double;
   fLatePacePosWinPct: double;

   fDamAllWinPct: double;
   fSireAllWinPct: double;
   fTotalBrdWinPct: double;
   fDamSireAllWinPct: double;

   fDamAllMudWinPct: double;
   fSireAllMudWinPct: double;
   fDamSireAllMudWinPct: double;

   fDamAllTurfWinPct: double;
   fSireAllTurfWinPct: double;
   fDamSireAllTurfWinPct: double;

   fTotalTrnOddsWinPct: double;
   fTotalJkyOddsWinPct: double;
   fTotalTrnTurfWinPct: double;
   fTotalTrn10WinPct: double;
   fTotalTrn30WinPct: double;
   fTotalJky10WinPct: double;
   fTotalJky30WinPct: double;

   fTrnTodayWinPct: double;
   fTotalTrnWinPct: double;
   //   fTotalTrnDaysWinPct: double;
   fTotalTrnJkyWinPct: double;
   //   fTotalTrnJkyDaysWinPct: double;
   fTotalJkyWinPct: double;
   //   fTotalJkyDaysWinPct: double;
   fTotalTrnOwnWinPct: double;
   fTotalOwnWinPct: double;

begin
   hLog.AddToLog('UpdateRPIAndIV', msevOperation);

   try
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(dm.tblRankingStatsByTrk);
      CloseTable(dm.tblRankingStats);

      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(dm.tblRankingStatsByTrk);
      OpenTable(dm.tblRankingStats);

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         CloseTable(tblR);
         CloseTable(tblE);
         CloseTable(dm.tblRankingStatsByTrk);
         CloseTable(dm.tblRankingStats);

         ClearPrgStatusBars();
      end;
   end;

   try
      InitPrgBar(tblE.RecordCount);
      iStaCnt := 0;
      iTotalCnt := 0;

      tblE.First();
      while not tblE.Eof do begin
         if (iStaCnt > BATCH_SIZE) then begin
            staBar.SimpleText := 'Setting RPI - ' +
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

         fMorningLineTo1WinPct := 0;
         fPowerWinPct := 0;

         fLastSpeedWinPct := 0;
         fBackSpeedWinPct := 0;
         fPastSpeedWinPct := 0;
         fAvgSpeedWinPct := 0;
         fBackPace1WinPct := 0;
         fBackPace2WinPct := 0;

         fBackClassWinPct := 0;
         fAvgClassWinPct := 0;
         fAvgClassRatingWinPct := 0;

         fEarlyPaceWinPct := 0;
         fMiddlePaceWinPct := 0;
         fLatePaceWinPct := 0;

         fEarlyPacePosWinPct := 0;
         fMiddlePacePosWinPct := 0;
         fLatePacePosWinPct := 0;

         fDamAllWinPct := 0;
         fSireAllWinPct := 0;
         fTotalBrdWinPct := 0;
         fDamSireAllWinPct := 0;

         fDamAllMudWinPct := 0;
         fSireAllMudWinPct := 0;
         fDamSireAllMudWinPct := 0;

         fDamAllTurfWinPct := 0;
         fSireAllTurfWinPct := 0;
         fDamSireAllTurfWinPct := 0;

         fTotalTrnOddsWinPct := 0;
         fTotalJkyOddsWinPct := 0;
         fTotalTrnTurfWinPct := 0;
         fTotalTrn10WinPct := 0;
         fTotalTrn30WinPct := 0;
         fTotalJky10WinPct := 0;
         fTotalJky30WinPct := 0;

         fTrnTodayWinPct := 0;
         fTotalTrnWinPct := 0;
         //         fTotalTrnDaysWinPct := 0;
         fTotalTrnJkyWinPct := 0;
         //         fTotalTrnJkyDaysWinPct := 0;
         fTotalJkyWinPct := 0;
         //         fTotalJkyDaysWinPct := 0;
         fTotalTrnOwnWinPct := 0;
         fTotalOwnWinPct := 0;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('MorningLineTo1Rank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'MorningLineTo1Rank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fMorningLineTo1WinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fMorningLineTo1WinPct = 0 then begin
               fMorningLineTo1WinPct := 1.0;
            end;
         end else begin
            fMorningLineTo1WinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('PowerRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'PowerRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fPowerWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fPowerWinPct = 0 then begin
               fPowerWinPct := 1.0;
            end;
         end else begin
            fPowerWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('LastSpeedRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'LastSpeedRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fLastSpeedWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fLastSpeedWinPct = 0 then begin
               fLastSpeedWinPct := 1.0;
            end;
         end else begin
            fLastSpeedWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('AvgSpeedRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'AvgSpeedRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fAvgSpeedWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fAvgSpeedWinPct = 0 then begin
               fAvgSpeedWinPct := 1.0;
            end;
         end else begin
            fAvgSpeedWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('BackSpeedRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'BackSpeedRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fBackSpeedWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fBackSpeedWinPct = 0 then begin
               fBackSpeedWinPct := 1.0;
            end;
         end else begin
            fBackSpeedWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('PastSpeedRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'PastSpeedRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fPastSpeedWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fPastSpeedWinPct = 0 then begin
               fPastSpeedWinPct := 1.0;
            end;
         end else begin
            fPastSpeedWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('BackClassRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'BackClassRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fBackClassWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fBackClassWinPct = 0 then begin
               fBackClassWinPct := 1.0;
            end;
         end else begin
            fBackClassWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('AvgClassRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'AvgClassRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fAvgClassWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fAvgClassWinPct = 0 then begin
               fAvgClassWinPct := 1.0;
            end;
         end else begin
            fAvgClassWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('AvgClassRatingRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'AvgClassRatingRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fAvgClassRatingWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fAvgClassRatingWinPct = 0 then begin
               fAvgClassRatingWinPct := 1.0;
            end;
         end else begin
            fAvgClassRatingWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('BackPace1Rank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'BackPace1Rank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fBackPace1WinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fBackPace1WinPct = 0 then begin
               fBackPace1WinPct := 1.0;
            end;
         end else begin
            fBackPace1WinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('BackPace2Rank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'BackPace2Rank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fBackPace2WinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fBackPace2WinPct = 0 then begin
               fBackPace2WinPct := 1.0;
            end;
         end else begin
            fBackPace2WinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('EarlyPaceRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'EarlyPaceRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fEarlyPaceWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fEarlyPaceWinPct = 0 then begin
               fEarlyPaceWinPct := 1.0;
            end;
         end else begin
            fEarlyPaceWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('MiddlePaceRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'MiddlePaceRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fMiddlePaceWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fMiddlePaceWinPct = 0 then begin
               fMiddlePaceWinPct := 1.0;
            end;
         end else begin
            fMiddlePaceWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('LatePaceRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'LatePaceRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fLatePaceWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fLatePaceWinPct = 0 then begin
               fLatePaceWinPct := 1.0;
            end;
         end else begin
            fLatePaceWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('EarlyPacePosRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'EarlyPacePosRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fEarlyPacePosWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fEarlyPacePosWinPct = 0 then begin
               fEarlyPacePosWinPct := 1.0;
            end;
         end else begin
            fEarlyPacePosWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('MiddlePacePosRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'MiddlePacePosRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fMiddlePacePosWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fMiddlePacePosWinPct = 0 then begin
               fMiddlePacePosWinPct := 1.0;
            end;
         end else begin
            fMiddlePacePosWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('LatePacePosRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'LatePacePosRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fLatePacePosWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fLatePacePosWinPct = 0 then begin
               fLatePacePosWinPct := 1.0;
            end;
         end else begin
            fLatePacePosWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalOwnWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalOwnWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalOwnWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalOwnWinPct = 0 then begin
               fTotalOwnWinPct := 1.0;
            end;
         end else begin
            fTotalOwnWinPct := 1.0;
         end;

         //
         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('DamAllWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'DamAllWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fDamAllWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fDamAllWinPct = 0 then begin
               fDamAllWinPct := 1.0;
            end;
         end else begin
            fDamAllWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('DamSireAllWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'DamSireAllWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fDamSireAllWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fDamSireAllWinPct = 0 then begin
               fDamSireAllWinPct := 1.0;
            end;
         end else begin
            fDamSireAllWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('SireAllWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'SireAllWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fSireAllWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fSireAllWinPct = 0 then begin
               fSireAllWinPct := 1.0;
            end;
         end else begin
            fSireAllWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalBrdWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalBrdWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalBrdWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalBrdWinPct = 0 then begin
               fTotalBrdWinPct := 1.0;
            end;
         end else begin
            fTotalBrdWinPct := 1.0;
         end;

         //
         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('DamAllMudWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'DamAllMudWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fDamAllMudWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fDamAllMudWinPct = 0 then begin
               fDamAllMudWinPct := 1.0;
            end;
         end else begin
            fDamAllMudWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('DamSireAllMudWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'DamSireAllMudWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fDamSireAllMudWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fDamSireAllMudWinPct = 0 then begin
               fDamSireAllMudWinPct := 1.0;
            end;
         end else begin
            fDamSireAllMudWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('SireAllMudWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'SireAllMudWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fSireAllMudWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fSireAllMudWinPct = 0 then begin
               fSireAllMudWinPct := 1.0;
            end;
         end else begin
            fSireAllMudWinPct := 1.0;
         end;

         //
         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('DamAllTurfWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'DamAllTurfWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fDamAllTurfWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fDamAllTurfWinPct = 0 then begin
               fDamAllTurfWinPct := 1.0;
            end;
         end else begin
            fDamAllTurfWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('DamSireAllTurfWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'DamSireAllTurfWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fDamSireAllTurfWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fDamSireAllTurfWinPct = 0 then begin
               fDamSireAllTurfWinPct := 1.0;
            end;
         end else begin
            fDamSireAllTurfWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('SireAllTurfWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'SireAllTurfWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fSireAllTurfWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fSireAllTurfWinPct = 0 then begin
               fSireAllTurfWinPct := 1.0;
            end;
         end else begin
            fSireAllTurfWinPct := 1.0;
         end;

         //
         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnOddsWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalTrnOddsWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalTrnOddsWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalTrnOddsWinPct = 0 then begin
               fTotalTrnOddsWinPct := 1.0;
            end;
         end else begin
            fTotalTrnOddsWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalJkyOddsWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalJkyOddsWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalJkyOddsWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalJkyOddsWinPct = 0 then begin
               fTotalJkyOddsWinPct := 1.0;
            end;
         end else begin
            fTotalJkyOddsWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnOwnWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalTrnOwnWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalTrnOwnWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalTrnOwnWinPct = 0 then begin
               fTotalTrnOwnWinPct := 1.0;
            end;
         end else begin
            fTotalTrnOwnWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnJkyWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalTrnJkyWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalTrnJkyWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalTrnJkyWinPct = 0 then begin
               fTotalTrnJkyWinPct := 1.0;
            end;
         end else begin
            fTotalTrnJkyWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnTurfWinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalTrnTurfWinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalTrnTurfWinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalTrnTurfWinPct = 0 then begin
               fTotalTrnTurfWinPct := 1.0;
            end;
         end else begin
            fTotalTrnTurfWinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrn10WinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalTrn10WinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalTrn10WinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalTrn10WinPct = 0 then begin
               fTotalTrn10WinPct := 1.0;
            end;
         end else begin
            fTotalTrn10WinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrn10WinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalTrn10WinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalTrn10WinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalTrn10WinPct = 0 then begin
               fTotalTrn10WinPct := 1.0;
            end;
         end else begin
            fTotalTrn10WinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalJky10WinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalJky10WinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalJky10WinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalJky10WinPct = 0 then begin
               fTotalJky10WinPct := 1.0;
            end;
         end else begin
            fTotalJky10WinPct := 1.0;
         end;

         dm.tblRankingStats.IndexName := '';
         dm.tblRankingStats.SetKey();
         dm.tblRankingStats.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalJky10WinPctRank').AsInteger;
         dm.tblRankingStats.FieldByName('Name').AsString := 'TotalJky10WinPctRank';
         if (dm.tblRankingStats.GotoKey()) then begin
            fTotalJky10WinPct := dm.tblRankingStats.FieldByName('WinPct').AsFloat;
            if fTotalJky10WinPct = 0 then begin
               fTotalJky10WinPct := 1.0;
            end;
         end else begin
            fTotalJky10WinPct := 1.0;
         end;

         tblE.FieldByName('BaseRPI').AsFloat := (
            fAvgSpeedWinPct / 100 *
            fLastSpeedWinPct / 100 *
            fPowerWinPct / 100 *
            fLatePaceWinPct / 100
            );
         tblE.FieldByName('BaseRPI').AsFloat := Round(tblE.FieldByName('BaseRPI').AsFloat * 100) / 100;

         tblE.FieldByName('TurfRPI').AsFloat :=
            (
            fSireAllTurfWinPct / 100 *
            fDamSireAllTurfWinPct / 100
            );
         tblE.FieldByName('TurfRPI').AsFloat := Round(tblE.FieldByName('TurfRPI').AsFloat * 100) / 100;

         tblE.FieldByName('MudRPI').AsFloat :=
            (
            fSireAllMudWinPct / 100 *
            fDamSireAllMudWinPct / 100
            );
         tblE.FieldByName('MudRPI').AsFloat := Round(tblE.FieldByName('MudRPI').AsFloat * 100) / 100;

         tblE.FieldByName('MaidenRPI').AsFloat :=
            (
            fSireAllWinPct / 100 *
            fTotalBrdWinPct / 100 *
            fDamSireAllWinPct / 100
            );
         tblE.FieldByName('MaidenRPI').AsFloat := Round(tblE.FieldByName('MaidenRPI').AsFloat * 100) / 100;

         tblE.FieldByName('ConnectionRPI').AsFloat :=
            (
            fTotalTrnOddsWinPct / 100 *
            fTotalJkyOddsWinPct / 100 *
            fTotalOwnWinPct / 100 *
            fTotalTrnJkyWinPct / 100 *
            fTotalTrnOwnWinPct / 100
            );
         tblE.FieldByName('ConnectionRPI').AsFloat := Round(tblE.FieldByName('ConnectionRPI').AsFloat * 100) / 100;

         // Also in UpdateFinalRankings
         fBaseIV := 0;
         fPaceIV := 0;
         fPacePosIV := 0;
         fClassIV := 0;
         fSpeedIV := 0;
         fMaidenIV := 0;
         fTurfIV := 0;
         fMudIV := 0;
         fConnectionIV := 0;

         fMorningLineTo1RankIV := 0;
         fPowerRankIV := 0;

         fLastSpeedRankIV := 0;
         fBackSpeedRankIV := 0;
         fPastSpeedRankIV := 0;
         fAvgSpeedRankIV := 0;
         fBackPace1RankIV := 0;
         fBackPace2RankIV := 0;

         fBackClassRankIV := 0;
         fAvgClassRankIV := 0;
         fAvgClassRatingRankIV := 0;

         fEarlyPaceRankIV := 0;
         fMiddlePaceRankIV := 0;
         fLatePaceRankIV := 0;

         fEarlyPacePosRankIV := 0;
         fMiddlePacePosRankIV := 0;
         fLatePacePosRankIV := 0;

         fDamAllWinPctRankIV := 0;
         fSireAllWinPctRankIV := 0;
         fTotalBrdWinPctRankIV := 0;
         fDamSireAllWinPctRankIV := 0;

         fDamAllMudWinPctRankIV := 0;
         fSireAllMudWinPctRankIV := 0;
         fDamSireAllMudWinPctRankIV := 0;

         fDamAllTurfWinPctRankIV := 0;
         fSireAllTurfWinPctRankIV := 0;
         fDamSireAllTurfWinPctRankIV := 0;

         fTotalTrnOddsWinPctRankIV := 0;
         fTotalJkyOddsWinPctRankIV := 0;
         fTotalTrnTurfWinPctRankIV := 0;
         fTotalTrn10WinPctRankIV := 0;
         fTotalTrn30WinPctRankIV := 0;
         fTotalJky10WinPctRankIV := 0;
         fTotalJky30WinPctRankIV := 0;

         fTrnTodayWinPctRankIV := 0;
         fTotalTrnWinPctRankIV := 0;
         //         fTotalTrnDaysWinPctRankIV := 0;
         fTotalTrnJkyWinPctRankIV := 0;
         //         fTotalTrnJkyDaysWinPctRankIV := 0;
         fTotalJkyWinPctRankIV := 0;
         //         fTotalJkyDaysWinPctRankIV := 0;
         fTotalTrnOwnWinPctRankIV := 0;
         fTotalOwnWinPctRankIV := 0;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('MorningLineTo1Rank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'MorningLineTo1Rank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fMorningLineTo1RankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fMorningLineTo1RankIV = 0 then begin
               fMorningLineTo1RankIV := 1.0;
            end;
         end else begin
            fMorningLineTo1RankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('PowerRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'PowerRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fPowerRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fPowerRankIV = 0 then begin
               fPowerRankIV := 1.0;
            end;
         end else begin
            fPowerRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('LastSpeedRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'LastSpeedRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fLastSpeedRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fLastSpeedRankIV = 0 then begin
               fLastSpeedRankIV := 1.0;
            end;
         end else begin
            fLastSpeedRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('AvgSpeedRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'AvgSpeedRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fAvgSpeedRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fAvgSpeedRankIV = 0 then begin
               fAvgSpeedRankIV := 1.0;
            end;
         end else begin
            fAvgSpeedRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('BackSpeedRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'BackSpeedRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fBackSpeedRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fBackSpeedRankIV = 0 then begin
               fBackSpeedRankIV := 1.0;
            end;
         end else begin
            fBackSpeedRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('PastSpeedRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'PastSpeedRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fPastSpeedRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fPastSpeedRankIV = 0 then begin
               fPastSpeedRankIV := 1.0;
            end;
         end else begin
            fPastSpeedRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('BackClassRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'BackClassRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fBackClassRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fBackClassRankIV = 0 then begin
               fBackClassRankIV := 1.0;
            end;
         end else begin
            fBackClassRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('AvgClassRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'AvgClassRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fAvgClassRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fAvgClassRankIV = 0 then begin
               fAvgClassRankIV := 1.0;
            end;
         end else begin
            fAvgClassRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('AvgClassRatingRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'AvgClassRatingRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fAvgClassRatingRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fAvgClassRatingRankIV = 0 then begin
               fAvgClassRatingRankIV := 1.0;
            end;
         end else begin
            fAvgClassRatingRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('BackPace1Rank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'BackPace1Rank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fBackPace1RankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fBackPace1RankIV = 0 then begin
               fBackPace1RankIV := 1.0;
            end;
         end else begin
            fBackPace1RankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('BackPace2Rank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'BackPace2Rank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fBackPace2RankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fBackPace2RankIV = 0 then begin
               fBackPace2RankIV := 1.0;
            end;
         end else begin
            fBackPace2RankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('EarlyPaceRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'EarlyPaceRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fEarlyPaceRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fEarlyPaceRankIV = 0 then begin
               fEarlyPaceRankIV := 1.0;
            end;
         end else begin
            fEarlyPaceRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('MiddlePaceRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'MiddlePaceRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fMiddlePaceRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fMiddlePaceRankIV = 0 then begin
               fMiddlePaceRankIV := 1.0;
            end;
         end else begin
            fMiddlePaceRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('LatePaceRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'LatePaceRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fLatePaceRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fLatePaceRankIV = 0 then begin
               fLatePaceRankIV := 1.0;
            end;
         end else begin
            fLatePaceRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('EarlyPacePosRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'EarlyPacePosRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fEarlyPacePosRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fEarlyPacePosRankIV = 0 then begin
               fEarlyPacePosRankIV := 1.0;
            end;
         end else begin
            fEarlyPacePosRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('MiddlePacePosRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'MiddlePacePosRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fMiddlePacePosRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fMiddlePacePosRankIV = 0 then begin
               fMiddlePacePosRankIV := 1.0;
            end;
         end else begin
            fMiddlePacePosRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('LatePacePosRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'LatePacePosRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fLatePacePosRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fLatePacePosRankIV = 0 then begin
               fLatePacePosRankIV := 1.0;
            end;
         end else begin
            fLatePacePosRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalOwnWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalOwnWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalOwnWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalOwnWinPctRankIV = 0 then begin
               fTotalOwnWinPctRankIV := 1.0;
            end;
         end else begin
            fTotalOwnWinPctRankIV := 1.0;
         end;

         //
         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('DamAllWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'DamAllWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fDamAllWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fDamAllWinPctRankIV = 0 then begin
               fDamAllWinPctRankIV := 1.0;
            end;
         end else begin
            fDamAllWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('DamSireAllWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'DamSireAllWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fDamSireAllWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fDamSireAllWinPctRankIV = 0 then begin
               fDamSireAllWinPctRankIV := 1.0;
            end;
         end else begin
            fDamSireAllWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('SireAllWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'SireAllWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fSireAllWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fSireAllWinPctRankIV = 0 then begin
               fSireAllWinPctRankIV := 1.0;
            end;
         end else begin
            fSireAllWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalBrdWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalBrdWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalBrdWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalBrdWinPctRankIV = 0 then begin
               fTotalBrdWinPctRankIV := 1.0;
            end;
         end else begin
            fTotalBrdWinPctRankIV := 1.0;
         end;

         //
         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('DamAllMudWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'DamAllMudWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fDamAllMudWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fDamAllMudWinPctRankIV = 0 then begin
               fDamAllMudWinPctRankIV := 1.0;
            end;
         end else begin
            fDamAllMudWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('DamSireAllMudWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'DamSireAllMudWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fDamSireAllMudWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fDamSireAllMudWinPctRankIV = 0 then begin
               fDamSireAllMudWinPctRankIV := 1.0;
            end;
         end else begin
            fDamSireAllMudWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('SireAllMudWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'SireAllMudWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fSireAllMudWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fSireAllMudWinPctRankIV = 0 then begin
               fSireAllMudWinPctRankIV := 1.0;
            end;
         end else begin
            fSireAllMudWinPctRankIV := 1.0;
         end;

         //
         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('DamAllTurfWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'DamAllTurfWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fDamAllTurfWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fDamAllTurfWinPctRankIV = 0 then begin
               fDamAllTurfWinPctRankIV := 1.0;
            end;
         end else begin
            fDamAllTurfWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('DamSireAllTurfWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'DamSireAllTurfWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fDamSireAllTurfWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fDamSireAllTurfWinPctRankIV = 0 then begin
               fDamSireAllTurfWinPctRankIV := 1.0;
            end;
         end else begin
            fDamSireAllTurfWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('SireAllTurfWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'SireAllTurfWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fSireAllTurfWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fSireAllTurfWinPctRankIV = 0 then begin
               fSireAllTurfWinPctRankIV := 1.0;
            end;
         end else begin
            fSireAllTurfWinPctRankIV := 1.0;
         end;

         //
         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnOddsWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalTrnOddsWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalTrnOddsWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalTrnOddsWinPctRankIV = 0 then begin
               fTotalTrnOddsWinPctRankIV := 1.0;
            end;
         end else begin
            fTotalTrnOddsWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalJkyOddsWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalJkyOddsWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalJkyOddsWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalJkyOddsWinPctRankIV = 0 then begin
               fTotalJkyOddsWinPctRankIV := 1.0;
            end;
         end else begin
            fTotalJkyOddsWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnOwnWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalTrnOwnWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalTrnOwnWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalTrnOwnWinPctRankIV = 0 then begin
               fTotalTrnOwnWinPctRankIV := 1.0;
            end;
         end else begin
            fTotalTrnOwnWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnJkyWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalTrnJkyWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalTrnJkyWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalTrnJkyWinPctRankIV = 0 then begin
               fTotalTrnJkyWinPctRankIV := 1.0;
            end;
         end else begin
            fTotalTrnJkyWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrnTurfWinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalTrnTurfWinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalTrnTurfWinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalTrnTurfWinPctRankIV = 0 then begin
               fTotalTrnTurfWinPctRankIV := 1.0;
            end;
         end else begin
            fTotalTrnTurfWinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrn10WinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalTrn10WinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalTrn10WinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalTrn10WinPctRankIV = 0 then begin
               fTotalTrn10WinPctRankIV := 1.0;
            end;
         end else begin
            fTotalTrn10WinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalTrn10WinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalTrn10WinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalTrn10WinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalTrn10WinPctRankIV = 0 then begin
               fTotalTrn10WinPctRankIV := 1.0;
            end;
         end else begin
            fTotalTrn10WinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalJky10WinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalJky10WinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalJky10WinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalJky10WinPctRankIV = 0 then begin
               fTotalJky10WinPctRankIV := 1.0;
            end;
         end else begin
            fTotalJky10WinPctRankIV := 1.0;
         end;

         dm.tblRankingStatsByTrk.IndexName := '';
         dm.tblRankingStatsByTrk.SetKey();
         dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := tblE.FieldByName('TotalJky10WinPctRank').AsInteger;
         dm.tblRankingStatsByTrk.FieldByName('Name').AsString := 'TotalJky10WinPctRank';
         if (dm.tblRankingStatsByTrk.GotoKey()) then begin
            fTotalJky10WinPctRankIV := dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat;
            if fTotalJky10WinPctRankIV = 0 then begin
               fTotalJky10WinPctRankIV := 1.0;
            end;
         end else begin
            fTotalJky10WinPctRankIV := 1.0;
         end;

         tblE.FieldByName('LastSpeedRankIV').AsFloat := Round(fLastSpeedRankIV * 100) / 100;
         tblE.FieldByName('BackSpeedRankIV').AsFloat := Round(fBackSpeedRankIV * 100) / 100;
         tblE.FieldByName('AvgSpeedRankIV').AsFloat := Round(fAvgSpeedRankIV * 100) / 100;
         tblE.FieldByName('PastSpeedRankIV').AsFloat := Round(fPastSpeedRankIV * 100) / 100;

         tblE.FieldByName('MorningLineTo1RankIV').AsFloat := Round(fMorningLineTo1RankIV * 100) / 100;
         tblE.FieldByName('PowerRankIV').AsFloat := Round(fPowerRankIV * 100) / 100;

         tblE.FieldByName('BackClassRankIV').AsFloat := Round(fBackClassRankIV * 100) / 100;
         tblE.FieldByName('AvgClassRankIV').AsFloat := Round(fAvgClassRankIV * 100) / 100;
         tblE.FieldByName('AvgClassRatingRankIV').AsFloat := Round(fAvgClassRatingRankIV * 100) / 100;

         tblE.FieldByName('BackPace1RankIV').AsFloat := Round(fBackPace1RankIV * 100) / 100;
         tblE.FieldByName('BackPace2RankIV').AsFloat := Round(fBackPace2RankIV * 100) / 100;
         tblE.FieldByName('EarlyPaceRankIV').AsFloat := Round(fEarlyPaceRankIV * 100) / 100;
         tblE.FieldByName('MiddlePaceRankIV').AsFloat := Round(fMiddlePaceRankIV * 100) / 100;
         tblE.FieldByName('LatePaceRankIV').AsFloat := Round(fLatePaceRankIV * 100) / 100;

         tblE.FieldByName('EarlyPacePosRankIV').AsFloat := Round(fEarlyPacePosRankIV * 100) / 100;
         tblE.FieldByName('MiddlePacePosRankIV').AsFloat := Round(fMiddlePacePosRankIV * 100) / 100;
         tblE.FieldByName('LatePacePosRankIV').AsFloat := Round(fLatePacePosRankIV * 100) / 100;

         tblE.FieldByName('DamAllWinPctRankIV').AsFloat := Round(fDamAllWinPctRankIV * 100) / 100;
         tblE.FieldByName('SireAllWinPctRankIV').AsFloat := Round(fSireAllWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalBrdWinPctRankIV').AsFloat := Round(fTotalBrdWinPctRankIV * 100) / 100;
         tblE.FieldByName('DamSireAllWinPctRankIV').AsFloat := Round(fDamSireAllWinPctRankIV * 100) / 100;

         tblE.FieldByName('DamAllMudWinPctRankIV').AsFloat := Round(fDamAllMudWinPctRankIV * 100) / 100;
         tblE.FieldByName('SireAllMudWinPctRankIV').AsFloat := Round(fSireAllMudWinPctRankIV * 100) / 100;
         tblE.FieldByName('DamSireAllMudWinPctRankIV').AsFloat := Round(fDamSireAllMudWinPctRankIV * 100) / 100;

         tblE.FieldByName('DamAllTurfWinPctRankIV').AsFloat := Round(fDamAllTurfWinPctRankIV * 100) / 100;
         tblE.FieldByName('SireAllTurfWinPctRankIV').AsFloat := Round(fSireAllTurfWinPctRankIV * 100) / 100;
         tblE.FieldByName('DamSireAllTurfWinPctRankIV').AsFloat := Round(fDamSireAllTurfWinPctRankIV * 100) / 100;

         tblE.FieldByName('TotalTrnOddsWinPctRankIV').AsFloat := Round(fTotalTrnOddsWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalJkyOddsWinPctRankIV').AsFloat := Round(fTotalJkyOddsWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalTrnTurfWinPctRankIV').AsFloat := Round(fTotalTrnTurfWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalTrn10WinPctRankIV').AsFloat := Round(fTotalTrn10WinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalTrn30WinPctRankIV').AsFloat := Round(fTotalTrn30WinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalJky10WinPctRankIV').AsFloat := Round(fTotalJky10WinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalJky30WinPctRankIV').AsFloat := Round(fTotalJky30WinPctRankIV * 100) / 100;

         tblE.FieldByName('TrnTodayWinPctRankIV').AsFloat := Round(fTrnTodayWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalTrnWinPctRankIV').AsFloat := Round(fTotalTrnWinPctRankIV * 100) / 100;
         //            tblE.FieldByName('TotalTrnDaysWinPctRankIV').AsFloat := Round(fTotalTrnDaysWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalTrnJkyWinPctRankIV').AsFloat := Round(fTotalTrnJkyWinPctRankIV * 100) / 100;
         //            tblE.FieldByName('TotalTrnJkyDaysWinPctRankIV').AsFloat := Round(fTotalTrnJkyDaysWinPctRankIV * 100) / 100;
         //            tblE.FieldByName('TotalJkyWinPctRankIV').AsFloat := Round(fTotalJkyWinPctRankIV * 100) / 100;
         //            tblE.FieldByName('TotalJkyDaysWinPctRankIV').AsFloat := Round(fTotalJkyDaysWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalTrnOwnWinPctRankIV').AsFloat := Round(fTotalTrnOwnWinPctRankIV * 100) / 100;
         tblE.FieldByName('TotalOwnWinPctRankIV').AsFloat := Round(fTotalOwnWinPctRankIV * 100) / 100;

         fConnectionIV := (
            fTotalTrnOddsWinPctRankIV *
            fTotalJkyOddsWinPctRankIV *
            fTotalOwnWinPctRankIV *
            fTotalTrnJkyWinPctRankIV *
            fTotalTrnOwnWinPctRankIV
            );
         tblE.FieldByName('ConnectionIV').AsFloat := Round(fConnectionIV * 100) / 100;

         fBaseIV := (
            fAvgSpeedRankIV *
            fLastSpeedRankIV *
            fPowerRankIV *
            fLatePaceRankIV
            );

         if (
            ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) and
            (tblE.FieldByName('MiddlePaceRank').AsInteger = 1))
            ) then begin
            fBaseIV := (
               fEarlyPaceRankIV *
               fMiddlePaceRankIV
               );
         end;

         if (
            (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) and
            (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) and
            (tblE.FieldByName('LatePaceRank').AsInteger = 1)
            ) then begin
            fBaseIV := (
               fEarlyPaceRankIV *
               fMiddlePaceRankIV *
               fLatePaceRankIV
               );
         end;

         if (
            ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) and
            (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) and
            (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1))
            ) then begin
            fBaseIV := (
               fEarlyPaceRankIV *
               fMorningLineTo1RankIV *
               fMiddlePaceRankIV
               );
         end;

         if (
            (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) and
            (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) and
            (tblE.FieldByName('LatePaceRank').AsInteger = 1) and
            (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1)
            ) then begin
            fBaseIV := (
               fEarlyPaceRankIV *
               fMiddlePaceRankIV *
               fMorningLineTo1RankIV *
               fLatePaceRankIV
               );
         end;

         if ((tblE.FieldByName('LastSpeedRank').AsInteger = 1) and
            (tblE.FieldByName('PastSpeedRank').AsInteger = 1) and
            (tblE.FieldByName('AvgClassRank').AsInteger = 1) and
            (tblE.FieldByName('BackClassRank').AsInteger = 1) and
            (tblE.FieldByName('TotalTrnWinPct').AsFloat > MIN_TRN_STAT_WIN_PCT) and
            (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1)) then begin
            fBaseIV := (
               fLastSpeedRankIV *
               fPastSpeedRankIV *
               fAvgClassRankIV *
               fBackClassRankIV *
               fMorningLineTo1RankIV
               );
         end;

         if (tblE.FieldByName('BackPace1Rank').AsInteger = 1) and
            (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) and
            (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) and
            (tblE.FieldByName('BackPace2Rank').AsInteger = 1) and
            (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) and
            (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) and
            (tblE.FieldByName('TotalTrnWinPct').AsFloat > MIN_TRN_STAT_WIN_PCT) and
            (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
            fBaseIV := (
               fBackPace1RankIV *
               fEarlyPacePosRankIV *
               fEarlyPaceRankIV *
               fBackPace2RankIV *
               fMiddlePacePosRankIV *
               fMiddlePaceRankIV *
               fMorningLineTo1RankIV
               );
         end;
         tblE.FieldByName('BaseIV').AsFloat := Round(fBaseIV * 100) / 100;

         fClassIV := (
            fBackClassRankIV *
            fAvgClassRankIV
            );
         tblE.FieldByName('ClassIV').AsFloat := Round(fClassIV * 100) / 100;

         fSpeedIV := (
            fLastSpeedRankIV *
            fBackSpeedRankIV *
            fAvgSpeedRankIV
            );
         tblE.FieldByName('SpeedIV').AsFloat := Round(fSpeedIV * 100) / 100;

         fPaceIV := (
            fEarlyPaceRankIV *
            fMiddlePaceRankIV *
            fLatePaceRankIV
            );
         tblE.FieldByName('PaceIV').AsFloat := Round(fPaceIV * 100) / 100;

         fPacePosIV := (
            fEarlyPacePosRankIV *
            fMiddlePacePosRankIV *
            fLatePacePosRankIV
            );
         tblE.FieldByName('PacePosIV').AsFloat := Round(fPacePosIV * 100) / 100;

         fMaidenIV := (
            fDamAllWinPctRankIV *
            fSireAllWinPctRankIV *
            fTotalBrdWinPctRankIV *
            fDamSireAllWinPctRankIV
            );
         tblE.FieldByName('MaidenIV').AsFloat := Round(fMaidenIV * 100) / 100;

         fMudIV := (
            fDamAllMudWinPctRankIV *
            fSireAllMudWinPctRankIV *
            fDamSireAllMudWinPctRankIV
            );
         tblE.FieldByName('MudIV').AsFloat := Round(fMudIV * 100) / 100;

         fTurfIV := (
            fDamAllTurfWinPctRankIV *
            fSireAllTurfWinPctRankIV *
            fDamSireAllTurfWinPctRankIV
            );
         tblE.FieldByName('TurfIV').AsFloat := Round(fTurfIV * 100) / 100;

         tblE.Post();
         tblE.Next();
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         CloseTable(tblR);
         CloseTable(tblE);
         CloseTable(dm.tblRankingStatsByTrk);
         CloseTable(dm.tblRankingStats);
         ClearPrgStatusBars();
      end;
   end;

   CloseTable(tblR);
   CloseTable(tblE);
   CloseTable(dm.tblRankingStatsByTrk);
   CloseTable(dm.tblRankingStats);
   ClearPrgStatusBars();

end;

procedure IndexRPIAndIV
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer);
begin

   hLog.AddToLog('IndexRPIAndIV', msevOperation);
   //
   OpenTable(tblE);
   try

      tblE.AddIndex('ByConnectionRPIRank', 'TrkCode;RaceDate;RaceNbr;ConnectionRPI;Power', [ixDescending], 'ConnectionRPI;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);
   SetRanking(tblE, 'ByConnectionRPIRank', 'ConnectionRPIRank', 'ConnectionRPI', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTable(tblE);
   try
      tblE.DeleteIndex('ByConnectionRPIRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);

   //
   OpenTable(tblE);
   try
      tblE.AddIndex('ByConnectionIVRank', 'TrkCode;RaceDate;RaceNbr;ConnectionIV;Power', [ixDescending], 'ConnectionIV;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);
   SetRanking(tblE, 'ByConnectionIVRank', 'ConnectionIVRank', 'ConnectionIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTable(tblE);
   try
      tblE.DeleteIndex('ByConnectionIVRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);

   //
   OpenTable(tblE);
   try
      tblE.AddIndex('ByPaceIVRank', 'TrkCode;RaceDate;RaceNbr;PaceIV;Power', [ixDescending], 'PaceIV;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);
   SetRanking(tblE, 'ByPaceIVRank', 'PaceIVRank', 'PaceIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTable(tblE);
   try
      tblE.DeleteIndex('ByPaceIVRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);

   //
   OpenTable(tblE);
   try
      tblE.AddIndex('ByPacePosIVRank', 'TrkCode;RaceDate;RaceNbr;PacePosIV;Power', [ixDescending], 'PacePosIV;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);
   SetRanking(tblE, 'ByPacePosIVRank', 'PacePosIVRank', 'PacePosIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTable(tblE);
   try
      tblE.DeleteIndex('ByPacePosIVRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);

   //
   OpenTable(tblE);
   try
      tblE.AddIndex('BySpeedIVRank', 'TrkCode;RaceDate;RaceNbr;SpeedIV;Power', [ixDescending], 'SpeedIV;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);
   SetRanking(tblE, 'BySpeedIVRank', 'SpeedIVRank', 'SpeedIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTable(tblE);
   try
      tblE.DeleteIndex('BySpeedIVRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);

   //
   OpenTable(tblE);
   try
      tblE.AddIndex('ByClassIVRank', 'TrkCode;RaceDate;RaceNbr;ClassIV;Power', [ixDescending], 'ClassIV;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);
   SetRanking(tblE, 'ByClassIVRank', 'ClassIVRank', 'ClassIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTable(tblE);
   try
      tblE.DeleteIndex('ByClassIVRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTable(tblE);

   //
   //OpenTable(tblE);
   //try
   //   tblE.AddIndex('ByPrimaryValueBetRank', 'TrkCode;RaceDate;RaceNbr;PrimaryValueBet;Power', [ixDescending], 'PrimaryValueBet;Power', icFull);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //CloseTable(tblE);
   //SetRanking(tblE, 'ByPrimaryValueBetRank', 'PrimaryValueBetRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE,  STAT_DAYS);
   //OpenTable(tblE);
   //try
   //   tblE.DeleteIndex('ByPrimaryValueBetRank');
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //CloseTable(tblE);

   //
   //OpenTable(tblE);
   //try
   //   tblE.AddIndex('BySecondaryValueBetRank', 'TrkCode;RaceDate;RaceNbr;SecondaryValueBet;Power', [ixDescending], 'SecondaryValueBet;Power', icFull);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //CloseTable(tblE);
   //SetRanking(tblE, 'BySecondaryValueBetRank', 'SecondaryValueBetRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE,  STAT_DAYS);
   //OpenTable(tblE);
   //try
   //   tblE.DeleteIndex('BySecondaryValueBetRank');
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //CloseTable(tblE);

   //
   //OpenTable(tblE);
   //try
   //   tblE.AddIndex('ByDefaultValueBetRank', 'TrkCode;RaceDate;RaceNbr;DefaultValueBet;Power', [ixDescending], 'DefaultValueBet;Power');
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //CloseTable(tblE);
   //SetRanking(tblE, 'ByDefaultValueBetRank', 'DefaultValueBetRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE,  STAT_DAYS);
   //OpenTable(tblE);
   //try
   //   tblE.DeleteIndex('ByDefaultValueBetRank');
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //CloseTable(tblE);

   try
      SetRanking(dm.tblEntries, 'ByBaseIVRank', 'BaseIVRank', 'BaseIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(dm.tblEntries, 'ByTurfIVRank', 'TurfIVRank', 'TurfIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(dm.tblEntries, 'ByMudIVRank', 'MudIVRank', 'MudIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(dm.tblEntries, 'ByMaidenIVRank', 'MaidenIVRank', 'MaidenIV', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(dm.tblEntries, 'ByBaseRPIRank', 'BaseRPIRank', 'BaseRPI', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(dm.tblEntries, 'ByTurfRPIRank', 'TurfRPIRank', 'TurfRPI', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(dm.tblEntries, 'ByMudRPIRank', 'MudRPIRank', 'MudRPI', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(dm.tblEntries, 'ByMaidenRPIRank', 'MaidenRPIRank', 'MaidenRPI', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

end.
