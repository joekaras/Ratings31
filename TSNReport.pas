Unit TSNReport;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
  ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
  ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
  daDataModule, ppParameter;

Type
  TTSNReportForm = Class(TForm)
    dbTSNSheets: TDBISAMDatabase;
    pnlPrgBar: TPanel;
    prgBar: TProgressBar;
    tblRMaster: TDBISAMTable;
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
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppShape1: TppShape;
    ppDBText5: TppDBText;
    HorseName: TppDBText;
    ppDBText4: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ML: TppDBText;
    varValue: TppVariable;
    Gator: TppVariable;
    lblErlPos: TppLabel;
    ppLabel92: TppLabel;
    ppLabel91: TppLabel;
    ErlPace: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine13: TppLine;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    raCodeModule2: TraCodeModule;
    TotalTurfReport: TppSubReport;
    ppChildReport13: TppChildReport;
    ppTitleBand13: TppTitleBand;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppShape4: TppShape;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    raCodeModule3: TraCodeModule;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape7: TppShape;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel30: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape2: TppShape;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    raCodeModule1: TraCodeModule;
    LastSpeed: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape6: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape8: TppShape;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText24: TppDBText;
    raCodeModule5: TraCodeModule;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppSubReport2: TppSubReport;
    ppChildReport4: TppChildReport;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    dsEBC: TDataSource;
    dsEP: TDataSource;
    plEBC: TppDBPipeline;
    plEP: TppDBPipeline;
    Procedure FormCreate(Sender: TObject);
    Procedure FormDestroy(Sender: TObject);
    Procedure btnCreatePdfClick(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
    Procedure timCloseFormCheckTimer(Sender: TObject);
  private
    { Private declarations }
    bCreateReportsActive: boolean;
  public
    { Public declarations }
  End;

Var
  TSNReportForm: TTSNReportForm;

Implementation

Uses CommonCode, StrMan;

{$R *.DFM}

Procedure TTSNReportForm.FormCreate(Sender: TObject);
Begin

  With dbTipSheets Do Begin
    Close;
    Directory := DATA_PATH;
    Open;
  End;

End;

Procedure TTSNReportForm.FormDestroy(Sender: TObject);
Begin

  tblRacesLoop.Active := False;
  tblRacesMaster.Active := False;

  tblEntries.Active := False;
  tblMaidenEntries.Active := False;
  tblTurfEntries.Active := False;
  tblMudEntries.Active := False;

  With dbTipSheets Do Begin
    Close;
  End;

End;

Procedure TTSNReportForm.btnCreatePdfClick(Sender: TObject);
Var
  sTrkCode: String;
  sPrevTrkCode: String;
  wYear: Word;
  wMonth: Word;
  wDay: Word;
  sFileName: String;
  iAttributes: integer;
  tsFile: TSearchRec;

Begin

  Try

    sPrevTrkCode := '';
    tblRacesLoop.Active := True;

    tblRacesMaster.Active := False;
    tblEntries.Active := False;
    tblMudEntries.Active := False;
    tblTurfEntries.Active := False;
    tblMaidenEntries.Active := False;

    prgBar.Max := tblRacesLoop.RecordCount;
    prgBar.Position := 0;
    pnlPrgBar.Visible := True;

    tblRacesLoop.First();
    While Not tblRacesLoop.Eof Do Begin
      prgBar.Position := prgBar.Position + 1;
      Application.ProcessMessages();
      sTrkCode := tblRacesLoop.FieldByName('TrkCode').AsString;
      If sPrevTrkCode <> tblRacesLoop.FieldByName('TrkCode').AsString Then Begin
        sPrevTrkCode := tblRacesLoop.FieldByName('TrkCode').AsString;

        tblRacesMaster.Active := True;
        tblRacesMaster.Filtered := False;
        tblRacesMaster.Filter := 'TrkCode=''' + tblRacesLoop.FieldByName('TrkCode').AsString + '''';
        tblRacesMaster.Filter := tblRacesMaster.Filter + ' AND IsCreateTip=True';
        tblRacesMaster.Filtered := True;

        DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
        sFileName := tblRacesLoop.FieldByName('TrkCode').AsString + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
        With ppTipSheetReport Do Begin
          AllowPrintToFile := True;
          ShowPrintDialog := False;
          ShowCancelDialog := False;
          DeviceType := 'PDFFile';
          TextFileName := PDF_SHEETS_PATH + sFileName;
          staBar.SimpleText := 'Processing ' + TextFileName;
          Application.ProcessMessages;
          ppTipSheetReport.Print;
        End;

        iAttributes := faAnyFile;
        If (FindFirst(ppTipSheetReport.TextFileName, iAttributes, tsFile) = 0) Then Begin
          If (tsFile.Size < MIN_REPORT_FILE_SIZE) Then Begin
            DeleteFile(ppTipSheetReport.TextFileName);
            Application.ProcessMessages();
          End;
        End;
        FindClose(tsFile);

      End;
      tblRacesLoop.Next();
    End;

  Except
    tblRacesLoop.Active := False;
    tblRacesMaster.Active := False;
    tblEntries.Active := False;
    tblMudEntries.Active := False;
    tblTurfEntries.Active := False;
    tblMaidenEntries.Active := False;
    prgBar.Position := 0;
    pnlPrgBar.Visible := False;
    staBar.SimpleText := '';
    bCreateReportsActive := False;
  End;

  tblRacesLoop.Active := False;
  tblRacesMaster.Active := False;
  tblEntries.Active := False;
  tblMudEntries.Active := False;
  tblTurfEntries.Active := False;
  tblMaidenEntries.Active := False;

  prgBar.Position := 0;
  pnlPrgBar.Visible := False;
  staBar.SimpleText := '';
  bCreateReportsActive := False;

End;

Procedure TTSNReportForm.FormActivate(Sender: TObject);
Begin

  bCreateReportsActive := True;
  btnCreatePdfClick(Sender);

End;

Procedure TTSNReportForm.timCloseFormCheckTimer(Sender: TObject);
Begin

  If Not bCreateReportsActive Then Begin
    Close;
  End;

End;

End.
