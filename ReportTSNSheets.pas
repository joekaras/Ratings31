unit ReportTSNSheets;
//IsWagerSheetSelected=True and TypeOfRace = 'T' and IsPrintedOnValueSheet = True and Is10CentSuperfectaRace=True and NbrRunners>=8
//((TodaysWagerWinPctRank=1) or (FinalWinPctRank=1) or (IsWagerSheetSelected=True) or (IsSpeedSheetSelected=True)) and IsPrintedOnValueSheet = True
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, ppRichTx;

type
   TTSNReportForm = class(TForm)
      dbTSNSheets: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblRM: TDBISAMTable;
      plR: TppDBPipeline;
      tblE: TDBISAMTable;
      tblELS: TDBISAMTable;
      tblEBS: TDBISAMTable;
      dsE: TDataSource;
      dsELS: TDataSource;
      plE: TppDBPipeline;
      plELS: TppDBPipeline;
      plEBS: TppDBPipeline;
      dsEBS: TDataSource;
      ppTSNReport: TppReport;
      staBar: TStatusBar;
      tblRL: TDBISAMTable;
      btnCreatePdf: TButton;
      dsRMaster: TDataSource;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      tblECC: TDBISAMTable;
      dsECC: TDataSource;
      plECC: TppDBPipeline;
      tblEBC: TDBISAMTable;
      tblEP: TDBISAMTable;
      dsEBC: TDataSource;
      dsEP: TDataSource;
      plEBC: TppDBPipeline;
      plEP: TppDBPipeline;
      tblPwr: TDBISAMTable;
      dsPwr: TDataSource;
      plPwr: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppDBText2: TppDBText;
      ppSystemVariable1: TppSystemVariable;
      ppLabel24: TppLabel;
      ppDetailBand1: TppDetailBand;
      Power: TppSubReport;
      ppChildReport12: TppChildReport;
      ppTitleBand12: TppTitleBand;
      ppShape9: TppShape;
      ppDBText3: TppDBText;
      ppShape5: TppShape;
      ppDBMemo1: TppDBMemo;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel14: TppLabel;
      lblMDN: TppLabel;
      lblTrf: TppLabel;
      lblMud: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      Pick3: TppDBText;
      ppLabel11: TppLabel;
      ppLabel15: TppLabel;
      ppDBText1: TppDBText;
      Super: TppDBText;
      ppLabel16: TppLabel;
      WagerFinalOrder: TppDBText;
      lblPK3: TppLabel;
      lblSFC: TppLabel;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDetailBand13: TppDetailBand;
      ppShape1: TppShape;
      ProgramNbr: TppDBText;
      HorseName: TppDBText;
      TrnTodayWinPct: TppDBText;
      Trainer: TppDBText;
      Jockey: TppDBText;
      OwnerName: TppDBText;
      MorningLineDesc: TppDBText;
      TotalJky30WinPct: TppDBText;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      TotalTrn30WinPct: TppDBText;
      TrnTrackRank: TppDBText;
      JkyTrackRank: TppDBText;
      varValue: TppVariable;
      ppLine11: TppLine;
      NormalTodaysWagerOdds: TppDBText;
      ppDBText4: TppDBText;
      raCodeModule2: TraCodeModule;
      TotalTurfReport: TppSubReport;
      ppChildReport13: TppChildReport;
      ppTitleBand13: TppTitleBand;
      ppShape3: TppShape;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppDetailBand14: TppDetailBand;
      ppShape4: TppShape;
      ppDBText9: TppDBText;
      AvgClass: TppDBText;
      ECHorseName: TppDBText;
      raCodeModule3: TraCodeModule;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppShape6: TppShape;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppShape2: TppShape;
      ppDBText21: TppDBText;
      ppDBText20: TppDBText;
      ppDBText22: TppDBText;
      raCodeModule1: TraCodeModule;
      LastSpeed: TppSubReport;
      ppChildReport2: TppChildReport;
      ppTitleBand2: TppTitleBand;
      ppShape7: TppShape;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppShape8: TppShape;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      raCodeModule5: TraCodeModule;
      ppSubReport3: TppSubReport;
      ppChildReport3: TppChildReport;
      ppTitleBand3: TppTitleBand;
      ppShape10: TppShape;
      ppLabel8: TppLabel;
      ppLabel10: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppShape11: TppShape;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppDBText25: TppDBText;
      raCodeModule6: TraCodeModule;
      ppSubReport2: TppSubReport;
      ppChildReport4: TppChildReport;
      ppTitleBand4: TppTitleBand;
      ppShape13: TppShape;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppDetailBand5: TppDetailBand;
      ppShape12: TppShape;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText11: TppDBText;
      raCodeModule4: TraCodeModule;
      ppSubReport4: TppSubReport;
      ppChildReport5: TppChildReport;
      ppTitleBand5: TppTitleBand;
      ppShape15: TppShape;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppDetailBand6: TppDetailBand;
      ppShape16: TppShape;
      ppDBText15: TppDBText;
      ppDBText19: TppDBText;
      ppDBText26: TppDBText;
      raCodeModule8: TraCodeModule;
      ppFooterBand1: TppFooterBand;
      ppRichText1: TppRichText;
      ppLine8: TppLine;
      raCodeModule7: TraCodeModule;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure dbTSNSheetsBeforeConnect(Sender: TObject);
   private
      { Private declarations }
      bCreateReportsActive: boolean;
   public
      { Public declarations }
   end;

var
   TSNReportForm: TTSNReportForm;

implementation

uses StrMan, UnitCommonCode;

{$R *.DFM}

procedure TTSNReportForm.FormCreate(Sender: TObject);
begin

   with dbTSNSheets do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TTSNReportForm.FormDestroy(Sender: TObject);
begin

   tblRL.Active := False;
   tblRM.Active := False;

   tblE.Active := False;
   tblELS.Active := False;
   tblEBS.Active := False;
   tblECC.Active := False;
   tblEBC.Active := False;
   tblEP.Active := False;
   tblPwr.Active := False;

   with dbTSNSheets do begin
      Close;
   end;

end;

procedure TTSNReportForm.btnCreatePdfClick(Sender: TObject);
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
      tblRL.Active := True;

      tblRM.Active := False;
      tblE.Active := False;
      tblELS.Active := False;
      tblEBS.Active := False;
      tblECC.Active := False;
      tblEBC.Active := False;
      tblEP.Active := False;
      tblPwr.Active := False;

      prgBar.Max := tblRL.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      tblRL.First();

      tblRM.Active := True;
      //      tblRM.Filtered := False;
     // 'IsTSNProcessed=True and Is10CentSuperfectaRace=True and NbrStartes>=8';
      //tblRM.Filter := 'IsOverlaySheetSelected=True and IsPrintedOnValueSheets and TypeOfRace = ''T''';

      tblRM.Filtered := True;


      tblE.Filter := '(IsSpeedSheetSelected=True or IsWagerSheetSelected) and IsYouBetTrack=True';

      tblELS.Filter := '(IsSpeedSheetSelected=True or IsWagerSheetSelected) and IsYouBetTrack=True';
      tblEBS.Filter := '(IsSpeedSheetSelected=True or IsWagerSheetSelected) and IsYouBetTrack=True';
      tblECC.Filter := '(IsSpeedSheetSelected=True or IsWagerSheetSelected) and IsYouBetTrack=True';
      tblEBC.Filter := '(IsSpeedSheetSelected=True or IsWagerSheetSelected) and IsYouBetTrack=True';
      tblEP.Filter := '(IsSpeedSheetSelected=True or IsWagerSheetSelected) and IsYouBetTrack=True';
      tblPwr.Filter := '(IsSpeedSheetSelected=True or IsWagerSheetSelected) and IsYouBetTrack=True';

      tblE.Filtered := True;
      tblELS.Filtered := True;
      tblEBS.Filtered := True;
      tblECC.Filtered := True;
      tblEBC.Filtered := True;
      tblEP.Filtered := True;
      tblPwr.Filtered := True;

      tblE.Filtered := True;
      tblELS.Filtered := True;
      tblEBS.Filtered := True;
      tblECC.Filtered := True;
      tblEBC.Filtered := True;
      tblEP.Filtered := True;
      tblPwr.Filtered := True;

      DecodeDate(tblRL.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
      sFileName := 'TipSheet' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
      with ppTSNReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := PDF_TIP_REPORT_PATH + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppTSNReport.Print;
      end;

   except
      tblRL.Active := False;
      tblRM.Active := False;
      tblE.Active := False;
      tblELS.Active := False;
      tblEBS.Active := False;
      tblECC.Active := False;
      tblEBC.Active := False;
      tblEP.Active := False;
      tblPwr.Active := False;

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

   //   try
   //
   //      sPrevTrkCode := '';
   //      tblRL.Active := True;
   //
   //      tblRM.Active := False;
   //      tblE.Active := False;
   //      tblELS.Active := False;
   //      tblEBS.Active := False;
   //      tblECC.Active := False;
   //      tblEBC.Active := False;
   //      tblEP.Active := False;
   //      tblPwr.Active := False;
   //
   //      prgBar.Max := tblRL.RecordCount;
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := True;
   //
   //      tblRL.First();
   //
   //      tblRM.Active := True;
   //      tblRM.Filtered := False;
   //      tblRM.Filter := 'IsPrintedOnValueSheet=True';
   //
   //      tblRM.Filtered := True;
   //      tblE.Filtered := False;
   //      tblELS.Filtered := False;
   //      tblEBS.Filtered := False;
   //      tblECC.Filtered := False;
   //      tblEBC.Filtered := False;
   //      tblEP.Filtered := False;
   //      tblPwr.Filtered := False;
   //
   //      DecodeDate(tblRL.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
   //      sFileName := 'TipSheetAll' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
   //      with ppTSNReport do begin
   //         AllowPrintToFile := True;
   //         ShowPrintDialog := False;
   //         ShowCancelDialog := False;
   //         DeviceType := 'PDFFile';
   //         TextFileName := PDF_TIP_REPORT_PATH + sFileName;
   //         staBar.SimpleText := 'Processing ' + TextFileName;
   //         Application.ProcessMessages;
   //         ppTSNReport.Print;
   //      end;
   //
   //   except
   //      tblRL.Active := False;
   //      tblRM.Active := False;
   //      tblE.Active := False;
   //      tblELS.Active := False;
   //      tblEBS.Active := False;
   //      tblECC.Active := False;
   //      tblEBC.Active := False;
   //      tblEP.Active := False;
   //      tblPwr.Active := False;
   //
   //      prgBar.Position := 0;
   //      pnlPrgBar.Visible := False;
   //      staBar.SimpleText := '';
   //      bCreateReportsActive := False;
   //   end;
   //

   tblRL.Active := False;
   tblRM.Active := False;
   tblE.Active := False;
   tblELS.Active := False;
   tblEBS.Active := False;
   tblECC.Active := False;
   tblEBC.Active := False;
   tblEP.Active := False;
   tblPwr.Active := False;

   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;




end;

procedure TTSNReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TTSNReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure TTSNReportForm.dbTSNSheetsBeforeConnect(Sender: TObject);
begin

   dbTSNSheets.Directory := DATA_PATH;

end;

end.
