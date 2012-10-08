unit ReportHarnessValue;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, jpeg, ppParameter, mLog;

type
   THarnessValueReportForm = class(TForm)
      dbHarnessValueReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      ppHarnessValueReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      hLog: TmLog;
      tblRacesMaster: TDBISAMTable;
      tblEntries: TDBISAMTable;
      dsEntries: TDataSource;
      dsRacesMaster: TDataSource;
      plRacesReport: TppDBPipeline;
      plEntries: TppDBPipeline;
      tblRacesLoop: TDBISAMTable;
      ppHeaderBand1: TppHeaderBand;
      ppDBText2: TppDBText;
      ppLabel24: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel25: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel10: TppLabel;
      ppLabel14: TppLabel;
      ppLabel8: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel22: TppLabel;
      ppLabel3: TppLabel;
      ppLabel9: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel7: TppLabel;
      ppLabel15: TppLabel;
      ppLabel13: TppLabel;
      ppLabel39: TppLabel;
      ppLabel1: TppLabel;
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
      ppDetailBand1: TppDetailBand;
      ppSubReport1: TppSubReport;
      ppChildReport12: TppChildReport;
      ppTitleBand12: TppTitleBand;
      ppShape9: TppShape;
      ppLine3: TppLine;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppLabel31: TppLabel;
      ppDBMemo1: TppDBMemo;
      ppDBText1: TppDBText;
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
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      daDataModule1: TdaDataModule;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure plEntriesTraversal(Sender: TObject);
      procedure GenerateReport();
      procedure InitPrgBar();

   private
      { Private declarations }
      bCreateReportsActive: boolean;
      //   sOddsFilter: string;
   //      sTrainerFilter: string;
      sFileName: string;
   public
      { Public declarations }
      bCreateYouBet: boolean;
   end;
var
   HarnessValueReportForm: THarnessValueReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure THarnessValueReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   bCreateYouBet := False;
   with dbHarnessValueReport do begin
      Close;
      Directory := DATA_BUGGY_PATH;
      Open;
   end;

end;

procedure THarnessValueReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesMaster.Active := False;
   tblRacesLoop.Active := False;
   tblEntries.Active := False;

   with dbHarnessValueReport do begin
      Close;
   end;

end;

//******************* TTipSheetReportForm.btnCreatePdfClick *************************

procedure THarnessValueReportForm.btnCreatePdfClick(Sender: TObject);
var
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFilter: string;

begin


   try
      tblRacesLoop.Active := True;
      tblRacesMaster.Active := False;
      tblRacesMaster.IndexName := 'ByEstTimeOfRace';
      tblEntries.Active := True;

      if tblEntries.RecordCount > 0 then begin
         InitPrgBar();
         tblRacesLoop.First();
         DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
         sFileName := 'ValueReport' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
         GenerateReport();
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         tblRacesLoop.Active := False;
         tblRacesMaster.Active := False;
         tblEntries.Active := False;
         prgBar.Position := 0;
         pnlPrgBar.Visible := False;
         staBar.SimpleText := '';
         bCreateReportsActive := False;
      end;
   end;

   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;
   tblEntries.Active := False;
   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;

end;

procedure THarnessValueReportForm.GenerateReport();
begin
   try
      with ppHarnessValueReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_HARNESS_VALUE_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppHarnessValueReport.Print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure THarnessValueReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure THarnessValueReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure THarnessValueReportForm.InitPrgBar();
begin

   prgBar.Max := tblEntries.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;

procedure THarnessValueReportForm.plEntriesTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;

end;

end.
