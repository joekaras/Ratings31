unit UnitProcessBloodHorseSireLists;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;

procedure ProcessBloodHorseSireLists(db: TDBISAMDatabase; tblS: TDBISAMTable; sStatType: string; sYear: string; bClearTotals: boolean);

implementation
uses FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog,
   FormMain, UnitCommonCode;

procedure ParseBloodHorseSireLists(sFileName: string; sSaveFileName: string; sStatType: string; sYear: string; tbl: TDBISAMTable);
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
   sTmpName: string;
   sStarts: string;
   sWins: string;
   sStudFee: string;
   sEarnings: string;
   sWinningPct: string;

   sRank: string;
   sPctOfEarnings: string;

   bAddLines: boolean;

   procedure InitVariables();
   begin
      sRank := '';
      sName := '';
      sStarts := '';
      sWins := '';
      sStudFee := '';
      sEarnings := '';
      sWinningPct := '';
      sPctOfEarnings := '';
      sTmpName := '';
   end;

   procedure SplitJuvenileLine();
   begin
      try
         //General
         //| 1  | ELUSIVE QUALITY(93, Gone West), Gainsborough Farm, KY   |  $100,000  | 137/80  | 5/11  | 2/1  | Smarty Jones, $7,563,535  | $10,756,659
         sTmp := FastReplace(sTmp, '.', '', True);
         sTmp := FastReplace(sTmp, ',', '', True);
         sTmp := FastReplace(sTmp, '%', '', True);
         sTmp := FastReplace(sTmp, '$', '', True);

         Split(sTmp, '|', lstSplit);

         if lstSplit.Count > 8 then begin
            sRank := StringListTrim(UpperCase(lstSplit[1]));
            sTmpName := StringListTrim(UpperCase(lstSplit[2]));
            if SmartPos('(', sTmpName) > 0 then begin
               iEndPos := SmartPos('(', sTmpName);
               sName := Trim(CopyStr(sTmpName, 1, iEndPos - 1));
            end else begin
               sName := Trim(sTmpName);
            end;
         end;

      finally
         FreeAndNil(lstSplit);
      end;

   end;

   procedure SplitGeneralLine();
   begin
      try
         //Juvenile
         //| 1  | STORM CAT(83, Storm Bird), Overbrook Farm, KY   |  $500,000  | 67  | 32/16  | 4/6  | Sweet Catomine, $799,800  | $1,927,589
         sTmp := FastReplace(sTmp, '.', '', True);
         sTmp := FastReplace(sTmp, ',', '', True);
         sTmp := FastReplace(sTmp, '%', '', True);
         sTmp := FastReplace(sTmp, '$', '', True);

         Split(sTmp, '|', lstSplit);

         if lstSplit.Count > 8 then begin
            sRank := StringListTrim(UpperCase(lstSplit[1]));
            sTmpName := StringListTrim(UpperCase(lstSplit[2]));
            if SmartPos('(', sTmpName) > 0 then begin
               iEndPos := SmartPos('(', sTmpName);
               sName := Trim(CopyStr(sTmpName, 1, iEndPos - 1));
            end else begin
               sName := Trim(sTmpName);
            end;
         end;
      finally
         FreeAndNil(lstSplit);
      end;
   end;

   procedure SplitTurfLine();
   begin
      try
         //Turf
         //|75|Concorde's Tune (1989, Concorde Bound)|92/39|49/12|5/4| $645,132|33%

         sTmp := FastReplace(sTmp, '.', '', True);
         sTmp := FastReplace(sTmp, ',', '', True);
         sTmp := FastReplace(sTmp, '%', '', True);
         sTmp := FastReplace(sTmp, '$', '', True);

         Split(sTmp, '|', lstSplit);

         if lstSplit.Count > 7 then begin
            sRank := StringListTrim(UpperCase(lstSplit[1]));
            sTmpName := StringListTrim(UpperCase(lstSplit[2]));
            sEarnings := StringListTrim(UpperCase(lstSplit[6]));
            sPctOfEarnings := StringListTrim(UpperCase(lstSplit[7]));
            if SmartPos('(', sTmpName) > 0 then begin
               iEndPos := SmartPos('(', sTmpName);
               sName := Trim(CopyStr(sTmpName, 1, iEndPos - 1));
            end else begin
               sName := Trim(sTmpName);
            end;
         end;
      finally
         FreeAndNil(lstSplit);
      end;
   end;

   procedure SplitAEILine();
   begin
      try
         //Turf
         //|75|Concorde's Tune (1989, Concorde Bound)|92/39|49/12|5/4| $645,132|33%

         sTmp := FastReplace(sTmp, '.', '', True);
         sTmp := FastReplace(sTmp, ',', '', True);
         sTmp := FastReplace(sTmp, '%', '', True);
         sTmp := FastReplace(sTmp, '$', '', True);

         Split(sTmp, '|', lstSplit);

         if lstSplit.Count > 7 then begin
            sRank := StringListTrim(UpperCase(lstSplit[1]));
            sTmpName := StringListTrim(UpperCase(lstSplit[2]));
            sEarnings := StringListTrim(UpperCase(lstSplit[6]));
            sPctOfEarnings := StringListTrim(UpperCase(lstSplit[7]));
            if SmartPos('(', sTmpName) > 0 then begin
               iEndPos := SmartPos('(', sTmpName);
               sName := Trim(CopyStr(sTmpName, 1, iEndPos - 1));
            end else begin
               sName := Trim(sTmpName);
            end;
         end;
      finally
         FreeAndNil(lstSplit);
      end;
   end;

   procedure SplitAWLine();
   begin
      try
         //Turf
         //|75|Concorde's Tune (1989, Concorde Bound)|92/39|49/12|5/4| $645,132|33%

         sTmp := FastReplace(sTmp, '.', '', True);
         sTmp := FastReplace(sTmp, ',', '', True);
         sTmp := FastReplace(sTmp, '%', '', True);
         sTmp := FastReplace(sTmp, '$', '', True);

         Split(sTmp, '|', lstSplit);

         if lstSplit.Count > 7 then begin
            sRank := StringListTrim(UpperCase(lstSplit[1]));
            sTmpName := StringListTrim(UpperCase(lstSplit[2]));
            sEarnings := StringListTrim(UpperCase(lstSplit[6]));
            sPctOfEarnings := StringListTrim(UpperCase(lstSplit[7]));
            if SmartPos('(', sTmpName) > 0 then begin
               iEndPos := SmartPos('(', sTmpName);
               sName := Trim(CopyStr(sTmpName, 1, iEndPos - 1));
            end else begin
               sName := Trim(sTmpName);
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

         if (SmartPos('COMPLETE LIST OF', UpperCase(sTmp)) > 0) then begin
            bAddLines := False;
            continue;
         end;

         if (SmartPos('INFORMATION USED TO', UpperCase(sTmp)) > 0) then begin
            bAddLines := False;
            continue;
         end;

         if (sStatType = TURF_SIRES) then begin
            if (SmartPos('ERNGS', UpperCase(sTmp)) > 0) then begin
               bAddLines := True;
               continue;
            end;
         end;

         if (sStatType = GENERAL_SIRES) then begin
            if (SmartPos('EARNINGS', LeftStr(UpperCase(sTmp), 8)) > 0) then begin
               bAddLines := True;
               continue;
            end;
         end;

         if (sStatType = JUVENILE_SIRES) then begin
            if (SmartPos('EARNINGS', LeftStr(UpperCase(sTmp), 8)) > 0) then begin
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

         if (sStatType = TURF_SIRES) then begin
            SplitTurfLine();
         end;

         if (sStatType = GENERAL_SIRES) then begin
            SplitGeneralLine();
         end;

         if (sStatType = JUVENILE_SIRES) then begin
            SplitJuvenileLine();
         end;

         if (sStatType = AEI_SIRES) then begin
            SplitAEILine();
         end;
         if (sStatType = AW_SIRES) then begin
            SplitAWLine();
         end;

         try
            tbl.IndexName := '';
            tbl.SetKey();
            tbl.FieldByName('SireName').Value := Trim(sName);

            if (Length(sName) = 18) then begin
               sName := LeftStr(sName, 17);
            end;

            if (tbl.GotoKey()) then begin

               tbl.Edit();
               if ((sStatType = TURF_SIRES) and (sYear = LAST_YEAR)) then begin
                  tbl.FieldByName('TurfLastYearRank').AsInteger := atoi(sRank);
                  tbl.FieldByName('TurfLastYearPctOfEarnings').AsInteger := atoi(sPctOfEarnings);
               end;
               if ((sStatType = TURF_SIRES) and (sYear = THIS_YEAR)) then begin
                  tbl.FieldByName('TurfThisYearRank').AsInteger := atoi(sRank);
                  tbl.FieldByName('TurfThisYearPctOfEarnings').AsInteger := atoi(sPctOfEarnings);
               end;

               if ((sStatType = GENERAL_SIRES) and (sYear = LAST_YEAR)) then begin
                  tbl.FieldByName('GeneralLastYearRank').AsInteger := atoi(sRank);
               end;
               if ((sStatType = GENERAL_SIRES) and (sYear = THIS_YEAR)) then begin
                  tbl.FieldByName('GeneralThisYearRank').AsInteger := atoi(sRank);
               end;

               if ((sStatType = JUVENILE_SIRES) and (sYear = LAST_YEAR)) then begin
                  tbl.FieldByName('JuvenileLastYearRank').AsInteger := atoi(sRank);
               end;
               if ((sStatType = JUVENILE_SIRES) and (sYear = THIS_YEAR)) then begin
                  tbl.FieldByName('JuvenileThisYearRank').AsInteger := atoi(sRank);
               end;

               //               if ((sStatType = AW_SIRES) and (sYear = LAST_YEAR)) then begin
               //                  tbl.FieldByName('ArtificialLastYearRank').AsInteger := atoi(sRank);
               //               end;
               //               if ((sStatType = AW_SIRES) and (sYear = THIS_YEAR)) then begin
               //                  tbl.FieldByName('ArtificialThisYearRank').AsInteger := atoi(sRank);
               //               end;
               //
               //               if ((sStatType = AEI_SIRES) and (sYear = LAST_YEAR)) then begin
               //
               //                  if (tbl.FieldByName('AEI').AsFloat > 0) then begin
               //                     tbl.FieldByName('AEI').AsFloat := atof(sRank);
               //                  end;
               //
               //               end;
               //               if ((sStatType = AEI_SIRES) and (sYear = THIS_YEAR)) then begin
               //                  tbl.FieldByName('AEI').AsFloat := atof(sRank);
               //               end;
               tbl.Post();
            end else begin
               hLog.AddToLog(sStatType + ' ' + sYear + ' ' + sName, msevOperation);
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

procedure ProcessBloodHorseSireLists(db: TDBISAMDatabase; tblS: TDBISAMTable; sStatType: string; sYear: string; bClearTotals: boolean);
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

   hLog.LogFileName := LOG_PATH + BLOODHORSE_LOG_FILENAME;
   hLog.AddToLog('ProcessBloodHorseSireLists ' + sStatType + ' ' + sYear, msevOperation);

   if (bClearTotals) then begin
      try
         OpenTable(tblS);

         try
            InitPrgBar(tblS.RecordCount);
            UpdateStatusBar('Processing Sire Stats ' + sStatType + ' ' + sYear);
            tblS.First();
            if not db.InTransaction then begin
               db.StartTransaction();
            end;

            iStaCnt := 0;
            while not tblS.Eof do begin
               if (iStaCnt > BATCH_SIZE) then begin
                  Application.ProcessMessages();
                  iStaCnt := 0;
                  if not db.InTransaction then begin
                     db.StartTransaction();
                  end else begin
                     if db.InTransaction then begin
                        db.Commit;
                     end;
                  end;
               end else begin
                  Application.ProcessMessages();
                  Inc(iStaCnt);
               end;

               IncPrgBar();
               tblS.Edit();
               if (sYear = LAST_YEAR) then begin
                  if (sStatType = TURF_SIRES) then begin
                     tblS.FieldByName('TurfLastYearRank').AsInteger := 0;
                  end;
                  if (sStatType = GENERAL_SIRES) then begin
                     tblS.FieldByName('GeneralLastYearRank').AsInteger := 0;
                  end;
                  if (sStatType = JUVENILE_SIRES) then begin
                     tblS.FieldByName('JuvenileLastYearRank').AsInteger := 0;
                  end;

                  if (sStatType = AW_SIRES) then begin
                     tblS.FieldByName('ArtificialLastYearRank').AsInteger := 0;
                  end;

               end;
               if (sYear = THIS_YEAR) then begin
                  if (sStatType = TURF_SIRES) then begin
                     tblS.FieldByName('TurfThisYearRank').AsInteger := 0;
                  end;
                  if (sStatType = GENERAL_SIRES) then begin
                     tblS.FieldByName('GeneralThisYearRank').AsInteger := 0;
                  end;
                  if (sStatType = JUVENILE_SIRES) then begin
                     tblS.FieldByName('JuvenileThisYearRank').AsInteger := 0;
                  end;
                  if (sStatType = AW_SIRES) then begin
                     tblS.FieldByName('ArtificialThisYearRank').AsInteger := 0;
                  end;
               end;
               tblS.Post();
               tblS.Next();
            end;

         except
            on E: Exception do begin
               if db.InTransaction then begin
                  db.Rollback;
               end;
               hLog.AddToLog(E.Message, msevException);
            end;
         end;
      finally
         if db.InTransaction then begin
            db.Commit;
         end;
         CloseTable(tblS);
      end;
   end;

   try
      OpenTable(tblS);
      try
         //******
         iAttributes := faAnyFile;
         sPath := BLOODHORSE_SIRES_PATH;

         //
         if ((sStatType = TURF_SIRES) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'TurfSiresThisYear.html';
         end;
         if ((sStatType = TURF_SIRES) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'TurfSiresLastYear.html';
         end;
         if ((sStatType = AEI_SIRES) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'AEISiresThisYear.html';
         end;
         if ((sStatType = AEI_SIRES) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'AEISiresLastYear.html';
         end;
         if ((sStatType = AW_SIRES) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'AWSiresThisYear.html';
         end;
         if ((sStatType = AW_SIRES) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'AWSiresLastYear.html';
         end;
         if ((sStatType = GENERAL_SIRES) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'GeneralSiresThisYear.html';
         end;
         if ((sStatType = GENERAL_SIRES) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'GeneralSiresLastYear.html';
         end;

         if ((sStatType = JUVENILE_SIRES) and (sYear = THIS_YEAR)) then begin
            sSearch := sPath + 'JuvenileSiresThisYear.html';
         end;
         if ((sStatType = JUVENILE_SIRES) and (sYear = LAST_YEAR)) then begin
            sSearch := sPath + 'JuvenileSiresLastYear.html';
         end;


         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            sFileName := sPath + tsFile.Name;
            if (sStatType = TURF_SIRES) then begin
               DeleteFile('TurfSires.txt');
               ParseBloodHorseSireLists(sFileName, 'TurfSires.txt', sStatType, sYear, tblS);
            end;
            if (sStatType = AEI_SIRES) then begin
               DeleteFile('TurfSires.txt');
               ParseBloodHorseSireLists(sFileName, 'AEISires.txt', sStatType, sYear, tblS);
            end;
            if (sStatType = AW_SIRES) then begin
               DeleteFile('AWSires.txt');
               ParseBloodHorseSireLists(sFileName, 'AWSires.txt', sStatType, sYear, tblS);
            end;
            if (sStatType = GENERAL_SIRES) then begin
               DeleteFile('GeneralSires.txt');
               ParseBloodHorseSireLists(sFileName, 'GeneralSires.txt', sStatType, sYear, tblS);
            end;
            if (sStatType = JUVENILE_SIRES) then begin
               DeleteFile('JuvenileSires.txt');
               ParseBloodHorseSireLists(sFileName, 'JuvenileSires.txt', sStatType, sYear, tblS);
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
      CloseTable(tblS);
      ClearPrgStatusBars();
      hLog.LogFileName := LOG_PATH + BLOODHORSE_LOG_FILENAME;
   end;

end;

end.
