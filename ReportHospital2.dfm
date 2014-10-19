object HospitalReport2Form: THospitalReport2Form
  Left = 416
  Top = 129
  Width = 576
  Height = 333
  Caption = 'Hospital Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poPrintToFit
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object pnlPrgBar: TPanel
    Left = 6
    Top = 17
    Width = 676
    Height = 51
    BorderStyle = bsSingle
    Caption = 'pnlPrgBar'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
    object prgBar: TProgressBar
      Left = 12
      Top = 14
      Width = 649
      Height = 19
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = 0
    Top = 253
    Width = 682
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = 6
    Top = 82
    Width = 676
    Height = 52
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbHospitalReport2: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbHospitalReport2'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    BeforeConnect = dbHospitalReport2BeforeConnect
    Left = 248
    Top = 184
  end
  object tblRacesMaster: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbHospitalReport2'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByTrkCodeRaceNbr'
    ReadOnly = True
    TableName = 'Race.DAT'
    Left = 32
    Top = 112
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    OnNext = plRacesReportNext
    OnTraversal = plRacesReportTraversal
    Left = 24
    Top = 200
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
      FieldAlias = 'EstTimeOfRace'
      FieldName = 'EstTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 4
    end
    object plRacesReportppField6: TppField
      FieldAlias = 'EstTimeOfFirstRace'
      FieldName = 'EstTimeOfFirstRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 5
    end
    object plRacesReportppField7: TppField
      FieldAlias = 'LocalTimeOfRace'
      FieldName = 'LocalTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 6
    end
    object plRacesReportppField8: TppField
      FieldAlias = 'CT'
      FieldName = 'CT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object plRacesReportppField9: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object plRacesReportppField10: TppField
      FieldAlias = 'ActualSurface'
      FieldName = 'ActualSurface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object plRacesReportppField11: TppField
      FieldAlias = 'AltSurface'
      FieldName = 'AltSurface'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object plRacesReportppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFeet'
      FieldName = 'DistanceInFeet'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object plRacesReportppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInYards'
      FieldName = 'DistanceInYards'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object plRacesReportppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object plRacesReportppField15: TppField
      FieldAlias = 'DistanceDesc'
      FieldName = 'DistanceDesc'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object plRacesReportppField16: TppField
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 15
    end
    object plRacesReportppField17: TppField
      FieldAlias = 'TypeOfRace'
      FieldName = 'TypeOfRace'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object plRacesReportppField18: TppField
      FieldAlias = 'RaceTypeDesc'
      FieldName = 'RaceTypeDesc'
      FieldLength = 25
      DisplayWidth = 25
      Position = 17
    end
    object plRacesReportppField19: TppField
      FieldAlias = 'RaceDesc'
      FieldName = 'RaceDesc'
      FieldLength = 250
      DisplayWidth = 250
      Position = 18
    end
    object plRacesReportppField20: TppField
      FieldAlias = 'RaceCondition'
      FieldName = 'RaceCondition'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 19
      Searchable = False
      Sortable = False
    end
    object plRacesReportppField21: TppField
      FieldAlias = 'IsTurfRace'
      FieldName = 'IsTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 20
    end
    object plRacesReportppField22: TppField
      FieldAlias = 'IsRouteRace'
      FieldName = 'IsRouteRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 21
    end
    object plRacesReportppField23: TppField
      FieldAlias = 'IsMaidenSpecialRace'
      FieldName = 'IsMaidenSpecialRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 22
    end
    object plRacesReportppField24: TppField
      FieldAlias = 'IsMaidenClaimingRace'
      FieldName = 'IsMaidenClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 23
    end
    object plRacesReportppField25: TppField
      FieldAlias = 'IsMaidenOrTurfRace'
      FieldName = 'IsMaidenOrTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 24
    end
    object plRacesReportppField26: TppField
      FieldAlias = 'IsTwoYearOldRace'
      FieldName = 'IsTwoYearOldRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 25
    end
    object plRacesReportppField27: TppField
      FieldAlias = 'IsClaimingRace'
      FieldName = 'IsClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 26
    end
    object plRacesReportppField28: TppField
      FieldAlias = 'AgeSexRestriction'
      FieldName = 'AgeSexRestriction'
      FieldLength = 3
      DisplayWidth = 3
      Position = 27
    end
    object plRacesReportppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'Purse'
      FieldName = 'Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object plRacesReportppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClaimingPrice'
      FieldName = 'ClaimingPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object plRacesReportppField31: TppField
      FieldAlias = 'SimulcastTrkCode'
      FieldName = 'SimulcastTrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 30
    end
    object plRacesReportppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'SimulcastRaceNbr'
      FieldName = 'SimulcastRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 31
    end
    object plRacesReportppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceAutoInc'
      FieldName = 'RaceAutoInc'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 32
    end
    object plRacesReportppField34: TppField
      FieldAlias = 'TimeDiff'
      FieldName = 'TimeDiff'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 33
    end
    object plRacesReportppField35: TppField
      FieldAlias = 'IsDDRace'
      FieldName = 'IsDDRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 34
    end
    object plRacesReportppField36: TppField
      FieldAlias = 'DDRaceNbr'
      FieldName = 'DDRaceNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 35
    end
    object plRacesReportppField37: TppField
      FieldAlias = 'IsPk3Race'
      FieldName = 'IsPk3Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 36
    end
    object plRacesReportppField38: TppField
      FieldAlias = 'Pk3RaceNbr'
      FieldName = 'Pk3RaceNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
    object plRacesReportppField39: TppField
      FieldAlias = 'IsPk4Race'
      FieldName = 'IsPk4Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 38
    end
    object plRacesReportppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk4RaceNbr'
      FieldName = 'Pk4RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 39
    end
    object plRacesReportppField41: TppField
      FieldAlias = 'IsPk6Race'
      FieldName = 'IsPk6Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 40
    end
    object plRacesReportppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'PK6RaceNbr'
      FieldName = 'PK6RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 41
    end
    object plRacesReportppField43: TppField
      FieldAlias = 'IsTriRace'
      FieldName = 'IsTriRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 42
    end
    object plRacesReportppField44: TppField
      FieldAlias = 'IsSuperRace'
      FieldName = 'IsSuperRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 43
    end
    object plRacesReportppField45: TppField
      FieldAlias = 'IsQuiRace'
      FieldName = 'IsQuiRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 44
    end
    object plRacesReportppField46: TppField
      FieldAlias = 'IsExaRace'
      FieldName = 'IsExaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 45
    end
    object plRacesReportppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrTriKey'
      FieldName = 'NbrTriKey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 46
    end
    object plRacesReportppField48: TppField
      FieldAlias = 'IsPk3Leg1'
      FieldName = 'IsPk3Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 47
    end
    object plRacesReportppField49: TppField
      FieldAlias = 'IsPk4Leg1'
      FieldName = 'IsPk4Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 48
    end
    object plRacesReportppField50: TppField
      FieldAlias = 'IsPk6Leg1'
      FieldName = 'IsPk6Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 49
    end
    object plRacesReportppField51: TppField
      FieldAlias = 'IsPk9Leg1'
      FieldName = 'IsPk9Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 50
    end
    object plRacesReportppField52: TppField
      FieldAlias = 'IsDDLeg1'
      FieldName = 'IsDDLeg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 51
    end
    object plRacesReportppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalPk3Choices'
      FieldName = 'TotalPk3Choices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 52
    end
    object plRacesReportppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3KeyType'
      FieldName = 'Pk3KeyType'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 53
    end
    object plRacesReportppField55: TppField
      FieldAlias = 'Pk3Selected'
      FieldName = 'Pk3Selected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 54
    end
    object plRacesReportppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTriChoices'
      FieldName = 'TotalTriChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 55
    end
    object plRacesReportppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalSuperChoices'
      FieldName = 'TotalSuperChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 56
    end
    object plRacesReportppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDDChoices'
      FieldName = 'TotalDDChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 57
    end
    object plRacesReportppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLastSpeed'
      FieldName = 'TopLastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 58
    end
    object plRacesReportppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopBackSpeed'
      FieldName = 'TopBackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 59
    end
    object plRacesReportppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLastClass'
      FieldName = 'TopLastClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object plRacesReportppField62: TppField
      FieldAlias = 'AltWager1'
      FieldName = 'AltWager1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 61
    end
    object plRacesReportppField63: TppField
      FieldAlias = 'AltWager2'
      FieldName = 'AltWager2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 62
    end
    object plRacesReportppField64: TppField
      FieldAlias = 'AltWager3'
      FieldName = 'AltWager3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 63
    end
    object plRacesReportppField65: TppField
      FieldAlias = 'AltWager4'
      FieldName = 'AltWager4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 64
    end
    object plRacesReportppField66: TppField
      FieldAlias = 'AltWager5'
      FieldName = 'AltWager5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 65
    end
    object plRacesReportppField67: TppField
      FieldAlias = 'AltWager6'
      FieldName = 'AltWager6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 66
    end
    object plRacesReportppField68: TppField
      FieldAlias = 'Wager1'
      FieldName = 'Wager1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 67
    end
    object plRacesReportppField69: TppField
      FieldAlias = 'Wager2'
      FieldName = 'Wager2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 68
    end
    object plRacesReportppField70: TppField
      FieldAlias = 'Wager3'
      FieldName = 'Wager3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 69
    end
    object plRacesReportppField71: TppField
      FieldAlias = 'Wager4'
      FieldName = 'Wager4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 70
    end
    object plRacesReportppField72: TppField
      FieldAlias = 'Wager5'
      FieldName = 'Wager5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 71
    end
    object plRacesReportppField73: TppField
      FieldAlias = 'Wager6'
      FieldName = 'Wager6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 72
    end
    object plRacesReportppField74: TppField
      FieldAlias = 'WagerFinalOrder'
      FieldName = 'WagerFinalOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 73
    end
    object plRacesReportppField75: TppField
      FieldAlias = 'WagerSheetOrder'
      FieldName = 'WagerSheetOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 74
    end
    object plRacesReportppField76: TppField
      FieldAlias = 'TodaysWagerOrder'
      FieldName = 'TodaysWagerOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 75
    end
    object plRacesReportppField77: TppField
      FieldAlias = 'Tri'
      FieldName = 'Tri'
      FieldLength = 40
      DisplayWidth = 40
      Position = 76
    end
    object plRacesReportppField78: TppField
      FieldAlias = 'DD'
      FieldName = 'DD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 77
    end
    object plRacesReportppField79: TppField
      FieldAlias = 'Super'
      FieldName = 'Super'
      FieldLength = 40
      DisplayWidth = 40
      Position = 78
    end
    object plRacesReportppField80: TppField
      FieldAlias = 'Exacta'
      FieldName = 'Exacta'
      FieldLength = 40
      DisplayWidth = 40
      Position = 79
    end
    object plRacesReportppField81: TppField
      FieldAlias = 'Quinella'
      FieldName = 'Quinella'
      FieldLength = 40
      DisplayWidth = 40
      Position = 80
    end
    object plRacesReportppField82: TppField
      FieldAlias = 'Pick3'
      FieldName = 'Pick3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 81
    end
    object plRacesReportppField83: TppField
      FieldAlias = 'Pick4'
      FieldName = 'Pick4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 82
    end
    object plRacesReportppField84: TppField
      FieldAlias = 'Pick6'
      FieldName = 'Pick6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 83
    end
    object plRacesReportppField85: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 84
    end
    object plRacesReportppField86: TppField
      FieldAlias = 'IsYoubetTrack'
      FieldName = 'IsYoubetTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 85
    end
    object plRacesReportppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'WPSWagerAmt'
      FieldName = 'WPSWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object plRacesReportppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'SfcWagerAmt'
      FieldName = 'SfcWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object plRacesReportppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'TriWagerAmt'
      FieldName = 'TriWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object plRacesReportppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExaWagerAmt'
      FieldName = 'ExaWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object plRacesReportppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuiWagerAmt'
      FieldName = 'QuiWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object plRacesReportppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'DDWagerAmt'
      FieldName = 'DDWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 91
    end
    object plRacesReportppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3WagerAmt'
      FieldName = 'Pk3WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object plRacesReportppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk4WagerAmt'
      FieldName = 'Pk4WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 93
    end
    object plRacesReportppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk6WagerAmt'
      FieldName = 'Pk6WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object plRacesReportppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopEarlyPace'
      FieldName = 'TopEarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 95
    end
    object plRacesReportppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopMiddlePace'
      FieldName = 'TopMiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 96
    end
    object plRacesReportppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLatePace'
      FieldName = 'TopLatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 97
    end
    object plRacesReportppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopEarlyPacePos'
      FieldName = 'TopEarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 98
    end
    object plRacesReportppField100: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopMiddlePacePos'
      FieldName = 'TopMiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 99
    end
    object plRacesReportppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLatePacePos'
      FieldName = 'TopLatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 100
    end
    object plRacesReportppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondEarlyPace'
      FieldName = 'SecondEarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 101
    end
    object plRacesReportppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondMiddlePace'
      FieldName = 'SecondMiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 102
    end
    object plRacesReportppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondLatePace'
      FieldName = 'SecondLatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 103
    end
    object plRacesReportppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondEarlyPacePos'
      FieldName = 'SecondEarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object plRacesReportppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondMiddlePacePos'
      FieldName = 'SecondMiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 105
    end
    object plRacesReportppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondLatePacePos'
      FieldName = 'SecondLatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 106
    end
    object plRacesReportppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopPower'
      FieldName = 'TopPower'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 107
    end
    object plRacesReportppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondTopPower'
      FieldName = 'SecondTopPower'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object plRacesReportppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'ThirdTopPower'
      FieldName = 'ThirdTopPower'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 109
    end
    object plRacesReportppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'FourthTopPower'
      FieldName = 'FourthTopPower'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object plRacesReportppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaxWPSBet'
      FieldName = 'MaxWPSBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 111
    end
    object plRacesReportppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaxGimmickBet'
      FieldName = 'MaxGimmickBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object plRacesReportppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrStarters'
      FieldName = 'NbrStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 113
    end
    object plRacesReportppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrDebutStarters'
      FieldName = 'NbrDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 114
    end
    object plRacesReportppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrDebutTwoStarters'
      FieldName = 'NbrDebutTwoStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 115
    end
    object plRacesReportppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrTurfDebutStarters'
      FieldName = 'NbrTurfDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 116
    end
    object plRacesReportppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrRouteDebutStarters'
      FieldName = 'NbrRouteDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 117
    end
    object plRacesReportppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrScratchedStarters'
      FieldName = 'NbrScratchedStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 118
    end
    object plRacesReportppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrRunners'
      FieldName = 'NbrRunners'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 119
    end
    object plRacesReportppField121: TppField
      FieldAlias = 'OrigSurface'
      FieldName = 'OrigSurface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 120
    end
    object plRacesReportppField122: TppField
      FieldAlias = 'IsPk9Place'
      FieldName = 'IsPk9Place'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 121
    end
    object plRacesReportppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk9RaceNbr'
      FieldName = 'Pk9RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 122
    end
    object plRacesReportppField124: TppField
      FieldAlias = 'RaceCondition1'
      FieldName = 'RaceCondition1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 123
    end
    object plRacesReportppField125: TppField
      FieldAlias = 'RaceCondition2'
      FieldName = 'RaceCondition2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 124
    end
    object plRacesReportppField126: TppField
      FieldAlias = 'RaceCondition3'
      FieldName = 'RaceCondition3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 125
    end
    object plRacesReportppField127: TppField
      FieldAlias = 'RaceCondition4'
      FieldName = 'RaceCondition4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 126
    end
    object plRacesReportppField128: TppField
      FieldAlias = 'RaceCondition5'
      FieldName = 'RaceCondition5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 127
    end
    object plRacesReportppField129: TppField
      FieldAlias = 'RaceCondition6'
      FieldName = 'RaceCondition6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 128
    end
    object plRacesReportppField130: TppField
      FieldAlias = 'BetLine'
      FieldName = 'BetLine'
      FieldLength = 500
      DisplayWidth = 500
      Position = 129
    end
    object plRacesReportppField131: TppField
      FieldAlias = 'RaceConditions'
      FieldName = 'RaceConditions'
      FieldLength = 15
      DisplayWidth = 15
      Position = 130
    end
    object plRacesReportppField132: TppField
      FieldAlias = 'TrkCond'
      FieldName = 'TrkCond'
      FieldLength = 3
      DisplayWidth = 3
      Position = 131
    end
    object plRacesReportppField133: TppField
      FieldAlias = 'OrigDistanceDesc'
      FieldName = 'OrigDistanceDesc'
      FieldLength = 20
      DisplayWidth = 20
      Position = 132
    end
    object plRacesReportppField134: TppField
      FieldAlias = 'IsExactaMatched'
      FieldName = 'IsExactaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 133
    end
    object plRacesReportppField135: TppField
      FieldAlias = 'ExactaNbrs'
      FieldName = 'ExactaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 134
    end
    object plRacesReportppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaWager'
      FieldName = 'ExactaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 135
    end
    object plRacesReportppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaPayout'
      FieldName = 'ExactaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object plRacesReportppField138: TppField
      FieldAlias = 'IsTrifectaMatched'
      FieldName = 'IsTrifectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 137
    end
    object plRacesReportppField139: TppField
      FieldAlias = 'TrifectaNbrs'
      FieldName = 'TrifectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 138
    end
    object plRacesReportppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaWager'
      FieldName = 'TrifectaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 139
    end
    object plRacesReportppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaPayout'
      FieldName = 'TrifectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 140
    end
    object plRacesReportppField142: TppField
      FieldAlias = 'IsSuperfectaMatched'
      FieldName = 'IsSuperfectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 141
    end
    object plRacesReportppField143: TppField
      FieldAlias = 'SuperfectaNbrs'
      FieldName = 'SuperfectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 142
    end
    object plRacesReportppField144: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaWager'
      FieldName = 'SuperfectaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 143
    end
    object plRacesReportppField145: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaPayout'
      FieldName = 'SuperfectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 144
    end
    object plRacesReportppField146: TppField
      FieldAlias = 'IsDailyDoubleMatchedFirstRace'
      FieldName = 'IsDailyDoubleMatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 145
    end
    object plRacesReportppField147: TppField
      FieldAlias = 'IsDailyDoubleMatchedLastRace'
      FieldName = 'IsDailyDoubleMatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 146
    end
    object plRacesReportppField148: TppField
      FieldAlias = 'DDFirstRace'
      FieldName = 'DDFirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 147
    end
    object plRacesReportppField149: TppField
      FieldAlias = 'DDLastRace'
      FieldName = 'DDLastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 148
    end
    object plRacesReportppField150: TppField
      FieldAlias = 'DailyDoubleNbrsFirstRace'
      FieldName = 'DailyDoubleNbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 149
    end
    object plRacesReportppField151: TppField
      FieldAlias = 'DailyDoubleNbrsLastRace'
      FieldName = 'DailyDoubleNbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 150
    end
    object plRacesReportppField152: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerFirstRace'
      FieldName = 'DailyDoubleWagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 151
    end
    object plRacesReportppField153: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerLastRace'
      FieldName = 'DailyDoubleWagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 152
    end
    object plRacesReportppField154: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutFirstRace'
      FieldName = 'DailyDoublePayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 153
    end
    object plRacesReportppField155: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutLastRace'
      FieldName = 'DailyDoublePayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 154
    end
    object plRacesReportppField156: TppField
      FieldAlias = 'IsQuinellaMatched'
      FieldName = 'IsQuinellaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 155
    end
    object plRacesReportppField157: TppField
      FieldAlias = 'QuinellaNbrs'
      FieldName = 'QuinellaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 156
    end
    object plRacesReportppField158: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaWager'
      FieldName = 'QuinellaWager'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 157
    end
    object plRacesReportppField159: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaPayout'
      FieldName = 'QuinellaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 158
    end
    object plRacesReportppField160: TppField
      FieldAlias = 'IsPick3MatchedFirstRace'
      FieldName = 'IsPick3MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 159
    end
    object plRacesReportppField161: TppField
      FieldAlias = 'IsPick3MatchedLastRace'
      FieldName = 'IsPick3MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 160
    end
    object plRacesReportppField162: TppField
      FieldAlias = 'Pick3FirstRace'
      FieldName = 'Pick3FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 161
    end
    object plRacesReportppField163: TppField
      FieldAlias = 'Pick3LastRace'
      FieldName = 'Pick3LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 162
    end
    object plRacesReportppField164: TppField
      FieldAlias = 'Pick3NbrsFirstRace'
      FieldName = 'Pick3NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 163
    end
    object plRacesReportppField165: TppField
      FieldAlias = 'Pick3NbrsLastRace'
      FieldName = 'Pick3NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 164
    end
    object plRacesReportppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerFirstRace'
      FieldName = 'Pick3WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 165
    end
    object plRacesReportppField167: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerLastRace'
      FieldName = 'Pick3WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 166
    end
    object plRacesReportppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutFirstRace'
      FieldName = 'Pick3PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 167
    end
    object plRacesReportppField169: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutLastRace'
      FieldName = 'Pick3PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 168
    end
    object plRacesReportppField170: TppField
      FieldAlias = 'Pick3NbrsLeg1'
      FieldName = 'Pick3NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 169
    end
    object plRacesReportppField171: TppField
      FieldAlias = 'Pick3NbrsLeg2'
      FieldName = 'Pick3NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 170
    end
    object plRacesReportppField172: TppField
      FieldAlias = 'Pick3NbrsLeg3'
      FieldName = 'Pick3NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 171
    end
    object plRacesReportppField173: TppField
      FieldAlias = 'IsPick4MatchedFirstRace'
      FieldName = 'IsPick4MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 172
    end
    object plRacesReportppField174: TppField
      FieldAlias = 'IsPick4MatchedLastRace'
      FieldName = 'IsPick4MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 173
    end
    object plRacesReportppField175: TppField
      FieldAlias = 'Pick4FirstRace'
      FieldName = 'Pick4FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 174
    end
    object plRacesReportppField176: TppField
      FieldAlias = 'Pick4LastRace'
      FieldName = 'Pick4LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 175
    end
    object plRacesReportppField177: TppField
      FieldAlias = 'Pick4NbrsFirstRace'
      FieldName = 'Pick4NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 176
    end
    object plRacesReportppField178: TppField
      FieldAlias = 'Pick4NbrsLastRace'
      FieldName = 'Pick4NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 177
    end
    object plRacesReportppField179: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerFirstRace'
      FieldName = 'Pick4WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 178
    end
    object plRacesReportppField180: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerLastRace'
      FieldName = 'Pick4WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 179
    end
    object plRacesReportppField181: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutFirstRace'
      FieldName = 'Pick4PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 180
    end
    object plRacesReportppField182: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutLastRace'
      FieldName = 'Pick4PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 181
    end
    object plRacesReportppField183: TppField
      FieldAlias = 'Pick4NbrsLeg1'
      FieldName = 'Pick4NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 182
    end
    object plRacesReportppField184: TppField
      FieldAlias = 'Pick4NbrsLeg2'
      FieldName = 'Pick4NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 183
    end
    object plRacesReportppField185: TppField
      FieldAlias = 'Pick4NbrsLeg3'
      FieldName = 'Pick4NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 184
    end
    object plRacesReportppField186: TppField
      FieldAlias = 'Pick4NbrsLeg4'
      FieldName = 'Pick4NbrsLeg4'
      FieldLength = 25
      DisplayWidth = 25
      Position = 185
    end
    object plRacesReportppField187: TppField
      FieldAlias = 'IsPick6MatchedFirstRace'
      FieldName = 'IsPick6MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 186
    end
    object plRacesReportppField188: TppField
      FieldAlias = 'IsPick6MatchedLastRace'
      FieldName = 'IsPick6MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 187
    end
    object plRacesReportppField189: TppField
      FieldAlias = 'Pick6FirstRace'
      FieldName = 'Pick6FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 188
    end
    object plRacesReportppField190: TppField
      FieldAlias = 'Pick6LastRace'
      FieldName = 'Pick6LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 189
    end
    object plRacesReportppField191: TppField
      FieldAlias = 'Pick6NbrsFirstRace'
      FieldName = 'Pick6NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 190
    end
    object plRacesReportppField192: TppField
      FieldAlias = 'Pick6NbrsLastRace'
      FieldName = 'Pick6NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 191
    end
    object plRacesReportppField193: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerFirstRace'
      FieldName = 'Pick6WagerFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 192
    end
    object plRacesReportppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerLastRace'
      FieldName = 'Pick6WagerLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 193
    end
    object plRacesReportppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutFirstRace'
      FieldName = 'Pick6PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 194
    end
    object plRacesReportppField196: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutLastRace'
      FieldName = 'Pick6PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 195
    end
    object plRacesReportppField197: TppField
      FieldAlias = 'IsWinMatched'
      FieldName = 'IsWinMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 196
    end
    object plRacesReportppField198: TppField
      FieldAlias = 'WinNbrs'
      FieldName = 'WinNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 197
    end
    object plRacesReportppField199: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPayout'
      FieldName = 'WinPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 198
    end
    object plRacesReportppField200: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPlcPayout'
      FieldName = 'WinPlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 199
    end
    object plRacesReportppField201: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinShoPayout'
      FieldName = 'WinShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 200
    end
    object plRacesReportppField202: TppField
      FieldAlias = 'IsPlcMatched'
      FieldName = 'IsPlcMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 201
    end
    object plRacesReportppField203: TppField
      FieldAlias = 'PlcNbrs'
      FieldName = 'PlcNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 202
    end
    object plRacesReportppField204: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcPayout'
      FieldName = 'PlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 203
    end
    object plRacesReportppField205: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcShoPayout'
      FieldName = 'PlcShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 204
    end
    object plRacesReportppField206: TppField
      FieldAlias = 'IsShoMatched'
      FieldName = 'IsShoMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 205
    end
    object plRacesReportppField207: TppField
      FieldAlias = 'ShoNbrs'
      FieldName = 'ShoNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 206
    end
    object plRacesReportppField208: TppField
      Alignment = taRightJustify
      FieldAlias = 'ShoPayout'
      FieldName = 'ShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 207
    end
    object plRacesReportppField209: TppField
      FieldAlias = 'RaceShape'
      FieldName = 'RaceShape'
      FieldLength = 50
      DisplayWidth = 50
      Position = 208
    end
    object plRacesReportppField210: TppField
      FieldAlias = 'PostTimes'
      FieldName = 'PostTimes'
      FieldLength = 50
      DisplayWidth = 50
      Position = 209
    end
    object plRacesReportppField211: TppField
      FieldAlias = 'Is10CentSuperfectaRace'
      FieldName = 'Is10CentSuperfectaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 210
    end
    object plRacesReportppField212: TppField
      FieldAlias = 'Is50CentTrifectaRace'
      FieldName = 'Is50CentTrifectaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 211
    end
    object plRacesReportppField213: TppField
      FieldAlias = 'Is50CentPk3Race'
      FieldName = 'Is50CentPk3Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 212
    end
    object plRacesReportppField214: TppField
      FieldAlias = 'Is50CentPk4Race'
      FieldName = 'Is50CentPk4Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 213
    end
    object plRacesReportppField215: TppField
      FieldAlias = 'ET'
      FieldName = 'ET'
      FieldLength = 10
      DisplayWidth = 10
      Position = 214
    end
    object plRacesReportppField216: TppField
      FieldAlias = 'MT'
      FieldName = 'MT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 215
    end
    object plRacesReportppField217: TppField
      FieldAlias = 'PT'
      FieldName = 'PT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 216
    end
    object plRacesReportppField218: TppField
      FieldAlias = 'IsWagerSheetSelected'
      FieldName = 'IsWagerSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 217
    end
    object plRacesReportppField219: TppField
      FieldAlias = 'Value'
      FieldName = 'Value'
      FieldLength = 10
      DisplayWidth = 10
      Position = 218
    end
    object plRacesReportppField220: TppField
      FieldAlias = 'IsPTCTrack'
      FieldName = 'IsPTCTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 219
    end
    object plRacesReportppField221: TppField
      FieldAlias = 'IsTwinSpiresTrack'
      FieldName = 'IsTwinSpiresTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 220
    end
    object plRacesReportppField222: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysAltWagerWinPct'
      FieldName = 'TodaysAltWagerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 221
    end
    object plRacesReportppField223: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysAltWagerWinPctRank'
      FieldName = 'TodaysAltWagerWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 222
    end
    object plRacesReportppField224: TppField
      FieldAlias = 'MudSheetOrder'
      FieldName = 'MudSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 223
    end
    object plRacesReportppField225: TppField
      FieldAlias = 'TurfSheetOrder'
      FieldName = 'TurfSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 224
    end
    object plRacesReportppField226: TppField
      FieldAlias = 'MaidenSheetOrder'
      FieldName = 'MaidenSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 225
    end
    object plRacesReportppField227: TppField
      FieldAlias = 'DistanceSheetOrder'
      FieldName = 'DistanceSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 226
    end
    object plRacesReportppField228: TppField
      FieldAlias = 'AWSheetOrder'
      FieldName = 'AWSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 227
    end
    object plRacesReportppField229: TppField
      FieldAlias = 'TrainerSheetOrder'
      FieldName = 'TrainerSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 228
    end
    object plRacesReportppField230: TppField
      FieldAlias = 'JockeySheetOrder'
      FieldName = 'JockeySheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 229
    end
    object plRacesReportppField231: TppField
      FieldAlias = 'OwnerSheetOrder'
      FieldName = 'OwnerSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 230
    end
    object plRacesReportppField232: TppField
      FieldAlias = 'TrainerJockeySheetOrder'
      FieldName = 'TrainerJockeySheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 231
    end
    object plRacesReportppField233: TppField
      FieldAlias = 'ErlPaceSheetOrder'
      FieldName = 'ErlPaceSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 232
    end
    object plRacesReportppField234: TppField
      FieldAlias = 'MidPaceSheetOrder'
      FieldName = 'MidPaceSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 233
    end
    object plRacesReportppField235: TppField
      FieldAlias = 'LatePaceSheetOrder'
      FieldName = 'LatePaceSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 234
    end
    object plRacesReportppField236: TppField
      FieldAlias = 'ErlPacePosSheetOrder'
      FieldName = 'ErlPacePosSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 235
    end
    object plRacesReportppField237: TppField
      FieldAlias = 'MidPacePosSheetOrder'
      FieldName = 'MidPacePosSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 236
    end
    object plRacesReportppField238: TppField
      FieldAlias = 'LatePacePosSheetOrder'
      FieldName = 'LatePacePosSheetOrder'
      FieldLength = 50
      DisplayWidth = 50
      Position = 237
    end
    object plRacesReportppField239: TppField
      FieldAlias = 'PacificTime'
      FieldName = 'PacificTime'
      FieldLength = 50
      DisplayWidth = 50
      Position = 238
    end
    object plRacesReportppField240: TppField
      FieldAlias = 'PowerGapOrder'
      FieldName = 'PowerGapOrder'
      FieldLength = 100
      DisplayWidth = 100
      Position = 239
    end
    object plRacesReportppField241: TppField
      FieldAlias = 'ErlPaceGapOrder'
      FieldName = 'ErlPaceGapOrder'
      FieldLength = 100
      DisplayWidth = 100
      Position = 240
    end
    object plRacesReportppField242: TppField
      FieldAlias = 'MidPaceGapOrder'
      FieldName = 'MidPaceGapOrder'
      FieldLength = 100
      DisplayWidth = 100
      Position = 241
    end
    object plRacesReportppField243: TppField
      FieldAlias = 'LatePaceGapOrder'
      FieldName = 'LatePaceGapOrder'
      FieldLength = 100
      DisplayWidth = 100
      Position = 242
    end
    object plRacesReportppField244: TppField
      FieldAlias = 'ErlPacePosGapOrder'
      FieldName = 'ErlPacePosGapOrder'
      FieldLength = 100
      DisplayWidth = 100
      Position = 243
    end
    object plRacesReportppField245: TppField
      FieldAlias = 'MidPacePosGapOrder'
      FieldName = 'MidPacePosGapOrder'
      FieldLength = 100
      DisplayWidth = 100
      Position = 244
    end
    object plRacesReportppField246: TppField
      FieldAlias = 'LatePacePosGapOrder'
      FieldName = 'LatePacePosGapOrder'
      FieldLength = 100
      DisplayWidth = 100
      Position = 245
    end
    object plRacesReportppField247: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePar'
      FieldName = 'EarlyPacePar'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 246
    end
    object plRacesReportppField248: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePar'
      FieldName = 'MiddlePacePar'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 247
    end
    object plRacesReportppField249: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePar'
      FieldName = 'LatePacePar'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 248
    end
    object plRacesReportppField250: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedPacePar'
      FieldName = 'SpeedPacePar'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 249
    end
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    OnDataChange = dsEntriesDataChange
    Left = 118
    Top = 168
  end
  object plEntries: TppDBPipeline
    DataSource = dsEntries
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plEntries'
    OnNext = plEntriesNext
    OnRecordPositionChange = plEntriesRecordPositionChange
    OnTraversal = plEntriesTraversal
    Left = 102
    Top = 218
    MasterDataPipelineName = 'plRacesReport'
  end
  object ppHospitalReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PageLimit = 30
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 635
    PrinterSetup.mmMarginLeft = 635
    PrinterSetup.mmMarginRight = 635
    PrinterSetup.mmMarginTop = 635
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\Ratings31\HospitalOldSheet.rtm'
    Template.Format = ftASCII
    Units = utPrinterPixels
    AllowPrintToFile = True
    DeviceType = 'PDFFile'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 120
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TrkCode'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Andale Mono'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3937
        mmLeft = 106680
        mmTop = 0
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'RaceDate'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Andale Mono'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3937
        mmLeft = 118322
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'THE HOSPITAL FORM BY PACE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Andale Mono'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 53552
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Andale Mono'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 185632
        mmTop = 0
        mmWidth = 18627
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'EstTimeOfRace'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Andale Mono'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 4022
        mmLeft = 154094
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'TotalRatingReport1'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = False
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'plEntries'
        mmHeight = 6265
        mmLeft = 0
        mmTop = 0
        mmWidth = 214630
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport12: TppChildReport
          AutoStop = False
          DataPipeline = plEntries
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 635
          PrinterSetup.mmMarginLeft = 635
          PrinterSetup.mmMarginRight = 635
          PrinterSetup.mmMarginTop = 635
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.FileName = 'C:\Ratings31\HospitalSheet2Sub.rtm'
          Template.Format = ftASCII
          Units = utPrinterPixels
          Left = 408
          Top = 288
          Version = '7.04'
          mmColumnWidth = 214630
          DataPipelineName = 'plEntries'
          object aTitleBand: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 29422
            mmPrintPosition = 0
            object RaceDesc: TppDBText
              UserName = 'RaceDesc'
              AutoSize = True
              DataField = 'RaceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 89112
              mmTop = 0
              mmWidth = 19092
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label2'
              Caption = 'P#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2540
              mmLeft = 15875
              mmTop = 16510
              mmWidth = 2455
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              AutoSize = False
              Caption = 'HORSE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2540
              mmLeft = 0
              mmTop = 16933
              mmWidth = 5292
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'JOCKEY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 22648
              mmTop = 21590
              mmWidth = 6011
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'M/L'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 124418
              mmTop = 16298
              mmWidth = 2582
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'TRAINER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 22648
              mmTop = 16087
              mmWidth = 6519
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = '------PACE-----'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 55309
              mmTop = 18415
              mmWidth = 9186
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'TRN/JKY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 43476
              mmTop = 20532
              mmWidth = 6265
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'ALL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 30396
              mmTop = 24342
              mmWidth = 2836
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'POST W%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 0
              mmTop = 22860
              mmWidth = 7197
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'BRED SEX AGE WGT EQU'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 0
              mmTop = 20108
              mmWidth = 18627
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = '------TRAINER W% -----'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 69553
              mmTop = 17780
              mmWidth = 15198
              BandType = 1
            end
            object ppLabel37: TppLabel
              UserName = 'lblERL'
              Caption = 'ERL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 54631
              mmTop = 21378
              mmWidth = 2921
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'lblSTR'
              Caption = 'STR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 62463
              mmTop = 21378
              mmWidth = 2921
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'lblMID'
              Caption = 'MID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 58208
              mmTop = 21378
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'TRF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 78931
              mmTop = 20743
              mmWidth = 2794
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'CLM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 82952
              mmTop = 20743
              mmWidth = 3217
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = '2ND'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 70929
              mmTop = 20743
              mmWidth = 2921
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = '1ST'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 67352
              mmTop = 20743
              mmWidth = 2667
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              Caption = 'SC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 75015
              mmTop = 20743
              mmWidth = 2032
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'DC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 74930
              mmTop = 23707
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'MT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 44027
              mmTop = 23707
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel60: TppLabel
              UserName = 'Label60'
              Caption = '2YO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 70950
              mmTop = 23707
              mmWidth = 2921
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              Caption = 'ON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 82889
              mmTop = 23495
              mmWidth = 2201
              BandType = 1
            end
            object ppLabel46: TppLabel
              UserName = 'Label46'
              Caption = 'OFF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 82889
              mmTop = 26670
              mmWidth = 2836
              BandType = 1
            end
            object ppLabel57: TppLabel
              UserName = 'Label57'
              Caption = 'OWNER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 22648
              mmTop = 26882
              mmWidth = 5630
              BandType = 1
            end
            object ppLabel61: TppLabel
              UserName = 'Label503'
              AutoSize = False
              Caption = 'DAM SIRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 87630
              mmTop = 20320
              mmWidth = 7197
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'RT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 74888
              mmTop = 26458
              mmWidth = 1947
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              Caption = 'POWER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 13758
              mmTop = 23495
              mmWidth = 5503
              BandType = 1
            end
            object ppDBText6: TppDBText
              UserName = 'RaceDesc1'
              AutoSize = True
              DataField = 'RaceNbr'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 22490
              mmTop = 0
              mmWidth = 3471
              BandType = 1
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              AutoSize = True
              DataField = 'TrkCode'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4064
              mmLeft = 3937
              mmTop = 0
              mmWidth = 6646
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label3'
              Caption = 'RACE#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3725
              mmLeft = 11906
              mmTop = 0
              mmWidth = 8678
              BandType = 1
            end
            object ppLabel39: TppLabel
              UserName = 'lblTURF'
              Caption = 'All Weather'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3725
              mmLeft = 27940
              mmTop = 0
              mmWidth = 19092
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'SIRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 87630
              mmTop = 17568
              mmWidth = 3387
              BandType = 1
            end
            object lblSireTurf: TppLabel
              UserName = 'lblSireTurf'
              Caption = 'Turf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 102447
              mmTop = 23918
              mmWidth = 2794
              BandType = 1
            end
            object lblSire2yo: TppLabel
              UserName = 'lblSire2yo'
              Caption = 'Dist'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 112184
              mmTop = 23918
              mmWidth = 2752
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              AutoSize = False
              Caption = 'HORSE RECORDS   -   STS  / WINS / EPS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 87630
              mmTop = 26458
              mmWidth = 28575
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label7'
              Caption = 'PEDIGREE RATINGS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 102024
              mmTop = 18203
              mmWidth = 14605
              BandType = 1
            end
            object ppDBText11: TppDBText
              UserName = 'RaceDesc3'
              AutoSize = True
              DataField = 'Purse'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 124037
              mmTop = 0
              mmWidth = 6943
              BandType = 1
            end
            object ppDBText16: TppDBText
              UserName = 'RaceDesc4'
              AutoSize = True
              DataField = 'DistanceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Consolas'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3725
              mmLeft = 51858
              mmTop = 0
              mmWidth = 3471
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label501'
              Caption = 'PWR ADVANTAGE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 6138
              mmTop = 26670
              mmWidth = 13123
              BandType = 1
            end
            object ppLabel40: TppLabel
              UserName = 'Label40'
              Caption = 'LAST SPD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 119804
              mmTop = 18627
              mmWidth = 7197
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label53'
              Caption = 'LAY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 70929
              mmTop = 26458
              mmWidth = 2921
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'T/O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 48345
              mmTop = 27093
              mmWidth = 2455
              BandType = 1
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'TrkCode'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Andale Mono'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3810
              mmLeft = 202777
              mmTop = 0
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel59: TppLabel
              UserName = 'lblSireTurf1'
              Caption = 'Mud'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 106680
              mmTop = 23918
              mmWidth = 3048
              BandType = 1
            end
            object ppLabel63: TppLabel
              UserName = 'lblSire2yo1'
              Caption = 'Mdn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 117052
              mmTop = 23918
              mmWidth = 3048
              BandType = 1
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 423
              mmLeft = 0
              mmTop = 15240
              mmWidth = 214630
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label11'
              Caption = '365'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 48683
              mmTop = 23707
              mmWidth = 2328
              BandType = 1
            end
            object ppDBText32: TppDBText
              UserName = 'EarlyPace1'
              ShiftWithParent = True
              DataField = 'EarlyPacePar'
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
              mmHeight = 2752
              mmLeft = 51858
              mmTop = 26247
              mmWidth = 4233
              BandType = 1
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              ShiftWithParent = True
              DataField = 'MiddlePacePar'
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
              mmHeight = 2752
              mmLeft = 56515
              mmTop = 26247
              mmWidth = 4233
              BandType = 1
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              ShiftWithParent = True
              DataField = 'LatePacePar'
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
              mmHeight = 2752
              mmLeft = 61383
              mmTop = 26247
              mmWidth = 4233
              BandType = 1
            end
            object ppLine35: TppLine
              UserName = 'Line35'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 4022
              mmWidth = 214630
              BandType = 1
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'SpeedPacePar'
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
              mmHeight = 2752
              mmLeft = 124800
              mmTop = 26247
              mmWidth = 2201
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              Caption = 'L30'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 24765
              mmTop = 24130
              mmWidth = 2498
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              Caption = 'L30'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 24765
              mmTop = 18838
              mmWidth = 2498
              BandType = 1
            end
            object ppLabel64: TppLabel
              UserName = 'Label64'
              Caption = 'ALL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 30608
              mmTop = 19050
              mmWidth = 2836
              BandType = 1
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'RaceCondition'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              WordWrap = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 10583
              mmLeft = 0
              mmTop = 4445
              mmWidth = 213995
              BandType = 1
            end
            object ppLine37: TppLine
              UserName = 'Line37'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 29210
              mmWidth = 214630
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = '----- PARS -----'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 1905
              mmLeft = 55119
              mmTop = 23707
              mmWidth = 9567
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label401'
              Caption = 'PAR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2328
              mmLeft = 124037
              mmTop = 23283
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel65: TppLabel
              UserName = 'Label201'
              Caption = 'DAYS '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 1905
              mmLeft = 0
              mmTop = 26670
              mmWidth = 4445
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label402'
              Caption = 'BACK SPD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 1905
              mmLeft = 118957
              mmTop = 20955
              mmWidth = 8043
              BandType = 1
            end
          end
          object ppHeaderBand2: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object aDetailBand: TppDetailBand
            PrintCount = 16
            mmBottomOffset = 0
            mmHeight = 15240
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line5'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 66411
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 51012
              mmTop = 0
              mmWidth = 635
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 21802
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 86254
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 121285
              mmTop = 0
              mmWidth = 212
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
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 4106
              mmLeft = 16298
              mmTop = 0
              mmWidth = 4868
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
              Font.Size = 5
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 22648
              mmTop = 0
              mmWidth = 27728
              BandType = 4
            end
            object Jockey: TppDBText
              UserName = 'Jockey'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Jockey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 22648
              mmTop = 5927
              mmWidth = 5927
              BandType = 4
            end
            object Med: TppDBText
              UserName = 'Med'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Med'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 13123
              mmTop = 0
              mmWidth = 1736
              BandType = 4
            end
            object Pace: TppDBText
              UserName = 'EarlyPace'
              ShiftWithParent = True
              DataField = 'EarlyPace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 51858
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
            object TotalTrnWinPct: TppDBText
              UserName = 'TotalTrnWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnOddsWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 28998
              mmTop = 2963
              mmWidth = 4233
              BandType = 4
            end
            object TotalTrnJkyWinPct: TppDBText
              UserName = 'TotalTrnJkyWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TJMeetWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 41063
              mmTop = 2963
              mmWidth = 5080
              BandType = 4
            end
            object TotalJky30WinPct: TppDBText
              UserName = 'TotalJky30WinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJky30WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 22648
              mmTop = 8890
              mmWidth = 4233
              BandType = 4
            end
            object Sex: TppDBText
              UserName = 'Sex'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Sex'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 4022
              mmTop = 4657
              mmWidth = 1058
              BandType = 4
            end
            object Age: TppDBText
              UserName = 'Age'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Age'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 6857
              mmTop = 4657
              mmWidth = 974
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'LatePace'
              ShiftWithParent = True
              DataField = 'LatePace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 61383
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
            object BredIn: TppDBText
              UserName = 'BredIn'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'BredIn'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 0
              mmTop = 4657
              mmWidth = 2413
              BandType = 4
            end
            object TotalTrnDebutWinPct: TppDBText
              UserName = 'TotalTrnDebutWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnDebutWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 67310
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object MidPace: TppDBText
              UserName = 'MiddlePace'
              ShiftWithParent = True
              DataField = 'MiddlePace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 56515
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
            object TotalJkyWinPct: TppDBText
              UserName = 'TotalJkyWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJkyOddsWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 28998
              mmTop = 8890
              mmWidth = 4233
              BandType = 4
            end
            object ppLine10: TppLine
              UserName = 'Line10'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 2752
              mmLeft = 40428
              mmTop = 2963
              mmWidth = 212
              BandType = 4
            end
            object TotalTrnTurfWinPct: TppDBText
              UserName = 'TotalTrnTurfWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnTurfWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 78952
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object TotalTrnAftClmWinPct: TppDBText
              UserName = 'TotalTrnAftClmWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnAftClmWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 82762
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object TotalTrnDebutTwoWinPct: TppDBText
              UserName = 'TotalTrnDebutTwoWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnDebutTwoWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 70908
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object SurfaceChange: TppVariable
              UserName = 'varSc'
              AutoSize = False
              CalcOrder = 0
              DataType = dtInteger
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 74930
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object DistanceChange: TppVariable
              UserName = 'varDC'
              AutoSize = False
              CalcOrder = 1
              DataType = dtInteger
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 74930
              mmTop = 5927
              mmWidth = 3175
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
              mmHeight = 3387
              mmLeft = 54214
              mmTop = 3704
              mmWidth = 847
              BandType = 4
            end
            object lblMidPos: TppLabel
              UserName = 'lblMidPos'
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2646
              mmLeft = 59002
              mmTop = 3704
              mmWidth = 794
              BandType = 4
            end
            object TotalTrn2yoWinPct: TppDBText
              UserName = 'TotalTrn2yoWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrn2yoWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 70908
              mmTop = 5927
              mmWidth = 3175
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 127212
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object Equip: TppDBText
              UserName = 'Equip'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Equip'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2455
              mmLeft = 16171
              mmTop = 4657
              mmWidth = 4784
              BandType = 4
            end
            object Weight: TppDBText
              UserName = 'Weight'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Weight'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 12530
              mmTop = 4657
              mmWidth = 2921
              BandType = 4
            end
            object TotalTrnFirstJuiceWinPct: TppDBText
              UserName = 'TotalTrnFirstJuiceWinPct'
              ShiftWithParent = True
              DataField = 'TotalTrnFirstJuiceWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 67310
              mmTop = 5927
              mmWidth = 3175
              BandType = 4
            end
            object TotalTrnBlinkersOnWinPct: TppDBText
              UserName = 'TotalTrnBlinkersOnWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnBlinkersOnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 82762
              mmTop = 5927
              mmWidth = 3175
              BandType = 4
            end
            object TotalTrnBlinkersOffWinPct: TppDBText
              UserName = 'TotalTrnBlinkersOffWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnBlinkersOffWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 82762
              mmTop = 11007
              mmWidth = 3175
              BandType = 4
            end
            object TurfIndicator: TppDBText
              UserName = 'TurfIndicator'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TurfIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 78528
              mmTop = 11007
              mmWidth = 3175
              BandType = 4
            end
            object DebutIndicator: TppDBText
              UserName = 'DebutIndicator'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'DebutIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 67310
              mmTop = 11007
              mmWidth = 3175
              BandType = 4
            end
            object RouteIndicator: TppDBText
              UserName = 'RouteIndicator'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'RouteIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 74930
              mmTop = 11007
              mmWidth = 3175
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 67098
              mmTop = 4868
              mmWidth = 18838
              BandType = 4
            end
            object TurfRating: TppDBText
              UserName = 'TurfRating'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TurfRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 102024
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Pen.Style = psInsideFrame
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 15028
              mmWidth = 214630
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 86995
              mmTop = 5715
              mmWidth = 34078
              BandType = 4
            end
            object DaysLast: TppDBText
              UserName = 'DaysLast'
              ShiftWithParent = True
              DataField = 'DaysLast'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 0
              mmTop = 11218
              mmWidth = 6350
              BandType = 4
            end
            object Power: TppDBText
              UserName = 'Power'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'Power'
              DataPipeline = plEntries
              DisplayFormat = '##0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 16171
              mmTop = 7832
              mmWidth = 4360
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'SireName1'
              ShiftWithParent = True
              DataField = 'DamSire'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 86995
              mmTop = 2752
              mmWidth = 13123
              BandType = 4
            end
            object SireName: TppDBText
              UserName = 'SireName'
              ShiftWithParent = True
              DataField = 'Sire'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 86995
              mmTop = 0
              mmWidth = 13123
              BandType = 4
            end
            object ML: TppDBText
              UserName = 'MorningLineDesc'
              ShiftWithParent = True
              DataField = 'MorningLineDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 121920
              mmTop = 0
              mmWidth = 5080
              BandType = 4
            end
            object QSP1stCallRunStyle: TppDBText
              UserName = 'QSP1stCallRunStyle'
              ShiftWithParent = True
              DataField = 'QSP1stCallRunStyle'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 52493
              mmTop = 11642
              mmWidth = 12700
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
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 0
              mmTop = 0
              mmWidth = 12065
              BandType = 4
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 105834
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine22: TppLine
              UserName = 'Line22'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 101177
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object TotalTrnOwnWinPct: TppDBText
              UserName = 'TotalTrnOwnWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalTrnOwnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 47455
              mmTop = 11642
              mmWidth = 2921
              BandType = 4
            end
            object OwnerName: TppDBText
              UserName = 'OwnerName'
              ShiftWithParent = True
              DataField = 'Owner'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 22648
              mmTop = 11642
              mmWidth = 23072
              BandType = 4
            end
            object PowerAdvantage: TppDBText
              UserName = 'Power1'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'PowerAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 11007
              mmTop = 11218
              mmWidth = 9525
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 0
              mmWidth = 214630
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 122132
              mmTop = 3387
              mmWidth = 4868
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 67098
              mmTop = 9737
              mmWidth = 18627
              BandType = 4
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              Pen.Style = psDot
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 21802
              mmTop = 8467
              mmWidth = 29422
              BandType = 4
            end
            object ppLine24: TppLine
              UserName = 'Line24'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 52282
              mmTop = 11007
              mmWidth = 13547
              BandType = 4
            end
            object TotalTrn46To120WinPct: TppDBText
              UserName = 'TotalTrn46To120WinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrn46To120WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2879
              mmLeft = 70908
              mmTop = 11007
              mmWidth = 3175
              BandType = 4
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'PP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2498
              mmLeft = 0
              mmTop = 7832
              mmWidth = 2286
              BandType = 4
            end
            object PostPos: TppDBText
              UserName = 'PostPos'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'PostPos'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 5503
              mmTop = 7832
              mmWidth = 3387
              BandType = 4
            end
            object TotalTrn30WinPct: TppDBText
              UserName = 'TotalTrn30WinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrn30WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 22648
              mmTop = 2963
              mmWidth = 4233
              BandType = 4
            end
            object ppLine25: TppLine
              UserName = 'Line25'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 2752
              mmLeft = 28152
              mmTop = 2963
              mmWidth = 212
              BandType = 4
            end
            object ppLine26: TppLine
              UserName = 'Line26'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 2752
              mmLeft = 33867
              mmTop = 2963
              mmWidth = 212
              BandType = 4
            end
            object ppLine27: TppLine
              UserName = 'Line27'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 2540
              mmLeft = 46143
              mmTop = 3175
              mmWidth = 212
              BandType = 4
            end
            object ppLine28: TppLine
              UserName = 'Line28'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 2752
              mmLeft = 27940
              mmTop = 8890
              mmWidth = 423
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              Pen.Style = psDot
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 635
              mmLeft = 22648
              mmTop = 5080
              mmWidth = 28152
              BandType = 4
            end
            object ClassRating: TppDBText
              UserName = 'ClassRating'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'ClassRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 116840
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object DistanceRating: TppDBText
              UserName = 'DistanceRating'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'DistanceRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 111760
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object MudRating: TppDBText
              UserName = 'MudRating'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'MudRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 106469
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppLine30: TppLine
              UserName = 'Line30'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 110279
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine31: TppLine
              UserName = 'Line31'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 115570
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'TotalJky30WinPct1'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TJ365WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 46990
              mmTop = 2963
              mmWidth = 4022
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'TotalTrn30WinPct1'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PostPosWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 10584
              mmTop = 7832
              mmWidth = 3598
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'PostPos1'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LastSpeed'
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
              mmHeight = 2879
              mmLeft = 124800
              mmTop = 5080
              mmWidth = 2201
              BandType = 4
            end
            object ppLine19: TppLine
              UserName = 'Line201'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 22648
              mmTop = 11218
              mmWidth = 28787
              BandType = 4
            end
            object ppLine38: TppLine
              UserName = 'Line101'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 2117
              mmLeft = 46355
              mmTop = 12065
              mmWidth = 212
              BandType = 4
            end
            object ppLine46: TppLine
              UserName = 'Line46'
              Pen.Style = psDot
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 22648
              mmTop = 2540
              mmWidth = 28152
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'BackSpeed'
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
              mmHeight = 2879
              mmLeft = 124800
              mmTop = 9313
              mmWidth = 2201
              BandType = 4
            end
            object Last2Comment2: TppDBText
              UserName = 'Last2Comment2'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Last2Comment2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 128059
              mmTop = 7620
              mmWidth = 109009
              BandType = 4
            end
            object Last2RaceDesc: TppDBText
              UserName = 'Last2RaceDesc'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Last2RaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 128059
              mmTop = 5080
              mmWidth = 74083
              BandType = 4
            end
            object LastComment2: TppDBText
              UserName = 'LastComment2'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LastComment2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 128059
              mmTop = 2328
              mmWidth = 130175
              BandType = 4
            end
            object LastRaceDesc: TppDBText
              UserName = 'LastRaceDesc'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LastRaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 128059
              mmTop = 0
              mmWidth = 74083
              BandType = 4
            end
            object layoffline1: TppLine
              UserName = 'layoffline1'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 128059
              mmTop = 4657
              mmWidth = 85725
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 128059
              mmTop = 9948
              mmWidth = 85725
              BandType = 4
            end
            object TurfWins: TppDBText
              UserName = 'TurfWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TurfWins'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 119380
              mmTop = 9313
              mmWidth = 804
              BandType = 4
            end
            object MudStarts: TppDBText
              UserName = 'MudStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MudStarts'
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
              mmLeft = 106045
              mmTop = 9313
              mmWidth = 804
              BandType = 4
            end
            object MudWins: TppDBText
              UserName = 'MudWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MudWins'
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
              mmLeft = 108797
              mmTop = 9313
              mmWidth = 804
              BandType = 4
            end
            object TrkStarts: TppDBText
              UserName = 'TrkStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TrkStarts'
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
              mmLeft = 93134
              mmTop = 9313
              mmWidth = 804
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'TrkWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TrkWins'
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
              mmLeft = 95674
              mmTop = 9313
              mmWidth = 804
              BandType = 4
            end
            object lblTrack: TppLabel
              UserName = 'Label203'
              Caption = 'Track'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2709
              mmLeft = 86995
              mmTop = 9313
              mmWidth = 4572
              BandType = 4
            end
            object ppLabel67: TppLabel
              UserName = 'Label67'
              Caption = 'Mud'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2381
              mmLeft = 99484
              mmTop = 9313
              mmWidth = 3440
              BandType = 4
            end
            object lblOnTurf: TppLabel
              UserName = 'lblOnTurf'
              Caption = 'Turf '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              mmHeight = 2328
              mmLeft = 112184
              mmTop = 9525
              mmWidth = 2963
              BandType = 4
            end
            object lblRoute: TppLabel
              UserName = 'lblRoute'
              Caption = 'Route'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2646
              mmLeft = 99484
              mmTop = 6138
              mmWidth = 4763
              BandType = 4
            end
            object RouteStarts: TppDBText
              UserName = 'RouteStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'RouteStarts'
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
              mmLeft = 106045
              mmTop = 6350
              mmWidth = 804
              BandType = 4
            end
            object RouteWins: TppDBText
              UserName = 'RouteWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'RouteWins'
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
              mmLeft = 108797
              mmTop = 6350
              mmWidth = 804
              BandType = 4
            end
            object lblSprint: TppLabel
              UserName = 'Label4'
              Caption = 'Sprint'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2646
              mmLeft = 111125
              mmTop = 6138
              mmWidth = 4498
              BandType = 4
            end
            object SprintStarts: TppDBText
              UserName = 'SprintStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'SprintStarts'
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
              mmLeft = 117264
              mmTop = 6350
              mmWidth = 804
              BandType = 4
            end
            object SprintWins: TppDBText
              UserName = 'SprintWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'SprintWins'
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
              mmLeft = 119380
              mmTop = 6350
              mmWidth = 804
              BandType = 4
            end
            object lblLife: TppLabel
              UserName = 'Label5'
              Caption = 'Life'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2752
              mmLeft = 87207
              mmTop = 6138
              mmWidth = 2752
              BandType = 4
            end
            object LifeStarts: TppDBText
              UserName = 'LifeStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LifeStarts'
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
              mmLeft = 93134
              mmTop = 6350
              mmWidth = 804
              BandType = 4
            end
            object LifeWins: TppDBText
              UserName = 'LifeWins'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LifeWins'
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
              mmLeft = 95674
              mmTop = 6350
              mmWidth = 804
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line19'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 97579
              mmTop = 5503
              mmWidth = 265
              BandType = 4
            end
            object ppLine21: TppLine
              UserName = 'Line21'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 110490
              mmTop = 5503
              mmWidth = 265
              BandType = 4
            end
            object TurfStarts: TppDBText
              UserName = 'TurfStarts'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TurfStarts'
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
              mmLeft = 117264
              mmTop = 9313
              mmWidth = 804
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'Last2RaceDesc1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Last3RaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 128059
              mmTop = 10372
              mmWidth = 74083
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'Last3Comment2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              DataPipelineName = 'plEntries'
              mmHeight = 2074
              mmLeft = 128059
              mmTop = 12700
              mmWidth = 68792
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'TrkStarts1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TodaysWagerOrderKey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 86995
              mmTop = 12700
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TodaysWagerStarts'
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
              mmLeft = 108712
              mmTop = 12700
              mmWidth = 2413
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TodaysWagerWinPct'
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
              mmLeft = 116374
              mmTop = 12700
              mmWidth = 3641
              BandType = 4
            end
            object LatePaceAdvantageWinPct: TppDBText
              UserName = 'LatePaceAdvantageWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LatePaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 62653
              mmTop = 7832
              mmWidth = 2540
              BandType = 4
            end
            object EarlyPaceAdvantageWinPct: TppDBText
              UserName = 'EarlyPaceAdvantageWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'EarlyPaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 53975
              mmTop = 7832
              mmWidth = 1566
              BandType = 4
            end
            object MiddlePaceAdvantageWinPct: TppDBText
              UserName = 'MiddlePaceAdvantageWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MiddlePaceAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 58632
              mmTop = 7832
              mmWidth = 1566
              BandType = 4
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'TrkCode'
            DataPipeline = plEntries
            OutlineSettings.CreateNode = True
            NewPage = True
            ReprintOnSubsequentPage = False
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'plEntries'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              Visible = False
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
              4561726C79506163654F6E5072696E740B50726F6772616D54797065070B7474
              50726F63656475726506536F757263650C3E02000070726F6365647572652045
              61726C79506163654F6E5072696E743B0D0A626567696E0D0A0D0A2020202020
              204561726C79506163652E466F6E742E426F6C64203A3D2046616C73653B0D0A
              2020202020204561726C79506163652E466F6E742E556E6465726C696E65203A
              3D2046616C73653B0D0A2020202020200D0A09696620706C456E74726965735B
              274561726C795061636552616E6B275D203D2031207468656E20626567696E0D
              0A092020204561726C79506163652E466F6E742E426F6C64203A3D2054727565
              3B0D0A202020202020202020696620706C456E74726965735B27497346726F6E
              74446F75626C654C696E6572275D207468656E20626567696E0D0A0920202020
              20204561726C79506163652E466F6E742E556E6465726C696E65203A3D205472
              75653B0D0A202020202020202020656E643B200D0A202020202020656E643B20
              0D0A0D0A09696620706C456E74726965735B274561726C795061636552616E6B
              275D203D2031207468656E20626567696E0D0A092020204561726C7950616365
              2E466F6E742E426F6C64203A3D20547275653B0D0A2020202020202020206966
              20706C456E74726965735B274973547269706C654C696E6572275D207468656E
              20626567696E0D0A092020202020204561726C79506163652E466F6E742E556E
              6465726C696E65203A3D20547275653B0D0A202020202020202020656E643B20
              0D0A202020202020656E643B200D0A0920202020202020202020202020202020
              2020202020202020200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              6506094561726C7950616365094576656E744E616D6506074F6E5072696E7407
              4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D650617546F74616C4A6B79333057696E5063744F6E5072696E
              740B50726F6772616D54797065070B747450726F63656475726506536F757263
              650C1901000070726F63656475726520546F74616C4A6B79333057696E506374
              4F6E5072696E743B0D0A626567696E0D0A0D0A20202020200D0A202020202020
              0D0A202020202020696620706C456E74726965735B27546F74616C4A6B793330
              57696E506374275D203E20706C456E74726965735B27546F74616C4A6B795769
              6E506374275D207468656E20626567696E0D0A20202020202009546F74616C4A
              6B79333057696E5063742E466F6E742E426F6C64203A3D20547275653B0D0A20
              2020202020656E6420656C73652020626567696E0D0A0909546F74616C4A6B79
              333057696E5063742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
              20202020656E643B2020200D0A2020202020200D0A0D0A0D0A656E643B0D0A0D
              436F6D706F6E656E744E616D650610546F74616C4A6B79333057696E50637409
              4576656E744E616D6506074F6E5072696E74074576656E74494402200001060F
              5472614576656E7448616E646C65720B50726F6772616D4E616D650615546F74
              616C54726E57696E5063744F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F7572636506D570726F63656475726520546F
              74616C54726E57696E5063744F6E5072696E743B0D0A626567696E0D0A096966
              20706C456E74726965735B27546F74616C54726E57696E50637452616E6B275D
              203D2031207468656E20626567696E0D0A09202020546F74616C54726E57696E
              5063742E466F6E742E426F6C64203A3D20547275653B0D0A202020202020656E
              6420656C736520626567696E0D0A09202020546F74616C54726E57696E506374
              2E466F6E742E426F6C64203A3D2046616C73653B0D0A202020202020656E643B
              200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E546F74616C5472
              6E57696E506374094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D650618546F74616C54726E4A6B7957696E5063744F6E5072696E740B5072
              6F6772616D54797065070B747450726F63656475726506536F757263650C4D01
              000070726F63656475726520546F74616C54726E4A6B7957696E5063744F6E50
              72696E743B0D0A626567696E0D0A0D0A20202020202020546F74616C54726E4A
              6B7957696E5063742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
              20202020546F74616C54726E4A6B7957696E5063742E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A2020202020200D0A2020202020200D0A
              202020696620706C456E74726965735B27546F74616C54726E4A6B7957696E50
              6374275D203E203234207468656E20626567696E0D0A202020202020546F7461
              6C54726E4A6B7957696E5063742E466F6E742E426F6C64203A3D20547275653B
              0D0A202020202020546F74616C54726E4A6B7957696E5063742E466F6E742E55
              6E6465726C696E65203A3D20547275653B0D0A2020202020200D0A202020656E
              643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65061154
              6F74616C54726E4A6B7957696E506374094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D65061D546F74616C54726E446562757454776F5769
              6E5063744F6E5072696E740B50726F6772616D54797065070B747450726F6365
              6475726506536F7572636506E970726F63656475726520546F74616C54726E44
              6562757454776F57696E5063744F6E5072696E743B0D0A626567696E0D0A0D0A
              202020202020696620706C456E74726965735B274465627574496E6469636174
              6F72275D203D20272A2A27207468656E20626567696E0D0A0909546F74616C54
              726E446562757454776F57696E5063742E56697369626C65203A3D2054727565
              3B0D0A09656E6420656C736520626567696E0D0A0909546F74616C54726E4465
              62757454776F57696E5063742E56697369626C65203A3D2046616C73653B0D0A
              09656E643B0D0A0D0A20202020200D0A656E643B0D0A0D436F6D706F6E656E74
              4E616D650616546F74616C54726E446562757454776F57696E50637409457665
              6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
              4576656E7448616E646C65720B50726F6772616D4E616D65061A546F74616C54
              726E446562757457696E5063744F6E5072696E740B50726F6772616D54797065
              070B747450726F63656475726506536F7572636506E970726F63656475726520
              546F74616C54726E446562757457696E5063744F6E5072696E743B0D0A626567
              696E0D0A0D0A202020202020696620706C456E74726965735B27446562757449
              6E64696361746F72275D203D20272A27207468656E20626567696E0D0A092020
              20546F74616C54726E446562757457696E5063742E56697369626C65203A3D20
              547275653B0D0A09656E6420656C736520626567696E0D0A09202020546F7461
              6C54726E446562757457696E5063742E56697369626C65203A3D2046616C7365
              3B0D0A09656E643B0D0A0D0A2020200D0A2020202020200D0A656E643B0D0A0D
              436F6D706F6E656E744E616D650613546F74616C54726E446562757457696E50
              6374094576656E744E616D6506074F6E5072696E74074576656E744944022000
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650619
              546F74616C54726E5475726657696E5063744F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F7572636506E370726F6365
              6475726520546F74616C54726E5475726657696E5063744F6E5072696E743B0D
              0A626567696E0D0A20202020696620706C52616365735265706F72745B275375
              7266616365275D203D20275427207468656E20626567696E0D0A20202009546F
              74616C54726E5475726657696E5063742E56697369626C65203A3D2054727565
              3B0D0A202020656E6420656C736520626567696E0D0A20202009546F74616C54
              726E5475726657696E5063742E56697369626C65203A3D2046616C73653B0D0A
              202020656E643B0D0A2020200D0A2020202020200D0A0D0A656E643B0D0A0D43
              6F6D706F6E656E744E616D650612546F74616C54726E5475726657696E506374
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E7661
              7253634F6E476574546578740B50726F6772616D54797065070B747450726F63
              656475726506536F757263650CA302000070726F636564757265207661725363
              4F6E476574546578742876617220546578743A20537472696E67293B0D0A7661
              72200D0A73506374203A20737472696E673B0D0A626567696E0D0A2020207350
              6374203A3D202730273B0D0A20202076617253632E466F6E742E426F6C64203A
              3D2046616C73653B0D0A2020202020202020202020200D0A2020206966202028
              28706C456E74726965735B27497354757266546F44697274275D203D20547275
              6529207468656E20626567696E0D0A2020202020696620706C456E7472696573
              5B2754726E54757266546F4469727457696E506374275D207468656E20626567
              696E0D0A2020200920202073506374203A3D20496E74546F53747228706C456E
              74726965735B2754726E54757266546F4469727457696E506374275D293B0D0A
              2020202020656E643B2020202020202020200D0A202020656E643B0D0A202020
              0D0A202020696620202828706C456E74726965735B27497344697274546F5475
              7266275D203D205472756529207468656E20626567696E0D0A20202020206966
              20706C456E74726965735B2754726E44697274546F5475726657696E50637427
              5D203E2030207468656E20626567696E0D0A2020200920202073506374203A3D
              20496E74546F53747228706C456E74726965735B2754726E44697274546F5475
              726657696E506374275D293B0D0A2020202020656E643B202020202020202020
              0D0A202020656E643B0D0A2020200D0A2020200D0A20202020200D0A20202020
              20200D0A2020202020696620537472546F496E74287350637429203E20302074
              68656E20626567696E0D0A200954657874203A3D20735063743B0D0A20202065
              6E6420656C736520626567696E0D0A20200954657874203A3D2027273B0D0A20
              2020656E643B0D0A0D0A0D0A656E643B0D0A0D0A0D436F6D706F6E656E744E61
              6D6506057661725363094576656E744E616D6506094F6E476574546578740745
              76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D65060E76617244434F6E476574546578740B50726F6772616D54
              797065070B747450726F63656475726506536F757263650C8402000070726F63
              65647572652076617244434F6E476574546578742876617220546578743A2053
              7472696E67293B0D0A766172200D0A73506374203A20737472696E673B0D0A62
              6567696E0D0A20202073506374203A3D202730273B0D0A20202076617244632E
              466F6E742E426F6C64203A3D2046616C73653B0D0A2020202020202020202020
              200D0A202020696620202828706C456E74726965735B274973527465546F5370
              72275D203D205472756529207468656E20626567696E0D0A2020202020206966
              20706C456E74726965735B2754726E527465546F53707257696E506374275D20
              3E2030207468656E20626567696E0D0A20202020202020202073506374203A3D
              20496E74546F53747228706C456E74726965735B2754726E527465546F537072
              57696E506374275D293B0D0A202020202020656E643B200D0A202020656E643B
              0D0A2020200D0A2020206966202828706C456E74726965735B27497353707254
              6F527465275D203D205472756529207468656E20626567696E0D0A2020202020
              20696620706C456E74726965735B2754726E537072546F52746557696E506374
              275D203E2030207468656E20626567696E0D0A20202020202020202073506374
              203A3D20496E74546F53747228706C456E74726965735B2754726E537072546F
              52746557696E506374275D293B0D0A202020202020656E643B2020200D0A2020
              20656E643B0D0A2020200D0A20200D0A2020202020696620537472546F496E74
              287350637429203E2030207468656E20626567696E0D0A200954657874203A3D
              20735063743B0D0A202020656E6420656C736520626567696E0D0A2020095465
              7874203A3D2027273B0D0A202020656E643B0D0A0D0A0D0A656E643B0D0A0D0A
              0D436F6D706F6E656E744E616D6506057661724443094576656E744E616D6506
              094F6E47657454657874074576656E74494402350001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D6506114D6964646C65506163654F
              6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
              536F757263650C0003000070726F636564757265204D6964646C65506163654F
              6E5072696E743B0D0A626567696E0D0A0D0A094D6964646C65506163652E466F
              6E742E556E6465726C696E65203A3D2046616C73653B0D0A2020202020204D69
              64646C65506163652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
              202020200D0A09696620706C456E74726965735B274D6964646C655061636552
              616E6B275D203D2031207468656E20626567696E0D0A092020204D6964646C65
              506163652E466F6E742E426F6C64203A3D20547275653B0D0A20202020202020
              2020696620706C456E74726965735B27497346726F6E74446F75626C654C696E
              6572275D207468656E20626567696E0D0A092020202020204D6964646C655061
              63652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A20202020
              2020202020656E643B200D0A202020202020656E643B200D0A0D0A0969662070
              6C456E74726965735B274D6964646C655061636552616E6B275D203D20312074
              68656E20626567696E0D0A092020204D6964646C65506163652E466F6E742E42
              6F6C64203A3D20547275653B0D0A202020202020202020696620706C456E7472
              6965735B2749734261636B446F75626C654C696E6572275D207468656E206265
              67696E0D0A092020202020204D6964646C65506163652E466F6E742E556E6465
              726C696E65203A3D20547275653B0D0A202020202020202020656E643B200D0A
              202020202020656E643B200D0A0D0A09696620706C456E74726965735B274D69
              64646C655061636552616E6B275D203D2031207468656E20626567696E0D0A09
              2020204D6964646C65506163652E466F6E742E426F6C64203A3D20547275653B
              0D0A202020202020202020696620706C456E74726965735B274973547269706C
              654C696E6572275D207468656E20626567696E0D0A092020202020204D696464
              6C65506163652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A
              202020202020202020656E643B200D0A202020202020656E643B200D0A202020
              2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A4D6964646C
              6550616365094576656E744E616D6506074F6E5072696E74074576656E744944
              02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              65060F4C617465506163654F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F757263650C2102000070726F636564757265
              204C617465506163654F6E5072696E743B0D0A626567696E0D0A094C61746550
              6163652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020202020204C
              617465506163652E466F6E742E556E6465726C696E65203A3D2046616C73653B
              0D0A2020202020200D0A09696620706C456E74726965735B274C617465506163
              6552616E6B275D203D2031207468656E20626567696E0D0A2020200920204C61
              7465506163652E466F6E742E426F6C64203A3D20547275653B0D0A2020202020
              202020696620706C456E74726965735B2749734261636B446F75626C654C696E
              6572275D207468656E20626567696E0D0A092020202020204C61746550616365
              2E466F6E742E556E6465726C696E65203A3D20547275653B0D0A202020202020
              202020656E643B200D0A202020202020656E643B200D0A2020202020200D0A09
              696620706C456E74726965735B274C6174655061636552616E6B275D203D2031
              207468656E20626567696E0D0A2020200920204C617465506163652E466F6E74
              2E426F6C64203A3D20547275653B0D0A2020202020202020696620706C456E74
              726965735B274973547269706C654C696E6572275D207468656E20626567696E
              0D0A092020202020204C617465506163652E466F6E742E556E6465726C696E65
              203A3D20547275653B0D0A202020202020202020656E643B200D0A2020202020
              20656E643B200D0A2020202020200D0A0D0A656E643B0D0A0D436F6D706F6E65
              6E744E616D6506084C61746550616365094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D650615546F74616C4A6B7957696E5063744F6E5072
              696E740B50726F6772616D54797065070B747450726F63656475726506536F75
              72636506DE70726F63656475726520546F74616C4A6B7957696E5063744F6E50
              72696E743B0D0A626567696E0D0A0D0A202020696620706C456E74726965735B
              27546F74616C4A6B7957696E50637452616E6B275D203D2031207468656E2062
              6567696E0D0A202020202020546F74616C4A6B7957696E5063742E466F6E742E
              426F6C64203A3D20547275653B0D0A202020656E6420656C736520626567696E
              0D0A202020202020546F74616C4A6B7957696E5063742E466F6E742E426F6C64
              203A3D2046616C73653B0D0A20202020656E643B200D0A202020200D0A656E64
              3B0D0A0D436F6D706F6E656E744E616D65060E546F74616C4A6B7957696E5063
              74094576656E744E616D6506074F6E5072696E74074576656E74494402200001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506126C
              626C45726C506F734F6E476574546578740B50726F6772616D54797065070B74
              7450726F63656475726506536F757263650C0C02000070726F63656475726520
              6C626C45726C506F734F6E476574546578742876617220546578743A20537472
              696E67293B0D0A626567696E0D0A0D0A202054657874203A3D2027273B0D0A20
              200D0A20206C626C45726C2E466F6E742E556E6465726C696E65203A3D204661
              6C73653B0D0A2020202020202020090D0A2020696620706C456E74726965735B
              274561726C7950616365506F73275D203C3E2039393939207468656E20626567
              696E0D0A20202020696620706C456E74726965735B274561726C795061636550
              6F73275D203C3E2030207468656E20626567696E0D0A092020696620706C456E
              74726965735B274561726C7950616365506F7352616E6B275D203D2031207468
              656E20626567696E0D0A0909202054657874203A3D20272A273B0D0A09092020
              696620706C456E74726965735B2751535031737443616C6C52616E6B275D203D
              2031207468656E20626567696E0D0A202020202020202020202009096C626C45
              726C506F732E466F6E742E556E6465726C696E65203A3D20547275653B0D0A09
              092020656E6420656C736520626567696E0D0A20202020202020202020200909
              6C626C45726C506F732E466F6E742E556E6465726C696E65203A3D2046616C73
              653B0D0A202020202020202009656E643B0D0A2020202020202020656E643B0D
              0A202020202020656E643B0D0A2020656E643B0D0A2020200D0A0D0A656E643B
              0D0A0D436F6D706F6E656E744E616D6506096C626C45726C506F73094576656E
              744E616D6506094F6E47657454657874074576656E74494402350001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D6506126C626C4D69
              64506F734F6E476574546578740B50726F6772616D54797065070B747450726F
              63656475726506536F757263650C1F02000070726F636564757265206C626C4D
              6964506F734F6E476574546578742876617220546578743A20537472696E6729
              3B0D0A626567696E0D0A0D0A202054657874203A3D202720273B0D0A20206C62
              6C4D6964506F732E466F6E742E556E6465726C696E65203A3D2046616C73653B
              0D0A2020202020202020090D0A2020696620706C456E74726965735B274D6964
              646C6550616365506F73275D203C3E2039393939207468656E20626567696E0D
              0A2020202020696620706C456E74726965735B274D6964646C6550616365506F
              73275D203C3E2030207468656E20626567696E0D0A2020202020202020696620
              706C456E74726965735B274D6964646C6550616365506F7352616E6B275D203D
              2031207468656E20626567696E0D0A202020202020202020202054657874203A
              3D20272A273B0D0A092020202020696620706C456E74726965735B2751535032
              6E6443616C6C52616E6B275D203D2031207468656E20626567696E0D0A202020
              202020202020202009096C626C4D6964506F732E466F6E742E556E6465726C69
              6E65203A3D20547275653B0D0A0909656E6420656C736520626567696E0D0A20
              2020202020202020202009096C626C4D6964506F732E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A202020202020202009656E643B0D0A20
              20202020202020656E643B0D0A2020202020656E643B0D0A2020656E643B2020
              20202020200D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
              096C626C4D6964506F73094576656E744E616D6506094F6E4765745465787407
              4576656E74494402350001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D650618546F74616C54726E32796F57696E5063744F6E507269
              6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
              636506DC70726F63656475726520546F74616C54726E32796F57696E5063744F
              6E5072696E743B0D0A626567696E0D0A202020696620706C456E74726965735B
              27416765275D203D2032207468656E20626567696E0D0A20202009546F74616C
              54726E32596F57696E5063742E56697369626C65203A3D20547275653B0D0A20
              2020656E6420656C736520626567696E0D0A202020202020546F74616C54726E
              32596F57696E5063742E56697369626C65203A3D2046616C73653B0D0A202020
              656E643B0D0A2020200D0A2020200D0A2020202020200D0A0D0A656E643B0D0A
              0D436F6D706F6E656E744E616D650611546F74616C54726E32796F57696E5063
              74094576656E744E616D6506074F6E5072696E74074576656E74494402200001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E54
              7261696E65724F6E5072696E740B50726F6772616D54797065070B747450726F
              63656475726506536F757263650CB301000070726F6365647572652054726169
              6E65724F6E5072696E743B0D0A626567696E0D0A202020202020202020200D0A
              202020547261696E65722E466F6E742E426F6C64203A3D2046616C73653B0D0A
              202020547261696E65722E466F6E742E556E6465726C696E65203A3D2046616C
              73653B0D0A2020200D0A2020206966202828706C456E74726965735B2754726E
              57696E7352616E6B275D203E3D20312920616E642028706C456E74726965735B
              2754726E57696E7352616E6B275D203C3D2035302929206F720D0A2020202020
              202828706C456E74726965735B2754726E4561726E696E677352616E6B275D20
              3E3D20312920616E642028706C456E74726965735B2754726E4561726E696E67
              7352616E6B275D203C3D20353029206F720D0A20202020202028706C456E7472
              6965735B27547261696E6572526174696E6752616E6B275D203D203129292074
              68656E20626567696E0D0A202020202020547261696E65722E466F6E742E426F
              6C64203A3D20547275653B0D0A202020202020547261696E65722E466F6E742E
              556E6465726C696E65203A3D20547275653B0D0A202020656E643B0D0A0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D650607547261696E657209457665
              6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
              4576656E7448616E646C65720B50726F6772616D4E616D65060D4A6F636B6579
              4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
              06536F757263650C8101000070726F636564757265204A6F636B65794F6E5072
              696E743B0D0A626567696E0D0A2020204A6F636B65792E466F6E742E426F6C64
              203A3D2046616C73653B0D0A2020204A6F636B65792E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A2020202020202020200D0A2020206966
              20706C456E74726965735B27497353757065724A6F636B6579275D207468656E
              20626567696E0D0A2020202020204A6F636B65792E466F6E742E426F6C64203A
              3D20547275653B0D0A2020202020204A6F636B65792E466F6E742E556E646572
              6C696E65203A3D20547275653B0D0A202020656E643B0D0A0D0A202020696620
              28706C456E74726965735B274A6F636B6579526174696E6752616E6B275D203D
              203129207468656E20626567696E0D0A2020202020204A6F636B65792E466F6E
              742E426F6C64203A3D20547275653B0D0A2020202020204A6F636B65792E466F
              6E742E556E6465726C696E65203A3D20547275653B0D0A202020656E643B0D0A
              2020200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506064A6F63
              6B6579094576656E744E616D6506074F6E5072696E74074576656E7449440220
              0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
              164D6F726E696E674C696E65446573634F6E5072696E740B50726F6772616D54
              797065070B747450726F63656475726506536F7572636506C970726F63656475
              7265204D6F726E696E674C696E65446573634F6E5072696E743B0D0A62656769
              6E0D0A0D0A2020204D6F726E696E674C696E65446573632E466F6E742E426F6C
              64203A3D2046616C73653B0D0A20202069662020706C456E74726965735B274D
              6F726E696E674C696E65546F3152616E6B275D203D2031207468656E20626567
              696E0D0A2020202020204D6F726E696E674C696E65446573632E466F6E742E42
              6F6C64203A3D20547275653B0D0A202020656E643B0D0A2020200D0A656E643B
              0D0A0D436F6D706F6E656E744E616D65060F4D6F726E696E674C696E65446573
              63094576656E744E616D6506074F6E5072696E74074576656E74494402200001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506104F
              776E65724E616D654F6E5072696E740B50726F6772616D54797065070B747450
              726F63656475726506536F757263650C1001000070726F636564757265204F77
              6E65724E616D654F6E5072696E743B0D0A626567696E0D0A2020202020202020
              20200D0A2020204F776E65724E616D652E466F6E742E426F6C64203A3D204661
              6C73653B0D0A2020204F776E65724E616D652E466F6E742E556E6465726C696E
              65203A3D2046616C73653B0D0A2020202020202020200D0A202020696620706C
              456E74726965735B27497353757065724F776E6572275D207468656E20626567
              696E0D0A2020202020204F776E65724E616D652E466F6E742E426F6C64203A3D
              20547275653B0D0A2020202020204F776E65724E616D652E466F6E742E556E64
              65726C696E65203A3D20547275653B0D0A202020656E643B0D0A0D0A0D0A656E
              643B0D0A0D436F6D706F6E656E744E616D6506094F776E65724E616D65094576
              656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D6506145475726649
              6E64696361746F724F6E5072696E740B50726F6772616D54797065070B747450
              726F63656475726506536F7572636506C570726F636564757265205475726649
              6E64696361746F724F6E5072696E743B0D0A626567696E0D0A2020696620706C
              52616365735265706F72745B2753757266616365275D203D2027542720746865
              6E20626567696E0D0A2020200954757266496E64696361746F722E5669736962
              6C65203A3D20547275653B0D0A202020656E6420656C736520626567696E0D0A
              2020200954757266496E64696361746F722E56697369626C65203A3D2046616C
              73653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
              4E616D65060D54757266496E64696361746F72094576656E744E616D6506074F
              6E5072696E74074576656E74494402200001060F5472614576656E7448616E64
              6C65720B50726F6772616D4E616D6506154465627574496E64696361746F724F
              6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
              536F7572636506E470726F636564757265204465627574496E64696361746F72
              4F6E5072696E743B0D0A626567696E0D0A0D0A2020204465627574496E646963
              61746F722E56697369626C65203A3D2046616C73653B0D0A2020206966202870
              6C52616365735265706F72745B275261636554797065275D203D20274D535727
              29206F722028706C52616365735265706F72745B275261636554797065275D20
              3D20274D434C272920207468656E20626567696E0D0A09202020446562757449
              6E64696361746F722E56697369626C65203A3D20547275653B0D0A202020656E
              643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E44656275
              74496E64696361746F72094576656E744E616D6506074F6E5072696E74074576
              656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
              616D4E616D650615526F757465496E64696361746F724F6E5072696E740B5072
              6F6772616D54797065070B747450726F63656475726506536F757263650C2601
              000070726F63656475726520526F757465496E64696361746F724F6E5072696E
              743B0D0A626567696E0D0A202020202020202020202020202020202020202020
              20200D0A202020526F757465496E64696361746F722E56697369626C65203A3D
              2046616C73653B0D0A2020200D0A20202069662028706C52616365735265706F
              72745B27526F757465496E64696361746F72275D203C3E202727292020746865
              6E20626567696E0D0A20202020202069662028706C52616365735265706F7274
              5B274973526F75746552616365275D203D20547275652920207468656E206265
              67696E0D0A09202020526F757465496E64696361746F722E56697369626C6520
              3A3D20547275653B0D0A202020202020656E643B200D0A202020656E643B0D0A
              0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E526F757465496E64
              696361746F72094576656E744E616D6506074F6E5072696E74074576656E7449
              4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
              6D65060F446179734C6173744F6E5072696E740B50726F6772616D5479706507
              0B747450726F63656475726506536F757263650CA801000070726F6365647572
              6520446179734C6173744F6E5072696E743B0D0A626567696E0D0A0D0A094461
              79734C6173742E466F6E742E426F6C64203A3D2046616C73653B0D0A09446179
              734C6173742E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A
              0D0A202020202020696620706C456E74726965735B27446179734C617374275D
              203E203435207468656E20626567696E0D0A202020202020202020446179734C
              6173742E466F6E742E426F6C64203A3D20547275653B0D0A2020202020202020
              20446179734C6173742E466F6E742E556E6465726C696E65203A3D2046616C73
              653B0D0A202020202020656E643B0D0A2020202020202020200D0A2020202020
              20696620706C456E74726965735B27446179734C617374275D203E2039302074
              68656E20626567696E0D0A202020202020202020446179734C6173742E466F6E
              742E426F6C64203A3D20547275653B0D0A202020202020202020446179734C61
              73742E466F6E742E556E6465726C696E65203A3D20547275653B0D0A20202020
              2020656E643B0D0A0D0A2020202020200D0A2020202020200D0A656E643B0D0A
              0D436F6D706F6E656E744E616D650608446179734C617374094576656E744E61
              6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
              7448616E646C65720B50726F6772616D4E616D65060C506F7765724F6E507269
              6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
              63650C0601000070726F63656475726520506F7765724F6E5072696E743B0D0A
              626567696E0D0A0D0A20202020696620706C456E74726965735B27506F776572
              52616E6B275D203D2031207468656E20626567696E0D0A09202020506F776572
              2E466F6E742E426F6C64203A3D20547275653B0D0A202020202020202020506F
              7765722E466F6E742E556E6465726C696E65203A3D20547275653B0D0A202020
              20656E6420656C736520626567696E0D0A09202020506F7765722E466F6E742E
              426F6C64203A3D2046616C73653B0D0A202020202020202020506F7765722E46
              6F6E742E556E6465726C696E65203A3D2046616C73653B0D0A202020656E643B
              200D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650605506F77
              6572094576656E744E616D6506074F6E5072696E74074576656E744944022000
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
              6C626C545552464F6E476574546578740B50726F6772616D54797065070B7474
              50726F63656475726506536F757263650C4E01000070726F636564757265206C
              626C545552464F6E476574546578742876617220546578743A20537472696E67
              293B0D0A626567696E0D0A0D0A09696620706C52616365735265706F72745B27
              53757266616365275D203D20275427207468656E20626567696E0D0A20200909
              54657874203A3D202754757266273B0D0A202020202020656E643B0D0A096966
              20706C52616365735265706F72745B2753757266616365275D203D2027412720
              7468656E20626567696E0D0A2020090954657874203A3D2027416C6C20576561
              74686572273B0D0A202020202020656E643B0D0A202020202020696620706C52
              616365735265706F72745B2753757266616365275D203D20274427207468656E
              20626567696E0D0A2020090954657874203A3D202744495254273B0D0A202020
              202020656E643B0D0A2020202020200D0A0D0A2020202020200D0A0D0A656E64
              3B0D0A0D436F6D706F6E656E744E616D6506076C626C54555246094576656E74
              4E616D6506094F6E47657454657874074576656E74494402350001060F547261
              4576656E7448616E646C65720B50726F6772616D4E616D650618546F74616C54
              726E4F776E57696E5063744F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F757263650C3901000070726F636564757265
              20546F74616C54726E4F776E57696E5063744F6E5072696E743B0D0A62656769
              6E0D0A0D0A202020202020546F74616C54726E4F776E57696E5063742E466F6E
              742E426F6C64203A3D2046616C73653B0D0A202020202020546F74616C54726E
              4F776E57696E5063742E466F6E742E556E6465726C696E65203A3D2046616C73
              653B0D0A2020202020200D0A202020696620706C456E74726965735B27546F74
              616C54726E4F776E57696E506374275D203E203234207468656E20626567696E
              0D0A202020202020546F74616C54726E4F776E57696E5063742E466F6E742E42
              6F6C64203A3D20547275653B0D0A202020202020546F74616C54726E4F776E57
              696E5063742E466F6E742E556E6465726C696E65203A3D20547275653B0D0A20
              2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650611
              546F74616C54726E4F776E57696E506374094576656E744E616D6506074F6E50
              72696E74074576656E74494402200001060F5472614576656E7448616E646C65
              720B50726F6772616D4E616D65061B51535031737443616C6C52756E5374796C
              654F6E476574546578740B50726F6772616D54797065070B747450726F636564
              75726506536F7572636506A270726F6365647572652051535031737443616C6C
              52756E5374796C654F6E476574546578742876617220546578743A2053747269
              6E67293B0D0A626567696E0D0A2054657874203A3D20706C456E74726965735B
              2751535031737443616C6C52756E5374796C65275D202B20272D27202B202049
              6E74546F53747228706C456E74726965735B2751535031737443616C6C275D29
              3B0D0A200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506125153
              5031737443616C6C52756E5374796C65094576656E744E616D6506094F6E4765
              7454657874074576656E74494402350001060F5472614576656E7448616E646C
              65720B50726F6772616D4E616D65061951535031737443616C6C52756E537479
              6C654F6E5072696E740B50726F6772616D54797065070B747450726F63656475
              726506536F7572636506D770726F6365647572652051535031737443616C6C52
              756E5374796C654F6E5072696E743B0D0A626567696E0D0A0D0A202020696620
              706C456E74726965735B274C696665537461727473275D203E2030207468656E
              20626567696E0D0A2020200951535031737443616C6C52756E5374796C652E56
              697369626C65203A3D20547275653B0D0A202020656E6420656C736520626567
              696E0D0A2020200951535031737443616C6C52756E5374796C652E5669736962
              6C65203A3D2046616C73653B0D0A202020656E643B0D0A2020200D0A656E643B
              0D0A0D436F6D706F6E656E744E616D65061251535031737443616C6C52756E53
              74796C65094576656E744E616D6506074F6E5072696E74074576656E74494402
              200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
              0612436C617373526174696E674F6E5072696E740B50726F6772616D54797065
              070B747450726F63656475726506536F757263650C1501000070726F63656475
              726520436C617373526174696E674F6E5072696E743B0D0A626567696E0D0A20
              2020436C617373526174696E672E466F6E742E426F6C64203A3D2046616C7365
              3B0D0A202020436C617373526174696E672E466F6E742E556E6465726C696E65
              203A3D2046616C73653B0D0A2020202020202020200D0A20202069662028706C
              456E74726965735B27436C617373526174696E6752616E6B275D203D20312920
              7468656E20626567696E0D0A202020202020436C617373526174696E672E466F
              6E742E426F6C64203A3D20547275653B0D0A202020202020436C617373526174
              696E672E466F6E742E556E6465726C696E65203A3D20547275653B0D0A202020
              656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B436C
              617373526174696E67094576656E744E616D6506074F6E5072696E7407457665
              6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
              6D4E616D65061544697374616E6365526174696E674F6E5072696E740B50726F
              6772616D54797065070B747450726F63656475726506536F757263650C2B0100
              0070726F6365647572652044697374616E6365526174696E674F6E5072696E74
              3B0D0A626567696E0D0A20202044697374616E6365526174696E672E466F6E74
              2E426F6C64203A3D2046616C73653B0D0A20202044697374616E636552617469
              6E672E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A202020
              20202020202020200D0A20202069662028706C456E74726965735B2744697374
              616E6365526174696E6752616E6B275D203D203129207468656E20626567696E
              0D0A20202020202044697374616E6365526174696E672E466F6E742E426F6C64
              203A3D20547275653B0D0A20202020202044697374616E6365526174696E672E
              466F6E742E556E6465726C696E65203A3D20547275653B0D0A202020656E643B
              0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E44697374
              616E6365526174696E67094576656E744E616D6506074F6E5072696E74074576
              656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
              616D4E616D65061154757266526174696E674F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F757263650CA30100007072
              6F6365647572652054757266526174696E674F6E5072696E743B0D0A62656769
              6E0D0A20202054757266526174696E672E466F6E742E426F6C64203A3D204661
              6C73653B0D0A20202054757266526174696E672E466F6E742E556E6465726C69
              6E65203A3D2046616C73653B0D0A2020202020202020200D0A20202069662028
              706C456E74726965735B2754757266526174696E6752616E6B275D203D203129
              207468656E20626567696E0D0A20202020202054757266526174696E672E466F
              6E742E426F6C64203A3D20547275653B0D0A20202054757266526174696E672E
              466F6E742E556E6465726C696E65203A3D20547275653B0D0A202020656E643B
              0D0A0D0A202020696620706C52616365735265706F72745B2753757266616365
              275D203D20275427207468656E20626567696E0D0A2020200954757266526174
              696E672E56697369626C65203A3D20547275653B0D0A202020656E6420656C73
              6520626567696E0D0A2020200954757266526174696E672E56697369626C6520
              3A3D2046616C73653B0D0A202020656E643B0D0A2020200D0A0D0A656E643B0D
              0A0D436F6D706F6E656E744E616D65060A54757266526174696E67094576656E
              744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
              76656E7448616E646C65720B50726F6772616D4E616D6506104D756452617469
              6E674F6E5072696E740B50726F6772616D54797065070B747450726F63656475
              726506536F757263650C0F01000070726F636564757265204D7564526174696E
              674F6E5072696E743B0D0A626567696E20200D0A2020204D7564526174696E67
              2E466F6E742E426F6C64203A3D2046616C73653B0D0A2020204D756452617469
              6E672E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A202020
              2020202020200D0A20202069662028706C456E74726965735B274D7564526174
              696E6752616E6B275D203D203129207468656E20626567696E0D0A2020202020
              204D7564526174696E672E466F6E742E426F6C64203A3D20547275653B0D0A20
              20202020204D7564526174696E672E466F6E742E556E6465726C696E65203A3D
              20547275653B0D0A202020656E643B0D0A0D0A0D0A0D0A656E643B0D0A0D436F
              6D706F6E656E744E616D6506094D7564526174696E67094576656E744E616D65
              06074F6E5072696E74074576656E74494402200000}
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TrkCode'
      DataPipeline = plRacesReport
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plRacesReport'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbHospitalReport2'
    EngineVersion = '4.24 Build 1'
    ReadOnly = True
    TableName = 'Race.DAT'
    Left = 392
    Top = 168
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 24
    Top = 152
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 376
    Top = 112
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 512
    Top = 129
  end
  object tblEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filtered = True
    DatabaseName = 'dbHospitalReport2'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'TrkCode'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RaceDate'
        Attributes = [faRequired]
        DataType = ftDate
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RangeRaceDate'
        DataType = ftDate
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RaceNbr'
        Attributes = [faRequired]
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPos'
        Attributes = [faRequired]
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RaceType'
        DataType = ftString
        Size = 4
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Surface'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EstTimeOfRace'
        DataType = ftTime
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DistanceInFurlongs'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Entry'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ProgramNbr'
        DataType = ftString
        Size = 10
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ProgramNbrSort'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MorningLineDesc'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'HorseName'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Med'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Equip'
        DataType = ftString
        Size = 6
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFirstTimeJuice'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBlinkersOn'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBlinkersOff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DebutIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RouteIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsScratched'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Age'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Sex'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 10
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Weight'
        DataType = ftString
        Size = 10
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsSuperTrainer'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Trainer'
        DataType = ftString
        Size = 30
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnWinsRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnEarningsRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnTrackRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsSuperJockey'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Jockey'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JkyWinsRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JkyEarningsRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JkyTrackRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsSuperOwner'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Owner'
        DataType = ftString
        Size = 45
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OwnWinsRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OwnEarningsRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Breeder'
        DataType = ftString
        Size = 67
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnJkyStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnJkyWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnJkyWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnJkyWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOwnStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOwnWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOwnWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOwnWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn1To45Starts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn1To45Wins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn1To45WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork1To45Starts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork1To45Wins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork1To45WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn46To120Starts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn46To120Wins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn46To120WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork46To120Starts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork46To120Wins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork46To120WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn120PlusStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn120PlusWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn120PlusWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork120PlusStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork120PlusWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnWork120PlusWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnDebutStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnDebutWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnDebutWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnDebutTwoStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnDebutTwoWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnDebutTwoWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnFirstJuiceStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnFirstJuiceWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnFirstJuiceWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnBlinkersOnStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnBlinkersOnWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnBlinkersOnWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnBlinkersOffStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnBlinkersOffWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnBlinkersOffWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnTurfStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnTurfWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnTurfWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnTurfWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn30Starts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn30Wins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn30WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn30WinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnAftClmStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnAftClmWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnAftClmWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOddsStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOddsWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOddsWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrnOddsWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn1stStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn1stWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn1stWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn2yoStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn2yoWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn2yoWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalTrn2oWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnTodayStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnTodayWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnTodayWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnTodayWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnDirtToTurfStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnDirtToTurfWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnTurfToDirtStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnTurfToDirtWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnRteToSprStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnRteToSprWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnSprToRteStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnSprToRteWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnStkWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnClmWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnMdnWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnAlwWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyDaysStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyDaysWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyDaysWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyDaysWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyOddsStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyOddsWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyOddsWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyOddsWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyTurfStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyTurfWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJkyTurfWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky10Starts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky10Wins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky10WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky10WinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky30Starts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky30Wins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky30WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky30WinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky2yoStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky2yoWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalJky2yoWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalOwnStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalOwnWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalOwnWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalOwnWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalOwnTop3WinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalBrdStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalBrdWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalBrdWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TotalBrdWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'BredIn'
        DataType = ftString
        Size = 6
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Sire'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfLastYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfLastYearStarts'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfLastYearPctOfEarnings'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireGeneralLastYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireGeneralLastYearStudFee'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireJuvenileLastYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireJuvenileThisYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfThisYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfThisYearStarts'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfThisYearPctOfEarnings'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireGeneralThisYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireGeneralThisYearStudFee'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireAEI'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireAWThisYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireAWLastYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Dam'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSire'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfLastYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfLastYearStarts'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfLastYearPctOfEarnings'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireGeneralLastYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireGeneralLastYearStudFee'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireJuvenileLastYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireJuvenileThisYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfThisYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfThisYearStarts'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfThisYearPctOfEarnings'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireGeneralThisYearRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireGeneralThisYearStudFee'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireAEI'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireAWThisYearRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireAWLastYearRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DaysLast'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DaysLastWork'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastTrkCode'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastRaceNbr'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastRaceDate'
        DataType = ftDate
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastPostPos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastRaceType'
        DataType = ftString
        Size = 6
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastSurf'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastRaceConditions'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastDistanceDesc'
        DataType = ftString
        Size = 16
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastDistance'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastOdds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastFavoriteIndicator'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastDQIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastJockey'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastComment'
        DataType = ftString
        Size = 100
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastComment2'
        DataType = ftString
        Size = 200
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastTrkCond'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastClmPrice'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastClaimed'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastPurse'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastDay'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastMonthDesc'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYear'
        DataType = ftString
        Size = 4
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastGateBreak'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastLen1Back'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastLen2Back'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastStLenBack'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastFinishBeaten'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastEquip'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastWeight'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastHorseTime'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastRaceDesc'
        DataType = ftString
        Size = 150
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MorningLineTo1'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MorningLineTo1Rank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsDirtToTurf'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTurfToDirt'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsSprToRte'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsRteToSpr'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastSpeed'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastSpeedRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Power'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PowerRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'BackSpeed'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'BackSpeedRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgClass'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgClassRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgSpeed'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgSpeedRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgClassRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgClassRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'BackClass'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'BackClassRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CurrClass'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CurrClassRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPace'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPaceRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPacePos'
        DataType = ftFloat
        DefaultValue = '9999'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPacePosRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePace'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePaceRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePacePos'
        DataType = ftFloat
        DefaultValue = '9999'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePacePosRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LatePace'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LatePaceRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LatePacePos'
        DataType = ftFloat
        DefaultValue = '9999'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LatePacePosRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinishPacePos'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinishPacePosRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPaceAdvantage'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePaceAdvantage'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LatePaceAdvantage'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsClaimed1Back'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsClaimed2Back'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsLayoffAndUp'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsClaimedAndUp'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsClaimedAndDown'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFirstTimeClaiming'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBelowClaimedPrice'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LifeStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LifeWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LifePlcs'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LifeShos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LifeEarnings'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LifeEPS'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfPlcs'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfShos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfEarnings'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfEPS'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudPlcs'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudShos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudEarnings'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudEPS'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrkStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrkWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrkPlcs'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrkShos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrkEarnings'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrkEPS'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RouteStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RouteWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RoutePlcs'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RouteShos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SprintStarts'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SprintWins'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SprintPlcs'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SprintShos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AngleDesc'
        DataType = ftString
        Size = 200
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsWagerSheetSelected'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsYouBetTrack'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsPrintedOnValueSheet'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'HorseNbr'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WorkLine1'
        DataType = ftString
        Size = 250
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WorkLine2'
        DataType = ftString
        Size = 250
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFrontDoubleLiner'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBackDoubleLiner'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTripleLiner'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFrontDoubleDot'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBackDoubleDot'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTripleDot'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFrontDoubleLiner0'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBackDoubleLiner0'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTripleLiner0'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFrontDoubleLiner1'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBackDoubleLiner1'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTripleLiner1'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFrontDoubleLiner2'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBackDoubleLiner2'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTripleLiner2'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsFrontDoubleLiner3'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsBackDoubleLiner3'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTripleLiner3'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerOrderKey'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerStarts'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerWins'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerAvgOdds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerMinOdds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerMaxOdds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerAvgWinOdds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerMinWinOdds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerMaxWinOdds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerValueBet'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2TrkCode'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2RaceNbr'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2RaceDate'
        DataType = ftDate
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2PostPos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2RaceType'
        DataType = ftString
        Size = 6
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Surf'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2RaceConditions'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2DistanceDesc'
        DataType = ftString
        Size = 16
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Distance'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Odds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2FavoriteIndicator'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2DQIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Jockey'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Comment'
        DataType = ftString
        Size = 100
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Comment2'
        DataType = ftString
        Size = 200
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2TrkCond'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2ClmPrice'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Claimed'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Purse'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Day'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2MonthDesc'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Year'
        DataType = ftString
        Size = 4
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2GateBreak'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Len1Back'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Len2Back'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2StLenBack'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2FinishBeaten'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Equip'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Weight'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Speed'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2HorseTime'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2RaceDesc'
        DataType = ftString
        Size = 150
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3TrkCode'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3RaceNbr'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3RaceDate'
        DataType = ftDate
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3PostPos'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3RaceType'
        DataType = ftString
        Size = 6
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Surf'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3RaceConditions'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3DistanceDesc'
        DataType = ftString
        Size = 16
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Distance'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Odds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3FavoriteIndicator'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3DQIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Jockey'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Comment'
        DataType = ftString
        Size = 100
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Comment2'
        DataType = ftString
        Size = 200
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3TrkCond'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3ClmPrice'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Claimed'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Purse'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Day'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3MonthDesc'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Year'
        DataType = ftString
        Size = 4
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3GateBreak'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Len1Back'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Len2Back'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3StLenBack'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3FinishBeaten'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Equip'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Weight'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Speed'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3HorseTime'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3RaceDesc'
        DataType = ftString
        Size = 150
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Odds'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinishPos'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'QSP1stCall'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'QSP1stCallRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'QSP1stCallRunStyle'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'QSP2ndCall'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'QSP2ndCallRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'QSP2ndCallRunStyle'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'KSP1stCall'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'KSP1stCallRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'KSP2ndCall'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'KSP2ndCallRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastPos1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastPos2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastPosStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Pos1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Pos2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2PosStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Pos1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Pos2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3PosStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastTime1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastTime2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastTimeStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastTimeFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Time1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2Time2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2TimeStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2TimeFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Time1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3Time2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3TimeStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3TimeFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastBL1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastBL2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastBLStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastBLFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2BL1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2BL2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2BLStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2BLFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3BL1stCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3BL2ndCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3BLStrCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3BLFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastPosFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last2PosFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last3PosFinCall'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is1stClaiming'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is1stMCL'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is1stAfterLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is2ndAfterLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is3rdAfterLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsDirtToTurfToDirtAfterLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTurfToDirtToTurfAfterLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsRouteToSprintToRouteAfterLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsSprintToRouteToSprintAfterLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is2yoBred'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is1stBred'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTurfBred'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is1stOffLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is2ndOffLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Is3rdOffLayoff'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'StandingIn'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'StandingInRank'
        DataType = ftSmallint
        DefaultValue = '9999'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsOnStandingInList'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ValueROI'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ValueROICnt'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ValueDesc'
        DataType = ftString
        Size = 255
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DollarCnt'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ListType'
        DataType = ftString
        Size = 1
        DefaultValue = 'R'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PowerAdvantage'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PowerAdvantageKey'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosWinPct'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosStarts'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosWinPctRank'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceIndicatorWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceIndicatorWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ElimWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Elim2WinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysWagerOddsDesc'
        DataType = ftString
        Size = 10
        DefaultValue = '99/1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PowerAdvantageWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPaceAdvantageWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPaceAdvantageWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EarlyPaceAdvantageValueBet'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePaceAdvantageWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePaceAdvantageWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MiddlePaceAdvantageValueBet'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LatePaceAdvantageWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LatePaceAdvantageWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsHeavyChalk'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MorningLineWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsEliminated'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsValueDebutSelected'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsValueDebutTwoSelected'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsValueWagerSelected'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsPTCTrack'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTwinSpiresTrack'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysAltWagerWinPct'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TodaysAltWagerWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SelectorChoice'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsSpeedSheetSelected'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ClassRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ClassRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DistanceRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DistanceRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AWRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AWRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireClassRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireClassRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireClassRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireClassRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireTurfRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireTurfRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireMudRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireMudRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireMudRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireMudRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireSprintRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireSprintRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireSprintRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireSprintRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireRouteRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireRouteRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireRouteRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireRouteRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireAWRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireAWRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireAWRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DamSireAWRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerOwnerRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerOwnerRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerJockeyRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerJockeyRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerTrackRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrainerTrackRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JockeyRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JockeyRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JockeyOwnerRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JockeyOwnerRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JockeyTrackRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JockeyTrackRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OwnerRating'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OwnerRatingRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TurfOrder'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MaidenOrder'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MudOrder'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AWOrder'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DistanceOrder'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalOrderWinPct'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalOrderWinPctRank'
        DataType = ftSmallint
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalOrderKey'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTrainerSheetSelected'
        DataType = ftBoolean
        DefaultValue = 'False'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TCPlusMinus'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TJMeetWinPct'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TJMeetStarts'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TJ365WinPct'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TJ365Starts'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PacificTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalWinPct'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalOrderValueBet'
        DataType = ftFloat
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'tblEntriesDBISA1'
        Fields = 'TrkCode;RaceDate;RaceNbr;PostPos'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end
      item
        Name = 'ByHorseName'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;HorseName'
        Options = [ixCaseInsensitive]
        Compression = icNone
      end
      item
        Name = 'ByRangeRaceDate'
        Fields = 'RangeRaceDate;RaceDate;TrkCode;RaceDate;RaceNbr;PostPos'
        Compression = icNone
      end
      item
        Name = 'ByHorseNbr'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;HorseNbr'
        Compression = icNone
      end
      item
        Name = 'ByEstTimeOfRace'
        Fields = 'RangeRaceDate;EstTimeOfRace'
        Compression = icNone
      end
      item
        Name = 'ByProgSortOrder'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;ProgramNbrSort'
        Compression = icNone
      end
      item
        Name = 'ByTodaysWagerWinPctRank'
        DescFields = 
          'TodaysWagerWinPct;TotalTrnDebutWinPct;TotalTrnDebutTwoWinPct;Pow' +
          'er'
        Fields = 
          'RangeRaceDate;TrkCode;RaceDate;RaceNbr;TodaysWagerWinPct;TotalTr' +
          'nDebutWinPct;TotalTrnDebutTwoWinPct;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByLastSpeedRank'
        DescFields = 'LastSpeed;Power'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;LastSpeed;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByBackSpeedRank'
        DescFields = 'BackSpeed;Power'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;BackSpeed;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByPowerRank'
        DescFields = 'Power'
        Fields = 
          'RangeRaceDate;TrkCode;RaceDate;RaceNbr;Power;TrnTrackRank;JkyTra' +
          'ckRank;TrnWinsRank;JkyWinsRank;OwnWinsRank'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByTotalTrnOddsWinPctRank'
        DescFields = 'TotalTrnOddsWinPct'
        Fields = 'TrkCode;RaceDate;RaceNbr;TotalTrnOddsWinPct'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByTotalJkyOddsWinPctRank'
        DescFields = 'TotalJkyOddsWinPct'
        Fields = 'TrkCode;RaceDate;RaceNbr;TotalJkyOddsWinPct'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByMorningLineTo1Rank'
        Fields = 'TrkCode;RaceDate;RaceNbr;MorningLineTo1;Power'
        Compression = icNone
      end
      item
        Name = 'ByTrnTodayWinPctRank'
        DescFields = 'TrnTodayWinPct;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;TrnTodayWinPct;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByQSP1stCallRank'
        DescFields = 'QSP1stCall;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;QSP1stCall;KSP1stCall;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByQSP2ndCallRank'
        DescFields = 'QSP2ndCall;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;QSP2ndCall;KSP2ndCall;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByKSP1stCallRank'
        DescFields = 'QSP1stCall;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;KSP1stCall;QSP1stCall;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByKSP2ndCallRank'
        DescFields = 'QSP2ndCall;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;KSP2ndCall;QSP2ndCall;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByEarlyPaceRank'
        DescFields = 'EarlyPace;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;EarlyPace;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByMiddlePaceRank'
        DescFields = 'MiddlePace;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;MiddlePace;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByLatePaceRank'
        DescFields = 'LatePace;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;LatePace;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByEarlyPacePosRank'
        DescFields = 'Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;EarlyPacePos;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByMiddlePacePosRank'
        DescFields = 'Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;MiddlePacePos;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByLatePacePosRank'
        DescFields = 'Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;LatePacePos;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByTotalTrnJkyWinPctRank'
        DescFields = 'TotalTrnJkyWinPct;TotalTrnJkyWinPct;Power'
        Fields = 
          'TrkCode;RaceDate;RaceNbr;TotalTrnJkyWinPct;TotalTrnJkyWinPct;Pow' +
          'er'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByTotalTrn30WinPctRank'
        DescFields = 'TotalTrn30WinPct;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;TotalTrn30WinPct;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByTotalJky30WinPctRank'
        DescFields = 'TotalJky30WinPct;Power'
        Fields = 'TrkCode;RaceDate;RaceNbr;TotalJky30WinPct;Power'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByHorseNameRaceNbr'
        Fields = 'HorseName;RaceNbr'
        Compression = icNone
      end
      item
        Name = 'ByFinalOrderWinPctRank'
        DescFields = 'FinalOrderWinPct;Power'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;FinalOrderWinPct;Power'
        Options = [ixDescending]
        Compression = icNone
      end>
    IndexName = 'ByTodaysWagerWinPctRank'
    MasterFields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    ReadOnly = True
    TableName = 'ENTRY.DAT'
    StoreDefs = True
    Left = 112
    Top = 106
  end
end
