object BankForm: TBankForm
  Left = 164
  Top = 44
  Width = 544
  Height = 484
  Caption = 'Wagers'
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
  object grdWager: TcxGrid
    Left = 0
    Top = 0
    Width = 536
    Height = 457
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    RootLevelOptions.DetailTabsPosition = dtpLeft
    object cvBank: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsBank
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.NavigatorHints = True
      OptionsCustomize.CardExpanding = True
      OptionsView.Navigator = True
      object cvBankWagerDate: TcxGridDBCardViewRow
        Caption = 'Wager Date'
        DataBinding.FieldName = 'WagerDate'
      end
      object cvBankWagerType: TcxGridDBCardViewRow
        Caption = 'Type Of Wager'
        DataBinding.FieldName = 'WagerType'
      end
      object cvBankStartBank: TcxGridDBCardViewRow
        Caption = 'Starting Bankroll'
        DataBinding.FieldName = 'StartBank'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnValidate = cvBankStartBankPropertiesValidate
        Options.Filtering = False
      end
      object cvBankWagerAmt: TcxGridDBCardViewRow
        Caption = 'Wagers'
        DataBinding.FieldName = 'WagerAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnValidate = cvBankWagerAmtPropertiesValidate
        Options.Filtering = False
      end
      object cvBankWagerRefund: TcxGridDBCardViewRow
        Caption = 'Refunds'
        DataBinding.FieldName = 'WagerRefund'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnValidate = cvBankWagerRefundPropertiesValidate
        Options.Filtering = False
      end
      object cvBankWagerPayout: TcxGridDBCardViewRow
        Caption = 'Payouts'
        DataBinding.FieldName = 'WagerPayout'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.OnValidate = cvBankWagerPayoutPropertiesValidate
        Options.Filtering = False
      end
      object cvBankWagerPL: TcxGridDBCardViewRow
        Caption = 'Profit/(Loss)'
        DataBinding.FieldName = 'WagerPL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Editing = False
        Options.Filtering = False
      end
      object cvBankEndBank: TcxGridDBCardViewRow
        Caption = 'Ending Bank'
        DataBinding.FieldName = 'EndBank'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Editing = False
        Options.Filtering = False
      end
      object cvBankRow1: TcxGridDBCardViewRow
        Caption = 'Bets'
        DataBinding.FieldName = 'WagerBets'
        Options.Filtering = False
      end
      object cvBankRow2: TcxGridDBCardViewRow
        Caption = 'Bets Missed'
        DataBinding.FieldName = 'WagerBetsMissed'
        Options.Filtering = False
      end
      object cvBankRow3: TcxGridDBCardViewRow
        Caption = 'Scratches'
        DataBinding.FieldName = 'WagerScratches'
        Options.Filtering = False
      end
      object cvBankRow4: TcxGridDBCardViewRow
        Caption = 'Wins'
        DataBinding.FieldName = 'WagerWins'
        Options.Filtering = False
      end
    end
    object lvBank: TcxGridLevel
      Caption = 'Bank'
      GridView = cvBank
    end
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 16
    Top = 105
  end
  object dbWagers: TDBISAMDatabase
    EngineVersion = '4.21 Build 10'
    Connected = True
    DatabaseName = 'dbWagers'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 16
    Top = 56
  end
  object dsBank: TDataSource
    DataSet = tblBank
    Left = 16
    Top = 272
  end
  object tblBank: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagers'
    SessionName = 'Default'
    EngineVersion = '4.21 Build 10'
    TableName = 'Bank'
    Left = 16
    Top = 208
  end
end
