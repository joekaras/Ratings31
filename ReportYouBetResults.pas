// ((IsYouBetTrack=True) and (IsWagerSheetSelected=True))
unit ReportYouBetResults;
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, DIUtils, DIHtmlMisc, DIHtmlParser,
   DIUnicodeHtmlWriter, DIHtmlWriterPlugin;

type
   TYouBetResultsReportForm = class(TForm)
      dbYouBetWagerResultsReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblPrevDayHH: TDBISAMTable;
      dsPrevDayHH: TDataSource;
      plPrevDayHH: TppDBPipeline;
      ppWagerResultsReport: TppReport;
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
      dbPick4Wager: TppDBText;
      dbPick3Wager: TppDBText;
      dbDailyDoubleWager: TppDBText;
      dbQuinellaWager: TppDBText;
      dbExactaWager: TppDBText;
      dbTrifectaWager: TppDBText;
      dbSuperfectaWager: TppDBText;
      ppLine13: TppLine;
      dbWinPayout: TppDBText;
      ppLine2: TppLine;
      dbWinNbrs: TppDBText;
      dbWinPlcPayout: TppDBText;
      dbWinShoPayout: TppDBText;
      dbPick3Payout: TppDBText;
      dbDD: TppDBText;
      dbPick3: TppDBText;
      dbPick4: TppDBText;
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
      ppDBText3: TppDBText;
      Pace: TppDBText;
      lblErlPos: TppLabel;
      MidPace: TppDBText;
      lblMidPos: TppLabel;
      lblLatePos: TppLabel;
      ppDBText13: TppDBText;
      Super: TppDBText;
      Tri: TppDBText;
      Exacta: TppDBText;
      Quinella: TppDBText;
      SuperfectaNbrs: TppDBText;
      TrifectaNbrs: TppDBText;
      ExactaNbrs: TppDBText;
      QuinellaNbrs: TppDBText;
      ppLine10: TppLine;
      ppLine14: TppLine;
      EstTimeOfRace: TppDBText;
      TriWagerAmt: TppDBText;
      QuiWagerAmt: TppDBText;
      Pk3WagerAmt: TppDBText;
      ExaWagerAmt: TppDBText;
      SfcWagerAmt: TppDBText;
      Pk4WagerAmt: TppDBText;
      DDWagerAmt: TppDBText;
      ppDBText4: TppDBText;
      ppDBText1: TppDBText;
      ppLine15: TppLine;
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
      bPrintDetail: boolean;
      bPreviousDay: boolean;


      { Public declarations }
      sFileName: string;
   end;

var
   YouBetResultsReportForm: TYouBetResultsReportForm;

implementation

uses UnitCommonCode, StrMan, FastStrings;

{$R *.DFM}

procedure TYouBetResultsReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   with dbYouBetWagerResultsReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TYouBetResultsReportForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbYouBetWagerResultsReport do begin
      Close;
   end;


end;

procedure TYouBetResultsReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TYouBetResultsReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TYouBetResultsReportForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TYouBetResultsReportForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TYouBetResultsReportForm.plPrevDayHHTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;

end;

procedure TYouBetResultsReportForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure TYouBetResultsReportForm.btnCreatePdfClick(Sender: TObject);
begin

   if (bPreviousDay) then begin

      sFileName := 'YouBetWager';
      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

      varStartDate.Visible := True;
      varEndDate.Visible := False;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      YouBetResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      YouBetResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end else begin

      sFileName := 'YouBetWagerLast21';
      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';
      varStartDate.Visible := True;
      varEndDate.Visible := True;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      YouBetResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      YouBetResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end;

   try
      try
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;

         tblPrevDayHH.Active := True;

         tblPrevDayHH.Filtered := False;
         //         tblPrevDayHH.Filter := YOUBET_WAGER_FILTER;

         CheckFilter();
         tblPrevDayRH.Filtered := True;
         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            lblReportTitle.Caption := 'Wager Results';
            //   DisplayGimmickResults(True);
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


procedure TYouBetResultsReportForm.CheckFilter();
var sFilter: string;
begin

   sFilter := tblPrevDayHH.Filter;

end;

procedure TYouBetResultsReportForm.GenerateReport();
begin
   try
      with ppWagerResultsReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         //lblFilter.Caption := tblPrevDayHH.Filter;
       //  lblFilter.Visible := True;

         lblReportTitle.Caption := lblReportTitle.Caption;
         TextFileName := PDF_RESULTS_REPORT_PATH + sFileName + '.pdf';
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppWagerResultsReport.Print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TYouBetResultsReportForm.InitPrgBar();
begin

   prgBar.Max := tblPrevDayHH.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;

end.
