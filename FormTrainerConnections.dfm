object TrainerConnectionsForm: TTrainerConnectionsForm
  Left = 223
  Top = 102
  Width = 1041
  Height = 701
  Caption = 'Trainer Connections'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 1033
    Height = 674
    ActivePage = cxTabSheet1
    Align = alClient
    TabOrder = 0
    ClientRectBottom = 674
    ClientRectRight = 1033
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 369
        Height = 650
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 6
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object tvTrainers: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Delete.Enabled = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.Edit.Visible = False
          DataController.DataSource = dsTrainers
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.PostponedSynchronization = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsCustomize.GroupBySorting = True
          OptionsCustomize.GroupRowSizing = True
          OptionsView.Navigator = True
          OptionsView.Footer = True
          OptionsView.Indicator = True
          object tvTrainersTrainer: TcxGridDBColumn
            DataBinding.FieldName = 'Trainer'
            Width = 335
          end
        end
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsOwner
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1DBTableView1Owner: TcxGridDBColumn
            DataBinding.FieldName = 'Owner'
          end
          object cxGrid1DBTableView1ActualOwnerName: TcxGridDBColumn
            DataBinding.FieldName = 'ActualOwnerName'
          end
          object cxGrid1DBTableView1IsSuperOwner: TcxGridDBColumn
            DataBinding.FieldName = 'IsSuperOwner'
          end
          object cxGrid1DBTableView1WinsThisYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'WinsThisYearRank'
          end
          object cxGrid1DBTableView1WinsLastYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'WinsLastYearRank'
          end
          object cxGrid1DBTableView1EarningsThisYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'EarningsThisYearRank'
          end
          object cxGrid1DBTableView1EarningsLastYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'EarningsLastYearRank'
          end
        end
        object lvTrainers: TcxGridLevel
          GridView = tvTrainers
        end
      end
      object cxGrid2: TcxGrid
        Left = 369
        Top = 0
        Width = 664
        Height = 650
        Align = alClient
        TabOrder = 1
        RootLevelStyles.TabsBackground = MainForm.cxStyle102
        object tvGeneral: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsTrainerOwnerSummary
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object tvGeneralOwner: TcxGridDBColumn
            DataBinding.FieldName = 'Owner'
            Width = 269
          end
          object tvGeneralActualOwnerName: TcxGridDBColumn
            DataBinding.FieldName = 'ActualOwnerName'
          end
          object tvGeneralStarts: TcxGridDBColumn
            DataBinding.FieldName = 'Starts'
          end
          object tvGeneralWins: TcxGridDBColumn
            DataBinding.FieldName = 'Wins'
          end
          object tvGeneralWinPct: TcxGridDBColumn
            DataBinding.FieldName = 'WinPct'
          end
          object tvGeneralMinWinOdds: TcxGridDBColumn
            DataBinding.FieldName = 'MinWinOdds'
            Width = 95
          end
          object tvGeneralMaxWinOdds: TcxGridDBColumn
            DataBinding.FieldName = 'MaxWinOdds'
            Width = 99
          end
          object tvGeneralAvgWinOdds: TcxGridDBColumn
            DataBinding.FieldName = 'AvgWinOdds'
            Width = 128
          end
        end
        object lvGeneral: TcxGridLevel
          Caption = '0'
          GridView = tvGeneral
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 593
        Height = 650
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 6
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object cxGrid3DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsOwner
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid3DBTableView1Owner: TcxGridDBColumn
            DataBinding.FieldName = 'Owner'
            Width = 278
          end
          object cxGrid3DBTableView1ActualOwnerName: TcxGridDBColumn
            DataBinding.FieldName = 'ActualOwnerName'
          end
          object cxGrid3DBTableView1IsSuperOwner: TcxGridDBColumn
            DataBinding.FieldName = 'IsSuperOwner'
          end
          object cxGrid3DBTableView1WinsThisYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'WinsThisYearRank'
          end
          object cxGrid3DBTableView1WinsLastYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'WinsLastYearRank'
          end
          object cxGrid3DBTableView1EarningsThisYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'EarningsThisYearRank'
          end
          object cxGrid3DBTableView1EarningsLastYearRank: TcxGridDBColumn
            DataBinding.FieldName = 'EarningsLastYearRank'
          end
          object cxGrid3DBTableView1Owner1: TcxGridDBColumn
            DataBinding.FieldName = 'Owner'
          end
          object cxGrid3DBTableView1IsSuperOwner1: TcxGridDBColumn
            DataBinding.FieldName = 'IsSuperOwner'
          end
          object cxGrid3DBTableView1WinsThisYearRank1: TcxGridDBColumn
            DataBinding.FieldName = 'WinsThisYearRank'
          end
          object cxGrid3DBTableView1WinsLastYearRank1: TcxGridDBColumn
            DataBinding.FieldName = 'WinsLastYearRank'
          end
          object cxGrid3DBTableView1EarningsThisYearRank1: TcxGridDBColumn
            DataBinding.FieldName = 'EarningsThisYearRank'
          end
          object cxGrid3DBTableView1EarningsLastYearRank1: TcxGridDBColumn
            DataBinding.FieldName = 'EarningsLastYearRank'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGrid3DBTableView1
        end
      end
      object cxGrid4: TcxGrid
        Left = 593
        Top = 0
        Width = 456
        Height = 650
        Align = alLeft
        TabOrder = 1
        RootLevelStyles.TabsBackground = MainForm.cxStyle102
        object cxGrid4DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsTrainerOwnerSummary
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid4DBTableView1Owner: TcxGridDBColumn
            DataBinding.FieldName = 'Owner'
          end
          object cxGrid4DBTableView1TrnEquibaseKey: TcxGridDBColumn
            DataBinding.FieldName = 'TrnEquibaseKey'
          end
          object cxGrid4DBTableView1ActualOwnerName: TcxGridDBColumn
            DataBinding.FieldName = 'ActualOwnerName'
          end
          object cxGrid4DBTableView1Starts: TcxGridDBColumn
            DataBinding.FieldName = 'Starts'
          end
          object cxGrid4DBTableView1Wins: TcxGridDBColumn
            DataBinding.FieldName = 'Wins'
          end
          object cxGrid4DBTableView1WinPct: TcxGridDBColumn
            DataBinding.FieldName = 'WinPct'
          end
          object cxGrid4DBTableView1TotalOdds: TcxGridDBColumn
            DataBinding.FieldName = 'TotalOdds'
          end
          object cxGrid4DBTableView1AvgWinOdds: TcxGridDBColumn
            DataBinding.FieldName = 'AvgWinOdds'
          end
          object cxGrid4DBTableView1MinWinOdds: TcxGridDBColumn
            DataBinding.FieldName = 'MinWinOdds'
          end
          object cxGrid4DBTableView1MaxWinOdds: TcxGridDBColumn
            DataBinding.FieldName = 'MaxWinOdds'
          end
          object cxGrid4DBTableView1Rating: TcxGridDBColumn
            DataBinding.FieldName = 'Rating'
          end
          object cxGrid4DBTableView1Roi: TcxGridDBColumn
            DataBinding.FieldName = 'Roi'
          end
        end
        object cxGridLevel2: TcxGridLevel
          Caption = 'General'
        end
      end
    end
  end
  object tblTrainers: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbTrainerConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Trainer'
    Left = 960
    Top = 192
  end
  object dsTrainerOwnerSummary: TDataSource
    DataSet = tblTrainerOwnerSummary
    Left = 728
    Top = 216
  end
  object tblTrainerOwnerSummary: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbTrainerConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByTrnEquibaseKey'
    MasterFields = 'TrnEquibaseKey'
    MasterSource = dsTrainers
    TableName = 'TrainerOwnerSummary'
    Left = 720
    Top = 144
  end
  object dsTrainers: TDataSource
    DataSet = tblTrainers
    Left = 960
    Top = 256
  end
  object dbTrainerConnections: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbTrainerConnections'
    Directory = 'c:\ratingsdata31'
    RemoteDatabase = 'dbTrainerConnections'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 856
    Top = 64
  end
  object tblOwners: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbTrainerConnections'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Owner'
    Left = 768
    Top = 360
  end
  object dsOwner: TDataSource
    DataSet = tblOwners
    Left = 760
    Top = 440
  end
end
