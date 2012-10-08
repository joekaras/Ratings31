unit ReportHarness;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog;

type
   THarnessReportForm = class(TForm)
      dbHarnessReport: TDBISAMDatabase;
      staBar: TStatusBar;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      btnCreatePdf: TButton;
      tblRacesLoop: TDBISAMTable;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      dsRacesMaster: TDataSource;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      dsEntries: TDataSource;
      plEntries: TppDBPipeline;
      ppHarnessReport: TppReport;
      hLog: TmLog;
      tblEntries: TDBISAMTable;
      ppHeaderBand1: TppHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel24: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel25: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppSubReport1: TppSubReport;
      ppChildReport12: TppChildReport;
      ppTitleBand12: TppTitleBand;
      ppShape9: TppShape;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel10: TppLabel;
      ppLabel14: TppLabel;
      ppLabel8: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLine3: TppLine;
      ppLabel22: TppLabel;
      ppLabel3: TppLabel;
      ppLabel9: TppLabel;
      ppDBMemo2: TppDBMemo;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel7: TppLabel;
      ppLabel15: TppLabel;
      ppLabel13: TppLabel;
      ppLabel39: TppLabel;
      ppLabel1: TppLabel;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppLabel2: TppLabel;
      ppLabel11: TppLabel;
      ppLabel16: TppLabel;
      ppLabel18: TppLabel;
      ppLabel12: TppLabel;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel23: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppDBMemo1: TppDBMemo;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel26: TppLabel;
      ppLabel36: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel4: TppLabel;
      aDetailBand: TppDetailBand;
      ppLine4: TppLine;
      ppLine12: TppLine;
      ppLine2: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine14: TppLine;
      ppLine18: TppLine;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      Trainer: TppDBText;
      Driver: TppDBText;
      TrnStarts: TppDBText;
      TrnDrvStarts: TppDBText;
      TrnDrvWinPct: TppDBText;
      AvgClass: TppDBText;
      AvgSpeed: TppDBText;
      SireStarts: TppDBText;
      SireWinPct: TppDBText;
      TrnWinPct: TppDBText;
      TrnUTR: TppDBText;
      MorningLineDesc: TppDBText;
      DrvStarts: TppDBText;
      DrvUDR: TppDBText;
      DrvWinPct: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      Last6Earnings: TppDBText;
      PaceStyle1stQ: TppDBText;
      PaceStyle2ndQ: TppDBText;
      PaceStyle3rdQ: TppDBText;
      PaceStyleFinish: TppDBText;
      ppDBText35: TppDBText;
      ppLine1: TppLine;
      ppLine5: TppLine;
      FinalValueBet: TppDBText;
      ppLine8: TppLine;
      WinIndex: TppDBText;
      ValueIndicator: TppDBText;
      ppDBText3: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      raCodeModule1: TraCodeModule;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      daDataModule1: TdaDataModule;
      raCodeModule2: TraCodeModule;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure plRacesReportNext(Sender: TObject);
      procedure plEntriesNext(Sender: TObject);
      procedure plEntriesRecordPositionChange(Sender: TObject);
      procedure plEntriesTraversal(Sender: TObject);
   private
      { Private declarations }
      bCreateReportsActive: boolean;
   public
      { Public declarations }
      edtOverrideDate: TDate;
   end;

var
   HarnessReportForm: THarnessReportForm;

implementation

uses UnitCommonCode, StrMan, FormMain;

{$R *.DFM}

//******************* TTipSheetReportForm.FormCreate *************************

procedure THarnessReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   with dbHarnessReport do begin
      Close;
      Directory := DATA_BUGGY_PATH;
      Open;
   end;

end;

//******************* TTipSheetReportForm.FormDestroy *************************

procedure THarnessReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;

   tblEntries.Active := False;

   with dbHarnessReport do begin
      Close;
   end;

end;

//******************* TTipSheetReportForm.btnCreatePdfClick *************************

procedure THarnessReportForm.btnCreatePdfClick(Sender: TObject);
var
   sTrkCode: string;
   sPrevTrkCode: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   iAttributes: integer;
   tsFile: TSearchRec;

begin

   try

      sPrevTrkCode := '';
      tblEntries.Active := False;
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;

      tblEntries.Active := True;
      tblRacesLoop.Active := True;
      tblRacesMaster.Active := True;

      prgBar.Max := tblRacesLoop.RecordCount;

      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      tblRacesLoop.First();
      while not tblRacesLoop.Eof do begin
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages();
         sTrkCode := tblRacesLoop.FieldByName('TrkCode').AsString;
         if sPrevTrkCode <> tblRacesLoop.FieldByName('TrkCode').AsString then begin
            sPrevTrkCode := tblRacesLoop.FieldByName('TrkCode').AsString;

            tblRacesMaster.Active := True;
            tblRacesMaster.Filtered := False;
            tblRacesMaster.Filter := 'TrkCode=''' + tblRacesLoop.FieldByName('TrkCode').AsString + '''';
            tblRacesMaster.Filtered := True;

            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            sFileName := tblRacesLoop.FieldByName('TrkCode').AsString + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            with ppHarnessReport do begin
               AllowPrintToFile := True;
               ShowPrintDialog := False;
               ShowCancelDialog := False;
               DeviceType := 'PDFFile';
               TextFileName := PDF_HARNESS_REPORT_PATH + sFileName;
               staBar.SimpleText := 'Processing ' + TextFileName;
               Application.ProcessMessages;
               ppHarnessReport.Print;
            end;

            iAttributes := faAnyFile;
            if (FindFirst(ppHarnessReport.TextFileName, iAttributes, tsFile) = 0) then begin
               if (tsFile.Size < MIN_REPORT_FILE_SIZE) then begin
                  DeleteFile(ppHarnessReport.TextFileName);
                  Application.ProcessMessages();
               end;
            end;
            FindClose(tsFile);

         end;
         tblRacesLoop.Next();
      end;

   except
      tblEntries.Active := False;
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;

      prgBar.Position := 0;
      staBar.SimpleText := '';
      pnlPrgBar.Visible := False;
      bCreateReportsActive := False;
   end;

   tblEntries.Active := False;
   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;

   prgBar.Position := 0;
   staBar.SimpleText := '';
   pnlPrgBar.Visible := False;
   bCreateReportsActive := False;
end;

procedure THarnessReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure THarnessReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure THarnessReportForm.plRacesReportNext(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THarnessReportForm.plEntriesNext(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THarnessReportForm.plEntriesRecordPositionChange(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THarnessReportForm.plEntriesTraversal(Sender: TObject);
begin
   Application.ProcessMessages;
end;

end.
