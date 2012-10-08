unit ReportPreviousDaysByDay;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog;

type
   TPreviousDaysByDayReportForm = class(TForm)
      dbLast90DaysReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblPrevDayHH: TDBISAMTable;
      dsPrevDayHH: TDataSource;
      plPrevDayHH: TppDBPipeline;
      ppLast90DaysReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      tblPrevDayRH: TDBISAMTable;
      dsPrevDayRH: TDataSource;
      plPrevDayRH: TppDBPipeline;
      hLog: TmLog;
      tblWagersByML: TDBISAMTable;
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
      ppSystemVariable1: TppSystemVariable;
      varStartDate: TppLabel;
      varEndDate: TppLabel;
      varFldName: TppDBText;
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
      dbDDFirstRace: TppDBText;
      dbPick3: TppDBText;
      dbPick4: TppDBText;
      dbDailyDoubleNbrsFirstRace: TppDBText;
      dbPick3Nbrs: TppDBText;
      dbPick4Nbrs: TppDBText;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      dbPlcNbrs: TppDBText;
      dbShoNbrs: TppDBText;
      dbPlcPayout: TppDBText;
      dbPlcShoPayout: TppDBText;
      dbShoPayout: TppDBText;
      dbRaceDate: TppDBText;
      dbRaceType: TppDBText;
      dbDaysLast: TppDBText;
      dbMorningLineTo1: TppDBText;
      grp2: TppGroup;
      grp2Header: TppGroupHeaderBand;
      grp0Footer: TppGroupFooterBand;
      imgPk3: TppShape;
      ppShape4: TppShape;
      varWins: TppVariable;
      varStarts: TppVariable;
      lblStarts: TppLabel;
      lblWins: TppLabel;
      varPlcs: TppVariable;
      ppLabel20: TppLabel;
      varWinPct: TppVariable;
      lblWinPct: TppLabel;
      varShos: TppVariable;
      lblShos: TppLabel;
      ppShape3: TppShape;
      lblAvgOdds: TppLabel;
      varAvgOdds: TppVariable;
      varTotalOdds: TppVariable;
      lblTotalOdds: TppLabel;
      ppLabel17: TppLabel;
      varWPSPL: TppVariable;
      varTriSfcPL: TppVariable;
      lblTriSfcPL: TppLabel;
      lblExaQuiPL: TppLabel;
      lblDDPk3PL: TppLabel;
      varExaQuiPL: TppVariable;
      varDDPk3PL: TppVariable;
      lblPk4Pk6PL: TppLabel;
      varPk4Pk6PL: TppVariable;
      imgTri: TppShape;
      imgSfc: TppShape;
      imgWin: TppShape;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      varWinWagered: TppVariable;
      varWinPayout: TppVariable;
      varWinPL: TppVariable;
      imgPlc: TppShape;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      varPlcWagered: TppVariable;
      varPlcPayout: TppVariable;
      varPlcPL: TppVariable;
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
      varShoPayout: TppVariable;
      varShoPL: TppVariable;
      lblPk3Wagered: TppLabel;
      lblPk3Payout: TppLabel;
      lblPk3PL: TppLabel;
      varPk3PL: TppVariable;
      varPk3Payout: TppVariable;
      varPk3Wagered: TppVariable;
      imgPk4: TppShape;
      lblPk4Wagered: TppLabel;
      varPk4Wagered: TppVariable;
      ppLabel33: TppLabel;
      varWinPLPct: TppVariable;
      ppLabel34: TppLabel;
      varPlcPLPct: TppVariable;
      ppLabel35: TppLabel;
      varShoPLPct: TppVariable;
      ppLabel39: TppLabel;
      varSfcPLPct: TppVariable;
      varTriPLPct: TppVariable;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      varQuiPLPct: TppVariable;
      ppLabel37: TppLabel;
      varPk3PLPct: TppVariable;
      ppLabel36: TppLabel;
      varDDPLPct: TppVariable;
      varTotalPL: TppVariable;
      ppLabel44: TppLabel;
      lblDDAvgPayout: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      varDDNbrWagers: TppVariable;
      varDDWinPct: TppVariable;
      varDDAvgPayout: TppVariable;
      lblExaWagered: TppLabel;
      lblExaPayout: TppLabel;
      lblExaPL: TppLabel;
      varExaPL: TppVariable;
      varExaPayout: TppVariable;
      varExaWagered: TppVariable;
      lblPk4Payout: TppLabel;
      lblPk4PL: TppLabel;
      varPk4PL: TppVariable;
      varPk4Payout: TppVariable;
      ppLabel42: TppLabel;
      varExaPLPct: TppVariable;
      ppLabel38: TppLabel;
      varPk4PLPct: TppVariable;
      lblFilter: TppLabel;
      ppLabel16: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      varPk3NbrWagers: TppVariable;
      varPk3WinPct: TppVariable;
      varPk3AvgPayout: TppVariable;
      ppLabel27: TppLabel;
      ppLabel43: TppLabel;
      varPk4NbrWagers: TppVariable;
      varPk4WinPct: TppVariable;
      varPk4AvgPayout: TppVariable;
      ppLabel23: TppLabel;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      varExaNbrWagers: TppVariable;
      varExaWinPct: TppVariable;
      varExaAvgPayout: TppVariable;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      varQuiAvgPayout: TppVariable;
      varQuiWinPct: TppVariable;
      varQuiNbrWagers: TppVariable;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      varTriAvgPayout: TppVariable;
      varTriWinPct: TppVariable;
      varTriNbrWagers: TppVariable;
      ppLabel45: TppLabel;
      ppLabel60: TppLabel;
      ppLabel61: TppLabel;
      varSfcAvgPayout: TppVariable;
      varSfcWinPct: TppVariable;
      varSfcNbrWagers: TppVariable;
      W: TppLabel;
      varWinDDPk3PL: TppVariable;
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
      procedure grp2AfterGroupBreak(Sender: TObject);
      procedure varStartsCalc(Sender: TObject; var Value: Variant);
      procedure varWinsCalc(Sender: TObject; var Value: Variant);
      procedure varPlcsCalc(Sender: TObject; var Value: Variant);
      procedure varWinPctCalc(Sender: TObject; var Value: Variant);
      procedure varAvgOddsCalc(Sender: TObject; var Value: Variant);
      procedure varTotalOddsCalc(Sender: TObject; var Value: Variant);
      procedure varWinWageredCalc(Sender: TObject; var Value: Variant);
      procedure varWinPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varWinPLCalc(Sender: TObject; var Value: Variant);
      procedure varWinPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varPlcWageredCalc(Sender: TObject; var Value: Variant);
      procedure varPlcPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varPlcPLCalc(Sender: TObject; var Value: Variant);
      procedure varPlcPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varShoWageredCalc(Sender: TObject; var Value: Variant);
      procedure varShoPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varShoPLCalc(Sender: TObject; var Value: Variant);
      procedure varShoPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varSfcWageredCalc(Sender: TObject; var Value: Variant);
      procedure varSfcPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varSfcPLCalc(Sender: TObject; var Value: Variant);
      procedure varSfcPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varTriWageredCalc(Sender: TObject; var Value: Variant);
      procedure varTriPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varTriPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varQuiWageredCalc(Sender: TObject; var Value: Variant);
      procedure varQuiPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varQuiPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varExaWageredCalc(Sender: TObject; var Value: Variant);
      procedure varExaPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varExaPLCalc(Sender: TObject; var Value: Variant);
      procedure varExaPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varDDWageredCalc(Sender: TObject; var Value: Variant);
      procedure varDDPayoutCalc(Sender: TObject; var Value: Variant);
      procedure varDDPLPctCalc(Sender: TObject; var Value: Variant);
      procedure varPk3WageredCalc(Sender: TObject; var Value: Variant);
      procedure varPk3PayoutCalc(Sender: TObject; var Value: Variant);
      procedure varPk3PLPctCalc(Sender: TObject; var Value: Variant);
      procedure varPk4WageredCalc(Sender: TObject; var Value: Variant);
      procedure varPk4PayoutCalc(Sender: TObject; var Value: Variant);
      procedure varPk4PLCalc(Sender: TObject; var Value: Variant);
      procedure varPk4PLPctCalc(Sender: TObject; var Value: Variant);
      procedure dbTrkCodePrint(Sender: TObject);
      procedure dbRaceNbrPrint(Sender: TObject);
      procedure dbProgramNbrPrint(Sender: TObject);
      procedure dbHorseNamePrint(Sender: TObject);
      procedure dbMLPrint(Sender: TObject);
      procedure dbRaceDatePrint(Sender: TObject);
      procedure dbRaceTypePrint(Sender: TObject);
      procedure dbFinishPosPrint(Sender: TObject);
      procedure dbOddsPrint(Sender: TObject);
      procedure dbWinNbrsPrint(Sender: TObject);
      procedure dbWinPayoutPrint(Sender: TObject);
      procedure dbWinPlcPayoutPrint(Sender: TObject);
      procedure dbWinShoPayoutPrint(Sender: TObject);
      procedure dbPlcNbrsPrint(Sender: TObject);
      procedure dbPlcPayoutPrint(Sender: TObject);
      procedure dbPlcShoPayoutPrint(Sender: TObject);
      procedure dbShoNbrsPrint(Sender: TObject);
      procedure dbShoPayoutPrint(Sender: TObject);
      procedure dbSheetOrderPrint(Sender: TObject);
      procedure FinishNbrsGetText(Sender: TObject; var Text: string);
      procedure FinishNbrsPrint(Sender: TObject);
      procedure dbSuperfectaWagerGetText(Sender: TObject; var Text: string);
      procedure dbSuperfectaWagerPrint(Sender: TObject);
      procedure dbSuperfectaPayoutPrint(Sender: TObject);
      procedure dbTrifectaWagerGetText(Sender: TObject; var Text: string);
      procedure dbTrifectaWagerPrint(Sender: TObject);
      procedure dbTrifectaPayoutPrint(Sender: TObject);
      procedure dbExactaWagerGetText(Sender: TObject; var Text: string);
      procedure dbExactaWagerPrint(Sender: TObject);
      procedure dbExactaPayoutPrint(Sender: TObject);
      procedure dbQuinellaWagerGetText(Sender: TObject; var Text: string);
      procedure dbQuinellaWagerPrint(Sender: TObject);
      procedure dbQuinellaPayoutPrint(Sender: TObject);
      procedure dbDailyDoubleWagerGetText(Sender: TObject; var Text: string);
      procedure dbDailyDoubleWagerPrint(Sender: TObject);
      procedure dbDailyDoublePayoutPrint(Sender: TObject);
      procedure dbDDFirstRacePrint(Sender: TObject);
      procedure dbDailyDoubleNbrsFirstRacePrint(Sender: TObject);
      procedure dbPick3WagerGetText(Sender: TObject; var Text: string);
      procedure dbPick3WagerPrint(Sender: TObject);
      procedure dbPick3PayoutPrint(Sender: TObject);
      procedure dbPick3Print(Sender: TObject);
      procedure dbPick3NbrsPrint(Sender: TObject);
      procedure dbPick4WagerGetText(Sender: TObject; var Text: string);
      procedure dbPick4WagerPrint(Sender: TObject);
      procedure dbPick4PayoutPrint(Sender: TObject);
      procedure dbPick4Print(Sender: TObject);
      procedure dbPick4NbrsPrint(Sender: TObject);
      procedure varWPSPLCalc(Sender: TObject; var Value: Variant);
      procedure varTriSfcPLCalc(Sender: TObject; var Value: Variant);
      procedure varExaQuiPLCalc(Sender: TObject; var Value: Variant);
      procedure varDDPk3PLCalc(Sender: TObject; var Value: Variant);
      procedure varPk4Pk6PLCalc(Sender: TObject; var Value: Variant);
      procedure varTotalPLCalc(Sender: TObject; var Value: Variant);
      function ComputePLPct(fWon: double; fWagered: double): double;
      procedure varTriPLCalc(Sender: TObject; var Value: Variant);
      procedure varPk3PLCalc(Sender: TObject; var Value: Variant);
      procedure varQuiPLCalc(Sender: TObject; var Value: Variant);
      procedure varDDPLCalc(Sender: TObject; var Value: Variant);
      procedure dbDaysLastPrint(Sender: TObject);
      procedure varWinDDPk3PLCalc(Sender: TObject; var Value: Variant);
      procedure varDDNbrWagersCalc(Sender: TObject; var Value: Variant);
      procedure varDDWinPctCalc(Sender: TObject; var Value: Variant);
      procedure varDDAvgPayoutCalc(Sender: TObject; var Value: Variant);
      procedure FldWagers();

   private
      { Private declarations }
      bCreateReportsActive: boolean;
      sReportNameSuffix: string;
      sReportNamePrefix: string;
   public
      bPrintDetail: boolean;
      bYouBetTracks: boolean;
      bAllTracks: boolean;
      bByRaceDate: boolean;
      bByTrkCode: boolean;
      bByRaceType: boolean;
      bByMorningLineTo1: boolean;
      bCreateWagerTable: boolean;

      { Public declarations }
      sFileName: string;
   end;

var
   PreviousDaysByDayReportForm: TPreviousDaysByDayReportForm;

implementation

uses UnitCommonCode, StrMan, FastStrings, ReportPreviousDays;

{$R *.DFM}

procedure TPreviousDaysByDayReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   bAllTracks := False;
   bYouBetTracks := False;
   bByRaceDate := False;
   bByTrkCode := False;
   bByMorningLineTo1 := False;
   bPrintDetail := True;
   bCreateWagerTable := False;

   with dbLast90DaysReport do begin
      Close;
      Open;
   end;

end;

procedure TPreviousDaysByDayReportForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbLast90DaysReport do begin
      Close;
   end;


end;

procedure TPreviousDaysByDayReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TPreviousDaysByDayReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TPreviousDaysByDayReportForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TPreviousDaysByDayReportForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TPreviousDaysByDayReportForm.plPrevDayHHTraversal(Sender: TObject);
begin
   prgBar.Position := prgBar.Position + 1;
   Application.ProcessMessages;
end;

procedure TPreviousDaysByDayReportForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure TPreviousDaysByDayReportForm.btnCreatePdfClick(Sender: TObject);
begin

   if (bCreateWagerTable) then begin
      tblWagersByML.Active := False;
      tblWagersByML.EmptyTable();
   end;

   if (bByRaceDate) then begin
      sReportNamePrefix := 'Prev21DaysByRaceDate';
      ppLast90DaysReport.Groups[0].BreakName := 'RaceDate';
      tblPrevDayHH.IndexName := 'ByRaceDate';
      varFldName.DataField := 'RaceDate';
   end;

   if (bByMorningLineTo1) then begin
      sReportNamePrefix := 'Prev21DaysByMorningLineTo1';
      ppLast90DaysReport.Groups[0].BreakName := 'MorningLineTo1';
      tblPrevDayHH.IndexName := 'ByMorningLineTo1';
      varFldName.DataField := 'MorningLineTo1';
   end;

   if (bByTrkCode) then begin
      sReportNamePrefix := 'Prev21DaysByTrkCode';
      ppLast90DaysReport.Groups[0].BreakName := 'TrkCode';
      tblPrevDayHH.IndexName := 'ByTrkCode';
      varFldName.DataField := 'TrkCode';
   end;

   if (bByRaceType) then begin
      sReportNamePrefix := 'Prev21DaysByRaceType';
      ppLast90DaysReport.Groups[0].BreakName := 'RaceType';
      tblPrevDayHH.IndexName := 'ByRaceType';
      varFldName.DataField := 'RaceType';
   end;

   if (bPrintDetail) then begin
      DetailBand.Visible := True;
      sReportNameSuffix := 'Detail';
   end else begin
      DetailBand.Visible := False;
      sReportNameSuffix := 'Summary';
   end;

   if not (bCreateWagerTable) then begin
      try
         try
            tblPrevDayRH.Active := False;
            tblPrevDayHH.Active := False;

            tblPrevDayHH.Active := True;
            tblWagersByML.Active := True;

            tblPrevDayHH.Filtered := False;
            tblPrevDayHH.Filter := WAGER_FILTER;
            CheckFilter();
            tblPrevDayHH.Filtered := True;

            if tblPrevDayHH.RecordCount > 0 then begin
               prgBar.Max := tblPrevDayHH.RecordCount;
               prgBar.Position := 0;
               pnlPrgBar.Visible := True;

               sFileName := 'ValueAllWager';
               lblReportTitle.Caption := 'Value Wagers';
               DisplayGimmickResults(True);
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
         tblWagersByML.Active := False;

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;
         staBar.SimpleText := '';
         bCreateReportsActive := False;
      end;
   end;


   try
      try
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblWagersByML.Active := True;

         tblPrevDayHH.Active := True;

         tblPrevDayHH.Filtered := False;
         tblPrevDayHH.Filter := TOP_PICK_FILTER;
         CheckFilter();
         tblPrevDayHH.Filtered := True;

         if tblPrevDayHH.RecordCount > 0 then begin
            prgBar.Max := tblPrevDayHH.RecordCount;
            prgBar.Position := 0;
            pnlPrgBar.Visible := True;

            sFileName := 'HospitalAllWager';
            lblReportTitle.Caption := 'Hospital Wagers';
            DisplayGimmickResults(True);
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
      tblWagersByML.Active := False;

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

end;


procedure TPreviousDaysByDayReportForm.CheckFilter();
var sFilter: string;
begin

   sFilter := tblPrevDayHH.Filter;
   if (bYouBetTracks) then begin
      tblPrevDayHH.Filter := FastReplace(sFilter, '(IsPrintedOnValueSheet)', '(IsYouBetTrack)', False);
   end;

   if (bAllTracks) then begin
      tblPrevDayHH.Filter := FastReplace(sFilter, 'and (IsPrintedOnValueSheet=True)', ' ', False);
   end;

   sFilter := tblPrevDayHH.Filter;
   if (bByMorningLineTo1) then begin
      tblPrevDayHH.Filter := FastReplace(sFilter, '(MorningLineTo1 > 2.00) and', ' ', False);
   end;

   //   hLog.AddToLog(tblPrevDayHH.Filter, msevOperation);

end;

procedure TPreviousDaysByDayReportForm.DisplayGimmickResults(bOn: boolean);
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

      lblTriSfcPL.Visible := True;
      lblExaQuiPL.Visible := True;
      lblDDPk3PL.Visible := True;
      lblPk4Pk6PL.Visible := True;

      varTriSfcPL.Visible := True;
      varExaQuiPL.Visible := True;
      varDDPk3PL.Visible := True;
      varPk4Pk6PL.Visible := True;

      varSfcNbrWagers.Visible := True;
      varSfcWinPct.Visible := True;
      varSfcAvgPayout.Visible := True;

      varWinDDPk3PL.Visible := True;

   end else begin
      imgDD.Visible := False;
      lblDDWagered.Visible := False;
      lblDDPayout.Visible := False;
      lblDDPL.Visible := False;
      varDDPL.Visible := False;
      varDDPayout.Visible := False;
      varDDWagered.Visible := False;

      imgPk3.Visible := False;
      lblPk3Wagered.Visible := False;
      lblPk3Payout.Visible := False;
      lblPk3PL.Visible := False;

      varPk3PL.Visible := False;
      varPk3Payout.Visible := False;
      varPk3Wagered.Visible := False;

      imgPk4.Visible := False;
      lblPk4Wagered.Visible := False;
      lblPk4Payout.Visible := False;
      lblPk4PL.Visible := False;

      varPk4PL.Visible := False;
      varPk4Payout.Visible := False;
      varPk4Wagered.Visible := False;

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

      lblTriSfcPL.Visible := False;
      lblExaQuiPL.Visible := False;
      lblDDPk3PL.Visible := False;
      lblPk4Pk6PL.Visible := False;

      varTriSfcPL.Visible := False;
      varExaQuiPL.Visible := False;
      varDDPk3PL.Visible := False;
      varPk4Pk6PL.Visible := False;

   end;

end;


procedure TPreviousDaysByDayReportForm.GenerateReport();
begin
   try
      with ppLast90DaysReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         if (bPrintDetail) then begin
            if (bYouBetTracks) then begin
               lblReportTitle.Caption := 'YouBet ' + lblReportTitle.Caption;
               lblFilter.Caption := tblPrevDayHH.Filter;
               lblFilter.Visible := True;
               TextFileName := PDF_YOUBET_RESULTS_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end else begin
               lblReportTitle.Caption := lblReportTitle.Caption;
               lblFilter.Caption := tblPrevDayHH.Filter;
               lblFilter.Visible := True;
               TextFileName := PDF_RESULTS_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end;
         end else begin
            if (bYouBetTracks) then begin
               lblReportTitle.Caption := 'YouBet ' + lblReportTitle.Caption + ' Summary';
               lblFilter.Caption := tblPrevDayHH.Filter;
               lblFilter.Visible := True;
               TextFileName := PDF_YOUBET_SUMMARY_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end else begin
               lblReportTitle.Caption := lblReportTitle.Caption + ' Summary';
               lblFilter.Caption := tblPrevDayHH.Filter;
               lblFilter.Visible := True;
               TextFileName := PDF_SUMMARY_REPORT_PATH + sReportNamePrefix + sFileName + sReportNameSuffix + '.pdf';
            end;
         end;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppLast90DaysReport.Print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;


procedure TPreviousDaysByDayReportForm.grp2AfterGroupBreak(Sender: TObject);
begin

   if (bCreateWagerTable) then begin

      tblWagersByML.IndexName := '';
      tblWagersByML.SetKey();
      tblWagersByML.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
      if (tblWagersByML.GotoKey()) then begin
         tblWagersByML.Edit();
         FldWagers();
         tblWagersByML.Post();
      end else begin
         tblWagersByML.Append();
         tblWagersByML.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
         FldWagers();
         tblWagersByML.Post();
      end;

      //      tblWagersByMLTrkCode.IndexName := '';
      //      tblWagersByMLTrkCode.SetKey();
      //      tblWagersByMLTrkCode.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
      //      if (tblWagersByMLTrkCode.GotoKey()) then begin
      //         tblWagersByMLTrkCode.Edit();
      //         FldWagersTrkCode();
      //         tblWagersByMLTrkCode.Post();
      //      end else begin
      //         tblWagersByMLTrkCode.Append();
      //         tblWagersByMLTrkCode.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
      //         FldWagersTrkCode();
      //         tblWagersByMLTrkCode.Post();
      //      end;


   end;


   varStarts.AsInteger := 0;
   varWins.AsInteger := 0;
   varPlcs.AsInteger := 0;
   varShos.AsInteger := 0;

   varAvgOdds.AsDouble := 0;
   varTotalOdds.AsDouble := 0;

   varWinWagered.AsDouble := 0;
   varWinPL.AsDouble := 0;
   varWinPayout.AsDouble := 0;
   varWinPLPct.AsDouble := 0;

   varPlcWagered.AsDouble := 0;
   varPlcPL.AsDouble := 0;
   varPlcPayout.AsDouble := 0;
   varPlcPLPct.AsDouble := 0;

   varShoWagered.AsDouble := 0;
   varShoPL.AsDouble := 0;
   varShoPayout.AsDouble := 0;
   varShoPLPct.AsDouble := 0;

   varDDWagered.AsDouble := 0;
   varDDPL.AsDouble := 0;
   varDDPayout.AsDouble := 0;
   varDDPLPct.AsDouble := 0;
   varDDNbrWagers.AsInteger := 0;
   varDDWinPct.AsDouble := 0;
   varDDAvgPayout.AsDouble := 0;

   varSfcWagered.AsDouble := 0;
   varSfcPL.AsDouble := 0;
   varSfcPayout.AsDouble := 0;
   varSfcPLPct.AsDouble := 0;
   varSfcNbrWagers.AsInteger := 0;
   varSfcWinPct.AsDouble := 0;
   varSfcAvgPayout.AsDouble := 0;

   varTriWagered.AsDouble := 0;
   varTriPL.AsDouble := 0;
   varTriPayout.AsDouble := 0;
   varTriPLPct.AsDouble := 0;
   varTriNbrWagers.AsInteger := 0;
   varTriWinPct.AsDouble := 0;
   varTriAvgPayout.AsDouble := 0;

   varPk3Wagered.AsDouble := 0;
   varPk3PL.AsDouble := 0;
   varPk3Payout.AsDouble := 0;
   varPk3PLPct.AsDouble := 0;
   varPk3NbrWagers.AsInteger := 0;
   varPk3WinPct.AsDouble := 0;
   varPk3AvgPayout.AsDouble := 0;

   varPk4Wagered.AsDouble := 0;
   varPk4PL.AsDouble := 0;
   varPk4Payout.AsDouble := 0;
   varPk4PLPct.AsDouble := 0;
   varPk4NbrWagers.AsInteger := 0;
   varPk4WinPct.AsDouble := 0;
   varPk4AvgPayout.AsDouble := 0;

   varExaWagered.AsDouble := 0;
   varExaPL.AsDouble := 0;
   varExaPayout.AsDouble := 0;
   varExaPLPct.AsDouble := 0;
   varExaNbrWagers.AsInteger := 0;
   varExaWinPct.AsDouble := 0;
   varExaAvgPayout.AsDouble := 0;

   varQuiWagered.AsDouble := 0;
   varQuiPL.AsDouble := 0;
   varQuiPayout.AsDouble := 0;
   varQuiPLPct.AsDouble := 0;
   varQuiNbrWagers.AsInteger := 0;
   varQuiWinPct.AsDouble := 0;
   varQuiAvgPayout.AsDouble := 0;

   varWPSPL.AsDouble := 0;
   varTriSfcPL.AsDouble := 0;
   varExaQuiPL.AsDouble := 0;
   varDDPK3PL.AsDouble := 0;
   varPk4Pk6PL.AsDouble := 0;
   varWinDDPk3PL.AsDouble := 0;

end;


procedure TPreviousDaysByDayReportForm.FldWagers();
begin

   tblWagersByML.FieldByName('Starts').AsInteger := varStarts.AsInteger;
   tblWagersByML.FieldByName('Wins').AsInteger := varWins.AsInteger;
   tblWagersByML.FieldByName('Plcs').AsInteger := varPlcs.AsInteger;
   tblWagersByML.FieldByName('Shos').AsInteger := varShos.AsInteger;

   tblWagersByML.FieldByName('AvgOdds').AsFloat := Round(varAvgOdds.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('TotalOdds').AsFloat := Round(varTotalOdds.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('WinWagered').AsFloat := Round(varWinWagered.AsDouble * 100) / 100; ;
   tblWagersByML.FieldByName('WinPL').AsFloat := Round(varWinPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('WinPayout').AsFloat := Round(varWinPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('WinPLPct').AsFloat := Round(varWinPLPct.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('PlcWagered').AsFloat := Round(varPlcWagered.AsDouble * 100) / 100; ;
   tblWagersByML.FieldByName('PlcPL').AsFloat := Round(varPlcPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('PlcPayout').AsFloat := Round(varPlcPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('PlcPLPct').AsFloat := Round(varPlcPLPct.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('ShoWagered').AsFloat := Round(varShoWagered.AsDouble * 100) / 100; ;
   tblWagersByML.FieldByName('ShoPL').AsFloat := Round(varShoPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ShoPayout').AsFloat := Round(varShoPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ShoPLPct').AsFloat := Round(varShoPLPct.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('DDWagered').AsFloat := Round(varDDWagered.AsDouble * 100) / 100; ;
   tblWagersByML.FieldByName('DDPL').AsFloat := Round(varDDPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('DDPayout').AsFloat := Round(varDDPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('DDPLPct').AsFloat := Round(varDDPLPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('DDNbrWagers').AsInteger := varDDNbrWagers.AsInteger;
   tblWagersByML.FieldByName('DDWinPct').AsFloat := Round(varDDWinPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('DDAvgPayout').AsFloat := Round(varDDAvgPayout.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('SfcWagered').AsFloat := Round(varSfcWagered.AsDouble * 100) / 100; ;
   tblWagersByML.FieldByName('SfcPL').AsFloat := Round(varSfcPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('SfcPayout').AsFloat := Round(varSfcPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('SfcPLPct').AsFloat := Round(varSfcPLPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('SfcNbrWagers').AsInteger := varSfcNbrWagers.AsInteger;
   tblWagersByML.FieldByName('SfcWinPct').AsFloat := Round(varSfcWinPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('SfcAvgPayout').AsFloat := Round(varSfcAvgPayout.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('TriWagered').AsFloat := Round(varTriWagered.AsDouble * 100) / 100; ;
   tblWagersByML.FieldByName('TriPL').AsFloat := Round(varTriPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('TriPayout').AsFloat := Round(varTriPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('TriPLPct').AsFloat := Round(varTriPLPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('TriNbrWagers').AsInteger := varTriNbrWagers.AsInteger;
   tblWagersByML.FieldByName('TriWinPct').AsFloat := Round(varTriWinPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('TriAvgPayout').AsFloat := Round(varTriAvgPayout.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('Pk3Wagered').AsFloat := Round(varPk3Wagered.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk3PL').AsFloat := Round(varPk3PL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk3Payout').AsFloat := Round(varPk3Payout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk3PLPct').AsFloat := Round(varPk3PLPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk3NbrWagers').AsInteger := varPk3NbrWagers.AsInteger;
   tblWagersByML.FieldByName('Pk3WinPct').AsFloat := Round(varPk3WinPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk3AvgPayout').AsFloat := Round(varPk3AvgPayout.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('Pk4Wagered').AsFloat := Round(varPk4Wagered.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk4PL').AsFloat := Round(varPk4PL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk4Payout').AsFloat := Round(varPk4Payout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk4PLPct').AsFloat := Round(varPk4PLPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk4NbrWagers').AsInteger := varPk4NbrWagers.AsInteger;
   tblWagersByML.FieldByName('Pk4WinPct').AsFloat := Round(varPk4WinPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk4AvgPayout').AsFloat := Round(varPk4AvgPayout.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('ExaWagered').AsFloat := Round(varExaWagered.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ExaPL').AsFloat := Round(varExaPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ExaPayout').AsFloat := Round(varExaPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ExaPLPct').AsFloat := Round(varExaPLPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ExaNbrWagers').AsInteger := varExaNbrWagers.AsInteger;
   tblWagersByML.FieldByName('ExaWinPct').AsFloat := Round(varExaWinPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ExaAvgPayout').AsFloat := Round(varExaAvgPayout.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('QuiWagered').AsFloat := Round(varQuiWagered.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('QuiPL').AsFloat := Round(varQuiPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('QuiPayout').AsFloat := Round(varQuiPayout.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('QuiPLPct').AsFloat := Round(varQuiPLPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('QuiNbrWagers').AsInteger := varQuiNbrWagers.AsInteger;
   tblWagersByML.FieldByName('QuiWinPct').AsFloat := Round(varQuiWinPct.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('QuiAvgPayout').AsFloat := Round(varQuiAvgPayout.AsDouble * 100) / 100;

   tblWagersByML.FieldByName('WPSPL').AsFloat := Round(varWPSPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('TriSfcPL').AsFloat := Round(varTriSfcPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('ExaQuiPL').AsFloat := Round(varExaQuiPL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('DDPK3PL').AsFloat := Round(varDDPK3PL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('Pk4Pk6PL').AsFloat := Round(varPk4Pk6PL.AsDouble * 100) / 100;
   tblWagersByML.FieldByName('WinDDPk3PL').AsFloat := Round(varWinDDPk3PL.AsDouble * 100) / 100;

end;

// DETAIL LINE

procedure TPreviousDaysByDayReportForm.dbTrkCodePrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbTrkCode.Font.Style := [fsBold];
   end else begin
      dbTrkCode.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbRaceNbrPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbRaceNbr.Font.Style := [fsBold];
   end else begin
      dbRaceNbr.Font.Style := [];
   end;


end;

procedure TPreviousDaysByDayReportForm.dbProgramNbrPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbProgramNbr.Font.Style := [fsBold];
   end else begin
      dbProgramNbr.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbHorseNamePrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbHorseName.Font.Style := [fsBold];
   end else begin
      dbHorseName.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbMLPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbML.Font.Style := [fsBold];
   end else begin
      dbML.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbRaceDatePrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbRaceDate.Font.Style := [fsBold];
   end else begin
      dbRaceDate.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbRaceTypePrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbRaceType.Font.Style := [fsBold];
   end else begin
      dbRaceType.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbDaysLastPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbDaysLast.Font.Style := [fsBold];
   end else begin
      dbDaysLast.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbFinishPosPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbFinishPos.Font.Style := [fsBold];
   end else begin
      dbFinishPos.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbOddsPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbOdds.Font.Style := [fsBold];
   end else begin
      dbOdds.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbWinNbrsPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbWinNbrs.Font.Style := [fsBold];
   end else begin
      dbWinNbrs.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbWinPayoutPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbWinPayout.Font.Style := [fsBold];
   end else begin
      dbWinPayout.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbWinPlcPayoutPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbWinPlcPayout.Font.Style := [fsBold];
   end else begin
      dbWinPlcPayout.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbWinShoPayoutPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbWinShoPayout.Font.Style := [fsBold];
   end else begin
      dbWinShoPayout.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPlcNbrsPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbPlcNbrs.Font.Style := [fsBold];
   end else begin
      dbPlcNbrs.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPlcPayoutPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbPlcPayout.Font.Style := [fsBold];
   end else begin
      dbPlcPayout.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPlcShoPayoutPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbPlcShoPayout.Font.Style := [fsBold];
   end else begin
      dbPlcShoPayout.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbShoNbrsPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbShoNbrs.Font.Style := [fsBold];
   end else begin
      dbShoNbrs.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbShoPayoutPrint(Sender: TObject);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbShoPayout.Font.Style := [fsBold];
   end else begin
      dbShoPayout.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbSheetOrderPrint(Sender: TObject);
begin

   dbSheetOrder.Font.Style := [];

   if plPrevDayHH['FinishPos'] = 1 then begin
      dbSheetOrder.Font.Style := [fsBold];
   end else begin
      dbSheetOrder.Font.Style := [];
   end;

end;

procedure TPreviousDaysByDayReportForm.FinishNbrsGetText(Sender: TObject; var Text: string);
begin
   Text := '';

   if Trim(plPrevDayRH['SuperfectaNbrs']) <> '' then begin
      Text := plPrevDayRH['SuperfectaNbrs'];
   end;

   if Trim(Text) = '' then begin
      Text := plPrevDayRH['TrifectaNbrs'];
   end;

   if Trim(Text) = '' then begin
      Text := plPrevDayRH['ExactaNbrs'];
   end;

   if Trim(Text) = '' then begin
      Text := plPrevDayRH['QuinellaNbrs'];
   end;

end;

procedure TPreviousDaysByDayReportForm.FinishNbrsPrint(Sender: TObject);
begin

   FinishNbrs.Font.Style := [];

   if plPrevDayHH['FinishPos'] = 1 then begin
      FinishNbrs.Font.Style := [fsBold];
   end;

end;

procedure TPreviousDaysByDayReportForm.dbSuperfectaWagerGetText(Sender: TObject; var Text: string);
begin

   if plPrevDayRH['SuperfectaWager'] = 1 then begin
      Text := '$1';
   end;
   if plPrevDayRH['SuperfectaWager'] = 2 then begin
      Text := '$2';
   end;


end;

procedure TPreviousDaysByDayReportForm.dbSuperfectaWagerPrint(Sender: TObject);
begin

   dbSuperfectaWager.Font.Style := [];
   if plPrevDayRH['IsSuperfectaMatched'] = True then begin
      dbSuperfectaWager.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsSuperRace'] = True then begin
      dbSuperfectaWager.Visible := True;
   end else begin
      dbSuperfectaWager.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbSuperfectaPayoutPrint(Sender: TObject);
begin

   dbSuperfectaPayout.Font.Style := [];
   if plPrevDayRH['IsSuperfectaMatched'] = True then begin
      dbSuperfectaPayout.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsSuperRace'] = True then begin
      dbSuperfectaPayout.Visible := True;
   end else begin
      dbSuperfectaPayout.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbTrifectaWagerGetText(Sender: TObject; var Text: string);
begin

   if plPrevDayRH['TrifectaWager'] = 1 then begin
      Text := '$1';
   end;
   if plPrevDayRH['TrifectaWager'] = 2 then begin
      Text := '$2';
   end;

end;

procedure TPreviousDaysByDayReportForm.dbTrifectaWagerPrint(Sender: TObject);
begin

   dbTrifectaWager.Font.Style := [];
   if plPrevDayRH['IsTrifectaMatched'] = True then begin
      dbTrifectaWager.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsTriRace'] = True then begin
      dbTrifectaWager.Visible := True;
   end else begin
      dbTrifectaWager.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbTrifectaPayoutPrint(Sender: TObject);
begin

   dbTrifectaPayout.Font.Style := [];
   if plPrevDayRH['IsTrifectaMatched'] = True then begin
      dbTrifectaPayout.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsTriRace'] = True then begin
      dbTrifectaPayout.Visible := True;
   end else begin
      dbTrifectaPayout.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbExactaWagerGetText(Sender: TObject; var Text: string);
begin

   if plPrevDayRH['ExactaWager'] = 1 then begin
      Text := '$1';
   end;
   if plPrevDayRH['ExactaWager'] = 2 then begin
      Text := '$2';
   end;


end;

procedure TPreviousDaysByDayReportForm.dbExactaWagerPrint(Sender: TObject);
begin

   dbExactaWager.Font.Style := [];
   if plPrevDayRH['IsExactaMatched'] = True then begin
      dbExactaWager.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsExaRace'] = True then begin
      dbExactaWager.Visible := True;
   end else begin
      dbExactaWager.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbExactaPayoutPrint(Sender: TObject);
begin

   dbExactaPayout.Font.Style := [];
   if plPrevDayRH['IsExactaMatched'] = True then begin
      dbExactaPayout.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsExaRace'] = True then begin
      dbExactaPayout.Visible := True;
   end else begin
      dbExactaPayout.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbQuinellaWagerGetText(Sender: TObject; var Text: string);
begin

   if plPrevDayRH['QuinellaWager'] = 1 then begin
      Text := '$1';
   end;
   if plPrevDayRH['QuinellaWager'] = 2 then begin
      Text := '$2';
   end;

end;

procedure TPreviousDaysByDayReportForm.dbQuinellaWagerPrint(Sender: TObject);
begin

   dbQuinellaWager.Font.Style := [];
   if plPrevDayRH['IsQuinellaMatched'] = True then begin
      dbQuinellaWager.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsQuiRace'] = True then begin
      dbQuinellaWager.Visible := True;
   end else begin
      dbQuinellaWager.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbQuinellaPayoutPrint(Sender: TObject);
begin

   dbQuinellaPayout.Font.Style := [];

   if plPrevDayRH['IsQuinellaMatched'] = True then begin
      dbQuinellaPayout.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsQuiRace'] = True then begin
      dbQuinellaPayout.Visible := True;
   end else begin
      dbQuinellaPayout.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbDailyDoubleWagerGetText(Sender: TObject; var Text: string);
begin

   if plPrevDayRH['DailyDoubleWagerFirstRace'] = 1 then begin
      Text := '$1';
   end;
   if plPrevDayRH['DailyDoubleWagerFirstRace'] = 2 then begin
      Text := '$2';
   end;

end;

procedure TPreviousDaysByDayReportForm.dbDailyDoubleWagerPrint(
   Sender: TObject);
begin

   dbDailyDoubleWager.Font.Style := [];
   if plPrevDayRH['IsDailyDoubleMatchedFirstRace'] = True then begin
      dbDailyDoubleWager.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsDDRace'] = True then begin
      dbDailyDoubleWager.Visible := True;
   end else begin
      dbDailyDoubleWager.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbDailyDoublePayoutPrint(Sender: TObject);
begin

   dbDailyDoublePayout.Font.Style := [];
   if plPrevDayRH['IsDailyDoubleMatchedFirstRace'] = True then begin
      dbDailyDoublePayout.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsDDRace'] = True then begin
      dbDailyDoublePayout.Visible := True;
   end else begin
      dbDailyDoublePayout.Visible := False;
   end;


end;

procedure TPreviousDaysByDayReportForm.dbDDFirstRacePrint(Sender: TObject);
begin

   dbDDFirstRace.Font.Style := [];
   if plPrevDayRH['IsDailyDoubleMatchedFirstRace'] = True then begin
      dbDDFirstRace.Font.Style := [fsBold];
   end;


   if plPrevDayRH['IsDDRace'] = True then begin
      dbDDFirstRace.Visible := True;
   end else begin
      dbDDFirstRace.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbDailyDoubleNbrsFirstRacePrint(Sender: TObject);
begin

   dbDailyDoubleNbrsFirstRace.Font.Style := [];
   if plPrevDayRH['IsDailyDoubleMatchedFirstRace'] = True then begin
      dbDailyDoubleNbrsFirstRace.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsDDRace'] = True then begin
      dbDailyDoubleNbrsFirstRace.Visible := True;
   end else begin
      dbDailyDoubleNbrsFirstRace.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick3WagerGetText(Sender: TObject; var Text: string);
begin
   if plPrevDayRH['Pick3WagerFirstRace'] = 1 then begin
      Text := '$1';
   end;
   if plPrevDayRH['Pick3WagerFirstRace'] = 2 then begin
      Text := '$2';
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick3WagerPrint(Sender: TObject);
begin

   dbPick3Wager.Font.Style := [];
   if plPrevDayRH['IsPick3MatchedFirstRace'] = True then begin
      dbPick3Wager.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsPk3Race'] = True then begin
      dbPick3Wager.Visible := True;
   end else begin
      dbPick3Wager.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick3PayoutPrint(Sender: TObject);
begin

   dbPick3Payout.Font.Style := [];
   if plPrevDayRH['IsPick3MatchedFirstRace'] = True then begin
      dbPick3Payout.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsPk3Race'] = True then begin
      dbPick3Payout.Visible := True;
   end else begin
      dbPick3Payout.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick3Print(Sender: TObject);
begin

   dbPick3.Font.Style := [];
   if plPrevDayRH['IsPick3MatchedFirstRace'] = True then begin
      dbPick3.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsPk3Race'] = True then begin
      dbPick3.Visible := True;
   end else begin
      dbPick3.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick3NbrsPrint(Sender: TObject);
begin

   dbPick3Nbrs.Font.Style := [];
   if plPrevDayRH['IsPick3MatchedFirstRace'] = True then begin
      dbPick3Nbrs.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsPk3Race'] = True then begin
      dbPick3Nbrs.Visible := True;
   end else begin
      dbPick3Nbrs.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick4WagerGetText(Sender: TObject;
   var Text: string);
begin

   if plPrevDayRH['Pick4WagerFirstRace'] = 1 then begin
      Text := '$1';
   end;
   if plPrevDayRH['Pick4WagerFirstRace'] = 2 then begin
      Text := '$2';
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick4WagerPrint(Sender: TObject);
begin

   dbPick4Wager.Font.Style := [];
   if plPrevDayRH['IsPick4MatchedFirstRace'] = True then begin
      dbPick4Wager.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsPk4Race'] = True then begin
      dbPick4Wager.Visible := True;
   end else begin
      dbPick4Wager.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick4PayoutPrint(Sender: TObject);
begin

   dbPick4Payout.Font.Style := [];
   if plPrevDayRH['IsPick4MatchedFirstRace'] = True then begin
      dbPick4Payout.Font.Style := [fsBold];
   end;
   if plPrevDayRH['IsPk4Race'] = True then begin
      dbPick4Payout.Visible := True;
   end else begin
      dbPick4Payout.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick4Print(Sender: TObject);
begin

   dbPick4.Font.Style := [];
   if plPrevDayRH['IsPick4MatchedFirstRace'] = True then begin
      dbPick4.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsPk4Race'] = True then begin
      dbPick4.Visible := True;
   end else begin
      dbPick4.Visible := False;
   end;

end;

procedure TPreviousDaysByDayReportForm.dbPick4NbrsPrint(Sender: TObject);
begin

   dbPick4Nbrs.Font.Style := [];
   if plPrevDayRH['IsPick4MatchedFirstRace'] = True then begin
      dbPick4Nbrs.Font.Style := [fsBold];
   end;

   if plPrevDayRH['IsPk4Race'] = True then begin
      dbPick4Nbrs.Visible := True;
   end else begin
      dbPick4Nbrs.Visible := False;
   end;


end;

// FOOTER

procedure TPreviousDaysByDayReportForm.varStartsCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayHH['FinishPos'] > 0 then begin
      if plPrevDayHH['Odds'] > 0 then begin
         Value := Value + 1;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varWinsCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayHH['FinishPos'] = 1 then begin
      if plPrevDayHH['Odds'] > 0 then begin
         Value := Value + 1;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varPlcsCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayHH['FinishPos'] = 2 then begin
      if plPrevDayHH['Odds'] > 0 then begin
         Value := Value + 1;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varWinPctCalc(Sender: TObject; var Value: Variant);
var
   iWinPct: integer;
   fWinPct: double;
begin

   iWinPct := 0;
   fWinPct := 0;

   if (varStarts.AsInteger > 0) then begin
      fWinPct := (varWins.AsInteger / varStarts.AsInteger) * 100;
   end;

   Value := fWinPct;

end;

procedure TPreviousDaysByDayReportForm.varAvgOddsCalc(Sender: TObject; var Value: Variant);
var
   fAvgOdds: double;
   fStarts: double;
   fWins: double;

begin

   fAvgOdds := 0;
   fStarts := 0;
   fWins := 0;

   fStarts := varStarts.AsInteger;
   fWins := varWins.AsInteger;

   if (fWins > 0) then begin
      fAvgOdds := (varTotalOdds.AsDouble / fWins);
   end;

   Value := fAvgOdds;

end;

procedure TPreviousDaysByDayReportForm.varTotalOddsCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayHH['Odds'] > 0 then begin
      if plPrevDayHH['FinishPos'] = 1 then begin
         Value := Value + plPrevDayHH['Odds'];
      end;
   end;

end;

// Win Wagered

procedure TPreviousDaysByDayReportForm.varWinWageredCalc(Sender: TObject; var Value: Variant);
var
   fStarts: double;
   fWinWagered: double;

begin
   fWinWagered := 0;
   fStarts := 0;

   fStarts := varStarts.AsInteger;

   if (fStarts > 0) then begin
      fWinWagered := (fStarts * 2.00);
   end;

   Value := fWinWagered;

end;

procedure TPreviousDaysByDayReportForm.varWinPayoutCalc(Sender: TObject; var Value: Variant);
var
   fWins: double;
   fTotalOdds: double;
   fWagered: double;
   fTotalPayout: double;

begin

   fWins := 0;
   fTotalOdds := 0;
   fWagered := 0;
   fTotalPayout := 0;

   fWins := varWins.AsInteger;
   fTotalOdds := varTotalOdds.AsDouble;

   if (fWins > 0) then begin
      fWagered := fWins * 2.00;
      fTotalPayout := (fTotalOdds * 2.00) + fWagered;
   end;

   Value := fTotalPayout;

end;

procedure TPreviousDaysByDayReportForm.varWinPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;

begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varWinPayout.AsDouble;
   fTotalWagered := varWinWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varWinPLPctCalc(Sender: TObject; var Value: Variant);
begin

   Value := ComputePLPct(varWinPayout.AsDouble, varWinWagered.AsDouble)

end;

// Place Wagered

procedure TPreviousDaysByDayReportForm.varPlcWageredCalc(Sender: TObject; var Value: Variant);
var
   fStarts: double;
   fTotalWagered: double;

begin
   fStarts := 0;
   fTotalWagered := 0;
   fStarts := varStarts.AsInteger;

   if (fStarts > 0) then begin
      fTotalWagered := (fStarts * 2.00);
   end;

   Value := fTotalWagered;
end;

procedure TPreviousDaysByDayReportForm.varPlcPayoutCalc(Sender: TObject; var Value: Variant);
var
   fPlcPayout: double;

begin
   fPlcPayout := 0;

   if ((plPrevDayHH['FinishPos'] = 1)) then begin
      fPlcPayout := plPrevDayRH['WinPlcPayout'];
      Value := Value + fPlcPayout;
   end;

   if ((plPrevDayHH['FinishPos'] = 2)) then begin
      fPlcPayout := plPrevDayRH['PlcPayout'];
      Value := Value + fPlcPayout;
   end;
end;

procedure TPreviousDaysByDayReportForm.varPlcPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varPlcPayout.AsDouble;
   fTotalWagered := varPlcWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varPlcPLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varPlcPayout.AsDouble, varPlcWagered.AsDouble)
end;

// Show Wagered

procedure TPreviousDaysByDayReportForm.varShoWageredCalc(Sender: TObject; var Value: Variant);
var
   fStarts: double;
   fTotalWagered: double;

begin

   fStarts := 0;
   fTotalWagered := 0;

   fStarts := varStarts.AsInteger;

   if (fStarts > 0) then begin
      fTotalWagered := (fStarts * 2.00);
   end;

   Value := fTotalWagered;

end;

procedure TPreviousDaysByDayReportForm.varShoPayoutCalc(Sender: TObject; var Value: Variant);
var
   fShoPayout: double;

begin
   fShoPayout := 0;

   if ((plPrevDayHH['FinishPos'] = 1)) then begin
      fShoPayout := plPrevDayRH['WinShoPayout'];
      Value := Value + fShoPayout;
   end;

   if ((plPrevDayHH['FinishPos'] = 2)) then begin
      fShoPayout := plPrevDayRH['PlcShoPayout'];
      Value := Value + fShoPayout;
   end;

   if ((plPrevDayHH['FinishPos'] = 3)) then begin
      fShoPayout := plPrevDayRH['ShoPayout'];
      Value := Value + fShoPayout;
   end;

end;


procedure TPreviousDaysByDayReportForm.varShoPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;


   fTotalPayout := varShoPayout.AsDouble;
   fTotalWagered := varShoWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varShoPLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varShoPayout.AsDouble, varShoWagered.AsDouble)
end;

//Superfecta Wagers

procedure TPreviousDaysByDayReportForm.varSfcWageredCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsSuperRace'] = True then begin
      if plPrevDayHH['FinishPos'] > 0 then begin
         if plPrevDayHH['Odds'] > 0 then begin
            if (plPrevDayRH['SuperfectaPayout'] > 0) then begin
               Value := Value + 2.00;
            end;
         end;
      end;
   end;
end;

procedure TPreviousDaysByDayReportForm.varSfcPayoutCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsSuperRace'] = True then begin
      if plPrevDayRH['IsSuperfectaMatched'] = True then begin
         if (plPrevDayRH['SuperfectaWager'] = 1) then begin
            Value := Value + (plPrevDayRH['SuperfectaPayout'] * 2);
         end else begin
            Value := Value + plPrevDayRH['SuperfectaPayout'];
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varSfcPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varSfcPayout.AsDouble;
   fTotalWagered := varSfcWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varSfcPLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varSfcPayout.AsDouble, varSfcWagered.AsDouble)
end;


//Trifecta Wagers

procedure TPreviousDaysByDayReportForm.varTriWageredCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsTriRace'] = True then begin
      if plPrevDayHH['FinishPos'] > 0 then begin
         if plPrevDayHH['Odds'] > 0 then begin
            if (plPrevDayRH['TrifectaPayout'] > 0) then begin
               Value := Value + 2.00;
            end;
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varTriPayoutCalc(Sender: TObject; var Value: Variant);
begin
   if plPrevDayRH['IsTriRace'] = True then begin
      if plPrevDayRH['IsTrifectaMatched'] = True then begin
         if (plPrevDayRH['TrifectaWager'] = 1) then begin
            Value := Value + (plPrevDayRH['TrifectaPayout'] * 2);
         end else begin
            Value := Value + plPrevDayRH['TrifectaPayout'];
         end;
      end;
   end;
end;

procedure TPreviousDaysByDayReportForm.varTriPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varTriPayout.AsDouble;
   fTotalWagered := varTriWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varTriPLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varTriPayout.AsDouble, varTriWagered.AsDouble)
end;


//Quinella Wagers

procedure TPreviousDaysByDayReportForm.varQuiWageredCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsQuiRace'] = True then begin
      if plPrevDayHH['FinishPos'] > 0 then begin
         if plPrevDayHH['Odds'] > 0 then begin
            if (plPrevDayRH['QuinellaPayout'] > 0) then begin
               Value := Value + 2.00;
            end;
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varQuiPayoutCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsQuiRace'] = True then begin
      if plPrevDayRH['IsQuinellaMatched'] = True then begin
         Value := Value + plPrevDayRH['QuinellaPayout'];
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varQuiPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varQuiPayout.AsDouble;
   fTotalWagered := varQuiWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varQuiPLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varQuiPayout.AsDouble, varQuiWagered.AsDouble)
end;

//Exacta Wagers

procedure TPreviousDaysByDayReportForm.varExaWageredCalc(Sender: TObject; var Value: Variant);
begin
   if plPrevDayRH['IsExaRace'] = True then begin
      if plPrevDayHH['FinishPos'] > 0 then begin
         if plPrevDayHH['Odds'] > 0 then begin
            if (plPrevDayRH['ExactaPayout'] > 0) then begin
               Value := Value + 2.00;
            end;
         end;
      end;
   end;
end;

procedure TPreviousDaysByDayReportForm.varExaPayoutCalc(Sender: TObject; var Value: Variant);
begin
   if plPrevDayRH['IsExaRace'] = True then begin
      if plPrevDayRH['IsExactaMatched'] = True then begin
         if (plPrevDayRH['ExactaWager'] = 1) then begin
            Value := Value + (plPrevDayRH['ExactaPayout'] * 2);
         end else begin
            Value := Value + plPrevDayRH['ExactaPayout'];
         end;
      end;
   end;
end;

procedure TPreviousDaysByDayReportForm.varExaPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varExaPayout.AsDouble;
   fTotalWagered := varExaWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varExaPLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varExaPayout.AsDouble, varExaWagered.AsDouble)
end;

//Daily Double Wagers

procedure TPreviousDaysByDayReportForm.varDDWageredCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsDDRace'] = True then begin
      if plPrevDayHH['FinishPos'] > 0 then begin
         if plPrevDayHH['Odds'] > 0 then begin
            if (plPrevDayRH['DailyDoublePayoutFirstRace'] > 0) then begin
               Value := Value + 2.00;
            end;
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varDDPayoutCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsDDRace'] = True then begin
      if plPrevDayRH['IsDailyDoubleMatchedFirstRace'] = True then begin
         if (plPrevDayRH['DailyDoubleWagerFirstRace'] = 1) then begin
            Value := Value + (plPrevDayRH['DailyDoublePayoutFirstRace'] * 2);
         end else begin
            Value := Value + plPrevDayRH['DailyDoublePayoutFirstRace'];
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varDDPLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin

   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varDDPayout.AsDouble;
   fTotalWagered := varDDWagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;

procedure TPreviousDaysByDayReportForm.varDDPLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varDDPayout.AsDouble, varDDWagered.AsDouble)
end;

// Pick Three

procedure TPreviousDaysByDayReportForm.varPk3WageredCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsPk3Race'] = True then begin
      if plPrevDayHH['FinishPos'] > 0 then begin
         if plPrevDayHH['Odds'] > 0 then begin
            if (plPrevDayRH['Pick3PayoutFirstRace'] > 0) then begin
               Value := Value + 2.00;
            end;
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varPk3PayoutCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsPk3Race'] = True then begin
      if plPrevDayRH['IsPick3MatchedFirstRace'] = True then begin
         if (plPrevDayRH['Pick3WagerFirstRace'] = 1) then begin
            Value := Value + (plPrevDayRH['Pick3PayoutFirstRace'] * 2);
         end else begin
            Value := Value + plPrevDayRH['Pick3PayoutFirstRace'];
         end;
      end;
   end;
end;

procedure TPreviousDaysByDayReportForm.varPk3PLCalc(Sender: TObject; var Value: Variant);
var
   fTotalWon: double;
   fTotalWagered: double;
   fTotalPL: double;
begin
   fTotalWon := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalWon := varPk3Payout.AsDouble;
   fTotalWagered := varPk3Wagered.AsDouble;
   fTotalPL := fTotalWon - fTotalWagered;

   Value := fTotalPL;
end;



procedure TPreviousDaysByDayReportForm.varPk3PLPctCalc(Sender: TObject; var Value: Variant);
begin

   Value := ComputePLPct(varPk3Payout.AsDouble, varPk3Wagered.AsDouble)

end;


//Pick 4

procedure TPreviousDaysByDayReportForm.varPk4WageredCalc(Sender: TObject; var Value: Variant);
begin

   if plPrevDayRH['IsPk4Race'] = True then begin
      if plPrevDayHH['FinishPos'] > 0 then begin
         if plPrevDayHH['Odds'] > 0 then begin
            if (plPrevDayRH['Pick4PayoutFirstRace'] > 0) then begin
               Value := Value + 2.00;
            end;
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varPk4PayoutCalc(Sender: TObject; var Value: Variant);
begin


   if plPrevDayRH['IsPk4Race'] = True then begin
      if plPrevDayRH['IsPick4MatchedFirstRace'] = True then begin
         if (plPrevDayRH['Pick4WagerFirstRace'] = 1) then begin
            Value := Value + (plPrevDayRH['Pick4PayoutFirstRace'] * 2);
         end else begin
            Value := Value + plPrevDayRH['Pick4PayoutFirstRace'];
         end;
      end;
   end;

end;

procedure TPreviousDaysByDayReportForm.varPk4PLCalc(Sender: TObject; var Value: Variant);
var
   fTotalPayout: double;
   fTotalWagered: double;
   fTotalPL: double;
begin
   fTotalPayout := 0;
   fTotalWagered := 0;
   fTotalPL := 0;

   fTotalPayout := varPk4Payout.AsDouble;
   fTotalWagered := varPk4Wagered.AsDouble;
   fTotalPL := fTotalPayout - fTotalWagered;

   Value := fTotalPL;

end;


procedure TPreviousDaysByDayReportForm.varPk4PLPctCalc(Sender: TObject; var Value: Variant);
begin
   Value := ComputePLPct(varPk4Payout.AsDouble, varPk4Wagered.AsDouble)
end;

procedure TPreviousDaysByDayReportForm.varWPSPLCalc(Sender: TObject; var Value: Variant);
begin
   Value := varWinPL.AsDouble + varPlcPL.AsDouble + varShoPL.AsDouble;
end;

procedure TPreviousDaysByDayReportForm.varTriSfcPLCalc(Sender: TObject; var Value: Variant);
begin
   Value := varTriPL.AsDouble + varSfcPL.AsDouble;
end;

procedure TPreviousDaysByDayReportForm.varExaQuiPLCalc(Sender: TObject; var Value: Variant);
begin
   Value := varQuiPL.AsDouble + varExaPL.AsDouble;
end;

procedure TPreviousDaysByDayReportForm.varDDPk3PLCalc(Sender: TObject; var Value: Variant);
begin
   Value := varDDPL.AsDouble + varPk3PL.AsDouble;
end;

procedure TPreviousDaysByDayReportForm.varPk4Pk6PLCalc(Sender: TObject; var Value: Variant);
begin
   Value := varPk4PL.AsDouble;
end;

procedure TPreviousDaysByDayReportForm.varTotalPLCalc(Sender: TObject; var Value: Variant);
begin
   Value := varWinPL.AsDouble + varPlcPL.AsDouble + varShoPL.AsDouble +
      varDDPL.AsDouble + varPk3PL.AsDouble + varPk4PL.AsDouble +
      varQuiPL.AsDouble + varExaPL.AsDouble +
      varTriPL.AsDouble + varSfcPL.AsDouble;
end;

function TPreviousDaysByDayReportForm.ComputePLPct(fWon: double; fWagered: double): double;
begin

   if (fWagered > 0) then begin
      Result := ((fWon - fWagered) / fWagered) * 100;
   end else begin
      Result := 0;
   end;

end;



procedure TPreviousDaysByDayReportForm.varWinDDPk3PLCalc(Sender: TObject;
   var Value: Variant);
begin
   //
end;

procedure TPreviousDaysByDayReportForm.varDDNbrWagersCalc(Sender: TObject;
   var Value: Variant);
begin
   //
end;

procedure TPreviousDaysByDayReportForm.varDDWinPctCalc(Sender: TObject;
   var Value: Variant);
begin
   //
end;

procedure TPreviousDaysByDayReportForm.varDDAvgPayoutCalc(Sender: TObject;
   var Value: Variant);
begin
   //
end;

end.
