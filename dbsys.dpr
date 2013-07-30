program dbsys;

uses
  dbisammm,
  Windows,
  Forms,
  main in 'main.pas' {MainForm},
  struct in 'struct.pas' {StructureDlg},
  about in 'about.pas' {AboutBox},
  selindex in 'selindex.pas' {SelectIndexDlg},
  search in 'search.pas' {SearchDlg},
  graphic in 'graphic.pas' {GraphicDlg},
  memo in 'memo.pas' {MemoDlg},
  browse in 'browse.pas' {BrowseForm},
  option in 'option.pas' {OptionsDlg},
  keyflds in 'keyflds.pas' {KeyFieldsDlg},
  range in 'range.pas' {RangeDlg},
  flddtls in 'flddtls.pas' {FieldDetailsDlg},
  visible in 'visible.pas' {VisibleFieldsDlg},
  prtbtnopt in 'prtbtnopt.pas' {PrintOptionsDlg},
  genopt in 'genopt.pas' {ReverseEngineerOptionsDlg},
  filter in 'filter.pas' {FilterDlg},
  gotorec in 'gotorec.pas' {GotoRecordDlg},
  find in 'find.pas' {FindDlg},
  query in 'query.pas' {QueryForm},
  replog in 'replog.pas' {RepairLogDlg},
  verdsp in 'verdsp.pas' {VersionDlg},
  blob in 'blob.pas' {BlobDlg},
  fldprt in 'fldprt.pas' {DetailedFieldsReportForm},
  fldsprt in 'fldsprt.pas' {SummaryFieldsReportForm},
  idxprt in 'idxprt.pas' {IndexesReportForm},
  lstprt in 'lstprt.pas' {ListingReportForm},
  selopt in 'selopt.pas' {SelectOptimizeIndexDlg},
  upglog in 'upglog.pas' {UpgradeLogDlg},
  opendb in 'opendb.pas' {OpenDatabaseDlg},
  opentbl in 'opentbl.pas' {OpenTableDlg},
  savetbl in 'savetbl.pas' {SaveTableDlg},
  tracedsp in 'tracedsp.pas' {TraceLogDlg},
  imexflds in 'imexflds.pas' {ImportExportFldsDlg},
  imexopt in 'imexopt.pas' {ImportExportOptionsDlg},
  ascii in 'ascii.pas' {SelectASCIIValueDlg},
  textprt in 'textprt.pas' {FullTextIndexReportForm},
  backup in 'backup.pas' {BackupDatabaseDlg},
  restore in 'restore.pas' {RestoreDatabaseDlg},
  backlog in 'backlog.pas' {BackupLogDlg};

{$R *.RES}

begin
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TStructureDlg, StructureDlg);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TSelectIndexDlg, SelectIndexDlg);
  Application.CreateForm(TSearchDlg, SearchDlg);
  Application.CreateForm(TGraphicDlg, GraphicDlg);
  Application.CreateForm(TMemoDlg, MemoDlg);
  Application.CreateForm(TOptionsDlg, OptionsDlg);
  Application.CreateForm(TKeyFieldsDlg, KeyFieldsDlg);
  Application.CreateForm(TRangeDlg, RangeDlg);
  Application.CreateForm(TFieldDetailsDlg, FieldDetailsDlg);
  Application.CreateForm(TVisibleFieldsDlg, VisibleFieldsDlg);
  Application.CreateForm(TPrintOptionsDlg, PrintOptionsDlg);
  Application.CreateForm(TReverseEngineerOptionsDlg, ReverseEngineerOptionsDlg);
  Application.CreateForm(TFilterDlg, FilterDlg);
  Application.CreateForm(TGotoRecordDlg, GotoRecordDlg);
  Application.CreateForm(TFindDlg, FindDlg);
  Application.CreateForm(TRepairLogDlg, RepairLogDlg);
  Application.CreateForm(TVersionDlg, VersionDlg);
  Application.CreateForm(TBlobDlg, BlobDlg);
  Application.CreateForm(TSelectOptimizeIndexDlg, SelectOptimizeIndexDlg);
  Application.CreateForm(TUpgradeLogDlg, UpgradeLogDlg);
  Application.CreateForm(TOpenDatabaseDlg, OpenDatabaseDlg);
  Application.CreateForm(TOpenTableDlg, OpenTableDlg);
  Application.CreateForm(TSaveTableDlg, SaveTableDlg);
  Application.CreateForm(TTraceLogDlg, TraceLogDlg);
  Application.CreateForm(TImportExportOptionsDlg, ImportExportOptionsDlg);
  Application.CreateForm(TImportExportFldsDlg, ImportExportFldsDlg);
  Application.CreateForm(TSelectASCIIValueDlg, SelectASCIIValueDlg);
  Application.CreateForm(TBackupDatabaseDlg, BackupDatabaseDlg);
  Application.CreateForm(TRestoreDatabaseDlg, RestoreDatabaseDlg);
  Application.CreateForm(TBackupLogDlg, BackupLogDlg);
  Application.Run;
end.
