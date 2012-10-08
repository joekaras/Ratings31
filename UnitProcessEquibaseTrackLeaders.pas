unit UnitProcessEquibaseTrackLeaders;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;

procedure ProcessEquibaseTrackLeaders();

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure ParseEquibaseTrackLeaders(sFileName: string; sSaveFileName: string; tbl: TDBISAMTable);
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
   iRank: integer;

   iBegPos: integer;
   sTrkCode: string;
   sType: string;

   bAddLines: boolean;
   sBaseFileName: string;

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
         //| Ricardo Jaime  |135 |37 |22 |23 |$317,940
         sTmp := FastReplace(sTmp, '.', '', True);
         sTmp := FastReplace(sTmp, ',', '', True);

         Split(sTmp, '|', lstSplit);
         if lstSplit.Count > 6 then begin
            sName := StringListTrim(UpperCase(lstSplit[1]));
            sKeyName := sName;
            sStarts := StringListTrim(UpperCase(lstSplit[2]));
            s1st := StringListTrim(UpperCase(lstSplit[3]));
            s2nd := StringListTrim(UpperCase(lstSplit[4]));
            s3rd := StringListTrim(UpperCase(lstSplit[5]));
            sEarnings := StringListTrim(UpperCase(lstSplit[6]));
            sEarnings := FastReplace(sTmp, '$', '', True)
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
            sKeyName := Trim(UpperCase(lstSplit[1])) + ' ' +
               StringListTrim(UpperCase(lstSplit[0]));
         end;
         if lstSplit.Count = 3 then begin
            sKeyName := StringListTrim(UpperCase(lstSplit[2])) + ' ' +
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

         if (SmartPos('|NAME |STARTS |1ST |2ND |3RD |EARNINGS', UpperCase(sTmp)) > 0) then begin
            bAddLines := True;
            continue;
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

      iRank := 1;
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         InitVariables();
         SplitLine();
         SplitName();

         try

            sBaseFileName := UpperCase(Trim(FastReplace(sFileName, EQUIBASE_TRACK_LEADERS_PATH, ' ', False)));

            iBegPos := SmartPos('-', sBaseFileName) - 1;
            iEndPos := SmartPos('.', sBaseFileName) - 1;

            sTrkCode := CopyStr(sBaseFileName, (iLen + 1), iBegPos);
            sType := CopyStr(sBaseFileName, iBegPos + 2, 1);

            tbl.IndexName := '';
            tbl.SetKey();
            tbl.FieldByName('TrkCode').AsString := sTrkCode;

            if (SmartPos('CLIFTON', sKeyName) > 0) then begin
               if (SmartPos('BERRY', sKeyName) > 0) then begin
                  sKeyName := 'BERRY M CLIFTON';
               end;
            end;
            tbl.FieldByName('Name').AsString := sKeyName;
            tbl.FieldByName('Type').AsString := sType;
            if (tbl.GotoKey()) then begin
               tbl.Edit();
               tbl.FieldByName('Starts').AsInteger := atoi(sStarts);
               tbl.FieldByName('Wins').AsInteger := atoi(s1st);
               tbl.FieldByName('Plcs').AsInteger := atoi(s2nd);
               tbl.FieldByName('Shos').AsInteger := atoi(s3rd);
               tbl.FieldByName('Earnings').AsFloat := atof(sEarnings);
               tbl.FieldByName('Rank').AsInteger := iRank;
               Inc(iRank);
               tbl.Post();
            end else begin
               tbl.Append();
               tbl.FieldByName('TrkCode').AsString := sTrkCode;
               tbl.FieldByName('Name').AsString := sKeyName;
               tbl.FieldByName('Type').AsString := sType;
               tbl.FieldByName('Starts').AsInteger := atoi(sStarts);
               tbl.FieldByName('Wins').AsInteger := atoi(s1st);
               tbl.FieldByName('Plcs').AsInteger := atoi(s2nd);
               tbl.FieldByName('Shos').AsInteger := atoi(s3rd);
               tbl.FieldByName('Earnings').AsFloat := atof(sEarnings);
               tbl.FieldByName('Rank').AsInteger := iRank;
               Inc(iRank);
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

procedure ProcessEquibaseTrackLeaders();
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

   hLog.AddToLog('ProcessEquibaseTrackLeaders', msevOperation);

   try
      try
         dm.tblTrackLeaders.EmptyTable();
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      OpenTable(dm.tblTrackLeaders);
      try
         // prgBar.Position := 0;
         //pnlPrgBar.Visible := False;

          //******
         iAttributes := faAnyFile;
         sPath := EQUIBASE_TRACK_LEADERS_PATH;

         //
         sSearch := sPath + '*.html';

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            sFileName := sPath + tsFile.Name;
            DeleteFile('TrackStats.txt');
            ParseEquibaseTrackLeaders(sFileName, 'TrainerStats.txt', dm.tblTrackLeaders);
         end;
         while (FindNext(tsFile) = 0) do begin
            sFileName := sPath + tsFile.Name;
            DeleteFile('TrackStats.txt');
            ParseEquibaseTrackLeaders(sFileName, 'TrainerStats.txt', dm.tblTrackLeaders);
         end;

         FindClose(tsFile);
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            FindClose(tsFile);
         end;
      end;

   finally
      CloseTable(dm.tblTrackLeaders);
      ClearPrgStatusBars();
   end;

end;

end.
