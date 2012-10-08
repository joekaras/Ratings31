unit UnitDownloadDRF;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, ESBMaths2, StrMan;

procedure TMainForm.DownloadDRFResults(Sender: TObject);
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

   procedure AddHTMLResultsToDRF();
   begin
      dm.tblDRF.IndexName := '';
      dm.tblDRF.SetKey();

      dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblDRF.GotoKey()) then begin

         dm.tblDRF.Edit();
         dm.tblDRF.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end else begin

         dm.tblDRF.Append();
         dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblDRF.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end;
   end;

begin

   hLog.AddToLog('DownloadDRFResults - Start', msevOperation);

   try
      OpenTableExclusive(dm.tblDRF);
      OpenTableExclusive(dm.tblTrack);
      OpenTableExclusive(dm.tblVendor);
      OpenTableExclusive(dm.tblProcessed);

      try

         CheckProxy();

         if LOCATION = 'Home' then begin
            idHTTP.ProxyParams.ProxyServer := '';
            idHTTP.ProxyParams.ProxyPort := 80;
         end;

         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         InitPrgBar(dm.tblTrack.RecordCount);
         dm.tblTrack.First();

         while not dm.tblTrack.Eof do begin
            IncPrgBar();
            sStatusBar := 'Download DRF Results';
            Application.ProcessMessages();
            try
               dm.tblVendor.IndexName := '';
               dm.tblVendor.SetKey();
               dm.tblVendor.FieldByName('Vendor').AsString := 'DRF';
               dm.tblVendor.FieldByName('Product').AsString := 'Results';
               if (dm.tblVendor.GotoKey()) then begin
                  sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
                  sTrkCode := Trim(sTrkCode);

                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
                  sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
                  sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

                  sDownloadLocation := DRF_RESULTS_PATH;

                  sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
                  sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
                  sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

                  idHTTP.Request.Host := INTERNET_DRF_HOME_PAGE;

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
                     if (dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean) then begin
                        dm.tblTrack.Next();
                        continue;
                     end;
                  end;

                  //
                  sFileName := sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '-' + Trim(sTrkCode) + '.' + sDownloadFileType;
                  sDownloadFullFileName := sDownloadLocation + sFileName;

                  iAttributes := faAnyFile;
                  if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                     if (tsFile.Size < MIN_DRF_FILE_SIZE) then begin
                        DeleteFile(sDownloadFullFileName);
                        Application.ProcessMessages();
                     end;
                  end;
                  FindClose(tsFile);

                  sServerFullFileName := sBaseImportPath + sm.Str(wDay, 2) + '/' + 'r' + Trim(sTrkCode) + sm.Str(wDay, 2) + '.' + sDownloadFileType;
                  lblServerPath.Caption := sServerFullFileName;
                  lblLocalPath.Caption := sDownloadFullFileName;

                  if FileExists(sDownloadFullFileName) then begin
                     AddHTMLResultsToDRF();
                  end else begin
                     if (DownLoadFile(sServerFullFileName, sDownloadFullFileName)) then begin
                        AddHTMLResultsToDRF();
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
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTableExclusive(dm.tblDRF);
      CloseTableExclusive(dm.tblTrack);
      CloseTableExclusive(dm.tblVendor);
      CloseTableExclusive(dm.tblProcessed);

      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      hLog.AddToLog('DownloadDRFResults - Exit', msevOperation);
      ClearPrgStatusBars();
   end;

end;

procedure TMainForm.DownloadDRFCharts(Sender: TObject);
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

   procedure AddHTMLChartsToDRF();
   begin
      dm.tblDRF.IndexName := '';
      dm.tblDRF.SetKey();
      dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblDRF.GotoKey()) then begin
         dm.tblDRF.Edit();
         dm.tblDRF.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end else begin
         dm.tblDRF.Append();
         dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblDRF.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end;
   end;

begin

   CheckProxy();

   if LOCATION = 'Home' then begin
      idHTTP.ProxyParams.ProxyServer := '';
      idHTTP.ProxyParams.ProxyPort := 80;
   end;

   OpenTableExclusive(dm.tblDRF);
   OpenTableExclusive(dm.tblTrack);
   OpenTableExclusive(dm.tblVendor);
   OpenTableExclusive(dm.tblProcessed);

   try
      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      InitPrgBar(dm.tblTrack.RecordCount);
      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download DRF Charts';
         Application.ProcessMessages();
         try
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'DRF';
            dm.tblVendor.FieldByName('Product').AsString := 'Charts';
            if (dm.tblVendor.GotoKey()) then begin
               sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sTrkCode := Trim(sTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := DRF_CHARTS_PATH;

               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               idHTTP.Request.Host := INTERNET_DRF_HOME_PAGE;

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
                  if (dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean) then begin
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

               sServerFullFileName := sBaseImportPath + sm.Str(wDay, 2) + '/' + 'c' + Trim(sTrkCode) + sm.Str(wDay, 2) + '.' + sDownloadFileType;
               lblServerPath.Caption := sServerFullFileName;
               lblLocalPath.Caption := sDownloadFullFileName;

               if FileExists(sDownloadFullFileName) then begin
                  AddHTMLChartsToDRF();
               end else begin
                  if (DownLoadFile(sServerFullFileName, sDownloadFullFileName)) then begin
                     AddHTMLChartsToDRF();
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
      CloseTableExclusive(dm.tblDRF);
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

   CloseTableExclusive(dm.tblDRF);
   CloseTableExclusive(dm.tblTrack);
   CloseTableExclusive(dm.tblVendor);
   CloseTableExclusive(dm.tblProcessed);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   ClearPrgStatusBars();

end;


end.
 
