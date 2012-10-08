unit ReportWager;

interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, jpeg, ppParameter, mLog, ppBarCod;

type
   TWagerReportForm = class(TForm)
      dbWagerReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      tblEntries: TDBISAMTable;
      dsEntries: TDataSource;
      plEntries: TppDBPipeline;
      ppWagerReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      dsRacesMaster: TDataSource;
      timCloseFormCheck: TTimer;
      tblRacesLoop: TDBISAMTable;
      ppParameterList1: TppParameterList;
      hLog: TmLog;
      tblWagers: TDBISAMTable;
      tblBank: TDBISAMTable;
      dsWagers: TDataSource;
      plWagers: TppDBPipeline;
      dsBank: TDataSource;
      plBank: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppDBText2: TppDBText;
      lblTitle: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLine10: TppLine;
      vIs: TppVariable;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel3: TppLabel;
      ppLabel6: TppLabel;
      ppLabel4: TppLabel;
      ppDetailBand1: TppDetailBand;
      TotalRatingReport: TppSubReport;
      ppChildReport12: TppChildReport;
      ppDetailBand13: TppDetailBand;
      ppShape1: TppShape;
      DD: TppDBText;
      Pick3: TppDBText;
      Pick4: TppDBText;
      Value: TppDBText;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine12: TppLine;
      TrkCode: TppDBText;
      lblRaceNbr: TppLabel;
      ProgramNbr: TppDBText;
      EstTimeOfRace: TppDBText;
      HorseName: TppDBText;
      MorningLineDesc: TppDBText;
      WagerFinalOrder: TppDBText;
      RaceType: TppDBText;
      Trainer: TppDBText;
      dbOwner: TppDBText;
      ppLine3: TppLine;
      ppLine5: TppLine;
      Exacta: TppDBText;
      Super: TppDBText;
      Tri: TppDBText;
      ppLine6: TppLine;
      ppLine7: TppLine;
      EarlyPace: TppDBText;
      lblErlPos: TppLabel;
      lblMidPos: TppLabel;
      MiddlePace: TppDBText;
      LatePace: TppDBText;
      lblLatePos: TppLabel;
      WagerAmt: TppDBText;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppLine11: TppLine;
      ppLine4: TppLine;
      PlcWagerAmt: TppDBText;
      ShoWagerAmt: TppDBText;
      Quinella: TppDBText;
      lblWinWagerAmt: TppLabel;
      lblPlcWagerAmt: TppLabel;
      lblShoWagerAmt: TppLabel;
      lblExacta: TppLabel;
      lblQuinella: TppLabel;
      ppLine13: TppLine;
      lblTri: TppLabel;
      lblSuper: TppLabel;
      lblDD: TppLabel;
      lblPick3: TppLabel;
      lblPick4: TppLabel;
      WagerType: TppDBText;
      lblTriWagerAmt: TppLabel;
      TriWagerAmt: TppDBText;
      lblSfcWagerAmt: TppLabel;
      SfcWagerAmt: TppDBText;
      lblDDWagerAmt: TppLabel;
      Pk3WagerAmt: TppDBText;
      Pk4WagerAmt: TppDBText;
      DDWagerAmt: TppDBText;
      lblPk3WagerAmt: TppLabel;
      lblPk4WagerAmt: TppLabel;
      ppLine14: TppLine;
      ppLine15: TppLine;
      TrnWinsRank: TppDBText;
      TrnTrackRank: TppDBText;
      TrnEarningsRank: TppDBText;
      JkyWinsRank: TppDBText;
      JkyTrackRank: TppDBText;
      JkyEarningsRank: TppDBText;
      OwnWinsRank: TppDBText;
      OwnEarningsRank: TppDBText;
      EarlyPaceAdvantage: TppDBText;
      MiddlePaceAdvantage: TppDBText;
      LatePaceAdvantage: TppDBText;
      MorningLineTo1Fair: TppDBText;
      Surface: TppDBText;
      DistanceDesc: TppDBText;
      TotalNbrDebutTwoStarters: TppDBText;
      lblTS: TppLabel;
      lbl1st: TppLabel;
      lbl2nd: TppLabel;
      lblTrf: TppLabel;
      lblRteStarters: TppLabel;
      FinalLineTo1Fair: TppDBText;
      RaceNbr: TppDBText;
      MorningLineTo1FairProbability: TppDBText;
      FinalLineTo1FairProbability: TppDBText;
      ppLine16: TppLine;
      ppLabel10: TppLabel;
      ppLine17: TppLine;
      ppLabel19: TppLabel;
      ppLabel22: TppLabel;
      ppLabel25: TppLabel;
      ppLine18: TppLine;
      ppLine20: TppLine;
      ppDBText1: TppDBText;
      ppLine21: TppLine;
      ppLine22: TppLine;
      ppLine23: TppLine;
      ppLine19: TppLine;
      raCodeModule1: TraCodeModule;
      ppSummaryBand2: TppSummaryBand;
      ppShape2: TppShape;
      lblFilter: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      varWinWagers: TppVariable;
      varDDWagers: TppVariable;
      varPk3Wagers: TppVariable;
      varPk4Wagers: TppVariable;
      ppLabel23: TppLabel;
      varWinCost: TppVariable;
      varDDCost: TppVariable;
      varPk3Cost: TppVariable;
      varPk4Cost: TppVariable;
      ppLabel24: TppLabel;
      varTotalWagers: TppVariable;
      varTotalCost: TppVariable;
      varTriWagers: TppVariable;
      varSfcWagers: TppVariable;
      varExaWagers: TppVariable;
      varQuiWagers: TppVariable;
      varTriCost: TppVariable;
      varSfcCost: TppVariable;
      varExaCost: TppVariable;
      varQuiCost: TppVariable;
      ppLabel5: TppLabel;
      ppLabel9: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      varPlcWagers: TppVariable;
      varShoWagers: TppVariable;
      varPlcCost: TppVariable;
      varShoCost: TppVariable;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      daDataModule1: TdaDataModule;
      NbrWorksLast: TppDBText;
      StartsWorks21: TppDBText;
      EstMorningLineOrderKey: TppDBText;
      ppDBText20: TppDBText;
      EstMorningLineWinPct: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText29: TppDBText;
      EstMorningLineAvgWinOdds: TppDBText;
      ppDBText31: TppDBText;
      EstMorningLineMaxWinOdds: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppLine25: TppLine;
      ppDBText12: TppDBText;
      ppDBText19: TppDBText;
      ppDBText30: TppDBText;
      ppDBText36: TppDBText;
      ppDBText48: TppDBText;
      ppDBText49: TppDBText;
      ppDBText50: TppDBText;
      ppDBText51: TppDBText;
      ppDBText52: TppDBText;
      ppDBText53: TppDBText;
      ppDBText54: TppDBText;
      ppDBText55: TppDBText;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      KSP2ndCall: TppDBText;
      ppDBText3: TppDBText;
      ppDBText5: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText13: TppDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure plEntriesTraversal(Sender: TObject);
      procedure varWinWagersCalc(Sender: TObject; var Value: Variant);
      procedure varDDWagersCalc(Sender: TObject; var Value: Variant);
      procedure varPk3WagersCalc(Sender: TObject; var Value: Variant);
      procedure varPk6WagersCalc(Sender: TObject; var Value: Variant);
      procedure varTotalWagersCalc(Sender: TObject; var Value: Variant);
      procedure varWinCostCalc(Sender: TObject; var Value: Variant);
      procedure varDDCostCalc(Sender: TObject; var Value: Variant);
      procedure varPk3CostCalc(Sender: TObject; var Value: Variant);
      procedure varTotalCostCalc(Sender: TObject; var Value: Variant);
      procedure DDPrint(Sender: TObject);
      procedure Pick3Print(Sender: TObject);
      procedure Pick4Print(Sender: TObject);
      procedure varPk4WagersCalc(Sender: TObject; var Value: Variant);
      procedure varPk4CostCalc(Sender: TObject; var Value: Variant);
      procedure varTriWagersCalc(Sender: TObject; var Value: Variant);
      procedure varSfcWagersCalc(Sender: TObject; var Value: Variant);
      procedure varQuiWagersCalc(Sender: TObject; var Value: Variant);
      procedure varExaCostCalc(Sender: TObject; var Value: Variant);
      procedure varExaWagersCalc(Sender: TObject; var Value: Variant);
      procedure varPlcWagersCalc(Sender: TObject; var Value: Variant);
      procedure varShoWagersCalc(Sender: TObject; var Value: Variant);
      procedure varPlcCostCalc(Sender: TObject; var Value: Variant);
      procedure varShoCostCalc(Sender: TObject; var Value: Variant);
   private
      { Private declarations }
      bCreateReportsActive: boolean;
      sFileName: string;
      procedure GenerateReport();
      procedure InitPrgBar();
   public

      { Public declarations }
   end;

var
   WagerReportForm: TWagerReportForm;

implementation

uses UnitCommonCode, StrMan, FastStringFuncs, FastStrings;

{$R *.DFM}


procedure TWagerReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;


   with dbWagerReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;


end;

procedure TWagerReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesMaster.Active := False;
   tblEntries.Active := False;

   with dbWagerReport do begin
      Close;
   end;

end;

procedure TWagerReportForm.btnCreatePdfClick(Sender: TObject);
var
   sTrkCode: string;
   sPrevTrkCode: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   iAttributes: integer;
   tsFile: TSearchRec;

begin


   //
   try
      //
      try
         tblRacesLoop.Active := True;
         tblRacesMaster.Active := False;
         tblRacesMaster.IndexName := 'ByEstTimeOfRace';
         tblEntries.Active := True;
         tblEntries.Filtered := False;
         tblEntries.Filter := YOUBET_WAGER_FILTER;
         tblEntries.Filtered := True;

         lblFilter.Caption := tblEntries.Filter;
         lblFilter.Visible := True;

         InitPrgBar();

         tblRacesLoop.First();
         DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
         lblTitle.Caption := 'TODAYS YOUBET WAGERS';
         sFileName := 'YouBet' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
         GenerateReport();

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

      {
      //
      try
         tblRacesLoop.Active := True;
         tblRacesMaster.Active := False;
         tblRacesMaster.IndexName := 'ByEstTimeOfRace';
         tblEntries.Active := True;
         tblEntries.Filtered := False;
         tblEntries.Filter := '(MorningLineTo1Fair>TodaysWagerLineTo1Fair) and (IsPrintedOnValueSheet=True)' ;
         tblEntries.Filtered := True;

         lblFilter.Caption := tblEntries.Filter;
         lblFilter.Visible := True;

         InitPrgBar();

         tblRacesLoop.First();
         DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
         lblTitle.Caption := 'TODAYS VALUE SHEET';
         sFileName := 'ValueWagers' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
         GenerateReport();

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;
      }

   finally
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;
      tblEntries.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

end;

procedure TWagerReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TWagerReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TWagerReportForm.GenerateReport();
begin
   try
      with ppWagerReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_WAGER_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppWagerReport.Print;
         hLog.AddToLog('Created ' + TextFileName, msevOperation);
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TWagerReportForm.InitPrgBar();
begin

   prgBar.Max := tblEntries.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;

procedure TWagerReportForm.plEntriesTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;
end;


procedure TWagerReportForm.varWinWagersCalc(Sender: TObject; var Value: Variant);
var
   fWagerAmt: double;
begin

   try
      fWagerAmt := plEntries['WagerAmt'];
      if (fWagerAmt > 0) then begin
         Value := Value + 1;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;



procedure TWagerReportForm.varDDWagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   sDD: string;
   iCnt: integer;
   fDDWagerAmt: double;

begin
   try
      vTest := plRacesReport['IsDDRace'];
      fDDWagerAmt := plRacesReport['DDWagerAmt'];
      if vTest and (fDDWagerAmt > 0) then begin
         Value := Value + 1;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TWagerReportForm.varPk3WagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   fPk3WagerAmt: double;
begin
   try
      vTest := plRacesReport['IsPk3Race'];
      fPk3WagerAmt := plRacesReport['Pk3WagerAmt'];
      if (fPk3WagerAmt > 0) then begin
         Value := Value + 1;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TWagerReportForm.varPk3CostCalc(Sender: TObject; var Value: Variant);
var
   fNbrWagers: double;
   fTotalCost: double;

begin
   try
      fTotalCost := 0;
      fNbrWagers := 0;

      fNbrWagers := varPk3Wagers.AsInteger;

      if (fNbrWagers > 0) then begin
         fTotalCost := plRacesReport['Pk3WagerAmt'];
      end;

      Value := fTotalCost;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


procedure TWagerReportForm.varPk4WagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   fPk4WagerAmt: double;
begin
   try
      vTest := plRacesReport['IsPk4Race'];
      fPk4WagerAmt := plRacesReport['Pk4WagerAmt'];
      if vTest and (fPk4WagerAmt > 0) then begin
         Value := Value + 1;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TWagerReportForm.varPk4CostCalc(Sender: TObject; var Value: Variant);
var
   fNbrWagers: double;
   fTotalCost: double;

begin
   try
      fTotalCost := 0;
      fNbrWagers := 0;

      fNbrWagers := varPk4Wagers.AsInteger;

      if (fNbrWagers > 0) then begin
         fTotalCost := plRacesReport['Pk4WagerAmt'];
      end;

      Value := fTotalCost;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;


procedure TWagerReportForm.varPk6WagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   fPk6WagerAmt: double;
begin
   try
      vTest := plRacesReport['IsPk6Race'];
      fPk6WagerAmt := plRacesReport['Pk6WagerAmt'];
      if vTest and (fPk6WagerAmt > 0) then begin
         Value := Value + 1;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;


procedure TWagerReportForm.varTotalWagersCalc(Sender: TObject; var Value: Variant);
begin


   try
      Value := varWinWagers.AsInteger +
         varDDWagers.AsInteger +
         varExaWagers.AsInteger +
         varQuiWagers.AsInteger +
         varPk3Wagers.AsInteger +
         varPk4Wagers.AsInteger;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TWagerReportForm.varWinCostCalc(Sender: TObject; var Value: Variant);
var
   fNbrWagers: double;
   fTotalCost: double;

begin
   try
      fTotalCost := 0;
      fNbrWagers := 0;

      fNbrWagers := varWinWagers.AsInteger;

      if (fNbrWagers > 0) then begin
         fTotalCost := plEntries['WagerAmt'];
      end;

      Value := Value + fTotalCost;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;


procedure TWagerReportForm.varDDCostCalc(Sender: TObject; var Value: Variant);
var
   fNbrWagers: double;
   fTotalCost: double;
   iPos: integer;
   sDD: string;

begin
   try
      fTotalCost := 0;
      fNbrWagers := 0;

      fNbrWagers := varDDWagers.AsInteger;

      if (fNbrWagers > 0) then begin
         fTotalCost := plRacesReport['DDWagerAmt'];
      end;

      Value := Value + fTotalCost;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;



procedure TWagerReportForm.varTotalCostCalc(Sender: TObject; var Value: Variant);
begin
   try
      Value :=
         varExaCost.AsDouble +
         varQuiCost.AsDouble +
         varDDCost.AsDouble +
         varPk3Cost.AsDouble +
         varPk4Cost.AsDouble;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


procedure TWagerReportForm.DDPrint(Sender: TObject);
begin

   DD.Visible := True;

end;

procedure TWagerReportForm.Pick3Print(Sender: TObject);
begin

   Pick3.Visible := True;

end;

procedure TWagerReportForm.Pick4Print(Sender: TObject);
begin

   Pick4.Visible := True;

end;


procedure TWagerReportForm.varTriWagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   fExaWagerAmt: double;
begin
   try
      vTest := plRacesReport['IsExaRace'];
      fExaWagerAmt := plRacesReport['ExaWagerAmt'];
      if vTest and (fExaWagerAmt > 0) then begin
         Value := Value + 1;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TWagerReportForm.varSfcWagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   fExaWagerAmt: double;
begin

   try
      vTest := plRacesReport['IsExaRace'];
      fExaWagerAmt := plRacesReport['ExaWagerAmt'];
      if vTest and (fExaWagerAmt > 0) then begin
         Value := Value + 1;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TWagerReportForm.varQuiWagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   fQuiWagerAmt: double;
begin

   try
      vTest := plRacesReport['IsQuiRace'];
      fQuiWagerAmt := plRacesReport['QuiWagerAmt'];
      if vTest and (fQuiWagerAmt > 0) then begin
         Value := Value + 1;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


procedure TWagerReportForm.varExaWagersCalc(Sender: TObject; var Value: Variant);
var
   vTest: boolean;
   fExaWagerAmt: double;
begin

   try
      vTest := plRacesReport['IsExaRace'];
      fExaWagerAmt := plRacesReport['ExaWagerAmt'];
      if vTest and (fExaWagerAmt > 0) then begin
         Value := Value + 1;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TWagerReportForm.varExaCostCalc(Sender: TObject; var Value: Variant);
var
   fNbrWagers: double;
   fTotalCost: double;

begin
   try
      fTotalCost := 0;
      fNbrWagers := 0;

      fNbrWagers := varExaWagers.AsInteger;

      if (fNbrWagers > 0) then begin
         fTotalCost := plRacesReport['ExaWagerAmt'];
      end;

      Value := fTotalCost;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TWagerReportForm.varPlcWagersCalc(Sender: TObject; var Value: Variant);
var
   fWagerAmt: double;
begin

   try
      fWagerAmt := plEntries['PlcWagerAmt'];
      if (fWagerAmt > 0) then begin
         Value := Value + 1;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TWagerReportForm.varPlcCostCalc(Sender: TObject; var Value: Variant);
var
   fNbrWagers: double;
   fTotalCost: double;

begin
   try
      fTotalCost := 0;
      fNbrWagers := 0;

      fNbrWagers := varPlcWagers.AsInteger;

      if (fNbrWagers > 0) then begin
         fTotalCost := plEntries['PlcWagerAmt'];
      end;

      Value := Value + fTotalCost;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TWagerReportForm.varShoWagersCalc(Sender: TObject; var Value: Variant);
var
   fWagerAmt: double;
begin

   try
      fWagerAmt := plEntries['ShoWagerAmt'];
      if (fWagerAmt > 0) then begin
         Value := Value + 1;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;


procedure TWagerReportForm.varShoCostCalc(Sender: TObject; var Value: Variant);
var
   fNbrWagers: double;
   fTotalCost: double;

begin
   try
      fTotalCost := 0;
      fNbrWagers := 0;

      fNbrWagers := varShoWagers.AsInteger;

      if (fNbrWagers > 0) then begin
         fTotalCost := plEntries['ShoWagerAmt'];
      end;

      Value := Value + fTotalCost;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

end.
