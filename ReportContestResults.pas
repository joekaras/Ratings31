unit ReportContestResults;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, myChkBox;

type
   TContestResultReportForm = class(TForm)
      dbContestResultSheets: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      ppContestResultReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      dsRacesMaster: TDataSource;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      hLog: TmLog;
      ppHeaderBand1: TppHeaderBand;
      ppLabel24: TppLabel;
      ppDBText5: TppDBText;
      ppSystemVariable1: TppSystemVariable;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppShape1: TppShape;
      Pick3: TppDBText;
      TrkCode: TppDBText;
      Super: TppDBText;
      RaceNbr: TppDBText;
      ppLine2: TppLine;
      ppDBText6: TppDBText;
      ppLine3: TppLine;
      ppDBText7: TppDBText;
      ppLine4: TppLine;
      ppLine6: TppLine;
      Pick3NbrsLastRace: TppDBText;
      SuperfectaNbrs: TppDBText;
      SuperfectaPayout: TppDBText;
      Pick3PayoutLastRace: TppDBText;
      Is10CentSuperfectaRace: TmyDBCheckBox;
      WinNbrs: TppDBText;
      WinPayout: TppDBText;
      ppLine1: TppLine;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLine5: TppLine;
      IsSuperfectaMatched: TmyDBCheckBox;
      IsPick3MatchedFirstRace: TmyDBCheckBox;
      IsWinMatched: TmyDBCheckBox;
      IsWinMatched2: TmyDBCheckBox;
      ppDBText3: TppDBText;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc1: TppDBCalc;
      raCodeModule1: TraCodeModule;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
   private
      { Private declarations }
      bCreateReportsActive: boolean;
   public
      { Public declarations }
      bPreviousDay: boolean;
   end;

var
   ContestResultReportForm: TContestResultReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TContestResultReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   with dbContestResultSheets do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TContestResultReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesMaster.Active := False;


   with dbContestResultSheets do begin
      Close;
   end;

end;

procedure TContestResultReportForm.btnCreatePdfClick(Sender: TObject);
var
   sTrkCode: string;
   sPrevTrkCode: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   iAttributes: integer;
   tsFile: TSearchRec;

begin

   if (bPreviousDay) then begin
      tblRacesMaster.TableName := 'PrevDayRH';
   end else begin
      tblRacesMaster.TableName := 'PrevWeekRH';
   end;

   try

      sPrevTrkCode := '';

      tblRacesMaster.Active := True;
      tblRacesMaster.Filtered := True;

      prgBar.Max := tblRacesMaster.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages();
      tblRacesMaster.Active := True;
      DecodeDate(tblRacesMaster.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
      if (bPreviousDay) then begin
         sFileName := 'SfcAndPk3-' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
      end else begin
         sFileName := 'Last21SfcAndPk3.pdf';
      end;

      with ppContestResultReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_RESULTS_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppContestResultReport.Print;
      end;


      //      sFileName := 'SuperAndPickThree' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.xls';
      //      with ppContestResultReport do begin
      //         AllowPrintToFile := True;
      //         ShowPrintDialog := False;
      //         ShowCancelDialog := False;
      //         DeviceType := 'ExcelFile';
      //         TextFileName := PDF_RESULTS_REPORT_PATH + sFileName;
      //         staBar.SimpleText := 'Processing ' + TextFileName;
      //         Application.ProcessMessages;
      //         ppContestResultReport.Print;
      //      end;



   except
      tblRacesMaster.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

   tblRacesMaster.Active := False;

   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;

end;

procedure TContestResultReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TContestResultReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

end.
