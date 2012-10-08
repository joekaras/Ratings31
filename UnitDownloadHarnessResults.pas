unit UnitDownloadHarnessResults;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, ESBMaths2, StrMan;

procedure TMainForm.DownloadUSTACharts(Sender: TObject; sWhichCard: string);
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
   sChartsTrkCode: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

begin

   hLog.AddToLog('DownloadUSTACharts', msevOperation);
   CheckProxy();

   //if LOCATION = 'Exit' then begin
   //   idHTTP.ProxyParams.ProxyServer := 'localhost';
   //   idHTTP.ProxyParams.ProxyPort := 8080;
   //end;

   OpenTableExclusive(hdm.tblTrack);
   OpenTableExclusive(hdm.tblVendor);
   OpenTableExclusive(hdm.tblProcessed);

   try
      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      InitPrgBar(hdm.tblTrack.RecordCount);
      hdm.tblTrack.First();

      while not hdm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download Harness Charts';
         Application.ProcessMessages();
         if (hdm.tblTrack.FieldByName('Country').AsString <> 'USA') then begin
            hdm.tblTrack.Next();
            continue;
         end;

         try
            hdm.tblVendor.IndexName := '';
            hdm.tblVendor.SetKey();
            hdm.tblVendor.FieldByName('Vendor').AsString := 'USTA';
            hdm.tblVendor.FieldByName('Product').AsString := 'Charts';

            if (hdm.tblVendor.GotoKey()) then begin
               sTrkCode := Trim(hdm.tblTrack.FieldByName('TrkCode').AsString);
               sChartsTrkCode := Trim(hdm.tblTrack.FieldByName('ChartsTrkCode').AsString);

               sBaseImportPath := hdm.tblVendor.FieldByName('BaseImportPath').AsString;
               sDownloadFileType := hdm.tblVendor.FieldByName('DownloadFileType').AsString;

               sDownloadLocation := USTA_CHARTS_PATH;
               idHTTP.Request.Host := INTERNET_USTA_HOME_PAGE;

               if bUseOverrideDate then begin
                  dtDownloadDate := gedtOverrideDate;
               end else begin
                  dtDownloadDate := Now() - 1;
               end;


               // Check file was downloaded and imported
               hdm.tblProcessed.IndexName := '';
               hdm.tblProcessed.SetKey();
               hdm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
               hdm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
               if (not hdm.tblProcessed.GotoKey()) then begin
                  hdm.tblTrack.Next();
                  continue;
               end else begin
                  if (sWhichCard = BUGGY_EARLY_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessEarlyChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;

                  if (sWhichCard = BUGGY_LATE_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessLateChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               sFileName := Trim(sTrkCode) + '-' + sWhichCard + '-' +
                  sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) +
                  '.' + sDownloadFileType;

               sDownloadFullFileName := sDownloadLocation + sFileName;
               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 20000) then begin
                     DeleteFile(sDownloadFullFileName);
                     Application.ProcessMessages();
                  end;
               end;
               FindClose(tsFile);

               //http://racing.ustrotting.com/card_results.cfm?track_code=CALX&race_date=2005-01-09&race_type=6
               sServerFullFileName := sBaseImportPath + 'track_code=' + sChartsTrkCode;
               sServerFullFileName := sServerFullFileName + '&race_date=';
               sServerFullFileName := sServerFullFileName + sm.Str(wYear, 4) + '-' +
                  sm.Str(wMonth, 2) + '-' + sm.Str(wDay, 2);
               sServerFullFileName := sServerFullFileName + '&race_type=' + sWhichCard;

               lblServerPath.Caption := sServerFullFileName;
               lblLocalPath.Caption := sDownloadFullFileName;

               if not FileExists(sDownloadFullFileName) then begin
                  DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                  staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;
            end;

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         Sleep(SLEEP_LONG);
         hdm.tblTrack.Next();
      end;

   except
      CloseTableExclusive(hdm.tblTrack);
      CloseTableExclusive(hdm.tblVendor);
      CloseTableExclusive(hdm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
      Exit;
   end;

   CloseTableExclusive(hdm.tblTrack);
   CloseTableExclusive(hdm.tblVendor);
   CloseTableExclusive(hdm.tblProcessed);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   ClearPrgStatusBars();

end;

procedure TMainForm.DownloadSCCharts(Sender: TObject; sWhichCard: string);
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
   sChartsTrkCode: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

begin

   hLog.AddToLog('DownloadSCCharts', msevOperation);
   CheckProxy();

   //if LOCATION = 'Exit' then begin
   //   idHTTP.ProxyParams.ProxyServer := 'localhost';
   //   idHTTP.ProxyParams.ProxyPort := 8080;
   //end;

   OpenTableExclusive(hdm.tblTrack);
   OpenTableExclusive(hdm.tblVendor);
   OpenTableExclusive(hdm.tblProcessed);

   try
      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      InitPrgBar(hdm.tblTrack.RecordCount);
      hdm.tblTrack.First();

      while not hdm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download Harness Charts';
         Application.ProcessMessages();
         if (hdm.tblTrack.FieldByName('Country').AsString <> 'CAN') then begin
            hdm.tblTrack.Next();
            continue;
         end;

         try
            hdm.tblVendor.IndexName := '';
            hdm.tblVendor.SetKey();
            hdm.tblVendor.FieldByName('Vendor').AsString := 'SC';
            hdm.tblVendor.FieldByName('Product').AsString := 'Charts';

            if (hdm.tblVendor.GotoKey()) then begin
               sTrkCode := Trim(hdm.tblTrack.FieldByName('TrkCode').AsString);
               sChartsTrkCode := Trim(hdm.tblTrack.FieldByName('ChartsTrkCode').AsString);

               sBaseImportPath := hdm.tblVendor.FieldByName('BaseImportPath').AsString;
               sDownloadFileType := hdm.tblVendor.FieldByName('DownloadFileType').AsString;

               sDownloadLocation := SC_CHARTS_PATH;
               idHTTP.Request.Host := INTERNET_SC_HOME_PAGE;

               if bUseOverrideDate then begin
                  dtDownloadDate := gedtOverrideDate;
               end else begin
                  dtDownloadDate := Now() - 1;
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

               // Check file was downloaded and imported
               hdm.tblProcessed.IndexName := '';
               hdm.tblProcessed.SetKey();
               hdm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
               hdm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
               if (not hdm.tblProcessed.GotoKey()) then begin
                  hdm.tblTrack.Next();
                  continue;
               end else begin
                  if (sWhichCard = BUGGY_EARLY_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessEarlyChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;

                  if (sWhichCard = BUGGY_LATE_CHARTS) then begin
                     if (hdm.tblProcessed.FieldByName('IsHarnessLateChartsDownloaded').AsBoolean) then begin
                        hdm.tblTrack.Next();
                        continue;
                     end;
                  end;
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               sFileName := Trim(sTrkCode) + '-' + sWhichCard + '-' +
                  sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) +
                  '.' + sDownloadFileType;
               sDownloadFullFileName := sDownloadLocation + sFileName;
               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                  if (tsFile.Size < 20000) then begin
                     DeleteFile(sDownloadFullFileName);
                     Application.ProcessMessages();
                  end;
               end;
               FindClose(tsFile);

               //http://www.standardbredcanada.ca/results/data/rflmdmo.html
               sServerFullFileName := sBaseImportPath + 'r' + sChartsTrkCode;
               case DayOfTheWeek(gedtOverrideDate) of
                  DaySunday: sServerFullFileName := sServerFullFileName + 'su';
                  DayMonday: sServerFullFileName := sServerFullFileName + 'mo';
                  DayTuesday: sServerFullFileName := sServerFullFileName + 'tu';
                  DayWednesday: sServerFullFileName := sServerFullFileName + 'we';
                  DayThursday: sServerFullFileName := sServerFullFileName + 'th';
                  DayFriday: sServerFullFileName := sServerFullFileName + 'fr';
                  DaySaturday: sServerFullFileName := sServerFullFileName + 'sa';
               end;

               sServerFullFileName := LowerCase(sServerFullFileName + '.' + sDownloadFileType);

               lblServerPath.Caption := sServerFullFileName;
               lblLocalPath.Caption := sDownloadFullFileName;

               if not FileExists(sDownloadFullFileName) then begin
                  DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                  staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;
            end;

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         Sleep(SLEEP_LONG);
         hdm.tblTrack.Next();
      end;

   except
      CloseTableExclusive(hdm.tblTrack);
      CloseTableExclusive(hdm.tblVendor);
      CloseTableExclusive(hdm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
      Exit;
   end;

   CloseTableExclusive(hdm.tblTrack);
   CloseTableExclusive(hdm.tblVendor);
   CloseTableExclusive(hdm.tblProcessed);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   ClearPrgStatusBars();

end;

end.
 
