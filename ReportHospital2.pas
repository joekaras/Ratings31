unit ReportHospital2;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, DBISAMTb, ppComm, ppRelatv, ppDB, ppDBPipe, Db,
   ppBands, ppClass, ppModule, raCodMod, ppCtrls, ppMemo, ppVar,
   ppReport, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppProd, StdCtrls,
   daDataModule, ppParameter, mLog, ppBarCod;

type
   THospitalReport2Form = class(TForm)
    dbHospitalReport2: TDBISAMDatabase;
      staBar: TStatusBar;
      pnlPrgBar: TPanel;
      prgBar: TProgressBar;
      btnCreatePdf: TButton;
      tblRacesLoop: TDBISAMTable;
      tblRacesMaster: TDBISAMTable;
      plRacesReport: TppDBPipeline;
      dsRacesMaster: TDataSource;
      timCloseFormCheck: TTimer;
      ppParameterList1: TppParameterList;
      dsEntries: TDataSource;
      plEntries: TppDBPipeline;
      ppHospitalReport: TppReport;
      hLog: TmLog;
      tblEntries: TDBISAMTable;
      ppHeaderBand1: TppHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel24: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppDBText8: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppSubReport1: TppSubReport;
      ppChildReport12: TppChildReport;
      aTitleBand: TppTitleBand;
      RaceDesc: TppDBText;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel10: TppLabel;
      ppLabel14: TppLabel;
      ppLabel8: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel20: TppLabel;
      ppLabel9: TppLabel;
      ppLabel30: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel7: TppLabel;
      ppLabel32: TppLabel;
      ppLabel26: TppLabel;
      ppLabel19: TppLabel;
      ppLabel18: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel15: TppLabel;
      ppLabel60: TppLabel;
      ppLabel44: TppLabel;
      ppLabel46: TppLabel;
      ppLabel57: TppLabel;
      ppLabel61: TppLabel;
      ppLabel33: TppLabel;
      ppLabel50: TppLabel;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppLabel23: TppLabel;
      ppLabel39: TppLabel;
      ppLabel1: TppLabel;
      lblSireTurf: TppLabel;
      lblSire2yo: TppLabel;
      ppLabel34: TppLabel;
      ppLabel2: TppLabel;
      ppDBText11: TppDBText;
      ppDBText16: TppDBText;
      ppLabel11: TppLabel;
      ppLabel40: TppLabel;
      ppLabel53: TppLabel;
      ppLabel55: TppLabel;
      ppDBText18: TppDBText;
      ppLabel59: TppLabel;
      ppLabel63: TppLabel;
      ppLine23: TppLine;
      ppHeaderBand2: TppHeaderBand;
      aDetailBand: TppDetailBand;
      ppLine5: TppLine;
      ppLine14: TppLine;
      ppLine7: TppLine;
      ppLine6: TppLine;
      ppLine2: TppLine;
      ProgramNbr: TppDBText;
      Trainer: TppDBText;
      Jockey: TppDBText;
      Med: TppDBText;
      Pace: TppDBText;
      TotalTrnWinPct: TppDBText;
      TotalTrnJkyWinPct: TppDBText;
      TotalJky30WinPct: TppDBText;
      Sex: TppDBText;
      Age: TppDBText;
      ppDBText13: TppDBText;
      BredIn: TppDBText;
      TotalTrnDebutWinPct: TppDBText;
      MidPace: TppDBText;
      TotalJkyWinPct: TppDBText;
      ppLine10: TppLine;
      TotalTrnTurfWinPct: TppDBText;
      TotalTrnAftClmWinPct: TppDBText;
      TotalTrnDebutTwoWinPct: TppDBText;
      SurfaceChange: TppVariable;
      DistanceChange: TppVariable;
      lblErlPos: TppLabel;
      lblMidPos: TppLabel;
      TotalTrn2yoWinPct: TppDBText;
      ppLine18: TppLine;
      Equip: TppDBText;
      Weight: TppDBText;
      TotalTrnFirstJuiceWinPct: TppDBText;
      TotalTrnBlinkersOnWinPct: TppDBText;
      TotalTrnBlinkersOffWinPct: TppDBText;
      TurfIndicator: TppDBText;
      DebutIndicator: TppDBText;
      RouteIndicator: TppDBText;
      ppLine15: TppLine;
      TurfRating: TppDBText;
      ppLine12: TppLine;
      ppLine16: TppLine;
      DaysLast: TppDBText;
      Power: TppDBText;
      ppDBText5: TppDBText;
      SireName: TppDBText;
      ML: TppDBText;
      QSP1stCallRunStyle: TppDBText;
      HorseName: TppDBText;
      ppLine13: TppLine;
      ppLine22: TppLine;
      TotalTrnOwnWinPct: TppDBText;
      OwnerName: TppDBText;
      PowerAdvantage: TppDBText;
      ppLine3: TppLine;
      ppLine9: TppLine;
      ppLine11: TppLine;
      ppLine20: TppLine;
      ppLine24: TppLine;
      TotalTrn46To120WinPct: TppDBText;
      ppLabel22: TppLabel;
      PostPos: TppDBText;
      TotalTrn30WinPct: TppDBText;
      ppLine25: TppLine;
      ppLine26: TppLine;
      ppLine27: TppLine;
      ppLine28: TppLine;
      ppLine29: TppLine;
      ClassRating: TppDBText;
      DistanceRating: TppDBText;
      MudRating: TppDBText;
      ppLine30: TppLine;
      ppLine31: TppLine;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      raCodeModule1: TraCodeModule;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText17: TppDBText;
      ppLabel3: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLine35: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel49: TppLabel;
    ppLine19: TppLine;
    ppLabel41: TppLabel;
    ppLabel64: TppLabel;
    ppDBText30: TppDBText;
    ppLine37: TppLine;
    ppLabel12: TppLabel;
    ppLabel48: TppLabel;
    ppLine38: TppLine;
    ppLabel65: TppLabel;
    ppLine46: TppLine;
    ppDBText10: TppDBText;
    ppLabel4: TppLabel;
    Last2Comment2: TppDBText;
    Last2RaceDesc: TppDBText;
    LastComment2: TppDBText;
    LastRaceDesc: TppDBText;
    layoffline1: TppLine;
    ppLine1: TppLine;
    TurfWins: TppDBText;
    MudStarts: TppDBText;
    MudWins: TppDBText;
    TrkStarts: TppDBText;
    ppDBText15: TppDBText;
    lblTrack: TppLabel;
    ppLabel67: TppLabel;
    lblOnTurf: TppLabel;
    lblRoute: TppLabel;
    RouteStarts: TppDBText;
    RouteWins: TppDBText;
    lblSprint: TppLabel;
    SprintStarts: TppDBText;
    SprintWins: TppDBText;
    lblLife: TppLabel;
    LifeStarts: TppDBText;
    LifeWins: TppDBText;
    ppLine4: TppLine;
    ppLine21: TppLine;
    TurfStarts: TppDBText;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    LatePaceAdvantageWinPct: TppDBText;
    EarlyPaceAdvantageWinPct: TppDBText;
    MiddlePaceAdvantageWinPct: TppDBText;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure btnCreatePdfClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure timCloseFormCheckTimer(Sender: TObject);
      procedure plRacesReportNext(Sender: TObject);
      procedure plEntriesNext(Sender: TObject);
      procedure plEntriesRecordPositionChange(Sender: TObject);
      procedure plEntriesTraversal(Sender: TObject);
      procedure dbHospitalReport2BeforeConnect(Sender: TObject);
    procedure plRacesReportTraversal(Sender: TObject);
    procedure dsEntriesDataChange(Sender: TObject; Field: TField);
   private
      { Private declarations }
      bCreateReportsActive: boolean;
   public
      { Public declarations }
   end;

var
   HospitalReport2Form: THospitalReport2Form;

implementation

uses UnitCommonCode, StrMan;

{$R *.DFM}

//******************* TTipSheetReportForm.FormCreate *************************

procedure THospitalReport2Form.FormCreate(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   with dbHospitalReport2 do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

end;

//******************* TTipSheetReportForm.FormDestroy *************************

procedure THospitalReport2Form.FormDestroy(Sender: TObject);
begin

   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;

   tblEntries.Active := False;
   //   tblATrainerList.Active := False;

   with dbHospitalReport2 do begin
      Close;
   end;

end;

//******************* TTipSheetReportForm.btnCreatePdfClick *************************

procedure THospitalReport2Form.btnCreatePdfClick(Sender: TObject);
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


   tblRacesLoop.Active := False;
   tblRacesMaster.Active := False;
   tblEntries.Active := False;

   prgBar.Position := 0;
   pnlPrgBar.Visible := False;
   staBar.SimpleText := '';
   bCreateReportsActive := False;

   try

      sPrevTrkCode := '';
      tblRacesLoop.Active := True;

      tblRacesMaster.Active := False;
      tblEntries.Active := False;

      //      tblATrainerList.Active := True;

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

            DecodeDate(tblRacesLoop.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
            sFileName := tblRacesLoop.FieldByName('TrkCode').AsString + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';

            with ppHospitalReport do begin
               AllowPrintToFile := True;
               ShowPrintDialog := False;
               ShowCancelDialog := False;
               DeviceType := 'PDFFile';
               TextFileName := PDF_HOSPITAL_REPORT2_PATH + sFileName;
               staBar.SimpleText := 'Processing ' + TextFileName;
               Application.ProcessMessages;
               ppHospitalReport.Print;
            end;

            iAttributes := faAnyFile;
            if (FindFirst(ppHospitalReport.TextFileName, iAttributes, tsFile) = 0) then begin
               if (tsFile.Size < MIN_REPORT_FILE_SIZE) then begin
                  DeleteFile(ppHospitalReport.TextFileName);
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
      //      tblATrainerList.Active := False;

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

procedure THospitalReport2Form.FormActivate(Sender: TObject);
begin

   bCreateReportsActive := True;
   btnCreatePdfClick(Sender);

end;

procedure THospitalReport2Form.timCloseFormCheckTimer(Sender: TObject);
begin

   if not bCreateReportsActive then begin
      Close;
   end;

end;

procedure THospitalReport2Form.plRacesReportNext(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THospitalReport2Form.plEntriesNext(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THospitalReport2Form.plEntriesRecordPositionChange(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THospitalReport2Form.plEntriesTraversal(Sender: TObject);
begin
   Application.ProcessMessages;
end;

procedure THospitalReport2Form.dbHospitalReport2BeforeConnect(
   Sender: TObject);
begin
   dbHospitalReport2.Directory := DATA_PATH;

end;

procedure THospitalReport2Form.plRacesReportTraversal(Sender: TObject);
begin
         Application.ProcessMessages();
         Application.ProcessMessages();

end;

procedure THospitalReport2Form.dsEntriesDataChange(Sender: TObject;
  Field: TField);
begin
         Application.ProcessMessages();

end;

end.

