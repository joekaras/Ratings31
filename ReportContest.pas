unit ReportContest;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, myChkBox;

type
   TContestReportForm = class(TForm)
      dbContestSheets: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      ppContestReport: TppReport;
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
      DetailBand: TppDetailBand;
      ppShape1: TppShape;
      Pick3: TppDBText;
      ppDBText2: TppDBText;
      Super: TppDBText;
      ppDBText4: TppDBText;
      ppLine2: TppLine;
      ppDBText6: TppDBText;
      ppLine3: TppLine;
      ppDBText7: TppDBText;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      myDBCheckBox1: TmyDBCheckBox;
      ppLine7: TppLine;
      NbrStarters: TppDBText;
      ppLine8: TppLine;
      ppDBText3: TppDBText;
      ppDBText1: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLine1: TppLine;
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
   end;

var
   ContestReportForm: TContestReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TContestReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   with dbContestSheets do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TContestReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesMaster.Active := False;


   with dbContestSheets do begin
      Close;
   end;

end;

procedure TContestReportForm.btnCreatePdfClick(Sender: TObject);
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

   try

      sPrevTrkCode := '';

      tblRacesMaster.Active := True;

      prgBar.Max := tblRacesMaster.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages();
      tblRacesMaster.Active := True;
      DecodeDate(tblRacesMaster.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
      sFileName := 'SuperAndPk3' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
      with ppContestReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_VALUE_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppContestReport.Print;
      end;



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

procedure TContestReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TContestReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

end.
