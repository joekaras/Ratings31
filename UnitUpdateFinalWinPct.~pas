unit UnitUpdateFinalWinPct;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

// Sets win pct rank for FK (FinalKey) . Used by daily and stat updates
// Run Seq 6
procedure Update_FinalOrder_WinPct(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblF: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );

// Sets win pct rank for FK. Used by daily and stat updates
// Run Seq 7
procedure Update_FinalOrder_WinPctRank(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitGetHandicappingKeys, UnitSetRanking;


procedure Update_FinalOrder_WinPct
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblF: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );
var

   sFinalOrderKey: string;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;


begin

   hLog.AddToLog('Update_FK_WinPct', msevOperation);
   try

      try
         CloseTable(tblR);
         CloseTable(tblE);
         CloseTable(tblF);

         OpenTable(tblR);
         OpenTable(tblE);
         OpenTable(tblF);


         if (bOneDay) then begin
            tblE.IndexName := 'ByRangeRaceDate';

            tblE.SetRangeStart;
            tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            tblE.KeyFieldCount := 1;

            tblE.SetRangeEnd;
            tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            tblE.KeyFieldCount := 1;

            tblE.ApplyRange;
         end else begin
            tblE.IndexName := 'ByRangeRaceDate';

            tblE.SetRangeStart;
            tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
            tblE.KeyFieldCount := 1;

            tblE.SetRangeEnd;
            tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            tblE.KeyFieldCount := 1;

            tblE.ApplyRange;
         end;

         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;
         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Update FK WinPct - ' +
                  tblE.FieldByName('TrkCode').AsString + ' ' +
                  tblE.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblE.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
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

            IncPrgBar();

            if (tblE.FieldByName('TrkCode').AsString = '') then begin
               tblE.Next();
               continue;
            end;

            tblE.Edit();


            sFinalOrderKey := GetFinalOrderKey(tblR, tblE);
            try
               tblF.IndexName := '';
               tblF.SetKey();
               tblF.FieldByName('OrderKey').AsString := sFinalOrderKey;
               if (tblF.GotoKey()) then begin

                  if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                     tblE.FieldByName('FinalOrderKey').AsString := tblF.FieldByName('OrderKey').AsString;
                  end;

                  if (tblF.FieldByName('WinPct').AsFloat > 0) then begin
                     tblE.FieldByName('FinalOrderWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
                  end else begin
                     tblE.FieldByName('FinalOrderWinPct').AsFloat := 1;
                  end;
               end else begin
                  if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                     tblE.FieldByName('FinalOrderKey').AsString := sFinalOrderKey;
                  end;
                  tblE.FieldByName('FinalOrderWinPct').AsFloat := 1;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
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
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction();
      end else begin
         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.Commit;
         end;
      end;
      CloseTable(tblF);
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();
   end;


end;

procedure Update_FinalOrder_WinPctRank
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );

begin
   hLog.AddToLog('Update_FK_WinPctRank', msevOperation);

   try
      //      SetRanking(tblE, 'ByFinalWinPctRank', 'FinalWinPctRank', 'FinalWinPct', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOfDays);
//      SetRankingDouble(tblE, 'ByEarlyPacePosRank', 'EarlyPacePosRank', 'EarlyPacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);

      SetRankingDouble(tblE, 'ByFinalOrderWinPctRank', 'FinalOrderWinPctRank', 'FinalOrderWinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, FINAL_ORDER_DAYS, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

end.
