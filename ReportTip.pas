unit ReportTip;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog;

type
   TTipReportForm = class(TForm)
      dbTipSheets: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      dsEntries: TDataSource;
      plEntries: TppDBPipeline;
      ppTipSheetReport: TppReport;
      staBar: TStatusBar;
      tblRacesLoop: TDBISAMTable;
      btnCreatePdf: TButton;
      dsRacesMaster: TDataSource;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      hLog: TmLog;
      tblEntries: TDBISAMTable;
    ppDetailBand3: TppDetailBand;
    ppDBText14: TppDBText;
    lblErlPace: TppLabel;
    ErlPaceSheetOrder: TppDBText;
    lblMidPace: TppLabel;
    ppDBText18: TppDBText;
    ppLabel14: TppLabel;
    ppLabel11: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppDBText6: TppDBText;
    txtDebut: TppDBText;
    txtDebutTurf: TppDBText;
    txtSts: TppDBText;
    Starters: TppLabel;
    lblDebut: TppLabel;
    lblDebutTurf: TppLabel;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel15: TppLabel;
    ppDBText8: TppDBText;
    ppDBText15: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel6: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure GenerateReport(sFilePath: string);
   private
      { Private declarations }
      bCreateReportsActive: boolean;
   public
      sFileName: string;
      { Public declarations }
   end;

var
   TipReportForm: TTipReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TTipReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   with dbTipSheets do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TTipReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;

   tblEntries.Active := False;


   with dbTipSheets do begin
      Close;
   end;

end;

procedure TTipReportForm.btnCreatePdfClick(Sender: TObject);
var
   sTrkCode: string;
   sPrevTrkCode: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   //  sFileName: string;
   iAttributes: integer;
   tsFile: TSearchRec;

begin



   try


      //Start
      tblRacesLoop.Active := False;
      tblRacesMaster.Active := False;
      tblEntries.Active := False;
      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      staBar.SimpleText := '';
      bCreateReportsActive := False;

      try

         tblRacesLoop.Active := True;
         tblRacesMaster.Active := False;
         tblRacesMaster.IndexName := 'ByCT';
         tblRacesMaster.Filter := '';
         tblRacesMaster.Filtered := False;

         //  tblATrainerList.Active := True;

         tblEntries.Active := True;
         tblEntries.Filtered := False;

         tblEntries.Filter := '(IsPrintedOnValueSheet=True)';

         tblEntries.Filtered := True;

         if tblEntries.RecordCount > 0 then begin
            //  InitPrgBar();

            tblRacesLoop.First();
            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            sFileName := 'All_RobAndBob' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            GenerateReport(PDF_TIP_REPORT_PATH);
         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            tblRacesLoop.Active := False;
            tblRacesMaster.Active := False;
            tblEntries.Active := False;
            // tblATrainerList.Active := False;
            prgBar.Position := 0;
            pnlPrgBar.Visible := False;
            staBar.SimpleText := '';
            bCreateReportsActive := False;
         end;
      end;

      sPrevTrkCode := '';
      tblRacesLoop.Active := True;

      tblRacesMaster.Active := False;
      tblEntries.Active := False;


      prgBar.Max := tblRacesLoop.RecordCount;
      prgBar.Position := 0;
      pnlPrgBar.Visible := True;

      tblRacesLoop.First();
      while not tblRacesLoop.Eof do begin
         prgBar.Position := prgBar.Position + 1;
         Application.ProcessMessages();
         sTrkCode := tblRacesLoop.FieldByName('TrkCode').AsString;
         if sPrevTrkCode <> tblRacesLoop.FieldByName('TrkCode').AsString then begin
            sPrevTrkCode := tblRacesLoop.FieldByName('TrkCode').AsString;

            tblRacesMaster.Active := True;
            tblRacesMaster.Filtered := False;
            tblRacesMaster.Filter := 'TrkCode=''' + tblRacesLoop.FieldByName('TrkCode').AsString + '''';
            //            tblRacesMaster.Filter := tblRacesMaster.Filter + ' AND IsCreateTip=True';
            tblRacesMaster.Filtered := True;

            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            sFileName := tblRacesLoop.FieldByName('TrkCode').AsString + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            with ppTipSheetReport do begin
               AllowPrintToFile := True;
               ShowPrintDialog := False;
               ShowCancelDialog := False;
               DeviceType := 'PDFFile';
               TextFileName := PDF_TIP_REPORT_PATH + sFileName;
               staBar.SimpleText := 'Processing ' + TextFileName;
               Application.ProcessMessages;
               ppTipSheetReport.Print;
            end;

            iAttributes := faAnyFile;
            if (FindFirst(ppTipSheetReport.TextFileName, iAttributes, tsFile) = 0) then begin
               if (tsFile.Size < MIN_REPORT_FILE_SIZE) then begin
                  DeleteFile(ppTipSheetReport.TextFileName);
                  Application.ProcessMessages();
               end;
            end;
            FindClose(tsFile);

         end;
         tblRacesLoop.Next();
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
   tblRacesMaster.Active := False;
   tblEntries.Active := False;


   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;

end;

procedure TTipReportForm.GenerateReport(sFilePath: string);
begin
   try
      with ppTipSheetReport do begin
         AllowPrintToFile := True;
         ShowPrintDialog := False;
         ShowCancelDialog := False;
         DeviceType := 'PDFFile';
         TextFileName := sFilePath + sFileName;
         staBar.SimpleText := 'Processing ' + TextFileName;
         Application.ProcessMessages;
         ppTipSheetReport.Print;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TTipReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TTipReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

end.

