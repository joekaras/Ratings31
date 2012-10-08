object WagerReportForm: TWagerReportForm
  Left = 173
  Top = 134
  Width = 703
  Height = 385
  Caption = 'Wager Report'
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
    Left = 6
    Top = 18
    Width = 842
    Height = 50
    BorderStyle = bsSingle
    Caption = 'pnlPrgBar'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
    object prgBar: TProgressBar
      Left = 12
      Top = 14
      Width = 816
      Height = 20
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = 0
    Top = 305
    Width = 846
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = 5
    Top = 78
    Width = 841
    Height = 52
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbWagerReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbWagerReport'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 464
    Top = 144
  end
  object tblRacesMaster: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagerReport'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByEstTimeOfRace'
    ReadOnly = True
    TableName = 'Race.DAT'
    Left = 26
    Top = 101
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    Left = 24
    Top = 192
    object plRacesReportppField1: TppField
      FieldAlias = 'TrkCode'
      FieldName = 'TrkCode'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plRacesReportppField2: TppField
      FieldAlias = 'RaceDate'
      FieldName = 'RaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 1
    end
    object plRacesReportppField3: TppField
      FieldAlias = 'RangeRaceDate'
      FieldName = 'RangeRaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 2
    end
    object plRacesReportppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceNbr'
      FieldName = 'RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object plRacesReportppField5: TppField
      FieldAlias = 'IsActive'
      FieldName = 'IsActive'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 4
    end
    object plRacesReportppField6: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object plRacesReportppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFeet'
      FieldName = 'DistanceInFeet'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object plRacesReportppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInYards'
      FieldName = 'DistanceInYards'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object plRacesReportppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object plRacesReportppField10: TppField
      FieldAlias = 'DistanceDesc'
      FieldName = 'DistanceDesc'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object plRacesReportppField11: TppField
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 10
    end
    object plRacesReportppField12: TppField
      FieldAlias = 'TypeOfRace'
      FieldName = 'TypeOfRace'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object plRacesReportppField13: TppField
      FieldAlias = 'RaceTypeDesc'
      FieldName = 'RaceTypeDesc'
      FieldLength = 25
      DisplayWidth = 25
      Position = 12
    end
    object plRacesReportppField14: TppField
      FieldAlias = 'RaceDesc'
      FieldName = 'RaceDesc'
      FieldLength = 250
      DisplayWidth = 250
      Position = 13
    end
    object plRacesReportppField15: TppField
      FieldAlias = 'RaceCondition'
      FieldName = 'RaceCondition'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 14
      Searchable = False
      Sortable = False
    end
    object plRacesReportppField16: TppField
      FieldAlias = 'IsTurfRace'
      FieldName = 'IsTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 15
    end
    object plRacesReportppField17: TppField
      FieldAlias = 'IsRouteRace'
      FieldName = 'IsRouteRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 16
    end
    object plRacesReportppField18: TppField
      FieldAlias = 'IsMaidenSpecialRace'
      FieldName = 'IsMaidenSpecialRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 17
    end
    object plRacesReportppField19: TppField
      FieldAlias = 'IsMaidenClaimingRace'
      FieldName = 'IsMaidenClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 18
    end
    object plRacesReportppField20: TppField
      FieldAlias = 'IsMaidenOrTurfRace'
      FieldName = 'IsMaidenOrTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 19
    end
    object plRacesReportppField21: TppField
      FieldAlias = 'IsTwoYearOldRace'
      FieldName = 'IsTwoYearOldRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 20
    end
    object plRacesReportppField22: TppField
      FieldAlias = 'IsClaimingRace'
      FieldName = 'IsClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 21
    end
    object plRacesReportppField23: TppField
      FieldAlias = 'AgeSexRestriction'
      FieldName = 'AgeSexRestriction'
      FieldLength = 3
      DisplayWidth = 3
      Position = 22
    end
    object plRacesReportppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'Purse'
      FieldName = 'Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object plRacesReportppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClaimingPrice'
      FieldName = 'ClaimingPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object plRacesReportppField26: TppField
      FieldAlias = 'SimulcastTrkCode'
      FieldName = 'SimulcastTrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 25
    end
    object plRacesReportppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'SimulcastRaceNbr'
      FieldName = 'SimulcastRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object plRacesReportppField28: TppField
      FieldAlias = 'EstTimeOfRace'
      FieldName = 'EstTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 27
    end
    object plRacesReportppField29: TppField
      FieldAlias = 'LocalTimeOfRace'
      FieldName = 'LocalTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 28
    end
    object plRacesReportppField30: TppField
      FieldAlias = 'EstTimeOfFirstRace'
      FieldName = 'EstTimeOfFirstRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 29
    end
    object plRacesReportppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceAutoInc'
      FieldName = 'RaceAutoInc'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 30
    end
    object plRacesReportppField32: TppField
      FieldAlias = 'TimeDiff'
      FieldName = 'TimeDiff'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 31
    end
    object plRacesReportppField33: TppField
      FieldAlias = 'WagerType'
      FieldName = 'WagerType'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 32
      Searchable = False
      Sortable = False
    end
    object plRacesReportppField34: TppField
      FieldAlias = 'IsDDRace'
      FieldName = 'IsDDRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 33
    end
    object plRacesReportppField35: TppField
      FieldAlias = 'DDRaceNbr'
      FieldName = 'DDRaceNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 34
    end
    object plRacesReportppField36: TppField
      FieldAlias = 'IsPk3Race'
      FieldName = 'IsPk3Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 35
    end
    object plRacesReportppField37: TppField
      FieldAlias = 'Pk3RaceNbr'
      FieldName = 'Pk3RaceNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 36
    end
    object plRacesReportppField38: TppField
      FieldAlias = 'IsPk4Race'
      FieldName = 'IsPk4Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 37
    end
    object plRacesReportppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk4RaceNbr'
      FieldName = 'Pk4RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 38
    end
    object plRacesReportppField40: TppField
      FieldAlias = 'IsPk6Race'
      FieldName = 'IsPk6Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 39
    end
    object plRacesReportppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'PK6RaceNbr'
      FieldName = 'PK6RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 40
    end
    object plRacesReportppField42: TppField
      FieldAlias = 'IsTriRace'
      FieldName = 'IsTriRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 41
    end
    object plRacesReportppField43: TppField
      FieldAlias = 'IsSuperRace'
      FieldName = 'IsSuperRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 42
    end
    object plRacesReportppField44: TppField
      FieldAlias = 'IsQuiRace'
      FieldName = 'IsQuiRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 43
    end
    object plRacesReportppField45: TppField
      FieldAlias = 'IsExaRace'
      FieldName = 'IsExaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 44
    end
    object plRacesReportppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrTriKey'
      FieldName = 'NbrTriKey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 45
    end
    object plRacesReportppField47: TppField
      FieldAlias = 'IsPk3Leg1'
      FieldName = 'IsPk3Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 46
    end
    object plRacesReportppField48: TppField
      FieldAlias = 'IsPk4Leg1'
      FieldName = 'IsPk4Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 47
    end
    object plRacesReportppField49: TppField
      FieldAlias = 'IsPk6Leg1'
      FieldName = 'IsPk6Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 48
    end
    object plRacesReportppField50: TppField
      FieldAlias = 'IsPk9Leg1'
      FieldName = 'IsPk9Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 49
    end
    object plRacesReportppField51: TppField
      FieldAlias = 'IsDDLeg1'
      FieldName = 'IsDDLeg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 50
    end
    object plRacesReportppField52: TppField
      FieldAlias = 'IsChalkValue'
      FieldName = 'IsChalkValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 51
    end
    object plRacesReportppField53: TppField
      FieldAlias = 'IsPlayableValue'
      FieldName = 'IsPlayableValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 52
    end
    object plRacesReportppField54: TppField
      FieldAlias = 'IsFinalValue'
      FieldName = 'IsFinalValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 53
    end
    object plRacesReportppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalPk3Choices'
      FieldName = 'TotalPk3Choices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 54
    end
    object plRacesReportppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3KeyType'
      FieldName = 'Pk3KeyType'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 55
    end
    object plRacesReportppField57: TppField
      FieldAlias = 'Pk3Selected'
      FieldName = 'Pk3Selected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 56
    end
    object plRacesReportppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTriChoices'
      FieldName = 'TotalTriChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 57
    end
    object plRacesReportppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalSuperChoices'
      FieldName = 'TotalSuperChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 58
    end
    object plRacesReportppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDDChoices'
      FieldName = 'TotalDDChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 59
    end
    object plRacesReportppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLastSpeed'
      FieldName = 'TopLastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 60
    end
    object plRacesReportppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopBackSpeed'
      FieldName = 'TopBackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 61
    end
    object plRacesReportppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopBackClass'
      FieldName = 'TopBackClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object plRacesReportppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLastClass'
      FieldName = 'TopLastClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object plRacesReportppField65: TppField
      FieldAlias = 'AltWager1'
      FieldName = 'AltWager1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 64
    end
    object plRacesReportppField66: TppField
      FieldAlias = 'AltWager2'
      FieldName = 'AltWager2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 65
    end
    object plRacesReportppField67: TppField
      FieldAlias = 'AltWager3'
      FieldName = 'AltWager3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 66
    end
    object plRacesReportppField68: TppField
      FieldAlias = 'AltWager4'
      FieldName = 'AltWager4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 67
    end
    object plRacesReportppField69: TppField
      FieldAlias = 'AltWager5'
      FieldName = 'AltWager5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 68
    end
    object plRacesReportppField70: TppField
      FieldAlias = 'AltWager6'
      FieldName = 'AltWager6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 69
    end
    object plRacesReportppField71: TppField
      FieldAlias = 'Wager1'
      FieldName = 'Wager1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 70
    end
    object plRacesReportppField72: TppField
      FieldAlias = 'Wager2'
      FieldName = 'Wager2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 71
    end
    object plRacesReportppField73: TppField
      FieldAlias = 'Wager3'
      FieldName = 'Wager3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 72
    end
    object plRacesReportppField74: TppField
      FieldAlias = 'Wager4'
      FieldName = 'Wager4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 73
    end
    object plRacesReportppField75: TppField
      FieldAlias = 'Wager5'
      FieldName = 'Wager5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 74
    end
    object plRacesReportppField76: TppField
      FieldAlias = 'Wager6'
      FieldName = 'Wager6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 75
    end
    object plRacesReportppField77: TppField
      FieldAlias = 'WagerFinalOrder'
      FieldName = 'WagerFinalOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 76
    end
    object plRacesReportppField78: TppField
      FieldAlias = 'WagerSheetOrder'
      FieldName = 'WagerSheetOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 77
    end
    object plRacesReportppField79: TppField
      FieldAlias = 'TodaysWagerOrder'
      FieldName = 'TodaysWagerOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 78
    end
    object plRacesReportppField80: TppField
      FieldAlias = 'Chalk'
      FieldName = 'Chalk'
      FieldLength = 25
      DisplayWidth = 25
      Position = 79
    end
    object plRacesReportppField81: TppField
      FieldAlias = 'Value'
      FieldName = 'Value'
      FieldLength = 25
      DisplayWidth = 25
      Position = 80
    end
    object plRacesReportppField82: TppField
      FieldAlias = 'Tri'
      FieldName = 'Tri'
      FieldLength = 40
      DisplayWidth = 40
      Position = 81
    end
    object plRacesReportppField83: TppField
      FieldAlias = 'DD'
      FieldName = 'DD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 82
    end
    object plRacesReportppField84: TppField
      FieldAlias = 'Super'
      FieldName = 'Super'
      FieldLength = 40
      DisplayWidth = 40
      Position = 83
    end
    object plRacesReportppField85: TppField
      FieldAlias = 'Exacta'
      FieldName = 'Exacta'
      FieldLength = 40
      DisplayWidth = 40
      Position = 84
    end
    object plRacesReportppField86: TppField
      FieldAlias = 'Quinella'
      FieldName = 'Quinella'
      FieldLength = 40
      DisplayWidth = 40
      Position = 85
    end
    object plRacesReportppField87: TppField
      FieldAlias = 'Pick3'
      FieldName = 'Pick3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 86
    end
    object plRacesReportppField88: TppField
      FieldAlias = 'Pick4'
      FieldName = 'Pick4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 87
    end
    object plRacesReportppField89: TppField
      FieldAlias = 'Pick6'
      FieldName = 'Pick6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 88
    end
    object plRacesReportppField90: TppField
      FieldAlias = 'ParTime'
      FieldName = 'ParTime'
      FieldLength = 40
      DisplayWidth = 40
      Position = 89
    end
    object plRacesReportppField91: TppField
      FieldAlias = 'IsCreateAngle'
      FieldName = 'IsCreateAngle'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 90
    end
    object plRacesReportppField92: TppField
      FieldAlias = 'IsCreateValue'
      FieldName = 'IsCreateValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 91
    end
    object plRacesReportppField93: TppField
      FieldAlias = 'IsCreateTip'
      FieldName = 'IsCreateTip'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 92
    end
    object plRacesReportppField94: TppField
      FieldAlias = 'IsCreatePk3'
      FieldName = 'IsCreatePk3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 93
    end
    object plRacesReportppField95: TppField
      FieldAlias = 'IsCreateDetail'
      FieldName = 'IsCreateDetail'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 94
    end
    object plRacesReportppField96: TppField
      FieldAlias = 'IsCreateAlt'
      FieldName = 'IsCreateAlt'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 95
    end
    object plRacesReportppField97: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 96
    end
    object plRacesReportppField98: TppField
      FieldAlias = 'IsLinerSheetSelected'
      FieldName = 'IsLinerSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 97
    end
    object plRacesReportppField99: TppField
      FieldAlias = 'IsOverlaySheetSelected'
      FieldName = 'IsOverlaySheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 98
    end
    object plRacesReportppField100: TppField
      FieldAlias = 'IsWagerSheetSelected'
      FieldName = 'IsWagerSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 99
    end
    object plRacesReportppField101: TppField
      FieldAlias = 'IsYoubetTrack'
      FieldName = 'IsYoubetTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 100
    end
    object plRacesReportppField102: TppField
      FieldAlias = 'RacePicks'
      FieldName = 'RacePicks'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 101
      Searchable = False
      Sortable = False
    end
    object plRacesReportppField103: TppField
      FieldAlias = 'IsRacePicksAvailable'
      FieldName = 'IsRacePicksAvailable'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 102
    end
    object plRacesReportppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'WPSWagerAmt'
      FieldName = 'WPSWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 103
    end
    object plRacesReportppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'SfcWagerAmt'
      FieldName = 'SfcWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object plRacesReportppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'TriWagerAmt'
      FieldName = 'TriWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 105
    end
    object plRacesReportppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExaWagerAmt'
      FieldName = 'ExaWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 106
    end
    object plRacesReportppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuiWagerAmt'
      FieldName = 'QuiWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 107
    end
    object plRacesReportppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'DDWagerAmt'
      FieldName = 'DDWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object plRacesReportppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3WagerAmt'
      FieldName = 'Pk3WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 109
    end
    object plRacesReportppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk4WagerAmt'
      FieldName = 'Pk4WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object plRacesReportppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk6WagerAmt'
      FieldName = 'Pk6WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 111
    end
    object plRacesReportppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopEarlyPace'
      FieldName = 'TopEarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object plRacesReportppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopMiddlePace'
      FieldName = 'TopMiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 113
    end
    object plRacesReportppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLatePace'
      FieldName = 'TopLatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object plRacesReportppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopEarlyPacePos'
      FieldName = 'TopEarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 115
    end
    object plRacesReportppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopMiddlePacePos'
      FieldName = 'TopMiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object plRacesReportppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLatePacePos'
      FieldName = 'TopLatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 117
    end
    object plRacesReportppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondEarlyPace'
      FieldName = 'SecondEarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object plRacesReportppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondMiddlePace'
      FieldName = 'SecondMiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 119
    end
    object plRacesReportppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondLatePace'
      FieldName = 'SecondLatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object plRacesReportppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondEarlyPacePos'
      FieldName = 'SecondEarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 121
    end
    object plRacesReportppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondMiddlePacePos'
      FieldName = 'SecondMiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 122
    end
    object plRacesReportppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondLatePacePos'
      FieldName = 'SecondLatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 123
    end
    object plRacesReportppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalMorningLineTo1Probability'
      FieldName = 'TotalMorningLineTo1Probability'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 124
    end
    object plRacesReportppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalFinalLineTo1Probability'
      FieldName = 'TotalFinalLineTo1Probability'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 125
    end
    object plRacesReportppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaxWPSBet'
      FieldName = 'MaxWPSBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 126
    end
    object plRacesReportppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaxGimmickBet'
      FieldName = 'MaxGimmickBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 127
    end
    object plRacesReportppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrStarters'
      FieldName = 'NbrStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 128
    end
    object plRacesReportppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrDebutStarters'
      FieldName = 'NbrDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 129
    end
    object plRacesReportppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrDebutTwoStarters'
      FieldName = 'NbrDebutTwoStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 130
    end
    object plRacesReportppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrTurfDebutStarters'
      FieldName = 'NbrTurfDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 131
    end
    object plRacesReportppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrRouteDebutStarters'
      FieldName = 'NbrRouteDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 132
    end
    object plRacesReportppField134: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrScratchedStarters'
      FieldName = 'NbrScratchedStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 133
    end
    object plRacesReportppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrRunners'
      FieldName = 'NbrRunners'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 134
    end
    object plRacesReportppField136: TppField
      FieldAlias = 'IsEquibaseChartsProcessed'
      FieldName = 'IsEquibaseChartsProcessed'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 135
    end
    object plRacesReportppField137: TppField
      FieldAlias = 'IsDRFChartsProcessed'
      FieldName = 'IsDRFChartsProcessed'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 136
    end
    object plRacesReportppField138: TppField
      FieldAlias = 'OrigSurface'
      FieldName = 'OrigSurface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 137
    end
    object plRacesReportppField139: TppField
      FieldAlias = 'IsPk9Place'
      FieldName = 'IsPk9Place'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 138
    end
    object plRacesReportppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk9RaceNbr'
      FieldName = 'Pk9RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 139
    end
    object plRacesReportppField141: TppField
      FieldAlias = 'RaceCondition1'
      FieldName = 'RaceCondition1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 140
    end
    object plRacesReportppField142: TppField
      FieldAlias = 'RaceCondition2'
      FieldName = 'RaceCondition2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 141
    end
    object plRacesReportppField143: TppField
      FieldAlias = 'RaceCondition3'
      FieldName = 'RaceCondition3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 142
    end
    object plRacesReportppField144: TppField
      FieldAlias = 'RaceCondition4'
      FieldName = 'RaceCondition4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 143
    end
    object plRacesReportppField145: TppField
      FieldAlias = 'RaceCondition5'
      FieldName = 'RaceCondition5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 144
    end
    object plRacesReportppField146: TppField
      FieldAlias = 'RaceCondition6'
      FieldName = 'RaceCondition6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 145
    end
    object plRacesReportppField147: TppField
      FieldAlias = 'RaceCondition7'
      FieldName = 'RaceCondition7'
      FieldLength = 40
      DisplayWidth = 40
      Position = 146
    end
    object plRacesReportppField148: TppField
      FieldAlias = 'RaceCondition8'
      FieldName = 'RaceCondition8'
      FieldLength = 40
      DisplayWidth = 40
      Position = 147
    end
    object plRacesReportppField149: TppField
      FieldAlias = 'RaceCondition9'
      FieldName = 'RaceCondition9'
      FieldLength = 40
      DisplayWidth = 40
      Position = 148
    end
    object plRacesReportppField150: TppField
      FieldAlias = 'RaceCondition10'
      FieldName = 'RaceCondition10'
      FieldLength = 40
      DisplayWidth = 40
      Position = 149
    end
    object plRacesReportppField151: TppField
      FieldAlias = 'BetLine'
      FieldName = 'BetLine'
      FieldLength = 255
      DisplayWidth = 255
      Position = 150
    end
    object plRacesReportppField152: TppField
      FieldAlias = 'RaceConditions'
      FieldName = 'RaceConditions'
      FieldLength = 15
      DisplayWidth = 15
      Position = 151
    end
    object plRacesReportppField153: TppField
      FieldAlias = 'TrkCond'
      FieldName = 'TrkCond'
      FieldLength = 3
      DisplayWidth = 3
      Position = 152
    end
    object plRacesReportppField154: TppField
      FieldAlias = 'OrigDistanceDesc'
      FieldName = 'OrigDistanceDesc'
      FieldLength = 20
      DisplayWidth = 20
      Position = 153
    end
    object plRacesReportppField155: TppField
      FieldAlias = 'IsPPValue'
      FieldName = 'IsPPValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 154
    end
    object plRacesReportppField156: TppField
      FieldAlias = 'IsMLValue'
      FieldName = 'IsMLValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 155
    end
    object plRacesReportppField157: TppField
      FieldAlias = 'FootNotes'
      FieldName = 'FootNotes'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 156
      Searchable = False
      Sortable = False
    end
    object plRacesReportppField158: TppField
      FieldAlias = 'Trainers'
      FieldName = 'Trainers'
      FieldLength = 512
      DisplayWidth = 512
      Position = 157
    end
    object plRacesReportppField159: TppField
      FieldAlias = 'Owners'
      FieldName = 'Owners'
      FieldLength = 512
      DisplayWidth = 512
      Position = 158
    end
    object plRacesReportppField160: TppField
      FieldAlias = 'ScratchedHorses'
      FieldName = 'ScratchedHorses'
      FieldLength = 512
      DisplayWidth = 512
      Position = 159
    end
    object plRacesReportppField161: TppField
      FieldAlias = 'FractionalTimes'
      FieldName = 'FractionalTimes'
      FieldLength = 100
      DisplayWidth = 100
      Position = 160
    end
    object plRacesReportppField162: TppField
      FieldAlias = 'IsExactaMatched'
      FieldName = 'IsExactaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 161
    end
    object plRacesReportppField163: TppField
      FieldAlias = 'ExactaNbrs'
      FieldName = 'ExactaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 162
    end
    object plRacesReportppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaWager'
      FieldName = 'ExactaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 163
    end
    object plRacesReportppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaPayout'
      FieldName = 'ExactaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 164
    end
    object plRacesReportppField166: TppField
      FieldAlias = 'IsTrifectaMatched'
      FieldName = 'IsTrifectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 165
    end
    object plRacesReportppField167: TppField
      FieldAlias = 'TrifectaNbrs'
      FieldName = 'TrifectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 166
    end
    object plRacesReportppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaWager'
      FieldName = 'TrifectaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 167
    end
    object plRacesReportppField169: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaPayout'
      FieldName = 'TrifectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 168
    end
    object plRacesReportppField170: TppField
      FieldAlias = 'IsSuperfectaMatched'
      FieldName = 'IsSuperfectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 169
    end
    object plRacesReportppField171: TppField
      FieldAlias = 'SuperfectaNbrs'
      FieldName = 'SuperfectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 170
    end
    object plRacesReportppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaWager'
      FieldName = 'SuperfectaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 171
    end
    object plRacesReportppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaPayout'
      FieldName = 'SuperfectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 172
    end
    object plRacesReportppField174: TppField
      FieldAlias = 'IsDailyDoubleMatchedFirstRace'
      FieldName = 'IsDailyDoubleMatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 173
    end
    object plRacesReportppField175: TppField
      FieldAlias = 'IsDailyDoubleMatchedLastRace'
      FieldName = 'IsDailyDoubleMatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 174
    end
    object plRacesReportppField176: TppField
      FieldAlias = 'DDFirstRace'
      FieldName = 'DDFirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 175
    end
    object plRacesReportppField177: TppField
      FieldAlias = 'DDLastRace'
      FieldName = 'DDLastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 176
    end
    object plRacesReportppField178: TppField
      FieldAlias = 'DailyDoubleNbrsFirstRace'
      FieldName = 'DailyDoubleNbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 177
    end
    object plRacesReportppField179: TppField
      FieldAlias = 'DailyDoubleNbrsLastRace'
      FieldName = 'DailyDoubleNbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 178
    end
    object plRacesReportppField180: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerFirstRace'
      FieldName = 'DailyDoubleWagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 179
    end
    object plRacesReportppField181: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerLastRace'
      FieldName = 'DailyDoubleWagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 180
    end
    object plRacesReportppField182: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutFirstRace'
      FieldName = 'DailyDoublePayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 181
    end
    object plRacesReportppField183: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutLastRace'
      FieldName = 'DailyDoublePayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 182
    end
    object plRacesReportppField184: TppField
      FieldAlias = 'IsQuinellaMatched'
      FieldName = 'IsQuinellaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 183
    end
    object plRacesReportppField185: TppField
      FieldAlias = 'QuinellaNbrs'
      FieldName = 'QuinellaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 184
    end
    object plRacesReportppField186: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaWager'
      FieldName = 'QuinellaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 185
    end
    object plRacesReportppField187: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaPayout'
      FieldName = 'QuinellaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 186
    end
    object plRacesReportppField188: TppField
      FieldAlias = 'IsPick3MatchedFirstRace'
      FieldName = 'IsPick3MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 187
    end
    object plRacesReportppField189: TppField
      FieldAlias = 'IsPick3MatchedLastRace'
      FieldName = 'IsPick3MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 188
    end
    object plRacesReportppField190: TppField
      FieldAlias = 'Pick3FirstRace'
      FieldName = 'Pick3FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 189
    end
    object plRacesReportppField191: TppField
      FieldAlias = 'Pick3LastRace'
      FieldName = 'Pick3LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 190
    end
    object plRacesReportppField192: TppField
      FieldAlias = 'Pick3NbrsFirstRace'
      FieldName = 'Pick3NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 191
    end
    object plRacesReportppField193: TppField
      FieldAlias = 'Pick3NbrsLastRace'
      FieldName = 'Pick3NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 192
    end
    object plRacesReportppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerFirstRace'
      FieldName = 'Pick3WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 193
    end
    object plRacesReportppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerLastRace'
      FieldName = 'Pick3WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 194
    end
    object plRacesReportppField196: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutFirstRace'
      FieldName = 'Pick3PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 195
    end
    object plRacesReportppField197: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutLastRace'
      FieldName = 'Pick3PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 196
    end
    object plRacesReportppField198: TppField
      FieldAlias = 'Pick3NbrsLeg1'
      FieldName = 'Pick3NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 197
    end
    object plRacesReportppField199: TppField
      FieldAlias = 'Pick3NbrsLeg2'
      FieldName = 'Pick3NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 198
    end
    object plRacesReportppField200: TppField
      FieldAlias = 'Pick3NbrsLeg3'
      FieldName = 'Pick3NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 199
    end
    object plRacesReportppField201: TppField
      FieldAlias = 'IsPick4MatchedFirstRace'
      FieldName = 'IsPick4MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 200
    end
    object plRacesReportppField202: TppField
      FieldAlias = 'IsPick4MatchedLastRace'
      FieldName = 'IsPick4MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 201
    end
    object plRacesReportppField203: TppField
      FieldAlias = 'Pick4FirstRace'
      FieldName = 'Pick4FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 202
    end
    object plRacesReportppField204: TppField
      FieldAlias = 'Pick4LastRace'
      FieldName = 'Pick4LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 203
    end
    object plRacesReportppField205: TppField
      FieldAlias = 'Pick4NbrsFirstRace'
      FieldName = 'Pick4NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 204
    end
    object plRacesReportppField206: TppField
      FieldAlias = 'Pick4NbrsLastRace'
      FieldName = 'Pick4NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 205
    end
    object plRacesReportppField207: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerFirstRace'
      FieldName = 'Pick4WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 206
    end
    object plRacesReportppField208: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerLastRace'
      FieldName = 'Pick4WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 207
    end
    object plRacesReportppField209: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutFirstRace'
      FieldName = 'Pick4PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 208
    end
    object plRacesReportppField210: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutLastRace'
      FieldName = 'Pick4PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 209
    end
    object plRacesReportppField211: TppField
      FieldAlias = 'Pick4NbrsLeg1'
      FieldName = 'Pick4NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 210
    end
    object plRacesReportppField212: TppField
      FieldAlias = 'Pick4NbrsLeg2'
      FieldName = 'Pick4NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 211
    end
    object plRacesReportppField213: TppField
      FieldAlias = 'Pick4NbrsLeg3'
      FieldName = 'Pick4NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 212
    end
    object plRacesReportppField214: TppField
      FieldAlias = 'Pick4NbrsLeg4'
      FieldName = 'Pick4NbrsLeg4'
      FieldLength = 25
      DisplayWidth = 25
      Position = 213
    end
    object plRacesReportppField215: TppField
      FieldAlias = 'IsPick6MatchedFirstRace'
      FieldName = 'IsPick6MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 214
    end
    object plRacesReportppField216: TppField
      FieldAlias = 'IsPick6MatchedLastRace'
      FieldName = 'IsPick6MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 215
    end
    object plRacesReportppField217: TppField
      FieldAlias = 'Pick6FirstRace'
      FieldName = 'Pick6FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 216
    end
    object plRacesReportppField218: TppField
      FieldAlias = 'Pick6LastRace'
      FieldName = 'Pick6LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 217
    end
    object plRacesReportppField219: TppField
      FieldAlias = 'Pick6NbrsFirstRace'
      FieldName = 'Pick6NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 218
    end
    object plRacesReportppField220: TppField
      FieldAlias = 'Pick6NbrsLastRace'
      FieldName = 'Pick6NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 219
    end
    object plRacesReportppField221: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerFirstRace'
      FieldName = 'Pick6WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 220
    end
    object plRacesReportppField222: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerLastRace'
      FieldName = 'Pick6WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 221
    end
    object plRacesReportppField223: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutFirstRace'
      FieldName = 'Pick6PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 222
    end
    object plRacesReportppField224: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutLastRace'
      FieldName = 'Pick6PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 223
    end
    object plRacesReportppField225: TppField
      FieldAlias = 'IsWinMatched'
      FieldName = 'IsWinMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 224
    end
    object plRacesReportppField226: TppField
      FieldAlias = 'WinNbrs'
      FieldName = 'WinNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 225
    end
    object plRacesReportppField227: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPayout'
      FieldName = 'WinPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 226
    end
    object plRacesReportppField228: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPlcPayout'
      FieldName = 'WinPlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 227
    end
    object plRacesReportppField229: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinShoPayout'
      FieldName = 'WinShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 228
    end
    object plRacesReportppField230: TppField
      FieldAlias = 'IsPlcMatched'
      FieldName = 'IsPlcMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 229
    end
    object plRacesReportppField231: TppField
      FieldAlias = 'PlcNbrs'
      FieldName = 'PlcNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 230
    end
    object plRacesReportppField232: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcPayout'
      FieldName = 'PlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 231
    end
    object plRacesReportppField233: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcShoPayout'
      FieldName = 'PlcShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 232
    end
    object plRacesReportppField234: TppField
      FieldAlias = 'IsShoMatched'
      FieldName = 'IsShoMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 233
    end
    object plRacesReportppField235: TppField
      FieldAlias = 'ShoNbrs'
      FieldName = 'ShoNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 234
    end
    object plRacesReportppField236: TppField
      Alignment = taRightJustify
      FieldAlias = 'ShoPayout'
      FieldName = 'ShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 235
    end
    object plRacesReportppField237: TppField
      FieldAlias = 'Weather'
      FieldName = 'Weather'
      FieldLength = 100
      DisplayWidth = 100
      Position = 236
    end
    object plRacesReportppField238: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLastSRWinner'
      FieldName = 'TopLastSRWinner'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 237
    end
    object plRacesReportppField239: TppField
      FieldAlias = 'RaceShape'
      FieldName = 'RaceShape'
      FieldLength = 50
      DisplayWidth = 50
      Position = 238
    end
    object plRacesReportppField240: TppField
      FieldAlias = 'PostTimes'
      FieldName = 'PostTimes'
      FieldLength = 50
      DisplayWidth = 50
      Position = 239
    end
    object plRacesReportppField241: TppField
      FieldAlias = 'WagerTypes'
      FieldName = 'WagerTypes'
      FieldLength = 250
      DisplayWidth = 250
      Position = 240
    end
    object plRacesReportppField242: TppField
      FieldAlias = 'Is10CentSuperfectaRace'
      FieldName = 'Is10CentSuperfectaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 241
    end
    object plRacesReportppField243: TppField
      FieldAlias = 'Is50CentTrifectaRace'
      FieldName = 'Is50CentTrifectaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 242
    end
    object plRacesReportppField244: TppField
      FieldAlias = 'Is50CentPk3Race'
      FieldName = 'Is50CentPk3Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 243
    end
    object plRacesReportppField245: TppField
      FieldAlias = 'Is50CentPk4Race'
      FieldName = 'Is50CentPk4Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 244
    end
    object plRacesReportppField246: TppField
      FieldAlias = 'IsTSNProcessed'
      FieldName = 'IsTSNProcessed'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 245
    end
    object plRacesReportppField247: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalFinalProbability'
      FieldName = 'TotalFinalProbability'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 246
    end
    object plRacesReportppField248: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalMorningLineProbability'
      FieldName = 'TotalMorningLineProbability'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 247
    end
    object plRacesReportppField249: TppField
      Alignment = taRightJustify
      FieldAlias = 'NormalTotalMorningLineProbabilitySquared'
      FieldName = 'NormalTotalMorningLineProbabilitySquared'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 248
    end
    object plRacesReportppField250: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTodaysWagerProbability'
      FieldName = 'TotalTodaysWagerProbability'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 249
    end
    object plRacesReportppField251: TppField
      Alignment = taRightJustify
      FieldAlias = 'NormalTotalTodaysWagerProbabilitySquared'
      FieldName = 'NormalTotalTodaysWagerProbabilitySquared'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 250
    end
    object plRacesReportppField252: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalClassRating'
      FieldName = 'TotalClassRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 251
    end
    object plRacesReportppField253: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTurfRating'
      FieldName = 'TotalTurfRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 252
    end
    object plRacesReportppField254: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalMudRating'
      FieldName = 'TotalMudRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 253
    end
    object plRacesReportppField255: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalPoints'
      FieldName = 'TotalPoints'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 254
    end
  end
  object tblEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagerReport'
    EngineVersion = '4.24 Build 1'
    IndexFieldNames = 'TrkCode;RaceDate;RaceNbr'
    MasterFields = 'TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    ReadOnly = True
    TableName = 'ENTRY.DAT'
    Left = 110
    Top = 95
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 110
    Top = 155
  end
  object plEntries: TppDBPipeline
    DataSource = dsEntries
    CloseDataSource = True
    UserName = 'plEntries'
    OnTraversal = plEntriesTraversal
    Left = 110
    Top = 201
    MasterDataPipelineName = 'plRacesReport'
  end
  object ppWagerReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\ratings31\WagerSheet.rtm'
    Template.Format = ftASCII
    Units = utScreenPixels
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Printer'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 208
    Top = 104
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'RaceDate'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 5644
        mmLeft = 130440
        mmTop = 0
        mmWidth = 30956
        BandType = 0
      end
      object lblTitle: TppLabel
        UserName = 'lblTitle'
        Caption = 'VALUE WAGER SHEET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5644
        mmLeft = 0
        mmTop = 0
        mmWidth = 50377
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5644
        mmLeft = 193675
        mmTop = 0
        mmWidth = 17780
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 11377
        mmWidth = 215900
        BandType = 0
      end
      object vIs: TppVariable
        UserName = 'bIsHospital'
        CalcOrder = 1
        CalcType = veReportEnd
        DataType = dtBoolean
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5556
        mmLeft = 1058
        mmTop = 5821
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'WPS '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 114565
        mmTop = 8467
        mmWidth = 5165
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Daily Double'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 159544
        mmTop = 8467
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Pick 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 184150
        mmTop = 8731
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Pick 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 205317
        mmTop = 8467
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Trifecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 138642
        mmTop = 8467
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Superfecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 147638
        mmTop = 8467
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Exa/Qui'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 124576
        mmTop = 8467
        mmWidth = 7451
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object TotalRatingReport: TppSubReport
        UserName = 'TotalRatingReport'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'plEntries'
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 215900
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport12: TppChildReport
          AutoStop = False
          DataPipeline = plEntries
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Letter'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 0
          PrinterSetup.mmMarginLeft = 0
          PrinterSetup.mmMarginRight = 0
          PrinterSetup.mmMarginTop = 0
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.Format = ftASCII
          Units = utScreenPixels
          Left = 408
          Top = 288
          Version = '7.04'
          mmColumnWidth = 266701
          DataPipelineName = 'plEntries'
          object ppDetailBand13: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 43656
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              mmHeight = 4498
              mmLeft = 10583
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object DD: TppDBText
              OnPrint = DDPrint
              UserName = 'DD'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'DD'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3260
              mmLeft = 166889
              mmTop = 3969
              mmWidth = 4826
              BandType = 4
            end
            object Pick3: TppDBText
              OnPrint = Pick3Print
              UserName = 'Pick3'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Pick3'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3260
              mmLeft = 188331
              mmTop = 3969
              mmWidth = 6138
              BandType = 4
            end
            object Pick4: TppDBText
              OnPrint = Pick4Print
              UserName = 'Pick4'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Pick4'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2836
              mmLeft = 210693
              mmTop = 3440
              mmWidth = 5207
              BandType = 4
            end
            object Value: TppDBText
              UserName = 'Value'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Value'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 16
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 6519
              mmLeft = 110141
              mmTop = 0
              mmWidth = 12361
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Pen.Width = 2
              ParentHeight = True
              Position = lpLeft
              Weight = 1.500000000000000000
              mmHeight = 43656
              mmLeft = 107156
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Pen.Width = 2
              ParentHeight = True
              Position = lpLeft
              Weight = 1.500000000000000000
              mmHeight = 43656
              mmLeft = 123296
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line102'
              ParentWidth = True
              Position = lpBottom
              ShiftWithParent = True
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 0
              mmTop = 43392
              mmWidth = 215900
              BandType = 4
            end
            object TrkCode: TppDBText
              UserName = 'TrkCode'
              ShiftWithParent = True
              DataField = 'TrkCode'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 14
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 5673
              mmLeft = 0
              mmTop = 0
              mmWidth = 10583
              BandType = 4
            end
            object lblRaceNbr: TppLabel
              UserName = 'lblRaceNbr'
              Caption = 'RACE #'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 11113
              mmTop = 0
              mmWidth = 10583
              BandType = 4
            end
            object ProgramNbr: TppDBText
              UserName = 'ProgramNbr'
              ShiftWithParent = True
              DataField = 'ProgramNbr'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 4233
              mmLeft = 39952
              mmTop = 0
              mmWidth = 4763
              BandType = 4
            end
            object EstTimeOfRace: TppDBText
              UserName = 'EstTimeOfRace'
              ShiftWithParent = True
              DataField = 'EstTimeOfRace'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3175
              mmLeft = 11377
              mmTop = 7938
              mmWidth = 19315
              BandType = 4
            end
            object HorseName: TppDBText
              UserName = 'HorseName'
              ShiftWithParent = True
              DataField = 'HorseName'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 4233
              mmLeft = 45508
              mmTop = 0
              mmWidth = 52652
              BandType = 4
            end
            object MorningLineDesc: TppDBText
              UserName = 'MorningLineDesc'
              ShiftWithParent = True
              DataField = 'MorningLineDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 4106
              mmLeft = 98849
              mmTop = 0
              mmWidth = 6773
              BandType = 4
            end
            object WagerFinalOrder: TppDBText
              UserName = 'WagerFinalOrder'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'WagerFinalOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3260
              mmLeft = 11377
              mmTop = 11377
              mmWidth = 11684
              BandType = 4
            end
            object RaceType: TppDBText
              UserName = 'RaceType'
              ShiftWithParent = True
              DataField = 'RaceType'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2910
              mmLeft = 11377
              mmTop = 4763
              mmWidth = 6085
              BandType = 4
            end
            object Trainer: TppDBText
              UserName = 'Trainer'
              ShiftWithParent = True
              DataField = 'Trainer'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 34925
              mmTop = 7408
              mmWidth = 50271
              BandType = 4
            end
            object dbOwner: TppDBText
              UserName = 'dbOwner'
              ShiftWithParent = True
              DataField = 'Owner'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 34925
              mmTop = 15346
              mmWidth = 50271
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Pen.Width = 2
              ParentHeight = True
              Position = lpLeft
              Weight = 1.500000000000000000
              mmHeight = 43656
              mmLeft = 171980
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Pen.Width = 2
              ParentHeight = True
              Position = lpLeft
              Weight = 1.500000000000000000
              mmHeight = 43656
              mmLeft = 145786
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object Exacta: TppDBText
              OnPrint = DDPrint
              UserName = 'Exacta'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Exacta'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3260
              mmLeft = 131551
              mmTop = 3969
              mmWidth = 3387
              BandType = 4
            end
            object Super: TppDBText
              OnPrint = DDPrint
              UserName = 'Super'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Super'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2455
              mmLeft = 153310
              mmTop = 4233
              mmWidth = 4911
              BandType = 4
            end
            object Tri: TppDBText
              OnPrint = DDPrint
              UserName = 'Tri'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Tri'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3260
              mmLeft = 139150
              mmTop = 3969
              mmWidth = 6900
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              Pen.Width = 2
              ParentHeight = True
              Position = lpLeft
              Weight = 1.500000000000000000
              mmHeight = 43656
              mmLeft = 135202
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Pen.Width = 2
              ParentHeight = True
              Position = lpLeft
              Weight = 1.500000000000000000
              mmHeight = 43656
              mmLeft = 158486
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object EarlyPace: TppDBText
              UserName = 'EarlyPace'
              ShiftWithParent = True
              DataField = 'EarlyPace'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 11113
              mmTop = 15610
              mmWidth = 3969
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
              mmHeight = 2910
              mmLeft = 12700
              mmTop = 19050
              mmWidth = 794
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
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 19050
              mmWidth = 1323
              BandType = 4
            end
            object MiddlePace: TppDBText
              UserName = 'MiddlePace'
              ShiftWithParent = True
              DataField = 'MiddlePace'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 18256
              mmTop = 15610
              mmWidth = 4498
              BandType = 4
            end
            object LatePace: TppDBText
              UserName = 'LatePace'
              ShiftWithParent = True
              DataField = 'LatePace'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 25400
              mmTop = 15610
              mmWidth = 4498
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
              mmHeight = 2910
              mmLeft = 26988
              mmTop = 19050
              mmWidth = 794
              BandType = 4
            end
            object WagerAmt: TppDBText
              UserName = 'WagerAmt'
              BlankWhenZero = True
              DataField = 'WagerAmt'
              DataPipeline = plEntries
              DisplayFormat = '$###.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 115094
              mmTop = 7144
              mmWidth = 7408
              BandType = 4
            end
            object ppLine8: TppLine
              UserName = 'Line101'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 35190
              mmTop = 10848
              mmWidth = 72231
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 35190
              mmTop = 14817
              mmWidth = 71702
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 34925
              mmTop = 18785
              mmWidth = 71702
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Pen.Width = 2
              ParentHeight = True
              Position = lpLeft
              Weight = 1.500000000000000000
              mmHeight = 43656
              mmLeft = 194734
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object PlcWagerAmt: TppDBText
              UserName = 'PlcWagerAmt'
              BlankWhenZero = True
              DataField = 'PlcWagerAmt'
              DataPipeline = plEntries
              DisplayFormat = '$###.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 115094
              mmTop = 11642
              mmWidth = 7408
              BandType = 4
            end
            object ShoWagerAmt: TppDBText
              UserName = 'ShoWagerAmt'
              BlankWhenZero = True
              DataField = 'ShoWagerAmt'
              DataPipeline = plEntries
              DisplayFormat = '$###.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 115094
              mmTop = 15875
              mmWidth = 7408
              BandType = 4
            end
            object Quinella: TppDBText
              OnPrint = DDPrint
              UserName = 'Quinella'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Quinella'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3260
              mmLeft = 125708
              mmTop = 12171
              mmWidth = 9229
              BandType = 4
            end
            object lblWinWagerAmt: TppLabel
              UserName = 'lblWinWagerAmt'
              Caption = 'WIN:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              Visible = False
              mmHeight = 2646
              mmLeft = 107950
              mmTop = 7144
              mmWidth = 5556
              BandType = 4
            end
            object lblPlcWagerAmt: TppLabel
              UserName = 'lblPlcWagerAmt'
              Caption = 'PLC:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              Visible = False
              mmHeight = 3175
              mmLeft = 108215
              mmTop = 11642
              mmWidth = 5556
              BandType = 4
            end
            object lblShoWagerAmt: TppLabel
              UserName = 'lblShoWagerAmt'
              Caption = 'SHO:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              Visible = False
              mmHeight = 2910
              mmLeft = 108479
              mmTop = 16140
              mmWidth = 5556
              BandType = 4
            end
            object lblExacta: TppLabel
              UserName = 'lblExacta'
              Caption = '1$ Exa Box'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 124354
              mmTop = 0
              mmWidth = 10626
              BandType = 4
            end
            object lblQuinella: TppLabel
              UserName = 'lblQuinella'
              Caption = '$2 Quinella'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              mmHeight = 2646
              mmLeft = 124354
              mmTop = 9260
              mmWidth = 10583
              BandType = 4
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 1058
              mmLeft = 124090
              mmTop = 8731
              mmWidth = 91811
              BandType = 4
            end
            object lblTri: TppLabel
              UserName = 'lblTri'
              Caption = '$1 Tri Key'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2836
              mmLeft = 136525
              mmTop = 0
              mmWidth = 9525
              BandType = 4
            end
            object lblSuper: TppLabel
              UserName = 'lblSuper'
              Caption = '.10 Sfc Key'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              mmHeight = 2836
              mmLeft = 146844
              mmTop = 0
              mmWidth = 11377
              BandType = 4
            end
            object lblDD: TppLabel
              UserName = 'lblDD'
              Caption = '$2 Daliy D'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2836
              mmLeft = 162232
              mmTop = 0
              mmWidth = 9483
              BandType = 4
            end
            object lblPick3: TppLabel
              UserName = 'lblPick3'
              Caption = '$1 Pick 3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              mmHeight = 2910
              mmLeft = 186002
              mmTop = 0
              mmWidth = 8467
              BandType = 4
            end
            object lblPick4: TppLabel
              UserName = 'lblPick4'
              Caption = '$1 Pick 4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              mmHeight = 2836
              mmLeft = 206333
              mmTop = 0
              mmWidth = 9525
              BandType = 4
            end
            object WagerType: TppDBText
              UserName = 'WagerType'
              ShiftWithParent = True
              DataField = 'AngleDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 34925
              mmTop = 19315
              mmWidth = 71173
              BandType = 4
            end
            object lblTriWagerAmt: TppLabel
              UserName = 'lblTriWagerAmt'
              Caption = 'Cost'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 137319
              mmTop = 14552
              mmWidth = 8202
              BandType = 4
            end
            object TriWagerAmt: TppDBText
              OnPrint = DDPrint
              UserName = 'TriWagerAmt'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TriWagerAmt'
              DataPipeline = plRacesReport
              DisplayFormat = '$##.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2455
              mmLeft = 141161
              mmTop = 17727
              mmWidth = 4360
              BandType = 4
            end
            object lblSfcWagerAmt: TppLabel
              UserName = 'lblSfcWagerAmt'
              Caption = 'Cost'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              mmHeight = 2381
              mmLeft = 150019
              mmTop = 14552
              mmWidth = 8202
              BandType = 4
            end
            object SfcWagerAmt: TppDBText
              OnPrint = DDPrint
              UserName = 'SfcWagerAmt'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'SfcWagerAmt'
              DataPipeline = plRacesReport
              DisplayFormat = '$##.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2455
              mmLeft = 146791
              mmTop = 17727
              mmWidth = 11430
              BandType = 4
            end
            object lblDDWagerAmt: TppLabel
              UserName = 'lblDDWagerAmt'
              Caption = 'Cost'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 163248
              mmTop = 14552
              mmWidth = 8202
              BandType = 4
            end
            object Pk3WagerAmt: TppDBText
              OnPrint = DDPrint
              UserName = 'Pk3WagerAmt'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'Pk3WagerAmt'
              DataPipeline = plRacesReport
              DisplayFormat = '$##.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2455
              mmLeft = 182393
              mmTop = 17727
              mmWidth = 11811
              BandType = 4
            end
            object Pk4WagerAmt: TppDBText
              OnPrint = DDPrint
              UserName = 'Pk4WagerAmt'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'Pk4WagerAmt'
              DataPipeline = plRacesReport
              DisplayFormat = '$##.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2455
              mmLeft = 203560
              mmTop = 17727
              mmWidth = 11811
              BandType = 4
            end
            object DDWagerAmt: TppDBText
              OnPrint = DDPrint
              UserName = 'DDWagerAmt'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'DDWagerAmt'
              DataPipeline = plRacesReport
              DisplayFormat = '$##.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2455
              mmLeft = 167090
              mmTop = 17727
              mmWidth = 4360
              BandType = 4
            end
            object lblPk3WagerAmt: TppLabel
              UserName = 'lblPk3WagerAmt'
              Caption = 'Cost'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              mmHeight = 2381
              mmLeft = 185473
              mmTop = 14552
              mmWidth = 8202
              BandType = 4
            end
            object lblPk4WagerAmt: TppLabel
              UserName = 'lblPk4WagerAmt'
              Caption = 'Cost'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              mmHeight = 2910
              mmLeft = 207434
              mmTop = 14552
              mmWidth = 8202
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 35190
              mmTop = 22754
              mmWidth = 71702
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 35190
              mmTop = 26723
              mmWidth = 71702
              BandType = 4
            end
            object TrnWinsRank: TppDBText
              UserName = 'TrnWinsRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TrnWinsRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 86254
              mmTop = 8202
              mmWidth = 3175
              BandType = 4
            end
            object TrnTrackRank: TppDBText
              UserName = 'TrnTrackRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TrnTrackRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 90488
              mmTop = 8202
              mmWidth = 3175
              BandType = 4
            end
            object TrnEarningsRank: TppDBText
              UserName = 'TrnEarningsRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TrnEarningsRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 94721
              mmTop = 8202
              mmWidth = 3175
              BandType = 4
            end
            object JkyWinsRank: TppDBText
              UserName = 'JkyWinsRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'JkyWinsRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 86254
              mmTop = 12171
              mmWidth = 3175
              BandType = 4
            end
            object JkyTrackRank: TppDBText
              UserName = 'JkyTrackRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'JkyTrackRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 90488
              mmTop = 12171
              mmWidth = 3175
              BandType = 4
            end
            object JkyEarningsRank: TppDBText
              UserName = 'JkyEarningsRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'JkyEarningsRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 94721
              mmTop = 12171
              mmWidth = 3175
              BandType = 4
            end
            object OwnWinsRank: TppDBText
              UserName = 'OwnWinsRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'OwnWinsRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 85990
              mmTop = 16140
              mmWidth = 3175
              BandType = 4
            end
            object OwnEarningsRank: TppDBText
              UserName = 'OwnEarningsRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'OwnEarningsRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 94721
              mmTop = 16140
              mmWidth = 3175
              BandType = 4
            end
            object EarlyPaceAdvantage: TppDBText
              UserName = 'EarlyPaceAdvantage'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'EarlyPaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 0
              mmTop = 23019
              mmWidth = 13547
              BandType = 4
            end
            object MiddlePaceAdvantage: TppDBText
              UserName = 'MiddlePaceAdvantage'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MiddlePaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 6339
              mmTop = 23019
              mmWidth = 14563
              BandType = 4
            end
            object LatePaceAdvantage: TppDBText
              UserName = 'LatePaceAdvantage'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LatePaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 14701
              mmTop = 23019
              mmWidth = 13081
              BandType = 4
            end
            object MorningLineTo1Fair: TppDBText
              UserName = 'MorningLineTo1Fair'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'NormalMorningLineOddsSquared'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 46302
              mmTop = 23283
              mmWidth = 6085
              BandType = 4
            end
            object TotalNbrStarters: TppDBText
              UserName = 'TotalNbrStarters'
              ShiftWithParent = True
              DataField = 'NbrStarters'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2879
              mmLeft = 4498
              mmTop = 10848
              mmWidth = 3969
              BandType = 4
            end
            object TotalNbrTurfDebutStarters: TppDBText
              UserName = 'TotalNbrTurfDebutStarters'
              ShiftWithParent = True
              DataField = 'NbrTurfDebutStarters'
              DataPipeline = plRacesReport
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2879
              mmLeft = 4498
              mmTop = 20373
              mmWidth = 3969
              BandType = 4
            end
            object TotalNbrRouteDebutStarters: TppDBText
              UserName = 'TotalNbrRouteDebutStarters'
              ShiftWithParent = True
              DataField = 'NbrRouteDebutStarters'
              DataPipeline = plRacesReport
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2921
              mmLeft = 4498
              mmTop = 23813
              mmWidth = 3969
              BandType = 4
            end
            object TotalNbrDebutStarters: TppDBText
              UserName = 'TotalNbrDebutStarters'
              ShiftWithParent = True
              DataField = 'NbrDebutStarters'
              DataPipeline = plRacesReport
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2921
              mmLeft = 4498
              mmTop = 14023
              mmWidth = 3969
              BandType = 4
            end
            object Surface: TppDBText
              UserName = 'Surface'
              ShiftWithParent = True
              DataField = 'Surface'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2910
              mmLeft = 18256
              mmTop = 4763
              mmWidth = 3440
              BandType = 4
            end
            object DistanceDesc: TppDBText
              UserName = 'DistanceDesc'
              ShiftWithParent = True
              DataField = 'DistanceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 7144
              mmWidth = 10319
              BandType = 4
            end
            object TotalNbrDebutTwoStarters: TppDBText
              UserName = 'TotalNbrDebutTwoStarters'
              ShiftWithParent = True
              DataField = 'NbrDebutTwoStarters'
              DataPipeline = plRacesReport
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2921
              mmLeft = 4498
              mmTop = 17198
              mmWidth = 3969
              BandType = 4
            end
            object lblTS: TppLabel
              UserName = 'lblTSStarters'
              Caption = 'TS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2879
              mmLeft = 32
              mmTop = 10583
              mmWidth = 2582
              BandType = 4
            end
            object lbl1st: TppLabel
              UserName = 'lbl1stStarters'
              Caption = '1st'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2879
              mmLeft = 121
              mmTop = 14023
              mmWidth = 2667
              BandType = 4
            end
            object lbl2nd: TppLabel
              UserName = 'lbl2ndStarters'
              Caption = '2nd'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2879
              mmLeft = 127
              mmTop = 17198
              mmWidth = 3302
              BandType = 4
            end
            object lblTrf: TppLabel
              UserName = 'lblTrfStarters'
              Caption = 'Trf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2879
              mmLeft = 127
              mmTop = 20373
              mmWidth = 2455
              BandType = 4
            end
            object lblRteStarters: TppLabel
              UserName = 'lblRteStarters'
              Caption = 'Rte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2646
              mmLeft = 0
              mmTop = 23813
              mmWidth = 3175
              BandType = 4
            end
            object FinalLineTo1Fair: TppDBText
              UserName = 'FinalLineTo1Fair'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'NormalMorningLineOdds'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 36248
              mmTop = 22754
              mmWidth = 6879
              BandType = 4
            end
            object RaceNbr: TppDBText
              UserName = 'RaceNbr'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'RaceNbr'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 23548
              mmTop = 265
              mmWidth = 1439
              BandType = 4
            end
            object MorningLineTo1FairProbability: TppDBText
              UserName = 'MorningLineTo1FairProbability'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'NormalTodaysWagerOdds'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 27252
              mmWidth = 6085
              BandType = 4
            end
            object FinalLineTo1FairProbability: TppDBText
              UserName = 'FinalLineTo1FairProbability'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'NormalTodaysWagerOddsSquared'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 44450
              mmTop = 26458
              mmWidth = 6879
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 34925
              mmTop = 30427
              mmWidth = 71702
              BandType = 4
            end
            object ppLabel10: TppLabel
              UserName = 'lblRaceNbr1'
              Caption = 'P #'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 35983
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 35454
              mmTop = 4498
              mmWidth = 71438
              BandType = 4
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'W'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3260
              mmLeft = 86784
              mmTop = 4763
              mmWidth = 2201
              BandType = 4
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'T'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3260
              mmLeft = 91281
              mmTop = 4763
              mmWidth = 1439
              BandType = 4
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = 'E'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3260
              mmLeft = 95250
              mmTop = 4763
              mmWidth = 1566
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line8'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 35190
              mmLeft = 34131
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              Pen.Style = psDot
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 13229
              mmLeft = 85461
              mmTop = 4763
              mmWidth = 265
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'Trainer1'
              ShiftWithParent = True
              DataField = 'Jockey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 34925
              mmTop = 11377
              mmWidth = 50271
              BandType = 4
            end
            object ppLine21: TppLine
              UserName = 'Line201'
              Pen.Style = psDot
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 13229
              mmLeft = 89694
              mmTop = 5027
              mmWidth = 265
              BandType = 4
            end
            object ppLine22: TppLine
              UserName = 'Line22'
              Pen.Style = psDot
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 13229
              mmLeft = 93927
              mmTop = 5027
              mmWidth = 265
              BandType = 4
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              Pen.Style = psDot
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 13229
              mmLeft = 98161
              mmTop = 5027
              mmWidth = 265
              BandType = 4
            end
            object ppLine19: TppLine
              UserName = 'Line19'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 34925
              mmTop = 34660
              mmWidth = 71702
              BandType = 4
            end
            object NbrWorksLast: TppDBText
              UserName = 'NbrWorksLast'
              ShiftWithParent = True
              DataField = 'NbrWorksLast'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 4763
              mmTop = 32544
              mmWidth = 3175
              BandType = 4
            end
            object StartsWorks21: TppDBText
              UserName = 'StartsWorks21'
              ShiftWithParent = True
              DataField = 'StartsWorks21'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 15610
              mmTop = 32544
              mmWidth = 3175
              BandType = 4
            end
            object EstMorningLineOrderKey: TppDBText
              UserName = 'EstMorningLineOrderKey'
              ShiftWithParent = True
              DataField = 'EstMorningLineOrderKey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 39688
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              ShiftWithParent = True
              DataField = 'EstMorningLineStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 30427
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object EstMorningLineWinPct: TppDBText
              UserName = 'DBText201'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'EstMorningLineWinPct'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 36777
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              ShiftWithParent = True
              DataField = 'EstMorningLineAvgOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 44186
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              ShiftWithParent = True
              DataField = 'EstMorningLineMinOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 51065
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              ShiftWithParent = True
              DataField = 'EstMorningLineMaxOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 58208
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object EstMorningLineAvgWinOdds: TppDBText
              UserName = 'EstMorningLineAvgWinOdds'
              ShiftWithParent = True
              DataField = 'EstMorningLineAvgWinOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3440
              mmLeft = 67204
              mmTop = 39158
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText301'
              ShiftWithParent = True
              DataField = 'EstMorningLineMinWinOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 74877
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object EstMorningLineMaxWinOdds: TppDBText
              UserName = 'EstMorningLineMaxWinOdds'
              ShiftWithParent = True
              DataField = 'EstMorningLineMaxWinOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 81756
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              ShiftWithParent = True
              DataField = 'EstMorningLineValueBet'
              DataPipeline = plEntries
              DisplayFormat = '#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 88371
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              ShiftWithParent = True
              DataField = 'EstMorningLineIV'
              DataPipeline = plEntries
              DisplayFormat = '#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 94986
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              ShiftWithParent = True
              DataField = 'EstMorningLineIVRoi'
              DataPipeline = plEntries
              DisplayFormat = '#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 101336
              mmTop = 39688
              mmWidth = 5292
              BandType = 4
            end
            object ppLine25: TppLine
              UserName = 'Line25'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 0
              mmTop = 38894
              mmWidth = 105834
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'EstMorningLineOrderKey1'
              ShiftWithParent = True
              DataField = 'TodaysWagerOrderKey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 35983
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText202'
              ShiftWithParent = True
              DataField = 'TodaysWagerStarts'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 30427
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              ShiftWithParent = True
              DataField = 'TodaysWagerWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 36777
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              ShiftWithParent = True
              DataField = 'TodaysWagerAvgOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 44186
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText48: TppDBText
              UserName = 'DBText48'
              ShiftWithParent = True
              DataField = 'TodaysWagerMinOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 51065
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText49: TppDBText
              UserName = 'DBText49'
              ShiftWithParent = True
              DataField = 'TodaysWagerMaxOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 58208
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText50: TppDBText
              UserName = 'EstMorningLineAvgWinOdds1'
              ShiftWithParent = True
              DataField = 'TodaysWagerAvgWinOdds'
              DataPipeline = plEntries
              DisplayFormat = '##.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 67204
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText51: TppDBText
              UserName = 'DBText51'
              ShiftWithParent = True
              DataField = 'TodaysWagerMinWinOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 74877
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText52: TppDBText
              UserName = 'DBText52'
              ShiftWithParent = True
              DataField = 'TodaysWagerMaxWinOdds'
              DataPipeline = plEntries
              DisplayFormat = '###.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 81756
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText53: TppDBText
              UserName = 'DBText53'
              ShiftWithParent = True
              DataField = 'TodaysWagerValueBet'
              DataPipeline = plEntries
              DisplayFormat = '#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 88371
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText54: TppDBText
              UserName = 'DBText54'
              ShiftWithParent = True
              DataField = 'TodaysWagerIV'
              DataPipeline = plEntries
              DisplayFormat = '#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 94986
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText55: TppDBText
              UserName = 'DBText55'
              ShiftWithParent = True
              DataField = 'TodaysWagerIVRoi'
              DataPipeline = plEntries
              DisplayFormat = '#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 101336
              mmTop = 35719
              mmWidth = 5292
              BandType = 4
            end
            object ppLabel32: TppLabel
              UserName = 'lblRteStarters1'
              Caption = 'NW'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2910
              mmLeft = 0
              mmTop = 32544
              mmWidth = 3440
              BandType = 4
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'ST21'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2910
              mmLeft = 9790
              mmTop = 32544
              mmWidth = 4763
              BandType = 4
            end
            object KSP2ndCall: TppDBText
              UserName = 'KSP2ndCall'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'KSP1stCall'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 20638
              mmTop = 25929
              mmWidth = 7408
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'KSP2ndCall1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'QSP1stCallRank'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 2001
              mmTop = 25929
              mmWidth = 10964
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'QSP2ndCallRank'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 1535
              mmTop = 28575
              mmWidth = 11430
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'QSP1stCall'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 8033
              mmTop = 25929
              mmWidth = 7578
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'QSP2ndCall'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 7568
              mmTop = 28575
              mmWidth = 8043
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'KSP2ndCall2'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'KSP1stCallRank'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 10372
              mmTop = 25929
              mmWidth = 10795
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'KSP2ndCallRank'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 9906
              mmTop = 28575
              mmWidth = 11261
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'KSP2ndCall3'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'KSP2ndCall'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 20172
              mmTop = 28575
              mmWidth = 7874
              BandType = 4
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
              4561726C79506163654F6E5072696E740B50726F6772616D54797065070B7474
              50726F63656475726506536F757263650C1203000070726F6365647572652045
              61726C79506163654F6E5072696E743B0D0A626567696E0D0A204561726C7950
              6163652E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020202045
              61726C79506163652E466F6E742E556E6465726C696E65203A3D2046616C7365
              3B0D0A2020202020200D0A09696620706C456E74726965735B274561726C7950
              61636552616E6B275D203D2031207468656E20626567696E0D0A092020204561
              726C79506163652E466F6E742E426F6C64203A3D20547275653B0D0A20202020
              2020202020696620706C456E74726965735B27497346726F6E74446F75626C65
              4C696E6572275D207468656E20626567696E0D0A092020202020204561726C79
              506163652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A2020
              20202020202020656E643B200D0A202020202020656E643B200D0A2020202020
              200D0A09696620706C456E74726965735B274561726C795061636552616E6B27
              5D203D2031207468656E20626567696E0D0A092020204561726C79506163652E
              466F6E742E426F6C64203A3D20547275653B0D0A202020202020202020696620
              706C456E74726965735B274973547269706C654C696E6572275D207468656E20
              626567696E0D0A092020202020204561726C79506163652E466F6E742E556E64
              65726C696E65203A3D20547275653B0D0A202020202020202020656E643B200D
              0A202020202020656E643B200D0A092020202020202020202020202020202020
              20202020202020200D0A09696620706C456E74726965735B274561726C795061
              636552616E6B275D203D2031207468656E20626567696E0D0A09202020696620
              706C456E74726965735B274561726C7950616365506F7352616E6B275D203D20
              31207468656E20626567696E0D0A09094561726C79506163652E466F6E742E42
              6F6C64203A3D20547275653B0D0A092020202020204561726C79506163652E46
              6F6E742E556E6465726C696E65203A3D20547275653B0D0A2020202020202020
              20656E643B200D0A202020202020656E643B200D0A2020202020200D0A0D0A0D
              0A656E643B0D0A0D436F6D706F6E656E744E616D6506094561726C7950616365
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F4C61
              7465506163654F6E5072696E740B50726F6772616D54797065070B747450726F
              63656475726506536F757263650C1A02000070726F636564757265204C617465
              506163654F6E5072696E743B0D0A626567696E0D0A4C617465506163652E466F
              6E742E426F6C64203A3D2046616C73653B0D0A2020202020204C617465506163
              652E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A20202020
              20200D0A09696620706C456E74726965735B274C6174655061636552616E6B27
              5D203D2031207468656E20626567696E0D0A2020200920204C61746550616365
              2E466F6E742E426F6C64203A3D20547275653B0D0A2020202020202020696620
              706C456E74726965735B2749734261636B446F75626C654C696E6572275D2074
              68656E20626567696E0D0A092020202020204C617465506163652E466F6E742E
              556E6465726C696E65203A3D20547275653B0D0A202020202020202020656E64
              3B200D0A202020202020656E643B200D0A0D0A09696620706C456E7472696573
              5B274C6174655061636552616E6B275D203D2031207468656E20626567696E0D
              0A2020200920204C617465506163652E466F6E742E426F6C64203A3D20547275
              653B0D0A2020202020202020696620706C456E74726965735B27497354726970
              6C654C696E6572275D207468656E20626567696E0D0A092020202020204C6174
              65506163652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A20
              2020202020202020656E643B200D0A202020202020656E643B200D0A20202020
              20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506084C617465
              50616365094576656E744E616D6506074F6E5072696E74074576656E74494402
              200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
              06126C626C45726C506F734F6E476574546578740B50726F6772616D54797065
              070B747450726F63656475726506536F757263650C1701000070726F63656475
              7265206C626C45726C506F734F6E476574546578742876617220546578743A20
              537472696E67293B0D0A626567696E0D0A2054657874203A3D202720273B0D0A
              20200D0A2020696620706C456E74726965735B274561726C7950616365506F73
              275D203C3E2039393939207468656E20626567696E0D0A20202020696620706C
              456E74726965735B274561726C7950616365506F73275D203C3E203020746865
              6E20626567696E0D0A092020696620706C456E74726965735B274561726C7950
              616365506F7352616E6B275D203D2031207468656E20626567696E0D0A090920
              2054657874203A3D20272A273B0D0A092020656E643B0D0A20202020656E643B
              0D0A2020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609
              6C626C45726C506F73094576656E744E616D6506094F6E476574546578740745
              76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D6506126C626C4D6964506F734F6E476574546578740B50726F67
              72616D54797065070B747450726F63656475726506536F757263650C32010000
              70726F636564757265206C626C4D6964506F734F6E4765745465787428766172
              20546578743A20537472696E67293B0D0A626567696E0D0A202054657874203A
              3D202720273B0D0A0D0A2020696620706C456E74726965735B274D6964646C65
              50616365506F73275D203C3E2039393939207468656E20626567696E0D0A2020
              202020696620706C456E74726965735B274D6964646C6550616365506F73275D
              203C3E2030207468656E20626567696E0D0A2020202020202020696620706C45
              6E74726965735B274D6964646C6550616365506F7352616E6B275D203D203120
              7468656E20626567696E0D0A202020202020202020202054657874203A3D2027
              2A273B0D0A2020202020202020656E643B0D0A2020202020656E643B0D0A2020
              656E643B2020202020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65
              06096C626C4D6964506F73094576656E744E616D6506094F6E47657454657874
              074576656E74494402350001060F5472614576656E7448616E646C65720B5072
              6F6772616D4E616D6506136C626C4C617465506F734F6E476574546578740B50
              726F6772616D54797065070B747450726F63656475726506536F757263650C2C
              01000070726F636564757265206C626C4C617465506F734F6E47657454657874
              2876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2054
              657874203A3D202720273B0D0A20200D0A2020696620706C456E74726965735B
              274C61746550616365506F73275D203C3E2039393939207468656E2062656769
              6E0D0A2020202020696620706C456E74726965735B274C61746550616365506F
              73275D203C3E2030207468656E20626567696E0D0A2020202020202020696620
              706C456E74726965735B274C61746550616365506F7352616E6B275D203D2031
              207468656E20626567696E0D0A2009202020202054657874203A3D20272A273B
              0D0A2020202020202020656E643B0D0A2020202020656E643B0D0A2020656E64
              3B0D0A0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A6C
              626C4C617465506F73094576656E744E616D6506094F6E476574546578740745
              76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D6506114D6964646C65506163654F6E5072696E740B50726F6772
              616D54797065070B747450726F63656475726506536F757263650CDB03000070
              726F636564757265204D6964646C65506163654F6E5072696E743B0D0A626567
              696E0D0A094D6964646C65506163652E466F6E742E556E6465726C696E65203A
              3D2046616C73653B0D0A2020202020204D6964646C65506163652E466F6E742E
              426F6C64203A3D2046616C73653B0D0A2020202020200D0A09696620706C456E
              74726965735B274D6964646C655061636552616E6B275D203D2031207468656E
              20626567696E0D0A092020204D6964646C65506163652E466F6E742E426F6C64
              203A3D20547275653B0D0A202020202020202020696620706C456E7472696573
              5B27497346726F6E74446F75626C654C696E6572275D207468656E2062656769
              6E0D0A092020202020204D6964646C65506163652E466F6E742E556E6465726C
              696E65203A3D20547275653B0D0A202020202020202020656E643B200D0A2020
              20202020656E643B200D0A0D0A09696620706C456E74726965735B274D696464
              6C655061636552616E6B275D203D2031207468656E20626567696E0D0A092020
              204D6964646C65506163652E466F6E742E426F6C64203A3D20547275653B0D0A
              202020202020202020696620706C456E74726965735B2749734261636B446F75
              626C654C696E6572275D207468656E20626567696E0D0A092020202020204D69
              64646C65506163652E466F6E742E556E6465726C696E65203A3D20547275653B
              0D0A202020202020202020656E643B200D0A202020202020656E643B200D0A20
              20202020200D0A09696620706C456E74726965735B274D6964646C6550616365
              52616E6B275D203D2031207468656E20626567696E0D0A092020204D6964646C
              65506163652E466F6E742E426F6C64203A3D20547275653B0D0A202020202020
              202020696620706C456E74726965735B274973547269706C654C696E6572275D
              207468656E20626567696E0D0A092020202020204D6964646C65506163652E46
              6F6E742E556E6465726C696E65203A3D20547275653B0D0A2020202020202020
              20656E643B200D0A202020202020656E643B200D0A2020202020200D0A096966
              20706C456E74726965735B274D6964646C655061636552616E6B275D203D2031
              207468656E20626567696E0D0A09202020696620706C456E74726965735B274D
              6964646C6550616365506F7352616E6B275D203D2031207468656E2062656769
              6E0D0A09094D6964646C65506163652E466F6E742E426F6C64203A3D20547275
              653B0D0A092020202020204D6964646C65506163652E466F6E742E556E646572
              6C696E65203A3D20547275653B0D0A202020202020202020656E643B200D0A20
              2020202020656E643B200D0A2020202020200D0A656E643B0D0A0D436F6D706F
              6E656E744E616D65060A4D6964646C6550616365094576656E744E616D650607
              4F6E5072696E74074576656E74494402200001060F5472614576656E7448616E
              646C65720B50726F6772616D4E616D6506156C626C57696E5761676572416D74
              4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
              06536F7572636506CB70726F636564757265206C626C57696E5761676572416D
              744F6E5072696E743B0D0A626567696E0D0A09696620706C456E74726965735B
              275761676572416D74275D203E2030207468656E20626567696E0D0A20202020
              202020206C626C57696E5761676572416D742E56697369626C65203A3D205472
              75653B090D0A202020202020656E6420656C736520626567696E0D0A20202020
              202020206C626C57696E5761676572416D742E56697369626C65203A3D204661
              6C73653B090D0A09656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E61
              6D65060E6C626C57696E5761676572416D74094576656E744E616D6506074F6E
              5072696E74074576656E74494402200001060F5472614576656E7448616E646C
              65720B50726F6772616D4E616D6506156C626C506C635761676572416D744F6E
              5072696E740B50726F6772616D54797065070B747450726F6365647572650653
              6F7572636506D070726F636564757265206C626C506C635761676572416D744F
              6E5072696E743B0D0A626567696E0D0A09696620706C456E74726965735B2750
              6C635761676572416D74275D203E2030207468656E20626567696E0D0A202020
              20202020206C626C506C635761676572416D742E56697369626C65203A3D2054
              7275653B090D0A202020202020656E6420656C736520626567696E0D0A202020
              20202020206C626C506C635761676572416D742E56697369626C65203A3D2046
              616C73653B090D0A09656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
              744E616D65060E6C626C506C635761676572416D74094576656E744E616D6506
              074F6E5072696E74074576656E74494402200001060F5472614576656E744861
              6E646C65720B50726F6772616D4E616D6506156C626C53686F5761676572416D
              744F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
              6506536F7572636506D270726F636564757265206C626C53686F576167657241
              6D744F6E5072696E743B0D0A626567696E0D0A0D0A09696620706C456E747269
              65735B2753686F5761676572416D74275D203E2030207468656E20626567696E
              0D0A20202020202020206C626C53686F5761676572416D742E56697369626C65
              203A3D20547275653B090D0A202020202020656E6420656C736520626567696E
              0D0A20202020202020206C626C53686F5761676572416D742E56697369626C65
              203A3D2046616C73653B090D0A09656E643B0D0A0D0A656E643B0D0A0D436F6D
              706F6E656E744E616D65060E6C626C53686F5761676572416D74094576656E74
              4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
              656E7448616E646C65720B50726F6772616D4E616D6506106C626C4578616374
              614F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
              6506536F7572636506C670726F636564757265206C626C4578616374614F6E50
              72696E743B0D0A626567696E0D0A2020202020696620706C5261636573526570
              6F72745B274578615761676572416D74275D203E2030207468656E2062656769
              6E0D0A20092020206C626C4578616374612E56697369626C65203A3D20547275
              653B090D0A202020202020656E6420656C736520626567696E0D0A2020202020
              2020206C626C4578616374612E56697369626C65203A3D2046616C73653B090D
              0A09656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609
              6C626C457861637461094576656E744E616D6506074F6E5072696E7407457665
              6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
              6D4E616D6506126C626C5175696E656C6C614F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F7572636506CF70726F6365
              64757265206C626C5175696E656C6C614F6E5072696E743B0D0A626567696E0D
              0A2020202020696620706C52616365735265706F72745B275175695761676572
              416D74275D203E2030207468656E20626567696E0D0A20202020202020206C62
              6C5175696E656C6C612E56697369626C65203A3D20547275653B090D0A202020
              202020656E6420656C736520626567696E0D0A20202020202020206C626C5175
              696E656C6C612E56697369626C65203A3D2046616C73653B090D0A09656E643B
              0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B6C626C517569
              6E656C6C61094576656E744E616D6506074F6E5072696E74074576656E744944
              02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              65060F6C626C5069636B334F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F7572636506CA70726F636564757265206C62
              6C5069636B334F6E5072696E743B0D0A626567696E0D0A0D0A20202020206966
              20706C52616365735265706F72745B27506B335761676572416D74275D203E20
              30207468656E20626567696E0D0A20202020202020206C626C5069636B332E56
              697369626C65203A3D20547275653B090D0A202020202020656E6420656C7365
              20626567696E0D0A20202020202020206C626C5069636B332E56697369626C65
              203A3D2046616C73653B090D0A09656E643B0D0A0D0A0D0A656E643B0D0A0D43
              6F6D706F6E656E744E616D6506086C626C5069636B33094576656E744E616D65
              06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
              616E646C65720B50726F6772616D4E616D65060F6C626C5069636B344F6E5072
              696E740B50726F6772616D54797065070B747450726F63656475726506536F75
              72636506CB70726F636564757265206C626C5069636B344F6E5072696E743B0D
              0A626567696E0D0A0D0A202020202020696620706C52616365735265706F7274
              5B27506B345761676572416D74275D203E2030207468656E20626567696E0D0A
              20202020202020206C626C5069636B342E56697369626C65203A3D2054727565
              3B090D0A202020202020656E6420656C736520626567696E0D0A202020202020
              20206C626C5069636B342E56697369626C65203A3D2046616C73653B090D0A09
              656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650608
              6C626C5069636B34094576656E744E616D6506074F6E5072696E74074576656E
              74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
              4E616D65060C6C626C44444F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F7572636506BF70726F636564757265206C62
              6C44444F6E5072696E743B0D0A626567696E0D0A0D0A20202020696620706C52
              616365735265706F72745B2744445761676572416D74275D203E203020746865
              6E20626567696E0D0A20202020202020206C626C44442E56697369626C65203A
              3D20547275653B090D0A202020202020656E6420656C736520626567696E0D0A
              20202020202020206C626C44442E56697369626C65203A3D2046616C73653B09
              0D0A09656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              6506056C626C4444094576656E744E616D6506074F6E5072696E74074576656E
              74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
              4E616D65060F6C626C53757065724F6E5072696E740B50726F6772616D547970
              65070B747450726F63656475726506536F7572636506C670726F636564757265
              206C626C53757065724F6E5072696E743B0D0A626567696E0D0A0D0A09696620
              706C52616365735265706F72745B275366635761676572416D74275D203E2030
              207468656E20626567696E0D0A20202020202020206C626C53757065722E5669
              7369626C65203A3D20547275653B090D0A202020202020656E6420656C736520
              626567696E0D0A20202020202020206C626C53757065722E56697369626C6520
              3A3D2046616C73653B090D0A09656E643B0D0A0D0A0D0A656E643B0D0A0D436F
              6D706F6E656E744E616D6506086C626C5375706572094576656E744E616D6506
              074F6E5072696E74074576656E74494402200001060F5472614576656E744861
              6E646C65720B50726F6772616D4E616D65060D6C626C5472694F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              06C370726F636564757265206C626C5472694F6E5072696E743B0D0A62656769
              6E0D0A202020202020696620706C52616365735265706F72745B275472695761
              676572416D74275D203E2030207468656E20626567696E0D0A20202020202020
              206C626C5472692E56697369626C65203A3D20547275653B090D0A2020202020
              20656E6420656C736520626567696E0D0A20202020202020206C626C5472692E
              56697369626C65203A3D2046616C73653B090D0A09656E643B0D0A0D0A0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D6506066C626C547269094576656E
              744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
              76656E7448616E646C65720B50726F6772616D4E616D6506156C626C54726957
              61676572416D744F6E5072696E740B50726F6772616D54797065070B74745072
              6F63656475726506536F7572636506D270726F636564757265206C626C547269
              5761676572416D744F6E5072696E743B0D0A626567696E0D0A20202020202069
              6620706C52616365735265706F72745B275472695761676572416D74275D203E
              2030207468656E20626567696E0D0A20092020206C626C547269576167657241
              6D742E56697369626C65203A3D20547275653B090D0A202020202020656E6420
              656C736520626567696E0D0A092020206C626C5472695761676572416D742E56
              697369626C65203A3D2046616C73653B090D0A09656E643B0D0A0D0A656E643B
              0D0A0D436F6D706F6E656E744E616D65060E6C626C5472695761676572416D74
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506156C62
              6C5366635761676572416D744F6E5072696E740B50726F6772616D5479706507
              0B747450726F63656475726506536F7572636506D470726F636564757265206C
              626C5366635761676572416D744F6E5072696E743B0D0A626567696E0D0A0D0A
              202020202020696620706C52616365735265706F72745B275366635761676572
              416D74275D203E2030207468656E20626567696E0D0A20092020206C626C5366
              635761676572416D742E56697369626C65203A3D20547275653B090D0A202020
              202020656E6420656C736520626567696E0D0A092020206C626C536663576167
              6572416D742E56697369626C65203A3D2046616C73653B090D0A09656E643B0D
              0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E6C626C53666357
              61676572416D74094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D6506146C626C44445761676572416D744F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F7572636506CB70726F6365
              64757265206C626C44445761676572416D744F6E5072696E743B0D0A62656769
              6E0D0A202020696620706C52616365735265706F72745B274444576167657241
              6D74275D203E2030207468656E20626567696E0D0A20092020206C626C444457
              61676572416D742E56697369626C65203A3D20547275653B090D0A2020202020
              20656E6420656C736520626567696E0D0A092020206C626C4444576167657241
              6D742E56697369626C65203A3D2046616C73653B090D0A09656E643B0D0A0D0A
              656E643B0D0A0D436F6D706F6E656E744E616D65060D6C626C44445761676572
              416D74094576656E744E616D6506074F6E5072696E74074576656E7449440220
              0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
              156C626C506B335761676572416D744F6E5072696E740B50726F6772616D5479
              7065070B747450726F63656475726506536F7572636506CF70726F6365647572
              65206C626C506B335761676572416D744F6E5072696E743B0D0A626567696E0D
              0A202020696620706C52616365735265706F72745B27506B335761676572416D
              74275D203E2030207468656E20626567696E0D0A20092020206C626C506B3357
              61676572416D742E56697369626C65203A3D20547275653B090D0A2020202020
              20656E6420656C736520626567696E0D0A092020206C626C506B335761676572
              416D742E56697369626C65203A3D2046616C73653B090D0A09656E643B0D0A0D
              0A656E643B0D0A0D436F6D706F6E656E744E616D65060E6C626C506B33576167
              6572416D74094576656E744E616D6506074F6E5072696E74074576656E744944
              02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              6506156C626C506B345761676572416D744F6E5072696E740B50726F6772616D
              54797065070B747450726F63656475726506536F7572636506CB70726F636564
              757265206C626C506B345761676572416D744F6E5072696E743B0D0A62656769
              6E0D0A09696620706C52616365735265706F72745B27506B345761676572416D
              74275D203E2030207468656E20626567696E0D0A20092020206C626C506B3457
              61676572416D742E56697369626C65203A3D20547275653B090D0A2020202020
              20656E6420656C736520626567696E0D0A092020206C626C506B345761676572
              416D742E56697369626C65203A3D2046616C73653B090D0A09656E643B0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D65060E6C626C506B345761676572
              416D74094576656E744E616D6506074F6E5072696E74074576656E7449440220
              0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
              1746696E616C4C696E65546F31466169724F6E5072696E740B50726F6772616D
              54797065070B747450726F63656475726506536F7572636506F170726F636564
              7572652046696E616C4C696E65546F31466169724F6E5072696E743B0D0A6265
              67696E0D0A0D0A20202046696E616C4C696E65546F31466169722E466F6E742E
              426F6C64203A3D2046616C73653B0D0A0D0A202020696620706C456E74726965
              735B274D6F726E696E674C696E65546F3146616972275D203E20706C456E7472
              6965735B2746696E616C4C696E65546F3146616972275D207468656E20626567
              696E0D0A0920202046696E616C4C696E65546F31466169722E466F6E742E426F
              6C64203A3D20547275653B0D0A202020656E643B0D0A2020200D0A656E643B0D
              0A2020200D0A2020200D0A0D436F6D706F6E656E744E616D65061046696E616C
              4C696E65546F3146616972094576656E744E616D6506074F6E5072696E740745
              76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D6506114B5350326E6443616C6C4F6E5072696E740B50726F6772
              616D54797065070B747450726F63656475726506536F757263650C1402000070
              726F636564757265204B5350326E6443616C6C4F6E5072696E743B0D0A626567
              696E0D0A20696620706C456E74726965735B274B5350326E6443616C6C275D20
              3D2039393939207468656E20626567696E0D0A2020202020202020204B535032
              6E6443616C6C2E56697369626C65203A3D2046616C73653B0D0A202020202020
              656E6420656C736520626567696E0D0A2020202020202020204B5350326E6443
              616C6C2E56697369626C65203A3D20547275653B0D0A202020202020656E643B
              0D0A2020202020200D0A2020202020200D0A096966202828706C456E74726965
              735B274B5350326E6443616C6C52616E6B275D203D20312920616E64200D0A09
              20202028706C456E74726965735B27515350326E6443616C6C52616E6B275D20
              3D20312929207468656E20626567696E0D0A2020202020202020204B5350326E
              6443616C6C2E466F6E742E426F6C64203A3D20547275653B0D0A202020202020
              2020204B5350326E6443616C6C2E466F6E742E556E6465726C696E65203A3D20
              547275653B0D0A2020202020202020200D0A202020202020656E6420656C7365
              20626567696E0D0A2020202020202020204B5350326E6443616C6C2E466F6E74
              2E426F6C64203A3D2046616C73653B0D0A2020202020202020204B5350326E64
              43616C6C2E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A20
              2020202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              65060A4B5350326E6443616C6C094576656E744E616D6506074F6E5072696E74
              074576656E74494402200000}
          end
        end
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 77523
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 25400
        mmLeft = 112184
        mmTop = 5292
        mmWidth = 34131
        BandType = 7
      end
      object lblFilter: TppLabel
        UserName = 'lblFilter'
        AutoSize = False
        Caption = 'lblFilter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        WordWrap = True
        mmHeight = 10583
        mmLeft = 0
        mmTop = 65617
        mmWidth = 214842
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Nbr Of Wagers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 5027
        mmLeft = 37042
        mmTop = 0
        mmWidth = 29633
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label102'
        Caption = 'Wager Type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4995
        mmLeft = 3175
        mmTop = 0
        mmWidth = 23961
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label103'
        Caption = 'Win'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 6615
        mmWidth = 6350
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Daily Double'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 19844
        mmWidth = 19844
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Pick 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 24871
        mmWidth = 9525
        BandType = 7
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'Pick 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 30956
        mmWidth = 9525
        BandType = 7
      end
      object varWinWagers: TppVariable
        UserName = 'varWinWagers'
        CalcOrder = 0
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varWinWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 6615
        mmWidth = 23283
        BandType = 7
      end
      object varDDWagers: TppVariable
        UserName = 'varDDWagers'
        CalcOrder = 2
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varDDWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 19844
        mmWidth = 22225
        BandType = 7
      end
      object varPk3Wagers: TppVariable
        UserName = 'varPk3Wagers'
        CalcOrder = 4
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varPk3WagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 25400
        mmWidth = 23283
        BandType = 7
      end
      object varPk4Wagers: TppVariable
        UserName = 'varPk4Wagers'
        CalcOrder = 6
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varPk4WagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 30956
        mmWidth = 23283
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Cost Of Wagers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 5027
        mmLeft = 71702
        mmTop = 0
        mmWidth = 31750
        BandType = 7
      end
      object varWinCost: TppVariable
        UserName = 'varWinCost'
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varWinCostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 6615
        mmWidth = 18256
        BandType = 7
      end
      object varDDCost: TppVariable
        UserName = 'varDDCost'
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varDDCostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 85990
        mmTop = 19844
        mmWidth = 17198
        BandType = 7
      end
      object varPk3Cost: TppVariable
        UserName = 'varPk3Cost'
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varPk3CostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 25400
        mmWidth = 18256
        BandType = 7
      end
      object varPk4Cost: TppVariable
        UserName = 'varPk4Cost'
        CalcOrder = 7
        DataType = dtDouble
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varPk4CostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 30956
        mmWidth = 18256
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17463
        mmTop = 59267
        mmWidth = 9525
        BandType = 7
      end
      object varTotalWagers: TppVariable
        UserName = 'varTotalWagers'
        CalcOrder = 9
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varTotalWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 42863
        mmTop = 59267
        mmWidth = 25135
        BandType = 7
      end
      object varTotalCost: TppVariable
        UserName = 'varTotalCost'
        CalcOrder = 8
        DataType = dtDouble
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varTotalCostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 59267
        mmWidth = 19844
        BandType = 7
      end
      object varTriWagers: TppVariable
        UserName = 'varTriWagers'
        CalcOrder = 10
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varTriWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 36513
        mmWidth = 21431
        BandType = 7
      end
      object varSfcWagers: TppVariable
        UserName = 'varSfcWagers'
        CalcOrder = 11
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varSfcWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 44450
        mmTop = 42069
        mmWidth = 22225
        BandType = 7
      end
      object varExaWagers: TppVariable
        UserName = 'varExaWagers'
        CalcOrder = 12
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varExaWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 47625
        mmWidth = 23283
        BandType = 7
      end
      object varQuiWagers: TppVariable
        UserName = 'varQuiWagers'
        CalcOrder = 13
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varQuiWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43921
        mmTop = 54240
        mmWidth = 22754
        BandType = 7
      end
      object varTriCost: TppVariable
        UserName = 'varTriCost'
        CalcOrder = 14
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 87048
        mmTop = 36513
        mmWidth = 16140
        BandType = 7
      end
      object varSfcCost: TppVariable
        UserName = 'varSfcCost'
        CalcOrder = 15
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 85990
        mmTop = 42069
        mmWidth = 17198
        BandType = 7
      end
      object varExaCost: TppVariable
        UserName = 'varExaCost'
        CalcOrder = 16
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varExaCostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 47625
        mmWidth = 18256
        BandType = 7
      end
      object varQuiCost: TppVariable
        UserName = 'varQuiCost'
        CalcOrder = 17
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 54240
        mmWidth = 17463
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Trifecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 15610
        mmTop = 37042
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Exacta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 47890
        mmWidth = 10848
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Quinella'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 54769
        mmWidth = 12700
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Superfecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 42598
        mmWidth = 16933
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Place'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 18785
        mmTop = 11113
        mmWidth = 8731
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Show'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 15610
        mmWidth = 8721
        BandType = 7
      end
      object varPlcWagers: TppVariable
        UserName = 'varPlcWagers'
        CalcOrder = 18
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varPlcWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 44354
        mmTop = 10848
        mmWidth = 22056
        BandType = 7
      end
      object varShoWagers: TppVariable
        UserName = 'varShoWagers'
        CalcOrder = 19
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varShoWagersCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 43529
        mmTop = 15346
        mmWidth = 23410
        BandType = 7
      end
      object varPlcCost: TppVariable
        UserName = 'varPlcCost'
        CalcOrder = 20
        DataType = dtDouble
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varPlcCostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 86211
        mmTop = 11113
        mmWidth = 16976
        BandType = 7
      end
      object varShoCost: TppVariable
        UserName = 'varShoCost'
        CalcOrder = 21
        DataType = dtDouble
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = varShoCostCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 85387
        mmTop = 15610
        mmWidth = 18330
        BandType = 7
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'StartBank'
        DataPipeline = plBank
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBank'
        mmHeight = 4530
        mmLeft = 121073
        mmTop = 7408
        mmWidth = 22860
        BandType = 7
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'WagerAmt'
        DataPipeline = plBank
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBank'
        mmHeight = 4530
        mmLeft = 123614
        mmTop = 16404
        mmWidth = 20320
        BandType = 7
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'EndBank'
        DataPipeline = plBank
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBank'
        mmHeight = 4530
        mmLeft = 126153
        mmTop = 24342
        mmWidth = 17780
        BandType = 7
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 24
    Top = 146
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 544
    Top = 176
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagerReport'
    EngineVersion = '4.24 Build 1'
    ReadOnly = True
    TableName = 'Race.DAT'
    Left = 448
    Top = 200
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 544
    Top = 121
  end
  object tblWagers: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagerReport'
    EngineVersion = '4.24 Build 1'
    IndexFieldNames = 'TrkCode;RaceDate;RaceNbr;PostPos'
    MasterFields = 'TrkCode;RaceDate;RaceNbr;PostPos'
    MasterSource = dsEntries
    TableName = 'Wagers'
    Left = 264
    Top = 152
  end
  object tblBank: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbWagerReport'
    EngineVersion = '4.24 Build 1'
    IndexFieldNames = 'WagerType;WagerDate'
    MasterFields = 'WagerType;RaceDate'
    MasterSource = dsWagers
    TableName = 'Bank'
    Left = 352
    Top = 160
  end
  object dsWagers: TDataSource
    DataSet = tblWagers
    Left = 270
    Top = 211
  end
  object plWagers: TppDBPipeline
    DataSource = dsWagers
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plWagers'
    OnTraversal = plEntriesTraversal
    Left = 278
    Top = 273
    MasterDataPipelineName = 'plEntries'
  end
  object dsBank: TDataSource
    DataSet = tblBank
    Left = 350
    Top = 211
  end
  object plBank: TppDBPipeline
    DataSource = dsBank
    CloseDataSource = True
    UserName = 'plBank'
    OnTraversal = plEntriesTraversal
    Left = 350
    Top = 273
    MasterDataPipelineName = 'plWagers'
  end
end
