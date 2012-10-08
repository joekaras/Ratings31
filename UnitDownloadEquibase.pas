unit UnitDownloadEquibase;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, ESBMaths2, StrMan;

procedure TMainForm.DownloadEquibaseResults(Sender: TObject);
var
   sTrkCode: string;
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
   sBuf: string;
   msText: TMemoryStream;

   procedure AddHTMLResultsToEquibase();
   begin

      dm.tblEquibase.IndexName := '';
      dm.tblEquibase.SetKey();
      dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblEquibase.GotoKey()) then begin
         dm.tblEquibase.Edit();

         dm.tblEquibase.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();

      end else begin
         dm.tblEquibase.Append();
         dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;

         dm.tblEquibase.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();
      end;

   end;

begin

   hLog.AddToLog('DownloadEquibaseResults', msevOperation);
   CheckProxy();

   //   if LOCATION = 'Home' then begin
   //      idHTTP.ProxyParams.ProxyServer := 'localhost';
   //      idHTTP.ProxyParams.ProxyPort := 8080;
   //   end;

   OpenTableExclusive(dm.tblTrack);
   OpenTableExclusive(dm.tblVendor);
   OpenTableExclusive(dm.tblEquibase);
   OpenTableExclusive(dm.tblProcessed);

   //*****
   try

      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      InitPrgBar(dm.tblTrack.RecordCount);
      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download Equibase Results';
         Application.ProcessMessages();
         try
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'EQUIBASE';
            dm.tblVendor.FieldByName('Product').AsString := 'Results';
            if (dm.tblVendor.GotoKey()) then begin
               sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sTrkCode := Trim(sTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := EQUIBASE_RESULTS_PATH;

               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               idHTTP.Request.Host := INTERNET_EQUIBASE_HOME_PAGE;

               if bUseOverrideDate then begin
                  dtDownloadDate := gedtOverrideDate;
               end else begin
                  dtDownloadDate := Now() - 1;
               end;
               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

               //
               dm.tblProcessed.IndexName := '';
               dm.tblProcessed.SetKey();
               dm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
               dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
               if (not dm.tblProcessed.GotoKey()) then begin
                  dm.tblTrack.Next();
                  continue;
               end else begin
                  if (dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean) then begin
                     dm.tblTrack.Next();
                     continue;
                  end;
               end;
               //

               sFileName := sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '-' + Trim(sTrkCode) + '.' + sDownloadFileType;
               sDownloadFullFileName := sDownloadLocation + sFileName;

               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < MIN_EQUIBASE_FILE_SIZE) then begin
                     DeleteFile(sDownloadFullFileName);
                     Application.ProcessMessages();
                  end;
               end;
               FindClose(tsFile);

               sServerFullFileName := sBaseImportPath + 'TRK=' + sTrkCode;
               if (dm.tblTrack.FieldByName('Country').AsString = 'USA') then begin
                  sServerFullFileName := sServerFullFileName + '&CY=USA';
               end;
               if (dm.tblTrack.FieldByName('Country').AsString = 'CAN') then begin
                  sServerFullFileName := sServerFullFileName + '&CY=CAN';
               end;
               sServerFullFileName := sServerFullFileName + '&DATE=';
               sServerFullFileName := sServerFullFileName + sm.Str(wMonth, 2) + '/' + sm.Str(wDay, 2) + '/' + sm.Str(wYear, 4);
               sServerFullFileName := sServerFullFileName + '&STYLE=EQB';

               lblServerPath.Caption := sServerFullFileName;
               lblLocalPath.Caption := sDownloadFullFileName;

               if FileExists(sDownloadFullFileName) then begin
                  AddHTMLResultsToEquibase();
               end else begin
                  if (DownLoadFile(sServerFullFileName, sDownloadFullFileName)) then begin
                     AddHTMLResultsToEquibase();
                     staBar.SimpleText := sDownloadFullFileName;
                     Application.ProcessMessages();
                  end;
               end;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;

   except
      CloseTableExclusive(dm.tblEquibase);
      CloseTableExclusive(dm.tblTrack);
      CloseTableExclusive(dm.tblVendor);
      CloseTableExclusive(dm.tblProcessed);

      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
      Exit;
   end;

   CloseTableExclusive(dm.tblTrack);
   CloseTableExclusive(dm.tblVendor);
   CloseTableExclusive(dm.tblEquibase);
   CloseTableExclusive(dm.tblProcessed);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   ClearPrgStatusBars();
end;

procedure TMainForm.DownloadEquibaseCharts(Sender: TObject);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;
   sTrkCode: string;
   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;
   sBuf: string;
   msText: TMemoryStream;

   procedure AddHTMLChartsToEquibase();
   begin

      dm.tblEquibase.IndexName := '';
      dm.tblEquibase.SetKey();
      dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblEquibase.GotoKey()) then begin
         dm.tblEquibase.Edit();

         dm.tblEquibase.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;

         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();
      end else begin
         dm.tblEquibase.Append();
         dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;

         dm.tblEquibase.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();

      end;
   end;

begin

   hLog.AddToLog('DownloadEquibaseCharts', msevOperation);
   CheckProxy();

   if LOCATION = 'Exit' then begin
      idHTTP.ProxyParams.ProxyServer := 'localhost';
      idHTTP.ProxyParams.ProxyPort := 8080;
   end;

   OpenTableExclusive(dm.tblTrack);
   OpenTableExclusive(dm.tblVendor);
   OpenTableExclusive(dm.tblEquibase);
   OpenTableExclusive(dm.tblProcessed);

   try
      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      InitPrgBar(dm.tblTrack.RecordCount);
      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download Equibase Charts';
         Application.ProcessMessages();
         try
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'EQUIBASE';
            dm.tblVendor.FieldByName('Product').AsString := 'Charts';
            if (dm.tblVendor.GotoKey()) then begin
               sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sTrkCode := Trim(sTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := EQUIBASE_CHARTS_PATH;

               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               idHTTP.Request.Host := INTERNET_EQUIBASE_HOME_PAGE;

               if bUseOverrideDate then begin
                  dtDownloadDate := gedtOverrideDate;
               end else begin
                  dtDownloadDate := Now() - 1;
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

               // Check file was downloaded and imported
               dm.tblProcessed.IndexName := '';
               dm.tblProcessed.SetKey();
               dm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
               dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
               if (not dm.tblProcessed.GotoKey()) then begin
                  dm.tblTrack.Next();
                  continue;
               end else begin
                  if (dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean) then begin
                     dm.tblTrack.Next();
                     continue;
                  end;
               end;
               //

               sFileName := sm.Str(wYear, 5) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '-' + Trim(sTrkCode) + '.' + sDownloadFileType;
               sDownloadFullFileName := sDownloadLocation + sFileName;
               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 20000) then begin
                     DeleteFile(sDownloadFullFileName);
                     Application.ProcessMessages();
                  end;
               end;
               FindClose(tsFile);

               sServerFullFileName := sBaseImportPath + 'TRK=' + sTrkCode;
               if (dm.tblTrack.FieldByName('Country').AsString = 'USA') then begin
                  sServerFullFileName := sServerFullFileName + '&CY=USA';
               end;
               if (dm.tblTrack.FieldByName('Country').AsString = 'CAN') then begin
                  sServerFullFileName := sServerFullFileName + '&CY=CAN';
               end;
               sServerFullFileName := sServerFullFileName + '&DATE=';
               sServerFullFileName := sServerFullFileName + sm.Str(wMonth, 2) + '/' + sm.Str(wDay, 2) + '/' + sm.Str(wYear, 4);
               sServerFullFileName := sServerFullFileName + '&STYLE=EQB';

               lblServerPath.Caption := sServerFullFileName;
               lblLocalPath.Caption := sDownloadFullFileName;

               if FileExists(sDownloadFullFileName) then begin
                  AddHTMLChartsToEquibase();
               end else begin
                  if (DownLoadFile(sServerFullFileName, sDownloadFullFileName)) then begin
                     AddHTMLChartsToEquibase();
                     staBar.SimpleText := sDownloadFullFileName;
                     Application.ProcessMessages();
                  end;
               end;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;

   except
      CloseTableExclusive(dm.tblEquibase);
      CloseTableExclusive(dm.tblTrack);
      CloseTableExclusive(dm.tblVendor);
      CloseTableExclusive(dm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
      Exit;
   end;

   CloseTableExclusive(dm.tblTrack);
   CloseTableExclusive(dm.tblVendor);
   CloseTableExclusive(dm.tblEquibase);
   CloseTableExclusive(dm.tblProcessed);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   ClearPrgStatusBars();

end;

end.
 
