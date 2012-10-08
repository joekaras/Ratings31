unit UnitDownloadSireLists;
//http://www.thoroughbredtimes.com/sirelists/sirelistdetail.asp?Section=General
//http://www.thoroughbredtimes.com/sirelists/sirelistdetail.asp?Section=Freshman
//http://www.thoroughbredtimes.com/sirelists/sirelistdetail.asp?Section=Juvenile
//http://breeding.bloodhorse.com/sirelists/national05/juvenile_sires.asp
//http://breeding.bloodhorse.com/sirelists/national05/leading_sire.asp
//http://breeding.bloodhorse.com/sirelists/national05/TurfSire.asp
interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar,
   IdExplicitTLSClientServerBase,
   IdAntiFreezeBase, IdAntiFreeze, IdComponent, IdTCPConnection,
   IdTCPClient, IdHTTP, IdBaseComponent, IdCookieManager, IdFTP, cxTL,
   cxVGrid, IdAttachment, IdAttachmentFile, IdMessage, IdUDPBase,
   IdUDPClient, IdSNMP, IdMessageClient, IdSMTPBase, IdSMTP;


procedure DownloadSireLists();


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

var
   idHTTP: TIdHTTP;

procedure DownloadSireLists();
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
   wPrevDay: Word;
   wPrevMonth: Word;
   wPrevYear: Word;

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


   procedure DownloadIt();
   begin
      iAttributes := faAnyFile;
      if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
         DeleteFile(sDownloadFullFileName);
         Application.ProcessMessages();
      end;
      FindClose(tsFile);
      //lblServerPath.Caption := sServerFullFileName;
      //lblLocalPath.Caption := sDownloadFullFileName;
      if not FileExists(sDownloadFullFileName) then begin
         DownLoadFile(sServerFullFileName, sDownloadFullFileName);
         //staBar.SimpleText := sDownloadFullFileName;
         Application.ProcessMessages();
         Sleep(SLEEP_LONG);
      end;
   end;


begin

   hLog.AddToLog('DownloadSireList', msevOperation);
   try



      idHTTP := TIdHTTP.Create(Application);
      with idHTTP do begin
         Name := 'idHTTP';
         //    OnStatus := idHTTPStatus;
         //    OnDisconnected := idHTTPDisconnected;
         //    OnWork := idHTTPWork;
         //    OnWorkBegin := idHTTPWorkBegin;
         //    OnWorkEnd := idHTTPWorkEnd;
//         AuthRetries := 0;
//         AuthProxyRetries := 0;
         AllowCookies := True;
         HandleRedirects := True;
         ProtocolVersion := pv1_0;
         ProxyParams.BasicAuthentication := False;
         ProxyParams.ProxyPort := 0;
         Request.ContentLength := 0;
         Request.ContentRangeEnd := 0;
         Request.ContentRangeStart := 0;
         Request.ContentRangeInstanceLength := 0;
         Request.ContentType := 'text/html';
         Request.Accept := 'text/html, */*';
         Request.BasicAuthentication := True;
         Request.Host := 'www.axcis.com';
         Request.Password := '340526748';
         Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
         Request.Username := 'ZSARAKLSR';
         HTTPOptions := [hoForceEncodeParams];
         //    CookieManager := idCookieManager;
      end;


      CheckProxy();
      try
         InitDownloadLabels();

         sDownloadLocation := BLOODHORSE_SIRES_PATH;
         idHTTP.Request.Host := INTERNET_BLOODHORSE_HOME_PAGE;

         if gbUseOverrideDate then begin
            dtDownloadDate := gedtOverrideDate;
         end else begin
            dtDownloadDate := Now();
         end;

         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         DecodeDate(dtDownloadDate - 365, wPrevYear, wPrevMonth, wPrevDay);

         //
         //sFileName := 'AEISiresLastYear';
         //sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         //sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wPrevYear - 2000, 2) + '/AEISire.asp';
         //DownloadIt();
         //hLog.AddToLog(sDownloadFullFileName, msevOperation);

         //http://www.bloodhorse.com/NOW/Breeding/SireLists/Default.aspx?ListType=Turf&Region=&
         //sFileName := 'AEISiresThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.bloodhorse.com/NOW/Breeding/SireLists/Default.aspx?ListType=Turf&Region=&';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'AWSiresLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wPrevYear - 2000, 2) + '/AWSire.asp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'AWSiresThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wYear - 2000, 2) + '/AWSire.asp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'TurfSiresLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wPrevYear - 2000, 2) + '/TurfSire.asp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'GeneralSiresThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wYear - 2000, 2) + '/leading_sire.asp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'GeneralSiresLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wPrevYear - 2000, 2) + '/leading_sire.asp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'JuvenileSiresThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wYear - 2000, 2) + '/juvenile_sires.asp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'JuvenileSiresLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/national' + sm.Str(wPrevYear - 2000, 2) + '/juvenile_sires.asp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);


         sFileName := 'ALThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=AL';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'AZThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=AZ';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'ARThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=AR';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'CAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=CA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'CAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=CA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'COThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=CO';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'FLThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=FL';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'GAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=GA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'IDThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=ID';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'ILThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=IL';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'INThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=IN';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'IAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=IA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'KSThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=KS';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'KYThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=KY';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'LAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=LA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'MDThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=MD';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'MAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=MA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'MIThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=MI';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'MNThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=MN';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'MSThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=MS';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'MOThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=MO';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'MTThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=MT';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'NEThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=NE';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'NVThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=NV';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'NJThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=NJ';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'NMThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=NM';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'NYThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=NY';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'NCThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=NC';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'NDThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=ND';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'OHThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=OH';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'OKThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=OK';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'ORThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=OR';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'PAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=PA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'SCThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=SC';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'SDThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=SD';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'TNThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=TN';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'TXThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=TX';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'UTThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=UT';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'VAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=VA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'WAThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=WA';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'WVThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=WV';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'WIThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=WI';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'WYThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://breeding.bloodhorse.com/sirelists/States' + sm.Str(wYear - 2000, 2) + '/state.asp?id=WY';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         // http://breeding.bloodhorse.com/sirelists/States05/state.asp?id=AZ
         //http://breeding.bloodhorse.com/sirelists/national05/juvenile_sires.asp
         //http://breeding.bloodhorse.com/sirelists/national05/leading_sire.asp
         //http://breeding.bloodhorse.com/sirelists/national05/TurfSire.asp
         ClearPrgStatusBars();
      except
         idHTTP.Disconnect;
         ClearDownloadLabels();
         Exit;
      end;
   finally
      idHTTP.Disconnect;
      FreeAndNil(idHTTP);

      ClearDownloadLabels();

   end;
end;


end.
