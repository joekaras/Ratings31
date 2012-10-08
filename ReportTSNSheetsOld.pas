unit ReportTSNSheetsOld;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter;

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
    ppDBText1: TppDBText;
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
    ppDBText4: TppDBText;
    ppLabel11: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppShape1: TppShape;
    ProgramNbr: TppDBText;
    HorseName: TppDBText;
    DebutIndicator: TppDBText;
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
    ClassRating: TppDBText;
    TurfRating: TppDBText;
    MudRating: TppDBText;
    ppLine5: TppLine;
    TotalTrn30WinPct: TppDBText;
    TurfIndicator: TppDBText;
    MudIndicator: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
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
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    raCodeModule7: TraCodeModule;
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

      prgBar.Max := tblRL.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      tblRL.First();
      while not tblRL.Eof do begin
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages();
         sTrkCode := tblRL.FieldByName('TrkCode').AsString;
         if sPrevTrkCode <> tblRL.FieldByName('TrkCode').AsString then begin
            sPrevTrkCode := tblRL.FieldByName('TrkCode').AsString;

            tblRM.Active := True;
            tblRM.Filtered := False;
            tblRM.Filter := 'TrkCode=''' + tblRL.FieldByName('TrkCode').AsString + '''';
            tblRM.Filtered := True;

            DecodeDate(tblRL.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            sFileName := tblRL.FieldByName('TrkCode').AsString + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
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

            iAttributes := faAnyFile;
            if (FindFirst(ppTSNReport.TextFileName, iAttributes, tsFile) = 0) then begin
               if (tsFile.Size < MIN_REPORT_FILE_SIZE) then begin
                  DeleteFile(ppTSNReport.TextFileName);
                  Application.ProcessMessages();
               end;
            end;
            FindClose(tsFile);

         end;
         tblRL.Next();
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
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;
   end;

   tblRL.Active := False;

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

end.

