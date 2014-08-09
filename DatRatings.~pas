unit DatRatings;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db;

type
   Tdm = class(TDataModule)
      dbSireRate: TDBISAMDatabase;
      tblTrack: TDBISAMTable;
      tblProcessed: TDBISAMTable;
      tblVendor: TDBISAMTable;
      tblTotals: TDBISAMTable;
      tblEquibase: TDBISAMTable;
      tblOwner: TDBISAMTable;
      tblBreeder: TDBISAMTable;
      tblHH: TDBISAMTable;
      tblSummaryFlds: TDBISAMTable;
      tblSummaryTotals: TDBISAMTable;
      tblRH: TDBISAMTable;
      tblFinalOrder: TDBISAMTable;
      tblDam: TDBISAMTable;
      tblSire: TDBISAMTable;
      tblEntries: TDBISAMTable;
      tblPP: TDBISAMTable;
      tblGimmicks: TDBISAMTable;
      tblRatings: TDBISAMTable;
      tblPast: TDBISAMTable;
      tblRaces: TDBISAMTable;
      tblRankingStatsByTrk: TDBISAMTable;
      tblRankingStats: TDBISAMTable;
      tblTrainer: TDBISAMTable;
      tblJockey: TDBISAMTable;
      tblTrainerDebutSummary: TDBISAMTable;
      tblOwnerSummary: TDBISAMTable;
      tblDamSireSummary: TDBISAMTable;
      tblTrainerOwnerSummary: TDBISAMTable;
      tblSireSummary: TDBISAMTable;
      tblTrainerJockeySummary: TDBISAMTable;
      tblTrainer46To120Summary: TDBISAMTable;
      tblDamSummary: TDBISAMTable;
      tblBreederSummary: TDBISAMTable;
      tblTrainerDebutTwoSummary: TDBISAMTable;
      tblJockeySummary: TDBISAMTable;
      tblTrainerSummary: TDBISAMTable;
      tblTrainer1To45Summary: TDBISAMTable;
      tblDRF: TDBISAMTable;
      tblEquibaseRaceDate: TDateField;
      tblEquibaseTrkCode: TStringField;
      tblEquibaseResults: TMemoField;
      tblEquibaseCharts: TMemoField;
      tblEquibaseHtmlResults: TMemoField;
      tblEquibaseHtmlCharts: TMemoField;
      tblDRFRaceDate: TDateField;
      tblDRFTrkCode: TStringField;
      tblDRFResults: TMemoField;
      tblDRFCharts: TMemoField;
      tblDRFHtmlResults: TMemoField;
      tblDRFHtmlCharts: TMemoField;
      tblDRFIsChartsProcessed: TBooleanField;
      tblDRFIsResultsProcessed: TBooleanField;
      tblDRFIsChartsDownloaded: TBooleanField;
      tblDRFIsResultsDownloaded: TBooleanField;
      tblEquibaseIsChartsProcessed: TBooleanField;
      tblEquibaseIsResultsProcessed: TBooleanField;
      tblEquibaseIsChartsDownloaded: TBooleanField;
      tblEquibaseIsResultsDownloaded: TBooleanField;
      tblTrainerFirstJuiceSummary: TDBISAMTable;
      tblTrainerSecondJuiceSummary: TDBISAMTable;
      tblTrainerBlinkersOnSummary: TDBISAMTable;
      tblTrainerBlinkersOffSummary: TDBISAMTable;
      tblPrevWeekHH: TDBISAMTable;
      tblPrevWeekRH: TDBISAMTable;
      tblPrevDayHH: TDBISAMTable;
      tblPrevDayRH: TDBISAMTable;
      dbEngine: TDBISAMEngine;
      tblTrackLeaders: TDBISAMTable;
      dbWagers: TDBISAMDatabase;
      tblBank: TDBISAMTable;
      tblWagers: TDBISAMTable;
      memRaces: TDBISAMTable;
      memEntries: TDBISAMTable;
      tblTrainer120PlusSummary: TDBISAMTable;
      tblTrainer1To45WorkSummary: TDBISAMTable;
      tblTrainer46To120WorkSummary: TDBISAMTable;
      tblTrainer120PlusWorkSummary: TDBISAMTable;
      tblTrainerStats: TDBISAMTable;
      tblTSNDownload: TDBISAMTable;
      tblTrainerCategory: TDBISAMTable;
      tblATrainerList: TDBISAMTable;
      tblPTCTrack: TDBISAMTable;
      tblPTCWager: TDBISAMTable;
      tblRatingSireClass: TDBISAMTable;
      tblRatingSireTurf: TDBISAMTable;
      tblRatingDamSireMud: TDBISAMTable;
      tblRatingDamSireRoute: TDBISAMTable;
      tblRatingDamSireTurf: TDBISAMTable;
      tblRatingDamSireClass: TDBISAMTable;
      tblRatingJockey: TDBISAMTable;
      tblRatingTrainer: TDBISAMTable;
      tblRatingDamSireAW: TDBISAMTable;
      tblRatingSireMud: TDBISAMTable;
      tblRatingSireAW: TDBISAMTable;
      tblRatingTrainerJockey: TDBISAMTable;
      tblRatingTrainerOwner: TDBISAMTable;
      tblRatingTrainerTrack: TDBISAMTable;
      tblRatingSireRoute: TDBISAMTable;
      tblRatingDamSireSprint: TDBISAMTable;
      tblRatingSireSprint: TDBISAMTable;
      tblRatingJockeyOwner: TDBISAMTable;
      tblRatingJockeyTrack: TDBISAMTable;
      tblRatingOwner: TDBISAMTable;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure tblHHIndexProgress(Sender: TObject; PercentDone: Word);
      procedure tblTrackLeadersAfterScroll(DataSet: TDataSet);
      procedure tblFinalOrderAfterScroll(DataSet: TDataSet);
      procedure tblDamAfterScroll(DataSet: TDataSet);
      procedure tblSireAfterScroll(DataSet: TDataSet);
      procedure tblTrainerAfterScroll(DataSet: TDataSet);
      procedure tblJockeyAfterScroll(DataSet: TDataSet);
      procedure tblRacesAfterScroll(DataSet: TDataSet);
      procedure tblRHAfterScroll(DataSet: TDataSet);
      procedure tblHHAfterScroll(DataSet: TDataSet);
      procedure tblOwnerAfterScroll(DataSet: TDataSet);
      procedure tblEquibaseAfterScroll(DataSet: TDataSet);
      procedure tblDRFAfterScroll(DataSet: TDataSet);
      procedure tblGimmicksAfterScroll(DataSet: TDataSet);
      procedure tblProcessedAfterScroll(DataSet: TDataSet);
      procedure tblPastAfterScroll(DataSet: TDataSet);
      procedure tblRatingsAfterScroll(DataSet: TDataSet);
      procedure tblEntriesAfterScroll(DataSet: TDataSet);
      procedure tblBreederAfterScroll(DataSet: TDataSet);
      procedure tblTotalsAfterScroll(DataSet: TDataSet);
      procedure tblVendorAfterScroll(DataSet: TDataSet);
      procedure tblTrainerSummaryAfterScroll(DataSet: TDataSet);
      procedure tblPrevDayRHAfterScroll(DataSet: TDataSet);
      procedure tblSummaryFldsAfterScroll(DataSet: TDataSet);
      procedure tblSummaryTotalsAfterScroll(DataSet: TDataSet);
      procedure tblTrainerSecondJuiceSummaryAfterScroll(DataSet: TDataSet);
      procedure tblJockeySummaryAfterScroll(DataSet: TDataSet);
      procedure tblTrainerBlinkersOnSummaryAfterScroll(DataSet: TDataSet);
      procedure tblTrainerBlinkersOffSummaryAfterScroll(DataSet: TDataSet);
      procedure tblDamSummaryAfterScroll(DataSet: TDataSet);
      procedure tblRankingStatsByTrkAfterScroll(DataSet: TDataSet);
      procedure tblTrainerOwnerSummaryAfterScroll(DataSet: TDataSet);
      procedure tblTrainerJockeySummaryAfterScroll(DataSet: TDataSet);
      procedure tblTrainer1521SummaryAfterScroll(DataSet: TDataSet);
      procedure tblBreederSummaryAfterScroll(DataSet: TDataSet);
      procedure tblTrainer814WorkSummaryAfterScroll(DataSet: TDataSet);
      procedure tblTrainer46To120SummaryAfterScroll(DataSet: TDataSet);
      procedure tblPPAfterScroll(DataSet: TDataSet);
      procedure tblRankingStatsAfterScroll(DataSet: TDataSet);
   private
      { Private declarations }
      procedure CloseTable(t: TDBISAMTable);
      procedure OpenTable(t: TDBISAMTable);
      function OpenConnection: Boolean;
      function CloseConnection: Boolean;
   public
      { Public declarations }
   end;

var
   dm: Tdm;

implementation

uses UnitCommonCode;

{$R *.DFM}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin

   dbEngine.Active := False;
   dbEngine.MaxTableDataBufferSize := dbEngine.MaxTableDataBufferSize * 25;
   dbEngine.MaxTableDataBufferCount := dbEngine.MaxTableDataBufferCount * 25;

   dbEngine.MaxTableIndexBufferSize := dbEngine.MaxTableIndexBufferSize * 25;
   dbEngine.MaxTableIndexBufferCount := dbEngine.MaxTableIndexBufferCount * 25;

   dbEngine.MaxTableBlobBufferSize := dbEngine.MaxTableBlobBufferSize * 25;
   dbEngine.MaxTableBlobBufferCount := dbEngine.MaxTableBlobBufferCount * 25;
   dbEngine.Active := True;

   OpenConnection();


end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin

   try
      CloseTable(tblBreeder);
      CloseTable(tblBreederSummary);
      CloseTable(tblDam);
      CloseTable(tblDamSireSummary);
      CloseTable(tblDamSummary);
      CloseTable(tblDRF);
      CloseTable(tblEntries);
      CloseTable(tblEquibase);
      CloseTable(tblGimmicks);
      CloseTable(tblHH);
      //      CloseTable(tblJockeyDaysSummary);
      CloseTable(tblJockeySummary);
      CloseTable(tblOwner);
      CloseTable(tblOwnerSummary);
      CloseTable(tblPast);
      CloseTable(tblPP);
      CloseTable(tblPrevWeekHH);
      CloseTable(tblPrevWeekRH);
      CloseTable(tblProcessed);
      CloseTable(tblRaces);
      CloseTable(tblRankingStats);
      CloseTable(tblRankingStatsByTrk);
      CloseTable(tblRatings);
      CloseTable(tblRH);
      CloseTable(tblSire);
      CloseTable(tblSireSummary);
      CloseTable(tblTotals);
      CloseTable(tblTrack);
      CloseTable(tblTrainer1To45Summary);
      CloseTable(tblTrainer1To45WorkSummary);
      CloseTable(tblTrainer46To120Summary);
      CloseTable(tblTrainer46To120WorkSummary);
      CloseTable(tblTrainer120PlusSummary);
      CloseTable(tblTrainer120PlusWorkSummary);

      CloseTable(tblTrainerBlinkersOffSummary);
      CloseTable(tblTrainerBlinkersOnSummary);
      CloseTable(tblTrainerDebutSummary);
      CloseTable(tblTrainerDebutTwoSummary);
      CloseTable(tblTrainerFirstJuiceSummary);
      CloseTable(tblTrainerJockeySummary);
      CloseTable(tblTrainerOwnerSummary);
      CloseTable(tblTrainerSecondJuiceSummary);
      CloseTable(tblTrainerSummary);
      CloseTable(tblTrainerStats);

      CloseTable(tblVendor);
   except
      CloseConnection();
      dbEngine.Active := False;
      raise;
   end;

   CloseConnection();
   dbEngine.Active := False;

end;

function TDM.OpenConnection: Boolean;
begin

   try
      dbSireRate.Connected := False;
      dbSireRate.Directory := DATA_PATH;
      dbSireRate.Connected := True;

   except
      Result := False;
      exit;
   end;

   Result := True

end;

function TDM.CloseConnection: Boolean;
begin

   try
      dbSireRate.Connected := False;
      dbSireRate.Directory := DATA_PATH;
      dbSireRate.Connected := True;

   except
      Result := False;
      exit;
   end;

   Result := True
end;

procedure Tdm.tblHHIndexProgress(Sender: TObject; PercentDone: Word);
begin

   Application.ProcessMessages();
end;

procedure Tdm.CloseTable(t: TDBISAMTable);
begin

   try

      if t.Active = True then begin
         t.FlushBuffers();
         t.Active := False;
         t.Exclusive := False;
      end;

   except
      raise;
   end;
end;

procedure Tdm.OpenTable(t: TDBISAMTable);
begin

   try

      if t.Active = False then begin
         t.Active := True;
      end;

   except
      raise;
   end;
end;

procedure Tdm.tblTrackLeadersAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblFinalOrderAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblDamAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblSireAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblTrainerAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblJockeyAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblRacesAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblRHAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblHHAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblOwnerAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblEquibaseAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblDRFAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblGimmicksAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblProcessedAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblPastAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblRatingsAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblEntriesAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblBreederAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblTotalsAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblVendorAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblTrainerSummaryAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblPrevDayRHAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblSummaryFldsAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblSummaryTotalsAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblTrainerSecondJuiceSummaryAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblJockeySummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblTrainerBlinkersOnSummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblTrainerBlinkersOffSummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblDamSummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblRankingStatsByTrkAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblTrainerOwnerSummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblTrainerJockeySummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblTrainer1521SummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblBreederSummaryAfterScroll(DataSet: TDataSet);
begin

   Application.ProcessMessages();
end;

procedure Tdm.tblTrainer814WorkSummaryAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblTrainer46To120SummaryAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblPPAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

procedure Tdm.tblRankingStatsAfterScroll(DataSet: TDataSet);
begin
   Application.ProcessMessages();

end;

end.
