object WagersForm: TWagersForm
  Left = 37
  Top = 0
  Width = 798
  Height = 459
  VertScrollBar.Visible = False
  Caption = 'Entries'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object cxBank: TcxGrid
    Left = 0
    Top = 0
    Width = 790
    Height = 287
    Align = alTop
    TabOrder = 0
    object tvBank: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsBank
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'WagerAmt'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Navigator = True
      object tvBankWagerType: TcxGridDBColumn
        DataBinding.FieldName = 'WagerType'
        Width = 84
      end
      object tvBankWagerDate: TcxGridDBColumn
        DataBinding.FieldName = 'WagerDate'
      end
      object tvBankStartBank: TcxGridDBColumn
        DataBinding.FieldName = 'StartBank'
      end
      object tvBankWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'WagerAmt'
      end
      object tvBankWagerRefund: TcxGridDBColumn
        DataBinding.FieldName = 'WagerRefund'
      end
      object tvBankWagerPayout: TcxGridDBColumn
        DataBinding.FieldName = 'WagerPayout'
      end
      object tvBankWagerPL: TcxGridDBColumn
        DataBinding.FieldName = 'WagerPL'
      end
      object tvBankEndBank: TcxGridDBColumn
        DataBinding.FieldName = 'EndBank'
      end
      object tvBankWagerBets: TcxGridDBColumn
        DataBinding.FieldName = 'WagerBets'
      end
      object tvBankWagerBetsMissed: TcxGridDBColumn
        DataBinding.FieldName = 'WagerBetsMissed'
      end
      object tvBankWagerWins: TcxGridDBColumn
        DataBinding.FieldName = 'WagerWins'
      end
      object tvBankWagerScratches: TcxGridDBColumn
        DataBinding.FieldName = 'WagerScratches'
      end
    end
    object lvBank: TcxGridLevel
      GridView = tvBank
    end
  end
  object cxWagers: TcxGrid
    Left = 0
    Top = 287
    Width = 790
    Height = 139
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    object tvGeneral: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dsWagers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetUserFormat4
    end
    object tvFinalOrder: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.GridMode = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetUserFormat4
    end
    object tvWagers: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsWagers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Navigator = True
      object tvWagersTrkCode: TcxGridDBColumn
        Caption = 'Track'
        DataBinding.FieldName = 'TrkCode'
        MinWidth = 0
        Width = 53
      end
      object tvWagersRaceDate: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'RaceDate'
        Width = 79
      end
      object tvWagersRaceNbr: TcxGridDBColumn
        Caption = 'Race'
        DataBinding.FieldName = 'RaceNbr'
        Width = 49
      end
      object tvWagersPostPos: TcxGridDBColumn
        Caption = 'Post'
        DataBinding.FieldName = 'PostPos'
      end
      object tvWagersEstTimeOfRace: TcxGridDBColumn
        Caption = 'Time'
        DataBinding.FieldName = 'EstTimeOfRace'
      end
      object tvWagersFinishPos: TcxGridDBColumn
        Caption = 'Finish'
        DataBinding.FieldName = 'FinishPos'
        Width = 56
      end
      object tvWagersOdds: TcxGridDBColumn
        DataBinding.FieldName = 'Odds'
      end
      object tvWagersRefund: TcxGridDBColumn
        DataBinding.FieldName = 'Refund'
      end
      object tvWagersStartBank: TcxGridDBColumn
        DataBinding.FieldName = 'StartBank'
        Width = 75
      end
      object tvWagersEdge: TcxGridDBColumn
        DataBinding.FieldName = 'Edge'
      end
      object tvWagersWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'WagerAmt'
        Width = 78
      end
      object tvWagersPayout: TcxGridDBColumn
        DataBinding.FieldName = 'Payout'
      end
      object tvWagersEndBank: TcxGridDBColumn
        DataBinding.FieldName = 'EndBank'
      end
      object tvWagersMissed: TcxGridDBColumn
        DataBinding.FieldName = 'Missed'
        Width = 64
      end
      object tvWagersScratched: TcxGridDBColumn
        DataBinding.FieldName = 'Scratched'
        Width = 78
      end
      object tvWagersHalfKelly: TcxGridDBColumn
        DataBinding.FieldName = 'HalfKelly'
      end
      object tvWagersMaxEdge: TcxGridDBColumn
        DataBinding.FieldName = 'MaxEdge'
        Width = 73
      end
    end
    object lvWagers: TcxGridLevel
      GridView = tvWagers
    end
  end
  object tblWagers: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagers'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByRaceDateWagerType'
    MasterFields = 'WagerDate;WagerType'
    MasterSource = dsBank
    TableName = 'Wagers'
    Left = 48
    Top = 320
  end
  object dsWagers: TDataSource
    DataSet = tblWagers
    Left = 288
    Top = 304
  end
  object tblBank: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagers'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Bank'
    Left = 112
    Top = 312
  end
  object dsBank: TDataSource
    DataSet = tblBank
    Left = 224
    Top = 344
  end
  object dbWagers: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbWagers'
    Directory = 'k:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 168
    Top = 328
  end
  object tblHH: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagers'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexFieldNames = 'TrkCode;RaceDate;RaceNbr;PostPos'
    MasterFields = 'TrkCode;RaceDate;RaceNbr;PostPos'
    MasterSource = dsWagers
    TableName = 'HorseHistory'
    Left = 216
    Top = 432
  end
  object dsHH: TDataSource
    DataSet = tblHH
    Left = 352
    Top = 400
  end
end
