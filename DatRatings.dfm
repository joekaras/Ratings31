object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 95
  Top = 82
  Height = 780
  Width = 1036
  object dbSireRate: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbSireRate'
    Directory = 'd:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 32
    Top = 8
  end
  object tblTrack: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Track'
    Left = 312
    Top = 16
  end
  object tblProcessed: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblProcessedAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Processed'
    Left = 192
    Top = 177
  end
  object tblVendor: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblVendorAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Vendor'
    Left = 120
    Top = 264
  end
  object tblTotals: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTotalsAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Totals'
    Left = 112
    Top = 160
  end
  object tblEquibase: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblEquibaseAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Equibase'
    Left = 400
    Top = 9
    object tblEquibaseRaceDate: TDateField
      FieldName = 'RaceDate'
    end
    object tblEquibaseTrkCode: TStringField
      FieldName = 'TrkCode'
      Size = 3
    end
    object tblEquibaseResults: TMemoField
      FieldName = 'Results'
      BlobType = ftMemo
    end
    object tblEquibaseCharts: TMemoField
      FieldName = 'Charts'
      BlobType = ftMemo
    end
    object tblEquibaseHtmlResults: TMemoField
      FieldName = 'HtmlResults'
      BlobType = ftMemo
    end
    object tblEquibaseHtmlCharts: TMemoField
      FieldName = 'HtmlCharts'
      BlobType = ftMemo
    end
    object tblEquibaseIsChartsProcessed: TBooleanField
      FieldName = 'IsChartsProcessed'
    end
    object tblEquibaseIsResultsProcessed: TBooleanField
      FieldName = 'IsResultsProcessed'
    end
    object tblEquibaseIsChartsDownloaded: TBooleanField
      FieldName = 'IsChartsDownloaded'
    end
    object tblEquibaseIsResultsDownloaded: TBooleanField
      FieldName = 'IsResultsDownloaded'
    end
  end
  object tblOwner: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblOwnerAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Owner'
    Left = 32
    Top = 64
  end
  object tblBreeder: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblBreederAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Breeder'
    Left = 32
    Top = 128
  end
  object tblHH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblHHAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HorseHistory'
    OnIndexProgress = tblHHIndexProgress
    Left = 112
    Top = 64
  end
  object tblSummaryFlds: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblSummaryFldsAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'SummaryFlds'
    Left = 464
    Top = 16
  end
  object tblSummaryTotals: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblSummaryTotalsAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'SummaryTotals'
    Left = 544
    Top = 80
  end
  object tblRH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblRHAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RaceHistory'
    Left = 112
    Top = 8
  end
  object tblFinalOrder: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblFinalOrderAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'FinalOrder'
    Left = 32
    Top = 208
  end
  object tblDam: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblDamAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Dam'
    Left = 32
    Top = 288
  end
  object tblSire: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblSireAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'SIRE'
    Left = 32
    Top = 360
  end
  object tblEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblEntriesAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Entry'
    Left = 160
    Top = 48
  end
  object tblPP: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblPPAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'PP'
    Left = 232
    Top = 280
  end
  object tblGimmicks: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblGimmicksAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Gimmicks'
    Left = 336
    Top = 208
  end
  object tblRatings: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblRatingsAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'ratings'
    Left = 192
    Top = 232
  end
  object tblPast: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblPastAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Past'
    Left = 208
    Top = 136
  end
  object tblRaces: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblRacesAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race'
    Left = 208
    Top = 72
  end
  object tblRankingStatsByTrk: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblRankingStatsByTrkAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RankingStatsByTrk'
    Left = 672
    Top = 224
  end
  object tblRankingStats: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblRankingStatsAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RankingStats'
    Left = 640
    Top = 176
  end
  object tblTrainer: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrainerAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer'
    Left = 32
    Top = 440
  end
  object tblJockey: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblJockeyAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Jockey'
    Left = 40
    Top = 496
  end
  object tblTrainerDebutSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerDebutSummary'
    Left = 376
    Top = 301
  end
  object tblTrainer120PlusSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer120PlusSummary'
    Left = 176
    Top = 480
  end
  object tblOwnerSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'OwnerSummary'
    Left = 508
    Top = 160
  end
  object tblDamSireSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'DamSireSummary'
    Left = 355
    Top = 365
  end
  object tblTrainerOwnerSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrainerOwnerSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerOwnerSummary'
    Left = 680
    Top = 280
  end
  object tblSireSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'SireSummary'
    Left = 363
    Top = 416
  end
  object tblTrainerJockeySummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrainerJockeySummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerJockeySummary'
    Left = 444
    Top = 472
  end
  object tblTrainer46To120Summary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer46To120Summary'
    Left = 152
    Top = 417
  end
  object tblDamSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblDamSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'DamSummary'
    Left = 456
    Top = 368
  end
  object tblBreederSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblBreederSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'BreederSummary'
    Left = 552
    Top = 448
  end
  object tblTrainerDebutTwoSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerDebutTwoSummary'
    Left = 597
    Top = 333
  end
  object tblJockeySummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblJockeySummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'JockeySummary'
    Left = 560
    Top = 200
  end
  object tblTrainerSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrainerSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerSummary'
    Left = 152
    Top = 320
  end
  object tblTrainer1To45Summary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer1To45Summary'
    Left = 152
    Top = 368
  end
  object tblDRF: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblDRFAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'DRF'
    Left = 872
    Top = 33
    object tblDRFRaceDate: TDateField
      FieldName = 'RaceDate'
    end
    object tblDRFTrkCode: TStringField
      FieldName = 'TrkCode'
      Size = 3
    end
    object tblDRFResults: TMemoField
      FieldName = 'Results'
      BlobType = ftMemo
    end
    object tblDRFCharts: TMemoField
      FieldName = 'Charts'
      BlobType = ftMemo
    end
    object tblDRFHtmlResults: TMemoField
      FieldName = 'HtmlResults'
      BlobType = ftMemo
    end
    object tblDRFHtmlCharts: TMemoField
      FieldName = 'HtmlCharts'
      BlobType = ftMemo
    end
    object tblDRFIsChartsProcessed: TBooleanField
      FieldName = 'IsChartsProcessed'
    end
    object tblDRFIsResultsProcessed: TBooleanField
      FieldName = 'IsResultsProcessed'
    end
    object tblDRFIsChartsDownloaded: TBooleanField
      FieldName = 'IsChartsDownloaded'
    end
    object tblDRFIsResultsDownloaded: TBooleanField
      FieldName = 'IsResultsDownloaded'
    end
  end
  object tblTrainerFirstJuiceSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerFirstJuiceSummary'
    Left = 712
    Top = 88
  end
  object tblTrainerSecondJuiceSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrainerSecondJuiceSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerSecondJuiceSummary'
    Left = 176
    Top = 680
  end
  object tblTrainerBlinkersOnSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrainerBlinkersOnSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerBlinkersOnSummary'
    Left = 384
    Top = 256
  end
  object tblTrainerBlinkersOffSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrainerBlinkersOffSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerBlinkersOffSummary'
    Left = 496
    Top = 280
  end
  object tblPrevWeekHH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'PrevWeekHH'
    Left = 710
    Top = 24
  end
  object tblPrevWeekRH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    EngineVersion = '4.24 Build 1'
    TableName = 'PrevWeekRH'
    Left = 383
    Top = 88
  end
  object tblPrevDayHH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'PrevDayHH'
    Left = 614
    Top = 48
  end
  object tblPrevDayRH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblPrevDayRHAfterScroll
    DatabaseName = 'dbSireRate'
    EngineVersion = '4.24 Build 1'
    TableName = 'PrevDayRH'
    Left = 536
    Top = 8
  end
  object dbEngine: TDBISAMEngine
    Active = True
    EngineVersion = '4.24 Build 1'
    EngineType = etClient
    EngineSignature = 'DBISAM_SIG'
    Functions = <>
    LargeFileSupport = True
    FilterRecordCounts = True
    LockFileName = 'dbisam.lck'
    MaxTableDataBufferSize = 32768
    MaxTableDataBufferCount = 8192
    MaxTableIndexBufferSize = 65536
    MaxTableIndexBufferCount = 8192
    MaxTableBlobBufferSize = 32768
    MaxTableBlobBufferCount = 8192
    TableDataExtension = '.dat'
    TableIndexExtension = '.idx'
    TableBlobExtension = '.blb'
    TableDataBackupExtension = '.dbk'
    TableIndexBackupExtension = '.ibk'
    TableBlobBackupExtension = '.bbk'
    TableDataUpgradeExtension = '.dup'
    TableIndexUpgradeExtension = '.iup'
    TableBlobUpgradeExtension = '.bup'
    TableDataTempExtension = '.dat'
    TableIndexTempExtension = '.idx'
    TableBlobTempExtension = '.blb'
    CreateTempTablesInDatabase = False
    TableFilterIndexThreshhold = 1
    TableReadLockWaitTime = 3
    TableReadLockRetryCount = 32768
    TableWriteLockWaitTime = 3
    TableWriteLockRetryCount = 32768
    TableTransLockWaitTime = 3
    TableTransLockRetryCount = 32768
    TableMaxReadLockCount = 100
    ServerName = 'DBSRVR'
    ServerDescription = 'DBISAM Database Server'
    ServerMainPort = 12005
    ServerMainThreadCacheSize = 10
    ServerAdminPort = 12006
    ServerAdminThreadCacheSize = 1
    ServerEncryptedOnly = False
    ServerEncryptionPassword = 'elevatesoft'
    ServerConfigFileName = 'dbsrvr.scf'
    ServerConfigPassword = 'elevatesoft'
    ServerLicensedConnections = 65535
    Left = 960
    Top = 56
  end
  object tblTrackLeaders: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblTrackLeadersAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrackLeaders'
    Left = 312
    Top = 152
  end
  object dbWagers: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 160
    Top = 120
  end
  object tblBank: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Bank'
    Left = 296
    Top = 104
  end
  object tblWagers: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Wagers'
    Left = 360
    Top = 56
  end
  object memRaces: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblEntriesAfterScroll
    DatabaseName = 'Memory'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'memoryRaces'
    Left = 256
    Top = 216
  end
  object memEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblEntriesAfterScroll
    DatabaseName = 'Memory'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'memoryEntries'
    Left = 280
    Top = 320
  end
  object tblTrainer1To45WorkSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer1To45WorkSummary'
    Left = 288
    Top = 448
  end
  object tblTrainer46To120WorkSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer46To120WorkSummary'
    Left = 88
    Top = 537
  end
  object tblTrainer120PlusWorkSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer120PlusWorkSummary'
    Left = 304
    Top = 552
  end
  object tblTrainerStats: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerStats'
    Left = 712
    Top = 136
  end
  object tblTSNDownload: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblBreederSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TSNDownload'
    Left = 632
    Top = 584
  end
  object tblTrainerCategory: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblBreederSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerCategory'
    Left = 424
    Top = 600
  end
  object tblATrainerList: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblBreederSummaryAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'ATrainerList'
    Left = 176
    Top = 600
  end
  object tblPTCTrack: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblRHAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'PTCTrack'
    Left = 80
    Top = 120
  end
  object tblPTCWager: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblRHAfterScroll
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'PTCWager'
    Left = 176
  end
  object tblRatingSireClass: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingSireClass'
    Left = 976
    Top = 352
  end
  object tblRatingSireTurf: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingSireTurf'
    Left = 1232
    Top = 736
  end
  object tblRatingDamSireMud: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingDamSireMud'
    Left = 992
    Top = 176
  end
  object tblRatingDamSireRoute: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingDamSireRoute'
    Left = 800
    Top = 656
  end
  object tblRatingDamSireTurf: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingDamSireTurf'
    Left = 1208
    Top = 424
  end
  object tblRatingDamSireClass: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingDamSireClass'
    Left = 968
    Top = 416
  end
  object tblRatingJockey: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingJockey'
    Left = 1248
    Top = 104
  end
  object tblRatingTrainer: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingTrainer'
    Left = 1240
    Top = 264
  end
  object tblRatingDamSireAW: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingDamSireAW'
    Left = 776
    Top = 456
  end
  object tblRatingSireMud: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingSireMud'
    Left = 984
    Top = 240
  end
  object tblRatingSireAW: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingSireAW'
    Left = 784
    Top = 528
  end
  object tblRatingTrainerJockey: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingTrainerJockey'
    Left = 1232
    Top = 328
  end
  object tblRatingTrainerOwner: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingTrainerOwner'
    Left = 1240
    Top = 376
  end
  object tblRatingTrainerTrack: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingTrainerTrack'
    Left = 1296
    Top = 480
  end
  object tblRatingSireRoute: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingSireRoute'
    Left = 992
    Top = 640
  end
  object tblRatingDamSireSprint: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingDamSireSprint'
    Left = 792
    Top = 720
  end
  object tblRatingSireSprint: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingSireSprint'
    Left = 976
    Top = 720
  end
  object tblRatingJockeyOwner: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingJockeyOwner'
    Left = 1240
    Top = 176
  end
  object tblRatingJockeyTrack: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingJockeyTrack'
    Left = 1224
    Top = 584
  end
  object tblRatingOwner: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RatingOwner'
    Left = 664
    Top = 432
  end
end
