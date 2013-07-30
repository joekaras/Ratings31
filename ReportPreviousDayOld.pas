unit ReportPreviousDay;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, TXtraDev, ppParameter, mLog;

type
   TPreviousDayReportForm = class(TForm)
      dbPrevDayReport: TDBISAMDatabase;
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
      ppDBText9: TppDBText;
      ppSystemVariable1: TppSystemVariable;
      DetailBand: TppDetailBand;
      ppShape1: TppShape;
      dbRaceNbr: TppDBText;
      dbHorseName: TppDBText;
      dbTrkCode: TppDBText;
      dbProgramNbr: TppDBText;
      dbFinishPos: TppDBText;
      dbOdds: TppDBText;
      dbML: TppDBText;
      dbExactaPayout: TppDBText;
      SuperfectaNbrs: TppDBText;
      ppDBText15: TppDBText;
      dbQuinellaPayout: TppDBText;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppDBText12: TppDBText;
      ppDBText18: TppDBText;
      ppLine11: TppLine;
      ppLine12: TppLine;
      ppDBText11: TppDBText;
      ppDBText14: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      dbQuinellaWager: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppLine13: TppLine;
      dbWinNbrs: TppDBText;
      dbSheetOrder: TppDBText;
      ppLine2: TppLine;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      imgTri: TppShape;
      imgSfc: TppShape;
      ppShape4: TppShape;
      ppShape3: TppShape;
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
      ppVariable1: TppVariable;
      ppVariable2: TppVariable;
      ppVariable3: TppVariable;
      ppVariable4: TppVariable;
      ppLabel27: TppLabel;
      imgPlc: TppShape;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppVariable5: TppVariable;
      ppVariable6: TppVariable;
      ppVariable7: TppVariable;
      lblSfcWagered: TppLabel;
      lblSfcPayout: TppLabel;
      lblSfcPL: TppLabel;
      varSfcPL: TppVariable;
      varSfcPayout: TppVariable;
      varSfcWagered: TppVariable;
      lblTriWagered: TppLabel;
      lblTriPayout: TppLabel;
      lblTriPL: TppLabel;
      varTriPL: TppVariable;
      varTriPayout: TppVariable;
      varTriWagered: TppVariable;
      imgExa: TppShape;
      imgQui: TppShape;
      lblQuiWagered: TppLabel;
      lblQuiPayout: TppLabel;
      lblQuiPL: TppLabel;
      varQuiPL: TppVariable;
      varQuiPayout: TppVariable;
      varQuiWagered: TppVariable;
      lblExaWagered: TppLabel;
      lblExaPayout: TppLabel;
      lblExaPL: TppLabel;
      varExaPL: TppVariable;
      varExaPayout: TppVariable;
      varExaWagered: TppVariable;
      imgDD: TppShape;
      lblDDWagered: TppLabel;
      lblDDPayout: TppLabel;
      lblDDPL: TppLabel;
      varDDPL: TppVariable;
      varDDPayout: TppVariable;
      varDDWagered: TppVariable;
      imgSho: TppShape;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppVariable23: TppVariable;
      ppVariable24: TppVariable;
      ppVariable25: TppVariable;
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
      procedure DisplayGimmickResults(bOn: boolean);

   private
      { Private declarations }
      bCreateReportsActive: boolean;
      sReportNameSuffix: string;
      sReportNamePrefix: string;
   public
      bPrintDetail: boolean;
      bPrevDay: boolean;
      bSpecialRun: boolean;
      bYouBetTracks: boolean;
      bBasicReports : boolean;


      bCreatePrimary: boolean;
      bCreateSecondary: boolean;
      bCreateDefault: boolean;
      bCreateFavorite: boolean;
      bCreateFavoriteAndValue: boolean;
      bCreateFavoriteAndTripleLiner: boolean;
      bCreateFavoriteAndHospital: boolean;

      bCreateHospitalBigMLOdds: boolean;
      bCreateHospitalMediumMLOdds: boolean;
      bCreateHospitalSmallMLOdds: boolean;

      bCreateHospitalGoodTrainer: boolean;
      bCreateHospitalBadTrainer: boolean;

      bCreateTripleLiner: boolean;
      bCreateTripleLiner0: boolean;
      bCreateTripleLiner1: boolean;
      bCreateTripleLiner2: boolean;
      bCreateTripleLiner3: boolean;

      bCreateTripleDot: boolean;
      bCreateDoubleLiner: boolean;
      bCreateDoubleDot: boolean;

      bCreateTLAndPP1: boolean;
      bCreateTLAndPP10: boolean;
      bCreateTLAndIn: boolean;

      bCreateDollar: boolean;
      bCreateDoubleDollar: boolean;
      bCreateClaimedAndUp: boolean;
      bCreateClaimedAndDown: boolean;
      bCreateLayoffAndUp: boolean;

      bCreateT1: boolean;
      bCreateT1A: boolean;
      bCreateT2: boolean;

      bCreateM1: boolean;
      bCreateM1A: boolean;
      bCreateM2: boolean;

      bCreateSprToRte: boolean;
      bCreateRteToSpr: boolean;
      bCreateSuperTrainer: boolean;
      bCreateSuperJockey: boolean;

      bCreateHospital: boolean;
      bCreateHospitalAndValue: boolean;
      bCreateValue: boolean;
      bCreateAllValue: boolean;

      bCreateTLAndDirtRte: boolean;
      bCreateTLAndDirtSpr: boolean;

      bCreateTLAndTrfRte: boolean;
      bCreateTLAndTrfSpr: boolean;

      bCreateTLAndFirstJuice: boolean;
      bCreateTLAndSecondJuice: boolean;


      { Public declarations }
      sFileName: string;
   end;

var
   PreviousDayReportForm: TPreviousDayReportForm;

implementation

uses CommonCode, StrMan, FastStrings;

{$R *.DFM}

procedure TPreviousDayReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + 'ReportPrevDay.log';
   hLog.AddToLog('Previous Day Report', msevOperation);

   bSpecialRun := False;
   bYouBetTracks := False;

   bBasicReports := False;

   with dbPrevDayReport do begin
      Close;
      Open;
   end;

end;

procedure TPreviousDayReportForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbPrevDayReport do begin
      Close;
   end;

   hLog.LogFileName := LOG_PATH + 'ratings.log';

end;

procedure TPreviousDayReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TPreviousDayReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TPreviousDayReportForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TPreviousDayReportForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TPreviousDayReportForm.plPrevDayHHTraversal(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure TPreviousDayReportForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   prgBar.Position := prgBar.Position + 1;
   Application.ProcessMessages;
end;

procedure TPreviousDayReportForm.btnCreatePdfClick(Sender: TObject);
begin

   if (bPrintDetail) then begin
      DetailBand.Visible := True;
      sReportNameSuffix := 'Detail';
   end else begin
      DetailBand.Visible := False;
      sReportNameSuffix := 'Summary';
   end;

   if (bPrevDay) then begin
      sReportNamePrefix := 'PrevDay';

      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

      bCreateAllValue := False;
      bCreateValue := True;
      bCreateHospital := True;
      bCreateFavorite := True;

      bCreateHospitalBigMLOdds := False;
      bCreateHospitalMediumMLOdds := False;
      bCreateHospitalSmallMLOdds := False;

      bCreateHospitalGoodTrainer := False;
      bCreateHospitalBadTrainer := False;

      bCreateHospitalAndValue := False;
      bCreateFavoriteAndValue := False;
      bCreateFavoriteAndHospital := False;
      bCreateFavoriteAndTripleLiner := False;

      bCreatePrimary := False;
      bCreateDefault := False;
      bCreateSecondary := False;

      bCreateTripleLiner := False;
      bCreateTripleLiner0 := False;
      bCreateTripleLiner1 := False;
      bCreateTripleLiner2 := False;
      bCreateTripleLiner3 := False;

      bCreateTripleDot := False;
      bCreateDoubleLiner := False;
      bCreateDoubleDot := False;

      bCreateTLAndPP1 := False;
      bCreateTLAndPP10 := False;
      bCreateTLAndIn := False;

      bCreateDollar := False;
      bCreateDoubleDollar := False;
      bCreateClaimedAndUp := False;
      bCreateClaimedAndDown := False;
      bCreateLayoffAndUp := False;

      bCreateT1 := False;
      bCreateT1A := False;
      bCreateT2 := False;

      bCreateM1 := False;
      bCreateM1A := False;
      bCreateM2 := False;

      bCreateSprToRte := False;
      bCreateRteToSpr := False;

      bCreateSuperTrainer := False;
      bCreateSuperJockey := False;

      bCreateTLAndDirtRte := False;
      bCreateTLAndDirtSpr := False;

      bCreateTLAndTrfRte := False;
      bCreateTLAndTrfSpr := False;

      bCreateTLAndFirstJuice := False;
      bCreateTLAndSecondJuice := False;

   end else begin
      sReportNamePrefix := 'Prev21Days';

      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';

      bCreateAllValue := True;
      bCreateValue := True;
      bCreateHospital := True;
      bCreateFavorite := True;

      bCreateHospitalBigMLOdds := True;
      bCreateHospitalMediumMLOdds := True;
      bCreateHospitalSmallMLOdds := True;

      bCreateHospitalGoodTrainer := True;
      bCreateHospitalBadTrainer := True;

      if (bPrintDetail) then begin
         bCreateHospitalAndValue := False;
         bCreateFavoriteAndValue := False;
         bCreateFavoriteAndHospital := False;
         bCreateFavoriteAndTripleLiner := False;
      end else begin
         bCreateHospitalAndValue := True;
         bCreateFavoriteAndValue := True;
         bCreateFavoriteAndHospital := True;
         bCreateFavoriteAndTripleLiner := True;
      end;

      if (bPrintDetail) then begin
         bCreatePrimary := False;
         bCreateDefault := False;
         bCreateSecondary := False;
      end else begin
         bCreatePrimary := True;
         bCreateDefault := True;
         bCreateSecondary := True;
      end;

      bCreateTripleLiner := True;
      bCreateTripleLiner0 := True;
      bCreateTripleLiner1 := True;
      bCreateTripleLiner2 := True;
      bCreateTripleLiner3 := True;

      bCreateTripleDot := True;
      bCreateDoubleLiner := True;
      bCreateDoubleDot := True;

      bCreateTLAndPP1 := True;
      bCreateTLAndPP10 := True;
      bCreateTLAndIn := True;

      bCreateDollar := True;
      bCreateDoubleDollar := True;
      bCreateClaimedAndUp := True;
      bCreateClaimedAndDown := True;
      bCreateLayoffAndUp := True;

      bCreateT1 := True;
      bCreateT1A := True;
      bCreateT2 := True;

      bCreateM1 := True;
      bCreateM1A := True;
      bCreateM2 := True;

      bCreateSprToRte := True;
      bCreateRteToSpr := True;

      bCreateSuperTrainer := True;
      bCreateSuperJockey := True;

      bCreateTLAndDirtRte := True;
      bCreateTLAndDirtSpr := True;

      bCreateTLAndTrfRte := True;
      bCreateTLAndTrfSpr := True;

      bCreateTLAndFirstJuice := True;
      bCreateTLAndSecondJuice := True;

   end;

   if (bSpecialRun) then begin
      sReportNamePrefix := 'Prev21Days';

      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';

      bCreateAllValue := False;
      bCreateValue := False;
      bCreateHospital := False;
      bCreateFavorite := False;

      bCreateHospitalBigMLOdds := False;
      bCreateHospitalMediumMLOdds := False;
      bCreateHospitalSmallMLOdds := False;

      bCreateHospitalGoodTrainer := False;
      bCreateHospitalBadTrainer := False;

      bCreateHospitalAndValue := False;
      bCreateFavoriteAndValue := False;
      bCreateFavoriteAndHospital := False;
      bCreateFavoriteAndTripleLiner := False;

      bCreatePrimary := False;
      bCreateDefault := False;
      bCreateSecondary := False;

      bCreateTripleLiner := False;
      bCreateTripleLiner0 := False;
      bCreateTripleLiner1 := False;
      bCreateTripleLiner2 := False;
      bCreateTripleLiner3 := False;

      bCreateTripleDot := False;
      bCreateDoubleLiner := False;
      bCreateDoubleDot := False;

      bCreateTLAndPP1 := False;
      bCreateTLAndPP10 := False;
      bCreateTLAndIn := False;

      bCreateDollar := False;
      bCreateDoubleDollar := False;
      bCreateClaimedAndUp := True;
      bCreateClaimedAndDown := True;
      bCreateLayoffAndUp := True;

      bCreateT1 := False;
      bCreateT1A := False;
      bCreateT2 := False;

      bCreateM1 := False;
      bCreateM1A := False;
      bCreateM2 := False;

      bCreateSprToRte := False;
      bCreateRteToSpr := False;

      bCreateSuperTrainer := False;
      bCreateSuperJockey := False;

      bCreateTLAndDirtRte := False;
      bCreateTLAndDirtSpr := False;

      bCreateTLAndTrfRte := False;
      bCreateTLAndTrfSpr := False;

      bCreateTLAndFirstJuice := False;
      bCreateTLAndSecondJuice := False;

   end;

   if (bBasicReports) then begin
      bCreateValue := True;
      bCreateHospital := True;
      bCreateDollar := True;
      bCreateDoubleDollar := True;

      bCreateAllValue := False;
      bCreateFavorite := False;

      bCreateHospitalBigMLOdds := False;
      bCreateHospitalMediumMLOdds := False;
      bCreateHospitalSmallMLOdds := False;

      bCreateHospitalGoodTrainer := False;
      bCreateHospitalBadTrainer := False;

      bCreateHospitalAndValue := False;
      bCreateFavoriteAndValue := False;
      bCreateFavoriteAndHospital := False;
      bCreateFavoriteAndTripleLiner := False;

      bCreatePrimary := False;
      bCreateDefault := False;
      bCreateSecondary := False;

      bCreateTripleLiner := False;
      bCreateTripleLiner0 := False;
      bCreateTripleLiner1 := False;
      bCreateTripleLiner2 := False;
      bCreateTripleLiner3 := False;

      bCreateTripleDot := False;
      bCreateDoubleLiner := False;
      bCreateDoubleDot := False;

      bCreateTLAndPP1 := False;
      bCreateTLAndPP10 := False;
      bCreateTLAndIn := False;

      bCreateClaimedAndUp := False;
      bCreateClaimedAndDown := False;
      bCreateLayoffAndUp := False;

      bCreateT1 := False;
      bCreateT1A := False;
      bCreateT2 := False;

      bCreateM1 := False;
      bCreateM1A := False;
      bCreateM2 := False;

      bCreateSprToRte := False;
      bCreateRteToSpr := False;

      bCreateSuperTrainer := False;
      bCreateSuperJockey := False;

      bCreateTLAndDirtRte := False;
      bCreateTLAndDirtSpr := False;

      bCreateTLAndTrfRte := False;
      bCreateTLAndTrfSpr := False;

      bCreateTLAndFirstJuice := False;
      bCreateTLAndSecondJuice := False;
   end;


   //
   if (bCreateValue) then begin
      try
         try

            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(((TotalTrnWinPct >= 6.00) and (MorningLineTo1 <= 15.00) and (IsTipSheetSelected = True))) and IsPrintedOnValueSheet = True';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'Value';
            lblReportTitle.Caption := 'Value Results';
            DisplayGimmickResults(False);
            GenerateReport();
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


   if (bCreateHospital) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(FinalWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'Hospital';
            lblReportTitle.Caption := 'Hospital Form Top Selection Results';
            DisplayGimmickResults(True);
            GenerateReport();
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

   //
   if (bCreateAllValue) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := 'IsTipSheetSelected = True and IsPrintedOnValueSheet = True';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'ValueAll';
            lblReportTitle.Caption := 'All Value Results';
            DisplayGimmickResults(False);
            GenerateReport();
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


   //
   if (bCreateHospitalBigMLOdds) then begin

      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(MorningLineTo1 > 9) and (FinalWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;


            sFileName := 'HospitalBigOdds';
            lblReportTitle.Caption := 'Hospital 10/1 and above M/L Results';
            DisplayGimmickResults(True);
            GenerateReport();

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


   if (bCreateHospitalMediumMLOdds) then begin

      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(MorningLineTo1 >=2.50 and MorningLineTo1 < 10.00) and (FinalWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;


            sFileName := 'HospitalMediumOdds';
            lblReportTitle.Caption := 'Hospital 5/2 to 9/1 M/L Results';
            DisplayGimmickResults(True);
            GenerateReport();

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


   if (bCreateHospitalSmallMLOdds) then begin

      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(MorningLineTo1 < 2.50) and (FinalWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;


            sFileName := 'HospitalSmallOdds';
            lblReportTitle.Caption := 'Hospital 2-1 and Less M/L Results';
            DisplayGimmickResults(True);
            GenerateReport();

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


   if (bCreateHospitalBadTrainer) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(TotalTrnWinPct < 6.00) and (FinalWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'HospitalBadTrainer';
            lblReportTitle.Caption := 'Hospital Bad Trainer Results';
            DisplayGimmickResults(True);
            GenerateReport();
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


   if (bCreateHospitalGoodTrainer) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(TotalTrnWinPct >= 6.00) and (FinalWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'HospitalGoodTrainer';
            lblReportTitle.Caption := 'Hospital Good Trainer Results';
            DisplayGimmickResults(True);
            GenerateReport();
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



   //
   if (bCreateHospitalAndValue) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(((TotalTrnWinPct >= 6.00) and (MorningLineTo1 <= 15.00) and (IsTipSheetSelected = True)) or (FinalWinPctRank = 1)) and IsPrintedOnValueSheet = True and FinalWinPctRank = 1';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'HospitalAndValue';
            lblReportTitle.Caption := 'Hospital Top And Value Selection Results';
            DisplayGimmickResults(True);
            GenerateReport();
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



   // Triple Liner All
   if (bCreateTripleLiner) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLiner';
               lblReportTitle.Caption := 'Triple Liner Results';
               DisplayGimmickResults(False);
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

   // Triple Liner No Dots
   if (bCreateTripleLiner0) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner0 = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLiner0Dot';
               lblReportTitle.Caption := 'Triple Liner 0 Dot Results';
               DisplayGimmickResults(False);
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

   // Triple Liner 1 Dot
   if (bCreateTripleLiner1) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner1 = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLiner1Dot';
               lblReportTitle.Caption := 'Triple Liner 1 Dot Results';
               DisplayGimmickResults(False);
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

   // Triple Liner 2 Dot
   if (bCreateTripleLiner2) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner2 = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLiner2Dot';
               lblReportTitle.Caption := 'Triple Liner 2 DotResults';
               DisplayGimmickResults(False);
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

   // Triple Liner 3 Dot
   if (bCreateTripleLiner3) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner3 = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLiner3Dot';
               lblReportTitle.Caption := 'Triple Liner 3 DotResults';
               DisplayGimmickResults(False);
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

   //
   if (bCreateDoubleLiner) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsFrontDoubleLiner = True or IsBackDoubleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'DoubleLiner';
            lblReportTitle.Caption := 'Double Liner Results';
            DisplayGimmickResults(False);
            GenerateReport();
         except
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

   //
   if (bCreateTripleDot) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleDot = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleDot';
               lblReportTitle.Caption := 'Triple Dot Results';
               DisplayGimmickResults(False);
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

   //
   if (bCreateDoubleDot) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsFrontDoubleDot = True or IsBackDoubleDot = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'DoubleDot';
            lblReportTitle.Caption := 'Double Dot Results';
            DisplayGimmickResults(False);
            GenerateReport();
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

   // Dollar
   if (bCreateDollar) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsDollar = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'Dollar';
            lblReportTitle.Caption := 'Dollar Results';
            DisplayGimmickResults(False);
            GenerateReport();
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


   // Double Dollar
   if (bCreateDoubleDollar) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsDoubleDollar = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'DoubleDollar';
            lblReportTitle.Caption := 'Double Dollar Results';
            DisplayGimmickResults(False);
            GenerateReport();
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


   // Claimed And Up
   if (bCreateClaimedAndUp) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsClaimedAndUp) and (IsPrintedOnValueSheet = True)';
            tblPrevDayHH.Filter := '(FinalWinPctRank = 1) and (IsClaimedAndUp) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'ClaimedAndUp';
            lblReportTitle.Caption := 'Claimed And Up';
            DisplayGimmickResults(False);
            GenerateReport();
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

   // Claimed And Down
   if (bCreateClaimedAndDown) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsClaimedAndDown) and (IsPrintedOnValueSheet = True)';
            tblPrevDayHH.Filter := '(FinalWinPctRank = 1) and (IsClaimedAndDown) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'ClaimedAndDown';
            lblReportTitle.Caption := 'Claimed And Down';
            DisplayGimmickResults(False);
            GenerateReport();
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

   // Layoff And Up
   if (bCreateLayoffAndUp) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsLayoffAndUp) and (IsPrintedOnValueSheet = True)';
            tblPrevDayHH.Filter := '(FinalWinPctRank = 1) and (IsLayoffAndUp) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'LayoffAndUp';
            lblReportTitle.Caption := 'Layoff And Up';
            DisplayGimmickResults(False);
            GenerateReport();
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

   // Triple Liner An Post Pos 1
   if (bCreateTLAndPP1) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '((PostPos = 1) and (IsTripleLiner)) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'TripleAndPP1';
            lblReportTitle.Caption := 'Triple And PP1';
            DisplayGimmickResults(False);
            GenerateReport();
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


   // Triple Liner An Post Pos > 9
   if (bCreateTLAndPP10) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '((PostPos > 9) and (IsTripleLiner)) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'TripleAndPP10';
            lblReportTitle.Caption := 'Triple And PP > 9';
            DisplayGimmickResults(False);
            GenerateReport();
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

   // T and In
   if (bCreateTLAndIN) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '((PostPos <= 3) and (IsTripleLiner) and (LastPostPos >= 7)) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'TripleAndIn';
            lblReportTitle.Caption := 'Triple And In';
            DisplayGimmickResults(False);
            GenerateReport();
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


   //SuperTrainer
   if (bCreateSuperTrainer) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsSuperTrainer = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'SuperTrainer';
            lblReportTitle.Caption := 'SuperTrainer';
            DisplayGimmickResults(False);
            GenerateReport();
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

   //SuperJockey
   if (bCreateSuperJockey) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsSuperJockey = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'SuperJockey';
            lblReportTitle.Caption := 'SuperJockey';
            DisplayGimmickResults(False);
            GenerateReport();
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

   //   (DefaultWinPctRank=1) and (IsPrintedOnValueSheet=True)
   if (bCreateDefault) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(DefaultWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'DefaultResults';
            lblReportTitle.Caption := 'DefaultKey';
            DisplayGimmickResults(False);
            GenerateReport();
         except
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

   //   (PrimaryWinPctRank=1) and (IsPrintedOnValueSheet=True)
   if (bCreatePrimary) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(PrimaryWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'PrimaryResults';
            lblReportTitle.Caption := 'PrimaryKey';
            DisplayGimmickResults(False);
            GenerateReport();
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

   //   (SecondaryWinPctRank=1) and (IsPrintedOnValueSheet=True)
   if (bCreateSecondary) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(SecondaryWinPctRank=1) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'SecondaryResults';
            lblReportTitle.Caption := 'SecondaryKey';
            DisplayGimmickResults(False);
            GenerateReport();
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

   //M-1
   if (bCreateM1) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(AngleChoice = 20) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'M1';
               lblReportTitle.Caption := 'Maiden 1st (M1)';
               DisplayGimmickResults(False);
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

   //M-1A
   if (bCreateM1A) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(AngleChoice = 21) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'M1A';
               lblReportTitle.Caption := 'Maiden 1st (M1A)';
               DisplayGimmickResults(False);
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

   //M-2
   if (bCreateM2) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(AngleChoice = 22) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'M2';
               lblReportTitle.Caption := 'Maiden 2nd (M2)';
               DisplayGimmickResults(False);
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

   //T-1
   if (bCreateT1) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(AngleChoice = 30) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'T1';
               lblReportTitle.Caption := 'Turf 1st (T1)';
               DisplayGimmickResults(False);
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

   //T-1A
   if (bCreateT1A) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(AngleChoice = 31) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'T1';
               lblReportTitle.Caption := 'Turf 1st (T1A)';
               DisplayGimmickResults(False);
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

   //T-2
   if (bCreateT2) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(AngleChoice = 32) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'T2';
               lblReportTitle.Caption := 'Turf 2nd (T2)';
               DisplayGimmickResults(False);
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

   //Favorite
   if (bCreateFavorite) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsFavorite = True) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'BettingFavorite';
               lblReportTitle.Caption := 'Betting Favorite Report';
               DisplayGimmickResults(False);
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

   //Favorite
   if (bCreateFavoriteAndTripleLiner) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner = True) and (IsFavorite = True) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'BettingFavoriteAndTL';
               lblReportTitle.Caption := 'Betting Favorite And Triple Liner Report';
               DisplayGimmickResults(False);
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

   //SprToRte
   if (bCreateSprToRte) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner=True) and (IsSprToRte=True) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerSprToRte';
               lblReportTitle.Caption := 'Triple Liner Sprint To Route';
               DisplayGimmickResults(False);
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

   //RteToSpr
   if (bCreateRteToSpr) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner=True) and (IsRteToSpr = True) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerRteToSpr';
               lblReportTitle.Caption := 'Triple Liner Route To Sprint';
               DisplayGimmickResults(False);
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



   //Favorite and Hospital
   if (bCreateFavoriteAndHospital) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '((IsFavorite = True) and (FinalWinPctRank = True)) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'BettingFavoriteAndHospital';
               lblReportTitle.Caption := 'Betting Favorite And Hospital Top Choice Report';
               DisplayGimmickResults(False);
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

   //Favorite and Value
   if (bCreateFavoriteAndValue) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '((IsFavorite = True) and (IsTipSheetSelected = True)) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'BettingFavoriteAndValue';
               lblReportTitle.Caption := 'Betting Favorite And Value Play Report';
               DisplayGimmickResults(False);
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


   if (bCreateTLAndDirtRte) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := 'Surface = ''D'' and (DistanceInFurlongs >= 8) and (IsTripleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerDirtRoutes';
               lblReportTitle.Caption := 'Triple Liner Dirt Routes Results';
               DisplayGimmickResults(False);
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

   if (bCreateTLAndDirtSpr) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := 'Surface = ''D'' and (DistanceInFurlongs < 8) and (IsTripleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerDirtSprints';
               lblReportTitle.Caption := 'Triple Liner Dirt Sprints Results';
               DisplayGimmickResults(False);
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

   if (bCreateTLAndTrfRte) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := 'Surface = ''T'' and (DistanceInFurlongs >= 8) and (IsTripleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerTurfRoutes';
               lblReportTitle.Caption := 'Triple Liner Turf Routes Results';
               DisplayGimmickResults(False);
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

   if (bCreateTLAndTrfSpr) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := 'Surface = ''T'' and (DistanceInFurlongs < 8) and (IsTripleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerTurfSprints';
               lblReportTitle.Caption := 'Triple Liner Turf Sprints Results';
               DisplayGimmickResults(False);
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

   if (bCreateTLAndFirstJuice) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsFirstTimeJuice = True) and (IsTripleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerFirstJuice';
               lblReportTitle.Caption := 'Triple Liner First Juice Results';
               DisplayGimmickResults(False);
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

   if (bCreateTLAndSecondJuice) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsSecondTimeJuice = True) and (IsTripleLiner = True) and (IsPrintedOnValueSheet = True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'TripleLinerSecondJuice';
               lblReportTitle.Caption := 'Triple Liner Second Juice Results';
               DisplayGimmickResults(False);
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

end;


procedure TPreviousDayReportForm.GenerateReport();
begin
   try
      with ppPrevDayReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         if (bPrintDetail) then begin
            if (bYouBetTracks) then begin
               TextFileName := PDF_YOUBET_RESULTS_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end else begin
               TextFileName := PDF_RESULTS_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end;
         end else begin
            if (bYouBetTracks) then begin
               TextFileName := PDF_YOUBET_SUMMARY_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end else begin
               TextFileName := PDF_SUMMARY_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end;
         end;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppPrevDayReport.Print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TPreviousDayReportForm.CheckFilter();
var sFilter: string;
begin

   sFilter := tblPrevDayHH.Filter;

   if (bYouBetTracks) then begin
      tblPrevDayHH.Filter := FastReplace(sFilter, 'IsPrintedOnValueSheet', 'IsYouBetTrack', False);
   end;

   hLog.AddToLog(sFilter, msevOperation);

end;

procedure TPreviousDayReportForm.DisplayGimmickResults(bOn: boolean);

begin

   if (bOn) then begin
      imgDD.Visible := True;
      lblDDWagered.Visible := True;
      lblDDPayout.Visible := True;
      lblDDPL.Visible := True;
      varDDPL.Visible := True;
      varDDPayout.Visible := True;
      varDDWagered.Visible := True;

      imgQui.Visible := True;
      lblQuiWagered.Visible := True;
      lblQuiPayout.Visible := True;
      lblQuiPL.Visible := True;
      varQuiPL.Visible := True;
      varQuiPayout.Visible := True;
      varQuiWagered.Visible := True;

      imgExa.Visible := True;
      lblExaWagered.Visible := True;
      lblExaPayout.Visible := True;
      lblExaPL.Visible := True;
      varExaPL.Visible := True;
      varExaPayout.Visible := True;
      varExaWagered.Visible := True;

      imgTri.Visible := True;
      lblTriWagered.Visible := True;
      lblTriPayout.Visible := True;
      lblTriPL.Visible := True;
      varTriPL.Visible := True;
      varTriPayout.Visible := True;
      varTriWagered.Visible := True;

      imgSfc.Visible := True;
      lblSfcWagered.Visible := True;
      lblSfcPayout.Visible := True;
      lblSfcPL.Visible := True;
      varSfcPL.Visible := True;
      varSfcPayout.Visible := True;
      varSfcWagered.Visible := True;

   end else begin
      imgDD.Visible := False;
      lblDDWagered.Visible := False;
      lblDDPayout.Visible := False;
      lblDDPL.Visible := False;
      varDDPL.Visible := False;
      varDDPayout.Visible := False;
      varDDWagered.Visible := False;

      imgQui.Visible := False;
      lblQuiWagered.Visible := False;
      lblQuiPayout.Visible := False;
      lblQuiPL.Visible := False;
      varQuiPL.Visible := False;
      varQuiPayout.Visible := False;
      varQuiWagered.Visible := False;

      imgExa.Visible := False;
      lblExaWagered.Visible := False;
      lblExaPayout.Visible := False;
      lblExaPL.Visible := False;
      varExaPL.Visible := False;
      varExaPayout.Visible := False;
      varExaWagered.Visible := False;

      imgTri.Visible := False;
      lblTriWagered.Visible := False;
      lblTriPayout.Visible := False;
      lblTriPL.Visible := False;
      varTriPL.Visible := False;
      varTriPayout.Visible := False;
      varTriWagered.Visible := False;

      imgSfc.Visible := False;
      lblSfcWagered.Visible := False;
      lblSfcPayout.Visible := False;
      lblSfcPL.Visible := False;
      varSfcPL.Visible := False;
      varSfcPayout.Visible := False;
      varSfcWagered.Visible := False;
   end;

end;

end.

procedure TPreviousDaysReportForm.btnCreatePdfClick(Sender: TObject);
begin

   DetailBand.Visible := True;

   varStartDate.Visible := True;
   varEndDate.Visible := False;

   tblPrevDayRH.Active := True;
   tblPrevDayRH.IndexName := 'ByRaceDate';
   
   tblPrevDayRH.First();
   PreviousDaysReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

   tblPrevDayRH.Last();
   PreviousDaysReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

   tblPrevDayRH.IndexName := 'ByActualPrimary';
   tblPrevDayRH.Active := False;

   try
      try
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;

         tblPrevDayHH.Active := True;

         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := WAGER_FILTER;
         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            sFileName := 'YouBetWagers';
            lblReportTitle.Caption := 'YouBet Wager Results';
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

