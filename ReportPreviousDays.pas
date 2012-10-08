
//(((IsTripleLiner1=True) or (IsTripleLiner2=True) or (IsTripleLiner3=True) or (IsFrontDoubleLiner1=True) or (IsFrontDoubleLiner2=True) or (IsFrontDoubleLiner3=True) or (IsBackDoubleLiner1=True) or (IsBackDoubleLiner2=True) or (IsBackDoubleLiner3=True) ) and (IsPrintedOnValueSheet=True) and(IsWagerSheetSelected=True))

unit ReportPreviousDays;
//(IsPrintedOnValueSheet=True) and (IsWagerSheetSelected=True)
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, DIUtils, DIHtmlMisc, DIHtmlParser,
   DIUnicodeHtmlWriter, DIHtmlWriterPlugin;

type
   TPreviousDaysReportForm = class(TForm)
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
      DetailBand: TppDetailBand;
      ppShape2: TppShape;
      dbRaceNbr: TppDBText;
      dbHorseName: TppDBText;
      dbTrkCode: TppDBText;
      dbProgramNbr: TppDBText;
      dbFinishPos: TppDBText;
      dbOdds: TppDBText;
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
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      Pace: TppDBText;
      lblErlPos: TppLabel;
      MidPace: TppDBText;
      lblMidPos: TppLabel;
      lblLatePos: TppLabel;
      ppDBText13: TppDBText;
      SuperfectaNbrs: TppDBText;
      TrifectaNbrs: TppDBText;
      ExactaNbrs: TppDBText;
      QuinellaNbrs: TppDBText;
      ppLine14: TppLine;
      EstTimeOfRace: TppDBText;
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
      procedure SetWagerReports();
      procedure SetBasicReports();
      procedure SetSpecialReports();
      procedure InitPrgBar();

   private
      { Private declarations }
      bCreateReportsActive: boolean;
      sReportNameSuffix: string;
      sReportNamePrefix: string;
   public
      bPrintDetail: boolean;
      bPreviousDay: boolean;
      bWagerReports: boolean;
      bSpecialReports: boolean;
      bYouBetTracks: boolean;
      bBasicReports: boolean;
      bAllReports: boolean;

      //Start Reports

//TODO Value < ML
//TODO Value >= ML
//TODO TopPick < M/L
//TODO TopPick >= M/L

//TODO M/L favs <> actual favs
//TODO Horses where M/L <= 3/1?? and end up at higher odds

      bCreatePrimary: boolean;
      bCreateSecondary: boolean;
      bCreateDefault: boolean;
      bCreateFavorite: boolean;

      bCreateTripleLiner: boolean;
      bCreateTripleLiner0: boolean;
      bCreateTripleLiner1: boolean;
      bCreateTripleLiner2: boolean;
      bCreateTripleLiner3: boolean;

      bCreateTripleDot: boolean;
      bCreateDoubleLiner: boolean;
      bCreateDoubleDot: boolean;

      bCreateTLAndIn: boolean;

      bCreateTLAndPP1: boolean;
      bCreateTLAndPP1All: boolean;

      bCreateTLAndPP10: boolean;
      bCreateTLAndPP10All: boolean;

      bCreateDollar: boolean;

      bCreateClaimedAndUp: boolean;
      bCreateClaimedAndUpAll: boolean;

      bCreateClaimedAndDown: boolean;
      bCreateClaimedAndDownAll: boolean;

      bCreateLayoffAndUp: boolean;
      bCreateLayoffAndUpAll: boolean;

      bCreateT1: boolean;
      bCreateT1A: boolean;
      bCreateT2: boolean;

      bCreateM1: boolean;
      bCreateM1A: boolean;
      bCreateM2: boolean;

      bCreateSprToRte: boolean;
      bCreateSprToRteAll: boolean;

      bCreateRteToSpr: boolean;
      bCreateRteToSprAll: boolean;

      bCreateSuperTrainer: boolean;
      bCreateSuperJockey: boolean;

      bCreateValueAll: boolean;
      bCreateValueAllWager: boolean;

      bCreateWager: boolean;
      bCreateLiner: boolean;

      bCreateValueAllBigMLOdds: boolean;
      bCreateValueAllMediumMLOdds: boolean;
      bCreateValueAllSmallMLOdds: boolean;

      bCreateValueAllMSW: boolean;
      bCreateValueAllMCL: boolean;
      bCreateValueAllCLM: boolean;
      bCreateValueAllNonMaiden: boolean;

      bCreateValueAllDirt: boolean;
      bCreateValueAllTurf: boolean;

      bCreateTopPick: boolean;
      bCreateTopPickWager: boolean;

      bCreateTopPickBigMLOdds: boolean;
      bCreateTopPickMediumMLOdds: boolean;
      bCreateTopPickSmallMLOdds: boolean;

      bCreateTopPickGoodTrainer: boolean;
      bCreateTopPickBadTrainer: boolean;

      bCreateTopPickMSW: boolean;
      bCreateTopPickMCL: boolean;
      bCreateTopPickCLM: boolean;
      bCreateTopPickNonMaiden: boolean;

      bCreateTopPickDirt: boolean;
      bCreateTopPickTurf: boolean;

      bCreateTLAndDirtRte: boolean;
      bCreateTLAndDirtSpr: boolean;

      bCreateTLAndTrfRte: boolean;
      //      bCreateTLAndTrfRteAll: boolean;

      bCreateTLAndTrfSpr: boolean;
      bCreateTLAndTrfSprAll: boolean;

      bCreateTLAndFirstJuice: boolean;
      bCreateTLAndFirstJuiceAll: boolean;

      bCreateTLAndSecondJuice: boolean;


      { Public declarations }
      sFileName: string;
   end;

var
   PreviousDaysReportForm: TPreviousDaysReportForm;

implementation

uses UnitCommonCode, StrMan, FastStrings;

{$R *.DFM}

procedure TPreviousDaysReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   bWagerReports := False;
   bSpecialReports := False;
   bYouBetTracks := False;
   bBasicReports := False;
   bAllReports := False;

   with dbPrevDayReport do begin
      Close;
      Open;
   end;

end;

procedure TPreviousDaysReportForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbPrevDayReport do begin
      Close;
   end;


end;

procedure TPreviousDaysReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TPreviousDaysReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TPreviousDaysReportForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TPreviousDaysReportForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TPreviousDaysReportForm.plPrevDayHHTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;

end;

procedure TPreviousDaysReportForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure TPreviousDaysReportForm.btnCreatePdfClick(Sender: TObject);
begin


   bCreateValueAll := True;
   bCreateValueAllWager := True;

   bCreateWager := True;
   bCreateLiner := True;

   bCreateValueAllMSW := True;
   bCreateValueAllMCL := True;
   bCreateValueAllCLM := True;
   bCreateValueAllNonMaiden := True;
   bCreateValueAllDirt := True;
   bCreateValueAllTurf := True;

   bCreateTopPick := True;
   bCreateTopPickWager := True;

   bCreateTopPickMSW := True;
   bCreateTopPickMCL := True;
   bCreateTopPickCLM := True;
   bCreateTopPickNonMaiden := True;
   bCreateTopPickDirt := True;
   bCreateTopPickTurf := True;

   bCreateValueAllBigMLOdds := True;
   bCreateValueAllMediumMLOdds := True;
   bCreateValueAllSmallMLOdds := True;

   bCreateTopPick := True;
   bCreateTopPickWager := True;
   bCreateFavorite := True;

   bCreateTopPickBigMLOdds := True;
   bCreateTopPickMediumMLOdds := True;
   bCreateTopPickSmallMLOdds := True;

   bCreateTopPickGoodTrainer := True;
   bCreateTopPickBadTrainer := True;

   bCreatePrimary := True;
   bCreateDefault := True;
   bCreateSecondary := True;

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

   bCreateTLAndPP1All := True;
   bCreateTLAndPP10All := True;

   bCreateTLAndIn := True;

   bCreateDollar := True;

   bCreateClaimedAndUp := True;
   bCreateClaimedAndUpAll := True;

   bCreateLayoffAndUp := True;
   bCreateLayoffAndUpAll := True;

   bCreateClaimedAndDown := True;
   bCreateClaimedAndDownAll := True;

   bCreateT1 := True;
   bCreateT1A := True;
   bCreateT2 := True;

   bCreateM1 := True;
   bCreateM1A := True;
   bCreateM2 := True;

   bCreateSprToRte := True;
   bCreateSprToRteAll := True;

   bCreateRteToSpr := True;
   bCreateRteToSprAll := True;

   bCreateSuperTrainer := True;
   bCreateSuperJockey := True;

   bCreateTLAndDirtRte := True;
   bCreateTLAndDirtSpr := True;

   bCreateTLAndTrfRte := True;

   bCreateTLAndTrfSpr := True;
   bCreateTLAndTrfSprAll := True;

   bCreateTLAndFirstJuice := True;
   bCreateTLAndFirstJuiceAll := True;

   bCreateTLAndSecondJuice := True;

   if (bPrintDetail) then begin
      DetailBand.Visible := True;
      sReportNameSuffix := 'Detail';
   end else begin
      DetailBand.Visible := False;
      sReportNameSuffix := 'Summary';
   end;

   if (bPreviousDay) then begin
      sReportNamePrefix := 'PrevDay';

      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

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

   end else begin
      sReportNamePrefix := 'Prev21Days';

      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';
      varStartDate.Visible := True;
      varEndDate.Visible := True;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      PreviousDaysReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      PreviousDaysReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByActualPrimary';
      tblPrevDayRH.Active := False;

   end;

   if not (bAllReports) then begin
      if (bBasicReports) then begin
         SetBasicReports();
      end;

      if (bWagerReports) then begin
         SetWagerReports();
      end;

      if (bSpecialReports) then begin
         SetSpecialReports();
      end;
   end;

   if (bCreateTopPick) then begin
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

               sFileName := 'TopPick';
               lblReportTitle.Caption := 'TopPick Form Top Selection Results';
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

   if (bCreateTopPickWager) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickWager';
               lblReportTitle.Caption := 'TopPick Results ';
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

   if (bCreateWager) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := WAGER_FILTER;
            //            tblPrevDayHH.Filter := LINER_FILTER;

            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'Wager';
               lblReportTitle.Caption := 'Wager Results';
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


   if (bCreateLiner) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := LINER_FILTER;

            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'Liner';
               lblReportTitle.Caption := 'Liner Results';
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



   if (bCreateValueAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := WAGER_FILTER;
            //            tblPrevDayHH.Filter := LINER_FILTER;

            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'SelectedPlays';
               lblReportTitle.Caption := 'Wager Results';
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
   if (bCreateValueAllWager) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();
               sFileName := 'ValueWagerAll';
               lblReportTitle.Caption := 'Wager Results All';
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


   if (bCreateValueAllMSW) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType=''MSW'') and ' + WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ValueAllMSW';
               lblReportTitle.Caption := 'Value Results MSW All';
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

   if (bCreateValueAllMCL) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType=''MCL'') and ' + WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ValueAllMCL';
               lblReportTitle.Caption := 'Value Results MCL All';
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

   if (bCreateValueAllCLM) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType=''CLM'') and ' + WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ValueAllCLM';
               lblReportTitle.Caption := 'Value Results CLM All';
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


   if (bCreateValueAllNonMaiden) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType<>''MSW'') and (RaceType<>''MCL'') and ' + WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ValueAllNonMaiden';
               lblReportTitle.Caption := 'Value Results Non Maiden All';
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

   if (bCreateValueAllDirt) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(Surface=''D'') and ' + WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ValueAllDirt';
               lblReportTitle.Caption := 'Value Results Dirt All';
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

   if (bCreateValueAllTurf) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(Surface=''T'') and ' + WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ValueAllTurf';
               lblReportTitle.Caption := 'Value Results Turf All';
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

   if (bCreateValueAllMediumMLOdds) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(MorningLineTo1 > 2.00 and MorningLineTo1 < 10.00) and ' + WAGER_FILTER_ALL;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ValueAllMediumOdds';
               lblReportTitle.Caption := 'Value ML > 2 and < 10 Results All';
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
   if (bCreateTopPickMSW) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType=''MSW'') and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickMSW';
               lblReportTitle.Caption := 'TopPick Results MSW All';
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


   if (bCreateTopPickMCL) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType=''MCL'') and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickMCL';
               lblReportTitle.Caption := 'TopPick Results MCL All';
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


   if (bCreateTopPickCLM) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType=''CLM'') and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickCLM';
               lblReportTitle.Caption := 'TopPick Results CLM All';
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


   if (bCreateTopPickNonMaiden) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(RaceType<>''MSW'') and (RaceType<>''MCL'') and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickNonMaiden';
               lblReportTitle.Caption := 'TopPick Results Non Maiden All';
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

   if (bCreateTopPickDirt) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(Surface=''D'') and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickDirt';
               lblReportTitle.Caption := 'TopPick Results Dirt All';
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

   if (bCreateTopPickTurf) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(Surface=''T'') and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickTurf';
               lblReportTitle.Caption := 'TopPick Results Turf All';
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
   if (bCreateTopPickBigMLOdds) then begin

      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(MorningLineTo1 >= 10) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickBigOdds';
               lblReportTitle.Caption := 'TopPick 10/1 and above M/L Results';
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


   if (bCreateTopPickMediumMLOdds) then begin

      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(MorningLineTo1 > 2.00 and MorningLineTo1 < 10.00) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickMediumOdds';
               lblReportTitle.Caption := 'TopPick 5/2 to 9/1 M/L Results';
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


   if (bCreateTopPickSmallMLOdds) then begin

      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(MorningLineTo1 <= 2.00) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickSmallOdds';
               lblReportTitle.Caption := 'TopPick 2-1 and Less M/L Results';
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


   if (bCreateTopPickBadTrainer) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(TotalTrnWinPct < 6.00) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickBadTrainer';
               lblReportTitle.Caption := 'TopPick Bad Trainer Results';
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


   if (bCreateTopPickGoodTrainer) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(TotalTrnWinPct >= 6.00) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TopPickGoodTrainer';
               lblReportTitle.Caption := 'TopPick Good Trainer Results';
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



   // Triple Liner All
   if (bCreateTripleLiner) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner=True) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLiner';
               lblReportTitle.Caption := 'Triple Liner Results';
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
            tblPrevDayHH.Filter := '(IsTripleLiner0=True) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLiner0Dot';
               lblReportTitle.Caption := 'Triple Liner 0 Dot Results';
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
            tblPrevDayHH.Filter := '(IsTripleLiner1=True) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLiner1Dot';
               lblReportTitle.Caption := 'Triple Liner 1 Dot Results';
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
            tblPrevDayHH.Filter := '(IsTripleLiner2=True) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLiner2Dot';
               lblReportTitle.Caption := 'Triple Liner 2 DotResults';
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
            tblPrevDayHH.Filter := '(IsTripleLiner3=True) and  ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLiner3Dot';
               lblReportTitle.Caption := 'Triple Liner 3 DotResults';
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
            tblPrevDayHH.Filter := '(IsFrontDoubleLiner=True or IsBackDoubleLiner=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'DoubleLiner';
               lblReportTitle.Caption := 'Double Liner Results';
               GenerateReport();
            end;
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
            tblPrevDayHH.Filter := '(IsTripleDot=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleDot';
               lblReportTitle.Caption := 'Triple Dot Results';
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
            tblPrevDayHH.Filter := '(IsFrontDoubleDot=True or IsBackDoubleDot=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'DoubleDot';
               lblReportTitle.Caption := 'Double Dot Results';
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

   // Dollar
   if (bCreateDollar) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;

            tblPrevDayHH.Filter := DOLLAR_FILTER;

            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'Dollar';
               lblReportTitle.Caption := 'Dollar Results';
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





   // Claimed And Up
   if (bCreateClaimedAndUp) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;

            tblPrevDayHH.Filter := '(IsClaimedAndUp) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ClaimedAndUp';
               lblReportTitle.Caption := 'Claimed And Up';
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

   if (bCreateClaimedAndUpAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsClaimedAndUp) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ClaimedAndUpAll';
               lblReportTitle.Caption := 'Claimed And Up All';
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

   // Claimed And Down
   if (bCreateClaimedAndDown) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsClaimedAndDown=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ClaimedAndDown';
               lblReportTitle.Caption := 'Claimed And Down';
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

   if (bCreateClaimedAndDownAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsClaimedAndDown=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'ClaimedAndDownAll';
               lblReportTitle.Caption := 'Claimed And Down All';
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


   // Layoff And Up
   if (bCreateLayoffAndUp) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsClaimedLayoffAndUp=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'LayoffAndUp';
               lblReportTitle.Caption := 'Layoff And Up';
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

   if (bCreateLayoffAndUpAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsClaimedLayoffAndUp=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'LayoffAndUpAll';
               lblReportTitle.Caption := 'Layoff And Up All';
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

   // Triple Liner An Post Pos 1
   if (bCreateTLAndPP1) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(PostPos=1) and (IsTripleLiner=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleAndPP1';
               lblReportTitle.Caption := 'Triple Liner And PP1';
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

   if (bCreateTLAndPP1All) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(PostPos=1) and (IsTripleLiner=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleAndPP1All';
               lblReportTitle.Caption := 'Triple Liner And PP1 All';
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


   // Triple Liner An Post Pos > 9
   if (bCreateTLAndPP10) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(PostPos > 9) and (IsTripleLiner=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleAndPP10';
               lblReportTitle.Caption := 'Triple Liner And PP > 9';
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

   if (bCreateTLAndPP10All) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(PostPos > 9) and (IsTripleLiner=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleAndPP10All';
               lblReportTitle.Caption := 'Triple Liner And PP > 9 All';
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


   // T and In
   if (bCreateTLAndIN) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '((PostPos <= 3) and (IsTripleLiner=True) and (LastPostPos >= 7))';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleAndIn';
               lblReportTitle.Caption := 'Triple Liner And In';
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


   //SuperTrainer
   if (bCreateSuperTrainer) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsSuperTrainer=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'SuperTrainer';
               lblReportTitle.Caption := 'SuperTrainer';
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

   //SuperJockey
   if (bCreateSuperJockey) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsSuperJockey=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'SuperJockey';
               lblReportTitle.Caption := 'SuperJockey';
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

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'DefaultResults';
               lblReportTitle.Caption := 'DefaultKey';
               GenerateReport();
            end;
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

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'PrimaryResults';
               lblReportTitle.Caption := 'PrimaryKey';
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

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'SecondaryResults';
               lblReportTitle.Caption := 'SecondaryKey';
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
            tblPrevDayHH.Filter := '(AngleChoice20) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'M1';
               lblReportTitle.Caption := 'Maiden 1st (M1)';
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
            tblPrevDayHH.Filter := '(AngleChoice21) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'M1A';
               lblReportTitle.Caption := 'Maiden 1st (M1A)';
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
            tblPrevDayHH.Filter := '(AngleChoice22) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'M2';
               lblReportTitle.Caption := 'Maiden 2nd (M2)';
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
            tblPrevDayHH.Filter := '(AngleChoice30) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'T1';
               lblReportTitle.Caption := 'Turf 1st (T1)';
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
            tblPrevDayHH.Filter := '(AngleChoice31) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'T1';
               lblReportTitle.Caption := 'Turf 1st (T1A)';
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
            tblPrevDayHH.Filter := '(AngleChoice32) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'T2';
               lblReportTitle.Caption := 'Turf 2nd (T2)';
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
   if (bCreateFavorite) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsFavorite=True) and (IsPrintedOnValueSheet=True)';
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'BettingFavorite';
               lblReportTitle.Caption := 'Betting Favorite Report';
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
            tblPrevDayHH.Filter := '(IsTripleLiner=True) and (IsSprToRte=True) ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerSprToRte';
               lblReportTitle.Caption := 'Triple Liner Sprint To Route';
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

   if (bCreateSprToRteAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner=True) and (IsSprToRte=True) ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerSprToRteAll';
               lblReportTitle.Caption := 'Triple Liner Sprint To Route All';
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
            tblPrevDayHH.Filter := '(IsTripleLiner=True) and (IsRteToSpr=True) ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerRteToSpr';
               lblReportTitle.Caption := 'Triple Liner Route To Sprint';
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


   if (bCreateRteToSprAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayRH.Active := True;
            tblPrevDayRH.Filtered := True;

            tblPrevDayHH.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsTripleLiner=True) and (IsRteToSpr=True) ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerRteToSprAll';
               lblReportTitle.Caption := 'Triple Liner Route To Sprint All';
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
            tblPrevDayHH.Filter := 'Surface=''D'' and (DistanceInFurlongs >= 8) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerDirtRoutes';
               lblReportTitle.Caption := 'Triple Liner Dirt Routes Results';
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
            tblPrevDayHH.Filter := 'Surface=''D'' and (DistanceInFurlongs < 8) and (IsTripleLiner=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerDirtSprints';
               lblReportTitle.Caption := 'Triple Liner Dirt Sprints Results';
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
            tblPrevDayHH.Filter := 'Surface=''T'' and (DistanceInFurlongs >= 8) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerTurfRoutes';
               lblReportTitle.Caption := 'Triple Liner Turf Routes Results';
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
            tblPrevDayHH.Filter := 'Surface=''T'' and (DistanceInFurlongs < 8) and (IsTripleLiner=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerTurfSprints';
               lblReportTitle.Caption := 'Triple Liner Turf Sprints Results';
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

   if (bCreateTLAndTrfSprAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := 'Surface=''T'' and (DistanceInFurlongs < 8) and (IsTripleLiner=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerTurfSprintsAll';
               lblReportTitle.Caption := 'Triple Liner Turf Sprints All Results';
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
            tblPrevDayHH.Filter := '(IsFirstTimeJuice=True) and (IsTripleLiner=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerFirstJuice';
               lblReportTitle.Caption := 'Triple Liner First Juice Results';
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

   if (bCreateTLAndFirstJuiceAll) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := '(IsFirstTimeJuice=True) and (IsTripleLiner=True) and ' + TOP_PICK_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerFirstJuiceAll';
               lblReportTitle.Caption := 'Triple Liner First Juice All Results';
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
            tblPrevDayHH.Filter := '(IsSecondTimeJuice=True) and (IsTripleLiner=True) and ' + WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               InitPrgBar();

               sFileName := 'TripleLinerSecondJuice';
               lblReportTitle.Caption := 'Triple Liner Second Juice Results';
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


procedure TPreviousDaysReportForm.CheckFilter();
var sFilter: string;
begin

   sFilter := tblPrevDayHH.Filter;
   if (bYouBetTracks) then begin
      tblPrevDayHH.Filter := FastReplace(sFilter, 'IsPrintedOnValueSheet=True', 'IsYouBetTrack=True', False);
   end;

   //   hLog.AddToLog(tblPrevDayHH.Filter, msevOperation);

end;

procedure TPreviousDaysReportForm.SetBasicReports();
begin


   // Normal Basic
   bCreateWager := False;
   bCreateLiner := False;
   bCreateTopPick := True;
   bCreateDollar := False;

   bCreateFavorite := False;
   bCreateValueAllWager := False;
   bCreateTopPickWager := False;
   bCreateFavorite := False;
   bCreateValueAll := False;


   if (bPrintDetail) then begin
      bCreateValueAllBigMLOdds := False;
      bCreateValueAllMediumMLOdds := False;
      bCreateValueAllSmallMLOdds := False;

      bCreateTopPickBigMLOdds := False;
      bCreateTopPickMediumMLOdds := False;
      bCreateTopPickSmallMLOdds := False;

   end else begin
      bCreateValueAllBigMLOdds := True;
      bCreateValueAllMediumMLOdds := True;
      bCreateValueAllSmallMLOdds := True;

      bCreateTopPickBigMLOdds := True;
      bCreateTopPickMediumMLOdds := True;
      bCreateTopPickSmallMLOdds := True;

   end;


   // Other Stats
   bCreateValueAllMSW := False;
   bCreateValueAllMCL := False;
   bCreateValueAllCLM := False;
   bCreateValueAllNonMaiden := False;
   bCreateValueAllDirt := False;
   bCreateValueAllTurf := False;

   bCreateTopPickMSW := False;
   bCreateTopPickMCL := False;
   bCreateTopPickCLM := False;
   bCreateTopPickNonMaiden := False;
   bCreateTopPickDirt := False;
   bCreateTopPickTurf := False;



   bCreateSprToRte := False;
   bCreateSprToRteAll := False;

   bCreateClaimedAndUp := False;
   bCreateClaimedAndUpAll := False;

   bCreateLayoffAndUp := False;
   bCreateLayoffAndUpAll := False;

   bCreateTLAndPP1 := False;
   bCreateTLAndPP10 := False;

   bCreateTLAndPP1All := False;
   bCreateTLAndPP10All := False;

   bCreateTLAndTrfSpr := False;
   bCreateTLAndTrfSprAll := False;

   bCreateTLAndFirstJuice := False;
   bCreateTLAndFirstJuiceAll := False;

   bCreateClaimedAndDown := False;
   bCreateClaimedAndDownAll := False;

   bCreateRteToSpr := False;
   bCreateRteToSprAll := False;

   bCreatePrimary := False;
   bCreateSecondary := False;
   bCreateDefault := False;

   bCreateTopPickGoodTrainer := False;
   bCreateTopPickBadTrainer := False;

   bCreateTripleLiner := False;
   bCreateTripleLiner0 := False;
   bCreateTripleLiner1 := False;
   bCreateTripleLiner2 := False;
   bCreateTripleLiner3 := False;

   bCreateTripleDot := False;
   bCreateDoubleLiner := False;
   bCreateDoubleDot := False;

   bCreateTLAndIn := False;

   bCreateT1 := False;
   bCreateT1A := False;
   bCreateT2 := False;

   bCreateM1 := False;
   bCreateM1A := False;
   bCreateM2 := False;

   bCreateSuperTrainer := False;
   bCreateSuperJockey := False;

   bCreateTLAndDirtRte := False;
   bCreateTLAndDirtSpr := False;

   bCreateTLAndTrfRte := False;
   bCreateTLAndSecondJuice := False;

end;

procedure TPreviousDaysReportForm.SetWagerReports();
begin

   bCreateValueAllWager := True;
   bCreateTopPick := False;
   bCreateTopPickWager := False;
   bCreateFavorite := False;

   bCreateFavorite := False;
   bCreateValueAll := False;
   bCreateClaimedAndDown := False;
   bCreateClaimedAndDownAll := False;
   bCreateClaimedAndUp := False;
   bCreateClaimedAndUpAll := False;
   bCreateDefault := False;
   bCreateDollar := False;
   bCreateDoubleDot := False;
   bCreateDoubleLiner := False;
   bCreateTopPickBadTrainer := False;
   bCreateTopPickBigMLOdds := False;
   bCreateTopPickCLM := False;
   bCreateTopPickDirt := False;
   bCreateTopPickGoodTrainer := False;
   bCreateTopPickMCL := False;
   bCreateTopPickMediumMLOdds := False;
   bCreateTopPickMSW := False;
   bCreateTopPickNonMaiden := False;
   bCreateTopPickSmallMLOdds := False;
   bCreateTopPickTurf := False;
   bCreateLayoffAndUp := False;
   bCreateLayoffAndUpAll := False;
   bCreateM1 := False;
   bCreateM1A := False;
   bCreateM2 := False;
   bCreatePrimary := False;
   bCreateRteToSpr := False;
   bCreateRteToSprAll := False;
   bCreateSecondary := False;
   bCreateSprToRte := False;
   bCreateSprToRteAll := False;
   bCreateSuperJockey := False;
   bCreateSuperTrainer := False;
   bCreateT1 := False;
   bCreateT1A := False;
   bCreateT2 := False;
   bCreateTLAndDirtRte := False;
   bCreateTLAndDirtSpr := False;
   bCreateTLAndFirstJuice := False;
   bCreateTLAndFirstJuiceAll := False;
   bCreateTLAndIn := False;
   bCreateTLAndPP1 := False;
   bCreateTLAndPP10 := False;
   bCreateTLAndPP10All := False;
   bCreateTLAndPP1All := False;
   bCreateTLAndSecondJuice := False;
   bCreateTLAndTrfRte := False;
   bCreateTLAndTrfSpr := False;
   bCreateTLAndTrfSprAll := False;
   bCreateTripleDot := False;
   bCreateTripleLiner := False;
   bCreateTripleLiner0 := False;
   bCreateTripleLiner1 := False;
   bCreateTripleLiner2 := False;
   bCreateTripleLiner3 := False;
   bCreateValueAllBigMLOdds := False;
   bCreateValueAllCLM := False;
   bCreateValueAllDirt := False;
   bCreateValueAllMCL := False;
   bCreateValueAllMediumMLOdds := False;
   bCreateValueAllMSW := False;
   bCreateValueAllNonMaiden := False;
   bCreateValueAllSmallMLOdds := False;
   bCreateValueAllTurf := False;

end;


procedure TPreviousDaysReportForm.GenerateReport();
begin
   try
      with ppPrevDayReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';

         if (bPrintDetail) then begin
            if (bYouBetTracks) then begin
               lblReportTitle.Caption := 'YouBet ' + lblReportTitle.Caption;
               TextFileName := PDF_YOUBET_RESULTS_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end else begin
               lblReportTitle.Caption := lblReportTitle.Caption;
               TextFileName := PDF_RESULTS_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end;
         end else begin
            if (bYouBetTracks) then begin
               lblReportTitle.Caption := 'YouBet ' + lblReportTitle.Caption + ' Summary';
               TextFileName := PDF_YOUBET_SUMMARY_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end else begin
               lblReportTitle.Caption := lblReportTitle.Caption + ' Summary';
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

procedure TPreviousDaysReportForm.InitPrgBar();
begin

   prgBar.Max := tblPrevDayHH.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;

procedure TPreviousDaysReportForm.SetSpecialReports();
begin


   //
   bCreateValueAllWager := True;

   bCreateClaimedAndDownAll := True;
   bCreateClaimedAndUpAll := True;

   bCreateLayoffAndUpAll := True;
   bCreateRteToSprAll := True;
   bCreateSprToRteAll := True;

   bCreateTLAndFirstJuiceAll := True;
   bCreateTLAndPP10All := True;
   bCreateTLAndPP1All := True;
   bCreateTLAndTrfSprAll := True;

   bCreateValueAllMCL := True;
   bCreateValueAllCLM := True;
   bCreateValueAllMSW := True;
   bCreateValueAllNonMaiden := True;

   bCreateValueAllDirt := True;
   bCreateValueAllTurf := True;

   bCreateValueAllBigMLOdds := True;
   bCreateValueAllSmallMLOdds := True;
   bCreateValueAllMediumMLOdds := True;

   // Other Stats
   bCreateValueAll := False;

   bCreateClaimedAndDown := False;
   bCreateClaimedAndUp := False;
   bCreateDefault := False;
   bCreateDollar := False;
   bCreateDoubleDot := False;
   bCreateDoubleLiner := False;
   bCreateFavorite := False;
   bCreateTopPick := False;
   bCreateTopPickBadTrainer := False;
   bCreateTopPickBigMLOdds := False;
   bCreateTopPickDirt := False;
   bCreateTopPickGoodTrainer := False;
   bCreateTopPickMCL := False;
   bCreateTopPickCLM := False;
   bCreateTopPickMediumMLOdds := False;
   bCreateTopPickMSW := False;
   bCreateTopPickNonMaiden := False;
   bCreateTopPickSmallMLOdds := False;
   bCreateTopPickTurf := False;
   bCreateLayoffAndUp := False;
   bCreateM1 := False;
   bCreateM1A := False;
   bCreateM2 := False;
   bCreatePrimary := False;
   bCreateRteToSpr := False;
   bCreateSecondary := False;
   bCreateSprToRte := False;
   bCreateSuperJockey := False;
   bCreateSuperTrainer := False;
   bCreateT1 := False;
   bCreateT1A := False;
   bCreateT2 := False;
   bCreateTLAndDirtRte := False;
   bCreateTLAndDirtSpr := False;
   bCreateTLAndFirstJuice := False;
   bCreateTLAndIn := False;
   bCreateTLAndPP1 := False;
   bCreateTLAndPP10 := False;
   bCreateTLAndSecondJuice := False;
   bCreateTLAndTrfRte := False;
   bCreateTLAndTrfSpr := False;
   bCreateTripleDot := False;
   bCreateTripleLiner := False;
   bCreateTripleLiner0 := False;
   bCreateTripleLiner1 := False;
   bCreateTripleLiner2 := False;
   bCreateTripleLiner3 := False;


end;


end.
