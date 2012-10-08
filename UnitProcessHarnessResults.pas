unit UnitProcessHarnessResults;

interface

implementation
procedure TMainForm.ProcessUSTACharts(Sender: TObject);
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

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;

      if bUseOverrideDate then begin
         dtDownloadDate := edtOverrideDate.Date;
      end else begin
         dtDownloadDate := Now();
      end;

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

procedure TMainForm.ParseUSTACharts(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
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

      OpenTableExclusive(hdm.tblRaces);
      OpenTableExclusive(hdm.tblEntries);
      OpenTableExclusive(hdm.tblProcessed);

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
      CloseTableExclusive(hdm.tblRaces);
      CloseTableExclusive(hdm.tblEntries);
      CloseTableExclusive(hdm.tblProcessed);
      FreeAndNil(lstIn);
   end;

   UpdateStatusBar('');

end;

procedure TMainForm.ProcessSCCharts(Sender: TObject);
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

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;

      if bUseOverrideDate then begin
         dtDownloadDate := edtOverrideDate.Date;
      end else begin
         dtDownloadDate := Now();
      end;

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

procedure TMainForm.ParseSCCharts(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
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

      OpenTableExclusive(hdm.tblRaces);
      OpenTableExclusive(hdm.tblEntries);
      OpenTableExclusive(hdm.tblProcessed);

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
      CloseTableExclusive(hdm.tblRaces);
      CloseTableExclusive(hdm.tblEntries);
      CloseTableExclusive(hdm.tblProcessed);
      FreeAndNil(lstIn);
   end;

   UpdateStatusBar('');

end;
//
procedure TMainForm.ProcessSCCharts(Sender: TObject);
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

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;

      if bUseOverrideDate then begin
         dtDownloadDate := edtOverrideDate.Date;
      end else begin
         dtDownloadDate := Now();
      end;

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

procedure TMainForm.ParseSCCharts(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
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

      OpenTableExclusive(hdm.tblRaces);
      OpenTableExclusive(hdm.tblEntries);
      OpenTableExclusive(hdm.tblProcessed);

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
      CloseTableExclusive(hdm.tblRaces);
      CloseTableExclusive(hdm.tblEntries);
      CloseTableExclusive(hdm.tblProcessed);
      FreeAndNil(lstIn);
   end;

   UpdateStatusBar('');

end;

end.
