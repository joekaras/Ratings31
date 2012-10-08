unit UnitUpdateKeysWinPct;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;


procedure Update_PK_SK_DK_WinPct
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

procedure Update_PK_SK_DK_WinPctRank
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


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking, UnitGetHandicappingKeys;


procedure Update_PK_SK_DK_WinPct
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
var

   //   sFinalOrderKey: string;
   sPrimaryOrderKey: string;
   sSecondaryOrderKey: string;
   sDefaultOrderKey: string;

   sOldPrimaryOrderKey: string;
   sOldSecondaryOrderKey: string;
   sOldDefaultOrderKey: string;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCnt: integer;

begin

   hLog.AddToLog('Update_PK_SK_DK_WinPct', msevOperation);
   try
      try
         CloseTable(tblR);
         CloseTable(tblE);

         OpenTable(tblR);
         OpenTable(tblE);

         OpenTable(dm.tblFinalOrder);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            CloseTable(tblR);
            CloseTable(tblE);
            ClearPrgStatusBars();
         end;
      end;

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


      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;
         iRecordCnt := tblE.RecordCount;

         tblE.First();
         while not tblE.Eof do begin

            if (iTotalCnt > iRecordCnt) then begin
               CloseTable(tblR);
               CloseTable(tblE);
               ClearPrgStatusBars();
               exit;
            end;

            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Update PK SK DK WinPct - ' +
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


            //            sPrimaryOrderKey := GetPrimaryOrderKey(tblR, tblE);
            //            sSecondaryOrderKey := GetSecondaryOrderKey(tblR, tblE);
            //            sDefaultOrderKey := GetDefaultOrderKey(tblR, tblE);
            //
            //            sOldPrimaryOrderKey := tblE.FieldByName('PrimaryOrderKey').AsString;
            //            sOldSecondaryOrderKey := tblE.FieldByName('SecondaryOrderKey').AsString;
            //            sOldDefaultOrderKey := tblE.FieldByName('DefaultOrderKey').AsString;
            //
            //            // No need to update - everything is the same
            //            if ((sPrimaryOrderKey <> '') and
            //               (sDefaultOrderKey <> '') and
            //               (sSecondaryOrderKey <> '')) then begin
            //               if ((sPrimaryOrderKey = sOldPrimaryOrderKey) and
            //                  (sSecondaryOrderKey = sOldSecondaryOrderKey) and
            //                  (sDefaultOrderKey = sOldDefaultOrderKey)) then begin
            //                  tblE.Next();
            //                  continue;
            //               end;
            //            end;

            tblE.Edit();

            try
               dm.tblFinalOrder.IndexName := '';
               dm.tblFinalOrder.SetKey();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPrimaryOrderKey;
               if (dm.tblFinalOrder.GotoKey()) then begin
                  tblE.FieldByName('PrimaryOrderKey').AsString := dm.tblFinalOrder.FieldByName('OrderKey').AsString;
                  tblE.FieldByName('PrimaryWinPct').AsFloat := dm.tblFinalOrder.FieldByName('WinPct').AsFloat;
                  tblE.FieldByName('PrimaryValueBet').AsFloat := dm.tblFinalOrder.FieldByName('ValueBet').AsFloat;

                  if UpperCase(tblE.TableName) = 'ENTRY' then begin
                     tblE.FieldByName('PrimaryStarts').AsInteger := dm.tblFinalOrder.FieldByName('Starts').AsInteger;
                     tblE.FieldByName('PrimaryWins').AsInteger := dm.tblFinalOrder.FieldByName('Wins').AsInteger;
                     tblE.FieldByName('PrimaryAvgOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat;
                     tblE.FieldByName('PrimaryMinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinOdds').AsFloat;
                     tblE.FieldByName('PrimaryMaxOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat;
                     tblE.FieldByName('PrimaryAvgWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgWinOdds').AsFloat;
                     tblE.FieldByName('PrimaryMinWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinWinOdds').AsFloat;
                     tblE.FieldByName('PrimaryMaxWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxWinOdds').AsFloat;
                     tblE.FieldByName('PrimaryIV').AsFloat := dm.tblFinalOrder.FieldByName('IV').AsFloat;
                     tblE.FieldByName('PrimaryIVRoi').AsFloat := dm.tblFinalOrder.FieldByName('IVRoi').AsFloat;
                  end;
               end else begin
                  tblE.FieldByName('PrimaryOrderKey').AsString := sPrimaryOrderKey;
                  tblE.FieldByName('PrimaryWinPct').AsFloat := 0;
                  tblE.FieldByName('PrimaryValueBet').AsFloat := 0;
                  if UpperCase(tblE.TableName) = 'ENTRY' then begin
                     tblE.FieldByName('PrimaryStarts').AsInteger := 0;
                     tblE.FieldByName('PrimaryWins').AsInteger := 0;
                     tblE.FieldByName('PrimaryAvgOdds').AsFloat := 0;
                  end;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               dm.tblFinalOrder.IndexName := '';
               dm.tblFinalOrder.SetKey();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sSecondaryOrderKey;
               if (dm.tblFinalOrder.GotoKey()) then begin
                  tblE.FieldByName('SecondaryOrderKey').AsString := dm.tblFinalOrder.FieldByName('OrderKey').AsString;
                  tblE.FieldByName('SecondaryWinPct').AsFloat := dm.tblFinalOrder.FieldByName('WinPct').AsFloat;
                  tblE.FieldByName('SecondaryValueBet').AsFloat := dm.tblFinalOrder.FieldByName('ValueBet').AsFloat;

                  if UpperCase(tblE.TableName) = 'ENTRY' then begin
                     tblE.FieldByName('SecondaryStarts').AsInteger := dm.tblFinalOrder.FieldByName('Starts').AsInteger;
                     tblE.FieldByName('SecondaryWins').AsInteger := dm.tblFinalOrder.FieldByName('Wins').AsInteger;
                     tblE.FieldByName('SecondaryAvgOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat;
                     tblE.FieldByName('SecondaryMinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinOdds').AsFloat;
                     tblE.FieldByName('SecondaryMaxOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat;
                     tblE.FieldByName('SecondaryAvgWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgWinOdds').AsFloat;
                     tblE.FieldByName('SecondaryMinWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinWinOdds').AsFloat;
                     tblE.FieldByName('SecondaryMaxWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxWinOdds').AsFloat;
                     tblE.FieldByName('SecondaryIV').AsFloat := dm.tblFinalOrder.FieldByName('IV').AsFloat;
                     tblE.FieldByName('SecondaryIVRoi').AsFloat := dm.tblFinalOrder.FieldByName('IVRoi').AsFloat;
                  end;
               end else begin
                  tblE.FieldByName('SecondaryOrderKey').AsString := sSecondaryOrderKey;
                  tblE.FieldByName('SecondaryWinPct').AsFloat := 0;
                  tblE.FieldByName('SecondaryValueBet').AsFloat := 0;
                  if UpperCase(tblE.TableName) = 'ENTRY' then begin
                     tblE.FieldByName('SecondaryStarts').AsInteger := 0;
                     tblE.FieldByName('SecondaryWins').AsInteger := 0;
                     tblE.FieldByName('SecondaryAvgOdds').AsFloat := 0;
                  end;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               dm.tblFinalOrder.IndexName := '';
               dm.tblFinalOrder.SetKey();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sDefaultOrderKey;
               if (dm.tblFinalOrder.GotoKey()) then begin
                  tblE.FieldByName('DefaultOrderKey').AsString := dm.tblFinalOrder.FieldByName('OrderKey').AsString;
                  tblE.FieldByName('DefaultWinPct').AsFloat := dm.tblFinalOrder.FieldByName('WinPct').AsFloat;
                  tblE.FieldByName('DefaultValueBet').AsFloat := dm.tblFinalOrder.FieldByName('ValueBet').AsFloat;
                  if UpperCase(tblE.TableName) = 'ENTRY' then begin
                     tblE.FieldByName('DefaultStarts').AsInteger := dm.tblFinalOrder.FieldByName('Starts').AsInteger;
                     tblE.FieldByName('DefaultWins').AsInteger := dm.tblFinalOrder.FieldByName('Wins').AsInteger;
                     tblE.FieldByName('DefaultAvgOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat;
                     tblE.FieldByName('DefaultMinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinOdds').AsFloat;
                     tblE.FieldByName('DefaultMaxOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat;
                     tblE.FieldByName('DefaultAvgWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgWinOdds').AsFloat;
                     tblE.FieldByName('DefaultMinWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinWinOdds').AsFloat;
                     tblE.FieldByName('DefaultMaxWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxWinOdds').AsFloat;
                     tblE.FieldByName('DefaultIV').AsFloat := dm.tblFinalOrder.FieldByName('IV').AsFloat;
                     tblE.FieldByName('DefaultIVRoi').AsFloat := dm.tblFinalOrder.FieldByName('IVRoi').AsFloat;
                  end;
               end else begin
                  tblE.FieldByName('DefaultOrderKey').AsString := sDefaultOrderKey;
                  tblE.FieldByName('DefaultWinPct').AsFloat := 0;
                  tblE.FieldByName('DefaultValueBet').AsFloat := 0;
                  if UpperCase(tblE.TableName) = 'ENTRY' then begin
                     tblE.FieldByName('DefaultStarts').AsInteger := 0;
                     tblE.FieldByName('DefaultWins').AsInteger := 0;
                     tblE.FieldByName('DefaultAvgOdds').AsFloat := 0;
                  end;
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
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit;
      end;

      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(dm.tblFinalOrder);
      ClearPrgStatusBars();
   end;
end;

procedure Update_PK_SK_DK_WinPctRank
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

   hLog.AddToLog('Update_PK_SK_DK_WinPctRank', msevOperation);

   try
      SetRankingOld(tblE, 'ByPrimaryWinPctRank', 'PrimaryWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, iNbrOfDays);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRankingOld(tblE, 'BySecondaryWinPctRank', 'SecondaryWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, iNbrOfDays);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRankingOld(tblE, 'ByDefaultWinPctRank', 'DefaultWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, iNbrOfDays);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


end.
