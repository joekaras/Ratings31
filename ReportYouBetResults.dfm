object YouBetResultsReportForm: TYouBetResultsReportForm
  Left = 268
  Top = 133
  Width = 568
  Height = 356
  Caption = 'YouBet Wager Results Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrgBar: TPanel
    Left = 5
    Top = 14
    Width = 549
    Height = 41
    BorderStyle = bsSingle
    Caption = 'pnlPrgBar'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
    object prgBar: TProgressBar
      Left = 10
      Top = 11
      Width = 527
      Height = 16
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = 0
    Top = 286
    Width = 570
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = 21
    Top = 61
    Width = 549
    Height = 41
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbYouBetWagerResultsReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbYouBetWagerResultsReport'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 424
    Top = 120
  end
  object tblPrevDayHH: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 
      ' ((IsFrontDoubleLiner=True) or (IsHeavyChalk=True) or (EarlyPace' +
      'AdvantageValueBet > 1.00) or (MiddlePaceAdvantageValueBet > 1.00' +
      ')) and (IsEliminated=False)  and (IsPrintedOnValueSheet=True)'
    Filtered = True
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbYouBetWagerResultsReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByActualPrimary'
    TableName = 'PrevDayHH'
    Left = 150
    Top = 112
  end
  object dsPrevDayHH: TDataSource
    DataSet = tblPrevDayHH
    Left = 158
    Top = 160
  end
  object plPrevDayHH: TppDBPipeline
    DataSource = dsPrevDayHH
    CloseDataSource = True
    UserName = 'plPrevDayHH'
    OnMasterRecordPositionChange = plPrevDayHHMasterRecordPositionChange
    OnTraversal = plPrevDayHHTraversal
    Left = 150
    Top = 218
    object plPrevDayHHppField1: TppField
      FieldAlias = 'TrkCode'
      FieldName = 'TrkCode'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plPrevDayHHppField2: TppField
      FieldAlias = 'RaceDate'
      FieldName = 'RaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object plPrevDayHHppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceNbr'
      FieldName = 'RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object plPrevDayHHppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PostPos'
      FieldName = 'PostPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object plPrevDayHHppField5: TppField
      FieldAlias = 'RangeRaceDate'
      FieldName = 'RangeRaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object plPrevDayHHppField6: TppField
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object plPrevDayHHppField7: TppField
      FieldAlias = 'TypeOfRace'
      FieldName = 'TypeOfRace'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object plPrevDayHHppField8: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object plPrevDayHHppField9: TppField
      FieldAlias = 'TrkCond'
      FieldName = 'TrkCond'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object plPrevDayHHppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object plPrevDayHHppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'Purse'
      FieldName = 'Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object plPrevDayHHppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClaimingPrice'
      FieldName = 'ClaimingPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object plPrevDayHHppField13: TppField
      FieldAlias = 'ProgramNbr'
      FieldName = 'ProgramNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object plPrevDayHHppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'ProgramNbrSort'
      FieldName = 'ProgramNbrSort'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object plPrevDayHHppField15: TppField
      FieldAlias = 'MorningLineDesc'
      FieldName = 'MorningLineDesc'
      FieldLength = 6
      DisplayWidth = 6
      Position = 14
    end
    object plPrevDayHHppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1'
      FieldName = 'MorningLineTo1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object plPrevDayHHppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineWinPct'
      FieldName = 'MorningLineWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object plPrevDayHHppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1Rank'
      FieldName = 'MorningLineTo1Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object plPrevDayHHppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPos'
      FieldName = 'FinishPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object plPrevDayHHppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'Odds'
      FieldName = 'Odds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object plPrevDayHHppField21: TppField
      FieldAlias = 'HorseName'
      FieldName = 'HorseName'
      FieldLength = 25
      DisplayWidth = 25
      Position = 20
    end
    object plPrevDayHHppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'HorseNbr'
      FieldName = 'HorseNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object plPrevDayHHppField23: TppField
      FieldAlias = 'Trainer'
      FieldName = 'Trainer'
      FieldLength = 30
      DisplayWidth = 30
      Position = 22
    end
    object plPrevDayHHppField24: TppField
      FieldAlias = 'Jockey'
      FieldName = 'Jockey'
      FieldLength = 30
      DisplayWidth = 30
      Position = 23
    end
    object plPrevDayHHppField25: TppField
      FieldAlias = 'Owner'
      FieldName = 'Owner'
      FieldLength = 30
      DisplayWidth = 30
      Position = 24
    end
    object plPrevDayHHppField26: TppField
      FieldAlias = 'Sire'
      FieldName = 'Sire'
      FieldLength = 25
      DisplayWidth = 25
      Position = 25
    end
    object plPrevDayHHppField27: TppField
      FieldAlias = 'DamSire'
      FieldName = 'DamSire'
      FieldLength = 25
      DisplayWidth = 25
      Position = 26
    end
    object plPrevDayHHppField28: TppField
      FieldAlias = 'Dam'
      FieldName = 'Dam'
      FieldLength = 25
      DisplayWidth = 25
      Position = 27
    end
    object plPrevDayHHppField29: TppField
      FieldAlias = 'Breeder'
      FieldName = 'Breeder'
      FieldLength = 70
      DisplayWidth = 70
      Position = 28
    end
    object plPrevDayHHppField30: TppField
      FieldAlias = 'Sex'
      FieldName = 'Sex'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
    object plPrevDayHHppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'Age'
      FieldName = 'Age'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 30
    end
    object plPrevDayHHppField32: TppField
      FieldAlias = 'Equip'
      FieldName = 'Equip'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object plPrevDayHHppField33: TppField
      FieldAlias = 'Med'
      FieldName = 'Med'
      FieldLength = 5
      DisplayWidth = 5
      Position = 32
    end
    object plPrevDayHHppField34: TppField
      FieldAlias = 'IsFirstTimeJuice'
      FieldName = 'IsFirstTimeJuice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 33
    end
    object plPrevDayHHppField35: TppField
      FieldAlias = 'IsDebut'
      FieldName = 'IsDebut'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 34
    end
    object plPrevDayHHppField36: TppField
      FieldAlias = 'IsDebutTwo'
      FieldName = 'IsDebutTwo'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 35
    end
    object plPrevDayHHppField37: TppField
      FieldAlias = 'IsDebutThird'
      FieldName = 'IsDebutThird'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 36
    end
    object plPrevDayHHppField38: TppField
      FieldAlias = 'IsTurfDebut'
      FieldName = 'IsTurfDebut'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 37
    end
    object plPrevDayHHppField39: TppField
      FieldAlias = 'DebutIndicator'
      FieldName = 'DebutIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 38
    end
    object plPrevDayHHppField40: TppField
      FieldAlias = 'TurfIndicator'
      FieldName = 'TurfIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 39
    end
    object plPrevDayHHppField41: TppField
      FieldAlias = 'MudIndicator'
      FieldName = 'MudIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 40
    end
    object plPrevDayHHppField42: TppField
      FieldAlias = 'RouteIndicator'
      FieldName = 'RouteIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 41
    end
    object plPrevDayHHppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLast'
      FieldName = 'DaysLast'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 42
    end
    object plPrevDayHHppField44: TppField
      FieldAlias = 'BredIn'
      FieldName = 'BredIn'
      FieldLength = 6
      DisplayWidth = 6
      Position = 43
    end
    object plPrevDayHHppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeed'
      FieldName = 'LastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 44
    end
    object plPrevDayHHppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeedRank'
      FieldName = 'LastSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 45
    end
    object plPrevDayHHppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'Power'
      FieldName = 'Power'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object plPrevDayHHppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerRank'
      FieldName = 'PowerRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 47
    end
    object plPrevDayHHppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeed'
      FieldName = 'BackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 48
    end
    object plPrevDayHHppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeedRank'
      FieldName = 'BackSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 49
    end
    object plPrevDayHHppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPace'
      FieldName = 'EarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object plPrevDayHHppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceRank'
      FieldName = 'EarlyPaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 51
    end
    object plPrevDayHHppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePos'
      FieldName = 'EarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object plPrevDayHHppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosRank'
      FieldName = 'EarlyPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 53
    end
    object plPrevDayHHppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePace'
      FieldName = 'MiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object plPrevDayHHppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceRank'
      FieldName = 'MiddlePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 55
    end
    object plPrevDayHHppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePos'
      FieldName = 'MiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object plPrevDayHHppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosRank'
      FieldName = 'MiddlePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 57
    end
    object plPrevDayHHppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePace'
      FieldName = 'LatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object plPrevDayHHppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceRank'
      FieldName = 'LatePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 59
    end
    object plPrevDayHHppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePos'
      FieldName = 'LatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object plPrevDayHHppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosRank'
      FieldName = 'LatePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 61
    end
    object plPrevDayHHppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePos'
      FieldName = 'FinishPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object plPrevDayHHppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePosRank'
      FieldName = 'FinishPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 63
    end
    object plPrevDayHHppField65: TppField
      FieldAlias = 'IsFrontDoubleLiner0'
      FieldName = 'IsFrontDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 64
    end
    object plPrevDayHHppField66: TppField
      FieldAlias = 'IsFrontDoubleLiner1'
      FieldName = 'IsFrontDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 65
    end
    object plPrevDayHHppField67: TppField
      FieldAlias = 'IsFrontDoubleLiner2'
      FieldName = 'IsFrontDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 66
    end
    object plPrevDayHHppField68: TppField
      FieldAlias = 'IsFrontDoubleLiner3'
      FieldName = 'IsFrontDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 67
    end
    object plPrevDayHHppField69: TppField
      FieldAlias = 'IsBackDoubleLiner0'
      FieldName = 'IsBackDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 68
    end
    object plPrevDayHHppField70: TppField
      FieldAlias = 'IsBackDoubleLiner1'
      FieldName = 'IsBackDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 69
    end
    object plPrevDayHHppField71: TppField
      FieldAlias = 'IsBackDoubleLiner2'
      FieldName = 'IsBackDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 70
    end
    object plPrevDayHHppField72: TppField
      FieldAlias = 'IsBackDoubleLiner3'
      FieldName = 'IsBackDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 71
    end
    object plPrevDayHHppField73: TppField
      FieldAlias = 'IsTripleLiner0'
      FieldName = 'IsTripleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 72
    end
    object plPrevDayHHppField74: TppField
      FieldAlias = 'IsTripleLiner1'
      FieldName = 'IsTripleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 73
    end
    object plPrevDayHHppField75: TppField
      FieldAlias = 'IsTripleLiner2'
      FieldName = 'IsTripleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 74
    end
    object plPrevDayHHppField76: TppField
      FieldAlias = 'IsTripleLiner3'
      FieldName = 'IsTripleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 75
    end
    object plPrevDayHHppField77: TppField
      FieldAlias = 'IsFrontDoubleLiner'
      FieldName = 'IsFrontDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 76
    end
    object plPrevDayHHppField78: TppField
      FieldAlias = 'IsBackDoubleLiner'
      FieldName = 'IsBackDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 77
    end
    object plPrevDayHHppField79: TppField
      FieldAlias = 'IsTripleDot'
      FieldName = 'IsTripleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 78
    end
    object plPrevDayHHppField80: TppField
      FieldAlias = 'IsFrontDoubleDot'
      FieldName = 'IsFrontDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 79
    end
    object plPrevDayHHppField81: TppField
      FieldAlias = 'IsBackDoubleDot'
      FieldName = 'IsBackDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 80
    end
    object plPrevDayHHppField82: TppField
      FieldAlias = 'IsTripleLiner'
      FieldName = 'IsTripleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 81
    end
    object plPrevDayHHppField83: TppField
      FieldAlias = 'IsBlinkersOn'
      FieldName = 'IsBlinkersOn'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 82
    end
    object plPrevDayHHppField84: TppField
      FieldAlias = 'IsBlinkersOff'
      FieldName = 'IsBlinkersOff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 83
    end
    object plPrevDayHHppField85: TppField
      FieldAlias = 'LastEquip'
      FieldName = 'LastEquip'
      FieldLength = 7
      DisplayWidth = 7
      Position = 84
    end
    object plPrevDayHHppField86: TppField
      FieldAlias = 'EstTimeOfRace'
      FieldName = 'EstTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 85
    end
    object plPrevDayHHppField87: TppField
      FieldAlias = 'Entry'
      FieldName = 'Entry'
      FieldLength = 5
      DisplayWidth = 5
      Position = 86
    end
    object plPrevDayHHppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'Weight'
      FieldName = 'Weight'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 87
    end
    object plPrevDayHHppField89: TppField
      FieldAlias = 'QSPRunStyle'
      FieldName = 'QSPRunStyle'
      FieldLength = 3
      DisplayWidth = 3
      Position = 88
    end
    object plPrevDayHHppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP1stCall'
      FieldName = 'QSP1stCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 89
    end
    object plPrevDayHHppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP1stCallRank'
      FieldName = 'QSP1stCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 90
    end
    object plPrevDayHHppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP2ndCall'
      FieldName = 'QSP2ndCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 91
    end
    object plPrevDayHHppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP2ndCallRank'
      FieldName = 'QSP2ndCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 92
    end
    object plPrevDayHHppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP1stCall'
      FieldName = 'KSP1stCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 93
    end
    object plPrevDayHHppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP1stCallRank'
      FieldName = 'KSP1stCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 94
    end
    object plPrevDayHHppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP2ndCall'
      FieldName = 'KSP2ndCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 95
    end
    object plPrevDayHHppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP2ndCallRank'
      FieldName = 'KSP2ndCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 96
    end
    object plPrevDayHHppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnEarningsRank'
      FieldName = 'TrnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 97
    end
    object plPrevDayHHppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnWinsRank'
      FieldName = 'TrnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 98
    end
    object plPrevDayHHppField100: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTrackRank'
      FieldName = 'TrnTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 99
    end
    object plPrevDayHHppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyWinsRank'
      FieldName = 'JkyWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 100
    end
    object plPrevDayHHppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyEarningsRank'
      FieldName = 'JkyEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 101
    end
    object plPrevDayHHppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyTrackRank'
      FieldName = 'JkyTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 102
    end
    object plPrevDayHHppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnWinsRank'
      FieldName = 'OwnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 103
    end
    object plPrevDayHHppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnEarningsRank'
      FieldName = 'OwnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 104
    end
    object plPrevDayHHppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValueROI'
      FieldName = 'ValueROI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 105
    end
    object plPrevDayHHppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValueROICnt'
      FieldName = 'ValueROICnt'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 106
    end
    object plPrevDayHHppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'DollarCnt'
      FieldName = 'DollarCnt'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 107
    end
    object plPrevDayHHppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerAdvantageKey'
      FieldName = 'PowerAdvantageKey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 108
    end
    object plPrevDayHHppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerAdvantage'
      FieldName = 'PowerAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 109
    end
    object plPrevDayHHppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantage'
      FieldName = 'EarlyPaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object plPrevDayHHppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantage'
      FieldName = 'MiddlePaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 111
    end
    object plPrevDayHHppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceAdvantage'
      FieldName = 'LatePaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object plPrevDayHHppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'ElimWinPct'
      FieldName = 'ElimWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 113
    end
    object plPrevDayHHppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'Elim2WinPct'
      FieldName = 'Elim2WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object plPrevDayHHppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWinPct'
      FieldName = 'TodaysWagerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 115
    end
    object plPrevDayHHppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerValueBet'
      FieldName = 'TodaysWagerValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object plPrevDayHHppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'PaceIndicatorWinPct'
      FieldName = 'PaceIndicatorWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 117
    end
    object plPrevDayHHppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerAdvantageWinPct'
      FieldName = 'PowerAdvantageWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object plPrevDayHHppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantageWinPct'
      FieldName = 'EarlyPaceAdvantageWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 119
    end
    object plPrevDayHHppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantageValueBet'
      FieldName = 'EarlyPaceAdvantageValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object plPrevDayHHppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantageWinPct'
      FieldName = 'MiddlePaceAdvantageWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 121
    end
    object plPrevDayHHppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantageValueBet'
      FieldName = 'MiddlePaceAdvantageValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 122
    end
    object plPrevDayHHppField124: TppField
      FieldAlias = 'IsHeavyChalk'
      FieldName = 'IsHeavyChalk'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 123
    end
    object plPrevDayHHppField125: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 124
    end
    object plPrevDayHHppField126: TppField
      FieldAlias = 'b3'
      FieldName = 'b3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 125
    end
    object plPrevDayHHppField127: TppField
      FieldAlias = 'b4'
      FieldName = 'b4'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 126
    end
    object plPrevDayHHppField128: TppField
      FieldAlias = 'b5'
      FieldName = 'b5'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 127
    end
    object plPrevDayHHppField129: TppField
      FieldAlias = 'b6'
      FieldName = 'b6'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 128
    end
    object plPrevDayHHppField130: TppField
      FieldAlias = 'IsEliminated'
      FieldName = 'IsEliminated'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 129
    end
    object plPrevDayHHppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'f1'
      FieldName = 'f1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 130
    end
    object plPrevDayHHppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'f2'
      FieldName = 'f2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 131
    end
    object plPrevDayHHppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'f3'
      FieldName = 'f3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 132
    end
    object plPrevDayHHppField134: TppField
      Alignment = taRightJustify
      FieldAlias = 'f4'
      FieldName = 'f4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 133
    end
    object plPrevDayHHppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'f5'
      FieldName = 'f5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 134
    end
    object plPrevDayHHppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'f6'
      FieldName = 'f6'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 135
    end
    object plPrevDayHHppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'f7'
      FieldName = 'f7'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object plPrevDayHHppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'f8'
      FieldName = 'f8'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 137
    end
    object plPrevDayHHppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 's1'
      FieldName = 's1'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 138
    end
    object plPrevDayHHppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 's2'
      FieldName = 's2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 139
    end
    object plPrevDayHHppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 's3'
      FieldName = 's3'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 140
    end
    object plPrevDayHHppField142: TppField
      Alignment = taRightJustify
      FieldAlias = 's4'
      FieldName = 's4'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 141
    end
    object plPrevDayHHppField143: TppField
      Alignment = taRightJustify
      FieldAlias = 's5'
      FieldName = 's5'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 142
    end
    object plPrevDayHHppField144: TppField
      Alignment = taRightJustify
      FieldAlias = 'i1'
      FieldName = 'i1'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 143
    end
    object plPrevDayHHppField145: TppField
      Alignment = taRightJustify
      FieldAlias = 'I2'
      FieldName = 'I2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 144
    end
    object plPrevDayHHppField146: TppField
      Alignment = taRightJustify
      FieldAlias = 'I3'
      FieldName = 'I3'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 145
    end
    object plPrevDayHHppField147: TppField
      Alignment = taRightJustify
      FieldAlias = 'I4'
      FieldName = 'I4'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 146
    end
    object plPrevDayHHppField148: TppField
      Alignment = taRightJustify
      FieldAlias = 'I5'
      FieldName = 'I5'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 147
    end
  end
  object ppWagerResultsReport: TppReport
    AutoStop = False
    DataPipeline = plPrevDayHH
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'G:\Ratings31\LinerResults.rtm'
    Template.Format = ftASCII
    Units = utPrinterPixels
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Printer'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 112
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plPrevDayHH'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 13494
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'lblTrkCode'
        Caption = 'Trk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 2953
        mmTop = 10319
        mmWidth = 3133
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'lblRaceNbr'
        Caption = 'R#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 8837
        mmTop = 10319
        mmWidth = 2540
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'lblProgNbr'
        Caption = 'P#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 15801
        mmTop = 10319
        mmWidth = 2455
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lblHorse'
        Caption = 'Horse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 20785
        mmTop = 10319
        mmWidth = 5673
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'lblML'
        Caption = 'M/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 43096
        mmTop = 10319
        mmWidth = 3471
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'lbl5Choices'
        Caption = 'Top Choices'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 109009
        mmTop = 10054
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lblFinPos'
        Caption = 'Finish'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 48154
        mmTop = 6879
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'lblOdds'
        Caption = 'Odds'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55827
        mmTop = 6879
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'lblFinishNbrs'
        Caption = 'Finish'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 135181
        mmTop = 10054
        mmWidth = 6900
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'lblExa'
        Caption = 'Exacta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 176742
        mmTop = 10319
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'lblQui'
        Caption = 'Quinella'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 188119
        mmTop = 10319
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'lblPk3'
        Caption = 'Pick 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 236538
        mmTop = 10319
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'lblDD'
        Caption = 'Double'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 207698
        mmTop = 10319
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'lblPk4'
        Caption = 'Pick 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 259621
        mmTop = 10319
        mmWidth = 5757
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'lblTri'
        Caption = 'Trifecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 163513
        mmTop = 10319
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'lblSfc'
        Caption = 'Superfecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 146050
        mmTop = 10319
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'lblWinNbrs'
        AutoSize = False
        Caption = 'Winner'#39's                        Win /  Place /  Show'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2836
        mmLeft = 63236
        mmTop = 10054
        mmWidth = 40746
        BandType = 0
      end
      object lblReportTitle: TppLabel
        UserName = 'lblReportTitle'
        AutoSize = False
        Caption = 'YouBet Results'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5673
        mmLeft = 0
        mmTop = 0
        mmWidth = 147109
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'sysPage'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5673
        mmLeft = 226219
        mmTop = 0
        mmWidth = 13081
        BandType = 0
      end
      object varStartDate: TppLabel
        UserName = 'lblStartDate'
        Caption = 'lblStartDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5673
        mmLeft = 149754
        mmTop = 0
        mmWidth = 22775
        BandType = 0
      end
      object varEndDate: TppLabel
        UserName = 'lblEndDate'
        Caption = 'EndDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5673
        mmLeft = 190236
        mmTop = 0
        mmWidth = 16468
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'lblOdds1'
        Caption = 'Est '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 57150
        mmTop = 10054
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 48683
        mmTop = 10054
        mmWidth = 5292
        BandType = 0
      end
    end
    object DetailBand: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
      object RaceNbr: TppDBText
        UserName = 'RaceNbr'
        DataField = 'RaceNbr'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 7144
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object dbHorseName: TppDBText
        UserName = 'HorseName'
        DataField = 'HorseName'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 19050
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object dbTrkCode: TppDBText
        UserName = 'TrkCode'
        DataField = 'TrkCode'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 265
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object dbProgramNbr: TppDBText
        UserName = 'ProgramNbr'
        DataField = 'ProgramNbr'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 14023
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object dbFinishPos: TppDBText
        UserName = 'FinishPos'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'FinishPos'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3725
        mmLeft = 52620
        mmTop = 0
        mmWidth = 1355
        BandType = 4
      end
      object MorningLineDesc: TppDBText
        UserName = 'MorningLineDesc'
        AutoSize = True
        DataField = 'MorningLineDesc'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2709
        mmLeft = 44027
        mmTop = 0
        mmWidth = 2540
        BandType = 4
      end
      object dbExactaPayout: TppDBText
        UserName = 'ExactaPayout'
        BlankWhenZero = True
        DataField = 'ExactaPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '####0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 172773
        mmTop = 3440
        mmWidth = 10319
        BandType = 4
      end
      object FinishNbrs: TppDBText
        UserName = 'FinishNbrs'
        DataField = 'WinNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object dbTrifectaPayout: TppDBText
        UserName = 'TrifectaPayout'
        BlankWhenZero = True
        DataField = 'TrifectaPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 159544
        mmTop = 3440
        mmWidth = 11113
        BandType = 4
      end
      object dbQuinellaPayout: TppDBText
        UserName = 'QuinellaPayout'
        BlankWhenZero = True
        DataField = 'QuinellaPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '####0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 184415
        mmTop = 3440
        mmWidth = 11642
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 121709
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 196321
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpRight
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 142875
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 157692
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 171980
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 183621
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 12435
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 47096
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbDailyDoublePayout: TppDBText
        UserName = 'DailyDoublePayoutFirstRace'
        BlankWhenZero = True
        DataField = 'DailyDoublePayoutFirstRace'
        DataPipeline = plPrevDayRH
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 3440
        mmWidth = 17198
        BandType = 4
      end
      object dbPick4Payout: TppDBText
        UserName = 'Pick4Payout'
        BlankWhenZero = True
        DataField = 'Pick4PayoutFirstRace'
        DataPipeline = plPrevDayRH
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 254001
        mmTop = 3440
        mmWidth = 12171
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 215371
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 243417
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbSuperfectaPayout: TppDBText
        UserName = 'SuperfectaPayout'
        BlankWhenZero = True
        DataField = 'SuperfectaPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 143934
        mmTop = 3440
        mmWidth = 12435
        BandType = 4
      end
      object dbPick4Wager: TppDBText
        UserName = 'Pick4Wager'
        BlankWhenZero = True
        DataField = 'Pick4WagerFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 244475
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbPick3Wager: TppDBText
        UserName = 'Pick3Wager'
        BlankWhenZero = True
        DataField = 'Pick3WagerFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 219340
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbDailyDoubleWager: TppDBText
        UserName = 'DailyDoubleWager'
        BlankWhenZero = True
        DataField = 'DailyDoubleWagerFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 197380
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbQuinellaWager: TppDBText
        UserName = 'QuinellaWager'
        BlankWhenZero = True
        DataField = 'QuinellaWager'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 184680
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbExactaWager: TppDBText
        UserName = 'ExactaWager'
        BlankWhenZero = True
        DataField = 'ExactaWager'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 172509
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object dbTrifectaWager: TppDBText
        UserName = 'TrifectaWager'
        BlankWhenZero = True
        DataField = 'TrifectaWager'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 158750
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbSuperfectaWager: TppDBText
        UserName = 'SuperfectaWager'
        BlankWhenZero = True
        DataField = 'SuperfectaWager'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2625
        mmLeft = 144198
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 104775
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbWinPayout: TppDBText
        UserName = 'WinPayout'
        BlankWhenZero = True
        DataField = 'WinPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3175
        mmLeft = 81227
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16404
        mmLeft = 61648
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbWinNbrs: TppDBText
        UserName = 'WinNbrs'
        BlankWhenZero = True
        DataField = 'WinNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2836
        mmLeft = 62442
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object dbWinPlcPayout: TppDBText
        UserName = 'WinPlcPayout'
        BlankWhenZero = True
        DataField = 'WinPlcPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object dbWinShoPayout: TppDBText
        UserName = 'WinShoPayout'
        BlankWhenZero = True
        DataField = 'WinShoPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object dbPick3Payout: TppDBText
        UserName = 'Pick3Payout'
        BlankWhenZero = True
        DataField = 'Pick3PayoutFirstRace'
        DataPipeline = plPrevDayRH
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 230453
        mmTop = 3440
        mmWidth = 12171
        BandType = 4
      end
      object dbDD: TppDBText
        UserName = 'DD'
        BlankWhenZero = True
        DataField = 'DDFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 11906
        mmWidth = 17198
        BandType = 4
      end
      object dbPick3: TppDBText
        UserName = 'Pick3'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick3FirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 224251
        mmTop = 11906
        mmWidth = 18457
        BandType = 4
      end
      object dbPick4: TppDBText
        UserName = 'Pick4'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick4FirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2709
        mmLeft = 254319
        mmTop = 12171
        mmWidth = 11853
        BandType = 4
      end
      object dbDailyDoubleNbrs: TppDBText
        UserName = 'DailyDoubleNbrs'
        BlankWhenZero = True
        DataField = 'DailyDoubleNbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 7408
        mmWidth = 17198
        BandType = 4
      end
      object dbPick3Nbrs: TppDBText
        UserName = 'Pick3Nbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick3NbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 237713
        mmTop = 7408
        mmWidth = 4911
        BandType = 4
      end
      object dbPick4Nbrs: TppDBText
        UserName = 'Pick4Nbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick4NbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2709
        mmLeft = 250423
        mmTop = 7408
        mmWidth = 15748
        BandType = 4
      end
      object dbPlcNbrs: TppDBText
        UserName = 'PlcNbrs'
        BlankWhenZero = True
        DataField = 'PlcNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 62442
        mmTop = 3704
        mmWidth = 17992
        BandType = 4
      end
      object dbShoNbrs: TppDBText
        UserName = 'ShoNbrs'
        BlankWhenZero = True
        DataField = 'ShoNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 62442
        mmTop = 7408
        mmWidth = 17992
        BandType = 4
      end
      object dbPlcPayout: TppDBText
        UserName = 'PlcPayout'
        BlankWhenZero = True
        DataField = 'PlcPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 3704
        mmWidth = 6879
        BandType = 4
      end
      object dbPlcShoPayout: TppDBText
        UserName = 'PlcShoPayout'
        BlankWhenZero = True
        DataField = 'PlcShoPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 3704
        mmWidth = 6879
        BandType = 4
      end
      object dbShoPayout: TppDBText
        UserName = 'ShoPayout'
        BlankWhenZero = True
        DataField = 'ShoPayout'
        DataPipeline = plPrevDayRH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 7408
        mmWidth = 6879
        BandType = 4
      end
      object RaceDate: TppDBText
        UserName = 'RaceDate'
        DataField = 'RaceDate'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2455
        mmLeft = 265
        mmTop = 3175
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'TrkCode2'
        DataField = 'RaceType'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 529
        mmTop = 6085
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'RaceNbr1'
        DataField = 'DaysLast'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 7673
        mmTop = 6085
        mmWidth = 4233
        BandType = 4
      end
      object Pace: TppDBText
        UserName = 'ErlPace'
        ShiftWithParent = True
        DataField = 'EarlyPace'
        DataPipeline = plPrevDayHH
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 17992
        mmTop = 3175
        mmWidth = 4498
        BandType = 4
      end
      object lblErlPos: TppLabel
        UserName = 'lblErlPos'
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2836
        mmLeft = 19971
        mmTop = 6879
        mmWidth = 804
        BandType = 4
      end
      object MidPace: TppDBText
        UserName = 'MidPace'
        ShiftWithParent = True
        DataField = 'MiddlePace'
        DataPipeline = plPrevDayHH
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 23548
        mmTop = 3175
        mmWidth = 4498
        BandType = 4
      end
      object lblMidPos: TppLabel
        UserName = 'lblMidPos'
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2836
        mmLeft = 25400
        mmTop = 6879
        mmWidth = 1323
        BandType = 4
      end
      object lblLatePos: TppLabel
        UserName = 'lblLatePos'
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2836
        mmLeft = 31744
        mmTop = 6879
        mmWidth = 804
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'LatePace'
        ShiftWithParent = True
        DataField = 'LatePace'
        DataPipeline = plPrevDayHH
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2879
        mmLeft = 29369
        mmTop = 3175
        mmWidth = 4498
        BandType = 4
      end
      object Super: TppDBText
        UserName = 'Super'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Super'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 146040
        mmTop = 12171
        mmWidth = 10329
        BandType = 4
      end
      object Tri: TppDBText
        UserName = 'Tri'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Tri'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 167948
        mmTop = 12171
        mmWidth = 2709
        BandType = 4
      end
      object Exacta: TppDBText
        UserName = 'Exacta'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Exacta'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 176393
        mmTop = 12171
        mmWidth = 6435
        BandType = 4
      end
      object Quinella: TppDBText
        UserName = 'Quinella'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Quinella'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 188098
        mmTop = 12171
        mmWidth = 7959
        BandType = 4
      end
      object SuperfectaNbrs: TppDBText
        UserName = 'SuperfectaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'SuperfectaNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 149596
        mmTop = 7408
        mmWidth = 6773
        BandType = 4
      end
      object TrifectaNbrs: TppDBText
        UserName = 'TrifectaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'TrifectaNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 165745
        mmTop = 7408
        mmWidth = 4911
        BandType = 4
      end
      object ExactaNbrs: TppDBText
        UserName = 'ExactaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'ExactaNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 180044
        mmTop = 7408
        mmWidth = 3048
        BandType = 4
      end
      object QuinellaNbrs: TppDBText
        UserName = 'QuinellaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'QuinellaNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3387
        mmLeft = 183696
        mmTop = 7408
        mmWidth = 12361
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 143404
        mmTop = 10848
        mmWidth = 123031
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line101'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 143934
        mmTop = 6615
        mmWidth = 123031
        BandType = 4
      end
      object EstTimeOfRace: TppDBText
        UserName = 'EstTimeOfRace'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'EstTimeOfRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2709
        mmLeft = 3725
        mmTop = 9790
        mmWidth = 9652
        BandType = 4
      end
      object TriWagerAmt: TppDBText
        UserName = 'TriWagerAmt'
        BlankWhenZero = True
        DataField = 'TriWagerAmt'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 163248
        mmTop = 265
        mmWidth = 7938
        BandType = 4
      end
      object QuiWagerAmt: TppDBText
        UserName = 'QuiWagerAmt'
        BlankWhenZero = True
        DataField = 'QuiWagerAmt'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 188384
        mmTop = 265
        mmWidth = 7938
        BandType = 4
      end
      object Pk3WagerAmt: TppDBText
        UserName = 'Pk3WagerAmt'
        BlankWhenZero = True
        DataField = 'Pk3WagerAmt'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 234686
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object ExaWagerAmt: TppDBText
        UserName = 'ExaWagerAmt'
        BlankWhenZero = True
        DataField = 'ExaWagerAmt'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 176477
        mmTop = 265
        mmWidth = 6085
        BandType = 4
      end
      object SfcWagerAmt: TppDBText
        UserName = 'SfcWagerAmt'
        BlankWhenZero = True
        DataField = 'SfcWagerAmt'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 149225
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object Pk4WagerAmt: TppDBText
        UserName = 'Pk4WagerAmt'
        BlankWhenZero = True
        DataField = 'Pk4WagerAmt'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 258234
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object DDWagerAmt: TppDBText
        UserName = 'DDWagerAmt'
        BlankWhenZero = True
        DataField = 'DDWagerAmt'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 207169
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'Odds1'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Odds'
        DataPipeline = plPrevDayHH
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3387
        mmLeft = 56790
        mmTop = 265
        mmWidth = 4064
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'EstTimeOfRace1'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Surface'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2709
        mmLeft = 10022
        mmTop = 13229
        mmWidth = 1355
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 16087
        mmWidth = 266701
        BandType = 4
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060A54726150726F6772616D094368696C645479706502150E497346756E63
        74696F6E54797065090B50726F6772616D4E616D65060C436F6D70757465504C
        5063740B50726F6772616D54797065070A747446756E6374696F6E06536F7572
        6365068766756E6374696F6E20436F6D70757465504C506374202866576F6E3A
        646F75626C653B66576167657265643A646F75626C65293A646F75626C653B0D
        0A626567696E0D0A20200D0A202020526573756C74203A3D20282866576F6E20
        2D20665761676572656429202F20665761676572656429202A203130303B0D0A
        2020200D0A656E643B0D0A0001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65061346696E6973684E6272734F6E476574546578740B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        CD01000070726F6365647572652046696E6973684E6272734F6E476574546578
        742876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A20
        2054657874203A3D2027273B0D0A20200D0A20206966205472696D28706C5072
        657644617952485B27537570657266656374614E627273275D29203C3E202727
        207468656E20626567696E0D0A202020202054657874203A3D2020706C507265
        7644617952485B27537570657266656374614E627273275D3B0D0A2020656E64
        3B0D0A2020200D0A20206966205472696D285465787429203D20272720746865
        6E20626567696E0D0A20200954657874203A3D2020706C507265764461795248
        5B2754726966656374614E627273275D3B0D0A2020656E643B0D0A20200D0A20
        206966205472696D285465787429203D202727207468656E20626567696E0D0A
        20200954657874203A3D2020706C5072657644617952485B274578616374614E
        627273275D3B0D0A2020656E643B0D0A0D0A20206966205472696D2854657874
        29203D202727207468656E20626567696E0D0A20200954657874203A3D202070
        6C5072657644617952485B275175696E656C6C614E627273275D3B0D0A202065
        6E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0A46696E6973684E627273094576656E744E616D6506094F6E47657454657874
        074576656E74494402350001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506135069636B3457616765724F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506F1
        70726F636564757265205069636B3457616765724F6E47657454657874287661
        7220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020696620
        706C5072657644617952485B275069636B345761676572466972737452616365
        275D203D2031207468656E20626567696E0D0A2020202054657874203A3D2027
        2431273B0D0A2020656E643B20200D0A2020696620706C507265764461795248
        5B275069636B345761676572466972737452616365275D203D2032207468656E
        20626567696E0D0A2020202054657874203A3D20272432273B0D0A2020656E64
        3B20200D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0A5069636B345761676572094576656E744E616D6506094F6E47657454657874
        074576656E74494402350001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506135069636B3357616765724F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506EF
        70726F636564757265205069636B3357616765724F6E47657454657874287661
        7220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020696620
        706C5072657644617952485B275069636B335761676572466972737452616365
        275D203D2031207468656E20626567696E0D0A2020202054657874203A3D2027
        2431273B0D0A2020656E643B20200D0A2020696620706C507265764461795248
        5B275069636B335761676572466972737452616365275D203D2032207468656E
        20626567696E0D0A2020202054657874203A3D20272432273B0D0A2020656E64
        3B20200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A50
        69636B335761676572094576656E744E616D6506094F6E476574546578740745
        76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D6506194461696C79446F75626C6557616765724F6E4765745465
        78740B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650C0101000070726F636564757265204461696C79446F75626C6557616765
        724F6E476574546578742876617220546578743A20537472696E67293B0D0A62
        6567696E0D0A0D0A2020696620706C5072657644617952485B274461696C7944
        6F75626C655761676572466972737452616365275D203D2031207468656E2062
        6567696E0D0A2020202054657874203A3D20272431273B0D0A2020656E643B20
        200D0A2020696620706C5072657644617952485B274461696C79446F75626C65
        5761676572466972737452616365275D203D2032207468656E20626567696E0D
        0A2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506104461696C79446F75
        626C655761676572094576656E744E616D6506094F6E47657454657874074576
        656E74494402350001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D6506165175696E656C6C6157616765724F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506E6
        70726F636564757265205175696E656C6C6157616765724F6E47657454657874
        2876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020
        696620706C5072657644617952485B275175696E656C6C615761676572275D20
        3D2031207468656E20626567696E0D0A2020202054657874203A3D2027243127
        3B0D0A2020656E643B20200D0A2020696620706C5072657644617952485B2751
        75696E656C6C615761676572275D203D2032207468656E20626567696E0D0A20
        20202054657874203A3D20272432273B0D0A2020656E643B20200D0A20200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060D5175696E656C6C615761
        676572094576656E744E616D6506094F6E47657454657874074576656E744944
        02350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65061445786163746157616765724F6E476574546578740B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C1001000070726F63
        65647572652045786163746157616765724F6E47657454657874287661722054
        6578743A20537472696E67293B0D0A626567696E0D0A20202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020200D0A2020696620706C5072657644617952485B27457861637461
        5761676572275D203D2031207468656E20626567696E0D0A2020202054657874
        203A3D20272431273B0D0A2020656E643B20200D0A2020696620706C50726576
        44617952485B274578616374615761676572275D203D2032207468656E206265
        67696E0D0A2020202054657874203A3D20272432273B0D0A2020656E643B2020
        0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B45786163
        74615761676572094576656E744E616D6506094F6E4765745465787407457665
        6E74494402350001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D650616547269666563746157616765724F6E476574546578740B5072
        6F6772616D54797065070B747450726F63656475726506536F7572636506E670
        726F63656475726520547269666563746157616765724F6E4765745465787428
        76617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617952485B2754726966656374615761676572275D203D
        2031207468656E20626567696E0D0A2020202054657874203A3D20272431273B
        0D0A2020656E643B20200D0A2020696620706C5072657644617952485B275472
        6966656374615761676572275D203D2032207468656E20626567696E0D0A2020
        202054657874203A3D20272432273B0D0A2020656E643B20200D0A20200D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060D5472696665637461576167
        6572094576656E744E616D6506094F6E47657454657874074576656E74494402
        350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        06185375706572666563746157616765724F6E476574546578740B50726F6772
        616D54797065070B747450726F63656475726506536F7572636506EC70726F63
        6564757265205375706572666563746157616765724F6E476574546578742876
        617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A20206966
        20706C5072657644617952485B27537570657266656374615761676572275D20
        3D2031207468656E20626567696E0D0A2020202054657874203A3D2027243127
        3B0D0A2020656E643B20200D0A2020696620706C5072657644617952485B2753
        7570657266656374615761676572275D203D2032207468656E20626567696E0D
        0A2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F5375706572666563
        74615761676572094576656E744E616D6506094F6E4765745465787407457665
        6E74494402350001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061046696E697368506F734F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506BF70726F63656475
        72652046696E697368506F734F6E5072696E743B0D0A626567696E0D0A0D0A20
        20696620706C5072657644617948485B2746696E697368506F73275D203D2031
        207468656E20626567696E0D0A202020202046696E697368506F732E466F6E74
        2E426F6C64203A3D20547275653B0D0A2020656E6420656C736520626567696E
        0D0A202020202046696E697368506F732E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060946696E697368506F73094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060E54726B436F64654F6E5072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F7572636506B770
        726F6365647572652054726B436F64654F6E5072696E743B0D0A626567696E0D
        0A0D0A2020696620706C5072657644617948485B2746696E697368506F73275D
        203D2031207468656E20626567696E0D0A202020202054726B436F64652E466F
        6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C736520626567
        696E0D0A202020202054726B436F64652E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060754726B436F6465094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061150726F6772616D4E62724F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506BC7072
        6F6365647572652050726F6772616D4E62724F6E5072696E743B0D0A62656769
        6E0D0A696620706C5072657644617948485B2746696E697368506F73275D203D
        2031207468656E20626567696E0D0A202020202050726F6772616D4E62722E46
        6F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C7365206265
        67696E0D0A202020202050726F6772616D4E62722E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D65060A50726F6772616D4E6272094576656E744E616D650607
        4F6E5072696E74074576656E74494402200001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D650610486F7273654E616D654F6E507269
        6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
        636506BD70726F63656475726520486F7273654E616D654F6E5072696E743B0D
        0A626567696E0D0A0D0A2020696620706C5072657644617948485B2746696E69
        7368506F73275D203D2031207468656E20626567696E0D0A2020202020486F72
        73654E616D652E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        20656C736520626567696E0D0A2020202020486F7273654E616D652E466F6E74
        2E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D650609486F7273654E616D65094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060E526163654E62724F
        6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
        536F7572636506B770726F63656475726520526163654E62724F6E5072696E74
        3B0D0A626567696E0D0A0D0A2020696620706C5072657644617948485B274669
        6E697368506F73275D203D2031207468656E20626567696E0D0A202020202052
        6163654E62722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        20656C736520626567696E0D0A2020202020526163654E62722E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D650607526163654E6272094576656E744E616D65
        06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D6506164D6F726E696E674C696E6544
        6573634F6E5072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F7572636506D670726F636564757265204D6F726E696E674C696E
        65446573634F6E5072696E743B0D0A626567696E0D0A2020696620706C507265
        7644617948485B274D6F726E696E674C696E65546F3152616E6B275D203D2031
        207468656E20626567696E0D0A20202020204D6F726E696E674C696E65446573
        632E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C7365
        20626567696E0D0A20202020204D6F726E696E674C696E65446573632E466F6E
        742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060F4D6F726E696E674C696E65446573
        63094576656E744E616D6506074F6E5072696E74074576656E74494402200001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061146
        696E6973684E6272734F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F7572636506B170726F6365647572652046696E69
        73684E6272734F6E5072696E743B0D0A626567696E0D0A0D0A202046696E6973
        684E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A0D0A202069
        6620706C5072657644617948485B2746696E697368506F73275D203D20312074
        68656E20626567696E0D0A2020202020202046696E6973684E6272732E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060A46696E6973684E627273094576
        656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D6506155472696665
        6374615061796F75744F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C5A01000070726F6365647572652054
        726966656374615061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A
        2054726966656374615061796F75742E466F6E742E426F6C64203A3D2046616C
        73653B0D0A20696620706C5072657644617952485B2749735472696665637461
        4D617463686564275D203D2054727565207468656E20626567696E0D0A202020
        2054726966656374615061796F75742E466F6E742E426F6C64203A3D20547275
        653B0D0A20656E643B0D0A2020696620706C5072657644617952485B27497354
        726952616365275D203D2054727565207468656E20626567696E0D0A20202020
        20202054726966656374615061796F75742E56697369626C65203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A20202020202020547269
        66656374615061796F75742E56697369626C65203A3D2046616C73653B0D0A20
        20656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E54
        726966656374615061796F7574094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506155175696E656C6C615061796F75744F6E5072696E74
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        0C5E01000070726F636564757265205175696E656C6C615061796F75744F6E50
        72696E743B0D0A626567696E0D0A0D0A20205175696E656C6C615061796F7574
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C507265
        7644617952485B2749735175696E656C6C614D617463686564275D203D205472
        7565207468656E20626567696E0D0A20202020205175696E656C6C615061796F
        75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20
        20696620706C5072657644617952485B27497351756952616365275D203D2054
        727565207468656E20626567696E0D0A202020202020205175696E656C6C6150
        61796F75742E56697369626C65203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A202020202020205175696E656C6C615061796F75742E
        56697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060E5175696E656C6C615061796F75
        74094576656E744E616D6506074F6E5072696E74074576656E74494402200001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061753
        7570657266656374615061796F75744F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650CA501000070726F6365
        6475726520537570657266656374615061796F75744F6E5072696E743B0D0A62
        6567696E0D0A0D0A2020537570657266656374615061796F75742E466F6E742E
        426F6C64203A3D2046616C73653B0D0A2020696620706C507265764461795248
        5B274973537570657266656374614D617463686564275D203D20547275652074
        68656E20626567696E0D0A2020202020537570657266656374615061796F7574
        2E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D
        0A20206966202828706C5072657644617952485B274973537570657252616365
        275D203D20547275652920616E642028706C5072657644617952485B27537570
        657266656374615761676572416D74275D203E203029297468656E2062656769
        6E0D0A20202020202020537570657266656374615061796F75742E5669736962
        6C65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A20
        202020202020537570657266656374615061796F75742E56697369626C65203A
        3D2046616C73653B0D0A2020656E643B0D0A20200D0A20200D0A656E643B0D0A
        0D436F6D706F6E656E744E616D650610537570657266656374615061796F7574
        094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506125069
        636B345061796F75744F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C5501000070726F6365647572652050
        69636B345061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A202050
        69636B345061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A
        2020696620706C5072657644617952485B2749735069636B344D617463686564
        466972737452616365275D203D2054727565207468656E20626567696E0D0A20
        202020205069636B345061796F75742E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E643B0D0A2020696620706C5072657644617952485B274973
        506B3452616365275D203D2054727565207468656E20626567696E0D0A202020
        202020205069636B345061796F75742E56697369626C65203A3D20547275653B
        0D0A2020656E6420656C736520626567696E0D0A202020202020205069636B34
        5061796F75742E56697369626C65203A3D2046616C73653B0D0A2020656E643B
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B5069636B3450
        61796F7574094576656E744E616D6506074F6E5072696E74074576656E744944
        02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        6506214461696C79446F75626C655061796F75744669727374526163654F6E50
        72696E740B50726F6772616D54797065070B747450726F63656475726506536F
        757263650CB601000070726F636564757265204461696C79446F75626C655061
        796F75744669727374526163654F6E5072696E743B0D0A626567696E0D0A0D0A
        2020204461696C79446F75626C655061796F75744669727374526163652E466F
        6E742E426F6C64203A3D2046616C73653B0D0A202020696620706C5072657644
        617952485B2749734461696C79446F75626C654D617463686564466972737452
        616365275D203D2054727565207468656E20626567696E0D0A20202020202044
        61696C79446F75626C655061796F75744669727374526163652E466F6E742E42
        6F6C64203A3D20547275653B0D0A202020656E643B0D0A2020200D0A20202069
        6620706C5072657644617952485B274973444452616365275D203D2054727565
        207468656E20626567696E0D0A202020202020204461696C79446F75626C6550
        61796F75744669727374526163652E56697369626C65203A3D20547275653B0D
        0A202020656E6420656C736520626567696E0D0A202020202020204461696C79
        446F75626C655061796F75744669727374526163652E56697369626C65203A3D
        2046616C73653B0D0A202020656E643B0D0A20202020200D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65061A4461696C79446F75626C655061796F7574
        466972737452616365094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061057696E5061796F75744F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506E970726F63656475
        72652057696E5061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A20
        202057696E5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D
        0A20202020200D0A202020696620706C5072657644617948485B2746696E6973
        68506F73275D203D2031207468656E20626567696E0D0A202020202057696E50
        61796F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420
        656C736520626567696E0D0A202020202057696E5061796F75742E466F6E742E
        426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060957696E5061796F7574094576656E
        744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D6506115069636B345761
        6765724F6E5072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C5201000070726F636564757265205069636B345761
        6765724F6E5072696E743B0D0A626567696E0D0A0D0A20205069636B34576167
        65722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C50
        72657644617952485B2749735069636B344D6174636865644669727374526163
        65275D203D2054727565207468656E20626567696E0D0A20202020205069636B
        3457616765722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        3B0D0A2020696620706C5072657644617952485B274973506B3452616365275D
        203D2054727565207468656E20626567696E0D0A202020202020205069636B34
        57616765722E56697369626C65203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A202020202020205069636B3457616765722E56697369
        626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060A5069636B345761676572094576656E
        744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D6506115069636B335761
        6765724F6E5072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C5401000070726F636564757265205069636B335761
        6765724F6E5072696E743B0D0A626567696E0D0A20200D0A20205069636B3357
        616765722E466F6E742E426F6C64203A3D2046616C73653B0D0A202069662070
        6C5072657644617952485B2749735069636B334D617463686564466972737452
        616365275D203D2054727565207468656E20626567696E0D0A20202020205069
        636B3357616765722E466F6E742E426F6C64203A3D20547275653B0D0A202065
        6E643B0D0A2020696620706C5072657644617952485B274973506B3352616365
        275D203D2054727565207468656E20626567696E0D0A20202020202020506963
        6B3357616765722E56697369626C65203A3D20547275653B0D0A2020656E6420
        656C736520626567696E0D0A202020202020205069636B3357616765722E5669
        7369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060A5069636B335761676572094576
        656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D6506174461696C79
        446F75626C6557616765724F6E5072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C7E01000070726F636564757265
        204461696C79446F75626C6557616765724F6E5072696E743B0D0A626567696E
        0D0A0D0A20204461696C79446F75626C6557616765722E466F6E742E426F6C64
        203A3D2046616C73653B0D0A2020696620706C5072657644617952485B274973
        4461696C79446F75626C654D617463686564466972737452616365275D203D20
        54727565207468656E20626567696E0D0A20202020204461696C79446F75626C
        6557616765722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        3B0D0A20200D0A2020696620706C5072657644617952485B2749734444526163
        65275D203D2054727565207468656E20626567696E0D0A202020202020204461
        696C79446F75626C6557616765722E56697369626C65203A3D20547275653B0D
        0A2020656E6420656C736520626567696E0D0A202020202020204461696C7944
        6F75626C6557616765722E56697369626C65203A3D2046616C73653B0D0A2020
        656E643B0D0A2020200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506104461696C79446F75626C655761676572094576656E744E616D6506
        074F6E5072696E74074576656E74494402200001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D6506145175696E656C6C615761676572
        4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
        06536F757263650C5F01000070726F636564757265205175696E656C6C615761
        6765724F6E5072696E743B0D0A626567696E0D0A0D0A20205175696E656C6C61
        57616765722E466F6E742E426F6C64203A3D2046616C73653B0D0A20200D0A20
        20696620706C5072657644617952485B2749735175696E656C6C614D61746368
        6564275D203D2054727565207468656E20626567696E0D0A2020202020517569
        6E656C6C6157616765722E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E643B0D0A2020696620706C5072657644617952485B2749735175695261
        6365275D203D2054727565207468656E20626567696E0D0A2020202020202051
        75696E656C6C6157616765722E56697369626C65203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202020205175696E656C6C61
        57616765722E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D
        0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D5175696E65
        6C6C615761676572094576656E744E616D6506074F6E5072696E74074576656E
        74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65061245786163746157616765724F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C5301000070726F
        6365647572652045786163746157616765724F6E5072696E743B0D0A62656769
        6E0D0A200D0A202045786163746157616765722E466F6E742E426F6C64203A3D
        2046616C73653B0D0A2020696620706C5072657644617952485B274973457861
        6374614D617463686564275D203D2054727565207468656E20626567696E0D0A
        20202020202045786163746157616765722E466F6E742E426F6C64203A3D2054
        7275653B0D0A2020656E643B0D0A20202020696620706C507265764461795248
        5B27497345786152616365275D203D2054727565207468656E20626567696E0D
        0A2020202020202045786163746157616765722E56697369626C65203A3D2054
        7275653B0D0A2020656E6420656C736520626567696E0D0A2020202020202045
        786163746157616765722E56697369626C65203A3D2046616C73653B0D0A2020
        656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B
        4578616374615761676572094576656E744E616D6506074F6E5072696E740745
        76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D650614547269666563746157616765724F6E5072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C5B01
        000070726F63656475726520547269666563746157616765724F6E5072696E74
        3B0D0A626567696E0D0A0D0A2020547269666563746157616765722E466F6E74
        2E426F6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952
        485B27497354726966656374614D617463686564275D203D2054727565207468
        656E20626567696E0D0A2020202020547269666563746157616765722E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A2020696620706C
        5072657644617952485B27497354726952616365275D203D2054727565207468
        656E20626567696E0D0A20202020202020547269666563746157616765722E56
        697369626C65203A3D20547275653B0D0A2020656E6420656C73652062656769
        6E0D0A20202020202020547269666563746157616765722E56697369626C6520
        3A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65060D54726966656374615761676572094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D6506165375706572666563
        746157616765724F6E5072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C9C01000070726F63656475726520537570
        6572666563746157616765724F6E5072696E743B0D0A626567696E0D0A0D0A20
        205375706572666563746157616765722E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020696620706C5072657644617952485B274973537570657266
        656374614D617463686564275D203D2054727565207468656E20626567696E0D
        0A20202020205375706572666563746157616765722E466F6E742E426F6C6420
        3A3D20547275653B0D0A2020656E643B0D0A20200D0A20206966202828706C50
        72657644617952485B274973537570657252616365275D203D20547275652920
        616E642028706C5072657644617952485B275375706572666563746157616765
        72416D74275D203E203029297468656E20626567696E0D0A2020202020202053
        75706572666563746157616765722E56697369626C65203A3D20547275653B0D
        0A2020656E6420656C736520626567696E0D0A20202020202020537570657266
        6563746157616765722E56697369626C65203A3D2046616C73653B0D0A202065
        6E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F53
        7570657266656374615761676572094576656E744E616D6506074F6E5072696E
        74074576656E74494402200001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D6506134578616374615061796F75744F6E5072696E740B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        6001000070726F636564757265204578616374615061796F75744F6E5072696E
        743B0D0A626567696E0D0A0D0A20204578616374615061796F75742E466F6E74
        2E426F6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952
        485B2749734578616374614D617463686564275D203D2054727565207468656E
        20626567696E0D0A20202020204578616374615061796F75742E466F6E742E42
        6F6C64203A3D20547275653B0D0A2020656E643B0D0A202020200D0A20206966
        20706C5072657644617952485B27497345786152616365275D203D2054727565
        207468656E20626567696E0D0A202020202020204578616374615061796F7574
        2E56697369626C65203A3D20547275653B0D0A2020656E6420656C7365206265
        67696E0D0A202020202020204578616374615061796F75742E56697369626C65
        203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A0D0A0D0A0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060C4578616374615061796F7574
        094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506134465
        7461696C416674657247656E65726174650B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365062F70726F63656475726520446574
        61696C416674657247656E65726174653B0D0A626567696E0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060644657461696C094576656E744E61
        6D65060D416674657247656E6572617465074576656E74494402190001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D6506125069636B
        335061796F75744F6E5072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C5701000070726F63656475726520506963
        6B335061796F75744F6E5072696E743B0D0A626567696E0D0A20200D0A202050
        69636B335061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A
        2020696620706C5072657644617952485B2749735069636B334D617463686564
        466972737452616365275D203D2054727565207468656E20626567696E0D0A20
        202020205069636B335061796F75742E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E643B0D0A2020696620706C5072657644617952485B274973
        506B3352616365275D203D2054727565207468656E20626567696E0D0A202020
        202020205069636B335061796F75742E56697369626C65203A3D20547275653B
        0D0A2020656E6420656C736520626567696E0D0A202020202020205069636B33
        5061796F75742E56697369626C65203A3D2046616C73653B0D0A2020656E643B
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B5069636B3350
        61796F7574094576656E744E616D6506074F6E5072696E74074576656E744944
        02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65060E57696E4E6272734F6E5072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506DE70726F6365647572652057696E
        4E6272734F6E5072696E743B0D0A626567696E0D0A0D0A202057696E4E627273
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A202020
        696620706C5072657644617948485B2746696E697368506F73275D203D203120
        7468656E20626567696E0D0A202020202057696E4E6272732E466F6E742E426F
        6C64203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A20
        2020202057696E4E6272732E466F6E742E426F6C64203A3D2046616C73653B0D
        0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0757696E4E627273094576656E744E616D6506074F6E5072696E74074576656E
        74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65061357696E506C635061796F75744F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506F470726F6365
        647572652057696E506C635061796F75744F6E5072696E743B0D0A626567696E
        0D0A0D0A202057696E506C635061796F75742E466F6E742E426F6C64203A3D20
        46616C73653B0D0A20202020200D0A202020696620706C507265764461794848
        5B2746696E697368506F73275D203D2031207468656E20626567696E0D0A2020
        20202057696E506C635061796F75742E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A202020202057696E506C
        635061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A202065
        6E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C57
        696E506C635061796F7574094576656E744E616D6506074F6E5072696E740745
        76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65061357696E53686F5061796F75744F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506F67072
        6F6365647572652057696E53686F5061796F75744F6E5072696E743B0D0A6265
        67696E0D0A0D0A202057696E53686F5061796F75742E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A20202020200D0A202020696620706C507265764461
        7948485B2746696E697368506F73275D203D2031207468656E20626567696E0D
        0A202020202057696E53686F5061796F75742E466F6E742E426F6C64203A3D20
        547275653B0D0A2020656E6420656C736520626567696E0D0A20202020205769
        6E53686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A
        2020656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060C57696E53686F5061796F7574094576656E744E616D6506074F6E5072
        696E74074576656E74494402200001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060E506C634E6272734F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506E37072
        6F63656475726520506C634E6272734F6E5072696E743B0D0A626567696E0D0A
        0D0A202020506C634E6272732E466F6E742E426F6C64203A3D2046616C73653B
        0D0A20202020200D0A202020696620706C5072657644617948485B2746696E69
        7368506F73275D203D2032207468656E20626567696E0D0A2020202020506C63
        4E6272732E466F6E742E426F6C64203A3D20547275653B0D0A2020656E642065
        6C736520626567696E0D0A2020202020506C634E6272732E466F6E742E426F6C
        64203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D650607506C634E627273094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060E53686F4E6272734F6E50
        72696E740B50726F6772616D54797065070B747450726F63656475726506536F
        7572636506DD70726F6365647572652053686F4E6272734F6E5072696E743B0D
        0A626567696E0D0A20202053686F4E6272732E466F6E742E426F6C64203A3D20
        46616C73653B0D0A20202020200D0A202020696620706C507265764461794848
        5B2746696E697368506F73275D203D2033207468656E20626567696E0D0A2020
        20202053686F4E6272732E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202053686F4E6272732E466F
        6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060753686F4E627273094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D650610506C635061796F75
        744F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F7572636506E570726F63656475726520506C635061796F75744F6E50
        72696E743B0D0A626567696E0D0A202020506C635061796F75742E466F6E742E
        426F6C64203A3D2046616C73653B0D0A20202020200D0A202020696620706C50
        72657644617948485B2746696E697368506F73275D203D2032207468656E2062
        6567696E0D0A2020202020506C635061796F75742E466F6E742E426F6C64203A
        3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020202020
        506C635061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060950
        6C635061796F7574094576656E744E616D6506074F6E5072696E74074576656E
        74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D650613506C6353686F5061796F75744F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506F370726F6365
        6475726520506C6353686F5061796F75744F6E5072696E743B0D0A626567696E
        0D0A202020506C6353686F5061796F75742E466F6E742E426F6C64203A3D2046
        616C73653B0D0A20202020200D0A202020696620706C5072657644617948485B
        2746696E697368506F73275D203D2032207468656E20626567696E0D0A202020
        2020506C6353686F5061796F75742E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E6420656C736520626567696E0D0A2020202020506C6353686F
        5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E
        643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C506C
        6353686F5061796F7574094576656E744E616D6506074F6E5072696E74074576
        656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65061053686F5061796F75744F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F7572636506E770726F636564
        7572652053686F5061796F75744F6E5072696E743B0D0A626567696E0D0A2020
        2053686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A
        20202020200D0A202020696620706C5072657644617948485B2746696E697368
        506F73275D203D2033207468656E20626567696E0D0A202020202053686F5061
        796F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E642065
        6C736520626567696E0D0A202020202053686F5061796F75742E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060953686F5061796F7574094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060944444F6E5072696E
        740B50726F6772616D54797065070B747450726F63656475726506536F757263
        650C2B01000070726F6365647572652044444F6E5072696E743B0D0A62656769
        6E0D0A0D0A202044442E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20696620706C5072657644617952485B2749734461696C79446F75626C654D61
        7463686564466972737452616365275D203D2054727565207468656E20626567
        696E0D0A202020202044442E466F6E742E426F6C64203A3D20547275653B0D0A
        2020656E643B0D0A0D0A2020696620706C5072657644617952485B2749734444
        52616365275D203D2054727565207468656E20626567696E0D0A202020202044
        442E56697369626C65203A3D20547275653B0D0A2020656E6420656C73652062
        6567696E0D0A202020202044442E56697369626C65203A3D2046616C73653B0D
        0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        024444094576656E744E616D6506074F6E5072696E74074576656E7449440220
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        164461696C79446F75626C654E6272734F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C7601000070726F63
        6564757265204461696C79446F75626C654E6272734F6E5072696E743B0D0A62
        6567696E0D0A0D0A20204461696C79446F75626C654E6272732E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B
        2749734461696C79446F75626C654D617463686564466972737452616365275D
        203D2054727565207468656E20626567696E0D0A20202020204461696C79446F
        75626C654E6272732E466F6E742E426F6C64203A3D20547275653B0D0A202065
        6E643B0D0A202020200D0A2020696620706C5072657644617952485B27497344
        4452616365275D203D2054727565207468656E20626567696E0D0A2020202020
        20204461696C79446F75626C654E6272732E56697369626C65203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A20202020202020446169
        6C79446F75626C654E6272732E56697369626C65203A3D2046616C73653B0D0A
        2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060F4461696C79446F75626C654E627273094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060C5069636B334F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C42010000
        70726F636564757265205069636B334F6E5072696E743B0D0A626567696E0D0A
        20205069636B332E466F6E742E426F6C64203A3D2046616C73653B0D0A202069
        6620706C5072657644617952485B2749735069636B334D617463686564466972
        737452616365275D203D2054727565207468656E20626567696E0D0A20202020
        205069636B332E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        3B0D0A20200D0A202020696620706C5072657644617952485B274973506B3352
        616365275D203D2054727565207468656E20626567696E0D0A20202020202020
        5069636B332E56697369626C65203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A202020202020205069636B332E56697369626C65203A
        3D2046616C73653B0D0A2020656E643B0D0A20200D0A20200D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D6506055069636B33094576656E744E616D
        6506074F6E5072696E74074576656E74494402200001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65060C5069636B344F6E5072696E
        740B50726F6772616D54797065070B747450726F63656475726506536F757263
        650C3B01000070726F636564757265205069636B344F6E5072696E743B0D0A62
        6567696E0D0A205069636B342E466F6E742E426F6C64203A3D2046616C73653B
        0D0A2020696620706C5072657644617952485B2749735069636B344D61746368
        6564466972737452616365275D203D2054727565207468656E20626567696E0D
        0A20202020205069636B342E466F6E742E426F6C64203A3D20547275653B0D0A
        2020656E643B0D0A20200D0A20200D0A20696620706C5072657644617952485B
        274973506B3452616365275D203D2054727565207468656E20626567696E0D0A
        202020202020205069636B342E56697369626C65203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202020205069636B342E5669
        7369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D6506055069636B34094576656E744E616D65
        06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D6506105069636B334E6272734F6E50
        72696E740B50726F6772616D54797065070B747450726F63656475726506536F
        757263650C4C01000070726F636564757265205069636B334E6272734F6E5072
        696E743B0D0A626567696E0D0A20205069636B334E6272732E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B27
        49735069636B334D617463686564466972737452616365275D203D2054727565
        207468656E20626567696E0D0A20202020205069636B334E6272732E466F6E74
        2E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D0A20696620
        706C5072657644617952485B274973506B3352616365275D203D205472756520
        7468656E20626567696E0D0A202020202020205069636B334E6272732E566973
        69626C65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D
        0A202020202020205069636B334E6272732E56697369626C65203A3D2046616C
        73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506095069636B334E627273094576656E744E616D6506074F6E5072696E
        74074576656E74494402200001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D6506105069636B344E6272734F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C500100
        0070726F636564757265205069636B344E6272734F6E5072696E743B0D0A6265
        67696E0D0A20205069636B344E6272732E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020696620706C5072657644617952485B2749735069636B344D
        617463686564466972737452616365275D203D2054727565207468656E206265
        67696E0D0A20202020205069636B344E6272732E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E643B0D0A20200D0A20696620706C507265764461
        7952485B274973506B3452616365275D203D2054727565207468656E20626567
        696E0D0A202020202020205069636B344E6272732E56697369626C65203A3D20
        547275653B0D0A2020656E6420656C736520626567696E0D0A20202020202020
        5069636B344E6272732E56697369626C65203A3D2046616C73653B0D0A202065
        6E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        095069636B344E627273094576656E744E616D6506074F6E5072696E74074576
        656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060F4C617465506163654F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C5101000070726F63
        6564757265204C617465506163654F6E5072696E743B0D0A626567696E0D0A20
        20202020204C617465506163652E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020202020204C617465506163652E466F6E742E556E6465726C696E65
        203A3D2046616C73653B0D0A2020202020200D0A09696620706C507265764461
        7948485B274C6174655061636552616E6B275D203D2031207468656E20626567
        696E0D0A2020200920204C617465506163652E466F6E742E426F6C64203A3D20
        547275653B0D0A2020202020202020696620706C5072657644617948485B2749
        734261636B446F75626C654C696E6572275D207468656E20626567696E0D0A09
        2020202020204C617465506163652E466F6E742E556E6465726C696E65203A3D
        20547275653B0D0A202020202020202020656E643B200D0A202020202020656E
        643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506084C6174
        6550616365094576656E744E616D6506074F6E5072696E74074576656E744944
        02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65060E45726C506163654F6E5072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C4F01000070726F63656475726520
        45726C506163654F6E5072696E743B0D0A626567696E0D0A0D0A202020202020
        45726C506163652E466F6E742E426F6C64203A3D2046616C73653B0D0A202020
        20202045726C506163652E466F6E742E556E6465726C696E65203A3D2046616C
        73653B0D0A2020202020200D0A09696620706C5072657644617948485B274561
        726C795061636552616E6B275D203D2031207468656E20626567696E0D0A0920
        202045726C506163652E466F6E742E426F6C64203A3D20547275653B0D0A2020
        20202020202020696620706C5072657644617948485B27497346726F6E74446F
        75626C654C696E6572275D207468656E20626567696E0D0A0920202020202045
        726C506163652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A
        202020202020202020656E643B200D0A202020202020656E643B200D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060745726C5061636509457665
        6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65060E4D6964506163
        654F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C1B02000070726F636564757265204D6964506163654F6E
        5072696E743B0D0A626567696E0D0A094D6964506163652E466F6E742E556E64
        65726C696E65203A3D2046616C73653B0D0A2020202020204D6964506163652E
        466F6E742E426F6C64203A3D2046616C73653B0D0A2020202020200D0A096966
        20706C5072657644617948485B274D6964646C655061636552616E6B275D203D
        2031207468656E20626567696E0D0A092020204D6964506163652E466F6E742E
        426F6C64203A3D20547275653B0D0A202020202020202020696620706C507265
        7644617948485B27497346726F6E74446F75626C654C696E6572275D20746865
        6E20626567696E0D0A092020202020204D6964506163652E466F6E742E556E64
        65726C696E65203A3D20547275653B0D0A202020202020202020656E643B200D
        0A202020202020656E643B200D0A0D0A09696620706C5072657644617948485B
        274D6964646C655061636552616E6B275D203D2031207468656E20626567696E
        0D0A092020204D6964506163652E466F6E742E426F6C64203A3D20547275653B
        0D0A202020202020202020696620706C5072657644617948485B274973426163
        6B446F75626C654C696E6572275D207468656E20626567696E0D0A0920202020
        20204D6964506163652E466F6E742E556E6465726C696E65203A3D2054727565
        3B0D0A202020202020202020656E643B200D0A202020202020656E643B200D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506074D69645061636509
        4576656E744E616D6506074F6E5072696E74074576656E74494402200001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D6506126C626C
        45726C506F734F6E476574546578740B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C2101000070726F636564757265206C62
        6C45726C506F734F6E476574546578742876617220546578743A20537472696E
        67293B0D0A626567696E0D0A2054657874203A3D202720273B0D0A20200D0A20
        20696620706C5072657644617948485B274561726C7950616365506F73275D20
        3C3E2039393939207468656E20626567696E0D0A20202020696620706C507265
        7644617948485B274561726C7950616365506F73275D203C3E2030207468656E
        20626567696E0D0A092020696620706C5072657644617948485B274561726C79
        50616365506F7352616E6B275D203D2031207468656E20626567696E0D0A0909
        202054657874203A3D20272A273B0D0A092020656E643B0D0A20202020656E64
        3B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506096C626C45726C506F73094576656E744E616D6506094F6E47657454
        657874074576656E74494402350001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D6506126C626C4D6964506F734F6E47657454657874
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        0C3E01000070726F636564757265206C626C4D6964506F734F6E476574546578
        742876617220546578743A20537472696E67293B0D0A626567696E0D0A546578
        74203A3D202720273B0D0A0D0A2020696620706C5072657644617948485B274D
        6964646C6550616365506F73275D203C3E2039393939207468656E2062656769
        6E0D0A2020202020696620706C5072657644617948485B274D6964646C655061
        6365506F73275D203C3E2030207468656E20626567696E0D0A20202020202020
        20696620706C5072657644617948485B274D6964646C6550616365506F735261
        6E6B275D203D2031207468656E20626567696E0D0A2020202020202020202020
        54657874203A3D20272A273B0D0A2020202020202020656E643B0D0A20202020
        20656E643B0D0A2020656E643B202020202020200D0A0D0A200D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D6506096C626C4D6964506F7309457665
        6E744E616D6506094F6E47657454657874074576656E74494402350001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D6506136C626C4C
        617465506F734F6E476574546578740B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C3701000070726F636564757265206C62
        6C4C617465506F734F6E476574546578742876617220546578743A2053747269
        6E67293B0D0A626567696E0D0A0D0A20200D0A202054657874203A3D20272027
        3B0D0A20200D0A2020696620706C5072657644617948485B274C617465506163
        65506F73275D203C3E2039393939207468656E20626567696E0D0A2020202020
        696620706C5072657644617948485B274C61746550616365506F73275D203C3E
        2030207468656E20626567696E0D0A2020202020202020696620706C50726576
        44617948485B274C61746550616365506F7352616E6B275D203D203120746865
        6E20626567696E0D0A2009202020202054657874203A3D20272A273B0D0A2020
        202020202020656E643B0D0A2020202020656E643B0D0A2020656E643B0D0A0D
        0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A6C626C4C61
        7465506F73094576656E744E616D6506094F6E47657454657874074576656E74
        494402350001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D6506135175696E656C6C614E6272734F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C5901000070726F
        636564757265205175696E656C6C614E6272734F6E5072696E743B0D0A626567
        696E090D0A20205175696E656C6C614E6272732E466F6E742E426F6C64203A3D
        2046616C73653B0D0A2020696620706C5072657644617952485B274973517569
        6E656C6C614D617463686564275D203D2054727565207468656E20626567696E
        0D0A20202020205175696E656C6C614E6272732E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E643B0D0A202020200D0A2020696620706C507265
        7644617952485B27497351756952616365275D203D2054727565207468656E20
        626567696E0D0A202020202020205175696E656C6C614E6272732E5669736962
        6C65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A20
        2020202020205175696E656C6C614E6272732E56697369626C65203A3D204661
        6C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060C5175696E656C6C614E627273094576656E744E616D6506074F6E
        5072696E74074576656E74494402200001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D6506114578616374614E6272734F6E5072696E
        740B50726F6772616D54797065070B747450726F63656475726506536F757263
        650C4E01000070726F636564757265204578616374614E6272734F6E5072696E
        743B0D0A626567696E0D0A20204578616374614E6272732E466F6E742E426F6C
        64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B2749
        734578616374614D617463686564275D203D2054727565207468656E20626567
        696E0D0A20202020204578616374614E6272732E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E643B0D0A202020200D0A2020696620706C507265
        7644617952485B27497345786152616365275D203D2054727565207468656E20
        626567696E0D0A202020202020204578616374614E6272732E56697369626C65
        203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A202020
        202020204578616374614E6272732E56697369626C65203A3D2046616C73653B
        0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060A4578616374614E627273094576656E744E616D6506074F6E5072696E
        74074576656E74494402200001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65061354726966656374614E6272734F6E5072696E740B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        5A01000070726F6365647572652054726966656374614E6272734F6E5072696E
        743B0D0A626567696E0D0A202054726966656374614E6272732E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B
        27497354726966656374614D617463686564275D203D2054727565207468656E
        20626567696E0D0A202020202054726966656374614E6272732E466F6E742E42
        6F6C64203A3D20547275653B0D0A2020656E643B0D0A202020200D0A20206966
        20706C5072657644617952485B27497354726952616365275D203D2054727565
        207468656E20626567696E0D0A2020202020202054726966656374614E627273
        2E56697369626C65203A3D20547275653B0D0A2020656E6420656C7365206265
        67696E0D0A2020202020202054726966656374614E6272732E56697369626C65
        203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D65060C54726966656374614E627273094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D6506155375706572666563
        74614E6272734F6E5072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F757263650C9601000070726F6365647572652053757065
        7266656374614E6272734F6E5072696E743B0D0A626567696E0D0A2020537570
        657266656374614E6272732E466F6E742E426F6C64203A3D2046616C73653B0D
        0A2020696620706C5072657644617952485B274973537570657266656374614D
        617463686564275D203D2054727565207468656E20626567696E0D0A20202020
        20537570657266656374614E6272732E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E643B0D0A202020200D0A206966202828706C507265764461
        7952485B274973537570657252616365275D203D20547275652920616E642028
        706C5072657644617952485B27537570657266656374615761676572416D7427
        5D203E203029297468656E20626567696E0D0A20202020202020537570657266
        656374614E6272732E56697369626C65203A3D20547275653B0D0A2020656E64
        20656C736520626567696E0D0A20202020202020537570657266656374614E62
        72732E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E5375706572666563
        74614E627273094576656E744E616D6506074F6E5072696E74074576656E7449
        4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060C53757065724F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C6201000070726F6365647572652053
        757065724F6E5072696E743B0D0A626567696E0D0A202053757065722E466F6E
        742E426F6C64203A3D2046616C73653B0D0A2020696620706C50726576446179
        52485B27497353757065724D617463686564275D203D2054727565207468656E
        20626567696E0D0A202020202053757065722E466F6E742E426F6C64203A3D20
        547275653B0D0A2020656E643B0D0A20200D0A20206966202828706C50726576
        44617952485B274973537570657252616365275D203D20547275652920616E64
        2028706C5072657644617952485B27537570657266656374615761676572416D
        74275D203E203029297468656E20626567696E0D0A2020202020202020537570
        65722E56697369626C65203A3D20547275653B0D0A2020656E6420656C736520
        626567696E0D0A2020202020202053757065722E56697369626C65203A3D2046
        616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506055375706572094576656E744E616D6506074F6E5072696E7407
        4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060A5472694F6E5072696E740B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C2901000070726F63656475
        7265205472694F6E5072696E743B0D0A626567696E0D0A20205472692E466F6E
        742E426F6C64203A3D2046616C73653B0D0A2020696620706C50726576446179
        52485B2749735472694D617463686564275D203D2054727565207468656E2062
        6567696E0D0A20202020205472692E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E643B0D0A20200D0A20200D0A20696620706C50726576446179
        52485B27497354726952616365275D203D2054727565207468656E2062656769
        6E0D0A202020202020205472692E56697369626C65203A3D20547275653B0D0A
        2020656E6420656C736520626567696E0D0A202020202020205472692E566973
        69626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D650603547269094576656E744E616D6506
        074F6E5072696E74074576656E74494402200001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65060D4578616374614F6E5072696E74
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        0C3A01000070726F636564757265204578616374614F6E5072696E743B0D0A62
        6567696E0D0A20204578616374612E466F6E742E426F6C64203A3D2046616C73
        653B0D0A2020696620706C5072657644617952485B2749734578614D61746368
        6564275D203D2054727565207468656E20626567696E0D0A2020202020457861
        6374612E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A
        20200D0A20200D0A20696620706C5072657644617952485B2749734578615261
        6365275D203D2054727565207468656E20626567696E0D0A2020202020202045
        78616374612E56697369626C65203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A202020202020204578616374612E56697369626C6520
        3A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D650606457861637461094576656E744E616D6506
        074F6E5072696E74074576656E74494402200001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65060F5175696E656C6C614F6E507269
        6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650C4001000070726F636564757265205175696E656C6C614F6E5072696E74
        3B0D0A626567696E0D0A20205175696E656C6C612E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020696620706C5072657644617952485B2749735175
        694D617463686564275D203D2054727565207468656E20626567696E0D0A2020
        2020205175696E656C6C612E466F6E742E426F6C64203A3D20547275653B0D0A
        2020656E643B0D0A20200D0A20200D0A20696620706C5072657644617952485B
        27497351756952616365275D203D2054727565207468656E20626567696E0D0A
        202020202020205175696E656C6C612E56697369626C65203A3D20547275653B
        0D0A2020656E6420656C736520626567696E0D0A202020202020205175696E65
        6C6C612E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D6506085175696E656C6C6109
        4576656E744E616D6506074F6E5072696E74074576656E74494402200000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 464
    Top = 40
  end
  object tblPrevDayRH: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 'IsPrintedOnValueSheet=True'
    Filtered = True
    OnNewRecord = tblPrevDayRHNewRecord
    DatabaseName = 'dbYouBetWagerResultsReport'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByEstTimeOfRace'
    MasterFields = 'RangeRaceDate;RaceDate;EstTimeOfRace;TrkCode;RaceNbr'
    MasterSource = dsPrevDayHH
    TableName = 'PrevDayRH'
    Left = 32
    Top = 112
  end
  object dsPrevDayRH: TDataSource
    DataSet = tblPrevDayRH
    Left = 32
    Top = 160
  end
  object plPrevDayRH: TppDBPipeline
    DataSource = dsPrevDayRH
    CloseDataSource = True
    UserName = 'plPrevDayRH'
    Left = 40
    Top = 232
    MasterDataPipelineName = 'plPrevDayHH'
    object plPrevDayRHppField1: TppField
      FieldAlias = 'TrkCode'
      FieldName = 'TrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 0
    end
    object plPrevDayRHppField2: TppField
      FieldAlias = 'RaceDate'
      FieldName = 'RaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object plPrevDayRHppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceNbr'
      FieldName = 'RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object plPrevDayRHppField4: TppField
      FieldAlias = 'RangeRaceDate'
      FieldName = 'RangeRaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 3
    end
    object plPrevDayRHppField5: TppField
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object plPrevDayRHppField6: TppField
      FieldAlias = 'TypeOfRace'
      FieldName = 'TypeOfRace'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object plPrevDayRHppField7: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object plPrevDayRHppField8: TppField
      FieldAlias = 'OrigSurface'
      FieldName = 'OrigSurface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object plPrevDayRHppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFeet'
      FieldName = 'DistanceInFeet'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object plPrevDayRHppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object plPrevDayRHppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInYards'
      FieldName = 'DistanceInYards'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object plPrevDayRHppField12: TppField
      FieldAlias = 'IsPk3Race'
      FieldName = 'IsPk3Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 11
    end
    object plPrevDayRHppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3RaceNbr'
      FieldName = 'Pk3RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object plPrevDayRHppField14: TppField
      FieldAlias = 'IsPk4Race'
      FieldName = 'IsPk4Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 13
    end
    object plPrevDayRHppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk4RaceNbr'
      FieldName = 'Pk4RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object plPrevDayRHppField16: TppField
      FieldAlias = 'IsPk6Race'
      FieldName = 'IsPk6Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 15
    end
    object plPrevDayRHppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk6RaceNbr'
      FieldName = 'Pk6RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object plPrevDayRHppField18: TppField
      FieldAlias = 'IsTriRace'
      FieldName = 'IsTriRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 17
    end
    object plPrevDayRHppField19: TppField
      FieldAlias = 'IsSuperRace'
      FieldName = 'IsSuperRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 18
    end
    object plPrevDayRHppField20: TppField
      FieldAlias = 'IsPk9Place'
      FieldName = 'IsPk9Place'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 19
    end
    object plPrevDayRHppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk9RaceNbr'
      FieldName = 'Pk9RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object plPrevDayRHppField22: TppField
      FieldAlias = 'IsExaRace'
      FieldName = 'IsExaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 21
    end
    object plPrevDayRHppField23: TppField
      FieldAlias = 'IsQuiRace'
      FieldName = 'IsQuiRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 22
    end
    object plPrevDayRHppField24: TppField
      FieldAlias = 'IsDDRace'
      FieldName = 'IsDDRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 23
    end
    object plPrevDayRHppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'DDRaceNbr'
      FieldName = 'DDRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object plPrevDayRHppField26: TppField
      FieldAlias = 'IsPk3Leg1'
      FieldName = 'IsPk3Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 25
    end
    object plPrevDayRHppField27: TppField
      FieldAlias = 'IsPk4Leg1'
      FieldName = 'IsPk4Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 26
    end
    object plPrevDayRHppField28: TppField
      FieldAlias = 'IsPk6Leg1'
      FieldName = 'IsPk6Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 27
    end
    object plPrevDayRHppField29: TppField
      FieldAlias = 'IsPk9Leg1'
      FieldName = 'IsPk9Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 28
    end
    object plPrevDayRHppField30: TppField
      FieldAlias = 'IsDDLeg1'
      FieldName = 'IsDDLeg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 29
    end
    object plPrevDayRHppField31: TppField
      FieldAlias = 'RaceCondition1'
      FieldName = 'RaceCondition1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 30
    end
    object plPrevDayRHppField32: TppField
      FieldAlias = 'RaceCondition2'
      FieldName = 'RaceCondition2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object plPrevDayRHppField33: TppField
      FieldAlias = 'RaceCondition3'
      FieldName = 'RaceCondition3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 32
    end
    object plPrevDayRHppField34: TppField
      FieldAlias = 'RaceCondition4'
      FieldName = 'RaceCondition4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 33
    end
    object plPrevDayRHppField35: TppField
      FieldAlias = 'RaceCondition5'
      FieldName = 'RaceCondition5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 34
    end
    object plPrevDayRHppField36: TppField
      FieldAlias = 'RaceCondition6'
      FieldName = 'RaceCondition6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 35
    end
    object plPrevDayRHppField37: TppField
      FieldAlias = 'BetLine'
      FieldName = 'BetLine'
      FieldLength = 255
      DisplayWidth = 255
      Position = 36
    end
    object plPrevDayRHppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'Purse'
      FieldName = 'Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object plPrevDayRHppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClaimingPrice'
      FieldName = 'ClaimingPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object plPrevDayRHppField40: TppField
      FieldAlias = 'TrkCond'
      FieldName = 'TrkCond'
      FieldLength = 3
      DisplayWidth = 3
      Position = 39
    end
    object plPrevDayRHppField41: TppField
      FieldAlias = 'DistanceDesc'
      FieldName = 'DistanceDesc'
      FieldLength = 5
      DisplayWidth = 5
      Position = 40
    end
    object plPrevDayRHppField42: TppField
      FieldAlias = 'EstTimeOfRace'
      FieldName = 'EstTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 41
    end
    object plPrevDayRHppField43: TppField
      FieldAlias = 'IsActive'
      FieldName = 'IsActive'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 42
    end
    object plPrevDayRHppField44: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 43
    end
    object plPrevDayRHppField45: TppField
      FieldAlias = 'IsYouBetTrack'
      FieldName = 'IsYouBetTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 44
    end
    object plPrevDayRHppField46: TppField
      FieldAlias = 'IsExactaMatched'
      FieldName = 'IsExactaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 45
    end
    object plPrevDayRHppField47: TppField
      FieldAlias = 'Exacta'
      FieldName = 'Exacta'
      FieldLength = 40
      DisplayWidth = 40
      Position = 46
    end
    object plPrevDayRHppField48: TppField
      FieldAlias = 'ExactaNbrs'
      FieldName = 'ExactaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 47
    end
    object plPrevDayRHppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaWager'
      FieldName = 'ExactaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object plPrevDayRHppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaPayout'
      FieldName = 'ExactaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object plPrevDayRHppField51: TppField
      FieldAlias = 'IsTrifectaMatched'
      FieldName = 'IsTrifectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 50
    end
    object plPrevDayRHppField52: TppField
      FieldAlias = 'Tri'
      FieldName = 'Tri'
      FieldLength = 40
      DisplayWidth = 40
      Position = 51
    end
    object plPrevDayRHppField53: TppField
      FieldAlias = 'TrifectaNbrs'
      FieldName = 'TrifectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 52
    end
    object plPrevDayRHppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaWager'
      FieldName = 'TrifectaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object plPrevDayRHppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaPayout'
      FieldName = 'TrifectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object plPrevDayRHppField56: TppField
      FieldAlias = 'IsSuperfectaMatched'
      FieldName = 'IsSuperfectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 55
    end
    object plPrevDayRHppField57: TppField
      FieldAlias = 'Super'
      FieldName = 'Super'
      FieldLength = 40
      DisplayWidth = 40
      Position = 56
    end
    object plPrevDayRHppField58: TppField
      FieldAlias = 'SuperfectaNbrs'
      FieldName = 'SuperfectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 57
    end
    object plPrevDayRHppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaWager'
      FieldName = 'SuperfectaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object plPrevDayRHppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaPayout'
      FieldName = 'SuperfectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object plPrevDayRHppField61: TppField
      FieldAlias = 'IsDailyDoubleMatchedFirstRace'
      FieldName = 'IsDailyDoubleMatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 60
    end
    object plPrevDayRHppField62: TppField
      FieldAlias = 'IsDailyDoubleMatchedLastRace'
      FieldName = 'IsDailyDoubleMatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 61
    end
    object plPrevDayRHppField63: TppField
      FieldAlias = 'DDFirstRace'
      FieldName = 'DDFirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 62
    end
    object plPrevDayRHppField64: TppField
      FieldAlias = 'DDLastRace'
      FieldName = 'DDLastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 63
    end
    object plPrevDayRHppField65: TppField
      FieldAlias = 'DailyDoubleNbrsFirstRace'
      FieldName = 'DailyDoubleNbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 64
    end
    object plPrevDayRHppField66: TppField
      FieldAlias = 'DailyDoubleNbrsLastRace'
      FieldName = 'DailyDoubleNbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 65
    end
    object plPrevDayRHppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerFirstRace'
      FieldName = 'DailyDoubleWagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object plPrevDayRHppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerLastRace'
      FieldName = 'DailyDoubleWagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object plPrevDayRHppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutFirstRace'
      FieldName = 'DailyDoublePayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object plPrevDayRHppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutLastRace'
      FieldName = 'DailyDoublePayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object plPrevDayRHppField71: TppField
      FieldAlias = 'IsQuinellaMatched'
      FieldName = 'IsQuinellaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 70
    end
    object plPrevDayRHppField72: TppField
      FieldAlias = 'Quinella'
      FieldName = 'Quinella'
      FieldLength = 40
      DisplayWidth = 40
      Position = 71
    end
    object plPrevDayRHppField73: TppField
      FieldAlias = 'QuinellaNbrs'
      FieldName = 'QuinellaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 72
    end
    object plPrevDayRHppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaWager'
      FieldName = 'QuinellaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object plPrevDayRHppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaPayout'
      FieldName = 'QuinellaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object plPrevDayRHppField76: TppField
      FieldAlias = 'IsPick3MatchedFirstRace'
      FieldName = 'IsPick3MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 75
    end
    object plPrevDayRHppField77: TppField
      FieldAlias = 'IsPick3MatchedLastRace'
      FieldName = 'IsPick3MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 76
    end
    object plPrevDayRHppField78: TppField
      FieldAlias = 'Pick3FirstRace'
      FieldName = 'Pick3FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 77
    end
    object plPrevDayRHppField79: TppField
      FieldAlias = 'Pick3LastRace'
      FieldName = 'Pick3LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 78
    end
    object plPrevDayRHppField80: TppField
      FieldAlias = 'Pick3NbrsFirstRace'
      FieldName = 'Pick3NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 79
    end
    object plPrevDayRHppField81: TppField
      FieldAlias = 'Pick3NbrsLastRace'
      FieldName = 'Pick3NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 80
    end
    object plPrevDayRHppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerFirstRace'
      FieldName = 'Pick3WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object plPrevDayRHppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerLastRace'
      FieldName = 'Pick3WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object plPrevDayRHppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutFirstRace'
      FieldName = 'Pick3PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object plPrevDayRHppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutLastRace'
      FieldName = 'Pick3PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object plPrevDayRHppField86: TppField
      FieldAlias = 'Pick3NbrsLeg1'
      FieldName = 'Pick3NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 85
    end
    object plPrevDayRHppField87: TppField
      FieldAlias = 'Pick3NbrsLeg2'
      FieldName = 'Pick3NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 86
    end
    object plPrevDayRHppField88: TppField
      FieldAlias = 'Pick3NbrsLeg3'
      FieldName = 'Pick3NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 87
    end
    object plPrevDayRHppField89: TppField
      FieldAlias = 'IsPick4MatchedFirstRace'
      FieldName = 'IsPick4MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 88
    end
    object plPrevDayRHppField90: TppField
      FieldAlias = 'IsPick4MatchedLastRace'
      FieldName = 'IsPick4MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 89
    end
    object plPrevDayRHppField91: TppField
      FieldAlias = 'Pick4FirstRace'
      FieldName = 'Pick4FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 90
    end
    object plPrevDayRHppField92: TppField
      FieldAlias = 'Pick4LastRace'
      FieldName = 'Pick4LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 91
    end
    object plPrevDayRHppField93: TppField
      FieldAlias = 'Pick4NbrsFirstRace'
      FieldName = 'Pick4NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 92
    end
    object plPrevDayRHppField94: TppField
      FieldAlias = 'Pick4NbrsLastRace'
      FieldName = 'Pick4NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 93
    end
    object plPrevDayRHppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerFirstRace'
      FieldName = 'Pick4WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object plPrevDayRHppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerLastRace'
      FieldName = 'Pick4WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 95
    end
    object plPrevDayRHppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutFirstRace'
      FieldName = 'Pick4PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 96
    end
    object plPrevDayRHppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutLastRace'
      FieldName = 'Pick4PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 97
    end
    object plPrevDayRHppField99: TppField
      FieldAlias = 'Pick4NbrsLeg1'
      FieldName = 'Pick4NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 98
    end
    object plPrevDayRHppField100: TppField
      FieldAlias = 'Pick4NbrsLeg2'
      FieldName = 'Pick4NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 99
    end
    object plPrevDayRHppField101: TppField
      FieldAlias = 'Pick4NbrsLeg3'
      FieldName = 'Pick4NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 100
    end
    object plPrevDayRHppField102: TppField
      FieldAlias = 'Pick4NbrsLeg4'
      FieldName = 'Pick4NbrsLeg4'
      FieldLength = 25
      DisplayWidth = 25
      Position = 101
    end
    object plPrevDayRHppField103: TppField
      FieldAlias = 'IsPick6MatchedFirstRace'
      FieldName = 'IsPick6MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 102
    end
    object plPrevDayRHppField104: TppField
      FieldAlias = 'IsPick6MatchedLastRace'
      FieldName = 'IsPick6MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 103
    end
    object plPrevDayRHppField105: TppField
      FieldAlias = 'Pick6FirstRace'
      FieldName = 'Pick6FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 104
    end
    object plPrevDayRHppField106: TppField
      FieldAlias = 'Pick6LastRace'
      FieldName = 'Pick6LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 105
    end
    object plPrevDayRHppField107: TppField
      FieldAlias = 'Pick6NbrsFirstRace'
      FieldName = 'Pick6NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 106
    end
    object plPrevDayRHppField108: TppField
      FieldAlias = 'Pick6NbrsLastRace'
      FieldName = 'Pick6NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 107
    end
    object plPrevDayRHppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerFirstRace'
      FieldName = 'Pick6WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object plPrevDayRHppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerLastRace'
      FieldName = 'Pick6WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 109
    end
    object plPrevDayRHppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutFirstRace'
      FieldName = 'Pick6PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object plPrevDayRHppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutLastRace'
      FieldName = 'Pick6PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 111
    end
    object plPrevDayRHppField113: TppField
      FieldAlias = 'IsWinMatched'
      FieldName = 'IsWinMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 112
    end
    object plPrevDayRHppField114: TppField
      FieldAlias = 'WinNbrs'
      FieldName = 'WinNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 113
    end
    object plPrevDayRHppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPayout'
      FieldName = 'WinPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object plPrevDayRHppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPlcPayout'
      FieldName = 'WinPlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 115
    end
    object plPrevDayRHppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinShoPayout'
      FieldName = 'WinShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object plPrevDayRHppField118: TppField
      FieldAlias = 'IsPlcMatched'
      FieldName = 'IsPlcMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 117
    end
    object plPrevDayRHppField119: TppField
      FieldAlias = 'PlcNbrs'
      FieldName = 'PlcNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 118
    end
    object plPrevDayRHppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcPayout'
      FieldName = 'PlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 119
    end
    object plPrevDayRHppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcShoPayout'
      FieldName = 'PlcShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object plPrevDayRHppField122: TppField
      FieldAlias = 'IsShoMatched'
      FieldName = 'IsShoMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 121
    end
    object plPrevDayRHppField123: TppField
      FieldAlias = 'ShoNbrs'
      FieldName = 'ShoNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 122
    end
    object plPrevDayRHppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'ShoPayout'
      FieldName = 'ShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 123
    end
    object plPrevDayRHppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'WPSWagerAmt'
      FieldName = 'WPSWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 124
    end
    object plPrevDayRHppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExaWagerAmt'
      FieldName = 'ExaWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 125
    end
    object plPrevDayRHppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuiWagerAmt'
      FieldName = 'QuiWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 126
    end
    object plPrevDayRHppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'DDWagerAmt'
      FieldName = 'DDWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 127
    end
    object plPrevDayRHppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3WagerAmt'
      FieldName = 'Pk3WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 128
    end
    object plPrevDayRHppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk4WagerAmt'
      FieldName = 'Pk4WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 129
    end
    object plPrevDayRHppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk6WagerAmt'
      FieldName = 'Pk6WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 130
    end
    object plPrevDayRHppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'TriWagerAmt'
      FieldName = 'TriWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 131
    end
    object plPrevDayRHppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'SfcWagerAmt'
      FieldName = 'SfcWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 132
    end
    object plPrevDayRHppField134: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrStarters'
      FieldName = 'NbrStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 133
    end
    object plPrevDayRHppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrDebutStarters'
      FieldName = 'NbrDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 134
    end
    object plPrevDayRHppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrDebutTwoStarters'
      FieldName = 'NbrDebutTwoStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 135
    end
    object plPrevDayRHppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrTurfDebutStarters'
      FieldName = 'NbrTurfDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 136
    end
    object plPrevDayRHppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrRouteDebutStarters'
      FieldName = 'NbrRouteDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 137
    end
    object plPrevDayRHppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrScratchedStarters'
      FieldName = 'NbrScratchedStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 138
    end
    object plPrevDayRHppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrRunners'
      FieldName = 'NbrRunners'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 139
    end
    object plPrevDayRHppField141: TppField
      FieldAlias = 'RaceTypeDesc'
      FieldName = 'RaceTypeDesc'
      FieldLength = 25
      DisplayWidth = 25
      Position = 140
    end
    object plPrevDayRHppField142: TppField
      FieldAlias = 'RaceDesc'
      FieldName = 'RaceDesc'
      FieldLength = 250
      DisplayWidth = 250
      Position = 141
    end
    object plPrevDayRHppField143: TppField
      FieldAlias = 'RaceCondition'
      FieldName = 'RaceCondition'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 142
      Searchable = False
      Sortable = False
    end
    object plPrevDayRHppField144: TppField
      FieldAlias = 'IsTurfRace'
      FieldName = 'IsTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 143
    end
    object plPrevDayRHppField145: TppField
      FieldAlias = 'IsRouteRace'
      FieldName = 'IsRouteRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 144
    end
    object plPrevDayRHppField146: TppField
      FieldAlias = 'IsMaidenSpecialRace'
      FieldName = 'IsMaidenSpecialRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 145
    end
    object plPrevDayRHppField147: TppField
      FieldAlias = 'IsMaidenClaimingRace'
      FieldName = 'IsMaidenClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 146
    end
    object plPrevDayRHppField148: TppField
      FieldAlias = 'IsMaidenOrTurfRace'
      FieldName = 'IsMaidenOrTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 147
    end
    object plPrevDayRHppField149: TppField
      FieldAlias = 'IsTwoYearOldRace'
      FieldName = 'IsTwoYearOldRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 148
    end
    object plPrevDayRHppField150: TppField
      FieldAlias = 'IsClaimingRace'
      FieldName = 'IsClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 149
    end
    object plPrevDayRHppField151: TppField
      FieldAlias = 'AgeSexRestriction'
      FieldName = 'AgeSexRestriction'
      FieldLength = 3
      DisplayWidth = 3
      Position = 150
    end
    object plPrevDayRHppField152: TppField
      FieldAlias = 'SimulcastTrkCode'
      FieldName = 'SimulcastTrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 151
    end
    object plPrevDayRHppField153: TppField
      Alignment = taRightJustify
      FieldAlias = 'SimulcastRaceNbr'
      FieldName = 'SimulcastRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 152
    end
    object plPrevDayRHppField154: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceAutoInc'
      FieldName = 'RaceAutoInc'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 153
    end
    object plPrevDayRHppField155: TppField
      FieldAlias = 'TimeDiff'
      FieldName = 'TimeDiff'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 154
    end
    object plPrevDayRHppField156: TppField
      FieldAlias = 'WagerType'
      FieldName = 'WagerType'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 155
      Searchable = False
      Sortable = False
    end
    object plPrevDayRHppField157: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrTriKey'
      FieldName = 'NbrTriKey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 156
    end
    object plPrevDayRHppField158: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalPk3Choices'
      FieldName = 'TotalPk3Choices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 157
    end
    object plPrevDayRHppField159: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3KeyType'
      FieldName = 'Pk3KeyType'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 158
    end
    object plPrevDayRHppField160: TppField
      FieldAlias = 'Pk3Selected'
      FieldName = 'Pk3Selected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 159
    end
    object plPrevDayRHppField161: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTriChoices'
      FieldName = 'TotalTriChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 160
    end
    object plPrevDayRHppField162: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalSuperChoices'
      FieldName = 'TotalSuperChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 161
    end
    object plPrevDayRHppField163: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDDChoices'
      FieldName = 'TotalDDChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 162
    end
    object plPrevDayRHppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLastSpeed'
      FieldName = 'TopLastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 163
    end
    object plPrevDayRHppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopBackSpeed'
      FieldName = 'TopBackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 164
    end
    object plPrevDayRHppField166: TppField
      FieldAlias = 'DD'
      FieldName = 'DD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 165
    end
    object plPrevDayRHppField167: TppField
      FieldAlias = 'Pick3'
      FieldName = 'Pick3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 166
    end
    object plPrevDayRHppField168: TppField
      FieldAlias = 'Pick4'
      FieldName = 'Pick4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 167
    end
    object plPrevDayRHppField169: TppField
      FieldAlias = 'Pick6'
      FieldName = 'Pick6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 168
    end
    object plPrevDayRHppField170: TppField
      FieldAlias = 'ParTime'
      FieldName = 'ParTime'
      FieldLength = 40
      DisplayWidth = 40
      Position = 169
    end
    object plPrevDayRHppField171: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopEarlyPace'
      FieldName = 'TopEarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 170
    end
    object plPrevDayRHppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopMiddlePace'
      FieldName = 'TopMiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 171
    end
    object plPrevDayRHppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLatePace'
      FieldName = 'TopLatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 172
    end
    object plPrevDayRHppField174: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopEarlyPacePos'
      FieldName = 'TopEarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 173
    end
    object plPrevDayRHppField175: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopMiddlePacePos'
      FieldName = 'TopMiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 174
    end
    object plPrevDayRHppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLatePacePos'
      FieldName = 'TopLatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 175
    end
    object plPrevDayRHppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondEarlyPace'
      FieldName = 'SecondEarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 176
    end
    object plPrevDayRHppField178: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondMiddlePace'
      FieldName = 'SecondMiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 177
    end
    object plPrevDayRHppField179: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondLatePace'
      FieldName = 'SecondLatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 178
    end
    object plPrevDayRHppField180: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondEarlyPacePos'
      FieldName = 'SecondEarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 179
    end
    object plPrevDayRHppField181: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondMiddlePacePos'
      FieldName = 'SecondMiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 180
    end
    object plPrevDayRHppField182: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondLatePacePos'
      FieldName = 'SecondLatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 181
    end
    object plPrevDayRHppField183: TppField
      FieldAlias = 'Is10CentSuperfectaRace'
      FieldName = 'Is10CentSuperfectaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 182
    end
    object plPrevDayRHppField184: TppField
      FieldAlias = 'CT'
      FieldName = 'CT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 183
    end
    object plPrevDayRHppField185: TppField
      FieldAlias = 'ET'
      FieldName = 'ET'
      FieldLength = 10
      DisplayWidth = 10
      Position = 184
    end
    object plPrevDayRHppField186: TppField
      FieldAlias = 'PT'
      FieldName = 'PT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 185
    end
    object plPrevDayRHppField187: TppField
      FieldAlias = 'MT'
      FieldName = 'MT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 186
    end
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 280
    Top = 225
  end
end
