unit UnitUpdateSummaryTables;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, iniFiles;

procedure UpdateSummaryTables(iIncCnt: integer; bCreateAll: boolean; bOneDay: boolean; iNbrOfDays: integer);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, ESBMaths2, StrMan;

procedure StatFlds(tblH: TDBISAMTable; memS: TDBISAMTable);
var
   fStarts: double;
   fWins: double;
   fWinPct: double;
begin

   memS.FieldByName('Starts').AsInteger := memS.FieldByName('Starts').AsInteger + 1;
   if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
      memS.FieldByName('Wins').AsInteger := memS.FieldByName('Wins').AsInteger + 1;
   end;

   fWins := memS.FieldByName('Wins').AsFloat;
   fStarts := memS.FieldByName('Starts').AsFloat;
   if (fStarts > 0) then begin
      fWinPct := (fWins / fStarts) * 100;
   end else begin
      fWinPct := 0;
   end;

   if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
      memS.FieldByName('TotalOdds').AsFloat := memS.FieldByName('TotalOdds').AsFloat + tblH.FieldByName('Odds').AsFloat;
   end;

   if (memS.FieldByName('Wins').AsFloat > 0) then begin
      memS.FieldByName('AvgWinOdds').AsFloat := memS.FieldByName('TotalOdds').AsFloat / memS.FieldByName('Wins').AsFloat;
   end;

   if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
      if (tblH.FieldByName('Odds').AsFloat < memS.FieldByName('MinWinOdds').AsFloat) then begin
         memS.FieldByName('MinWinOdds').AsFloat := tblH.FieldByName('Odds').AsFloat;
      end;
      if (tblH.FieldByName('Odds').AsFloat > memS.FieldByName('MaxWinOdds').AsFloat) then begin
         memS.FieldByName('MaxWinOdds').AsFloat := tblH.FieldByName('Odds').AsFloat;
      end;
   end;
   memS.FieldByName('WinPct').AsFloat := Round(fWinPct * 100) / 100;

end;

procedure PediFlds(
   tblH: TDBISAMTable;
   tblR: TDBISAMTable;
   memS: TDBISAMTable);
var
   fStarts: double;
   fWins: double;
   fWinPct: double;
begin

   memS.FieldByName('AllStarts').AsInteger := memS.FieldByName('AllStarts').AsInteger + 1;

   if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
      memS.FieldByName('AllWins').AsInteger := memS.FieldByName('AllWins').AsInteger + 1;
   end;

   fWins := memS.FieldByName('AllWins').AsFloat;
   fStarts := memS.FieldByName('AllStarts').AsFloat;
   if (fStarts > 0) then begin
      fWinPct := (fWins / fStarts) * 100;
   end else begin
      fWinPct := 0;
   end;
   memS.FieldByName('AllWinPct').AsFloat := Round(fWinPct * 100) / 100;

   if (tblR.FieldByname('Surface').AsString = 'T') then begin
      memS.FieldByName('AllTurfStarts').AsInteger := memS.FieldByName('AllTurfStarts').AsInteger + 1;
      if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
         memS.FieldByName('AllTurfWins').AsInteger := memS.FieldByName('AllTurfWins').AsInteger + 1;
      end;

      fWins := memS.FieldByName('AllTurfWins').AsFloat;
      fStarts := memS.FieldByName('AllTurfStarts').AsFloat;
      if (fStarts > 0) then begin
         fWinPct := (fWins / fStarts) * 100;
      end else begin
         fWinPct := 0;
      end;
      memS.FieldByName('AllTurfWinPct').AsFloat := Round(fWinPct * 100) / 100;
   end;

   if (tblR.FieldByName('Surface').AsString = 'D') then begin
      if (tblR.FieldByName('TrkCond').AsString <> ' FT') then begin

         memS.FieldByName('AllMudStarts').AsInteger := memS.FieldByName('AllMudStarts').AsInteger + 1;
         if (tblH.FieldByName('FinishPos').AsInteger = 1) then begin
            memS.FieldByName('AllMudWins').AsInteger := memS.FieldByName('AllMudWins').AsInteger + 1;
         end;

         fWins := memS.FieldByName('AllMudWins').AsFloat;
         fStarts := memS.FieldByName('AllMudStarts').AsFloat;
         if (fStarts > 0) then begin
            fWinPct := (fWins / fStarts) * 100;
         end else begin
            fWinPct := 0;
         end;
         memS.FieldByName('AllMudWinPct').AsFloat := Round(fWinPct * 100) / 100;
      end;
   end;

end;



procedure UpdateSummaryTables(iIncCnt: integer; bCreateAll: boolean; bOneDay: boolean; iNbrOfDays: integer);
var

   sTrkCode: string;

   iStarts: integer;
   iDistanceInFeet: integer;

   fStarts: double;
   fWins: double;
   fWinPct: double;

   fFldstarts: double;
   fTotalWins: double;
   fTotalWinPct: double;
   fRating: double;

   sSql: string;
   sRaceType: string;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCnt: integer;

   iniFile: TIniFile;
   dtStatsUpdatedTo: TDateTime;

   sCategory: string;
   sJockeyName: string;
   sTrainerName: string;

begin

   hLog.AddToLog('UpdateAllRatings', msevOperation);
   try

      //  CloseTable(dm.tblDamSummary);
  //      CloseTable(dm.tblSireSummary);
  //      CloseTable(dm.tblDamSireSummary);
  //
  //      CloseTable(dm.tblTrainerSummary);
  //      CloseTable(dm.tblJockeySummary);

      CloseTable(dm.tblTrainerJockeySummary);

      //    CloseTable(dm.tblOwnerSummary);
    //      CloseTable(dm.tblBreederSummary);

      CloseTable(dm.tblTrainerOwnerSummary);

      //    CloseTable(dm.tblTrainer1To45Summary);
    //      CloseTable(dm.tblTrainer46To120Summary);
    //      CloseTable(dm.tblTrainer120PlusSummary);
    //
    //      CloseTable(dm.tblTrainer1To45WorkSummary);
    //      CloseTable(dm.tblTrainer46To120WorkSummary);
    //      CloseTable(dm.tblTrainer120PlusWorkSummary);
    //
    //      CloseTable(dm.tblTrainerDebutSummary);
    //      CloseTable(dm.tblTrainerDebutTwoSummary);
    //
    //      CloseTable(dm.tblTrainerFirstJuiceSummary);
    //      CloseTable(dm.tblTrainerSecondJuiceSummary);
    //
    //      CloseTable(dm.tblTrainerBlinkersOnSummary);
    //      CloseTable(dm.tblTrainerBlinkersOffSummary);
    //
    //      CloseTable(dm.tblTrainerStats);


          //
      if (bCreateAll) then begin
         try
            //            dm.tblDamSummary.EmptyTable();
            //            dm.tblSireSummary.EmptyTable();
            //            dm.tblDamSireSummary.EmptyTable();
            //
            //            dm.tblTrainerSummary.EmptyTable();
            //            dm.tblJockeySummary.EmptyTable();
            dm.tblTrainerJockeySummary.EmptyTable();
            //
            //            dm.tblOwnerSummary.EmptyTable();
            //            dm.tblBreederSummary.EmptyTable();

            dm.tblTrainerOwnerSummary.EmptyTable();

            //            dm.tblTrainer1To45Summary.EmptyTable();
            //            dm.tblTrainer46To120Summary.EmptyTable();
            //            dm.tblTrainer120PlusSummary.EmptyTable();
            //
            //            dm.tblTrainer1To45WorkSummary.EmptyTable();
            //            dm.tblTrainer46To120WorkSummary.EmptyTable();
            //            dm.tblTrainer120PlusWorkSummary.EmptyTable();
            //
            //            dm.tblTrainerDebutSummary.EmptyTable();
            //            dm.tblTrainerDebutTwoSummary.EmptyTable();
            //
            //            dm.tblTrainerFirstJuiceSummary.EmptyTable();
            //            dm.tblTrainerSecondJuiceSummary.EmptyTable();
            //
            //            dm.tblTrainerBlinkersOnSummary.EmptyTable();
            //            dm.tblTrainerBlinkersOffSummary.EmptyTable();
            //
            //            dm.tblTrainerStats.EmptyTable();
         except
            on E: Exception do begin
               hLog.AddToLog(E.Message, msevException);
               //               CloseTable(dm.tblDamSummary);
               //               CloseTable(dm.tblSireSummary);
               //               CloseTable(dm.tblDamSireSummary);
               //
               //               CloseTable(dm.tblTrainerSummary);
               //               CloseTable(dm.tblJockeySummary);
               CloseTable(dm.tblTrainerJockeySummary);

               //             CloseTable(dm.tblOwnerSummary);
             //               CloseTable(dm.tblBreederSummary);

               CloseTable(dm.tblTrainerOwnerSummary);
               //
               //               CloseTable(dm.tblTrainer1To45Summary);
               //               CloseTable(dm.tblTrainer46To120Summary);
               //               CloseTable(dm.tblTrainer120PlusSummary);
               //
               //               CloseTable(dm.tblTrainer1To45WorkSummary);
               //               CloseTable(dm.tblTrainer46To120Worksummary);
               //               CloseTable(dm.tblTrainer120PlusWorksummary);
               //
               //               CloseTable(dm.tblTrainerDebutSummary);
               //               CloseTable(dm.tblTrainerDebutTwoSummary);
               //
               //               CloseTable(dm.tblTrainerFirstJuiceSummary);
               //               CloseTable(dm.tblTrainerSecondJuiceSummary);
               //               CloseTable(dm.tblTrainerBlinkersOnSummary);
               //               CloseTable(dm.tblTrainerStats);

               CloseTable(dm.tblRH);
               CloseTable(dm.tblHH);
               ClearPrgStatusBars();
               exit;
            end;
         end;
      end;

      //
  //    OpenTable(dm.tblDamSummary);
//      OpenTable(dm.tblSireSummary);
//      OpenTable(dm.tblDamSireSummary);
//
//      OpenTable(dm.tblTrainerSummary);
//      OpenTable(dm.tblJockeySummary);
      OpenTable(dm.tblTrainerJockeySummary);

      //      OpenTable(dm.tblOwnerSummary);
      //      OpenTable(dm.tblBreederSummary);

      OpenTable(dm.tblTrainerOwnerSummary);

      //      OpenTable(dm.tblTrainer1To45Summary);
      //      OpenTable(dm.tblTrainer46To120Summary);
      //      OpenTable(dm.tblTrainer120PlusSummary);
      //
      //      OpenTable(dm.tblTrainer1To45WorkSummary);
      //      OpenTable(dm.tblTrainer46To120WorkSummary);
      //      OpenTable(dm.tblTrainer120PlusWorkSummary);
      //
      //      OpenTable(dm.tblTrainerDebutSummary);
      //      OpenTable(dm.tblTrainerDebutTwoSummary);
      //
      //      OpenTable(dm.tblTrainerFirstJuiceSummary);
      //      OpenTable(dm.tblTrainerSecondJuiceSummary);
      //
      //      OpenTable(dm.tblTrainerBlinkersOnSummary);
      //      OpenTable(dm.tblTrainerBlinkersOffSummary);
      //
      //      OpenTable(dm.tblTrainerStats);
      //

      OpenTable(dm.tblHH);
      OpenTable(dm.tblRH);

      OpenTable(dm.tblTrainer);
      OpenTable(dm.tblJockey);

      if (not bCreateAll) then begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
         if (bOneDay) then begin
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         end else begin
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := DATE_STATS_UPDATED_TO;
         end;
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.ApplyRange;
      end else begin
         dm.tblHH.IndexName := 'ByRangeRaceDate';

         dm.tblHH.SetRangeStart;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate - STAT_DAYS;
         dm.tblHH.KeyFieldCount := 1;

         dm.tblHH.SetRangeEnd;
         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

         dm.tblHH.KeyFieldCount := 1;
         dm.tblHH.ApplyRange;

      end;

      fTotalWinPct := 0;
      iRecordCnt := dm.tblHH.RecordCount;
      InitPrgBar(dm.tblHH.RecordCount);

      iStaCnt := 0;
      iTotalCnt := 0;

      dm.tblHH.First();
      while (not dm.tblHH.Eof) do begin
         dtStatsUpdatedTo := dm.tblHH.FieldByName('RaceDate').AsDateTime;

         if (iTotalCnt > iRecordCnt) then begin
            //            CloseTable(dm.tblDamSummary);
            //            CloseTable(dm.tblSireSummary);
            //            CloseTable(dm.tblDamSireSummary);
            //
            //            CloseTable(dm.tblTrainerSummary);
            //            CloseTable(dm.tblJockeySummary);

            CloseTable(dm.tblTrainerJockeySummary);

            //           CloseTable(dm.tblOwnerSummary);
           //            CloseTable(dm.tblBreederSummary);

            CloseTable(dm.tblTrainerOwnerSummary);

            //            CloseTable(dm.tblTrainer1To45Summary);
            //            CloseTable(dm.tblTrainer46To120Summary);
            //            CloseTable(dm.tblTrainer120PlusSummary);
            //
            //            CloseTable(dm.tblTrainer1To45WorkSummary);
            //            CloseTable(dm.tblTrainer46To120WorkSummary);
            //            CloseTable(dm.tblTrainer120PlusWorkSummary);
            //
            //            CloseTable(dm.tblTrainerDebutSummary);
            //            CloseTable(dm.tblTrainerDebutTwoSummary);
            //
            //            CloseTable(dm.tblTrainerFirstJuiceSummary);
            //            CloseTable(dm.tblTrainerSecondJuiceSummary);
            //
            //            CloseTable(dm.tblTrainerBlinkersOnSummary);
            //            CloseTable(dm.tblTrainerBlinkersOffSummary);
            //
            //            CloseTable(dm.tblTrainerStats);

            dm.tblHH.IndexName := '';
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            ClearPrgStatusBars();
            try
               iniFile := TIniFile.Create(INI_FILE);
               iniFile.WriteDate('Process', 'DateStatsUpdatedTo', dtStatsUpdatedTo);
            finally
               FreeAndNil(iniFile);
            end;
            exit;
         end;

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusBar('Updating Statistics - ' +
               dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
               dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
               dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
               IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
            Application.ProcessMessages();
            iStaCnt := 0;
         end else begin
            Inc(iTotalCnt);
            Inc(iStaCnt);
         end;

         if (dm.tblHH.FieldByName('RaceDate').AsDateTime < (Now() - iNbrOfDays)) then begin
            dm.tblHH.Next();
            continue;
         end;

         if (Trim(dm.tblHH.FieldByName('Jockey').AsString) = '') then begin
            hLog.AddToLog('JKY EQUIBASE KEY ' + dm.tblHH.FieldByName('TrkCode').AsString + dm.tblHH.FieldByName('RaceDate').AsString + dm.tblHH.FieldByName('RaceNbr').AsString, msevException);
            dm.tblHH.Next();
            continue;
         end;

         if (Trim(dm.tblHH.FieldByName('Trainer').AsString) = '') then begin
            hLog.AddToLog('TRN EQUIBASE KEY ' + dm.tblHH.FieldByName('TrkCode').AsString + dm.tblHH.FieldByName('RaceDate').AsString + dm.tblHH.FieldByName('RaceNbr').AsString, msevException);
            dm.tblHH.Next();
            continue;
         end;

         IncPrgBar();
         dm.tblRH.IndexName := '';
         dm.tblRH.SetKey();
         dm.tblRH.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
         dm.tblRH.FieldByName('RaceNbr').Value := dm.tblHH.FieldByName('RaceNbr').Value;
         dm.tblRH.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
         if (dm.tblRH.GotoKey()) then begin

            if (dm.tblHH.FieldByName('FinishPos').AsInteger = 0) then begin
               dm.tblHH.Next();
               continue;
            end;

            if (dm.tblHH.FieldByName('Odds').AsFloat = 0) then begin
               dm.tblHH.Next();
               continue;
            end;



            //            dm.tblJockey.IndexName := 'ByJockey';
            //            dm.tblJockey.SetKey();
            //            dm.tblJockey.FieldByName('Jockey').AsString := dm.tblHH.FieldByName('Jockey').AsString;
            //            if (dm.tblJockey.GotoKey()) then begin
            //               sJockeyName := dm.tblJockey.FieldByName('Jockey').AsString;
            //            end else begin
            //               sJockeyName := 'NONE';
            //            end;
            //
            //
            //            dm.tblTrainer.IndexName := 'ByTrainer';
            //            dm.tblTrainer.SetKey();
            //            dm.tblTrainer.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //            if (dm.tblTrainer.GotoKey()) then begin
            //               sTrainerName := dm.tblTrainer.FieldByName('Trainer').AsString;
            //            end else begin
            //               sTrainerName := 'NONE';
            //            end;

                        //All Starts
            //            try
            //               sCategory := 'All Starts';
            //               dm.tblTrainerStats.IndexName := '';
            //               dm.tblTrainerStats.SetKey();
            //               dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //               dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
            //               dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            //               if (dm.tblTrainerStats.GotoKey()) then begin
            //                  dm.tblTrainerStats.Edit();
            //                  StatFlds(dm.tblHH, dm.tblTrainerStats);
            //                  dm.tblTrainerStats.Post();
            //               end else begin
            //                  dm.tblTrainerStats.Append();
            //                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //                  StatFlds(dm.tblHH, dm.tblTrainerStats);
            //                  dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
            //                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            //                  dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
            //                  dm.tblTrainerStats.Post();
            //               end;
            //
            //
            //
            //               sCategory := 'Dirt';
            //               if (dm.tblHH.FieldByName('Surface').AsString) <> 'T' then begin
            //                  dm.tblTrainerStats.IndexName := '';
            //                  dm.tblTrainerStats.SetKey();
            //                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //                  dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
            //                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            //                  if (dm.tblTrainerStats.GotoKey()) then begin
            //                     dm.tblTrainerStats.Edit();
            //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
            //                     dm.tblTrainerStats.Post();
            //                  end else begin
            //                     dm.tblTrainerStats.Append();
            //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
            //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
            //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            //                     dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
            //                     dm.tblTrainerStats.Post();
            //                  end;
            //               end;
            //
            //               sCategory := 'Turf';
            //               if (dm.tblHH.FieldByName('Surface').AsString) = 'T' then begin
            //                  dm.tblTrainerStats.IndexName := '';
            //                  dm.tblTrainerStats.SetKey();
            //                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //                  dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
            //                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            //                  if (dm.tblTrainerStats.GotoKey()) then begin
            //                     dm.tblTrainerStats.Edit();
            //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
            //                     dm.tblTrainerStats.Post();
            //                  end else begin
            //                     dm.tblTrainerStats.Append();
            //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
            //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
            //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            //                     dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
            //                     dm.tblTrainerStats.Post();
            //                  end;
            //               end;
            //
            //               dm.tblTrainerSummary.IndexName := '';
            //               dm.tblTrainerSummary.SetKey();
            //               dm.tblTrainerSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //               if (dm.tblTrainerSummary.GotoKey()) then begin
            //                  dm.tblTrainerSummary.Edit();
            //                  StatFlds(dm.tblHH, dm.tblTrainerSummary);
            //                  dm.tblTrainerSummary.Post();
            //               end else begin
            //                  dm.tblTrainerSummary.Append();
            //                  dm.tblTrainerSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            //                  StatFlds(dm.tblHH, dm.tblTrainerSummary);
            //                  dm.tblTrainerSummary.Post();
            //               end;
            //            except
            //               on E: Exception do begin
            //                  hLog.AddToLog('All Starts', msevException);
            //                  hLog.AddToLog(E.Message, msevException);
            //               end;
            //            end;
            //
            //            //Jockey
            //            try
            // //              sCategory := 'Jockey';
            ////               dm.tblTrainerStats.IndexName := '';
            ////               dm.tblTrainerStats.SetKey();
            ////               dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            ////               dm.tblTrainerStats.FieldByName('Code').AsString := sJockeyName;
            ////               dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            ////               if (dm.tblTrainerStats.GotoKey()) then begin
            ////                  dm.tblTrainerStats.Edit();
            ////                  StatFlds(dm.tblHH, dm.tblTrainerStats);
            ////                  dm.tblTrainerStats.Post();
            ////               end else begin
            ////                  dm.tblTrainerStats.Append();
            ////                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            ////                  StatFlds(dm.tblHH, dm.tblTrainerStats);
            ////                  dm.tblTrainerStats.FieldByName('Code').AsString := sJockeyName;
            ////                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            ////                  dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
            ////                  dm.tblTrainerStats.Post();
            ////               end;
            //
            //               dm.tblJockeySummary.IndexName := '';
            //               dm.tblJockeySummary.SetKey();
            //               dm.tblJockeySummary.FieldByName('Jockey').AsString := dm.tblHH.FieldByName('Jockey').AsString;
            //               if (dm.tblJockeySummary.GotoKey()) then begin
            //                  dm.tblJockeySummary.Edit();
            //                  StatFlds(dm.tblHH, dm.tblJockeySummary);
            //                  dm.tblJockeySummary.Post();
            //               end else begin
            //                  dm.tblJockeySummary.Append();
            //                  dm.tblJockeySummary.FieldByName('Jockey').AsString := dm.tblHH.FieldByName('Jockey').AsString;
            //                  StatFlds(dm.tblHH, dm.tblJockeySummary);
            //                  dm.tblJockeySummary.Post();
            //               end;
            //            except
            //               on E: Exception do begin
            //                  hLog.AddToLog('Jky', msevException);
            //                  hLog.AddToLog(E.Message, msevException);
            //               end;
            //            end;
            //
            //            //Owner
            //            try
            ////               sCategory := 'Owner';
            ////               dm.tblTrainerStats.IndexName := '';
            ////               dm.tblTrainerStats.SetKey();
            ////               dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            ////               dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('Owner').AsString;
            ////               dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            ////               if (dm.tblTrainerStats.GotoKey()) then begin
            ////                  dm.tblTrainerStats.Edit();
            ////                  StatFlds(dm.tblHH, dm.tblTrainerStats);
            ////                  dm.tblTrainerStats.Post();
            ////               end else begin
            ////                  dm.tblTrainerStats.Append();
            ////                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
            ////                  StatFlds(dm.tblHH, dm.tblTrainerStats);
            ////                  dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('Owner').AsString;
            ////                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
            ////                  dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
            ////                  dm.tblTrainerStats.Post();
            ////               end;
            //
            //               if Trim(dm.tblHH.FieldByName('Owner').AsString) <> '' then begin
            //                  dm.tblOwnerSummary.IndexName := '';
            //                  dm.tblOwnerSummary.SetKey();
            //                  dm.tblOwnerSummary.FieldByName('Owner').AsString := UpperCase(dm.tblHH.FieldByName('Owner').AsString);
            //                  if (dm.tblOwnerSummary.GotoKey()) then begin
            //                     dm.tblOwnerSummary.Edit();
            //                     StatFlds(dm.tblHH, dm.tblOwnerSummary);
            //                     dm.tblOwnerSummary.Post();
            //                  end else begin
            //                     dm.tblOwnerSummary.Append();
            //                     dm.tblOwnerSummary.FieldByName('Owner').AsString := UpperCase(dm.tblHH.FieldByName('Owner').AsString);
            //                     StatFlds(dm.tblHH, dm.tblOwnerSummary);
            //                     dm.tblOwnerSummary.Post();
            //                  end;
            //               end;
            //            except
            //               on E: Exception do begin
            //                  hLog.AddToLog('Own', msevException);
            //                  hLog.AddToLog(E.Message, msevException);
            //               end;
            //            end;
            //
            //
            //            //Breeder
            //            try
            //               if Trim(dm.tblHH.FieldByName('Breeder').AsString) <> '' then begin
            //                  dm.tblBreederSummary.IndexName := '';
            //                  dm.tblBreederSummary.SetKey();
            //                  dm.tblBreederSummary.FieldByName('Breeder').AsString := UpperCase(dm.tblHH.FieldByName('Breeder').AsString);
            //                  if (dm.tblBreederSummary.GotoKey()) then begin
            //                     dm.tblBreederSummary.Edit();
            //                     StatFlds(dm.tblHH, dm.tblBreederSummary);
            //                     dm.tblBreederSummary.Post();
            //                  end else begin
            //                     dm.tblBreederSummary.Append();
            //                     dm.tblBreederSummary.FieldByName('Breeder').AsString := UpperCase(dm.tblHH.FieldByName('Breeder').AsString);
            //                     StatFlds(dm.tblHH, dm.tblBreederSummary);
            //                     dm.tblBreederSummary.Post();
            //                  end;
            //               end;
            //            except
            //               on E: Exception do begin
            //                  hLog.AddToLog('Brd', msevException);
            //                  hLog.AddToLog(E.Message, msevException);
            //               end;
            //            end;

                        //Trainer-Owner
            try
               if (Trim(dm.tblHH.FieldByName('Owner').AsString) <> '') and
                  (Trim(dm.tblHH.FieldByName('Trainer').AsString) <> '') then begin
                  dm.tblTrainerOwnerSummary.IndexName := '';
                  dm.tblTrainerOwnerSummary.SetKey();
                  dm.tblTrainerOwnerSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
                  dm.tblTrainerOwnerSummary.FieldByName('Owner').AsString := UpperCase(dm.tblHH.FieldByName('Owner').AsString);
                  if (dm.tblTrainerOwnerSummary.GotoKey()) then begin
                     dm.tblTrainerOwnerSummary.Edit();
                     StatFlds(dm.tblHH, dm.tblTrainerOwnerSummary);
                     dm.tblTrainerOwnerSummary.Post();
                  end else begin
                     dm.tblTrainerOwnerSummary.Append();
                     dm.tblTrainerOwnerSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
                     dm.tblTrainerOwnerSummary.FieldByName('Owner').AsString := UpperCase(dm.tblHH.FieldByName('Owner').AsString);
                     StatFlds(dm.tblHH, dm.tblTrainerOwnerSummary);
                     dm.tblTrainerOwnerSummary.Post();
                  end;
               end;
            except
               on E: Exception do begin
                  hLog.AddToLog('TrnOwn', msevException);
                  hLog.AddToLog(E.Message, msevException);
               end;
            end;

            //Trainer-Jockey
            try
               if
                  (Trim(dm.tblHH.FieldByName('Jockey').AsString) <> '') and
                  (Trim(dm.tblHH.FieldByName('Trainer').AsString) <> '') then begin
                  dm.tblTrainerJockeySummary.IndexName := '';
                  dm.tblTrainerJockeySummary.SetKey();
                  dm.tblTrainerJockeySummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
                  dm.tblTrainerJockeySummary.FieldByName('Jockey').AsString := dm.tblHH.FieldByName('Jockey').AsString;
                  if (dm.tblTrainerJockeySummary.GotoKey()) then begin
                     dm.tblTrainerJockeySummary.Edit();
                     StatFlds(dm.tblHH, dm.tblTrainerJockeySummary);
                     dm.tblTrainerJockeySummary.Post();
                  end else begin
                     dm.tblTrainerJockeySummary.Append();
                     dm.tblTrainerJockeySummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
                     dm.tblTrainerJockeySummary.FieldByName('Jockey').AsString := dm.tblHH.FieldByName('Jockey').AsString;
                     StatFlds(dm.tblHH, dm.tblTrainerJockeySummary);
                     dm.tblTrainerJockeySummary.Post();
                  end;
               end;
            except
               on E: Exception do begin
                  hLog.AddToLog('TrnJky', msevException);
                  hLog.AddToLog(E.Message, msevException);
               end;
            end;


            //           //1st Starter
           //            try
           //               // Trainer Stats
           //               if ((dm.tblHH.FieldByName('LifeStarts').AsInteger = 0) and (dm.tblHH.FieldByName('LifeWins').AsInteger = 0)) then begin
           //                  sCategory := 'Dirt 1st';
           //                  if (dm.tblHH.FieldByName('Surface').AsString) <> 'T' then begin
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //
           //                //     dm.tblTrainerStats.IndexName := '';
           ////                     dm.tblTrainerStats.SetKey();
           ////                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                     if (dm.tblTrainerStats.GotoKey()) then begin
           ////                        dm.tblTrainerStats.Edit();
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.Post();
           ////                     end else begin
           ////                        dm.tblTrainerStats.Append();
           ////                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           ////                        dm.tblTrainerStats.Post();
           ////                     end;
           //
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //                  end;
           //               end else begin
           //                  sCategory := 'Turf 1st';
           //                  dm.tblTrainerStats.IndexName := '';
           //                  dm.tblTrainerStats.SetKey();
           //                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                  if (dm.tblTrainerStats.GotoKey()) then begin
           //                     dm.tblTrainerStats.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                     dm.tblTrainerStats.Post();
           //                  end else begin
           //                     dm.tblTrainerStats.Append();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                     dm.tblTrainerStats.Post();
           //                  end;
           //
           //        //          dm.tblTrainerStats.IndexName := '';
           ////                  dm.tblTrainerStats.SetKey();
           ////                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                  dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                  if (dm.tblTrainerStats.GotoKey()) then begin
           ////                     dm.tblTrainerStats.Edit();
           ////                     StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                     dm.tblTrainerStats.Post();
           ////                  end else begin
           ////                     dm.tblTrainerStats.Append();
           ////                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                     StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                     dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           ////                     dm.tblTrainerStats.Post();
           ////                  end;
           //
           //                  dm.tblTrainerStats.IndexName := '';
           //                  dm.tblTrainerStats.SetKey();
           //                  dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                  dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                  if (dm.tblTrainerStats.GotoKey()) then begin
           //                     dm.tblTrainerStats.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                     dm.tblTrainerStats.Post();
           //                  end else begin
           //                     dm.tblTrainerStats.Append();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                     dm.tblTrainerStats.Post();
           //                  end;
           //               end;
           //               //Trainer Stats
           //
           //               if (dm.tblHH.FieldByName('IsDebut').AsBoolean) then begin
           //                  dm.tblTrainerDebutSummary.IndexName := '';
           //                  dm.tblTrainerDebutSummary.SetKey();
           //                  dm.tblTrainerDebutSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainerDebutSummary.GotoKey()) then begin
           //                     dm.tblTrainerDebutSummary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerDebutSummary);
           //                     dm.tblTrainerDebutSummary.Post();
           //                  end else begin
           //                     dm.tblTrainerDebutSummary.Append();
           //                     dm.tblTrainerDebutSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerDebutSummary);
           //                     dm.tblTrainerDebutSummary.Post();
           //                  end;
           //               end;
           //
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('1st', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //
           //
           //            //2nd time out
           //            try
           //               // Trainer Stats
           //               if ((dm.tblHH.FieldByName('LifeStarts').AsInteger = 1) and (dm.tblHH.FieldByName('LifeWins').AsInteger = 0)) then begin
           //                  sCategory := 'Dirt 2nd';
           //                  if (dm.tblHH.FieldByName('Surface').AsString) <> 'T' then begin
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //
           //              //       dm.tblTrainerStats.IndexName := '';
           ////                     dm.tblTrainerStats.SetKey();
           ////                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                     if (dm.tblTrainerStats.GotoKey()) then begin
           ////                        dm.tblTrainerStats.Edit();
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.Post();
           ////                     end else begin
           ////                        dm.tblTrainerStats.Append();
           ////                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           ////                        dm.tblTrainerStats.Post();
           ////                     end;
           //
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //                  end else begin
           //                     sCategory := 'Turf 2nd';
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //
           ////                     dm.tblTrainerStats.IndexName := '';
           ////                     dm.tblTrainerStats.SetKey();
           ////                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                     if (dm.tblTrainerStats.GotoKey()) then begin
           ////                        dm.tblTrainerStats.Edit();
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.Post();
           ////                     end else begin
           ////                        dm.tblTrainerStats.Append();
           ////                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           ////                        dm.tblTrainerStats.Post();
           ////                     end;
           //
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //                  end;
           //               end;
           //               //Trainer Stats
           //
           //               // Trainer Stats
           //               if ((dm.tblHH.FieldByName('LifeStarts').AsInteger = 2) and (dm.tblHH.FieldByName('LifeWins').AsInteger = 0)) then begin
           //                  sCategory := 'Dirt 3rd';
           //                  if (dm.tblHH.FieldByName('Surface').AsString) <> 'T' then begin
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //
           ////                     dm.tblTrainerStats.IndexName := '';
           ////                     dm.tblTrainerStats.SetKey();
           ////                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                     if (dm.tblTrainerStats.GotoKey()) then begin
           ////                        dm.tblTrainerStats.Edit();
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.Post();
           ////                     end else begin
           ////                        dm.tblTrainerStats.Append();
           ////                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           ////                        dm.tblTrainerStats.Post();
           ////                     end;
           //
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //                  end else begin
           //                     sCategory := 'Turf 3rd';
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := 'ALL';
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //
           ////                     dm.tblTrainerStats.IndexName := '';
           ////                     dm.tblTrainerStats.SetKey();
           ////                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                     if (dm.tblTrainerStats.GotoKey()) then begin
           ////                        dm.tblTrainerStats.Edit();
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.Post();
           ////                     end else begin
           ////                        dm.tblTrainerStats.Append();
           ////                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           ////                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           ////                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
           ////                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           ////                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           ////                        dm.tblTrainerStats.Post();
           ////                     end;
           //
           //                     dm.tblTrainerStats.IndexName := '';
           //                     dm.tblTrainerStats.SetKey();
           //                     dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                     dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                     if (dm.tblTrainerStats.GotoKey()) then begin
           //                        dm.tblTrainerStats.Edit();
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.Post();
           //                     end else begin
           //                        dm.tblTrainerStats.Append();
           //                        dm.tblTrainerStats.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        StatFlds(dm.tblHH, dm.tblTrainerStats);
           //                        dm.tblTrainerStats.FieldByName('Code').AsString := dm.tblHH.FieldByName('RaceType').AsString;
           //                        dm.tblTrainerStats.FieldByName('Category').AsString := sCategory;
           //                        dm.tblTrainerStats.FieldByName('Name').AsString := sTrainerName;
           //                        dm.tblTrainerStats.Post();
           //                     end;
           //                  end;
           //               end;
           //               //Trainer Stats
           //
           //               if (dm.tblHH.FieldByName('IsDebutTwo').AsBoolean) then begin
           //                  dm.tblTrainerDebutTwoSummary.IndexName := '';
           //                  dm.tblTrainerDebutTwoSummary.SetKey();
           //                  dm.tblTrainerDebutTwoSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainerDebutTwoSummary.GotoKey()) then begin
           //                     dm.tblTrainerDebutTwoSummary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerDebutTwoSummary);
           //                     dm.tblTrainerDebutTwoSummary.Post();
           //                  end else begin
           //                     dm.tblTrainerDebutTwoSummary.Append();
           //                     dm.tblTrainerDebutTwoSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerDebutTwoSummary);
           //                     dm.tblTrainerDebutTwoSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('2nd', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //Blinkers On
           //            try
           //               if (dm.tblHH.FieldByName('IsBlinkersOn').AsBoolean) then begin
           //                  dm.tblTrainerBlinkersOnSummary.IndexName := '';
           //                  dm.tblTrainerBlinkersOnSummary.SetKey();
           //                  dm.tblTrainerBlinkersOnSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainerBlinkersOnSummary.GotoKey()) then begin
           //                     dm.tblTrainerBlinkersOnSummary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerBlinkersOnSummary);
           //                     dm.tblTrainerBlinkersOnSummary.Post();
           //                  end else begin
           //                     dm.tblTrainerBlinkersOnSummary.Append();
           //                     dm.tblTrainerBlinkersOnSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerBlinkersOnSummary);
           //                     dm.tblTrainerBlinkersOnSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('On', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //Blinkers Off
           //            try
           //               if (dm.tblHH.FieldByName('IsBlinkersOff').AsBoolean) then begin
           //                  dm.tblTrainerBlinkersOffSummary.IndexName := '';
           //                  dm.tblTrainerBlinkersOffSummary.SetKey();
           //                  dm.tblTrainerBlinkersOffSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainerBlinkersOffSummary.GotoKey()) then begin
           //                     dm.tblTrainerBlinkersOffSummary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerBlinkersOffSummary);
           //                     dm.tblTrainerBlinkersOffSummary.Post();
           //                  end else begin
           //                     dm.tblTrainerBlinkersOffSummary.Append();
           //                     dm.tblTrainerBlinkersOffSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerBlinkersOffSummary);
           //                     dm.tblTrainerBlinkersOffSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('Off', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //1st Lasix
           //            try
           //               if (dm.tblHH.FieldByName('IsFirstTimeJuice').AsBoolean) then begin
           //                  dm.tblTrainerFirstJuiceSummary.IndexName := '';
           //                  dm.tblTrainerFirstJuiceSummary.SetKey();
           //                  dm.tblTrainerFirstJuiceSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainerFirstJuiceSummary.GotoKey()) then begin
           //                     dm.tblTrainerFirstJuiceSummary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerFirstJuiceSummary);
           //                     dm.tblTrainerFirstJuiceSummary.Post();
           //                  end else begin
           //                     dm.tblTrainerFirstJuiceSummary.Append();
           //                     dm.tblTrainerFirstJuiceSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerFirstJuiceSummary);
           //                     dm.tblTrainerFirstJuiceSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('1stJuice', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //2nd Lasix
           //            try
           //               if (dm.tblHH.FieldByName('IsSecondTimeJuice').AsBoolean) then begin
           //                  dm.tblTrainerSecondJuiceSummary.IndexName := '';
           //                  dm.tblTrainerSecondJuiceSummary.SetKey();
           //                  dm.tblTrainerSecondJuiceSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainerSecondJuiceSummary.GotoKey()) then begin
           //                     dm.tblTrainerSecondJuiceSummary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainerSecondJuiceSummary);
           //                     dm.tblTrainerSecondJuiceSummary.Post();
           //                  end else begin
           //                     dm.tblTrainerSecondJuiceSummary.Append();
           //                     dm.tblTrainerSecondJuiceSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainerSecondJuiceSummary);
           //                     dm.tblTrainerSecondJuiceSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('2ndJuice', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //
           //            //1-45 Days Off
           //            try
           //               if (dm.tblHH.FieldByName('DaysLast').AsInteger >= 1) and
           //                  (dm.tblHH.FieldByName('DaysLast').AsInteger <= 45) then begin
           //                  dm.tblTrainer1To45Summary.IndexName := '';
           //                  dm.tblTrainer1To45Summary.SetKey();
           //                  dm.tblTrainer1To45Summary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainer1To45Summary.GotoKey()) then begin
           //                     dm.tblTrainer1To45Summary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainer1To45Summary);
           //                     dm.tblTrainer1To45Summary.Post();
           //                  end else begin
           //                     dm.tblTrainer1To45Summary.Append();
           //                     dm.tblTrainer1To45Summary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainer1To45Summary);
           //                     dm.tblTrainer1To45Summary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('1-45', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //46-120 Days Off
           //            try
           //               if (dm.tblHH.FieldByName('DaysLast').AsInteger >= 46) and
           //                  (dm.tblHH.FieldByName('DaysLast').AsInteger <= 120) then begin
           //                  dm.tblTrainer46To120Summary.IndexName := '';
           //                  dm.tblTrainer46To120Summary.SetKey();
           //                  dm.tblTrainer46To120Summary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainer46To120Summary.GotoKey()) then begin
           //                     dm.tblTrainer46To120Summary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainer46To120Summary);
           //                     dm.tblTrainer46To120Summary.Post();
           //                  end else begin
           //                     dm.tblTrainer46To120Summary.Append();
           //                     dm.tblTrainer46To120Summary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainer46To120Summary);
           //                     dm.tblTrainer46To120Summary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('46-120', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //120+ Days Off
           //            try
           //               if (dm.tblHH.FieldByName('DaysLast').AsInteger > 120) then begin
           //                  dm.tblTrainer120PlusSummary.IndexName := '';
           //                  dm.tblTrainer120PlusSummary.SetKey();
           //                  dm.tblTrainer120PlusSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                  if (dm.tblTrainer120PlusSummary.GotoKey()) then begin
           //                     dm.tblTrainer120PlusSummary.Edit();
           //                     StatFlds(dm.tblHH, dm.tblTrainer120PlusSummary);
           //                     dm.tblTrainer120PlusSummary.Post();
           //                  end else begin
           //                     dm.tblTrainer120PlusSummary.Append();
           //                     dm.tblTrainer120PlusSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                     StatFlds(dm.tblHH, dm.tblTrainer120PlusSummary);
           //                     dm.tblTrainer120PlusSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('120Plus', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //with a workout
           //            try
           //               if (dm.tblHH.FieldByName('NbrWorksLast').AsInteger > 0) then begin
           //                  try
           //                     //1-45 with a workout
           //                     if (dm.tblHH.FieldByName('DaysLast').AsInteger >= 1) and
           //                        (dm.tblHH.FieldByName('DaysLast').AsInteger <= 45) then begin
           //                        dm.tblTrainer1To45WorkSummary.IndexName := '';
           //                        dm.tblTrainer1To45WorkSummary.SetKey();
           //                        dm.tblTrainer1To45WorkSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        if (dm.tblTrainer1To45WorkSummary.GotoKey()) then begin
           //                           dm.tblTrainer1To45WorkSummary.Edit();
           //                           StatFlds(dm.tblHH, dm.tblTrainer1To45WorkSummary);
           //                           dm.tblTrainer1To45WorkSummary.Post();
           //                        end else begin
           //                           dm.tblTrainer1To45WorkSummary.Append();
           //                           dm.tblTrainer1To45WorkSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                           StatFlds(dm.tblHH, dm.tblTrainer1To45WorkSummary);
           //                           dm.tblTrainer1To45WorkSummary.Post();
           //                        end;
           //                     end;
           //                  except
           //                     on E: Exception do begin
           //                        hLog.AddToLog('1-45W', msevException);
           //                        hLog.AddToLog(E.Message, msevException);
           //                     end;
           //                  end;
           //
           //                  //46-120 with a workout
           //                  try
           //                     if (dm.tblHH.FieldByName('DaysLast').AsInteger >= 46) and
           //                        (dm.tblHH.FieldByName('DaysLast').AsInteger <= 120) then begin
           //                        dm.tblTrainer46To120WorkSummary.IndexName := '';
           //                        dm.tblTrainer46To120WorkSummary.SetKey();
           //                        dm.tblTrainer46To120WorkSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        if (dm.tblTrainer46To120WorkSummary.GotoKey()) then begin
           //                           dm.tblTrainer46To120WorkSummary.Edit();
           //                           StatFlds(dm.tblHH, dm.tblTrainer46To120WorkSummary);
           //                           dm.tblTrainer46To120WorkSummary.Post();
           //                        end else begin
           //                           dm.tblTrainer46To120WorkSummary.Append();
           //                           dm.tblTrainer46To120WorkSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                           StatFlds(dm.tblHH, dm.tblTrainer46To120WorkSummary);
           //                           dm.tblTrainer46To120WorkSummary.Post();
           //                        end;
           //                     end;
           //                  except
           //                     on E: Exception do begin
           //                        hLog.AddToLog('46-120W', msevException);
           //                        hLog.AddToLog(E.Message, msevException);
           //                     end;
           //                  end;
           //
           //                  //120+ with a workout
           //                  try
           //                     if (dm.tblHH.FieldByName('DaysLast').AsInteger > 120) then begin
           //                        dm.tblTrainer120PlusWorkSummary.IndexName := '';
           //                        dm.tblTrainer120PlusWorkSummary.SetKey();
           //                        dm.tblTrainer120PlusWorkSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                        if (dm.tblTrainer120PlusWorkSummary.GotoKey()) then begin
           //                           dm.tblTrainer120PlusWorkSummary.Edit();
           //                           StatFlds(dm.tblHH, dm.tblTrainer120PlusWorkSummary);
           //                           dm.tblTrainer120PlusWorkSummary.Post();
           //                        end else begin
           //                           dm.tblTrainer120PlusWorkSummary.Append();
           //                           dm.tblTrainer120PlusWorkSummary.FieldByName('Trainer').AsString := dm.tblHH.FieldByName('Trainer').AsString;
           //                           StatFlds(dm.tblHH, dm.tblTrainer120PlusWorkSummary);
           //                           dm.tblTrainer120PlusWorkSummary.Post();
           //                        end;
           //                     end;
           //                  except
           //                     on E: Exception do begin
           //                        hLog.AddToLog('120PlusW', msevException);
           //                        hLog.AddToLog(E.Message, msevException);
           //                     end;
           //                  end;
           //
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('Works', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //Dam
           //            try
           //               if (dm.tblHH.FieldByName('DamName').AsString <> '') then begin
           //                  dm.tblDamSummary.IndexName := '';
           //                  dm.tblDamSummary.SetKey();
           //                  dm.tblDamSummary.FieldByName('DamName').AsString := dm.tblHH.FieldByName('DamName').AsString;
           //                  if (dm.tblDamSummary.GotoKey()) then begin
           //                     dm.tblDamSummary.Edit();
           //                     PediFlds(dm.tblHH, dm.tblRH, dm.tblDamSummary);
           //                     dm.tblDamSummary.Post();
           //                  end else begin
           //                     dm.tblDamSummary.Append();
           //                     dm.tblDamSummary.FieldByName('DamName').AsString := dm.tblHH.FieldByName('DamName').AsString;
           //                     PediFlds(dm.tblHH, dm.tblRH, dm.tblDamSummary);
           //                     dm.tblDamSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('Dam', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //Sire
           //            try
           //               if (dm.tblHH.FieldByName('SireName').AsString <> '') then begin
           //                  dm.tblSireSummary.IndexName := '';
           //                  dm.tblSireSummary.SetKey();
           //                  dm.tblSireSummary.FieldByName('SireName').AsString := dm.tblHH.FieldByName('SireName').AsString;
           //                  if (dm.tblSireSummary.GotoKey()) then begin
           //                     dm.tblSireSummary.Edit();
           //                     PediFlds(dm.tblHH, dm.tblRH, dm.tblSireSummary);
           //                     dm.tblSireSummary.Post();
           //                  end else begin
           //                     dm.tblSireSummary.Append();
           //                     dm.tblSireSummary.FieldByName('SireName').AsString := dm.tblHH.FieldByName('SireName').AsString;
           //                     PediFlds(dm.tblHH, dm.tblRH, dm.tblSireSummary);
           //                     dm.tblSireSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('Sire', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;
           //
           //            //Dam Sire
           //            try
           //               if (dm.tblHH.FieldByName('DamSireName').AsString <> '') then begin
           //                  dm.tblDamSireSummary.IndexName := '';
           //                  dm.tblDamSireSummary.SetKey();
           //                  dm.tblDamSireSummary.FieldByName('DamSireName').AsString := dm.tblHH.FieldByName('DamSireName').AsString;
           //                  if (dm.tblDamSireSummary.GotoKey()) then begin
           //                     dm.tblDamSireSummary.Edit();
           //                     PediFlds(dm.tblHH, dm.tblRH, dm.tblDamSireSummary);
           //                     dm.tblDamSireSummary.Post();
           //                  end else begin
           //                     dm.tblDamSireSummary.Append();
           //                     dm.tblDamSireSummary.FieldByName('DamSireName').AsString := dm.tblHH.FieldByName('DamSireName').AsString;
           //                     PediFlds(dm.tblHH, dm.tblRH, dm.tblDamSireSummary);
           //                     dm.tblDamSireSummary.Post();
           //                  end;
           //               end;
           //            except
           //               on E: Exception do begin
           //                  hLog.AddToLog('DamSire', msevException);
           //                  hLog.AddToLog(E.Message, msevException);
           //               end;
           //            end;

         end;
         dm.tblHH.Next();
      end;
   except

      ClearPrgStatusBars();

      try
         iniFile := TIniFile.Create(INI_FILE);
         iniFile.WriteDate('Process', 'DateStatsUpdatedTo', dtStatsUpdatedTo);
      finally
         FreeAndNil(iniFile);
      end;

      //      CloseTable(dm.tblDamSummary);
      //      CloseTable(dm.tblSireSummary);
      //      CloseTable(dm.tblDamSireSummary);
      //
      //      CloseTable(dm.tblTrainerSummary);
      //      CloseTable(dm.tblJockeySummary);

      CloseTable(dm.tblTrainerJockeySummary);

      //      CloseTable(dm.tblOwnerSummary);
      //      CloseTable(dm.tblBreederSummary);
      //
      CloseTable(dm.tblTrainerOwnerSummary);

      //      CloseTable(dm.tblTrainer1To45Summary);
      //      CloseTable(dm.tblTrainer46To120Summary);
      //      CloseTable(dm.tblTrainer120PlusSummary);
      //
      //      CloseTable(dm.tblTrainer1To45WorkSummary);
      //      CloseTable(dm.tblTrainer46To120Worksummary);
      //      CloseTable(dm.tblTrainer120PlusWorksummary);
      //
      //      CloseTable(dm.tblTrainerDebutSummary);
      //      CloseTable(dm.tblTrainerDebutTwoSummary);
      //
      //      CloseTable(dm.tblTrainerFirstJuiceSummary);
      //      CloseTable(dm.tblTrainerSecondJuiceSummary);
      //
      //      CloseTable(dm.tblTrainerBlinkersOnSummary);
      //      CloseTable(dm.tblTrainerBlinkersOffSummary);

      dm.tblHH.IndexName := '';
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      ClearPrgStatusBars();
   end;

   ClearPrgStatusBars();
   try
      iniFile := TIniFile.Create(INI_FILE);
      iniFile.WriteDate('Process', 'DateStatsUpdatedTo', dtStatsUpdatedTo);
   finally
      FreeAndNil(iniFile);
   end;
   //   CloseTable(dm.tblDamSummary);
   //   CloseTable(dm.tblSireSummary);
   //   CloseTable(dm.tblDamSireSummary);
   //
   //   CloseTable(dm.tblTrainerSummary);
   //   CloseTable(dm.tblJockeySummary);
   CloseTable(dm.tblTrainerJockeySummary);

   //   CloseTable(dm.tblOwnerSummary);
   //   CloseTable(dm.tblBreederSummary);

   CloseTable(dm.tblTrainerOwnerSummary);
   //   CloseTable(dm.tblTrainer1To45Summary);
   //   CloseTable(dm.tblTrainer46To120Summary);
   //   CloseTable(dm.tblTrainer120PlusSummary);
   //
   //   CloseTable(dm.tblTrainer1To45WorkSummary);
   //   CloseTable(dm.tblTrainer46To120Worksummary);
   //   CloseTable(dm.tblTrainer120PlusWorksummary);
   //
   //   CloseTable(dm.tblTrainerDebutSummary);
   //   CloseTable(dm.tblTrainerDebutTwoSummary);
   //
   //   CloseTable(dm.tblTrainerFirstJuiceSummary);
   //   CloseTable(dm.tblTrainerSecondJuiceSummary);
   //
   //   CloseTable(dm.tblTrainerBlinkersOnSummary);
   //   CloseTable(dm.tblTrainerBlinkersOffSummary);

   CloseTable(dm.tblRH);
   CloseTable(dm.tblHH);

end;


end.
