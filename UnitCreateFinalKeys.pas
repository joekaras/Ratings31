unit UnitCreateFinalKeys;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar, iniFiles;

procedure Create_FO_PK_SK_DK_Keys
   (
   iIncCnt: integer;
   bCreateAll: boolean;
   bOneDay: boolean;
   iNbrOfDays: integer;
   iNbrOfDaysForPrimaryKeys: integer
   );

//procedure Create_Speed_Keys
//   (
//   iIncCnt: integer;
//   bCreateAll: boolean;
//   bOneDay: boolean;
//   iNbrOfDays: integer;
//   iNbrOfDaysForPrimaryKeys: integer
//   );

procedure Create_FO_LINER_Keys
   (
   iIncCnt: integer;
   iNbrOfDays: integer;
   iNbrOfDaysForPrimaryKeys: integer
   );

procedure Create_FinalOrder_Key(iIncCnt: integer; bOneDay: boolean; iNbrOfDays: integer; iNbrOfDaysForPrimaryKeys: integer);
procedure Create_FO_ML_Keys(iIncCnt: integer; iNbrOfDays: integer);
procedure UpdateFinalOrder();

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitGetHandicappingKeys;

procedure Create_FO_PK_SK_DK_Keys
   (
   iIncCnt: integer;
   bCreateAll: boolean;
   bOneDay: boolean;
   iNbrOfDays: integer;
   iNbrOfDaysForPrimaryKeys: integer
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

   //   sPrimaryOrderKey: string;
   //   sSecondaryOrderKey: string;
   //   sDefaultOrderKey: string;
   sMLOrderKey: string;

   sTrnTrackKey: string;
   sJkyTrackKey: string;
   sSpdKey: string;
   sClsKey: string;
   sSpdClsKey: string;
   sLinerKey: string;


   sQSPRank: string;
   sKSPRank: string;

   sQSPRank2: string;
   sKSPRank2: string;

   sXS: string;
   sXS2: string;

   sXS3: string;
   sXS4: string;

   sLP2: string;
   sOS: string;
   sOS2: string;
   sPS: string;
   sPSPlus: string;

   s2yoBred: string;
   s1stBred: string;
   sTurfBred: string;

   sX2yoBred: string;
   sX1stBred: string;
   sXTurfBred: string;
   sMorningLineKeyFinalWinPctRankKey: string;
   sTodaysWinPctRankKey: string;
   sTodaysKey: string;
   sAllKey: string;

   sPowerAdvantageClsKey: string;
   sPowerAdvantageAllKey: string;
   sPowerAdvantageTrkKey: string;

   sCombinedPaceAdvantageTrkKey: string;
   sCombinedPaceAdvantageAllKey: string;

   sEarlyPaceAdvantageClsKey: string;
   sEarlyPaceAdvantageAllKey: string;
   sEarlyPaceAdvantageTrkKey: string;

   sMiddlePaceAdvantageClsKey: string;
   sMiddlePaceAdvantageAllKey: string;
   sMiddlePaceAdvantageTrkKey: string;

   sLatePaceAdvantageClsKey: string;
   sLatePaceAdvantageAllKey: string;
   sLatePaceAdvantageTrkKey: string;

   sTrainer: string;


   iniFile: TIniFile;

   dtFinalOrderUpdatedTo: TDateTime;
begin

   hLog.AddToLog('Create_FO_PK_SK_DK_Keys', msevOperation);

   //   if (bOneDay) then begin
   //      exit;
   //   end;

   try
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);



      if (bCreateAll) then begin
         try
            CloseTable(dm.tblFinalOrder);
            dm.tblFinalOrder.EmptyTable();
         except
            on E: Exception do begin
               hLog.AddToLog(E.Message, msevException);
               exit;
            end;
         end;
         CloseTable(dm.tblFinalOrder);
      end;

      CloseTable(dm.tblRH);
      OpenTable(dm.tblRH);


      if (not bCreateAll) then begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         if (bOneDay) then begin
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         end else begin
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := DATE_FINAL_ORDER_UPDATED_TO;
         end;
         dm.tblHH.KeyFieldCount := 1;
         dm.tblHH.ApplyRange;
      end else begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDaysForPrimaryKeys);
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

         dm.tblHH.KeyFieldCount := 1;
         dm.tblHH.ApplyRange;
      end;


      try
         CloseTable(dm.tblFinalOrder);
         OpenTable(dm.tblFinalOrder);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      InitPrgBar(dm.tblHH.RecordCount);
      iRecordCount := dm.tblHH.RecordCount;

      iStaCnt := 0;
      iTotalCnt := 0;
      UpdateStatusBar('Creating FINAL ORDER Keys - ' +
         dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
         dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
         dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
         IntToStr(iTotalCnt) + ' of ' + IntToStr(iRecordCount));

      dm.tblHH.First();
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction();
      end;
      while not dm.tblHH.Eof do begin
         dtFinalOrderUpdatedTo := dm.tblHH.FieldByName('RaceDate').AsDateTime;

         if (iStaCnt > BATCH_SIZE) then begin
            if (bOneDay) then begin
               UpdateStatusBar('Creating FINAL ORDER Keys - ' +
                  dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
                  dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
                  dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(iRecordCount));
            end else begin
               UpdateStatusBar('Updating FINAL ORDER Keys - ' +
                  dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
                  dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
                  dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
            end;
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

         //
         sTodaysKey := GetSpeedRankTrkCodeSurfaceDistanceSpeedCount(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpdTrkSD';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpdTrkSD';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;

         //
         sTodaysKey :=  GetSpeedRankTrkCodeSpeedCount(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpdTrkCnt';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpdTrkCnt';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;


         //
         sTodaysKey := GetMorningLineKeyTrkCodeRaceType(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLTrkRT';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLTrkRT';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;

         //
         sTodaysKey := GetMorningLineKeyTrkCodePower(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLTrkPW';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLTrkPW';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;
         
         //
         sTodaysKey := GetMorningLineKeyPower(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ML-PW';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ML-PW';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;
         
         
         //
         sTrainer := Trim(dm.tblHH.FieldByName('Trainer').AsString);
         if (sTrainer <> '') then begin
            sTodaysKey := GetTrainerPowerRank(dm.tblRH, dm.tblHH);
            if (sTodaysKey <> '') then begin
               dm.tblFinalOrder.IndexName := '';
               dm.tblFinalOrder.SetKey();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               if (dm.tblFinalOrder.GotoKey()) then begin
                  dm.tblFinalOrder.Edit();
                  dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnPWKey';
                  dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblHH.FieldByName('Trainer').AsString;
                  SummaryFlds(dm.tblHH, dm.tblFinalOrder);
                  dm.tblFinalOrder.Post();
               end else begin
                  dm.tblFinalOrder.Append();
                  dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
                  dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnPWKey';
                  dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblHH.FieldByName('Trainer').AsString;
                  SummaryFlds(dm.tblHH, dm.tblFinalOrder);
                  dm.tblFinalOrder.Post();
               end;
            end;
         end;

         //
         sTodaysKey := GetElimKey(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ElimKey';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ElimKey';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;

         //
         sTodaysKey := GetElim2Key(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ElimPaceKey';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ElimPaceKey';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;

         //
         sTodaysKey := GetPostPosKey(dm.tblRH, dm.tblHH);
         if (sTodaysKey <> '') then begin
            dm.tblFinalOrder.IndexName := '';
            dm.tblFinalOrder.SetKey();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
            if (dm.tblFinalOrder.GotoKey()) then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PostPosKey';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end else begin
               dm.tblFinalOrder.Append();
               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PostPosKey';
               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
               dm.tblFinalOrder.Post();
            end;
         end;

         dm.tblFinalOrder.FlushBuffers();
         dm.tblHH.Next();
      end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;
      CloseTable(dm.tblHH);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblFinalOrder);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   //DATE_FINAL_ORDER_UPDATED_TO
   try
      iniFile := TIniFile.Create(INI_FILE);
      iniFile.WriteDate('Process', 'DateFinalOrderUpdatedTo', dtFinalOrderUpdatedTo);
   finally
      FreeAndNil(iniFile);
   end;
   CloseTable(dm.tblHH);
   CloseTable(dm.tblRH);
   CloseTable(dm.tblFinalOrder);
   ClearPrgStatusBars();

end;

//procedure Create_Speed_Keys
//   (
//   iIncCnt: integer;
//   bCreateAll: boolean;
//   bOneDay: boolean;
//   iNbrOfDays: integer;
//   iNbrOfDaysForPrimaryKeys: integer
//   );
//var
//
//   iBegPos: integer;
//   iPos: integer;
//
//   iStaCnt: integer;
//   iTotalCnt: integer;
//   iRecordCount: integer;
//
//   sMLOrderKey: string;
//
//   sTrnTrackKey: string;
//   sJkyTrackKey: string;
//   sSpdKey: string;
//   sClsKey: string;
//   sSpdClsKey: string;
//   sLinerKey: string;
//
//
//   sQSPRank: string;
//   sKSPRank: string;
//
//   sQSPRank2: string;
//   sKSPRank2: string;
//
//   sXS: string;
//   sXS2: string;
//
//   sXS3: string;
//   sXS4: string;
//
//   sLP2: string;
//   sOS: string;
//   sOS2: string;
//   sPS: string;
//   sPSPlus: string;
//
//
//   sX2yoBred: string;
//   sX1stBred: string;
//   sXTurfBred: string;
//   sMorningLineKeyFinalWinPctRankKey: string;
//   sTodaysWinPctRankKey: string;
//   sTodaysKey: string;
//   sAllKey: string;
//
//
//   sLatePaceAdvantageClsKey: string;
//   sLatePaceAdvantageAllKey: string;
//   sLatePaceAdvantageTrkKey: string;
//
//
//   iniFile: TIniFile;
//
//   dtFinalOrderUpdatedTo: TDateTime;
//begin
//
//   hLog.AddToLog('Create_Speed_Keys', msevOperation);
//
//      if (bOneDay) then begin
//         exit;
//      end;
//
//   try
//      CloseTable(dm.tblHH);
//      OpenTable(dm.tblHH);
//
//
//      CloseTable(dm.tblRH);
//      OpenTable(dm.tblRH);
//
//
//      if (not bCreateAll) then begin
//         dm.tblHH.IndexName := 'ByRangeRaceDate';
//
//         dm.tblHH.SetRangeStart;
//         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
//         dm.tblHH.KeyFieldCount := 1;
//
//         dm.tblHH.SetRangeEnd;
//         if (bOneDay) then begin
//            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
//         end else begin
//            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := DATE_FINAL_ORDER_UPDATED_TO;
//         end;
//         dm.tblHH.KeyFieldCount := 1;
//         dm.tblHH.ApplyRange;
//      end else begin
//         dm.tblHH.IndexName := 'ByRangeRaceDate';
//
//         dm.tblHH.SetRangeStart;
//         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDaysForPrimaryKeys);
//         dm.tblHH.KeyFieldCount := 1;
//
//         dm.tblHH.SetRangeEnd;
//         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
//
//         dm.tblHH.KeyFieldCount := 1;
//         dm.tblHH.ApplyRange;
//      end;
//
//
//      try
//         CloseTable(dm.tblFinalOrder);
//         OpenTable(dm.tblFinalOrder);
//      except
//         on E: Exception do hLog.AddToLog(E.Message, msevException);
//      end;
//
//      InitPrgBar(dm.tblHH.RecordCount);
//      iRecordCount := dm.tblHH.RecordCount;
//
//      iStaCnt := 0;
//      iTotalCnt := 0;
//      UpdateStatusBar('Creating SPEED ORDER Keys - ' +
//         dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
//         dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
//         dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
//         IntToStr(iTotalCnt) + ' of ' + IntToStr(iRecordCount));
//
//      dm.tblHH.First();
//      if not dm.dbSireRate.InTransaction then begin
//         dm.dbSireRate.StartTransaction();
//      end;
//      while not dm.tblHH.Eof do begin
//         dtFinalOrderUpdatedTo := dm.tblHH.FieldByName('RaceDate').AsDateTime;
//
//         if (iStaCnt > BATCH_SIZE) then begin
//            if (bOneDay) then begin
//               UpdateStatusBar('Creating FINAL ORDER Keys - ' +
//                  dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
//                  dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
//                  dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
//                  IntToStr(iTotalCnt) + ' of ' + IntToStr(iRecordCount));
//            end else begin
//               UpdateStatusBar('Updating SPEED ORDER Keys - ' +
//                  dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
//                  dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
//                  dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
//                  IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
//            end;
//            Application.ProcessMessages();
//            iStaCnt := 0;
//            if not dm.dbSireRate.InTransaction then begin
//               dm.dbSireRate.StartTransaction();
//            end else begin
//               if dm.dbSireRate.InTransaction then begin
//                  dm.dbSireRate.Commit;
//                  dm.dbSireRate.StartTransaction();
//               end;
//            end;
//         end else begin
//            Application.ProcessMessages();
//            Inc(iStaCnt);
//            Inc(iTotalCnt);
//         end;
//
//         IncPrgBar();
//
//         dm.tblRH.IndexName := '';
//         dm.tblRH.SetKey();
//         dm.tblRH.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
//         dm.tblRH.FieldByName('RaceNbr').AsInteger := dm.tblHH.FieldByName('RaceNbr').AsInteger;
//         dm.tblRH.FieldByName('RaceDate').AsString := dm.tblHH.FieldByName('RaceDate').AsString;
//
//         if not (dm.tblRH.GotoKey()) then begin
//            dm.tblHH.Next;
//            continue;
//         end;
//
//          Do a validity check
//         if SkipThisHHRecord(dm.tblRH, dm.tblHH) then begin
//            dm.tblHH.Next;
//            continue;
//         end;
//
//
//         sTodaysKey := GetSpeedRank(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpeedKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//                 dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpeedKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//                  dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//
//         sTodaysKey := GetSpeedRankAll(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpeedKeyAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//                 dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'SpeedKeyAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//                  dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//
//
//         dm.tblFinalOrder.FlushBuffers();
//         dm.tblHH.Next();
//      end;
//
//   except
//      if dm.dbSireRate.InTransaction then begin
//         dm.dbSireRate.Rollback();
//      end;
//      CloseTable(dm.tblHH);
//      CloseTable(dm.tblRH);
//      CloseTable(dm.tblFinalOrder);
//      ClearPrgStatusBars();
//   end;
//
//   if dm.dbSireRate.InTransaction then begin
//      dm.dbSireRate.Commit;
//   end;
//
//   DATE_FINAL_ORDER_UPDATED_TO
//   try
//      iniFile := TIniFile.Create(INI_FILE);
//      iniFile.WriteDate('Process', 'DateFinalOrderUpdatedTo', dtFinalOrderUpdatedTo);
//   finally
//      FreeAndNil(iniFile);
//   end;
//   CloseTable(dm.tblHH);
//   CloseTable(dm.tblRH);
//   CloseTable(dm.tblFinalOrder);
//   ClearPrgStatusBars();
//
//end;

procedure Create_FinalOrder_Key
   (
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer;
   iNbrOfDaysForPrimaryKeys: integer
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;

   sFinalOrderKey: string;
   sTodaysKey: string;


begin

   hLog.AddToLog('Create_FO_FK_Keys', msevOperation);
   try
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      CloseTable(dm.tblRH);
      OpenTable(dm.tblRH);

      try
         OpenTable(dm.tblFinalOrder);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      if (not bOneDay) then begin
         UpdateStatusBar('Clearing FINAL ORDER Key');
         Application.ProcessMessages();

         InitPrgBar(dm.tblFinalOrder.RecordCount);

         iStaCnt := 0;
         iTotalCnt := 0;

         dm.tblFinalOrder.First();
         while not dm.tblFinalOrder.Eof do begin
            IncPrgBar();

            if (dm.tblFinalOrder.FieldByName('BaseKey').AsString = 'FinalKey') then begin
               dm.tblFinalOrder.Edit();
               dm.tblFinalOrder.FieldByName('Starts').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('Wins').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('WinPct').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('TotalOdds').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('TotalWagered').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('TotalWon').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('TotalProfitLoss').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('TotalProfitLossPct').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('ValueBet').AsFloat := 0;
               dm.tblFinalOrder.FieldByName('MinOdds').AsFloat := 9999;
               dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat := 9999;
               dm.tblFinalOrder.Post();
            end;
            dm.tblFinalOrder.Next();
         end;
      end;

      if (bOneDay) then begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

         dm.tblHH.KeyFieldCount := 1;
         dm.tblHH.ApplyRange;
      end;
      begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDaysForPrimaryKeys);
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

         dm.tblHH.KeyFieldCount := 1;
         dm.tblHH.ApplyRange;
      end;

      InitPrgBar(dm.tblHH.RecordCount);

      iStaCnt := 0;
      iTotalCnt := 0;

      dm.tblHH.First();
      while not dm.tblHH.Eof do begin

         if (iStaCnt > BATCH_SIZE) then begin
            if (bOneDay) then begin
               UpdateStatusBar('Creating FINAL ORDER Key - ' +
                  dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
                  dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
                  dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
            end else begin
               UpdateStatusBar('Updating FINAL ORDER Key - ' +
                  dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
                  dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
                  dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
            end;
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

         // //dm.tblHH.Edit();
         sFinalOrderKey := GetFinalOrderKey(dm.tblRH, dm.tblHH);
         if (sFinalOrderKey = '') then begin
            dm.tblHH.Next;
            continue;
         end;
         //dm.tblHH.FieldByName('FinalOrderKey').AsString := sFinalOrderKey;
         //dm.tblHH.Post();

         dm.tblFinalOrder.IndexName := '';
         dm.tblFinalOrder.SetKey();
         dm.tblFinalOrder.FieldByName('OrderKey').AsString := sFinalOrderKey;
         if (dm.tblFinalOrder.GotoKey()) then begin
            dm.tblFinalOrder.Edit();
            dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'Power';
            dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
            //dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
            SummaryFlds(dm.tblHH, dm.tblFinalOrder);
            dm.tblFinalOrder.Post();
         end else begin
            dm.tblFinalOrder.Append();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sFinalOrderKey;
            dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'Power';
            dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
            //dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
            SummaryFlds(dm.tblHH, dm.tblFinalOrder);
            dm.tblFinalOrder.Post();
         end;


         dm.tblHH.Next();
      end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;
      CloseTable(dm.tblHH);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblFinalOrder);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   CloseTable(dm.tblHH);
   CloseTable(dm.tblRH);
   CloseTable(dm.tblFinalOrder);
   ClearPrgStatusBars();

end;


procedure Create_FO_ML_Keys(
   iIncCnt: integer;
   iNbrOfDays: integer
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

   sMLOrderKey: string;

begin

   hLog.AddToLog('Create_FO_ML_Keys', msevOperation);

   try
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      CloseTable(dm.tblRH);
      OpenTable(dm.tblRH);

      dm.tblHH.IndexName := 'ByRangeRaceDate';

      dm.tblHH.SetRangeStart;
      dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
      dm.tblHH.KeyFieldCount := 1;

      dm.tblHH.SetRangeEnd;
      dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

      dm.tblHH.KeyFieldCount := 1;
      dm.tblHH.ApplyRange;

      try
         CloseTable(dm.tblFinalOrder);
         OpenTable(dm.tblFinalOrder);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      InitPrgBar(dm.tblHH.RecordCount);
      iRecordCount := dm.tblHH.RecordCount;

      iStaCnt := 0;
      iTotalCnt := 0;

      dm.tblHH.First();
      while not dm.tblHH.Eof do begin

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusBar('Updating MORNING LINE Keys - ' +
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

         //
//         sMLOrderKey := GetMorningLineKey(dm.tblRH, dm.tblHH);
//         dm.tblFinalOrder.IndexName := '';
//         dm.tblFinalOrder.SetKey();
//         dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMLOrderKey;
//         if (dm.tblFinalOrder.GotoKey()) then begin
//            dm.tblFinalOrder.Edit();
//            dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLKey';
//            dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
//            //            dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
//            SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//            dm.tblFinalOrder.Post();
//         end else begin
//            dm.tblFinalOrder.Append();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMLOrderKey;
//            dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLKey';
//            dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
//            //            dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
//            SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//            dm.tblFinalOrder.Post();
//         end;

         dm.tblHH.Next();
      end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;
      CloseTable(dm.tblHH);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblFinalOrder);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   CloseTable(dm.tblHH);
   CloseTable(dm.tblRH);
   CloseTable(dm.tblFinalOrder);
   ClearPrgStatusBars();

end;


procedure UpdateFinalOrder();
var

   fLossProbability: double;
   fWinProbability: double;
   fOdds: double;
   fBetUnit: double;
   fExpectedProfitLossPct: double;

begin

   hLog.AddToLog('UpdateFinalOrder', msevOperation);
   try
      CloseTable(dm.tblFinalOrder);
      OpenTable(dm.tblFinalOrder);

      UpdateStatusBar('Updating FINAL ORDER');
      Application.ProcessMessages();

      InitPrgBar(dm.tblFinalOrder.RecordCount);

      dm.tblFinalOrder.First();
      while not dm.tblFinalOrder.Eof do begin
         IncPrgBar();

         dm.tblFinalOrder.Edit();
         //            dm.tblFinalOrder.FieldByName('Starts').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('Wins').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('WinPct').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('TotalOdds').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('TotalWagered').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('TotalWon').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('TotalProfitLoss').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('TotalProfitLossPct').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('ValueBet').AsFloat := 0;
         //            dm.tblFinalOrder.FieldByName('MinOdds').AsFloat := 9999;
         //            dm.tblFinalOrder.FieldByName('MaxOdds').AsFloat := 9999;

         dm.tblFinalOrder.FieldByName('LossPct').AsFloat := 100 - dm.tblFinalOrder.FieldByName('WinPct').AsFloat;

         fLossProbability := dm.tblFinalOrder.FieldByName('LossPct').AsFloat / 100;
         fWinProbability := dm.tblFinalOrder.FieldByName('WinPct').AsFloat / 100;
         fOdds := dm.tblFinalOrder.FieldByName('AvgOdds').AsFloat;
         fBetUnit := 1;
         fExpectedProfitLossPct := (fWinProbability * fOdds) - (fLossProbability * fBetUnit);
         dm.tblFinalOrder.FieldByName('ExpectedProfitLossPct').AsFloat := fExpectedProfitLossPct;

         dm.tblFinalOrder.Post();
         dm.tblFinalOrder.Next();
      end;

   finally
      CloseTable(dm.tblFinalOrder);
      ClearPrgStatusBars();                                                                                                                                  
   end;
end;



procedure Create_FO_Test_Keys(
   iIncCnt: integer;
   iNbrOfDays: integer
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

   //   sPrimaryOrderKey: string;
   //   sSecondaryOrderKey: string;
   //   sDefaultOrderKey: string;
   sMLOrderKey: string;
   sOnlyMLOrderKey: string;
   sLinerMLOrderKey: string;

begin

   hLog.AddToLog('Create_FO_ML_Keys', msevOperation);

   try
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      CloseTable(dm.tblRH);
      OpenTable(dm.tblRH);

      dm.tblHH.IndexName := 'ByRangeRaceDate';

      dm.tblHH.SetRangeStart;
      dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
      dm.tblHH.KeyFieldCount := 1;

      dm.tblHH.SetRangeEnd;
      dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

      dm.tblHH.KeyFieldCount := 1;
      dm.tblHH.ApplyRange;

      try
         CloseTable(dm.tblFinalOrder);
         OpenTable(dm.tblFinalOrder);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      InitPrgBar(dm.tblHH.RecordCount);
      iRecordCount := dm.tblHH.RecordCount;

      iStaCnt := 0;
      iTotalCnt := 0;

      dm.tblHH.First();
      while not dm.tblHH.Eof do begin

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusBar('Updating MORNING LINE Keys - ' +
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

         // Trk Code PP KSK2 Rank
         //
         sMLOrderKey := '';
         dm.tblFinalOrder.IndexName := '';
         dm.tblFinalOrder.SetKey();
         dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMLOrderKey;
         if (dm.tblFinalOrder.GotoKey()) then begin
            dm.tblFinalOrder.Edit();
            dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLKey';
            dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
            //            dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
            SummaryFlds(dm.tblHH, dm.tblFinalOrder);
            dm.tblFinalOrder.Post();
         end else begin
            dm.tblFinalOrder.Append();
            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMLOrderKey;
            dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MLKey';
            dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
            //            dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
            SummaryFlds(dm.tblHH, dm.tblFinalOrder);
            dm.tblFinalOrder.Post();
         end;


         dm.tblHH.Next();
      end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;
      CloseTable(dm.tblHH);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblFinalOrder);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   CloseTable(dm.tblHH);
   CloseTable(dm.tblRH);
   CloseTable(dm.tblFinalOrder);
   ClearPrgStatusBars();

end;

procedure Create_FO_LINER_Keys
   (
   iIncCnt: integer;
   iNbrOfDays: integer;
   iNbrOfDaysForPrimaryKeys: integer
   );
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

   //   sPrimaryOrderKey: string;
   //   sSecondaryOrderKey: string;
   //   sDefaultOrderKey: string;
   sMLOrderKey: string;

   sTrnTrackKey: string;
   sJkyTrackKey: string;
   sSpdKey: string;
   sClsKey: string;
   sSpdClsKey: string;
   sLinerKey: string;
   sLinerCntKey: string;
   sPostPosKey: string;
   sRunStyleKey: string;

   sQSPRank: string;
   sKSPRank: string;

   sQSPRank2: string;
   sKSPRank2: string;

   sXS: string;
   sXS2: string;

   sXS3: string;
   sXS4: string;

   sLP2: string;
   sOS: string;
   sOS2: string;
   sPS: string;
   sPSPlus: string;

   s2yoBred: string;
   s1stBred: string;
   sTurfBred: string;

   sX2yoBred: string;
   sX1stBred: string;
   sXTurfBred: string;
   sMorningLineKeyFinalWinPctRankKey: string;
   sTodaysWinPctRankKey: string;
   sTodaysKey: string;
   sAllKey: string;
begin

   hLog.AddToLog('Create_FO_LINER_Keys', msevOperation);


   try
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      CloseTable(dm.tblRH);
      OpenTable(dm.tblRH);

      dm.tblHH.IndexName := 'ByRangeRaceDate';

      dm.tblHH.SetRangeStart;
      dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDaysForPrimaryKeys);
      dm.tblHH.KeyFieldCount := 1;

      dm.tblHH.SetRangeEnd;
      dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

      dm.tblHH.KeyFieldCount := 1;
      dm.tblHH.ApplyRange;


      try
         CloseTable(dm.tblFinalOrder);
         OpenTable(dm.tblFinalOrder);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      InitPrgBar(dm.tblHH.RecordCount);
      iRecordCount := dm.tblHH.RecordCount;

      iStaCnt := 0;
      iTotalCnt := 0;

      dm.tblHH.First();
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction();
      end;
      while not dm.tblHH.Eof do begin

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusBar('Updating LINER Keys - ' +
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
                  dm.dbSireRate.StartTransaction();
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;

         IncPrgBar();

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

         //         if ((dm.tblHH.FieldByName('EarlyPaceRank').AsInteger > 0) and
         //            (dm.tblHH.FieldByName('EarlyPacePosRank').AsInteger > 0) and
         //            (dm.tblHH.FieldByName('MiddlePaceRank').AsInteger > 0) and
         //            (dm.tblHH.FieldByName('MiddlePacePosRank').AsInteger > 0) and
         //            (dm.tblHH.FieldByName('KSP1stCallRank').AsInteger > 0) and
         //            (dm.tblHH.FieldByName('KSP2ndCallRank').AsInteger > 0)) then begin
         //            sLinerCntKey := GetLinerCntKey(dm.tblRH, dm.tblHH);
         //            dm.tblFinalOrder.IndexName := '';
         //            dm.tblFinalOrder.SetKey();
         //            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLinerCntKey;
         //            if (dm.tblFinalOrder.GotoKey()) then begin
         //               dm.tblFinalOrder.Edit();
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LinerCntKey';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end else begin
         //               dm.tblFinalOrder.Append();
         //               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLinerCntKey;
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LinerCntKey';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := Format('%-3s', [dm.tblHH.FieldByName('TrkCode').AsString]);
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := dm.tblHH.FieldByName('MorningLineTo1').AsFloat;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end;
         //         end;
         //
         //


                  //         dm.tblFinalOrder.FlushBuffers();
         dm.tblHH.Next();
      end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;
      CloseTable(dm.tblHH);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblFinalOrder);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   CloseTable(dm.tblHH);
   CloseTable(dm.tblRH);
   CloseTable(dm.tblFinalOrder);
   ClearPrgStatusBars();

end;


end.

//         sTodaysKey := GetTrainerJockeyKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnJkyKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//                              dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnJkyKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//                              dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         sTodaysKey := GetTrainerOwnerKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnOwnKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//                              dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnOwnKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//                              dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;

         //
//         sEarlyPaceAdvantageClsKey := GetEarlyPaceAdvantageClsKey(dm.tblRH, dm.tblHH);
//         if (sEarlyPaceAdvantageClsKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sEarlyPaceAdvantageClsKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ErlAdvCls';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//               //             dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sEarlyPaceAdvantageClsKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ErlAdvCls';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         //
//         sEarlyPaceAdvantageAllKey := GetEarlyPaceAdvantageAllKey(dm.tblRH, dm.tblHH);
//         if (sEarlyPaceAdvantageAllKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sEarlyPaceAdvantageAllKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ErlAdvAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
//               //           dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sEarlyPaceAdvantageAllKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ErlAdvAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
//               //         dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;


         //
//         sEarlyPaceAdvantageTrkKey := GetEarlyPaceAdvantageTrkKey(dm.tblRH, dm.tblHH);
//         if (sEarlyPaceAdvantageTrkKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sEarlyPaceAdvantageTrkKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ErlAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //       dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sEarlyPaceAdvantageTrkKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ErlAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //     dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//
//         //
//         sCombinedPaceAdvantageTrkKey := GetCombinedPaceAdvantageTrkKey(dm.tblRH, dm.tblHH);
//         if (sCombinedPaceAdvantageTrkKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sCombinedPaceAdvantageTrkKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ComAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sCombinedPaceAdvantageTrkKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ComAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;

         //         sCombinedPaceAdvantageAllKey := GetCombinedPaceAdvantageAllKey(dm.tblRH, dm.tblHH);
         //         if (sCombinedPaceAdvantageAllKey <> '') then begin
         //            dm.tblFinalOrder.IndexName := '';
         //            dm.tblFinalOrder.SetKey();
         //            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sCombinedPaceAdvantageAllKey;
         //            if (dm.tblFinalOrder.GotoKey()) then begin
         //               dm.tblFinalOrder.Edit();
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ComAdvAll';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end else begin
         //               dm.tblFinalOrder.Append();
         //               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sCombinedPaceAdvantageAllKey;
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ComAdvAll';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end;
         //         end;

                  //
         //         sMiddlePaceAdvantageClsKey := GetMiddlePaceAdvantageClsKey(dm.tblRH, dm.tblHH);
         //         if (sMiddlePaceAdvantageClsKey <> '') then begin
         //            dm.tblFinalOrder.IndexName := '';
         //            dm.tblFinalOrder.SetKey();
         //            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMiddlePaceAdvantageClsKey;
         //            if (dm.tblFinalOrder.GotoKey()) then begin
         //               dm.tblFinalOrder.Edit();
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MidAdvCls';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end else begin
         //               dm.tblFinalOrder.Append();
         //               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMiddlePaceAdvantageClsKey;
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'ErlAdvCls';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end;
         //         end;
         //
         //         //
         //         sMiddlePaceAdvantageAllKey := GetMiddlePaceAdvantageAllKey(dm.tblRH, dm.tblHH);
         //         if (sMiddlePaceAdvantageAllKey <> '') then begin
         //            dm.tblFinalOrder.IndexName := '';
         //            dm.tblFinalOrder.SetKey();
         //            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMiddlePaceAdvantageAllKey;
         //            if (dm.tblFinalOrder.GotoKey()) then begin
         //               dm.tblFinalOrder.Edit();
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MidAdvAll';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end else begin
         //               dm.tblFinalOrder.Append();
         //               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMiddlePaceAdvantageAllKey;
         //               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MidAdvAll';
         //               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
         //               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
         //               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
         //               dm.tblFinalOrder.Post();
         //            end;
         //         end;


 //                 //
//         sMiddlePaceAdvantageTrkKey := GetMiddlePaceAdvantageTrkKey(dm.tblRH, dm.tblHH);
//         if (sMiddlePaceAdvantageTrkKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMiddlePaceAdvantageTrkKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MidAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sMiddlePaceAdvantageTrkKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'MidAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         //
//         sLatePaceAdvantageClsKey := GetLatePaceAdvantageClsKey(dm.tblRH, dm.tblHH);
//         if (sLatePaceAdvantageClsKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLatePaceAdvantageClsKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LatAdvCls';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLatePaceAdvantageClsKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LatAdvCls';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         //
//         sLatePaceAdvantageAllKey := GetLatePaceAdvantageAllKey(dm.tblRH, dm.tblHH);
//         if (sLatePaceAdvantageAllKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLatePaceAdvantageAllKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LatAdvAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLatePaceAdvantageAllKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LatAdvAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//

   //      //
//         sLatePaceAdvantageTrkKey := GetLatePaceAdvantageTrkKey(dm.tblRH, dm.tblHH);
//         if (sLatePaceAdvantageTrkKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLatePaceAdvantageTrkKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LatAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sLatePaceAdvantageTrkKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'LatAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//

         //
//         sPowerAdvantageClsKey := GetPowerAdvantageClsKey(dm.tblRH, dm.tblHH);
//         if (sPowerAdvantageClsKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPowerAdvantageClsKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PwrAdvCls';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPowerAdvantageClsKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PwrAdvCls';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('RaceType').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         //
//         sPowerAdvantageAllKey := GetPowerAdvantageAllKey(dm.tblRH, dm.tblHH);
//         if (sPowerAdvantageAllKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPowerAdvantageAllKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PwrAdvAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPowerAdvantageAllKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PwrAdvAll';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := 'ALL';
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;


 //        //
//         sPowerAdvantageTrkKey := GetPowerAdvantageTrkKey(dm.tblRH, dm.tblHH);
//         if (sPowerAdvantageTrkKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPowerAdvantageTrkKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PwrAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sPowerAdvantageTrkKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'PwrAdvTrk';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;


         //
//         sTodaysKey := GetLinerCntKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TodaySpdKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TodaySpdKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
         // //   sTodaysKey := GetRunStyleKey(dm.tblRH, dm.tblHH);
    ////         if (sTodaysKey <> '') then begin
    ////            dm.tblFinalOrder.IndexName := '';
    ////            dm.tblFinalOrder.SetKey();
    ////            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
    ////            if (dm.tblFinalOrder.GotoKey()) then begin
    ////               dm.tblFinalOrder.Edit();
    ////               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'RunStyleKey';
    ////               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
    ////               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
    ////               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
    ////               dm.tblFinalOrder.Post();
    ////            end else begin
    ////               dm.tblFinalOrder.Append();
    ////               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
    ////               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'RunStyleKey';
    ////               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
    ////               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
    ////               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
    ////               dm.tblFinalOrder.Post();
    ////            end;
    ////         end;
    //
    //       //
         // //   sTodaysKey := GetRunStyleKey(dm.tblRH, dm.tblHH);
    ////         if (sTodaysKey <> '') then begin
    ////            dm.tblFinalOrder.IndexName := '';
    ////            dm.tblFinalOrder.SetKey();
    ////            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
    ////            if (dm.tblFinalOrder.GotoKey()) then begin
    ////               dm.tblFinalOrder.Edit();
    ////               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'RunStyleKey';
    ////               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
    ////               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
    ////               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
    ////               dm.tblFinalOrder.Post();
    ////            end else begin
    ////               dm.tblFinalOrder.Append();
    ////               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
    ////               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'RunStyleKey';
    ////               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
    ////               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
    ////               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
    ////               dm.tblFinalOrder.Post();
    ////            end;
    ////         end;
    //
    //       //
//
//         sTodaysKey := GetTodaysKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TodaysKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TodaysKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         sTodaysKey := GetTrainerJockeyKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnJkyKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnJkyKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         sTodaysKey := GetTrainerOwnerKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnOwnKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnOwnKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         sTodaysKey := GetTrainerAllKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnAllKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnAllKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         sTodaysKey := GetTrainerJockeyAllKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnJkyAllKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnJkyAllKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
//
//         sTodaysKey := GetTrainerOwnerAllKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnOwnAllKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TrnOwnAllKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//               //               dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;
       //    //
//         sTodaysKey := GetTodaysKey(dm.tblRH, dm.tblHH);
//         if (sTodaysKey <> '') then begin
//            dm.tblFinalOrder.IndexName := '';
//            dm.tblFinalOrder.SetKey();
//            dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//            if (dm.tblFinalOrder.GotoKey()) then begin
//               dm.tblFinalOrder.Edit();
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TodaysKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//                              dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end else begin
//               dm.tblFinalOrder.Append();
//               dm.tblFinalOrder.FieldByName('OrderKey').AsString := sTodaysKey;
//               dm.tblFinalOrder.FieldByName('BaseKey').AsString := 'TodaysKey';
//               dm.tblFinalOrder.FieldByName('TrkKey').AsString := dm.tblRH.FieldByName('TrkCode').AsString;
//                              dm.tblFinalOrder.FieldByName('MorningLineTo1').AsFloat := 0;
//               SummaryFlds(dm.tblHH, dm.tblFinalOrder);
//               dm.tblFinalOrder.Post();
//            end;
//         end;

//
//

