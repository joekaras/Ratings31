unit FormOptions;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
   cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid, dbisamtb,
   DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
   cxEdit, cxDBData, mLog, cxGridCardView, cxGridDBCardView;

type
   TOptionsForm = class(TForm)
      tblTracks: TDBISAMTable;
      dsTrack: TDataSource;
      dbOptions: TDBISAMDatabase;
      lvTrack: TcxGridLevel;
      grdOptions: TcxGrid;
      tblVendors: TDBISAMTable;
      dsVendors: TDataSource;
      lvVendors: TcxGridLevel;
      tvTrack: TcxGridDBTableView;
      tvVendor: TcxGridDBTableView;
      hLog: TmLog;
      tvVendorVendor: TcxGridDBColumn;
      tvVendorProduct: TcxGridDBColumn;
      tvVendorDownloadFileType: TcxGridDBColumn;
      tvVendorCompressionMethod: TcxGridDBColumn;
      tvVendorSupportedImport: TcxGridDBColumn;
      tvVendorActive: TcxGridDBColumn;
      tvVendorBaseImportPath: TcxGridDBColumn;
      tvVendorOutputFileType: TcxGridDBColumn;
      tvVendorFormatString: TcxGridDBColumn;
      tvVendorOverrideDownloadLocation: TcxGridDBColumn;
      tvVendorRegistryKeyDownloadLocation: TcxGridDBColumn;
      tvVendorMultiTrack: TcxGridDBColumn;
      tvVendorUseIE: TcxGridDBColumn;
      cvTrack: TcxGridDBCardView;
      lvCardTrack: TcxGridLevel;
      cvTrackTsnTrkCode: TcxGridDBCardViewRow;
      cvTrackTrkCode: TcxGridDBCardViewRow;
      cvTrackType: TcxGridDBCardViewRow;
      cvTrackCountry: TcxGridDBCardViewRow;
      cvTrackIsPrintQuarterHorseRaces: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheet: TcxGridDBCardViewRow;
      cvTrackIsYouBetTrack: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetMonTue: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetSun: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetMon: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetTue: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetWed: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetThu: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetFri: TcxGridDBCardViewRow;
      cvTrackIsPrintedOnValueSheetSat: TcxGridDBCardViewRow;
      cvTrackIsCreateAngle: TcxGridDBCardViewRow;
      cvTrackIsCreateDetail: TcxGridDBCardViewRow;
      cvTrackIsCreateAlt: TcxGridDBCardViewRow;
      cvTrackIsCreateValue: TcxGridDBCardViewRow;
      cvTrackIsCreatePk3: TcxGridDBCardViewRow;
      cvTrackIsCreateTip: TcxGridDBCardViewRow;
      cvTrackFullName: TcxGridDBCardViewRow;
      cvTrackState: TcxGridDBCardViewRow;
      cvTrackIsActive: TcxGridDBCardViewRow;
      cvTrackTimeDiff: TcxGridDBCardViewRow;
      cvTrackStart1Date: TcxGridDBCardViewRow;
      cvTrackEnd1Date: TcxGridDBCardViewRow;
      cvTrackStart2Date: TcxGridDBCardViewRow;
      cvTrackEnd2Date: TcxGridDBCardViewRow;
      cvTrackStart3Date: TcxGridDBCardViewRow;
      cvTrackEnd3Date: TcxGridDBCardViewRow;
      cvTrackIsRacePicksAvailable: TcxGridDBCardViewRow;
      cvTrackRacePicksURL: TcxGridDBCardViewRow;
      cvTrackRacePicksFormatString: TcxGridDBCardViewRow;
      tvTrackTsnTrkCode: TcxGridDBColumn;
      tvTrackTrkCode: TcxGridDBColumn;
      tvTrackType: TcxGridDBColumn;
      tvTrackCountry: TcxGridDBColumn;
      tvTrackIsPrintQuarterHorseRaces: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheet: TcxGridDBColumn;
      tvTrackIsYouBetTrack: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetMonTue: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetSun: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetMon: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetTue: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetWed: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetThu: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetFri: TcxGridDBColumn;
      tvTrackIsPrintedOnValueSheetSat: TcxGridDBColumn;
      tvTrackIsCreateAngle: TcxGridDBColumn;
      tvTrackIsCreateDetail: TcxGridDBColumn;
      tvTrackIsCreateAlt: TcxGridDBColumn;
      tvTrackIsCreateValue: TcxGridDBColumn;
      tvTrackIsCreatePk3: TcxGridDBColumn;
      tvTrackIsCreateTip: TcxGridDBColumn;
      tvTrackFullName: TcxGridDBColumn;
      tvTrackState: TcxGridDBColumn;
      tvTrackIsActive: TcxGridDBColumn;
      tvTrackTimeDiff: TcxGridDBColumn;
      tvTrackStart1Date: TcxGridDBColumn;
      tvTrackEnd1Date: TcxGridDBColumn;
      tvTrackStart2Date: TcxGridDBColumn;
      tvTrackEnd2Date: TcxGridDBColumn;
      tvTrackStart3Date: TcxGridDBColumn;
      tvTrackEnd3Date: TcxGridDBColumn;
      tvTrackIsRacePicksAvailable: TcxGridDBColumn;
      tvTrackRacePicksURL: TcxGridDBColumn;
      tvTrackRacePicksFormatString: TcxGridDBColumn;
      lvProcessed: TcxGridLevel;
      tvProcessed: TcxGridDBTableView;
      tblProcessed: TDBISAMTable;
      dsProcessed: TDataSource;
      tvProcessedRaceDate: TcxGridDBColumn;
      tvProcessedTrkCode: TcxGridDBColumn;
      tvProcessedIsRankingsUpdated: TcxGridDBColumn;
      tvProcessedIsRankingsByTrkCodeUpdated: TcxGridDBColumn;
      tvProcessedIsFinalOrderUpdated: TcxGridDBColumn;
      tvProcessedIsTsnProCapsDownloaded: TcxGridDBColumn;
      tvProcessedIsTsnXRDDownloaded: TcxGridDBColumn;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   OptionsForm: TOptionsForm;

implementation

uses UnitCommonCode, FormMain;

{$R *.dfm}

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
   tblTracks.Active := True;
   tblVendors.Active := True;
   tblProcessed.Active := True;
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
   tblTracks.Active := False;
   tblVendors.Active := False;
   tblProcessed.Active := False;
end;

end.
