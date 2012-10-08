// IsWagerSheetSelected=True and IsYouBetTrack=True  and NbrWorksLast > 0 and StartsWorks21 > 0

unit ReportWagerResults;
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, DIUtils, DIHtmlMisc, DIHtmlParser,
   DIUnicodeHtmlWriter, DIHtmlWriterPlugin;

type
   TWagerResultsReportForm = class(TForm)
      dbWagerResultsReport: TDBISAMDatabase;
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
      tblTrainer: TDBISAMTable;
      dsTrainer: TDataSource;
      plTrainer: TppDBPipeline;
      tblJockey: TDBISAMTable;
      dsJockey: TDataSource;
      plJockey: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppShape2: TppShape;
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
      ppLabel1: TppLabel;
      lblReportTitle: TppLabel;
      varStartDate: TppLabel;
      varEndDate: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      DetailBand: TppDetailBand;
      dbRaceNbr: TppDBText;
      dbHorseName: TppDBText;
      dbTrkCode: TppDBText;
      dbProgramNbr: TppDBText;
      dbFinishPos: TppDBText;
      MorningLineDesc: TppDBText;
      FinishNbrs: TppDBText;
      ppLine1: TppLine;
      ppLine4: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine13: TppLine;
      dbWinPayout: TppDBText;
      TodaysWagerOrder: TppDBText;
      ppLine2: TppLine;
      dbWinNbrs: TppDBText;
      dbWinPlcPayout: TppDBText;
      dbWinShoPayout: TppDBText;
      dbPlcNbrs: TppDBText;
      dbShoNbrs: TppDBText;
      dbPlcPayout: TppDBText;
      dbPlcShoPayout: TppDBText;
      dbShoPayout: TppDBText;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      WagerAmt: TppDBText;
      detailWinWagered: TppVariable;
      detailWinPayout: TppVariable;
      detailPlcPayout: TppVariable;
      detailShoPayout: TppVariable;
      EstTimeOfRace: TppDBText;
      PlcWagerAmt: TppDBText;
      ShoWagerAmt: TppDBText;
      Odds: TppDBText;
      ppLine15: TppLine;
      WagerFinalOrder: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      detailPlcWagered: TppVariable;
      detailShoWagered: TppVariable;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      DebutIndicator: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppSummaryBand1: TppSummaryBand;
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
      varWinWon: TppVariable;
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
      sFilter: string;
      sLowOdds: string;
      sHighOdds: string;
      sPowerRank: string;
      sTodaysWagerWinPctRank: string;

      iLoop: integer;

   public
      bPrintDetail: boolean;
      bPreviousDay: boolean;
      bPrintOdds: boolean;
      bPrintPower: boolean;
      bPrintTodaysWager: boolean;
      bPrintOwnerBred: boolean;
      bOwnerWagerSelected: boolean;


      { Public declarations }
      sFileName: string;
   end;

var
   WagerResultsReportForm: TWagerResultsReportForm;

implementation

uses UnitCommonCode, StrMan, FastStrings;

{$R *.DFM}

procedure TWagerResultsReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   with dbWagerResultsReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TWagerResultsReportForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbWagerResultsReport do begin
      Close;
   end;


end;

procedure TWagerResultsReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;

   btnCreatePdfClick(Sender);

end;

procedure TWagerResultsReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TWagerResultsReportForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TWagerResultsReportForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TWagerResultsReportForm.plPrevDayHHTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;

end;

procedure TWagerResultsReportForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure TWagerResultsReportForm.btnCreatePdfClick(Sender: TObject);

begin

   if (bPreviousDay) then begin

      sFileName := 'MLGtValue';
      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

      varStartDate.Visible := True;
      varEndDate.Visible := False;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      WagerResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      WagerResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end else begin

      sFileName := 'MLGtLast21';
      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';
      varStartDate.Visible := True;
      varEndDate.Visible := True;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      WagerResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      WagerResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end;

   DetailBand.Visible := True;
   if not (bPrintDetail) then begin
      DetailBand.Visible := False;
   end;

   //
   try
      try
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;

         tblPrevDayHH.Active := True;

         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '';

         tblPrevDayHH.Filter := 'IsPrintedOnValueSheet=True and IsWagerSheetSelected=True';

         CheckFilter();
         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            lblReportTitle.Caption := 'Contender Sheet';
            sFileName := 'Contenders';
            DetailBand.Visible := True;
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

   //   if (bPrintPower) then begin
   //      sFilter := '';
   //
   //      sFilter := sFilter + '(Odds > 0) AND (FinishPos>0) AND ';
   //      sFilter := sFilter + 'IsOverlaySheetSelected=False AND IsTopOwnerSheetSelected=True ';
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //      tblPrevDayHH.Active := True;
   //
   //      tblPrevDayHH.Filtered := False;
   //      tblPrevDayHH.Filter := sFilter;
   //      tblPrevDayHH.Filtered := True;
   //
   //      if tblPrevDayHH.RecordCount > 0 then begin
   //         InitPrgBar();
   //         sFileName := 'Contrarion';
   //         lblReportTitle.Caption := 'Contrarion Top Owner Wager WorkSheet';
   //         DetailBand.Visible := True;
   //         GenerateReport();
   //      end;
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //   end;
   //
   //
   //   if (bPrintPower) then begin
   //
   //      // Power
   //      sFilter := sFilter + '(Odds > 0) AND (FinishPos>0) AND ';
   //      sFilter := sFilter + 'IsOverlaySheetSelected=True AND IsTopOwnerSheetSelected=True ';
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //      tblPrevDayHH.Active := True;
   //
   //      tblPrevDayHH.Filtered := False;
   //      tblPrevDayHH.Filter := sFilter;
   //      tblPrevDayHH.Filtered := True;
   //
   //      if tblPrevDayHH.RecordCount > 0 then begin
   //         InitPrgBar();
   //         sFileName := 'TopOwnerWagerWorkSheet';
   //         lblReportTitle.Caption := 'Top Owner Wager WorkSheet';
   //         DetailBand.Visible := True;
   //         GenerateReport();
   //      end;
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //   end;
   //
   //   if (bPrintPower) then begin
   //
   //      // Power
   //      sFilter := '';
   //      sFilter := sFilter + ' (Odds > 0) AND (FinishPos>0) AND ';
   //      sFilter := sFilter + ' (';
   //      sFilter := sFilter + ' (JkyWinsRank>0) OR (JkyEarningsRank>0) OR (JkyTrackRank>0) OR';
   //      sFilter := sFilter + ' (TrnEarningsRank>0) OR (TrnWinsRank>0) OR (TrnTrackRank>0)';
   //      sFilter := sFilter + ' )';
   //      sFilter := sFilter + ' AND';
   //      sFilter := sFilter + ' (';
   //      sFilter := sFilter + ' ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999))';
   //      sFilter := sFilter + ' OR';
   //      sFilter := sFilter + ' ((OwnEarningsRank > 0) AND (OwnEarningsRank <> 9999))';
   //      sFilter := sFilter + ' )';
   //
   //      iLoop := 1;
   //      repeat
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //         tblPrevDayHH.Active := True;
   //
   //         tblPrevDayHH.Filtered := False;
   //         sPowerRank := sm.str(iLoop, 2);
   //
   //         if (iLoop < 16) then begin
   //            tblPrevDayHH.Filter := sFilter + ' AND (PowerRank = ' + sPowerRank + ')';
   //         end else begin
   //            tblPrevDayHH.Filter := sFilter + ' AND (PowerRank >= 01 AND PowerRank <= 15)';
   //         end;
   //
   //         tblPrevDayHH.Filtered := True;
   //
   //         if tblPrevDayHH.RecordCount > 0 then begin
   //            InitPrgBar();
   //            if (iLoop < 16) then begin
   //               lblReportTitle.Caption := 'Top Owner Power Rank With Ranked Connections' + sPowerRank;
   //               sFileName := 'PowerRankConnections' + sPowerRank;
   //            end else begin
   //               lblReportTitle.Caption := 'Top Owne, Power';
   //               sFileName := 'PowerRankConnections01To15';
   //            end;
   //            if (iLoop = 16) then begin
   //               DetailBand.Visible := True;
   //               GenerateReport();
   //            end;
   //         end;
   //
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //
   //         prgBar.Position := 0;
   //         pnlPrgBar.Visible := False;
   //         staBar.SimpleText := '';
   //         bCreateReportsActive := False;
   //         iLoop := iLoop + 1;
   //      until iLoop > 16;
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //   end;
   //
   //   if (bPrintPower) then begin
   //
   //      iLoop := 1;
   //      repeat
   //         sFilter := '';
   //         sFilter := sFilter + ' (Odds > 0) AND (FinishPos>0) AND ';
   //         sFilter := sFilter + ' (';
   //         sFilter := sFilter + ' (JkyWinsRank>0) OR (JkyEarningsRank>0) OR (JkyTrackRank>0) OR';
   //         sFilter := sFilter + ' (TrnEarningsRank>0) OR (TrnWinsRank>0) OR (TrnTrackRank>0)';
   //         sFilter := sFilter + ' )';
   //         sFilter := sFilter + ' AND';
   //         sFilter := sFilter + ' (';
   //         sFilter := sFilter + ' ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999))';
   //         sFilter := sFilter + ' OR';
   //         sFilter := sFilter + ' ((OwnEarningsRank > 0) AND (OwnEarningsRank <> 9999))';
   //         sFilter := sFilter + ' )';
   //
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //         tblPrevDayHH.Active := True;
   //
   //         tblPrevDayHH.Filtered := False;
   //         sPowerRank := sm.str(iLoop, 2);
   //
   //         if (iLoop < 16) then begin
   //            if (iLoop = 1) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 9)';
   //            end;
   //            if (iLoop = 2) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 10)';
   //            end;
   //            if (iLoop = 3) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 12)';
   //            end;
   //
   //            if (iLoop = 4) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 15)';
   //            end;
   //
   //            if (iLoop = 5) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 16)';
   //            end;
   //            if (iLoop = 6) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 17)';
   //            end;
   //            if (iLoop = 7) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 18)';
   //            end;
   //            if (iLoop = 8) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 19)';
   //            end;
   //
   //            if (iLoop = 9) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 20)';
   //            end;
   //            if (iLoop = 10) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 21)';
   //            end;
   //            if (iLoop = 11) then begin
   //               sFilter := sFilter + ' AND';
   //               sFilter := sFilter + ' (Odds <= 22)';
   //            end;
   //
   //            tblPrevDayHH.Filter := sFilter + ' AND (PowerRank = ' + sPowerRank + ')';
   //         end else begin
   //            sFilter := sFilter + ' AND';
   //            sFilter := sFilter + ' (IsTopOwnerOddsSheetSelected=True)';
   //            tblPrevDayHH.Filter := sFilter + ' AND (PowerRank >= 01 AND PowerRank <= 15)';
   //         end;
   //
   //         tblPrevDayHH.Filtered := True;
   //
   //         if tblPrevDayHH.RecordCount > 0 then begin
   //            InitPrgBar();
   //            if (iLoop < 16) then begin
   //               lblReportTitle.Caption := 'Top Owner - (Odds Based) Power Rank  ' + sPowerRank;
   //               sFileName := 'PowerOddsConnections' + sPowerRank;
   //            end else begin
   //               lblReportTitle.Caption := 'Top Owner, Power, Odds';
   //               sFileName := 'PowerOddsConnections01To15';
   //               DetailBand.Visible := True;
   //            end;
   //            if (iLoop = 16) then begin
   //               DetailBand.Visible := True;
   //               GenerateReport();
   //            end;
   //         end;
   //
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //
   //         prgBar.Position := 0;
   //         pnlPrgBar.Visible := False;
   //         staBar.SimpleText := '';
   //         bCreateReportsActive := False;
   //         iLoop := iLoop + 1;
   //      until iLoop > 16;
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //   end;
   //

      //   if (bPrintPower) then begin
      //
      //      // Power
      //      sFilter := '';
      ////      sFilter := sFilter + ' ((IsPrintedOnValueSheet=True) OR (IsYouBetTrack=True))';
      ////      sFilter := sFilter + ' AND';
      //      sFilter := sFilter + ' (';
      //      sFilter := sFilter + ' ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999)) OR';
      //      sFilter := sFilter + ' ((OwnEarningsRank > 0) and (OwnEarningsRank <> 9999))';
      //      sFilter := sFilter + ' )';
      //      sFilter := sFilter + ' AND';
      //      sFilter := sFilter + ' (IsWagerSheetSelected=True)';
      //
      //      iLoop := 1;
      //      repeat
      //         tblPrevDayRH.Active := False;
      //         tblPrevDayHH.Active := False;
      //         tblPrevDayHH.Active := True;
      //
      //         tblPrevDayHH.Filtered := False;
      //         sPowerRank := sm.str(iLoop, 2);
      //
      //         tblPrevDayHH.Filter := sFilter + ' AND (PowerRank = ' + sPowerRank + ')';
      //         tblPrevDayHH.Filtered := True;
      //
      //         if tblPrevDayHH.RecordCount > 0 then begin
      //            InitPrgBar();
      //            lblReportTitle.Caption := 'Top Owner Power Rank ' + sPowerRank;
      //            sFileName := 'PowerRankWager' + sPowerRank;
      //            DisplayGimmickResults(True);
      //            GenerateReport();
      //         end;
      //
      //         tblPrevDayRH.Active := False;
      //         tblPrevDayHH.Active := False;
      //
      //         prgBar.Position := 0;
      //         pnlPrgBar.Visible := False;
      //         staBar.SimpleText := '';
      //         bCreateReportsActive := False;
      //         iLoop := iLoop + 1;
      //      until iLoop > 16;
      //
      //      tblPrevDayRH.Active := False;
      //      tblPrevDayHH.Active := False;
      //
      //      prgBar.Position := 0;
      //      pnlPrgBar.Visible := False;
      //      staBar.SimpleText := '';
      //      bCreateReportsActive := False;
      //   end;
      //


   //   if (bPrintTodaysWager) then begin
   //
   //      sFilter := '';
   //      sFilter := sFilter + ' ((IsPrintedOnValueSheet=True) OR (IsYouBetTrack=True))';
   //      sFilter := sFilter + ' AND';
   //      sFilter := sFilter + ' (';
   //      sFilter := sFilter + ' ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999)) OR';
   //      sFilter := sFilter + ' ((OwnEarningsRank > 0) and (OwnEarningsRank <> 9999))';
   //      sFilter := sFilter + ' )';
   //
   //      iLoop := 1;
   //      repeat
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //         tblPrevDayHH.Active := True;
   //
   //         tblPrevDayHH.Filtered := False;
   //         sTodaysWagerWinPctRank := sm.str(iLoop, 2);
   //
   //         tblPrevDayHH.Filter := sFilter + ' AND (TodaysWagerWinPctRank = ' + sTodaysWagerWinPctRank + ')';
   //         tblPrevDayHH.Filtered := True;
   //
   //         if tblPrevDayHH.RecordCount > 0 then begin
   //            InitPrgBar();
   //            lblReportTitle.Caption := 'Top Owner TodaysWagerRank ' + sTodaysWagerWinPctRank;
   //            sFileName := 'TodaysWagerRankAll' + sTodaysWagerWinPctRank;
   //            GenerateReport();
   //         end;
   //
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //
   //         prgBar.Position := 0;
   //         pnlPrgBar.Visible := False;
   //         staBar.SimpleText := '';
   //         bCreateReportsActive := False;
   //         iLoop := iLoop + 1;
   //      until iLoop > 15;
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //
   //   end;
   //
   //   if (bPrintOdds) then begin
   //
   //      //Odds
   //      sFilter := '';
   //      sFilter := sFilter + ' ((IsPrintedOnValueSheet=True) OR (IsYouBetTrack=True))';
   //      sFilter := sFilter + ' AND';
   //      sFilter := sFilter + ' (';
   //      sFilter := sFilter + ' ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999)) OR';
   //      sFilter := sFilter + ' ((OwnEarningsRank > 0) and (OwnEarningsRank <> 9999))';
   //      sFilter := sFilter + ' )';
   //      sFilter := sFilter + ' AND';
   //      sFilter := sFilter + ' (IsWagerSheetSelected=True)';
   //
   //      iLoop := 0;
   //      repeat
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //         tblPrevDayHH.Active := True;
   //
   //         tblPrevDayHH.Filtered := False;
   //         sLowOdds := sm.str(iLoop, 1);
   //         sHighOdds := sm.str((iLoop + 1), 2);
   //         tblPrevDayHH.Filter := sFilter + ' AND (Odds >= ' + sLowOdds + ')' + ' AND (Odds < ' + sHighOdds + ')';
   //         tblPrevDayHH.Filtered := True;
   //
   //         if tblPrevDayHH.RecordCount > 0 then begin
   //            InitPrgBar();
   //            lblReportTitle.Caption := 'Top Owner Low Odds  >= ' + sLowOdds + ' High Odds  < ' + sHighOdds;
   //            sFileName := 'OddsAll' + sLowOdds + 'To' + sHighOdds;
   //            GenerateReport();
   //         end;
   //
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //
   //         prgBar.Position := 0;
   //         pnlPrgBar.Visible := False;
   //         staBar.SimpleText := '';
   //         bCreateReportsActive := False;
   //         iLoop := iLoop + 1;
   //      until iLoop > 99;
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //
   //   end;
   //
   //   if (bOwnerWagerSelected) then begin
   //      sFilter := '';
   //      sFilter := sFilter + ' (';
   //      sFilter := sFilter + ' ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999)) OR';
   //      sFilter := sFilter + ' ((OwnEarningsRank > 0) and (OwnEarningsRank <> 9999))';
   //      sFilter := sFilter + ' )';
   //
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //      tblPrevDayHH.Active := True;
   //
   //      tblPrevDayHH.Filtered := False;
   //
   //      tblPrevDayHH.Filter := sFilter;
   //      tblPrevDayHH.Filtered := True;
   //
   //      if tblPrevDayHH.RecordCount > 0 then begin
   //         InitPrgBar();
   //         lblReportTitle.Caption := 'Top Owner Wager Selected';
   //         sFileName := 'TopOwnerWagerSelectedAll';
   //         GenerateReport();
   //      end;
   //
   //      tblPrevDayRH.Active := False;
   //      tblPrevDayHH.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //
   //   end;
   //
   //   if (bPrintOwnerBred) then begin
   //
   //      //
   //      try
   //         try
   //            tblPrevDayRH.Active := False;
   //            tblPrevDayHH.Active := False;
   //
   //            tblPrevDayHH.Active := True;
   //
   //            tblPrevDayHH.Filtered := False;
   //            tblPrevDayHH.Filter := '';
   //
   //            tblPrevDayHH.Filter := '';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' ((IsPrintedOnValueSheet=True) OR (IsYouBetTrack=True))';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' (';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999)) OR';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' ((OwnEarningsRank > 0) and (OwnEarningsRank <> 9999))';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' )';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND';
   //            tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' ((IsTurfBred=True) OR (Is1stBred=True) OR (Is2yoBred=True))';
   //
   //            CheckFilter();
   //            tblPrevDayHH.Filtered := True;
   //
   //            if tblPrevDayHH.RecordCount > 0 then begin
   //               InitPrgBar();
   //               lblReportTitle.Caption := 'Top Owner Bred';
   //               sFileName := 'TopOwnerBred';
   //               GenerateReport();
   //            end;
   //         except
   //            on E: Exception do begin
   //               hLog.AddToLog(E.Message, msevException);
   //            end;
   //         end;
   //      finally
   //         tblPrevDayRH.Active := False;
   //         tblPrevDayHH.Active := False;
   //
   //         prgBar.Position := 0;
   //         pnlPrgBar.Visible := False;
   //         staBar.SimpleText := '';
   //         bCreateReportsActive := False;
   //      end;
   //   end;



end;



procedure TWagerResultsReportForm.CheckFilter();
var sFilter: string;
begin

   sFilter := tblPrevDayHH.Filter;

end;

procedure TWagerResultsReportForm.GenerateReport();
begin
   try
      with ppWagerResultsReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         lblFilter.Caption := tblPrevDayHH.Filter;
         lblFilter.Visible := True;

         if (bPreviousDay) then begin
            TextFileName := PDF_RESULTS_REPORT_PATH + sFileName + '.pdf';
         end else begin
            TextFileName := PDF_RESULTS_REPORT_PATH + S_PREV_WEEK_DAYS + sFileName + '.pdf';
         end;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppWagerResultsReport.print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TWagerResultsReportForm.InitPrgBar();
begin

   prgBar.Max := tblPrevDayHH.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;

end.
