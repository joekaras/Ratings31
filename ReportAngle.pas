unit ReportAngle;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, jpeg, ppParameter, mLog;

type
   TAngleReportForm = class(TForm)
      dbAngleReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      tblEntries: TDBISAMTable;
      dsEntries: TDataSource;
      plEntries: TppDBPipeline;
      ppAngleReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      dsRacesMaster: TDataSource;
      timCloseFormCheck: TTimer;
      tblRacesLoop: TDBISAMTable;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppDBText2: TppDBText;
      ppTitle: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel10: TppLabel;
      ppLabel8: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel33: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel2: TppLabel;
      ppLabel9: TppLabel;
      ppLabel16: TppLabel;
      ppLabel11: TppLabel;
      ppLabel30: TppLabel;
      ppLabel34: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel12: TppLabel;
      ppLabel7: TppLabel;
      ppLabel42: TppLabel;
      ppLabel32: TppLabel;
      ppLabel26: TppLabel;
      ppLabel19: TppLabel;
      ppLabel18: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel15: TppLabel;
      ppLabel13: TppLabel;
      ppLabel39: TppLabel;
      ppLabel60: TppLabel;
      ppLabel17: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel76: TppLabel;
      ppLabel14: TppLabel;
      ppDetailBand1: TppDetailBand;
      TotalRatingReport: TppSubReport;
      ppChildReport12: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDBText1: TppDBText;
      ppDBText8: TppDBText;
      ppDetailBand13: TppDetailBand;
      ppShape1: TppShape;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      TrnName: TppDBText;
      JkyName: TppDBText;
      ML: TppDBText;
      SA: TppDBText;
      DaysLastRace: TppDBText;
      DaysLastWork: TppDBText;
      ppLine4: TppLine;
      ppLine9: TppLine;
      Pace: TppDBText;
      TodayTrn: TppDBText;
      TrnJky: TppDBText;
      TodayJky: TppDBText;
      ppLine2: TppLine;
      Own: TppDBText;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      Trn1st: TppDBText;
      varLay: TppVariable;
      varValue: TppVariable;
      ppDBText16: TppDBText;
      varLayWo: TppVariable;
      ppDBText9: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      MidPace: TppDBText;
      ppDBText22: TppDBText;
      ppLine8: TppLine;
      ppLine10: TppLine;
      ppLine13: TppLine;
      TrnTrf: TppDBText;
      TrnClm: TppDBText;
      Trn2nd: TppDBText;
      ppVariable1: TppVariable;
      ppVariable2: TppVariable;
      ppLine1: TppLine;
      LastClass: TppDBText;
      AvgClass: TppDBText;
      lblErlPos: TppLabel;
      ppLabel91: TppLabel;
      ppLabel92: TppLabel;
      ppLine14: TppLine;
      ppDBText15: TppDBText;
      TRN2YO: TppDBText;
      OddsGt: TppDBText;
      ppLine18: TppLine;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText7: TppDBText;
      ppDBText11: TppDBText;
      raCodeModule1: TraCodeModule;
      raCodeModule2: TraCodeModule;
      hLog: TmLog;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure plEntriesRecordPositionChange(Sender: TObject);
   private
      { Private declarations }
      bCreateReportsActive: boolean;
   public
      { Public declarations }
   end;

var
   AngleReportForm: TAngleReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TAngleReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   with dbAngleReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TAngleReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesMaster.Active := False;
   tblEntries.Active := False;

   with dbAngleReport do begin
      Close;
   end;

end;

//******************* TTipSheetReportForm.btnCreatePdfClick *************************

procedure TAngleReportForm.btnCreatePdfClick(Sender: TObject);
var
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;

begin

   try

      tblRacesLoop.Active := True;
      tblRacesMaster.Active := False;
      tblRacesMaster.IndexName := 'ByEstTimeOfRace';
      // (IsWagerSheetSelected = True)  and IsPrintedOnAngleSheet = True  and AngleChoice = 1

      tblEntries.Active := True;
      tblEntries.Filtered := True;
      prgBar.Max := tblEntries.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      tblRacesLoop.First();
      DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
      sFileName := 'AngleByTime' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
      with ppAngleReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_ANGLE_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppAngleReport.Print;
      end;

   except
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;
      tblEntries.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

   tblRacesLoop.Active := False;
   tblRacesLoop.Active := True;

   tblRacesMaster.Active := False;
   tblRacesMaster.IndexName := 'ByTrkCodeRaceNbr';


   tblRacesLoop.First();
   DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
   sFileName := 'AngleByTrack' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
   with ppAngleReport do begin
      AllowPrintToFile := True;
      ShowPrintDialog := False;
      ShowCancelDialog := False;
      DeviceType := 'PDFFile';
      TextFileName := PDF_ANGLE_REPORT_PATH + sFileName;
      staBar.SimpleText := 'Processing ' + TextFileName;
      Application.ProcessMessages;
      ppAngleReport.Print;
   end;


   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;
   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;

end;

procedure TAngleReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TAngleReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TAngleReportForm.plEntriesRecordPositionChange(
   Sender: TObject);
begin

   prgBar.Position := prgBar.Position + 1;
   Application.ProcessMessages;

end;

end.
