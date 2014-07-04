object TipReportForm: TTipReportForm
  Left = 76
  Top = 297
  Width = 703
  Height = 360
  HorzScrollBar.Position = 161
  Caption = 'Tip Sheet Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object pnlPrgBar: TPanel
    Left = -155
    Top = 17
    Width = 842
    Height = 51
    BorderStyle = bsSingle
    Caption = 'pnlPrgBar'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
    object prgBar: TProgressBar
      Left = 9
      Top = 14
      Width = 823
      Height = 19
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = -161
    Top = 280
    Width = 856
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = -147
    Top = 75
    Width = 842
    Height = 51
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbTipSheets: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbTipSheets'
    Directory = 'd:\RatingsData31'
    KeepConnection = False
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 336
    Top = 152
  end
  object tblRacesMaster: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbTipSheets'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByCT'
    TableName = 'Race.DAT'
    Left = 48
    Top = 80
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    Left = 24
    Top = 152
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 174
    Top = 240
  end
  object plEntries: TppDBPipeline
    DataSource = dsEntries
    CloseDataSource = True
    AutoCreateFields = False
    UserName = 'plEntries'
    Left = 181
    Top = 186
    MasterDataPipelineName = 'plRacesReport'
    object plEntriesppField1: TppField
      FieldAlias = 'TrkCode'
      FieldName = 'TrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 0
    end
    object plEntriesppField2: TppField
      FieldAlias = 'RaceDate'
      FieldName = 'RaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object plEntriesppField3: TppField
      FieldAlias = 'RangeRaceDate'
      FieldName = 'RangeRaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object plEntriesppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceNbr'
      FieldName = 'RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object plEntriesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PostPos'
      FieldName = 'PostPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object plEntriesppField6: TppField
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object plEntriesppField7: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object plEntriesppField8: TppField
      FieldAlias = 'EstTimeOfRace'
      FieldName = 'EstTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 7
    end
    object plEntriesppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object plEntriesppField10: TppField
      FieldAlias = 'Entry'
      FieldName = 'Entry'
      FieldLength = 5
      DisplayWidth = 5
      Position = 9
    end
    object plEntriesppField11: TppField
      FieldAlias = 'ProgramNbr'
      FieldName = 'ProgramNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object plEntriesppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ProgramNbrSort'
      FieldName = 'ProgramNbrSort'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object plEntriesppField13: TppField
      FieldAlias = 'MorningLineDesc'
      FieldName = 'MorningLineDesc'
      FieldLength = 15
      DisplayWidth = 15
      Position = 12
    end
    object plEntriesppField14: TppField
      FieldAlias = 'HorseName'
      FieldName = 'HorseName'
      FieldLength = 25
      DisplayWidth = 25
      Position = 13
    end
    object plEntriesppField15: TppField
      FieldAlias = 'Med'
      FieldName = 'Med'
      FieldLength = 5
      DisplayWidth = 5
      Position = 14
    end
    object plEntriesppField16: TppField
      FieldAlias = 'Equip'
      FieldName = 'Equip'
      FieldLength = 6
      DisplayWidth = 6
      Position = 15
    end
    object plEntriesppField17: TppField
      FieldAlias = 'IsFirstTimeJuice'
      FieldName = 'IsFirstTimeJuice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 16
    end
    object plEntriesppField18: TppField
      FieldAlias = 'IsBlinkersOn'
      FieldName = 'IsBlinkersOn'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 17
    end
    object plEntriesppField19: TppField
      FieldAlias = 'IsBlinkersOff'
      FieldName = 'IsBlinkersOff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 18
    end
    object plEntriesppField20: TppField
      FieldAlias = 'TurfIndicator'
      FieldName = 'TurfIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 19
    end
    object plEntriesppField21: TppField
      FieldAlias = 'DebutIndicator'
      FieldName = 'DebutIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 20
    end
    object plEntriesppField22: TppField
      FieldAlias = 'RouteIndicator'
      FieldName = 'RouteIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 21
    end
    object plEntriesppField23: TppField
      FieldAlias = 'MudIndicator'
      FieldName = 'MudIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 22
    end
    object plEntriesppField24: TppField
      FieldAlias = 'IsScratched'
      FieldName = 'IsScratched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 23
    end
    object plEntriesppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'Age'
      FieldName = 'Age'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object plEntriesppField26: TppField
      FieldAlias = 'Sex'
      FieldName = 'Sex'
      FieldLength = 3
      DisplayWidth = 3
      Position = 25
    end
    object plEntriesppField27: TppField
      FieldAlias = 'Color'
      FieldName = 'Color'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object plEntriesppField28: TppField
      FieldAlias = 'Weight'
      FieldName = 'Weight'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object plEntriesppField29: TppField
      FieldAlias = 'IsSuperTrainer'
      FieldName = 'IsSuperTrainer'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 28
    end
    object plEntriesppField30: TppField
      FieldAlias = 'Trainer'
      FieldName = 'Trainer'
      FieldLength = 30
      DisplayWidth = 30
      Position = 29
    end
    object plEntriesppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnWinsRank'
      FieldName = 'TrnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 30
    end
    object plEntriesppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnEarningsRank'
      FieldName = 'TrnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 31
    end
    object plEntriesppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTrackRank'
      FieldName = 'TrnTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 32
    end
    object plEntriesppField34: TppField
      FieldAlias = 'IsSuperJockey'
      FieldName = 'IsSuperJockey'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 33
    end
    object plEntriesppField35: TppField
      FieldAlias = 'Jockey'
      FieldName = 'Jockey'
      FieldLength = 25
      DisplayWidth = 25
      Position = 34
    end
    object plEntriesppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyWinsRank'
      FieldName = 'JkyWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 35
    end
    object plEntriesppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyEarningsRank'
      FieldName = 'JkyEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 36
    end
    object plEntriesppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyTrackRank'
      FieldName = 'JkyTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 37
    end
    object plEntriesppField39: TppField
      FieldAlias = 'IsSuperOwner'
      FieldName = 'IsSuperOwner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 38
    end
    object plEntriesppField40: TppField
      FieldAlias = 'Owner'
      FieldName = 'Owner'
      FieldLength = 45
      DisplayWidth = 45
      Position = 39
    end
    object plEntriesppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnWinsRank'
      FieldName = 'OwnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 40
    end
    object plEntriesppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnEarningsRank'
      FieldName = 'OwnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 41
    end
    object plEntriesppField43: TppField
      FieldAlias = 'Breeder'
      FieldName = 'Breeder'
      FieldLength = 67
      DisplayWidth = 67
      Position = 42
    end
    object plEntriesppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnStarts'
      FieldName = 'TotalTrnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 43
    end
    object plEntriesppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWins'
      FieldName = 'TotalTrnWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 44
    end
    object plEntriesppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWinPct'
      FieldName = 'TotalTrnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object plEntriesppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWinPctRank'
      FieldName = 'TotalTrnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 46
    end
    object plEntriesppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyStarts'
      FieldName = 'TotalTrnJkyStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 47
    end
    object plEntriesppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyWins'
      FieldName = 'TotalTrnJkyWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 48
    end
    object plEntriesppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyWinPct'
      FieldName = 'TotalTrnJkyWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object plEntriesppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyWinPctRank'
      FieldName = 'TotalTrnJkyWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 50
    end
    object plEntriesppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnStarts'
      FieldName = 'TotalTrnOwnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 51
    end
    object plEntriesppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnWins'
      FieldName = 'TotalTrnOwnWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 52
    end
    object plEntriesppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnWinPct'
      FieldName = 'TotalTrnOwnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object plEntriesppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnWinPctRank'
      FieldName = 'TotalTrnOwnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 54
    end
    object plEntriesppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1To45Starts'
      FieldName = 'TotalTrn1To45Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 55
    end
    object plEntriesppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1To45Wins'
      FieldName = 'TotalTrn1To45Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 56
    end
    object plEntriesppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1To45WinPct'
      FieldName = 'TotalTrn1To45WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object plEntriesppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork1To45Starts'
      FieldName = 'TotalTrnWork1To45Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 58
    end
    object plEntriesppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork1To45Wins'
      FieldName = 'TotalTrnWork1To45Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 59
    end
    object plEntriesppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork1To45WinPct'
      FieldName = 'TotalTrnWork1To45WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object plEntriesppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn46To120Starts'
      FieldName = 'TotalTrn46To120Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 61
    end
    object plEntriesppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn46To120Wins'
      FieldName = 'TotalTrn46To120Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 62
    end
    object plEntriesppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn46To120WinPct'
      FieldName = 'TotalTrn46To120WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object plEntriesppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork46To120Starts'
      FieldName = 'TotalTrnWork46To120Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 64
    end
    object plEntriesppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork46To120Wins'
      FieldName = 'TotalTrnWork46To120Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 65
    end
    object plEntriesppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork46To120WinPct'
      FieldName = 'TotalTrnWork46To120WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object plEntriesppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn120PlusStarts'
      FieldName = 'TotalTrn120PlusStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 67
    end
    object plEntriesppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn120PlusWins'
      FieldName = 'TotalTrn120PlusWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 68
    end
    object plEntriesppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn120PlusWinPct'
      FieldName = 'TotalTrn120PlusWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object plEntriesppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork120PlusStarts'
      FieldName = 'TotalTrnWork120PlusStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 70
    end
    object plEntriesppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork120PlusWins'
      FieldName = 'TotalTrnWork120PlusWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 71
    end
    object plEntriesppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork120PlusWinPct'
      FieldName = 'TotalTrnWork120PlusWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object plEntriesppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutStarts'
      FieldName = 'TotalTrnDebutStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 73
    end
    object plEntriesppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutWins'
      FieldName = 'TotalTrnDebutWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 74
    end
    object plEntriesppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutWinPct'
      FieldName = 'TotalTrnDebutWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object plEntriesppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoStarts'
      FieldName = 'TotalTrnDebutTwoStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 76
    end
    object plEntriesppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoWins'
      FieldName = 'TotalTrnDebutTwoWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 77
    end
    object plEntriesppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoWinPct'
      FieldName = 'TotalTrnDebutTwoWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object plEntriesppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFirstJuiceStarts'
      FieldName = 'TotalTrnFirstJuiceStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 79
    end
    object plEntriesppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFirstJuiceWins'
      FieldName = 'TotalTrnFirstJuiceWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 80
    end
    object plEntriesppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFirstJuiceWinPct'
      FieldName = 'TotalTrnFirstJuiceWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object plEntriesppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOnStarts'
      FieldName = 'TotalTrnBlinkersOnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 82
    end
    object plEntriesppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOnWins'
      FieldName = 'TotalTrnBlinkersOnWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 83
    end
    object plEntriesppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOnWinPct'
      FieldName = 'TotalTrnBlinkersOnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object plEntriesppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOffStarts'
      FieldName = 'TotalTrnBlinkersOffStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 85
    end
    object plEntriesppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOffWins'
      FieldName = 'TotalTrnBlinkersOffWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 86
    end
    object plEntriesppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOffWinPct'
      FieldName = 'TotalTrnBlinkersOffWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object plEntriesppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfStarts'
      FieldName = 'TotalTrnTurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 88
    end
    object plEntriesppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWins'
      FieldName = 'TotalTrnTurfWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 89
    end
    object plEntriesppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWinPct'
      FieldName = 'TotalTrnTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object plEntriesppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWinPctRank'
      FieldName = 'TotalTrnTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 91
    end
    object plEntriesppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30Starts'
      FieldName = 'TotalTrn30Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 92
    end
    object plEntriesppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30Wins'
      FieldName = 'TotalTrn30Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 93
    end
    object plEntriesppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30WinPct'
      FieldName = 'TotalTrn30WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object plEntriesppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30WinPctRank'
      FieldName = 'TotalTrn30WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 95
    end
    object plEntriesppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmStarts'
      FieldName = 'TotalTrnAftClmStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 96
    end
    object plEntriesppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmWins'
      FieldName = 'TotalTrnAftClmWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 97
    end
    object plEntriesppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmWinPct'
      FieldName = 'TotalTrnAftClmWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 98
    end
    object plEntriesppField100: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsStarts'
      FieldName = 'TotalTrnOddsStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 99
    end
    object plEntriesppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWins'
      FieldName = 'TotalTrnOddsWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 100
    end
    object plEntriesppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWinPct'
      FieldName = 'TotalTrnOddsWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 101
    end
    object plEntriesppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWinPctRank'
      FieldName = 'TotalTrnOddsWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 102
    end
    object plEntriesppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1stStarts'
      FieldName = 'TotalTrn1stStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 103
    end
    object plEntriesppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1stWins'
      FieldName = 'TotalTrn1stWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 104
    end
    object plEntriesppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1stWinPct'
      FieldName = 'TotalTrn1stWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 105
    end
    object plEntriesppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2yoStarts'
      FieldName = 'TotalTrn2yoStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 106
    end
    object plEntriesppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2yoWins'
      FieldName = 'TotalTrn2yoWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 107
    end
    object plEntriesppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2yoWinPct'
      FieldName = 'TotalTrn2yoWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object plEntriesppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2oWinPctRank'
      FieldName = 'TotalTrn2oWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 109
    end
    object plEntriesppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayStarts'
      FieldName = 'TrnTodayStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 110
    end
    object plEntriesppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWins'
      FieldName = 'TrnTodayWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 111
    end
    object plEntriesppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWinPct'
      FieldName = 'TrnTodayWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object plEntriesppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWinPctRank'
      FieldName = 'TrnTodayWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 113
    end
    object plEntriesppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnDirtToTurfStarts'
      FieldName = 'TrnDirtToTurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 114
    end
    object plEntriesppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnDirtToTurfWinPct'
      FieldName = 'TrnDirtToTurfWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 115
    end
    object plEntriesppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTurfToDirtStarts'
      FieldName = 'TrnTurfToDirtStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 116
    end
    object plEntriesppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTurfToDirtWinPct'
      FieldName = 'TrnTurfToDirtWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 117
    end
    object plEntriesppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnRteToSprStarts'
      FieldName = 'TrnRteToSprStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 118
    end
    object plEntriesppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnRteToSprWinPct'
      FieldName = 'TrnRteToSprWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 119
    end
    object plEntriesppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnSprToRteStarts'
      FieldName = 'TrnSprToRteStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 120
    end
    object plEntriesppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnSprToRteWinPct'
      FieldName = 'TrnSprToRteWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 121
    end
    object plEntriesppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnStkWinPct'
      FieldName = 'TrnStkWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 122
    end
    object plEntriesppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnClmWinPct'
      FieldName = 'TrnClmWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 123
    end
    object plEntriesppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnMdnWinPct'
      FieldName = 'TrnMdnWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 124
    end
    object plEntriesppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnAlwWinPct'
      FieldName = 'TrnAlwWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 125
    end
    object plEntriesppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyStarts'
      FieldName = 'TotalJkyStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 126
    end
    object plEntriesppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWins'
      FieldName = 'TotalJkyWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 127
    end
    object plEntriesppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWinPct'
      FieldName = 'TotalJkyWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 128
    end
    object plEntriesppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWinPctRank'
      FieldName = 'TotalJkyWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 129
    end
    object plEntriesppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysStarts'
      FieldName = 'TotalJkyDaysStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 130
    end
    object plEntriesppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWins'
      FieldName = 'TotalJkyDaysWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 131
    end
    object plEntriesppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWinPctRank'
      FieldName = 'TotalJkyDaysWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 132
    end
    object plEntriesppField134: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWinPct'
      FieldName = 'TotalJkyDaysWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 133
    end
    object plEntriesppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsStarts'
      FieldName = 'TotalJkyOddsStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 134
    end
    object plEntriesppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWins'
      FieldName = 'TotalJkyOddsWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 135
    end
    object plEntriesppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWinPct'
      FieldName = 'TotalJkyOddsWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object plEntriesppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWinPctRank'
      FieldName = 'TotalJkyOddsWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 137
    end
    object plEntriesppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyTurfStarts'
      FieldName = 'TotalJkyTurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 138
    end
    object plEntriesppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyTurfWins'
      FieldName = 'TotalJkyTurfWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 139
    end
    object plEntriesppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyTurfWinPct'
      FieldName = 'TotalJkyTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 140
    end
    object plEntriesppField142: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10Starts'
      FieldName = 'TotalJky10Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 141
    end
    object plEntriesppField143: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10Wins'
      FieldName = 'TotalJky10Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 142
    end
    object plEntriesppField144: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10WinPct'
      FieldName = 'TotalJky10WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 143
    end
    object plEntriesppField145: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10WinPctRank'
      FieldName = 'TotalJky10WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 144
    end
    object plEntriesppField146: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30Starts'
      FieldName = 'TotalJky30Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 145
    end
    object plEntriesppField147: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30Wins'
      FieldName = 'TotalJky30Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 146
    end
    object plEntriesppField148: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30WinPct'
      FieldName = 'TotalJky30WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 147
    end
    object plEntriesppField149: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30WinPctRank'
      FieldName = 'TotalJky30WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 148
    end
    object plEntriesppField150: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky2yoStarts'
      FieldName = 'TotalJky2yoStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 149
    end
    object plEntriesppField151: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky2yoWins'
      FieldName = 'TotalJky2yoWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 150
    end
    object plEntriesppField152: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky2yoWinPct'
      FieldName = 'TotalJky2yoWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 151
    end
    object plEntriesppField153: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnStarts'
      FieldName = 'TotalOwnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 152
    end
    object plEntriesppField154: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWins'
      FieldName = 'TotalOwnWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 153
    end
    object plEntriesppField155: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPct'
      FieldName = 'TotalOwnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 154
    end
    object plEntriesppField156: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPctRank'
      FieldName = 'TotalOwnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 155
    end
    object plEntriesppField157: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnTop3WinPct'
      FieldName = 'TotalOwnTop3WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 156
    end
    object plEntriesppField158: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdStarts'
      FieldName = 'TotalBrdStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 157
    end
    object plEntriesppField159: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWins'
      FieldName = 'TotalBrdWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 158
    end
    object plEntriesppField160: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWinPct'
      FieldName = 'TotalBrdWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 159
    end
    object plEntriesppField161: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWinPctRank'
      FieldName = 'TotalBrdWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 160
    end
    object plEntriesppField162: TppField
      FieldAlias = 'BredIn'
      FieldName = 'BredIn'
      FieldLength = 6
      DisplayWidth = 6
      Position = 161
    end
    object plEntriesppField163: TppField
      FieldAlias = 'Sire'
      FieldName = 'Sire'
      FieldLength = 25
      DisplayWidth = 25
      Position = 162
    end
    object plEntriesppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfLastYearRank'
      FieldName = 'SireTurfLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 163
    end
    object plEntriesppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfLastYearStarts'
      FieldName = 'SireTurfLastYearStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 164
    end
    object plEntriesppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfLastYearPctOfEarnings'
      FieldName = 'SireTurfLastYearPctOfEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 165
    end
    object plEntriesppField167: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireGeneralLastYearRank'
      FieldName = 'SireGeneralLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 166
    end
    object plEntriesppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireGeneralLastYearStudFee'
      FieldName = 'SireGeneralLastYearStudFee'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 167
    end
    object plEntriesppField169: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireJuvenileLastYearRank'
      FieldName = 'SireJuvenileLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 168
    end
    object plEntriesppField170: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireJuvenileThisYearRank'
      FieldName = 'SireJuvenileThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 169
    end
    object plEntriesppField171: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfThisYearRank'
      FieldName = 'SireTurfThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 170
    end
    object plEntriesppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfThisYearStarts'
      FieldName = 'SireTurfThisYearStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 171
    end
    object plEntriesppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfThisYearPctOfEarnings'
      FieldName = 'SireTurfThisYearPctOfEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 172
    end
    object plEntriesppField174: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireGeneralThisYearRank'
      FieldName = 'SireGeneralThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 173
    end
    object plEntriesppField175: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireGeneralThisYearStudFee'
      FieldName = 'SireGeneralThisYearStudFee'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 174
    end
    object plEntriesppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAEI'
      FieldName = 'SireAEI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 175
    end
    object plEntriesppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAWThisYearRank'
      FieldName = 'SireAWThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 176
    end
    object plEntriesppField178: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAWLastYearRank'
      FieldName = 'SireAWLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 177
    end
    object plEntriesppField179: TppField
      FieldAlias = 'Dam'
      FieldName = 'Dam'
      FieldLength = 25
      DisplayWidth = 25
      Position = 178
    end
    object plEntriesppField180: TppField
      FieldAlias = 'DamSire'
      FieldName = 'DamSire'
      FieldLength = 25
      DisplayWidth = 25
      Position = 179
    end
    object plEntriesppField181: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfLastYearRank'
      FieldName = 'DamSireTurfLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 180
    end
    object plEntriesppField182: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfLastYearStarts'
      FieldName = 'DamSireTurfLastYearStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 181
    end
    object plEntriesppField183: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfLastYearPctOfEarnings'
      FieldName = 'DamSireTurfLastYearPctOfEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 182
    end
    object plEntriesppField184: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireGeneralLastYearRank'
      FieldName = 'DamSireGeneralLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 183
    end
    object plEntriesppField185: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireGeneralLastYearStudFee'
      FieldName = 'DamSireGeneralLastYearStudFee'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 184
    end
    object plEntriesppField186: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireJuvenileLastYearRank'
      FieldName = 'DamSireJuvenileLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 185
    end
    object plEntriesppField187: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireJuvenileThisYearRank'
      FieldName = 'DamSireJuvenileThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 186
    end
    object plEntriesppField188: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfThisYearRank'
      FieldName = 'DamSireTurfThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 187
    end
    object plEntriesppField189: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfThisYearStarts'
      FieldName = 'DamSireTurfThisYearStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 188
    end
    object plEntriesppField190: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfThisYearPctOfEarnings'
      FieldName = 'DamSireTurfThisYearPctOfEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 189
    end
    object plEntriesppField191: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireGeneralThisYearRank'
      FieldName = 'DamSireGeneralThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 190
    end
    object plEntriesppField192: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireGeneralThisYearStudFee'
      FieldName = 'DamSireGeneralThisYearStudFee'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 191
    end
    object plEntriesppField193: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAEI'
      FieldName = 'DamSireAEI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 192
    end
    object plEntriesppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAWThisYearRank'
      FieldName = 'DamSireAWThisYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 193
    end
    object plEntriesppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAWLastYearRank'
      FieldName = 'DamSireAWLastYearRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 194
    end
    object plEntriesppField196: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLast'
      FieldName = 'DaysLast'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 195
    end
    object plEntriesppField197: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork'
      FieldName = 'DaysLastWork'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 196
    end
    object plEntriesppField198: TppField
      FieldAlias = 'LastTrkCode'
      FieldName = 'LastTrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 197
    end
    object plEntriesppField199: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastRaceNbr'
      FieldName = 'LastRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 198
    end
    object plEntriesppField200: TppField
      FieldAlias = 'LastRaceDate'
      FieldName = 'LastRaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 199
    end
    object plEntriesppField201: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPostPos'
      FieldName = 'LastPostPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 200
    end
    object plEntriesppField202: TppField
      FieldAlias = 'LastRaceType'
      FieldName = 'LastRaceType'
      FieldLength = 6
      DisplayWidth = 6
      Position = 201
    end
    object plEntriesppField203: TppField
      FieldAlias = 'LastSurf'
      FieldName = 'LastSurf'
      FieldLength = 1
      DisplayWidth = 1
      Position = 202
    end
    object plEntriesppField204: TppField
      FieldAlias = 'LastRaceConditions'
      FieldName = 'LastRaceConditions'
      FieldLength = 20
      DisplayWidth = 20
      Position = 203
    end
    object plEntriesppField205: TppField
      FieldAlias = 'LastDistanceDesc'
      FieldName = 'LastDistanceDesc'
      FieldLength = 16
      DisplayWidth = 16
      Position = 204
    end
    object plEntriesppField206: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastDistance'
      FieldName = 'LastDistance'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 205
    end
    object plEntriesppField207: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastOdds'
      FieldName = 'LastOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 206
    end
    object plEntriesppField208: TppField
      FieldAlias = 'LastFavoriteIndicator'
      FieldName = 'LastFavoriteIndicator'
      FieldLength = 1
      DisplayWidth = 1
      Position = 207
    end
    object plEntriesppField209: TppField
      FieldAlias = 'LastDQIndicator'
      FieldName = 'LastDQIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 208
    end
    object plEntriesppField210: TppField
      FieldAlias = 'LastJockey'
      FieldName = 'LastJockey'
      FieldLength = 15
      DisplayWidth = 15
      Position = 209
    end
    object plEntriesppField211: TppField
      FieldAlias = 'LastComment'
      FieldName = 'LastComment'
      FieldLength = 100
      DisplayWidth = 100
      Position = 210
    end
    object plEntriesppField212: TppField
      FieldAlias = 'LastComment2'
      FieldName = 'LastComment2'
      FieldLength = 200
      DisplayWidth = 200
      Position = 211
    end
    object plEntriesppField213: TppField
      FieldAlias = 'LastTrkCond'
      FieldName = 'LastTrkCond'
      FieldLength = 3
      DisplayWidth = 3
      Position = 212
    end
    object plEntriesppField214: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastClmPrice'
      FieldName = 'LastClmPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 213
    end
    object plEntriesppField215: TppField
      FieldAlias = 'LastClaimed'
      FieldName = 'LastClaimed'
      FieldLength = 1
      DisplayWidth = 1
      Position = 214
    end
    object plEntriesppField216: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPurse'
      FieldName = 'LastPurse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 215
    end
    object plEntriesppField217: TppField
      FieldAlias = 'LastDay'
      FieldName = 'LastDay'
      FieldLength = 2
      DisplayWidth = 2
      Position = 216
    end
    object plEntriesppField218: TppField
      FieldAlias = 'LastMonthDesc'
      FieldName = 'LastMonthDesc'
      FieldLength = 3
      DisplayWidth = 3
      Position = 217
    end
    object plEntriesppField219: TppField
      FieldAlias = 'LastYear'
      FieldName = 'LastYear'
      FieldLength = 4
      DisplayWidth = 4
      Position = 218
    end
    object plEntriesppField220: TppField
      FieldAlias = 'LastGateBreak'
      FieldName = 'LastGateBreak'
      FieldLength = 2
      DisplayWidth = 2
      Position = 219
    end
    object plEntriesppField221: TppField
      FieldAlias = 'LastLen1Back'
      FieldName = 'LastLen1Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 220
    end
    object plEntriesppField222: TppField
      FieldAlias = 'LastLen2Back'
      FieldName = 'LastLen2Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 221
    end
    object plEntriesppField223: TppField
      FieldAlias = 'LastStLenBack'
      FieldName = 'LastStLenBack'
      FieldLength = 7
      DisplayWidth = 7
      Position = 222
    end
    object plEntriesppField224: TppField
      FieldAlias = 'LastFinishBeaten'
      FieldName = 'LastFinishBeaten'
      FieldLength = 7
      DisplayWidth = 7
      Position = 223
    end
    object plEntriesppField225: TppField
      FieldAlias = 'LastEquip'
      FieldName = 'LastEquip'
      FieldLength = 7
      DisplayWidth = 7
      Position = 224
    end
    object plEntriesppField226: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastWeight'
      FieldName = 'LastWeight'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 225
    end
    object plEntriesppField227: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastHorseTime'
      FieldName = 'LastHorseTime'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 226
    end
    object plEntriesppField228: TppField
      FieldAlias = 'LastRaceDesc'
      FieldName = 'LastRaceDesc'
      FieldLength = 150
      DisplayWidth = 150
      Position = 227
    end
    object plEntriesppField229: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1'
      FieldName = 'MorningLineTo1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 228
    end
    object plEntriesppField230: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1Rank'
      FieldName = 'MorningLineTo1Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 229
    end
    object plEntriesppField231: TppField
      FieldAlias = 'IsDirtToTurf'
      FieldName = 'IsDirtToTurf'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 230
    end
    object plEntriesppField232: TppField
      FieldAlias = 'IsTurfToDirt'
      FieldName = 'IsTurfToDirt'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 231
    end
    object plEntriesppField233: TppField
      FieldAlias = 'IsSprToRte'
      FieldName = 'IsSprToRte'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 232
    end
    object plEntriesppField234: TppField
      FieldAlias = 'IsRteToSpr'
      FieldName = 'IsRteToSpr'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 233
    end
    object plEntriesppField235: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeed'
      FieldName = 'LastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 234
    end
    object plEntriesppField236: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeedRank'
      FieldName = 'LastSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 235
    end
    object plEntriesppField237: TppField
      Alignment = taRightJustify
      FieldAlias = 'Power'
      FieldName = 'Power'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 236
    end
    object plEntriesppField238: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerRank'
      FieldName = 'PowerRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 237
    end
    object plEntriesppField239: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeed'
      FieldName = 'BackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 238
    end
    object plEntriesppField240: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeedRank'
      FieldName = 'BackSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 239
    end
    object plEntriesppField241: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClass'
      FieldName = 'AvgClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 240
    end
    object plEntriesppField242: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRank'
      FieldName = 'AvgClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 241
    end
    object plEntriesppField243: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeed'
      FieldName = 'AvgSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 242
    end
    object plEntriesppField244: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeedRank'
      FieldName = 'AvgSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 243
    end
    object plEntriesppField245: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRating'
      FieldName = 'AvgClassRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 244
    end
    object plEntriesppField246: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRatingRank'
      FieldName = 'AvgClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 245
    end
    object plEntriesppField247: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClass'
      FieldName = 'BackClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 246
    end
    object plEntriesppField248: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClassRank'
      FieldName = 'BackClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 247
    end
    object plEntriesppField249: TppField
      Alignment = taRightJustify
      FieldAlias = 'CurrClass'
      FieldName = 'CurrClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 248
    end
    object plEntriesppField250: TppField
      Alignment = taRightJustify
      FieldAlias = 'CurrClassRank'
      FieldName = 'CurrClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 249
    end
    object plEntriesppField251: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPace'
      FieldName = 'EarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 250
    end
    object plEntriesppField252: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceRank'
      FieldName = 'EarlyPaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 251
    end
    object plEntriesppField253: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePos'
      FieldName = 'EarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 252
    end
    object plEntriesppField254: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosRank'
      FieldName = 'EarlyPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 253
    end
    object plEntriesppField255: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePace'
      FieldName = 'MiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 254
    end
    object plEntriesppField256: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceRank'
      FieldName = 'MiddlePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 255
    end
    object plEntriesppField257: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePos'
      FieldName = 'MiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 256
    end
    object plEntriesppField258: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosRank'
      FieldName = 'MiddlePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 257
    end
    object plEntriesppField259: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePace'
      FieldName = 'LatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 258
    end
    object plEntriesppField260: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceRank'
      FieldName = 'LatePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 259
    end
    object plEntriesppField261: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePos'
      FieldName = 'LatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 260
    end
    object plEntriesppField262: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosRank'
      FieldName = 'LatePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 261
    end
    object plEntriesppField263: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePos'
      FieldName = 'FinishPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 262
    end
    object plEntriesppField264: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePosRank'
      FieldName = 'FinishPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 263
    end
    object plEntriesppField265: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantage'
      FieldName = 'EarlyPaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 264
    end
    object plEntriesppField266: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantage'
      FieldName = 'MiddlePaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 265
    end
    object plEntriesppField267: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceAdvantage'
      FieldName = 'LatePaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 266
    end
    object plEntriesppField268: TppField
      FieldAlias = 'IsClaimed1Back'
      FieldName = 'IsClaimed1Back'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 267
    end
    object plEntriesppField269: TppField
      FieldAlias = 'IsClaimed2Back'
      FieldName = 'IsClaimed2Back'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 268
    end
    object plEntriesppField270: TppField
      FieldAlias = 'IsLayoffAndUp'
      FieldName = 'IsLayoffAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 269
    end
    object plEntriesppField271: TppField
      FieldAlias = 'IsClaimedAndUp'
      FieldName = 'IsClaimedAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 270
    end
    object plEntriesppField272: TppField
      FieldAlias = 'IsClaimedAndDown'
      FieldName = 'IsClaimedAndDown'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 271
    end
    object plEntriesppField273: TppField
      FieldAlias = 'IsFirstTimeClaiming'
      FieldName = 'IsFirstTimeClaiming'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 272
    end
    object plEntriesppField274: TppField
      FieldAlias = 'IsBelowClaimedPrice'
      FieldName = 'IsBelowClaimedPrice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 273
    end
    object plEntriesppField275: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeStarts'
      FieldName = 'LifeStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 274
    end
    object plEntriesppField276: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeWins'
      FieldName = 'LifeWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 275
    end
    object plEntriesppField277: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifePlcs'
      FieldName = 'LifePlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 276
    end
    object plEntriesppField278: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeShos'
      FieldName = 'LifeShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 277
    end
    object plEntriesppField279: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeEarnings'
      FieldName = 'LifeEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 278
    end
    object plEntriesppField280: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeEPS'
      FieldName = 'LifeEPS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 279
    end
    object plEntriesppField281: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfStarts'
      FieldName = 'TurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 280
    end
    object plEntriesppField282: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfWins'
      FieldName = 'TurfWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 281
    end
    object plEntriesppField283: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfPlcs'
      FieldName = 'TurfPlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 282
    end
    object plEntriesppField284: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfShos'
      FieldName = 'TurfShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 283
    end
    object plEntriesppField285: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfEarnings'
      FieldName = 'TurfEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 284
    end
    object plEntriesppField286: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfEPS'
      FieldName = 'TurfEPS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 285
    end
    object plEntriesppField287: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudStarts'
      FieldName = 'MudStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 286
    end
    object plEntriesppField288: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudWins'
      FieldName = 'MudWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 287
    end
    object plEntriesppField289: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudPlcs'
      FieldName = 'MudPlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 288
    end
    object plEntriesppField290: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudShos'
      FieldName = 'MudShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 289
    end
    object plEntriesppField291: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudEarnings'
      FieldName = 'MudEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 290
    end
    object plEntriesppField292: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudEPS'
      FieldName = 'MudEPS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 291
    end
    object plEntriesppField293: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkStarts'
      FieldName = 'TrkStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 292
    end
    object plEntriesppField294: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkWins'
      FieldName = 'TrkWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 293
    end
    object plEntriesppField295: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkPlcs'
      FieldName = 'TrkPlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 294
    end
    object plEntriesppField296: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkShos'
      FieldName = 'TrkShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 295
    end
    object plEntriesppField297: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkEarnings'
      FieldName = 'TrkEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 296
    end
    object plEntriesppField298: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkEPS'
      FieldName = 'TrkEPS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 297
    end
    object plEntriesppField299: TppField
      Alignment = taRightJustify
      FieldAlias = 'RouteStarts'
      FieldName = 'RouteStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 298
    end
    object plEntriesppField300: TppField
      Alignment = taRightJustify
      FieldAlias = 'RouteWins'
      FieldName = 'RouteWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 299
    end
    object plEntriesppField301: TppField
      Alignment = taRightJustify
      FieldAlias = 'RoutePlcs'
      FieldName = 'RoutePlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 300
    end
    object plEntriesppField302: TppField
      Alignment = taRightJustify
      FieldAlias = 'RouteShos'
      FieldName = 'RouteShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 301
    end
    object plEntriesppField303: TppField
      Alignment = taRightJustify
      FieldAlias = 'SprintStarts'
      FieldName = 'SprintStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 302
    end
    object plEntriesppField304: TppField
      Alignment = taRightJustify
      FieldAlias = 'SprintWins'
      FieldName = 'SprintWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 303
    end
    object plEntriesppField305: TppField
      Alignment = taRightJustify
      FieldAlias = 'SprintPlcs'
      FieldName = 'SprintPlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 304
    end
    object plEntriesppField306: TppField
      Alignment = taRightJustify
      FieldAlias = 'SprintShos'
      FieldName = 'SprintShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 305
    end
    object plEntriesppField307: TppField
      FieldAlias = 'AngleDesc'
      FieldName = 'AngleDesc'
      FieldLength = 200
      DisplayWidth = 200
      Position = 306
    end
    object plEntriesppField308: TppField
      FieldAlias = 'IsWagerSheetSelected'
      FieldName = 'IsWagerSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 307
    end
    object plEntriesppField309: TppField
      FieldAlias = 'IsYouBetTrack'
      FieldName = 'IsYouBetTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 308
    end
    object plEntriesppField310: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 309
    end
    object plEntriesppField311: TppField
      Alignment = taRightJustify
      FieldAlias = 'HorseNbr'
      FieldName = 'HorseNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 310
    end
    object plEntriesppField312: TppField
      FieldAlias = 'WorkLine1'
      FieldName = 'WorkLine1'
      FieldLength = 250
      DisplayWidth = 250
      Position = 311
    end
    object plEntriesppField313: TppField
      FieldAlias = 'WorkLine2'
      FieldName = 'WorkLine2'
      FieldLength = 250
      DisplayWidth = 250
      Position = 312
    end
    object plEntriesppField314: TppField
      FieldAlias = 'IsFrontDoubleLiner'
      FieldName = 'IsFrontDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 313
    end
    object plEntriesppField315: TppField
      FieldAlias = 'IsBackDoubleLiner'
      FieldName = 'IsBackDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 314
    end
    object plEntriesppField316: TppField
      FieldAlias = 'IsTripleLiner'
      FieldName = 'IsTripleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 315
    end
    object plEntriesppField317: TppField
      FieldAlias = 'IsFrontDoubleDot'
      FieldName = 'IsFrontDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 316
    end
    object plEntriesppField318: TppField
      FieldAlias = 'IsBackDoubleDot'
      FieldName = 'IsBackDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 317
    end
    object plEntriesppField319: TppField
      FieldAlias = 'IsTripleDot'
      FieldName = 'IsTripleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 318
    end
    object plEntriesppField320: TppField
      FieldAlias = 'IsFrontDoubleLiner0'
      FieldName = 'IsFrontDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 319
    end
    object plEntriesppField321: TppField
      FieldAlias = 'IsBackDoubleLiner0'
      FieldName = 'IsBackDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 320
    end
    object plEntriesppField322: TppField
      FieldAlias = 'IsTripleLiner0'
      FieldName = 'IsTripleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 321
    end
    object plEntriesppField323: TppField
      FieldAlias = 'IsFrontDoubleLiner1'
      FieldName = 'IsFrontDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 322
    end
    object plEntriesppField324: TppField
      FieldAlias = 'IsBackDoubleLiner1'
      FieldName = 'IsBackDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 323
    end
    object plEntriesppField325: TppField
      FieldAlias = 'IsTripleLiner1'
      FieldName = 'IsTripleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 324
    end
    object plEntriesppField326: TppField
      FieldAlias = 'IsFrontDoubleLiner2'
      FieldName = 'IsFrontDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 325
    end
    object plEntriesppField327: TppField
      FieldAlias = 'IsBackDoubleLiner2'
      FieldName = 'IsBackDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 326
    end
    object plEntriesppField328: TppField
      FieldAlias = 'IsTripleLiner2'
      FieldName = 'IsTripleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 327
    end
    object plEntriesppField329: TppField
      FieldAlias = 'IsFrontDoubleLiner3'
      FieldName = 'IsFrontDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 328
    end
    object plEntriesppField330: TppField
      FieldAlias = 'IsBackDoubleLiner3'
      FieldName = 'IsBackDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 329
    end
    object plEntriesppField331: TppField
      FieldAlias = 'IsTripleLiner3'
      FieldName = 'IsTripleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 330
    end
    object plEntriesppField332: TppField
      FieldAlias = 'TodaysWagerOrderKey'
      FieldName = 'TodaysWagerOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 331
    end
    object plEntriesppField333: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerStarts'
      FieldName = 'TodaysWagerStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 332
    end
    object plEntriesppField334: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWins'
      FieldName = 'TodaysWagerWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 333
    end
    object plEntriesppField335: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWinPct'
      FieldName = 'TodaysWagerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 334
    end
    object plEntriesppField336: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWinPctRank'
      FieldName = 'TodaysWagerWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 335
    end
    object plEntriesppField337: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerAvgOdds'
      FieldName = 'TodaysWagerAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 336
    end
    object plEntriesppField338: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerMinOdds'
      FieldName = 'TodaysWagerMinOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 337
    end
    object plEntriesppField339: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerMaxOdds'
      FieldName = 'TodaysWagerMaxOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 338
    end
    object plEntriesppField340: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerAvgWinOdds'
      FieldName = 'TodaysWagerAvgWinOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 339
    end
    object plEntriesppField341: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerMinWinOdds'
      FieldName = 'TodaysWagerMinWinOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 340
    end
    object plEntriesppField342: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerMaxWinOdds'
      FieldName = 'TodaysWagerMaxWinOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 341
    end
    object plEntriesppField343: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerValueBet'
      FieldName = 'TodaysWagerValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 342
    end
    object plEntriesppField344: TppField
      FieldAlias = 'Last2TrkCode'
      FieldName = 'Last2TrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 343
    end
    object plEntriesppField345: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2RaceNbr'
      FieldName = 'Last2RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 344
    end
    object plEntriesppField346: TppField
      FieldAlias = 'Last2RaceDate'
      FieldName = 'Last2RaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 345
    end
    object plEntriesppField347: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2PostPos'
      FieldName = 'Last2PostPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 346
    end
    object plEntriesppField348: TppField
      FieldAlias = 'Last2RaceType'
      FieldName = 'Last2RaceType'
      FieldLength = 6
      DisplayWidth = 6
      Position = 347
    end
    object plEntriesppField349: TppField
      FieldAlias = 'Last2Surf'
      FieldName = 'Last2Surf'
      FieldLength = 1
      DisplayWidth = 1
      Position = 348
    end
    object plEntriesppField350: TppField
      FieldAlias = 'Last2RaceConditions'
      FieldName = 'Last2RaceConditions'
      FieldLength = 3
      DisplayWidth = 3
      Position = 349
    end
    object plEntriesppField351: TppField
      FieldAlias = 'Last2DistanceDesc'
      FieldName = 'Last2DistanceDesc'
      FieldLength = 16
      DisplayWidth = 16
      Position = 350
    end
    object plEntriesppField352: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Distance'
      FieldName = 'Last2Distance'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 351
    end
    object plEntriesppField353: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Odds'
      FieldName = 'Last2Odds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 352
    end
    object plEntriesppField354: TppField
      FieldAlias = 'Last2FavoriteIndicator'
      FieldName = 'Last2FavoriteIndicator'
      FieldLength = 1
      DisplayWidth = 1
      Position = 353
    end
    object plEntriesppField355: TppField
      FieldAlias = 'Last2DQIndicator'
      FieldName = 'Last2DQIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 354
    end
    object plEntriesppField356: TppField
      FieldAlias = 'Last2Jockey'
      FieldName = 'Last2Jockey'
      FieldLength = 15
      DisplayWidth = 15
      Position = 355
    end
    object plEntriesppField357: TppField
      FieldAlias = 'Last2Comment'
      FieldName = 'Last2Comment'
      FieldLength = 100
      DisplayWidth = 100
      Position = 356
    end
    object plEntriesppField358: TppField
      FieldAlias = 'Last2Comment2'
      FieldName = 'Last2Comment2'
      FieldLength = 200
      DisplayWidth = 200
      Position = 357
    end
    object plEntriesppField359: TppField
      FieldAlias = 'Last2TrkCond'
      FieldName = 'Last2TrkCond'
      FieldLength = 2
      DisplayWidth = 2
      Position = 358
    end
    object plEntriesppField360: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2ClmPrice'
      FieldName = 'Last2ClmPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 359
    end
    object plEntriesppField361: TppField
      FieldAlias = 'Last2Claimed'
      FieldName = 'Last2Claimed'
      FieldLength = 1
      DisplayWidth = 1
      Position = 360
    end
    object plEntriesppField362: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Purse'
      FieldName = 'Last2Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 361
    end
    object plEntriesppField363: TppField
      FieldAlias = 'Last2Day'
      FieldName = 'Last2Day'
      FieldLength = 2
      DisplayWidth = 2
      Position = 362
    end
    object plEntriesppField364: TppField
      FieldAlias = 'Last2MonthDesc'
      FieldName = 'Last2MonthDesc'
      FieldLength = 3
      DisplayWidth = 3
      Position = 363
    end
    object plEntriesppField365: TppField
      FieldAlias = 'Last2Year'
      FieldName = 'Last2Year'
      FieldLength = 4
      DisplayWidth = 4
      Position = 364
    end
    object plEntriesppField366: TppField
      FieldAlias = 'Last2GateBreak'
      FieldName = 'Last2GateBreak'
      FieldLength = 2
      DisplayWidth = 2
      Position = 365
    end
    object plEntriesppField367: TppField
      FieldAlias = 'Last2Len1Back'
      FieldName = 'Last2Len1Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 366
    end
    object plEntriesppField368: TppField
      FieldAlias = 'Last2Len2Back'
      FieldName = 'Last2Len2Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 367
    end
    object plEntriesppField369: TppField
      FieldAlias = 'Last2StLenBack'
      FieldName = 'Last2StLenBack'
      FieldLength = 7
      DisplayWidth = 7
      Position = 368
    end
    object plEntriesppField370: TppField
      FieldAlias = 'Last2FinishBeaten'
      FieldName = 'Last2FinishBeaten'
      FieldLength = 7
      DisplayWidth = 7
      Position = 369
    end
    object plEntriesppField371: TppField
      FieldAlias = 'Last2Equip'
      FieldName = 'Last2Equip'
      FieldLength = 2
      DisplayWidth = 2
      Position = 370
    end
    object plEntriesppField372: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Weight'
      FieldName = 'Last2Weight'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 371
    end
    object plEntriesppField373: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Speed'
      FieldName = 'Last2Speed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 372
    end
    object plEntriesppField374: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2HorseTime'
      FieldName = 'Last2HorseTime'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 373
    end
    object plEntriesppField375: TppField
      FieldAlias = 'Last2RaceDesc'
      FieldName = 'Last2RaceDesc'
      FieldLength = 150
      DisplayWidth = 150
      Position = 374
    end
    object plEntriesppField376: TppField
      FieldAlias = 'Last3TrkCode'
      FieldName = 'Last3TrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 375
    end
    object plEntriesppField377: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3RaceNbr'
      FieldName = 'Last3RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 376
    end
    object plEntriesppField378: TppField
      FieldAlias = 'Last3RaceDate'
      FieldName = 'Last3RaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 377
    end
    object plEntriesppField379: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3PostPos'
      FieldName = 'Last3PostPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 378
    end
    object plEntriesppField380: TppField
      FieldAlias = 'Last3RaceType'
      FieldName = 'Last3RaceType'
      FieldLength = 6
      DisplayWidth = 6
      Position = 379
    end
    object plEntriesppField381: TppField
      FieldAlias = 'Last3Surf'
      FieldName = 'Last3Surf'
      FieldLength = 1
      DisplayWidth = 1
      Position = 380
    end
    object plEntriesppField382: TppField
      FieldAlias = 'Last3RaceConditions'
      FieldName = 'Last3RaceConditions'
      FieldLength = 20
      DisplayWidth = 20
      Position = 381
    end
    object plEntriesppField383: TppField
      FieldAlias = 'Last3DistanceDesc'
      FieldName = 'Last3DistanceDesc'
      FieldLength = 16
      DisplayWidth = 16
      Position = 382
    end
    object plEntriesppField384: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Distance'
      FieldName = 'Last3Distance'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 383
    end
    object plEntriesppField385: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Odds'
      FieldName = 'Last3Odds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 384
    end
    object plEntriesppField386: TppField
      FieldAlias = 'Last3FavoriteIndicator'
      FieldName = 'Last3FavoriteIndicator'
      FieldLength = 1
      DisplayWidth = 1
      Position = 385
    end
    object plEntriesppField387: TppField
      FieldAlias = 'Last3DQIndicator'
      FieldName = 'Last3DQIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 386
    end
    object plEntriesppField388: TppField
      FieldAlias = 'Last3Jockey'
      FieldName = 'Last3Jockey'
      FieldLength = 15
      DisplayWidth = 15
      Position = 387
    end
    object plEntriesppField389: TppField
      FieldAlias = 'Last3Comment'
      FieldName = 'Last3Comment'
      FieldLength = 100
      DisplayWidth = 100
      Position = 388
    end
    object plEntriesppField390: TppField
      FieldAlias = 'Last3Comment2'
      FieldName = 'Last3Comment2'
      FieldLength = 200
      DisplayWidth = 200
      Position = 389
    end
    object plEntriesppField391: TppField
      FieldAlias = 'Last3TrkCond'
      FieldName = 'Last3TrkCond'
      FieldLength = 2
      DisplayWidth = 2
      Position = 390
    end
    object plEntriesppField392: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3ClmPrice'
      FieldName = 'Last3ClmPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 391
    end
    object plEntriesppField393: TppField
      FieldAlias = 'Last3Claimed'
      FieldName = 'Last3Claimed'
      FieldLength = 1
      DisplayWidth = 1
      Position = 392
    end
    object plEntriesppField394: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Purse'
      FieldName = 'Last3Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 393
    end
    object plEntriesppField395: TppField
      FieldAlias = 'Last3Day'
      FieldName = 'Last3Day'
      FieldLength = 2
      DisplayWidth = 2
      Position = 394
    end
    object plEntriesppField396: TppField
      FieldAlias = 'Last3MonthDesc'
      FieldName = 'Last3MonthDesc'
      FieldLength = 3
      DisplayWidth = 3
      Position = 395
    end
    object plEntriesppField397: TppField
      FieldAlias = 'Last3Year'
      FieldName = 'Last3Year'
      FieldLength = 4
      DisplayWidth = 4
      Position = 396
    end
    object plEntriesppField398: TppField
      FieldAlias = 'Last3GateBreak'
      FieldName = 'Last3GateBreak'
      FieldLength = 2
      DisplayWidth = 2
      Position = 397
    end
    object plEntriesppField399: TppField
      FieldAlias = 'Last3Len1Back'
      FieldName = 'Last3Len1Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 398
    end
    object plEntriesppField400: TppField
      FieldAlias = 'Last3Len2Back'
      FieldName = 'Last3Len2Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 399
    end
    object plEntriesppField401: TppField
      FieldAlias = 'Last3StLenBack'
      FieldName = 'Last3StLenBack'
      FieldLength = 7
      DisplayWidth = 7
      Position = 400
    end
    object plEntriesppField402: TppField
      FieldAlias = 'Last3FinishBeaten'
      FieldName = 'Last3FinishBeaten'
      FieldLength = 7
      DisplayWidth = 7
      Position = 401
    end
    object plEntriesppField403: TppField
      FieldAlias = 'Last3Equip'
      FieldName = 'Last3Equip'
      FieldLength = 7
      DisplayWidth = 7
      Position = 402
    end
    object plEntriesppField404: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Weight'
      FieldName = 'Last3Weight'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 403
    end
    object plEntriesppField405: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Speed'
      FieldName = 'Last3Speed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 404
    end
    object plEntriesppField406: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3HorseTime'
      FieldName = 'Last3HorseTime'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 405
    end
    object plEntriesppField407: TppField
      FieldAlias = 'Last3RaceDesc'
      FieldName = 'Last3RaceDesc'
      FieldLength = 150
      DisplayWidth = 150
      Position = 406
    end
    object plEntriesppField408: TppField
      Alignment = taRightJustify
      FieldAlias = 'Odds'
      FieldName = 'Odds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 407
    end
    object plEntriesppField409: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPos'
      FieldName = 'FinishPos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 408
    end
    object plEntriesppField410: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP1stCall'
      FieldName = 'QSP1stCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 409
    end
    object plEntriesppField411: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP1stCallRank'
      FieldName = 'QSP1stCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 410
    end
    object plEntriesppField412: TppField
      FieldAlias = 'QSP1stCallRunStyle'
      FieldName = 'QSP1stCallRunStyle'
      FieldLength = 2
      DisplayWidth = 2
      Position = 411
    end
    object plEntriesppField413: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP2ndCall'
      FieldName = 'QSP2ndCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 412
    end
    object plEntriesppField414: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP2ndCallRank'
      FieldName = 'QSP2ndCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 413
    end
    object plEntriesppField415: TppField
      FieldAlias = 'QSP2ndCallRunStyle'
      FieldName = 'QSP2ndCallRunStyle'
      FieldLength = 2
      DisplayWidth = 2
      Position = 414
    end
    object plEntriesppField416: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP1stCall'
      FieldName = 'KSP1stCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 415
    end
    object plEntriesppField417: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP1stCallRank'
      FieldName = 'KSP1stCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 416
    end
    object plEntriesppField418: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP2ndCall'
      FieldName = 'KSP2ndCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 417
    end
    object plEntriesppField419: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP2ndCallRank'
      FieldName = 'KSP2ndCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 418
    end
    object plEntriesppField420: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPos1stCall'
      FieldName = 'LastPos1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 419
    end
    object plEntriesppField421: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPos2ndCall'
      FieldName = 'LastPos2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 420
    end
    object plEntriesppField422: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPosStrCall'
      FieldName = 'LastPosStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 421
    end
    object plEntriesppField423: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Pos1stCall'
      FieldName = 'Last2Pos1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 422
    end
    object plEntriesppField424: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Pos2ndCall'
      FieldName = 'Last2Pos2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 423
    end
    object plEntriesppField425: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2PosStrCall'
      FieldName = 'Last2PosStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 424
    end
    object plEntriesppField426: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Pos1stCall'
      FieldName = 'Last3Pos1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 425
    end
    object plEntriesppField427: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Pos2ndCall'
      FieldName = 'Last3Pos2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 426
    end
    object plEntriesppField428: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3PosStrCall'
      FieldName = 'Last3PosStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 427
    end
    object plEntriesppField429: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastTime1stCall'
      FieldName = 'LastTime1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 428
    end
    object plEntriesppField430: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastTime2ndCall'
      FieldName = 'LastTime2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 429
    end
    object plEntriesppField431: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastTimeStrCall'
      FieldName = 'LastTimeStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 430
    end
    object plEntriesppField432: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastTimeFinCall'
      FieldName = 'LastTimeFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 431
    end
    object plEntriesppField433: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Time1stCall'
      FieldName = 'Last2Time1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 432
    end
    object plEntriesppField434: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2Time2ndCall'
      FieldName = 'Last2Time2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 433
    end
    object plEntriesppField435: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2TimeStrCall'
      FieldName = 'Last2TimeStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 434
    end
    object plEntriesppField436: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2TimeFinCall'
      FieldName = 'Last2TimeFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 435
    end
    object plEntriesppField437: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Time1stCall'
      FieldName = 'Last3Time1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 436
    end
    object plEntriesppField438: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3Time2ndCall'
      FieldName = 'Last3Time2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 437
    end
    object plEntriesppField439: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3TimeStrCall'
      FieldName = 'Last3TimeStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 438
    end
    object plEntriesppField440: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3TimeFinCall'
      FieldName = 'Last3TimeFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 439
    end
    object plEntriesppField441: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastBL1stCall'
      FieldName = 'LastBL1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 440
    end
    object plEntriesppField442: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastBL2ndCall'
      FieldName = 'LastBL2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 441
    end
    object plEntriesppField443: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastBLStrCall'
      FieldName = 'LastBLStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 442
    end
    object plEntriesppField444: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastBLFinCall'
      FieldName = 'LastBLFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 443
    end
    object plEntriesppField445: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2BL1stCall'
      FieldName = 'Last2BL1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 444
    end
    object plEntriesppField446: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2BL2ndCall'
      FieldName = 'Last2BL2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 445
    end
    object plEntriesppField447: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2BLStrCall'
      FieldName = 'Last2BLStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 446
    end
    object plEntriesppField448: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2BLFinCall'
      FieldName = 'Last2BLFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 447
    end
    object plEntriesppField449: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3BL1stCall'
      FieldName = 'Last3BL1stCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 448
    end
    object plEntriesppField450: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3BL2ndCall'
      FieldName = 'Last3BL2ndCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 449
    end
    object plEntriesppField451: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3BLStrCall'
      FieldName = 'Last3BLStrCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 450
    end
    object plEntriesppField452: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3BLFinCall'
      FieldName = 'Last3BLFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 451
    end
    object plEntriesppField453: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPosFinCall'
      FieldName = 'LastPosFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 452
    end
    object plEntriesppField454: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last2PosFinCall'
      FieldName = 'Last2PosFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 453
    end
    object plEntriesppField455: TppField
      Alignment = taRightJustify
      FieldAlias = 'Last3PosFinCall'
      FieldName = 'Last3PosFinCall'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 454
    end
    object plEntriesppField456: TppField
      FieldAlias = 'Is1stClaiming'
      FieldName = 'Is1stClaiming'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 455
    end
    object plEntriesppField457: TppField
      FieldAlias = 'Is1stMCL'
      FieldName = 'Is1stMCL'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 456
    end
    object plEntriesppField458: TppField
      FieldAlias = 'Is1stAfterLayoff'
      FieldName = 'Is1stAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 457
    end
    object plEntriesppField459: TppField
      FieldAlias = 'Is2ndAfterLayoff'
      FieldName = 'Is2ndAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 458
    end
    object plEntriesppField460: TppField
      FieldAlias = 'Is3rdAfterLayoff'
      FieldName = 'Is3rdAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 459
    end
    object plEntriesppField461: TppField
      FieldAlias = 'IsDirtToTurfToDirtAfterLayoff'
      FieldName = 'IsDirtToTurfToDirtAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 460
    end
    object plEntriesppField462: TppField
      FieldAlias = 'IsTurfToDirtToTurfAfterLayoff'
      FieldName = 'IsTurfToDirtToTurfAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 461
    end
    object plEntriesppField463: TppField
      FieldAlias = 'IsRouteToSprintToRouteAfterLayoff'
      FieldName = 'IsRouteToSprintToRouteAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 462
    end
    object plEntriesppField464: TppField
      FieldAlias = 'IsSprintToRouteToSprintAfterLayoff'
      FieldName = 'IsSprintToRouteToSprintAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 463
    end
    object plEntriesppField465: TppField
      FieldAlias = 'Is2yoBred'
      FieldName = 'Is2yoBred'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 464
    end
    object plEntriesppField466: TppField
      FieldAlias = 'Is1stBred'
      FieldName = 'Is1stBred'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 465
    end
    object plEntriesppField467: TppField
      FieldAlias = 'IsTurfBred'
      FieldName = 'IsTurfBred'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 466
    end
    object plEntriesppField468: TppField
      FieldAlias = 'Is1stOffLayoff'
      FieldName = 'Is1stOffLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 467
    end
    object plEntriesppField469: TppField
      FieldAlias = 'Is2ndOffLayoff'
      FieldName = 'Is2ndOffLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 468
    end
    object plEntriesppField470: TppField
      FieldAlias = 'Is3rdOffLayoff'
      FieldName = 'Is3rdOffLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 469
    end
    object plEntriesppField471: TppField
      FieldAlias = 'StandingIn'
      FieldName = 'StandingIn'
      FieldLength = 5
      DisplayWidth = 5
      Position = 470
    end
    object plEntriesppField472: TppField
      Alignment = taRightJustify
      FieldAlias = 'StandingInRank'
      FieldName = 'StandingInRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 471
    end
    object plEntriesppField473: TppField
      FieldAlias = 'IsOnStandingInList'
      FieldName = 'IsOnStandingInList'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 472
    end
    object plEntriesppField474: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValueROI'
      FieldName = 'ValueROI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 473
    end
    object plEntriesppField475: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValueROICnt'
      FieldName = 'ValueROICnt'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 474
    end
    object plEntriesppField476: TppField
      FieldAlias = 'ValueDesc'
      FieldName = 'ValueDesc'
      FieldLength = 255
      DisplayWidth = 255
      Position = 475
    end
    object plEntriesppField477: TppField
      Alignment = taRightJustify
      FieldAlias = 'DollarCnt'
      FieldName = 'DollarCnt'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 476
    end
    object plEntriesppField478: TppField
      FieldAlias = 'ListType'
      FieldName = 'ListType'
      FieldLength = 1
      DisplayWidth = 1
      Position = 477
    end
    object plEntriesppField479: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerAdvantage'
      FieldName = 'PowerAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 478
    end
    object plEntriesppField480: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerAdvantageKey'
      FieldName = 'PowerAdvantageKey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 479
    end
    object plEntriesppField481: TppField
      Alignment = taRightJustify
      FieldAlias = 'PostPosWinPct'
      FieldName = 'PostPosWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 480
    end
    object plEntriesppField482: TppField
      Alignment = taRightJustify
      FieldAlias = 'PostPosStarts'
      FieldName = 'PostPosStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 481
    end
    object plEntriesppField483: TppField
      Alignment = taRightJustify
      FieldAlias = 'PostPosWinPctRank'
      FieldName = 'PostPosWinPctRank'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 482
    end
    object plEntriesppField484: TppField
      Alignment = taRightJustify
      FieldAlias = 'PaceIndicatorWinPct'
      FieldName = 'PaceIndicatorWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 483
    end
    object plEntriesppField485: TppField
      Alignment = taRightJustify
      FieldAlias = 'PaceIndicatorWinPctRank'
      FieldName = 'PaceIndicatorWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 484
    end
    object plEntriesppField486: TppField
      Alignment = taRightJustify
      FieldAlias = 'ElimWinPct'
      FieldName = 'ElimWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 485
    end
    object plEntriesppField487: TppField
      Alignment = taRightJustify
      FieldAlias = 'Elim2WinPct'
      FieldName = 'Elim2WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 486
    end
    object plEntriesppField488: TppField
      FieldAlias = 'TodaysWagerOddsDesc'
      FieldName = 'TodaysWagerOddsDesc'
      FieldLength = 10
      DisplayWidth = 10
      Position = 487
    end
    object plEntriesppField489: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerAdvantageWinPct'
      FieldName = 'PowerAdvantageWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 488
    end
    object plEntriesppField490: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantageWinPct'
      FieldName = 'EarlyPaceAdvantageWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 489
    end
    object plEntriesppField491: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantageWinPctRank'
      FieldName = 'EarlyPaceAdvantageWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 490
    end
    object plEntriesppField492: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantageValueBet'
      FieldName = 'EarlyPaceAdvantageValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 491
    end
    object plEntriesppField493: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantageWinPct'
      FieldName = 'MiddlePaceAdvantageWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 492
    end
    object plEntriesppField494: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantageWinPctRank'
      FieldName = 'MiddlePaceAdvantageWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 493
    end
    object plEntriesppField495: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantageValueBet'
      FieldName = 'MiddlePaceAdvantageValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 494
    end
    object plEntriesppField496: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceAdvantageWinPct'
      FieldName = 'LatePaceAdvantageWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 495
    end
    object plEntriesppField497: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceAdvantageWinPctRank'
      FieldName = 'LatePaceAdvantageWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 496
    end
    object plEntriesppField498: TppField
      FieldAlias = 'IsHeavyChalk'
      FieldName = 'IsHeavyChalk'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 497
    end
    object plEntriesppField499: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineWinPct'
      FieldName = 'MorningLineWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 498
    end
    object plEntriesppField500: TppField
      FieldAlias = 'IsEliminated'
      FieldName = 'IsEliminated'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 499
    end
    object plEntriesppField501: TppField
      FieldAlias = 'IsValueDebutSelected'
      FieldName = 'IsValueDebutSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 500
    end
    object plEntriesppField502: TppField
      FieldAlias = 'IsValueDebutTwoSelected'
      FieldName = 'IsValueDebutTwoSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 501
    end
    object plEntriesppField503: TppField
      FieldAlias = 'IsValueWagerSelected'
      FieldName = 'IsValueWagerSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 502
    end
    object plEntriesppField504: TppField
      FieldAlias = 'IsPTCTrack'
      FieldName = 'IsPTCTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 503
    end
    object plEntriesppField505: TppField
      FieldAlias = 'IsTwinSpiresTrack'
      FieldName = 'IsTwinSpiresTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 504
    end
    object plEntriesppField506: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysAltWagerWinPct'
      FieldName = 'TodaysAltWagerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 505
    end
    object plEntriesppField507: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysAltWagerWinPctRank'
      FieldName = 'TodaysAltWagerWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 506
    end
    object plEntriesppField508: TppField
      Alignment = taRightJustify
      FieldAlias = 'SelectorChoice'
      FieldName = 'SelectorChoice'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 507
    end
    object plEntriesppField509: TppField
      FieldAlias = 'IsSpeedSheetSelected'
      FieldName = 'IsSpeedSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 508
    end
    object plEntriesppField510: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassRating'
      FieldName = 'ClassRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 509
    end
    object plEntriesppField511: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassRatingRank'
      FieldName = 'ClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 510
    end
    object plEntriesppField512: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRating'
      FieldName = 'TurfRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 511
    end
    object plEntriesppField513: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRatingRank'
      FieldName = 'TurfRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 512
    end
    object plEntriesppField514: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRating'
      FieldName = 'MudRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 513
    end
    object plEntriesppField515: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRatingRank'
      FieldName = 'MudRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 514
    end
    object plEntriesppField516: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceRating'
      FieldName = 'DistanceRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 515
    end
    object plEntriesppField517: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceRatingRank'
      FieldName = 'DistanceRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 516
    end
    object plEntriesppField518: TppField
      Alignment = taRightJustify
      FieldAlias = 'AWRating'
      FieldName = 'AWRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 517
    end
    object plEntriesppField519: TppField
      Alignment = taRightJustify
      FieldAlias = 'AWRatingRank'
      FieldName = 'AWRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 518
    end
    object plEntriesppField520: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireClassRating'
      FieldName = 'SireClassRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 519
    end
    object plEntriesppField521: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireClassRatingRank'
      FieldName = 'SireClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 520
    end
    object plEntriesppField522: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireClassRating'
      FieldName = 'DamSireClassRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 521
    end
    object plEntriesppField523: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireClassRatingRank'
      FieldName = 'DamSireClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 522
    end
    object plEntriesppField524: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfRating'
      FieldName = 'SireTurfRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 523
    end
    object plEntriesppField525: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireTurfRatingRank'
      FieldName = 'SireTurfRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 524
    end
    object plEntriesppField526: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfRating'
      FieldName = 'DamSireTurfRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 525
    end
    object plEntriesppField527: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireTurfRatingRank'
      FieldName = 'DamSireTurfRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 526
    end
    object plEntriesppField528: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireMudRatingRank'
      FieldName = 'SireMudRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 527
    end
    object plEntriesppField529: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireMudRating'
      FieldName = 'SireMudRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 528
    end
    object plEntriesppField530: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireMudRating'
      FieldName = 'DamSireMudRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 529
    end
    object plEntriesppField531: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireMudRatingRank'
      FieldName = 'DamSireMudRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 530
    end
    object plEntriesppField532: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireSprintRating'
      FieldName = 'SireSprintRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 531
    end
    object plEntriesppField533: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireSprintRatingRank'
      FieldName = 'SireSprintRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 532
    end
    object plEntriesppField534: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireSprintRating'
      FieldName = 'DamSireSprintRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 533
    end
    object plEntriesppField535: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireSprintRatingRank'
      FieldName = 'DamSireSprintRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 534
    end
    object plEntriesppField536: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireRouteRating'
      FieldName = 'SireRouteRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 535
    end
    object plEntriesppField537: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireRouteRatingRank'
      FieldName = 'SireRouteRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 536
    end
    object plEntriesppField538: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireRouteRating'
      FieldName = 'DamSireRouteRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 537
    end
    object plEntriesppField539: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireRouteRatingRank'
      FieldName = 'DamSireRouteRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 538
    end
    object plEntriesppField540: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAWRating'
      FieldName = 'SireAWRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 539
    end
    object plEntriesppField541: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAWRatingRank'
      FieldName = 'SireAWRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 540
    end
    object plEntriesppField542: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAWRating'
      FieldName = 'DamSireAWRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 541
    end
    object plEntriesppField543: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAWRatingRank'
      FieldName = 'DamSireAWRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 542
    end
    object plEntriesppField544: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerRating'
      FieldName = 'TrainerRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 543
    end
    object plEntriesppField545: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerRatingRank'
      FieldName = 'TrainerRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 544
    end
    object plEntriesppField546: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerOwnerRating'
      FieldName = 'TrainerOwnerRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 545
    end
    object plEntriesppField547: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerOwnerRatingRank'
      FieldName = 'TrainerOwnerRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 546
    end
    object plEntriesppField548: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerJockeyRating'
      FieldName = 'TrainerJockeyRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 547
    end
    object plEntriesppField549: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerJockeyRatingRank'
      FieldName = 'TrainerJockeyRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 548
    end
    object plEntriesppField550: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerTrackRating'
      FieldName = 'TrainerTrackRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 549
    end
    object plEntriesppField551: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrainerTrackRatingRank'
      FieldName = 'TrainerTrackRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 550
    end
    object plEntriesppField552: TppField
      Alignment = taRightJustify
      FieldAlias = 'JockeyRating'
      FieldName = 'JockeyRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 551
    end
    object plEntriesppField553: TppField
      Alignment = taRightJustify
      FieldAlias = 'JockeyRatingRank'
      FieldName = 'JockeyRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 552
    end
    object plEntriesppField554: TppField
      Alignment = taRightJustify
      FieldAlias = 'JockeyOwnerRating'
      FieldName = 'JockeyOwnerRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 553
    end
    object plEntriesppField555: TppField
      Alignment = taRightJustify
      FieldAlias = 'JockeyOwnerRatingRank'
      FieldName = 'JockeyOwnerRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 554
    end
    object plEntriesppField556: TppField
      Alignment = taRightJustify
      FieldAlias = 'JockeyTrackRating'
      FieldName = 'JockeyTrackRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 555
    end
    object plEntriesppField557: TppField
      Alignment = taRightJustify
      FieldAlias = 'JockeyTrackRatingRank'
      FieldName = 'JockeyTrackRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 556
    end
    object plEntriesppField558: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnerRating'
      FieldName = 'OwnerRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 557
    end
    object plEntriesppField559: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnerRatingRank'
      FieldName = 'OwnerRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 558
    end
    object plEntriesppField560: TppField
      FieldAlias = 'TurfOrder'
      FieldName = 'TurfOrder'
      FieldLength = 25
      DisplayWidth = 25
      Position = 559
    end
    object plEntriesppField561: TppField
      FieldAlias = 'MaidenOrder'
      FieldName = 'MaidenOrder'
      FieldLength = 25
      DisplayWidth = 25
      Position = 560
    end
    object plEntriesppField562: TppField
      FieldAlias = 'MudOrder'
      FieldName = 'MudOrder'
      FieldLength = 25
      DisplayWidth = 25
      Position = 561
    end
    object plEntriesppField563: TppField
      FieldAlias = 'AWOrder'
      FieldName = 'AWOrder'
      FieldLength = 25
      DisplayWidth = 25
      Position = 562
    end
    object plEntriesppField564: TppField
      FieldAlias = 'DistanceOrder'
      FieldName = 'DistanceOrder'
      FieldLength = 25
      DisplayWidth = 25
      Position = 563
    end
    object plEntriesppField565: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalOrderWinPct'
      FieldName = 'FinalOrderWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 564
    end
    object plEntriesppField566: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalOrderWinPctRank'
      FieldName = 'FinalOrderWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 565
    end
    object plEntriesppField567: TppField
      FieldAlias = 'FinalOrderKey'
      FieldName = 'FinalOrderKey'
      FieldLength = 25
      DisplayWidth = 25
      Position = 566
    end
    object plEntriesppField568: TppField
      FieldAlias = 'IsTrainerSheetSelected'
      FieldName = 'IsTrainerSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 567
    end
    object plEntriesppField569: TppField
      Alignment = taRightJustify
      FieldAlias = 'TCPlusMinus'
      FieldName = 'TCPlusMinus'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 568
    end
    object plEntriesppField570: TppField
      Alignment = taRightJustify
      FieldAlias = 'TJMeetWinPct'
      FieldName = 'TJMeetWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 569
    end
    object plEntriesppField571: TppField
      Alignment = taRightJustify
      FieldAlias = 'TJ365WinPct'
      FieldName = 'TJ365WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 570
    end
    object plEntriesppField572: TppField
      FieldAlias = 'PacificTime'
      FieldName = 'PacificTime'
      FieldLength = 20
      DisplayWidth = 20
      Position = 571
    end
  end
  object ppTipSheetReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
    PrinterSetup.PrinterName = 'Dell Laser Printer 1700n'
    PrinterSetup.mmMarginBottom = 23
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\Ratings31\ValueSheet.rtm'
    Template.Format = ftASCII
    Units = utPrinterPixels
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'PDFFile'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 280
    Top = 8
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 20320
      mmPrintPosition = 53
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'LatePaceSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 193252
        mmTop = 1058
        mmWidth = 7535
        BandType = 4
      end
      object lblErlPace: TppLabel
        UserName = 'lblPowerOrder2'
        AutoSize = False
        Caption = 'Early:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 128694
        mmTop = 1058
        mmWidth = 5927
        BandType = 4
      end
      object ErlPaceSheetOrder: TppDBText
        UserName = 'ErlPaceSheetOrder'
        AutoSize = True
        DataField = 'ErlPaceSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 137160
        mmTop = 1058
        mmWidth = 7535
        BandType = 4
      end
      object lblMidPace: TppLabel
        UserName = 'lblMidPace'
        Caption = 'Mid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 157269
        mmTop = 1058
        mmWidth = 4784
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'MidPaceSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 164465
        mmTop = 1058
        mmWidth = 7535
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label3'
        Caption = 'Late:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 184785
        mmTop = 1058
        mmWidth = 5588
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Power:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 97579
        mmTop = 1058
        mmWidth = 7832
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RaceNbr'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 12912
        mmTop = 847
        mmWidth = 1439
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'Surface'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 17780
        mmTop = 847
        mmWidth = 1863
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DistanceDesc'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 22648
        mmTop = 847
        mmWidth = 3768
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.200000047683716000
        mmHeight = 212
        mmLeft = 0
        mmTop = 0
        mmWidth = 215900
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'RaceDesc'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 22648
        mmTop = 5927
        mmWidth = 11853
        BandType = 4
      end
      object txtDebut: TppDBText
        UserName = 'txtDebut'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NbrDebutStarters'
        DataPipeline = plRacesReport
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Visible = False
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 67987
        mmTop = 5715
        mmWidth = 18161
        BandType = 4
      end
      object txtDebutTurf: TppDBText
        UserName = 'txtDebutTurf'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NbrTurfDebutStarters'
        DataPipeline = plRacesReport
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Visible = False
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 75692
        mmTop = 5715
        mmWidth = 22310
        BandType = 4
      end
      object txtSts: TppDBText
        UserName = 'txtSts'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NbrStarters'
        DataPipeline = plRacesReport
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 72348
        mmTop = 5715
        mmWidth = 1312
        BandType = 4
      end
      object Starters: TppLabel
        UserName = 'Starters'
        Caption = 'Starters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 57785
        mmTop = 5715
        mmWidth = 8890
        BandType = 4
      end
      object lblDebut: TppLabel
        UserName = 'lblDebut'
        Caption = 'Debut'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Visible = False
        mmHeight = 3387
        mmLeft = 74718
        mmTop = 5715
        mmWidth = 6350
        BandType = 4
      end
      object lblDebutTurf: TppLabel
        UserName = 'lblDebutTurf'
        Caption = 'Turf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Visible = False
        mmHeight = 3387
        mmLeft = 86995
        mmTop = 5715
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'WagerSheetOrder2'
        AutoSize = True
        DataField = 'PowerGapOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 107315
        mmTop = 5080
        mmWidth = 14563
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ErlPaceSheetOrder1'
        AutoSize = True
        DataField = 'ErlPaceGapOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 137160
        mmTop = 5080
        mmWidth = 14563
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'MidPaceGapOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 164465
        mmTop = 5080
        mmWidth = 14563
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'LatePaceGapOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 193252
        mmTop = 5080
        mmWidth = 14563
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label5'
        Caption = 'R#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 8890
        mmTop = 847
        mmWidth = 3387
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Gap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        mmHeight = 2752
        mmLeft = 101600
        mmTop = 5292
        mmWidth = 3810
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Gap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        mmHeight = 2752
        mmLeft = 130810
        mmTop = 5292
        mmWidth = 3810
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'Gap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        mmHeight = 2752
        mmLeft = 158327
        mmTop = 5292
        mmWidth = 3810
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label6'
        Caption = 'Gap'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        mmHeight = 2752
        mmLeft = 186479
        mmTop = 5292
        mmWidth = 3810
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'TrkCode'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 1693
        mmTop = 847
        mmWidth = 5207
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'txtDebut1'
        AutoSize = True
        DataField = 'BetLine'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 423
        mmTop = 16298
        mmWidth = 99949
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'EstTimeOfRace'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 1905
        mmTop = 5927
        mmWidth = 15071
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Starters1'
        Caption = '1st'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 4826
        mmLeft = 2328
        mmTop = 11007
        mmWidth = 7620
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = '3rd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 4868
        mmLeft = 51012
        mmTop = 11007
        mmWidth = 7620
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = '2nd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 4868
        mmLeft = 26670
        mmTop = 11007
        mmWidth = 7620
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Hospital'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 57362
        mmTop = 423
        mmWidth = 9229
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'WagerSheetOrder1'
        AutoSize = True
        DataField = 'TodaysWagerOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 69850
        mmTop = 423
        mmWidth = 11684
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'WagerSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3387
        mmLeft = 107315
        mmTop = 1058
        mmWidth = 20955
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Early Pos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 121920
        mmTop = 8678
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Avg Pos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        mmHeight = 2836
        mmLeft = 126577
        mmTop = 12912
        mmWidth = 8001
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'ErlPacePosGapOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 137160
        mmTop = 12700
        mmWidth = 12531
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ErlPaceSheetOrder2'
        AutoSize = True
        DataField = 'ErlPacePosSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 137160
        mmTop = 8678
        mmWidth = 7535
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'lblMidPace1'
        Caption = 'Mid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 157269
        mmTop = 8678
        mmWidth = 4868
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Avg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        mmHeight = 2752
        mmLeft = 158327
        mmTop = 12912
        mmWidth = 3810
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        AutoSize = True
        DataField = 'MidPacePosGapOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 164465
        mmTop = 12700
        mmWidth = 12531
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'MidPacePosSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 164465
        mmTop = 8678
        mmWidth = 7535
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Late:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 184785
        mmTop = 8678
        mmWidth = 5503
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Avg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        mmHeight = 2752
        mmLeft = 186479
        mmTop = 12912
        mmWidth = 3810
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'LatePacePosGapOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 193252
        mmTop = 12700
        mmWidth = 12531
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'LatePacePosSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 193252
        mmTop = 8678
        mmWidth = 7535
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label7'
        Caption = '4th'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = [fsBold]
        mmHeight = 4868
        mmLeft = 75353
        mmTop = 11007
        mmWidth = 7620
        BandType = 4
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TrkCode'
      DataPipeline = plRacesReport
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plRacesReport'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 3810
        mmPrintPosition = 0
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          AutoSize = True
          DataField = 'TrkCode'
          DataPipeline = plRacesReport
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Narrow'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plRacesReport'
          mmHeight = 3725
          mmLeft = 83185
          mmTop = 0
          mmWidth = 5207
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          AutoSize = True
          DataField = 'RaceDate'
          DataPipeline = plRacesReport
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Narrow'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plRacesReport'
          mmHeight = 3725
          mmLeft = 103294
          mmTop = 0
          mmWidth = 12954
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650613
        7478744465627574547572664F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F7572636506D970726F6365647572652074
        78744465627574547572664F6E5072696E743B0D0A626567696E0D0A69662028
        706C52616365735265706F72745B2753757266616365275D203D202754272920
        2020202020207468656E20626567696E0D0A2020202020202074787444656275
        74547572662E56697369626C65203A3D20547275653B0D0A20202020656E6420
        656C736520626567696E0D0A202020202020207478744465627574547572662E
        56697369626C65203A3D2046616C73653B2020200D0A0D0A20202020656E643B
        0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C7478
        74446562757454757266094576656E744E616D6506074F6E5072696E74074576
        656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D6506136C626C4465627574547572664F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506D870726F
        636564757265206C626C4465627574547572664F6E5072696E743B0D0A626567
        696E0D0A2069662028706C52616365735265706F72745B275375726661636527
        5D203D2027542729202020202020207468656E20626567696E0D0A2020202020
        20206C626C4465627574547572662E56697369626C65203A3D20547275653B0D
        0A20202020656E6420656C736520626567696E0D0A202020202020206C626C44
        65627574547572662E56697369626C65203A3D2046616C73653B2020200D0A0D
        0A20202020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060C6C626C446562757454757266094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060F6C626C44656275744F6E5072696E740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506F5
        70726F636564757265206C626C44656275744F6E5072696E743B0D0A62656769
        6E0D0A0D0A69662028706C52616365735265706F72745B275261636554797065
        275D203D20274D5357272920206F720D0A20202020202028706C526163657352
        65706F72745B275261636554797065275D203D20274D434C2729207468656E20
        626567696E0D0A202020202020206C626C44656275742E56697369626C65203A
        3D20547275653B0D0A20202020656E6420656C736520626567696E0D0A202020
        202020206C626C44656275742E56697369626C65203A3D2046616C73653B2020
        200D0A0D0A20202020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506086C626C4465627574094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65060F74787444656275744F6E5072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F7572636506FB70726F63
        65647572652074787444656275744F6E5072696E743B0D0A626567696E0D0A0D
        0A69662028706C52616365735265706F72745B275261636554797065275D203D
        20274D5357272920206F720D0A20202020202028706C52616365735265706F72
        745B275261636554797065275D203D20274D434C2729207468656E2062656769
        6E0D0A2020202020202074787444656275742E56697369626C65203A3D205472
        75653B0D0A20202020656E6420656C736520626567696E0D0A20202020202020
        74787444656275742E56697369626C65203A3D2046616C73653B2020200D0A0D
        0A20202020656E643B0D0A202020200D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506087478744465627574094576656E744E616D6506074F6E507269
        6E74074576656E74494402200000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbTipSheets'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race.DAT'
    Left = 536
    Top = 184
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 24
    Top = 208
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 608
    Top = 232
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 536
    Top = 113
  end
  object tblEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 'IsTrainerSheetSelected=True) or (IsSpeedSheetSelected=True)'
    Filtered = True
    DatabaseName = 'dbTipSheets'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByTodaysWagerWinPctRank'
    MasterFields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    TableName = 'ENTRY.DAT'
    Left = 182
    Top = 127
  end
end
