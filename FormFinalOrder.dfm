object FinalOrderForm: TFinalOrderForm
  Left = 158
  Top = 200
  Width = 812
  Height = 653
  Caption = 'FinalOrderForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object cxGridRankings: TcxGrid
    Left = 0
    Top = 50
    Width = 804
    Height = 575
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    object tvPrimaryKey: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.SyncMode = False
      DataController.DataSource = dsPrimaryKey
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Navigator = True
      OptionsView.GroupFooters = gfAlwaysVisible
      object tvPrimaryKeyOrderKey: TcxGridDBColumn
        DataBinding.FieldName = 'OrderKey'
        Width = 163
      end
      object tvPrimaryKeyBaseKey: TcxGridDBColumn
        DataBinding.FieldName = 'BaseKey'
        Width = 124
      end
      object tvPrimaryKeyTrkKey: TcxGridDBColumn
        Caption = 'Track'
        DataBinding.FieldName = 'TrkKey'
        Width = 60
      end
      object tvPrimaryKeyStarts: TcxGridDBColumn
        DataBinding.FieldName = 'Starts'
      end
      object tvPrimaryKeyWins: TcxGridDBColumn
        DataBinding.FieldName = 'Wins'
      end
      object tvPrimaryKeyWinPct: TcxGridDBColumn
        Caption = 'Win %'
        DataBinding.FieldName = 'WinPct'
      end
      object tvPrimaryKeyTotalWagered: TcxGridDBColumn
        Caption = 'Wagered'
        DataBinding.FieldName = 'TotalWagered'
        Width = 88
      end
      object tvPrimaryKeyTotalWon: TcxGridDBColumn
        Caption = 'Won'
        DataBinding.FieldName = 'TotalWon'
      end
      object tvPrimaryKeyTotalProfitLoss: TcxGridDBColumn
        Caption = 'P/L'
        DataBinding.FieldName = 'TotalProfitLoss'
      end
      object tvPrimaryKeyMinWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MinWinOdds'
        Width = 92
      end
      object tvPrimaryKeyAvgWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'AvgWinOdds'
      end
      object tvPrimaryKeyMaxWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MaxWinOdds'
        Width = 92
      end
      object tvPrimaryKeyMinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MinOdds'
        Width = 89
      end
      object tvPrimaryKeyAvgOdds: TcxGridDBColumn
        DataBinding.FieldName = 'AvgOdds'
        Width = 98
      end
      object tvPrimaryKeyMaxOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MaxOdds'
        Width = 85
      end
      object tvPrimaryKeyTotalProfitLossPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalProfitLossPct'
      end
      object tvPrimaryKeyValueBet: TcxGridDBColumn
        DataBinding.FieldName = 'ValueBet'
        Visible = False
      end
      object tvPrimaryKeyTotalWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'TotalWinOdds'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object tvPrimaryKeyTotalOdds: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOdds'
        Visible = False
      end
    end
    object lvPrimaryKey: TcxGridLevel
      GridView = tvPrimaryKey
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 50
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 69
      Top = 10
      Width = 92
      Height = 31
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object qryPrimaryKey: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbFinalOrder'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    RequestLive = True
    MaxRowCount = -1
    SQL.Strings = (
      'SELECT * '
      'FROM                              '
      '  FinalOrder'
      '  INNER JOIN Track ON (FinalOrder.TrkKey = Track.TrkCode)'
      'WHERE '
      '('
      'FinalOrder.BaseKey <> '#39'OnlyMLKey'#39' AND'
      'FinalOrder.BaseKey <> '#39'LinerMLKey'#39' AND '
      'FinalOrder.BaseKey <> '#39'FinalMLKey'#39' AND'
      'FinalOrder.BaseKey <> '#39'DefaultMLKey'#39'  AND'
      'FinalOrder.BaseKey <> '#39'DefaultKey'#39'  AND'
      'FinalOrder.BaseKey <> '#39'SecondaryKey'#39'  AND'
      'FinalOrder.BaseKey <> '#39'PrimaryKey'#39'  '
      ''
      ')'
      '')
    Params = <>
    ReadOnly = True
    Left = 32
    Top = 152
  end
  object dsPrimaryKey: TDataSource
    DataSet = qryPrimaryKey
    Left = 32
    Top = 208
  end
  object dbFinalOrder: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbFinalOrder'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 40
    Top = 280
  end
end
