unit UnitDownLoadHarnessAxcis;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;

procedure DownloadAxcisBuggy();
procedure DownloadAxcisFlashNet();
procedure DownloadAxcisForJimFlashNet();

   
implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   UnitCommonCode, ESBMaths2, StrMan;

procedure DownloadAxcisBuggy();
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   bMultiTrack: boolean;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;

begin

   hLog.AddToLog('DownloadAxcisBuggy', msevOperation);


   CheckProxy();
   OpenTableExclusive(dm.tblTrack);
   OpenTableExclusive(dm.tblVendor);

   try
      //lblServerPath.Visible := True;
      //lblLocalPath.Visible := True;

      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         IncPrgBar();
         if (dm.tblTrack.FieldByName('Type').AsString = 'H') then begin
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'TSN';
            dm.tblVendor.FieldByName('Product').AsString := 'Axcis Trackmaster PP';
            if dm.tblVendor.GotoKey() then begin
               sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
               sTsnTrkCode := Trim(sTsnTrkCode);

               //            sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sNormalTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
               sNormalTrkCode := Trim(sNormalTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := AXCIS_BUGGY_PATH;

               sTrkCode := sNormalTrkCode;

               bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               idHTTP.Request.Host := INTERNET_AXCIS_HOME_PAGE;
               idHTTP.Request.Username := INTERNET_AXCIS_USER_CODE;
               idHTTP.Request.Password := INTERNET_AXCIS_PASS_WORD;


               if bUseOverrideDate then begin
                  dtDownloadDate := gedtOverrideDate;
               end else begin
                  dtDownloadDate := Now();
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               if (bMultiTrack) then begin
                  sFileName := Trim(sTrkCode) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'r.' + sDownloadFileType;
               end else begin
                  sFileName := sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'r.' + sDownloadFileType;
               end;

               sDownloadFullFileName := sDownloadLocation + sFileName;

               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 30000) then begin
                     DeleteFile(sDownloadFullFileName);
                  end;
               end;
               FindClose(tsFile);

               sServerFullFileName := sBaseImportPath + sFileName;
               sServerFullFileName := LowerCase(sServerFullFileName);

               if not FileExists(sDownloadFullFileName) then begin
                  MainForm.lblServerPath.Caption := sServerFullFileName;
                  MainForm.lblLocalPath.Caption := sDownloadFullFileName;
                  MainForm.DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                  MainForm.staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;

               MainForm.ClearPrgStatusBars();
            end;
         end;
         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;
      MainForm.lblServerPath.Caption := '';
      MainForm.lblLocalPath.Caption := '';
   except
      dm.tblTrack.Filtered := False;
      dm.tblTrack.Filter := '';
      dm.tblTrack.Filtered := False;
      MainForm.idHTTP.Disconnect;
      CloseTableExclusive(dm.tblTrack);
      CloseTableExclusive(dm.tblVendor);
      MainForm.lblServerPath.Caption := '';
      MainForm.lblLocalPath.Caption := '';
      MainForm.lblServerPath.Visible := False;
      MainForm.lblLocalPath.Visible := False;
      Exit;
   end;

   MainForm.idHTTP.Disconnect;
   dm.tblTrack.Filtered := False;
   dm.tblTrack.Filter := '';
   dm.tblTrack.Filtered := False;
   CloseTableExclusive(dm.tblTrack);
   CloseTableExclusive(dm.tblVendor);
   MainForm.lblServerPath.Caption := '';
   MainForm.lblLocalPath.Caption := '';
   MainForm.lblServerPath.Visible := False;
   MainForm.lblLocalPath.Visible := False;

end;



procedure DownloadAxcisForJimFlashNet();
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   bMultiTrack: boolean;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;

begin

   hLog.AddToLog('DownloadAxcisJim', msevOperation);


   MainForm.CheckProxy();
   OpenTableExclusive(dm.tblTrack);
   OpenTableExclusive(dm.tblVendor);

   try
      MainForm.lblServerPath.Visible := True;
      MainForm.lblLocalPath.Visible := True;

      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         MainForm.IncPrgBar();
         if (dm.tblTrack.FieldByName('Type').AsString = 'H') then begin
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'TSN';
            dm.tblVendor.FieldByName('Product').AsString := 'Axcis Trackmaster FLASH PDF';
            if dm.tblVendor.GotoKey() then begin
               sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
               sTsnTrkCode := Trim(sTsnTrkCode);

               //            sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sNormalTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
               sNormalTrkCode := Trim(sNormalTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := PDF_JIM_REPORT_PATH;

               sTrkCode := sNormalTrkCode;

               bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               MainForm.idHTTP.Request.Host := INTERNET_AXCIS_HOME_PAGE;
               MainForm.idHTTP.Request.Username := INTERNET_AXCIS_USER_CODE;
               MainForm.idHTTP.Request.Password := INTERNET_AXCIS_PASS_WORD;


               if bUseOverrideDate then begin
                  dtDownloadDate := gedtOverrideDate;
               end else begin
                  dtDownloadDate := Now();
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               if (bMultiTrack) then begin
                  sFileName := Trim(sTrkCode) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'f.' + sDownloadFileType;
               end else begin
                  sFileName := sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'f.' + sDownloadFileType;
               end;

               sDownloadFullFileName := sDownloadLocation + sFileName;

               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 30000) then begin
                     DeleteFile(sDownloadFullFileName);
                  end;
               end;
               FindClose(tsFile);

               sServerFullFileName := sBaseImportPath + sFileName;
               sServerFullFileName := LowerCase(sServerFullFileName);

               if not FileExists(sDownloadFullFileName) then begin
                  MainForm.lblServerPath.Caption := sServerFullFileName;
                  MainForm.lblLocalPath.Caption := sDownloadFullFileName;
                  MainForm.DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                  MainForm.staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;

               MainForm.ClearPrgStatusBars();
            end;
         end;
         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;
      MainForm.lblServerPath.Caption := '';
      MainForm.lblLocalPath.Caption := '';
   except
      dm.tblTrack.Filtered := False;
      dm.tblTrack.Filter := '';
      dm.tblTrack.Filtered := False;
      MainForm.idHTTP.Disconnect;
      CloseTableExclusive(dm.tblTrack);
      CloseTableExclusive(dm.tblVendor);
      MainForm.lblServerPath.Caption := '';
      MainForm.lblLocalPath.Caption := '';
      MainForm.lblServerPath.Visible := False;
      MainForm.lblLocalPath.Visible := False;
      Exit;
   end;

   MainForm.idHTTP.Disconnect;
   dm.tblTrack.Filtered := False;
   dm.tblTrack.Filter := '';
   dm.tblTrack.Filtered := False;
   CloseTableExclusive(dm.tblTrack);
   CloseTableExclusive(dm.tblVendor);
   MainForm.lblServerPath.Caption := '';
   MainForm.lblLocalPath.Caption := '';
   MainForm.lblServerPath.Visible := False;
   MainForm.lblLocalPath.Visible := False;

end;


procedure DownloadAxcisFlashNet();
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   bMultiTrack: boolean;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;

begin

   hLog.AddToLog('DownloadAxcisFlashNet', msevOperation);


   MainForm.CheckProxy();
   OpenTableExclusive(dm.tblTrack);
   OpenTableExclusive(dm.tblVendor);

   try
      MainForm.lblServerPath.Visible := True;
      MainForm.lblLocalPath.Visible := True;

      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         MainForm.IncPrgBar();
         if (dm.tblTrack.FieldByName('Type').AsString = 'H') then begin
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'TSN';
            dm.tblVendor.FieldByName('Product').AsString := 'Axcis Trackmaster FLASH HTM';
            if dm.tblVendor.GotoKey() then begin
               sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
               sTsnTrkCode := Trim(sTsnTrkCode);

               //            sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sNormalTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
               sNormalTrkCode := Trim(sNormalTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := AXCIS_BUGGY_PATH;

               sTrkCode := sNormalTrkCode;

               bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               MainForm.idHTTP.Request.Host := INTERNET_AXCIS_HOME_PAGE;
               MainForm.idHTTP.Request.Username := INTERNET_AXCIS_USER_CODE;
               MainForm.idHTTP.Request.Password := INTERNET_AXCIS_PASS_WORD;


               if bUseOverrideDate then begin
                  dtDownloadDate := gedtOverrideDate;
               end else begin
                  dtDownloadDate := Now();
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               if (bMultiTrack) then begin
                  sFileName := Trim(sTrkCode) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'f.' + sDownloadFileType;
               end else begin
                  sFileName := sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'f.' + sDownloadFileType;
               end;

               sDownloadFullFileName := sDownloadLocation + sFileName;

               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 30000) then begin
                     DeleteFile(sDownloadFullFileName);
                  end;
               end;
               FindClose(tsFile);

               sServerFullFileName := sBaseImportPath + sFileName;
               sServerFullFileName := LowerCase(sServerFullFileName);

               if not FileExists(sDownloadFullFileName) then begin
                  MainForm.lblServerPath.Caption := sServerFullFileName;
                  MainForm.lblLocalPath.Caption := sDownloadFullFileName;
                  MainForm.DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                  MainForm.staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;

               MainForm.ClearPrgStatusBars();
            end;
         end;
         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;
      MainForm.lblServerPath.Caption := '';
      MainForm.lblLocalPath.Caption := '';
   except
      dm.tblTrack.Filtered := False;
      dm.tblTrack.Filter := '';
      dm.tblTrack.Filtered := False;
      MainForm.idHTTP.Disconnect;
      CloseTableExclusive(dm.tblTrack);
      CloseTableExclusive(dm.tblVendor);
      MainForm.lblServerPath.Caption := '';
      MainForm.lblLocalPath.Caption := '';
      MainForm.lblServerPath.Visible := False;
      MainForm.lblLocalPath.Visible := False;
      Exit;
   end;

   MainForm.idHTTP.Disconnect;
   dm.tblTrack.Filtered := False;
   dm.tblTrack.Filter := '';
   dm.tblTrack.Filtered := False;
   CloseTableExclusive(dm.tblTrack);
   CloseTableExclusive(dm.tblVendor);
   MainForm.lblServerPath.Caption := '';
   MainForm.lblLocalPath.Caption := '';
   MainForm.lblServerPath.Visible := False;
   MainForm.lblLocalPath.Visible := False;
end;

end.

  
  
