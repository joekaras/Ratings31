object OptionsForm: TOptionsForm
  Left = 155
  Top = 97
  Width = 812
  Height = 612
  Caption = 'Options'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grdOptions: TcxGrid
    Left = 0
    Top = 0
    Width = 804
    Height = 585
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    RootLevelOptions.DetailTabsPosition = dtpLeft
    object tvTrack: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTrack
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.GroupBySorting = True
      OptionsView.Navigator = True
      OptionsView.Indicator = True
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetUserFormat4
      object tvTrackTsnTrkCode: TcxGridDBColumn
        Caption = 'TSN '
        DataBinding.FieldName = 'TsnTrkCode'
        Visible = False
        Width = 92
      end
      object tvTrackTrkCode: TcxGridDBColumn
        Caption = 'Track'
        DataBinding.FieldName = 'TrkCode'
        Width = 70
      end
      object tvTrackType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
        Width = 50
      end
      object tvTrackIsYouBetTrack: TcxGridDBColumn
        Caption = 'YouBet Track'
        DataBinding.FieldName = 'IsYouBetTrack'
        Width = 103
      end
      object tvTrackIsPrintedOnValueSheetSun: TcxGridDBColumn
        Caption = 'Print On Sunday'
        DataBinding.FieldName = 'IsPrintedOnValueSheetSun'
        Width = 121
      end
      object tvTrackIsPrintedOnValueSheetMon: TcxGridDBColumn
        Caption = 'Print On Monday'
        DataBinding.FieldName = 'IsPrintedOnValueSheetMon'
        Width = 125
      end
      object tvTrackIsPrintedOnValueSheetTue: TcxGridDBColumn
        Caption = 'Print On Tuesday'
        DataBinding.FieldName = 'IsPrintedOnValueSheetTue'
        Width = 125
      end
      object tvTrackIsPrintedOnValueSheetWed: TcxGridDBColumn
        Caption = 'Print On Wednesday'
        DataBinding.FieldName = 'IsPrintedOnValueSheetWed'
        Width = 140
      end
      object tvTrackIsPrintedOnValueSheetThu: TcxGridDBColumn
        Caption = 'Print On Thursday'
        DataBinding.FieldName = 'IsPrintedOnValueSheetThu'
        Width = 131
      end
      object tvTrackIsPrintedOnValueSheetFri: TcxGridDBColumn
        Caption = 'Print On Friday'
        DataBinding.FieldName = 'IsPrintedOnValueSheetFri'
        Width = 118
      end
      object tvTrackIsPrintedOnValueSheetSat: TcxGridDBColumn
        Caption = 'Print On Saturday'
        DataBinding.FieldName = 'IsPrintedOnValueSheetSat'
        Width = 128
      end
      object tvTrackIsActive: TcxGridDBColumn
        Caption = 'Active'
        DataBinding.FieldName = 'IsActive'
        Width = 91
      end
      object tvTrackTimeDiff: TcxGridDBColumn
        Caption = 'Time Diff'
        DataBinding.FieldName = 'TimeDiff'
        Width = 75
      end
      object tvTrackCountry: TcxGridDBColumn
        DataBinding.FieldName = 'Country'
        Visible = False
        Width = 66
      end
      object tvTrackIsPrintedOnValueSheet: TcxGridDBColumn
        DataBinding.FieldName = 'IsPrintedOnValueSheet'
        Visible = False
        Width = 149
      end
      object tvTrackIsPrintedOnAngleSheet: TcxGridDBColumn
        DataBinding.FieldName = 'IsPrintedOnAngleSheet'
        Visible = False
        Hidden = True
        Width = 153
      end
      object tvTrackIsPrintQuarterHorseRaces: TcxGridDBColumn
        DataBinding.FieldName = 'IsPrintQuarterHorseRaces'
        Visible = False
        Hidden = True
        Width = 169
      end
      object tvTrackIsPrintedOnValueSheetMonTue: TcxGridDBColumn
        DataBinding.FieldName = 'IsPrintedOnValueSheetMonTue'
        Visible = False
        Hidden = True
        Width = 199
      end
      object tvTrackIsPrintedOnAngleSheetMonTue: TcxGridDBColumn
        DataBinding.FieldName = 'IsPrintedOnAngleSheetMonTue'
        Visible = False
        Hidden = True
        Width = 199
      end
      object tvTrackIsCreateAngle: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateAngle'
        Visible = False
        Hidden = True
        Width = 102
      end
      object tvTrackIsCreateDetail: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateDetail'
        Visible = False
        Hidden = True
        Width = 102
      end
      object tvTrackIsCreateAlt: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateAlt'
        Visible = False
        Hidden = True
        Width = 85
      end
      object tvTrackIsCreateValue: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateValue'
        Visible = False
        Hidden = True
        Width = 102
      end
      object tvTrackIsCreatePk3: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreatePk3'
        Visible = False
        Hidden = True
        Width = 90
      end
      object tvTrackIsCreateTip: TcxGridDBColumn
        Caption = 'Create TipSheet'
        DataBinding.FieldName = 'IsCreateTip'
        Visible = False
        Hidden = True
        Width = 88
      end
      object tvTrackFullName: TcxGridDBColumn
        DataBinding.FieldName = 'FullName'
        SortIndex = 0
        SortOrder = soAscending
        Width = 175
      end
      object tvTrackState: TcxGridDBColumn
        DataBinding.FieldName = 'State'
        Visible = False
        Width = 88
      end
      object tvTrackStart1Date: TcxGridDBColumn
        DataBinding.FieldName = 'Start1Date'
        Visible = False
        Width = 83
      end
      object tvTrackEnd1Date: TcxGridDBColumn
        DataBinding.FieldName = 'End1Date'
        Visible = False
        Width = 76
      end
      object tvTrackStart2Date: TcxGridDBColumn
        DataBinding.FieldName = 'Start2Date'
        Visible = False
        Width = 83
      end
      object tvTrackEnd2Date: TcxGridDBColumn
        DataBinding.FieldName = 'End2Date'
        Visible = False
        Width = 76
      end
      object tvTrackStart3Date: TcxGridDBColumn
        DataBinding.FieldName = 'Start3Date'
        Visible = False
        Width = 83
      end
      object tvTrackEnd3Date: TcxGridDBColumn
        DataBinding.FieldName = 'End3Date'
        Visible = False
        Width = 76
      end
      object tvTrackIsRacePicksAvailable: TcxGridDBColumn
        DataBinding.FieldName = 'IsRacePicksAvailable'
        Visible = False
        Hidden = True
        Width = 139
      end
      object tvTrackRacePicksURL: TcxGridDBColumn
        DataBinding.FieldName = 'RacePicksURL'
        Visible = False
        Hidden = True
        Width = 892
      end
      object tvTrackRacePicksFormatString: TcxGridDBColumn
        DataBinding.FieldName = 'RacePicksFormatString'
        Visible = False
        Hidden = True
        Width = 153
      end
    end
    object tvVendor: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsVendors
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetUserFormat4
      object tvVendorVendor: TcxGridDBColumn
        DataBinding.FieldName = 'Vendor'
        Width = 64
      end
      object tvVendorProduct: TcxGridDBColumn
        DataBinding.FieldName = 'Product'
        Width = 216
      end
      object tvVendorDownloadFileType: TcxGridDBColumn
        DataBinding.FieldName = 'DownloadFileType'
        Width = 126
      end
      object tvVendorCompressionMethod: TcxGridDBColumn
        DataBinding.FieldName = 'CompressionMethod'
        Width = 138
      end
      object tvVendorSupportedImport: TcxGridDBColumn
        DataBinding.FieldName = 'SupportedImport'
        Width = 119
      end
      object tvVendorActive: TcxGridDBColumn
        DataBinding.FieldName = 'Active'
        Width = 56
      end
      object tvVendorBaseImportPath: TcxGridDBColumn
        DataBinding.FieldName = 'BaseImportPath'
        Width = 421
      end
      object tvVendorOutputFileType: TcxGridDBColumn
        DataBinding.FieldName = 'OutputFileType'
        Width = 108
      end
      object tvVendorFormatString: TcxGridDBColumn
        DataBinding.FieldName = 'FormatString'
        Width = 157
      end
      object tvVendorOverrideDownloadLocation: TcxGridDBColumn
        DataBinding.FieldName = 'OverrideDownloadLocation'
        Width = 174
      end
      object tvVendorRegistryKeyDownloadLocation: TcxGridDBColumn
        DataBinding.FieldName = 'RegistryKeyDownloadLocation'
        Width = 191
      end
      object tvVendorMultiTrack: TcxGridDBColumn
        DataBinding.FieldName = 'MultiTrack'
        Width = 81
      end
      object tvVendorUseIE: TcxGridDBColumn
        DataBinding.FieldName = 'UseIE'
        Width = 54
      end
    end
    object cvTrack: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTrack
      DataController.Options = [dcoAssignGroupingValues, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cvTrackTrkCode
      OptionsBehavior.NavigatorHints = True
      OptionsCustomize.CardExpanding = True
      OptionsCustomize.CardSizing = False
      OptionsCustomize.RowHiding = True
      OptionsCustomize.RowMoving = True
      OptionsView.FocusRect = False
      OptionsView.Navigator = True
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.CardWidth = 300
      object cvTrackTsnTrkCode: TcxGridDBCardViewRow
        DataBinding.FieldName = 'TsnTrkCode'
      end
      object cvTrackTrkCode: TcxGridDBCardViewRow
        DataBinding.FieldName = 'TrkCode'
      end
      object cvTrackType: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Type'
      end
      object cvTrackCountry: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Country'
      end
      object cvTrackIsPrintQuarterHorseRaces: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintQuarterHorseRaces'
      end
      object cvTrackIsPrintedOnValueSheet: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheet'
      end
      object cvTrackIsPrintedOnAngleSheet: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnAngleSheet'
      end
      object cvTrackIsYouBetTrack: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsYouBetTrack'
      end
      object cvTrackIsPrintedOnValueSheetMonTue: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetMonTue'
      end
      object cvTrackIsPrintedOnAngleSheetMonTue: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnAngleSheetMonTue'
      end
      object cvTrackIsPrintedOnValueSheetSun: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetSun'
      end
      object cvTrackIsPrintedOnValueSheetMon: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetMon'
      end
      object cvTrackIsPrintedOnValueSheetTue: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetTue'
      end
      object cvTrackIsPrintedOnValueSheetWed: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetWed'
      end
      object cvTrackIsPrintedOnValueSheetThu: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetThu'
      end
      object cvTrackIsPrintedOnValueSheetFri: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetFri'
      end
      object cvTrackIsPrintedOnValueSheetSat: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsPrintedOnValueSheetSat'
      end
      object cvTrackIsCreateAngle: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsCreateAngle'
      end
      object cvTrackIsCreateDetail: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsCreateDetail'
      end
      object cvTrackIsCreateAlt: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsCreateAlt'
      end
      object cvTrackIsCreateValue: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsCreateValue'
      end
      object cvTrackIsCreatePk3: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsCreatePk3'
      end
      object cvTrackIsCreateTip: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsCreateTip'
      end
      object cvTrackFullName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FullName'
      end
      object cvTrackState: TcxGridDBCardViewRow
        DataBinding.FieldName = 'State'
      end
      object cvTrackIsActive: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsActive'
      end
      object cvTrackTimeDiff: TcxGridDBCardViewRow
        DataBinding.FieldName = 'TimeDiff'
      end
      object cvTrackStart1Date: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Start1Date'
      end
      object cvTrackEnd1Date: TcxGridDBCardViewRow
        DataBinding.FieldName = 'End1Date'
      end
      object cvTrackStart2Date: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Start2Date'
      end
      object cvTrackEnd2Date: TcxGridDBCardViewRow
        DataBinding.FieldName = 'End2Date'
      end
      object cvTrackStart3Date: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Start3Date'
      end
      object cvTrackEnd3Date: TcxGridDBCardViewRow
        DataBinding.FieldName = 'End3Date'
      end
      object cvTrackIsRacePicksAvailable: TcxGridDBCardViewRow
        DataBinding.FieldName = 'IsRacePicksAvailable'
      end
      object cvTrackRacePicksURL: TcxGridDBCardViewRow
        DataBinding.FieldName = 'RacePicksURL'
      end
      object cvTrackRacePicksFormatString: TcxGridDBCardViewRow
        DataBinding.FieldName = 'RacePicksFormatString'
      end
    end
    object tvProcessed: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.Visible = fvAlways
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = dsProcessed
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = tvProcessedIsFinalOrderUpdated
      OptionsBehavior.NavigatorHints = True
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupBySorting = True
      OptionsCustomize.GroupRowSizing = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.Navigator = True
      OptionsView.ScrollBars = ssVertical
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.Indicator = True
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetUserFormat4
      object tvProcessedRaceDate: TcxGridDBColumn
        DataBinding.FieldName = 'RaceDate'
        Width = 82
      end
      object tvProcessedTrkCode: TcxGridDBColumn
        DataBinding.FieldName = 'TrkCode'
        Width = 78
      end
      object tvProcessedIsTsnProCapsDownloaded: TcxGridDBColumn
        DataBinding.FieldName = 'IsTsnProCapsDownloaded'
        Width = 121
      end
      object tvProcessedIsTsnXRDDownloaded: TcxGridDBColumn
        DataBinding.FieldName = 'IsTsnXRDDownloaded'
        Width = 73
      end
      object tvProcessedIsRankingsUpdated: TcxGridDBColumn
        DataBinding.FieldName = 'IsRankingsUpdated'
        Width = 91
      end
      object tvProcessedIsRankingsByTrkCodeUpdated: TcxGridDBColumn
        DataBinding.FieldName = 'IsRankingsByTrkCodeUpdated'
        Width = 107
      end
      object tvProcessedIsFinalOrderUpdated: TcxGridDBColumn
        DataBinding.FieldName = 'IsFinalOrderUpdated'
        Width = 116
      end
    end
    object lvProcessed: TcxGridLevel
      Caption = 'Processed'
      GridView = tvProcessed
    end
    object lvVendors: TcxGridLevel
      Caption = 'Vendors'
      GridView = tvVendor
    end
    object lvTrack: TcxGridLevel
      Caption = 'Tracks'
      GridView = tvTrack
    end
    object lvCardTrack: TcxGridLevel
      Caption = 'Track - CardView'
      GridView = cvTrack
      Options.DetailTabsPosition = dtpLeft
    end
  end
  object tblTracks: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbOptions'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Track'
    Left = 16
    Top = 280
  end
  object dsTrack: TDataSource
    DataSet = tblTracks
    Left = 16
    Top = 432
  end
  object dbOptions: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbOptions'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 16
    Top = 368
  end
  object tblVendors: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbOptions'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Vendor'
    Left = 16
    Top = 184
  end
  object dsVendors: TDataSource
    DataSet = tblVendors
    Left = 16
    Top = 512
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 24
    Top = 113
  end
  object tblProcessed: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbOptions'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Processed'
    Left = 48
    Top = 472
  end
  object dsProcessed: TDataSource
    DataSet = tblProcessed
    Left = 16
    Top = 432
  end
end
