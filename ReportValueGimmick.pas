unit ReportValueGimmick;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter;

type
   TValueGimmickReportForm = class(TForm)
      dbValueGimmickReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblGimmicks: TDBISAMTable;
      dsGimmicks: TDataSource;
      plGimmicks: TppDBPipeline;
      ppValueGimmickReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      timCloseFormCheck: TTimer;
      tblRacesLoop: TDBISAMTable;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      dsRacesMaster: TDataSource;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppDBText2: TppDBText;
      ppLabel24: TppLabel;
      ppDetailBand1: TppDetailBand;
      TotalRatingReport: TppSubReport;
      ppChildReport12: TppChildReport;
      ppDetailBand13: TppDetailBand;
      ppShape4: TppShape;
      ppLine2: TppLine;
      Wager1: TppDBText;
      ppDBText4: TppDBText;
      ppDBText7: TppDBText;
      ppLine8: TppLine;
      ppDBText10: TppDBText;
      ppLine9: TppLine;
      lblTri: TppLabel;
      ppDBText13: TppDBText;
      ppLabel6: TppLabel;
      lblPick3: TppLabel;
      ppDBText16: TppDBText;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      lblTurf: TppLabel;
      ppLabel14: TppLabel;
      lblPedigree: TppLabel;
      ppDBText12: TppDBText;
      txtTurf: TppDBText;
      ppDBText18: TppDBText;
      txtPedigree: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppLabel20: TppLabel;
      ppDBText27: TppDBText;
      ppLabel21: TppLabel;
      ppDBText28: TppDBText;
      ppLabel10: TppLabel;
      ppLabel13: TppLabel;
      ppLabel19: TppLabel;
      ppLabel22: TppLabel;
      ppDBText17: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppLabel25: TppLabel;
      ppDBText31: TppDBText;
      Tri: TppDBText;
      ppDBText1: TppDBText;
      lblPick4: TppLabel;
      Super: TppDBText;
      lblSuper: TppLabel;
      ppDBText3: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel4: TppLabel;
      ppDBText9: TppDBText;
      ppDBText8: TppDBText;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      raCodeModule1: TraCodeModule;
      daDataModule1: TdaDataModule;
      raCodeModule2: TraCodeModule;
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
   ValueGimmickReportForm: TValueGimmickReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TValueGimmickReportForm.FormCreate(Sender: TObject);
begin

   with dbValueGimmickReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TValueGimmickReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;

   tblGimmicks.Active := False;

   with dbValueGimmickReport do begin
      Close;
   end;

end;

procedure TValueGimmickReportForm.btnCreatePdfClick(Sender: TObject);
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
      tblRacesLoop.Active := True;

      tblRacesMaster.Active := False;
      tblGimmicks.Active := False;

      prgBar.Max := tblRacesLoop.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages();

      tblRacesMaster.Active := True;
      tblRacesMaster.Filtered := False;

      tblRacesMaster.Filtered := True;

      tblRacesLoop.First();
      DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
      sFileName := 'DollarGimmickPlays' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';

      with ppValueGimmickReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_VALUE_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppValueGimmickReport.Print;
      end;



   except
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;
      tblGimmicks.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;
   tblGimmicks.Active := False;

   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;

end;

procedure TValueGimmickReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TValueGimmickReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

end.
