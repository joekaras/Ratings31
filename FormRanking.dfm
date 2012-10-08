object RankingForm: TRankingForm
  Left = -4
  Top = -4
  Width = 812
  Height = 612
  Caption = 'RankingForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridRankings: TcxGrid
    Left = 0
    Top = 0
    Width = 804
    Height = 585
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    RootLevelOptions.DetailTabsPosition = dtpLeft
    object tvRankingStats: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsRankingStats
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetUserFormat4
      object tvRankingStatsName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
      object tvRankingStatsType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
      end
      object tvRankingStatsRank: TcxGridDBColumn
        DataBinding.FieldName = 'Rank'
      end
      object tvRankingStatsStarts: TcxGridDBColumn
        DataBinding.FieldName = 'Starts'
      end
      object tvRankingStatsWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'WinPct'
      end
      object tvRankingStatsPlcPct: TcxGridDBColumn
        DataBinding.FieldName = 'PlcPct'
      end
      object tvRankingStatsShoPct: TcxGridDBColumn
        DataBinding.FieldName = 'ShoPct'
      end
      object tvRankingStatsAvgOdds: TcxGridDBColumn
        DataBinding.FieldName = 'AvgOdds'
      end
      object tvRankingStatsAvgWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'AvgWinOdds'
      end
      object tvRankingStatsValueBet: TcxGridDBColumn
        DataBinding.FieldName = 'ValueBet'
      end
      object tvRankingStatsBEWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'BEWinPct'
      end
      object tvRankingStatsFP1: TcxGridDBColumn
        DataBinding.FieldName = 'FP1'
      end
      object tvRankingStatsFP2: TcxGridDBColumn
        DataBinding.FieldName = 'FP2'
      end
      object tvRankingStatsFP3: TcxGridDBColumn
        DataBinding.FieldName = 'FP3'
      end
      object tvRankingStatsFP4: TcxGridDBColumn
        DataBinding.FieldName = 'FP4'
      end
      object tvRankingStatsFP5: TcxGridDBColumn
        DataBinding.FieldName = 'FP5'
      end
      object tvRankingStatsFP6: TcxGridDBColumn
        DataBinding.FieldName = 'FP6'
      end
      object tvRankingStatsFP7: TcxGridDBColumn
        DataBinding.FieldName = 'FP7'
      end
      object tvRankingStatsFP8: TcxGridDBColumn
        DataBinding.FieldName = 'FP8'
      end
      object tvRankingStatsFP9: TcxGridDBColumn
        DataBinding.FieldName = 'FP9'
      end
      object tvRankingStatsFP10: TcxGridDBColumn
        DataBinding.FieldName = 'FP10'
      end
      object tvRankingStatsFP11: TcxGridDBColumn
        DataBinding.FieldName = 'FP11'
      end
      object tvRankingStatsFP12: TcxGridDBColumn
        DataBinding.FieldName = 'FP12'
      end
      object tvRankingStatsFP13: TcxGridDBColumn
        DataBinding.FieldName = 'FP13'
      end
      object tvRankingStatsFP14: TcxGridDBColumn
        DataBinding.FieldName = 'FP14'
      end
      object tvRankingStatsFP15: TcxGridDBColumn
        DataBinding.FieldName = 'FP15'
      end
      object tvRankingStatsFP16: TcxGridDBColumn
        DataBinding.FieldName = 'FP16'
      end
      object tvRankingStatsFP17: TcxGridDBColumn
        DataBinding.FieldName = 'FP17'
      end
      object tvRankingStatsFP18: TcxGridDBColumn
        DataBinding.FieldName = 'FP18'
      end
      object tvRankingStatsFP19: TcxGridDBColumn
        DataBinding.FieldName = 'FP19'
      end
      object tvRankingStatsFP20: TcxGridDBColumn
        DataBinding.FieldName = 'FP20'
      end
      object tvRankingStatsTO1: TcxGridDBColumn
        DataBinding.FieldName = 'TO1'
      end
      object tvRankingStatsTO2: TcxGridDBColumn
        DataBinding.FieldName = 'TO2'
      end
      object tvRankingStatsTO3: TcxGridDBColumn
        DataBinding.FieldName = 'TO3'
      end
      object tvRankingStatsTO4: TcxGridDBColumn
        DataBinding.FieldName = 'TO4'
      end
      object tvRankingStatsTO5: TcxGridDBColumn
        DataBinding.FieldName = 'TO5'
      end
      object tvRankingStatsTO6: TcxGridDBColumn
        DataBinding.FieldName = 'TO6'
      end
      object tvRankingStatsTO7: TcxGridDBColumn
        DataBinding.FieldName = 'TO7'
      end
      object tvRankingStatsTO8: TcxGridDBColumn
        DataBinding.FieldName = 'TO8'
      end
      object tvRankingStatsTO9: TcxGridDBColumn
        DataBinding.FieldName = 'TO9'
      end
      object tvRankingStatsTO10: TcxGridDBColumn
        DataBinding.FieldName = 'TO10'
      end
      object tvRankingStatsTO11: TcxGridDBColumn
        DataBinding.FieldName = 'TO11'
      end
      object tvRankingStatsTO12: TcxGridDBColumn
        DataBinding.FieldName = 'TO12'
      end
      object tvRankingStatsTO13: TcxGridDBColumn
        DataBinding.FieldName = 'TO13'
      end
      object tvRankingStatsTO14: TcxGridDBColumn
        DataBinding.FieldName = 'TO14'
      end
      object tvRankingStatsTO15: TcxGridDBColumn
        DataBinding.FieldName = 'TO15'
      end
      object tvRankingStatsTO16: TcxGridDBColumn
        DataBinding.FieldName = 'TO16'
      end
      object tvRankingStatsTO17: TcxGridDBColumn
        DataBinding.FieldName = 'TO17'
      end
      object tvRankingStatsTO18: TcxGridDBColumn
        DataBinding.FieldName = 'TO18'
      end
      object tvRankingStatsTO19: TcxGridDBColumn
        DataBinding.FieldName = 'TO19'
      end
      object tvRankingStatsTO20: TcxGridDBColumn
        DataBinding.FieldName = 'TO20'
      end
      object tvRankingStatsTotalOdds: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOdds'
      end
      object tvRankingStatsTotalWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'TotalWinOdds'
      end
      object tvRankingStatsIVRunners: TcxGridDBColumn
        DataBinding.FieldName = 'IVRunners'
      end
      object tvRankingStatsIVWinners: TcxGridDBColumn
        DataBinding.FieldName = 'IVWinners'
      end
      object tvRankingStatsIVGroupWinnersPct: TcxGridDBColumn
        DataBinding.FieldName = 'IVGroupWinnersPct'
      end
      object tvRankingStatsIVRunnersAllRaces: TcxGridDBColumn
        DataBinding.FieldName = 'IVRunnersAllRaces'
      end
      object tvRankingStatsIVWinnersAllRaces: TcxGridDBColumn
        DataBinding.FieldName = 'IVWinnersAllRaces'
      end
      object tvRankingStatsIVGroupRunnersPct: TcxGridDBColumn
        DataBinding.FieldName = 'IVGroupRunnersPct'
      end
      object tvRankingStatsIV: TcxGridDBColumn
        DataBinding.FieldName = 'IV'
      end
      object tvRankingStatsWins: TcxGridDBColumn
        DataBinding.FieldName = 'Wins'
      end
      object tvRankingStatsWinsPlcs: TcxGridDBColumn
        DataBinding.FieldName = 'WinsPlcs'
      end
      object tvRankingStatsWinsPlcsShos: TcxGridDBColumn
        DataBinding.FieldName = 'WinsPlcsShos'
      end
      object tvRankingStatsMinWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MinWinOdds'
      end
      object tvRankingStatsMaxWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MaxWinOdds'
      end
      object tvRankingStatsMinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MinOdds'
      end
      object tvRankingStatsMaxOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MaxOdds'
      end
      object tvRankingStatsIVRoi: TcxGridDBColumn
        DataBinding.FieldName = 'IVRoi'
      end
      object tvRankingStatsAvgWinOddsWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'AvgWinOddsWinPct'
      end
    end
    object tvRankingStatsByTrk: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsRankingStatsByTrk
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Styles.StyleSheet = MainForm.GridTableViewStyleSheetUserFormat4
      object tvRankingStatsByTrkTrkCode: TcxGridDBColumn
        DataBinding.FieldName = 'TrkCode'
      end
      object tvRankingStatsByTrkName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
      object tvRankingStatsByTrkRank: TcxGridDBColumn
        DataBinding.FieldName = 'Rank'
      end
      object tvRankingStatsByTrkType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
      end
      object tvRankingStatsByTrkStarts: TcxGridDBColumn
        DataBinding.FieldName = 'Starts'
      end
      object tvRankingStatsByTrkWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'WinPct'
      end
      object tvRankingStatsByTrkPlcPct: TcxGridDBColumn
        DataBinding.FieldName = 'PlcPct'
      end
      object tvRankingStatsByTrkShoPct: TcxGridDBColumn
        DataBinding.FieldName = 'ShoPct'
      end
      object tvRankingStatsByTrkAvgOdds: TcxGridDBColumn
        DataBinding.FieldName = 'AvgOdds'
      end
      object tvRankingStatsByTrkAvgWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'AvgWinOdds'
      end
      object tvRankingStatsByTrkValueBet: TcxGridDBColumn
        DataBinding.FieldName = 'ValueBet'
      end
      object tvRankingStatsByTrkBEWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'BEWinPct'
      end
      object tvRankingStatsByTrkFP1: TcxGridDBColumn
        DataBinding.FieldName = 'FP1'
      end
      object tvRankingStatsByTrkFP2: TcxGridDBColumn
        DataBinding.FieldName = 'FP2'
      end
      object tvRankingStatsByTrkFP3: TcxGridDBColumn
        DataBinding.FieldName = 'FP3'
      end
      object tvRankingStatsByTrkFP4: TcxGridDBColumn
        DataBinding.FieldName = 'FP4'
      end
      object tvRankingStatsByTrkFP5: TcxGridDBColumn
        DataBinding.FieldName = 'FP5'
      end
      object tvRankingStatsByTrkFP6: TcxGridDBColumn
        DataBinding.FieldName = 'FP6'
      end
      object tvRankingStatsByTrkFP7: TcxGridDBColumn
        DataBinding.FieldName = 'FP7'
      end
      object tvRankingStatsByTrkFP8: TcxGridDBColumn
        DataBinding.FieldName = 'FP8'
      end
      object tvRankingStatsByTrkFP9: TcxGridDBColumn
        DataBinding.FieldName = 'FP9'
      end
      object tvRankingStatsByTrkFP10: TcxGridDBColumn
        DataBinding.FieldName = 'FP10'
      end
      object tvRankingStatsByTrkFP11: TcxGridDBColumn
        DataBinding.FieldName = 'FP11'
      end
      object tvRankingStatsByTrkFP12: TcxGridDBColumn
        DataBinding.FieldName = 'FP12'
      end
      object tvRankingStatsByTrkFP13: TcxGridDBColumn
        DataBinding.FieldName = 'FP13'
      end
      object tvRankingStatsByTrkFP14: TcxGridDBColumn
        DataBinding.FieldName = 'FP14'
      end
      object tvRankingStatsByTrkFP15: TcxGridDBColumn
        DataBinding.FieldName = 'FP15'
      end
      object tvRankingStatsByTrkFP16: TcxGridDBColumn
        DataBinding.FieldName = 'FP16'
      end
      object tvRankingStatsByTrkFP17: TcxGridDBColumn
        DataBinding.FieldName = 'FP17'
      end
      object tvRankingStatsByTrkFP18: TcxGridDBColumn
        DataBinding.FieldName = 'FP18'
      end
      object tvRankingStatsByTrkFP19: TcxGridDBColumn
        DataBinding.FieldName = 'FP19'
      end
      object tvRankingStatsByTrkFP20: TcxGridDBColumn
        DataBinding.FieldName = 'FP20'
      end
      object tvRankingStatsByTrkTO1: TcxGridDBColumn
        DataBinding.FieldName = 'TO1'
      end
      object tvRankingStatsByTrkTO2: TcxGridDBColumn
        DataBinding.FieldName = 'TO2'
      end
      object tvRankingStatsByTrkTO3: TcxGridDBColumn
        DataBinding.FieldName = 'TO3'
      end
      object tvRankingStatsByTrkTO4: TcxGridDBColumn
        DataBinding.FieldName = 'TO4'
      end
      object tvRankingStatsByTrkTO5: TcxGridDBColumn
        DataBinding.FieldName = 'TO5'
      end
      object tvRankingStatsByTrkTO6: TcxGridDBColumn
        DataBinding.FieldName = 'TO6'
      end
      object tvRankingStatsByTrkTO7: TcxGridDBColumn
        DataBinding.FieldName = 'TO7'
      end
      object tvRankingStatsByTrkTO8: TcxGridDBColumn
        DataBinding.FieldName = 'TO8'
      end
      object tvRankingStatsByTrkTO9: TcxGridDBColumn
        DataBinding.FieldName = 'TO9'
      end
      object tvRankingStatsByTrkTO10: TcxGridDBColumn
        DataBinding.FieldName = 'TO10'
      end
      object tvRankingStatsByTrkTO11: TcxGridDBColumn
        DataBinding.FieldName = 'TO11'
      end
      object tvRankingStatsByTrkTO12: TcxGridDBColumn
        DataBinding.FieldName = 'TO12'
      end
      object tvRankingStatsByTrkTO13: TcxGridDBColumn
        DataBinding.FieldName = 'TO13'
      end
      object tvRankingStatsByTrkTO14: TcxGridDBColumn
        DataBinding.FieldName = 'TO14'
      end
      object tvRankingStatsByTrkTO15: TcxGridDBColumn
        DataBinding.FieldName = 'TO15'
      end
      object tvRankingStatsByTrkTO16: TcxGridDBColumn
        DataBinding.FieldName = 'TO16'
      end
      object tvRankingStatsByTrkTO17: TcxGridDBColumn
        DataBinding.FieldName = 'TO17'
      end
      object tvRankingStatsByTrkTO18: TcxGridDBColumn
        DataBinding.FieldName = 'TO18'
      end
      object tvRankingStatsByTrkTO19: TcxGridDBColumn
        DataBinding.FieldName = 'TO19'
      end
      object tvRankingStatsByTrkTO20: TcxGridDBColumn
        DataBinding.FieldName = 'TO20'
      end
      object tvRankingStatsByTrkIVRunners: TcxGridDBColumn
        DataBinding.FieldName = 'IVRunners'
      end
      object tvRankingStatsByTrkIVWinners: TcxGridDBColumn
        DataBinding.FieldName = 'IVWinners'
      end
      object tvRankingStatsByTrkIVGroupWinnersPct: TcxGridDBColumn
        DataBinding.FieldName = 'IVGroupWinnersPct'
      end
      object tvRankingStatsByTrkIVRunnersAllRaces: TcxGridDBColumn
        DataBinding.FieldName = 'IVRunnersAllRaces'
      end
      object tvRankingStatsByTrkIVWinnersAllRaces: TcxGridDBColumn
        DataBinding.FieldName = 'IVWinnersAllRaces'
      end
      object tvRankingStatsByTrkIVGroupRunnersPct: TcxGridDBColumn
        DataBinding.FieldName = 'IVGroupRunnersPct'
      end
      object tvRankingStatsByTrkIV: TcxGridDBColumn
        DataBinding.FieldName = 'IV'
      end
      object tvRankingStatsByTrkTotalOdds: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOdds'
      end
      object tvRankingStatsByTrkTotalWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'TotalWinOdds'
      end
      object tvRankingStatsByTrkWins: TcxGridDBColumn
        DataBinding.FieldName = 'Wins'
      end
      object tvRankingStatsByTrkWinsPlcs: TcxGridDBColumn
        DataBinding.FieldName = 'WinsPlcs'
      end
      object tvRankingStatsByTrkWinsPlcsShos: TcxGridDBColumn
        DataBinding.FieldName = 'WinsPlcsShos'
      end
      object tvRankingStatsByTrkMinWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MinWinOdds'
      end
      object tvRankingStatsByTrkMaxWinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MaxWinOdds'
      end
      object tvRankingStatsByTrkMinOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MinOdds'
      end
      object tvRankingStatsByTrkMaxOdds: TcxGridDBColumn
        DataBinding.FieldName = 'MaxOdds'
      end
      object tvRankingStatsByTrkIVRoi: TcxGridDBColumn
        DataBinding.FieldName = 'IVRoi'
      end
      object tvRankingStatsByTrkAvgWinOddsWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'AvgWinOddsWinPct'
      end
    end
    object lvRankingStats: TcxGridLevel
      Caption = 'Ranking Stats'
      GridView = tvRankingStats
    end
    object lvRankingStatsByTrk: TcxGridLevel
      Caption = 'Ranking Stats By Track'
      GridView = tvRankingStatsByTrk
    end
  end
  object tblRankingStats: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 'Rank=1'
    DatabaseName = 'dbRanking'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RankingStats'
    Left = 48
    Top = 64
  end
  object dsRankingStats: TDataSource
    DataSet = tblRankingStats
    Left = 32
    Top = 352
  end
  object tblRankingStatsByTrk: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbRanking'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'RankingStatsByTrk'
    Left = 48
    Top = 208
  end
  object dsRankingStatsByTrk: TDataSource
    DataSet = tblRankingStatsByTrk
    Left = 48
    Top = 128
  end
  object dbRanking: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbRanking'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 40
    Top = 280
  end
end
