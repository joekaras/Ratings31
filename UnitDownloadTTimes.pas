unit UnitDownloadTTimes;
//http://www.thoroughbredtimes.com/sirelists/sirelistdetail.asp?Section=General
//http://www.thoroughbredtimes.com/sirelists/sirelistdetail.asp?Section=Freshman
//http://www.thoroughbredtimes.com/sirelists/sirelistdetail.asp?Section=Juvenile
interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar,
   IdExplicitTLSClientServerBase,
   IdAntiFreezeBase, IdAntiFreeze, IdComponent, IdTCPConnection,
   IdTCPClient, IdHTTP, IdBaseComponent, IdCookieManager, IdFTP, cxTL,
   cxVGrid, IdAttachment, IdAttachmentFile, IdMessage, IdUDPBase,
   IdUDPClient, IdSNMP, IdMessageClient, IdSMTPBase, IdSMTP;


procedure DownloadTTimes();


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

var
   idFtp: TIdFTP;
   idHTTP: TIdHTTP;

procedure DownloadTTimes();
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

   function DownLoadFile(sURL: string; sLocalFile: string): boolean;
   var
      iAttributes: integer;
      tsFile: TSearchRec;
      fsIn: TFileStream;
   begin

      try
         Result := False;
         UpdateStatusBar(sURL + ' ' + sLocalFile);
         fsIn := TFileStream.Create(sLocalFile, fmCreate);
         idHTTP.Get(sURL, fsIn);
      except
         Result := False;
         fsIn.Destroy;
         DeleteFile(sLocalFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end;

      fsIn.Destroy;
      iAttributes := faAnyFile;
      if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
         if (tsFile.Size < MIN_EQUIBASE_FILE_SIZE) then begin
            Result := False;
            DeleteFile(sLocalFile);
            FindClose(tsFile);
            UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
            Exit;
         end else begin
            Result := True;
            FindClose(tsFile);
            UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
            Exit;
         end;
      end;

      UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      Result := True;
   end;


begin

   hLog.AddToLog('DownloadTTimes', msevOperation);
   try

      idHTTP.Create(Application);
      CheckProxy();
      OpenTableExclusive(dm.tblTrack);
      OpenTableExclusive(dm.tblVendor);

      try
         //      DownloadStatus()
         //      lblServerPath.Visible := True;
         //      lblLocalPath.Visible := True;

         dm.tblTrack.First();

         while not dm.tblTrack.Eof do begin
            IncPrgBar();

            if (dm.tblTrack.FieldByName('Type').AsString = 'T') then begin
               dm.tblVendor.IndexName := '';
               dm.tblVendor.SetKey();
               dm.tblVendor.FieldByName('Vendor').AsString := 'EQUIBASE';
               dm.tblVendor.FieldByName('Product').AsString := 'TrackLeaders';
               if dm.tblVendor.GotoKey() then begin
                  sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
                  sTsnTrkCode := Trim(sTsnTrkCode);

                  sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
                  sNormalTrkCode := Trim(sNormalTrkCode);

                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
                  sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
                  sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

                  sDownloadLocation := EQUIBASE_TRACK_LEADERS_PATH;

                  sTrkCode := sNormalTrkCode;

                  bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
                  sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
                  sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
                  sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

                  //               idHTTP.Request.Host := INTERNET_EQUIBASE_HOME_PAGE;


                  if bUseOverrideDate then begin
                     dtDownloadDate := gedtOverrideDate;
                  end else begin
                     dtDownloadDate := Now();
                  end;

                  DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

                  //               if sStatType = JOCKEY_LEADERS then begin
                  //                  sFileName := Trim(sTrkCode) + '-' + 'Jockeys' + '.' + sDownloadFileType;
                  //               end;
                  //               if sStatType = TRAINER_LEADERS then begin
                  //                  sFileName := Trim(sTrkCode) + '-' + 'Trainers' + '.' + sDownloadFileType;
                  //               end;
                                 //               if sStatType = OWNER_LEADERS then begin
                                 //                  sFileName := Trim(sTrkCode) + '-' + 'Owners' + '.' + sDownloadFileType;
                                 //               end;

                  sDownloadFullFileName := sDownloadLocation + sFileName;

                  iAttributes := faAnyFile;
                  if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
                     DeleteFile(sDownloadFullFileName);
                  end;
                  FindClose(tsFile);
                  //http://www.equibase.com/premium/eqbTopLeadersByTrackDisplay.cfm?TRK=ALB&CY=USA&STAT=J
                  sServerFullFileName := sBaseImportPath + 'TRK=' + sTrkCode;
                  //               if (dm.tblTrack.FieldByName('Country').AsString = 'USA') then begin
                  //                  sServerFullFileName := sServerFullFileName + '&CY=USA&STAT=' + sStatType;
                  //               end;
                  //               if (dm.tblTrack.FieldByName('Country').AsString = 'CAN') then begin
                  //                  sServerFullFileName := sServerFullFileName + '&CY=CAN&STAT=' + sStatType;
                  //               end;


                  if not FileExists(sDownloadFullFileName) then begin
                     //                  lblServerPath.Caption := sServerFullFileName;
                     //                  lblLocalPath.Caption := sDownloadFullFileName;
                     DownLoadFile(sServerFullFileName, sDownloadFullFileName);
                     hLog.AddToLog(sDownloadFullFileName, msevOperation);
                  end;

                  ClearPrgStatusBars();
               end;
            end;
            Sleep(SLEEP_LONG);
            dm.tblTrack.Next();
         end;
         //      lblServerPath.Caption := '';
         //      lblLocalPath.Caption := '';
      except
         idHTTP.Disconnect;
         CloseTableExclusive(dm.tblTrack);
         CloseTableExclusive(dm.tblVendor);
         //      lblServerPath.Caption := '';
         //      lblLocalPath.Caption := '';
         //      lblServerPath.Visible := False;
         //      lblLocalPath.Visible := False;
         Exit;
      end;
   finally
      idHTTP.Disconnect;
      CloseTableExclusive(dm.tblTrack);
      CloseTableExclusive(dm.tblVendor);
      //   lblServerPath.Caption := '';
      //   lblLocalPath.Caption := '';
      //   lblServerPath.Visible := False;
      //   lblLocalPath.Visible := False;

   end;
                 end;


end.

