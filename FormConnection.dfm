object ConnectionForm: TConnectionForm
  Left = 269
  Top = 159
  Width = 829
  Height = 537
  Caption = 'ConnectionForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxConnection: TcxGrid
    Left = 0
    Top = 0
    Width = 821
    Height = 510
    Align = alClient
    TabOrder = 0
    LookAndFeel.NativeStyle = True
    RootLevelOptions.DetailTabsPosition = dtpTop
    object tvOwner: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.Visible = fvAlways
      DataController.DataSource = dsOwner
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsView.Navigator = True
      OptionsView.ScrollBars = ssVertical
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      Preview.Place = ppTop
      object tvOwnerOwner: TcxGridDBColumn
        DataBinding.FieldName = 'Owner'
      end
      object tvOwnerActualOwnerName: TcxGridDBColumn
        DataBinding.FieldName = 'ActualOwnerName'
      end
      object tvOwnerIsSuperOwner: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperOwner'
      end
      object tvOwnerWinsThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'WinsThisYearRank'
      end
      object tvOwnerWinsLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'WinsLastYearRank'
      end
      object tvOwnerEarningsThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarningsThisYearRank'
      end
      object tvOwnerEarningsLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarningsLastYearRank'
      end
    end
    object tvTrainer: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.Visible = fvAlways
      DataController.DataSource = dsTrainer
      DataController.DetailKeyFieldNames = 'Trainer'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsView.ColumnAutoWidth = True
      object tvTrainerTrainer: TcxGridDBColumn
        DataBinding.FieldName = 'Trainer'
      end
      object tvTrainerIsSuperTrainer: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperTrainer'
      end
      object tvTrainerTrnEquibaseKey: TcxGridDBColumn
        DataBinding.FieldName = 'TrnEquibaseKey'
      end
      object tvTrainerWinsThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'WinsThisYearRank'
      end
      object tvTrainerWinsLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'WinsLastYearRank'
      end
      object tvTrainerEarningsThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarningsThisYearRank'
      end
      object tvTrainerEarningsLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarningsLastYearRank'
      end
    end
    object tvJockey: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.Visible = fvAlways
      DataController.DataSource = dsJockey
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.IncSearch = True
      OptionsView.ScrollBars = ssVertical
      OptionsView.ColumnAutoWidth = True
      object tvJockeyJockey: TcxGridDBColumn
        DataBinding.FieldName = 'Jockey'
      end
      object tvJockeyIsSuperJockey: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperJockey'
      end
      object tvJockeyJkyEquibaseKey: TcxGridDBColumn
        DataBinding.FieldName = 'JkyEquibaseKey'
      end
      object tvJockeyWinsThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'WinsThisYearRank'
      end
      object tvJockeyWinsLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'WinsLastYearRank'
      end
      object tvJockeyEarningsThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarningsThisYearRank'
      end
      object tvJockeyEarningsLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarningsLastYearRank'
      end
    end
    object tvOwnerXFER: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsXFEROwner
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = tvOwnerXFEROwner
      OptionsBehavior.NavigatorHints = True
      OptionsView.Navigator = True
      OptionsView.ShowEditButtons = gsebAlways
      object tvOwnerXFEROwner: TcxGridDBColumn
        DataBinding.FieldName = 'Owner'
        Width = 236
      end
      object tvOwnerXFERActualOwnerName: TcxGridDBColumn
        DataBinding.FieldName = 'ActualOwnerName'
        Width = 261
      end
    end
    object tvTrainerOwner: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTrainerOwnerSummary
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxConnectionDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTrainerCateory
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxConnectionDBTableView1Trainer: TcxGridDBColumn
        DataBinding.FieldName = 'Trainer'
      end
      object cxConnectionDBTableView1Category: TcxGridDBColumn
        DataBinding.FieldName = 'Category'
      end
      object cxConnectionDBTableView1Starts: TcxGridDBColumn
        DataBinding.FieldName = 'Starts'
      end
      object cxConnectionDBTableView1WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'WinPct'
      end
      object cxConnectionDBTableView1ITMPct: TcxGridDBColumn
        DataBinding.FieldName = 'ITMPct'
      end
      object cxConnectionDBTableView1ROI: TcxGridDBColumn
        DataBinding.FieldName = 'ROI'
      end
    end
    object tvSire: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSire
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object tvSireSireName: TcxGridDBColumn
        DataBinding.FieldName = 'SireName'
        Width = 160
      end
      object tvSireGeneralThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'GeneralThisYearRank'
      end
      object tvSireGeneralLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'GeneralLastYearRank'
      end
      object tvSireTurfThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'TurfThisYearRank'
      end
      object tvSireTurfLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'TurfLastYearRank'
      end
      object tvSireJuvenileThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'JuvenileThisYearRank'
      end
      object tvSireJuvenileLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'JuvenileLastYearRank'
      end
      object tvSireStandingIn: TcxGridDBColumn
        DataBinding.FieldName = 'StandingIn'
      end
      object tvSireGeneralThisYearStudFee: TcxGridDBColumn
        DataBinding.FieldName = 'GeneralThisYearStudFee'
      end
      object tvSireTurfLastYearStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TurfLastYearStarts'
      end
      object tvSireTurfLastYearWins: TcxGridDBColumn
        DataBinding.FieldName = 'TurfLastYearWins'
      end
      object tvSireStandingInRank: TcxGridDBColumn
        DataBinding.FieldName = 'StandingInRank'
      end
      object tvSireGeneralLastYearStudFee: TcxGridDBColumn
        DataBinding.FieldName = 'GeneralLastYearStudFee'
      end
      object tvSireJuvenileLastYearStudFee: TcxGridDBColumn
        DataBinding.FieldName = 'JuvenileLastYearStudFee'
      end
      object tvSireTurfThisYearWins: TcxGridDBColumn
        DataBinding.FieldName = 'TurfThisYearWins'
      end
      object tvSireTurfThisYearStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TurfThisYearStarts'
      end
      object tvSireTurfLastYearStakeWins: TcxGridDBColumn
        DataBinding.FieldName = 'TurfLastYearStakeWins'
      end
      object tvSireTurfThisYearStakeWins: TcxGridDBColumn
        DataBinding.FieldName = 'TurfThisYearStakeWins'
      end
      object tvSireTurfThisYearPctOfEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'TurfThisYearPctOfEarnings'
      end
      object tvSireTurfLastYearPctOfEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'TurfLastYearPctOfEarnings'
      end
      object tvSireAllStarts: TcxGridDBColumn
        DataBinding.FieldName = 'AllStarts'
      end
      object tvSireAllWins: TcxGridDBColumn
        DataBinding.FieldName = 'AllWins'
      end
      object tvSireAllWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'AllWinPct'
      end
      object tvSireTurfStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TurfStarts'
      end
      object tvSireTurfWins: TcxGridDBColumn
        DataBinding.FieldName = 'TurfWins'
      end
      object tvSireTurfWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TurfWinPct'
      end
      object tvSireMudStarts: TcxGridDBColumn
        DataBinding.FieldName = 'MudStarts'
      end
      object tvSireMudWins: TcxGridDBColumn
        DataBinding.FieldName = 'MudWins'
      end
      object tvSireMudWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'MudWinPct'
      end
    end
    object lvTrainer: TcxGridLevel
      Caption = 'Trainers'
      GridView = tvTrainer
    end
    object cxConnectionLevel1: TcxGridLevel
      Caption = 'Trainer Category'
      GridView = cxConnectionDBTableView1
    end
    object lvOwner: TcxGridLevel
      Caption = 'Owners'
      GridView = tvOwner
    end
    object lvTrainerOwner: TcxGridLevel
      Caption = 'Trainer Owner'
      GridView = tvTrainerOwner
    end
    object lvOwnerXFER: TcxGridLevel
      Caption = 'Owner CrossReference'
      GridView = tvOwnerXFER
    end
    object lvJockey: TcxGridLevel
      Caption = 'Jockeys'
      GridView = tvJockey
    end
    object csSire: TcxGridLevel
      Caption = 'Sire'
      GridView = tvSire
    end
  end
  object tblOwner: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'owner'
    Left = 192
    Top = 96
  end
  object dsOwner: TDataSource
    DataSet = tblOwner
    Left = 192
    Top = 152
  end
  object tblTrainer: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    MasterSource = dsXFEROwner
    TableName = 'Trainer'
    Left = 280
    Top = 96
  end
  object tblJockey: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Jockey'
    Left = 64
    Top = 96
  end
  object dsTrainer: TDataSource
    DataSet = tblTrainer
    Left = 288
    Top = 160
  end
  object dsJockey: TDataSource
    DataSet = tblJockey
    Left = 64
    Top = 152
  end
  object dsXFEROwner: TDataSource
    DataSet = tblXFEROwner
    Left = 64
    Top = 296
  end
  object tblXFEROwner: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbConnections'
    EngineVersion = '4.24 Build 1'
    TableName = 'XFEROwner'
    Left = 64
    Top = 224
  end
  object dbConnections: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbConnections'
    Directory = 'C:\RatingsData31'
    KeepConnection = False
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 192
    Top = 360
  end
  object tblTrainerOwnerSummary: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByTrnEquibaseKey'
    MasterFields = 'TrnEquibaseKey'
    TableName = 'TrainerOwnerSummary'
    Left = 184
    Top = 216
  end
  object dsTrainerOwnerSummary: TDataSource
    DataSet = tblTrainerOwnerSummary
    Left = 192
    Top = 272
  end
  object tblTrainerCategory: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'TrainerCategory'
    Left = 432
    Top = 96
  end
  object dsTrainerCateory: TDataSource
    DataSet = tblTrainerCategory
    Left = 424
    Top = 160
  end
  object tblSire: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Sire'
    Left = 552
    Top = 104
  end
  object dsSire: TDataSource
    DataSet = tblSire
    Left = 528
    Top = 248
  end
end
