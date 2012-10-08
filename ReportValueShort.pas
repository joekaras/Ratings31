//((TodaysWagerWinPctRank=1) or (FinalWinPctRank=1) or (IsWagerSheetSelected=True) or (IsSpeedSheetSelected=True)) and IsPrintedOnValueSheet = True
//((TodaysWagerWinPctRank=1) or (FinalWinPctRank=1) or (IsWagerSheetSelected=True) or (IsSpeedSheetSelected=True)) and IsPrintedOnValueSheet = True
//((IsDollar=True) or (IsDoubleDollar=True)) and IsYouBet=True
// ((IsPrintedOnValueSheet=True) OR (IsYouBetTrack=True)) AND ( ((OwnWinsRank > 0) AND (OwnWinsRank <> 9999)) OR ((OwnEarningsRank > 0) and (OwnEarningsRank <> 9999)) ) AND ((PowerRank >= 1) AND (PowerRank <= 3))
// ((Is1stBred=True) AND (LifeStarts > 0 AND LifeStarts < 3) AND (LifeWins = 0))


unit ReportValueShort;
interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, jpeg, ppParameter, mLog;

type
   TValueShortReportForm = class(TForm)
      dbShortValueReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      tblEntries: TDBISAMTable;
      dsEntries: TDataSource;
      plEntries: TppDBPipeline;
      ppShortValueReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      dsRacesMaster: TDataSource;
      timCloseFormCheck: TTimer;
      tblRacesLoop: TDBISAMTable;
      ppParameterList1: TppParameterList;
      hLog: TmLog;
      ppHeaderBand1: TppHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel24: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppSubReport1: TppSubReport;
      ppChildReport12: TppChildReport;
      daDataModule1: TdaDataModule;
    aTitleBand: TppTitleBand;
    RaceDesc: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppLabel8: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel20: TppLabel;
    ppLabel9: TppLabel;
    ppLabel30: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel41: TppLabel;
    ppLabel12: TppLabel;
    ppLabel7: TppLabel;
    ppLabel32: TppLabel;
    ppLabel26: TppLabel;
    ppLabel19: TppLabel;
    ppLabel18: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel15: TppLabel;
    ppLabel60: TppLabel;
    ppLabel44: TppLabel;
    ppLabel46: TppLabel;
    ppLabel57: TppLabel;
    RaceCondition: TppDBMemo;
    ppLabel61: TppLabel;
    ppLabel33: TppLabel;
    ppLabel50: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel23: TppLabel;
    ppLabel39: TppLabel;
    ppLabel1: TppLabel;
    lblSireTurf: TppLabel;
    lblSire2yo: TppLabel;
    ppLabel34: TppLabel;
    ppLabel2: TppLabel;
    ppDBText11: TppDBText;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    ppLabel40: TppLabel;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppDBText18: TppDBText;
    ppLabel59: TppLabel;
    ppLabel63: TppLabel;
    lblPowerOrder: TppLabel;
    WagerSheetOrder: TppDBText;
    ppLine8: TppLine;
    lblErlPace: TppLabel;
    lblMidPace: TppLabel;
    lblLatePace: TppLabel;
    ErlPaceSheetOrder: TppDBText;
    MidPaceSheetOrder: TppDBText;
    LatePaceSheetOrder: TppDBText;
    ppLine23: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel13: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel16: TppLabel;
    ppDBText27: TppDBText;
    TrainerJockeySheetOrder: TppDBText;
    ppLabel21: TppLabel;
    ppDBText29: TppDBText;
    ppLabel25: TppLabel;
    ppLabel42: TppLabel;
    ppLabel31: TppLabel;
    MaidenSheetOrder: TppDBText;
    TurfSheetOrder: TppDBText;
    ppLabel17: TppLabel;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel43: TppLabel;
    ppDBText10: TppDBText;
    ppDBText14: TppDBText;
    ppLabel45: TppLabel;
    ppLabel51: TppLabel;
    ppDBText28: TppDBText;
    ppDBText39: TppDBText;
    ppLine17: TppLine;
    ppLine32: TppLine;
    ppLabel52: TppLabel;
    ppDBText40: TppDBText;
    ppDBText42: TppDBText;
    ppLabel54: TppLabel;
    ppLabel56: TppLabel;
    ppLabel58: TppLabel;
    ppLine34: TppLine;
    ppLabel62: TppLabel;
    ppLine33: TppLine;
    ppLine35: TppLine;
    ppHeaderBand2: TppHeaderBand;
    aDetailBand: TppDetailBand;
    ppLine5: TppLine;
    ppLine14: TppLine;
    ppLine7: TppLine;
    ppLine6: TppLine;
    ppLine2: TppLine;
    ProgramNbr: TppDBText;
    Trainer: TppDBText;
    Jockey: TppDBText;
    Med: TppDBText;
    Pace: TppDBText;
    TotalTrnWinPct: TppDBText;
    TotalTrnJkyWinPct: TppDBText;
    TotalJky30WinPct: TppDBText;
    Sex: TppDBText;
    Age: TppDBText;
    ppDBText13: TppDBText;
    BredIn: TppDBText;
    TotalTrnDebutWinPct: TppDBText;
    MidPace: TppDBText;
    TotalJkyWinPct: TppDBText;
    ppLine10: TppLine;
    TotalTrnTurfWinPct: TppDBText;
    TotalTrnAftClmWinPct: TppDBText;
    TotalTrnDebutTwoWinPct: TppDBText;
    SurfaceChange: TppVariable;
    DistanceChange: TppVariable;
    lblErlPos: TppLabel;
    lblMidPos: TppLabel;
    LastComment2: TppDBText;
    TotalTrn2yoWinPct: TppDBText;
    ppLine18: TppLine;
    Equip: TppDBText;
    Weight: TppDBText;
    TotalTrnFirstJuiceWinPct: TppDBText;
    TotalTrnBlinkersOnWinPct: TppDBText;
    TotalTrnBlinkersOffWinPct: TppDBText;
    TurfIndicator: TppDBText;
    DebutIndicator: TppDBText;
    RouteIndicator: TppDBText;
    ppLine15: TppLine;
    TurfRating: TppDBText;
    Last2Comment2: TppDBText;
    ppLine4: TppLine;
    layoffline1: TppLine;
    ppLine12: TppLine;
    LastRaceDesc: TppDBText;
    Last2RaceDesc: TppDBText;
    TurfWins: TppDBText;
    MudStarts: TppDBText;
    MudWins: TppDBText;
    TrkStarts: TppDBText;
    ppDBText15: TppDBText;
    lblTrack: TppLabel;
    ppLabel67: TppLabel;
    ppLine16: TppLine;
    DaysLast: TppDBText;
    lblOnTurf: TppLabel;
    Power: TppDBText;
    ppDBText5: TppDBText;
    SireName: TppDBText;
    ML: TppDBText;
    lblRoute: TppLabel;
    RouteStarts: TppDBText;
    RouteWins: TppDBText;
    QSP1stCallRunStyle: TppDBText;
    lblSprint: TppLabel;
    SprintStarts: TppDBText;
    SprintWins: TppDBText;
    lblLife: TppLabel;
    LifeStarts: TppDBText;
    LifeWins: TppDBText;
    HorseName: TppDBText;
    ppLine13: TppLine;
    ppLine19: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    TotalTrnOwnWinPct: TppDBText;
    TurfStarts: TppDBText;
    ppDBText41: TppDBText;
    OwnerName: TppDBText;
    ppLine1: TppLine;
    PowerAdvantage: TppDBText;
    ppLine3: TppLine;
    ppDBText12: TppDBText;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppLine20: TppLine;
    LatePaceAdvantageWinPct: TppDBText;
    ppLine24: TppLine;
    MiddlePaceAdvantageWinPct: TppDBText;
    EarlyPaceAdvantageWinPct: TppDBText;
    TotalTrn46To120WinPct: TppDBText;
    ppLabel22: TppLabel;
    PostPos: TppDBText;
    TotalTrn30WinPct: TppDBText;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ClassRating: TppDBText;
    DistanceRating: TppDBText;
    MudRating: TppDBText;
    ppLine30: TppLine;
    ppLine31: TppLine;
    TodaysWagerWinPct: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText9: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText20: TppDBText;
    ppDBText24: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryWagerTypeBand: TppSummaryBand;
    dbWagerType: TppDBMemo;
    raCodeModule1: TraCodeModule;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure plEntriesTraversal(Sender: TObject);
      procedure GenerateReport(sFilePath: string);
      procedure InitPrgBar();

   private
      { Private declarations }
      bCreateReportsActive: boolean;
      //   sOddsFilter: string;
   //      sTrainerFilter: string;
      sFileName: string;
   public
      { Public declarations }
      bCreateAll: boolean;
      bCreateYouBet: boolean;
   end;
var
   ValueShortReportForm: TValueShortReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TValueShortReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

   bCreateYouBet := False;
   bCreateAll := False;
   with dbShortValueReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TValueShortReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesMaster.Active := False;
   tblEntries.Active := False;
   with dbShortValueReport do begin
      Close;
   end;

end;

//******************* TTipSheetReportForm.btnCreatePdfClick *************************

procedure TValueShortReportForm.btnCreatePdfClick(Sender: TObject);
var
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFilter: string;
   sTrkCode: string;
   sPrevTrkCode: string;
   iAttributes: integer;
   tsFile: TSearchRec;
begin

   try
      try
         tblRacesLoop.Active := True;
         tblRacesMaster.Active := False;

         tblRacesMaster.Filtered := False;

         tblRacesMaster.Filtered := True;
         tblEntries.Active := True;

         tblEntries.Filtered := False;
         if (bCreateAll) then begin
            tblEntries.Filter := '(IsSpeedSheetSelected=True) and (IsPrintedOnValueSheet=True) ';
         end else begin
            tblEntries.Filter := '(IsSpeedSheetSelected=True) and (IsPrintedOnValueSheet=True) ';
         end;
         tblEntries.Filtered := True;

         ppLabel24.Caption := 'VALUE SHEETS';

         if tblEntries.RecordCount > 0 then begin
            InitPrgBar();

            tblRacesLoop.First();
            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            if (bCreateAll) then begin
               sFileName := 'ByTimeValueSelect' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            end else begin
               sFileName := 'ByTimeValueSelect' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            end;
            GenerateReport(PDF_VALUE_REPORT_PATH);
         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;
      tblEntries.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;


  //
   try
      try
         tblRacesLoop.Active := True;
         tblRacesMaster.Active := False;

         tblRacesMaster.Filtered := False;

         tblRacesMaster.Filtered := True;
         tblEntries.Active := True;

         tblEntries.Filtered := False;
         if (bCreateAll) then begin
            tblEntries.Filter := '(IsWagerSheetSelected=True) and (IsPrintedOnValueSheet=True) ';
         end else begin
            tblEntries.Filter := '(IsWagerSheetSelected=True) and (IsPrintedOnValueSheet=True) ';
         end;
         tblEntries.Filtered := True;

         ppLabel24.Caption := 'CHALK SHEETS';

         if tblEntries.RecordCount > 0 then begin
            InitPrgBar();

            tblRacesLoop.First();
            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            if (bCreateAll) then begin
               sFileName := 'ByTimeValueSelectWager' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            end else begin
               sFileName := 'ByTimeValueSelectWager' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            end;
            GenerateReport(PDF_VALUE_REPORT_PATH);
         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;
      tblEntries.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;
//
//  //
//   try
//      try
//         tblRacesLoop.Active := True;
//         tblRacesMaster.Active := False;
//
//         tblRacesMaster.Filtered := False;
//
//         tblRacesMaster.Filtered := True;
//         tblEntries.Active := True;
//
//         tblEntries.Filtered := False;
//         if (bCreateAll) then begin
//            tblEntries.Filter := '(TodaysWagerWinPctRank < 5 and IsPrintedOnValueSheet=True and ((IsWagerSheetSelected=True) or (IsSpeedSheetSelected=True))) or (IsTrainerSheetSelected=True)';
//         end else begin
//            tblEntries.Filter := '(TodaysWagerWinPctRank < 5 and IsPrintedOnValueSheet=True and ((IsWagerSheetSelected=True) or (IsSpeedSheetSelected=True))) or (IsTrainerSheetSelected=True)';
//         end;
//         tblEntries.Filtered := True;
//
//         ppLabel24.Caption := 'CHALK SHEETS';
//
//         if tblEntries.RecordCount > 0 then begin
//            InitPrgBar();
//
//            tblRacesLoop.First();
//            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
//            if (bCreateAll) then begin
//               sFileName := 'ByTimeValueSelectSpeedTrainerChalk' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
//            end else begin
//               sFileName := 'ByTimeValueSelectSpeedTrainerChalk' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
//            end;
//            GenerateReport(PDF_VALUE_REPORT_PATH);
//         end;
//      except
//         on E: Exception do begin
//            hLog.AddToLog(E.Message, msevException);
//         end;
//      end;
//
//   finally
//      tblRacesLoop.Active := False;
//      tblRacesMaster.Active := False;
//      tblEntries.Active := False;
//      prgBar.Position := 0;
//      pnlPrgBar.Visible := False;
//      staBar.SimpleText := '';
//      bCreateReportsActive := False;
//   end;
//


end;

procedure TValueShortReportForm.GenerateReport(sFilePath: string);
begin
   try
      with ppShortValueReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := sFilePath + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppShortValueReport.Print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TValueShortReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TValueShortReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TValueShortReportForm.InitPrgBar();
begin

   prgBar.Max := tblEntries.RecordCount * 2;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;

end;

procedure TValueShortReportForm.plEntriesTraversal(Sender: TObject);
begin

   if (prgBar.Position < prgBar.Max) then begin
      prgBar.Position := prgBar.Position + 1;
   end else begin
      prgBar.Position := 0;
   end;

   Application.ProcessMessages;

end;

end.

