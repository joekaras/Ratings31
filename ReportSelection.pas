unit ReportSelection;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog;

type
   TSelectionReportForm = class(TForm)
      dbSelectionReport: TDBISAMDatabase;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      tblEntries: TDBISAMTable;
      dsEntries: TDataSource;
      plEntries: TppDBPipeline;
      ppSelectionReport: TppReport;
      staBar: TStatusBar;
      btnCreatePdf: TButton;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      tblRacesMaster: TDBISAMTable;
      dsRacesMaster: TDataSource;
      plRacesReport: TppDBPipeline;
      tblRacesLoop: TDBISAMTable;
      hLog: TmLog;
      ppHeaderBand1: TppHeaderBand;
      ppDBText2: TppDBText;
      ppLine1: TppLine;
      ppDBText35: TppDBText;
      ppDetailBand1: TppDetailBand;
      TotalRatingReport: TppSubReport;
      ppChildReport12: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppShape9: TppShape;
      ppLabel1: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel17: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppDBText55: TppDBText;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppDetailBand13: TppDetailBand;
      ppDBText7: TppDBText;
      ppDBText3: TppDBText;
      ppDBText6: TppDBText;
      ppDBText1: TppDBText;
      ppDBText10: TppDBText;
      ppDBText12: TppDBText;
      ppLine2: TppLine;
      TodaysWagerStarts: TppDBText;
      ppLine4: TppLine;
      ppDBText23: TppDBText;
      BackSpeedRank: TppDBText;
      LastSpeedRank: TppDBText;
      PowerRank: TppDBText;
      NbrWorksLast: TppDBText;
      EarlyPaceRank: TppDBText;
      ppDBText30: TppDBText;
      StartsWorks21: TppDBText;
      ppLine9: TppLine;
      ppLine12: TppLine;
      ppLine14: TppLine;
      ppLine15: TppLine;
      ppLine16: TppLine;
      ppLine18: TppLine;
      ppDBText17: TppDBText;
      ppLine36: TppLine;
      ppDBText58: TppDBText;
      TodaysWagerValueBet: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppSubReport1: TppSubReport;
      Pick3Sub: TppChildReport;
      ppTitleBand2: TppTitleBand;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel18: TppLabel;
      ppLabel22: TppLabel;
      ppLabel40: TppLabel;
      ppLabel43: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppShape2: TppShape;
      HorseName: TppDBText;
      ProgramNbr: TppDBText;
      ppLine22: TppLine;
      SecondaryStarts: TppDBText;
      SecondaryWinPct: TppDBText;
      raCodeModule2: TraCodeModule;
      raCodeModule3: TraCodeModule;
      ppLabel14: TppLabel;
      LastClassRank: TppDBText;
      ppDBText67: TppDBText;
      ppDBText68: TppDBText;
      ppDBText69: TppDBText;
      ppDBText11: TppDBText;
      ppLine5: TppLine;
      ppDBText19: TppDBText;
      SireTurfThisYearRank: TppDBText;
      ppLabel33: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      MiddlePaceRank: TppDBText;
      LatePaceRank: TppDBText;
      EarlyPacePosRank: TppDBText;
      MiddlePacePosRank: TppDBText;
      LatePacePosRank: TppDBText;
      ppLine21: TppLine;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel16: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      ppDBText73: TppDBText;
      ppLine7: TppLine;
      ppLine13: TppLine;
      ppLine19: TppLine;
      ppLabel56: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppLine20: TppLine;
      ppLine28: TppLine;
      ppLine29: TppLine;
      ppLine30: TppLine;
      ppLine31: TppLine;
      ppShape3: TppShape;
      SireGeneralThisYearRank: TppDBText;
      SireJuvenileThisYearRank: TppDBText;
      BackClassRank: TppDBText;
      ppLabel65: TppLabel;
      ppLine26: TppLine;
      ppDBText9: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppLabel54: TppLabel;
      ppLine27: TppLine;
      ppLabel66: TppLabel;
      ppLabel60: TppLabel;
      QSP1stCallRunStyle: TppDBText;
      ppLine39: TppLine;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText8: TppDBText;
      ppLabel55: TppLabel;
      ppDBText16: TppDBText;
      ppDBText18: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText20: TppDBText;
      ppDBText15: TppDBText;
      ppDBText14: TppDBText;
      ppLabel25: TppLabel;
      ppLine3: TppLine;
      ppLabel15: TppLabel;
      ppShape1: TppShape;
      ppLine6: TppLine;
      ppLine8: TppLine;
      ppLine10: TppLine;
      ppLine11: TppLine;
      ppLine17: TppLine;
      ppLine23: TppLine;
      ppLine24: TppLine;
      ppLine25: TppLine;
      ppDBText13: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText31: TppDBText;
      ppLine34: TppLine;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppLine32: TppLine;
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
   SelectionReportForm: TSelectionReportForm;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

procedure TSelectionReportForm.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   with dbSelectionReport do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

procedure TSelectionReportForm.FormDestroy(Sender: TObject);
begin

   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;

   tblEntries.Active := False;

   with dbSelectionReport do begin
      Close;
   end;

end;

procedure TSelectionReportForm.btnCreatePdfClick(Sender: TObject);
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
      tblRacesMaster.Filtered := True;

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
            tblRacesMaster.Filtered := True;

            //tblRacesMaster.SetRangeStart;
            //tblRacesMaster.FieldByName('TrkCode').AsString := tblRacesLoop.FieldByName('TrkCode').AsString;
            //tblRacesMaster.KeyFieldCount := 1;
            //
            //tblRacesMaster.SetRangeEnd;
            //tblRacesMaster.FieldByName('TrkCode').AsString := tblRacesLoop.FieldByName('TrkCode').AsString;
            //tblRacesMaster.KeyFieldCount := 1;

            //tblRacesMaster.ApplyRange;

            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            sFileName := tblRacesLoop.FieldByName('TrkCode').AsString + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';
            with ppSelectionReport do begin
               AllowPrintToFile := True;
               ShowPrintDialog := False;
               ShowCancelDialog := False;
               DeviceType := 'PDFFile';
               TextFileName := PDF_SELECTION_REPORT_PATH + sFileName;
               staBar.SimpleText := 'Processing ' + TextFileName;
               Application.ProcessMessages;
               ppSelectionReport.Print;
            end;

            iAttributes := faAnyFile;
            if (FindFirst(ppSelectionReport.TextFileName, iAttributes, tsFile) = 0) then begin
               if (tsFile.Size < MIN_REPORT_FILE_SIZE) then begin
                  DeleteFile(ppSelectionReport.TextFileName);
                  Application.ProcessMessages();
               end;
            end;
            FindClose(tsFile);
            //tblRacesMaster.CancelRange;

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

procedure TSelectionReportForm.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure TSelectionReportForm.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

end.
