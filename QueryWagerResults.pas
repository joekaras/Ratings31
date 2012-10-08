// IsWagerSheetSelected=True and IsYouBetTrack=True  and NbrWorksLast > 0 and StartsWorks21 > 0

unit QueryWagerResults;
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, cxControls,
   daDBISAM, daIDE, ppEndUsr, Menus, cxLookAndFeelPainters, cxCalendar,
   cxTimeEdit, cxSpinEdit, cxCalc, cxFilterControl, cxDBFilterControl,
   cxButtons, cxDropDownEdit, cxCheckBox, TXComp, TXRB;

type
   TWagerQueryForm = class(TForm)
      dbWagerQuery: TDBISAMDatabase;
      tblPrevDayHH: TDBISAMTable;
      dsPrevDayHH: TDataSource;
      plPrevDayHH: TppDBPipeline;
      ppWagerResultsReport: TppReport;
      staBar: TStatusBar;
      ppParameterList1: TppParameterList;
      tblPrevDayRH: TDBISAMTable;
      dsPrevDayRH: TDataSource;
      plPrevDayRH: TppDBPipeline;
      hLog: TmLog;
      pnlFilterDialog: TPanel;
      pnlButtons: TPanel;
      btnLoad: TcxButton;
      btnSaveAs: TcxButton;
      btnApply: TcxButton;
      btnOK: TcxButton;
      btnCancel: TcxButton;
      fltHH: TcxDBFilterControl;
      SaveDialog: TSaveDialog;
      OpenDialog: TOpenDialog;
      btnHeavyChalkAll: TcxButton;
      btnHeavyChalkTurf: TcxButton;
      btnHeavyChalkDirt: TcxButton;
      btnDoubleLinerAll: TcxButton;
      btnDoubleLinerTurf: TcxButton;
      btnDoubleLinerDirt: TcxButton;
      btnEarlyPaceAdvantageAll: TcxButton;
      btnEarlyPaceAdvantageTurf: TcxButton;
      btnEarlyPaceAdvantageDirt: TcxButton;
      btnMiddlePaceAdvantageAll: TcxButton;
      btnMiddlePaceAdvantageTurf: TcxButton;
      btnMiddlePaceAdvantageDirt: TcxButton;
      btnAll: TcxButton;
      btnAllDirt: TcxButton;
      btnAllTurf: TcxButton;
      btnHeavyChalkAtrificial: TcxButton;
      btnDoubleLinerArtificial: TcxButton;
      btnEarlyPaceAdvantageArtificial: TcxButton;
      btnMiddlePaceAdvantageArtificial: TcxButton;
      btnAllArtificial: TcxButton;
      ExtraOptions1: TExtraOptions;
      btnTrainerOwner: TcxButton;
      btnTrainerJockey: TcxButton;
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
      dbRaceNbr: TppDBText;
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
      Pick3PayoutLastRace: TppDBText;
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
      ppDBText1: TppDBText;
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
      ppLine15: TppLine;
      ppDBText5: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppLine16: TppLine;
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
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure tblPrevDayRHNewRecord(DataSet: TDataSet);
      procedure tblPrevDayHHNewRecord(DataSet: TDataSet);
      procedure plPrevDayHHMasterRecordPositionChange(Sender: TObject);
      procedure GenerateReport();
      procedure DisplayGimmickResults(bOn: boolean);
      procedure btnOKClick(Sender: TObject);
      procedure btnLoadClick(Sender: TObject);
      procedure btnSaveAsClick(Sender: TObject);
      procedure btnApplyClick(Sender: TObject);
      procedure fltHHApplyFilter(Sender: TObject);
      procedure btnHeavyChalkAllClick(Sender: TObject);
      procedure btnHeavyChalkTurfClick(Sender: TObject);
      procedure btnHeavyChalkDirtClick(Sender: TObject);
      procedure btnDoubleLinerAllClick(Sender: TObject);
      procedure btnDoubleLinerTurfClick(Sender: TObject);
      procedure btnDoubleLinerDirtClick(Sender: TObject);
      procedure btnEarlyPaceAdvantageAllClick(Sender: TObject);
      procedure btnEarlyPaceAdvantageTurfClick(Sender: TObject);
      procedure btnEarlyPaceAdvantageDirtClick(Sender: TObject);
      procedure btnMiddlePaceAdvantageAllClick(Sender: TObject);
      procedure btnMiddlePaceAdvantageTurfClick(Sender: TObject);
      procedure btnMiddlePaceAdvantageDirtClick(Sender: TObject);
      procedure btnAllTurfClick(Sender: TObject);
      procedure btnAllDirtClick(Sender: TObject);
      procedure btnAllClick(Sender: TObject);
      procedure btnHeavyChalkAtrificialClick(Sender: TObject);
      procedure btnDoubleLinerArtificialClick(Sender: TObject);
      procedure btnEarlyPaceAdvantageArtificialClick(Sender: TObject);
      procedure btnMiddlePaceAdvantageArtificialClick(Sender: TObject);
      procedure btnAllArtificialClick(Sender: TObject);
      procedure btnTrainerOwnerClick(Sender: TObject);
      procedure btnTrainerJockeyClick(Sender: TObject);

   private
      { Private declarations }
      procedure OK();
   public
      bPreviousDay: boolean;


      { Public declarations }
   end;

var
   WagerQueryForm: TWagerQueryForm;

implementation

uses UnitCommonCode, StrMan, FastStrings, ReportWagerResults;

{$R *.DFM}

procedure TWagerQueryForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   //   bPreviousDay := True;

   with dbWagerQuery do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

end;

procedure TWagerQueryForm.FormDestroy(Sender: TObject);
begin

   tblPrevDayRH.Active := False;
   tblPrevDayHH.Active := False;

   with dbWagerQuery do begin
      Close;
   end;


end;

procedure TWagerQueryForm.tblPrevDayRHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;


procedure TWagerQueryForm.tblPrevDayHHNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TWagerQueryForm.plPrevDayHHMasterRecordPositionChange(
   Sender: TObject);
begin
   Application.ProcessMessages;
end;





procedure TWagerQueryForm.DisplayGimmickResults(bOn: boolean);
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


procedure TWagerQueryForm.GenerateReport();
begin
   try
      with ppWagerResultsReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := True;
         ShowCancelDialog := True;
         DeviceType := 'Screen';
         lblFilter.Caption := tblPrevDayHH.Filter;
         lblFilter.Visible := True;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppWagerResultsReport.print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TWagerQueryForm.btnOKClick(Sender: TObject);
begin

   fltHH.ApplyFilter;

   if (bPreviousDay) then begin

      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end else begin

      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end;



   try
      try
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;
         tblPrevDayHH.Filtered := True;

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

      staBar.SimpleText := '';
   end;


end;

procedure TWagerQueryForm.btnLoadClick(Sender: TObject);
begin
   OpenDialog.Filter := 'Grid Filters(*.flt)|*.flt|All files|*.*';
   if OpenDialog.Execute then
      fltHH.LoadFromFile(OpenDialog.FileName);

end;

procedure TWagerQueryForm.btnSaveAsClick(Sender: TObject);
begin
   SaveDialog.Filter := 'Grid Filters(*.flt)|*.flt';
   if SaveDialog.Execute then
      fltHH.SaveToFile(SaveDialog.FileName);

end;

procedure TWagerQueryForm.btnApplyClick(Sender: TObject);
begin
   fltHH.ApplyFilter;

end;

procedure TWagerQueryForm.fltHHApplyFilter(Sender: TObject);
begin
   tblPrevDayHH.Filtered := False;
   tblPrevDayHH.Filter := fltHH.FilterText;
   tblPrevDayHH.Filtered := True;
end;

procedure TWagerQueryForm.OK();
begin

   if (bPreviousDay) then begin

      tblPrevDayRH.TableName := 'PrevDayRH';
      tblPrevDayHH.TableName := 'PrevDayHH';

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end else begin

      tblPrevDayRH.TableName := 'PrevWeekRH';
      tblPrevDayHH.TableName := 'PrevWeekHH';

      tblPrevDayRH.IndexName := 'ByEstTimeOfRace';
      tblPrevDayRH.Active := False;

   end;

   try
      try
         tblPrevDayRH.Active := False;
         tblPrevDayHH.Active := False;
         tblPrevDayHH.Active := True;
         tblPrevDayHH.Filtered := True;

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

      staBar.SimpleText := '';
   end;

end;

procedure TWagerQueryForm.btnHeavyChalkAllClick(Sender: TObject);
begin
   tblPrevDayHH.Filtered := False;
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsHeavyChalk=True)';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnHeavyChalkTurfClick(Sender: TObject);
begin
   tblPrevDayHH.Filtered := False;
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsHeavyChalk=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('T') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnHeavyChalkDirtClick(Sender: TObject);
begin
   tblPrevDayHH.Filtered := False;
   if (Trim(fltHH.FilterText)) <> '' then begin
      tblPrevDayHH.Filter := fltHH.FilterText + ' AND ';
   end else begin
      tblPrevDayHH.Filter := '';
   end;
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsHeavyChalk=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('D') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnDoubleLinerAllClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsFrontDoubleLiner=True)';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnDoubleLinerTurfClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('T') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnDoubleLinerDirtClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('D') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnEarlyPaceAdvantageAllClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((EarlyPaceAdvantageWinPct > 25) AND (EarlyPaceAdvantageWinPct < 50) AND (EarlyPaceAdvantageWinPct <> 33.33))';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnEarlyPaceAdvantageTurfClick(Sender: TObject);
begin

   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((EarlyPaceAdvantageWinPct > 25) AND (EarlyPaceAdvantageWinPct < 50) AND (EarlyPaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('T') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnEarlyPaceAdvantageDirtClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((EarlyPaceAdvantageWinPct > 25) AND (EarlyPaceAdvantageWinPct < 50) AND (EarlyPaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('D') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnMiddlePaceAdvantageAllClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((MiddlePaceAdvantageWinPct > 25) AND (MiddlePaceAdvantageWinPct < 50) AND (MiddlePaceAdvantageWinPct <> 33.33))';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnMiddlePaceAdvantageTurfClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((MiddlePaceAdvantageWinPct > 25) AND (MiddlePaceAdvantageWinPct < 50) AND (MiddlePaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('T') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;


procedure TWagerQueryForm.btnMiddlePaceAdvantageDirtClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((MiddlePaceAdvantageWinPct > 25) AND (MiddlePaceAdvantageWinPct < 50) AND (MiddlePaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('D') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;


procedure TWagerQueryForm.btnAllTurfClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(Surface=' + QuotedStr('T') + '))';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((EarlyPaceAdvantageWinPct > 25) AND (EarlyPaceAdvantageWinPct < 50) AND (EarlyPaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((MiddlePaceAdvantageWinPct > 25) AND (MiddlePaceAdvantageWinPct < 50) AND (MiddlePaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsHeavyChalk=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnAllDirtClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(Surface=' + QuotedStr('D') + '))';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((EarlyPaceAdvantageWinPct > 25) AND (EarlyPaceAdvantageWinPct < 50))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((MiddlePaceAdvantageWinPct > 25) AND (MiddlePaceAdvantageWinPct < 50))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsHeavyChalk=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnAllClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsEliminated=False)';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((EarlyPaceAdvantageWinPct > 25) AND (EarlyPaceAdvantageWinPct < 50))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((MiddlePaceAdvantageWinPct > 25) AND (MiddlePaceAdvantageWinPct < 50))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsHeavyChalk)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsHeavyChalk=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' (OddsWinPct >= TodaysWagerWinPct) ';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnHeavyChalkAtrificialClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('A') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnDoubleLinerArtificialClick(Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('A') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnEarlyPaceAdvantageArtificialClick(
   Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (EarlyPaceAdvantageWinPct > 25)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('A') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnMiddlePaceAdvantageArtificialClick(
   Sender: TObject);
begin
   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (MiddlePaceAdvantageWinPct > 25)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (Surface=' + QuotedStr('A') + ')';

   tblPrevDayHH.Filtered := True;
   Ok();
end;

procedure TWagerQueryForm.btnAllArtificialClick(Sender: TObject);
begin

   tblPrevDayHH.Filter := '';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(Surface=' + QuotedStr('A') + '))';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((EarlyPaceAdvantageWinPct > 25) AND (EarlyPaceAdvantageWinPct < 50) AND (EarlyPaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '((MiddlePaceAdvantageWinPct > 25) AND (MiddlePaceAdvantageWinPct < 50) AND (MiddlePaceAdvantageWinPct <> 33.33))';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsFrontDoubleLiner=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' OR ';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsHeavyChalk=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ')';

   tblPrevDayHH.Filtered := True;
   Ok();

end;

procedure TWagerQueryForm.btnTrainerOwnerClick(Sender: TObject);
begin

   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((TotalTrnOwnWinPct>25) AND (TotalTrnOwnWinPct < 50) AND (TotalTrnOwnWinPct <> 33.33))';

   tblPrevDayHH.Filtered := True;
   Ok();

end;

procedure TWagerQueryForm.btnTrainerJockeyClick(Sender: TObject);
begin

   tblPrevDayHH.Filter := '';

   tblPrevDayHH.Filter := tblPrevDayHH.Filter + '(IsPrintedOnValueSheet=True)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND (IsEliminated=False)';
   tblPrevDayHH.Filter := tblPrevDayHH.Filter + ' AND ((TotalTrnJkyWinPct>25) AND (TotalTrnJkyWinPct < 50) AND (TotalTrnJkyWinPct <> 33.33))';

   tblPrevDayHH.Filtered := True;
   Ok();

end;

end.
