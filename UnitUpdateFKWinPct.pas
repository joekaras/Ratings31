unit UnitUpdateFKWinPct;

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

   sFinalOrderKey: string;
   sPrimaryOrderKey: string;
   sSecondaryOrderKey: string;
   sDefaultOrderKey: string;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCnt: integer;

begin

   hLog.AddToLog('Update_PK_SK_DK_WinPct', msevOperation);
   try
      try
         CloseTableExclusive(tblR);
         CloseTableExclusive(tblE);

         OpenTableExclusive(tblR);
         OpenTableExclusive(tblE);

         OpenTableExclusive(dm.tblFinalOrder);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            CloseTableExclusive(tblR);
            CloseTableExclusive(tblE);
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
               CloseTableExclusive(tblR);
               CloseTableExclusive(tblE);
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

            sPrimaryOrderKey := GetPrimaryOrderKey(tblR, tblE);
            try
               dm.tblFinalOrder.IndexName := '';
               dm.tblFinalOrder.SetKey();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPrimaryOrderKey;
               if (dm.tblFinalOrder.GotoKey()) then begin
                  tblE.FieldByName('PrimaryOrderKey').AsString := dm.tblFinalOrder.FieldByName('OrderKey').AsString;
                  tblE.FieldByName('PrimaryStarts').AsInteger := dm.tblFinalOrder.FieldByName('Starts').AsInteger;
                  tblE.FieldByName('PrimaryWins').AsInteger := dm.tblFinalOrder.FieldByName('Wins').AsInteger;
                  tblE.FieldByName('PrimaryWinPct').AsFloat := dm.tblFinalOrder.FieldByName('WinPct').AsFloat;
                  tblE.FieldByName('PrimaryAvgOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat;
                  tblE.FieldByName('PrimaryMinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinOdds').AsFloat;
                  tblE.FieldByName('PrimaryMaxOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat;
                  tblE.FieldByName('PrimaryAvgWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgWinOdds').AsFloat;
                  tblE.FieldByName('PrimaryMinWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinWinOdds').AsFloat;
                  tblE.FieldByName('PrimaryMaxWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxWinOdds').AsFloat;
                  tblE.FieldByName('PrimaryValueBet').AsFloat := dm.tblFinalOrder.FieldByName('ValueBet').AsFloat;
                  tblE.FieldByName('PrimaryIV').AsFloat := dm.tblFinalOrder.FieldByName('IV').AsFloat;
                  tblE.FieldByName('PrimaryIVRoi').AsFloat := dm.tblFinalOrder.FieldByName('IVRoi').AsFloat;
               end else begin
                  tblE.FieldByName('PrimaryOrderKey').AsString := 'NONE';
                  tblE.FieldByName('PrimaryStarts').AsInteger := 0;
                  tblE.FieldByName('PrimaryWins').AsInteger := 0;
                  tblE.FieldByName('PrimaryWinPct').AsFloat := 0;
                  tblE.FieldByName('PrimaryAvgOdds').AsFloat := 0;
                  tblE.FieldByName('PrimaryValueBet').AsFloat := 0;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            sSecondaryOrderKey := GetSecondaryOrderKey(tblR, tblE);
            try
               dm.tblFinalOrder.IndexName := '';
               dm.tblFinalOrder.SetKey();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sSecondaryOrderKey;
               if (dm.tblFinalOrder.GotoKey()) then begin
                  tblE.FieldByName('SecondaryOrderKey').AsString := dm.tblFinalOrder.FieldByName('OrderKey').AsString;
                  tblE.FieldByName('SecondaryStarts').AsInteger := dm.tblFinalOrder.FieldByName('Starts').AsInteger;
                  tblE.FieldByName('SecondaryWins').AsInteger := dm.tblFinalOrder.FieldByName('Wins').AsInteger;
                  tblE.FieldByName('SecondaryWinPct').AsFloat := dm.tblFinalOrder.FieldByName('WinPct').AsFloat;
                  tblE.FieldByName('SecondaryAvgOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat;
                  tblE.FieldByName('SecondaryMinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinOdds').AsFloat;
                  tblE.FieldByName('SecondaryMaxOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat;
                  tblE.FieldByName('SecondaryAvgWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgWinOdds').AsFloat;
                  tblE.FieldByName('SecondaryMinWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinWinOdds').AsFloat;
                  tblE.FieldByName('SecondaryMaxWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxWinOdds').AsFloat;
                  tblE.FieldByName('SecondaryValueBet').AsFloat := dm.tblFinalOrder.FieldByName('ValueBet').AsFloat;
                  tblE.FieldByName('SecondaryIV').AsFloat := dm.tblFinalOrder.FieldByName('IV').AsFloat;
                  tblE.FieldByName('SecondaryIVRoi').AsFloat := dm.tblFinalOrder.FieldByName('IVRoi').AsFloat;
               end else begin
                  tblE.FieldByName('SecondaryOrderKey').AsString := 'NONE';
                  tblE.FieldByName('SecondaryStarts').AsInteger := 0;
                  tblE.FieldByName('SecondaryWins').AsInteger := 0;
                  tblE.FieldByName('SecondaryWinPct').AsFloat := 0;
                  tblE.FieldByName('SecondaryAvgOdds').AsFloat := 0;
                  tblE.FieldByName('SecondaryValueBet').AsFloat := 0;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            sDefaultOrderKey := GetDefaultOrderKey(tblR, tblE);
            try
               dm.tblFinalOrder.IndexName := '';
               dm.tblFinalOrder.SetKey();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sDefaultOrderKey;
               if (dm.tblFinalOrder.GotoKey()) then begin
                  tblE.FieldByName('DefaultOrderKey').AsString := dm.tblFinalOrder.FieldByName('OrderKey').AsString;
                  tblE.FieldByName('DefaultStarts').AsInteger := dm.tblFinalOrder.FieldByName('Starts').AsInteger;
                  tblE.FieldByName('DefaultWins').AsInteger := dm.tblFinalOrder.FieldByName('Wins').AsInteger;
                  tblE.FieldByName('DefaultWinPct').AsFloat := dm.tblFinalOrder.FieldByName('WinPct').AsFloat;
                  tblE.FieldByName('DefaultAvgOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat;
                  tblE.FieldByName('DefaultMinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinOdds').AsFloat;
                  tblE.FieldByName('DefaultMaxOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat;
                  tblE.FieldByName('DefaultAvgWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('AvgWinOdds').AsFloat;
                  tblE.FieldByName('DefaultMinWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MinWinOdds').AsFloat;
                  tblE.FieldByName('DefaultMaxWinOdds').AsFloat := dm.tblFinalOrder.FieldByName('MaxWinOdds').AsFloat;
                  tblE.FieldByName('DefaultValueBet').AsFloat := dm.tblFinalOrder.FieldByName('ValueBet').AsFloat;
                  tblE.FieldByName('DefaultIV').AsFloat := dm.tblFinalOrder.FieldByName('IV').AsFloat;
                  tblE.FieldByName('DefaultIVRoi').AsFloat := dm.tblFinalOrder.FieldByName('IVRoi').AsFloat;
               end else begin
                  tblE.FieldByName('DefaultOrderKey').AsString := 'NONE';
                  tblE.FieldByName('DefaultStarts').AsInteger := 0;
                  tblE.FieldByName('DefaultWins').AsInteger := 0;
                  tblE.FieldByName('DefaultWinPct').AsFloat := 0;
                  tblE.FieldByName('DefaultAvgOdds').AsFloat := 0;
                  tblE.FieldByName('DefaultValueBet').AsFloat := 0;
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

      CloseTableExclusive(tblR);
      CloseTableExclusive(tblE);
      CloseTableExclusive(dm.tblFinalOrder);
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
      SetRanking(tblE, 'ByPrimaryWinPctRank', 'PrimaryWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, RANKING_DAYS);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(tblE, 'BySecondaryWinPctRank', 'SecondaryWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, RANKING_DAYS);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      SetRanking(tblE, 'ByDefaultWinPctRank', 'DefaultWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, RANKING_DAYS);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure Update_HH_PK_SK_DK_Keys
   (
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCnt: integer;

   sBaseKey: string;

   sPrimaryOrderKey: string;
   sSecondaryOrderKey: string;
   sDefaultOrderKey: string;

   sPrimarySurfaceKey: string;
   sSecondarySurfaceKey: string;
   sDefaultSurfaceKey: string;

begin

   hLog.AddToLog('Update_HH_PK_SK_DK_Keys', msevOperation);
   try
      CloseTableExclusive(dm.tblHH);
      OpenTableExclusive(dm.tblHH);

      CloseTableExclusive(dm.tblRH);
      OpenTableExclusive(dm.tblRH);

      CloseTableExclusive(dm.tblProcessed);
      OpenTableExclusive(dm.tblProcessed);

      if (bOneDay) then begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
      
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

         dm.tblHH.KeyFieldCount := 1;
         dm.tblHH.ApplyRange;
      end else begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

         dm.tblHH.KeyFieldCount := 1;
         dm.tblHH.ApplyRange;
      end;

      iStaCnt := 0;
      iTotalCnt := 0;
      iRecordCnt := dm.tblHH.RecordCount;

      InitPrgBar(dm.tblHH.RecordCount);

      dm.tblHH.First();
      while not dm.tblHH.Eof do begin

         dm.tblProcessed.IndexName := '';
         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
         dm.tblProcessed.FieldByName('RaceDate').AsDateTime := dm.tblHH.FieldByName('RaceDate').AsDateTime;
         if (not dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Append();
            dm.tblProcessed.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
            dm.tblProcessed.FieldByName('RaceDate').AsDateTime := dm.tblHH.FieldByName('RaceDate').AsDateTime;
            dm.tblProcessed.Post();
         end;

         if dm.tblHH.FieldByName('TrkCode').AsString = '' then begin
            dm.tblHH.Next();
            Inc(iStaCnt);
            Inc(iTotalCnt);
            continue;
         end;

         if (iTotalCnt > iRecordCnt) then begin
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.Rollback();
            end;
            CloseTableExclusive(dm.tblHH);
            CloseTableExclusive(dm.tblRH);
            CloseTableExclusive(dm.tblProcessed);
            ClearPrgStatusBars();
            exit;
         end;

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusBar('Updating PRIMARY/SECONDARY/DEFAULT Keys - ' +
               dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
               dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
               dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
               IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
            Application.ProcessMessages();
            iStaCnt := 0;
            if not dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.StartTransaction();
            end else begin
               if dm.dbSireRate.InTransaction then begin
                  dm.dbSireRate.Commit;
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;

         IncPrgBar();

         //         if (dm.tblHH.FieldByName('RaceDate').AsDateTime < (Now() - iNbrOfDays)) then begin
         //            dm.tblHH.Next();
         //            continue;
         //         end;

         dm.tblRH.IndexName := '';
         dm.tblRH.SetKey();
         dm.tblRH.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
         dm.tblRH.FieldByName('RaceNbr').AsInteger := dm.tblHH.FieldByName('RaceNbr').AsInteger;
         dm.tblRH.FieldByName('RaceDate').AsString := dm.tblHH.FieldByName('RaceDate').AsString;

         if not (dm.tblRH.GotoKey()) then begin
            dm.tblHH.Next;
            continue;
         end;

         // Do a validity check
         if SkipThisHHRecord(dm.tblRH, dm.tblHH) then begin
            dm.tblHH.Next;
            continue;
         end;


         dm.tblHH.Edit();

         sPrimaryOrderKey := GetPrimaryOrderKey(dm.tblRH, dm.tblHH);
         dm.tblHH.FieldByName('PrimaryOrderKey').AsString := sPrimaryOrderKey;

         sSecondaryOrderKey := GetSecondaryOrderKey(dm.tblRH, dm.tblHH);
         dm.tblHH.FieldByName('SecondaryOrderKey').AsString := sSecondaryOrderKey;

         sDefaultOrderKey := GetDefaultOrderKey(dm.tblRH, dm.tblHH);
         dm.tblHH.FieldByName('DefaultOrderKey').AsString := sDefaultOrderKey;

         dm.tblHH.Post();
         dm.tblHH.Next();
      end;

   except

      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;
      CloseTableExclusive(dm.tblHH);
      CloseTableExclusive(dm.tblRH);
      CloseTableExclusive(dm.tblProcessed);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   CloseTableExclusive(dm.tblHH);
   CloseTableExclusive(dm.tblRH);
   CloseTableExclusive(dm.tblProcessed);
   ClearPrgStatusBars();

end;
//procedure TMainForm.Update_PK_SK_DK_FK_ValueBetRank
//   (
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: integer;
//   bOneDay: boolean;
//   iNbrOfDays: integer
//   );
//
//begin
//   //  Try
//   //    SetRanking(tblE, 'ByPrimaryValueBetRank', 'PrimaryValueBetRank', pnlPrgBar, prgBar, staBar, iIncCnt);
//   //  Except
//   //  End;
//
//   //  Try
//   //    SetRanking(tblE, 'BySecondaryValueBetRank', 'SecondaryValueBetRank', pnlPrgBar, prgBar, staBar, iIncCnt);
//   //  Except
//   //  End;
//
//   //  Try
//   //    SetRanking(tblE, 'ByDefaultValueBetRank', 'DefaultValueBetRank', pnlPrgBar, prgBar, staBar, iIncCnt);
//   //  Except
//   //  End;
//
//   //try
//   //   SetRanking(tblE, 'ByFinalValueBetRank', 'FinalValueBetRank', pnlPrgBar, prgBar, staBar, iIncCnt, bOneDay, iNbrOfDays);
//   //except
//   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
//   //end;
//
//end;

end.


