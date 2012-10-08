unit ReportLinersResults;
interface

// Chalk Liners
// (MorningLineTo1Rank=1) and (FinalWinPctRank=1)and (Odds <= MorningLineTo1Fair)

// Value Liners
// (Odds > FinalLineTo1Fair) and (MorningLineTo1Fair > FinalLineTo1Fair)

// (Odds > MorningLineTo1Fair) and (IsLinerSheetSelected=True)

// (IsLinerSheetSelected=True)

// (IsLinerSheetSelected=True) and (FinisPos = 1)

//((IsDollar=True) or (IsDoubleDollar=True)) and IsYouBet=True

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, DIUtils, DIHtmlMisc, DIHtmlParser,
   DIUnicodeHtmlWriter, DIHtmlWriterPlugin;

type
   TLinerResultsReportForm = class(TForm)
      dbLinerWagerResultsReport: TDBISAMDatabase;
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
      WagerAmt: TppDBText;
      detailWinWagered: TppVariable;
      detailWinPayout: TppVariable;
      detailPlcPayout: TppVariable;
      detailShoPayout: TppVariable;
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
      PlcWagerAmt: TppDBText;
      ShoWagerAmt: TppDBText;
      ppDBText4: TppDBText;
      StartsWorks21: TppDBText;
      NbrWorksLast: TppDBText;
      LinerWinPctByTrk: TppDBText;
      KSP1stCall: TppDBText;
      varEPS: TppVariable;
      DaysLast: TppDBText;
      DaysLastWork: TppDBText;
      TrnWinsRank: TppDBText;
      TrnTrackRank: TppDBText;
      TrnEarningsRank: TppDBText;
      ppDBText1: TppDBText;
      ppDBText5: TppDBText;
      ppMemo1: TppMemo;
      ppMemo2: TppMemo;
      ppSummaryBand1: TppSummaryBand;
      imgPk4: TppShape;
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
      varShoWagered: TppVariable;
      varShoWon: TppVariable;
      ppVariable25: TppVariable;
      imgPk3: TppShape;
      lblPk3Wagered: TppLabel;
      lblPk3Payout: TppLabel;
      lblPk3PL: TppLabel;
      varPk3PL: TppVariable;
      varPk3Payout: TppVariable;
      varPk3Wagered: TppVariable;
      lblPk4Wagered: TppLabel;
      lblPk4Payout: TppLabel;
      lblPk4PL: TppLabel;
      varPk4PL: TppVariable;
      varPk4Payout: TppVariable;
      varPk4Wagered: TppVariable;
      lblFilter: TppLabel;
      ppLabel17: TppLabel;
      vWPSPL: TppVariable;
      vTriSfcPL: TppVariable;
      lblTriSfcPL: TppLabel;
      lblExaQuiPL: TppLabel;
      lblDDPk3PL: TppLabel;
      vExaQuiPL: TppVariable;
      vDDPk3PL: TppVariable;
      lblPk4Pk6PL: TppLabel;
      vPk4Pk6PL: TppVariable;
      ppLabel33: TppLabel;
      varPLPct: TppVariable;
      ppVariable8: TppVariable;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppVariable9: TppVariable;
      ppLabel36: TppLabel;
      ppVariable10: TppVariable;
      ppLabel37: TppLabel;
      ppVariable11: TppVariable;
      ppLabel38: TppLabel;
      ppVariable12: TppVariable;
      ppLabel39: TppLabel;
      ppVariable13: TppVariable;
      ppLabel40: TppLabel;
      ppVariable14: TppVariable;
      ppLabel41: TppLabel;
      ppVariable15: TppVariable;
      ppLabel42: TppLabel;
      ppVariable16: TppVariable;
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
      procedure DisplayGimmickResults(bOn: boolean);
      procedure InitPrgBar();
      procedure dbLinerWagerResultsReportBeforeConnect(Sender: TObject);

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
   LinerResultsReportForm: TLinerResultsReportForm;

implementation

uses UnitCommonCode, StrMan, FastStrings;

{$R *.DFM}

procedure TLinerResultsReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   with dbLinerWagerResultsReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TLinerResultsReportForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbLinerWagerResultsReport do begin
      Close;
   end;


end;

procedure TLinerResultsReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TLinerResultsReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TLinerResultsReportForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TLinerResultsReportForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TLinerResultsReportForm.plPrevDayHHTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;

end;

procedure TLinerResultsReportForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure TLinerResultsReportForm.btnCreatePdfClick(Sender: TObject);
var
   sFilter: string;
begin


   if (bPreviousDay) then begin

      sFileName := 'LinerWager';
      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

      varStartDate.Visible := True;
      varEndDate.Visible := False;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      LinerResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      LinerResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end else begin

      sFileName := 'LinerWagerLast21';
      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';
      varStartDate.Visible := True;
      varEndDate.Visible := True;

      tblPrevDayRH.Active := True;
      tblPrevDayRH.IndexName := 'ByRaceDate';

      tblPrevDayRH.First();
      LinerResultsReportForm.varStartDate.Caption := 'For ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.Last();
      LinerResultsReportForm.varEndDate.Caption := ' To ' + DateToStr(tblPrevDayRH.FieldByName('RaceDate').AsDateTime);

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end;



   try
      try
         // Dollar
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := 'Dollar';
         end else begin
            sFileName := 'Dollar21';
         end;

         tblPrevDayRH.Filtered := False;
         tblPrevDayRH.Filter := 'TypeOfRace = ''T''';
         tblPrevDayRH.Filtered := True;

         lblReportTitle.Caption := 'Dollar';
         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '(' +

         '(' +
            '((IsDollar=True) or (IsDoubleDollar=True)) ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;



         //  Breeding
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := '1stBred';
         end else begin
            sFileName := '1stBred21';
         end;

         lblReportTitle.Caption := '1st Bred ';
         tblPrevDayHH.Filtered := False;

         tblPrevDayHH.Filter := '(' +

         '(' +
            'Is1stBred=True ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;



         //  Breeding
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := '1stBred2Start';
         end else begin
            sFileName := '1stBred2Start21';
         end;

         //         lblReportTitle.Caption := '1st Bred - 2nd Start';
         //         tblPrevDayHH.Filtered := False;
         //         tblPrevDayHH.Filter := '(' +
         //
         //         '(' +
         //            'Is1stBred=True and ' +
         //            'IsDebutTwo=True' +
         //            ')' +
         //
         //         ' and ' +
         //
         //         '(' +
         //            'IsYouBetTrack=True ' +
         //            ')' +
         //
         //         ')';
         //
         //         tblPrevDayHH.Filtered := True;
         //
         //         if tblPrevDayHH.RecordCount > 0 then begin
         //            InitPrgBar();
         //            DisplayGimmickResults(True);
         //            GenerateReport();
         //         end;
         //

                  //  Breeding - Turf
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := 'TurfBred';
         end else begin
            sFileName := 'TurfBred21';
         end;

         lblReportTitle.Caption := 'Turf Bred ';
         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '(' +

         '(' +
            'IsTurfBred=True ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;


         //  Breeding - 2yo - ADD 2nd start for 2yo and turf
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := '2yoBred';
         end else begin
            sFileName := '2yoBred21';
         end;

         lblReportTitle.Caption := '2yo Bred ';
         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '(' +

         '(' +
            'Is2yoBred=True  ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;


         // Xtreme Speed
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := 'XSpeed';
         end else begin
            sFileName := 'XSpeed21';
         end;

         lblReportTitle.Caption := 'Xtreme Speed';
         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '(' +

         '(' +
            'IsXtremeSpeed=True ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;

         //
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := '1stLay';
         end else begin
            sFileName := '1stLay21';
         end;

         lblReportTitle.Caption := '1st Off Layoff';
         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '(' +

         '(' +
            'Is1stOffLayoff=True ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;

         //
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := '2ndLay';
         end else begin
            sFileName := '2ndLay21';
         end;

         lblReportTitle.Caption := '2nd Off Layoff';
         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '(' +

         '(' +
            'Is2ndOffLayoff=True ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;


         //
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;

         if (bPreviousDay) then begin
            sFileName := '3rdLay';
         end else begin
            sFileName := '3rdLay21';
         end;

         lblReportTitle.Caption := '3rd Off Layoff';
         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := '(' +

         '(' +
            'Is3rdOffLayoff=True ' +
            ')' +

         ' and ' +

         '(' +
            'IsYouBetTrack=True ' +
            ')' +

         ')';

         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            InitPrgBar();
            DisplayGimmickResults(True);
            GenerateReport();
         end;


         //
//         tblPrevDayRH.Active := False;
//         tblPrevDayHH.Active := False;
//         tblPrevDayHH.Active := True;
//
//         if (bPreviousDay) then begin
//            sFileName := 'Is1stClaiming';
//         end else begin
//            sFileName := 'Is1stClaiming21';
//         end;
//
//         lblReportTitle.Caption := 'Is1stClaiming';
//         tblPrevDayHH.Filtered := False;
//         tblPrevDayHH.Filter := '(' +
//
//         '(' +
//            'Is1stClaiming=True ' +
//            ')' +
//
//         ' and ' +
//
//         '(' +
//            'IsYouBetTrack=True ' +
//            ')' +
//
//         ')';
//
//         tblPrevDayHH.Filtered := True;
//
//         if tblPrevDayHH.RecordCount > 0 then begin
//            InitPrgBar();
//            DisplayGimmickResults(True);
//            GenerateReport();
//         end;
//
//         //
//         tblPrevDayRH.Active := False;
//         tblPrevDayHH.Active := False;
//         tblPrevDayHH.Active := True;
//
//         if (bPreviousDay) then begin
//            sFileName := 'Is1stMCL';
//         end else begin
//            sFileName := 'Is1stMCL21';
//         end;
//
//         lblReportTitle.Caption := 'Is1stMCL';
//         tblPrevDayHH.Filtered := False;
//         tblPrevDayHH.Filter := '(' +
//
//         '(' +
//            'Is1stMCL=True ' +
//            ')' +
//
//         ' and ' +
//
//         '(' +
//            'IsYouBetTrack=True ' +
//            ')' +
//
//         ')';
//
//         tblPrevDayHH.Filtered := True;
//
//         if tblPrevDayHH.RecordCount > 0 then begin
//            InitPrgBar();
//            DisplayGimmickResults(True);
//            GenerateReport();
//         end;


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


procedure TLinerResultsReportForm.CheckFilter();
var sFilter: string;
begin

   sFilter := tblPrevDayHH.Filter;

end;

procedure TLinerResultsReportForm.DisplayGimmickResults(bOn: boolean);
begin

   if (bOn) then begin
      imgDD.Visible := True;
      lblDDWagered.Visible := True;
      lblDDPayout.Visible := True;
      lblDDPL.Visible := True;
      varDDPL.Visible := True;
      varDDPayout.Visible := True;
      varDDWagered.Visible := True;

      imgPk3.Visible := True;
      lblPk3Wagered.Visible := True;
      lblPk3Payout.Visible := True;
      lblPk3PL.Visible := True;
      varPk3PL.Visible := True;
      varPk3Payout.Visible := True;
      varPk3Wagered.Visible := True;

      imgPk4.Visible := True;
      lblPk4Wagered.Visible := True;
      lblPk4Payout.Visible := True;
      lblPk4PL.Visible := True;
      varPk4PL.Visible := True;
      varPk4Payout.Visible := True;
      varPk4Wagered.Visible := True;

   end else begin
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

      lblTriSfcPL.Visible := True;
      lblExaQuiPL.Visible := True;
      lblDDPk3PL.Visible := True;
      lblPk4Pk6PL.Visible := True;

      vTriSfcPL.Visible := True;
      vExaQuiPL.Visible := True;
      vDDPk3PL.Visible := True;
      vPk4Pk6PL.Visible := True;

   end;

end;


procedure TLinerResultsReportForm.GenerateReport();
begin
   try
      with ppWagerResultsReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         lblFilter.Caption := tblPrevDayHH.Filter;
         lblFilter.Visible := True;

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

procedure TLinerResultsReportForm.InitPrgBar();
begin

   prgBar.Max := tblPrevDayHH.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;

procedure TLinerResultsReportForm.dbLinerWagerResultsReportBeforeConnect(
   Sender: TObject);
begin
   dbLinerWagerResultsReport.Directory := DATA_PATH;

end;

end.
