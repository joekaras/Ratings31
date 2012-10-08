unit UnitProcessEquibaseStats;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;

procedure ProcessEquibaseStats(sStatType: string; sYear: string; bClearTotals: boolean);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure ParseEquibaseStats(sFileName: string; sSaveFileName: string; sStatType: string; sYear: string; tbl: TDBISAMTable);
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

   sName: string;
   sKeyName: string;
   sStarts: string;
   s1st: string;
   s2nd: string;
   s3rd: string;
   sEarnings: string;
   sWinningPct: string;
   sTop3Pct: string;

   bAddLines: boolean;

   procedure InitVariables();
   begin
      sKeyName := '';
      sName := '';
      sStarts := '';
      s1st := '';
      s2nd := '';
      s3rd := '';
      sEarnings := '';
      sWinningPct := '';
      sTop3Pct := '';
   end;

   procedure SplitLine();
   begin
      try
         //|Trainer Name|Starts|1st|2nd|3rd|Earnings|Winning %|Top 3 %
         //| Steven M. Asmussen |2293|555|361|348|$14,003,202|24%|55%
         sTmp := FastReplace(sTmp, '.', '', True);
         sTmp := FastReplace(sTmp, ',', '', True);
         sTmp := FastReplace(sTmp, '%', '', True);

         Split(sTmp, '|', lstSplit);
         if lstSplit.Count > 8 then begin
            sName := StringListTrim(UpperCase(lstSplit[1]));
            sKeyName := sName;
            sStarts := StringListTrim((UpperCase(lstSplit[2])));
            s1st := StringListTrim((UpperCase(lstSplit[3])));
            s2nd := StringListTrim((UpperCase(lstSplit[4])));
            s3rd := StringListTrim((UpperCase(lstSplit[5])));
            sEarnings := StringListTrim((UpperCase(lstSplit[6])));
            sWinningPct := StringListTrim((UpperCase(lstSplit[7])));
            sTop3Pct := StringListTrim((UpperCase(lstSplit[8])));
         end;
      finally
         FreeAndNil(lstSplit);
      end;
   end;

   procedure SplitName();
   begin
      try
         //| Sam B. David, Jr. |198|44|32|21|$984,012|22%|49%
         // DAVID JR SAM B
         //| Sam B. David |198|44|32|21|$984,012|22%|49%
         // DAVID SAM B
         sName := FastReplace(sName, ' ', '|', True);

         Split(sName, '|', lstSplit);
         if lstSplit.Count = 2 then begin
            sKeyName := StringListTrim(UpperCase(lstSplit[1])) + ' ' +
               StringListTrim(UpperCase(lstSplit[0]));
         end;
         if lstSplit.Count = 3 then begin
            sKeyName :=
               StringListTrim(UpperCase(lstSplit[2])) + ' ' +
               StringListTrim(UpperCase(lstSplit[0])) + ' ' +
               StringListTrim(UpperCase(lstSplit[1]));
         end;

         if lstSplit.Count = 4 then begin
            sKeyName := StringListTrim(UpperCase(lstSplit[2])) + ' ' +
               StringListTrim(UpperCase(lstSplit[3])) + ' ' +
               StringListTrim(UpperCase(lstSplit[0])) + ' ' +
               StringListTrim(UpperCase(lstSplit[1]));
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
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;
      bAddLines := False;

      lstIn.LoadFromFile(sSaveFileName);
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         if (sTmp = '') then begin
            continue;
         end;

         if (sTmp = '|') then begin
            continue;
         end;

         if (SmartPos('ABOUT EQUIBASE | |', UpperCase(sTmp)) > 0) then begin
            bAddLines := False;
            continue;
         end;

         if ((sStatType = TRAINER_WINS) or (sStatType = TRAINER_EARNINGS)) then begin
            if (SmartPos('|TRAINER NAME|STARTS|1ST|2ND|3RD|', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
               continue;
            end;
         end;

         if ((sStatType = OWNER_WINS) or (sStatType = OWNER_EARNINGS)) then begin
            if (SmartPos('|OWNER NAME|STARTS|1ST|2ND|3RD|', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
               continue;
            end;
         end;

         if ((sStatType = JOCKEY_WINS) or (sStatType = JOCKEY_EARNINGS)) then begin
            if (SmartPos('|JOCKEY NAME|STARTS|1ST|2ND|3RD|', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
               continue;
            end;
         end;


         if (bAddLines) then begin
            lstOut.Add(sTmp);
            continue;
         end;

      end;

   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(sSaveFileName);
      FreeAndNil(lstOut);
   end;


   //
   try
      lstIn := TStringList.Create;
      lstIn.LoadFromFile(sSaveFileName);

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         InitVariables();
         SplitLine();

         if ((sStatType <> OWNER_WINS) and (sStatType <> OWNER_EARNINGS)) then begin
            SplitName();
         end;

         try
            tbl.IndexName := '';
            tbl.SetKey();
            if ((sStatType = TRAINER_WINS) or (sStatType = TRAINER_EARNINGS)) then begin
               tbl.FieldByName('Trainer').AsString := sKeyName;
            end;
            if ((sStatType = JOCKEY_WINS) or (sStatType = JOCKEY_EARNINGS)) then begin
               tbl.FieldByName('Jockey').AsString := sKeyName;
            end;
            if ((sStatType = OWNER_WINS) or (sStatType = OWNER_EARNINGS)) then begin
               tbl.FieldByName('Owner').AsString := sKeyName;
            end;

            if (tbl.GotoKey()) then begin
               tbl.Edit();
               if ((sStatType = TRAINER_WINS) or (sStatType = JOCKEY_WINS) or (sStatType = OWNER_WINS)) then begin
                  if (sYear = THIS_YEAR) then begin
                     tbl.FieldByName('WinsThisYearRank').AsInteger := iIdx + 1;
                     if (sStatType = OWNER_WINS) then begin
                        tbl.FieldByName('StartsThisYear').AsInteger := atoi(sStarts);
                        tbl.FieldByName('WinsThisYear').AsInteger := atoi(s1st);
                        tbl.FieldByName('WinPctThisYear').AsInteger := atoi(sWinningPct);
                        tbl.FieldByName('Top3WinPctThisYear').AsInteger := atoi(sTop3Pct);
                     end;
                  end;
                  if (sYear = LAST_YEAR) then begin
                     tbl.FieldByName('WinsLastYearRank').AsInteger := iIdx + 1;
                     if (sStatType = OWNER_WINS) then begin
                        tbl.FieldByName('StartsLastYear').AsInteger := atoi(sStarts);
                        tbl.FieldByName('WinsLastYear').AsInteger := atoi(s1st);
                        tbl.FieldByName('WinPctLastYear').AsInteger := atoi(sWinningPct);
                        tbl.FieldByName('Top3WinPctLastYear').AsInteger := atoi(sTop3Pct);
                     end;
                  end;
               end;

               if ((sStatType = TRAINER_EARNINGS) or (sStatType = JOCKEY_EARNINGS) or (sStatType = OWNER_EARNINGS)) then begin
                  if (sYear = THIS_YEAR) then begin
                     tbl.FieldByName('EarningsThisYearRank').AsInteger := iIdx + 1;
                     if (sStatType = OWNER_EARNINGS) then begin
                        tbl.FieldByName('StartsThisYear').AsInteger := atoi(sStarts);
                        tbl.FieldByName('WinsThisYear').AsInteger := atoi(s1st);
                        tbl.FieldByName('WinPctThisYear').AsInteger := atoi(sWinningPct);
                        tbl.FieldByName('Top3WinPctThisYear').AsInteger := atoi(sTop3Pct);
                     end;
                  end;
                  if (sYear = LAST_YEAR) then begin
                     tbl.FieldByName('EarningsLastYearRank').AsInteger := iIdx + 1;
                     if (sStatType = OWNER_EARNINGS) then begin
                        tbl.FieldByName('StartsLastYear').AsInteger := atoi(sStarts);
                        tbl.FieldByName('WinsLastYear').AsInteger := atoi(s1st);
                        tbl.FieldByName('WinPctLastYear').AsInteger := atoi(sWinningPct);
                        tbl.FieldByName('Top3WinPctLastYear').AsInteger := atoi(sTop3Pct);
                     end;
                  end;
               end;

               tbl.Post();
            end;
         except
            on E: Exception do begin
               hLog.AddToLog(E.Message, msevException);
            end;
         end;
      end;

   finally
      FreeAndNil(lstIn);
      UpdateStatusBar('');
   end;


end;

procedure ProcessEquibaseStats(sStatType: string; sYear: string; bClearTotals: boolean);
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
   iStaCnt: Integer;

begin

   hLog.AddToLog('ProcessEquibaseStats', msevOperation);

   if (bClearTotals) then begin
      try
         OpenTable(dm.tblTrainer);
         OpenTable(dm.tblJockey);
         OpenTable(dm.tblOwner);

         if ((sStatType = TRAINER_WINS) or (sStatType = TRAINER_EARNINGS)) then begin
            InitPrgBar(dm.tblTrainer.RecordCount);
            UpdateStatusBar('Processing Trainer Stats ' + sStatType + ' ' + sYear);
            dm.tblTrainer.First();
            iStaCnt := 0;
            while not dm.tblTrainer.Eof do begin
               if (iStaCnt > BATCH_SIZE) then begin
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
               end;

               IncPrgBar();
               dm.tblTrainer.Edit();
               if (sYear = LAST_YEAR) then begin
                  if (sStatType = TRAINER_EARNINGS) then begin
                     dm.tblTrainer.FieldByName('EarningsLastYearRank').AsInteger := 9999;
                  end;
                  if (sStatType = TRAINER_WINS) then begin
                     dm.tblTrainer.FieldByName('WinsLastYearRank').AsInteger := 9999;
                  end;
               end;
               if (sYear = THIS_YEAR) then begin
                  if (sStatType = TRAINER_EARNINGS) then begin
                     dm.tblTrainer.FieldByName('EarningsThisYearRank').AsInteger := 9999;
                  end;
                  if (sStatType = TRAINER_WINS) then begin
                     dm.tblTrainer.FieldByName('WinsThisYearRank').AsInteger := 9999;
                  end;
               end;
               dm.tblTrainer.Post();
               dm.tblTrainer.Next();
            end;
         end;

         if ((sStatType = JOCKEY_WINS) or (sStatType = JOCKEY_EARNINGS)) then begin
            InitPrgBar(dm.tblJockey.RecordCount);
            UpdateStatusBar('Processing Jockey Stats ' + sStatType + ' ' + sYear);
            dm.tblJockey.First();
            iStaCnt := 0;
            while not dm.tblJockey.Eof do begin
               if (iStaCnt > BATCH_SIZE) then begin
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
               end;

               IncPrgBar();
               dm.tblJockey.Edit();
               if (sYear = LAST_YEAR) then begin
                  if (sStatType = JOCKEY_EARNINGS) then begin
                     dm.tblJockey.FieldByName('EarningsLastYearRank').AsInteger := 9999;
                  end;
                  if (sStatType = JOCKEY_WINS) then begin
                     dm.tblJockey.FieldByName('WinsLastYearRank').AsInteger := 9999;
                  end;
               end;
               if (sYear = THIS_YEAR) then begin
                  if (sStatType = JOCKEY_EARNINGS) then begin
                     dm.tblJockey.FieldByName('EarningsThisYearRank').AsInteger := 9999;
                  end;
                  if (sStatType = JOCKEY_WINS) then begin
                     dm.tblJockey.FieldByName('WinsThisYearRank').AsInteger := 9999;
                  end;
               end;
               dm.tblJockey.Post();
               dm.tblJockey.Next();
            end;
         end;

         if ((sStatType = OWNER_WINS) or (sStatType = OWNER_EARNINGS)) then begin
            InitPrgBar(dm.tblOwner.RecordCount);
            UpdateStatusBar('Processing Owner Stats ' + sStatType + ' ' + sYear);
            dm.tblOwner.First();
            iStaCnt := 0;
            while not dm.tblOwner.Eof do begin
               if (iStaCnt > BATCH_SIZE) then begin
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
               end;

               IncPrgBar();
               dm.tblOwner.Edit();
               if (sYear = LAST_YEAR) then begin
                  if (sStatType = OWNER_EARNINGS) then begin
                     dm.tblOwner.FieldByName('EarningsLastYearRank').AsInteger := 9999;
                  end;
                  if (sStatType = OWNER_WINS) then begin
                     dm.tblOwner.FieldByName('WinsLastYearRank').AsInteger := 9999;
                  end;
               end;
               if (sYear = THIS_YEAR) then begin
                  if (sStatType = OWNER_EARNINGS) then begin
                     dm.tblOwner.FieldByName('EarningsThisYearRank').AsInteger := 9999;
                  end;
                  if (sStatType = OWNER_WINS) then begin
                     dm.tblOwner.FieldByName('WinsThisYearRank').AsInteger := 9999;
                  end;
               end;
               dm.tblOwner.Post();
               dm.tblOwner.Next();
            end;
         end;

      finally
         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.Commit;
         end;
         CloseTable(dm.tblTrainer);
         CloseTable(dm.tblJockey);
         CloseTable(dm.tblOwner);
      end;
   end;

   try
      OpenTable(dm.tblTrainer);
      OpenTable(dm.tblJockey);
      OpenTable(dm.tblOwner);
      try
         //******
         iAttributes := faAnyFile;
         sPath := EQUIBASE_STATS_PATH;

         //
         if ((sStatType = TRAINER_WINS) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'Top250TrainersByWinsThisYear.html';
         end;
         if ((sStatType = TRAINER_WINS) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'Top250TrainersByWinsLastYear.html';
         end;
         if ((sStatType = TRAINER_EARNINGS) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'Top250TrainersByEarningsThisYear.html';
         end;
         if ((sStatType = TRAINER_EARNINGS) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'Top250TrainersByEarningsLastYear.html';
         end;

         //
         if ((sStatType = JOCKEY_WINS) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'Top250JockeysByWinsThisYear.html';
         end;
         if ((sStatType = JOCKEY_WINS) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'Top250JockeysByWinsLastYear.html';
         end;
         if ((sStatType = JOCKEY_EARNINGS) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'Top250JockeysByEarningsThisYear.html';
         end;
         if ((sStatType = JOCKEY_EARNINGS) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'Top250JockeysByEarningsLastYear.html';
         end;

         //
         if ((sStatType = OWNER_WINS) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'Top250OwnersByWinsThisYear.html';
         end;
         if ((sStatType = OWNER_WINS) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'Top250OwnersByWinsLastYear.html';
         end;
         if ((sStatType = OWNER_EARNINGS) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'Top250OwnersByEarningsThisYear.html';
         end;
         if ((sStatType = OWNER_EARNINGS) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'Top250OwnersByEarningsLastYear.html';
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            sFileName := sPath + tsFile.Name;
            if ((sStatType = TRAINER_WINS) or (sStatType = TRAINER_EARNINGS)) then begin
               DeleteFile('TrainerStats.txt');
               ParseEquibaseStats(sFileName, 'TrainerStats.txt', sStatType, sYear, dm.tblTrainer);
            end;
            if ((sStatType = JOCKEY_WINS) or (sStatType = JOCKEY_EARNINGS)) then begin
               DeleteFile('JockeyStats.txt');
               ParseEquibaseStats(sFileName, 'JockeyStats.txt', sStatType, sYear, dm.tblJockey);
            end;
            if ((sStatType = OWNER_WINS) or (sStatType = OWNER_EARNINGS)) then begin
               DeleteFile('OwnerStats.txt');
               ParseEquibaseStats(sFileName, 'OwnerStats.txt', sStatType, sYear, dm.tblOwner);
            end;
         end;
         FindClose(tsFile);
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            FindClose(tsFile);
         end;
      end;

   finally
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblOwner);
      ClearPrgStatusBars();
   end;

end;

end.
