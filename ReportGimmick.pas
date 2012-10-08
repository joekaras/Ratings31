unit ReportGimmick;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter;

type
   TGimmickReportForm = class(TForm)
      dbGimmickReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblGimmicks: TDBISAMTable;
      dsGimmicks: TDataSource;
      plGimmicks: TppDBPipeline;
      ppGimmickReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      timCloseFormCheck: TTimer;
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
      ppDBText8: TppDBText;
      raCodeModule1: TraCodeModule;
      raCodeModule2: TraCodeModule;
      daDataModule1: TdaDataModule;
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
   GimmickReportForm: TGimmickReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TGimmickReportForm.FormCreate(Sender: TObject);
begin

   with dbGimmickReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TGimmickReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesMaster.Active := False;
   tblGimmicks.Active := False;

   with dbGimmickReport do begin
      Close;
   end;

end;

procedure TGimmickReportForm.btnCreatePdfClick(Sender: TObject);
var
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
begin

   try


      tblRacesMaster.Active := False;
      tblGimmicks.Active := False;

      tblRacesMaster.Active := True;

      prgBar.Max := tblRacesMaster.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages();

      tblRacesMaster.Filtered := False;
      tblRacesMaster.Filtered := True;

      DecodeDate(tblRacesMaster.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
      sFileName := 'ValueGimmicks' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
      with ppGimmickReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_VALUE_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppGimmickReport.Print;
      end;



   except
      tblRacesMaster.Active := False;
      tblGimmicks.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

   tblRacesMaster.Active := False;
   tblGimmicks.Active := False;

   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;

end;

procedure TGimmickReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TGimmickReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

end.
