unit ReportHospitalResults;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, DIUtils, DIHtmlMisc, DIHtmlParser,
   DIUnicodeHtmlWriter, DIHtmlWriterPlugin;

type
   THospitalResultsReportForm = class(TForm)
      dbHospitalPrevDayReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblPrevDayHH: TDBISAMTable;
      dsPrevDayHH: TDataSource;
      plPrevDayHH: TppDBPipeline;
      ppPrevDayReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      tblPrevDayRH: TDBISAMTable;
      dsPrevDayRH: TDataSource;
      plPrevDayRH: TppDBPipeline;
      hLog: TmLog;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel11: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppLabel19: TppLabel;
      ppLabel18: TppLabel;
      ppLabel1: TppLabel;
      lblReportTitle: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      varStartDate: TppLabel;
      varEndDate: TppLabel;
      ppLabel16: TppLabel;
      ppLabel31: TppLabel;
      DetailBand: TppDetailBand;
      ppShape2: TppShape;
      RaceNbr: TppDBText;
      dbHorseName: TppDBText;
      dbTrkCode: TppDBText;
      dbProgramNbr: TppDBText;
      dbFinishPos: TppDBText;
      MorningLineDesc: TppDBText;
      dbExactaPayout: TppDBText;
      FinishNbrs: TppDBText;
      dbTrifectaPayout: TppDBText;
      dbQuinellaPayout: TppDBText;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      dbDailyDoublePayout: TppDBText;
      dbPick4Payout: TppDBText;
      ppLine11: TppLine;
      ppLine12: TppLine;
      dbSuperfectaPayout: TppDBText;
      ppLine13: TppLine;
      dbWinPayout: TppDBText;
      dbSheetOrder: TppDBText;
      ppLine2: TppLine;
      dbWinNbrs: TppDBText;
      dbWinPlcPayout: TppDBText;
      dbWinShoPayout: TppDBText;
      dbPick3Payout: TppDBText;
      dbDailyDoubleNbrs: TppDBText;
      dbPick3Nbrs: TppDBText;
      dbPick4Nbrs: TppDBText;
      dbPlcNbrs: TppDBText;
      dbShoNbrs: TppDBText;
      dbPlcPayout: TppDBText;
      dbPlcShoPayout: TppDBText;
      dbShoPayout: TppDBText;
      RaceDate: TppDBText;
      ppDBText2: TppDBText;
      WagerAmt: TppDBText;
      detailWinWagered: TppVariable;
      detailWinPayout: TppVariable;
      detailPlcPayout: TppVariable;
      detailShoPayout: TppVariable;
      SuperfectaNbrs: TppDBText;
      TrifectaNbrs: TppDBText;
      ExactaNbrs: TppDBText;
      QuinellaNbrs: TppDBText;
      ppLine10: TppLine;
      ppLine14: TppLine;
      EstTimeOfRace: TppDBText;
      PlcWagerAmt: TppDBText;
      ShoWagerAmt: TppDBText;
      ppDBText4: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppShape3: TppShape;
      ppShape4: TppShape;
      imgWin: TppShape;
      ppVarTotalWins: TppVariable;
      ppVarTotalStarts: TppVariable;
      ppVarTotalPlcs: TppVariable;
      lblStarts: TppLabel;
      lblWins: TppLabel;
      ppLabel20: TppLabel;
      ppVarTotalWinPct: TppVariable;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppVarAvgOdds: TppVariable;
      ppVarTotalOdds: TppVariable;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      varWinWagered: TppVariable;
      ppVariable2: TppVariable;
      ppVariable3: TppVariable;
      ppVariable4: TppVariable;
      ppLabel27: TppLabel;
      imgPlc: TppShape;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      varPlcWagered: TppVariable;
      ppVariable6: TppVariable;
      ppVariable7: TppVariable;
      imgSho: TppShape;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      varShoWagered: TppVariable;
      varShoWon: TppVariable;
      ppVariable25: TppVariable;
      lblFilter: TppLabel;
      ppLabel17: TppLabel;
      vWPSPL: TppVariable;
      ppLabel33: TppLabel;
      varPLPct: TppVariable;
      ppVariable8: TppVariable;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppVariable9: TppVariable;
      ppLabel44: TppLabel;
      varTotalPL: TppVariable;
      raCodeModule1: TraCodeModule;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure tblPrevDayRHNewRecord(DataSet: TDataSet);
      procedure tblPrevDayHHNewRecord(DataSet: TDataSet);
      procedure plPrevDayHHTraversal(Sender: TObject);
      procedure plPrevDayHHMasterRecordPositionChange(Sender: TObject);
      procedure GenerateReport();
      procedure CheckFilter();
      procedure InitPrgBar();

   private
      { Private declarations }
      bCreateReportsActive: boolean;
   public
      bPreviousDay: boolean;


      { Public declarations }
      sFileName: string;
   end;

var
   HospitalResultsReportForm: THospitalResultsReportForm;

implementation

uses UnitCommonCode, StrMan, FastStrings;

{$R *.DFM}

procedure THospitalResultsReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   with dbHospitalPrevDayReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure THospitalResultsReportForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbHospitalPrevDayReport do begin
      Close;
   end;


end;

procedure THospitalResultsReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure THospitalResultsReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure THospitalResultsReportForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure THospitalResultsReportForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure THospitalResultsReportForm.plPrevDayHHTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;

end;

procedure THospitalResultsReportForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THospitalResultsReportForm.btnCreatePdfClick(Sender: TObject);
begin



   DetailBand.Visible := True;

   if (bPreviousDay) then begin
      sFileName := 'HospitalResults';
      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

      varStartDate.Visible := True;
      varEndDate.Visible := False;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      HospitalResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      HospitalResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByActualPrimary';
      tblPrevDayRH.Active := False;

   end else begin
      sFileName := 'HospitalResultsLast21';
      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';
      varStartDate.Visible := True;
      varEndDate.Visible := True;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      HospitalResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      HospitalResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByActualPrimary';
      tblPrevDayRH.Active := False;

   end;


   try
      try
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;

         tblPrevDayRH.Active := True;
         tblPrevDayRH.Filtered := True;

         tblPrevDayHH.Active := True;

         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := TOP_PICK_FILTER;
         CheckFilter();
         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();

            lblReportTitle.Caption := 'Top Selection Results';
            GenerateReport();
         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;
   finally
      tblPrevDayRH.Active := False;
      tblPrevDayHH.Active := False;

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;


end;


procedure THospitalResultsReportForm.CheckFilter();
var sFilter: string;
begin
   sFilter := tblPrevDayHH.Filter;

end;


procedure THospitalResultsReportForm.GenerateReport();
begin
   try
      with ppPrevDayReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';

         lblReportTitle.Caption := lblReportTitle.Caption;
         TextFileName := PDF_RESULTS_REPORT_PATH + sFileName + '.pdf';
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppPrevDayReport.Print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure THospitalResultsReportForm.InitPrgBar();
begin

   prgBar.Max := tblPrevDayHH.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;


end.
